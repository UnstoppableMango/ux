# Ux design

Status: draft.
This document proposes a design and flags the decisions that are still open.
Nothing here is implemented.

## What Ux is

Ux is a glue language.
A single `.ux` file contains code written in several different languages, and Ux binds them together into one program.

Ux is general purpose by delegation rather than by feature.
It has no arithmetic, no control flow, and no data structures of its own beyond what it needs to describe interfaces.
Anything you want to compute, you compute in a language that is already good at it.
Ux's job is the seam between those languages.

Two properties drive every decision below:

1. Embedded code must conform to a known shape so Ux can understand what it exports and what it needs, with extension points for code that does not fit the default shape.
2. A symbol defined in one language must be referenceable from another, and the editor must follow that reference like any other go-to-definition.

The second property is the hard one, and it constrains the first.
Ux cannot offer cross-language go-to-definition unless it can extract a symbol table from every block without fully implementing every language.

## The shape

The default block shape is **a function body**.
The signature lives at the Ux level; the body is written in the host language.

```ux
go add(a: i32, b: i32) -> i32 {
    return a + b
}

py describe(n: i32) -> string {
    return f"the number is {n}"
}

ts main() {
    console.log(describe(add(1, 2)))
}
```

This split is what makes the rest of the system tractable.

Ux owns the signature, so it knows the name, the arity, the parameter types, and the return type of every block without parsing the host language at all.
That is the entire symbol table, available from the Ux grammar alone.

The host language owns the body, so Ux never needs a semantic model of Go or Python or TypeScript to let you write them.
The body is opaque to Ux except for one operation: finding free identifiers that resolve to Ux symbols.

In `main` above, `describe` and `add` are free identifiers.
Neither is declared in the TypeScript body and neither is a TypeScript builtin, so Ux resolves them against its own symbol table, finds the Python and Go blocks, and generates the binding.

### Why the signature is not inferred from the body

The obvious alternative is to write plain Go and have Ux read the signature out of it.
That fails the editor requirement.
Inferring signatures means Ux depends on a working semantic analysis of every supported language before it can answer a single go-to-definition query, and it means a syntax error in one Python block blinds the editor to every symbol in the file.
Declaring signatures at the Ux level means the symbol table survives broken block bodies, which is the normal state of a file while you are typing in it.

### Resolving free identifiers

Ux needs to distinguish a reference to a Ux symbol from an ordinary local variable.
Three options, in order of preference:

1. **Scope subtraction.** Parse the body with the host language's tree-sitter grammar, collect identifiers, subtract everything bound locally (parameters, locals, imports) and everything in the language's builtin set. What remains is a candidate Ux reference. Keeps block bodies valid in their host language, which keeps existing editor tooling working. Requires a scope query per language pack.
2. **Explicit sigil.** Write `@add(1, 2)`. Unambiguous and trivial to implement, but block bodies stop being valid host-language code, which breaks formatters, linters, and the language server proxy described below.
3. **Declared imports.** Each block lists the Ux symbols it uses. Explicit and analyzable, but verbose, and it still has to live somewhere that is valid in the host language.

Recommendation: scope subtraction, with the sigil available as an escape hatch when a Ux symbol name collides with something the host language binds.

Open question: what happens when scope subtraction produces a candidate that matches no Ux symbol.
Treating it as an error makes Ux reject valid host code that references something Ux cannot see (a package-level helper, a global).
Treating it as pass-through makes typos silently become runtime failures in the host language.
Leaning toward pass-through with a warning, since Ux is glue and should not pretend to own the host language's namespace.

## Extension points

Not every useful language is shaped like a function body.
SQL is a query, HTML is a tree, a shader is a whole compilation unit, a Makefile is a ruleset.

A **language pack** teaches Ux a language.
It is data, not code, wherever that is possible.
A pack declares:

- **Grammar.** A tree-sitter grammar, used for both editor injection and scope subtraction.
- **Block kinds.** The default `function` kind, or a custom kind. A `query` kind for SQL takes typed parameters and returns rows. A `unit` kind takes a whole file and exports whatever its declaration query finds.
- **Declaration query.** A tree-sitter query that extracts exported symbols from a `unit` block, for languages where Ux does not own the signature.
- **Scope query.** A tree-sitter query that identifies locally bound identifiers, feeding scope subtraction.
- **Type mapping.** A bidirectional map between the language's types and Ux interchange types.
- **Emit rules.** How to render a call to a Ux symbol, and how to render this block's own interface, in the host language.
- **Toolchain.** How to build, format, and (optionally) language-server this language.

