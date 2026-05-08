GO_SRC := $(shell find . -type f -name '*.go')

tidy: go.sum gomod2nix.toml

go.sum: ${GO_SRC} go.mod
	go mod tidy
	@touch $@

gomod2nix.toml: ${GO_SRC} go.mod go.sum
	gomod2nix generate
