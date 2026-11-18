import 'package:material_ui/material_ui.dart';

import '../assets/asset_paths.dart';
import '../demo/hw9_placeholders.dart';
import '../router.dart';
import '../theme/app_theme.dart';

/// Composed layout stub — full SiegeEngine wire-up is ticket 08.
class BattlefieldScreen extends StatelessWidget {
  const BattlefieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AssetPaths.endor, fit: BoxFit.cover),
          const ColoredBox(color: Color(0x66070B14)),
          SafeArea(
            child: Column(
              children: [
                _TopHud(
                  onMenu: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.hub,
                      (route) => false,
                    );
                  },
                  onFinish: () {
                    Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.results);
                  },
                ),
                Expanded(
                  child: Row(
                    children: [
                      const _HandColumn(
                        label: 'STARS',
                        assets: Hw9Placeholders.battlefieldStars,
                      ),
                      const Expanded(child: _BoardWithCannon()),
                      const _HandColumn(
                        label: 'UNITS',
                        assets: Hw9Placeholders.battlefieldUnits,
                      ),
                    ],
                  ),
                ),
                const _SelectedBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Stage + cannon share one aspect box. Crosshair in stage art is above
/// geometric center (perspective board); pin cannon to that hub.
class _BoardWithCannon extends StatelessWidget {
  const _BoardWithCannon();

  static const _stageAspect = 1000 / 577;
  // Measured from stage_gameboard.png gold crosshair (~496, 235) on 1000×577.
  static const _crosshair = Alignment(0.0, -0.30);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: AspectRatio(
          aspectRatio: _stageAspect,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(AssetPaths.stage, fit: BoxFit.fill),
              const Align(
                alignment: _crosshair,
                child: FractionallySizedBox(
                  // Between too-big (0.28) and too-small (0.18).
                  widthFactor: 0.23,
                  child: Image(
                    image: AssetImage(AssetPaths.cannon),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopHud extends StatelessWidget {
  const _TopHud({required this.onMenu, required this.onFinish});

  final VoidCallback onMenu;
  final VoidCallback onFinish;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: [
          OutlinedButton(onPressed: onMenu, child: const Text('MENU')),
          const SizedBox(width: 16),
          const Text('Score 0  ·  ★ 0  ·  x1'),
          const Spacer(),
          const Text('Base HP 100'),
          const SizedBox(width: 16),
          const Text('Enemies 0'),
          const SizedBox(width: 16),
          FilledButton(onPressed: onFinish, child: const Text('END (stub)')),
        ],
      ),
    );
  }
}

class _HandColumn extends StatelessWidget {
  const _HandColumn({required this.label, required this.assets});

  final String label;
  final List<String> assets;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: AppTheme.accent,
            ),
          ),
          const SizedBox(height: 8),
          for (final path in assets)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                child: Image.asset(path, fit: BoxFit.contain),
              ),
            ),
        ],
      ),
    );
  }
}

class _SelectedBar extends StatelessWidget {
  const _SelectedBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: AppTheme.panel,
      child: const Text(
        'Rebel Soldier — Atk 2 / FP 1 / Eva 10% / HP 4 / Shield 0',
      ),
    );
  }
}
