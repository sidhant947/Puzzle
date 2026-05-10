import 'package:flutter/material.dart';

class DesignSystem {
  // --- Symmetrical Design Scale ---
  static const double spaceXS = 4.0;
  static const double spaceSM = 8.0;
  static const double spaceMD = 16.0;
  static const double spaceLG = 24.0;
  static const double spaceXL = 32.0;

  static const double radiusXS = 8.0;
  static const double radiusSM = 16.0;
  static const double radiusMD = 24.0;
  static const double radiusLG = 32.0;
  static const double radiusXL = 40.0;
  static const double radiusFull = 999.0;

  // --- Universal Tangible Colors ---
  static const Color background = Color(0xFFF3F6F8);
  static const Color surface = Colors.white;
  static const Color ink = Color(0xFF0F172A);
  static const Color inkSlate = Color(0xFF1E293B);
  
  // Optimistic Accents
  static const Color primary = Color(0xFF6366F1); // Indigo
  static const Color primaryShadow = Color(0xFF4F46E5);
  
  static const Color accentBerry = Color(0xFFEC4899); // Berry Red
  static const Color accentEmerald = Color(0xFF10B981); // Emerald
  static const Color accentAmber = Color(0xFFF59E0B); // Amber
  
  static const Color success = Color(0xFF10B981); // Sage Green
  static const Color error = Color(0xFFEF4444);
  
  static const Color outline = Color(0xFFE2E8F0);
  static const Color outlineVariant = Color(0xFFCBD5E1);

  // --- Theme Building ---
  static ThemeData get theme => _buildTheme();

  static ThemeData _buildTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: background,
      colorScheme: const ColorScheme.light(
        primary: primary,
        onPrimary: Colors.white,
        secondary: accentBerry,
        onSecondary: Colors.white,
        surface: surface,
        onSurface: ink,
        error: error,
        onError: Colors.white,
        outline: outline,
        outlineVariant: outlineVariant,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: ink,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(
          color: ink,
          fontSize: 24,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.0,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w900,
          letterSpacing: -1.0,
          color: ink,
          height: 1.1,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.2,
          color: ink,
          height: 1.2,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          color: ink,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: ink,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: inkSlate,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: inkSlate,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.5,
          color: ink,
        ),
      ),
      iconTheme: const IconThemeData(
        color: ink,
        size: 28,
      ),
    );
  }

  // --- Compatibility Aliases for old references ---
  static ThemeData get lightTheme => theme;
  static ThemeData get darkTheme => theme; // Design is age-agnostic and unified

  // --- Helper Methods ---
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;
  
  static EdgeInsets get screenPadding => const EdgeInsets.all(spaceLG);

  // Symmetrical Padding Helpers (Added for compatibility)
  static const EdgeInsets paddingXS = EdgeInsets.all(spaceXS);
  static const EdgeInsets paddingSM = EdgeInsets.all(spaceSM);
  static const EdgeInsets paddingMD = EdgeInsets.all(spaceMD);
  static const EdgeInsets paddingLG = EdgeInsets.all(spaceLG);
  static const EdgeInsets paddingXL = EdgeInsets.all(spaceXL);
  static const EdgeInsets padding2XL = EdgeInsets.all(48.0);
  
  static const double space2XL = 48.0;
  static const double space3XL = 64.0;
  static const double radius2XL = 48.0;

  // --- Game Accents (Compatibility Aliases) ---
  static const Color gameBlue = Color(0xFF8ECAE6); 
  static const Color gameGreen = Color(0xFFA3B18A);
  static const Color gamePurple = Color(0xFFB7B7A4);
  static const Color gameOrange = Color(0xFFFFB703);
  static const Color gamePink = Color(0xFFFFC8DD);
  static const Color gameTeal = Color(0xFF81B29A);
  static const Color gameIndigo = Color(0xFF94A3B8);
  static const Color gameAmber = Color(0xFFF2CC8F);
  static const Color gameRose = Color(0xFFF28482);
  static const Color gameViolet = Color(0xFFCDB4DB);
  static const Color gameCyan = Color(0xFFBDE0FE);
  static const Color gameEmerald = Color(0xFF7D8570);

  // --- Theme Compatibility Aliases ---
  static const Color lightError = error;
  static const Color darkSurface = surface;
  static const Color lightSurface = surface;
  static const Color darkSurfaceElevated = surface;
  static const Color lightSurfaceElevated = surface;
  static const Color darkOutline = outline;
  static const Color lightOutline = outline;
  static const Color lightOutlineVariant = outlineVariant;
  static const Color lightOnSurfaceMuted = inkSlate;
}
