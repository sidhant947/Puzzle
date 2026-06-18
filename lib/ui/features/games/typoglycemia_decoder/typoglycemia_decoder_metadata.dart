import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'typoglycemia_decoder_screen.dart';

final typoglycemiaDecoderMetadata = GameMetadata(
  id: 'typoglycemia_decoder',
  category: 'WORD',
  icon: Icons.sort_by_alpha_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => const TypoglycemiaDecoderScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.typoglycemiaDecoderTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.typoglycemiaDecoderSubtitle;
