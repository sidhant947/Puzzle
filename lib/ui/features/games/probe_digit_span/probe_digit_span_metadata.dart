import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'probe_digit_span_screen.dart';

final probeDigitSpanMetadata = GameMetadata(
  id: 'probe_digit_span',
  category: 'MEMORY',
  icon: Icons.dialpad_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => const ProbeDigitSpanScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.probeDigitSpanTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.probeDigitSpanSubtitle;
