// The menu's groups and what each entry leads to. Nothing may get lost in a
// redesign: these entries are the only way to the manuals, legal pages and the
// language choice.

import 'package:dozenal_calc_flutter/info_pages.dart';
import 'package:dozenal_calc_flutter/l10n/app_localizations.dart';
import 'package:dozenal_calc_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // A tall surface so every row of the unfolded menu is on screen.
  Future<void> openMenu(WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({'intro_seen_v5': true});
    await tester.pumpWidget(const DozenalCalcApp());
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 1200));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('theory chapters'));
    await tester.pumpAndSettle();
    // Only now: the calculator underneath is not laid out for this shape.
    tester.view.physicalSize = const Size(720, 4000);
    tester.view.devicePixelRatio = 2;
    addTearDown(tester.view.reset);
    await tester.pumpAndSettle();
  }

  Future<void> tapText(WidgetTester tester, String text) async {
    await tester.tap(find.text(text));
    await tester.pumpAndSettle();
  }

  testWidgets('the menu shows its three group headings and every entry', (
    tester,
  ) async {
    await openMenu(tester);
    for (final text in [
      'Learn',
      'App',
      'About the app',
      'Intro',
      'How to use',
      'Theory',
      'Settings',
      'Language',
      'Recommendations',
      'Privacy Policy',
      'License',
      'Support development',
      'Give Feedback',
    ]) {
      expect(find.text(text), findsOneWidget, reason: text);
    }
  });

  testWidgets('each calculator in the manual opens only its own chapters', (
    tester,
  ) async {
    await openMenu(tester);
    await tapText(tester, 'How to use');
    await tapText(tester, 'Value calculator');
    expect(find.text('The third calculator'), findsOneWidget);
    expect(find.text('The second calculator'), findsNothing);
    await tapText(tester, 'The third calculator');
    expect(find.byType(ManualChapterPage), findsOneWidget);
  });

  testWidgets('choosing a language switches the app and folds the list again', (
    tester,
  ) async {
    await openMenu(tester);
    await tapText(tester, 'Language');
    await tapText(tester, 'Deutsch');
    expect(find.text('Sprache'), findsOneWidget);
    expect(find.text('Français'), findsNothing);
    expect(find.text('Deutsch'), findsOneWidget);
  });

  testWidgets('back from the settings returns to the menu', (tester) async {
    await openMenu(tester);
    await tapText(tester, 'Settings');
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.byType(InfoListPage), findsOneWidget);
  });

  test('the German appearance title is short enough not to break mid-word', () {
    // Beside three segments a phone leaves about twelve characters for it;
    // "Erscheinungsbild" broke into "Erscheinung / sbild".
    const longestUnbrokenTitle = 12;
    final title = lookupAppLocalizations(const Locale('de')).settingsThemeTitle;
    expect(title.length, lessThanOrEqualTo(longestUnbrokenTitle));
  });
}
