#!/usr/bin/env python3
"""Compile bible/*.md tables into content/*.json for the app.

Edit bible/ first, then re-run: python content/build_from_bible.py
"""
from __future__ import annotations

import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIBLE = ROOT / "bible"
OUT = Path(__file__).resolve().parent


def write(name: str, data: object) -> None:
    path = OUT / name
    path.write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"wrote {path.relative_to(ROOT)}")


def parse_pipe_table(lines: list[str]) -> list[dict[str, str]]:
    rows: list[dict[str, str]] = []
    headers: list[str] | None = None
    for line in lines:
        line = line.strip()
        if not line.startswith("|"):
            if headers is not None and rows:
                break
            continue
        cells = [c.strip() for c in line.strip("|").split("|")]
        if all(re.fullmatch(r":?-{3,}:?", c.replace(" ", "")) for c in cells):
            continue
        if headers is None:
            headers = cells
            continue
        rows.append(dict(zip(headers, cells)))
    return rows


def section_after(text: str, heading: str) -> str:
    m = re.search(rf"^## {re.escape(heading)}\s*$", text, re.M)
    if not m:
        raise SystemExit(f"missing heading: {heading}")
    rest = text[m.end() :]
    nxt = re.search(r"^## ", rest, re.M)
    return rest if nxt is None else rest[: nxt.start()]


def build_star_cards() -> dict:
    text = (BIBLE / "star-cards.md").read_text(encoding="utf-8")
    amb_rows = parse_pipe_table(section_after(text, "Ambiguity / review list (not required for starter MVP engine)").splitlines())
    deck_rows = parse_pipe_table(section_after(text, "Default starter deck (signup)").splitlines())
    cat_rows = parse_pipe_table(section_after(text, "Catalog").splitlines())

    ambiguous_ids = [r["id"] for r in amb_rows if "id" in r]
    cards = []
    for r in cat_rows:
        starter = r["starter"].lower() == "yes"
        cards.append(
            {
                "id": r["id"],
                "name": r["name"],
                "category": r["category"],
                "maxCopies": int(r["maxCopies"]),
                "starter": starter,
                "confidence": r["confidence"],
                "effect": r["effect"],
                "ambiguous": r["id"] in ambiguous_ids,
                "priceCredits": None,
            }
        )

    starter_deck = [{"starCardId": r["id"], "quantity": int(r["qty"])} for r in deck_rows]
    total = sum(e["quantity"] for e in starter_deck)
    if total != 24:
        raise SystemExit(f"starter deck qty sum {total} != 24")

    owned = sorted({c["id"] for c in cards if c["starter"]})
    return {
        "schemaVersion": 1,
        "source": "bible/star-cards.md",
        "cards": cards,
        "defaultStarterDeck": starter_deck,
        "ownedAtSignup": owned,
        "ambiguousIds": ambiguous_ids,
    }


def build_perks() -> dict:
    text = (BIBLE / "perks.md").read_text(encoding="utf-8")
    # First table in file
    rows = parse_pipe_table(text.splitlines())
    perks = [
        {
            "id": r["id"],
            "name": r["Name"],
            "definition": r["Definition"],
            "confidence": r["Confidence"],
        }
        for r in rows
        if "id" in r and r["id"] != "id"
    ]
    return {
        "schemaVersion": 1,
        "source": "bible/perks.md",
        "perks": perks,
        "unitShields": {
            "blockAttacks": True,
            "regenPerTurnEnd": 1,
            "clearedBy": "ion_grenade",
        },
        "luckCritChance": 0.35,
    }


