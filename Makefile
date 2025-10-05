_ != mkdir -p .make
VERSION ?= v0.0.1-development

##@ Tools

GO         ?= go
BUF        ?= $(GO) tool buf
DEVCTL     ?= $(GO) tool devctl
DOCKER     ?= docker
DOTNET     ?= dotnet
DPRINT     ?= ${CURDIR}/bin/dprint
GINKGO     ?= $(GO) tool ginkgo
GOLINT     ?= $(GO) tool golangci-lint
GORELEASER ?= goreleaser
MOCKGEN    ?= $(GO) tool mockgen

##@ Primary Targets

build: .make/buf-build .make/dotnet-build bin/ux
generate gen: codegen
test: .make/ginkgo-run
fmt format: .make/buf-fmt .make/go-fmt .make/dotnet-format .make/dprint-fmt
lint: .make/buf-lint .make/go-vet .make/golangci-lint-run
tidy: go.sum buf.lock
docker: .make/docker-ux
nuget: .make/dotnet-pack

##@ Source

CS_DOMAIN    := Plugins Plugins.CommandLine
CS_NS        := ${CS_DOMAIN:%=UnMango.Ux.%}

PROTO_SRC   != $(BUF) ls-files
GRPC_PROTO  := $(filter %/plugin.proto %/ux.proto,${PROTO_SRC})
GO_SRC      != $(DEVCTL) list --go
GO_PB_SRC   := ${PROTO_SRC:proto/%.proto=gen/%.pb.go}
# GO_GRPC_SRC := ${GRPC_PROTO:proto/%.proto=gen/%_grpc.pb.go}
GO_CODEGEN  := ${GO_GRPC_SRC} ${GO_PB_SRC}
CS_PROJ_SRC := $(join ${CS_NS:%=src/%},${CS_NS:%=/%.csproj})
CS_SRC      != $(DEVCTL) list --cs

##@ Artifacts

LDFLAGS := -X github.com/unstoppablemango/ux/internal.Version=${VERSION}
bin/ux: ${GO_SRC} ## Build the ux CLI
	$(GO) build -o $@ -ldflags='${LDFLAGS}'

bin/dummy: ${GO_SRC} ## Build the dummy CLI
	$(GO) build -o $@ ./cmd/dummy

codegen: ${GO_CODEGEN} .make/go-generate

${GO_PB_SRC} ${GO_GRPC_SRC} &: buf.gen.yaml ${PROTO_SRC}
	$(BUF) generate $(addprefix --path ,$(filter ${PROTO_SRC},$?))

test/e2e/testdata/petstore.yaml:
	curl -Lo $@ https://raw.githubusercontent.com/readmeio/oas/refs/heads/main/packages/oas-examples/3.1/yaml/petstore.yaml

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
	$(DOCKER) build ${CURDIR} -t unstoppablemango/ux:${VERSION} \
		--build-arg LDFLAGS='${LDFLAGS}'
	@touch $@

.make/dotnet-build: ${CS_SRC} ${CS_PROJ_SRC}
	$(DOTNET) build
	@touch $@

.make/dotnet-format: ${CS_SRC}
	$(DOTNET) format
	@touch $@

.make/dotnet-pack: ${CS_SRC}
	$(DOTNET) pack --output nupkgs
	@touch $@

.make/dprint/install.sh:
	@mkdir -p $(dir $@)
	curl -fsSL https://dprint.dev/install.sh -o $@
	@chmod +x $@

JSON_SRC := global.json .dprint.json .github/renovate.json .vscode/extensions.json
# MD_SRC   := README.md

.make/dprint-fmt: ${JSON_SRC} ${MD_SRC} | bin/dprint
	$(DPRINT) fmt --allow-no-files $?
	@touch $@

.make/go-fmt: ${GO_SRC}
	$(GO) fmt $(addprefix ./,$(sort $(dir $?)))
	@touch $@

.make/ginkgo-run: ${GO_SRC} | test/e2e/testdata/petstore.yaml
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
