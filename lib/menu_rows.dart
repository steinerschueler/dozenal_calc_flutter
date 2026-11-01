// Building blocks of the menu: rows drawn as key faces, so the menu reads as
// part of the calculators rather than as a separate settings list.

import 'package:dozenal_calc_flutter/app_theme.dart';
import 'package:dozenal_calc_flutter/key_face.dart';
import 'package:dozenal_calc_flutter/round_badge.dart';
import 'package:flutter/material.dart';

const double _rowMinHeight = 48;
const double _rowIconSize = 22;
const double _rowLeadingGap = 14;
const double _rowSideAir = 14;
const double _rowVerticalAir = 6;
const double _nestedRowIndent = 20;
const double _topRowFontSize = 16;
const double _nestedRowFontSize = 15;
const double _subtitleFontSize = 12;
const double _groupTitleFontSize = 13;
const double _groupTopAir = 14;
const double _groupTitleBottomAir = 4;
const double _expandMoreIconSize = 22;
const Duration _expandDuration = Duration(milliseconds: 200);

/// A set of menu rows, with a heading when the rows need one to be understood.
class MenuGroup extends StatelessWidget {
  const MenuGroup({required this.children, this.title, super.key});

  final String? title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final heading = title;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: _groupTopAir),
        if (heading != null)
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(
              _rowSideAir,
              0,
              _rowSideAir,
              _groupTitleBottomAir,
            ),
            child: Semantics(
              header: true,
              child: Text(
                heading,
                style: TextStyle(
                  fontSize: _groupTitleFontSize,
                  fontWeight: FontWeight.w700,
                  color: AppColors.of(context).textSecondary,
                ),
              ),
            ),
          ),
        ...children,
      ],
    );
  }
}

/// An icon in the leading slot of a row. Neutral unless [color] carries meaning.
class MenuRowIcon extends StatelessWidget {
  const MenuRowIcon(this.icon, {this.color, super.key});

  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: kBadgeDiameter,
      child: Icon(
        icon,
        size: _rowIconSize,
        color: color ?? AppColors.of(context).textSecondary,
      ),
    );
  }
}

/// One tappable menu row. Rows at [depth] 0 carry the stronger key face, nested
/// rows the weaker one and an indent, so the hierarchy stays visible.
class MenuRow extends StatelessWidget {
  const MenuRow({
    required this.title,
    required this.onTap,
    this.leading,
    this.subtitle,
    this.value,
    this.trailing,
    this.depth = 0,
    super.key,
  });

  final String title;
  final VoidCallback onTap;
  final Widget? leading;
  final String? subtitle;

  /// The current choice behind this row, shown before [trailing].
  final String? value;
  final Widget? trailing;
  final int depth;

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    final role = depth == 0 ? KeyRole.digit : KeyRole.operation;
    return Padding(
      padding: EdgeInsetsDirectional.only(start: _nestedRowIndent * depth),
      child: Padding(
        padding: keyFaceMargin,
        child: Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: keyFaceDecoration(t, role),
            child: InkWell(
              borderRadius: BorderRadius.circular(keyFaceRadius),
              onTap: onTap,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: _rowMinHeight),
                child: _rowContent(t),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _rowContent(AppColors t) {
    final slot = leading;
    final note = value;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: _rowSideAir,
        vertical: _rowVerticalAir,
      ),
      child: Row(
        children: [
          if (slot != null) ...[slot, const SizedBox(width: _rowLeadingGap)],
          Expanded(child: _rowTexts(t)),
          if (note != null)
            Text(
              note,
              style: TextStyle(
                fontSize: _nestedRowFontSize,
                color: t.textSecondary,
              ),
            ),
          ?trailing,
        ],
      ),
    );
  }

  Widget _rowTexts(AppColors t) {
    final hint = subtitle;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: depth == 0 ? _topRowFontSize : _nestedRowFontSize,
            fontWeight: FontWeight.w500,
            color: t.textPrimary,
          ),
        ),
        if (hint != null)
          Text(
            hint,
            style: TextStyle(fontSize: _subtitleFontSize, color: t.textFaint),
          ),
      ],
    );
  }
}

/// A [MenuRow] that unfolds further rows beneath itself. [childrenBuilder] runs
/// only while unfolded and gets a callback that folds the row again.
class MenuExpansionRow extends StatefulWidget {
  const MenuExpansionRow({
    required this.title,
    required this.childrenBuilder,
    this.leading,
    this.value,
    this.depth = 0,
    super.key,
  });

  final String title;
  final List<Widget> Function(BuildContext context, VoidCallback collapse)
  childrenBuilder;
  final Widget? leading;
  final String? value;
  final int depth;

  @override
  State<MenuExpansionRow> createState() => _MenuExpansionRowState();
}

class _MenuExpansionRowState extends State<MenuExpansionRow> {
  bool _expanded = false;

  void _setExpanded(bool expanded) => setState(() => _expanded = expanded);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MenuRow(
          title: widget.title,
          leading: widget.leading,
          value: widget.value,
          depth: widget.depth,
          trailing: AnimatedRotation(
            turns: _expanded ? 0.5 : 0,
            duration: _expandDuration,
            child: Icon(
              Icons.expand_more,
              color: AppColors.of(context).textFaint,
              size: _expandMoreIconSize,
            ),
          ),
          onTap: () => _setExpanded(!_expanded),
        ),
        AnimatedSize(
          duration: _expandDuration,
          alignment: Alignment.topCenter,
          child: _expanded
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: widget.childrenBuilder(
                    context,
                    () => _setExpanded(false),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
