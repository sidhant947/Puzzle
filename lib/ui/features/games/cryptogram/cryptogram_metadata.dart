import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'cryptogram_screen.dart';

final cryptogramMetadata = GameMetadata(
  id: 'cryptogram',
  category: 'WORD',
  icon: Icons.password_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => CryptogramScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.cryptogramTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.cryptogramSubtitle;
