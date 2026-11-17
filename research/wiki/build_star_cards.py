"""Build research/wiki/star-cards.md from useful Notion CSVs (paired card layout)."""
from __future__ import annotations

import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent
RAW = {
    "event": ROOT / "_raw_events.json",
    "vehicle_boost": ROOT / "_raw_vehicle.json",
    "infantry_boost": ROOT / "_raw_infantry.json",
    "base_boost": ROOT / "_raw_base.json",
    "attack": ROOT / "_raw_attack.json",
    "unit_boost": ROOT / "_raw_unit_boost.json",
}

ALIASES = {
    "new hope": ("a_new_hope", "A New Hope"),
    "card renewal": ("card_refresh", "Card Refresh"),
    "conversion": ("defection", "Defection"),
    "flash grenade": ("flash_grenade", "Flash Grenade"),
    "augmentation": ("reinforcements", "Reinforcements"),
    "scan pulse": ("scan_pulse", "Scan Pulse"),
    "suppression fire": ("suppressive_fire", "Suppressive Fire"),
    "a-wing shield": ("a_wing_shield", "A-Wing Shield"),
    "shock warhead": ("concussion_warheads", "Concussion Warheads"),
    "evasive maneuver": ("evasive_maneuvers", "Evasive Maneuvers"),
    "power distribution": ("power_distribution", "Power Distribution"),
    "proton torpedo": ("proton_torpedoes", "Proton Torpedoes"),
    "sensor disruptor": ("sensor_jammer", "Sensor Jammer"),
    "snowspeeder speed acceleration": ("t47_speed_boost", "T-47 Speed Boost"),
    "towing cable": ("towing_cable", "Towing Cable"),
    "x-wing shield": ("x_wing_shield", "X-Wing Shield"),
    "shelling": ("bombardment", "Bombardment"),
    "proximity shooter": ("inner_perimeter", "Inner Perimeter"),
    "orbital bombing": ("orbital_strike", "Orbital Strike"),
    "thermobaric bomb": ("thermal_imploder", "Thermal Imploder"),
    "thermal grenade": ("thermal_detonator", "Thermal Detonator"),
    "new order": ("new_orders", "New Orders"),
    "objective turret": ("vehicle_turret", "Vehicle Turret"),
    "dioxis grenade": ("dioxis_grenade", "Dioxis Grenade"),
    "disruptor rifle": ("disruptor_rifle", "Disruptor Rifle"),
    "shock fuse grenade": ("shock_fuse_grenade", "Shock Fuse Grenade"),
    "ion blast": ("ion_blast", "Ion Blast"),
    "ion grenade": ("ion_grenade", "Ion Grenade"),
    "proximity fuse bomb": ("proximity_bomb", "Proximity Bomb"),
    "shock grenade": ("shock_grenade", "Shock Grenade"),
    "base shield": ("base_shield", "Base Shield"),
    "blaster cannon": ("blaster_cannon", "Blaster Cannon"),
    "infantry turret": ("infantry_turret", "Infantry Turret"),
    "antipersonnel mines": ("antipersonnel_mines", "Antipersonnel Mines"),
    "scout binoculars": ("scout_binoculars", "Scout Binoculars"),
    "squad shield": ("squad_shield", "Squad Shield"),
    "support droid": ("support_droid", "Support Droid"),
    "trap": ("trap", "Trap"),
    "ultrasonic bomb": ("ultrasonic_bomb", "Ultrasonic Bomb"),
    "elite training": ("elite_training", "Elite Training"),
    "squad leader": ("squad_leader", "Squad Leader"),
    "war veteran": ("war_veteran", "War Veteran"),
    "personal shield": ("personal_shield", "Personal Shield"),
    "cycler rifle": ("cycler_rifle", "Cycler Rifle"),
    "ion shot": ("ion_shot", "Ion Shot"),
    "jump pack": ("jump_pack", "Jump Pack"),
    "smart rocket": ("smart_rocket", "Smart Rocket"),
    "bow caster": ("bowcaster", "Bowcaster"),
    "ion torpedo": ("ion_torpedo", "Ion Torpedo"),
}


