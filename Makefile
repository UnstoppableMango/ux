GO_SRC := $(shell find . -type f -name '*.go')

.PHONY: tidy
tidy: go.sum nix/gomod2nix.toml

.PHONY: generate gen
generate gen:
	buf generate

go.sum: ${GO_SRC} go.mod
	go mod tidy
	@touch $@

nix/gomod2nix.toml: ${GO_SRC} go.mod go.sum
	gomod2nix generate --dir ${CURDIR} --outdir ${CURDIR}/${@D}
