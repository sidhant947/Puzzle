import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'multiple_object_tracking_screen.dart';

final multipleObjectTrackingMetadata = GameMetadata(
  id: 'multiple_object_tracking',
  category: 'ATTENTION',
  icon: Icons.track_changes_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => MultipleObjectTrackingScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.multipleObjectTrackingTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.multipleObjectTrackingSubtitle;
