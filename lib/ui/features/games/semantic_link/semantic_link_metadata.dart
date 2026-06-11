import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'semantic_link_screen.dart';

final semanticLinkMetadata = GameMetadata(
  id: 'semantic_link',
  category: 'WORD',
  icon: Icons.link_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => SemanticLinkScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.semanticLinkTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.semanticLinkSubtitle;
