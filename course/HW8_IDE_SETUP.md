# Setup on an Agentic AI IDE (Cursor)

IS543 HW8 · Star Wars Battlefront Base Command Clone (Option B)

## Tooling

- **IDE:** Cursor (agentic AI coding environment)
- **Client target (HW8):** SwiftUI iOS — archived at `course/archive/SwiftCode/`. **Product:** Flutter `app/`.
- **Backend plan:** Firebase Spark (Auth + Firestore) — wired later; not required for this design packet
- **Design:** Figma → exported storyboard PDF (`design/hw8-placeholder/Base Command Visual Mockup.pdf`)

## What we used agents / skills for

1. **Research baseline** — early ChatGPT dump (now archived under `research/archive/`); **superseded** by `bible/` + `research/wiki/` for all game facts
2. **grill-me-docs** (Matt Pocock / Cursor skills) — stress-tested scope: Option B CRUD (decks), shop unlocks, first-time star pots, landscape hub, Commander name on leaderboards, no mid-siege save
3. **to-spec** — folded grilled decisions into `PROJECT_SPEC.md` (problem, stories, architecture seams, testing, out-of-scope)
4. **Living rules** — `project_rules.md` as the short constraints file agents and humans both read
5. **Data design** — `DATA_DESIGN.md` + `course/erd.png` after grill (OwnedCard, SiegeStarClaim, per-siege leaderboard)
6. **UI shell** — barebones landscape SwiftUI (now archived at `course/archive/SwiftCode/`) matching the HW8 placeholder storyboard (visual only for HW8). Product path is Flutter `app/`.

## Repo layout (design package)

| Artifact | Path |
|----------|------|
| Spec | `PROJECT_SPEC.md` |
| Storyboard | `design/hw8-placeholder/Base Command Visual Mockup.pdf` |
| Data design | `DATA_DESIGN.md`, `course/erd.png` |
| Rules | `project_rules.md` |
| UI start (HW8) | `course/archive/SwiftCode/BaseCommand.xcodeproj` |

## How to open the UI checkpoint

1. Open `course/archive/SwiftCode/BaseCommand.xcodeproj` in Xcode (HW8 artifact; product is Flutter `app/`)
2. Run **BaseCommand** on an iPhone simulator  
3. Rotate to **landscape** (orientation locked to landscape in Info.plist)

## Notes for graders

This PDF is the HW8 design deliverable: IDE setup, storyboard, grilled → to-spec project spec, and data design / ERD. Implementation continues after HW8 (Auth, deck CRUD, shop, siege engine, leaderboards).
