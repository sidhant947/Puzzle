import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'flanker_test_screen.dart';

final flankerTestMetadata = GameMetadata(
  id: 'flanker_test',
  category: 'ATTENTION',
  icon: Icons.compare_arrows_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => FlankerTestScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.flankerTestTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.flankerTestSubtitle;
