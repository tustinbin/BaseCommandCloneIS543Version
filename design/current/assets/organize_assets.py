#!/usr/bin/env python3
"""Convert webp→png, sort by suffix into folders, write manifest.json."""
from __future__ import annotations

import json
import re
import shutil
from pathlib import Path

from PIL import Image

ROOT = Path(__file__).resolve().parent

# wiki stem (no suffix) → content/bible id
STARCARD_MAP: dict[str, str] = {
    "newhope": "a_new_hope",
    "cardrenewal": "card_refresh",
    "conversion": "defection",
    "flashgrenade": "flash_grenade",
    "augmentation": "reinforcements",
    "scanpulse": "scan_pulse",
    "suppresionfire": "suppressive_fire",
    "awingshield": "a_wing_shield",
    "shockwarhead": "concussion_warheads",
    "evasivemaneuver": "evasive_maneuvers",
    "powerdistribution": "power_distribution",
    "protontorpedo": "proton_torpedoes",
    "sensordisruptor": "sensor_jammer",
    "snowspeederspeedacceleration": "t47_speed_boost",
    "towingcable": "towing_cable",
    "xwingshield": "x_wing_shield",
    "adrenalinesteam": "adrenaline_steam",
    "bactabomb": "bacta_bomb",
    "grenadebombardment": "grenade_bombardment",
    "bowcaster": "bowcaster",
    "coolingbattery": "cooling_battery",
    "cyclerrifle": "cycler_rifle",
    "hindrance": "hindrance",
    "explosivebullet": "explosive_bullet",
    "concentratedfire": "concentrated_fire",
    "guidedmissle": "guided_missile",
    "ionneutralizer": "ion_neutralizer",
    "ionshot": "ion_shot",
    "iontorpedo": "ion_torpedo",
    "jumppack": "jump_pack",
    "medicaldroid": "medical_droid",
    "personalshield": "personal_shield",
    "pulsecannon": "pulse_cannon",
    "scattergun": "scattergun",
    "scoutpistol": "scout_pistol",
    "smartrocket": "smart_rocket",
    "smokeshell": "smoke_shell",
    "stingerpistol": "stinger_pistol",
    "baseshield": "base_shield",
    "blastercannon": "blaster_cannon",
    "infantryturret": "infantry_turret",
    "antipersonnelmines": "antipersonnel_mines",
    "scoutbinoculars": "scout_binoculars",
    "squadshield": "squad_shield",
    "supportdroid": "support_droid",
    "trap": "trap",
    "objectiveturret": "vehicle_turret",
    "ultrasonicbomb": "ultrasonic_bomb",
    "shelling": "bombardment",
    "dioxisgrenade": "dioxis_grenade",
    "disruptorrifle": "disruptor_rifle",
    "shockfusegrenade": "shock_fuse_grenade",
    "proximityshooter": "inner_perimeter",
    "ionblast": "ion_blast",
    "iongrenade": "ion_grenade",
    "orbitalbombing": "orbital_strike",
    "proximityfusebomb": "proximity_bomb",
    "shockgrenade": "shock_grenade",
    "thermalgrenade": "thermal_detonator",
    "thermobaricbomb": "thermal_imploder",
    "elitetraining": "elite_training",
    "neworder": "new_orders",
    "squadleader": "squad_leader",
    "warveteran": "war_veteran",
    "milleniumfalcon": "millennium_falcon",
    "r5d4droid": "r5_d4",
    "lukeskywalker": "luke_skywalker",
    "hansolo": "han_solo",
    "leiaorgana": "leia_organa",
    "niennunb": "nien_nunb",
    "landocalrissian": "lando_calrissian",
    "chewbacca": "chewbacca",
    "jynerso": "jyn_erso",
}

MODEL_MAP: dict[str, str] = {
    "infantry": "rebel_soldier",
    "snowspeeder": "t47_airspeeder",
    "awing": "a_wing",
    "xwing": "x_wing",
    "probedroid": "probe_droid",
    "stormtrooper": "stormtrooper",
    "speederbike": "speeder_bike",
    "tiefighter": "tie_fighter",
    "tieinterceptor": "tie_interceptor",
    "atst": "at_st",
    "atat": "at_at",
    "slave1": "slave_i",
    "bobafett": "boba_fett",
    "darthvader": "darth_vader",
    "palpatine": "palpatine",
    "greedo": "greedo",
    "dengar": "dengar",
    "bossk": "bossk",
    "orsonkrennic": "orson_krennic",
    "lukeskywalker": "luke_skywalker",
    "hansolo": "han_solo",
    "leiaorgana": "leia_organa",
    "niennunb": "nien_nunb",
    "landocalrissian": "lando_calrissian",
    "chewbacca": "chewbacca",
    "jynerso": "jyn_erso",
    "milleniumfalcon": "millennium_falcon",
    "r5d4": "r5_d4",
}

PERK_MAP: dict[str, str] = {
    "behemoth": "behemoth",
    "concealment": "concealment",
    "firststrike": "first_strike",
    "rage": "rage",
    "heavyweapons": "heavy_weapons",
    "ionweapon": "ion_weapon",
    "luck": "luck",
    "overload": "overload",
    "protect": "protect",
    "recovery": "recovery",
    "resurrection": "resurrection",
    "speedacceleration": "speed_acceleration",
    "squadleader": "squad_leader",
    "importantgoal": "important_goal",
}

GAMEBOARD_MAP: dict[str, str] = {
    "base": "cannon",  # legacy wiki name; file should be cannon_gameboard.png
    "cannon": "cannon",
    "stage": "stage",
    "discardpopup": "discard_popup",
    "emptystarcardslot": "empty_star_card_slot",
    "emptyunitslot": "empty_unit_slot",
}

