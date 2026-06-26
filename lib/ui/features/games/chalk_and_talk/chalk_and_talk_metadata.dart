import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'chalk_and_talk_screen.dart';

final chalkAndTalkMetadata = GameMetadata(
  id: 'chalk_and_talk',
  category: 'ATTENTION',
  icon: Icons.voice_over_off_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const ChalkAndTalkScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.chalkAndTalkTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.chalkAndTalkSubtitle;
