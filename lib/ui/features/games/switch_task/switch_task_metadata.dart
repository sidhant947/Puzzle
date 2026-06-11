import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'switch_task_screen.dart';

final switchTaskMetadata = GameMetadata(
  id: 'switch_task',
  category: 'ATTENTION',
  icon: Icons.swap_horiz_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => SwitchTaskScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.switchTaskTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.switchTaskSubtitle;
