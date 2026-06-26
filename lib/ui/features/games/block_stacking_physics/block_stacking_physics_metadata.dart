import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'block_stacking_physics_screen.dart';

final blockStackingPhysicsMetadata = GameMetadata(
  id: 'block_stacking_physics',
  category: 'SPATIAL',
  icon: Icons.vertical_align_bottom_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const BlockStackingPhysicsScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.blockStackingPhysicsTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.blockStackingPhysicsSubtitle;
