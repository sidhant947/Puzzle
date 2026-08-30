import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'conundrum_anagram_screen.dart';

final conundrumAnagramMetadata = GameMetadata(
  id: 'conundrum_anagram',
  category: 'WORD',
  icon: Icons.spellcheck_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => const ConundrumAnagramScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.conundrumAnagramTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.conundrumAnagramSubtitle;
