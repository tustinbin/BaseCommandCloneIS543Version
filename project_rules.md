# Base Command Clone — Project Rules

Living source of truth. See [`README.md`](README.md) for the doc index.

## Project identity

- **Course:** IS543 Project 2 — **Option B** (not Recipe Catalog)
- **Class name:** Star Wars Battlefront Base Command Clone
- **Post-class:** Rebrand/retheme; keep content data-driven (`themeKey` / JSON)
- **Client:** SwiftUI · **Backend:** Firebase Spark (Auth + Firestore) · live backend from simulator
- **Orientation:** Landscape for hub + siege play
- **Art direction:** **Your** visual design in [`design/current/`](design/current/). [`design/hw8-placeholder/`](design/hw8-placeholder/) is HW8-only. Original game photos in [`research/reference_photos/`](research/reference_photos/) for board/companion feel only — career/stats screens are Battlefront companion, not our systems.
- **Hub:** After login → Siege Home; swipe left Shop; swipe right Decs
- **Rules baseline:** [`research/base-command-research.md`](research/base-command-research.md); numbers live in [`bible/`](bible/) (`observed` / `inferred` / `invented` + [`research/video-log.md`](research/video-log.md))
- **Spec:** [`PROJECT_SPEC.md`](PROJECT_SPEC.md)
- **Data design:** [`DATA_DESIGN.md`](DATA_DESIGN.md) / [`course/erd.png`](course/erd.png)

## Primary CRUD

- **Custom Star Card decks** (create / read / update / delete)
- Static card catalog — **no** player card-authoring CRUD
- Units = fixed pool (no unit-deck CRUD)
- Drafts &lt; 24 OK; **Start Siege** needs active deck with exactly **24** cards
- Max **10** private decks; per-card **copy limits** (heroes often 1; generics/AoE higher)
- Auth required; Commander name at signup (not email on leaderboards)

## Meta loop

- Shop: spend currency to **unlock** Star Cards (ownership)
- Starter unlock set; **0** starting currency (demo/playtest grants OK)
- Mission **fixed point pots per star**; each star pays **once** (first time earned)
- Demo may use **one** siege with boosted pots; more sieges = stretch / real progression

## Siege / combat

- Schematic **4×4 + central base**; cannon charges per turn
- Scripted deterministic enemies; RNG = shuffle/draw only
- In-siege unit rank-up until death → reset; no cross-siege unit XP
- No mid-siege save (quit = no reward)
- Test seams: **SiegeEngine** + **ProgressionService**

## Social

- Single-player gameplay only
- **Per-siege** leaderboard; auto-submit best score; display Commander name
- Pregame: address as `Commander [Name]`

## Scope

| Phase | Focus |
|-------|--------|
| **HW8** | Spec, storyboard placeholder, ERD, IDE notes → UI shell (done) |
| **Now** | Bible evidence pass + your visual design; freeze mockup-chasing |
| **Dec 8** | Auth, deck CRUD, shop, profile, ≥1 siege, leaderboard |
| **Out** | AI, Stripe, PvP, full 50-siege campaign as required bar, App Store mandate |

## Class notes

See [`course/class_notes.txt`](course/class_notes.txt) — instructor options, not requirements.
