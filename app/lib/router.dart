import 'package:material_ui/material_ui.dart';

import 'screens/access_screen.dart';
import 'screens/battlefield_screen.dart';
import 'screens/briefing_screen.dart';
import 'screens/deck_editor_screen.dart';
import 'screens/hub_screen.dart';
import 'screens/leaderboard_screen.dart';
import 'screens/results_screen.dart';
import 'screens/sieges_screen.dart';

abstract final class AppRoutes {
  static const access = '/access';
  static const hub = '/hub';
  static const sieges = '/sieges';
  static const briefing = '/briefing';
  static const battlefield = '/battlefield';
  static const results = '/results';
  static const leaderboard = '/leaderboard';
  static const deckEditor = '/deck-editor';
}

Route<dynamic>? onGenerateAppRoute(RouteSettings settings) {
  Widget page;
  switch (settings.name) {
    case AppRoutes.access:
      page = const AccessScreen();
    case AppRoutes.hub:
      page = const HubScreen();
    case AppRoutes.sieges:
      page = const SiegesScreen();
    case AppRoutes.briefing:
      page = const BriefingScreen();
    case AppRoutes.battlefield:
      page = const BattlefieldScreen();
    case AppRoutes.results:
      page = const ResultsScreen();
    case AppRoutes.leaderboard:
      page = const LeaderboardScreen();
    case AppRoutes.deckEditor:
      page = const DeckEditorScreen();
    default:
      page = const AccessScreen();
  }
  return PageRouteBuilder<void>(
    settings: settings,
    pageBuilder: (_, _, _) => page,
    transitionsBuilder: (_, animation, _, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
