import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'simon_command_screen.dart';

final simonCommandMetadata = GameMetadata(
  id: 'simon_command',
  category: 'ATTENTION',
  icon: Icons.record_voice_over_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => SimonCommandScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.simonCommandTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.simonCommandSubtitle;
