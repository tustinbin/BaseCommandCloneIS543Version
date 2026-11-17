# Base Command Clone — Project Rules

Living source of truth. See [`README.md`](README.md) for the doc index.

## Project identity

- **Course:** IS543 Project 2 — **Option B** (not Recipe Catalog)
- **Class name:** Star Wars Battlefront Base Command Clone
- **Post-class:** Rebrand/retheme; keep content data-driven (`themeKey` / JSON); target **iOS + Android**
- **Client:** **Flutter** in [`app/`](app/) · **Backend:** Firebase Spark (Auth + Firestore) · live backend from device/simulator
- **HW9 fallback:** Archived SwiftUI shell at [`course/archive/SwiftCode/`](course/archive/SwiftCode/) if Flutter isn’t demoable by Wed night
- **Orientation:** Landscape for hub + siege play
- **Art direction:** **Your** visual design in [`design/current/`](design/current/). [`design/hw8-placeholder/`](design/hw8-placeholder/) is HW8-only. Original game photos in [`research/reference_photos/`](research/reference_photos/) for board/companion feel only — career/stats screens are Battlefront companion, not our systems.
- **Hub:** After login → Siege Home; swipe left Shop; swipe right Decks
- **Game facts authority:** [`bible/`](bible/) only. Research = provenance. Grill/ADRs: [`research/wiki/DECISIONS.md`](research/wiki/DECISIONS.md), [`docs/adr/`](docs/adr/), [`GLOSSARY.md`](GLOSSARY.md)
- **Spec:** [`PROJECT_SPEC.md`](PROJECT_SPEC.md)
- **Data design:** [`DATA_DESIGN.md`](DATA_DESIGN.md) / [`course/erd.png`](course/erd.png)

## Primary CRUD

- **Custom Star Card decks** (create / read / update / delete)
- Static card catalog — **no** player card-authoring CRUD
- Units = fixed pool (no unit-deck CRUD)
- Heroes live in the **star** deck; **max 1 hero per deck**
- Drafts &lt; 24 OK; **Start Siege** needs active deck with exactly **24** cards
- Max **10** private decks; per-card **copy limits** from [`bible/star-cards.md`](bible/star-cards.md)
- Auth required; Commander name at signup (not email on leaderboards)
- Signup: **default 24-card deck** = max legal copies of all **starter** cards (sums to 24)

## Meta loop

- Shop: show **full catalog**; **starters owned**; others **locked** (browse-only until currency spend ships)
- Starter unlock set; **0** starting currency (demo/playtest grants OK later)
- Mission **star pots** stay in the model (first-time pay per star); placeholder amounts in bible; spend flow later
- Demo may use **one** easy siege; more sieges = stretch

## Siege / combat

- Schematic **4×4 + central base**; cannon charges 1→3→5; ignores evasion
- Damage: `FP − evasion`. **Crit 20%** (Luck **35%**): ignores evasion, dmg = FP; does **not** pierce Protect. **No miss** RNG
- Scripted deterministic enemies; shuffle/draw + crit RNG
- Engine: implement **starter** card effects first; keep registration easy to extend
- In-siege rank-up on **kill**; death resets; no cross-siege unit XP
- No mid-siege save (quit = no reward)
- Test seams: **SiegeEngine** + **ProgressionService** (platform-neutral; Dart-first)

## Social

- Single-player gameplay only
- **Per-siege** leaderboard; auto-submit best score; display Commander name
- Pregame: address as `Commander [Name]`

## Scope

| Phase | Focus |
|-------|--------|
| **HW8** | Spec, storyboard placeholder, ERD, IDE notes → UI shell (done; Swift archived) |
| **Schedule** | [`ROADMAP.md`](ROADMAP.md) — HW9 Flutter shell; Week 2 Firebase + engine; Weeks 3–4 playable loop + demo |
| **Dec 8** | Auth, deck CRUD, shop (locks), profile, ≥1 siege, leaderboard |
| **Out** | AI, Stripe, PvP, full 50-siege campaign as required bar, App Store mandate for class |

## Class notes

See [`course/class_notes.txt`](course/class_notes.txt) — instructor options, not requirements.
