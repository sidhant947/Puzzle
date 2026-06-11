import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'lighthouses_screen.dart';

final lighthousesMetadata = GameMetadata(
  id: 'lighthouses',
  category: 'LOGIC',
  icon: Icons.light_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => LighthousesScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.lighthousesTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.lighthousesSubtitle;
