import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'sum_snake_screen.dart';

final sumSnakeMetadata = GameMetadata(
  id: 'sum_snake',
  category: 'MATH',
  icon: Icons.gesture_rounded,
  color: DesignSystem.gameEmerald,
  builder: (context) => SumSnakeScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.sumSnakeTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.sumSnakeSubtitle;
