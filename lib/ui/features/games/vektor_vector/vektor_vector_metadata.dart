import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'vektor_vector_screen.dart';

final vektorVectorMetadata = GameMetadata(
  id: 'vektor_vector',
  category: 'MATH',
  icon: Icons.trending_up_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const VektorVectorScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.vektorVectorTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.vektorVectorSubtitle;
