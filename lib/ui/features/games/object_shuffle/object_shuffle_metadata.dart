import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'object_shuffle_screen.dart';

final objectShuffleMetadata = GameMetadata(
  id: 'object_shuffle',
  category: 'MEMORY',
  icon: Icons.visibility_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => ObjectShuffleScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.objectShuffleTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.objectShuffleSubtitle;
