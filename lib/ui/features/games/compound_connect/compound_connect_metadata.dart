import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'compound_connect_screen.dart';

final compoundConnectMetadata = GameMetadata(
  id: 'compound_connect',
  category: 'WORD',
  icon: Icons.merge_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => CompoundConnectScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.compoundConnectTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.compoundConnectSubtitle;
