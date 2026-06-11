// Settings page, reached from the info list ("Theorie und Weiteres" →
// "Einstellungen"). Bundles the quick preferences that used to live as
// loose rows in the info list (glyph style, haptics) with the new keypad
// preferences (overlay vs. scroll, full vs. simple) and — because the
// simple keypad has no Doz/Dez/DRG keys — the live numeral system and
// angle mode of the calculator itself.
//
// The two calc-state rows read the orchestrator through CalcStateScope and
// are hidden when no scope is present (e.g. widget tests pumping the page
// standalone). A light/dark theme switch will join this page once a theme
// system exists (user decision: deferred).

import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(l.settingsTitle),
        backgroundColor: const Color(0xFF1A1A1A),
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 4),
          children: [
            const _GlyphStyleRow(),
            const Divider(color: Color(0xFF2C2C2C), height: 1),
            const _HapticsRow(),
            const Divider(color: Color(0xFF2C2C2C), height: 1),
            _SegmentRow(
              icon: Icons.layers_outlined,
              title: l.settingsKeypadModeTitle,
              labels: [l.settingsKeypadModeOverlay, l.settingsKeypadModeScroll],
              selectedIndex: prefs.mode == KeypadMode.overlay ? 0 : 1,
              onSelected: (i) => prefs.setMode(
                i == 0 ? KeypadMode.overlay : KeypadMode.scroll,
              ),
            ),
            const Divider(color: Color(0xFF2C2C2C), height: 1),
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
              const Divider(color: Color(0xFF2C2C2C), height: 1),
              _SegmentRow(
                // Literal "Doz"/"Dez" — matches the painted keypad captions
                // and is language-neutral, so no ARB entries.
                icon: Icons.dialpad,
                title: l.settingsNumeralSystemTitle,
                labels: const ['Doz', 'Dez'],
                selectedIndex: calc.numeralSystem == NumeralSystem.doz ? 0 : 1,
                // handleClick runs the same buffer-conversion path as the
                // keypad's Doz/Dez keys (value-preserving base switch).
                onSelected: (i) =>
                    calc.handleClick(i == 0 ? const Doz() : const Dez()),
              ),
              const Divider(color: Color(0xFF2C2C2C), height: 1),
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
/// always uses custom glyphs as the visual identity. (Moved here from the
/// info list when the settings page was introduced.)
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

/// On/off switch for keypad tap haptics. Persisted via [HapticsNotifier]
/// and consulted by every keypad button tap.
class _HapticsRow extends StatelessWidget {
  const _HapticsRow();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final notifier = HapticsScope.of(context);
    return ListTile(
      leading: const SizedBox(
        width: 28,
        child: Icon(Icons.vibration, color: Color(0xFFA0A0A0), size: 16),
      ),
      title: Text(
        l.infoListHapticsTitle,
        style: const TextStyle(fontSize: 14, color: Colors.white),
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
    return ListTile(
      leading: SizedBox(
        width: 28,
        child: Icon(icon, color: const Color(0xFFA0A0A0), size: 16),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, color: Colors.white),
      ),
      trailing: ToggleButtons(
        isSelected: [
          for (var i = 0; i < labels.length; i++) i == selectedIndex,
        ],
        onPressed: onSelected,
        constraints: BoxConstraints(minWidth: segmentMinWidth, minHeight: 32),
        borderRadius: BorderRadius.circular(6),
        borderColor: const Color(0xFF3A3A3A),
        selectedBorderColor: const Color(0xFF5A5A5A),
        color: const Color(0xFF888888),
        selectedColor: Colors.white,
        fillColor: const Color(0xFF2A2A2A),
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
