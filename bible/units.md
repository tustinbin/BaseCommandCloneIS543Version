# Unit catalog

Canonical unit and hero stats for implementers.  
Confidence: `observed` unless noted. Canonical stat name: **evasion** (video “agility”; older docs said “defense”).  
Evidence snapshots: [`research/wiki/player-units.md`](../research/wiki/player-units.md), [`enemy-units.md`](../research/wiki/enemy-units.md), [`heroes.md`](../research/wiki/heroes.md).  
Perk ids: [`perks.md`](perks.md).

---

## Player regular units

### rebel_soldier — Rebel Soldier (range 1)

| Rank | Atk | FP | Eva | HP | Confidence |
|------|-----|----|-----|----|------------|
| 0 | 3 | 3 | 1 | 6 | observed |
| 1 | 3 | 3 | 1 | 7 | observed |
| 2 | 4 | 3 | 1 | 7 | observed |
| 3 | 4 | 4 | 1 | 7 | observed |

### t47_airspeeder — T-47 / Snowspeeder (range 2–3)

| Rank | Atk | FP | Eva | HP | Confidence |
|------|-----|----|-----|----|------------|
| 0 | 2 | 4 | 2 | 7 | observed |
| 1 | 2 | 4 | 2 | 8 | observed |
| 2 | 3 | 4 | 2 | 8 | observed |
| 3 | 3 | 5 | 2 | 8 | observed |

### a_wing — A-Wing (sector zones → all)

| Rank | Atk | FP | Eva | HP | Range | Confidence |
|------|-----|----|-----|----|-------|------------|
| 0 | 2 | 4 | 3 | **7** | Zone 1 | observed (wiki; video had 8) |
| 1 | 2 | 4 | 3 | 7 | Zone 2 | observed |
| 2 | 3 | 4 | 3 | 7 | Zone 3 | observed |
| 3 | 3 | 5 | 3 | 8 | All zones | observed |

### x_wing — X-Wing (range 3–4)

| Rank | Atk | FP | Eva | HP | Confidence |
|------|-----|----|-----|----|------------|
| 0 | 2 | 5 | 2 | 7 | observed |
| 1 | 2 | 5 | 2 | 8 | observed |
| 2 | 3 | 5 | 2 | 8 | observed |
| 3 | 3 | 6 | 2 | 8 | observed |

---

## Player heroes (star-deck cards)

**Deck rule:** max **1** hero per 24-card star deck. Heroes do **not** rank up; score multiplier still moves on win/loss.

| id | Name | Atk | FP | Eva | HP | Shield | Perks | Special | Confidence |
|----|------|-----|----|-----|----|--------|-------|---------|------------|
| luke_skywalker | Luke Skywalker | 3 | 4 | 4 | 7 | 0 | squad_leader, behemoth | Push engaged enemy 1 space; +2 evasion vs Vader | observed |
| han_solo | Han Solo | 3 | 5 | 3 | 7 | 0 | first_strike, rage | On win: **2** discard points; retrieve Millennium Falcon if used/discarded | observed |
| leia_organa | Leia Organa | 3 | 5 | 5 | 5 | 1 | protect, ion_weapon | On engage: strip all enemy perks in that coordinate | observed |
| nien_nunb | Nien Nunb | 2 | 3 | 4 | 5 | 0 | heavy_weapons, overload | On win: pick 1 of 3 star cards (2 up, 1 down) | observed |
| lando_calrissian | Lando Calrissian | 5 | 3 | 3 | 8 | 0 | heavy_weapons, luck | On win: retrieve Nien if used/discarded | observed |
| chewbacca | Chewbacca | 2 | 6 | 2 | 8 | 0 | first_strike, overload | Push all enemies 1; retrieve Han if used/discarded | observed |
| jyn_erso | Jyn Erso | 1 | 1 | 3 | 7 | 0 | first_strike, behemoth | Set enemy evasion to 0; redraw all unit cards | observed |

### Special unit-like star cards

| id | Atk | FP | Eva | HP | Shield | Perks / note | Confidence |
|----|-----|----|-----|----|--------|--------------|------------|
| millennium_falcon | 3 | 5 | 2 | 6 | 1 | first_strike, squad_leader | observed |
| r5_d4 | 3 | 3 | 1 | 4 | 0 | Removes enemy perks in coordinate on engage | observed |

Full star-card rows (copy limits, shop): [`star-cards.md`](star-cards.md).

---

## Enemy regular / vehicle

Where only rank 0 and 3 are listed, mid ranks are unknown — leave TBD in engine until observed.

| id | Name | Rank0 Atk/FP/Eva/HP | Rank3 (if listed) | Perk | Confidence |
|----|------|---------------------|-------------------|------|------------|
| probe_droid | Probe Droid | 3/3/1/4 | 4/4/1/6 | speed_acceleration; spawns extras | observed |
| stormtrooper | Stormtrooper | 3/3/1/6 | 4/4/1/7 | — | observed |
| speeder_bike | Speeder Bike | 2/3/2/5 | 3/4/2/6 | speed_acceleration | observed |
| tie_fighter | TIE Fighter | 2/4/3/7 | 3/4/4/8 | — | observed |
| tie_interceptor | TIE Interceptor | 2/5/2/7 | 3/6/2/8 | — | observed |
| at_st | AT-ST | 2/5/2/8 | 3/6/2/9 | — | observed |
| at_at | AT-AT | 2/7/4/10 | 3/8/4/11 | protect | observed |

---

## Enemy heroes

Typically ≤1 appearance per siege. Zone-changing heroes include Boba, Vader, Palpatine (and others with zone move).

| id | Name | Atk/FP/Eva/HP | Shield | Perks | Special abilities | Confidence |
|----|------|---------------|--------|-------|-------------------|------------|
| slave_i | Slave I | 3/5/3/7 | — | protect | No hero AI menu; moves like normal | observed |
| boba_fett | Boba Fett | 3/5/2/7 | — | recovery, resurrection | Advance 1/2, zone move, remove shield, base ranged attack, stay still; spawn score penalty | observed |
| darth_vader | Darth Vader | 4/7/4/8 | — | protect, overload | Advance 1/2, remove shield, neutralize unit card, zone move, stay still | observed |
| palpatine | Palpatine | 3/8/3/8 | — | rage, overload | Advance 1, remove 1–2 shields, neutralize unit card, zone move, summon reinforcements | observed |
| greedo | Greedo | 5/5/3/7 | — | squad_leader, rage | Advance 1/2, score decrease, cannon energy down, steal discard points | observed |
| dengar | Dengar | 7/3/3/9 | — | heavy_weapons, behemoth | Advance 1/2, seal unit/star card, remove base boost | observed |
| bossk | Bossk | 1/6/4/7 | — | first_strike, heavy_weapons | Advance 1, weaken ally cards, escape + HP recovery | observed |
| orson_krennic | Orson Krennic | 3/5/3/7 | **2** | first_strike, squad_leader | Advance 1 + (wiki list incomplete in dump) | observed |

---

## Rank-up

| Fact | Value | Confidence |
|------|-------|------------|
| Rank on | Kill | observed |
| Ranks | 0–3 | observed |
| Defeat | Rank reset | observed |
| Heroes | Do not rank up | observed |
| Cross-siege unit XP | None | invented (product) |
| Perk definitions | [`perks.md`](perks.md) | observed |
