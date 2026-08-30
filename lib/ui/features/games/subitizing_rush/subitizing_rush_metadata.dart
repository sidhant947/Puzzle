import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'subitizing_rush_screen.dart';

final subitizingRushMetadata = GameMetadata(
  id: 'subitizing_rush',
  category: 'ATTENTION',
  icon: Icons.grain_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => const SubitizingRushScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.subitizingRushTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.subitizingRushSubtitle;
