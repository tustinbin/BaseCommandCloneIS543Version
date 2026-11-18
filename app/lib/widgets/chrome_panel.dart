import 'package:material_ui/material_ui.dart';

import '../theme/app_theme.dart';

class ChromePanel extends StatelessWidget {
  const ChromePanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppTheme.panel,
        border: Border.all(color: const Color(0x33FFFFFF)),
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}
