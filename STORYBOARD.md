# Storyboard — Star Wars Battlefront Base Command Clone

**Orientation:** Landscape (iPhone / iPad)  
**Art direction:** Clean white EA companion style (see `reference_photos/`). Gameplay board = cream/white radial disc + gold ring lines over scenic BG. Menu chrome = white/light gray, black type, gold accents.  
**Note:** Many reference shots are Battlefront companion career/stats — visual language only, not Base Command deck data.

**Canonical visual:** [`Base Command Visual Mockup.pdf`](Base%20Command%20Visual%20Mockup.pdf) (Figma geometric landscape UI).

See also [`MOCKS.md`](MOCKS.md) (ASCII wireframes + Figma prompt). Older `vis-storyboard-flow.jpg` is superseded.

---

## Flow

```text
[1 Auth]
    │
    ▼
[2 Siege Home] ←swipe→ [3 Shop]
       │         ←swipe→ [4 Decs]
       │
       ├─ All Sieges ──► [5 Siege Select] ──► [6 Leaderboard modal]
       │
       └─ Start ──► [7 Battlefield] ──► [8 Results] ──► back to [2]
```

| # | Screen | Purpose |
|---|--------|---------|
| 1 | **Auth** | Sign in / create account + Commander name |
| 2 | **Siege Home** (hub center) | Last-played siege, 0–3★, Start, All Sieges, Leaderboard |
| 3 | **Shop** (swipe left) | Spend credits to unlock Star Cards |
| 4 | **Decks** (swipe right) | Deck CRUD list → editor |
| 5 | **All Sieges** | Pick level (demo: one unlocked; rest locked/campaign later) |
| 6 | **Leaderboard** | Modal popup; per-siege top scores via hosted API |
| 7 | **Battlefield** | White radial 4×4 + base, hand, cannon, End Turn |
| 8 | **Results** | Stars, score, first-time star pots |

---

## Hub pager (agreed)

- After login → **Siege Home**
- Swipe **left** → Shop  
- Swipe **right** → Decs  
- Optional: small Shop/Decks affordances + page dots for discoverability  
- Show **Active deck** status near Start on Siege Home  

---

## Reference usage

| Folder photos | Use for |
|---------------|---------|
| Gameplay board shots (`BaseCommand.webp`, Hoth/Endor/Sullust sieges) | Battlefield layout, white disc, HUD, cards, End Turn |
| Companion menus (`battlefront-companion.webp`) | Clean white menus, gold accents, card hands / shop-like lists |
| Career / cover / blaster screens | **Ignore as game systems** — Battlefront companion, not our CRUD |

---

## HW8 PDF

Export the storyboard flow image + this table into the submission PDF with the spec and ERD.
