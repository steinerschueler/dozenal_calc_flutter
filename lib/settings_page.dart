// Settings page, reached from the info list ("Theorie und Weiteres" →
// "Einstellungen"). Bundles the quick preferences that used to live as
// loose rows in the info list (glyph style, haptics) with the new keypad
// preferences (overlay vs. scroll, full vs. simple) and — because the
// simple keypad has no Doz/Dez/DRG keys — the live numeral system and
// angle mode of the calculator itself.
//
// The two calc-state rows read the orchestrator through CalcStateScope and
// are hidden when no scope is present (e.g. widget tests pumping the page
// standalone); the theme row reads ThemeScope the same way (Dunkel/Hell/
// System, persisted via ThemeNotifier).

import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'calc_prefs.dart';
import 'calc_scope.dart';
import 'haptics.dart';
import 'l10n/app_localizations.dart';
import 'logic/glyph_style.dart';
import 'tokens.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final prefs = CalcPrefsScope.of(context);
    // Subscribing read — InheritedNotifier rebuilds this page whenever the
    // calc state notifies, keeping the Doz/Dez and DEG/RAD/GRD segments in
    // sync with keypad-driven changes too.
    final calc = CalcStateScope.maybeOf(context);
    final t = AppColors.of(context);
    // maybeOf: widget tests pumping the page standalone have no ThemeScope —
    // the row is hidden then, same convention as the calc-state rows below.
    final theme = ThemeScope.maybeOf(context);
    return Scaffold(
      appBar: AppBar(title: Text(l.settingsTitle)),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 4),
          children: [
            if (theme != null) ...[
              _SegmentRow(
                icon: Icons.brightness_6_outlined,
                title: l.settingsThemeTitle,
                labels: [
                  // Label order mirrors ThemeSetting.values (dark/light/system).
                  l.settingsThemeDark,
                  l.settingsThemeLight,
                  l.settingsThemeSystem,
                ],
                segmentMinWidth: 56,
                selectedIndex: ThemeSetting.values.indexOf(theme.setting),
                onSelected: (i) => theme.setSetting(ThemeSetting.values[i]),
              ),
              Divider(color: t.divider, height: 1),
            ],
            const _GlyphStyleRow(),
            Divider(color: t.divider, height: 1),
            const _KeypadGlyphsRow(),
            Divider(color: t.divider, height: 1),
            const _HapticsRow(),
            Divider(color: t.divider, height: 1),
            _SegmentRow(
              icon: Icons.layers_outlined,
              title: l.settingsKeypadModeTitle,
              labels: [l.settingsKeypadModeOverlay, l.settingsKeypadModeScroll],
              selectedIndex: prefs.mode == KeypadMode.overlay ? 0 : 1,
              onSelected: (i) => prefs.setMode(
                i == 0 ? KeypadMode.overlay : KeypadMode.scroll,
              ),
            ),
            Divider(color: t.divider, height: 1),
            _SegmentRow(
              icon: Icons.functions,
              title: l.settingsScopeTitle,
              labels: [l.settingsScopeFull, l.settingsScopeSimple],
              selectedIndex: prefs.profile == KeypadProfile.full ? 0 : 1,
              onSelected: (i) => prefs.setProfile(
                i == 0 ? KeypadProfile.full : KeypadProfile.simple,
              ),
            ),
            if (calc != null) ...[
              Divider(color: t.divider, height: 1),
              _SegmentRow(
                // Written out (localized) — since the Doz/Dez keypad keys
                // moved out of the overlay, this row is the primary base
                // switch and should be self-explanatory.
                icon: Icons.dialpad,
                title: l.settingsNumeralSystemTitle,
                labels: [
                  l.settingsNumeralSystemDozenal,
                  l.settingsNumeralSystemDecimal,
                ],
                selectedIndex: calc.numeralSystem == NumeralSystem.doz ? 0 : 1,
                // handleClick runs the same buffer-conversion path as the
                // keypad's Doz/Dez keys (value-preserving base switch).
                onSelected: (i) =>
                    calc.handleClick(i == 0 ? const Doz() : const Dez()),
              ),
              Divider(color: t.divider, height: 1),
              _SegmentRow(
                icon: Icons.architecture,
                title: l.settingsAngleModeTitle,
                // DEG/RAD/GRD are the same labels the display badge shows.
                labels: [for (final m in AngleMode.values) m.label],
                segmentMinWidth: 48,
                selectedIndex: AngleMode.values.indexOf(calc.angleMode),
                onSelected: (i) => calc.setAngleMode(AngleMode.values[i]),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Toggle between the twelve custom dozenal glyphs and conventional
/// 0-9/A-B rendering in the display. Only affects the display — the keypad
/// digit keys have their own independent toggle below (_KeypadGlyphsRow).
/// (Moved here from the info list when the settings page was introduced.)
class _GlyphStyleRow extends StatelessWidget {
  const _GlyphStyleRow();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final notifier = GlyphStyleScope.of(context);
    return _SegmentRow(
      icon: Icons.text_fields,
      title: l.infoListGlyphStyleTitle,
      labels: [l.infoListGlyphStyleCustom, l.infoListGlyphStyleConventional],
      selectedIndex: notifier.style == GlyphStyle.custom ? 0 : 1,
      onSelected: (i) => notifier.setStyle(
        i == 0 ? GlyphStyle.custom : GlyphStyle.conventional,
      ),
    );
  }
}

/// Toggle between custom glyphs and conventional 0-9/A-B digits on the
/// keypad digit keys (main calculator and converter). Independent of the
/// display toggle above — both default to glyphs.
class _KeypadGlyphsRow extends StatelessWidget {
  const _KeypadGlyphsRow();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final notifier = GlyphStyleScope.of(context);
    return _SegmentRow(
      icon: Icons.dialpad_outlined,
      title: l.settingsKeypadGlyphsTitle,
      labels: [l.infoListGlyphStyleCustom, l.infoListGlyphStyleConventional],
      selectedIndex: notifier.keypadStyle == GlyphStyle.custom ? 0 : 1,
      onSelected: (i) => notifier.setKeypadStyle(
        i == 0 ? GlyphStyle.custom : GlyphStyle.conventional,
      ),
    );
  }
}

/// On/off switch for keypad tap haptics. Persisted via [HapticsNotifier]
/// and consulted by every keypad button tap.
class _HapticsRow extends StatelessWidget {
  const _HapticsRow();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final notifier = HapticsScope.of(context);
    final t = AppColors.of(context);
    return ListTile(
      leading: SizedBox(
        width: 28,
        child: Icon(Icons.vibration, color: t.textMuted, size: 16),
      ),
      title: Text(
        l.infoListHapticsTitle,
        style: TextStyle(fontSize: 14, color: t.textPrimary),
      ),
      trailing: Switch(value: notifier.enabled, onChanged: notifier.setEnabled),
    );
  }
}