def build_units() -> dict:
    return {
        "schemaVersion": 1,
        "source": "bible/units.md",
        "playerRegular": [
            {
                "id": "rebel_soldier",
                "name": "Rebel Soldier",
                "range": {"kind": "fixed", "rings": [1]},
                "ranks": [
                    {"rank": 0, "attacks": 3, "firepower": 3, "evasion": 1, "health": 6},
                    {"rank": 1, "attacks": 3, "firepower": 3, "evasion": 1, "health": 7},
                    {"rank": 2, "attacks": 4, "firepower": 3, "evasion": 1, "health": 7},
                    {"rank": 3, "attacks": 4, "firepower": 4, "evasion": 1, "health": 7},
                ],
            },
            {
                "id": "t47_airspeeder",
                "name": "T-47 / Snowspeeder",
                "range": {"kind": "fixed", "rings": [2, 3]},
                "ranks": [
                    {"rank": 0, "attacks": 2, "firepower": 4, "evasion": 2, "health": 7},
                    {"rank": 1, "attacks": 2, "firepower": 4, "evasion": 2, "health": 8},
                    {"rank": 2, "attacks": 3, "firepower": 4, "evasion": 2, "health": 8},
                    {"rank": 3, "attacks": 3, "firepower": 5, "evasion": 2, "health": 8},
                ],
            },
            {
                "id": "a_wing",
                "name": "A-Wing",
                "range": {
                    "kind": "zone_unlock",
                    "byRank": {0: "zone_1", 1: "zone_2", 2: "zone_3", 3: "all_zones"},
                },
                "ranks": [
                    {"rank": 0, "attacks": 2, "firepower": 4, "evasion": 3, "health": 7},
                    {"rank": 1, "attacks": 2, "firepower": 4, "evasion": 3, "health": 7},
                    {"rank": 2, "attacks": 3, "firepower": 4, "evasion": 3, "health": 7},
                    {"rank": 3, "attacks": 3, "firepower": 5, "evasion": 3, "health": 8},
                ],
            },
            {
                "id": "x_wing",
                "name": "X-Wing",
                "range": {"kind": "fixed", "rings": [3, 4]},
                "ranks": [
                    {"rank": 0, "attacks": 2, "firepower": 5, "evasion": 2, "health": 7},
                    {"rank": 1, "attacks": 2, "firepower": 5, "evasion": 2, "health": 8},
                    {"rank": 2, "attacks": 3, "firepower": 5, "evasion": 2, "health": 8},
                    {"rank": 3, "attacks": 3, "firepower": 6, "evasion": 2, "health": 8},
                ],
            },
        ],
        "playerHeroes": [
            {
                "id": "luke_skywalker",
                "name": "Luke Skywalker",
                "attacks": 3,
                "firepower": 4,
                "evasion": 4,
                "health": 7,
                "shield": 0,
                "perks": ["squad_leader", "behemoth"],
                "special": "Push engaged enemy 1 space; +2 evasion vs Vader",
            },
            {
                "id": "han_solo",
                "name": "Han Solo",
                "attacks": 3,
                "firepower": 5,
                "evasion": 3,
                "health": 7,
                "shield": 0,
                "perks": ["first_strike", "rage"],
                "special": "On win: 2 discard points; retrieve Millennium Falcon if used/discarded",
            },
            {
                "id": "leia_organa",
                "name": "Leia Organa",
                "attacks": 3,
                "firepower": 5,
                "evasion": 5,
                "health": 5,
                "shield": 1,
                "perks": ["protect", "ion_weapon"],
                "special": "On engage: strip all enemy perks in that coordinate",
            },
            {
                "id": "nien_nunb",
                "name": "Nien Nunb",
                "attacks": 2,
                "firepower": 3,
                "evasion": 4,
                "health": 5,
                "shield": 0,
                "perks": ["heavy_weapons", "overload"],
                "special": "On win: pick 1 of 3 star cards (2 up, 1 down)",
            },
            {
                "id": "lando_calrissian",
                "name": "Lando Calrissian",
                "attacks": 5,
                "firepower": 3,
                "evasion": 3,
                "health": 8,
                "shield": 0,
                "perks": ["heavy_weapons", "luck"],
                "special": "On win: retrieve Nien if used/discarded",
            },
            {
                "id": "chewbacca",
                "name": "Chewbacca",
                "attacks": 2,
                "firepower": 6,
                "evasion": 2,
                "health": 8,
                "shield": 0,
                "perks": ["first_strike", "overload"],
                "special": "Push all enemies 1; retrieve Han if used/discarded",
            },
            {
                "id": "jyn_erso",
                "name": "Jyn Erso",
                "attacks": 1,
                "firepower": 1,
                "evasion": 3,
                "health": 7,
                "shield": 0,
                "perks": ["first_strike", "behemoth"],
                "special": "Set enemy evasion to 0; redraw all unit cards",
            },
        ],
        "specialUnits": [
            {
                "id": "millennium_falcon",
                "attacks": 3,
                "firepower": 5,
                "evasion": 2,
                "health": 6,
                "shield": 1,
                "perks": ["first_strike", "squad_leader"],
            },
            {
                "id": "r5_d4",
                "attacks": 3,
                "firepower": 3,
                "evasion": 1,
                "health": 4,
                "shield": 0,
                "perks": [],
                "special": "Removes enemy perks in coordinate on engage",
            },
        ],
        "enemyRegular": [
            {
                "id": "probe_droid",
                "name": "Probe Droid",
                "rank0": {"attacks": 3, "firepower": 3, "evasion": 1, "health": 4},
                "rank3": {"attacks": 4, "firepower": 4, "evasion": 1, "health": 6},
                "perks": ["speed_acceleration"],
                "notes": "spawns extras",
            },
            {
                "id": "stormtrooper",
                "name": "Stormtrooper",
                "rank0": {"attacks": 3, "firepower": 3, "evasion": 1, "health": 6},
                "rank3": {"attacks": 4, "firepower": 4, "evasion": 1, "health": 7},
                "perks": [],
            },
            {
                "id": "speeder_bike",
                "name": "Speeder Bike",
                "rank0": {"attacks": 2, "firepower": 3, "evasion": 2, "health": 5},
                "rank3": {"attacks": 3, "firepower": 4, "evasion": 2, "health": 6},
                "perks": ["speed_acceleration"],
            },
            {
                "id": "tie_fighter",
                "name": "TIE Fighter",
                "rank0": {"attacks": 2, "firepower": 4, "evasion": 3, "health": 7},
                "rank3": {"attacks": 3, "firepower": 4, "evasion": 4, "health": 8},
                "perks": [],
            },
            {
                "id": "tie_interceptor",
                "name": "TIE Interceptor",
                "rank0": {"attacks": 2, "firepower": 5, "evasion": 2, "health": 7},
                "rank3": {"attacks": 3, "firepower": 6, "evasion": 2, "health": 8},
                "perks": [],
            },
            {
                "id": "at_st",
                "name": "AT-ST",
                "rank0": {"attacks": 2, "firepower": 5, "evasion": 2, "health": 8},
                "rank3": {"attacks": 3, "firepower": 6, "evasion": 2, "health": 9},
                "perks": [],
            },
            {
                "id": "at_at",
                "name": "AT-AT",
                "rank0": {"attacks": 2, "firepower": 7, "evasion": 4, "health": 10},
                "rank3": {"attacks": 3, "firepower": 8, "evasion": 4, "health": 11},
                "perks": ["protect"],
            },
        ],
        "enemyHeroes": [
            {
                "id": "slave_i",
                "name": "Slave I",
                "attacks": 3,
                "firepower": 5,
                "evasion": 3,
                "health": 7,
                "shield": 0,
                "perks": ["protect"],
                "special": "No hero AI menu; moves like normal",
            },
            {
                "id": "boba_fett",
                "name": "Boba Fett",
                "attacks": 3,
                "firepower": 5,
                "evasion": 2,
                "health": 7,
                "shield": 0,
                "perks": ["recovery", "resurrection"],
                "special": "Advance 1/2, zone move, remove shield, base ranged attack, stay still; spawn score penalty",
            },
            {
                "id": "darth_vader",
                "name": "Darth Vader",
                "attacks": 4,
                "firepower": 7,
                "evasion": 4,
                "health": 8,
                "shield": 0,
                "perks": ["protect", "overload"],
                "special": "Advance 1/2, remove shield, neutralize unit card, zone move, stay still",
            },
            {
                "id": "palpatine",
                "name": "Palpatine",
                "attacks": 3,
                "firepower": 8,
                "evasion": 3,
                "health": 8,
                "shield": 0,
                "perks": ["rage", "overload"],
                "special": "Advance 1, remove 1–2 shields, neutralize unit card, zone move, summon reinforcements",
            },
            {
                "id": "greedo",
                "name": "Greedo",
                "attacks": 5,
                "firepower": 5,
                "evasion": 3,
                "health": 7,
                "shield": 0,
                "perks": ["squad_leader", "rage"],
                "special": "Advance 1/2, score decrease, cannon energy down, steal discard points",
            },
            {
                "id": "dengar",
                "name": "Dengar",
                "attacks": 7,
                "firepower": 3,
                "evasion": 3,
                "health": 9,
                "shield": 0,
                "perks": ["heavy_weapons", "behemoth"],
                "special": "Advance 1/2, seal unit/star card, remove base boost",
            },
            {
                "id": "bossk",
                "name": "Bossk",
                "attacks": 1,
                "firepower": 6,
                "evasion": 4,
                "health": 7,
                "shield": 0,
                "perks": ["first_strike", "heavy_weapons"],
                "special": "Advance 1, weaken ally cards, escape + HP recovery",
            },
            {
                "id": "orson_krennic",
                "name": "Orson Krennic",
                "attacks": 3,
                "firepower": 5,
                "evasion": 3,
                "health": 7,
                "shield": 2,
                "perks": ["first_strike", "squad_leader"],
                "special": "Advance 1 + (wiki list incomplete)",
            },
        ],
    }


