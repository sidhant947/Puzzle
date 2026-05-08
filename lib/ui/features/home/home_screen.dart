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
import '../games/block_escape/block_escape_screen.dart';
import '../games/tents_and_trees/tents_and_trees_screen.dart';
import '../games/slide_puzzle/slide_puzzle_screen.dart';
import '../games/word_mastermind/word_mastermind_screen.dart';
import '../games/word_ladder/word_ladder_screen.dart';
import '../games/color_match/color_match_screen.dart';
import '../games/path_finder/path_finder_screen.dart';
import '../games/simon_sequence/simon_sequence_screen.dart';
import '../games/symmetry/symmetry_screen.dart';
import '../games/binary_puzzle/binary_puzzle_screen.dart';
import '../games/bridges/bridges_screen.dart';
import '../games/odd_one_out/odd_one_out_screen.dart';
import '../games/spelling_sprint/spelling_sprint_screen.dart';
import '../games/math_path/math_path_screen.dart';
import '../games/hue_sort/hue_sort_screen.dart';
import '../games/water_sort/water_sort_screen.dart';
import '../games/lights_out/lights_out_screen.dart';

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
      'title': 'Water Sort',
      'id': 'water_sort',
      'icon': Icons.opacity_rounded,
      'color': DesignSystem.gameBlue,
      'screen': const WaterSortScreen(),
    },
    {
      'title': 'Lights Out',
      'id': 'lights_out',
      'icon': Icons.lightbulb_rounded,
      'color': DesignSystem.gameAmber,
      'screen': const LightsOutScreen(),
    },
    {
      'title': 'Hue Sort',
      'id': 'hue_sort',
      'icon': Icons.gradient_rounded,
      'color': DesignSystem.gamePurple,
      'screen': const HueSortScreen(),
    },
    {
      'title': 'Math Path',
      'id': 'math_path',
      'icon': Icons.route_rounded,
      'color': DesignSystem.gameBlue,
      'screen': const MathPathScreen(),
    },
    {
      'title': 'Spelling Sprint',
      'id': 'spelling_sprint',
      'icon': Icons.speed_rounded,
      'color': DesignSystem.gameAmber,
      'screen': const SpellingSprintScreen(),
    },
    {
      'title': 'Odd One Out',
      'id': 'odd_one_out',
      'icon': Icons.visibility_rounded,
      'color': DesignSystem.gameRose,
      'screen': const OddOneOutScreen(),
    },
    {
      'title': 'Bridges',
      'id': 'bridges',
      'icon': Icons.horizontal_rule_rounded,
      'color': DesignSystem.gameTeal,
      'screen': const BridgesScreen(),
    },
    {
      'title': 'Binary Puzzle',
      'id': 'binary_puzzle',
      'icon': Icons.exposure_zero_rounded,
      'color': DesignSystem.gameBlue,
      'screen': const BinaryPuzzleScreen(),
    },
    {
      'title': 'Color Match',
      'id': 'color_match',
      'icon': Icons.palette_rounded,
      'color': DesignSystem.gameRose,
      'screen': const ColorMatchScreen(),
    },
    {
      'title': 'Path Finder',
      'id': 'path_finder',
      'icon': Icons.route_rounded,
      'color': DesignSystem.gameTeal,
      'screen': const PathFinderScreen(),
    },
    {
      'title': 'Sequence',
      'id': 'simon_sequence',
      'icon': Icons.repeat_rounded,
      'color': DesignSystem.gameCyan,
      'screen': const SimonSequenceScreen(),
    },
    {
      'title': 'Symmetry',
      'id': 'symmetry',
      'icon': Icons.flip_rounded,
      'color': DesignSystem.gameViolet,
      'screen': const SymmetryScreen(),
    },
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
      'title': 'Block Escape',
      'id': 'block_escape',
      'icon': Icons.view_column_rounded,
      'color': DesignSystem.gameOrange,
      'screen': const BlockEscapeScreen(),
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
      body: Stack(
        children: [
          // Background Pattern
          Positioned.fill(
            child: CustomPaint(
              painter: _GridPatternPainter(
                color: theme.colorScheme.primary.withValues(alpha: isDark ? 0.05 : 0.03),
              ),
            ),
          ),
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                floating: false,
                snap: false,
                expandedHeight: 140,
                collapsedHeight: 80,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  expandedTitleScale: 1.4,
                  title: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                    ),
                    child: Text(
                      'PUZZLE HUB',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.primary,
                        letterSpacing: 4.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                actions: const [
                  SuperStreakAction(),
                  SizedBox(width: 16),
                ],
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 140),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final game = _games[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
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
        padding: const EdgeInsets.all(4), // Outer bezel padding
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: isDark ? 0.3 : 0.5),
          borderRadius: BorderRadius.circular(DesignSystem.radius2XL),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: isDark ? 0.1 : 0.4),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black.withValues(alpha: 0.3) : theme.colorScheme.primary.withValues(alpha: 0.04),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(DesignSystem.radius2XL - 4),
            border: Border.all(
              color: isSolved 
                  ? DesignSystem.gameGreen.withValues(alpha: 0.3)
                  : theme.colorScheme.outline.withValues(alpha: isDark ? 0.2 : 0.1),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(DesignSystem.radius2XL - 5),
            child: Stack(
              children: [
                // Very subtle gradient background
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          theme.colorScheme.surface,
                          theme.colorScheme.surfaceContainerHighest.withValues(alpha: isDark ? 0.2 : 0.4),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: accentColor.withValues(alpha: isDark ? 0.15 : 0.08),
                          borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                          border: Border.all(
                            color: accentColor.withValues(alpha: 0.2),
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          icon,
                          size: 28,
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
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w800,
                                color: isSolved ? DesignSystem.gameGreen : theme.colorScheme.onSurface,
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
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                ],
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: isSolved 
                                        ? DesignSystem.gameGreen.withValues(alpha: 0.1)
                                        : theme.colorScheme.onSurface.withValues(alpha: 0.04),
                                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                                    border: Border.all(
                                      color: isSolved 
                                          ? DesignSystem.gameGreen.withValues(alpha: 0.2)
                                          : theme.colorScheme.outline.withValues(alpha: 0.1),
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    isSolved ? 'COMPLETED' : 'DAILY PUZZLE',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: isSolved 
                                        ? DesignSystem.gameGreen 
                                        : theme.colorScheme.onSurface.withValues(alpha: 0.5),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 9,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      _buildActionButton(context, isSolved, accentColor),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, bool isSolved, Color accentColor) {
    final theme = Theme.of(context);
    final color = isSolved ? DesignSystem.gameGreen : theme.colorScheme.primary;

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        border: Border.all(
          color: color.withValues(alpha: 0.15),
          width: 1,
        ),
      ),
      child: Center(
        child: Icon(
          isSolved ? Icons.check_rounded : Icons.arrow_forward_rounded,
          size: 20,
          color: color,
        ),
      ),
    );
  }
}

class _GridPatternPainter extends CustomPainter {
  final Color color;

  _GridPatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0;

    const spacing = 40.0;

    for (double i = 0; i < size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for (double i = 0; i < size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
