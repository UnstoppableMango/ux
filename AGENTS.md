# AGENTS.md

Guidance for coding agents working in this repository.

## Overview

ux is a language and toolset for composing converters into artifact conversion pipelines.
A converter turns one format into another; TDL backends are converters, and so is any other tool that converts between formats.
Lossy conversions must be visible to the user, and silenceable.

The repository follows the `go` template from [UnstoppableMango/nix](https://github.com/UnstoppableMango/nix).

## Commands

```shell
nix develop        # devShell: go, gomod2nix, gopls, ginkgo, gnumake, nixfmt
make build         # nix build .#
make test          # ginkgo run -r
make fmt           # nix fmt (treefmt: gofmt, nixfmt, actionlint)
make check         # nix flake check
make update        # nix flake update
make tidy          # go mod tidy + regenerate nix/gomod2nix.toml
```

After changing `go.mod`, run `make tidy` so `nix/gomod2nix.toml` stays in sync; otherwise `nix build` fails.

## Layout

- `flake.nix`: inputs, the devShell, treefmt, and `version`.
- `nix/default.nix`: the `ux` package, built with gomod2nix's `buildGoApplication`.
- `main.go`: the CLI entry point.

Tests use Ginkgo and Gomega.
