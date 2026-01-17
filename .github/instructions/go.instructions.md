---
applyTo: "**/*.go"
---

# Go Code Instructions

## Code Style and Conventions

- Follow standard Go conventions and effective Go guidelines
- Use gofmt for formatting (automatically applied by `make fmt`)
- Run `go vet` to catch common mistakes
- Use golangci-lint for comprehensive linting (`make lint`)

## Naming Conventions

- Use camelCase for unexported identifiers
- Use PascalCase for exported identifiers
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
- Use `go mod tidy` to clean up unused dependencies
- Update gomod2nix.toml for Nix builds

## Logging

- Use the charmbracelet/log package for structured logging
- Provide appropriate log levels (debug, info, warn, error)
- Include relevant context in log messages

## Protobuf and gRPC

- Don't modify generated protobuf code in `gen/`
- Regenerate protobuf code with `make generate` after changing `.proto` files
- Implement gRPC services in `pkg/` or `internal/`, not in generated code

## Build and Development

- Build with `make build` or `go build`
- The main entry point is `main.go`
- Command implementations are in `cmd/`
- Use `make` targets for consistent builds
