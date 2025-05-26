_ != mkdir -p .make

##@ Tools

GO      ?= go
BUF     ?= $(GO) tool buf
DEVCTL  ?= $(GO) tool devctl
DOCKER  ?= docker
DPRINT  ?= ${CURDIR}/bin/dprint
GINKGO  ?= $(GO) tool ginkgo
GOLINT  ?= $(GO) tool golangci-lint
MOCKGEN ?= $(GO) tool mockgen

##@ Primary Targets

build: .make/buf-build bin/ux bin/dummy
generate gen: codegen
test: .make/ginkgo-run
fmt format: .make/buf-fmt .make/go-fmt .make/dprint-fmt
lint: .make/buf-lint .make/go-vet .make/golangci-lint-run
tidy: go.sum buf.lock
docker: .make/docker-ux

##@ Source

PROTO_SRC   != $(BUF) ls-files
GRPC_PROTO  := $(filter %/plugin.proto %/ux.proto,${PROTO_SRC})
GO_SRC      != $(DEVCTL) list --go
GO_PB_SRC   := ${PROTO_SRC:proto/%.proto=gen/%.pb.go}
GO_GRPC_SRC := ${GRPC_PROTO:proto/%.proto=gen/%_grpc.pb.go}
GO_CODEGEN  := ${GO_GRPC_SRC} ${GO_PB_SRC}

##@ Artifacts

bin/ux: ${GO_SRC} ## Build the ux CLI
	$(GO) build -o $@ main.go

bin/dummy: ${GO_SRC} ## Build the dummy testing utility
	$(GO) build -o $@ ./cmd/dummy

codegen: ${GO_CODEGEN} .make/go-generate

${GO_PB_SRC} ${GO_GRPC_SRC} &: buf.gen.yaml ${PROTO_SRC}
	$(BUF) generate $(addprefix --path ,$(filter ${PROTO_SRC},$?))

##@ Locks

buf.lock: buf.yaml ${PROTO_SRC}
	$(BUF) dep update

go.sum: go.mod ${GO_SRC}
	$(GO) mod tidy

##@ Utilities

%_suite_test.go: ## Bootstrap a Ginkgo test suite
	cd $(dir $@) && $(GINKGO) bootstrap
%_test.go: ## Generate a Ginkgo test
	cd $(dir $@) && $(GINKGO) generate $(notdir $@)

.envrc: hack/example.envrc ## Generate a recommended .envrc
	cp $< $@ && chmod a=,u=r $@

export GOBIN := ${CURDIR}/bin

bin/buf: go.mod ## Optional bin install
	$(GO) install github.com/bufbuild/buf/cmd/buf

bin/devctl: go.mod ## Optional bin install
	$(GO) install github.com/unmango/devctl

bin/dprint: .versions/dprint | .make/dprint/install.sh
	DPRINT_INSTALL=${CURDIR} .make/dprint/install.sh $(shell $(DEVCTL) v dprint)
	@touch $@

bin/ginkgo: go.mod ## Optional bin install
	$(GO) install github.com/onsi/ginkgo/v2/ginkgo

##@ Sentinels

.make/buf-build: ${PROTO_SRC}
	$(BUF) build $(addprefix --path ,$?)
	@touch $@

.make/buf-fmt: ${PROTO_SRC}
	$(BUF) format --write $(addprefix --path ,$?)
	@touch $@

.make/buf-lint: ${PROTO_SRC}
	$(BUF) lint $(addprefix --path ,$?)
	@touch $@

.make/docker-ux: Dockerfile .dockerignore ${GO_SRC}
	$(DOCKER) build ${CURDIR} -t unstoppablemango/ux:v0.0.1-alpha
	@touch $@

.make/dprint/install.sh:
	@mkdir -p $(dir $@)
	curl -fsSL https://dprint.dev/install.sh -o $@
	@chmod +x $@

.make/dprint-fmt: README.md .dprint.json .github/renovate.json | bin/dprint
	$(DPRINT) fmt --allow-no-files $?
	@touch $@

.make/go-fmt: ${GO_SRC}
	$(GO) fmt $(addprefix ./,$(sort $(dir $?)))
	@touch $@

.make/ginkgo-run: ${GO_SRC}
	$(GINKGO) $(sort $(dir $?))
	@touch $@

.make/go-generate: ${GO_SRC}
	$(GO) generate ./...
	@touch $@

.make/go-vet: ${GO_SRC}
	$(GO) vet $(addprefix ./,$(sort $(dir $?)))
	@touch $@

.make/golangci-lint-run: ${GO_SRC}
	$(GOLINT) run
	@touch $@
