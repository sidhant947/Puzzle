import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'sternberg_task_screen.dart';

final sternbergTaskMetadata = GameMetadata(
  id: 'sternberg_task',
  category: 'MEMORY',
  icon: Icons.memory_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => SternbergTaskScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.sternbergTaskTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.sternbergTaskSubtitle;
