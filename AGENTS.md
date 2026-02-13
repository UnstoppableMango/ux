# AI Agent Instructions for UX

This file provides instructions for AI agents working on the UX codegen tooling suite.

## Project Context

UX is a codegen management tool that orchestrates code generation workflows. It manages inputs and outputs for various codegen tools through a plugin architecture.

## Core Concepts

### Plugin Architecture

- Plugins are executable binaries with names matching `([\w\-]+2[\w\-]+)` pattern
- Example: `csharp2go`, `go2csharp`, `proto2go`

### Primary Workflow

The main execution mode is: `ux gen <source> <target>`

## Technology Stack

### Languages and Frameworks

- **Go 1.24.9**: Primary implementation language

### Key Tools

- **ginkgo/gomega**: Testing framework for Go
- **golangci-lint**: Go linting
- **Nix**: Reproducible build environment

## Development Workflow

### Building

```bash
make build         # Build all components
make bin/ux        # Build just the ux binary
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
make generate      # Generate code
```

### Dependency Management

```bash
make tidy          # Update all lock files and dependencies
```

## Code Organization

```
.
├── cmd/           # Command-line entry points
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
4. **Update dependencies** with `make tidy` if you modify go.mod or flake.nix files
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

- Follow naming convention: `source2target`
- Should be standalone executables

## Common Tasks

### Adding a New Go Package

1. Create package directory under `pkg/` or `internal/`
2. Add tests using Ginkgo
3. Run `make test` to verify
4. Update imports and run `make tidy`

### Adding a New Proto Definition

1. Run `make generate` to regenerate Go code
2. Run `make build` to verify compilation

## Build System Notes

The project uses Make with sentinel files in `.make/` directory to track build state. This allows incremental builds and avoids unnecessary work.

### Nix Integration

- `flake.nix` defines reproducible build environment
- Use `nix develop` for development shell
- `gomod2nix.toml` syncs Go modules with Nix

## Questions to Consider

When working on this codebase, consider:

- Do I need to update documentation?
- Are there tests that validate this functionality?
