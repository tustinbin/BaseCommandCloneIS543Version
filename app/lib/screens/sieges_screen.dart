import 'package:material_ui/material_ui.dart';

import '../assets/asset_paths.dart';
import '../router.dart';
import '../widgets/chrome_panel.dart';
import '../widgets/planet_backdrop.dart';

class SiegesScreen extends StatelessWidget {
  const SiegesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final missions = [
      (title: 'Siege 01 — Easy', bg: AssetPaths.endor),
      (title: 'Siege 02 — (locked stub)', bg: AssetPaths.hoth),
      (title: 'Siege 03 — (locked stub)', bg: AssetPaths.tatooine),
    ];

    return Scaffold(
      body: PlanetBackdrop(
        assetPath: AssetPaths.endor,
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
                      'SIEGES',
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
                    itemCount: missions.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final m = missions[index];
                      return ChromePanel(
                        padding: EdgeInsets.zero,
                        child: SizedBox(
                          height: 110,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Image.asset(m.bg, fit: BoxFit.cover),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Expanded(child: Text(m.title)),
                                      FilledButton(
                                        onPressed: index == 0
                                            ? () {
                                                Navigator.of(context)
                                                    .pushNamed(
                                                  AppRoutes.briefing,
                                                );
                                              }
                                            : null,
                                        child: const Text('START'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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
