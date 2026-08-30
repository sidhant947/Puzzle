import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'modular_clock_arithmetic_screen.dart';

final modularClockArithmeticMetadata = GameMetadata(
  id: 'modular_clock_arithmetic',
  category: 'MATH',
  icon: Icons.schedule_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => const ModularClockArithmeticScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.modularClockArithmeticTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.modularClockArithmeticSubtitle;
