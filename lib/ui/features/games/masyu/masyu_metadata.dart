import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'masyu_screen.dart';

final masyuMetadata = GameMetadata(
  id: 'masyu',
  category: 'LOGIC',
  icon: Icons.loop_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => const MasyuScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.masyuTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.masyuSubtitle;
