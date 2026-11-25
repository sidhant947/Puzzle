import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/data/game_registry.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/providers/game_session_provider.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/utils/navigation_utils.dart';
import 'package:puzzle/widgets/tangible.dart';

class FavoritesSection extends ConsumerWidget {
  final String selectedCategory;
  final String searchQuery;

  const FavoritesSection({
    super.key,
    required this.selectedCategory,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteIds = ref.watch(userDataNotifierProvider.select((d) => d.favoriteGameIds ?? []));
    if (favoriteIds.isEmpty) return const SizedBox.shrink();

    final favoriteGames = allGamesMetadata
        .where((game) => favoriteIds.contains(game.id))
        .toList();

    final streaks = ref.watch(gameStreakNotifierProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: DesignSystem.spaceLG),
        Row(
          children: [
            const Icon(
              Icons.star_rounded,
              color: DesignSystem.accentAmber,
              size: 18,
            ),
            const SizedBox(width: DesignSystem.spaceXS),
            Text(
              l10n.yourFavorites.toUpperCase(),
              style: TextStyle(
                fontFamily: DesignSystem.fontDisplay,
                fontSize: DesignSystem.fontSizeSM,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
                color: colorScheme.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: DesignSystem.spaceXS + 2),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: favoriteGames.length,
            itemBuilder: (context, index) {
              final game = favoriteGames[index];
              final streakCount = streaks[game.id]?.currentStreak ?? 0;
              return _FavoriteTile(
                game: game,
                streakCount: streakCount,
                selectedCategory: selectedCategory,
                searchQuery: searchQuery,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _FavoriteTile extends ConsumerWidget {
  final GameMetadata game;
  final int streakCount;
  final String selectedCategory;
  final String searchQuery;

  const _FavoriteTile({
    required this.game,
    required this.streakCount,
    required this.selectedCategory,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final gameTitle = L10nGameHelpers.getGameTitle(context, game.id);

    return Padding(
      padding: const EdgeInsets.only(right: DesignSystem.spaceSM),
      child: TangibleContainer(
        color: colorScheme.surface,
        width: 130,
        padding: const EdgeInsets.all(DesignSystem.spaceSM),
        onTap: () {
          HapticFeedbackUtil.lightImpact();
          ScaffoldMessenger.of(context).clearSnackBars();
          ref.read(gameSessionNotifierProvider.notifier).setSession(
            gameId: game.id,
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
          ref.read(userDataNotifierProvider.notifier).toggleFavorite(game.id);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  game.icon,
                  color: game.color,
                  size: 18,
                ),
                GestureDetector(
                  onTap: () {
                    HapticFeedbackUtil.lightImpact();
                    ref.read(userDataNotifierProvider.notifier).toggleFavorite(game.id);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.5),
                    decoration: BoxDecoration(
                      color: DesignSystem.accentAmber.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 11,
                          color: DesignSystem.accentAmber,
                        ),
                        if (streakCount > 0) ...[
                          const SizedBox(width: 2),
                          Text(
                            '$streakCount',
                            style: const TextStyle(
                              fontSize: 9.5,
                              fontWeight: FontWeight.w900,
                              color: DesignSystem.accentAmber,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Text(
              gameTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 11.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
