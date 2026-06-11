import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'choice_reaction_time_screen.dart';

final choiceReactionTimeMetadata = GameMetadata(
  id: 'choice_reaction_time',
  category: 'ATTENTION',
  icon: Icons.touch_app_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => ChoiceReactionTimeScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.choiceReactionTimeTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.choiceReactionTimeSubtitle;
