import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'definition_dash_screen.dart';

final definitionDashMetadata = GameMetadata(
  id: 'definition_dash',
  category: 'WORD',
  icon: Icons.menu_book_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => DefinitionDashScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.definitionDashTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.definitionDashSubtitle;
