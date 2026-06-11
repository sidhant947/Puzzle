import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'mirror_tracing_screen.dart';

final mirrorTracingMetadata = GameMetadata(
  id: 'mirror_tracing',
  category: 'SPATIAL',
  icon: Icons.gesture_rounded,
  color: DesignSystem.gameCyan,
  builder: (context) => MirrorTracingScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.mirrorTracingTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.mirrorTracingSubtitle;
