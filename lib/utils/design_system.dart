import 'package:flutter/material.dart';

class DesignSystem {
  // Symmetrical Spacing Scale
  static const double spaceXS = 4.0;
  static const double spaceSM = 8.0;
  static const double spaceMD = 16.0;
  static const double spaceLG = 24.0;
  static const double spaceXL = 32.0;
  static const double space2XL = 48.0;
  static const double space3XL = 64.0;

  // Symmetrical Radius Scale
  static const double radiusXS = 4.0;
  static const double radiusSM = 8.0;
  static const double radiusMD = 16.0;
  static const double radiusLG = 24.0;
  static const double radiusXL = 32.0;
  static const double radius2XL = 48.0;
  static const double radiusFull = 999.0;

  // Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  // --- Theme: Twilight Pastel (Unified Mid-tone) ---
  // This palette sits perfectly between light and dark, using mid-tone neutrals.
  static const Color unifiedPrimary = Color(0xFF6B705C); // Deep Sage (Soft & Grounded)
  static const Color unifiedPrimaryVariant = Color(0xFFA5A58D);
  static const Color unifiedSecondary = Color(0xFFD4A373); // Muted Camel
  static const Color unifiedAccent = Color(0xFFE9C46A); // Soft Gold
  
  // Mid-tone Background (Mushroom/Taupe - Not too light, not too dark)
  static const Color unifiedBackground = Color(0xFFE3D5CA); // Warm Sand/Taupe
  static const Color unifiedSurface = Color(0xFFEDDCD2); // Lighter Warm Neutral
  static const Color unifiedSurfaceElevated = Color(0xFFF5EBE0); // Creamy Highlight
  
  static const Color unifiedError = Color(0xFFE07A5F); // Terracotta Red
  
  static const Color unifiedOnPrimary = Color(0xFFF5EBE0);
  static const Color unifiedOnSecondary = Color(0xFF3D405B);
  
  static const Color unifiedOnBackground = Color(0xFF3D405B); // Deep Muted Navy/Slate
  static const Color unifiedOnSurface = Color(0xFF4A4E69);
  static const Color unifiedOnSurfaceMuted = Color(0xFF9A8C98);
  
  static const Color unifiedOutline = Color(0xFFD5BDAF); // Slightly deeper taupe
  static const Color unifiedOutlineVariant = Color(0xFFD6CCC2);

  // --- Compatibility Aliases (Mapping old theme names to unified colors) ---
  static const Color lightPrimary = unifiedPrimary;
  static const Color lightBackground = unifiedBackground;
  static const Color lightSurface = unifiedSurface;
  static const Color lightSurfaceElevated = unifiedSurfaceElevated;
  static const Color lightOnSurface = unifiedOnSurface;
  static const Color lightOnSurfaceMuted = unifiedOnSurfaceMuted;
  static const Color lightOutline = unifiedOutline;
  static const Color lightOutlineVariant = unifiedOutlineVariant;
  static const Color lightError = unifiedError;

  static const Color darkPrimary = unifiedPrimary;
  static const Color darkBackground = unifiedBackground;
  static const Color darkSurface = unifiedSurface;
  static const Color darkSurfaceElevated = unifiedSurfaceElevated;
  static const Color darkOnSurface = unifiedOnSurface;
  static const Color darkOnSurfaceMuted = unifiedOnSurfaceMuted;
  static const Color darkOutline = unifiedOutline;
  static const Color darkOutlineVariant = unifiedOutlineVariant;
  static const Color darkError = unifiedError;

  // --- Game Accents (Refined Mid-Pastels - Vibrant but Eye-friendly) ---
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

  // Both themes now return the same unified "Twilight Pastel" design
  static ThemeData get lightTheme => _buildTheme();
  static ThemeData get darkTheme => _buildTheme();

