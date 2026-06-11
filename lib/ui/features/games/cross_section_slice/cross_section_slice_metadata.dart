import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'cross_section_slice_screen.dart';

final crossSectionSliceMetadata = GameMetadata(
  id: 'cross_section_slice',
  category: 'SPATIAL',
  icon: Icons.layers_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => CrossSectionSliceScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.crossSectionSliceTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.crossSectionSliceSubtitle;
