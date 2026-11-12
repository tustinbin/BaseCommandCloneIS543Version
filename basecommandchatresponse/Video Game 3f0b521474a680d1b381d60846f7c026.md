# Video Game?

# ChatGPT Report on SWBF Base Command Game

I need you to do some deep research. Find everything you possibly can online about the Star Wars battlefront 2015 mobile companion app base command mini game. The game is no longer available I want to recreate a similar type game obviously not with the same ip but I want you to compile everything about the rules cards abilities everything ever. Take as long as you can and make sure everything is accurate. There are a lot of YouTube videos that show people playing this game that could be a good resource

Yes. I dug into this pretty extensively, including **EA’s original documentation, contemporary reviews/guides, archived screenshots, community discussions, and surviving YouTube gameplay references**. The game is much more interesting mechanically than the short descriptions make it sound, and there is enough surviving information to reconstruct a very close **mechanical analogue** without copying the Star Wars IP.

One important caveat up front: **there does not appear to be a surviving official complete rulebook or complete database of every card/stat/level.** So I’m separating what is directly documented from what can be reconstructed from gameplay evidence. I would not want to invent missing numbers and present them as facts.

# Base Command — reconstruction research

[https://images.openai.com/static-rsc-4/DXPvb0yPeA6TLuOH3TdIyS0_3HUA0UPW_gL8bucwkv6oyTeJSRtzHOHNbES815gdAppseerxbaJiE08DPsoGJAKZOSHTojOMfQHGPE5dchqFr6O5pvPy7-EtS3heTxkmr21FugnRkUsJo3WgGcGr2s-jVcQ6m_0499XcldReoB-8gQXfavue4mE8A0jWeZRq?purpose=fullsize](https://images.openai.com/static-rsc-4/RhCfCGPyHl394HcDAWLwxjvpuQOk9AZzm_JQQroEDItZu04cu3Y7QIA1fHdqqiURyZUmhTfGKrYUIXNwCDhf33Phj7Z9RdfI_W3nhRXAJ7VIXEm-YxBaLuoHE-R15QJ3LSxPaOHHK5FLJRFBMN336oWOqumB2t_Qqk8qIxFlSw4?purpose=inline)

[https://images.openai.com/static-rsc-4/yM8xqan-Gk1EKkhlGUtCRJmoo60Xx6xAMWqcAgkEoIXe8Nai9u_uZa4_xeLU_j8giCEHJniCiZupkaLrXEgVmwp-gsBkVsN17Hzb9F8Kiml2jukrn3grH1b2K15L8Cf8T_RY9JAUjXc7YE4RQxlfaj_k49ABJ88LoKcPtyFqyWbGl-zVGeuXI-ZCcwUjd81P?purpose=fullsize](https://images.openai.com/static-rsc-4/HiNtVYR_rbMzZpct2cVrj3jH9HhsWLDEGTdkG8vgb61YIs4ttDeAOgEWkB-v3Lni_l-J0NO9pU8L5FfkaoDfPQl-FWBccwQPVfsddR0xk9jifMVQ7EBU4dNcVwzTVLNDHXNJCwPhzDv7O0q5WdfpzwoAicRtL7zJe7Fd2O53z8c?purpose=inline)

[https://images.openai.com/static-rsc-4/AvBSltISUQP5kmUHow5MO2e6osfW0TkXa3zXM1GQPoQIlb1tCnQG3_gRVRKUF5_W5IgE3qNvIHnhKVDaPAtkMlQBQ7iYsEnw2wWHCMxPVmSTGecB7PNMURqzMvQ4CRL2aZYoo31yys8hbgysqkR_wIkxS3EJwbgCEUce6Roxwm0IKvLNrJ33sOSnBbl4ln6G?purpose=fullsize](https://images.openai.com/static-rsc-4/1vhFjD-JoiNCeV8Z9xMh0bEHmrDCSikSsGdrnoeyJFfCrvOzpw5cn_u8urA0POSxWty-vQFOM2BPGrPIzT4S3uQsOxawOi2y9NPkH4VCrgZucJ42EmAE316xIHPE0kPAOWIhhok4_ML2HsTgxsXQv1BQJr8xY-Qvbwb8BkzgFvE?purpose=inline)

## 1. What Base Command actually was

**Base Command** was the turn-based strategy/card game contained inside the *Star Wars Battlefront* (2015) Companion app, developed by EA/DICE and released alongside the companion experience in November 2015.

It was playable:

- on iOS
- on Android
- through the Battlefront website
- without owning the main *Battlefront* game

The core premise was:

> Defend a Rebel base against advancing Imperial forces.
> 

EA described each individual mission as a **Siege**. Imperial units continually advanced toward the Rebel base, while the player used Rebel units and Star Cards to eliminate them.

The game was essentially a hybrid of:

- tower defense
- turn-based tactics
- collectible/deck-building card mechanics
- miniature/board-game positioning
- light RPG progression

Contemporary reviews specifically described it as having a tabletop miniature-game feel rather than simply being a conventional card game.

---

# 2. The battlefield

This is one of the most important pieces if you're trying to recreate it.

The battlefield was a **circular board surrounding a central base**.

It consisted of:

- **4 quadrants**
- **4 concentric rows/rings**
- a central Rebel base
- directional shield sections around the base

The contemporary description says each quadrant contained four rows, while another contemporary source describes the four ring-like planes surrounding the base.

So conceptually:

```
             QUADRANT
                │
       ┌─────────────────┐
       │      RING 4     │
       │  ┌───────────┐  │
       │  │   RING 3  │  │
       │  │ ┌───────┐ │  │
       │  │ │ RING 2│ │  │
       │  │ │ ┌───┐ │ │  │
       │  │ │ │BASE│ │ │  │
       │  │ │ └───┘ │ │  │
       │  │ └───────┘ │  │
       │  └───────────┘  │
       └─────────────────┘
```

The actual board is divided into four slices:

```
             Ring 4
        ┌───────┬───────┐
        │       │       │
        │   Q1  │  Q2   │
        │       │       │
        ├───────┼───────┤
        │       │       │
        │   Q4  │  Q3   │
        │       │       │
        └───────┴───────┘
```

The combination of **distance from base + quadrant** is fundamental to the game's targeting system.

---

# 3. The objective

You win a Siege by destroying **all Imperial forces** before they destroy the base.

Imperial forces advance toward the base at the end of turns.

The base itself has:

- **shields**
- **health/structure**

One contemporary source describes the base as having **10 total hit points**, protected by four directional shield walls.

The important distinction is that taking damage to the shield is preferable to taking damage directly to the base's structure.

Your end-of-Siege score is influenced by:

- combat performance
- remaining shield
- remaining base health
- units that ranked up
- apparently additional scoring/multiplier mechanics

---

# 4. The hand

This is one of the most firmly documented mechanics.

Every turn, you receive:

### 3 Unit Cards

and

### 3 Star Cards

for a total of **six cards in your hand**.

The game dealt these from your 24-card deck.

This is important:

**The Unit cards and Star cards aren't simply one unified deck.**

They are functionally separate categories.

A contemporary review describes the player having a 24-card starter deck and then receiving three unit cards plus three Star Cards each turn.

---

# 5. The 24-card deck

The Custom Deck screen is particularly valuable evidence here.

A surviving screenshot explicitly says:

> "Build your Star Cards deck for Base Command, consisting of 24 cards."
> 

It also shows cards being assigned quantities, e.g.:

- Flash Grenade ×2
- Suppressive Fire ×2
- Ion Torpedo
- Jump Pack

So a recreation should probably implement:

```
Deck size = 24 Star Cards
```

rather than assuming the player simply selects six cards.

The **Unit Card pool is separate** from the customizable Star Card deck.

---

# 6. Unit Cards

EA explicitly identifies the original Rebel Unit Card types as:

- Rebel Soldier
- A-wing
- T-47 Airspeeder
- X-wing

Other surviving descriptions and gameplay footage show that later versions included more specialized units and hero-type units.

Unit Cards have several important properties.

## Unit statistics

EA specifically identifies:

- firepower
- defense
- health
- number of attacks

So a conceptual unit record looks like:

```
Unit
 ├── Health
 ├── Firepower
 ├── Defense
 ├── Attacks
 ├── Targeting pattern
 ├── Movement/placement rules
 └── possible special abilities
```

---

# 7. Combat

Combat is not simply:

> attack = damage
> 

Instead, units have their own attack counts and defensive statistics.

EA explains that combat continues until:

1. one unit is destroyed, or
2. both units have completed their attacks.

This creates an important distinction between:

- high damage
- high defense
- high health
- multiple attacks

That is one of the mechanics I would preserve in a recreation.

---

# 8. Unit targeting ranges

This is one of the best pieces of surviving documentation.

The first Siege tutorial apparently taught the following targeting ranges:

### Rebel Troopers

Can attack:

**Ring 1**

### T-47 Airspeeders

Can attack:

**Rings 2 and 3**

### X-Wings

Can attack:

**Rings 3 and 4**

### A-Wings

Can attack:

**any unit within one quadrant**

This gives you a very strong foundation for rebuilding the game's tactical identity.

The units aren't merely different damage values.

They have **different geometric targeting rules.**

That's a major part of why the game works.

---

# 9. The Base Cannon

The base itself isn't passive.

It has a **cannon/turret** that charges over time.

At the end of each turn:

- cards are replenished
- the base cannon charges
- Imperial units advance

The cannon is particularly important against protected enemies.

### Protected enemies

An enemy with the **Protected** perk ignores the first attack that would normally damage it.

But:

**the Base Cannon can remove that protection.**

EA specifically uses this as an example of how the cannon changes tactical decision-making.

So the cannon isn't simply:

> "free damage"
> 

It's also a **defensive utility resource**.

---

# 10. Enemy movement

At the end of each turn:

**Imperial forces advance toward the base.**

Contemporary descriptions consistently confirm this.

The game therefore has an extremely simple but effective pressure loop:

```
DRAW
 ↓
ASSESS THREAT
 ↓
PLAY UNITS
 ↓
PLAY STAR CARDS
 ↓
USE BASE CANNON
 ↓
END TURN
 ↓
ENEMIES ADVANCE
 ↓
DRAW NEW CARDS
```

The closer an enemy gets to the base, the more urgent the situation becomes.

---

# 11. Star Cards

This is where the game gets substantially deeper.

Star Cards can:

- strengthen units
- directly damage enemies
- repair the base
- manipulate enemy positions
- manipulate enemy behavior
- create area-of-effect attacks
- provide other battlefield effects

EA specifically gives **Cycler Rifle** as an example of a card that increases a Rebel Soldier's firepower. It gives **Orbital Strike** as an example of direct damage.

---

# 12. Confirmed Base Command card examples

The surviving material gives us a surprisingly large list.

## Damage / attack cards

### Orbital Strike

Deals:

**5 damage to all units in a sector/quadrant**

EA explicitly documents the 5-damage value.

---

### Cycler Rifle

Used on a Rebel Soldier to increase its firepower.

---

### Impact Grenade

Appears in Base Command decks and screenshots.

---

### Barrage

Appears in Base Command.

---

### Ion Blast

Appears in Base Command.

A surviving screenshot shows **Ion Blast ×2**.

---

### Proximity Bomb

Appears in the Base Command card pool.

---

### Suppressive Fire

Appears in the custom deck screen.

The screenshot shows **Suppressive Fire ×2**.

---

# 13. Battlefield manipulation cards

This is where Base Command differs substantially from ordinary tower defense.

Surviving evidence identifies cards such as:

### New Orders

### Defection

### Power Distribution

### Squad Leader

These appear in the surviving Level 60 deck screenshot.

A contemporary review specifically reports that some Star Cards could:

> force Imperial units to attack each other
> 

or

> move Imperial units backward.
> 

That is a huge clue for recreating the game.

The Star Cards weren't just:

```
+damage
+health
heal
```

They could alter the **state of the enemy formation itself**.

---

# 14. Repair / defensive cards

The game also contained cards dedicated to sustaining the base.

Contemporary sources describe the Star Card pool as including:

- perks
- instant damage
- repairs

There were also cards/effects associated with:

- shield manipulation
- power distribution
- defensive positioning

The surviving Level 60 screenshot shows **Power Distribution**.

---

# 15. Card Refresh

**Card Refresh** is another confirmed card.

It appears in the surviving high-level deck screenshot.

The existence of a card-refresh mechanic is important because the six-card hand is otherwise the primary source of randomness.

This gives the player a way to manipulate the draw state.

---

# 16. The discard mechanic

This is one of the more obscure mechanics that doesn't appear in the original EA announcement.

The game's designer later provided tips for the game, and one of them was:

> Discard unwanted cards quickly to gain discard points.
> 

A contemporary strategy guide similarly explains that players could exchange cards **before making another play** during a turn.

That means the player has an additional decision:

```
Keep card
OR
Discard/exchange card
```

rather than simply being forced to play whatever they draw.

---

# 17. You could burn through the deck

The game's designer also specifically advised:

> Don't be afraid to burn through your decks.
> 

That's interesting because it indicates that deck depletion wasn't necessarily an automatic failure state.

Instead, cycling through cards was part of optimal play.

---

# 18. Unit ranking

Another very important mechanic:

**Rebel units can rank up.**

The surviving guide specifically says:

> Rank up your units for maximum power.
> 

And the scoring documentation says units can rank up by winning fights, with those rank-ups contributing to the final Siege score.

This gives the game a lightweight progression system inside each individual battle.

Conceptually:

```
Rebel Soldier
      ↓ wins combat
Veteran Soldier
      ↓ wins combat
Elite Soldier
```

I have **not** found sufficiently reliable documentation for the exact numeric rank progression, so I wouldn't invent those values yet.

---

# 19. Score multiplier

Base Command had a **kill streak / score multiplier** system.

A surviving 2015 guide gives a surprisingly precise description:

- starts at **1×**
- killing an enemy without losing one of your own increases it
- maximum is **4×**
- losing one of your units reduces it by 1
- repeated losses eventually bring it back to 1×

This matters enormously because the goal isn't merely:

> "survive."
> 

For three-star scores, you want:

> **survive while maintaining an efficient kill streak.**
> 

---

# 20. Three-star scoring

Sieges receive a:

- 1-star
- 2-star
- 3-star

rating.

The star rating determines the credit reward.

The first Siege reportedly required approximately **4,000 points** for three stars.

The scoring system considers things such as:

- enemies defeated
- combat performance
- remaining base shield
- remaining base health
- unit rank-ups
- score multiplier

And importantly, the guide says you should try to have **your own units deliver the finishing blow**, because that can help them rank up and generate more score.

---

# 21. Credit rewards

The documented first-Siege reward structure was:

| Stars | Additional credit reward |
| --- | --- |
| 1 | 60 |
| 2 | +100 |
| 3 | +250 |

So reaching three stars yielded a cumulative **410 credits** from those star rewards.

However, you **could not repeatedly farm the same completed Siege for those credits.**

This is useful for understanding the game's original economy, although obviously your recreation wouldn't need the Battlefront-credit system.

---

# 22. Perks

Imperial units could have **Perks**.

These are essentially enemy modifiers.

The most thoroughly documented ones are:

## Protected

The first attack that would normally cause damage does no damage.

The Base Cannon can remove the protection.

---

## Overload

The unit performs **all of its attacks during the first combat round**.

EA's example was Darth Vader with:

**Protected + Overload**

That combination meant:

1. first damaging attack is negated
2. Vader immediately unloads all his attacks
3. many Rebel units die before getting a meaningful chance to respond

This demonstrates that Perks could be **stacked**.

That's an extremely useful design concept for your recreation.

---

# 23. Enemy composition

The game wasn't simply a sequence of identical waves.

EA says each Siege increasingly mixed:

- enemy unit types
- modifiers/perks

Later community discussion also explicitly refers to things such as:

- villains
- VIP targets
- walkers
- different enemy types
- different perks

So later content clearly expanded the threat vocabulary considerably beyond the introductory Stormtrooper-style enemies.

---

# 24. Heroes/Villains as enemies

High-level gameplay included major named Imperial threats.

The EA documentation specifically uses **Darth Vader** as an enemy example.

The community also refers to:

- Vader
- Boba Fett
- other villains
- walkers

as late-game threats.

That means a recreation could have:

```
Normal Enemy
Elite Enemy
Vehicle
Heavy Vehicle
Hero/Villain
Boss
```

rather than relying entirely on numeric scaling.

---

# 25. Campaign structure

There is a slight historical wrinkle here.

### At launch

EA announced:

**50 Sieges**

with increasing difficulty.

The first campaign available during the pre-release period consisted of **8 Sieges**, and all 50 were intended to become available at launch.

But later material refers to **60 levels**, and a December 2015 surviving screenshot/article is explicitly titled:

> "Star Wars Battlefront Base Command Level 60"
> 

So the safest reconstruction is:

**Base Command launched with 50 Sieges and later received additional content, bringing the available level count to at least 60.**

That resolves what otherwise looks like a contradiction.

---

# 26. There were special campaigns

Base Command wasn't completely static.

One confirmed special campaign was:

## Heroes Holiday

Released around Christmas 2015.

It contained:

**4 Sieges**

and used its own predefined deck rather than the standard Starter Deck.

This is significant because it demonstrates that the developers were able to create:

> **scenario-specific decks**
> 

rather than always requiring the player's normal deck.

---

# 27. May the 4th / special campaigns

Community records also refer to a later special campaign associated with **May the 4th**, including an "epic siege."

A 2016 player discussion specifically distinguishes the May the 4th campaign from Heroes Holiday and discusses the desire to replay it.

I would classify the exact rules/content of that event as **partially reconstructed rather than fully verified** until we can recover more gameplay footage.

---

# 28. Daily Siege

There was also a **Daily Siege** system.

Community discussion from 2016 specifically refers to:

- a Daily Siege
- a 24-hour timer
- replaying it for the daily activity

This suggests the long-term structure eventually looked roughly like:

```
Campaign
 ├── standard Sieges
 ├── special campaigns
 └── Daily Siege
```

rather than the original 50-level campaign being the entire game.

---

# 29. The visual board

The surviving screenshots are extremely useful here.

The battlefield has:

- a physical-looking circular board
- miniature-like units
- a central turret/base
- four quadrants
- four concentric rings
- enemy miniatures physically positioned around the board
- an explicit **END TURN** button

This is important because the game isn't visually presenting itself like a conventional 2D tower-defense lane system.

It's much closer to:

**digital tabletop game + tower defense.**

That is probably one of the biggest reasons it had a distinctive feel.

---

# 30. The UI

From surviving screenshots, the UI included things like:

- score
- star progress
- base status
- enemy count
- cards
- discard
- end-turn button
- battlefield status

The custom deck interface also clearly showed:

```
CARDS IN DECK
8/24
```

and individual card quantities.

---

# 31. The original Starter Deck

The original game had a **24-card starter deck**.

It was sufficient for early Sieges, but contemporary strategy guides say that custom decks became increasingly important later, particularly against:

- AT-ATs
- hero characters
- larger concentrations of enemies

So the progression was essentially:

```
Starter Deck
     ↓
Learn mechanics
     ↓
Unlock more Star Cards
     ↓
Build specialized decks
     ↓
Construct decks around particular Siege threats
```

---

# 32. Deck specialization

This was explicitly encouraged.

For example, a strategy guide recommends:

### Against lots of AT-ATs

Use:

- direct-fire cards
- grenades
- concussion-type attacks
- A-Wings

### Against many weak enemies

Use:

- Bombardment
- Ion Blast
- area-of-effect attacks

So the game had something very close to **scenario-specific deckbuilding**.

---

# 33. Important card list recovered so far

Here is the most useful working inventory I can establish from the surviving material.

### Offensive / damage

- Orbital Strike
- Ion Blast
- Barrage
- Impact Grenade
- Proximity Bomb
- Cycler Rifle
- Bombardment
- Suppressive Fire

### Tactical / manipulation

- New Orders
- Defection
- Squad Leader
- Power Distribution
- Card Refresh

### Mobility / utility

- Jump Pack
- Ion Torpedo
- Flash Grenade

There are almost certainly additional cards.

The surviving screenshots establish several of these visually, while contemporary descriptions establish others.

**I would not yet treat that as the complete card list.**

---

# 34. The interesting thing about the Star Cards

A recreation shouldn't simply turn them into generic:

```
+10 damage
heal 20
```

cards.

The original game's interesting cards interact with the **board geometry and combat system**.

Examples:

### Orbital Strike

```
Choose quadrant
↓
5 damage to every unit there
```

### Unit attack

```
Check unit's targeting pattern
↓
Select legal enemy
↓
Resolve combat
```

### Defection

Potentially changes:

```
Enemy → enemy combat
```

### New Orders

Changes enemy behavior/position.

### Protected

Changes the rules of the next attack.

That is much closer to a tactical board game than a traditional collectible card game.

---

# 35. Why the game was strategically interesting

The game has several simultaneous resources:

### 1. Cards

What can I do this turn?

### 2. Board position

Where are the enemies?

### 3. Time

Every turn makes things worse.

### 4. Base Cannon

Do I use it now or save it?

### 5. Units

Do I risk this unit for a kill/rank-up?

### 6. Score multiplier

Can I maintain my streak?

### 7. Base health

Can I afford to let something through?

### 8. Deck composition

Did I bring the right tools for this Siege?

That combination is probably the core design worth recreating.

---

# 36. The combat/turn loop reconstructed

The best-supported reconstruction is approximately:

```
START SIEGE
     │
     ▼
Draw 3 Unit Cards
Draw 3 Star Cards
     │
     ▼
Player may exchange/discard cards
     │
     ▼
Deploy/use Unit Cards
     │
     ├── Unit attacks
     │
     ├── Unit-vs-unit combat
     │
     └── Unit may rank up
     │
     ▼
Play Star Cards
     │
     ├── Damage
     ├── Buff
     ├── Repair
     ├── Manipulate enemies
     └── Battlefield effects
     │
     ▼
Fire Base Cannon if desired
     │
     ▼
END TURN
     │
     ▼
Enemy units advance
     │
     ▼
Enemy attacks / resolves movement
     │
     ▼
Check Base Health
     │
 ┌───┴────┐
 │        │
0 HP    Still alive
 │        │
LOSS      ▼
       Draw new hand
          │
          ▼
        Repeat
```

This is a very good starting specification for a remake.

---

# 37. The biggest mechanic I would preserve: geometry

If you're making a new IP version, **I would preserve the ring/quadrant system almost exactly at the mechanical level**, while changing the theme, names, art, and terminology.

Why?

Because this is the game's actual strategic identity.

For example:

```
Infantry:
Range = 1 ring

Fast Aircraft:
Range = rings 2–3

Long-range Aircraft:
Range = rings 3–4

Interceptor:
Range = one quadrant
```

That creates natural asymmetric units without needing hundreds of complicated abilities.

---

# 38. A potentially better recreation structure

If your eventual goal is to actually build this, I would model it as:

### Battlefield

```
4 quadrants
4 rings
16 board zones
1 central base
```

### Player resources

```
Base HP
Base Shield
Cannon Charge
Score Multiplier
Deck
Discard
Unit Rank
```

### Cards

```
Unit Cards
Star Cards
```

### Unit attributes

```
HP
Attack
Defense
Attack Count
Range
Targeting Pattern
Movement
Faction
Tags
Perks
```

### Enemy attributes

```
HP
Attack
Defense
Attack Count
Movement
Range
Perks
Target Priority
```

### Turn

```
Draw
Discard/Exchange
Player Actions
Combat
Cannon
Enemy Advance
Enemy Combat
Scoring
```

---

# 39. What I would NOT copy directly

For an original game, I would avoid copying:

- Rebel/Imperial terminology
- Star Wars character names
- Star Wars vehicle designs
- Star Wars card names
- Star Wars artwork
- exact character abilities
- distinctive Star Wars visual presentation

The **underlying game mechanics** are a much safer and more useful source of inspiration.

For example:

### Original

> A-Wing attacks any enemy in a quadrant.
> 

### New game

> Interceptor attacks any enemy within one sector.
> 

Same *kind* of tactical mechanic, but a new game identity.

---

# 40. The YouTube material

I found two particularly useful surviving gameplay videos from the launch period:

**BattlefrontUpdates — "Star Wars Battlefront Beta: Base Command Gameplay & Guide/Walkthrough"**, published October 6, 2015. This is particularly useful because it is from the beta-era implementation and shows the game before the full launch.

[Watch the BattlefrontUpdates Base Command gameplay/guide](https://www.youtube.com/watch?v=DrQvVACTwVU&utm_source=chatgpt.com)

And:

**CharminEXSoft Gaming — "Star Wars Battlefront Companion App - Base Command Gameplay"**, published October 13, 2015.

[Watch the CharminEXSoft Base Command gameplay](https://www.youtube.com/watch?v=wOoIW-MVkno&utm_source=chatgpt.com)

These are particularly valuable because **video can reveal mechanics that text guides never documented**, such as:

- exact card animations
- targeting restrictions
- how combat resolves
- how enemies move
- how the cannon works
- card draw behavior
- animations for perks
- exact board layout
- score changes
- unit rank-up behavior
- end-of-Siege scoring

---

# 41. There is also a fascinating surviving Level 60 screenshot

This is one of the strongest pieces of evidence I found because it demonstrates that the game eventually extended beyond the originally announced 50 Sieges.

The surviving screenshot shows a high-level deck containing:

- Card Refresh
- Barrage
- Squad Leader
- Defection
- Impact Grenade
- Infantry Turret
- Ion Blast
- Princess Leia
- New Orders
- Orbital Strike
- Power Distribution
- Proximity Bomb

That gives us a much richer picture of late-game design than the original EA launch article.

---

# 42. The game was still playable long after launch

There is a useful historical trail here.

In 2021, players reported that the mobile application had effectively become unusable after iOS updates.

But the **web implementation survived for years afterward**.

In 2023, an EA forum user reported being able to log into:

`api.battlefront.dice.se`

and still play Base Command, including the Daily Siege system, although synchronization with the main game no longer worked.

By 2024, players were reporting that even that remaining access had disappeared.

And by 2026, community posts describe the game as effectively shut down.

So your premise is correct: **the original game is effectively unavailable now.**

---

# 43. One important correction to the common description

You'll see people describe Base Command as a "card game."

That's technically true, but incomplete.

It's better understood as:

> **a turn-based, card-driven tower-defense tactics game played on a radial miniature-style battlefield.**
> 

The cards are only one part.

The other critical component is:

**positional geometry.**

That's why simply recreating the card effects without the four-quadrant/four-ring board would lose a large portion of what made Base Command feel like Base Command.

---

# 44. My current confidence levels

Here's how I would classify the reconstruction.

### Very high confidence

These are directly supported by EA or multiple contemporary sources:

- 4 quadrants
- 4 rings/rows
- central base
- 3 Unit Cards per turn
- 3 Star Cards per turn
- 24-card Star Card deck
- enemies advance each turn
- Base Cannon
- Base Shield + Base Health
- unit health
- firepower
- defense
- attack count
- unit combat
- Protected
- Overload
- Orbital Strike = 5 damage
- Rebel Soldier / A-Wing / T-47 / X-Wing
- three-star scoring
- unit ranking
- score multiplier
- 50 initial Sieges
- later content reaching at least Level 60
- custom decks
- special campaigns
- Daily Siege

### Medium confidence

Supported by contemporary guides/screenshots/community evidence:

- exact discard/exchange behavior
- exact score multiplier behavior
- additional card pool
- later enemy types
- heroes/villains
- specific battlefield manipulation effects
- exact base HP/shield implementation
- special-event content

### Still needs reconstruction from video

These are the areas I would **not pretend we have completely solved yet**:

- every Unit Card's exact stats
- every Imperial unit's exact stats
- every Star Card's exact effect
- every Perk
- exact movement rules for every enemy
- exact combat formula
- critical-hit formula
- exact rank-up formula
- exact score formula
- exact deck-discard algorithm
- exact draw algorithm
- all 60+ Siege configurations
- all special-event Siege configurations
- exact Daily Siege generation/rotation
- exact card quantities permitted in a 24-card deck

Those are the things that would be most valuable to extract from old gameplay footage.

---

# 45. The really useful next step

I don't think we should stop at this research summary.

If your actual goal is **"I want to recreate Base Command-like gameplay"**, the next stage should be a proper **reverse-engineering document**.

I'd structure it as:

### A. Core rules specification

A complete turn-by-turn ruleset.

### B. Battlefield specification

Every ring/quadrant and every targeting pattern.

### C. Unit database

Something like:

| Unit | HP | Attack | Defense | Attacks | Range | Target pattern | Special |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Infantry | ? | ? | ? | ? | 1 | Ring | — |
| Airspeeder | ? | ? | ? | ? | 2–3 | Rings | — |
| Fighter | ? | ? | ? | ? | 3–4 | Rings | — |
| Interceptor | ? | ? | ? | ? | ? | Quadrant | — |

### D. Star Card database

For **every card**:

```
Name
Type
Quantity allowed
Target
Range
Damage
Healing
Buff
Debuff
Movement
Duration
Cost
Special rules
```

### E. Perk database

```
Protected
Overload
...
```

### F. Enemy database

Including every normal enemy, vehicle, hero/villain, VIP, walker, etc.

### G. Siege database

Ideally:

```
Siege 1
  Enemy waves
  Enemy positions
  Perks
  Special rules
  Score target

Siege 2
  ...

...

Siege 60
```

### H. Video evidence log

For every uncertain mechanic:

```
Mechanic
Video
Timestamp
Observed behavior
Confidence
```

That last part is especially important because **the videos are our best remaining primary evidence**.

---

## Bottom line

There is actually **far more recoverable information about Base Command than I expected**. We have enough to confidently reconstruct its fundamental design:

**24-card deck → 3 unit + 3 power draw → radial four-quadrant/four-ring battlefield → tactical targeting → unit-vs-unit combat → Star Card manipulation → Base Cannon → enemy advance → escalating Siege → rank-ups/multiplier → three-star scoring.**

The most interesting parts to preserve are **not the Star Wars theme**. They're the radial board, asymmetric unit ranges, six-card hand, enemy advance, unit progression, cannon resource, enemy perks, and cards that manipulate the battlefield.

And I would **not yet start coding** based on this document alone. The biggest remaining value is extracting the exact mechanics and numbers from the surviving gameplay videos and screenshots. That would let us turn this from a conceptual recreation into an actual **Base Command mechanical specification** without guessing.

Have there been any games made since the closure of base command intended to recreate the gameplay? Anything someone has said online about a spiritual successor?

Yes. I searched specifically for **post-closure projects, spiritual-successor discussions, remakes, clones, and games people recommended as substitutes**. The result is actually pretty interesting:

**I did not find a known released game that is a deliberate, direct spiritual successor to Base Command.** I also did not find evidence of a serious fan remake that reached a playable public release.

But there is a surprisingly clear record of people saying **they wanted exactly that**, and there are a few adjacent games/mechanics worth investigating.

### The clearest evidence: people explicitly asked for a successor

In December 2022, someone on r/StarWars asked:

> “Does anyone know if there are any games like the Star Wars Base Command game... Are there any plans to further develop a game like it?”
> 

They specifically described wanting something either Star Wars-themed or a **“turn-based card/tower defense play-style.”**

That's basically the exact niche you're describing.

And this wasn't an isolated sentiment. On EA's own forums, after Base Command became inaccessible, players were explicitly saying that if someone could **“program up a replacement”**, they wanted to know about it. Other users were asking EA to reactivate the game because they had continued playing it for years.

There are also old EA forum discussions where people were still playing Base Command daily and asking for a similar experience in a hypothetical Battlefront II companion app.

### What I *didn't* find

I searched combinations around:

- `"Base Command" spiritual successor`
- `"Base Command" remake`
- `"Base Command" replacement`
- `"Base Command" inspired`
- `"Battlefront Base Command" game`
- `"Battlefront Base Command" indie`
- `"Star Wars Base Command" itch.io`
- `"Star Wars Base Command" Steam`
- `"Base Command" similar game`
- Reddit discussions
- EA forums
- Steam
- itch.io-related results

I did **not** find a project where someone said something like:

> "I'm making an original game specifically based on Battlefront Base Command."
> 

That is actually notable.

There are plenty of **Star Wars fan projects** and generic strategy/card/tower-defense games, but I haven't found evidence of a recognizable Base Command successor.

---

## There is one especially interesting historical clue

Back in 2015, players were already recognizing that Base Command had a distinct board-game quality.

On NeoGAF, one player described the **“Base Command miniature game”** as surprisingly good and said they could easily imagine Fantasy Flight Games turning it into a physical board game using their X-Wing miniatures and cards.

That's significant because it identifies something we've been circling around in the previous research:

**People didn't primarily love Base Command because it was a Star Wars card game.**

They liked the **miniature tactical-board-game structure**.

That also helps explain why there isn't an obvious modern replacement. The combination is unusual:

> **tower defense + tactical board positioning + card deckbuilding + PvE survival + miniature-game presentation**
> 

Most games pick two or three of those, not all five.

---

# There are games that overlap with pieces of it

I wouldn't call these Base Command successors, but they're worth looking at for design inspiration.

### Into the Breach

Probably one of the closest games conceptually in terms of **small-board tactical decision-making**.

It has:

- discrete turns
- enemy telegraphs
- positional tactics
- asymmetric units
- very constrained battlefields
- PvE defense objectives

But it has **no card/deck system** and is much more of a tactics game.

### Monster Train

This gets closer to the **card + defense** side.

It has:

- deckbuilding
- PvE waves
- increasingly difficult encounters
- strategic card selection
- defensive positioning

But its battlefield is completely different.

### Slay the Spire

Strong on:

- deckbuilding
- card combinations
- strategic resource management
- escalating PvE

But essentially no positional defense component.

### Plants vs. Zombies

Strong on:

- defend-the-base structure
- advancing enemy waves
- unit placement
- asymmetric enemy types

But it's real-time lane defense rather than turn-based tactical card play.

### XCOM / tactical board games

These overlap with the **unit positioning and asymmetric combat**, but don't have Base Command's card-driven resource system.

---

# The closest *conceptual* genre may actually be "deckbuilding tower defense"

That's the search category I'd use if we were trying to find modern descendants.

Not:

> Star Wars Base Command clone
> 

but:

> **turn-based deckbuilding tower defense**
> 

and:

> **card-based tactical tower defense**
> 

and:

> **turn-based defense deckbuilder**
> 

The problem is that most games using "deckbuilder tower defense" terminology are substantially different from Base Command.

---

# There's also evidence that EA simply abandoned the concept

This is worth emphasizing because it explains why we don't see a successor.

Base Command continued to work through the web for a surprisingly long time. In 2018, users were still describing ways to access the Daily Siege through the old EA site, albeit with repeated connection attempts.

Later, users discovered the old API/web version and attempted to keep it functioning. Eventually that disappeared too. By 2024, the EA forum thread was essentially documenting the end of the remaining service, with users explicitly asking for a replacement and expressing frustration that EA wasn't interested in reviving it.

I haven't found evidence that EA ever announced:

- a Base Command 2
- a replacement mini-game
- a remastered Base Command
- an offline version
- a standalone Base Command release

And Battlefront II's companion experience didn't replace it with another equivalent mini-game.

---

# This actually makes your idea more interesting

There appears to be a **genuine abandoned design niche** here.

The historical evidence gives us three separate signals:

**1. Players liked Base Command independently of Battlefront.**

The App Store review archive contains users saying Base Command itself was enough reason to value the app and asking EA to update it despite the sunset.

**2. Players explicitly asked for a successor.**

Both Reddit and EA forums contain people looking for something similar after it disappeared.

**3. Nobody seems to have filled the niche.**

That's the unusual part.

---

## And I think this changes what we should do with your project

Rather than thinking:

> "I want to clone an old Star Wars mobile game."
> 

I'd frame the design research as:

> **"What would Base Command look like if its underlying game mechanics were developed into a modern standalone game?"**
> 

That's considerably more interesting.

We could take the original mechanical DNA:

**4 × 4 radial battlefield**

→ **asymmetric unit ranges**

→ **six-card hand**

→ **24-card deck**

→ **enemy advance**

→ **unit leveling**

→ **enemy perks**

→ **base shields**

→ **base weapon**

→ **score multiplier**

→ **three-star objectives**

→ **scenario-specific deckbuilding**

and then ask:

**What would we change if we weren't constrained by being a Battlefront companion app?**

For example, Base Command's original design was clearly constrained by its purpose as a **companion/credit-earning game**. It didn't need to carry an entire standalone game's progression system.

A modern standalone version could potentially have:

- a campaign
- persistent unit upgrades
- unlockable factions
- procedural Sieges
- challenge modes
- daily challenges
- roguelite runs
- multiple base types
- dozens of enemy archetypes
- card rarity
- card upgrading
- branching campaigns
- boss encounters
- possibly asynchronous challenges

while keeping the **core Base Command combat loop**.

And importantly, **we wouldn't have to copy Star Wars at all**.

The original concept is generic enough that you could make something like:

> **A sci-fi frontier colony defending itself against increasingly sophisticated alien/mechanical assaults.**
> 

Infantry, drones, artillery, interceptors, shields, orbital weapons, etc. could occupy the same *mechanical roles* without reproducing Star Wars assets or terminology.

### My conclusion from this search

**No obvious spiritual successor exists.** There are players who have explicitly wanted one, there are scattered recommendations for vaguely similar games, and there are historical comments recognizing Base Command as unusually well suited to a standalone tabletop-style game. But I couldn't find a serious post-closure project that actually took up that mantle.

So if your goal is to build something inspired by it, **you aren't stepping into a crowded field of existing Base Command clones.** The more difficult part is going to be reconstructing the original mechanics accurately—which is exactly where the research we're already doing becomes valuable.