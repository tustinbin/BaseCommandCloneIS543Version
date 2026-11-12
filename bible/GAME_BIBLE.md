# Game bible — core rules & tunables

Confidence: `observed` | `inferred` | `invented`  
Evidence: cite `research/video-log.md` Log IDs where possible.  
Research prose: `research/base-command-research.md`.

---

## Board

| Fact | Value | Confidence | Evidence |
|------|-------|------------|----------|
| Layout | 4 quadrants × 4 rings + central base | observed | research / EA descriptions |
| Orientation | Landscape play | invented (product) | project_rules |
| UI style | Schematic (not EA art recreation) | invented (product) | project_rules |

Ring numbering convention (inner → outer): **TBD** — confirm in video (`1` = adjacent to base?).

---

## Hand & decks

| Fact | Value | Confidence | Evidence |
|------|-------|------------|----------|
| Custom deck size | 24 Star Cards | observed | EA custom deck UI |
| Draw per turn | 3 Unit + 3 Star | observed | contemporary reviews |
| Unit pool | Separate fixed pool (not in 24) | observed | research |
| Draft decks | &lt; 24 OK | invented (product) | project_rules |
| Legal for siege | Active deck Σ qty = 24 | invented (product) | project_rules |
| Max decks | 10 | invented (product) | project_rules |

---

## Turn loop (skeleton)

Order from research (confirm with video timestamps):

1. Draw / replenish hand (3 unit + 3 star) — **confirm exact timing**  
2. Play units / star cards / use cannon (player phase) — **TBD detail**  
3. End turn → cannon charge, enemies advance, cards replenished — **confirm order**

| Step | Detail | Confidence | Evidence |
|------|--------|------------|----------|
| Enemy advance | Toward base each turn end | observed | research |
| Cannon charge | Charges over turns | observed | research |
| Mid-siege save | None (quit = no reward) | invented (product) | project_rules |

---

## Base & cannon

| Fact | Value | Confidence | Evidence |
|------|-------|------------|----------|
| Base HP | 10 total (one source) | inferred | research § base HP — **verify on video** |
| Directional shields | Four shield walls (one source) | inferred | research — **verify** |
| Cannon vs Protected | Can strip Protected | observed | EA example |
| Cannon damage | TBD | — | video log |
| Charge rate | TBD | — | video log |

---

## Combat tunables

Leave blank until observed. Do not invent for engine work yet.

| Tunable | Value | Confidence | Evidence |
|---------|-------|------------|----------|
| Damage formula | TBD (FP vs defense interaction) | — | |
| Attack exchange rule | Continues until one destroyed or both exhausted attacks | observed | EA combat description |
| Rank-up on kill / survive | In-siege rank-up; death resets | observed / inferred | research |
| Cross-siege unit XP | None | invented (product) | project_rules |
| RNG sources | Shuffle / draw only; enemies scripted | invented (product) + observed scripted feel | project_rules |

---

## Scoring & stars

| Fact | Value | Confidence | Evidence |
|------|-------|------------|----------|
| Stars | 1–3 per siege | observed | research / UI |
| Score inputs | TBD (surviving units, speed, etc.) | — | video log |
| Star score thresholds | Per siege — see `sieges.md` | — | |
| Point pots | Fixed per star; each star pays once | invented (product) | project_rules |

---

## Open questions (fill via video log)

- [ ] Exact ring index of base-adjacent ring  
- [ ] Exact end-of-turn order (cannon vs advance vs draw)  
- [ ] Base HP and shield behavior on video  
- [ ] Cannon charge ticks and damage  
- [ ] How rank-up is displayed and stat deltas  
- [ ] Star thresholds for tutorial / early sieges  
