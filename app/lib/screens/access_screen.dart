import 'package:material_ui/material_ui.dart';

import '../assets/asset_paths.dart';
import '../router.dart';
import '../theme/app_theme.dart';
import '../widgets/chrome_panel.dart';
import '../widgets/planet_backdrop.dart';

class AccessScreen extends StatelessWidget {
  const AccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final short = MediaQuery.sizeOf(context).height < 500;
    final logoHeight = short ? 44.0 : 72.0;
    final gap = short ? 8.0 : 16.0;

    return Scaffold(
      body: PlanetBackdrop(
        assetPath: AssetPaths.tatooine,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: ChromePanel(
                  padding: EdgeInsets.all(short ? 14 : 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        AssetPaths.logo,
                        height: logoHeight,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: gap),
                      const Text(
                        'COMMANDER ACCESS',
                        style: TextStyle(
                          letterSpacing: 2,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.accent,
                        ),
                      ),
                      SizedBox(height: gap),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                      ),
                      SizedBox(height: short ? 8 : 12),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                      ),
                      SizedBox(height: gap),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(AppRoutes.hub);
                          },
                          child: const Text('ENTER BASE'),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.hub);
                        },
                        child: const Text('Create commander (stub)'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
