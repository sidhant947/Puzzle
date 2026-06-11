import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'chimp_test_screen.dart';

final chimpTestMetadata = GameMetadata(
  id: 'chimp_test',
  category: 'MEMORY',
  icon: Icons.looks_one_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => ChimpTestScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.chimpTestTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.chimpTestSubtitle;
