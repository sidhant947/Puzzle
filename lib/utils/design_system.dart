import 'package:flutter/material.dart';

class DesignSystem {
  // --- Elegant Typographic System (Scale) ---
  static const double fontSizeHero = 36.0;    // Massive splash/counters (optimized for legibility)
  static const double fontSize3XL  = 28.0;    // Major headings
  static const double fontSize2XL  = 24.0;    // Section titles
  static const double fontSizeXL   = 20.0;    // Card titles, screen titles
  static const double fontSizeLG   = 18.0;    // Primary buttons, list items (highly readable)
  static const double fontSizeMD   = 16.0;    // Standard body text (comfort scale)
  static const double fontSizeSM   = 14.0;    // Muted labels/secondary details
  static const double fontSizeXS   = 13.0;    // Micro captions, badges (highly accessible)
  static const double fontSize2XS  = 12.0;    // Tiny inline tag labels (absolute minimum)

  // --- Strict Spacing Grid ---
  static const double spaceXS = 6.0;          // Spaced out for better touch targets
  static const double spaceSM = 10.0;
  static const double spaceMD = 16.0;
  static const double spaceLG = 20.0;         // Clean margins
  static const double spaceXL = 28.0;         // Spacious proportions

  static const double radiusXS = 8.0;
  static const double radiusSM = 12.0;        // Soft, minimalistic radius
  static const double radiusMD = 16.0;
  static const double radiusLG = 24.0;
  static const double radiusXL = 32.0;
  static const double radiusFull = 999.0;

  // --- Universal Minimalist Colors (Shared) ---
  static const Color primary = Color(0xFF6366F1); // Indigo
  static const Color primaryShadow = Color(0xFF4F46E5);
  static const Color accentBerry = Color(0xFFEC4899); 
  static const Color accentEmerald = Color(0xFF10B981);
  static const Color accentAmber = Color(0xFFF59E0B);
  static const Color accentTeal = Color(0xFF0D9488);
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);

  // --- Light Theme Colors ---
  static const Color background = Color(0xFFF8FAFC); // Clean Slate 50
  static const Color surface = Colors.white;
  static const Color ink = Color(0xFF0F172A);
  static const Color inkSlate = Color(0xFF334155);    // Slate 700 for better soft contrast
  static const Color outline = Color(0xFFE2E8F0);
  static const Color outlineVariant = Color(0xFFCBD5E1);

  // --- Dark Theme Colors (AMOLED Optimized) ---
  static const Color darkBackground = Color(0xFF121212); // Deep charcoal / Near-black
  static const Color darkSurface = Color(0xFF1E1E1E);    // Dark gray card background
  static const Color darkInk = Color(0xFFF8FAFC);       // Slate 50
  static const Color darkInkSlate = Color(0xFF94A3B8);  // Slate 400 for balanced contrast
  static const Color darkOutline = Color(0xFF2D2D2D);   // Dark Slate Outline matching deep charcoal
  static const Color darkOutlineVariant = Color(0xFF3A3A3A); // Subtle Slate Grey

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
      fontFamily: 'Geist', // Sets Geist as the default app font family
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
          fontFamily: 'Bebas Neue', // Integrated Bebas Neue headings font
          color: mainInk,
          fontSize: fontSizeXL,
          fontWeight: FontWeight.w700, // Modern bold
          letterSpacing: 0.8,         // Opened up slightly for premium display breathing room
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Bebas Neue', // Headings keep Bebas Neue
          fontSize: fontSizeHero,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.0,         // Slightly spaced all-caps display
          color: mainInk,
          height: 1.15,               // Tight but non-colliding display heights
        ),
        displayMedium: TextStyle(
          fontFamily: 'Bebas Neue',
          fontSize: fontSize3XL,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
          color: mainInk,
          height: 1.15,
        ),
        displaySmall: TextStyle(
          fontFamily: 'Bebas Neue',
          fontSize: fontSize2XL,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
          color: mainInk,
          height: 1.2,
        ),
        headlineLarge: TextStyle(
          fontFamily: 'Bebas Neue',
          fontSize: fontSize3XL,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
          color: mainInk,
          height: 1.2,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Bebas Neue',
          fontSize: fontSize2XL,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
          color: mainInk,
          height: 1.25,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Bebas Neue',
          fontSize: fontSizeXL,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
          color: mainInk,
          height: 1.25,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Geist', // Switched to Geist (all-age readability)
          fontSize: fontSizeXL,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
          color: mainInk,
          height: 1.25,
        ),
        titleMedium: TextStyle(
          fontFamily: 'Geist',
          fontSize: fontSizeLG,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
          color: mainInk,
          height: 1.3,
        ),
        titleSmall: TextStyle(
          fontFamily: 'Geist',
          fontSize: fontSizeMD,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
          color: mainInk,
          height: 1.3,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Geist',
          fontSize: fontSizeLG,
          fontWeight: FontWeight.w500,
          color: subInk,
          letterSpacing: 0.15,       // Clean paragraph track spacing
          height: 1.55,               // Golden ratio for highly accessible reading (children/seniors)
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Geist',
          fontSize: fontSizeMD,
          fontWeight: FontWeight.w500,
          color: subInk,
          letterSpacing: 0.15,
          height: 1.6,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Geist',
          fontSize: fontSizeSM,
          fontWeight: FontWeight.w400,
          color: subInk,
          letterSpacing: 0.15,
          height: 1.6,
        ),
        labelLarge: TextStyle(
          fontFamily: 'Geist',
          fontSize: fontSizeSM,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
          color: mainInk,
          height: 1.2,
        ),
        labelMedium: TextStyle(
          fontFamily: 'Geist',
          fontSize: fontSizeXS,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.3,
          color: mainInk,
          height: 1.2,
        ),
        labelSmall: TextStyle(
          fontFamily: 'Geist',
          fontSize: fontSize2XS,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
          color: mainInk,
          height: 1.2,
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
  static const EdgeInsets padding2XL = EdgeInsets.all(32.0);
  
  static const double space2XL = 32.0;         // Tightened from 48.0
  static const double space3XL = 48.0;         // Tightened from 64.0
  static const double radius2XL = 40.0;        // Balanced radius

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