def build_sieges() -> dict:
    return {
        "schemaVersion": 1,
        "source": "bible/sieges.md",
        "sectorIndex": {"N": 0, "E": 1, "S": 2, "W": 3},
        "sieges": [
            {
                "id": "siege_01",
                "name": "Welcome to Base Command / The First Line",
                "unlock": "always",
                "difficulty": "easy_tutorial",
                "confidence": "invented (product)",
                "starScoreThresholds": {"1": 100, "2": 250, "3": 500},
                "starPotsCredits": {"1": 50, "2": 100, "3": 150},
                "unitPool": [
                    "rebel_soldier",
                    "t47_airspeeder",
                    "a_wing",
                    "x_wing",
                ],
                "excludeEnemyHeroes": True,
                "excludeAtAt": True,
                "spawnScript": [
                    {"turn": 1, "unitId": "stormtrooper", "sector": 0, "range": 4, "perks": []},
                    {
                        "turn": 1,
                        "unitId": "probe_droid",
                        "sector": 2,
                        "range": 4,
                        "perks": ["speed_acceleration"],
                    },
                    {"turn": 2, "unitId": "stormtrooper", "sector": 1, "range": 4, "perks": []},
                    {
                        "turn": 3,
                        "unitId": "probe_droid",
                        "sector": 3,
                        "range": 4,
                        "perks": ["speed_acceleration"],
                    },
                    {"turn": 4, "unitId": "stormtrooper", "sector": 0, "range": 4, "perks": []},
                    {"turn": 4, "unitId": "stormtrooper", "sector": 2, "range": 4, "perks": []},
                    {
                        "turn": 5,
                        "unitId": "probe_droid",
                        "sector": 1,
                        "range": 4,
                        "perks": ["speed_acceleration"],
                    },
                    {"turn": 6, "unitId": "stormtrooper", "sector": 3, "range": 4, "perks": []},
                    {"turn": 7, "unitId": "stormtrooper", "sector": 1, "range": 4, "perks": []},
                    {
                        "turn": 7,
                        "unitId": "probe_droid",
                        "sector": 0,
                        "range": 4,
                        "perks": ["speed_acceleration"],
                    },
                ],
                "lastScriptedTurn": 8,
            }
        ],
    }


