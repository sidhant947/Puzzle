import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'event_timeline_memory_screen.dart';

final eventTimelineMemoryMetadata = GameMetadata(
  id: 'event_timeline_memory',
  category: 'MEMORY',
  icon: Icons.timeline_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const EventTimelineMemoryScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.eventTimelineMemoryTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.eventTimelineMemorySubtitle;
