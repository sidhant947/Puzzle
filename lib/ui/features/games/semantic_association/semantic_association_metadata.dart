import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'semantic_association_screen.dart';

final semanticAssociationMetadata = GameMetadata(
  id: 'semantic_association',
  category: 'WORD',
  icon: Icons.link_rounded,
  color: DesignSystem.gamePink,
  builder: (context) => const SemanticAssociationScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.semanticAssociationTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.semanticAssociationSubtitle;
