import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'divided_attention_screen.dart';

final dividedAttentionMetadata = GameMetadata(
  id: 'divided_attention',
  category: 'ATTENTION',
  icon: Icons.vertical_split_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => DividedAttentionScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.dividedAttentionTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.dividedAttentionSubtitle;
