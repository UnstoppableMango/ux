# ux tooling

Design document, exploratory.
Nothing here is built: `ux` has `version` and `parse`.
The language is designed separately in `language.md` and is not settled, so this document designs the tools around a seam the language feeds, and assumes as little as it can about concrete syntax.

Vocabulary (artifact, format, converter, step, pipeline, loss) is `language.md`'s.

## Requirements

From the project's statement of intent:

1. A rich developer toolset, not only a language.
2. Loss is always visible, and always silenceable.
3. Nix is first-class.

And one of method:

4. The language and the tools grow independently. A change to concrete syntax touches the parser, the printer, and the highlighting grammar, and nothing else.

## The seam

Every tool except three reads a resolved pipeline, never syntax.

```text
  source text ──parse──▶ Syntax ──elaborate──▶ Core ──plan──▶ Plan ──run──▶ artifacts, diagnostics
     ▲                                                          │
     └────────────── print (fmt) ◀── Syntax                     └──▶ Nix derivations
```

- **Syntax** (`Ux.Syntax`): the parse tree, mirroring the source. Owned by the language.
- **Core** (`Ux.Core`): what a file means with the spelling gone. Sources, steps, named intermediates, outputs, converter declarations, and loss policies, each carrying a source span. Names are resolved; converters are not.
- **Plan** (`Ux.Plan`): Core with every step bound to one concrete converter, every `~>` expanded, and every step's may-lose set computed. A DAG, the thing a runner executes.

`language.md`'s four sketches all elaborate to the same Core: a graph of steps from sources to outputs with policies attached.
That is the bet this document makes, and the language should be designed to keep it true: if a construct cannot be said in Core, Core grows, and the tools see one new constructor rather than a new grammar.

Which tool reads what:

| Tool | Syntax | Core | Plan |
| --- | --- | --- | --- |
| `ux fmt` | yes | | |
| highlighting grammars | yes | | |
| LSP: outline, folding, formatting | yes | | |
| LSP: diagnostics, hover, definition | spans only | yes | yes |
| `ux check`, `ux plan`, `ux graph` | | yes | yes |
| `ux run`, `ux watch`, `ux verify` | | | yes |
| Nix module | | | yes |
| `ux converters`, `ux explain` | | | registry only |

Spans are the one thing syntax leaks into the rest: a `Span` is a file and two positions, and Core and Plan carry them as opaque values.

### A serialized Plan

The Plan has a protobuf schema, `ux.plan.v1`, in the same style as TDL's protos (Editions 2024, implicit presence, add fields and never renumber).
It is how anything outside the Haskell process reads a pipeline:

