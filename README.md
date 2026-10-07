# ux

An expressive language for defining artifact conversion pipelines, coupled with a rich developer toolset.

A converter turns an artifact in one format into another.
[TDL](https://github.com/UnstoppableMango/tdl) backends are converters, bi- or uni-directional depending on what the backend supports, and so is any other tool that turns one format into another.
ux composes compatible converters into pipelines, so data can pass through several conversions before it reaches a usable format.

Lossiness is expected but discouraged.
When a conversion loses data, ux makes it visible, and it can always be silenced.

Nix is first-class.

## Status

The repository was reset to a fresh [UnstoppableMango/nix](https://github.com/UnstoppableMango/nix) Go template.
The earlier codegen plugin CLI lives in the git history.

## Development

```shell
nix develop    # or direnv allow
make build     # nix build .#
make test      # ginkgo run -r
make fmt       # nix fmt
make check     # nix flake check
make tidy      # go mod tidy + regenerate nix/gomod2nix.toml
```
