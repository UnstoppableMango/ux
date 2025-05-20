_ != mkdir -p .make

##@ Tools

GO     ?= go
BUF    ?= $(GO) tool buf
DEVCTL ?= $(GO) tool devctl
GINKGO ?= $(GO) tool ginkgo
GOLINT ?= $(GO) tool golangci-lint

##@ Primary Targets

build: bin/ux .make/buf-build
generate gen: codegen
test: .make/ginkgo-run
fmt format: .make/buf-fmt .make/go-fmt
lint: .make/buf-lint .make/go-vet .make/golangci-lint-run
tidy: go.sum buf.lock

##@ Source

PROTO_SRC   != $(BUF) ls-files
GO_SRC      != $(DEVCTL) list --go
GO_PB_SRC   := ${PROTO_SRC:proto/%.proto=gen/%.pb.go}
GO_GRPC_SRC := ${PROTO_SRC:proto/%.proto=gen/%_grpc.pb.go}

##@ Artifacts

bin/ux: ${GO_SRC}
	$(GO) build -o $@ main.go

.PHONY: codegen
codegen: ${GO_PB_SRC} ${GO_GRPC_SRC}

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

.envrc: hack/example.envrc
	cp $< $@ && chmod a=,u=r $@

export GOBIN := ${CURDIR}/bin

bin/buf: go.mod ## Optional bin install
	$(GO) install github.com/bufbuild/buf/cmd/buf

bin/devctl: go.mod ## Optional bin install
	$(GO) install github.com/unmango/devctl

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

.make/go-fmt: ${GO_SRC}
	$(GO) fmt $(addprefix ./,$(sort $(dir $?)))
	@touch $@

.make/ginkgo-run: $(filter %_test.go,${GO_SRC})
	$(GINKGO) $(sort $(dir $?))
	@touch $@

.make/go-vet: ${GO_SRC}
	$(GO) vet $(addprefix ./,$(sort $(dir $?)))
	@touch $@

.make/golangci-lint-run: ${GO_SRC}
	$(GOLINT) run
	@touch $@
