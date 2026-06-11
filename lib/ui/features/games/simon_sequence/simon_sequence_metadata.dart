import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'simon_sequence_screen.dart';

final simonSequenceMetadata = GameMetadata(
  id: 'simon_sequence',
  category: 'MEMORY',
  icon: Icons.repeat_rounded,
  color: DesignSystem.gameCyan,
  builder: (context) => SimonSequenceScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.simonSequenceTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.simonSequenceSubtitle;
