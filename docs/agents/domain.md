# Domain Docs

How the engineering skills should consume this repo's domain documentation when exploring the codebase.

## Before exploring, read these

- **`GLOSSARY.md`** at the repo root
- **`docs/adr/`**: read ADRs that touch the area you're about to work in
- **Game facts:** [`bible/`](../../bible/) — not `research/`
- **Product scope:** [`project_rules.md`](../../project_rules.md), [`PROJECT_SPEC.md`](../../PROJECT_SPEC.md)

If glossary/ADR files don't exist yet for a topic, **proceed silently**. `/domain-modeling` (via `/grill-with-docs`) creates them lazily when terms or decisions get resolved.

## File structure

Single-context repo:

```
/
├── GLOSSARY.md
├── docs/
│   └── adr/
├── bible/
├── app/          ← Flutter product
└── course/archive/SwiftCode/  ← HW9 fallback only
```

## Use the glossary's vocabulary

When your output names a domain concept, use the term as defined in `GLOSSARY.md`. Don't drift to synonyms the glossary explicitly avoids.

## Flag ADR conflicts

If your output contradicts an existing ADR, surface it explicitly rather than silently overriding.
