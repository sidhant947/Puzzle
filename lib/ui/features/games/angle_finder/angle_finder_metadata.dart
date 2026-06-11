import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'angle_finder_screen.dart';

final angleFinderMetadata = GameMetadata(
  id: 'angle_finder',
  category: 'MATH',
  icon: Icons.architecture_rounded,
  color: DesignSystem.gameCyan,
  builder: (context) => AngleFinderScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.angleFinderTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.angleFinderSubtitle;
