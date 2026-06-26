import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'story_builder_screen.dart';

final storyBuilderMetadata = GameMetadata(
  id: 'story_builder',
  category: 'MEMORY',
  icon: Icons.auto_stories_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => const StoryBuilderScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.storyBuilderTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.storyBuilderSubtitle;
