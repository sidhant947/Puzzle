import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'base_shift_screen.dart';

final baseShiftMetadata = GameMetadata(
  id: 'base_shift',
  category: 'MATH',
  icon: Icons.exposure_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => BaseShiftScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.baseShiftTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.baseShiftSubtitle;
