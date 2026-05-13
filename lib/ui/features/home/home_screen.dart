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
import '../games/target_number/target_number_screen.dart';
import '../games/arithmetic_chain/arithmetic_chain_screen.dart';
import '../games/magic_squares/magic_squares_screen.dart';
import '../games/kenken/kenken_screen.dart';
import '../games/orbit_tap/orbit_tap_screen.dart';
import '../games/rhythm_master/rhythm_master_screen.dart';
import '../games/trace_path/trace_path_screen.dart';
import '../games/akari/akari_screen.dart';
import '../games/perspective_taking/perspective_taking_screen.dart';
import '../games/paper_folding/paper_folding_screen.dart';
import '../games/mirror_tracing/mirror_tracing_screen.dart';
import '../games/silhouette_match/silhouette_match_screen.dart';

import '../games/multiple_object_tracking/multiple_object_tracking_screen.dart';
import '../games/vigilance_task/vigilance_task_screen.dart';

import '../games/visual_search/visual_search_screen.dart';
import '../games/go_no_go/go_no_go_screen.dart';
import '../games/divided_attention/divided_attention_screen.dart';
import '../games/prime_hunter/prime_hunter_screen.dart';
import '../games/fraction_match/fraction_match_screen.dart';

import '../games/path_recall/path_recall_screen.dart';
import '../games/object_shuffle/object_shuffle_screen.dart';
import '../games/grocery_list/grocery_list_screen.dart';

import '../games/cryptogram/cryptogram_screen.dart';

import '../games/typing_speed/typing_speed_screen.dart';
import '../games/quick_math/quick_math_screen.dart';
import '../games/reflex_tap/reflex_tap_screen.dart';
import '../games/stroop_test/stroop_test_screen.dart';
import '../games/flanker_test/flanker_test_screen.dart';
import '../games/switch_task/switch_task_screen.dart';
import '../games/n_back/n_back_screen.dart';
import '../games/corsi_blocks/corsi_blocks_screen.dart';
import '../games/sdmt/sdmt_screen.dart';
import '../games/trail_making/trail_making_screen.dart';
import '../games/stop_signal/stop_signal_screen.dart';

import '../games/operation_span/operation_span_screen.dart';
import '../games/double_n_back/double_n_back_screen.dart';
import '../games/sternberg_task/sternberg_task_screen.dart';
import '../games/visual_statistical_learning/visual_statistical_learning_screen.dart';
import '../games/change_blindness/change_blindness_screen.dart';
import '../games/attentional_blink/attentional_blink_screen.dart';
import '../games/wisconsin_card_sorting/wisconsin_card_sorting_screen.dart';

import '../games/tower_of_london/tower_of_london_screen.dart';
import '../games/symbolic_flanker/symbolic_flanker_screen.dart';
import '../games/rule_switcher/rule_switcher_screen.dart';
import '../games/box_completion/box_completion_screen.dart';
import '../games/letter_cancellation/letter_cancellation_screen.dart';
import '../games/choice_reaction_time/choice_reaction_time_screen.dart';

import '../games/mental_rotation/mental_rotation_screen.dart';
import '../games/semantic_link/semantic_link_screen.dart';
import '../games/logical_syllogisms/logical_syllogisms_screen.dart';
import '../games/matrix_reasoning/matrix_reasoning_screen.dart';
import '../games/numerical_estimation/numerical_estimation_screen.dart';

import '../games/digit_span_reverse/digit_span_reverse_screen.dart';
import '../games/face_name_association/face_name_association_screen.dart';
import '../games/staircase_memory/staircase_memory_screen.dart';
import '../games/verbal_analogies/verbal_analogies_screen.dart';
import '../games/category_fluency/category_fluency_screen.dart';
import '../games/word_surge/word_surge_screen.dart';
import '../games/mental_abacus/mental_abacus_screen.dart';
import '../games/missing_operator/missing_operator_screen.dart';

