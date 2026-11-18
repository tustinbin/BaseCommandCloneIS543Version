import 'package:material_ui/material_ui.dart';

import '../assets/asset_paths.dart';
import '../widgets/chrome_panel.dart';
import '../widgets/planet_backdrop.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ('Commander Alpha', 12000, 3),
      ('Commander Beta', 9800, 2),
      ('Commander Gamma', 6400, 1),
    ];

    return Scaffold(
      body: PlanetBackdrop(
        assetPath: AssetPaths.tatooine,
        blur: true,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const Text(
                      'LEADERBOARD',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.separated(
                    itemCount: rows.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final row = rows[index];
                      return ChromePanel(
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              color: const Color(0x33FFFFFF),
                              alignment: Alignment.center,
                              child: Text('${index + 1}'),
                            ),
                            const SizedBox(width: 16),
                            Expanded(child: Text(row.$1)),
                            Text('${row.$2}'),
                            const SizedBox(width: 16),
                            Text('★ ${row.$3}'),
                          ],
                        ),
                      );
                    },
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
