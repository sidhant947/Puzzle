import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'memory_matrix_screen.dart';

final memoryMatrixMetadata = GameMetadata(
  id: 'memory_matrix',
  category: 'MEMORY',
  icon: Icons.memory_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => MemoryMatrixScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.memoryMatrixTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.memoryMatrixSubtitle;
