import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'binary_code_screen.dart';

final binaryCodeMetadata = GameMetadata(
  id: 'binary_code',
  category: 'MATH',
  icon: Icons.code_rounded,
  color: DesignSystem.gamePink,
  builder: (context) => BinaryCodeScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.binaryCodeTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.binaryCodeSubtitle;
