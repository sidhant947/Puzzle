import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'kakurasu_sums_screen.dart';

final kakurasuSumsMetadata = GameMetadata(
  id: 'kakurasu_sums',
  category: 'LOGIC',
  icon: Icons.functions_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const KakurasuSumsScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.kakurasuSumsTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.kakurasuSumsSubtitle;
