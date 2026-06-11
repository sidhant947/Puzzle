import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'math_path_screen.dart';

final mathPathMetadata = GameMetadata(
  id: 'math_path',
  category: 'MATH',
  icon: Icons.route_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => MathPathScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.mathPathTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.mathPathSubtitle;
