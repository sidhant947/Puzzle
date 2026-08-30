import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'stroop_number_size_screen.dart';

final stroopNumberSizeMetadata = GameMetadata(
  id: 'stroop_number_size',
  category: 'ATTENTION',
  icon: Icons.format_size_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => const StroopNumberSizeScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.stroopNumberSizeTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.stroopNumberSizeSubtitle;
