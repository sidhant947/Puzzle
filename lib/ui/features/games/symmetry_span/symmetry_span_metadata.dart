import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'symmetry_span_screen.dart';

final symmetrySpanMetadata = GameMetadata(
  id: 'symmetry_span',
  category: 'MEMORY',
  icon: Icons.compare_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => SymmetrySpanScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.symmetrySpanTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.symmetrySpanSubtitle;
