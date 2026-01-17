---
applyTo: "**/*.cs,**/*.csproj"
---

# C# / .NET Code Instructions

## Code Style and Conventions

- Follow standard C# naming conventions and coding standards
- Use `dotnet format` for automatic formatting (`make fmt`)
- Build with `dotnet build` or `make build`

## Naming Conventions

- Use PascalCase for public members, types, and namespaces
- Use camelCase for private fields with underscore prefix (e.g., `_myField`)
- Use PascalCase for properties and methods
- Interface names should start with 'I' (e.g., `IPlugin`)

## Project Structure

- C# projects are located in `src/` directory
- Main projects:
  - `UnMango.Ux.Plugins`: Plugin framework and skeleton implementations
  - `UnMango.Ux.Plugins.CommandLine`: Command-line plugin utilities
- Example projects are in `examples/csharp/`

## Plugin Development

- Plugins implement the UX plugin interface
- Use the skeleton implementation (`Skel.cs`) as a reference
- UxFuncs provides utility functions for plugin development

## Building and Testing

- Build all .NET projects with `make build` or `dotnet build`
- Format code with `make fmt` or `dotnet format`
- Package NuGet packages with `make nuget` or `dotnet pack`

## Dependencies

- Manage dependencies via `.csproj` files
- NuGet packages are output to `nupkgs/` directory
- Update `Directory.Build.props` for shared project properties

## Best Practices

- Write XML documentation comments for public APIs
- Use async/await for asynchronous operations
- Dispose of resources properly using `using` statements or `IDisposable`
- Follow the plugin naming convention: `source2target` pattern
