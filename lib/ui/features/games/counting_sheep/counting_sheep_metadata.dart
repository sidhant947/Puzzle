import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'counting_sheep_screen.dart';

final countingSheepMetadata = GameMetadata(
  id: 'counting_sheep',
  category: 'ATTENTION',
  icon: Icons.pets_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => CountingSheepScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.countingSheepTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.countingSheepSubtitle;
