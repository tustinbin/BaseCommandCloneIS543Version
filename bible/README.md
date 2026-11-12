# Game bible

**Source of truth for numbers, catalogs, and combat tunables.**  
Product scope stays in [`../project_rules.md`](../project_rules.md) and [`../PROJECT_SPEC.md`](../PROJECT_SPEC.md). Persistence shape stays in [`../DATA_DESIGN.md`](../DATA_DESIGN.md).

Research dump (prose, not stats): [`../research/base-command-research.md`](../research/base-command-research.md)  
Evidence log (fill while watching videos): [`../research/video-log.md`](../research/video-log.md)

## Files

| File | Contents |
|------|----------|
| [`GAME_BIBLE.md`](GAME_BIBLE.md) | Board, hand, turn loop, cannon, scoring, combat tunables |
| [`star-cards.md`](star-cards.md) | Star Card catalog (effects, copy limits, shop) |
| [`units.md`](units.md) | Player + enemy unit stats / ranges / perks |
| [`sieges.md`](sieges.md) | Siege scripts, star thresholds & pots (demo first) |

## Confidence rules

Every numeric or effect claim must be tagged:

| Tag | Meaning |
|-----|---------|
| `observed` | Seen in video/screenshot/official text — cite evidence in `research/video-log.md` |
| `inferred` | Strong deduction from observed behavior; not a direct reading |
| `invented` | Fill gap for playability; **must** be marked invented |

Do **not** invent damage/HP/prices in Swift. Put them here first; later export to `SwiftCode/.../Content/*.json`.

## Class MVP vs aspiration

- **Aspiration:** recover every research-backed card/unit/siege over time  
- **Class MVP:** playable subset (~12–20 Star Cards, ≥1 siege) is enough  
- Prefer shipping a small **fully defined** set over a large half-empty catalog

## Workflow

1. Watch Base Command footage → add rows to `research/video-log.md`  
2. Promote confirmed facts into the matching bible file with `observed` + log id  
3. Only then use `invented` for gaps needed to play  
4. When content is stable, compile JSON for the engine (later)
