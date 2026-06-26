import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'base_conversion_run_screen.dart';

final baseConversionRunMetadata = GameMetadata(
  id: 'base_conversion_run',
  category: 'MATH',
  icon: Icons.numbers_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const BaseConversionRunScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.baseConversionRunTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.baseConversionRunSubtitle;
