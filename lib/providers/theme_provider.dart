import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

enum AppThemeMode {
  light,
  dark,
  system,
}

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  static const String _themeBoxName = 'theme_settings';
  static const String _themeKey = 'theme_mode';

  @override
  AppThemeMode build() {
    _loadThemeMode();
    return AppThemeMode.system;
  }

  void _loadThemeMode() async {
    try {
      final box = await Hive.openBox(_themeBoxName);
      final savedTheme = box.get(_themeKey, defaultValue: 'system');

      switch (savedTheme) {
        case 'light':
          state = AppThemeMode.light;
          break;
        case 'dark':
          state = AppThemeMode.dark;
          break;
        default:
          state = AppThemeMode.system;
      }
    } catch (e) {
      // If there's an error loading the theme, default to system
      state = AppThemeMode.system;
    }
  }

  void setThemeMode(AppThemeMode themeMode) async {
    try {
      final box = await Hive.openBox(_themeBoxName);
      await box.put(_themeKey, themeMode.name);
      state = themeMode;
    } catch (e) {
      // Handle error silently, keep current state
    }
  }

  void toggleTheme() {
    switch (state) {
      case AppThemeMode.light:
        setThemeMode(AppThemeMode.dark);
        break;
      case AppThemeMode.dark:
        setThemeMode(AppThemeMode.system);
        break;
      case AppThemeMode.system:
        setThemeMode(AppThemeMode.light);
        break;
    }
  }

  ThemeMode get themeMode {
    switch (state) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }

  String get themeDisplayName {
    switch (state) {
      case AppThemeMode.light:
        return 'Light';
      case AppThemeMode.dark:
        return 'Dark';
      case AppThemeMode.system:
        return 'System';
    }
  }

  IconData get themeIcon {
    switch (state) {
      case AppThemeMode.light:
        return Icons.light_mode_rounded;
      case AppThemeMode.dark:
        return Icons.dark_mode_rounded;
      case AppThemeMode.system:
        return Icons.brightness_auto_rounded;
    }
  }
}