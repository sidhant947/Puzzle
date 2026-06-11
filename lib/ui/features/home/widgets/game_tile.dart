import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/providers/game_session_provider.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/utils/navigation_utils.dart';
import 'package:puzzle/data/models/game_streak.dart';
import 'package:puzzle/widgets/tangible.dart';

class GameTile extends ConsumerWidget {
  final GameMetadata game;
  final GameStreak? streak;
  final bool isFavorite;
  final String selectedCategory;
  final String searchQuery;

  const GameTile({
    super.key,
    required this.game,
    this.streak,
    required this.isFavorite,
    required this.selectedCategory,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final gameId = game.id;
    final isSolvedToday = streak?.solvedToday ?? false;
    final streakCount = streak?.currentStreak ?? 0;
    final isNew = streak == null;
    final description = L10nGameHelpers.getGameSubtitle(context, gameId);
    final l10n = AppLocalizations.of(context)!;

    return TangibleContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      onTap: () {
        ref.read(gameSessionNotifierProvider.notifier).setSession(
          gameId: gameId,
          category: selectedCategory,
          query: searchQuery,
        );
        Navigator.push(
          context,
          CustomPageRoute(page: game.builder(context)),
        );
      },
      onLongPress: () {
        HapticFeedbackUtil.mediumImpact();
        ref.read(userDataNotifierProvider.notifier).toggleFavorite(gameId);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(theme, l10n, isSolvedToday, streakCount, isNew),
          const SizedBox(height: 12.0),
          _buildBody(context, theme, description, isSolvedToday),
        ],
      ),
    );
  }

  Widget _buildHeader(
    ThemeData theme,
    AppLocalizations l10n,
    bool isSolvedToday,
    int streakCount,
    bool isNew,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: game.color.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(
              color: game.color.withValues(alpha: 0.3),
              width: 1.0,
            ),
          ),
          child: Text(
            game.category.toUpperCase(),
            style: theme.textTheme.labelSmall?.copyWith(
              fontSize: 10.0,
              fontWeight: FontWeight.w900,
              color: game.color,
              letterSpacing: 0.8,
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isNew)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: DesignSystem.gameBlue,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Text(
                  l10n.newGameLabel.toUpperCase(),
                  style: const TextStyle(
                    fontFamily: 'Geist',
                    fontSize: 9.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            if (streakCount > 0) ...[
              if (isNew) const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: DesignSystem.accentAmber.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.local_fire_department_rounded,
                        size: 12, color: DesignSystem.accentAmber),
                    const SizedBox(width: 2),
                    Text(
                      '$streakCount',
                      style: const TextStyle(
                        fontFamily: 'Geist',
                        fontSize: 10.0,
                        fontWeight: FontWeight.w900,
                        color: DesignSystem.accentAmber,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            if (isFavorite) ...[
              const SizedBox(width: 8),
              const Icon(Icons.favorite_rounded,
                  color: DesignSystem.gameRose, size: 18),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, ThemeData theme, String description, bool isSolvedToday) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                L10nGameHelpers.getGameTitle(context, game.id).toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontSize: 26.0,
                  letterSpacing: 0.5,
                  height: 1.0,
                ),
              ),
              const SizedBox(height: 6.0),
              Text(
                description.toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 11.0,
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                  letterSpacing: 0.5,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12.0),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSolvedToday
                ? game.color
                : game.color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            isSolvedToday ? Icons.check_rounded : Icons.play_arrow_rounded,
            color: isSolvedToday ? Colors.white : game.color,
            size: 20,
          ),
        ),
      ],
    );
  }
}

Widget buildGameTile(
  BuildContext context,
  WidgetRef ref,
  GameMetadata game,
  String selectedCategory,
  String searchQuery,
) {
  final streak = ref.watch(
      gameStreakNotifierProvider.select((s) => s[game.id]));
  final isFavorite = ref.watch(
      userDataNotifierProvider.select(
          (d) => (d.favoriteGameIds ?? []).contains(game.id)));

  return GameTile(
    game: game,
    streak: streak,
    isFavorite: isFavorite,
    selectedCategory: selectedCategory,
    searchQuery: searchQuery,
  );
}
