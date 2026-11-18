import 'package:material_ui/material_ui.dart';

import '../assets/asset_paths.dart';

class PlanetBackdrop extends StatelessWidget {
  const PlanetBackdrop({
    super.key,
    this.assetPath = AssetPaths.endor,
    this.blur = false,
    required this.child,
  });

  final String assetPath;
  final bool blur;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(assetPath, fit: BoxFit.cover),
        if (blur)
          const ColoredBox(color: Color(0x99070B14))
        else
          const ColoredBox(color: Color(0x55070B14)),
        child,
      ],
    );
  }
}
