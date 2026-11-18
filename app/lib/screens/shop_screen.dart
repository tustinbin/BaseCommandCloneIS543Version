import 'package:material_ui/material_ui.dart';

import '../assets/asset_paths.dart';
import '../demo/hw9_placeholders.dart';
import '../widgets/chrome_panel.dart';
import '../widgets/planet_backdrop.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = Hw9Placeholders.shopNonStarters;
    final labels = Hw9Placeholders.shopLabels;

    return PlanetBackdrop(
      assetPath: AssetPaths.hoth,
      blur: true,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'STAR CARD SHOP',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                  ),
                ),
                const Spacer(),
                Image.asset(AssetPaths.credits, width: 28, height: 28),
                const SizedBox(width: 8),
                const Text('1,250'),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.72,
                ),
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return ChromePanel(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            cards[index],
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          labels[index],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 11),
                        ),
                        const Text(
                          'Locked',
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0x99FFFFFF),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
