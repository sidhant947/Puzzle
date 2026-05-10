import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../data/models/game_streak.dart';
import '../../../../widgets/super_streak_action.dart';
import '../../../../widgets/tangible.dart';
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
import '../games/word_scramble/word_scramble_screen.dart';
import '../games/missing_vowels/missing_vowels_screen.dart';
import '../games/symbol_logic/symbol_logic_screen.dart';
import '../games/pixel_mimic/pixel_mimic_screen.dart';
import '../games/odd_rotation/odd_rotation_screen.dart';
import '../games/balance_scale/balance_scale_screen.dart';

import '../games/cryptogram/cryptogram_screen.dart';

import '../games/typing_speed/typing_speed_screen.dart';
import '../games/quick_math/quick_math_screen.dart';
import '../games/reflex_tap/reflex_tap_screen.dart';
import '../games/stroop_test/stroop_test_screen.dart';
import '../games/flanker_test/flanker_test_screen.dart';
import '../games/switch_task/switch_task_screen.dart';

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
              opacity:
                  Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
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
      'title': 'Typing Speed',
      'id': 'typing_speed',
      'icon': Icons.keyboard_rounded,
      'color': DesignSystem.gameIndigo,
      'screen': const TypingSpeedScreen(),
    },
    {
      'title': 'Quick Math',
      'id': 'quick_math',
      'icon': Icons.bolt_rounded,
      'color': DesignSystem.gameAmber,
      'screen': const QuickMathScreen(),
    },
    {
      'title': 'Reflex Tap',
      'id': 'reflex_tap',
      'icon': Icons.ads_click_rounded,
      'color': DesignSystem.gameRose,
      'screen': const ReflexTapScreen(),
    },
    {
      'title': 'Stroop Test',
      'id': 'stroop_test',
      'icon': Icons.psychology_rounded,
      'color': DesignSystem.gameGreen,
      'screen': const StroopTestScreen(),
    },
    {
      'title': 'Flanker Test',
      'id': 'flanker_test',
      'icon': Icons.compare_arrows_rounded,
      'color': DesignSystem.gameBlue,
      'screen': const FlankerTestScreen(),
    },
    {
      'title': 'Switch Task',
      'id': 'switch_task',
      'icon': Icons.swap_horiz_rounded,
      'color': DesignSystem.gameAmber,
      'screen': const SwitchTaskScreen(),
    },
    {
      'title': 'Cryptogram',
      'id': 'cryptogram',
      'icon': Icons.password_rounded,
      'color': DesignSystem.gameIndigo,
      'screen': const CryptogramScreen(),
    },
    {
      'title': 'Balance Scale',
      'id': 'balance_scale',
      'icon': Icons.balance_rounded,
      'color': DesignSystem.gameTeal,
      'screen': const BalanceScaleScreen(),
    },
    {
      'title': 'Symbol Logic',
      'id': 'symbol_logic',
      'icon': Icons.calculate_rounded,
      'color': DesignSystem.gameAmber,
      'screen': const SymbolLogicScreen(),
    },
    {
      'title': 'Pixel Mimic',
      'id': 'pixel_mimic',
      'icon': Icons.memory_rounded,
      'color': DesignSystem.gameIndigo,
      'screen': const PixelMimicScreen(),
    },
    {
      'title': 'Odd Rotation',
      'id': 'odd_rotation',
      'icon': Icons.flip_rounded,
      'color': DesignSystem.gameRose,
      'screen': const OddRotationScreen(),
    },
    {
      'title': 'Word Scramble',
      'id': 'word_scramble',
      'icon': Icons.shuffle_rounded,
      'color': DesignSystem.gameAmber,
      'screen': const WordScrambleScreen(),
    },
    {
      'title': 'Missing Vowels',
      'id': 'missing_vowels',
      'icon': Icons.spellcheck_rounded,
      'color': DesignSystem.gameBlue,
      'screen': const MissingVowelsScreen(),
    },
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
    return Scaffold(
      backgroundColor: DesignSystem.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: false,
            snap: false,
            expandedHeight: 80,
            collapsedHeight: 80,
            backgroundColor: DesignSystem.background,
            surfaceTintColor: Colors.transparent,
            actions: const [
              SuperStreakAction(),
              SizedBox(width: 16),
            ],
          ),

          // Full-Width Game Tiles
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              DesignSystem.spaceLG,
              DesignSystem.spaceMD,
              DesignSystem.spaceLG,
              140, // Space for bottom nav
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final game = _games[index];
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: DesignSystem.spaceMD),
                    child: _buildFullWidthTile(
                      context,
                      game['title'],
                      game['id'],
                      game['icon'],
                      game['color'],
                      streaks[game['id']],
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

  Widget _buildFullWidthTile(
    BuildContext context,
    String title,
    String gameId,
    IconData icon,
    Color accentColor,
    GameStreak? streak,
    VoidCallback onTap,
  ) {
    final streakCount = streak?.currentStreak ?? 0;
    final isSolved = streak?.solvedToday ?? false;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        TangibleButton(
          color: isSolved ? DesignSystem.success : DesignSystem.surface,
          shadowColor:
              isSolved ? const Color(0xFF047857) : DesignSystem.outlineVariant,
          onTap: onTap,
          padding: const EdgeInsets.only(
            right: DesignSystem.spaceMD,
            top: 0,
            bottom: 0,
            left: 0,
          ),
          child: Row(
            children: [
              // Icon Zone (Flush to left)
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: isSolved
                      ? Colors.white.withValues(alpha: 0.1)
                      : accentColor.withValues(alpha: 0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(DesignSystem.radiusLG - 2),
                    bottomLeft: Radius.circular(DesignSystem.radiusLG - 2),
                  ),
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: isSolved ? Colors.white : accentColor,
                ),
              ),
              const SizedBox(width: DesignSystem.spaceLG),
              // Title Zone
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title.toUpperCase(),
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.5,
                      color: isSolved ? Colors.white : DesignSystem.ink,
                    ),
                  ),
                ),
              ),
              Icon(
                isSolved
                    ? Icons.check_circle_rounded
                    : Icons.chevron_right_rounded,
                color: isSolved ? Colors.white : DesignSystem.outlineVariant,
                size: 28,
              ),
            ],
          ),
        ),
        if (streakCount > 0)
          Positioned(
            top: -6,
            right: -6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: DesignSystem.accentAmber,
                borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
                border: Border.all(color: Colors.white, width: 2.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.local_fire_department_rounded,
                    size: 14,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '$streakCount',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
