import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'color_flood_screen.dart';

final colorFloodMetadata = GameMetadata(
  id: 'color_flood',
  category: 'LOGIC',
  icon: Icons.waves_rounded,
  color: DesignSystem.primary,
  builder: (context) => ColorFloodScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.colorFloodTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.colorFloodSubtitle(10, 20);
