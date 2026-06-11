import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'typing_speed_screen.dart';

final typingSpeedMetadata = GameMetadata(
  id: 'typing_speed',
  category: 'WORD',
  icon: Icons.keyboard_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => TypingSpeedScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.typingSpeedTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.typingSpeedSubtitle;
