import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'reverse_stroop_screen.dart';

final reverseStroopMetadata = GameMetadata(
  id: 'reverse_stroop',
  category: 'ATTENTION',
  icon: Icons.psychology_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => ReverseStroopScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.reverseStroopTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.reverseStroopSubtitle;
