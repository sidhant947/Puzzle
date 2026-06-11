import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'kakuro_screen.dart';

final kakuroMetadata = GameMetadata(
  id: 'kakuro',
  category: 'LOGIC',
  icon: Icons.tag_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => KakuroScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.kakuroTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.kakuroSubtitle;
