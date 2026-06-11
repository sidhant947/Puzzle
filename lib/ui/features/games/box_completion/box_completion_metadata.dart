import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'box_completion_screen.dart';

final boxCompletionMetadata = GameMetadata(
  id: 'box_completion',
  category: 'SPATIAL',
  icon: Icons.crop_square_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => BoxCompletionScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.boxCompletionTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.boxCompletionSubtitle;
