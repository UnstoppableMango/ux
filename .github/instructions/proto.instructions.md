---
applyTo: "**/*.proto"
---

# Protocol Buffers Instructions

## Code Style and Conventions

- Follow protobuf style guide and best practices
- Use `buf format` for automatic formatting (`make fmt`)
- Lint with `buf lint` (`make lint`)
- Build with `buf build` (`make build`)

## File Structure

- Proto definitions are located in `proto/` directory
- Generated Go code goes to `gen/` directory
- Don't manually edit generated code

## Naming Conventions

- Use `snake_case` for field names
- Use PascalCase for message and service names
- Use UPPER_SNAKE_CASE for enum values

## Services and RPCs

- Define gRPC services in proto files

## Code Generation

- Generate code with `make generate` or `buf generate`
- Generation is configured in `buf.gen.yaml`
- Regenerate after modifying any `.proto` files

## Dependencies

- Proto dependencies are managed by `buf.yaml`
- Update dependencies with `buf dep update`
- Lock file is `buf.lock`

## Best Practices

- Keep proto definitions backward compatible
- Use appropriate field numbers and reserve removed fields
- Document messages and fields with comments
- Use semantic versioning for breaking changes
- Organize related definitions in the same proto file
