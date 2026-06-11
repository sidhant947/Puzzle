import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'orbit_tap_screen.dart';

final orbitTapMetadata = GameMetadata(
  id: 'orbit_tap',
  category: 'ATTENTION',
  icon: Icons.vibration_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => OrbitTapScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.orbitTapTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.orbitTapSubtitle;
