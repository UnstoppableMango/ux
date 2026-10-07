CABAL          ?= cabal
PROTOC         ?= protoc
PROTO_LENS     ?= proto-lens-protoc
TDL_PROTO      ?= ../tdl/proto

PROTOS := tdl/ir/v1/ir.proto tdl/plugin/v1/plugin.proto google/protobuf/go_features.proto

build:
	nix build .#

test:
	$(CABAL) test

run:
	$(CABAL) run ux --

update:
	nix flake update

check lint:
	nix flake check

format fmt:
	nix fmt

generate:
	rm -rf gen && mkdir gen
	$(PROTOC) --plugin=protoc-gen-haskell=$$(command -v $(PROTO_LENS)) \
		--haskell_out=gen -I $(TDL_PROTO) $(PROTOS)

.PHONY: build test run update check lint format fmt generate
