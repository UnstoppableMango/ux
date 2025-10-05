# UX - A Codegen Tooling Suite

Some silly idea I had for codegen management tool.

UX will manage inputs and outputs for codegen tool execution.
Inputs encapsulate configuration and source code; anything a tool needs to generate code.
Outputs are defined as anything produced by the codegen tool.

A codegen tool must be an executable binary with a name matching the regex `([\w\-]+2[\w\-]+)` i.e. `csharp2go` or `go2csharp`.
Other plugin types may be supported in the future.

## Usage

The primary mode of execution (which doesn't work right now) is:

```shell
ux gen <source> <target>
```

For simplicity, plugins can be invoked with minimal intervention from `ux` by running:

```shell
ux plugin run <my plugin>
```

To list plugins that the tool recognizes:

```shell
ux plugin list
```
