# The ux language

Design document, exploratory.
Nothing here is built: the parser accepts a placeholder, `pipeline name = a -> b -> c`.
This document surveys prior art, lays out the decisions a pipeline language has to make, sketches four whole languages, and recommends one.

## Vocabulary

- An **artifact** is a tree of files tagged with a format. A single file is a tree of one.
- A **format** is what an artifact is: `proto`, `tdl`, `go`, `jsonschema`, `html`.
- A **converter** turns an artifact of one format into an artifact of another. It is uni-directional, or bi-directional when it has an inverse.
- A **step** is one use of a converter in a pipeline.
- A **pipeline** is a graph of steps from source artifacts to output artifacts.
- A **loss** is a fact present in a converter's input and absent from its output, named by a code such as `lossy.collection`.

## Requirements

From the project's statement of intent:

1. Compose compatible converters, expressively and succinctly.
2. A TDL backend is a converter, forward always and in reverse when it declares `reverse`.
3. Any tool that turns one format into another can be a converter.
4. Loss is allowed, always visible, and always silenceable.
5. Nix is first-class.

And from TDL's own design, which ux should not contradict:

6. Type mapping lives in TDL target blocks, reviewed and versioned in the model, never on a command line (TDL `docs/design/workflow.md`).
7. Loss codes are one shared vocabulary in both directions (TDL `docs/design/reverse.md`).

## Prior art

Each entry says what it does and what ux takes from it.

### Pipes and filter graphs

**Unix pipes.**
`a | b | c`, one untyped byte stream.
Succinct, universally understood, and the reason a linear chain should read left to right.
No types, so a mismatch is found at run time, and no fan-out without `tee`.

**GStreamer.**
`gst-launch-1.0 filesrc location=a.ogg ! oggdemux ! vorbisdec ! audioconvert ! autoaudiosink`.
Elements declare the *caps* (formats with properties) their pads accept, and adjacent pads negotiate.
`decodebin` auto-plugs: given an input and a wanted output, it searches the registry for a chain of elements.
ux takes typed endpoints, negotiation as a type check, and auto-plugging as an opt-in.
GStreamer also shows auto-plugging's cost: the chosen chain is invisible unless you ask for a debug dump.

**ffmpeg filtergraphs.**
`[0:v]scale=640:-1[s];[s][1:v]overlay[out]`.
Named edges give fan-in and fan-out in a single string, at a heavy cost in readability.
ux takes named edges, and not the punctuation.

**PROJ pipelines.**
`+proj=pipeline +step +proj=unitconvert ... +step +inv +proj=utm`.
A coordinate transform is a chain of steps, and `+inv` runs a step backwards.
The closest prior art for bi-directional converters: direction is a modifier on a step, not a second converter.

**LLVM pass pipelines.**
`-passes='module(function(instcombine,simplifycfg))'`.
A textual, nested pipeline with parameters per pass; scoping one pass to a sub-unit is something ux may want for a step over each file of a tree.

**Nushell.**
Commands carry signatures, `def f []: string -> int`, and the pipeline is checked against them before it runs.
Proof that typed pipes stay shell-succinct.

### Hub converters

**Pandoc.**
Readers parse into one AST and writers print from it, so N formats need 2N components rather than N².
Lossiness is real and mostly undocumented: a user finds out what a writer dropped by reading its output.
ux takes the hub, which TDL's IR already is, and rejects the silence.

**unified (remark, rehype).**
Parse, transform, stringify, with plugins at each stage and bridges between ASTs (`remark-rehype` turns mdast into hast).
Shows a hub can have several hubs and converters between them.

**quicktype.**
JSON samples, JSON Schema, or TypeScript in, many languages out, through one IR.
TDL plays this role for ux; quicktype itself could be a non-TDL converter.

### Code generation configuration

**buf.gen.yaml.**
One input, a list of plugins, an output directory each.
Fan-out from a single source is the common case, and a config that says only that is short.

**smithy-build.json.**
*Projections* apply *transforms* to a model (filter shapes, remove traits), then run *plugins* on the result.
The separation of model-to-model transforms from model-to-artifact plugins is worth keeping: a TDL-to-TDL step (a profile, a filter) is a converter whose input and output formats are the same.