def slugify(name: str) -> str:
    key = name.strip().lower()
    if key in ALIASES:
        return ALIASES[key][0]
    s = re.sub(r"[^a-z0-9]+", "_", key).strip("_")
    return s


def display_name(name: str) -> str:
    key = name.strip().lower()
    if key in ALIASES:
        return ALIASES[key][1]
    return name.strip().title()


def parse_paired(rows: list[list[str]]) -> list[dict]:
    cards: list[dict] = []
    i = 0
    while i < len(rows):
        row = rows[i]
        # name row: col0 and/or col3 have names
        left = (row[0] if len(row) > 0 else "").strip().lstrip("\ufeff")
        right = (row[3] if len(row) > 3 else "").strip()
        if left or right:
            # look ahead for limit + explanation
            lim_l = lim_r = None
            exp_l = exp_r = ""
            for j in range(i + 1, min(i + 4, len(rows))):
                r = rows[j]
                if len(r) > 1 and r[1].strip().lower() == "limit":
                    lim_l = (r[2] if len(r) > 2 else "").strip()
                    lim_r = (r[5] if len(r) > 5 else "").strip()
                if len(r) > 1 and r[1].strip().lower() == "explanation":
                    exp_l = (r[2] if len(r) > 2 else "").strip()
                    exp_r = (r[5] if len(r) > 5 else "").strip()
            if left:
                cards.append(
                    {
                        "raw_name": left,
                        "maxCopies": int(lim_l) if lim_l and lim_l.isdigit() else None,
                        "effect": exp_l,
                    }
                )
            if right and right.lower() not in {"property", "files"} and not right.isdigit():
                cards.append(
                    {
                        "raw_name": right,
                        "maxCopies": int(lim_r) if lim_r and lim_r.isdigit() else None,
                        "effect": exp_r,
                    }
                )
        i += 1
    # de-dupe by raw_name keeping first with effect
    seen = {}
    for c in cards:
        k = c["raw_name"].lower()
        if k not in seen or (c["effect"] and not seen[k]["effect"]):
            seen[k] = c
    return list(seen.values())


def main() -> None:
    lines = [
        "# Wiki extract — Star Cards",
        "",
        "Source: Namu wiki Notion export CSVs (useful paired tables only).",
        "Confidence: `observed` (wiki). Machine-translated English; aliases noted.",
        "CSV columns labeled 1/2/3 are Battlefront art tiers — **not** Base Command effect tiers.",
        "",
        "| id | name | category | maxCopies | effect | aliases |",
        "|----|------|----------|-----------|--------|---------|",
    ]
    for cat, path in RAW.items():
        rows = json.loads(path.read_text(encoding="utf-8"))
        for c in parse_paired(rows):
            rid = slugify(c["raw_name"])
            name = display_name(c["raw_name"])
            mx = c["maxCopies"] if c["maxCopies"] is not None else ""
            effect = (c["effect"] or "").replace("|", "\\|").replace("\n", " ")
            alias = c["raw_name"] if c["raw_name"].lower() not in ALIASES else ""
            lines.append(
                f"| {rid} | {name} | {cat} | {mx} | {effect} | {alias} |"
            )
    # special unit-like star cards from MD tables
    lines += [
        "| millennium_falcon | Millennium Falcon | special_unit | 1 | Unit-like star card: Atk 3 / FP 5 / Eva 2 / HP 6 / Shield 1; First Strike, Squad Leader | |",
        "| r5_d4 | R5-D4 | special_unit | 1 | Unit-like star card: Atk 3 / FP 3 / Eva 1 / HP 4; removes enemy perks in coordinate on engage | |",
        "",
        "## Notes",
        "",
        "- Heroes are listed in `heroes.md` (also occupy star-deck slots; max 1 hero per deck).",
        "- Starter membership is **not** confirmed by wiki; see video notes list as `inferred` in bible.",
        "",
    ]
    (ROOT / "star-cards.md").write_text("\n".join(lines), encoding="utf-8")
    print("wrote", ROOT / "star-cards.md", "lines", len(lines))


if __name__ == "__main__":
    main()
