import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'memory_palace_screen.dart';

final memoryPalaceMetadata = GameMetadata(
  id: 'memory_palace',
  category: 'MEMORY',
  icon: Icons.home_work_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => MemoryPalaceScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.memoryPalaceTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.memoryPalaceSubtitle;
