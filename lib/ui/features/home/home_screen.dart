import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/ui/features/games/base_shift/base_shift_screen.dart';
import '../../../../providers/user_providers.dart';
import '../../../../providers/game_providers.dart';
import '../../../../data/models/game_streak.dart';
import '../../../../widgets/super_streak_action.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
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
import '../games/einstein_riddle/einstein_riddle_screen.dart';
import '../games/mirror_image/mirror_image_screen.dart';
import '../games/mental_mapping/mental_mapping_screen.dart';
import '../games/counting_sheep/counting_sheep_screen.dart';
import '../games/memory_palace/memory_palace_screen.dart';
import '../games/face_trait_association/face_trait_association_screen.dart';
import '../games/mental_calendar/mental_calendar_screen.dart';
import '../games/vocabulary_builder/vocabulary_builder_screen.dart';
import '../games/grammar_police/grammar_police_screen.dart';
import '../games/reverse_stroop/reverse_stroop_screen.dart';
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
import '../games/math_guess/math_guess_screen.dart';
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
import '../games/lock_pattern/lock_pattern_screen.dart';

import '../games/slitherlink/slitherlink_screen.dart';
import '../games/alphabet_sudoku/alphabet_sudoku_screen.dart';
import '../games/futoshiki/futoshiki_screen.dart';
import '../games/kakuro/kakuro_screen.dart';

import '../games/inequality_dash/inequality_dash_screen.dart';
import '../games/factor_finder/factor_finder_screen.dart';
import '../games/sum_pyramid/sum_pyramid_screen.dart';
import '../games/collatz/collatz_screen.dart';
import '../games/target_10/target_10_screen.dart';
import '../games/fraction_matcher/fraction_matcher_screen.dart';

import '../games/dual_coding/dual_coding_screen.dart';
import '../games/distractor_matrix/distractor_matrix_screen.dart';
import '../games/temporal_order/temporal_order_screen.dart';
import '../games/associative_pairs/associative_pairs_screen.dart';

import '../games/block_count_3d/block_count_3d_screen.dart';
import '../games/cube_net_fold/cube_net_fold_screen.dart';
import '../games/rotating_maze/rotating_maze_screen.dart';
import '../games/classic_maze/classic_maze_screen.dart';
import '../games/silhouette_match_ortho/silhouette_match_ortho_screen.dart';
import '../games/topology/topology_screen.dart';

import '../games/conjunction_search/conjunction_search_screen.dart';
import '../games/spatial_conflict/spatial_conflict_screen.dart';
import '../games/spotlight_track/spotlight_track_screen.dart';
import '../games/d2_attention/d2_attention_screen.dart';
import '../games/dual_mirror/dual_mirror_screen.dart';
import '../games/context_clues/context_clues_screen.dart';

