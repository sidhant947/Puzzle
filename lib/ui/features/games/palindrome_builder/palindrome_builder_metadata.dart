import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'palindrome_builder_screen.dart';

final palindromeBuilderMetadata = GameMetadata(
  id: 'palindrome_builder',
  category: 'WORD',
  icon: Icons.repeat_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => PalindromeBuilderScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.palindromeBuilderTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.palindromeBuilderSubtitle;
