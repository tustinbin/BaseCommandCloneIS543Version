# Flutter app (`base_command`)

Product client for the Base Command clone.

## Run (Windows)

```bash
cd app
flutter pub get
flutter run -d chrome
# or, with emulator running:
flutter emulators --launch Medium_Phone_API_37.0
flutter run
```

Prefer landscape. Mac: `flutter run` on iOS Simulator when Flutter + Xcode are installed there.

## Layout

- `lib/screens/` — Access, Hub (Shop ← Home → Decks), Sieges, Briefing, Battlefield, Results, Leaderboard, Deck editor
- `lib/assets/asset_paths.dart` — bundled asset path constants
- Seams later: **SiegeEngine**, **ProgressionService**

## Assets

Local junctions (gitignored; recreate after clone):

```powershell
powershell -ExecutionPolicy Bypass -File tool/link_assets.ps1
```

- `assets/art` → `../design/current/assets`
- `assets/content` → `../content`

Rebuild content JSON: `python content/build_from_bible.py` from repo root.
