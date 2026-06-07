import 'package:flutter/material.dart';
import '../ui/features/games/sudoku/sudoku_screen.dart';
import '../ui/features/games/find_word/find_word_screen.dart';
import '../ui/features/games/crossword/crossword_screen.dart';
import '../ui/features/games/word_search/word_search_screen.dart';
import '../ui/features/games/game_2048/game_2048_screen.dart';
import '../ui/features/games/crown/crown_screen.dart';
import '../ui/features/games/minesweeper/minesweeper_screen.dart';
import '../ui/features/games/memory_matrix/memory_matrix_screen.dart';
import '../ui/features/games/nonogram/nonogram_screen.dart';
import '../ui/features/games/schulte_table/schulte_table_screen.dart';
import '../ui/features/games/calculation_sprint/calculation_sprint_screen.dart';
import '../ui/features/games/pipes/pipes_screen.dart';
import '../ui/features/games/block_escape/block_escape_screen.dart';
import '../ui/features/games/tents_and_trees/tents_and_trees_screen.dart';
import '../ui/features/games/slide_puzzle/slide_puzzle_screen.dart';
import '../ui/features/games/word_mastermind/word_mastermind_screen.dart';
import '../ui/features/games/word_ladder/word_ladder_screen.dart';
import '../ui/features/games/color_match/color_match_screen.dart';
import '../ui/features/games/path_finder/path_finder_screen.dart';
import '../ui/features/games/simon_sequence/simon_sequence_screen.dart';
import '../ui/features/games/symmetry/symmetry_screen.dart';
import '../ui/features/games/binary_puzzle/binary_puzzle_screen.dart';
import '../ui/features/games/bridges/bridges_screen.dart';
import '../ui/features/games/odd_one_out/odd_one_out_screen.dart';
import '../ui/features/games/spelling_sprint/spelling_sprint_screen.dart';
import '../ui/features/games/math_path/math_path_screen.dart';
import '../ui/features/games/hue_sort/hue_sort_screen.dart';
import '../ui/features/games/water_sort/water_sort_screen.dart';
import '../ui/features/games/lights_out/lights_out_screen.dart';
import '../ui/features/games/word_scramble/word_scramble_screen.dart';
import '../ui/features/games/missing_vowels/missing_vowels_screen.dart';
import '../ui/features/games/symbol_logic/symbol_logic_screen.dart';
import '../ui/features/games/pixel_mimic/pixel_mimic_screen.dart';
import '../ui/features/games/odd_rotation/odd_rotation_screen.dart';
import '../ui/features/games/balance_scale/balance_scale_screen.dart';
import '../ui/features/games/target_number/target_number_screen.dart';
import '../ui/features/games/arithmetic_chain/arithmetic_chain_screen.dart';
import '../ui/features/games/magic_squares/magic_squares_screen.dart';
import '../ui/features/games/kenken/kenken_screen.dart';
import '../ui/features/games/orbit_tap/orbit_tap_screen.dart';
import '../ui/features/games/rhythm_master/rhythm_master_screen.dart';
import '../ui/features/games/trace_path/trace_path_screen.dart';
import '../ui/features/games/akari/akari_screen.dart';
import '../ui/features/games/hitori/hitori_screen.dart';
import '../ui/features/games/fillomino/fillomino_screen.dart';
import '../ui/features/games/nurikabe/nurikabe_screen.dart';
import '../ui/features/games/skyscrapers/skyscrapers_screen.dart';
import '../ui/features/games/dominosa/dominosa_screen.dart';
import '../ui/features/games/lighthouses/lighthouses_screen.dart';
import '../ui/features/games/magnets/magnets_screen.dart';
import '../ui/features/games/perspective_taking/perspective_taking_screen.dart';
import '../ui/features/games/paper_folding/paper_folding_screen.dart';
import '../ui/features/games/mirror_tracing/mirror_tracing_screen.dart';
import '../ui/features/games/silhouette_match/silhouette_match_screen.dart';
import '../ui/features/games/multiple_object_tracking/multiple_object_tracking_screen.dart';
import '../ui/features/games/einstein_riddle/einstein_riddle_screen.dart';
import '../ui/features/games/mirror_image/mirror_image_screen.dart';
import '../ui/features/games/mental_mapping/mental_mapping_screen.dart';
import '../ui/features/games/counting_sheep/counting_sheep_screen.dart';
import '../ui/features/games/memory_palace/memory_palace_screen.dart';
import '../ui/features/games/face_trait_association/face_trait_association_screen.dart';
import '../ui/features/games/mental_calendar/mental_calendar_screen.dart';
import '../ui/features/games/vocabulary_builder/vocabulary_builder_screen.dart';
import '../ui/features/games/grammar_police/grammar_police_screen.dart';
import '../ui/features/games/reverse_stroop/reverse_stroop_screen.dart';
import '../ui/features/games/vigilance_task/vigilance_task_screen.dart';
import '../ui/features/games/visual_search/visual_search_screen.dart';
import '../ui/features/games/go_no_go/go_no_go_screen.dart';
import '../ui/features/games/divided_attention/divided_attention_screen.dart';
import '../ui/features/games/prime_hunter/prime_hunter_screen.dart';
import '../ui/features/games/fraction_match/fraction_match_screen.dart';
import '../ui/features/games/path_recall/path_recall_screen.dart';
import '../ui/features/games/object_shuffle/object_shuffle_screen.dart';
import '../ui/features/games/grocery_list/grocery_list_screen.dart';
import '../ui/features/games/cryptogram/cryptogram_screen.dart';
import '../ui/features/games/typing_speed/typing_speed_screen.dart';
import '../ui/features/games/quick_math/quick_math_screen.dart';
import '../ui/features/games/math_guess/math_guess_screen.dart';
import '../ui/features/games/reflex_tap/reflex_tap_screen.dart';
import '../ui/features/games/stroop_test/stroop_test_screen.dart';
import '../ui/features/games/flanker_test/flanker_test_screen.dart';
import '../ui/features/games/switch_task/switch_task_screen.dart';
import '../ui/features/games/n_back/n_back_screen.dart';
import '../ui/features/games/corsi_blocks/corsi_blocks_screen.dart';
import '../ui/features/games/sdmt/sdmt_screen.dart';
import '../ui/features/games/trail_making/trail_making_screen.dart';
import '../ui/features/games/stop_signal/stop_signal_screen.dart';
import '../ui/features/games/operation_span/operation_span_screen.dart';
import '../ui/features/games/double_n_back/double_n_back_screen.dart';
import '../ui/features/games/sternberg_task/sternberg_task_screen.dart';
import '../ui/features/games/visual_statistical_learning/visual_statistical_learning_screen.dart';
import '../ui/features/games/change_blindness/change_blindness_screen.dart';
import '../ui/features/games/attentional_blink/attentional_blink_screen.dart';
import '../ui/features/games/wisconsin_card_sorting/wisconsin_card_sorting_screen.dart';
import '../ui/features/games/tower_of_london/tower_of_london_screen.dart';
import '../ui/features/games/symbolic_flanker/symbolic_flanker_screen.dart';
import '../ui/features/games/rule_switcher/rule_switcher_screen.dart';
import '../ui/features/games/box_completion/box_completion_screen.dart';
import '../ui/features/games/letter_cancellation/letter_cancellation_screen.dart';
import '../ui/features/games/choice_reaction_time/choice_reaction_time_screen.dart';
import '../ui/features/games/mental_rotation/mental_rotation_screen.dart';
import '../ui/features/games/semantic_link/semantic_link_screen.dart';
import '../ui/features/games/logical_syllogisms/logical_syllogisms_screen.dart';
import '../ui/features/games/matrix_reasoning/matrix_reasoning_screen.dart';
import '../ui/features/games/numerical_estimation/numerical_estimation_screen.dart';
import '../ui/features/games/digit_span_reverse/digit_span_reverse_screen.dart';
import '../ui/features/games/face_name_association/face_name_association_screen.dart';
import '../ui/features/games/staircase_memory/staircase_memory_screen.dart';
import '../ui/features/games/verbal_analogies/verbal_analogies_screen.dart';
import '../ui/features/games/category_fluency/category_fluency_screen.dart';
import '../ui/features/games/word_surge/word_surge_screen.dart';
import '../ui/features/games/mental_abacus/mental_abacus_screen.dart';
import '../ui/features/games/missing_operator/missing_operator_screen.dart';
import '../ui/features/games/color_flood/color_flood_screen.dart';
import '../ui/features/games/tangle_fix/tangle_fix_screen.dart';
import '../ui/features/games/lock_pattern/lock_pattern_screen.dart';
import '../ui/features/games/slitherlink/slitherlink_screen.dart';
import '../ui/features/games/alphabet_sudoku/alphabet_sudoku_screen.dart';
import '../ui/features/games/futoshiki/futoshiki_screen.dart';
import '../ui/features/games/kakuro/kakuro_screen.dart';
import '../ui/features/games/inequality_dash/inequality_dash_screen.dart';
import '../ui/features/games/factor_finder/factor_finder_screen.dart';
import '../ui/features/games/sum_pyramid/sum_pyramid_screen.dart';
import '../ui/features/games/collatz/collatz_screen.dart';
import '../ui/features/games/target_10/target_10_screen.dart';
import '../ui/features/games/fraction_matcher/fraction_matcher_screen.dart';
import '../ui/features/games/dual_coding/dual_coding_screen.dart';
import '../ui/features/games/distractor_matrix/distractor_matrix_screen.dart';
import '../ui/features/games/temporal_order/temporal_order_screen.dart';
import '../ui/features/games/associative_pairs/associative_pairs_screen.dart';
import '../ui/features/games/fibonacci_merge/fibonacci_merge_screen.dart';
import '../ui/features/games/sequence_sleuth/sequence_sleuth_screen.dart';
import '../ui/features/games/divisibility_dash/divisibility_dash_screen.dart';
import '../ui/features/games/percentage_peak/percentage_peak_screen.dart';
import '../ui/features/games/venn_numbers/venn_numbers_screen.dart';
import '../ui/features/games/common_denominator/common_denominator_screen.dart';
import '../ui/features/games/radical_roots/radical_roots_screen.dart';
import '../ui/features/games/roman_arithmetic/roman_arithmetic_screen.dart';
import '../ui/features/games/angle_finder/angle_finder_screen.dart';
import '../ui/features/games/sum_snake/sum_snake_screen.dart';
import '../ui/features/games/block_count_3d/block_count_3d_screen.dart';
import '../ui/features/games/cube_net_fold/cube_net_fold_screen.dart';
import '../ui/features/games/rotating_maze/rotating_maze_screen.dart';
import '../ui/features/games/classic_maze/classic_maze_screen.dart';
import '../ui/features/games/silhouette_match_ortho/silhouette_match_ortho_screen.dart';
import '../ui/features/games/topology/topology_screen.dart';
import '../ui/features/games/conjunction_search/conjunction_search_screen.dart';
import '../ui/features/games/spatial_conflict/spatial_conflict_screen.dart';
import '../ui/features/games/spotlight_track/spotlight_track_screen.dart';
import '../ui/features/games/d2_attention/d2_attention_screen.dart';
import '../ui/features/games/dual_mirror/dual_mirror_screen.dart';
import '../ui/features/games/context_clues/context_clues_screen.dart';
import '../ui/features/games/simon_command/simon_command_screen.dart';
import '../ui/features/games/binary_code/binary_code_screen.dart';
import '../ui/features/games/modulo_clock/modulo_clock_screen.dart';
import '../ui/features/games/chimp_test/chimp_test_screen.dart';
import '../ui/features/games/relational_memory/relational_memory_screen.dart';
import '../ui/features/games/fact_binder/fact_binder_screen.dart';
import '../ui/features/games/source_monitoring/source_monitoring_screen.dart';
import '../ui/features/games/klotski/klotski_screen.dart';
import '../ui/features/games/base_shift/base_shift_screen.dart';
import '../utils/design_system.dart';

