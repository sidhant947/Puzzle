import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'digit_span_reverse_screen.dart';

final digitSpanReverseMetadata = GameMetadata(
  id: 'digit_span_reverse',
  category: 'MEMORY',
  icon: Icons.settings_backup_restore_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => DigitSpanReverseScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.digitSpanReverseTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.digitSpanReverseSubtitle;
