import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_registry.dart';
import 'package:puzzle/providers/game_providers.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/widgets/super_streak_action.dart';
import 'package:puzzle/widgets/tangible.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';

import 'widgets/favorites_section.dart';
import 'widgets/category_button.dart';
import 'widgets/search_bar.dart' as custom;
import 'widgets/game_tile.dart';
import 'widgets/empty_games_state.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String _searchQuery = "";
  String _selectedCategory = "ALL";
  bool _isSearchVisible = false;
  late final TextEditingController _searchController;
  Timer? _debounce;
  Map<String, String>? _localizedTitlesCache;
  Locale? _lastLocale;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    final currentLocale = Localizations.localeOf(context);
    if (_localizedTitlesCache == null || _lastLocale != currentLocale) {
      _localizedTitlesCache = {
        for (final game in allGamesMetadata)
          game.id: L10nGameHelpers.getGameTitle(context, game.id),
      };
      _lastLocale = currentLocale;
    }
    final localizedTitles = _localizedTitlesCache!;

    final filteredGames = ref.watch(filteredGamesProvider(
        searchQuery: _searchQuery,
        selectedCategory: _selectedCategory,
        localizedTitles: localizedTitles));

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        scrollCacheExtent: ScrollCacheExtent.pixels(300),
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildAppBar(theme, colorScheme, l10n),
          SliverToBoxAdapter(
            child: FavoritesSection(
              selectedCategory: _selectedCategory,
              searchQuery: _searchQuery,
            ),
          ),
          SliverToBoxAdapter(
            child: _HomeFilterSection(
              isSearchVisible: _isSearchVisible,
              searchController: _searchController,
              searchQuery: _searchQuery,
              selectedCategory: _selectedCategory,
              onSearchChanged: (value) {
                if (_debounce?.isActive ?? false) _debounce!.cancel();
                _debounce = Timer(const Duration(milliseconds: 300), () {
                  setState(() => _searchQuery = value);
                });
              },
              onSearchClear: () {
                _searchController.clear();
                setState(() => _searchQuery = "");
              },
              onCategorySelected: (value) =>
                  setState(() => _selectedCategory = value),
            ),
          ),
          filteredGames.isEmpty
              ? const SliverFillRemaining(
                  hasScrollBody: false,
                  child: EmptyGamesState(),
                )
              : _buildGameGrid(filteredGames),
        ],
      ),
    );
  }

  Widget _buildAppBar(
      ThemeData theme, ColorScheme colorScheme, AppLocalizations l10n) {
    return SliverAppBar(
      floating: true,
      pinned: false,
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
              setState(() {
                _isSearchVisible = !_isSearchVisible;
                if (!_isSearchVisible) {
                  _searchQuery = "";
                  _searchController.clear();
                }
              });
            },
            child: Icon(
              _isSearchVisible ? Icons.close_rounded : Icons.search_rounded,
              color: colorScheme.onSurface,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGameGrid(List<dynamic> filteredGames) {
    final hiddenGameIds = ref.watch(
        userDataNotifierProvider.select((d) => d.hiddenGameIds ?? []));

    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(
        DesignSystem.spaceLG,
        DesignSystem.spaceMD,
        DesignSystem.spaceLG,
        140,
      ),
      sliver: SliverLayoutBuilder(
        builder: (context, constraints) {
          if (constraints.crossAxisExtent > 600) {
            return SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                mainAxisSpacing: DesignSystem.spaceMD,
                crossAxisSpacing: DesignSystem.spaceMD,
                childAspectRatio: 2.2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == filteredGames.length) {
                    return _buildHiddenGamesButton(hiddenGameIds.length);
                  }
                  return GameTileWrapper(
                    key: ValueKey(filteredGames[index].id),
                    game: filteredGames[index],
                    selectedCategory: _selectedCategory,
                    searchQuery: _searchQuery,
                  );
                },
                childCount: filteredGames.length + (hiddenGameIds.isNotEmpty ? 1 : 0),
                addAutomaticKeepAlives: false,
                addRepaintBoundaries: true,
              ),
            );
          } else {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == filteredGames.length) {
                    return _buildHiddenGamesButton(hiddenGameIds.length);
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: DesignSystem.spaceMD),
                    child: GameTileWrapper(
                      key: ValueKey(filteredGames[index].id),
                      game: filteredGames[index],
                      selectedCategory: _selectedCategory,
                      searchQuery: _searchQuery,
                    ),
                  );
                },
                childCount: filteredGames.length + (hiddenGameIds.isNotEmpty ? 1 : 0),
                addAutomaticKeepAlives: false,
                addRepaintBoundaries: true,
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildHiddenGamesButton(int count) {
    if (count == 0) return const SizedBox.shrink();
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(top: DesignSystem.spaceMD),
      child: TangibleButton(
        color: theme.colorScheme.surface,
        onTap: () => _showHiddenGamesSheet(),
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
              l10n.showHiddenGames(count),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showHiddenGamesSheet() {
    final l10n = AppLocalizations.of(context)!;
    final hiddenGameIds = ref.read(
        userDataNotifierProvider.select((d) => d.hiddenGameIds ?? []));
    final hiddenGames = allGamesMetadata
        .where((game) => hiddenGameIds.contains(game.id))
        .toList();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _HiddenGamesBottomSheet(
        hiddenGames: hiddenGames,
        l10n: l10n,
        onUnhide: (gameId) {
          HapticFeedbackUtil.mediumImpact();
          ref.read(userDataNotifierProvider.notifier).toggleHideGame(gameId);
        },
      ),
    );
  }
}

class _HomeFilterSection extends ConsumerWidget {
  final bool isSearchVisible;
  final TextEditingController searchController;
  final String searchQuery;
  final String selectedCategory;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onSearchClear;
  final ValueChanged<String> onCategorySelected;

