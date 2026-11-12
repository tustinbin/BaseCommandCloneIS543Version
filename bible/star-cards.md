# Star Card catalog

Customizable 24-card deck. Effects, copy limits, and shop prices live here.  
Tag every number. Prefer empty TBD over invented damage.

**Columns:** `id` (stable slug), name, effect summary, `maxCopies`, shop price, starter?, confidence, evidence.

---

## Confirmed / named cards (from research — stats TBD)

| id | Name | Effect (known) | maxCopies | shopPrice | starter | Confidence | Evidence |
|----|------|----------------|-----------|-----------|---------|------------|----------|
| orbital_strike | Orbital Strike | 5 damage to all units in a sector/quadrant | TBD | TBD | TBD | observed (5 dmg) | EA docs / research |
| cycler_rifle | Cycler Rifle | Increase Rebel Soldier firepower | TBD | TBD | TBD | observed (effect type) | EA docs |
| impact_grenade | Impact Grenade | TBD | TBD | TBD | TBD | observed (exists) | screenshots / decks |
| barrage | Barrage | TBD | TBD | TBD | TBD | observed (exists) | research |
| ion_blast | Ion Blast | TBD | ≥2 seen in screenshot | TBD | TBD | observed (exists) | screenshot ×2 |
| proximity_bomb | Proximity Bomb | TBD | TBD | TBD | TBD | observed (exists) | research |
| suppressive_fire | Suppressive Fire | TBD | ≥2 seen | TBD | TBD | observed (exists) | custom deck UI ×2 |
| new_orders | New Orders | Battlefield manipulation TBD | TBD | TBD | TBD | observed (exists) | L60 deck screenshot |
| defection | Defection | Possibly force enemies to attack each other? | TBD | TBD | TBD | inferred | review + name |
| power_distribution | Power Distribution | Defensive / power TBD | TBD | TBD | TBD | observed (exists) | L60 screenshot |
| squad_leader | Squad Leader | TBD | TBD | TBD | TBD | observed (exists) | L60 screenshot |
| card_refresh | Card Refresh | Manipulate draw / refresh hand | TBD | TBD | TBD | observed (exists) | L60 screenshot |

Add rows as videos confirm more names (heroes, era packs, etc.).

---

## Effect taxonomy (working)

Use these buckets when classifying cards (refine with video):

- `buff_unit` — e.g. Cycler Rifle  
- `direct_damage` — e.g. Orbital Strike  
- `aoe_damage`  
- `repair_base` / `shield`  
- `enemy_manipulate` — push back, defection, etc.  
- `hand_manipulate` — Card Refresh, discard-related  
- `other`

---

## Product rules (not original EA)

| Rule | Value | Confidence |
|------|-------|------------|
| Shop purchase | Unlocks ownership for deckbuilding | invented (product) |
| Starting currency | 0 | invented (product) |
| Starter unlock set | TBD list of ids | invented (product) |

---

## Class MVP subset

Target ~12–20 fully defined cards before combat coding. Check when ready:

- [ ] At least 4 damage / control tools  
- [ ] At least 2 buffs  
- [ ] At least 1 repair / sustain  
- [ ] At least 1 hand/board manipulate  
- [ ] Every MVP row has effect text + `maxCopies` (observed or invented-tagged)
