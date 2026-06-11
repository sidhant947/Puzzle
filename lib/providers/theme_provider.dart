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

  Future<void> _loadThemeMode() async {
    try {
      final box = await Hive.openBox(_themeBoxName);
      final savedTheme = box.get(_themeKey, defaultValue: 'system');

      final loaded = switch (savedTheme) {
        'light' => AppThemeMode.light,
        'dark' => AppThemeMode.dark,
        _ => AppThemeMode.system,
      };

      if (state != loaded) {
        state = loaded;
      }
    } catch (_) {
      // Default to system on error
    }
  }

  Future<void> setThemeMode(AppThemeMode themeMode) async {
    try {
      final box = await Hive.openBox(_themeBoxName);
      await box.put(_themeKey, themeMode.name);
      state = themeMode;
    } catch (_) {
      // Keep current state on error
    }
  }

  void toggleTheme() {
    final next = switch (state) {
      AppThemeMode.light => AppThemeMode.dark,
      AppThemeMode.dark => AppThemeMode.system,
      AppThemeMode.system => AppThemeMode.light,
    };
    setThemeMode(next);
  }

  ThemeMode get themeMode => switch (state) {
        AppThemeMode.light => ThemeMode.light,
        AppThemeMode.dark => ThemeMode.dark,
        AppThemeMode.system => ThemeMode.system,
      };

  String get themeDisplayName => switch (state) {
        AppThemeMode.light => 'Light',
        AppThemeMode.dark => 'Dark',
        AppThemeMode.system => 'System',
      };

  IconData get themeIcon => switch (state) {
        AppThemeMode.light => Icons.light_mode_rounded,
        AppThemeMode.dark => Icons.dark_mode_rounded,
        AppThemeMode.system => Icons.brightness_auto_rounded,
      };
}
