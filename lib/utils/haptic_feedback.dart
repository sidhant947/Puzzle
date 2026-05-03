import 'package:flutter/services.dart';

/// Centralized haptic feedback utility for consistent haptic patterns across the app
class HapticFeedbackUtil {
  /// Light impact for selection/tap interactions
  static void lightImpact() {
    HapticFeedback.lightImpact();
  }

  /// Medium impact for important interactions
  static void mediumImpact() {
    HapticFeedback.mediumImpact();
  }

  /// Heavy impact for significant events (victory, errors)
  static void heavyImpact() {
    HapticFeedback.heavyImpact();
  }

  /// Selection click for cell/button selections
  static void selectionClick() {
    HapticFeedback.selectionClick();
  }

  /// Vibrate for errors or warnings
  static void vibrate() {
    HapticFeedback.vibrate();
  }

  /// Custom haptic pattern for game-specific interactions
  static void gameInteraction() {
    // Light impact for game interactions
    lightImpact();
  }

  /// Success pattern for completing puzzles
  static void success() {
    // Double light impact for success
    lightImpact();
    Future.delayed(const Duration(milliseconds: 50), () => lightImpact());
  }

  /// Error pattern for mistakes
  static void error() {
    // Single heavy impact for errors
    heavyImpact();
  }

  /// Victory pattern for game completion
  static void victory() {
    // Triple impact for victory celebration
    heavyImpact();
    Future.delayed(const Duration(milliseconds: 100), () {
      mediumImpact();
      Future.delayed(const Duration(milliseconds: 100), () => lightImpact());
    });
  }
}
