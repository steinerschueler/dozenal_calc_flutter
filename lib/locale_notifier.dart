import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// SharedPreferences key for the user-chosen locale override. Bump the
/// version suffix only on breaking changes to the persistence shape.
const String _kLocaleKey = 'locale_v1';

/// Holds the user's locale override (null = follow OS locale) and persists
/// it across launches. Kept separate from [DozenalCalcState] because
/// calculator logic and language preference are independent concerns.
class LocaleNotifier extends ChangeNotifier {
  Locale? _override;
  bool _loaded = false;

  /// Explicit override chosen via the in-app flag picker, or null while the
  /// app should follow the OS locale.
  Locale? get override => _override;

  /// True once [load] has finished reading SharedPreferences. Before this
  /// the override is provisionally null, so MaterialApp transparently
  /// follows the OS locale until the persisted choice arrives.
  bool get loaded => _loaded;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_kLocaleKey);
    if (code != null && code.isNotEmpty) {
      _override = Locale(code);
    }
    _loaded = true;
    notifyListeners();
  }

  Future<void> setOverride(Locale? locale) async {
    if (locale?.languageCode == _override?.languageCode) return;
    _override = locale;
    final prefs = await SharedPreferences.getInstance();
    if (locale == null) {
      await prefs.remove(_kLocaleKey);
    } else {
      await prefs.setString(_kLocaleKey, locale.languageCode);
    }
    notifyListeners();
  }
}

/// Resolution policy for the OS locale when no explicit override is set:
/// pick the device locale if it appears in [supported]; otherwise fall
/// back to English. Scales automatically as new ARB files are added —
/// `flutter gen-l10n` enlarges `AppLocalizations.supportedLocales`, and
/// the iteration here picks the new option up without code changes.
Locale resolveLocale(Locale? device, Iterable<Locale> supported) {
  if (device != null) {
    for (final s in supported) {
      if (s.languageCode == device.languageCode) return s;
    }
  }
  for (final s in supported) {
    if (s.languageCode == 'en') return s;
  }
  return supported.first;
}

/// Makes the app-wide [LocaleNotifier] reachable from any descendant via
/// [LocaleScope.of]. Deeper widgets (the flag picker in the info list)
/// can read the current override and write a new one without threading
/// the notifier through constructors.
class LocaleScope extends InheritedNotifier<LocaleNotifier> {
  const LocaleScope({
    super.key,
    required LocaleNotifier super.notifier,
    required super.child,
  });

  static LocaleNotifier of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<LocaleScope>();
    assert(scope != null, 'LocaleScope.of called outside the locale scope.');
    return scope!.notifier!;
  }
}
