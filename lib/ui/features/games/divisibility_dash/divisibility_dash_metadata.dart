import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'divisibility_dash_screen.dart';

final divisibilityDashMetadata = GameMetadata(
  id: 'divisibility_dash',
  category: 'MATH',
  icon: Icons.speed_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => DivisibilityDashScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.divisibilityDashTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.divisibilityDashSubtitle;
