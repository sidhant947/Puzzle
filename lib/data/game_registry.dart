import 'game_metadata.dart';

import '../ui/features/games/slitherlink/slitherlink_metadata.dart';
import '../ui/features/games/futoshiki/futoshiki_metadata.dart';
import '../ui/features/games/kakuro/kakuro_metadata.dart';
import '../ui/features/games/inequality_dash/inequality_dash_metadata.dart';
import '../ui/features/games/factor_finder/factor_finder_metadata.dart';
import '../ui/features/games/collatz/collatz_metadata.dart';
import '../ui/features/games/base_shift/base_shift_metadata.dart';
import '../ui/features/games/sum_pyramid/sum_pyramid_metadata.dart';
import '../ui/features/games/target_10/target_10_metadata.dart';
import '../ui/features/games/fraction_matcher/fraction_matcher_metadata.dart';
import '../ui/features/games/fibonacci_merge/fibonacci_merge_metadata.dart';
import '../ui/features/games/sequence_sleuth/sequence_sleuth_metadata.dart';
import '../ui/features/games/divisibility_dash/divisibility_dash_metadata.dart';
import '../ui/features/games/percentage_peak/percentage_peak_metadata.dart';
import '../ui/features/games/venn_numbers/venn_numbers_metadata.dart';
import '../ui/features/games/common_denominator/common_denominator_metadata.dart';
import '../ui/features/games/radical_roots/radical_roots_metadata.dart';
import '../ui/features/games/roman_arithmetic/roman_arithmetic_metadata.dart';
import '../ui/features/games/angle_finder/angle_finder_metadata.dart';
import '../ui/features/games/sum_snake/sum_snake_metadata.dart';
import '../ui/features/games/dual_coding/dual_coding_metadata.dart';
import '../ui/features/games/distractor_matrix/distractor_matrix_metadata.dart';
import '../ui/features/games/temporal_order/temporal_order_metadata.dart';
import '../ui/features/games/associative_pairs/associative_pairs_metadata.dart';
import '../ui/features/games/block_count_3d/block_count_3d_metadata.dart';
import '../ui/features/games/cube_net_fold/cube_net_fold_metadata.dart';
import '../ui/features/games/rotating_maze/rotating_maze_metadata.dart';
import '../ui/features/games/classic_maze/classic_maze_metadata.dart';
import '../ui/features/games/silhouette_match_ortho/silhouette_match_ortho_metadata.dart';
import '../ui/features/games/topology/topology_metadata.dart';
import '../ui/features/games/laser_link/laser_link_metadata.dart';
import '../ui/features/games/cross_section_slice/cross_section_slice_metadata.dart';
import '../ui/features/games/shadow_pivot/shadow_pivot_metadata.dart';
import '../ui/features/games/interlock_puzzle/interlock_puzzle_metadata.dart';
import '../ui/features/games/path_intersect/path_intersect_metadata.dart';
import '../ui/features/games/negative_space_detection/negative_space_detection_metadata.dart';
import '../ui/features/games/compass_maze/compass_maze_metadata.dart';
import '../ui/features/games/complex_folding_nets/complex_folding_nets_metadata.dart';
import '../ui/features/games/conjunction_search/conjunction_search_metadata.dart';
import '../ui/features/games/spatial_conflict/spatial_conflict_metadata.dart';
import '../ui/features/games/spotlight_track/spotlight_track_metadata.dart';
import '../ui/features/games/d2_attention/d2_attention_metadata.dart';
import '../ui/features/games/dual_mirror/dual_mirror_metadata.dart';
import '../ui/features/games/context_clues/context_clues_metadata.dart';
import '../ui/features/games/vocabulary_builder/vocabulary_builder_metadata.dart';
import '../ui/features/games/grammar_police/grammar_police_metadata.dart';
import '../ui/features/games/reverse_stroop/reverse_stroop_metadata.dart';
import '../ui/features/games/mental_calendar/mental_calendar_metadata.dart';
import '../ui/features/games/face_trait_association/face_trait_association_metadata.dart';
import '../ui/features/games/memory_palace/memory_palace_metadata.dart';
import '../ui/features/games/counting_sheep/counting_sheep_metadata.dart';
import '../ui/features/games/mental_mapping/mental_mapping_metadata.dart';
import '../ui/features/games/mirror_image/mirror_image_metadata.dart';
import '../ui/features/games/einstein_riddle/einstein_riddle_metadata.dart';
import '../ui/features/games/lock_pattern/lock_pattern_metadata.dart';
import '../ui/features/games/multiple_object_tracking/multiple_object_tracking_metadata.dart';
import '../ui/features/games/vigilance_task/vigilance_task_metadata.dart';
import '../ui/features/games/mental_rotation/mental_rotation_metadata.dart';
import '../ui/features/games/semantic_link/semantic_link_metadata.dart';
import '../ui/features/games/logical_syllogisms/logical_syllogisms_metadata.dart';
import '../ui/features/games/matrix_reasoning/matrix_reasoning_metadata.dart';
import '../ui/features/games/numerical_estimation/numerical_estimation_metadata.dart';
import '../ui/features/games/digit_span_reverse/digit_span_reverse_metadata.dart';
import '../ui/features/games/face_name_association/face_name_association_metadata.dart';
import '../ui/features/games/staircase_memory/staircase_memory_metadata.dart';
import '../ui/features/games/akari/akari_metadata.dart';
import '../ui/features/games/hitori/hitori_metadata.dart';
import '../ui/features/games/fillomino/fillomino_metadata.dart';
import '../ui/features/games/nurikabe/nurikabe_metadata.dart';
import '../ui/features/games/skyscrapers/skyscrapers_metadata.dart';
import '../ui/features/games/dominosa/dominosa_metadata.dart';
import '../ui/features/games/lighthouses/lighthouses_metadata.dart';
import '../ui/features/games/magnets/magnets_metadata.dart';
import '../ui/features/games/perspective_taking/perspective_taking_metadata.dart';
import '../ui/features/games/paper_folding/paper_folding_metadata.dart';
import '../ui/features/games/mirror_tracing/mirror_tracing_metadata.dart';
import '../ui/features/games/silhouette_match/silhouette_match_metadata.dart';
import '../ui/features/games/verbal_analogies/verbal_analogies_metadata.dart';
import '../ui/features/games/category_fluency/category_fluency_metadata.dart';
import '../ui/features/games/word_surge/word_surge_metadata.dart';
import '../ui/features/games/mental_abacus/mental_abacus_metadata.dart';
import '../ui/features/games/missing_operator/missing_operator_metadata.dart';
import '../ui/features/games/tower_of_london/tower_of_london_metadata.dart';
import '../ui/features/games/symbolic_flanker/symbolic_flanker_metadata.dart';
import '../ui/features/games/rule_switcher/rule_switcher_metadata.dart';
import '../ui/features/games/box_completion/box_completion_metadata.dart';
import '../ui/features/games/letter_cancellation/letter_cancellation_metadata.dart';
import '../ui/features/games/choice_reaction_time/choice_reaction_time_metadata.dart';
import '../ui/features/games/wisconsin_card_sorting/wisconsin_card_sorting_metadata.dart';
import '../ui/features/games/attentional_blink/attentional_blink_metadata.dart';
import '../ui/features/games/change_blindness/change_blindness_metadata.dart';
import '../ui/features/games/visual_statistical_learning/visual_statistical_learning_metadata.dart';
import '../ui/features/games/sternberg_task/sternberg_task_metadata.dart';
import '../ui/features/games/double_n_back/double_n_back_metadata.dart';
import '../ui/features/games/operation_span/operation_span_metadata.dart';
import '../ui/features/games/n_back/n_back_metadata.dart';
import '../ui/features/games/corsi_blocks/corsi_blocks_metadata.dart';
import '../ui/features/games/sopt/sopt_metadata.dart';
import '../ui/features/games/continuous_recognition/continuous_recognition_metadata.dart';
import '../ui/features/games/dnms/dnms_metadata.dart';
import '../ui/features/games/symmetry_span/symmetry_span_metadata.dart';
import '../ui/features/games/reading_span/reading_span_metadata.dart';
import '../ui/features/games/counting_span/counting_span_metadata.dart';
import '../ui/features/games/object_displacement/object_displacement_metadata.dart';
import '../ui/features/games/mandala_recall/mandala_recall_metadata.dart';
import '../ui/features/games/running_memory_span/running_memory_span_metadata.dart';
import '../ui/features/games/spatial_cabinet_memory/spatial_cabinet_memory_metadata.dart';
import '../ui/features/games/sdmt/sdmt_metadata.dart';
import '../ui/features/games/trail_making/trail_making_metadata.dart';
import '../ui/features/games/stop_signal/stop_signal_metadata.dart';
import '../ui/features/games/visual_search/visual_search_metadata.dart';
import '../ui/features/games/go_no_go/go_no_go_metadata.dart';
import '../ui/features/games/divided_attention/divided_attention_metadata.dart';
import '../ui/features/games/prime_hunter/prime_hunter_metadata.dart';
import '../ui/features/games/fraction_match/fraction_match_metadata.dart';
import '../ui/features/games/path_recall/path_recall_metadata.dart';
import '../ui/features/games/object_shuffle/object_shuffle_metadata.dart';
import '../ui/features/games/grocery_list/grocery_list_metadata.dart';
import '../ui/features/games/orbit_tap/orbit_tap_metadata.dart';
import '../ui/features/games/rhythm_master/rhythm_master_metadata.dart';
import '../ui/features/games/trace_path/trace_path_metadata.dart';
import '../ui/features/games/target_number/target_number_metadata.dart';
import '../ui/features/games/arithmetic_chain/arithmetic_chain_metadata.dart';
import '../ui/features/games/magic_squares/magic_squares_metadata.dart';
import '../ui/features/games/kenken/kenken_metadata.dart';
import '../ui/features/games/typing_speed/typing_speed_metadata.dart';
import '../ui/features/games/quick_math/quick_math_metadata.dart';
import '../ui/features/games/math_guess/math_guess_metadata.dart';
import '../ui/features/games/reflex_tap/reflex_tap_metadata.dart';
import '../ui/features/games/stroop_test/stroop_test_metadata.dart';
import '../ui/features/games/flanker_test/flanker_test_metadata.dart';
import '../ui/features/games/switch_task/switch_task_metadata.dart';
import '../ui/features/games/cryptogram/cryptogram_metadata.dart';
import '../ui/features/games/balance_scale/balance_scale_metadata.dart';
import '../ui/features/games/symbol_logic/symbol_logic_metadata.dart';
import '../ui/features/games/pixel_mimic/pixel_mimic_metadata.dart';
import '../ui/features/games/odd_rotation/odd_rotation_metadata.dart';
import '../ui/features/games/word_scramble/word_scramble_metadata.dart';
import '../ui/features/games/missing_vowels/missing_vowels_metadata.dart';
import '../ui/features/games/water_sort/water_sort_metadata.dart';
import '../ui/features/games/lights_out/lights_out_metadata.dart';
import '../ui/features/games/hue_sort/hue_sort_metadata.dart';
import '../ui/features/games/math_path/math_path_metadata.dart';
import '../ui/features/games/spelling_sprint/spelling_sprint_metadata.dart';
import '../ui/features/games/odd_one_out/odd_one_out_metadata.dart';
import '../ui/features/games/bridges/bridges_metadata.dart';
import '../ui/features/games/binary_puzzle/binary_puzzle_metadata.dart';
import '../ui/features/games/color_match/color_match_metadata.dart';
import '../ui/features/games/path_finder/path_finder_metadata.dart';
import '../ui/features/games/simon_sequence/simon_sequence_metadata.dart';
import '../ui/features/games/symmetry/symmetry_metadata.dart';
import '../ui/features/games/sudoku/sudoku_metadata.dart';
import '../ui/features/games/alphabet_sudoku/alphabet_sudoku_metadata.dart';
import '../ui/features/games/word_mastermind/word_mastermind_metadata.dart';
import '../ui/features/games/word_ladder/word_ladder_metadata.dart';
import '../ui/features/games/slide_puzzle/slide_puzzle_metadata.dart';
import '../ui/features/games/pipes/pipes_metadata.dart';
import '../ui/features/games/block_escape/block_escape_metadata.dart';
import '../ui/features/games/tents_and_trees/tents_and_trees_metadata.dart';
import '../ui/features/games/find_word/find_word_metadata.dart';
import '../ui/features/games/crossword/crossword_metadata.dart';
import '../ui/features/games/word_search/word_search_metadata.dart';
import '../ui/features/games/game_2048/game_2048_metadata.dart';
import '../ui/features/games/crown/crown_metadata.dart';
import '../ui/features/games/minesweeper/minesweeper_metadata.dart';
import '../ui/features/games/memory_matrix/memory_matrix_metadata.dart';
import '../ui/features/games/nonogram/nonogram_metadata.dart';
import '../ui/features/games/schulte_table/schulte_table_metadata.dart';
import '../ui/features/games/calculation_sprint/calculation_sprint_metadata.dart';
import '../ui/features/games/color_flood/color_flood_metadata.dart';
import '../ui/features/games/tangle_fix/tangle_fix_metadata.dart';
import '../ui/features/games/simon_command/simon_command_metadata.dart';
import '../ui/features/games/binary_code/binary_code_metadata.dart';
import '../ui/features/games/modulo_clock/modulo_clock_metadata.dart';
import '../ui/features/games/chimp_test/chimp_test_metadata.dart';
import '../ui/features/games/relational_memory/relational_memory_metadata.dart';
import '../ui/features/games/fact_binder/fact_binder_metadata.dart';
import '../ui/features/games/source_monitoring/source_monitoring_metadata.dart';
import '../ui/features/games/klotski/klotski_metadata.dart';
import '../ui/features/games/semantic_distance/semantic_distance_metadata.dart';
import '../ui/features/games/oxymoron_hunt/oxymoron_hunt_metadata.dart';
import '../ui/features/games/portmanteau_split/portmanteau_split_metadata.dart';
import '../ui/features/games/chain_reaction/chain_reaction_metadata.dart';
import '../ui/features/games/rhyme_master/rhyme_master_metadata.dart';
import '../ui/features/games/definition_dash/definition_dash_metadata.dart';
import '../ui/features/games/syllable_stack/syllable_stack_metadata.dart';
import '../ui/features/games/sentence_unscramble/sentence_unscramble_metadata.dart';
import '../ui/features/games/grammar_sort/grammar_sort_metadata.dart';
import '../ui/features/games/vowel_reconstruct/vowel_reconstruct_metadata.dart';
import '../ui/features/games/consonant_reconstruct/consonant_reconstruct_metadata.dart';
import '../ui/features/games/homophone_hunt/homophone_hunt_metadata.dart';
import '../ui/features/games/silent_letter_search/silent_letter_search_metadata.dart';
import '../ui/features/games/palindrome_builder/palindrome_builder_metadata.dart';
import '../ui/features/games/phonetic_guess/phonetic_guess_metadata.dart';
import '../ui/features/games/spoonerism_solver/spoonerism_solver_metadata.dart';
import '../ui/features/games/etymon_oddball/etymon_oddball_metadata.dart';
import '../ui/features/games/etymology_origin/etymology_origin_metadata.dart';
import '../ui/features/games/affix_factory/affix_factory_metadata.dart';
import '../ui/features/games/cognate_catch/cognate_catch_metadata.dart';
import '../ui/features/games/compound_connect/compound_connect_metadata.dart';
import '../ui/features/games/pangram_sprint/pangram_sprint_metadata.dart';
import '../ui/features/games/anagram_definition/anagram_definition_metadata.dart';
import '../ui/features/games/letter_bridge/letter_bridge_metadata.dart';
import '../ui/features/games/letter_frequency_scan/letter_frequency_scan_metadata.dart';
import '../ui/features/games/one_letter_shift/one_letter_shift_metadata.dart';

