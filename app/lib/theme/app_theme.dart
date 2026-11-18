import 'package:material_ui/material_ui.dart';

/// Geometric chrome only — art comes from assets. Avoid default purple demos.
class AppTheme {
  static const Color panel = Color(0xCC0B1220);
  static const Color accent = Color(0xFFE8C547);
  static const Color ink = Color(0xFFF2F4F8);

  static ThemeData get dark {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: accent,
        secondary: Color(0xFF7EB6FF),
        surface: Color(0xFF0B1220),
        onPrimary: Color(0xFF121212),
        onSurface: ink,
      ),
      fontFamily: 'Segoe UI',
    );
    return base.copyWith(
      scaffoldBackgroundColor: const Color(0xFF070B14),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: accent,
          foregroundColor: const Color(0xFF121212),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.6,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ink,
          side: const BorderSide(color: Color(0x66FFFFFF)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
      ),
    );
  }
}
