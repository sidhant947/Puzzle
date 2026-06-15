import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'crown_screen.dart';

final crownMetadata = GameMetadata(
  id: 'crown',
  category: 'LOGIC',
  icon: Icons.workspace_premium_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => CrownScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.crownTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.crownSubtitle;
