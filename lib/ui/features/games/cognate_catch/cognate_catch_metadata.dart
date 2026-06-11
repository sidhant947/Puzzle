import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'cognate_catch_screen.dart';

final cognateCatchMetadata = GameMetadata(
  id: 'cognate_catch',
  category: 'WORD',
  icon: Icons.handshake_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => CognateCatchScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.cognateCatchTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.cognateCatchSubtitle;
