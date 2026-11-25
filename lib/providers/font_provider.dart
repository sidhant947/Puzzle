import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class FontNotifier extends Notifier<bool> {
  static const String _boxName = 'app_settings';
  static const String _fontKey = 'use_system_font';
  static Box? _cachedBox;
  bool _initialized = false;

  static Future<Box> _getBox() async {
    if (_cachedBox != null && _cachedBox!.isOpen) return _cachedBox!;
    _cachedBox = await Hive.openBox(_boxName);
    return _cachedBox!;
  }

  bool build() {
    _loadPreference();
    return false;
  }

  Future<void> _loadPreference() async {
    try {
      final box = await _getBox();
      if (_initialized) return;
      _initialized = true;
      final saved = box.get(_fontKey, defaultValue: false);
      if (saved is bool && state != saved) {
        state = saved;
      }
    } catch (_) {}
  }

  Future<void> setUseSystemFont(bool value) async {
    _initialized = true;
    state = value;
    try {
      final box = await _getBox();
      await box.put(_fontKey, value);
    } catch (_) {}
  }

  Future<void> toggle() => setUseSystemFont(!state);
}

final fontNotifierProvider =
    NotifierProvider<FontNotifier, bool>(FontNotifier.new);
