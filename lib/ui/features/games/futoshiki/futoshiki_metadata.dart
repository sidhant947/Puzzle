import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'futoshiki_screen.dart';

final futoshikiMetadata = GameMetadata(
  id: 'futoshiki',
  category: 'LOGIC',
  icon: Icons.unfold_more_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => FutoshikiScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.futoshikiTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.futoshikiSubtitle;
