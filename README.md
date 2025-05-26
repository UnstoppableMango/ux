# ux

The Universal codegen CLI.

## Quickstart

Install the CLI:

```shell
go install github.com/unstoppablemango/ux@latest
```

### Docker

Or run with Docker:

```shell
docker run --rm -it ghcr.io/unstoppablemango/ux:latest
```

### Codegen

Generate stuff (doesn't work yet)

```shell
ux generate
```

## Development

|      target | description                                        |
| ----------: | :------------------------------------------------- |
| `<default>` | `build`                                            |
|     `build` | Builds all main artifacts, `ux`, `buf build`, etc. |
|  `generate` | Runs all codegen targets                           |
|      `test` | Runs all test suites                               |
|    `format` | Runs all formatting targets                        |
|      `lint` | Runs all linting targets                           |
|    `docker` | Builds `ghcr.io/unstoppablemango/ux`               |
|    `bin/ux` | Builds the main `ux` CLI                           |