import '../games/color_flood/color_flood_screen.dart';
import '../games/tangle_fix/tangle_fix_screen.dart';

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
      'title': 'Object Tracking',
      'id': 'multiple_object_tracking',
      'icon': Icons.track_changes_rounded,
      'color': DesignSystem.gameIndigo,
      'screen': const MultipleObjectTrackingScreen(),
    },
    {
      'title': 'Vigilance Task',
      'id': 'vigilance_task',
      'icon': Icons.watch_later_rounded,
      'color': DesignSystem.gameRose,
      'screen': const VigilanceTaskScreen(),
    },
    {
      'title': 'Mental Rotation',
      'id': 'mental_rotation',
      'icon': Icons.threed_rotation_rounded,
      'color': DesignSystem.gameIndigo,
      'screen': const MentalRotationScreen(),
    },
    {
      'title': 'Semantic Link',
      'id': 'semantic_link',
      'icon': Icons.link_rounded,
      'color': DesignSystem.gameBlue,
      'screen': const SemanticLinkScreen(),
    },
    {
      'title': 'Logical Syllogisms',
      'id': 'logical_syllogisms',
      'icon': Icons.account_tree_rounded,
      'color': DesignSystem.gameTeal,
      'screen': const LogicalSyllogismsScreen(),
    },
    {
      'title': 'Matrix Reasoning',
      'id': 'matrix_reasoning',
      'icon': Icons.grid_view_rounded,
      'color': DesignSystem.gameAmber,
      'screen': const MatrixReasoningScreen(),
    },
    {
      'title': 'Numerical Estimation',
      'id': 'numerical_estimation',
      'icon': Icons.scatter_plot_rounded,
      'color': DesignSystem.gameRose,
      'screen': const NumericalEstimationScreen(),
    },
    {
      'title': 'Reverse Span',
      'id': 'digit_span_reverse',
      'icon': Icons.settings_backup_restore_rounded,
      'color': DesignSystem.gameIndigo,
      'screen': const DigitSpanReverseScreen(),
    },
    {
      'title': 'Face-Name',
      'id': 'face_name_association',
      'icon': Icons.assignment_ind_rounded,
      'color': DesignSystem.gameTeal,
      'screen': const FaceNameAssociationScreen(),
    },
    {
      'title': 'Staircase Memory',
      'id': 'staircase_memory',
      'icon': Icons.stairs_rounded,
      'color': DesignSystem.gameAmber,
      'screen': const StaircaseMemoryScreen(),
    },
    {
      'title': 'Akari',
      'id': 'akari',
      'icon': Icons.lightbulb_rounded,
      'color': DesignSystem.gameAmber,
      'screen': const AkariScreen(),
    },
    {
      'title': 'Perspective',
      'id': 'perspective_taking',
      'icon': Icons.view_in_ar_rounded,
      'color': DesignSystem.gamePurple,
      'screen': const PerspectiveTakingScreen(),
    },
    {
      'title': 'Paper Folding',
      'id': 'paper_folding',
      'icon': Icons.note_rounded,
      'color': DesignSystem.gameRose,
      'screen': const PaperFoldingScreen(),
    },
    {
      'title': 'Mirror Tracing',
      'id': 'mirror_tracing',
      'icon': Icons.gesture_rounded,
      'color': DesignSystem.gameCyan,
      'screen': const MirrorTracingScreen(),
    },
    {
      'title': 'Silhouette Match',
      'id': 'silhouette_match',
      'icon': Icons.auto_fix_normal_rounded,
      'color': DesignSystem.gameAmber,
      'screen': const SilhouetteMatchScreen(),
    },
    {
      'title': 'Verbal Analogies',
      'id': 'verbal_analogies',
      'icon': Icons.compare_arrows_rounded,
      'color': DesignSystem.gameBlue,
      'screen': const VerbalAnalogiesScreen(),
    },
    {
      'title': 'Category Fluency',
      'id': 'category_fluency',
      'icon': Icons.category_rounded,
      'color': DesignSystem.gameGreen,
      'screen': const CategoryFluencyScreen(),
    },
    {
      'title': 'Word Surge',
      'id': 'word_surge',
      'icon': Icons.bolt_rounded,
      'color': DesignSystem.gameRose,
      'screen': const WordSurgeScreen(),
    },
    {
      'title': 'Mental Abacus',
      'id': 'mental_abacus',
      'icon': Icons.grid_4x4_rounded,
      'color': DesignSystem.gameAmber,
      'screen': const MentalAbacusScreen(),
    },
    {
      'title': 'Operator Mix',
      'id': 'missing_operator',
      'icon': Icons.calculate_rounded,
      'color': DesignSystem.gameBlue,
      'screen': const MissingOperatorScreen(),
    },
    {
      'title': 'Tower of London',
      'id': 'tower_of_london',
      'icon': Icons.account_balance_rounded,
      'color': DesignSystem.gameIndigo,
      'screen': const TowerOfLondonScreen(),
    },
    {
      'title': 'Symbolic Flanker',
      'id': 'symbolic_flanker',
      'icon': Icons.font_download_rounded,
      'color': DesignSystem.gamePurple,
      'screen': const SymbolicFlankerScreen(),
    },
    {
      'title': 'Rule Switcher',
      'id': 'rule_switcher',
      'icon': Icons.swap_calls_rounded,
      'color': DesignSystem.gameTeal,
      'screen': const RuleSwitcherScreen(),
    },
    {
      'title': 'Box Completion',
      'id': 'box_completion',
      'icon': Icons.crop_square_rounded,
      'color': DesignSystem.gameAmber,
      'screen': const BoxCompletionScreen(),
    },
    {
      'title': 'Letter Cancel',
      'id': 'letter_cancellation',
      'icon': Icons.spellcheck_rounded,
      'color': DesignSystem.gameRose,
      'screen': const LetterCancellationScreen(),
    },
    {
      'title': 'Choice Reaction',
      'id': 'choice_reaction_time',
      'icon': Icons.touch_app_rounded,
      'color': DesignSystem.gameBlue,
      'screen': const ChoiceReactionTimeScreen(),
    },
    {
      'title': 'Wisconsin Card Sort',
      'id': 'wisconsin_card_sorting',
      'icon': Icons.style_rounded,
      'color': DesignSystem.gameRose,
      'screen': const WisconsinCardSortingScreen(),
    },
    {
      'title': 'Attentional Blink',
      'id': 'attentional_blink',
      'icon': Icons.visibility_off_rounded,
      'color': DesignSystem.gamePurple,
      'screen': const AttentionalBlinkScreen(),
    },
    {
      'title': 'Change Blindness',
      'id': 'change_blindness',
      'icon': Icons.flip_camera_android_rounded,
      'color': DesignSystem.gameAmber,
      'screen': const ChangeBlindnessScreen(),
    },
    {
      'title': 'Visual Learning',
      'id': 'visual_statistical_learning',
      'icon': Icons.pattern_rounded,
      'color': DesignSystem.gameTeal,
      'screen': const VisualStatisticalLearningScreen(),
    },
    {
      'title': 'Sternberg Task',
      'id': 'sternberg_task',
      'icon': Icons.memory_rounded,
      'color': DesignSystem.gameBlue,
      'screen': const SternbergTaskScreen(),
    },
    {
      'title': 'Double N-Back',
      'id': 'double_n_back',
      'icon': Icons.layers_rounded,
      'color': DesignSystem.gameIndigo,
      'screen': const DoubleNBackScreen(),
    },
    {
      'title': 'Operation Span',
      'id': 'operation_span',
      'icon': Icons.calculate_rounded,
      'color': DesignSystem.gameGreen,
      'screen': const OperationSpanScreen(),
    },
    {
      'title': 'N-Back Test',
      'id': 'n_back',
      'icon': Icons.psychology_rounded,
      'color': DesignSystem.gameBlue,
      'screen': const NBackScreen(),
    },
    {
      'title': 'Corsi Blocks',
      'id': 'corsi_blocks',
      'icon': Icons.grid_view_rounded,
      'color': DesignSystem.gameIndigo,
      'screen': const CorsiBlocksScreen(),
    },
    {
      'title': 'SDMT Test',
      'id': 'sdmt',
      'icon': Icons.fact_check_rounded,
      'color': DesignSystem.gameTeal,
      'screen': const SDMTScreen(),
    },
    {
      'title': 'Trail Making',
      'id': 'trail_making',
      'icon': Icons.timeline_rounded,
      'color': DesignSystem.gameGreen,
      'screen': const TrailMakingScreen(),
    },
    {
      'title': 'Stop Signal',
      'id': 'stop_signal',
      'icon': Icons.block_flipped,
      'color': DesignSystem.gameRose,
      'screen': const StopSignalScreen(),
    },
    {
      'title': 'Visual Search',
      'id': 'visual_search',
      'icon': Icons.center_focus_strong_rounded,
      'color': DesignSystem.gameIndigo,
      'screen': const VisualSearchScreen(),
    },
    {
      'title': 'Go / No-Go',
      'id': 'go_no_go',
      'icon': Icons.pan_tool_alt_rounded,
      'color': DesignSystem.gameRose,
      'screen': const GoNoGoScreen(),
    },
    {
      'title': 'Divided Focus',
      'id': 'divided_attention',
      'icon': Icons.vertical_split_rounded,
      'color': DesignSystem.gameTeal,
      'screen': const DividedAttentionScreen(),
    },
    {
      'title': 'Prime Hunter',
      'id': 'prime_hunter',
      'icon': Icons.gps_fixed_rounded,
      'color': DesignSystem.gameBlue,
      'screen': const PrimeHunterScreen(),
    },
    {
      'title': 'Fraction Match',
      'id': 'fraction_match',
      'icon': Icons.pie_chart_rounded,
      'color': DesignSystem.gamePurple,
      'screen': const FractionMatchScreen(),
    },
    {
      'title': 'Path Recall',
      'id': 'path_recall',
      'icon': Icons.polyline_rounded,
      'color': DesignSystem.gameBlue,
      'screen': const PathRecallScreen(),
    },
    {
      'title': 'Object Shuffle',
      'id': 'object_shuffle',
      'icon': Icons.visibility_rounded,
      'color': DesignSystem.gameAmber,
      'screen': const ObjectShuffleScreen(),
    },
    {
      'title': 'Grocery List',
      'id': 'grocery_list',
      'icon': Icons.shopping_basket_rounded,
      'color': DesignSystem.gameGreen,
      'screen': const GroceryListScreen(),
    },
    {
      'title': 'Orbit Tap',
      'id': 'orbit_tap',
      'icon': Icons.vibration_rounded,
      'color': DesignSystem.gameIndigo,
      'screen': const OrbitTapScreen(),
    },
    {
      'title': 'Rhythm Master',
      'id': 'rhythm_master',
      'icon': Icons.favorite_rounded,
      'color': DesignSystem.gamePink,
      'screen': const RhythmMasterScreen(),
    },
    {
      'title': 'Trace Path',
      'id': 'trace_path',
      'icon': Icons.gesture_rounded,
      'color': DesignSystem.gameGreen,
      'screen': const TracePathScreen(),
    },
    {
      'title': 'Target 24',
      'id': 'target_number',
      'icon': Icons.track_changes_rounded,
      'color': DesignSystem.gameAmber,
      'screen': const TargetNumberScreen(),
    },
    {
      'title': 'Chain Calc',
      'id': 'arithmetic_chain',
      'icon': Icons.link_rounded,
      'color': DesignSystem.gameBlue,
      'screen': const ArithmeticChainScreen(),
    },
    {
      'title': 'Magic Square',
      'id': 'magic_squares',
      'icon': Icons.grid_3x3_rounded,
      'color': DesignSystem.gamePurple,
      'screen': const MagicSquaresScreen(),
    },
    {
      'title': 'KenKen',
      'id': 'kenken',
      'icon': Icons.calculate_outlined,
      'color': DesignSystem.gameTeal,
      'screen': const KenKenScreen(),
    },
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
    {
      'title': 'Color Flood',
      'id': 'color_flood',
      'icon': Icons.waves_rounded,
      'color': DesignSystem.primary,
      'screen': const ColorFloodScreen(),
    },
    {
      'title': 'Tangle Fix',
      'id': 'tangle_fix',
      'icon': Icons.hub_rounded,
      'color': DesignSystem.accentAmber,
      'screen': const TangleFixScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final streaks = ref.watch(gameStreakNotifierProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: false,
            snap: false,
            expandedHeight: 80,
            collapsedHeight: 80,
            backgroundColor: theme.scaffoldBackgroundColor,
            surfaceTintColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              'GAMES',
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w900,
                color: theme.colorScheme.onSurface,
              ),
            ),
            actions: const [
              SuperStreakAction(),
              SizedBox(width: 16),
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
              child: Builder(
                builder: (context) {
                  final solvedToday = streaks.values.where((s) => s.solvedToday).length;
                  String encouragement;
                  if (solvedToday == 0) {
                    encouragement = "READY TO START YOUR BRAIN WORKOUT?";
                  } else if (solvedToday < 3) {
                    encouragement = "GREAT START! KEEP THAT MOMENTUM.";
                  } else if (solvedToday < 7) {
                    encouragement = "ON FIRE! YOUR BRAIN IS LOVING THIS.";
                  } else {
                    encouragement = "INCREDIBLE! YOU'RE A PUZZLE MASTER.";
                  }

                  return TangibleContainer(
                    padding: const EdgeInsets.all(DesignSystem.spaceMD),
                    color: colorScheme.surface,
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: DesignSystem.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                          ),
                          child: Center(
                            child: Text(
                              '$solvedToday',
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w900,
                                color: DesignSystem.primary,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: DesignSystem.spaceMD),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SOLVED TODAY',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.5,
                                  color: colorScheme.onSurface.withValues(alpha: 0.5),
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                encouragement,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w900,
                                  color: colorScheme.onSurface,
                                  letterSpacing: 0.2,
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        TangibleButton(
          color: isSolved ? DesignSystem.success : colorScheme.surface,
          shadowColor:
              isSolved ? const Color(0xFF047857) : colorScheme.outline.withValues(alpha: 0.5),
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
                      color: isSolved ? Colors.white : colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
              Icon(
                isSolved
                    ? Icons.check_circle_rounded
                    : Icons.chevron_right_rounded,
                color: isSolved ? Colors.white : colorScheme.onSurface.withValues(alpha: 0.3),
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
