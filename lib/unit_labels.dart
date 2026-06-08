// Shared localized labels for unit categories — used by both the converter
// keypad (converter_page) and the unit-theory page (conversions_page). Kept
// separate to avoid a circular import between those two.

import 'l10n/app_localizations.dart';
import 'logic/unit_data.dart';

/// Localized label for a unit category (Set 3/4/8/9 tiles, theory tabs).
String converterCategoryLabel(UnitCategory c, AppLocalizations l) {
  switch (c) {
    case UnitCategory.count:
      return l.unitCatCount;
    case UnitCategory.dist:
      return l.unitCatDist;
    case UnitCategory.area:
      return l.unitCatArea;
    case UnitCategory.space:
      return l.unitCatSpace;
    case UnitCategory.weight:
      return l.unitCatWeight;
    case UnitCategory.time:
      return l.unitCatTime;
    case UnitCategory.angle:
      return l.unitCatAngle;
    case UnitCategory.price:
      return l.unitCatPrice;
    case UnitCategory.temp:
      return l.unitCatTemp;
    case UnitCategory.press:
      return l.unitCatPress;
    case UnitCategory.force:
      return l.unitCatForce;
    case UnitCategory.work:
      return l.unitCatWork;
    case UnitCategory.power:
      return l.unitCatPower;
    case UnitCategory.cook:
      return l.unitCatCook;
    case UnitCategory.liquid:
      return l.unitCatLiquid;
    case UnitCategory.moment:
      return l.unitCatMoment;
  }
}
