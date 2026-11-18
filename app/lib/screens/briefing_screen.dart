import 'package:material_ui/material_ui.dart';

import '../assets/asset_paths.dart';
import '../demo/hw9_placeholders.dart';
import '../router.dart';
import '../widgets/chrome_panel.dart';
import '../widgets/planet_backdrop.dart';

class BriefingScreen extends StatelessWidget {
  const BriefingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlanetBackdrop(
        assetPath: AssetPaths.endor,
        blur: true,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: ChromePanel(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'SIEGE 01',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Defend the outpost. Clear the approaching force '
                          'before they breach the base.',
                        ),
                        const Spacer(),
                        const Text('Star pots: ★ 5k   ★★ 12k   ★★★ 20k'),
                        const SizedBox(height: 16),
                        FilledButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(AppRoutes.battlefield);
                          },
                          child: const Text('DEPLOY'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: ChromePanel(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'ENEMIES',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 3,
                            mainAxisSpacing: 6,
                            crossAxisSpacing: 6,
                            children: [
                              for (final path
                                  in Hw9Placeholders.briefingEnemies)
                                Image.asset(path, fit: BoxFit.contain),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