- the Nix module reads it, so evaluation needs neither `ux` nor IFD (see [Nix](#nix));
- tests build Plans directly, as TDL's `backend/internal/irtest` builds models, so runner tests do not depend on the grammar;
- editors and future UIs can render a pipeline without linking ux.

`ux plan --format binary|json|text` prints it.

### Until the language lands

The tools are built against the placeholder grammar, `pipeline name = a -> b -> c`, which already elaborates to a linear Core.
A Plan written by hand in JSON is a second front end: `ux run plan.json` works the same as `ux run billing.ux`.
That keeps the runner, the registry, loss reporting, and the Nix module moving while the grammar changes underneath them.

## Converter registry

The registry answers: which converters exist, what formats they connect, in which direction, and what they may lose.
It is the only place converters are known, so `ux check`, the planner, `ux converters`, and LSP completion agree.

Three kinds of entry:

- **TDL backends.** TDL installs one `tdl-gen-<name>` per backend (`nix/cmd.nix`), and each speaks the plugin protocol. ux speaks it too, through the bindings in `gen/`, and reads each handshake: its name, version, and whether it imports (`Features.reverse`). Forward is `tdl -> <name>`; reverse is `<name> -> tdl`.
- **Declared converters.** A declaration in a ux file or a shared library of them: a signature, a command, an optional Nix package, and the codes it may lose. The language owns the syntax; the registry sees a Core value.
- **Plugin converters.** Any executable speaking TDL's plugin protocol with ux's handshake extensions (see [Open questions](#open-questions)), for a tool that wants positioned, coded diagnostics.

Discovery handshakes every `tdl-gen-*` on `PATH`, which is a process per backend.
The result is cached in `$XDG_CACHE_HOME/ux/registry`, keyed by each executable's resolved path, size, and mtime, so a second `ux check` spawns nothing.
Under Nix the registry is built at build time and shipped beside `ux`, and discovery is off.

### TDL's losses as data

`ux explain lossy.collection` should print what TDL's `reverse.md` table says.
TDL holds the list in `backend/internal/emit/loss.go`; ux needs it as data, from a `tdl losses --format json` or a generated file in `proto/`.
Until then ux vendors the table and a test fails when it drifts.

## CLI

TDL's conventions carry over, so one muscle memory serves both:
files are arguments, `-` is standard input, several files are separated by `==> path <==`, the root command prints a command's error once, and `--allow-lossy` and `--format json` mean what they mean in `tdl`.

| Command | Does |
| --- | --- |
| `ux check [files]` | Parse, elaborate, and plan. Report errors and every step's may-lose codes. Runs nothing. |
| `ux plan [files]` | Print the Plan: each step, its converter, its direction, its may-lose set, and each resolved `~>`. |
| `ux graph [files]` | The Plan as DOT or Mermaid (`--format dot\|mermaid`). |
| `ux run [files] [pipeline...]` | Run pipelines, or the named ones. `--dry-run` prints what would be written. |
| `ux run --watch` | Rerun what a changed source reaches. Keeps TDL plugins alive across runs (`Features.reuse`). |
| `ux verify [files]` | Exit non-zero when a run would change any output; for CI on committed output. |
| `ux fmt [files]` | Print canonical source; `-w` rewrites, `--check` lists non-canonical files. `--expand` rewrites `~>` to the chain it resolved to. |
| `ux converters` | List the registry: name, formats, direction, may-lose, and where it came from. |
| `ux explain <code>` | What a loss code means, which converters may produce it, and where it is silenced. |
| `ux init` | Write a starter pipeline and, with `--nix`, the flake-parts wiring. |
| `ux lsp` | The language server. |
| `ux version` | Built. |

`check` validates; it never runs a converter.
`run` writes only what the Plan names.
Nothing configures what a converter writes from the command line, matching TDL's rule that mapping lives in reviewed files; flags choose what runs and how loudly.

### Exit status

- 0: success, with or without losses.
- 1: an error: a parse or type error, a failed step, or a loss a `deny` forbids.
- 2: usage.

A loss never fails a run unless a policy says so, because loss is expected; it is only ever made visible.

## Loss, made visible

Loss is the property this toolset exists to show, so it appears in every tool, not only in `run`.

**Before running.** `ux check` and `ux plan` print each step's may-lose set and the pipeline's union:

```text
billing.ux:4:3: pipeline billing may lose:
  lossy.collection  tdl -> ts (typescript)      allowed at billing.ux:7:30
  lossy.order       proto -> tdl (protobuf reverse)
```

**While running.** Each did-lose diagnostic names both halves: the step in the pipeline, and the position in the artifact the converter read.

```text
billing.ux:6:9: step proto -> tdl (protobuf reverse)
  proto/billing.proto:12:3: lossy.collection: repeated string tags read as [string]; a Set is not recoverable
```

**After running.** A summary: losses by code and step, and a count of silenced ones.

```text
ux: 3 losses in 2 steps; 5 silenced (--show-silenced to list)
```

Silenced never means unknowable: `--show-silenced` lists them, and `ux explain` says which policy silenced each.

**A loss with no position.** A declared converter reports through its exit status and stderr, which carry no codes, so its may-lose set is reported once per run as "may have lost", attached to the step.
A converter that wants better speaks the plugin protocol.

### Diagnostics

One `Diagnostic` type everywhere: a severity, an optional code, a message, and a chain of spans, outermost first (step, then artifact position).
Renderers:

- `text`: `file:line:col: message`, as TDL prints, with the chain indented.
- `json`: one object per line, for editors and scripts.
- `github`: workflow commands, so a loss annotates the pull request line that caused it.
- `sarif`: for code-scanning dashboards, later.

The LSP publishes the same values, so the terminal and the editor never disagree.

## Running

A step is a function from input artifacts to an output artifact, given a converter and its configuration.
That makes caching and Nix the same idea at two scales.

- **Engine.** Shake, in nixpkgs, which already handles dynamic dependencies, parallelism, and a persistent database. The alternative is a hand-written topological runner, simpler until watch mode and caching arrive.
- **Cache.** Keyed by the converter's identity and version, its configuration, and the hashes of its inputs, in `.ux/` at the project root. A TDL step's IR is cached in binary between steps, so `proto -> tdl -> go` and `proto -> tdl -> ts` parse the protos once.
- **Output ownership.** Like TDL's `.tdl-output`, each output directory gets a `.ux-output` marker listing what ux wrote; ux refuses to overwrite an unlisted file and `--clean` removes only listed ones. When a step is a TDL backend, ux defers to TDL's marker rather than writing a second one.
- **Isolation.** A step sees its inputs in a scratch directory and writes to another; ux moves the result into place only when the step succeeds, so a failed run leaves the tree as it was.

## Nix

Nix is a second runner over the same Plan, not a second language.

**The flake-parts module.** `perSystem.ux`, modelled on TDL's `perSystem.tdl`:

```nix
perSystem.ux = {
  enable = true;
  src = ./.;
  files = [ "pipelines/billing.ux" ];
};
```

It defines:

- `packages.ux-<pipeline>`: the pipeline's outputs, one derivation per step, each with its converter's Nix package on `PATH`;
- `checks.ux-check`: `ux check` over `files`;
- `checks.ux-verify`: the built outputs equal the committed ones;
- `checks.ux-plan`: the committed Plan (below) is current;
- `devShells.ux`: `ux`, every converter the Plans name, and `tdl`, for `inputsFrom`.

**Reading a pipeline without IFD.** Nix cannot parse ux without building ux first, which is import-from-derivation.
So `ux plan --format json > ux.plan.json` is committed, as a lock file is, and the module reads it with `builtins.fromJSON`.
`checks.ux-plan` fails when it is stale, and `ux run` refreshes it.
Nix never sees ux syntax at all, which is the seam doing its job.
A project that accepts IFD can set `ux.ifd = true` and skip the committed file.

**Hermeticity is checked.** A declared converter without a Nix package plans fine and is an evaluation error in the module, naming the converter and the step.

## Language server

`ux lsp`, on the Haskell `lsp` package, structured as TDL's `internal/lsp` is: a snapshot per document holding text, Syntax, Core, Plan, and diagnostics; full text sync; an overlay loader for unsaved imports.

Syntax-blind features, which survive any grammar change:

- **Diagnostics**, from `ux check`.
- **Hover on a step**: the converter it bound to, its direction and version, and its may-lose codes with their meaning.
- **Inlay hints**: each `~>` shows the chain it resolved to; each step shows its may-lose codes, dimmed when silenced.
- **Code lens**: "run this pipeline", "show graph".
- **Go to definition**: a named intermediate, a converter declaration, and for a TDL backend, nothing (it has no source).
- **Completion** of formats and converters from the registry, filtered by the format flowing into the cursor.

Syntax-bound features: outline, folding, and formatting, from Syntax and the printer.

### Highlighting

TDL derives tree-sitter and TextMate grammars from its EBNF (`internal/treesitter`, `internal/textmate`).
ux should do the same once its grammar has a formal form, and not before: a hand-written grammar for a syntax that is still moving is wasted work.
Until then the VS Code extension ships the LSP client and a minimal TextMate grammar for comments, strings, and `->`.
The LSP's semantic tokens fill the gap, since they come from Syntax and need no second grammar.

### Editors

A VS Code extension in `editors/vscode/`, built and installed the way TDL's is (`buildNpmPackage`, `programs.ux.vscode.enable` in a home-manager module).
Neovim and Zed through their LSP clients, as TDL's `editors.md` plans.

## Testing pipelines

`ux test` runs assertions a pipeline file states about itself.
The first is the round trip: a `deny lossy.*` on `tdl -> proto -> tdl` fails when any loss occurs, and a comparison under each format's normalizer (TDL's `reverse.md`) fails when the output differs.
It is a tooling feature with a syntax question attached, so it waits on the language for spelling and is designed here only as a Core constructor: an assertion over a step's input and output.

## What ux needs from TDL

1. **Binary IR out of `tdl`** ([tdl#1025](https://github.com/UnstoppableMango/tdl/issues/1025)). `tdl ir --format json` exists; proto-lens has no maintained protojson reader, so ux wants `--format binary`, or lowering as a plugin-protocol request.
2. **Losses as data** ([tdl#1026](https://github.com/UnstoppableMango/tdl/issues/1026)). `tdl losses --format json`, or the table in a proto.
3. **Shared `[lossy]`** ([tdl#1027](https://github.com/UnstoppableMango/tdl/issues/1027)). ux reads `tdl.toml`'s `[lossy]` table rather than inventing its own, so one silencing applies to `tdl gen` and to a ux step running the same backend.

Each is small and additive on TDL's side, and ux works without all three, more slowly or with a vendored copy.

## Phases

Each phase is usable on the placeholder grammar.

1. **Core and Plan.** `Ux.Core`, `Ux.Plan`, `Ux.Diagnostic`, and `ux.plan.v1`; the placeholder grammar elaborates to Core; `ux plan` prints it.
2. **Registry.** TDL backend discovery over the plugin protocol, the cache, `ux converters`.
3. **Check.** Planning with may-lose sets, policies, `ux check`, `ux explain`, the text and JSON renderers.
4. **Run.** The local runner, output markers, did-lose reporting, the summary, `ux verify`.
5. **Nix.** The flake-parts module, the committed Plan, the checks.
6. **LSP.** Diagnostics and hover first; the rest as the language settles.
7. **Watch.** Plugin reuse and incremental reruns.
8. **Editors and highlighting.** Once the grammar is formal.

## Open questions

- **Is Core the right seam?** If the language grows something a graph of steps cannot say (conditionals, parameters, functions), Core must grow with it. `language.md` leans against general computation, which keeps Core small.
- **Plugin protocol for non-TDL converters.** Reusing TDL's protocol means a non-TDL converter speaks in `ir.Model`, which is wrong for `jsonschema -> html`. ux may need its own handshake mode carrying files in and files out, with diagnostics and loss codes unchanged.
- **Where declared converters live.** In each project, in a shared `ux` library of declarations shipped with the tool, or in nixpkgs-style packages. The registry does not care; distribution does.
- **The committed Plan's churn.** A Plan records converter versions, so a `nix flake update` rewrites it. That is honest, since the pipeline did change, and it is one more file in every diff.
- **Shake or not.** Shake brings a database format and a runtime; a hand-written runner might be enough until watch mode.
- **A `ux.toml`.** Whether ux needs its own manifest, or reads `tdl.toml` and grows a table there, before TDL's project model in its `workflow.md` is built.
