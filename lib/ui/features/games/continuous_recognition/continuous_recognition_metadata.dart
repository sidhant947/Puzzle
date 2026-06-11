import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'continuous_recognition_screen.dart';

final continuousRecognitionMetadata = GameMetadata(
  id: 'continuous_recognition',
  category: 'MEMORY',
  icon: Icons.flaky_rounded,
  color: DesignSystem.gameEmerald,
  builder: (context) => ContinuousRecognitionScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.continuousRecognitionTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.continuousRecognitionSubtitle;
