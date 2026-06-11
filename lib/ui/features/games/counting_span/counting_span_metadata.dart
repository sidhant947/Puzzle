import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'counting_span_screen.dart';

final countingSpanMetadata = GameMetadata(
  id: 'counting_span',
  category: 'MEMORY',
  icon: Icons.format_list_numbered_rounded,
  color: DesignSystem.gamePink,
  builder: (context) => CountingSpanScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.countingSpanTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.countingSpanSubtitle;
