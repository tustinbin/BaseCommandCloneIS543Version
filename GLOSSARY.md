# Base Command Clone

Domain language for the IS543 Option B Base Command–style siege deck game. Numbers and catalogs live in [`bible/`](bible/); this file is vocabulary only.

## Language

**Evasion**:
Flat reduction per hit: damage = max(0, firepower − evasion). Apparent “whiffs” are usually high evasion, not a separate miss roll.
_Avoid_: Defense, agility (video alias only)

**Protect**:
Perk that ignores the first damaging hit. Distinct from unit shield layers. Thermal Imploder bypasses it. Crit does not pierce Protect — a crit that would damage still consumes Protect like a normal hit.
_Avoid_: Calling shield layers “Protect”

**Unit shields**:
Layers that block N attacks; may regen +1 at turn end; cleared by Ion Grenade in coordinate. Not the Protect perk.

**Star deck**:
The player-built 24-card Star Card deck (primary CRUD entity).
_Avoid_: Unit deck

**Hero-in-deck**:
Heroes are Star Cards in the star deck; max one hero per deck; heroes do not rank up.

**Starter unlock**:
Star Cards marked starter in the bible; owned at signup. Non-starters appear in the shop locked until unlock rules/currency exist.

**Star pot**:
Fixed currency granted the first time a player earns a given star level on a siege. Not a shop item.
_Avoid_: Treating star pots as purchasable shop rows

**Commander name**:
Display name at signup; shown on leaderboards instead of email.

**SiegeEngine**:
Pure game-run module for one siege (board, turns, combat, draws, score). No Firebase. Implementation language follows the client (Flutter/Dart first).
_Avoid_: “Pure Swift seam” as the definition

**ProgressionService**:
Module for currency, star claims, unlocks, decks, leaderboard persistence. UI stays thin over this seam.
_Avoid_: Scattering progression only in widgets/views
