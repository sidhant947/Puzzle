import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'stroop_test_screen.dart';

final stroopTestMetadata = GameMetadata(
  id: 'stroop_test',
  category: 'ATTENTION',
  icon: Icons.psychology_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => StroopTestScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.stroopTestTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.stroopTestSubtitle;
