import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../../utils/l10n_game_helpers.dart';
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

    final filteredGames = List<Map<String, dynamic>>.from(ref.watch(
        filteredGamesProvider(
            searchQuery: _searchQuery, selectedCategory: _selectedCategory)));

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
              style: theme.textTheme.displaySmall?.copyWith(
                letterSpacing: 2.0,
              ),
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
          ),

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
                    encouragement = l10n.readyForWorkout;
                  } else if (solvedToday < 3) {
                    encouragement = l10n.greatStartKeepGoing;
                  } else if (solvedToday < 7) {
                    encouragement = l10n.onFireToday;
                  } else {
                    encouragement = l10n.incredibleSolvingToday;
                  }

                  final displayColor = solvedToday > 0
                      ? DesignSystem.primary
                      : DesignSystem.gameBlue;

                  return TangibleContainer(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: displayColor,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Center(
                            child: Text(
                              '$solvedToday',
                              style: const TextStyle(
                                fontFamily: 'Bebas Neue',
                                fontSize: 24.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                height: 1.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.solvedToday.toUpperCase(),
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: theme.brightness == Brightness.dark
                                      ? const Color(0xFF94A3B8)
                                      : const Color(0xFF475569),
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                encouragement.toUpperCase(),
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  fontSize: 18.0,
                                  letterSpacing: 0.5,
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

          SliverToBoxAdapter(
            child: _buildFavoritesSection(),
          ),

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
                          hintText: l10n.searchGames.toUpperCase(),
                          hintStyle: TextStyle(
                            fontFamily: 'Geist',
                            fontSize: DesignSystem.fontSizeSM,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                            color: colorScheme.onSurface.withValues(alpha: 0.4),
                          ),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: colorScheme.onSurface.withValues(alpha: 0.4),
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
                              horizontal: 16, vertical: 14),
                        ),
                        style: TextStyle(
                          fontFamily: 'Geist',
                          fontSize: DesignSystem.fontSizeMD,
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
                    clipBehavior: Clip.none,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                            fontFamily: 'Bebas Neue',
                            fontSize: DesignSystem.fontSizeLG,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5,
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
                    140,
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
                            childAspectRatio: 2.2,
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

                                  return GameTile(
                                    title: L10nGameHelpers.getGameTitle(context, gameId),
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

                                    return GameTile(
                                      title: L10nGameHelpers.getGameTitle(context, gameId),
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
              return CompactFavoriteTile(
                title: L10nGameHelpers.getGameTitle(context, game['id']),
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
        const SizedBox(height: DesignSystem.spaceLG),
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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = (widget.solved / widget.total).clamp(0.0, 1.0);

    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 68,
                height: 68,
                child: CircularProgressIndicator(
                  value: progress,
                  backgroundColor: widget.categoryStyle.color.withValues(alpha: 0.1),
                  color: widget.categoryStyle.color,
                  strokeWidth: 3,
                  strokeCap: StrokeCap.round,
                ),
              ),
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: widget.isSelected ? widget.categoryStyle.color : theme.colorScheme.surface,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: widget.categoryStyle.color.withValues(alpha: widget.isSelected ? 0.5 : 0.2),
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: Icon(
                    widget.categoryStyle.icon,
                    size: 24,
                    color: widget.isSelected
                        ? Colors.white
                        : widget.categoryStyle.color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            widget.label.toUpperCase(),
            style: theme.textTheme.labelMedium?.copyWith(
              fontSize: 10,
              fontWeight: widget.isSelected ? FontWeight.w900 : FontWeight.w700,
              color: widget.isSelected
                  ? widget.categoryStyle.color
                  : (theme.brightness == Brightness.dark
                      ? const Color(0xFF94A3B8)
                      : const Color(0xFF475569)),
              letterSpacing: 1.2,
            ),
          ),
        ],
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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSolvedToday = widget.streak?.solvedToday ?? false;
    final streakCount = widget.streak?.currentStreak ?? 0;
    final isNew = widget.streak == null;

    final description = L10nGameHelpers.getGameSubtitle(context, widget.gameId);
    final l10n = AppLocalizations.of(context)!;

    return TangibleContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: widget.accentColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(
                    color: widget.accentColor.withValues(alpha: 0.3),
                    width: 1.0,
                  ),
                ),
                child: Text(
                  widget.category.toUpperCase(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w900,
                    color: widget.accentColor,
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
                  if (widget.isFavorite) ...[
                    const SizedBox(width: 8),
                    const Icon(Icons.favorite_rounded,
                        color: DesignSystem.gameRose, size: 18),
                  ],
                ],
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title.toUpperCase(),
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
                      ? widget.accentColor
                      : widget.accentColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isSolvedToday ? Icons.check_rounded : Icons.play_arrow_rounded,
                  color: isSolvedToday ? Colors.white : widget.accentColor,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
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
            onTap: widget.onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: widget.accentColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Icon(
                    widget.icon,
                    color: widget.accentColor,
                    size: 22,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.title.toUpperCase(),
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
            onTap: widget.onRemove,
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
