# Star Wars Battlefront Base Command Clone — Project Spec

IS543 Project 2 · Option B  
Produced via grill-me → to-spec (Cursor / Matt Pocock skills)  
Test seams agreed: `SiegeEngine`, `ProgressionService` (deck rules on the profile/deck store)

---

## Problem Statement

A mobile player wants a short, turn-based base-defense session with meaningful deck strategy—the kind of experience Base Command delivered—but that companion game is gone. They need to defend a central base on a radial board, customize a Star Card deck, earn progress, unlock cards, and compete asynchronously on scores. For the course, the same product must also demonstrate hosted end-to-end CRUD and a public backend—not a localhost-only toy.

## Solution

A SwiftUI iOS app, **Star Wars Battlefront Base Command Clone**, backed by **Firebase Spark** (Auth + Firestore). Players sign up with a Commander name, build and manage custom 24-card Star Card decks (CRUD), play scripted single-player sieges on a 4×4 radial board, earn first-time star rewards, unlock cards in a shop, and appear on per-siege leaderboards. Star Wars theming is used for class; content is data-driven so the product can rebrand after the course. Balance numbers live in a game bible for easy tuning.

---

## User Stories

1. As a new player, I want to create an account with email/password and a Commander name, so that my progress is saved and the game can address me as Commander [Name].
2. As a returning player, I want to sign in, so that I can continue with my decks, currency, and unlocks.
3. As a player, I want my progress stored on a hosted backend, so that it is not lost when I switch devices or reinstall.
4. As a player, I want to browse a catalog of defined Star Cards, so that I understand what I can put in decks or buy later.
5. As a player, I want to create a named Star Card deck, so that I can try different strategies.
6. As a player, I want to add and remove Star Cards and change quantities in a deck, so that I can customize my 24-card list.
7. As a player, I want to save a deck with fewer than 24 cards as a draft, so that I can finish building later.
8. As a player, I want the app to enforce per-card copy limits (e.g. heroes max 1, commons higher), so that decks stay balanced.
9. As a player, I want to only add Star Cards I own, so that unlocks and the shop matter.
10. As a player, I want to rename a deck, so that I can organize loadouts.
11. As a player, I want to delete a deck I no longer use, so that my list stays clean.
12. As a player, I want to set an active deck, so that sieges use the loadout I intend.
13. As a player, I want to see how many decks I have out of a maximum of 10, so that I know when to delete old ones.
14. As a player, I want to start a siege only when my active deck has exactly 24 cards, so that runs are always legal.
15. As a player, I want to be told if my active deck was deleted and I must pick another, so that I am not blocked without explanation.
16. As a player, I want a short pregame dialogue that calls me Commander [Name], so that the fantasy feels personal.
17. As a player, I want to play on a board with 4 quadrants × 4 rings and a central base, so that positioning and range matter.
18. As a player, I want each turn to draw 3 Unit cards and 3 Star Cards, so that I have the classic Base Command hand.
19. As a player, I want Unit cards to come from a fixed pool (not a second deck builder), so that customization stays focused on Star Cards.
20. As a player, I want units that survive combat to keep a rank-up if redrawn later in that siege, so that good play is rewarded mid-run.
21. As a player, I want units that die to reset to base rank when redrawn in that siege, so that losses have consequences.
22. As a player, I want unit rank-ups to reset between sieges, so that each run starts fair.
23. As a player, I want Star Cards from my active deck to shuffle and draw into my hand, so that deckbuilding affects play.
24. As a player, I want enemy placements and behavior to follow a known script for that siege, so that outcomes depend on my strategy—not unfair RNG.
25. As a player, I want the only randomness to be deck shuffle and draw, so that I can plan around known enemy turns.
26. As a player, I want a Base Cannon that charges over turns and deals damage (and can strip Protected), so that I have a base-level tactical resource.
27. As a player, I want enemies to advance toward the base at end of turn, so that there is time pressure.
28. As a player, I want to win by destroying all enemies before the base falls, so that the objective is clear.
29. As a player, I want to lose when base HP reaches 0, so that defense matters.
30. As a player, I want a results screen with score and stars (1–3), so that I know how well I did.
31. As a player, I want each mission to have fixed point pots per star, so that rewards are predictable.
32. As a player, I want to receive a star’s points only the first time I earn that star on that mission, so that I am pushed to improve and then progress.
33. As a player, I want improving from 1★ to 3★ to grant the not-yet-claimed 2★ and 3★ pots, so that retries before a full clear still pay.
34. As a player, I want re-earning a star I already claimed to give 0 currency, so that I cannot infinite-farm one mission after 3★.
35. As a player, I want a shop where I spend currency to unlock Star Cards, so that progression expands my deck options.
36. As a player, I want unlocks to mean ownership for deckbuilding (not buying one physical copy at a time), so that the shop stays simple.
37. As a player, I want a starter set of unlocked cards and 0 starting currency, so that I can build a legal deck immediately and earn the rest.
38. As a developer/demoer, I want to grant currency for playtests and demos, so that the shop can be shown without a long grind.
39. As a player, I want at least one tutorial/scripted siege for the class demo, with the option to add more sieges later, so that the loop is playable and expandable.
40. As a player, I want each siege to have its own leaderboard, so that scores are compared fairly per mission.
41. As a player, I want my best score on a siege submitted automatically when I finish, so that I do not manage uploads.
42. As a player, I want the leaderboard to show Commander name, score, and stars—not my email, so that my identity stays presentation-friendly.
43. As a grader, I want a demo account documented in the README, so that I can review the app without friction.
44. As a grader, I want full deck CRUD against a live backend from the simulator, so that Option B hosting is obvious.
45. As a future maintainer, I want Star Wars strings and art keys in content data, so that post-class rebrand does not rewrite game logic.
46. As a designer, I want all balance numbers in a game bible, so that tuning does not require hunting through code.
47. As a player, I want mid-siege progress not to be saved for MVP, so that quit/abandon simply yields no reward and a fresh restart.
48. As a player, I want schematic board UI that clearly shows zones and the base, so that I can learn geometry without needing EA-quality art.
49. As a course student, I want a written spec, storyboard, and data design for HW8, so that planning is graded before full implementation.
50. As a player, I want combat to follow documented structure (HP, firepower, defense, attacks, ring/quadrant targeting, Protected) even if exact numbers are approximate, so that the game feels like Base Command.

