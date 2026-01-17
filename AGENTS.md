# AI Agent Instructions for UX

This file provides instructions for AI agents working on the UX codegen tooling suite.

## Project Context

UX is a codegen management tool that orchestrates code generation workflows. It manages inputs and outputs for various codegen tools through a plugin architecture.

## Core Concepts

### Plugin Architecture
- Plugins are executable binaries with names matching `([\w\-]+2[\w\-]+)` pattern
- Example: `csharp2go`, `go2csharp`, `proto2go`
- Plugins can be listed with: `ux plugin list`
- Plugins can be run with: `ux plugin run <plugin-name>`

### Primary Workflow
The main execution mode is: `ux gen <source> <target>`

## Technology Stack

### Languages and Frameworks
- **Go 1.24.9**: Primary implementation language
- **C# .NET**: Plugin implementations and framework
- **Protocol Buffers**: Inter-process communication

### Key Tools
- **buf**: Protocol buffer management
- **ginkgo/gomega**: Testing framework for Go
- **golangci-lint**: Go linting
- **dprint**: JSON/Markdown formatting
- **Nix**: Reproducible build environment

## Development Workflow

### Building
```bash
make build          # Build all components
make bin/ux        # Build just the ux binary
make bin/dummy     # Build dummy test binary
```

### Testing
```bash
make test          # Run all tests with ginkgo
```

### Formatting
```bash
make fmt           # Format all code (Go, C#, proto, JSON)
```

### Linting
```bash
make lint          # Run all linters
```

### Code Generation
```bash
make generate      # Generate code from protobuf definitions
```

### Dependency Management
```bash
make tidy          # Update all lock files and dependencies
```

## Code Organization

```
.
├── pkg/           # Core Go packages and libraries
│   ├── plugin/    # Plugin system implementation
│   ├── cli/       # CLI utilities
│   ├── config/    # Configuration management
│   └── ...
├── src/           # C# .NET implementations
│   ├── UnMango.Ux.Plugins/              # Plugin framework
│   └── UnMango.Ux.Plugins.CommandLine/  # CLI utilities
├── cmd/           # Command-line entry points
├── internal/      # Internal Go packages (not importable)
├── proto/         # Protocol buffer definitions
├── gen/           # Generated code (don't edit manually)
├── test/          # Test files and fixtures
├── examples/      # Usage examples
└── hack/          # Build and development scripts
```

## Important Guidelines

### When Making Changes

1. **Always run tests** before and after changes
2. **Format code** with `make fmt` before committing
3. **Run linters** with `make lint` to catch issues
4. **Update dependencies** with `make tidy` if you modify go.mod or .csproj files
5. **Regenerate code** with `make generate` if you modify .proto files

### Don't Modify
- Generated code in `gen/` directory
- Lock files manually (use `make tidy` instead)
- `.make/` sentinel files

### Testing Approach
- Use Ginkgo's BDD-style tests for Go
- Tests should be in `*_test.go` files
- Use Gomega matchers for assertions
- Keep test data in `test/` directory

### Error Handling
- Always check and handle errors in Go
- Use structured logging with charmbracelet/log
- Wrap errors with context using `fmt.Errorf` with `%w`

### Plugin Development
- Implement plugin interface defined in proto
- Follow naming convention: `source2target`
- Can be written in Go or C#
- Should be standalone executables

## Common Tasks

### Adding a New Go Package
1. Create package directory under `pkg/` or `internal/`
2. Add tests using Ginkgo
3. Run `make test` to verify
4. Update imports and run `make tidy`

### Adding a New Proto Definition
1. Add/modify `.proto` files in `proto/` directory
2. Run `make generate` to regenerate Go code
3. Run `make build` to verify compilation
4. Update `buf.lock` if adding dependencies

### Adding a New Plugin
1. Create executable following naming convention
2. Implement plugin protocol (gRPC or command-line)
3. Add tests for plugin functionality
4. Document plugin in appropriate location

## Build System Notes

The project uses Make with sentinel files in `.make/` directory to track build state. This allows incremental builds and avoids unnecessary work.

### Nix Integration
- `flake.nix` defines reproducible build environment
- Use `nix develop` for development shell
- Use `make nix` to switch to Nix-based environment
- `gomod2nix.toml` syncs Go modules with Nix

## Questions to Consider

When working on this codebase, consider:

- Does this change affect the plugin interface?
- Do I need to regenerate protobuf code?
- Are there corresponding changes needed in both Go and C# implementations?
- Do I need to update documentation?
- Are there tests that validate this functionality?
- Does this maintain backward compatibility with existing plugins?