import '../games/simon_command/simon_command_screen.dart';
import '../games/binary_code/binary_code_screen.dart';
import '../games/modulo_clock/modulo_clock_screen.dart';
import '../games/chimp_test/chimp_test_screen.dart';
import '../games/relational_memory/relational_memory_screen.dart';
import '../games/fact_binder/fact_binder_screen.dart';
import '../games/source_monitoring/source_monitoring_screen.dart';
import '../games/klotski/klotski_screen.dart';

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

  static final List<Map<String, dynamic>> allGamesList = [
    // --- Logic Games (5) ---
    {
      'title': 'Slitherlink',
      'id': 'slitherlink',
      'category': 'LOGIC',
      'icon': Icons.grain_rounded,
      'color': DesignSystem.gameTeal,
      'builder': (context) => const SlitherlinkScreen(),
    },
    {
      'title': 'Futoshiki',
      'id': 'futoshiki',
      'category': 'LOGIC',
      'icon': Icons.unfold_more_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const FutoshikiScreen(),
    },
    {
      'title': 'Kakuro',
      'id': 'kakuro',
      'category': 'LOGIC',
      'icon': Icons.tag_rounded,
      'color': DesignSystem.gameRose,
      'builder': (context) => const KakuroScreen(),
    },

    // --- Math Games (5) ---
    {
      'title': 'Inequality Dash',
      'id': 'inequality_dash',
      'category': 'MATH',
      'icon': Icons.compare_arrows_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const InequalityDashScreen(),
    },
    {
      'title': 'Factor Finder',
      'id': 'factor_finder',
      'category': 'MATH',
      'icon': Icons.grid_3x3_rounded,
      'color': DesignSystem.gameGreen,
      'builder': (context) => const FactorFinderScreen(),
    },
    {
      'title': 'Collatz Path',
      'id': 'collatz',
      'category': 'MATH',
      'icon': Icons.route_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const CollatzScreen(),
    },
    {
      'title': 'Base Shift Blitz',
      'id': 'base_shift',
      'category': 'MATH',
      'icon': Icons.exposure_rounded,
      'color': DesignSystem.gameTeal,
      'builder': (context) => const BaseShiftScreen(),
    },
    {
      'title': 'Sum Pyramid',
      'id': 'sum_pyramid',
      'category': 'MATH',
      'icon': Icons.change_history_rounded,
      'color': DesignSystem.gameTeal,
      'builder': (context) => const SumPyramidScreen(),
    },
    {
      'title': 'Target 10',
      'id': 'target_10',
      'category': 'MATH',
      'icon': Icons.exposure_zero_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const Target10Screen(),
    },
    {
      'title': 'Fraction Matcher',
      'id': 'fraction_matcher',
      'category': 'MATH',
      'icon': Icons.pie_chart_outline_rounded,
      'color': DesignSystem.gameBlue,
      'builder': (context) => const FractionMatcherScreen(),
    },

    // --- Memory Games (5) ---
    {
      'title': 'Dual Coding',
      'id': 'dual_coding',
      'category': 'MEMORY',
      'icon': Icons.hearing_rounded,
      'color': DesignSystem.gameRose,
      'builder': (context) => const DualCodingScreen(),
    },
    {
      'title': 'Distractor Matrix',
      'id': 'distractor_matrix',
      'category': 'MEMORY',
      'icon': Icons.grid_off_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const DistractorMatrixScreen(),
    },
    {
      'title': 'Temporal Order',
      'id': 'temporal_order',
      'category': 'MEMORY',
      'icon': Icons.history_toggle_off_rounded,
      'color': DesignSystem.gameTeal,
      'builder': (context) => const TemporalOrderScreen(),
    },
    {
      'title': 'Associative Pairs',
      'id': 'associative_pairs',
      'category': 'MEMORY',
      'icon': Icons.join_inner_rounded,
      'color': DesignSystem.gamePurple,
      'builder': (context) => const AssociativePairsScreen(),
    },
    // --- Spatial Games (5) ---
    {
      'title': '3D Block Count',
      'id': 'block_count_3d',
      'category': 'SPATIAL',
      'icon': Icons.view_in_ar_rounded,
      'color': DesignSystem.gameTeal,
      'builder': (context) => const BlockCount3DScreen(),
    },
    {
      'title': 'Cube Net Fold',
      'id': 'cube_net_fold',
      'category': 'SPATIAL',
      'icon': Icons.unfold_more_double_rounded,
      'color': DesignSystem.gameBlue,
      'builder': (context) => const CubeNetFoldScreen(),
    },
    {
      'title': 'Rotating Maze',
      'id': 'rotating_maze',
      'category': 'SPATIAL',
      'icon': Icons.autorenew_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const RotatingMazeScreen(),
    },
    {
      'title': 'Classic Maze',
      'id': 'classic_maze',
      'category': 'SPATIAL',
      'icon': Icons.grid_goldenratio_rounded,
      'color': DesignSystem.gameEmerald,
      'builder': (context) => const ClassicMazeScreen(),
    },
    {
      'title': 'Silhouette Match (Ortho)',
      'id': 'silhouette_match_ortho',
      'category': 'SPATIAL',
      'icon': Icons.view_in_ar_rounded,
      'color': DesignSystem.gameGreen,
      'builder': (context) => const SilhouetteMatchOrthoScreen(),
    },
    {
      'title': 'Topological Equivalence',
      'id': 'topology',
      'category': 'SPATIAL',
      'icon': Icons.category_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const TopologyScreen(),
    },

    // --- Attention Games (5) ---
    {
      'title': 'Conjunction Search',
      'id': 'conjunction_search',
      'category': 'ATTENTION',
      'icon': Icons.manage_search_rounded,
      'color': DesignSystem.gameGreen,
      'builder': (context) => const ConjunctionSearchScreen(),
    },
    {
      'title': 'Spatial Conflict',
      'id': 'spatial_conflict',
      'category': 'ATTENTION',
      'icon': Icons.swap_horizontal_circle_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const SpatialConflictScreen(),
    },
    {
      'title': 'Spotlight Track',
      'id': 'spotlight_track',
      'category': 'ATTENTION',
      'icon': Icons.track_changes_rounded,
      'color': DesignSystem.gameBlue,
      'builder': (context) => const SpotlightTrackScreen(),
    },
    {
      'title': 'd2 Attention',
      'id': 'd2_attention',
      'category': 'ATTENTION',
      'icon': Icons.track_changes_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const D2AttentionScreen(),
    },
    {
      'title': 'Dual-Mirror Navigation',
      'id': 'dual_mirror',
      'category': 'ATTENTION',
      'icon': Icons.compare_rounded,
      'color': DesignSystem.gameRose,
      'builder': (context) => const DualMirrorScreen(),
    },

    // --- Word Games (5) ---
    {
      'title': 'Context Clues',
      'id': 'context_clues',
      'category': 'WORD',
      'icon': Icons.find_in_page_rounded,
      'color': DesignSystem.gameGreen,
      'builder': (context) => const ContextCluesScreen(),
    },
    {
      'title': 'Vocabulary',
      'id': 'vocabulary_builder',
      'category': 'WORD',
      'icon': Icons.menu_book_rounded,
      'color': DesignSystem.gameGreen,
      'builder': (context) => const VocabularyBuilderScreen(),
    },
    {
      'title': 'Grammar Police',
      'id': 'grammar_police',
      'category': 'WORD',
      'icon': Icons.spellcheck_rounded,
      'color': DesignSystem.gameBlue,
      'builder': (context) => const GrammarPoliceScreen(),
    },
    {
      'title': 'Reverse Stroop',
      'id': 'reverse_stroop',
      'category': 'ATTENTION',
      'icon': Icons.psychology_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const ReverseStroopScreen(),
    },
    {
      'title': 'Mental Calendar',
      'id': 'mental_calendar',
      'category': 'MATH',
      'icon': Icons.calendar_month_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const MentalCalendarScreen(),
    },
    {
      'title': 'Face-Trait',
      'id': 'face_trait_association',
      'category': 'MEMORY',
      'icon': Icons.assignment_ind_rounded,
      'color': DesignSystem.gameRose,
      'builder': (context) => const FaceTraitAssociationScreen(),
    },
    {
      'title': 'Memory Palace',
      'id': 'memory_palace',
      'category': 'MEMORY',
      'icon': Icons.home_work_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const MemoryPalaceScreen(),
    },
    {
      'title': 'Counting Sheep',
      'id': 'counting_sheep',
      'category': 'ATTENTION',
      'icon': Icons.pets_rounded,
      'color': DesignSystem.gameGreen,
      'builder': (context) => const CountingSheepScreen(),
    },
    {
      'title': 'Mental Mapping',
      'id': 'mental_mapping',
      'category': 'SPATIAL',
      'icon': Icons.map_rounded,
      'color': DesignSystem.gameTeal,
      'builder': (context) => const MentalMappingScreen(),
    },
    {
      'title': 'Mirror Image',
      'id': 'mirror_image',
      'category': 'SPATIAL',
      'icon': Icons.flip_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const MirrorImageScreen(),
    },
    {
      'title': 'Einstein Riddle',
      'id': 'einstein_riddle',
      'category': 'LOGIC',
      'icon': Icons.extension_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const EinsteinRiddleScreen(),
    },
    {
      'title': 'Lock Pattern',
      'id': 'lock_pattern',
      'category': 'LOGIC',
      'icon': Icons.lock_open_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const LockPatternScreen(),
    },
    {
      'title': 'Object Tracking',
      'id': 'multiple_object_tracking',
      'category': 'ATTENTION',
      'icon': Icons.track_changes_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const MultipleObjectTrackingScreen(),
    },
    {
      'title': 'Vigilance Task',
      'id': 'vigilance_task',
      'category': 'ATTENTION',
      'icon': Icons.watch_later_rounded,
      'color': DesignSystem.gameRose,
      'builder': (context) => const VigilanceTaskScreen(),
    },
    {
      'title': 'Mental Rotation',
      'id': 'mental_rotation',
      'category': 'SPATIAL',
      'icon': Icons.threed_rotation_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const MentalRotationScreen(),
    },
    {
      'title': 'Semantic Link',
      'id': 'semantic_link',
      'category': 'WORD',
      'icon': Icons.link_rounded,
      'color': DesignSystem.gameBlue,
      'builder': (context) => const SemanticLinkScreen(),
    },
    {
      'title': 'Logical Syllogisms',
      'id': 'logical_syllogisms',
      'category': 'LOGIC',
      'icon': Icons.account_tree_rounded,
      'color': DesignSystem.gameTeal,
      'builder': (context) => const LogicalSyllogismsScreen(),
    },
    {
      'title': 'Matrix Reasoning',
      'id': 'matrix_reasoning',
      'category': 'LOGIC',
      'icon': Icons.grid_view_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const MatrixReasoningScreen(),
    },
    {
      'title': 'Numerical Estimation',
      'id': 'numerical_estimation',
      'category': 'MATH',
      'icon': Icons.scatter_plot_rounded,
      'color': DesignSystem.gameRose,
      'builder': (context) => const NumericalEstimationScreen(),
    },
    {
      'title': 'Reverse Span',
      'id': 'digit_span_reverse',
      'category': 'MEMORY',
      'icon': Icons.settings_backup_restore_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const DigitSpanReverseScreen(),
    },
    {
      'title': 'Face-Name',
      'id': 'face_name_association',
      'category': 'MEMORY',
      'icon': Icons.assignment_ind_rounded,
      'color': DesignSystem.gameTeal,
      'builder': (context) => const FaceNameAssociationScreen(),
    },
    {
      'title': 'Staircase Memory',
      'id': 'staircase_memory',
      'category': 'MEMORY',
      'icon': Icons.stairs_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const StaircaseMemoryScreen(),
    },
    {
      'title': 'Akari',
      'id': 'akari',
      'category': 'LOGIC',
      'icon': Icons.lightbulb_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const AkariScreen(),
    },
    {
      'title': 'Perspective',
      'id': 'perspective_taking',
      'category': 'SPATIAL',
      'icon': Icons.view_in_ar_rounded,
      'color': DesignSystem.gamePurple,
      'builder': (context) => const PerspectiveTakingScreen(),
    },
    {
      'title': 'Paper Folding',
      'id': 'paper_folding',
      'category': 'SPATIAL',
      'icon': Icons.note_rounded,
      'color': DesignSystem.gameRose,
      'builder': (context) => const PaperFoldingScreen(),
    },
    {
      'title': 'Mirror Tracing',
      'id': 'mirror_tracing',
      'category': 'SPATIAL',
      'icon': Icons.gesture_rounded,
      'color': DesignSystem.gameCyan,
      'builder': (context) => const MirrorTracingScreen(),
    },
    {
      'title': 'Silhouette Match',
      'id': 'silhouette_match',
      'category': 'SPATIAL',
      'icon': Icons.auto_fix_normal_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const SilhouetteMatchScreen(),
    },
    {
      'title': 'Verbal Analogies',
      'id': 'verbal_analogies',
      'category': 'WORD',
      'icon': Icons.compare_arrows_rounded,
      'color': DesignSystem.gameBlue,
      'builder': (context) => const VerbalAnalogiesScreen(),
    },
    {
      'title': 'Category Fluency',
      'id': 'category_fluency',
      'category': 'WORD',
      'icon': Icons.category_rounded,
      'color': DesignSystem.gameGreen,
      'builder': (context) => const CategoryFluencyScreen(),
    },
    {
      'title': 'Word Surge',
      'id': 'word_surge',
      'category': 'WORD',
      'icon': Icons.trending_up_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const WordSurgeScreen(),
    },
    {
      'title': 'Mental Abacus',
      'id': 'mental_abacus',
      'category': 'MATH',
      'icon': Icons.grid_4x4_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const MentalAbacusScreen(),
    },
    {
      'title': 'Operator Mix',
      'id': 'missing_operator',
      'category': 'MATH',
      'icon': Icons.calculate_rounded,
      'color': DesignSystem.gameBlue,
      'builder': (context) => const MissingOperatorScreen(),
    },
    {
      'title': 'Tower of London',
      'id': 'tower_of_london',
      'category': 'LOGIC',
      'icon': Icons.account_balance_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const TowerOfLondonScreen(),
    },
    {
      'title': 'Symbolic Flanker',
      'id': 'symbolic_flanker',
      'category': 'ATTENTION',
      'icon': Icons.font_download_rounded,
      'color': DesignSystem.gamePurple,
      'builder': (context) => const SymbolicFlankerScreen(),
    },
    {
      'title': 'Rule Switcher',
      'id': 'rule_switcher',
      'category': 'ATTENTION',
      'icon': Icons.swap_calls_rounded,
      'color': DesignSystem.gameTeal,
      'builder': (context) => const RuleSwitcherScreen(),
    },
    {
      'title': 'Box Completion',
      'id': 'box_completion',
      'category': 'SPATIAL',
      'icon': Icons.crop_square_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const BoxCompletionScreen(),
    },
    {
      'title': 'Letter Cancel',
      'id': 'letter_cancellation',
      'category': 'ATTENTION',
      'icon': Icons.spellcheck_rounded,
      'color': DesignSystem.gameRose,
      'builder': (context) => const LetterCancellationScreen(),
    },
    {
      'title': 'Choice Reaction',
      'id': 'choice_reaction_time',
      'category': 'ATTENTION',
      'icon': Icons.touch_app_rounded,
      'color': DesignSystem.gameBlue,
      'builder': (context) => const ChoiceReactionTimeScreen(),
    },
    {
      'title': 'Wisconsin Card Sort',
      'id': 'wisconsin_card_sorting',
      'category': 'LOGIC',
      'icon': Icons.style_rounded,
      'color': DesignSystem.gameRose,
      'builder': (context) => const WisconsinCardSortingScreen(),
    },
    {
      'title': 'Attentional Blink',
      'id': 'attentional_blink',
      'category': 'ATTENTION',
      'icon': Icons.visibility_off_rounded,
      'color': DesignSystem.gamePurple,
      'builder': (context) => const AttentionalBlinkScreen(),
    },
    {
      'title': 'Change Blindness',
      'id': 'change_blindness',
      'category': 'ATTENTION',
      'icon': Icons.flip_camera_android_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const ChangeBlindnessScreen(),
    },
    {
      'title': 'Visual Learning',
      'id': 'visual_statistical_learning',
      'category': 'MEMORY',
      'icon': Icons.pattern_rounded,
      'color': DesignSystem.gameTeal,
      'builder': (context) => const VisualStatisticalLearningScreen(),
    },
    {
      'title': 'Sternberg Task',
      'id': 'sternberg_task',
      'category': 'MEMORY',
      'icon': Icons.memory_rounded,
      'color': DesignSystem.gameBlue,
      'builder': (context) => const SternbergTaskScreen(),
    },
    {
      'title': 'Double N-Back',
      'id': 'double_n_back',
      'category': 'MEMORY',
      'icon': Icons.layers_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const DoubleNBackScreen(),
    },
    {
      'title': 'Operation Span',
      'id': 'operation_span',
      'category': 'MEMORY',
      'icon': Icons.calculate_rounded,
      'color': DesignSystem.gameGreen,
      'builder': (context) => const OperationSpanScreen(),
    },
    {
      'title': 'N-Back Test',
      'id': 'n_back',
      'category': 'MEMORY',
      'icon': Icons.psychology_rounded,
      'color': DesignSystem.gameBlue,
      'builder': (context) => const NBackScreen(),
    },
    {
      'title': 'Corsi Blocks',
      'id': 'corsi_blocks',
      'category': 'MEMORY',
      'icon': Icons.grid_view_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const CorsiBlocksScreen(),
    },
    {
      'title': 'SDMT Test',
      'id': 'sdmt',
      'category': 'ATTENTION',
      'icon': Icons.fact_check_rounded,
      'color': DesignSystem.gameTeal,
      'builder': (context) => const SDMTScreen(),
    },
    {
      'title': 'Trail Making',
      'id': 'trail_making',
      'category': 'ATTENTION',
      'icon': Icons.timeline_rounded,
      'color': DesignSystem.gameGreen,
      'builder': (context) => const TrailMakingScreen(),
    },
    {
      'title': 'Stop Signal',
      'id': 'stop_signal',
      'category': 'ATTENTION',
      'icon': Icons.block_flipped,
      'color': DesignSystem.gameRose,
      'builder': (context) => const StopSignalScreen(),
    },
    {
      'title': 'Visual Search',
      'id': 'visual_search',
      'category': 'ATTENTION',
      'icon': Icons.center_focus_strong_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const VisualSearchScreen(),
    },
    {
      'title': 'Go / No-Go',
      'id': 'go_no_go',
      'category': 'ATTENTION',
      'icon': Icons.pan_tool_alt_rounded,
      'color': DesignSystem.gameRose,
      'builder': (context) => const GoNoGoScreen(),
    },
    {
      'title': 'Divided Focus',
      'id': 'divided_attention',
      'category': 'ATTENTION',
      'icon': Icons.vertical_split_rounded,
      'color': DesignSystem.gameTeal,
      'builder': (context) => const DividedAttentionScreen(),
    },
    {
      'title': 'Prime Hunter',
      'id': 'prime_hunter',
      'category': 'MATH',
      'icon': Icons.gps_fixed_rounded,
      'color': DesignSystem.gameBlue,
      'builder': (context) => const PrimeHunterScreen(),
    },
    {
      'title': 'Fraction Match',
      'id': 'fraction_match',
      'category': 'MATH',
      'icon': Icons.pie_chart_rounded,
      'color': DesignSystem.gamePurple,
      'builder': (context) => const FractionMatchScreen(),
    },
    {
      'title': 'Path Recall',
      'id': 'path_recall',
      'category': 'MEMORY',
      'icon': Icons.polyline_rounded,
      'color': DesignSystem.gameBlue,
      'builder': (context) => const PathRecallScreen(),
    },
    {
      'title': 'Object Shuffle',
      'id': 'object_shuffle',
      'category': 'MEMORY',
      'icon': Icons.visibility_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const ObjectShuffleScreen(),
    },
    {
      'title': 'Grocery List',
      'id': 'grocery_list',
      'category': 'MEMORY',
      'icon': Icons.shopping_basket_rounded,
      'color': DesignSystem.gameGreen,
      'builder': (context) => const GroceryListScreen(),
    },
    {
      'title': 'Orbit Tap',
      'id': 'orbit_tap',
      'category': 'ATTENTION',
      'icon': Icons.vibration_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const OrbitTapScreen(),
    },
    {
      'title': 'Rhythm Master',
      'id': 'rhythm_master',
      'category': 'ATTENTION',
      'icon': Icons.favorite_rounded,
      'color': DesignSystem.gamePink,
      'builder': (context) => const RhythmMasterScreen(),
    },
    {
      'title': 'Trace Path',
      'id': 'trace_path',
      'category': 'SPATIAL',
      'icon': Icons.gesture_rounded,
      'color': DesignSystem.gameGreen,
      'builder': (context) => const TracePathScreen(),
    },
    {
      'title': 'Target 24',
      'id': 'target_number',
      'category': 'MATH',
      'icon': Icons.track_changes_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const TargetNumberScreen(),
    },
    {
      'title': 'Chain Calc',
      'id': 'arithmetic_chain',
      'category': 'MATH',
      'icon': Icons.link_rounded,
      'color': DesignSystem.gameBlue,
      'builder': (context) => const ArithmeticChainScreen(),
    },
    {
      'title': 'Magic Square',
      'id': 'magic_squares',
      'category': 'MATH',
      'icon': Icons.grid_3x3_rounded,
      'color': DesignSystem.gamePurple,
      'builder': (context) => const MagicSquaresScreen(),
    },
    {
      'title': 'KenKen',
      'id': 'kenken',
      'category': 'MATH',
      'icon': Icons.calculate_outlined,
      'color': DesignSystem.gameTeal,
      'builder': (context) => const KenKenScreen(),
    },
    {
      'title': 'Typing Speed',
      'id': 'typing_speed',
      'category': 'WORD',
      'icon': Icons.keyboard_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const TypingSpeedScreen(),
    },
    {
      'title': 'Quick Math',
      'id': 'quick_math',
      'category': 'MATH',
      'icon': Icons.bolt_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const QuickMathScreen(),
    },
    {
      'title': 'Math Guess',
      'id': 'math_guess',
      'category': 'MATH',
      'icon': Icons.question_mark_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const MathGuessScreen(),
    },
    {
      'title': 'Reflex Tap',
      'id': 'reflex_tap',
      'category': 'ATTENTION',
      'icon': Icons.ads_click_rounded,
      'color': DesignSystem.gameRose,
      'builder': (context) => const ReflexTapScreen(),
    },
    {
      'title': 'Stroop Test',
      'id': 'stroop_test',
      'category': 'ATTENTION',
      'icon': Icons.psychology_rounded,
      'color': DesignSystem.gameGreen,
      'builder': (context) => const StroopTestScreen(),
    },
    {
      'title': 'Flanker Test',
      'id': 'flanker_test',
      'category': 'ATTENTION',
      'icon': Icons.compare_arrows_rounded,
      'color': DesignSystem.gameBlue,
      'builder': (context) => const FlankerTestScreen(),
    },
    {
      'title': 'Switch Task',
      'id': 'switch_task',
      'category': 'ATTENTION',
      'icon': Icons.swap_horiz_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const SwitchTaskScreen(),
    },
    {
      'title': 'Cryptogram',
      'id': 'cryptogram',
      'category': 'WORD',
      'icon': Icons.password_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const CryptogramScreen(),
    },
    {
      'title': 'Balance Scale',
      'id': 'balance_scale',
      'category': 'MATH',
      'icon': Icons.balance_rounded,
      'color': DesignSystem.gameTeal,
      'builder': (context) => const BalanceScaleScreen(),
    },
    {
      'title': 'Symbol Logic',
      'id': 'symbol_logic',
      'category': 'LOGIC',
      'icon': Icons.calculate_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const SymbolLogicScreen(),
    },
    {
      'title': 'Pixel Mimic',
      'id': 'pixel_mimic',
      'category': 'MEMORY',
      'icon': Icons.memory_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const PixelMimicScreen(),
    },
    {
      'title': 'Odd Rotation',
      'id': 'odd_rotation',
      'category': 'SPATIAL',
      'icon': Icons.flip_rounded,
      'color': DesignSystem.gameRose,
      'builder': (context) => const OddRotationScreen(),
    },
    {
      'title': 'Word Scramble',
      'id': 'word_scramble',
      'category': 'WORD',
      'icon': Icons.shuffle_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const WordScrambleScreen(),
    },
    {
      'title': 'Missing Vowels',
      'id': 'missing_vowels',
      'category': 'WORD',
      'icon': Icons.spellcheck_rounded,
      'color': DesignSystem.gameBlue,
      'builder': (context) => const MissingVowelsScreen(),
    },
    {
      'title': 'Water Sort',
      'id': 'water_sort',
      'category': 'LOGIC',
      'icon': Icons.opacity_rounded,
      'color': DesignSystem.gameBlue,
      'builder': (context) => const WaterSortScreen(),
    },
    {
      'title': 'Lights Out',
      'id': 'lights_out',
      'category': 'LOGIC',
      'icon': Icons.lightbulb_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const LightsOutScreen(),
    },
    {
      'title': 'Hue Sort',
      'id': 'hue_sort',
      'category': 'SPATIAL',
      'icon': Icons.gradient_rounded,
      'color': DesignSystem.gamePurple,
      'builder': (context) => const HueSortScreen(),
    },
    {
      'title': 'Math Path',
      'id': 'math_path',
      'category': 'MATH',
      'icon': Icons.route_rounded,
      'color': DesignSystem.gameBlue,
      'builder': (context) => const MathPathScreen(),
    },
    {
      'title': 'Spelling Sprint',
      'id': 'spelling_sprint',
      'category': 'WORD',
      'icon': Icons.speed_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const SpellingSprintScreen(),
    },
    {
      'title': 'Odd One Out',
      'id': 'odd_one_out',
      'category': 'ATTENTION',
      'icon': Icons.visibility_rounded,
      'color': DesignSystem.gameRose,
      'builder': (context) => const OddOneOutScreen(),
    },
    {
      'title': 'Bridges',
      'id': 'bridges',
      'category': 'LOGIC',
      'icon': Icons.horizontal_rule_rounded,
      'color': DesignSystem.gameTeal,
      'builder': (context) => const BridgesScreen(),
    },
    {
      'title': 'Binary Puzzle',
      'id': 'binary_puzzle',
      'category': 'LOGIC',
      'icon': Icons.exposure_zero_rounded,
      'color': DesignSystem.gameBlue,
      'builder': (context) => const BinaryPuzzleScreen(),
    },
    {
      'title': 'Color Match',
      'id': 'color_match',
      'category': 'ATTENTION',
      'icon': Icons.palette_rounded,
      'color': DesignSystem.gameRose,
      'builder': (context) => const ColorMatchScreen(),
    },
    {
      'title': 'Path Finder',
      'id': 'path_finder',
      'category': 'LOGIC',
      'icon': Icons.route_rounded,
      'color': DesignSystem.gameTeal,
      'builder': (context) => const PathFinderScreen(),
    },
    {
      'title': 'Sequence',
      'id': 'simon_sequence',
      'category': 'MEMORY',
      'icon': Icons.repeat_rounded,
      'color': DesignSystem.gameCyan,
      'builder': (context) => const SimonSequenceScreen(),
    },
    {
      'title': 'Symmetry',
      'id': 'symmetry',
      'category': 'SPATIAL',
      'icon': Icons.flip_rounded,
      'color': DesignSystem.gameViolet,
      'builder': (context) => const SymmetryScreen(),
    },
    {
      'title': 'Sudoku',
      'id': 'sudoku',
      'category': 'LOGIC',
      'icon': Icons.grid_4x4_rounded,
      'color': DesignSystem.gameBlue,
      'builder': (context) => const SudokuScreen(),
    },
    {
      'title': 'Alphabet Sudoku',
      'id': 'alphabet_sudoku',
      'category': 'LOGIC',
      'icon': Icons.abc_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const AlphabetSudokuScreen(),
    },
    {
      'title': 'Word Mastermind',
      'id': 'word_mastermind',
      'category': 'WORD',
      'icon': Icons.psychology_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const WordMastermindScreen(),
    },
    {
      'title': 'Word Ladder',
      'id': 'word_ladder',
      'category': 'WORD',
      'icon': Icons.format_list_numbered_rounded,
      'color': DesignSystem.gameViolet,
      'builder': (context) => const WordLadderScreen(),
    },
    {
      'title': 'Slide Puzzle',
      'id': 'slide_puzzle',
      'category': 'SPATIAL',
      'icon': Icons.grid_view_rounded,
      'color': DesignSystem.gameRose,
      'builder': (context) => const SlidePuzzleScreen(),
    },
    {
      'title': 'Pipes',
      'id': 'pipes',
      'category': 'LOGIC',
      'icon': Icons.hub_rounded,
      'color': DesignSystem.gameTeal,
      'builder': (context) => const PipesScreen(),
    },
    {
      'title': 'Block Escape',
      'id': 'block_escape',
      'category': 'LOGIC',
      'icon': Icons.view_column_rounded,
      'color': DesignSystem.gameOrange,
      'builder': (context) => const BlockEscapeScreen(),
    },
    {
      'title': 'Tents & Trees',
      'id': 'tents_and_trees',
      'category': 'LOGIC',
      'icon': Icons.park_rounded,
      'color': DesignSystem.gameGreen,
      'builder': (context) => const TentsAndTreesScreen(),
    },
    {
      'title': 'Find Word',
      'id': 'find_word',
      'category': 'WORD',
      'icon': Icons.abc_rounded,
      'color': DesignSystem.gameGreen,
      'builder': (context) => const FindWordScreen(),
    },
    {
      'title': 'Crossword',
      'id': 'crossword',
      'category': 'WORD',
      'icon': Icons.grid_on_rounded,
      'color': DesignSystem.gamePurple,
      'builder': (context) => const CrosswordScreen(),
    },
    {
      'title': 'Word Search',
      'id': 'word_search',
      'category': 'WORD',
      'icon': Icons.search_rounded,
      'color': DesignSystem.gameOrange,
      'builder': (context) => const WordSearchScreen(),
    },
    {
      'title': '2048',
      'id': 'game_2048',
      'category': 'MATH',
      'icon': Icons.grid_view_rounded,
      'color': DesignSystem.gamePink,
      'builder': (context) => const Game2048Screen(),
    },
    {
      'title': 'Crown',
      'id': 'crown',
      'category': 'LOGIC',
      'icon': Icons.workspace_premium_rounded,
      'color': DesignSystem.gameTeal,
      'builder': (context) => const CrownScreen(),
    },
    {
      'title': 'Minesweeper',
      'id': 'minesweeper',
      'category': 'LOGIC',
      'icon': Icons.brightness_7_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const MinesweeperScreen(),
    },
    {
      'title': 'Memory Matrix',
      'id': 'memory_matrix',
      'category': 'MEMORY',
      'icon': Icons.memory_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const MemoryMatrixScreen(),
    },
    {
      'title': 'Nonogram',
      'id': 'nonogram',
      'category': 'LOGIC',
      'icon': Icons.grid_view_rounded,
      'color': DesignSystem.gameRose,
      'builder': (context) => const NonogramScreen(),
    },
    {
      'title': 'Schulte Table',
      'id': 'schulte_table',
      'category': 'ATTENTION',
      'icon': Icons.speed_rounded,
      'color': DesignSystem.gameViolet,
      'builder': (context) => const SchulteTableScreen(),
    },
    {
      'title': 'Calc Sprint',
      'id': 'calculation_sprint',
      'category': 'MATH',
      'icon': Icons.calculate_rounded,
      'color': DesignSystem.gameEmerald,
      'builder': (context) => const CalculationSprintScreen(),
    },
    {
      'title': 'Color Flood',
      'id': 'color_flood',
      'category': 'LOGIC',
      'icon': Icons.waves_rounded,
      'color': DesignSystem.primary,
      'builder': (context) => const ColorFloodScreen(),
    },
    {
      'title': 'Tangle Fix',
      'id': 'tangle_fix',
      'category': 'LOGIC',
      'icon': Icons.gesture_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const TangleFixScreen(),
    },
    // --- 15 New Games (Except Word category) ---
    {
      'title': 'Simon Command',
      'id': 'simon_command',
      'category': 'ATTENTION',
      'icon': Icons.record_voice_over_rounded,
      'color': DesignSystem.gameGreen,
      'builder': (context) => const SimonCommandScreen(),
    },
    {
      'title': 'Binary Speed',
      'id': 'binary_code',
      'category': 'MATH',
      'icon': Icons.code_rounded,
      'color': DesignSystem.gamePink,
      'builder': (context) => const BinaryCodeScreen(),
    },
    {
      'title': 'Modulo Clock',
      'id': 'modulo_clock',
      'category': 'MATH',
      'icon': Icons.watch_later_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const ModuloClockScreen(),
    },
    {
      'title': 'Chimp Test',
      'id': 'chimp_test',
      'category': 'MEMORY',
      'icon': Icons.looks_one_rounded,
      'color': DesignSystem.gameRose,
      'builder': (context) => const ChimpTestScreen(),
    },
    {
      'title': 'Relational Memory',
      'id': 'relational_memory',
      'category': 'MEMORY',
      'icon': Icons.location_on_rounded,
      'color': DesignSystem.gameTeal,
      'builder': (context) => const RelationalMemoryScreen(),
    },
    {
      'title': 'Fact Binder',
      'id': 'fact_binder',
      'category': 'MEMORY',
      'icon': Icons.folder_shared_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const FactBinderScreen(),
    },
    {
      'title': 'Source Monitoring',
      'id': 'source_monitoring',
      'category': 'MEMORY',
      'icon': Icons.source_rounded,
      'color': DesignSystem.gameTeal,
      'builder': (context) => const SourceMonitoringScreen(),
    },
    {
      'title': 'Klotski Escape',
      'id': 'klotski',
      'category': 'SPATIAL',
      'icon': Icons.grid_view_rounded,
      'color': DesignSystem.gameRose,
      'builder': (context) => const KlotskiScreen(),
    },
  ];
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
                      borderRadius: BorderRadius.circular(
                          16.0), // slightly smaller radius for more compact look
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

          // Search and Categories
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
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
                    child: Row(
                      children: [
                        _buildCategoryButton(l10n.categoryAll, 'ALL'),
                        _buildCategoryButton(
                            l10n.categoryAttention, 'ATTENTION'),
                        _buildCategoryButton(l10n.categoryLogic, 'LOGIC'),
                        _buildCategoryButton(l10n.categoryMath, 'MATH'),
                        _buildCategoryButton(l10n.categoryWord, 'WORD'),
                        _buildCategoryButton(l10n.categoryMemory, 'MEMORY'),
                        _buildCategoryButton(l10n.categorySpatial, 'SPATIAL'),
                      ],
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
                                1.73, // Adjusted ratio to mathematically guarantee no bottom overflows under any display width
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
                                      onTap: () => Navigator.push(
                                        context,
                                        CustomPageRoute(
                                            page: (game['builder']
                                                as WidgetBuilder)(context)),
                                      ),
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
                                        onTap: () => Navigator.push(
                                          context,
                                          CustomPageRoute(
                                              page: (game['builder']
                                                  as WidgetBuilder)(context)),
                                        ),
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

  Widget _buildCategoryButton(String label, String value) {
    final isSelected = _selectedCategory == value;
    final categoryStyle = _getCategoryStyle(value);
    return Padding(
      padding: const EdgeInsets.only(right: DesignSystem.spaceMD),
      child: CategoryButton(
        label: label,
        value: value,
        isSelected: isSelected,
        categoryStyle: categoryStyle,
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
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.label,
    required this.value,
    required this.isSelected,
    required this.categoryStyle,
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
            Container(
              width: 74,
              height: 74,
              decoration: BoxDecoration(
                color: widget.isSelected
                    ? Colors.transparent
                    : (isDark ? const Color(0xFF1E1E1E) : Colors.white),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: widget.isSelected
                      ? widget.categoryStyle.color
                      : (isDark
                          ? const Color(0xFF2D2D2D)
                          : const Color(0xFFE2E8F0)),
                  width: widget.isSelected ? 2.5 : 1.5,
                ),
              ),
              padding: widget.isSelected
                  ? const EdgeInsets.all(4.0)
                  : EdgeInsets.zero,
              child: widget.isSelected
                  ? Container(
                      decoration: BoxDecoration(
                        color: widget.categoryStyle.color,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Icon(
                          widget.categoryStyle.icon,
                          size: 30,
                          color: const Color(0xFF121212),
                        ),
                      ),
                    )
                  : Center(
                      child: Icon(
                        widget.categoryStyle.icon,
                        size: 30,
                        color:
                            widget.categoryStyle.color.withValues(alpha: 0.8),
                      ),
                    ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.label.toUpperCase(),
              style: TextStyle(
                fontFamily: 'Geist',
                fontSize: 12,
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
    final isSolved = widget.streak?.solvedToday ?? false;
    final streakCount = widget.streak?.currentStreak ?? 0;

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
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: isDark ? const Color(0xFF2D2D2D) : const Color(0xFFE2E8F0),
              width: 1.5,
            ),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical:
                  18.0), // Streamlined padding to optimize internal spacing and eliminate overflows
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row 1: Header tags
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: widget.accentColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Text(
                      displayCategory,
                      style: TextStyle(
                        fontFamily: 'Geist',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w900,
                        color: widget.accentColor,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (streakCount > 0) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
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
                                size: 14,
                                color: DesignSystem.accentAmber,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                '$streakCount',
                                style: const TextStyle(
                                  fontFamily: 'Geist',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w900,
                                  color: DesignSystem.accentAmber,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                      if (isSolved) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: widget.accentColor,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Text(
                            "JUST PLAYED",
                            style: TextStyle(
                              fontFamily: 'Geist',
                              fontSize: 11.0,
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
                        if (isSolved) const SizedBox(width: 8),
                        const Icon(
                          Icons.favorite_rounded,
                          color: DesignSystem.gameRose,
                          size: 20,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
              const SizedBox(
                  height:
                      12.0), // Reduced spacer height to compact vertical stack footprint
              // Row 2: Title and play button
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          displayTitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Bebas Neue',
                            fontSize: 30.0,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                            height: 1.0,
                            color:
                                isDark ? Colors.white : colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          description.toUpperCase(),
                          style: TextStyle(
                            fontFamily: 'Geist',
                            fontSize: 12.0,
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
                  const SizedBox(width: 16.0),
                  Icon(
                    Icons.play_arrow_rounded,
                    color: widget.accentColor,
                    size: 22,
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
