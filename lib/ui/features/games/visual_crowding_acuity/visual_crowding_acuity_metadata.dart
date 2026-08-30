import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'visual_crowding_acuity_screen.dart';

final visualCrowdingAcuityMetadata = GameMetadata(
  id: 'visual_crowding_acuity',
  category: 'ATTENTION',
  icon: Icons.remove_red_eye_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => const VisualCrowdingAcuityScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.visualCrowdingAcuityTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.visualCrowdingAcuitySubtitle;
