import 'package:flutter/material.dart';

class DesignSystem {
  // Simple spacing tokens
  static const double spaceXS = 4.0;
  static const double spaceSM = 8.0;
  static const double spaceMD = 16.0;
  static const double spaceLG = 24.0;
  static const double spaceXL = 32.0;

  static const double radiusZero = 0.0;

  // Colors
  static const Color pureWhite = Colors.white;
  static const Color pureBlack = Colors.black;

  static ThemeData get lightTheme {
    return _buildTheme(Brightness.light);
  }

  static ThemeData get darkTheme {
    return _buildTheme(Brightness.dark);
  }

  static ThemeData _buildTheme(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;
    final Color bgColor = isDark ? pureBlack : pureWhite;
    final Color fgColor = isDark ? pureWhite : pureBlack;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: bgColor,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: fgColor,
        onPrimary: bgColor,
        secondary: fgColor,
        onSecondary: bgColor,
        error: Colors.red, // Keep red for errors but use it sparingly
        onError: pureWhite,
        surface: bgColor,
        onSurface: fgColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: fgColor,
          fontSize: 18,
          fontWeight: FontWeight.w900,
          letterSpacing: 2.0,
        ),
        shape: Border(
          bottom: BorderSide(color: fgColor, width: 1),
        ),
      ),
      cardTheme: CardThemeData(
        color: bgColor,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: fgColor, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: fgColor,
          foregroundColor: bgColor,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          padding: const EdgeInsets.symmetric(horizontal: spaceLG, vertical: spaceMD),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: fgColor,
          side: BorderSide(color: fgColor, width: 1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          padding: const EdgeInsets.symmetric(horizontal: spaceLG, vertical: spaceMD),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: fgColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: bgColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: fgColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: fgColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: fgColor, width: 2),
        ),
        labelStyle: TextStyle(color: fgColor),
        hintStyle: TextStyle(color: fgColor.withValues(alpha: 0.5)),
      ),
      dividerTheme: DividerThemeData(
        color: fgColor,
        thickness: 1,
        space: 1,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(color: fgColor, fontWeight: FontWeight.w900),
        displayMedium: TextStyle(color: fgColor, fontWeight: FontWeight.w900),
        displaySmall: TextStyle(color: fgColor, fontWeight: FontWeight.w900),
        headlineLarge: TextStyle(color: fgColor, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(color: fgColor, fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(color: fgColor, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(color: fgColor, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(color: fgColor, fontWeight: FontWeight.bold),
        titleSmall: TextStyle(color: fgColor, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: fgColor),
        bodyMedium: TextStyle(color: fgColor),
        bodySmall: TextStyle(color: fgColor),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: fgColor,
        linearTrackColor: fgColor.withValues(alpha: 0.1),
      ),
      listTileTheme: ListTileThemeData(
        textColor: fgColor,
        iconColor: fgColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: spaceMD, vertical: spaceXS),
      ),
    );
  }

  static const EdgeInsets paddingMD = EdgeInsets.all(spaceMD);
  static const EdgeInsets paddingLG = EdgeInsets.all(spaceLG);
}
