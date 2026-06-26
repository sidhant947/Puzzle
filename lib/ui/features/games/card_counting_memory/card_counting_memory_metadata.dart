import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'card_counting_memory_screen.dart';

final cardCountingMemoryMetadata = GameMetadata(
  id: 'card_counting_memory',
  category: 'MEMORY',
  icon: Icons.style_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const CardCountingMemoryScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.cardCountingMemoryTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.cardCountingMemorySubtitle;
