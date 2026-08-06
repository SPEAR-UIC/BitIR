# GPU_FI Coding Rules

These rules apply to all code and documentation changes in this repository.

## No Legacy Support

Nothing in this repository is legacy unless the user explicitly says it is.
Do not preserve old behavior, old paths, old names, or previous-commit contracts
by adding compatibility layers.

Do not add:

- compatibility shims
- deprecated aliases
- fallback code paths for removed behavior
- adapters for old interfaces
- duplicate old/new command entry points
- migration helpers unless the user explicitly asks for a migration

When a workflow changes, update callers and documentation to the new workflow and
remove the old path.

## No Unnecessary Wrappers

Do not create wrappers, facades, adapters, proxies, helper layers, or forwarding
functions unless they materially reduce duplication or isolate an external
boundary.

Allowed boundaries are narrow and concrete:

- scheduler script generation
- subprocess execution of external compiler/runtime tools
- parsing shared by two or more real callers
- backend-specific commands that must remain in YAML

If a function only calls another function with renamed arguments, delete it and
call the target directly.

## Symbol Discipline

Create the fewest symbols needed to keep the code readable.

Before adding a variable, function, class, file, or module, ask whether the logic
can be clearer inline. Prefer short, domain-specific names over generic names
such as `manager`, `handler`, `adapter`, `wrapper`, `processor`, or `helper`.

Rules:

- No classes unless state or polymorphism is genuinely required.
- No new module for fewer than two real shared concepts.
- No one-line forwarding functions.
- No duplicate names for the same concept.
- Remove obsolete symbols in the same change that makes them obsolete.
- Keep command paths singular; do not keep old aliases.

## Repository Structure

Keep `bitir/` user-facing and campaign-runtime focused. Put development tools,
review inventories, experiments, notes, and research analysis under `dev/`.
Do not add research results, one-off inspection scripts, or draft manifests to
runtime directories.

## Refactor Preference

When simplifying, prefer deleting code over preserving every edge case. A small
loss of old functionality is acceptable if the resulting workflow is clearer,
more direct, and easier to maintain.