**openapi-generator.**
One generator per invocation, with a large bag of per-generator options on the command line.
What ux avoids: configuration that bypasses the reviewed model.

### Build systems

**Make.**
Rules from patterns, `%.pb.go: %.proto`, and the tool finds the chain from what you want to what you have.
Goal-directed and implicit: concise, and hard to read backwards from a file to how it was made.

**Snakemake.**
Rules with input and output patterns; the DAG is inferred from the requested outputs.
The clearest form of goal-directed pipelines for data, and its `--dag` rendering is how users recover the hidden chain.

**Shake.**
A Haskell library for build systems with dynamic dependencies, by Neil Mitchell.
If ux runs steps itself, Shake is a candidate engine, and it is already in nixpkgs.

**Bazel and Nix.**
Hermetic, content-addressed steps with declared inputs.
A converter step is a pure function from input artifacts to an output artifact, which is exactly a derivation.
Nix being first-class means a pipeline should be buildable as derivations, one per step, cached and pinned.

### Typed configuration languages

**Dhall, CUE, Nickel.**
Total or constraint-checked configuration, with types (Dhall), unification (CUE), or contracts (Nickel).
They show how far a non-Turing-complete language can go, and that a pipeline file needs no general computation.
Nickel is Nix-adjacent and worth watching as an embedding target.

### Theory

**Arrows and categories.**
Converters compose as morphisms: `f >>> g`, and fan-out is `f &&& g`.
The Haskell implementation can model steps as an `Arrow`, and the surface language need not mention it.

**Lenses.**
Boomerang (Bohannon, Foster, Pierce, and others, 2008) is a language of bi-directional string transformations with laws: `get (put v s) = v`, `put (get s) s = s`.
A bi-directional converter that round-trips is a lens, and loss is a law failing.
Quotient lenses (Foster, Pilkiewicz, Pierce, 2008) relax the laws to hold up to an equivalence, which is what TDL's round trip "under the backend's normalizer" already is.
This gives loss a precise meaning: what an equivalence forgets.

**Effect systems and graded monads.**
Loss can be an effect tracked in a type, `a ->{lossy.order} b`, whose grades combine by union on composition.
Silencing is then a handler that removes codes from the grade.

## Decisions

Each decision lists its options, their trade-offs, and a lean.

### 1. Does a chain name formats or converters?

The placeholder grammar, `tdl -> protobuf -> go`, names formats.

**Formats.** `proto -> tdl -> go`.
The converter between each pair is looked up.
Direction is free: `proto -> tdl` finds the protobuf backend's reverse without the user saying "import".
It is ambiguous when two converters connect one pair: `proto -> go` is `protoc-gen-go`, or TDL's protobuf reverse then its Go backend.

**Converters.** `protobuf.import >> go`.
Explicit and unambiguous, and reads like a program.
The user restates what the formats already said, and must know each converter's name.

**Both.** A chain alternates freely: `proto -> tdl -> go` where unambiguous, `proto -> via protoc-gen-go -> go` where not.

Lean: both, formats by default.
An ambiguous pair is an error naming every candidate, never a silent pick.

### 2. What is a format?

**Nominal names.** `proto`, `go`.
Simple; says nothing about versions or dialects.

**Parameterized.** `proto<edition: 2024>`, `jsonschema<draft: 2020-12>`, `openapi<3.1>`.
A converter declares what it accepts, as GStreamer caps do, and a mismatch is a type error.
Every parameter is a promise someone must keep, and most converters do not care.

**File patterns.** `*.proto`.
What Make and Snakemake use; ties formats to extensions, which breaks for Go packages, Salesforce DX trees, and anything else whose format is a directory shape.

Lean: nominal names with optional parameters, where a converter that names no parameter accepts any.
Extensions are a hint for reading sources, not the type.

### 3. How is a converter declared?

TDL backends should need no declaration: ux asks `tdl` for its backends and reads each handshake, which already says whether it imports (`Features.reverse`).

Any other tool needs a signature, a command, and, for Nix, a package:

```ux
converter schema-docs : jsonschema -> html {
  run "generate-schema-doc {in} {out}"
  nix json-schema-for-humans
  may-lose lossy.constraint
}
```