/// One settings row: leading icon, title, trailing segmented toggle.
/// Styling matches the former _GlyphStyleToggle in the info list so the
/// moved rows look unchanged.
class _SegmentRow extends StatelessWidget {
  const _SegmentRow({
    required this.icon,
    required this.title,
    required this.labels,
    required this.selectedIndex,
    required this.onSelected,
    this.segmentMinWidth = 64,
  });

  final IconData icon;
  final String title;
  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final double segmentMinWidth;

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    return ListTile(
      leading: SizedBox(
        width: 28,
        child: Icon(icon, color: t.textMuted, size: 16),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 14, color: t.textPrimary),
      ),
      trailing: ToggleButtons(
        isSelected: [
          for (var i = 0; i < labels.length; i++) i == selectedIndex,
        ],
        onPressed: onSelected,
        constraints: BoxConstraints(minWidth: segmentMinWidth, minHeight: 32),
        borderRadius: BorderRadius.circular(6),
        borderColor: t.cardBorder,
        selectedBorderColor: t.pagerBorder,
        color: t.textFaint,
        selectedColor: t.textPrimary,
        fillColor: t.cardFill,
        textStyle: const TextStyle(fontSize: 12),
        children: [
          for (final label in labels)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(label),
            ),
        ],
      ),
    );
  }
}
