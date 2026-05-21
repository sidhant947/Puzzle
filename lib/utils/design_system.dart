import 'package:flutter/material.dart';

class DesignSystem {
  // --- Symmetrical Design Scale ---
  static const double spaceXS = 4.0;
  static const double spaceSM = 8.0;
  static const double spaceMD = 12.0;
  static const double spaceLG = 20.0;
  static const double spaceXL = 28.0;

  static const double radiusXS = 8.0;
  static const double radiusSM = 16.0;
  static const double radiusMD = 24.0;
  static const double radiusLG = 32.0;
  static const double radiusXL = 40.0;
  static const double radiusFull = 999.0;

  // --- Universal Tangible Colors (Shared) ---
  static const Color primary = Color(0xFF6366F1); // Indigo
  static const Color primaryShadow = Color(0xFF4F46E5);
  static const Color accentBerry = Color(0xFFEC4899); 
  static const Color accentEmerald = Color(0xFF10B981);
  static const Color accentAmber = Color(0xFFF59E0B);
  static const Color accentTeal = Color(0xFF0D9488);
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);

  // --- Light Theme Colors ---
  static const Color background = Color(0xFFF3F6F8);
  static const Color surface = Colors.white;
  static const Color ink = Color(0xFF0F172A);
  static const Color inkSlate = Color(0xFF1E293B);
  static const Color outline = Color(0xFFE2E8F0);
  static const Color outlineVariant = Color(0xFFCBD5E1);

  // --- Dark Theme Colors (AMOLED Optimized) ---
  static const Color darkBackground = Color(0xFF000000); // Pure Black
  static const Color darkSurface = Color(0xFF121212);    // Near Black
  static const Color darkInk = Color(0xFFF8FAFC);       // Slate 50
  static const Color darkInkSlate = Color(0xFFB3C1D1);  // Adjusted for contrast
  static const Color darkOutline = Color(0xFF262626);   // Darker Grey
  static const Color darkOutlineVariant = Color(0xFF333333); // Subtle Grey

  // --- Theme Building ---
  static ThemeData get lightTheme => _buildTheme(Brightness.light);
  static ThemeData get darkTheme => _buildTheme(Brightness.dark);

  static ThemeData _buildTheme(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;
    final Color bgColor = isDark ? darkBackground : background;
    final Color surfColor = isDark ? darkSurface : surface;
    final Color mainInk = isDark ? darkInk : ink;
    final Color subInk = isDark ? darkInkSlate : inkSlate;
    final Color outColor = isDark ? darkOutline : outline;
    final Color outVarColor = isDark ? darkOutlineVariant : outlineVariant;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: bgColor,
      colorScheme: isDark 
        ? ColorScheme.dark(
            primary: primary,
            onPrimary: Colors.white,
            secondary: accentBerry,
            onSecondary: Colors.white,
            surface: surfColor,
            onSurface: mainInk,
            error: error,
            onError: Colors.white,
            outline: outColor,
            outlineVariant: outVarColor,
          )
        : ColorScheme.light(
            primary: primary,
            onPrimary: Colors.white,
            secondary: accentBerry,
            onSecondary: Colors.white,
            surface: surfColor,
            onSurface: mainInk,
            error: error,
            onError: Colors.white,
            outline: outColor,
            outlineVariant: outVarColor,
          ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: mainInk,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(
          color: mainInk,
          fontSize: 20,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.0,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w900,
          letterSpacing: -1.0,
          color: mainInk,
          height: 1.1,
        ),
        headlineLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.2,
          color: mainInk,
          height: 1.2,
        ),
        headlineMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          color: mainInk,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: mainInk,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: subInk,
          height: 1.4,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: subInk,
        ),
        labelLarge: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
          color: mainInk,
        ),
      ),
      iconTheme: IconThemeData(
        color: mainInk,
        size: 24,
      ),
    );
  }

  // --- Theme Building (Compatibility) ---
  static ThemeData get theme => lightTheme;

  // --- Helper Methods ---
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;
  static EdgeInsets get screenPadding => const EdgeInsets.all(spaceLG);

  static const EdgeInsets paddingXS = EdgeInsets.all(spaceXS);
  static const EdgeInsets paddingSM = EdgeInsets.all(spaceSM);
  static const EdgeInsets paddingMD = EdgeInsets.all(spaceMD);
  static const EdgeInsets paddingLG = EdgeInsets.all(spaceLG);
  static const EdgeInsets paddingXL = EdgeInsets.all(spaceXL);
  static const EdgeInsets padding2XL = EdgeInsets.all(48.0);
  
  static const double space2XL = 48.0;
  static const double space3XL = 64.0;
  static const double radius2XL = 48.0;

  // --- Game Accents ---
  static const Color gameBlue = Color(0xFF3B82F6); 
  static const Color gameGreen = Color(0xFF22C55E);
  static const Color gamePurple = Color(0xFFA855F7);
  static const Color gameOrange = Color(0xFFF97316);
  static const Color gamePink = Color(0xFFEC4899);
  static const Color gameTeal = Color(0xFF14B8A6);
  static const Color gameIndigo = Color(0xFF6366F1);
  static const Color gameAmber = Color(0xFFEAB308);
  static const Color gameRose = Color(0xFFF43F5E);
  static const Color gameViolet = Color(0xFF8B5CF6);
  static const Color gameCyan = Color(0xFF06B6D4);
  static const Color gameEmerald = Color(0xFF10B981);

  // --- Compatibility Aliases ---
  static const Color lightError = error;
  static const Color lightSurface = surface;
  static const Color darkSurfaceElevated = darkSurface;
  static const Color lightSurfaceElevated = surface;
  static const Color lightOutline = outline;
  static const Color lightOutlineVariant = outlineVariant;
  static const Color lightOnSurfaceMuted = inkSlate;
  
  static const Color accentIndigo = primary;
  static const Color accentOrange = accentAmber;
  static const Color accentGreen = accentEmerald;
  static const Color accentBlue = gameBlue;
  static const Color accentPurple = gamePurple;
  static const Color accentRed = error;
  static const Color secondary = accentBerry;
}
