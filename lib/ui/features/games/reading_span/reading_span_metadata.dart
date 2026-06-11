import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'reading_span_screen.dart';

final readingSpanMetadata = GameMetadata(
  id: 'reading_span',
  category: 'MEMORY',
  icon: Icons.auto_stories_rounded,
  color: DesignSystem.gameOrange,
  builder: (context) => ReadingSpanScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.readingSpanTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.readingSpanSubtitle;
