import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../../providers/user_providers.dart';
import '../../../../providers/game_providers.dart';
import '../../../../providers/game_session_provider.dart';
import '../../../../data/models/game_streak.dart';
import '../../../../data/game_data.dart';
import '../../../../widgets/super_streak_action.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';

import '../../../../utils/navigation_utils.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String _searchQuery = "";
  String _selectedCategory = "ALL";
  bool _isSearchVisible = false; // Controls search input box visibility
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

    final filteredGames = List<Map<String, dynamic>>.from(ref.watch(
        filteredGamesProvider(
            searchQuery: _searchQuery, selectedCategory: _selectedCategory)));

    // Calculate category progress
    final streaks = ref.watch(gameStreakNotifierProvider);
    final Map<String, int> totalPerCategory = {};
    final Map<String, int> solvedPerCategory = {};

    for (final game in GameData.allGamesList) {
      final category = game['category'] as String;
      final id = game['id'] as String;
      totalPerCategory[category] = (totalPerCategory[category] ?? 0) + 1;
      if (streaks.containsKey(id)) {
        solvedPerCategory[category] = (solvedPerCategory[category] ?? 0) + 1;
      }
    }

    // "ALL" progress
    final totalGames = GameData.allGamesList.length;
    final solvedGames = streaks.length;
    totalPerCategory['ALL'] = totalGames;
    solvedPerCategory['ALL'] = solvedGames;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        scrollCacheExtent: ScrollCacheExtent.pixels(1000),
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: false,
            snap: false,
            backgroundColor: theme.scaffoldBackgroundColor,
            surfaceTintColor: Colors.transparent,
            centerTitle: true,
            leading: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Center(child: SuperStreakAction()),
            ),
            leadingWidth: 72,
            title: Text(
              'GAMES',
              style: TextStyle(
                fontFamily: 'Bebas Neue',
                fontSize: DesignSystem
                    .fontSize2XL, // Matches STATS and SETTINGS perfectly
                letterSpacing: 1.5,
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.onSurface,
              ),
            ),
            actions: [
              TangibleButton(
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
              const SizedBox(width: 8),
            ],
          ),

          // Daily Stats & Encouragement
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                DesignSystem.spaceLG,
                DesignSystem.spaceSM,
                DesignSystem.spaceLG,
                DesignSystem.spaceLG,
              ),
              child: Consumer(
                builder: (context, ref, child) {
                  final streaks = ref.watch(gameStreakNotifierProvider);
                  final solvedToday =
                      streaks.values.where((s) => s.solvedToday).length;

                  String encouragement;
                  if (solvedToday == 0) {
                    encouragement = 'Ready to start your daily brain workout?';
                  } else if (solvedToday < 3) {
                    encouragement = 'Great start! Keep going.';
                  } else if (solvedToday < 7) {
                    encouragement = "You're on fire today!";
                  } else {
                    encouragement = 'Incredible puzzle solving today!';
                  }

                  final isDark = theme.brightness == Brightness.dark;
                  final displayColor = solvedToday > 0
                      ? DesignSystem.primary
                      : DesignSystem.gameBlue;

                  return Container(
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        color: isDark
                            ? const Color(0xFF2D2D2D)
                            : const Color(0xFFE2E8F0),
                        width: 1.5,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 10.0), // highly compacted vertical space
                    child: Row(
                      children: [
                        // Left Count Box - compacted to 46x46
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(color: displayColor, width: 1.5),
                          ),
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: displayColor,
                              borderRadius: BorderRadius.circular(9.0),
                            ),
                            child: Center(
                              child: Text(
                                '$solvedToday',
                                style: const TextStyle(
                                  fontFamily: 'Bebas Neue',
                                  fontSize: 22.0, // smaller count font size
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF121212),
                                  height: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        // Right Side - Compact Single-Line Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                l10n.solvedToday.toUpperCase(),
                                style: TextStyle(
                                  fontFamily: 'Geist',
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w900,
                                  color: isDark
                                      ? const Color(0xFF94A3B8)
                                      : const Color(0xFF475569),
                                  letterSpacing: 0.5,
                                  height: 1.1,
                                ),
                              ),
                              const SizedBox(height: 3.0),
                              Text(
                                encouragement,
                                style: TextStyle(
                                  fontFamily: 'Geist',
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                  color: isDark
                                      ? Colors.white
                                      : colorScheme.onSurface,
                                  letterSpacing: 0.2,
                                  height: 1.1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          // Favorites Quick Access
          SliverToBoxAdapter(
            child: _buildFavoritesSection(),
          ),

          // Search and Categories
          SliverToBoxAdapter(
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
                    TangibleContainer(
                      color: colorScheme.surface,
                      padding: EdgeInsets.zero,
                      child: TextField(
                        controller: _searchController,
                        onChanged: (value) {
                          if (_debounce?.isActive ?? false) _debounce!.cancel();
                          _debounce =
                              Timer(const Duration(milliseconds: 300), () {
                            setState(() => _searchQuery = value);
                          });
                        },
                        decoration: InputDecoration(
                          hintText: l10n.searchGames,
                          hintStyle: TextStyle(
                            fontSize: DesignSystem.fontSizeMD, // 16.0
                            fontWeight: FontWeight.w500,
                            color: colorScheme.onSurface.withValues(alpha: 0.4),
                          ),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: colorScheme.onSurface.withValues(alpha: 0.5),
                          ),
                          suffixIcon: _searchQuery.isNotEmpty
                              ? IconButton(
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: colorScheme.onSurface
                                        .withValues(alpha: 0.5),
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    _searchController.clear();
                                    setState(() => _searchQuery = "");
                                  },
                                )
                              : null,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                        ),
                        style: TextStyle(
                          fontSize: DesignSystem.fontSizeMD, // 16.0
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ),
                    const SizedBox(height: DesignSystem.spaceMD),
                  ],
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    clipBehavior: Clip.none, // Prevent clipping of larger rings
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0), // Give space for the ring stroke
                      child: Row(
                        children: [
                          _buildCategoryButton(l10n.categoryAll, 'ALL', solvedPerCategory['ALL'] ?? 0, totalPerCategory['ALL'] ?? 1),
                          _buildCategoryButton(
                              l10n.categoryAttention, 'ATTENTION', solvedPerCategory['ATTENTION'] ?? 0, totalPerCategory['ATTENTION'] ?? 1),
                          _buildCategoryButton(l10n.categoryLogic, 'LOGIC', solvedPerCategory['LOGIC'] ?? 0, totalPerCategory['LOGIC'] ?? 1),
                          _buildCategoryButton(l10n.categoryMath, 'MATH', solvedPerCategory['MATH'] ?? 0, totalPerCategory['MATH'] ?? 1),
                          _buildCategoryButton(l10n.categoryWord, 'WORD', solvedPerCategory['WORD'] ?? 0, totalPerCategory['WORD'] ?? 1),
                          _buildCategoryButton(l10n.categoryMemory, 'MEMORY', solvedPerCategory['MEMORY'] ?? 0, totalPerCategory['MEMORY'] ?? 1),
                          _buildCategoryButton(l10n.categorySpatial, 'SPATIAL', solvedPerCategory['SPATIAL'] ?? 0, totalPerCategory['SPATIAL'] ?? 1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Full-Width Game Tiles or Grid
          filteredGames.isEmpty
              ? SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off_rounded,
                          size: 64,
                          color: colorScheme.onSurface.withValues(alpha: 0.1),
                        ),
                        const SizedBox(height: DesignSystem.spaceMD),
                        Text(
                          l10n.noGamesMatch.toUpperCase(),
                          style: TextStyle(
                            fontSize: DesignSystem
                                .fontSizeSM, // Reduced from 12 to 11
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.0,
                            color: colorScheme.onSurface.withValues(alpha: 0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : SliverPadding(
                  padding: const EdgeInsets.fromLTRB(
                    DesignSystem.spaceLG,
                    DesignSystem.spaceMD,
                    DesignSystem.spaceLG,
                    140, // Space for bottom nav
                  ),
                  sliver: SliverLayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.crossAxisExtent > 600) {
                        return SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 400,
                            mainAxisSpacing: DesignSystem.spaceMD,
                            crossAxisSpacing: DesignSystem.spaceMD,
                            childAspectRatio:
                                2.2, // Adjusted ratio for new compact tiles to prevent bottom empty space on large screens
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final game = filteredGames[index];
                              final gameId = game['id'] as String;

                              return Consumer(
                                builder: (context, ref, child) {
                                  final streak = ref.watch(
                                      gameStreakNotifierProvider
                                          .select((s) => s[gameId]));
                                  final isFavorite = ref.watch(
                                      userDataNotifierProvider.select((d) =>
                                          (d.favoriteGameIds ?? [])
                                              .contains(gameId)));

                                  return RepaintBoundary(
                                    child: GameTile(
                                      title: game['title'],
                                      gameId: gameId,
                                      category: game['category'],
                                      icon: game['icon'],
                                      accentColor: game['color'],
                                      streak: streak,
                                      isFavorite: isFavorite,
                                      onTap: () {
                                        ref.read(gameSessionNotifierProvider.notifier).setSession(
                                          gameId: gameId,
                                          category: _selectedCategory,
                                          query: _searchQuery,
                                        );
                                        Navigator.push(
                                          context,
                                          CustomPageRoute(
                                              page: (game['builder']
                                                  as WidgetBuilder)(context)),
                                        );
                                      },
                                      onLongPress: () {
                                        HapticFeedbackUtil.mediumImpact();
                                        ref
                                            .read(userDataNotifierProvider
                                                .notifier)
                                            .toggleFavorite(gameId);
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                            childCount: filteredGames.length,
                          ),
                        );
                      } else {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final game = filteredGames[index];
                              final gameId = game['id'] as String;

                              return Padding(
                                padding: const EdgeInsets.only(
                                    bottom: DesignSystem.spaceMD),
                                child: Consumer(
                                  builder: (context, ref, child) {
                                    final streak = ref.watch(
                                        gameStreakNotifierProvider
                                            .select((s) => s[gameId]));
                                    final isFavorite = ref.watch(
                                        userDataNotifierProvider.select((d) =>
                                            (d.favoriteGameIds ?? [])
                                                .contains(gameId)));

                                    return RepaintBoundary(
                                      child: GameTile(
                                        title: game['title'],
                                        gameId: gameId,
                                        category: game['category'],
                                        icon: game['icon'],
                                        accentColor: game['color'],
                                        streak: streak,
                                        isFavorite: isFavorite,
                                        onTap: () {
                                          ref.read(gameSessionNotifierProvider.notifier).setSession(
                                            gameId: gameId,
                                            category: _selectedCategory,
                                            query: _searchQuery,
                                          );
                                          Navigator.push(
                                            context,
                                            CustomPageRoute(
                                                page: (game['builder']
                                                    as WidgetBuilder)(context)),
                                          );
                                        },
                                        onLongPress: () {
                                          HapticFeedbackUtil.mediumImpact();
                                          ref
                                              .read(userDataNotifierProvider
                                                  .notifier)
                                              .toggleFavorite(gameId);
                                        },
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                            childCount: filteredGames.length,
                          ),
                        );
                      }
                    },
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildFavoritesSection() {
    final userData = ref.watch(userDataNotifierProvider);
    final favoriteIds = userData.favoriteGameIds ?? [];
    if (favoriteIds.isEmpty) return const SizedBox.shrink();

    final favoriteGames = GameData.allGamesList
        .where((game) => favoriteIds.contains(game['id']))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
          child: Text(
            'YOUR FAVORITES',
            style: TextStyle(
              fontFamily: 'Bebas Neue',
              fontSize: DesignSystem.fontSizeMD, // Reduced from LG
              fontWeight: FontWeight.w700,
              letterSpacing: 1.0,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(height: DesignSystem.spaceSM),
        SizedBox(
          height: 102, // Reduced from 124
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding:
                const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
            itemCount: favoriteGames.length,
            itemBuilder: (context, index) {
              final game = favoriteGames[index];
              return CompactFavoriteTile(
                title: game['title'],
                gameId: game['id'],
                icon: game['icon'],
                accentColor: game['color'],
                onTap: () {
                  ref.read(gameSessionNotifierProvider.notifier).setSession(
                    gameId: game['id'],
                    category: _selectedCategory,
                    query: _searchQuery,
                  );
                  Navigator.push(
                    context,
                    CustomPageRoute(
                        page: (game['builder'] as WidgetBuilder)(context)),
                  );
                },
                onRemove: () {
                  HapticFeedbackUtil.lightImpact();
                  ref
                      .read(userDataNotifierProvider.notifier)
                      .toggleFavorite(game['id']);
                },
              );
            },
          ),
        ),
        const SizedBox(height: DesignSystem.spaceLG), // Reduced from XL
      ],
    );
  }

  Widget _buildCategoryButton(String label, String value, int solved, int total) {
    final isSelected = _selectedCategory == value;
    final categoryStyle = _getCategoryStyle(value);
    return Padding(
      padding: const EdgeInsets.only(right: DesignSystem.spaceMD),
      child: CategoryButton(
        label: label,
        value: value,
        isSelected: isSelected,
        categoryStyle: categoryStyle,
        solved: solved,
        total: total,
        onTap: () => setState(() => _selectedCategory = value),
      ),
    );
  }

  CategoryStyle _getCategoryStyle(String category) {
    final styles = {
      'ALL': const CategoryStyle(
        icon: Icons.apps_rounded,
        color: DesignSystem.primary,
      ),
      'ATTENTION': const CategoryStyle(
        icon: Icons.bolt_rounded,
        color: DesignSystem.gameOrange,
      ),
      'LOGIC': const CategoryStyle(
        icon: Icons.bubble_chart_rounded,
        color: DesignSystem.gameRose,
      ),
      'MATH': const CategoryStyle(
        icon: Icons.tune_rounded,
        color: DesignSystem.gameAmber,
      ),
      'WORD': const CategoryStyle(
        icon: Icons.abc_rounded,
        color: DesignSystem.gamePurple,
      ),
      'MEMORY': const CategoryStyle(
        icon: Icons.filter_none_rounded,
        color: DesignSystem.gameBlue,
      ),
      'SPATIAL': const CategoryStyle(
        icon: Icons.widgets_rounded,
        color: DesignSystem.gameGreen,
      ),
    };
    return styles[category.toUpperCase()] ??
        const CategoryStyle(
          icon: Icons.extension_rounded,
          color: DesignSystem.primary,
        );
  }
}

class CategoryStyle {
  final IconData icon;
  final Color color;

  const CategoryStyle({required this.icon, required this.color});
}

class CategoryButton extends StatefulWidget {
  final String label;
  final String value;
  final bool isSelected;
  final CategoryStyle categoryStyle;
  final int solved;
  final int total;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.label,
    required this.value,
    required this.isSelected,
    required this.categoryStyle,
    required this.solved,
    required this.total,
    required this.onTap,
  });

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final progress = (widget.solved / widget.total).clamp(0.0, 1.0);

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 80),
        curve: Curves.easeInOutCubic,
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          _isPressed ? 0.95 : 1.0,
          _isPressed ? 0.95 : 1.0,
          1.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // Progress Ring - Scaled down
                SizedBox(
                  width: 66,
                  height: 66,
                  child: CircularProgressIndicator(
                    value: progress,
                    backgroundColor: widget.categoryStyle.color.withValues(alpha: 0.1),
                    color: widget.isSelected
                        ? widget.categoryStyle.color
                        : widget.categoryStyle.color.withValues(alpha: 0.7),
                    strokeWidth: 3.5,
                    strokeCap: StrokeCap.round,
                  ),
                ),
                Container(
                  width: 54,
                  height: 54,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  padding: widget.isSelected
                      ? const EdgeInsets.all(3.0)
                      : EdgeInsets.zero,
                  child: widget.isSelected
                      ? Container(
                          decoration: BoxDecoration(
                            color: widget.categoryStyle.color,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              widget.categoryStyle.icon,
                              size: 24,
                              color: const Color(0xFF121212),
                            ),
                          ),
                        )
                      : Center(
                          child: Icon(
                            widget.categoryStyle.icon,
                            size: 24,
                            color:
                                widget.categoryStyle.color.withValues(alpha: 0.8),
                          ),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              widget.label.toUpperCase(),
              style: TextStyle(
                fontFamily: 'Geist',
                fontSize: 10,
                fontWeight:
                    widget.isSelected ? FontWeight.w900 : FontWeight.w600,
                color: widget.isSelected
                    ? widget.categoryStyle.color
                    : (isDark
                        ? const Color(0xFF94A3B8)
                        : const Color(0xFF475569)),
                letterSpacing: 0.8,
              ),
            ),
            Text(
              '${widget.solved}/${widget.total}',
              style: TextStyle(
                fontFamily: 'Bebas Neue',
                fontSize: 9,
                fontWeight: FontWeight.w700,
                color: widget.isSelected
                    ? widget.categoryStyle.color.withValues(alpha: 0.7)
                    : (isDark
                        ? const Color(0xFF94A3B8).withValues(alpha: 0.5)
                        : const Color(0xFF475569).withValues(alpha: 0.5)),
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GameTile extends StatefulWidget {
  final String title;
  final String gameId;
  final String category;
  final IconData icon;
  final Color accentColor;
  final GameStreak? streak;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const GameTile({
    super.key,
    required this.title,
    required this.gameId,
    required this.category,
    required this.icon,
    required this.accentColor,
    this.streak,
    required this.isFavorite,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  State<GameTile> createState() => _GameTileState();
}

class _GameTileState extends State<GameTile> {
  bool _isPressed = false;

  String _getGameDescription(String gameId) {
    final descriptions = {
      'slitherlink': 'LOOP THE PIN GRID USING NUMBER CLUES.',
      'futoshiki': 'FILL GRIDS WITH GREATER-THAN CLUES.',
      'kakuro': 'SOLVE CROSSWORDS WITH NUMBERS AND SUMS.',
      'inequality_dash': 'SOLVE INEQUALITIES UNDER TIME PRESSURE.',
      'factor_finder': 'IDENTIFY ALL FACTORS OF TARGET NUMBERS.',
      'sum_pyramid': 'FILL PYRAMID CELLS WITH SUM MATH CLUES.',
      'target_10': 'COMBINE NUMBER TILES TO REAP TEN SUMS.',
      'fraction_matcher': 'MATCH EQUIVALENT FRACTIONS VISUALLY.',
      'dual_coding': 'MATCH LETTERS AND SYMBOLS CONCURRENTLY.',
      'distractor_matrix': 'FIND TARGET SHAPES AMID DISTRACTORS.',
      'temporal_order': 'RECALL THE CHRONOLOGICAL SEQUENCE.',
      'associative_pairs': 'PAIR AND MATCH CORRESPONDING SYMBOLS.',
      'block_count_3d': 'COUNT BLOCKS IN THREE-DIMENSIONAL SPACE.',
      'cube_net_fold': 'VISUALIZE 3D CUBES FROM FLAT NETS.',
      'rotating_maze': 'ROTATE MAZES TO GUIDE BALLS TO THE EXIT.',
      'classic_maze': 'NAVIGATE PATHWAYS TO REVEAL THE OUTLET.',
      'silhouette_match_ortho': 'MATCH 3D OBJECTS WITH ORTHO SHADOWS.',
      'conjunction_search': 'SEARCH AND FOCUS ON MULTI-FEATURE TILES.',
      'spatial_conflict': 'RESOLVE TEXT AND DIRECTION DISCREPANCIES.',
      'spotlight_track': 'TRACK BLINKING ITEMS IN MOVING SHADOWS.',
      'd2_attention': 'TAP TARGET SYMBOLS WITH STRICT CRITERIA.',
      'context_clues': 'INFER HIDDEN WORDS FROM CONTEXT HINTS.',
      'vocabulary_builder': 'EXPAND VOCABULARY BY CORRELATING WORDS.',
      'grammar_police': 'IDENTIFY AND CORRECT GRAMMATICAL ERRORS.',
      'reverse_stroop': 'RESOLVE REVERSED COLOR AND WORD CLUES.',
      'mental_calendar': 'CALCULATE WEEKDAYS FOR ANY RANDOM DATE.',
      'face_trait_association': 'ASSOCIATE FACES WITH THEIR UNIQUE TRAITS.',
      'memory_palace': 'RECALL ITEMS USING SPATIAL ROOM MAPS.',
      'counting_sheep': 'COUNT MOVING SHEEP RAPIDLY AND ACCURATELY.',
      'mental_mapping': 'NAVIGATE SPATIAL COORDINATES IN MIND.',
      'mirror_image': 'IDENTIFY PERFECT MIRROR REFLECTIONS.',
      'einstein_riddle': 'SOLVE COMPLEX LOGIC RIDDLES WITH CLUES.',
      'lock_pattern': 'FIND THE HIDDEN LOCK PATTERN COMBINATION.',
      'multiple_object_tracking': 'TRACK SEVERAL MOVING BALLS DYNAMICLY.',
      'vigilance_task': 'MAINTAIN FOCUS AND TAP RARE TARGETS.',
      'mental_rotation': 'ROTATE 3D SHAPES IN YOUR MIND TO MATCH.',
      'semantic_link': 'LINK RELATED WORDS IN SEMANTIC CHAIN.',
      'logical_syllogisms': 'EVALUATE IF DEDUCTIVE STATEMENTS ARE TRUE.',
      'matrix_reasoning': 'FIND PATTERNS AND COMPLETE MATRIX GRIDS.',
      'numerical_estimation': 'ESTIMATE QUANTITIES OF ITEMS RAPIDLY.',
      'digit_span_reverse': 'RECALL NUMBER DIGITS IN REVERSE ORDER.',
      'face_name_association': 'RECALL NAMES FOR DIVERSE PRESENTED FACES.',
      'staircase_memory': 'MEMORIZE BLOCKS IN STEPWISE SEQUENCE.',
      'akari': 'LIGHT UP THE GRIDS WITH BULB PLACEMENTS.',
      'perspective_taking': 'DETERMINE VIEWS FROM OTHER ANGLES.',
      'paper_folding': 'FOLD AND UNFOLD PAPER SHEETS TO MATCH.',
      'mirror_tracing': 'TRACE COMPLEX PATHS IN REVERSED VIEWS.',
      'silhouette_match': 'MATCH OBJECTS WITH THEIR SHADOW OUTLINES.',
      'verbal_analogies': 'SOLVE ANALOGIES BETWEEN RELATED WORDS.',
      'category_fluency': 'ENTER ITEMS CORRESPONDING TO CATEGORY.',
      'word_surge': 'SEARCH AND DISCOVER MANY HIDDEN WORDS.',
      'mental_abacus': 'DO COMPLICATED MATH ON MENTAL ABACUS.',
      'missing_operator': 'FILL IN MISSING ARITHMETIC OPERATORS.',
      'tower_of_london': 'MOVE PEG DISCS TO MATCH PLAN TARGETS.',
      'symbolic_flanker': 'RESOLVE DIRECTION FLANKERS WITH SYMBOLS.',
      'rule_switcher': 'ADAPT RAPIDLY TO CONSTANTLY CHANGING RULES.',
      'box_completion': 'COMPLETE SQUARES IN CLASSIC DOT GRIDS.',
      'letter_cancellation': 'CROSS OUT TARGET LETTERS UNDER CLOCK.',
      'choice_reaction_time': 'TAP SPECIFIC BUTTONS MATCHING CUES FAST.',
      'wisconsin_card_sorting': 'SORT CARDS ACCORDING TO HIDDEN RULES.',
      'attentional_blink': 'SPARK RAPID TARGETS FLASHING IN STREAMS.',
      'change_blindness': 'SPOT DIFFERENCES BETWEEN ROTATING IMAGES.',
      'visual_statistical_learning': 'LEARN TEMPORAL SHAPE PATTERNS VISUALLY.',
      'sternberg_task': 'RECALL IF SYMBOL WAS IN THE MEMORY SET.',
      'double_n_back': 'TRACK SOUNDS AND SHAPES AT N-STEPS BACK.',
      'operation_span': 'SOLVE MATH AND RECALL ALPHABET STRINGS.',
      'n_back': 'REMEMBER ITEMS PRESENTED N-STEPS AGO.',
      'corsi_blocks': 'TAP BLOCK SEQUENCES IN PERFECT ORDER.',
      'sdmt': 'MATCH NUMBERS WITH SYMBOLS USING KEYS.',
      'trail_making': 'CONNECT NUMBERS AND LETTERS IN SEQUENCE.',
      'stop_signal': 'REACT RAPIDLY BUT HALT ON STOP SOUNDS.',
      'visual_search': 'FIND THE SINGLE TARGET AMONG DISTRACTORS.',
      'go_no_go': 'REACT ON GO CUES BUT RESIST NO-GO CUES.',
      'divided_attention': 'TRACK MULTIPLE SIMULTANEOUS STIMULI FAST.',
      'prime_hunter': 'TAP PRIME NUMBERS IN FALLING BUBBLES.',
      'fraction_match': 'PAIR EQUIVALENT ARITHMETIC FRACTIONS.',
      'path_recall': 'MEMORIZE AND REPEAT PATHWAY SELECTIONS.',
      'object_shuffle': 'TRACK ITEMS SHUFFLED UNDER DEEP CUPS.',
      'grocery_list': 'MEMORIZE AND CHECK OFF ITEMS ON THE LIST.',
      'orbit_tap': 'TAP BUBBLES ROTATING IN DYNAMIC ORBITS.',
      'rhythm_master': 'TAP RHYTHM BEATS TO MATCH MUSIC TIMINGS.',
      'trace_path': 'TRACE CONTINUOUS SEGMENTS ALONG PIN GRIDS.',
      'target_number': 'REACH TARGET VALUES USING BASIC MATH.',
      'arithmetic_chain': 'SOLVE A CHAIN OF SEQUENTIAL OPERATIONS.',
      'magic_squares': 'ARRANGE GRIDS SO SUMS MATCH EVERYWHERE.',
      'kenken': 'SOLVE MATH GRIDS WITH ARITHMETIC CAGES.',
      'typing_speed': 'TYPE SENTENCES ACCURATELY AGAINST CLOCK.',
      'quick_math': 'SOLVE ARITHMETIC QUESTIONS AT TOP SPEED.',
      'math_guess': 'GUESS THE HIDDEN NUMBER WITHIN 15 CHANCES.',
      'reflex_tap': 'TAP STIMULI AS FAST AS HUMANLY POSSIBLE.',
      'stroop_test': 'RESOLVE CONFLICT BETWEEN WORDS AND COLORS.',
      'flanker_test': 'TAP DIRECTIONS MATCHING CENTER ARROWS FAST.',
      'switch_task': 'SWITCH FLUIDLY BETWEEN NUMBER AND LETTER RULES.',
      'cryptogram': 'DECRYPT ENCODED QUOTES USING ALPHABETS.',
      'balance_scale': 'BALANCE SCALES USING NUMBER WEIGHT LOGIC.',
      'symbol_logic': 'EVALUATE SYMBOL VALUE STATEMENTS RAPIDLY.',
      'pixel_mimic': 'MIMIC DESIGN PATTERNS ON PIXEL GRIDS.',
      'odd_rotation': 'FIND THE SINGLE SHAPE ROTATED ODDLY.',
      'word_scramble': 'UNSCRAMBLE LETTERS TO REVEAL KEY WORDS.',
      'missing_vowels': 'FILL IN VOWELS TO REVEAL HIDDEN PHRASES.',
      'water_sort': 'SORT COLOR WATER TILES INTO SINGLE TUBES.',
      'lights_out': 'SWITCH OFF ALL LIGHTS ON CLOCK GRIDS.',
      'hue_sort': 'ARRANGE COLOR HUES IN SEAMLESS GRADIENTS.',
      'math_path': 'NAVIGATE NUMBERS TO CREATE AN EQUATION.',
      'spelling_sprint': 'SPELL COMPLEX PHRASES RAPIDLY ON THE FLY.',
      'odd_one_out': 'IDENTIFY THE SINGLE SHAPE THAT DIFFERS.',
      'bridges': 'CONNECT GRIDS WITH SINGLE OR DOUBLE BRIDGES.',
      'binary_puzzle': 'FILL GRID CELLS WITH ZEROES AND ONES.',
      'color_match': 'IDENTIFY IF COLOR AND WORD MEANINGS MATCH.',
      'path_finder': 'TRACE THE OPTIMAL PATH ACROSS GRIDS.',
      'simon_sequence': 'REPEAT SHAPE SEQUENCES FROM MEMORY.',
      'symmetry': 'REFLECT MIRROR SHAPES ACROSS GRIDS.',
      'sudoku': 'CLASSIC NINE-BY-NINE NUMBER PUZZLES.',
      'alphabet_sudoku': 'FILL SUDOKU GRIDS WITH NOVEL LETTERS.',
      'word_mastermind': 'SOLVE CODED WORD SCRAMBLES WITH CLUES.',
      'word_ladder': 'TRANSFORM WORDS ONE LETTER AT A TIME.',
      'slide_puzzle': 'REARRANGE SQUARE SLIDING GRID TILES.',
      'pipes': 'CONNECT MATCHING DOTS WITH FLUID PIPES.',
      'block_escape': 'SLIDE BLOCKS TO LET THE RED SHAPE OUT.',
      'tents_and_trees': 'PLACE LOGICAL TENTS DIRECTLY BY TREES.',
      'find_word': 'DISCOVER HIDDEN WORDS INSIDE SCRAMBLES.',
      'crossword': 'COMPLETE INTERSECTING WORD PUZZLES.',
      'word_search': 'LOCATE HIDDEN WORD SEQUENCES IN GRIDS.',
      'game_2048': 'MERGE NUMBER TILES TO CREATE THE 2048.',
      'crown': 'PLACE CROWNS WITHOUT ANY SHIELD THREATS.',
      'minesweeper': 'EXPOSE MINES WITHOUT DETONATING THEM.',
      'memory_matrix': 'RECALL HIGHLIGHTED GRID TILES QUICKLY.',
      'nonogram': 'REVEAL HIDDEN PIXEL ART USING LOGIC.',
      'schulte_table': 'TAP NUMBERS FROM ONE TO TWENTY-FIVE.',
      'calculation_sprint': 'SOLVE SPEED MATH EQUATIONS RAPIDLY.',
      'color_flood': 'FILL SCRAMBLED COLOR GRIDS IN FEW TAPS.',
      'tangle_fix': 'UNTANGLE NODES AND LINES WITH SPEED.',
      'simon_command': 'PERFORM VOICE INSTRUCTIONS QUICKLY.',
      'binary_code': 'TRANSLATE BINARY CODES INTO DECIMAL.',
      'modulo_clock': 'CALCULATE MATH EQUATIONS USING CLOCKS.',
      'chimp_test': 'TAP RANDOM NUMBERS IN ASCENDING ORDER.',
      'relational_memory': 'RECALL THE EXACT GRID ITEM POSITIONS.',
      'fact_binder': 'CONNECT SYMBOLS AND RECALL STATEMENTS.',
      'klotski': 'SLIDE BLOCKS TO REACH THE EXITS.',
    };
    return descriptions[gameId] ?? 'CHALLENGE AND TRAIN YOUR COGNITIVE SKILLS.';
  }

  String _getCategoryDisplayLabel(String cat) {
    switch (cat.toUpperCase()) {
      case 'SPATIAL':
        return 'PUZZLE';
      default:
        return cat.toUpperCase();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final colorScheme = theme.colorScheme;
    final isSolvedToday = widget.streak?.solvedToday ?? false;
    final streakCount = widget.streak?.currentStreak ?? 0;
    final isNew = widget.streak == null;

    final displayTitle = widget.title.toUpperCase();

    final description = _getGameDescription(widget.gameId);
    final displayCategory = _getCategoryDisplayLabel(widget.category);

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      onLongPress: widget.onLongPress,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 80),
        curve: Curves.easeInOutCubic,
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          _isPressed ? 0.97 : 1.0,
          _isPressed ? 0.97 : 1.0,
          1.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: isDark ? const Color(0xFF2D2D2D) : const Color(0xFFE2E8F0),
              width: 1.5,
            ),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row 1: Header tags
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: widget.accentColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Text(
                      displayCategory,
                      style: TextStyle(
                        fontFamily: 'Geist',
                        fontSize: 10.0,
                        fontWeight: FontWeight.w900,
                        color: widget.accentColor,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isNew) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: DesignSystem.gameBlue,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: const Text(
                            "NEW",
                            style: TextStyle(
                              fontFamily: 'Geist',
                              fontSize: 9.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ],
                      if (streakCount > 0) ...[
                        if (isNew) const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            color: DesignSystem.accentAmber
                                .withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.local_fire_department_rounded,
                                size: 12,
                                color: DesignSystem.accentAmber,
                              ),
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
                      if (isSolvedToday) ...[
                        if (isNew || streakCount > 0) const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: widget.accentColor,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Text(
                            "JUST PLAYED",
                            style: TextStyle(
                              fontFamily: 'Geist',
                              fontSize: 9.0,
                              fontWeight: FontWeight.w900,
                              color: isDark
                                  ? const Color(0xFF1E1E1E)
                                  : Colors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                      if (widget.isFavorite) ...[
                        if (isSolvedToday || isNew || streakCount > 0) const SizedBox(width: 8),
                        const Icon(
                          Icons.favorite_rounded,
                          color: DesignSystem.gameRose,
                          size: 18,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              // Row 2: Title and play button
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          displayTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Bebas Neue',
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                            height: 1.0,
                            color:
                                isDark ? Colors.white : colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          description.toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Geist',
                            fontSize: 11.0,
                            fontWeight: FontWeight.w500,
                            color: isDark
                                ? const Color(0xFF94A3B8)
                                : const Color(0xFF475569),
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Icon(
                    Icons.play_arrow_rounded,
                    color: widget.accentColor,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CompactFavoriteTile extends StatefulWidget {
  final String title;
  final String gameId;
  final IconData icon;
  final Color accentColor;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const CompactFavoriteTile({
    super.key,
    required this.title,
    required this.gameId,
    required this.icon,
    required this.accentColor,
    required this.onTap,
    required this.onRemove,
  });

  @override
  State<CompactFavoriteTile> createState() => _CompactFavoriteTileState();
}

class _CompactFavoriteTileState extends State<CompactFavoriteTile> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Stack(
      children: [
        GestureDetector(
          onTapDown: (_) => setState(() => _isPressed = true),
          onTapUp: (_) {
            setState(() => _isPressed = false);
            widget.onTap();
          },
          onTapCancel: () => setState(() => _isPressed = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 80),
            curve: Curves.easeInOutCubic,
            transformAlignment: Alignment.center,
            transform: Matrix4.diagonal3Values(
              _isPressed ? 0.95 : 1.0,
              _isPressed ? 0.95 : 1.0,
              1.0,
            ),
            child: Container(
              width: 94, // Reduced from 120
              margin: const EdgeInsets.only(right: DesignSystem.spaceMD),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                borderRadius: BorderRadius.circular(16.0), // Reduced from 20
                border: Border.all(
                  color: isDark ? const Color(0xFF2D2D2D) : const Color(0xFFE2E8F0),
                  width: 1.5,
                ),
              ),
              padding: const EdgeInsets.all(10.0), // Reduced from 12
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 36, // Reduced from 44
                    height: 36, // Reduced from 44
                    decoration: BoxDecoration(
                      color: widget.accentColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(
                      widget.icon,
                      color: widget.accentColor,
                      size: 20, // Reduced from 24
                    ),
                  ),
                  const SizedBox(height: 6), // Reduced from 10
                  Text(
                    widget.title.toUpperCase(),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Bebas Neue',
                      fontSize: 13.0, // Reduced from 16
                      fontWeight: FontWeight.w700,
                      color: isDark ? Colors.white : theme.colorScheme.onSurface,
                      height: 1.0,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 4, // Reduced from 6
          right: 18, // Reduced from 22
          child: GestureDetector(
            onTap: widget.onRemove,
            child: Container(
              padding: const EdgeInsets.all(3), // Reduced from 4
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF2D2D2D) : const Color(0xFFF1F5F9),
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDark ? const Color(0xFF3D3D3D) : const Color(0xFFE2E8F0),
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.close_rounded,
                size: 12, // Reduced from 14
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
