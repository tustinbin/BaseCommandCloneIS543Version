import 'package:material_ui/material_ui.dart';

import '../assets/asset_paths.dart';
import '../demo/hw9_placeholders.dart';
import '../router.dart';
import '../widgets/chrome_panel.dart';
import '../widgets/planet_backdrop.dart';

class DecksScreen extends StatelessWidget {
  const DecksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanetBackdrop(
      assetPath: AssetPaths.endor,
      blur: true,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'DECKS',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: [
                  _DeckRow(
                    title: 'Starter Deck',
                    subtitle: '24 cards · Active',
                    thumbs: Hw9Placeholders.starterDeckThumbs,
                    onEdit: () {
                      Navigator.of(context).pushNamed(AppRoutes.deckEditor);
                    },
                  ),
                  const SizedBox(height: 10),
                  _DeckRow(
                    title: 'Custom Deck',
                    subtitle: 'Empty slot',
                    thumbs: const [],
                    onEdit: () {
                      Navigator.of(context).pushNamed(AppRoutes.deckEditor);
                    },
                  ),
                ],
              ),
            ),
            Row(
              children: [
                FilledButton(
                  onPressed: () {},
                  child: const Text('NEW DECK'),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('SHOP'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DeckRow extends StatelessWidget {
  const _DeckRow({
    required this.title,
    required this.subtitle,
    required this.thumbs,
    required this.onEdit,
  });

  final String title;
  final String subtitle;
  final List<String> thumbs;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return ChromePanel(
      child: Row(
        children: [
          SizedBox(
            height: 72,
            width: 220,
            child: thumbs.isEmpty
                ? Image.asset(AssetPaths.emptyStarSlot, fit: BoxFit.contain)
                : ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: thumbs.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 6),
                    itemBuilder: (_, i) => Image.asset(
                      thumbs[i],
                      width: 48,
                      fit: BoxFit.contain,
                    ),
                  ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0x99FFFFFF),
                  ),
                ),
              ],
            ),
          ),
          OutlinedButton(onPressed: onEdit, child: const Text('EDIT')),
        ],
      ),
    );
  }
}