---

## Implementation Decisions

### Product & platform
- Class product name: **Star Wars Battlefront Base Command Clone**; rebrand after class.
- Client: **SwiftUI** (iOS Simulator / device); Mac used for demo builds.
- Backend: **Firebase Spark** — Authentication + Firestore; app talks to the **live** backend.
- Gameplay: **single-player only**; async **per-siege leaderboards** on Firebase.

### Architecture modules
- **SiegeEngine** (pure Swift): turn loop, board state, combat, cannon, draws, win/lose, score/stars for a run. No Firebase.
- **ProgressionService** (protocol + Firestore implementation + in-memory fake): currency, first-time star claims, shop unlocks, siege result persistence, leaderboard upserts.
- **Deck / profile store** (same progression boundary): deck CRUD, active deck, ownership checks, copy limits, max 10 decks, “legal for siege” (= 24 cards).
- **SwiftUI app shell**: Auth, Home, Deck List/Editor, Catalog, Shop, Siege Select, Battlefield, Results, Leaderboard, light pregame dialogue.
- **Content / bible**: static Star Card catalog, unit types, siege scripts, star pots, copy limits, combat tunables — single bible source of truth for numbers.

### Domain rules (locked)
- Primary CRUD entity: **custom Star Card decks** (not card authoring, not unit decks).
- Deck size for play: **24** Star Cards (sum of quantities); drafts may be &lt; 24.
- Units: fixed pool; in-siege rank-up until death then base rank; no permanent unit XP.
- Enemies: **scripted/deterministic** per siege; RNG only from shuffle/draw.
- Board: 4×4 zones + central base; cannon charges per turn.
- Shop: purchase **unlocks** card for account; deck enforces per-card max copies (heroes often 1; generics/AoE higher).
- Rewards: fixed points per star per mission; **each star pays once** (first time earned); improving stars grants only unclaimed pots.
- Demo: may ship **one** siege with boosted pots and/or manual currency; more sieges are stretch toward real progression.
- Auth required for decks and play; Commander name collected at signup.
- No mid-siege save for class MVP.

### Data (Firestore-oriented)
- User profile: uid, commanderName, currency, ownedStarCardIds, activeDeckId, claimedStarsBySiegeId.
- Deck: id, userId, name, updatedAt, entries[{ starCardId, quantity }].
- SiegeResult / leaderboard entry: siegeId, userId, commanderName, bestScore, bestStars, updatedAt.
- Catalog and siege scripts may ship as local content JSON seeded from the bible; not player-editable.

### Hosting / course
- README: how to run, Firebase config placeholders, demo account placeholders, never commit real secrets.
- Presentation: show deck CRUD, shop/currency, one siege, leaderboard.

---

## Testing Decisions

### What makes a good test
- Test **external behavior** at agreed seams only: given inputs → observable outputs.
- Do **not** test SwiftUI layout, Firebase SDK wiring, or private helpers as the primary suite.
- Prefer deterministic fixtures (fixed siege script, fixed deck, scripted action sequences).

### Modules under test
1. **SiegeEngine** — win/lose, star thresholds, cannon/Protected interactions, rank-up/reset, draw counts, scripted enemy advance.
2. **ProgressionService** (in-memory fake) — first-time star pots, no double-pay, shop unlock + deck ownership, leaderboard best-score upsert, deck validation (24, copy limits, max 10, owned-only).

### Prior art
- Greenfield repo: no existing test suite. Establish seam tests first when implementation begins.

---

## Out of Scope

- Recipe Catalog (Option A)
- Player-authored custom Star Card definitions / effect scripting UI
- Unit-deck CRUD or permanent unit unlock trees
- Full 50+ siege campaign for class MVP (extra sieges are stretch)
- Mid-siege save/resume
- PvP, co-op, friends lists, seasons
- Real-money IAP / Stripe (class notes only; post-class possible)
- AI-generated content / local LLM endpoints (class notes only)
- Pixel-perfect EA art recreation; App Store release as a class requirement
- Post-class rebrand execution (design for it, don’t ship it now)

---

## Further Notes

- Rules baseline: [`research/base-command-research.md`](research/base-command-research.md); invent numbers only when undocumented and record them in [`bible/`](bible/) with confidence tags (+ [`research/video-log.md`](research/video-log.md)).
- Aspiration: restore every research-recoverable Star Card with defined effects over time; class may ship a smaller fully playable subset first (~12–20) and grow.
- HW8 deliverable: [`course/HW8_BaseCommand_Submission.pdf`](course/HW8_BaseCommand_Submission.pdf) (IDE notes + storyboard placeholder + this spec + data design / ERD).
- Living constraints: [`project_rules.md`](project_rules.md). Doc index: [`README.md`](README.md).
- Visual: HW8 mockup is placeholder only ([`design/hw8-placeholder/`](design/hw8-placeholder/)); product UI follows your design in [`design/current/`](design/current/).
