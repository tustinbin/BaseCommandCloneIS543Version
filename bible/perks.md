# Perk catalog

Canonical perk definitions for implementers.  
Confidence: `observed` unless noted. Evidence: Namu wiki (extract snapshot [`research/wiki/perks.md`](../research/wiki/perks.md)).

| id | Name | Definition | Confidence |
|----|------|------------|------------|
| behemoth | Behemoth | Enemy: +1 Attack and +1 Firepower **per turn**. Player: when engaged, +1 Attack and +1 Firepower per turn, **cap +3**. | observed |
| concealment | Concealment | Spawn at **range 2** instead of 4. | observed |
| first_strike | First Strike / Preemptive | Attack first when engaged; if both have it, **player** goes first. | observed |
| rage | Rage / Fury | +1 Firepower each time hit (including map weapons). | observed |
| heavy_weapons | Heavy Weapons | First attack in engagement **ignores** opponent evasion. | observed |
| ion_weapon | Ion Weapon | Enemy: +1 vs aircraft; ignore base shield (not overcharge). Player: +1 vs aircraft; ignore enemy unit shields. | observed |
| luck | Luck / Good Luck | Higher critical-hit rate (“fatality rate is high”). | observed |
| overload | Overload | First attack opportunity spends **all** attacks at once. | observed |
| protect | Protect / Protected | Ignore first damaging hit; does not block instant-kill (Thermal Imploder); ≠ shield layer. | observed |
| recovery | Recovery | Full HP at each turn start. | observed |
| resurrection | Resurrection | After dying once and battle ends, respawn without this perk. | observed |
| speed_acceleration | Speed Acceleration | Advance **2** spaces per turn. Default on Probe Droid & Speeder Bike. | observed |
| squad_leader | Squad Leader | Enemy: spawn with +1 extra unit. **Player: after battle, draw a new star card.** | observed |
| important_goal | Important Goal | Must attack the unit with this perk. | observed |

## Non-perk: unit shields

Some sieges give enemies **shield layers** (not the Protect perk):

| Fact | Value | Confidence |
|------|-------|------------|
| Block | Shield layers block N attacks | observed |
| Regen | +1 layer at turn end (when applicable) | observed |
| Clear | Ion Grenade clears shields in that coordinate | observed |

## Settled conflicts (do not re-litigate in code)

| Topic | Bible rule | Confidence |
|-------|------------|------------|
| Player Squad Leader | Draws a **star** card (not a unit card) | observed |
| Evasion model | Flat FP reduction (`FP − evasion`); Miss is separate RNG (omitted in class MVP engine) | observed + invented (product) |
