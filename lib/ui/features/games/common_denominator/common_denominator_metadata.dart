import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'common_denominator_screen.dart';

final commonDenominatorMetadata = GameMetadata(
  id: 'common_denominator',
  category: 'MATH',
  icon: Icons.calculate_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => CommonDenominatorScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.commonDenominatorTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.commonDenominatorSubtitle;
