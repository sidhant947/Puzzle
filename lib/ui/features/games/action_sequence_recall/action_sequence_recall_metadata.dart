import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'action_sequence_recall_screen.dart';

final actionSequenceRecallMetadata = GameMetadata(
  id: 'action_sequence_recall',
  category: 'MEMORY',
  icon: Icons.directions_run_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const ActionSequenceRecallScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.actionSequenceRecallTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.actionSequenceRecallSubtitle;
