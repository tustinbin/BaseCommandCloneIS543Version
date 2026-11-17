# Compiled game content

JSON compiled from [`../bible/`](../bible/). **Edit the bible, then rebuild** — do not hand-edit these files as the long-term source of truth.

```bash
python content/build_from_bible.py
```

| File | Use |
|------|-----|
| [`manifest.json`](manifest.json) | Index of content files |
| [`tunables.json`](tunables.json) | Board, hand, base/cannon, combat RNG, scoring |
| [`perks.json`](perks.json) | Perk definitions + Luck crit chance |
| [`units.json`](units.json) | Player/enemy/hero stats |
| [`star_cards.json`](star_cards.json) | Catalog, `ownedAtSignup`, `defaultStarterDeck`, ambiguity flags |
| [`sieges.json`](sieges.json) | `siege_01` thresholds, pots, spawn script |

Flutter: bundle this folder as assets (e.g. copy or path in `pubspec.yaml` once `app/` is scaffolded). `ProgressionService` should read `ownedAtSignup` + `defaultStarterDeck`; `SiegeEngine` should read units/perks/sieges/tunables + starter card effects from catalog.
