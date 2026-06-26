import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'directions_recall_screen.dart';

final directionsRecallMetadata = GameMetadata(
  id: 'directions_recall',
  category: 'MEMORY',
  icon: Icons.directions_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const DirectionsRecallScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.directionsRecallTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.directionsRecallSubtitle;
