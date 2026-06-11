import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'kenken_screen.dart';

final kenkenMetadata = GameMetadata(
  id: 'kenken',
  category: 'MATH',
  icon: Icons.calculate_outlined,
  color: DesignSystem.gameTeal,
  builder: (context) => KenKenScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.kenkenTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.kenkenSubtitle(4);
