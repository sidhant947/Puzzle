import 'dart:math' as math;
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/data/game_registry.dart';
import 'package:puzzle/providers/game_providers.dart';
import 'package:puzzle/providers/game_session_provider.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/utils/navigation_utils.dart';
import 'package:puzzle/widgets/super_streak_action.dart';
import 'package:puzzle/widgets/tangible.dart';
import 'category_games_screen.dart';
import 'widgets/category_button.dart';
import 'widgets/daily_workout_section.dart';
import 'widgets/favorites_section.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _playRandomPuzzle(BuildContext context, WidgetRef ref) {
    final hiddenGameIds =
        ref.read(userDataNotifierProvider.select((d) => d.hiddenGameIds ?? []));
    final hiddenSet = hiddenGameIds.toSet();
    final availableGames =
        allGamesMetadata.where((game) => !hiddenSet.contains(game.id)).toList();

    if (availableGames.isEmpty) return;

    HapticFeedbackUtil.lightImpact();
    final randomGame = (availableGames..shuffle(math.Random())).first;

    ScaffoldMessenger.of(context).clearSnackBars();
    ref.read(gameSessionNotifierProvider.notifier).setSession(
          gameId: randomGame.id,
          category: randomGame.category,
          query: '',
        );
    Navigator.push(
      context,
      CustomPageRoute(page: randomGame.builder(context)),
    );
  }

  String _getCategoryDisplayName(AppLocalizations l10n, String category) {
    switch (category) {
      case 'ATTENTION':
        return l10n.categoryAttention;
      case 'LOGIC':
        return l10n.categoryLogic;
      case 'MATH':
        return l10n.categoryMath;
      case 'WORD':
        return l10n.categoryWord;
      case 'MEMORY':
        return l10n.categoryMemory;
      case 'SPATIAL':
        return l10n.categorySpatial;
      default:
        return category;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final activeStreakGames = ref.watch(activeStreakGamesProvider);
    final streaks = ref.watch(gameStreakNotifierProvider);
    final solvedStatsMap = ref.watch(solvedStatsProvider);
    final totalStatsMap = ref.watch(categoryStatsProvider);
    final isMobile = DesignSystem.isMobile(context);

    const categories = ['LOGIC', 'MATH', 'WORD', 'MEMORY', 'SPATIAL', 'ATTENTION'];

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: DesignSystem.primary,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          side: const BorderSide(
            color: DesignSystem.primaryShadow,
            width: 1.5,
          ),
        ),
        onPressed: () => _playRandomPuzzle(context, ref),
        icon: const Icon(
          Icons.shuffle_rounded,
          size: 22,
        ),
        label: Text(
          'RANDOM',
          style: TextStyle(
            fontFamily: DesignSystem.fontDisplay,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.0,
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: Center(child: SuperStreakAction()),
        ),
        leadingWidth: 72,
        title: Text(
          l10n.gamesTitleLabel.toUpperCase(),
          style: theme.textTheme.displaySmall?.copyWith(letterSpacing: 2.0),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TangibleButton(
              color: Colors.transparent,
              drawBorder: false,
              padding: const EdgeInsets.all(12),
              onTap: () {
                Navigator.push(
                  context,
                  CustomPageRoute(
                    page: const CategoryGamesScreen(
                      initialCategory: 'ALL',
                      autoFocusSearch: true,
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.search_rounded,
                color: colorScheme.onSurface,
                size: 22,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(
            DesignSystem.spaceMD,
            DesignSystem.spaceXS,
            DesignSystem.spaceMD,
            120,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DailyWorkoutSection(),
                  if (activeStreakGames.isNotEmpty) ...[
                    const SizedBox(height: DesignSystem.spaceLG),
                    Row(
                      children: [
                        const Icon(
                          Icons.local_fire_department_rounded,
                          color: DesignSystem.accentAmber,
                          size: 18,
                        ),
                        const SizedBox(width: DesignSystem.spaceXS),
                        Text(
                          l10n.statsMaintainStreak.toUpperCase(),
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
                        itemCount: activeStreakGames.length,
                        itemBuilder: (context, index) {
                          final game = activeStreakGames[index];
                          final streakCount = streaks[game.id]?.currentStreak ?? 0;
                          return _ActiveStreakTile(
                            game: game,
                            streakCount: streakCount,
                          );
                        },
                      ),
                    ),
                  ],
                  const FavoritesSection(
                    selectedCategory: 'ALL',
                    searchQuery: '',
                  ),
                  const SizedBox(height: DesignSystem.spaceMD),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.categoryAll.toUpperCase(),
                        style: TextStyle(
                          fontFamily: DesignSystem.fontDisplay,
                          fontSize: DesignSystem.fontSizeMD,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                          color: colorScheme.primary,
                        ),
                      ),
                      TangibleButton(
                        color: Colors.transparent,
                        drawBorder: false,
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        onTap: () {
                          Navigator.push(
                            context,
                            CustomPageRoute(
                              page: const CategoryGamesScreen(initialCategory: 'ALL'),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              l10n.categoryAll.toUpperCase(),
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.8,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 11,
                              color: colorScheme.primary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: DesignSystem.spaceXS + 2),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 2 : 3,
                      mainAxisSpacing: DesignSystem.spaceSM,
                      crossAxisSpacing: DesignSystem.spaceSM,
                      childAspectRatio: isMobile ? 1.45 : 1.75,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      final categoryStyle = getCategoryStyle(category);
                      final solved = solvedStatsMap[category] ?? 0;
                      final total = totalStatsMap[category] ?? 1;
                      final progress = (solved / total).clamp(0.0, 1.0);

                      return TangibleContainer(
                        color: colorScheme.surface,
                        padding: const EdgeInsets.all(DesignSystem.spaceSM + 2),
                        onTap: () {
                          HapticFeedbackUtil.lightImpact();
                          Navigator.push(
                            context,
                            CustomPageRoute(
                              page: CategoryGamesScreen(initialCategory: category),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: categoryStyle.color.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                                  ),
                                  child: Icon(
                                    categoryStyle.icon,
                                    color: categoryStyle.color,
                                    size: 18,
                                  ),
                                ),
                                Text(
                                  '$solved / $total',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    _getCategoryDisplayName(l10n, category).toUpperCase(),
                                    style: TextStyle(
                                      fontFamily: DesignSystem.fontDisplay,
                                      fontSize: DesignSystem.fontSizeMD,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.8,
                                      color: colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(2),
                                  child: LinearProgressIndicator(
                                    value: progress,
                                    minHeight: 3,
                                    backgroundColor: colorScheme.outline.withValues(alpha: 0.12),
                                    valueColor: AlwaysStoppedAnimation<Color>(categoryStyle.color),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ActiveStreakTile extends ConsumerWidget {
  final GameMetadata game;
  final int streakCount;

  const _ActiveStreakTile({
    required this.game,
    required this.streakCount,
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
            category: game.category,
            query: '',
          );
          Navigator.push(
            context,
            CustomPageRoute(page: game.builder(context)),
          );
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.5),
                  decoration: BoxDecoration(
                    color: DesignSystem.accentAmber.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.local_fire_department_rounded,
                        size: 11,
                        color: DesignSystem.accentAmber,
                      ),
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
