import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'stop_signal_screen.dart';

final stopSignalMetadata = GameMetadata(
  id: 'stop_signal',
  category: 'ATTENTION',
  icon: Icons.block_flipped,
  color: DesignSystem.gameRose,
  builder: (context) => StopSignalScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.stopSignalTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.stopSignalSubtitle;
