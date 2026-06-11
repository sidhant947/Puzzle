import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'rule_switcher_screen.dart';

final ruleSwitcherMetadata = GameMetadata(
  id: 'rule_switcher',
  category: 'ATTENTION',
  icon: Icons.swap_calls_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => RuleSwitcherScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.ruleSwitcherTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.ruleSwitcherSubtitle;
