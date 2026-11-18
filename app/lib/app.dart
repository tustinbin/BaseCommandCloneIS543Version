import 'package:material_ui/material_ui.dart';

import 'router.dart';
import 'theme/app_theme.dart';

class BaseCommandApp extends StatelessWidget {
  const BaseCommandApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Base Command',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      initialRoute: AppRoutes.access,
      onGenerateRoute: onGenerateAppRoute,
    );
  }
}