The alternative is a wrapper protocol: every tool is wrapped as a TDL-style plugin speaking length-prefixed protobuf.
Uniform, and a large tax on adding `pandoc` to a pipeline.

Lean: declare in ux, with the plugin protocol as an option for tools that want structured diagnostics.
A declared tool's diagnostics are its exit status and stderr, which cannot carry loss codes, so a declared tool states the losses it may cause and ux reports them statically (see decision 5).

### 4. How is direction written?

**Declared `<->`.** `converter tdl.protobuf : tdl <-> proto`.
Using it right to left is the reverse.

**A step modifier.** PROJ's `+inv`: `protobuf.inverse`, or `~protobuf`.
Needed only when chains name converters.

**Separate converters.** `protobuf.gen` and `protobuf.import`.
What TDL's CLI does today (`gen` and `import --from`).
Honest that the two directions are different code with different losses.

Lean: `<->` in declarations, since a format chain then needs no modifier at all; `.reverse` when naming a converter.
Losses are declared per direction.

### 5. How is loss tracked, shown, and silenced?

Two kinds of loss exist, and the language should name both.

- **May lose**, static: the codes a converter's declaration says it can produce. Known before anything runs.
- **Did lose**, dynamic: the diagnostics a run actually produced, with positions. TDL backends report these with codes.

Options for the static side:

**In the type.** `proto ->[lossy.order] tdl`.
Composition unions the sets, so `ux check` can print what a pipeline may lose without running it, and a path search can prefer the least lossy route.
Heavy if users must write it; light if only declarations carry it and the checker infers the rest.

**Untracked.** Only did-lose exists.
Simple, and a pipeline's lossiness is unknown until its first run on real data.

Options for silencing:

| Scope | Spelling | Prior art |
| --- | --- | --- |
| step | `-> go allow lossy.collection` | an inline lint suppression |
| pipeline | `allow lossy.order` in the pipeline body | |
| project | `[lossy]` in a manifest, shared with `tdl.toml` | TDL's `[lossy]` table |
| invocation | `--allow-lossy` | TDL's flag |

And for the opposite direction, `deny lossy.*` makes a may-lose code an error, for a pipeline that must round-trip.

Lean: may-lose in the type, written only on declarations and inferred everywhere else; did-lose reported with the step, the converter, and the source position; silencing at all four scopes, narrowest wins, with `deny` beside `allow`.
A silenced loss still appears under `ux check --show-silenced`, so silence never means unknowable.

A loss through the hub needs both halves named:

```text
billing.ux:6:9: step proto -> tdl (tdl.protobuf reverse)
  billing.proto:12:3: lossy.collection: repeated string tags read as [string]; a Set is not recoverable
```

### 6. Does ux find paths?

**Never.** Every step is written.
Predictable; verbose for long chains, and the user must know the graph.

**Always.** Write the endpoints, `proto ~> ts`, and ux finds a chain.
Concise, and the GStreamer and Make problem: the chain is hidden, and adding a converter to the registry can silently change it.

**On request, and shown.** `~>` searches; `->` does not.
The search minimizes may-lose, then length, and ties are an error.
`ux check` prints every resolved `~>`, and `ux fmt --expand` rewrites it to the explicit chain, as a lock file pins a version.

Lean: on request, and shown.

### 7. Do adjacent TDL steps pass text or IR?

`proto -> tdl -> go` could print TDL source between the steps and parse it again, or pass the `ir.Model` from the protobuf reverse straight into the Go backend.

Passing IR is faster and skips unlowering's own losses (comment placement, formatting), and ux already has the IR bindings in `gen/`.
Printing TDL lets a user inspect, commit, and hand-edit the intermediate, and keeps `tdl check` as the gate TDL's `import` enforces.

Lean: IR by default, with a named intermediate (`let model = ...`, decision 9) materialized as TDL when it is written out.
Fusion is an optimization the user can see in `ux check` output, never a semantic difference.

This needs one thing from TDL: a way for a host other than `tdl` to lower `.tdl` source to IR, such as `tdl ir --format binary`, since lowering lives in Go.

### 8. How is a step configured?

TDL's rule is that type mapping lives in target blocks.
A model imported from protobuf has a protobuf target block and no Go one, so `proto -> tdl -> go` has nowhere to say what Go package to write.

