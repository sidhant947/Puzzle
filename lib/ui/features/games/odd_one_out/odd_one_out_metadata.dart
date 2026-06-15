import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'odd_one_out_screen.dart';

final oddOneOutMetadata = GameMetadata(
  id: 'odd_one_out',
  category: 'ATTENTION',
  icon: Icons.visibility_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => OddOneOutScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.oddOneOutTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.oddOneOutSubtitle;
