import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'odd_even_flash_screen.dart';

final oddEvenFlashMetadata = GameMetadata(
  id: 'odd_even_flash',
  category: 'ATTENTION',
  icon: Icons.flash_on_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => const OddEvenFlashScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.oddEvenFlashTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.oddEvenFlashSubtitle;
