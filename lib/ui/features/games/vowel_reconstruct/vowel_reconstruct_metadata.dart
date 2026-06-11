import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'vowel_reconstruct_screen.dart';

final vowelReconstructMetadata = GameMetadata(
  id: 'vowel_reconstruct',
  category: 'WORD',
  icon: Icons.spellcheck_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => VowelReconstructScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.vowelReconstructTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.vowelReconstructSubtitle;
