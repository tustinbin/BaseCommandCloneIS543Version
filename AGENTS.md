# Agent guide — Base Command clone

IS543 Option B · **Flutter** + Firebase Spark. Prefer short pointers; load bodies only when needed.

## Where to look

| Need | Open |
|------|------|
| Game rules, stats, catalogs | [`bible/`](bible/) → compiled [`content/`](content/) JSON |
| Content rebuild | `python content/build_from_bible.py` |
| Product constraints | [`project_rules.md`](project_rules.md) |
| Spec / seams | [`PROJECT_SPEC.md`](PROJECT_SPEC.md) |
| ADRs | [`docs/adr/`](docs/adr/) |
| Vocabulary | [`GLOSSARY.md`](GLOSSARY.md) |
| Flutter app | [`app/`](app/) |
| Swift HW9 fallback | [`course/archive/SwiftCode/`](course/archive/SwiftCode/) |
| Provenance (not lookup) | [`research/wiki/`](research/wiki/), archive, raw dump |

Do **not** invent HP/damage/prices in app code — edit the bible first.

## Test seams

- **`SiegeEngine`** — pure siege run (no Firebase)
- **`ProgressionService`** — currency, claims, unlocks, decks, leaderboard

## Agent skills

### Issue tracker

Local markdown under `.scratch/` (gitignored). See [`docs/agents/issue-tracker.md`](docs/agents/issue-tracker.md).

### Triage labels

Defaults in [`docs/agents/triage-labels.md`](docs/agents/triage-labels.md).

### Domain docs

[`GLOSSARY.md`](GLOSSARY.md) + [`docs/adr/`](docs/adr/). See [`docs/agents/domain.md`](docs/agents/domain.md).
