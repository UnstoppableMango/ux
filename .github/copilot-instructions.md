# UX - Codegen Tooling Suite

## Project Overview

UX is a codegen management tool that manages inputs and outputs for codegen tool execution. It supports a plugin system where plugins must be executable binaries with names matching the regex `([\w\-]+2[\w\-]+)` (e.g., `csharp2go` or `go2csharp`).

## Technology Stack

- **Primary Language**: Go 1.24.9
- **Secondary Language**: C# (.NET)
- **Protocol**: Protocol Buffers (protobuf) with gRPC
- **Testing**: Ginkgo (Go) and Gomega
- **Linting**: golangci-lint for Go, dotnet format for C#
- **Formatting**: gofmt for Go, dotnet format for C#, dprint for JSON/Markdown, buf for protobuf
- **Build System**: Makefile, Nix flakes
- **Package Manager**: Go modules, NuGet for .NET

## Development Guidelines

### Building and Testing

- Use `make build` to build all components (buf, dotnet, and ux binary)
- Use `make test` to run Ginkgo tests
- Use `make lint` to run all linters
- Use `make fmt` to format all code

### Code Style

- Follow standard Go conventions and idioms
- Use gofmt for Go code formatting
- Follow C# naming conventions for .NET code
- Keep protobuf definitions clean and well-documented

### Project Structure

- `pkg/`: Core Go packages and libraries
- `src/`: C# .NET plugin implementations
- `cmd/`: Command-line entry points
- `internal/`: Internal Go packages
- `proto/`: Protocol Buffer definitions
- `gen/`: Generated code from protobuf
- `test/`: Test files and test data
- `examples/`: Example usage and implementations

### Plugin Development

- Plugins must be executable binaries
- Plugin names follow the pattern: `source2target` (e.g., `csharp2go`)
- Plugins can be invoked with `ux plugin run <plugin-name>`

### Dependencies

- Always run `make tidy` after modifying dependencies
- Go dependencies are managed via go.mod
- .NET dependencies are managed via .csproj files
- Use `gomod2nix` to sync Nix dependencies with go.mod

## Best Practices

- Write tests for new functionality using Ginkgo/Gomega
- Ensure all code is properly formatted before committing
- Run linters to catch potential issues
- Keep generated code separate from hand-written code
- Document public APIs and exported functions
- Use structured logging with charmbracelet/log
