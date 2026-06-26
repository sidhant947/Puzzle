import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'symbol_digit_assoc_screen.dart';

final symbolDigitAssocMetadata = GameMetadata(
  id: 'symbol_digit_assoc',
  category: 'MEMORY',
  icon: Icons.sync_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const SymbolDigitAssocScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.symbolDigitAssocTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.symbolDigitAssocSubtitle;
