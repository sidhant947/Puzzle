import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'collatz_screen.dart';

final collatzMetadata = GameMetadata(
  id: 'collatz',
  category: 'MATH',
  icon: Icons.route_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => CollatzScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.collatzTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.collatzSubtitle;
