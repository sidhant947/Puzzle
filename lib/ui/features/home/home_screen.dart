import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/game_providers.dart';
import 'package:puzzle/widgets/super_streak_action.dart';
import 'package:puzzle/widgets/tangible.dart';
import 'package:puzzle/utils/design_system.dart';

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

    final filteredGames = ref.watch(
        filteredGamesProvider(
            searchQuery: _searchQuery, selectedCategory: _selectedCategory));

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
              onCategorySelected: (value) => setState(() => _selectedCategory = value),
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

  Widget _buildAppBar(ThemeData theme, ColorScheme colorScheme, AppLocalizations l10n) {
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
                (context, index) => GameTileWrapper(
                  key: ValueKey(filteredGames[index].id),
                  game: filteredGames[index],
                  selectedCategory: _selectedCategory,
                  searchQuery: _searchQuery,
                ),
                childCount: filteredGames.length,
                addAutomaticKeepAlives: false,
                addRepaintBoundaries: true,
              ),
            );
          } else {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: DesignSystem.spaceMD),
                  child: GameTileWrapper(
                    key: ValueKey(filteredGames[index].id),
                    game: filteredGames[index],
                    selectedCategory: _selectedCategory,
                    searchQuery: _searchQuery,
                  ),
                ),
                childCount: filteredGames.length,
                addAutomaticKeepAlives: false,
                addRepaintBoundaries: true,
              ),
            );
          }
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
                  _buildCategoryBtn(l10n.categoryAttention, 'ATTENTION',
                      solvedStatsMap['ATTENTION'] ?? 0, totalStatsMap['ATTENTION'] ?? 1),
                  _buildCategoryBtn(l10n.categoryLogic, 'LOGIC',
                      solvedStatsMap['LOGIC'] ?? 0, totalStatsMap['LOGIC'] ?? 1),
                  _buildCategoryBtn(l10n.categoryMath, 'MATH',
                      solvedStatsMap['MATH'] ?? 0, totalStatsMap['MATH'] ?? 1),
                  _buildCategoryBtn(l10n.categoryWord, 'WORD',
                      solvedStatsMap['WORD'] ?? 0, totalStatsMap['WORD'] ?? 1),
                  _buildCategoryBtn(l10n.categoryMemory, 'MEMORY',
                      solvedStatsMap['MEMORY'] ?? 0, totalStatsMap['MEMORY'] ?? 1),
                  _buildCategoryBtn(l10n.categorySpatial, 'SPATIAL',
                      solvedStatsMap['SPATIAL'] ?? 0, totalStatsMap['SPATIAL'] ?? 1),
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
