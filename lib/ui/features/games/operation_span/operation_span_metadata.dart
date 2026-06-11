import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'operation_span_screen.dart';

final operationSpanMetadata = GameMetadata(
  id: 'operation_span',
  category: 'MEMORY',
  icon: Icons.calculate_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => OperationSpanScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.operationSpanTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.operationSpanSubtitle;
