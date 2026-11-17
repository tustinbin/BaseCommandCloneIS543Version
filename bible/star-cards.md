# Star Card catalog

Canonical effects, copy limits, and starter flags for implementers.  
Confidence: `observed` unless noted. Starter column: `inferred` from video Base-available list.  
Evidence snapshot: [`research/wiki/star-cards.md`](../research/wiki/star-cards.md).  
Heroes: max **1** per deck — full stats/specials in [`units.md`](units.md). Perks: [`perks.md`](perks.md).

## Ambiguity / review list (not required for starter MVP engine)

Excluded from **required** starter implementation until clarified. Still may appear locked in shop.

| id | Note | Confidence |
|----|------|------------|
| jump_pack | “Increases range by 3” — movement vs attack range unclear | observed + ambiguity |
| medical_droid | Broken translation; provisional +2 HP to owned units until end of next battle | observed + ambiguity |
| power_distribution | Truncated dump (“Ion Weapon Perc”); “gas unit” wording unclear | observed + ambiguity |
| blaster_cannon | Effect depends on “other cards used while holding”; counter UX / timing fuzzy | observed + ambiguity |
| bacta_bomb | Squad Leader + regen-while-engaged stacking vs other heals unclear | observed + ambiguity |
| hindrance | “Enemies cannot attack that unit” — engage rules / AoE edge cases | observed + ambiguity |
| scout_binoculars | Draw + attack-anywhere stacking with New Orders | observed + ambiguity |
| thermal_imploder | Instant remove vs Protect / heroes / win condition | observed + ambiguity |

## Default starter deck (signup)

Max legal copies of every `starter=yes` card — **sums to 24** (`inferred` starters). Set as the initial active deck.

| id | qty |
|----|-----|
| a_new_hope | 1 |
| defection | 2 |
| reinforcements | 1 |
| suppressive_fire | 2 |
| base_shield | 2 |
| trap | 2 |
| bombardment | 2 |
| inner_perimeter | 2 |
| ion_blast | 2 |
| elite_training | 2 |
| new_orders | 2 |
| squad_leader | 2 |
| war_veteran | 2 |

## Shop

Show **all** catalog rows. `starter=yes` → owned at signup; others **locked**. Credit **prices TBD** (spend flow deferred); star pots are mission rewards, not shop rows.

## Catalog

