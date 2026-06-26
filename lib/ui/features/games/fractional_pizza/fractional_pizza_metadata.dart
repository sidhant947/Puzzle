import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'fractional_pizza_screen.dart';

final fractionalPizzaMetadata = GameMetadata(
  id: 'fractional_pizza',
  category: 'MATH',
  icon: Icons.local_pizza_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const FractionalPizzaScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.fractionalPizzaTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.fractionalPizzaSubtitle;
