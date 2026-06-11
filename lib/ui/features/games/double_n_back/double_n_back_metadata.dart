import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'double_n_back_screen.dart';

final doubleNBackMetadata = GameMetadata(
  id: 'double_n_back',
  category: 'MEMORY',
  icon: Icons.layers_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => DoubleNBackScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.doubleNBackTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.doubleNBackSubtitle(2);