  const _HomeFilterSection({
    required this.isSearchVisible,
    required this.searchController,
    required this.searchQuery,
    required this.selectedCategory,
    required this.onSearchChanged,
    required this.onSearchClear,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final totalStatsMap = ref.watch(categoryStatsProvider);
    final solvedStatsMap = ref.watch(solvedStatsProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        DesignSystem.spaceLG,
        0,
        DesignSystem.spaceLG,
        DesignSystem.spaceMD,
      ),
      child: Column(
        children: [
          if (isSearchVisible) ...[
            custom.GameSearchBar(
              controller: searchController,
              searchQuery: searchQuery,
              onChanged: onSearchChanged,
              onClear: onSearchClear,
            ),
            const SizedBox(height: DesignSystem.spaceMD),
          ],
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  _buildCategoryBtn(l10n.categoryAll, 'ALL',
                      solvedStatsMap['ALL'] ?? 0, totalStatsMap['ALL'] ?? 1),
                  _buildCategoryBtn(
                      l10n.categoryAttention,
                      'ATTENTION',
                      solvedStatsMap['ATTENTION'] ?? 0,
                      totalStatsMap['ATTENTION'] ?? 1),
                  _buildCategoryBtn(
                      l10n.categoryLogic,
                      'LOGIC',
                      solvedStatsMap['LOGIC'] ?? 0,
                      totalStatsMap['LOGIC'] ?? 1),
                  _buildCategoryBtn(l10n.categoryMath, 'MATH',
                      solvedStatsMap['MATH'] ?? 0, totalStatsMap['MATH'] ?? 1),
                  _buildCategoryBtn(l10n.categoryWord, 'WORD',
                      solvedStatsMap['WORD'] ?? 0, totalStatsMap['WORD'] ?? 1),
                  _buildCategoryBtn(
                      l10n.categoryMemory,
                      'MEMORY',
                      solvedStatsMap['MEMORY'] ?? 0,
                      totalStatsMap['MEMORY'] ?? 1),
                  _buildCategoryBtn(
                      l10n.categorySpatial,
                      'SPATIAL',
                      solvedStatsMap['SPATIAL'] ?? 0,
                      totalStatsMap['SPATIAL'] ?? 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryBtn(String label, String value, int solved, int total) {
    return Padding(
      padding: const EdgeInsets.only(right: DesignSystem.spaceMD),
      child: CategoryButton(
        label: label,
        value: value,
        isSelected: selectedCategory == value,
        categoryStyle: getCategoryStyle(value),
        solved: solved,
        total: total,
        onTap: () => onCategorySelected(value),
      ),
    );
  }
}

class _HiddenGamesBottomSheet extends StatelessWidget {
  final List<dynamic> hiddenGames;
  final AppLocalizations l10n;
  final ValueChanged<String> onUnhide;

  const _HiddenGamesBottomSheet({
    required this.hiddenGames,
    required this.l10n,
    required this.onUnhide,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(DesignSystem.radiusLG),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: DesignSystem.spaceSM),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: colorScheme.outline.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: DesignSystem.spaceMD),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
            child: Row(
              children: [
                Icon(
                  Icons.visibility_off_rounded,
                  size: 20,
                  color: colorScheme.onSurface,
                ),
                const SizedBox(width: DesignSystem.spaceSM),
                Text(
                  l10n.hiddenGames.toUpperCase(),
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontSize: 18.0,
                    letterSpacing: 1.5,
                  ),
                ),
                const Spacer(),
                Text(
                  '${hiddenGames.length}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: DesignSystem.spaceMD),
          if (hiddenGames.isEmpty)
            Padding(
              padding: const EdgeInsets.all(DesignSystem.spaceXL),
              child: Column(
                children: [
                  Icon(
                    Icons.visibility_rounded,
                    size: 48,
                    color: colorScheme.onSurface.withValues(alpha: 0.2),
                  ),
                  const SizedBox(height: DesignSystem.spaceMD),
                  Text(
                    l10n.noHiddenGames,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.4),
                    ),
                  ),
                ],
              ),
            )
          else
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignSystem.spaceLG,
                ),
                itemCount: hiddenGames.length,
                itemBuilder: (context, index) {
                  final game = hiddenGames[index];
                  return _HiddenGameTile(
                    game: game,
                    l10n: l10n,
                    onUnhide: () => onUnhide(game.id),
                  );
                },
              ),
            ),
          const SizedBox(height: DesignSystem.spaceLG),
        ],
      ),
    );
  }
}

class _HiddenGameTile extends StatelessWidget {
  final dynamic game;
  final AppLocalizations l10n;
  final VoidCallback onUnhide;

  const _HiddenGameTile({
    required this.game,
    required this.l10n,
    required this.onUnhide,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: DesignSystem.spaceSM),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: DesignSystem.spaceMD,
          vertical: DesignSystem.spaceSM,
        ),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: game.color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
              ),
              child: Icon(game.icon, color: game.color, size: 22),
            ),
            const SizedBox(width: DesignSystem.spaceMD),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    L10nGameHelpers.getGameTitle(context, game.id).toUpperCase(),
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: 14.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    game.category,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.5),
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
            ),
            TangibleButton(
              color: DesignSystem.gameRose.withValues(alpha: 0.1),
              onTap: onUnhide,
              padding: const EdgeInsets.symmetric(
                horizontal: DesignSystem.spaceSM,
                vertical: DesignSystem.spaceXS,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.visibility_rounded,
                    size: 14,
                    color: DesignSystem.gameRose,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    l10n.unhideGame.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'Geist',
                      fontSize: 11.0,
                      fontWeight: FontWeight.w700,
                      color: DesignSystem.gameRose,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
