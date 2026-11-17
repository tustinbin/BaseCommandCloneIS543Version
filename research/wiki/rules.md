# Wiki extract — Core rules

Source: Namu wiki dump in Base Command Video Notes MD (§2). Confidence: `observed` (wiki).

## Board

| Fact | Value |
|------|-------|
| Shape | Disk / board; base at center |
| Range | 1–4 from center; range 0 = base |
| Sectors | 4 (quadrants); enemies stay in sector except some heroes |
| Coordinate | One range × one sector cell; **max 2 units** per coordinate; 16 cells total |
| Spawn | Outer edge (range 4) unless concealment → range 2 |
| Advance | One space toward center per turn (unless speed acceleration / hero moves) |

## Base

| Fact | Value |
|------|-------|
| Base HP | **10** (no auto-regen unless card) |
| End score | Remaining HP and shields affect score |
| Enemy at range 0 | Damages base by unit **firepower**, then disappears |
| Shields | **4** directional; attack at range 1 destroys shield and deals **1** to attacker |
| Overcharge | Purple; not destroyed; attacker takes **2**; expires next turn start |
| Ion Weapon (enemy) | Ignores normal shield (not overcharge) into base |
| Base cannon | Range ≤3; once/turn; damage = energy; **ignores evasion**; energy 1→3→5 after use cycle |

## Cards & hand

| Fact | Value |
|------|-------|
| Star deck size | **24** |
| Custom slots | Starter + **2** custom decks (wiki) |
| Unit cards | Fixed per siege; not player-built into the 24 |
| Hand | **3 star + 3 unit** at turn start; unused kept |
| Discard points | +1/turn start; max **2**; exchange before playing cards/cannon |
| Rank-up | Kill → special/rank 0→3; defeat → rank reset |
| Heroes | In **star** deck; **one hero per deck**; heroes do not rank up |

## Combat (§2.4)

| Fact | Value |
|------|-------|
| Stats | Attack (hit count), Firepower, Evasion (= defense), Health |
| Initiative | Ally attacks first (unless enemy First Strike alone) |
| Damage/hit | `max(0, Firepower − Enemy Evasion)` |
| Crit | Low chance; increased damage; **ignores evasion** |
| Miss | Low chance; independent of FP/evasion |
| Unit shields | Block N hits; some sieges; regen +1/turn end; Ion Grenade strips |

## Scoring

| Fact | Value |
|------|-------|
| Stars | 1–3 from score thresholds |
| Multiplier | +1/4 meter per kill; ×2 at 4 kills, ×3 at 8; ally death drops **one full** multiplier level |

## Product note

Class product may simplify combat RNG (crit/miss). Wiki documents them as `observed`; see `DECISIONS.md`.
