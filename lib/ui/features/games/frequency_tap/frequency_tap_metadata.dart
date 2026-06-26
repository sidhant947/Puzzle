import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'frequency_tap_screen.dart';

final frequencyTapMetadata = GameMetadata(
  id: 'frequency_tap',
  category: 'ATTENTION',
  icon: Icons.graphic_eq_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const FrequencyTapScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.frequencyTapTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.frequencyTapSubtitle;
