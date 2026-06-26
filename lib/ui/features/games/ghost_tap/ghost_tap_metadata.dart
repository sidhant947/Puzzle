import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'ghost_tap_screen.dart';

final ghostTapMetadata = GameMetadata(
  id: 'ghost_tap',
  category: 'ATTENTION',
  icon: Icons.visibility_off_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const GhostTapScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.ghostTapTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.ghostTapSubtitle;
