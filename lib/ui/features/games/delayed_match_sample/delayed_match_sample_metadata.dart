import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'delayed_match_sample_screen.dart';

final delayedMatchSampleMetadata = GameMetadata(
  id: 'delayed_match_sample',
  category: 'MEMORY',
  icon: Icons.hourglass_full_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const DelayedMatchSampleScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.delayedMatchSampleTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.delayedMatchSampleSubtitle;
