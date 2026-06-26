import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'color_word_match_up_screen.dart';

final colorWordMatchUpMetadata = GameMetadata(
  id: 'color_word_match_up',
  category: 'ATTENTION',
  icon: Icons.palette_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const ColorWordMatchUpScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.colorWordMatchUpTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.colorWordMatchUpSubtitle;
