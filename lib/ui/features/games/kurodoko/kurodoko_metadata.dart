import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'kurodoko_screen.dart';

final kurodokoMetadata = GameMetadata(
  id: 'kurodoko',
  category: 'LOGIC',
  icon: Icons.filter_center_focus_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => const KurodokoScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.kurodokoTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.kurodokoSubtitle;
