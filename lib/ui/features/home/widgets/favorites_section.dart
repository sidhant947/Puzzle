import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
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

    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
          child: Text(
            l10n.yourFavorites.toUpperCase(),
            style: TextStyle(
              fontFamily: 'Bebas Neue',
              fontSize: DesignSystem.fontSizeMD,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.0,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(height: DesignSystem.spaceSM),
        SizedBox(
          height: 110,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding:
                const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
            itemCount: favoriteGames.length,
            itemBuilder: (context, index) {
              final game = favoriteGames[index];
              return _CompactFavoriteTile(
                title: L10nGameHelpers.getGameTitle(context, game.id),
                gameId: game.id,
                icon: game.icon,
                accentColor: game.color,
                onTap: () {
                  ref
                      .read(gameSessionNotifierProvider.notifier)
                      .setSession(
                        gameId: game.id,
                        category: selectedCategory,
                        query: searchQuery,
                      );
                  Navigator.push(
                    context,
                    CustomPageRoute(page: game.builder(context)),
                  );
                },
                onRemove: () {
                  HapticFeedbackUtil.lightImpact();
                  ref
                      .read(userDataNotifierProvider.notifier)
                      .toggleFavorite(game.id);
                },
              );
            },
          ),
        ),
        const SizedBox(height: DesignSystem.spaceLG),
      ],
    );
  }
}

class _CompactFavoriteTile extends StatelessWidget {
  final String title;
  final String gameId;
  final IconData icon;
  final Color accentColor;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const _CompactFavoriteTile({
    required this.title,
    required this.gameId,
    required this.icon,
    required this.accentColor,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: DesignSystem.spaceMD),
          child: TangibleContainer(
            width: 100,
            padding: const EdgeInsets.all(12.0),
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: accentColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Icon(icon, color: accentColor, size: 22),
                ),
                const SizedBox(height: 8),
                Text(
                  title.toUpperCase(),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    height: 1.0,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 6,
          right: 22,
          child: GestureDetector(
            onTap: onRemove,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.colorScheme.outline.withValues(alpha: 0.3),
                  width: 1.0,
                ),
              ),
              child: Icon(
                Icons.close_rounded,
                size: 10,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
