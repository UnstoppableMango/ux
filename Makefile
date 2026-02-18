_ != mkdir -p .make
VERSION ?= v0.0.1-development

##@ Tools

BUF        ?= buf
GO         ?= go
DEVCTL     ?= $(GO) tool devctl
DOCKER     ?= docker
GINKGO     ?= $(GO) tool ginkgo
GOLINT     ?= $(GO) tool golangci-lint
GORELEASER ?= goreleaser
GOMOD2NIX  ?= $(GO) tool gomod2nix
MOCKGEN    ?= $(GO) tool mockgen
NIX        ?= nix

##@ Primary Targets

build: bin/ux
generate gen: .make/buf-gen .make/go-generate
test: .make/ginkgo-run
fmt format: .make/go-fmt
lint: .make/go-vet .make/golangci-lint-run
tidy: go.sum gomod2nix.toml
docker: bin/image.tar.gz
update: flake.lock

##@ Source

GO_SRC    ?= $(shell find . -path '*.go')
PROTO_SRC ?= $(shell $(BUF) ls-files)
NIX_SRC   := $(wildcard *.nix)

##@ Artifacts

bin/ux: result  ## Build the ux CLI
	mkdir -p $(dir $@) && ln -s ${CURDIR}/$</bin/ux ${CURDIR}/$@
result: ${GO_SRC} ${NIX_SRC}
	$(NIX) build .#ux

bin/image.tar.gz: ${GO_SRC} ${NIX_SRC}
	$(NIX) build --out-link $@ .#ux-image
	$(DOCKER) load < $@

##@ Locks

flake.lock: flake.nix
	$(NIX) flake update
	@touch $@

gomod2nix.toml: go.mod
	$(GOMOD2NIX)

go.sum: go.mod ${GO_SRC}
	$(GO) mod tidy

##@ Utilities

%_suite_test.go: ## Bootstrap a Ginkgo test suite
	cd $(dir $@) && $(GINKGO) bootstrap
%_test.go: ## Generate a Ginkgo test
	cd $(dir $@) && $(GINKGO) generate $(notdir $@)

.envrc: hack/example.envrc ## Generate a recommended .envrc
	cp $< $@ && chmod a=,u=rw $@

##@ Sentinels

.make/buf-gen: ${PROTO_SRC}
	$(BUF) generate
	@touch $@

.make/go-fmt: ${GO_SRC}
	$(GO) fmt $(addprefix ./,$(sort $(dir $?)))
	@touch $@

.make/nix-fmt: ${NIX_SRC}
	$(NIX) fmt
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
