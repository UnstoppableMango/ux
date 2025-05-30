GO     ?= go
DEVCTL ?= $(GO) tool devctl

build: ${GO_SRC}
	$(GO) build ./...

go.sum: go.mod ${GO_SRC}
	$(GO) mod tidy