**Step arguments.** `-> go(package: "example.com/billing")`.
Short, and exactly the command-line mapping TDL refuses.

**An overlay file.** `-> go with "targets/go.tdl"`: target blocks merged into the model before the step.
Mapping stays in reviewed TDL.

**A profile.** `-> go with std.go.defaults`, applying a TDL profile by name (TDL `docs/design/profiles.md`).
Reusable conventions with no file per pipeline.

Lean: overlays and profiles for anything TDL calls mapping, and step arguments only for how a tool runs (a timeout, an output subdirectory), never what it writes.

### 9. Linear, graph, or rules?

The shape of a program is the decision the sketches below differ on most.

**Linear chains** cover the common case and need `tee` or nesting for fan-out.
**Bindings** (`let`) give every intermediate a name, so fan-out is using a name twice and fan-in is a step taking two.
**Rules** state what is wanted and let ux plan, as Make does.

### 10. How does Nix run it?

**ux runs tools from `PATH`.** Fast inner loop, `--watch`, nothing to build first; not hermetic.

**ux emits derivations.** One derivation per step, inputs from the source tree, the converter's `nix` package on the builder's `PATH`.
Cached and pinned; every step pays a derivation's overhead, and a source change rebuilds everything downstream of it, which is correct.

**Pipelines are Nix.** No ux syntax; a Nix library builds steps.
See sketch D.

