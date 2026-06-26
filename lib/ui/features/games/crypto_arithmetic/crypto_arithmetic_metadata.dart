import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'crypto_arithmetic_screen.dart';

final cryptoArithmeticMetadata = GameMetadata(
  id: 'crypto_arithmetic',
  category: 'MATH',
  icon: Icons.vpn_key_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const CryptoArithmeticScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.cryptoArithmeticTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.cryptoArithmeticSubtitle;
