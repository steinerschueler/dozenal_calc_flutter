// Persisted on/off preference for tap haptics on the keypad. Mirrors the
// GlyphStyleNotifier / GlyphStyleScope shape: a ChangeNotifier behind an
// InheritedNotifier so any descendant button can read the flag without
// prop-drilling. Defaults to on; the toggle lives in the info list next to
// the glyph-style switch. SharedPreferences key: haptics_enabled_v1.

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HapticsNotifier extends ChangeNotifier {
  static const String _prefsKey = 'haptics_enabled_v1';

  bool _enabled = true;
  bool _loaded = false;

  bool get enabled => _enabled;
  bool get loaded => _loaded;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _enabled = prefs.getBool(_prefsKey) ?? true;
    _loaded = true;
    notifyListeners();
  }

  Future<void> setEnabled(bool value) async {
    if (value == _enabled) return;
    _enabled = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefsKey, value);
    notifyListeners();
  }
}

class HapticsScope extends InheritedNotifier<HapticsNotifier> {
  const HapticsScope({
    super.key,
    required HapticsNotifier super.notifier,
    required super.child,
  });

  /// Subscribing read for build methods (e.g. the settings toggle, which must
  /// rebuild when the flag changes).
  static HapticsNotifier of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<HapticsScope>();
    assert(scope != null, 'HapticsScope.of called outside the haptics scope.');
    return scope!.notifier!;
  }

  /// Non-subscribing read for event handlers (a button tap): looks up the flag
  /// without registering a rebuild dependency. Defaults to enabled when no
  /// scope is present — e.g. isolated widget tests that pump the keypad
  /// without the app shell.
  static bool enabledOf(BuildContext context) {
    final scope = context.getInheritedWidgetOfExactType<HapticsScope>();
    return scope?.notifier?.enabled ?? true;
  }
}
