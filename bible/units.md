# Unit catalog

Player units come from a **fixed pool** (not deck CRUD). Enemies are scripted per siege.  
Fill stats from video — leave TBD rather than inventing.

---

## Player units (Rebel — original set)

| id | Name | HP | Firepower | Defense | Attacks | Range / targeting | Confidence | Evidence |
|----|------|----|-----------|---------|---------|-------------------|------------|----------|
| rebel_soldier | Rebel Soldier / Trooper | TBD | TBD | TBD | TBD | Ring 1 only | observed (range) | tutorial / research |
| t47_airspeeder | T-47 Airspeeder | TBD | TBD | TBD | TBD | Rings 2 and 3 | observed (range) | research |
| x_wing | X-wing | TBD | TBD | TBD | TBD | Rings 3 and 4 | observed (range) | research |
| a_wing | A-wing | TBD | TBD | TBD | TBD | Any unit in one quadrant | observed (range) | research |

Later / hero units: add rows when named on video (do not invent roster).

### Stat block template

```
id:
name:
side: player | enemy
hp:
firepower:
defense:
attacks:
range_pattern:  # e.g. rings:[1] | rings:[2,3] | quadrant_all
special:
confidence:
evidence:  # Log ID
```

---

## Rank-up (in-siege)

| Fact | Value | Confidence | Evidence |
|------|-------|------------|----------|
| Surviving units can rank up within a siege | yes | observed / inferred | research |
| Death resets rank when redrawn | yes | inferred | research / product lock |
| Permanent cross-siege unit XP | no | invented (product) | project_rules |
| Stat deltas per rank | TBD | — | video log |

---

## Enemy perks (known concepts)

| Perk | Behavior | Confidence | Evidence |
|------|----------|------------|----------|
| Protected | Ignores first damaging attack; cannon can strip | observed | EA docs |
| _(add)_ | | | |

---

## Enemy units

Add as identified in footage (Stormtrooper variants, specialists, bosses, etc.).

| id | Name | HP | FP | Def | Attacks | Perks | Notes | Confidence | Evidence |
|----|------|----|----|-----|---------|-------|-------|------------|----------|
| | | TBD | TBD | TBD | TBD | | | | |

---

## Open questions

- [ ] Exact on-screen stat numbers for Rebel Soldier  
- [ ] Whether “Rebel Soldier” and “Rebel Trooper” are the same unit  
- [ ] How multi-attack exchanges resolve visually  
- [ ] Full enemy roster for Siege 01 / tutorial  
