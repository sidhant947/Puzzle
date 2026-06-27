import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_provider.g.dart';

/// Persists the user-selected app locale (or `null` for system default).
///
/// Mirrors the Hive-backed pattern used by [ThemeNotifier].
@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  static const String _boxName = 'app_settings';
  static const String _localeKey = 'locale_code';
  static Box? _cachedBox;

  static Future<Box> _getBox() async {
    if (_cachedBox != null && _cachedBox!.isOpen) return _cachedBox!;
    _cachedBox = await Hive.openBox(_boxName);
    return _cachedBox!;
  }

  @override
  Locale? build() {
    _loadLocale();
    return null;
  }

  Future<void> _loadLocale() async {
    try {
      final box = await _getBox();
      final saved = box.get(_localeKey) as String?;
      final loaded = _decode(saved);
      if (state != loaded) state = loaded;
    } catch (_) {}
  }

  Future<void> setLocale(Locale? locale) async {
    try {
      final box = await _getBox();
      if (locale == null) {
        await box.delete(_localeKey);
      } else {
        await box.put(_localeKey, _encode(locale));
      }
      state = locale;
    } catch (_) {}
  }

  static String _encode(Locale locale) {
    final country = locale.countryCode;
    if (country != null && country.isNotEmpty) {
      return '${locale.languageCode}_$country';
    }
    return locale.languageCode;
  }

  /// Test-only accessor for [_encode].
  @visibleForTesting
  static String encodeForTest(Locale locale) => _encode(locale);

  /// Test-only accessor for [_decode].
  @visibleForTesting
  static Locale? decodeForTest(String? value) => _decode(value);

  static Locale? _decode(String? value) {
    if (value == null || value.isEmpty) return null;
    final parts = value.split('_');
    if (parts.isEmpty || parts[0].isEmpty) return null;
    if (parts.length == 1) return Locale(parts[0]);
    return Locale(parts[0], parts[1]);
  }
}
