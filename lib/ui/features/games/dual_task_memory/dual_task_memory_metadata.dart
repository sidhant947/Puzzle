import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'dual_task_memory_screen.dart';

final dualTaskMemoryMetadata = GameMetadata(
  id: 'dual_task_memory',
  category: 'MEMORY',
  icon: Icons.two_wheeler_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const DualTaskMemoryScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.dualTaskMemoryTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.dualTaskMemorySubtitle;
