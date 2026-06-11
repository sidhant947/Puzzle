import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'symmetry_screen.dart';

final symmetryMetadata = GameMetadata(
  id: 'symmetry',
  category: 'SPATIAL',
  icon: Icons.flip_rounded,
  color: DesignSystem.gameViolet,
  builder: (context) => SymmetryScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.symmetryTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.symmetrySubtitle;
