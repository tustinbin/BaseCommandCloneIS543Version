# Game bible — core rules & tunables

**This file is canonical** for board, hand, turn, base/cannon, combat, and scoring.  
Confidence: `observed` | `inferred` | `invented`  
Evidence snapshots: [`research/wiki/rules.md`](../research/wiki/rules.md). Grill log: [`research/wiki/DECISIONS.md`](../research/wiki/DECISIONS.md).  
Catalogs: [`units.md`](units.md) · [`star-cards.md`](star-cards.md) · [`perks.md`](perks.md) · [`sieges.md`](sieges.md).

---

## Board

| Fact | Value | Confidence | Evidence |
|------|-------|------------|----------|
| Layout | 4 sectors × ranges 1–4 + central base (range 0) | observed | research wiki rules |
| Coordinate | One sector × one range; max **2** units; 16 cells | observed | research wiki rules |
| Ring index | **1** = adjacent to base; **4** = outer spawn | observed | research wiki rules |
| Default spawn | Range **4** (unless Concealment → range 2) | observed | research wiki rules |
| Advance | One space toward center per turn (unless Speed Acceleration / hero moves) | observed | research wiki rules |
| Sector lock | Enemies stay in sector except some heroes with zone move | observed | research wiki rules |
| Orientation | Landscape play | invented (product) | project_rules |
| UI style | Schematic geometric (not EA art) | invented (product) | project_rules |

---

## Hand & decks

| Fact | Value | Confidence | Evidence |
|------|-------|------------|----------|
| Star deck size | 24 | observed | research wiki rules |
| Custom decks (wiki) | Starter + 2 slots | observed | research wiki rules |
| Max decks (product) | **10** | invented (product) | project_rules |
| Draw | 3 Unit + 3 Star; unused kept | observed | research wiki rules |
| Unit pool | Fixed per siege (not in 24) | observed | research wiki rules |
| Discard points | +1/turn; max 2; before play/cannon | observed | research wiki rules |
| Heroes | In star deck; **max 1 hero / deck**; do **not** rank up | observed | research wiki heroes |
| Draft decks | &lt; 24 OK | invented (product) | project_rules |
| Legal for siege | Active deck Σ qty = 24 | invented (product) | project_rules |

---

## Turn loop

| Step | Detail | Confidence | Evidence |
|------|--------|------------|----------|
| Start turn | Gain discard point (cap 2); hand already has kept cards; draw/refill to 3+3 as needed | observed / inferred | research wiki §2.3 |
| Optional discard | Before cards/cannon | observed | research wiki rules |
| Player phase | Play units / star cards / base cannon (once) | observed | research wiki rules |
| End turn | Enemies advance; unit shields regen +1 if applicable; cannon energy progresses next turn start | observed | research wiki rules |
| Mid-siege save | None | invented (product) | project_rules |

---

## Base & cannon

| Fact | Value | Confidence | Evidence |
|------|-------|------------|----------|
| Base HP | **10** (no auto-regen unless card) | observed | research wiki rules |
| Shields | **4** directional | observed | research wiki rules |
| Hit on shield (range 1) | Shield breaks; attacker takes **1** | observed | research wiki rules |
| Overcharge | Not destroyed; attacker takes **2**; ends next turn start | observed | research wiki rules |
| Enemy at range 0 | Damages base by unit **firepower**, then disappears | observed | research wiki rules |
| Ion Weapon (enemy) vs base | Ignores normal shield (not overcharge) into base | observed | research wiki rules |
| Cannon range | ≤ 3 | observed | research wiki rules |
| Cannon damage | = energy; **ignores evasion**; once/turn | observed | research wiki rules |
| Cannon energy | After shot: refill path **1 → 3 → 5** (max 5) | observed | research wiki rules |
| Cannon vs Protect | Can strip Protect with a hit | observed | research wiki / EA |

---

## Combat

| Tunable | Value | Confidence | Evidence |
|---------|-------|------------|----------|
| Stats | Attacks, Firepower, **Evasion**, Health (+ optional shields) | observed | research wiki rules |
| Naming | Canonical **evasion** (video “Agility”; legacy “defense”) | observed / naming | DECISIONS / DATA_DESIGN |
| Damage/hit | `max(0, FP − target evasion)` | observed | research wiki rules |
| Initiative | Player first unless only enemy has First Strike | observed | research wiki rules |
| Exchange | Alternate until destroyed or attacks exhausted | observed | research wiki rules |
| Crit (wiki) | Low chance; increased dmg; ignores evasion | observed | research wiki rules |
| Crit (class MVP) | **20%**; ignores evasion; damage = **FP**; does **not** pierce Protect | invented (product) | grill / ADR-0003 |
| Luck perk | Crit chance **35%** instead of 20% | invented (product) | grill |
| Miss (wiki) | Low chance; independent of FP/evasion | observed | research wiki rules |
| Miss (class MVP) | **None** — use evasion (and Protect/shields) only | invented (product) | grill / ADR-0003 |
| Unit shields | Block N hits; regen +1/turn end; Ion Grenade strips — see [`perks.md`](perks.md) | observed | research wiki rules |
| Rank-up | On **kill**; ranks 0–3; defeat resets; heroes do not rank | observed | research wiki rules |
| Cross-siege unit XP | None | invented (product) | project_rules |
| Enemy scripts | Fixed per siege | observed | research wiki |
| Product RNG | Shuffle/draw + crit | invented (product) | project_rules |
| Perk definitions | [`perks.md`](perks.md) | observed | — |
| Engine card scope | Implement **starter** effects first; extensible registry for the rest | invented (product) | grill |

---

## Scoring & stars

| Fact | Value | Confidence | Evidence |
|------|-------|------------|----------|
| Stars | 1–3 from score thresholds | observed | research wiki rules |
| Multiplier | +¼ per kill; ×2 at 4 kills; ×3 at 8; ally death −1 full level | observed | research wiki rules |
| Remaining HP/shields | Affect end score | observed | research wiki rules |
| Point pots | Fixed per star; each star pays once | invented (product) | project_rules |

---

## Open / TBD

- [ ] Shop **spend** prices / economy tuning — [`star-cards.md`](star-cards.md) (pots placeholders exist on `siege_01`)
- [ ] Richer sieges beyond easy `siege_01`
- [ ] Non-starter card effect implementations (catalog + locks already defined)
- [ ] Review ambiguous cards list in [`star-cards.md`](star-cards.md)
