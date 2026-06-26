import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'letter_grid_swapper_screen.dart';

final letterGridSwapperMetadata = GameMetadata(
  id: 'letter_grid_swapper',
  category: 'WORD',
  icon: Icons.grid_view_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const LetterGridSwapperScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.letterGridSwapperTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.letterGridSwapperSubtitle;
