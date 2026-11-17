# Reconcile / grill decisions (settled)

Research-process log. Settled values were **promoted into [`bible/`](../../bible/)**.  
Override: edit this log **and** re-promote into bible — bible wins for implementers.

## Authority (post-promotion)

| Priority | Source | Role |
|----------|--------|------|
| 1 | [`bible/`](../../bible/) | **Canonical** hard truths for code/agents |
| 2 | This folder’s extracts | Provenance snapshots (not live lookup) |
| 3 | Video notes (non-beta) | Secondary evidence when promoting |
| 4 | Beta-flagged video | Do not override wiki-derived bible rows |
| 5 | Product `invented` ([`project_rules.md`](../../project_rules.md)) | Scope / meta — record in bible with `invented` tag |

## Wiki vs video — accept wiki (promoted)

| Topic | Decision | Bible home |
|-------|----------|------------|
| A-wing rank-0 HP | **7** | `bible/units.md` |
| Luke Atk / FP | **3 / 4** | `bible/units.md` |
| Squad Leader (player) | Draw **star** card after battle | `bible/perks.md` |
| Damage | `FP − evasion` per hit; crit/miss exist on wiki | `bible/GAME_BIBLE.md` |
| Personal Shield | **+3** shield | `bible/star-cards.md` |
| Blaster Cannon | 1 dmg × other cards used while holding | `bible/star-cards.md` |
| Infantry/strike numbers | Wiki CSV values | `bible/star-cards.md` |
| Han on-win discard | **2** discard points | `bible/units.md` |
| Stat naming | Canonical **evasion** (video “agility” = alias) | `bible/GAME_BIBLE.md` / DATA_DESIGN |

## Product / engine decisions (recommended defaults)

| Topic | Decision | Tag | Bible home |
|-------|----------|-----|------------|
| Combat crit/miss | Wiki both `observed`. **Class:** crit **20%** (Luck **35%**), no miss; crit does not pierce Protect — see ADR-0003 | invented (product) | `GAME_BIBLE.md` / `docs/adr/0003-…` |
| Client | **Flutter** (`app/`); Swift archived HW9 fallback | invented (product) | ADR-0001 |
| Multiplier / board / cannon | Follow wiki | observed | `GAME_BIBLE.md` |
| Heroes in star deck | Yes; max **1** hero / deck; counts toward 24 | observed | `GAME_BIBLE.md` / `units.md` |
| Starter star-card set | Video “Base available cards” list = `inferred` until confirmed | inferred | `star-cards.md` |
| Shop / CRUD / star pots / no mid-siege save | Product rules | invented (product) | `GAME_BIBLE.md` + project_rules |
| DATA_DESIGN stat | Field renamed to **evasion** (was “defense”) | naming | `DATA_DESIGN.md` / `GAME_BIBLE.md` |
| Ambiguous translations | Keep wiki text + ambiguity note | inferred | `star-cards.md` |

## Grill status

Frontier closed for bible hard-truth promotion using the table above. Re-open if you override any row (then re-promote).
