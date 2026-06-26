import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'binary_scale_balance_screen.dart';

final binaryScaleBalanceMetadata = GameMetadata(
  id: 'binary_scale_balance',
  category: 'MATH',
  icon: Icons.scale_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const BinaryScaleBalanceScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.binaryScaleBalanceTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.binaryScaleBalanceSubtitle;
