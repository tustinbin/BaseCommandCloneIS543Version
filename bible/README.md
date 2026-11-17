# Game bible

**Source of truth for numbers, catalogs, and combat tunables.**  
Implementers and agents look up game facts **here only**.  
Product scope: [`../project_rules.md`](../project_rules.md) · Spec: [`../PROJECT_SPEC.md`](../PROJECT_SPEC.md) · Data: [`../DATA_DESIGN.md`](../DATA_DESIGN.md).

## Authority

| Layer | Role |
|-------|------|
| **This folder (`bible/`)** | Canonical hard truths — edit here when changing rules/stats |
| [`../research/`](../research/) | Provenance only (raw dumps + wiki extracts + grill log) |
| [`../project_rules.md`](../project_rules.md) | Product / course scope — not combat number tables |

Evidence may cite research paths. Do **not** open research to resolve a value that already lives in bible.

Grill / reconcile log: [`../research/wiki/DECISIONS.md`](../research/wiki/DECISIONS.md).

## Files

| File | Contents |
|------|----------|
| [`GAME_BIBLE.md`](GAME_BIBLE.md) | Board, hand, turn loop, cannon, combat, scoring |
| [`perks.md`](perks.md) | Perk definitions + unit-shield notes |
| [`star-cards.md`](star-cards.md) | Full star-card catalog + starter flags + shop price stub |
| [`units.md`](units.md) | Player / enemy / hero stats |
| [`sieges.md`](sieges.md) | Campaign name index + demo placeholder (scripts TBD) |

## Confidence tags

| Tag | Meaning |
|-----|---------|
| `observed` | Confirmed from Namu wiki (or verified video) |
| `inferred` | Strong deduction (e.g. starter list) |
| `invented` | Product fill / class simplification |

Do **not** invent damage/HP/prices in app code — edit the bible first, then rebuild [`../content/`](../content/) with `python content/build_from_bible.py`. Leave TBD rows until observed or explicitly invented in bible.
