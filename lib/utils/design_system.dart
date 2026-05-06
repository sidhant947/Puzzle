import 'package:flutter/material.dart';

class DesignSystem {
  static const double spaceXS = 4.0;
  static const double spaceSM = 8.0;
  static const double spaceMD = 16.0;
  static const double spaceLG = 24.0;
  static const double spaceXL = 32.0;
  static const double space2XL = 48.0;
  static const double space3XL = 64.0;

  static const double radiusXS = 4.0;
  static const double radiusSM = 8.0;
  static const double radiusMD = 12.0;
  static const double radiusLG = 16.0;
  static const double radiusXL = 24.0;
  static const double radius2XL = 32.0;
  static const double radiusFull = 999.0;

  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  // Premium Light Theme - Soft Structuralism
  static const Color lightPrimary = Color(0xFF0A0A0A);
  static const Color lightPrimaryVariant = Color(0xFF262626);
  static const Color lightSecondary = Color(0xFF5B5B5B);
  static const Color lightSecondaryVariant = Color(0xFF737373);
  static const Color lightAccent = Color(0xFF2563EB);
  static const Color lightBackground = Color(0xFFFEFEFE);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceElevated = Color(0xFFFAFAFA);
  static const Color lightError = Color(0xFFDC2626);
  static const Color lightOnPrimary = Color(0xFFFFFFFF);
  static const Color lightOnSecondary = Color(0xFFFFFFFF);
  static const Color lightOnBackground = Color(0xFF0A0A0A);
  static const Color lightOnSurface = Color(0xFF171717);
  static const Color lightOnSurfaceMuted = Color(0xFF737373);
  static const Color lightOnError = Color(0xFFFFFFFF);
  static const Color lightOutline = Color(0xFFE5E5E5);
  static const Color lightOutlineVariant = Color(0xFFF0F0F0);

  // Premium Dark Theme - Ethereal Glass
  static const Color darkPrimary = Color(0xFFFAFAFA);
  static const Color darkPrimaryVariant = Color(0xFFE5E5E5);
  static const Color darkSecondary = Color(0xFFA3A3A3);
  static const Color darkSecondaryVariant = Color(0xFF737373);
  static const Color darkAccent = Color(0xFF3B82F6);
  static const Color darkBackground = Color(0xFF050505);
  static const Color darkSurface = Color(0xFF0C0C0C);
  static const Color darkSurfaceElevated = Color(0xFF141414);
  static const Color darkError = Color(0xFFEF4444);
  static const Color darkOnPrimary = Color(0xFF000000);
  static const Color darkOnSecondary = Color(0xFF000000);
  static const Color darkOnBackground = Color(0xFFFAFAFA);
  static const Color darkOnSurface = Color(0xFFF5F5F5);
  static const Color darkOnSurfaceMuted = Color(0xFF737373);
  static const Color darkOnError = Color(0xFF000000);
  static const Color darkOutline = Color(0xFF1F1F1F);
  static const Color darkOutlineVariant = Color(0xFF1A1A1A);

  // Game accent colors
  static const Color gameBlue = Color(0xFF3B82F6);
  static const Color gameGreen = Color(0xFF22C55E);
  static const Color gamePurple = Color(0xFF8B5CF6);
  static const Color gameOrange = Color(0xFFF97316);
  static const Color gamePink = Color(0xFFEC4899);
  static const Color gameTeal = Color(0xFF14B8A6);
  static const Color gameIndigo = Color(0xFF6366F1);
  static const Color gameAmber = Color(0xFFF59E0B);
  static const Color gameRose = Color(0xFFF43F5E);

  static ThemeData get lightTheme => _buildTheme(Brightness.light);
  static ThemeData get darkTheme => _buildTheme(Brightness.dark);

