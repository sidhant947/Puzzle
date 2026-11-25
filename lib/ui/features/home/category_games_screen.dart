import 'dart:async';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/data/game_registry.dart';
import 'package:puzzle/providers/game_session_provider.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/utils/navigation_utils.dart';
import 'package:puzzle/widgets/tangible.dart';
import 'widgets/category_button.dart';
import 'widgets/empty_games_state.dart';
import 'widgets/game_guide_screen.dart';
import 'widgets/search_bar.dart';

class CategoryGamesScreen extends ConsumerStatefulWidget {
  final String initialCategory;
  final bool autoFocusSearch;

  const CategoryGamesScreen({
    super.key,
    this.initialCategory = 'ALL',
    this.autoFocusSearch = false,
  });

  @override
  ConsumerState<CategoryGamesScreen> createState() => _CategoryGamesScreenState();
}

class _CategoryGamesScreenState extends ConsumerState<CategoryGamesScreen> {
  String _searchQuery = '';
  String _filterMode = 'ALL';
  late final TextEditingController _searchController;
  late final FocusNode _searchFocusNode;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode();
    if (widget.autoFocusSearch) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _searchFocusNode.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  String _getCategoryDisplayName(AppLocalizations l10n, String category) {
    switch (category) {
      case 'ALL':
        return l10n.categoryAll;
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

  String _getCategoryDescription(String category) {
    switch (category) {
      case 'LOGIC':
        return 'Deduction, patterns & strategic problem solving';
      case 'MATH':
        return 'Mental arithmetic, number theory & calculations';
      case 'WORD':
        return 'Vocabulary, linguistics, anagrams & verbal fluency';
      case 'MEMORY':
        return 'Working memory, sequence recall & spatial retention';
      case 'SPATIAL':
        return 'Mental rotation, 3D visualization & geometry';
      case 'ATTENTION':
        return 'Focus, reaction speed & cognitive flexibility';
      default:
        return 'Brain training puzzles and cognitive exercises';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final streaks = ref.watch(gameStreakNotifierProvider);
    final isBigScreen = !DesignSystem.isMobile(context);
    final favoriteIds = ref.watch(userDataNotifierProvider.select((d) => (d.favoriteGameIds ?? []).toSet()));
    final hiddenIds = ref.watch(userDataNotifierProvider.select((d) => (d.hiddenGameIds ?? []).toSet()));
    final categoryStyle = getCategoryStyle(widget.initialCategory);

    final categoryGames = widget.initialCategory == 'ALL'
        ? allGamesMetadata
        : allGamesMetadata.where((g) => g.category == widget.initialCategory).toList();

    final availableGames = categoryGames.where((g) => !hiddenIds.contains(g.id)).toList();
    final hiddenInThisCategory = categoryGames.where((g) => hiddenIds.contains(g.id)).toList();

    final query = _searchQuery.trim().toLowerCase();
    final searchedGames = query.isEmpty
        ? availableGames
        : availableGames.where((g) {
            final title = L10nGameHelpers.getGameTitle(context, g.id).toLowerCase();
            final subtitle = L10nGameHelpers.getGameSubtitle(context, g.id).toLowerCase();
            return g.id.toLowerCase().contains(query) ||
                title.contains(query) ||
                subtitle.contains(query);
          }).toList();

    final filteredGames = searchedGames.where((g) {
      if (_filterMode == 'FAVORITES') return favoriteIds.contains(g.id);
      if (_filterMode == 'SOLVED') return streaks[g.id]?.solvedToday ?? false;
      if (_filterMode == 'UNSOLVED') return !(streaks[g.id]?.solvedToday ?? false);
      return true;
    }).toList();

    final totalInCategory = availableGames.length;
    final solvedInCategory = availableGames.where((g) => streaks[g.id]?.solvedToday ?? false).length;

    final unsolvedCount = searchedGames.where((g) => !(streaks[g.id]?.solvedToday ?? false)).length;
    final solvedCount = searchedGames.where((g) => streaks[g.id]?.solvedToday ?? false).length;
    final favCount = searchedGames.where((g) => favoriteIds.contains(g.id)).length;

    final screenTitle = widget.initialCategory == 'ALL'
        ? l10n.gamesTitleLabel.toUpperCase()
        : _getCategoryDisplayName(l10n, widget.initialCategory).toUpperCase();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: TangibleButton(
          color: Colors.transparent,
          drawBorder: false,
          padding: const EdgeInsets.all(12),
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: colorScheme.onSurface,
            size: 20,
          ),
        ),
        title: Text(
          screenTitle,
          style: theme.textTheme.displaySmall?.copyWith(letterSpacing: 2.0),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(
            DesignSystem.spaceMD,
            DesignSystem.spaceXS,
            DesignSystem.spaceMD,
            DesignSystem.spaceXL,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isBigScreen ? 1100 : 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCategoryHero(
                    context,
                    theme,
                    colorScheme,
                    categoryStyle,
                    solvedInCategory,
                    totalInCategory,
                  ),
                  const SizedBox(height: DesignSystem.spaceMD),
                  GameSearchBar(
                    controller: _searchController,
                    focusNode: _searchFocusNode,
                    searchQuery: _searchQuery,
                    onChanged: (value) {
                      if (_debounce?.isActive ?? false) _debounce!.cancel();
                      _debounce = Timer(const Duration(milliseconds: 200), () {
                        setState(() => _searchQuery = value);
                      });
                    },
                    onClear: () {
                      _searchController.clear();
                      setState(() => _searchQuery = '');
                    },
                  ),
                  const SizedBox(height: DesignSystem.spaceSM),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        _buildFilterPill('ALL', 'ALL (${searchedGames.length})', categoryStyle.color),
                        const SizedBox(width: DesignSystem.spaceXS),
                        _buildFilterPill('UNSOLVED', 'UNSOLVED ($unsolvedCount)', categoryStyle.color),
                        const SizedBox(width: DesignSystem.spaceXS),
                        _buildFilterPill('SOLVED', 'SOLVED ($solvedCount)', categoryStyle.color),
                        const SizedBox(width: DesignSystem.spaceXS),
                        _buildFilterPill('FAVORITES', 'FAVORITES ($favCount)', categoryStyle.color),
                      ],
                    ),
                  ),
                  const SizedBox(height: DesignSystem.spaceMD),
                  if (filteredGames.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: DesignSystem.space2XL),
                      child: EmptyGamesState(),
                    )
                  else
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isBigScreen ? 2 : 1,
                        mainAxisSpacing: DesignSystem.spaceSM + 2,
                        crossAxisSpacing: DesignSystem.spaceSM + 2,
                        mainAxisExtent: 76,
                      ),
                      itemCount: filteredGames.length,
                      itemBuilder: (context, index) {
                        final game = filteredGames[index];
                        final isSolved = streaks[game.id]?.solvedToday ?? false;
                        final streak = streaks[game.id]?.currentStreak ?? 0;
                        final isFav = favoriteIds.contains(game.id);

                        return _CategoryGameCard(
                          game: game,
                          isSolvedToday: isSolved,
                          streakCount: streak,
                          isFavorite: isFav,
                        );
                      },
                    ),
                  if (hiddenInThisCategory.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: DesignSystem.spaceMD),
                      child: TangibleButton(
                        color: theme.colorScheme.surface,
                        onTap: () => _showHiddenGamesSheet(context, l10n, hiddenInThisCategory),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.visibility_off_rounded,
                              size: 18,
                              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                            ),
                            const SizedBox(width: DesignSystem.spaceSM),
                            Text(
                              l10n.showHiddenGames(hiddenInThisCategory.length),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryHero(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
    CategoryStyle style,
    int solved,
    int total,
  ) {
    final progress = total > 0 ? (solved / total).clamp(0.0, 1.0) : 0.0;
    final desc = _getCategoryDescription(widget.initialCategory);
    final l10n = AppLocalizations.of(context)!;
    final title = widget.initialCategory == 'ALL'
        ? l10n.gamesTitleLabel.toUpperCase()
        : _getCategoryDisplayName(l10n, widget.initialCategory).toUpperCase();

    return Container(
      padding: const EdgeInsets.all(DesignSystem.spaceMD),
      decoration: BoxDecoration(
        color: style.color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(
          color: style.color.withValues(alpha: 0.2),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: style.color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                ),
                child: Icon(
                  style.icon,
                  color: style.color,
                  size: 26,
                ),
              ),
              const SizedBox(width: DesignSystem.spaceMD),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: DesignSystem.fontDisplay,
                        fontSize: DesignSystem.fontSize2XL,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      desc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                        fontSize: 11.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: DesignSystem.spaceMD),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.solvedToday.toUpperCase(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.8,
                  color: style.color,
                ),
              ),
              Text(
                '$solved / $total',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 4,
              backgroundColor: style.color.withValues(alpha: 0.15),
              valueColor: AlwaysStoppedAnimation<Color>(style.color),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterPill(String mode, String label, Color accentColor) {
    final isSelected = _filterMode == mode;
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () {
        HapticFeedbackUtil.lightImpact();
        setState(() => _filterMode = mode);
      },
      borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected
              ? accentColor.withValues(alpha: 0.2)
              : colorScheme.surface,
          borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
          border: Border.all(
            color: isSelected
                ? accentColor
                : colorScheme.outline.withValues(alpha: 0.15),
            width: 1.0,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 10.5,
            fontWeight: isSelected ? FontWeight.w900 : FontWeight.w600,
            color: isSelected ? accentColor : colorScheme.onSurface.withValues(alpha: 0.7),
            letterSpacing: 0.4,
          ),
        ),
      ),
    );
  }

  void _showHiddenGamesSheet(BuildContext context, AppLocalizations l10n, List<GameMetadata> hiddenGames) {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      backgroundColor: theme.scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(DesignSystem.radiusLG)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(DesignSystem.spaceLG),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.showHiddenGames(hiddenGames.length),
                      style: theme.textTheme.headlineSmall,
                    ),
                    IconButton(
                      icon: const Icon(Icons.close_rounded),
                      onPressed: () => Navigator.pop(sheetContext),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: hiddenGames.length,
                  itemBuilder: (ctx, idx) {
                    final game = hiddenGames[idx];
                    return ListTile(
                      leading: Icon(game.icon, color: game.color),
                      title: Text(L10nGameHelpers.getGameTitle(ctx, game.id)),
                      trailing: TextButton.icon(
                        icon: const Icon(Icons.visibility_rounded, size: 18),
                        label: Text(l10n.unhideGame),
                        onPressed: () {
                          ref.read(userDataNotifierProvider.notifier).toggleHideGame(game.id);
                          Navigator.pop(sheetContext);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CategoryGameCard extends ConsumerWidget {
  final GameMetadata game;
  final bool isSolvedToday;
  final int streakCount;
  final bool isFavorite;

  const _CategoryGameCard({
    required this.game,
    required this.isSolvedToday,
    required this.streakCount,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final gameTitle = L10nGameHelpers.getGameTitle(context, game.id);
    final gameSubtitle = L10nGameHelpers.getGameSubtitle(context, game.id);

    return Slidable(
      key: ValueKey(game.id),
      startActionPane: ActionPane(
        motion: const BehindMotion(),
        extentRatio: 0.18,
        children: [
          SlidableAction(
            onPressed: (_) {
              HapticFeedbackUtil.mediumImpact();
              ref.read(userDataNotifierProvider.notifier).toggleHideGame(game.id);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text(l10n.gameHidden),
                  action: SnackBarAction(
                    label: l10n.undo,
                    onPressed: () {
                      ref.read(userDataNotifierProvider.notifier).toggleHideGame(game.id);
                    },
                  ),
                  duration: const Duration(seconds: 3),
                ),
              );
            },
            backgroundColor: Colors.transparent,
            foregroundColor: DesignSystem.error,
            icon: Icons.visibility_off_rounded,
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        extentRatio: 0.18,
        children: [
          SlidableAction(
            onPressed: (_) {
              HapticFeedbackUtil.mediumImpact();
              ref.read(userDataNotifierProvider.notifier).toggleFavorite(game.id);
            },
            backgroundColor: Colors.transparent,
            foregroundColor: DesignSystem.accentAmber,
            icon: isFavorite ? Icons.star_border_rounded : Icons.star_rounded,
          ),
        ],
      ),
      child: TangibleContainer(
        color: colorScheme.surface,
        padding: const EdgeInsets.symmetric(
          horizontal: DesignSystem.spaceMD,
          vertical: DesignSystem.spaceSM + 2,
        ),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: game.color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
              ),
              child: Icon(
                game.icon,
                color: game.color,
                size: 22,
              ),
            ),
            const SizedBox(width: DesignSystem.spaceMD),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          gameTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                      if (isFavorite) ...[
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.star_rounded,
                          color: DesignSystem.accentAmber,
                          size: 16,
                        ),
                      ],
                      if (streakCount > 0) ...[
                        const SizedBox(width: 6),
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
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    gameSubtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                      fontSize: 11.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: DesignSystem.spaceXS),
            IconButton(
              icon: Icon(
                Icons.info_outline_rounded,
                color: colorScheme.onSurface.withValues(alpha: 0.5),
                size: 20,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
              onPressed: () {
                HapticFeedbackUtil.lightImpact();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameGuideScreen(
                      gameId: game.id,
                      gameColor: game.color,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(width: 2),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSolvedToday
                    ? DesignSystem.success.withValues(alpha: 0.15)
                    : game.color.withValues(alpha: 0.12),
              ),
              child: Icon(
                isSolvedToday ? Icons.check_rounded : Icons.play_arrow_rounded,
                color: isSolvedToday ? DesignSystem.success : game.color,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
