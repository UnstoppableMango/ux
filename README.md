# ux

An expressive language for defining artifact conversion pipelines, coupled with a rich developer toolset.

A converter turns an artifact in one format into another.
[TDL](https://github.com/UnstoppableMango/tdl) backends are converters, bi- or uni-directional depending on what the backend supports, and so is any other tool that turns one format into another.
ux composes compatible converters into pipelines, so data can pass through several conversions before it reaches a usable format.

Lossiness is expected but discouraged.
When a conversion loses data, ux makes it visible, and it can always be silenced.

Nix is first-class.

## Status

ux is a Haskell skeleton: a placeholder grammar parsed with [megaparsec](https://hackage.haskell.org/package/megaparsec), a CLI, and Haskell bindings for TDL's IR and plugin protocol.

## Development

```shell
nix develop    # or direnv allow
make build     # nix build .#
make test      # cabal test
make fmt       # nix fmt
make check     # nix flake check
make generate  # regenerate gen/ from TDL's protos
```
