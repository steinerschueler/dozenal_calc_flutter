// Settings page, reached from the info list ("Menü" →
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
import 'round_badge.dart';
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
                color: BadgeHue.indigo,
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
            const _FontSizeRow(),
            Divider(color: t.divider, height: 1),
            const _HapticsRow(),
            Divider(color: t.divider, height: 1),
            _SegmentRow(
              icon: Icons.layers_outlined,
              color: BadgeHue.green,
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
              color: BadgeHue.pink,
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
                // switch and should be self-explanatory. World colour code:
                // dozenal = Twelve-world violet, decimal = Ten-world green
                // (same hues as the DOZ/DEZ badges and the converter keys).
                icon: Icons.dialpad,
                color: BadgeHue.cyan,
                title: l.settingsNumeralSystemTitle,
                labels: [
                  l.settingsNumeralSystemDozenal,
                  l.settingsNumeralSystemDecimal,
                ],
                optionColors: [t.worldTwelve, t.worldTen],
                selectedIndex: calc.numeralSystem == NumeralSystem.doz ? 0 : 1,
                // handleClick runs the same buffer-conversion path as the
                // keypad's Doz/Dez keys (value-preserving base switch).
                onSelected: (i) =>
                    calc.handleClick(i == 0 ? const Doz() : const Dez()),
              ),
              Divider(color: t.divider, height: 1),
              _SegmentRow(
                icon: Icons.architecture,
                color: BadgeHue.bronze,
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
      color: BadgeHue.violet,
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
      color: BadgeHue.blue,
      title: l.settingsKeypadGlyphsTitle,
      labels: [l.infoListGlyphStyleCustom, l.infoListGlyphStyleConventional],
      selectedIndex: notifier.keypadStyle == GlyphStyle.custom ? 0 : 1,
      onSelected: (i) => notifier.setKeypadStyle(
        i == 0 ? GlyphStyle.custom : GlyphStyle.conventional,
      ),
    );
  }
}

/// Text-size picker: three "A" glyphs at increasing sizes (language-neutral,
/// so only the row title is localized). Drives [CalcPrefsNotifier.setFontSize]
/// → the app-wide textScaler and the converter display. Default Normal; on
/// tablets the baseline is already enlarged (see [effectiveTextScale]).
class _FontSizeRow extends StatelessWidget {
  const _FontSizeRow();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final prefs = CalcPrefsScope.of(context);
    final t = AppColors.of(context);
    const sizes = [13.0, 18.0, 23.0]; // normal / large / xlarge sample "A"s
    final sel = FontSize.values.indexOf(prefs.fontSize);
    return ListTile(
      leading: const RoundIconBadge(
        icon: Icons.format_size,
        color: BadgeHue.teal,
      ),
      title: Text(
        l.settingsFontSizeTitle,
        style: TextStyle(fontSize: 14, color: t.textPrimary),
      ),
      trailing: ToggleButtons(
        isSelected: [for (var i = 0; i < sizes.length; i++) i == sel],
        onPressed: (i) => prefs.setFontSize(FontSize.values[i]),
        constraints: const BoxConstraints(minWidth: 48, minHeight: 36),
        borderRadius: BorderRadius.circular(6),
        borderColor: t.cardBorder,
        selectedBorderColor: t.pagerBorder,
        color: t.textFaint,
        selectedColor: t.textPrimary,
        fillColor: t.cardFill,
        children: [
          for (final s in sizes)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              // noScaling: the sample A's show their own relative sizes, not
              // re-scaled by the (live) app textScaler this row controls.
              child: Text(
                'A',
                textScaler: TextScaler.noScaling,
                style: TextStyle(fontSize: s),
              ),
            ),
        ],
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
      leading: const RoundIconBadge(
        icon: Icons.vibration,
        color: BadgeHue.amber,
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
    required this.color,
    required this.title,
    required this.labels,
    required this.selectedIndex,
    required this.onSelected,
    this.segmentMinWidth = 64,
    this.optionColors,
  });

  final IconData icon;
  final Color color;
  final String title;
  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final double segmentMinWidth;

  /// Optional per-option hue (the world colour code): each label is tinted in
  /// its own colour (dimmed while unselected) and the selected segment's
  /// frame takes that hue — same active-frame convention as the keypads.
  /// Null → the neutral grey segment styling.
  final List<Color>? optionColors;

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    final hues = optionColors;
    return ListTile(
      leading: RoundIconBadge(icon: icon, color: color),
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
        selectedBorderColor: hues?[selectedIndex] ?? t.pagerBorder,
        color: t.textFaint,
        selectedColor: t.textPrimary,
        fillColor: t.cardFill,
        textStyle: const TextStyle(fontSize: 12),
        children: [
          for (var i = 0; i < labels.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                labels[i],
                style: hues == null
                    ? null
                    : TextStyle(
                        color: i == selectedIndex
                            ? hues[i]
                            : hues[i].withValues(alpha: 0.55),
                      ),
              ),
            ),
        ],
      ),
    );
  }
}
