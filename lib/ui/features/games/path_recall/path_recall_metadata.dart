import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'path_recall_screen.dart';

final pathRecallMetadata = GameMetadata(
  id: 'path_recall',
  category: 'MEMORY',
  icon: Icons.polyline_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => PathRecallScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.pathRecallTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.pathRecallSubtitle;
