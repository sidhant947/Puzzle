import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'sequence_stack_screen.dart';

final sequenceStackMetadata = GameMetadata(
  id: 'sequence_stack',
  category: 'MEMORY',
  icon: Icons.layers_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const SequenceStackScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.sequenceStackTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.sequenceStackSubtitle;
