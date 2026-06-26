import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'word_association_recall_screen.dart';

final wordAssociationRecallMetadata = GameMetadata(
  id: 'word_association_recall',
  category: 'MEMORY',
  icon: Icons.psychology_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => const WordAssociationRecallScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.wordAssociationRecallTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.wordAssociationRecallSubtitle;
