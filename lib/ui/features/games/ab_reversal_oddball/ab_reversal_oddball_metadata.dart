import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'ab_reversal_oddball_screen.dart';

final abReversalOddballMetadata = GameMetadata(
  id: 'ab_reversal_oddball',
  category: 'ATTENTION',
  icon: Icons.published_with_changes_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => const ABReversalOddballScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.abReversalOddballTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.abReversalOddballSubtitle;