| id | name | category | maxCopies | starter | confidence | effect |
|----|------|----------|-----------|---------|------------|--------|
| a_new_hope | A New Hope | event | 1 | yes | observed + inferred starter | Enemy units do not spawn on the next enemy turn. |
| card_refresh | Card Refresh | event | 1 | no | observed | Replace all cards. Neutralized cards cannot be replaced. |
| defection | Defection | event | 2 | yes | observed + inferred starter | Can be used when there are 2 enemies on the coordinates. When used on one enemy, the enemy at the same coordinates engages each other. Depending on the situation, it can be useful. |
| flash_grenade | Flash Grenade | event | 2 | no | observed | All enemies within 1-3 range are incapacitated once. |
| reinforcements | Reinforcements | event | 1 | yes | observed + inferred starter | Draw all new unit cards. |
| scan_pulse | Scan Pulse | event | 2 | no | observed | Draw and take one of 3 Star Cards (one face down, 2 face up). |
| suppressive_fire | Suppressive Fire | event | 2 | yes | observed + inferred starter | Pushes an enemy unit back one coordinate. |
| a_wing_shield | A-Wing Shield | vehicle_boost | 2 | no | observed | Adds one shield when equipped on A-wing. |
| concussion_warheads | Concussion Warheads | vehicle_boost | 2 | no | observed | Adds 3 firepower when equipped on an A-wing. |
| evasive_maneuvers | Evasive Maneuvers | vehicle_boost | 2 | no | observed | Adds 2 evasion when equipped on an air unit. |
| power_distribution | Power Distribution | vehicle_boost | 2 | no | observed | Select and apply one of the following items when mounting on a gas unit. - Firepower +2 - Shield +3 - Ion Weapon Perc |
| proton_torpedoes | Proton Torpedoes | vehicle_boost | 2 | no | observed | When equipped on the X-wing, it grants heavy weapon perc. |
| sensor_jammer | Sensor Jammer | vehicle_boost | 2 | no | observed | Adds 2 evasion when equipped on a snowspeeder. |
| t47_speed_boost | T-47 Speed Boost | vehicle_boost | 2 | no | observed | When equipped on a snowspeeder, it grants a preemptive strike perk. |
| towing_cable | Towing Cable | vehicle_boost | 2 | no | observed | Destroys an AT-AT in one hit when equipped on a snowspeeder. Required when AT-AT comes out. |
| x_wing_shield | X-Wing Shield | vehicle_boost | 2 | no | observed | When equipped on the X-wing, adds one protective layer. |
| adrenaline_steam | Adrenaline Steam | infantry_boost | 2 | no | observed | When equipped to infantry units, grants rage perk and adds 1 firepower. |
| bacta_bomb | Bacta Bomb | infantry_boost | 2 | no | observed | When equipped to an infantry unit, grants Squad Leader Perk and all friendly units recover 1 HP per turn when engaged. |
| grenade_bombardment | Grenade Bombardment | infantry_boost | 2 | no | observed | When equipped to an infantry unit, it grants the Heavy Weapons perk and adds 3 Attack. |
| bowcaster | Bowcaster | infantry_boost | 2 | no | observed | Adds 2 attack and 3 firepower when worn on infantry units. |
| cooling_battery | Cooling Battery | infantry_boost | 2 | no | observed | When equipped to an infantry unit, grants Behemoth Perk and adds 1 Attack. |
| cycler_rifle | Cycler Rifle | infantry_boost | 2 | no | observed | When equipped to an infantry unit, grants Heavy Weapon Perk and +2 Firepower. |
| hindrance | Hindrance | infantry_boost | 2 | no | observed | When equipped on an infantry unit, enemies cannot attack that unit. |
| explosive_bullet | Explosive Bullet | infantry_boost | 2 | no | observed | When equipped to an infantry unit, it gives first strike perk and adds 2 firepower. |
| concentrated_fire | Concentrated Fire | infantry_boost | 2 | no | observed | Adds 3 ATK when worn on infantry units. |
| guided_missile | Guided Missile | infantry_boost | 2 | no | observed | Gives an infantry unit Overload Perk when equipped and adds 1 Attack. |
| ion_neutralizer | Ion Neutralizer | infantry_boost | 2 | no | observed | When worn on infantry units, it ignores enemy protection perks and adds 2 firepower. |
| ion_shot | Ion Shot | infantry_boost | 2 | no | observed | When equipped to an infantry unit, it grants the ion weapon perk and adds 2 firepower. |
| ion_torpedo | Ion Torpedo | infantry_boost | 2 | no | observed | When equipped to an infantry unit, it grants the ion weapon perk and adds 2 firepower. |
| jump_pack | Jump Pack | infantry_boost | 2 | no | observed | Increases range by 3 when equipped on infantry units. |
| medical_droid | Medical Droid | infantry_boost | 2 | no | observed | All units you are currently owned by adding health 2 until the end of the next battle. |
| personal_shield | Personal Shield | infantry_boost | 2 | no | observed | Adds 3 shield when equipped to infantry units. |
| pulse_cannon | Pulse Cannon | infantry_boost | 2 | no | observed | When equipped to an infantry unit, grants first strike perk and +2 attack. |
| scattergun | Scattergun | infantry_boost | 2 | no | observed | When worn on an infantry unit, adds 1 firepower and pushes enemies back 1 block before battle. |
| scout_pistol | Scout Pistol | infantry_boost | 2 | no | observed | When worn on an infantry unit, it deals 5 damage to the enemy even if it is defeated in battle. |
| smart_rocket | Smart Rocket | infantry_boost | 1 | no | observed | When equipped to an infantry unit, it grants Heavy Weapon Perk and adds 3 Firepower. The Rebel Alliance only has soldiers, so based on rank 0, the first hit deals 6 damage, ignoring enemy evasion. |
| smoke_shell | Smoke Shell | infantry_boost | 2 | no | observed | Adds 2 Evasion when equipped by an Infantry Unit. |
| stinger_pistol | Stinger Pistol | infantry_boost | 2 | no | observed | When equipped on an infantry unit, any enemy units that survive an engagement with that unit are incapacitated for 2 turns. |
| base_shield | Base Shield | base_boost | 2 | yes | observed + inferred starter | Rehabilitate the destroyed shields, or overdose the alive shields. The overcharged shield lasts until the next turn starts. |
| blaster_cannon | Blaster Cannon | base_boost | 1 | no | observed | When used, it attacks a random enemy with 1 damage. The number of attacks is equal to the number of other cards used while holding this card. The number of attacks is displayed at the bottom right of the card.https://en.namu.wiki/w/%EC%8A%A4%ED%83%80%EC%9B%8C%EC%A6%88%20%EB%B0%B0%ED%8B%80%ED%94%84%EB%A1%A0%ED%8A%B8/%EB%B2%A0%EC%9D%B4%EC%8A%A4%20%EC%BB%A4%EB%A7%A8%EB%93%9C#fn-1 |
| infantry_turret | Infantry Turret | base_boost | 1 | no | observed | Charges base cannon energy to maximum. |
| antipersonnel_mines | Antipersonnel Mines | base_boost | 2 | no | observed | The first unit to reach range 1 after placing on the base takes 6 damage. |
| scout_binoculars | Scout Binoculars | base_boost | 2 | no | observed | A new star card is drawn, and units can attack anywhere on the board. As it is perfectly compatible with the new command, it is also a semi-required card. |
| squad_shield | Squad Shield | base_boost | 1 | no | observed | Rebuilds all base shields and overcharges for one turn. |
| support_droid | Support Droid | base_boost | 2 | no | observed | Restores 3 base HP. Essential for some sieges where the base starts with low health. |
| trap | Trap | base_boost | 2 | yes | observed + inferred starter | When an enemy unit attempts to infiltrate the base, it is immediately destroyed. |
| vehicle_turret | Vehicle Turret | base_boost | 1 | no | observed | Base Cannon's next attack is doubled. |
| ultrasonic_bomb | Ultrasonic Bomb | base_boost | 1 | no | observed | Remove all shields and deal 1 damage. |
| bombardment | Bombardment | attack | 2 | yes | observed + inferred starter | Deal 2 damage to all units in an area. |
| dioxis_grenade | Dioxis Grenade | attack | 2 | no | observed | All enemies within the coordinates are poisoned and lose 2 HP per turn. |
| disruptor_rifle | Disruptor Rifle | attack | 1 | no | observed | All aircraft enemies on the board are halved based on their maximum health. |
| shock_fuse_grenade | Shock Fuse Grenade | attack | 2 | no | observed | Deal 5 damage to a unit. |
| inner_perimeter | Inner Perimeter | attack | 2 | yes | observed + inferred starter | Deal 2 damage to all enemies at range 1. |
| ion_blast | Ion Blast | attack | 2 | yes | observed + inferred starter | All enemies within 1-2 range take 1 damage and lose their perk. Invalid against enemy hero units. |
| ion_grenade | Ion Grenade | attack | 2 | no | observed | Removes the shields of all enemies within the coordinates and deals 3 damage. |
| orbital_strike | Orbital Strike | attack | 1 | no | observed | Deal 5 damage to all enemies in the area. A semi-required card. |
| proximity_bomb | Proximity Bomb | attack | 1 | no | observed | Deal 5 damage to a unit. |
| shock_grenade | Shock Grenade | attack | 2 | no | observed | All units within the coordinates are incapacitated once and take 2 damage. |
| thermal_detonator | Thermal Detonator | attack | 1 | no | observed | Deal 4 damage to all enemies within the coordinates. |
| thermal_imploder | Thermal Imploder | attack | 1 | no | observed | Remove one unit immediately and discard it. If you put it in, the time to write it will come. |
| elite_training | Elite Training | unit_boost | 2 | yes | observed + inferred starter | When equipped on a unit card, it advances by 1 rank. It is very effective for A-wing, where quick promotion is key. |
| new_orders | New Orders | unit_boost | 2 | yes | observed + inferred starter | When equipped on a unit card, it can attack anywhere on the board. A semi-required card. |
| squad_leader | Squad Leader | unit_boost | 2 | yes | observed + inferred starter | Grants Squad Leader Perk when equipped on a unit card. |
| war_veteran | War Veteran | unit_boost | 2 | yes | observed + inferred starter | Adds 2 ATK when equipped to a unit card. |
| millennium_falcon | Millennium Falcon | special_unit | 1 | no | observed | Unit-like star card: Atk 3 / FP 5 / Eva 2 / HP 6 / Shield 1; First Strike, Squad Leader |
| r5_d4 | R5-D4 | special_unit | 1 | no | observed | Unit-like star card: Atk 3 / FP 3 / Eva 1 / HP 4; removes enemy perks in coordinate on engage |
| luke_skywalker | Luke Skywalker | hero | 1 | no | observed | Hero unit — stats/specials in [`units.md`](units.md) |
| han_solo | Han Solo | hero | 1 | no | observed | Hero unit — stats/specials in [`units.md`](units.md) |
| leia_organa | Leia Organa | hero | 1 | no | observed | Hero unit — stats/specials in [`units.md`](units.md) |
| nien_nunb | Nien Nunb | hero | 1 | no | observed | Hero unit — stats/specials in [`units.md`](units.md) |
| lando_calrissian | Lando Calrissian | hero | 1 | no | observed | Hero unit — stats/specials in [`units.md`](units.md) |
| chewbacca | Chewbacca | hero | 1 | no | observed | Hero unit — stats/specials in [`units.md`](units.md) |
| jyn_erso | Jyn Erso | hero | 1 | no | observed | Hero unit — stats/specials in [`units.md`](units.md) |

## Shop prices (spend — deferred)

| id | priceCredits | Confidence |
|----|--------------|------------|
| *(non-starter catalog ids)* | TBD | — |
