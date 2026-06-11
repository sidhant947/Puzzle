import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'trace_path_screen.dart';

final tracePathMetadata = GameMetadata(
  id: 'trace_path',
  category: 'SPATIAL',
  icon: Icons.gesture_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => TracePathScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.tracePathTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.tracePathSubtitle;