SUFFIX_FOLDER = {
    "starcard": "star_cards",
    "model": "units",
    "perk": "perks",
    "gameboard": "gameboard",
}


def convert_webp() -> int:
    n = 0
    for webp in list(ROOT.glob("*.webp")):
        png = webp.with_suffix(".png")
        img = Image.open(webp)
        img.save(png, "PNG")
        webp.unlink()
        n += 1
        print(f"converted {webp.name} -> {png.name}")
    return n


def ensure_dirs() -> None:
    for name in ("star_cards", "units", "figurines", "logo", "backgrounds", "perks", "gameboard"):
        (ROOT / name).mkdir(exist_ok=True)


def sort_files() -> list[Path]:
    moved: list[Path] = []
    for path in list(ROOT.glob("*.png")):
        m = re.match(r"^(.+)_(starcard|model|perk|gameboard)\.png$", path.name, re.I)
        if not m:
            print(f"skip (no suffix): {path.name}")
            continue
        folder = SUFFIX_FOLDER[m.group(2).lower()]
        dest = ROOT / folder / path.name
        if dest.exists():
            dest.unlink()
        shutil.move(str(path), str(dest))
        moved.append(dest)
        print(f"moved {path.name} -> {folder}/")
    return moved


def stem_key(filename: str, suffix: str) -> str:
    base = filename[: -len(f"_{suffix}.png")]
    return base.lower()


def build_manifest(files: list[Path]) -> dict:
    star_cards: dict[str, str] = {}
    units: dict[str, str] = {}
    perks: dict[str, str] = {}
    gameboard: dict[str, str] = {}
    unmapped: list[str] = []

    for path in sorted(files):
        rel = path.relative_to(ROOT).as_posix()
        name = path.name
        if name.endswith("_starcard.png"):
            key = stem_key(name, "starcard")
            cid = STARCARD_MAP.get(key)
            if cid:
                star_cards[cid] = rel
            else:
                unmapped.append(rel)
        elif name.endswith("_model.png"):
            key = stem_key(name, "model")
            cid = MODEL_MAP.get(key)
            if cid:
                units[cid] = rel
            else:
                unmapped.append(rel)
        elif name.endswith("_perk.png"):
            key = stem_key(name, "perk")
            cid = PERK_MAP.get(key)
            if cid:
                perks[cid] = rel
            else:
                unmapped.append(rel)
        elif name.endswith("_gameboard.png"):
            key = stem_key(name, "gameboard")
            cid = GAMEBOARD_MAP.get(key)
            if cid:
                gameboard[cid] = rel
            else:
                unmapped.append(rel)
        else:
            unmapped.append(rel)

    # Unit starcard art (enemy/player unit cards from wiki) that aren't deck cards
    unit_starcards = {
        "infantry": "rebel_soldier",
        "snowspeeder": "t47_airspeeder",
        "awing": "a_wing",
        "xwing": "x_wing",
        "probedroid": "probe_droid",
        "stormtrooper": "stormtrooper",
        "speederbike": "speeder_bike",
        "tiefighter": "tie_fighter",
        "tieinterceptor": "tie_interceptor",
        "atst": "at_st",
        "atat": "at_at",
        "slave1": "slave_i",
        "bobafett": "boba_fett",
        "darthvader": "darth_vader",
        "palpatine": "palpatine",
        "greedo": "greedo",
        "orsonkrennic": "orson_krennic",
    }
    unit_card_art: dict[str, str] = {}
    still_unmapped: list[str] = []
    for rel in unmapped:
        if "/ " in rel:
            pass
        fname = Path(rel).name
        if fname.endswith("_starcard.png"):
            key = stem_key(fname, "starcard")
            if key in unit_starcards:
                unit_card_art[unit_starcards[key]] = rel
                continue
        still_unmapped.append(rel)

    return {
        "schemaVersion": 1,
        "notes": [
            "Wiki filenames preserved; content ids are bible/content keys.",
            "Briefing figurines: reuse units/ model paths until separate figurines/ art exists.",
            "Still missing user art: logo/, backgrounds/, base cannon UI.",
        ],
        "starCards": star_cards,
        "unitModels": units,
        "unitCardArt": unit_card_art,
        "perks": perks,
        "gameboard": gameboard,
        "unmapped": still_unmapped,
        "stillNeeded": [
            "logo/ — login Battlefront / title lockup",
            "backgrounds/ — home left, briefing env, results (blur in code), siege thumbs",
            "gameboard/ — base cannon UI piece",
            "optional — credits/currency chip art",
        ],
    }


def main() -> None:
    ensure_dirs()
    n = convert_webp()
    print(f"converted {n} webp files")
    moved = sort_files()
    # also pick up anything already in subfolders
    all_png = list(ROOT.rglob("*.png"))
    all_png = [p for p in all_png if p.is_file() and p.name != ".gitkeep"]
    manifest = build_manifest(all_png)
    (ROOT / "manifest.json").write_text(
        json.dumps(manifest, indent=2, ensure_ascii=False) + "\n", encoding="utf-8"
    )
    print(
        f"manifest: starCards={len(manifest['starCards'])} "
        f"unitModels={len(manifest['unitModels'])} "
        f"unitCardArt={len(manifest['unitCardArt'])} "
        f"perks={len(manifest['perks'])} "
        f"gameboard={len(manifest['gameboard'])} "
        f"unmapped={len(manifest['unmapped'])}"
    )


if __name__ == "__main__":
    main()
