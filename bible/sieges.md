# Siege definitions

Scripted enemies; star thresholds & point pots. Class may ship **one** demo siege first.

---

## Shared fields

```
id:
name:
unlock_rule:          # e.g. always | complete:<siegeId>
star1_score_threshold: TBD
star2_score_threshold: TBD
star3_score_threshold: TBD
star1_points:          # product currency pot — invented until set
star2_points:
star3_points:
script:                # enemy spawns by turn — see below
confidence:
evidence:
```

**Product rule:** each star pot pays **once** per `(user, siege, starLevel)` — see project_rules / DATA_DESIGN.

---

## Demo / tutorial siege (MVP)

| Field | Value | Confidence | Evidence |
|-------|-------|------------|----------|
| id | `siege_01` | invented (product id) | |
| name | The First Line _(placeholder — rename from footage)_ | invented | HW8 mock copy |
| unlock | always | invented (product) | |
| star thresholds | TBD / TBD / TBD | — | video log |
| star pots (currency) | TBD — may boost for demo | invented (product) | project_rules |
| enemy script | TBD | — | video log |

### Spawn script table (fill from video)

| Turn | unitTypeId | quadrant | ring | perks | Confidence | Evidence |
|------|------------|----------|------|-------|------------|----------|
| | | | | | | |

---

## Stretch sieges

Placeholder rows only — do not invent scripts until needed.

| id | name | unlock | Status |
|----|------|--------|--------|
| siege_02 | Crossing Point _(placeholder)_ | complete siege_01 | locked / undefined |
| siege_03 | The Outer Ring _(placeholder)_ | complete siege_02 | locked / undefined |
| siege_04 | Last Stand _(placeholder)_ | complete siege_03 | locked / undefined |

Original game claimed many sieges (50+ / later 60). **Not** a class MVP requirement.

---

## Leaderboard

| Fact | Value | Confidence |
|------|-------|------------|
| Scope | Per-siege | invented (product) |
| Fields | commanderName, bestScore, bestStars | invented (product) |
| Submit | Auto on finish if best | invented (product) |

---

## Open questions

- [ ] Official name / number of the first tutorial siege  
- [ ] Wave composition and turn count for early sieges  
- [ ] Visible star score thresholds on results screen  
- [ ] Whether later sieges change board rules or only scripts  
