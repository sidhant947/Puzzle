import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'consonant_reconstruct_screen.dart';

final consonantReconstructMetadata = GameMetadata(
  id: 'consonant_reconstruct',
  category: 'WORD',
  icon: Icons.text_fields_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => ConsonantReconstructScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.consonantReconstructTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.consonantReconstructSubtitle;
