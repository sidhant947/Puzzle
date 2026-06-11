import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'd2_attention_screen.dart';

final d2AttentionMetadata = GameMetadata(
  id: 'd2_attention',
  category: 'ATTENTION',
  icon: Icons.track_changes_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => D2AttentionScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.d2AttentionTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.d2AttentionSubtitle;
