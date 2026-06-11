import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'syllable_stack_screen.dart';

final syllableStackMetadata = GameMetadata(
  id: 'syllable_stack',
  category: 'WORD',
  icon: Icons.layers_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => SyllableStackScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.syllableStackTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.syllableStackSubtitle;
