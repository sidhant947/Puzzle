import 'package:flutter/services.dart';

/// Centralized haptic feedback utility for consistent haptic patterns across the app
class HapticFeedbackUtil {
  static int _lastHapticTime = 0;
  static const int _throttleMs = 30; // Min time between haptics

  static bool _shouldThrottle() {
    final now = DateTime.now().millisecondsSinceEpoch;
    if (now - _lastHapticTime < _throttleMs) return true;
    _lastHapticTime = now;
    return false;
  }

  /// Light impact for selection/tap interactions
  static void lightImpact() {
    if (_shouldThrottle()) return;
    HapticFeedback.lightImpact();
  }

  /// Medium impact for important interactions
  static void mediumImpact() {
    if (_shouldThrottle()) return;
    HapticFeedback.mediumImpact();
  }

  /// Heavy impact for significant events (victory, errors)
  static void heavyImpact() {
    if (_shouldThrottle()) return;
    HapticFeedback.heavyImpact();
  }

  /// Selection click for cell/button selections
  static void selectionClick() {
    if (_shouldThrottle()) return;
    HapticFeedback.selectionClick();
  }

  static void selection() => selectionClick();

  static void light() => lightImpact();

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
