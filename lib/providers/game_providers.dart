import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/game_data.dart';
import '../providers/user_providers.dart';

part 'game_providers.g.dart';

@riverpod
List<Map<String, dynamic>> filteredGames(FilteredGamesRef ref, {required String searchQuery, required String selectedCategory}) {
  final allGames = GameData.allGamesList; 
  final favoriteIds = ref.watch(userDataNotifierProvider.select((d) => d.favoriteGameIds ?? []));
  
  final filtered = allGames.where((game) {
    final matchesSearch = game['title']
            .toString()
            .toLowerCase()
            .contains(searchQuery.toLowerCase()) ||
        game['category']
            .toString()
            .toLowerCase()
            .contains(searchQuery.toLowerCase());
    final matchesCategory =
        selectedCategory == 'ALL' || game['category'] == selectedCategory;
    return matchesSearch && matchesCategory;
  }).toList();

  const highPopularityIds = {
    'slitherlink',
    'futoshiki',
    'kakuro',
    'akari',
    'magic_squares',
    'kenken',
    'typing_speed',
    'quick_math',
    'math_guess',
    'cryptogram',
    'word_scramble',
    'water_sort',
    'lights_out',
    'hue_sort',
    'bridges',
    'simon_sequence',
    'sudoku',
    'alphabet_sudoku',
    'slide_puzzle',
    'pipes',
    'block_escape',
    'tents_and_trees',
    'crossword',
    'word_search',
    'game_2048',
    'minesweeper',
    'nonogram',
    'schulte_table',
    'chimp_test',
  };

  const lowPopularityIds = {
    'dual_coding',
    'distractor_matrix',
    'temporal_order',
    'silhouette_match_ortho',
    'conjunction_search',
    'spatial_conflict',
    'spotlight_track',
    'd2_attention',
    'mental_calendar',
    'face_trait_association',
    'memory_palace',
    'counting_sheep',
    'mental_mapping',
    'einstein_riddle',
    'lock_pattern',
    'vigilance_task',
    'numerical_estimation',
    'digit_span_reverse',
    'face_name_association',
    'staircase_memory',
    'perspective_taking',
    'paper_folding',
    'verbal_analogies',
    'category_fluency',
    'word_surge',
    'mental_abacus',
    'symbolic_flanker',
    'rule_switcher',
    'letter_cancellation',
    'choice_reaction_time',
    'wisconsin_card_sorting',
    'attentional_blink',
    'change_blindness',
    'visual_statistical_learning',
    'sternberg_task',
    'double_n_back',
    'operation_span',
    'n_back',
    'corsi_blocks',
    'sdmt',
    'trail_making',
    'stop_signal',
    'go_no_go',
    'divided_attention',
    'orbit_tap',
    'rhythm_master',
    'trace_path',
    'reflex_tap',
    'stroop_test',
    'flanker_test',
    'switch_task',
    'odd_rotation',
    'relational_memory',
    'fact_binder',
  };

  int getPriority(String id) {
    if (favoriteIds.contains(id)) return -1;
    if (highPopularityIds.contains(id)) return 0;
    if (lowPopularityIds.contains(id)) return 2;
    return 1;
  }

  filtered.sort((a, b) {
    final aPriority = getPriority(a['id'].toString());
    final bPriority = getPriority(b['id'].toString());
    return aPriority.compareTo(bPriority);
  });

  return filtered;
}
