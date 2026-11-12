# Base Command Clone — Project Rules

Living source of truth. Canonical graded spec: [`PROJECT_SPEC.md`](PROJECT_SPEC.md) (grill → to-spec).

## Project identity

- **Course:** IS543 Project 2 — **Option B** (not Recipe Catalog)
- **Class name:** Star Wars Battlefront Base Command Clone
- **Post-class:** Rebrand/retheme; keep content data-driven (`themeKey` / JSON)
- **Client:** SwiftUI · **Backend:** Firebase Spark (Auth + Firestore) · live backend from simulator
- **Orientation:** Landscape for hub + siege play
- **Art direction:** Clean white companion UI + cream/white radial board (see `reference_photos/`). Companion career/stats screens = visual reference only, not our systems.
- **Hub:** After login → Siege Home; swipe left Shop; swipe right Decs
- **Rules baseline:** `basecommandchatresponse/` research; invented numbers only in the **game bible**
- **Storyboard:** `STORYBOARD.md` + Figma-style flow images in Cursor `assets/`

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
- Cannot farm a mission after claiming all its star pots (typically after 3★ path)
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
| **HW8** | Spec, storyboard, ERD, IDE notes PDF → then UI code same night |
| **Dec 8** | Auth, deck CRUD, shop, profile, ≥1 siege, leaderboard |
| **Out** | AI, Stripe, PvP, full 50-siege campaign as required bar, App Store mandate |

## Class notes (options, not requirements)

See `class_notes.txt`: `/grill me`, `/to-spec`, `/issues`; hosting options; simulator→live API; Gemma/EC2 AI, Terraform, PWA, Stripe — ignored for class MVP unless we explicitly pull them in.
