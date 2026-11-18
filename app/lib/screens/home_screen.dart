import 'package:material_ui/material_ui.dart';

import '../assets/asset_paths.dart';
import '../router.dart';
import '../widgets/chrome_panel.dart';
import '../widgets/planet_backdrop.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanetBackdrop(
      assetPath: AssetPaths.endor,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            const Expanded(flex: 5, child: SizedBox.shrink()),
            Expanded(
              flex: 4,
              child: ChromePanel(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'BASE COMMAND',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Commander [Name] — auth wired in ticket 04'),
                    const Spacer(),
                    FilledButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.briefing);
                      },
                      child: const Text('START SIEGE'),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.sieges);
                      },
                      child: const Text('ALL SIEGES'),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.leaderboard);
                      },
                      child: const Text('LEADERBOARD'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
