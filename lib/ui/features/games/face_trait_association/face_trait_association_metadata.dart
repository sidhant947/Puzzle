import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'face_trait_association_screen.dart';

final faceTraitAssociationMetadata = GameMetadata(
  id: 'face_trait_association',
  category: 'MEMORY',
  icon: Icons.assignment_ind_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => FaceTraitAssociationScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.faceTraitAssociationTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.faceTraitAssociationSubtitle;
