# User-supplied assets

Wiki + planet art organized here. **Resolve files via [`manifest.json`](manifest.json)** (content/bible ids → paths).  
Do not AI-generate Star Wars art to fill gaps.

```bash
python design/current/assets/organize_assets.py
```

(Converts new `.webp` in the assets root → `.png` and re-sorts `*_starcard|model|perk|gameboard` suffixes.)

## Folders

| Folder | Contents |
|--------|----------|
| [`star_cards/`](star_cards/) | Card faces (`*_starcard.png`) |
| [`units/`](units/) | Models / figurines (`*_model.png`) — briefing + board tokens (incl. villains; no villain star cards needed) |
| [`perks/`](perks/) | Perk icons |
| [`gameboard/`](gameboard/) | Stage, cannon, discard, empty slots, **`exampleboard_gameboard.png`** (Battlefield layout reference) |
| [`logo/`](logo/) | Login title — `battlefront_base_command.png`; currency chip — `credits.png` |
| [`backgrounds/`](backgrounds/) | `endor_background.png`, `hoth_background.png`, `tatooine_background.png` (also siege-list thumbs for now) |
| [`figurines/`](figurines/) | Optional override; otherwise reuse `units/` |

## Naming

- **Filenames** may keep wiki translation quirks (`suppresionfire`, `milleniumfalcon`, …).
- **On-screen text** uses bible/content English names (`Suppressive Fire`, `Millennium Falcon`, …).
- Manifest maps content id → file path.

## Background usage

Planet BGs are shared per siege theme for **Home / briefing / battlefield**. For **briefing frosted panel + Results**, reuse the **same** image and **blur in code**.

## Battlefield

Do **not** wait on PDF frame 07. Compose the screen from stage + cannon + slots + models + HUD shapes, using `gameboard/exampleboard_gameboard.png` as the layout reference. Details: [`../README.md`](../README.md#battlefield-layout-composed--not-pdf-07).

## Siege list thumbs (tomorrow build)

Reuse a planet background (`backgrounds/*`) — no dedicated siege thumbs required.

## Still optional

- Dedicated siege-list thumbs later (planet BGs are enough for now)
