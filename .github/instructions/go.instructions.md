---
applyTo: "**/*.go"
---

# Go Code Instructions

## Code Style and Conventions

- Follow standard Go conventions and effective Go guidelines
- Run `make fmt` for comprehensive formatting
- Run `make lint` for comprehensive linting

## Naming Conventions

- Interface names should describe behavior (e.g., `Reader`, `Writer`)
- Avoid stuttering in package names (e.g., `log.Logger` not `log.LogLogger`)

## Error Handling

- Always check and handle errors explicitly
- Wrap errors with context using `fmt.Errorf` with `%w` verb
- Return errors as the last return value
- Don't panic in library code; return errors instead

## Testing

- Write tests using Ginkgo and Gomega frameworks
- Test files should end with `_test.go`
- Use table-driven tests for multiple test cases
- Generate test boilerplate with `make %_test.go`
- Run tests with `make test` or `ginkgo`

## Package Structure

- Keep packages focused and cohesive
- Avoid circular dependencies
- Place internal packages in `internal/` directory
- Keep generated code in `gen/` directory

## Dependencies

- Add dependencies via `go get`
- Run `make tidy` after adding/removing dependencies
- Run `make tidy` to update gomod2nix.toml when dependencies change

## Logging

- Use the charmbracelet/log package for structured logging
- Provide appropriate log levels (debug, info, warn, error)
- Include relevant context in log messages

## Build and Development

- Build with `make build`
- The main entry point is `main.go`
- Command implementations are in `cmd/`
- Use `make` targets for consistent builds