  static ThemeData _buildTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light, // Use light brightness as baseline for this mid-tone
      scaffoldBackgroundColor: unifiedBackground,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: unifiedPrimary,
        onPrimary: unifiedOnPrimary,
        primaryContainer: unifiedPrimary.withValues(alpha: 0.15),
        onPrimaryContainer: unifiedPrimary,
        secondary: unifiedSecondary,
        onSecondary: unifiedOnSecondary,
        secondaryContainer: unifiedSecondary.withValues(alpha: 0.15),
        onSecondaryContainer: unifiedSecondary,
        error: unifiedError,
        onError: Colors.white,
        surface: unifiedSurface,
        onSurface: unifiedOnSurface,
        surfaceContainerHighest: unifiedSurfaceElevated,
        outline: unifiedOutline,
        outlineVariant: unifiedOutlineVariant,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: unifiedOnSurface,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: unifiedOnSurface,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
        ),
      ),
      cardTheme: CardThemeData(
        color: unifiedSurface,
        elevation: 0,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusMD),
          side: BorderSide(
            color: unifiedOutline,
            width: 1.0,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: unifiedPrimary,
          foregroundColor: unifiedOnPrimary,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusSM),
          ),
          padding: const EdgeInsets.symmetric(horizontal: spaceLG, vertical: spaceMD),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: unifiedOnSurface,
          side: BorderSide(color: unifiedOutline, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusSM),
          ),
          padding: const EdgeInsets.symmetric(horizontal: spaceLG, vertical: spaceMD),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: unifiedPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusSM),
          ),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: unifiedSurfaceElevated,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusSM),
          borderSide: BorderSide(color: unifiedOutline, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusSM),
          borderSide: BorderSide(color: unifiedOutline, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusSM),
          borderSide: BorderSide(color: unifiedPrimary, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusSM),
          borderSide: BorderSide(color: unifiedError, width: 1.5),
        ),
        labelStyle: TextStyle(color: unifiedOnSurfaceMuted, fontWeight: FontWeight.w400),
        hintStyle: TextStyle(color: unifiedOnSurfaceMuted),
        contentPadding: const EdgeInsets.symmetric(horizontal: spaceMD, vertical: spaceMD),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: 56, fontWeight: FontWeight.w700, letterSpacing: -1.0, color: unifiedOnBackground, height: 1.1),
        displayMedium: TextStyle(fontSize: 48, fontWeight: FontWeight.w700, letterSpacing: -0.8, color: unifiedOnBackground, height: 1.1),
        displaySmall: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, letterSpacing: -0.5, color: unifiedOnBackground, height: 1.15),
        headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, letterSpacing: -0.4, color: unifiedOnSurface, height: 1.2),
        headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, letterSpacing: -0.2, color: unifiedOnSurface, height: 1.2),
        headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: -0.1, color: unifiedOnSurface, height: 1.25),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.0, color: unifiedOnSurface, height: 1.3),
        titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.0, color: unifiedOnSurface, height: 1.4),
        titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.1, color: unifiedOnSurface, height: 1.4),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.0, color: unifiedOnSurface, height: 1.6),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.1, color: unifiedOnSurface, height: 1.5),
        bodySmall: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.2, color: unifiedOnSurfaceMuted, height: 1.5),
        labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.4, color: unifiedOnSurface),
        labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.4, color: unifiedOnSurface),
        labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 0.8, color: unifiedOnSurfaceMuted),
      ),
      iconTheme: IconThemeData(
        color: unifiedOnSurface,
        size: 24,
      ),
      dividerTheme: DividerThemeData(
        color: unifiedOutline,
        space: spaceXL,
        thickness: 1.0,
      ),
    );
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreakpoint;
  }

  static int getGridCrossAxisCount(BuildContext context) {
    if (isMobile(context)) return 2;
    if (isTablet(context)) return 3;
    return 4;
  }

  // Symmetrical Padding Helpers
  static const EdgeInsets paddingXS = EdgeInsets.all(spaceXS);
  static const EdgeInsets paddingSM = EdgeInsets.all(spaceSM);
  static const EdgeInsets paddingMD = EdgeInsets.all(spaceMD);
  static const EdgeInsets paddingLG = EdgeInsets.all(spaceLG);
  static const EdgeInsets paddingXL = EdgeInsets.all(spaceXL);
  static const EdgeInsets padding2XL = EdgeInsets.all(space2XL);

  static const EdgeInsets paddingHorizontalXS = EdgeInsets.symmetric(horizontal: spaceXS);
  static const EdgeInsets paddingHorizontalSM = EdgeInsets.symmetric(horizontal: spaceSM);
  static const EdgeInsets paddingHorizontalMD = EdgeInsets.symmetric(horizontal: spaceMD);
  static const EdgeInsets paddingHorizontalLG = EdgeInsets.symmetric(horizontal: spaceLG);
  static const EdgeInsets paddingHorizontalXL = EdgeInsets.symmetric(horizontal: spaceXL);

  static const EdgeInsets paddingVerticalXS = EdgeInsets.symmetric(vertical: spaceXS);
  static const EdgeInsets paddingVerticalSM = EdgeInsets.symmetric(vertical: spaceSM);
  static const EdgeInsets paddingVerticalMD = EdgeInsets.symmetric(vertical: spaceMD);
  static const EdgeInsets paddingVerticalLG = EdgeInsets.symmetric(vertical: spaceLG);
  static const EdgeInsets paddingVerticalXL = EdgeInsets.symmetric(vertical: spaceXL);
}
