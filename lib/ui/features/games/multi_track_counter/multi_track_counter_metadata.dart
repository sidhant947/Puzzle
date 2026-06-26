import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'multi_track_counter_screen.dart';

final multiTrackCounterMetadata = GameMetadata(
  id: 'multi_track_counter',
  category: 'ATTENTION',
  icon: Icons.hourglass_empty_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const MultiTrackCounterScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.multiTrackCounterTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.multiTrackCounterSubtitle;
