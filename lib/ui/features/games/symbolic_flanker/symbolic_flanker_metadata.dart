import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'symbolic_flanker_screen.dart';

final symbolicFlankerMetadata = GameMetadata(
  id: 'symbolic_flanker',
  category: 'ATTENTION',
  icon: Icons.font_download_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => SymbolicFlankerScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.symbolicFlankerTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.symbolicFlankerSubtitle;
