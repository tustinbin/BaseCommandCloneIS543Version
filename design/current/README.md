# Product UI (current)

**Source mockup:** [`Base Command Real UI (1).pdf`](Base%20Command%20Real%20UI%20(1).pdf)  
**HW8 AI placeholder (not product):** [`../hw8-placeholder/`](../hw8-placeholder/)  
**User-supplied art:** [`assets/`](assets/)

## Screen map (PDF page 1)

| # | Screen | Notes |
|---|--------|--------|
| 01 | Login / Register | Centered logo + form |
| 02 | Home | Full-bleed left art; right actions (Start Siege, All Sieges, Leaderboard) |
| 03 | Star Card Shop | Catalog tiles; largely card images |
| 04 | Decks | Deck list + Edit / New / Shop |
| 05 | Deck editor | Card faces + quantities; Save |
| 06 | Sieges | Mission list + Start |
| 07 | Battlefield | **Composed from assets** — do not use blank PDF frame; see below |
| 08 | Results | Victory / score / stars; Quit, Restart, Next |
| 09 | Leaderboard | Rows with image slot + Commander / score / stars |

## Pre-level briefing (PDF page 2 — not a hub screen)

Flow:

**Sieges (or Home) → Start Siege → Briefing → Battlefield**

Briefing shows mission title/blurb, star pots, enemy figurines, and a full-bleed environment. It is **not** one of the nine hub frames.

## Battlefield layout (composed — not PDF 07)

**Layout reference:** [`assets/gameboard/exampleboard_gameboard.png`](assets/gameboard/exampleboard_gameboard.png)  
**Display names:** bible/content English `name` fields. **Art paths:** wiki filenames via [`assets/manifest.json`](assets/manifest.json).

| Region | Build with |
|--------|------------|
| Full-bleed BG | Planet `backgrounds/*` (same family as briefing; may soft-blur) |
| Center board | `gameboard/stage_gameboard.png` |
| Center piece | `gameboard/cannon_gameboard.png` |
| Ring tokens | `units/*_model.png` figurines on sectors/ranges |
| Left hand | 3× star slots — card art or `empty_star_card_slot` |
| Right hand | 3× unit slots — unit card art or `empty_unit_slot` |
| Top HUD | Shapes/text: MENU, score/stars/multiplier, base HP, enemies left |
| Bottom bar | Shapes/text: selected unit name + Atk/FP/Eva/HP/Shield; `discard_popup` when discarding |
| Overlays | Discard / target affordances as shapes + supplied icons |

Flutter implements this in ticket **08** (Battlefield UI), not by recreating the empty PDF frame.

## Shape vs image rules

**Never** AI-generate Star Wars art, logos, card faces, figurines, or photo backgrounds.

| Element | Source |
|---------|--------|
| Star Card faces (shop, deck editor, anywhere a card shows) | You supply → `assets/star_cards/` |
| Unit card art / battlefield tokens | You supply → `assets/units/` |
| Pre-level enemy figurines | You supply → `assets/figurines/` |
| Home / briefing / results / siege-thumb backgrounds | You supply → `assets/backgrounds/` |
| Results background | Your photo; **blur in code** (no AI image gen) |
| Login Battlefront / title logo | You supply → `assets/logo/` (landed) |
| Credits / currency chip | `assets/logo/credits.png` (transparent) |
| Planet backgrounds (Endor / Hoth / Tatooine) | You supply → `assets/backgrounds/`; blur same file for briefing/results; siege list reuses these for now |
| Base cannon | `assets/gameboard/cannon_gameboard.png` (was `base_gameboard`) |
| Buttons, pills, forms, lists, frosted panels, table chrome | Shapes + text only |
| Empty slots | `gameboard/empty*slot*` at 220×320 (or geometric until then) |

Shop is largely images. Decks / sieges / leaderboard / deck-editor **chrome** may be geometric; **card faces** still use your PNGs. See [`assets/README.md`](assets/README.md) + [`assets/manifest.json`](assets/manifest.json).
