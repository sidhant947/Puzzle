import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'negative_space_detection_screen.dart';

final negativeSpaceDetectionMetadata = GameMetadata(
  id: 'negative_space_detection',
  category: 'SPATIAL',
  icon: Icons.filter_center_focus_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => NegativeSpaceDetectionScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.negativeSpaceDetectionTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.negativeSpaceDetectionSubtitle;
