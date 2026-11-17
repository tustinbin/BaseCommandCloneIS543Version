# Siege definitions

Canonical siege index and demo siege for implementers.  
Evidence snapshot (campaign names): [`research/wiki/sieges-list.md`](../research/wiki/sieges-list.md).

**Product rule:** each star pot pays **once** per `(user, siege, starLevel)`.

---

## Demo / tutorial (class) — `siege_01`

| Field | Value | Confidence | Evidence |
|-------|-------|------------|----------|
| id | `siege_01` | invented (product) | project_rules / grill |
| name | Welcome to Base Command / The First Line | inferred | campaign index + HW8 mock |
| unlock | always | invented (product) | |
| Difficulty | Easy tutorial (replace with richer script before Dec 9 if time) | invented (product) | grill |
| star1 score threshold | **100** | invented (product) | grill |
| star2 score threshold | **250** | invented (product) | grill |
| star3 score threshold | **500** | invented (product) | grill |
| star1 pot (credits) | **50** | invented (product) | grill placeholder |
| star2 pot (credits) | **100** | invented (product) | grill placeholder |
| star3 pot (credits) | **150** | invented (product) | grill placeholder |
| unit pool | Soldier, T-47, A-Wing, X-Wing (standard) | observed | wiki |
| enemy heroes / AT-AT | None in this script | invented (product) | grill |

### Spawn script (`invented` — easy)

Sectors: `N=0`, `E=1`, `S=2`, `W=3`. Range 4 = outer spawn unless noted.

| Turn | Unit | Sector | Range | Perks | Notes |
|------|------|--------|-------|-------|-------|
| 1 | stormtrooper | 0 | 4 | — | |
| 1 | probe_droid | 2 | 4 | speed_acceleration | |
| 2 | stormtrooper | 1 | 4 | — | |
| 3 | probe_droid | 3 | 4 | speed_acceleration | |
| 4 | stormtrooper | 0 | 4 | — | |
| 4 | stormtrooper | 2 | 4 | — | |
| 5 | probe_droid | 1 | 4 | speed_acceleration | |
| 6 | stormtrooper | 3 | 4 | — | |
| 7 | stormtrooper | 1 | 4 | — | |
| 7 | probe_droid | 0 | 4 | speed_acceleration | |
| 8 | — | — | — | — | No spawn; clear remaining |

After turn 8, if board clear → win; if base HP 0 → lose. Tune freely; tag stays `invented`.

---

## Campaign index (names — observed)

Daily siege: wiki notes rotating daily with bonus credits — optional / post-class.

### First Command

Welcome to Base Command; Scouting Party; Return of the Empire; Viper Probe Recon; Ion Weapon Forces; AT-ST Access; Walker Raid; Hunter Boba Fett

### Guardian of the Rebel Alliance

Block; Wrath of the Empire; Stormtrooper Raid; Rise of the Empire; Guardian of the Empire; Vader's Choice

### Empire's Behemoth

Behemoth; Injury Recovery Attack; Heavy Weapons; Temptation of the Dark Side; Amnesty Raid; Dangerous Behemoth; Crisis Situation

### Emperor's Will

Dark Bounty; Emperor's Gesture; Dangerous Stormtrooper; Final Attack

### Battle of Jakku

Land Never Seen; Fighter Squadron; Speeder Bike Attack; Rebel vs Villain; Turning Point

### Outer Rim

Hunter And…; Stormtrooper Shield; Rookie Stand Up; Return of Greedo; Surprise Attack; Vicious Attack; Bounty Hunters; Heavy Equipment Raid; Shield Walker Raid; Contract in Vain

### Hero Holiday

Hero Holiday I–IV

### Master variants

First Command / Defender / Imperial Colossus / etc. “II” remasters listed in wiki §6.8+ (names only until scripted)
