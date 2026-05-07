import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../data/models/game_streak.dart';
import '../../../../widgets/super_streak_action.dart';
import '../../../../utils/design_system.dart';
import '../games/sudoku/sudoku_screen.dart';
import '../games/find_word/find_word_screen.dart';
import '../games/crossword/crossword_screen.dart';
import '../games/word_search/word_search_screen.dart';
import '../games/game_2048/game_2048_screen.dart';
import '../games/crown/crown_screen.dart';
import '../games/minesweeper/minesweeper_screen.dart';
import '../games/memory_matrix/memory_matrix_screen.dart';
import '../games/nonogram/nonogram_screen.dart';
import '../games/schulte_table/schulte_table_screen.dart';
import '../games/calculation_sprint/calculation_sprint_screen.dart';
import '../games/pipes/pipes_screen.dart';
import '../games/unblock_me/unblock_me_screen.dart';
import '../games/tents_and_trees/tents_and_trees_screen.dart';
import '../games/slide_puzzle/slide_puzzle_screen.dart';
import '../games/word_mastermind/word_mastermind_screen.dart';
import '../games/word_ladder/word_ladder_screen.dart';
import '../games/spelling_bee/spelling_bee_screen.dart';

class CustomPageRoute<T> extends PageRouteBuilder<T> {
  CustomPageRoute({required Widget page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: const Duration(milliseconds: 350),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutExpo,
              reverseCurve: Curves.easeInExpo,
            );
            return FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
              child: child,
            );
          },
        );
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final List<Map<String, dynamic>> _games = [
    {
      'title': 'Sudoku',
      'id': 'sudoku',
      'icon': Icons.grid_4x4_rounded,
      'color': DesignSystem.gameBlue,
      'screen': const SudokuScreen(),
    },
    {
      'title': 'Word Mastermind',
      'id': 'word_mastermind',
      'icon': Icons.psychology_rounded,
      'color': DesignSystem.gameIndigo,
      'screen': const WordMastermindScreen(),
    },
    {
      'title': 'Word Ladder',
      'id': 'word_ladder',
      'icon': Icons.format_list_numbered_rounded,
      'color': DesignSystem.gameViolet,
      'screen': const WordLadderScreen(),
    },
    {
      'title': 'Spelling Bee',
      'id': 'spelling_bee',
      'icon': Icons.hive_rounded,
      'color': DesignSystem.gameAmber,
      'screen': const SpellingBeeScreen(),
    },
    {
      'title': 'Slide Puzzle',
      'id': 'slide_puzzle',
      'icon': Icons.grid_view_rounded,
      'color': DesignSystem.gameRose,
      'screen': const SlidePuzzleScreen(),
    },
    {
      'title': 'Pipes',
      'id': 'pipes',
      'icon': Icons.hub_rounded,
      'color': DesignSystem.gameTeal,
      'screen': const PipesScreen(),
    },
    {
      'title': 'Unblock Me',
      'id': 'unblock_me',
      'icon': Icons.view_column_rounded,
      'color': DesignSystem.gameOrange,
      'screen': const UnblockMeScreen(),
    },
    {
      'title': 'Tents & Trees',
      'id': 'tents_and_trees',
      'icon': Icons.park_rounded,
      'color': DesignSystem.gameGreen,
      'screen': const TentsAndTreesScreen(),
    },
    {
      'title': 'Find Word',
      'id': 'find_word',
      'icon': Icons.abc_rounded,
      'color': DesignSystem.gameGreen,
      'screen': const FindWordScreen(),
    },
    {
      'title': 'Crossword',
      'id': 'crossword',
      'icon': Icons.grid_on_rounded,
      'color': DesignSystem.gamePurple,
      'screen': const CrosswordScreen(),
    },
    {
      'title': 'Word Search',
      'id': 'word_search',
      'icon': Icons.search_rounded,
      'color': DesignSystem.gameOrange,
      'screen': const WordSearchScreen(),
    },
    {
      'title': '2048',
      'id': 'game_2048',
      'icon': Icons.grid_view_rounded,
      'color': DesignSystem.gamePink,
      'screen': const Game2048Screen(),
    },
    {
      'title': 'Crown',
      'id': 'crown',
      'icon': Icons.workspace_premium_rounded,
      'color': DesignSystem.gameTeal,
      'screen': const CrownScreen(),
    },
    {
      'title': 'Minesweeper',
      'id': 'minesweeper',
      'icon': Icons.brightness_7_rounded,
      'color': DesignSystem.gameIndigo,
      'screen': const MinesweeperScreen(),
    },
    {
      'title': 'Memory Matrix',
      'id': 'memory_matrix',
      'icon': Icons.memory_rounded,
      'color': DesignSystem.gameAmber,
      'screen': const MemoryMatrixScreen(),
    },
    {
      'title': 'Nonogram',
      'id': 'nonogram',
      'icon': Icons.grid_view_rounded,
      'color': DesignSystem.gameRose,
      'screen': const NonogramScreen(),
    },
    {
      'title': 'Schulte Table',
      'id': 'schulte_table',
      'icon': Icons.speed_rounded,
      'color': DesignSystem.gameViolet,
      'screen': const SchulteTableScreen(),
    },
    {
      'title': 'Calc Sprint',
      'id': 'calculation_sprint',
      'icon': Icons.calculate_rounded,
      'color': DesignSystem.gameEmerald,
      'screen': const CalculationSprintScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final streaks = ref.watch(gameStreakNotifierProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            expandedHeight: 120,
            collapsedHeight: 70,
            backgroundColor: theme.scaffoldBackgroundColor,
            surfaceTintColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              expandedTitleScale: 1.2,
              title: Text(
                'PUZZLE HUB',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.primary,
                  letterSpacing: 4.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            actions: const [
              SuperStreakAction(),
              SizedBox(width: 16),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 120),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final game = _games[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _buildGameCard(
                      context,
                      game['title'],
                      game['id'],
                      game['icon'],
                      game['color'],
                      streaks[game['id']],
                      isDark,
                      () => Navigator.push(
                        context,
                        CustomPageRoute(page: game['screen']),
                      ),
                    ),
                  );
                },
                childCount: _games.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGameCard(
    BuildContext context,
    String title,
    String gameId,
    IconData icon,
    Color accentColor,
    GameStreak? streak,
    bool isDark,
    VoidCallback onTap,
  ) {
    final streakCount = streak?.currentStreak ?? 0;
    final isSolved = streak?.solvedToday ?? false;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(DesignSystem.radius2XL),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: isDark ? 0.15 : 0.08),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.02),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: isDark ? 0.12 : 0.06),
                borderRadius: BorderRadius.circular(DesignSystem.radiusXL),
              ),
              child: Icon(
                icon,
                size: 32,
                color: accentColor,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: theme.textTheme.titleMedium?.copyWith(
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      if (streakCount > 0) ...[
                        Icon(
                          Icons.local_fire_department_rounded,
                          size: 16,
                          color: DesignSystem.gameOrange,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$streakCount',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(width: 6),
                      ],
                      Text(
                        isSolved ? 'COMPLETED' : 'DAILY PUZZLE',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: isSolved 
                            ? DesignSystem.gameGreen 
                            : theme.colorScheme.onSurface.withValues(alpha: 0.4),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isSolved
                    ? DesignSystem.gameGreen.withValues(alpha: 0.1)
                    : theme.colorScheme.primary.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                isSolved ? Icons.check_rounded : Icons.play_arrow_rounded,
                size: 20,
                color: isSolved ? DesignSystem.gameGreen : theme.colorScheme.primary,
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