A pack that provides only a grammar gets syntax highlighting and nothing else.
Each additional piece unlocks a capability.
This gradient matters: adding a language should be a slope, not a cliff.

Open question: pack distribution.
In-repo directory, a registry, or Nix flake inputs.
Nix is appealing because a pack needs a real toolchain pinned to a real version, and that is a problem Nix already solves.

## Interchange types

Cross-language calls are restricted to a fixed type set.
Anything outside it is opaque and cannot cross a boundary.

- Scalars: `bool`, `i8`/`i16`/`i32`/`i64`, `u8`/`u16`/`u32`/`u64`, `f32`/`f64`, `char`
- Strings and bytes: `string`, `bytes`
- Composites: `list<T>`, `map<K, V>`, `option<T>`, `result<T, E>`, `tuple<...>`
- User-defined: `record` (named fields) and `variant` (tagged union), declared at the Ux level
- `handle<T>`: an opaque reference owned by one language and passed through others without inspection

This list is deliberately close to the WebAssembly Component Model's WIT types, for the reason in the next section.

## Execution model

This is the largest open decision.
Three candidates:

**Transpile to a single host.**
Lower every block into one target language.
Simple to run, no FFI, no runtime negotiation.
Fails immediately, because transpiling Python to Go is a research project and the whole premise is that you get to use the real language.
Rejected.

**Native artifacts plus generated FFI.**
Each language compiles to its native form, Ux generates C ABI shims or IPC between them.
Honest and fully general.
Also a large amount of per-language-pair work, and it drags in the entire cross-compilation and ABI matching problem.

**WebAssembly components.**
Each block compiles to a WASM component; Ux generates a WIT interface for each block and composes them.
This is the recommendation.
The component model was built for exactly this problem, the interchange type set above is essentially WIT, and Rust, Go (TinyGo), Python (componentize-py), JS (jco), and C all have working toolchains.
The cost is that a language is only supported if it can reach WASM, which excludes some targets and makes others slow.

Open question: whether Ux needs a non-WASM escape path from day one for languages that cannot compile to it, and whether that path is subprocess IPC.

## Editor support

The priority is cross-language symbol reference, which means this is not a highlighting problem.

**Highlighting** comes from a tree-sitter grammar for Ux plus injection queries pointing each block body at its language's grammar.
Helix, Neovim, and Zed consume injections natively.
VS Code needs a semantic tokens provider, since TextMate injection does not handle nesting well.

**Language intelligence** comes from `ux-lsp`, which is a multiplexer rather than a monolith.

For any request, `ux-lsp` finds which block the cursor is in.
Requests that stay inside a block get forwarded to that language's real language server.
Requests that cross a boundary, including go-to-definition on a free identifier, get answered by Ux itself from its own symbol table.

Forwarding requires a **virtual document** per block: a synthesized file, valid in the host language, containing the block body plus generated stubs for every Ux symbol the block references.
`gopls` sees a real Go file with a real `describe` function to jump to.
`ux-lsp` maps positions between the virtual document and the real `.ux` file, and rewrites the stub's location into the location of the actual Python block.

The prior art is Volar, which does exactly this for Vue single-file components, and the same technique powers Svelte and Astro tooling.
Reading how Volar handles source maps and virtual files is the highest-value research step before writing any of this.

Open question: language server lifecycle.
Running `gopls`, `pyright`, and `tsserver` concurrently for one file is heavy, and each wants a project root that a virtual document does not really have.

## Implementation

Rust.
tree-sitter's primary bindings are Rust, `tower-lsp` covers the server, and a single static binary is the right shipping form for something that has to live inside editors.

Rough component split:

- `ux-syntax`: tree-sitter grammar for Ux, plus injection and highlight queries
- `ux-core`: parser, symbol table, scope subtraction, type checking across boundaries
- `ux-pack`: language pack loading and the pack schema
- `ux-lsp`: the multiplexing language server and virtual document machinery
- `ux-cli`: build, run, format, check

## Open questions

Ranked by how much they block everything else.

1. Execution model: WASM components, or native plus FFI, or both.
2. Free identifier resolution: scope subtraction versus an explicit sigil.
3. Whether Ux has any top-level control flow of its own, or whether one block is always the entry point that calls the others.
4. Language pack distribution and toolchain pinning.
5. Whether blocks can be generic over interchange types, or whether generics stop at the boundary.
