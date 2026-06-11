import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'einstein_riddle_screen.dart';

final einsteinRiddleMetadata = GameMetadata(
  id: 'einstein_riddle',
  category: 'LOGIC',
  icon: Icons.extension_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => EinsteinRiddleScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.einsteinRiddleTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.einsteinRiddleSubtitle;
