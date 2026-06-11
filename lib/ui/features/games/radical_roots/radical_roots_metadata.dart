import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'radical_roots_screen.dart';

final radicalRootsMetadata = GameMetadata(
  id: 'radical_roots',
  category: 'MATH',
  icon: Icons.square_foot_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => RadicalRootsScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.radicalRootsTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.radicalRootsSubtitle;
