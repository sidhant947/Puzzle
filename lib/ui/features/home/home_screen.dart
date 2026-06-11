import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../../providers/game_providers.dart';
import '../../../../providers/user_providers.dart';
import '../../../../data/game_registry.dart';
import '../../../../widgets/super_streak_action.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'widgets/daily_progress_banner.dart';
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
        scrollCacheExtent: ScrollCacheExtent.pixels(1000),
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildAppBar(theme, colorScheme, l10n),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                DesignSystem.spaceLG,
                DesignSystem.spaceSM,
                DesignSystem.spaceLG,
                DesignSystem.spaceLG,
              ),
              child: const DailyProgressBanner(),
            ),
          ),
          SliverToBoxAdapter(
            child: FavoritesSection(
              selectedCategory: _selectedCategory,
              searchQuery: _searchQuery,
            ),
          ),
          _buildFilterSection(l10n, colorScheme),
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

  Widget _buildFilterSection(AppLocalizations l10n, ColorScheme colorScheme) {
    final streaks = ref.watch(gameStreakNotifierProvider);
    final Map<String, int> totalPerCategory = {};
    final Map<String, int> solvedPerCategory = {};

    for (final game in allGamesMetadata) {
      totalPerCategory[game.category] = (totalPerCategory[game.category] ?? 0) + 1;
      if (streaks.containsKey(game.id)) {
        solvedPerCategory[game.category] = (solvedPerCategory[game.category] ?? 0) + 1;
      }
    }

    final totalGames = allGamesMetadata.length;
    final solvedGames = streaks.length;
    totalPerCategory['ALL'] = totalGames;
    solvedPerCategory['ALL'] = solvedGames;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          DesignSystem.spaceLG,
          0,
          DesignSystem.spaceLG,
          DesignSystem.spaceMD,
        ),
        child: Column(
          children: [
            if (_isSearchVisible) ...[
              custom.GameSearchBar(
                controller: _searchController,
                searchQuery: _searchQuery,
                onChanged: (value) {
                  if (_debounce?.isActive ?? false) _debounce!.cancel();
                  _debounce = Timer(const Duration(milliseconds: 300), () {
                    setState(() => _searchQuery = value);
                  });
                },
                onClear: () {
                  _searchController.clear();
                  setState(() => _searchQuery = "");
                },
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
                    _buildCategoryButton(l10n.categoryAll, 'ALL',
                        solvedPerCategory['ALL'] ?? 0, totalPerCategory['ALL'] ?? 1),
                    _buildCategoryButton(l10n.categoryAttention, 'ATTENTION',
                        solvedPerCategory['ATTENTION'] ?? 0, totalPerCategory['ATTENTION'] ?? 1),
                    _buildCategoryButton(l10n.categoryLogic, 'LOGIC',
                        solvedPerCategory['LOGIC'] ?? 0, totalPerCategory['LOGIC'] ?? 1),
                    _buildCategoryButton(l10n.categoryMath, 'MATH',
                        solvedPerCategory['MATH'] ?? 0, totalPerCategory['MATH'] ?? 1),
                    _buildCategoryButton(l10n.categoryWord, 'WORD',
                        solvedPerCategory['WORD'] ?? 0, totalPerCategory['WORD'] ?? 1),
                    _buildCategoryButton(l10n.categoryMemory, 'MEMORY',
                        solvedPerCategory['MEMORY'] ?? 0, totalPerCategory['MEMORY'] ?? 1),
                    _buildCategoryButton(l10n.categorySpatial, 'SPATIAL',
                        solvedPerCategory['SPATIAL'] ?? 0, totalPerCategory['SPATIAL'] ?? 1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String label, String value, int solved, int total) {
    return Padding(
      padding: const EdgeInsets.only(right: DesignSystem.spaceMD),
      child: CategoryButton(
        label: label,
        value: value,
        isSelected: _selectedCategory == value,
        categoryStyle: getCategoryStyle(value),
        solved: solved,
        total: total,
        onTap: () => setState(() => _selectedCategory = value),
      ),
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
                (context, index) => buildGameTile(
                  context,
                  ref,
                  filteredGames[index],
                  _selectedCategory,
                  _searchQuery,
                ),
                childCount: filteredGames.length,
              ),
            );
          } else {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: DesignSystem.spaceMD),
                  child: buildGameTile(
                    context,
                    ref,
                    filteredGames[index],
                    _selectedCategory,
                    _searchQuery,
                  ),
                ),
                childCount: filteredGames.length,
              ),
            );
          }
        },
      ),
    );
  }
}
