import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'shell_game_screen.dart';

final shellGameMetadata = GameMetadata(
  id: 'shell_game',
  category: 'ATTENTION',
  icon: Icons.hourglass_empty_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => const ShellGameScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.shellGameTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.shellGameSubtitle;
