import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'vector_dot_product_screen.dart';

final vectorDotProductMetadata = GameMetadata(
  id: 'vector_dot_product',
  category: 'MATH',
  icon: Icons.linear_scale_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => const VectorDotProductScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.vectorDotProductTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.vectorDotProductSubtitle;
