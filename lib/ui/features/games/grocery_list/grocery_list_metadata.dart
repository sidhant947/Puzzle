import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'grocery_list_screen.dart';

final groceryListMetadata = GameMetadata(
  id: 'grocery_list',
  category: 'MEMORY',
  icon: Icons.shopping_basket_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => GroceryListScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.groceryListTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.groceryListSubtitle;