class GameData {
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
    {
      'title': 'Fibonacci Merge',
      'id': 'fibonacci_merge',
      'category': 'MATH',
      'icon': Icons.merge_type_rounded,
      'color': DesignSystem.gameTeal,
      'builder': (context) => const FibonacciMergeScreen(),
    },
    {
      'title': 'Sequence Sleuth',
      'id': 'sequence_sleuth',
      'category': 'MATH',
      'icon': Icons.linear_scale_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const SequenceSleuthScreen(),
    },
    {
      'title': 'Divisibility Dash',
      'id': 'divisibility_dash',
      'category': 'MATH',
      'icon': Icons.speed_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const DivisibilityDashScreen(),
    },
    {
      'title': 'Percentage Peak',
      'id': 'percentage_peak',
      'category': 'MATH',
      'icon': Icons.percent_rounded,
      'color': DesignSystem.gameGreen,
      'builder': (context) => const PercentagePeakScreen(),
    },
    {
      'title': 'Venn Numbers',
      'id': 'venn_numbers',
      'category': 'MATH',
      'icon': Icons.vignette_rounded,
      'color': DesignSystem.gamePurple,
      'builder': (context) => const VennNumbersScreen(),
    },
    {
      'title': 'Common Denominator',
      'id': 'common_denominator',
      'category': 'MATH',
      'icon': Icons.calculate_rounded,
      'color': DesignSystem.gameBlue,
      'builder': (context) => const CommonDenominatorScreen(),
    },
    {
      'title': 'Radical Roots',
      'id': 'radical_roots',
      'category': 'MATH',
      'icon': Icons.square_foot_rounded,
      'color': DesignSystem.gameRose,
      'builder': (context) => const RadicalRootsScreen(),
    },
    {
      'title': 'Roman Arithmetic',
      'id': 'roman_arithmetic',
      'category': 'MATH',
      'icon': Icons.account_balance_rounded,
      'color': DesignSystem.gameOrange,
      'builder': (context) => const RomanArithmeticScreen(),
    },
    {
      'title': 'Angle Finder',
      'id': 'angle_finder',
      'category': 'MATH',
      'icon': Icons.architecture_rounded,
      'color': DesignSystem.gameCyan,
      'builder': (context) => const AngleFinderScreen(),
    },
    {
      'title': 'Sum Snake',
      'id': 'sum_snake',
      'category': 'MATH',
      'icon': Icons.gesture_rounded,
      'color': DesignSystem.gameEmerald,
      'builder': (context) => const SumSnakeScreen(),
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
      'title': 'Hitori',
      'id': 'hitori',
      'category': 'LOGIC',
      'icon': Icons.grid_off_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const HitoriScreen(),
    },
    {
      'title': 'Fillomino',
      'id': 'fillomino',
      'category': 'LOGIC',
      'icon': Icons.grid_3x3_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const FillominoScreen(),
    },
    {
      'title': 'Nurikabe',
      'id': 'nurikabe',
      'category': 'LOGIC',
      'icon': Icons.landscape_rounded,
      'color': DesignSystem.gameTeal,
      'builder': (context) => const NurikabeScreen(),
    },
    {
      'title': 'Skyscrapers',
      'id': 'skyscrapers',
      'category': 'LOGIC',
      'icon': Icons.domain_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const SkyscrapersScreen(),
    },
    {
      'title': 'Dominosa',
      'id': 'dominosa',
      'category': 'LOGIC',
      'icon': Icons.view_module_rounded,
      'color': DesignSystem.gameBlue,
      'builder': (context) => const DominosaScreen(),
    },
    {
      'title': 'Lighthouses',
      'id': 'lighthouses',
      'category': 'LOGIC',
      'icon': Icons.light_rounded,
      'color': DesignSystem.gameAmber,
      'builder': (context) => const LighthousesScreen(),
    },
    {
      'title': 'Magnets',
      'id': 'magnets',
      'category': 'LOGIC',
      'icon': Icons.exposure_rounded,
      'color': DesignSystem.gameIndigo,
      'builder': (context) => const MagnetsScreen(),
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
