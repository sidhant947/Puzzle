import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'running_memory_span_screen.dart';

final runningMemorySpanMetadata = GameMetadata(
  id: 'running_memory_span',
  category: 'MEMORY',
  icon: Icons.fast_forward_rounded,
  color: DesignSystem.gameViolet,
  builder: (context) => RunningMemorySpanScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.runningMemorySpanTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.runningMemorySpanSubtitle;