Lean: one semantics, two runners.
`ux run` executes locally for the inner loop, and `ux nix` (or a flake-parts module, as TDL's `perSystem.tdl` is) evaluates the same pipeline to derivations.
A converter with no `nix` package runs locally and is an error under the Nix runner, so a pipeline states what it needs to be hermetic.

## Four sketches

Each sketch writes the same pipeline:
import `proto/billing/*.proto` to TDL, generate Go and TypeScript from it, and render its JSON Schema as HTML with a non-TDL tool, allowing TypeScript to write sets as arrays.

### A. Pipes

Linear chains with nesting for fan-out, closest to Unix and GStreamer.

```ux
pipeline billing =
  "proto/billing/*.proto" : proto
  -> tdl
  -> { go         => "gen/go"
       ts         => "gen/ts"   allow lossy.collection
       jsonschema -> html => "docs/schema" }
```

Pros: shortest; reads top to bottom; the placeholder grammar is already its first line.
Cons: fan-in has no spelling; a long branch nests deeply; naming an intermediate means a second pipeline and a way to reference it.

### B. Bindings

A small typed dataflow language: `let` names an artifact, `->` chains, and an output is a binding to a path.

```ux
import tdl
import tools.schema-docs

pipeline billing {
  let model = read "proto/billing/*.proto" as proto -> tdl

  write "gen/go"      = model -> go with "targets/go.tdl"
  write "gen/ts"      = model -> ts allow lossy.collection
  write "docs/schema" = model -> jsonschema -> html
}
```

Pros: fan-out and fan-in are ordinary; every intermediate can be written out, inspected, or passed between pipelines; a type error points at one line.
Cons: longer than A for one chain; `let` invites a general-purpose language, which must be resisted (no functions, no conditionals, at least at first).

### C. Goals

Declare sources and wanted outputs; ux plans every chain.

```ux
source "proto/billing/*.proto" : proto

want "gen/go"      : go          with "targets/go.tdl"
want "gen/ts"      : ts          allow lossy.collection
want "docs/schema" : html via jsonschema
```

Pros: shortest of all for fan-out from one source; adding an output is one line; scales to many sources the way Make does.
Cons: every chain is a search result, so the program does not say what runs; `via` creeps in wherever the search is wrong; the hidden `-> tdl` fusion point cannot be named or configured.

### D. Nix-embedded

No ux syntax: pipelines are Nix expressions, and ux is a library and a CLI over them.

```nix
let
  model = ux.read ./proto/billing { format = "proto"; } |> ux.to "tdl" { };
in
ux.pipeline {
  name = "billing";
  outputs = {
    "gen/go" = model |> ux.to "go" { overlay = ./targets/go.tdl; };
    "gen/ts" = model |> ux.to "ts" { allow = [ "lossy.collection" ]; };
    "docs/schema" = model |> ux.to "jsonschema" { } |> ux.via schemaDocs { };
  };
}
```

(`|>` is Nix's experimental pipe operator; without it each step nests.)

Pros: Nix is as first-class as it gets; no parser, no new language to learn for Nix users; derivations come free.
Cons: ux's own parser and tooling have nothing to do, which defeats the reason ux exists; type errors surface as Nix evaluation errors; users without Nix cannot run a pipeline at all; loss tracking must be rebuilt in Nix's untyped evaluator.

### Comparison

| | A. Pipes | B. Bindings | C. Goals | D. Nix |
| --- | --- | --- | --- | --- |
| One chain | shortest | short | short | long |
| Fan-out | nesting | names | free | attrs |
| Fan-in | none | names | rules | functions |
| What runs is visible | yes | yes | no, until expanded | yes |
| Static loss check | yes | yes | yes | hard |
| Works without Nix | yes | yes | yes | no |
| Language surface | tiny | small | tiny | none |

## Recommendation

B as the core, with A's chain as its expression form, C's planning as the opt-in `~>`, and D's derivations as a runner rather than the surface.

Concretely:

- A file holds `import`, `format`, `converter`, and `pipeline` declarations.
- A pipeline body holds `let`, `write`, `allow`, and `deny`.
- An expression is a source (`read <glob> as <format>`), a name, or an expression followed by `-> <format>`, `-> via <converter>`, or `~> <format>`, each with optional `with`, `allow`, and `deny` clauses.
- Formats are nominal with optional parameters; TDL backends are discovered, other converters are declared with a signature, a command, a Nix package, and their may-lose codes.
- May-lose codes are part of each step's type, inferred from declarations; did-lose diagnostics are reported per step with source positions.
- Silencing composes from invocation, project, pipeline, and step, narrowest winning, and is shared with `tdl.toml`'s `[lossy]` table.
- `ux run` executes locally; `ux nix` and a flake-parts module build the same pipeline as one derivation per step.

A first grammar, in the Wirth notation TDL's `docs/grammar.ebnf` uses:

```ebnf
File       = { Decl } .
Decl       = Import | Format | Converter | Pipeline .
Import     = "import" Path .
Format     = "format" identifier [ "<" Params ">" ] .
Converter  = "converter" identifier ":" Type ( "->" | "<->" ) Type "{" { Field } "}" .
Pipeline   = "pipeline" identifier "{" { Stmt } "}" .
Stmt       = "let" identifier "=" Expr
           | "write" string "=" Expr
           | Policy .
Expr       = Source { Step } | identifier { Step } .
Source     = "read" string "as" Type .
Step       = ( "->" Type | "->" "via" Path | "~>" Type ) { Clause } .
Clause     = "with" ( string | Path ) | Policy .
Policy     = ( "allow" | "deny" ) Code { "," Code } .
Type       = identifier [ "<" Args ">" ] .
```

## Open questions

- **Loss code ownership.** TDL's codes are `lossy.*`. Does a declared tool reuse them, mint its own (`schema-docs/...`), or both? Reuse makes project-wide silencing coherent; minting is honest about tools TDL never imagined.
- **Lowering from Haskell.** Decision 7 needs `tdl` to emit binary IR for a `.tdl` file, or ux to shell out to `tdl gen` and give up fusion.
- **Artifacts as trees.** A step over each file of a tree (LLVM's nested pass managers) or over the whole tree (`protoc`'s single invocation) behaves differently. Is per-file mapping a converter property or a step modifier?
- **Identity steps.** A TDL-to-TDL converter (a profile, a filter, smithy-build's transforms) has equal input and output formats. Is it a converter, or a `with` clause?
- **Round trips as tests.** `deny lossy.*` on `tdl -> proto -> tdl` is a round-trip assertion. Should `ux test` exist, comparing under each format's normalizer as TDL's `reverse.md` does?
- **Discovery cost.** Discovering TDL backends means a handshake per plugin on `PATH`; a cached registry, or a declaration per backend, may be needed.
- **Watch mode.** TDL plugins can declare reuse; a long-lived `ux run --watch` should keep them alive across runs.
- **Manifest.** Whether ux grows a `ux.toml`, reads `tdl.toml`, or both, before TDL's own manifest (TDL `workflow.md`) is built.
