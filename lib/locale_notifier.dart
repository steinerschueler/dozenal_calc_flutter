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
      _override = _parseLanguageTag(code);
    }
    _loaded = true;
    notifyListeners();
  }

  Future<void> setOverride(Locale? locale) async {
    if (locale?.toLanguageTag() == _override?.toLanguageTag()) return;
    _override = locale;
    final prefs = await SharedPreferences.getInstance();
    if (locale == null) {
      await prefs.remove(_kLocaleKey);
    } else {
      await prefs.setString(_kLocaleKey, locale.toLanguageTag());
    }
    notifyListeners();
  }
}

/// Parses a BCP-47 language tag back into a [Locale]. Handles plain
/// language codes (`de`), script-tagged locales (`zh-Hant`), and the
/// rare language+script+country form (`zh-Hant-HK`). Also tolerates the
/// underscore-separated form persisted by some older entries.
Locale _parseLanguageTag(String tag) {
  final parts = tag.split(RegExp(r'[-_]'));
  if (parts.length == 1) return Locale(parts[0]);
  String? script;
  String? country;
  for (var i = 1; i < parts.length; i++) {
    final p = parts[i];
    if (p.length == 4) {
      script = p;
    } else if (p.length == 2 || p.length == 3) {
      country = p;
    }
  }
  return Locale.fromSubtags(
    languageCode: parts[0],
    scriptCode: script,
    countryCode: country,
  );
}

/// Resolution policy for the OS locale when no explicit override is set:
/// pick the device locale if it appears in [supported]; otherwise fall
/// back to English. Scales automatically as new ARB files are added —
/// `flutter gen-l10n` enlarges `AppLocalizations.supportedLocales`, and
/// the iteration here picks the new option up without code changes.
///
/// Script-aware: when the device locale carries a script subtag (e.g.
/// `zh-Hant`), an exact language+script match wins over a bare
/// language match. For Chinese specifically, a region code without a
/// script (`zh-TW`, `zh-HK`, `zh-MO`) maps to the Traditional variant
/// when one is registered; everything else resolves to the bare `zh`.
Locale resolveLocale(Locale? device, Iterable<Locale> supported) {
  if (device != null) {
    final wantedTag = device.toLanguageTag().toLowerCase();
    for (final s in supported) {
      if (s.toLanguageTag().toLowerCase() == wantedTag) return s;
    }
    if (device.scriptCode != null) {
      for (final s in supported) {
        if (s.languageCode == device.languageCode &&
            s.scriptCode == device.scriptCode) {
          return s;
        }
      }
    }
    if (device.languageCode == 'zh') {
      final inferredScript =
          {'TW', 'HK', 'MO'}.contains(device.countryCode) ? 'Hant' : null;
      if (inferredScript != null) {
        for (final s in supported) {
          if (s.languageCode == 'zh' && s.scriptCode == inferredScript) {
            return s;
          }
        }
      }
    }
    // Prefer the variant without a script so `zh` doesn't accidentally
    // pick `zh-Hant`.
    for (final s in supported) {
      if (s.languageCode == device.languageCode && s.scriptCode == null) {
        return s;
      }
    }
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
