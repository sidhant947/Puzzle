import 'package:flutter/material.dart';

class DesignSystem {
  // Simple spacing tokens
  static const double spaceXS = 4.0;
  static const double spaceSM = 8.0;
  static const double spaceMD = 16.0;
  static const double spaceLG = 24.0;
  static const double spaceXL = 32.0;

  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;

  // Simple colors
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Colors.white;
  static const Color primary = Colors.blue;
  static const Color success = Colors.green;
  static const Color warning = Colors.orange;
  static const Color error = Colors.red;
  static const Color textPrimary = Colors.black87;
  static const Color textSecondary = Colors.black54;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        surface: background,
      ),
      cardTheme: CardThemeData(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusMedium)),
      ),
    );
  }

  static const EdgeInsets paddingMD = EdgeInsets.all(spaceMD);
  static const EdgeInsets paddingLG = EdgeInsets.all(spaceLG);
}
