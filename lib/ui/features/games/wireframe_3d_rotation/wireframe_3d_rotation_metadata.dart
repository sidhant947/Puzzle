import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'wireframe_3d_rotation_screen.dart';

final wireframe3DRotationMetadata = GameMetadata(
  id: 'wireframe_3d_rotation',
  category: 'SPATIAL',
  icon: Icons.architecture_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => const Wireframe3DRotationScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.wireframe3DRotationTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.wireframe3DRotationSubtitle;
