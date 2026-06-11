import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'go_no_go_screen.dart';

final goNoGoMetadata = GameMetadata(
  id: 'go_no_go',
  category: 'ATTENTION',
  icon: Icons.pan_tool_alt_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => GoNoGoScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.goNoGoTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.goNoGoSubtitle;