def build_tunables() -> dict:
    return {
        "schemaVersion": 1,
        "source": "bible/GAME_BIBLE.md",
        "board": {
            "sectors": 4,
            "ranges": [1, 2, 3, 4],
            "baseRange": 0,
            "maxUnitsPerCoordinate": 2,
            "defaultSpawnRange": 4,
            "concealmentSpawnRange": 2,
        },
        "hand": {
            "starDeckSize": 24,
            "maxDecks": 10,
            "drawUnit": 3,
            "drawStar": 3,
            "discardPointsPerTurn": 1,
            "discardPointsMax": 2,
            "maxHeroesPerDeck": 1,
        },
        "base": {
            "health": 10,
            "directionalShields": 4,
            "shieldBreakAttackerDamage": 1,
            "overchargeAttackerDamage": 2,
            "cannonMaxRange": 3,
            "cannonEnergyCycle": [1, 3, 5],
            "cannonIgnoresEvasion": True,
        },
        "combat": {
            "damageFormula": "max(0, firepower - evasion)",
            "critChance": 0.20,
            "luckCritChance": 0.35,
            "critIgnoresEvasion": True,
            "critDamage": "firepower",
            "critPiercesProtect": False,
            "missEnabled": False,
        },
        "scoring": {
            "multiplierQuarterPerKill": True,
            "multiplierTimes2AtKills": 4,
            "multiplierTimes3AtKills": 8,
            "allyDeathDropsFullMultiplierLevel": True,
        },
        "startingCurrency": 0,
    }


def main() -> None:
    star = build_star_cards()
    perks = build_perks()
    units = build_units()
    sieges = build_sieges()
    tunables = build_tunables()

    write("star_cards.json", star)
    write("perks.json", perks)
    write("units.json", units)
    write("sieges.json", sieges)
    write("tunables.json", tunables)
    write(
        "manifest.json",
        {
            "schemaVersion": 1,
            "description": "Compiled game content from bible/. Load these in Flutter/SiegeEngine/ProgressionService.",
            "files": [
                "tunables.json",
                "perks.json",
                "units.json",
                "star_cards.json",
                "sieges.json",
            ],
            "rebuild": "python content/build_from_bible.py",
        },
    )

    # Sanity: every starter deck id exists in catalog
    ids = {c["id"] for c in star["cards"]}
    for e in star["defaultStarterDeck"]:
        if e["starCardId"] not in ids:
            raise SystemExit(f"starter deck unknown id {e['starCardId']}")
    print("ok: starter deck + catalog consistent")


if __name__ == "__main__":
    main()