final List<GameMetadata> allGamesMetadata = [
  slitherlinkMetadata,
  futoshikiMetadata,
  kakuroMetadata,
  inequalityDashMetadata,
  factorFinderMetadata,
  collatzMetadata,
  baseShiftMetadata,
  sumPyramidMetadata,
  target_10Metadata,
  fractionMatcherMetadata,
  fibonacciMergeMetadata,
  sequenceSleuthMetadata,
  divisibilityDashMetadata,
  percentagePeakMetadata,
  vennNumbersMetadata,
  commonDenominatorMetadata,
  radicalRootsMetadata,
  romanArithmeticMetadata,
  angleFinderMetadata,
  sumSnakeMetadata,
  dualCodingMetadata,
  distractorMatrixMetadata,
  temporalOrderMetadata,
  associativePairsMetadata,
  blockCount_3dMetadata,
  cubeNetFoldMetadata,
  rotatingMazeMetadata,
  classicMazeMetadata,
  silhouetteMatchOrthoMetadata,
  topologyMetadata,
  laserLinkMetadata,
  crossSectionSliceMetadata,
  shadowPivotMetadata,
  interlockPuzzleMetadata,
  pathIntersectMetadata,
  negativeSpaceDetectionMetadata,
  compassMazeMetadata,
  complexFoldingNetsMetadata,
  conjunctionSearchMetadata,
  spatialConflictMetadata,
  spotlightTrackMetadata,
  d2AttentionMetadata,
  dualMirrorMetadata,
  contextCluesMetadata,
  vocabularyBuilderMetadata,
  grammarPoliceMetadata,
  reverseStroopMetadata,
  mentalCalendarMetadata,
  faceTraitAssociationMetadata,
  memoryPalaceMetadata,
  countingSheepMetadata,
  mentalMappingMetadata,
  mirrorImageMetadata,
  einsteinRiddleMetadata,
  lockPatternMetadata,
  multipleObjectTrackingMetadata,
  vigilanceTaskMetadata,
  mentalRotationMetadata,
  semanticLinkMetadata,
  logicalSyllogismsMetadata,
  matrixReasoningMetadata,
  numericalEstimationMetadata,
  digitSpanReverseMetadata,
  faceNameAssociationMetadata,
  staircaseMemoryMetadata,
  akariMetadata,
  hitoriMetadata,
  fillominoMetadata,
  nurikabeMetadata,
  skyscrapersMetadata,
  dominosaMetadata,
  lighthousesMetadata,
  magnetsMetadata,
  perspectiveTakingMetadata,
  paperFoldingMetadata,
  mirrorTracingMetadata,
  silhouetteMatchMetadata,
  verbalAnalogiesMetadata,
  categoryFluencyMetadata,
  wordSurgeMetadata,
  mentalAbacusMetadata,
  missingOperatorMetadata,
  towerOfLondonMetadata,
  symbolicFlankerMetadata,
  ruleSwitcherMetadata,
  boxCompletionMetadata,
  letterCancellationMetadata,
  choiceReactionTimeMetadata,
  wisconsinCardSortingMetadata,
  attentionalBlinkMetadata,
  changeBlindnessMetadata,
  visualStatisticalLearningMetadata,
  sternbergTaskMetadata,
  doubleNBackMetadata,
  operationSpanMetadata,
  nBackMetadata,
  corsiBlocksMetadata,
  soptMetadata,
  continuousRecognitionMetadata,
  dnmsMetadata,
  symmetrySpanMetadata,
  readingSpanMetadata,
  countingSpanMetadata,
  objectDisplacementMetadata,
  mandalaRecallMetadata,
  runningMemorySpanMetadata,
  spatialCabinetMemoryMetadata,
  sdmtMetadata,
  trailMakingMetadata,
  stopSignalMetadata,
  visualSearchMetadata,
  goNoGoMetadata,
  dividedAttentionMetadata,
  primeHunterMetadata,
  fractionMatchMetadata,
  pathRecallMetadata,
  objectShuffleMetadata,
  groceryListMetadata,
  orbitTapMetadata,
  rhythmMasterMetadata,
  tracePathMetadata,
  targetNumberMetadata,
  arithmeticChainMetadata,
  magicSquaresMetadata,
  kenkenMetadata,
  typingSpeedMetadata,
  quickMathMetadata,
  mathGuessMetadata,
  reflexTapMetadata,
  stroopTestMetadata,
  flankerTestMetadata,
  switchTaskMetadata,
  cryptogramMetadata,
  balanceScaleMetadata,
  symbolLogicMetadata,
  pixelMimicMetadata,
  oddRotationMetadata,
  wordScrambleMetadata,
  missingVowelsMetadata,
  waterSortMetadata,
  lightsOutMetadata,
  hueSortMetadata,
  mathPathMetadata,
  spellingSprintMetadata,
  oddOneOutMetadata,
  bridgesMetadata,
  binaryPuzzleMetadata,
  colorMatchMetadata,
  pathFinderMetadata,
  simonSequenceMetadata,
  symmetryMetadata,
  sudokuMetadata,
  alphabetSudokuMetadata,
  wordMastermindMetadata,
  wordLadderMetadata,
  slidePuzzleMetadata,
  pipesMetadata,
  blockEscapeMetadata,
  tentsAndTreesMetadata,
  findWordMetadata,
  crosswordMetadata,
  wordSearchMetadata,
  game_2048Metadata,
  crownMetadata,
  minesweeperMetadata,
  memoryMatrixMetadata,
  nonogramMetadata,
  schulteTableMetadata,
  calculationSprintMetadata,
  colorFloodMetadata,
  tangleFixMetadata,
  simonCommandMetadata,
  binaryCodeMetadata,
  moduloClockMetadata,
  chimpTestMetadata,
  relationalMemoryMetadata,
  factBinderMetadata,
  sourceMonitoringMetadata,
  klotskiMetadata,
  semanticDistanceMetadata,
  oxymoronHuntMetadata,
  portmanteauSplitMetadata,
  chainReactionMetadata,
  rhymeMasterMetadata,
  definitionDashMetadata,
  syllableStackMetadata,
  sentenceUnscrambleMetadata,
  grammarSortMetadata,
  vowelReconstructMetadata,
  consonantReconstructMetadata,
  homophoneHuntMetadata,
  silentLetterSearchMetadata,
  palindromeBuilderMetadata,
  phoneticGuessMetadata,
  spoonerismSolverMetadata,
  etymonOddballMetadata,
  etymologyOriginMetadata,
  affixFactoryMetadata,
  cognateCatchMetadata,
  compoundConnectMetadata,
  pangramSprintMetadata,
  anagramDefinitionMetadata,
  letterBridgeMetadata,
  letterFrequencyScanMetadata,
  oneLetterShiftMetadata,
];
