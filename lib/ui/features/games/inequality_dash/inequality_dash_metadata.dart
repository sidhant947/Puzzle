import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'inequality_dash_screen.dart';

final inequalityDashMetadata = GameMetadata(
  id: 'inequality_dash',
  category: 'MATH',
  icon: Icons.compare_arrows_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => InequalityDashScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.inequalityDashTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.inequalityDashSubtitle;
