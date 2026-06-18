import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'narrative_recall_screen.dart';

final narrativeRecallMetadata = GameMetadata(
  id: 'narrative_recall',
  category: 'MEMORY',
  icon: Icons.menu_book_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => const NarrativeRecallScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.narrativeRecallTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.narrativeRecallSubtitle;