  static ThemeData _buildTheme(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;

    final Color primary = isDark ? darkPrimary : lightPrimary;
    final Color secondary = isDark ? darkSecondary : lightSecondary;
    final Color background = isDark ? darkBackground : lightBackground;
    final Color surface = isDark ? darkSurface : lightSurface;
    final Color surfaceElevated = isDark ? darkSurfaceElevated : lightSurfaceElevated;
    final Color error = isDark ? darkError : lightError;
    final Color onPrimary = isDark ? darkOnPrimary : lightOnPrimary;
    final Color onSecondary = isDark ? darkOnSecondary : lightOnSecondary;
    final Color onSurface = isDark ? darkOnSurface : lightOnSurface;
    final Color onSurfaceMuted = isDark ? darkOnSurfaceMuted : lightOnSurfaceMuted;
    final Color onError = isDark ? darkOnError : lightOnError;
    final Color outline = isDark ? darkOutline : lightOutline;
    final Color outlineVariant = isDark ? darkOutlineVariant : lightOutlineVariant;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: background,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: primary.withValues(alpha: isDark ? 0.2 : 0.1),
        onPrimaryContainer: primary,
        secondary: secondary,
        onSecondary: onSecondary,
        secondaryContainer: secondary.withValues(alpha: isDark ? 0.2 : 0.1),
        onSecondaryContainer: secondary,
        error: error,
        onError: onError,
        surface: surface,
        onSurface: onSurface,
        surfaceContainerHighest: surfaceElevated,
        outline: outline,
        outlineVariant: outlineVariant,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: onSurface,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: onSurface,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusXL),
          side: BorderSide(
            color: outline.withValues(alpha: isDark ? 0.2 : 0.1),
            width: 1,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusLG),
          ),
          padding: const EdgeInsets.symmetric(horizontal: spaceXL, vertical: spaceMD),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: onSurface,
          side: BorderSide(color: outline.withValues(alpha: isDark ? 0.3 : 0.2), width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusLG),
          ),
          padding: const EdgeInsets.symmetric(horizontal: spaceXL, vertical: spaceMD),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMD),
          ),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceElevated,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusLG),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusLG),
          borderSide: BorderSide(color: outline.withValues(alpha: isDark ? 0.3 : 0.2), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusLG),
          borderSide: BorderSide(color: primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusLG),
          borderSide: BorderSide(color: error, width: 1),
        ),
        labelStyle: TextStyle(color: onSurfaceMuted, fontWeight: FontWeight.w500),
        hintStyle: TextStyle(color: onSurfaceMuted),
        contentPadding: const EdgeInsets.symmetric(horizontal: spaceLG, vertical: spaceLG),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.w800, letterSpacing: -1.0, color: onSurface, height: 1.1),
        displayMedium: TextStyle(fontSize: 40, fontWeight: FontWeight.w800, letterSpacing: -1.0, color: onSurface, height: 1.1),
        displaySmall: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, letterSpacing: -1.0, color: onSurface, height: 1.2),
        headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, letterSpacing: -0.5, color: onSurface),
        headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: -0.5, color: onSurface),
        headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: -0.5, color: onSurface),
        titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: -0.4, color: onSurface),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: -0.2, color: onSurface),
        titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: -0.1, color: onSurface),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0, color: onSurface, height: 1.5),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0, color: onSurface, height: 1.5),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0, color: onSurfaceMuted, height: 1.4),
        labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 0.1, color: onSurface),
        labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: onSurface),
        labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.0, color: onSurfaceMuted),
      ),
      iconTheme: IconThemeData(
        color: onSurface,
        size: 24,
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

  static const EdgeInsets paddingXS = EdgeInsets.all(spaceXS);
  static const EdgeInsets paddingSM = EdgeInsets.all(spaceSM);
  static const EdgeInsets paddingMD = EdgeInsets.all(spaceMD);
  static const EdgeInsets paddingLG = EdgeInsets.all(spaceLG);
  static const EdgeInsets paddingXL = EdgeInsets.all(spaceXL);

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