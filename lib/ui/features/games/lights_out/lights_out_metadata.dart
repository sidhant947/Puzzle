import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'lights_out_screen.dart';

final lightsOutMetadata = GameMetadata(
  id: 'lights_out',
  category: 'LOGIC',
  icon: Icons.lightbulb_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => LightsOutScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.lightsOutTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.lightsOutSubtitle;
