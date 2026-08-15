import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class WordConnectionCategory {
  final String title;
  final List<String> words;
  final Color color;

  WordConnectionCategory({required this.title, required this.words, required this.color});
}

class WordGridConnectionScreen extends ConsumerStatefulWidget {
  const WordGridConnectionScreen({super.key});

  @override
  ConsumerState<WordGridConnectionScreen> createState() => _WordGridConnectionScreenState();
}

class _WordGridConnectionScreenState extends ConsumerState<WordGridConnectionScreen> {
  final Random _random = Random();

  final List<WordConnectionCategory> _categoryPool = [
    WordConnectionCategory(title: 'FRUITS', words: ['APPLE', 'PEAR', 'PEACH', 'PLUM', 'ORANGE', 'BANANA', 'CHERRY', 'GRAPE'], color: DesignSystem.gameGreen),
    WordConnectionCategory(title: 'PLANETS', words: ['MARS', 'VENUS', 'SATURN', 'JUPITER', 'URANUS', 'NEPTUNE', 'MERCURY', 'EARTH'], color: DesignSystem.gameBlue),
    WordConnectionCategory(title: 'FURNITURE', words: ['DESK', 'CHAIR', 'SOFA', 'BED', 'TABLE', 'CABINET', 'DRESSER', 'BENCH'], color: DesignSystem.gamePurple),
    WordConnectionCategory(title: 'METALS', words: ['GOLD', 'SILVER', 'IRON', 'COPPER', 'BRONZE', 'PLATINUM', 'ZINC', 'LEAD'], color: DesignSystem.gameOrange),
    WordConnectionCategory(title: 'ANIMALS', words: ['LION', 'TIGER', 'PANDA', 'ZEBRA', 'HIPPO', 'KOALA', 'MONKEY', 'RABBIT'], color: DesignSystem.gameGreen),
    WordConnectionCategory(title: 'COLORS', words: ['RED', 'BLUE', 'GREEN', 'YELLOW', 'ORANGE', 'PURPLE', 'PINK', 'BROWN'], color: DesignSystem.gameBlue),
    WordConnectionCategory(title: 'VEHICLES', words: ['CAR', 'BUS', 'TRAIN', 'PLANE', 'BOAT', 'TRUCK', 'BIKE', 'SUBWAY'], color: DesignSystem.gamePurple),
    WordConnectionCategory(title: 'WEATHER', words: ['RAIN', 'SNOW', 'WIND', 'CLOUD', 'STORM', 'SUNNY', 'FOG', 'HAIL'], color: DesignSystem.gameOrange),
    WordConnectionCategory(title: 'JOBS', words: ['DOCTOR', 'NURSE', 'TEACHER', 'CHEF', 'PILOT', 'ARTIST', 'WRITER', 'ACTOR'], color: DesignSystem.gameGreen),
    WordConnectionCategory(title: 'CLOTHES', words: ['SHIRT', 'PANTS', 'JACKET', 'DRESS', 'SHOES', 'SOCKS', 'HAT', 'COAT'], color: DesignSystem.gameBlue),
    WordConnectionCategory(title: 'KITCHEN', words: ['SPOON', 'FORK', 'KNIFE', 'PLATE', 'BOWL', 'CUP', 'PAN', 'POT'], color: DesignSystem.gamePurple),
    WordConnectionCategory(title: 'OCEAN', words: ['SHARK', 'WHALE', 'DOLPHIN', 'OCTOPUS', 'CRAB', 'FISH', 'CORAL', 'SHELL'], color: DesignSystem.gameOrange),
  ];

  late List<WordConnectionCategory> _activeCategories;

  // Game state
  List<String> _scrambledWords = [];
  final List<String> _selectedWords = [];
  final List<WordConnectionCategory> _solvedCategories = [];
  int _triesRemaining = 4;
  bool _isGameOver = false;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _solvedCategories.clear();
    _selectedWords.clear();
    _triesRemaining = 4;
    _isGameOver = false;

    final shuffledPool = List<WordConnectionCategory>.from(_categoryPool)..shuffle(_random);

    _activeCategories = [];
    final words = <String>[];
    
    final colors = [
      DesignSystem.gameGreen,
      DesignSystem.gameBlue,
      DesignSystem.gamePurple,
      DesignSystem.gameOrange,
    ];

    for (var poolCat in shuffledPool) {
      if (_activeCategories.length == 4) break;

      final catWords = List<String>.from(poolCat.words)..shuffle(_random);
      final availableWords = catWords.where((w) => !words.contains(w)).toList();

      if (availableWords.length >= 4) {
        final activeWords = availableWords.sublist(0, 4);
        final activeCat = WordConnectionCategory(
          title: poolCat.title,
          words: activeWords,
          color: colors[_activeCategories.length],
        );
        _activeCategories.add(activeCat);
        words.addAll(activeWords);
      }
    }

    _scrambledWords = words..shuffle(_random);
  }

  void _onWordTapped(String word) {
    if (_isGameOver || _isSolved(word)) return;

    HapticFeedbackUtil.lightImpact();
    setState(() {
      if (_selectedWords.contains(word)) {
        _selectedWords.remove(word);
      } else {
        if (_selectedWords.length < 4) {
          _selectedWords.add(word);
        }
      }
    });
  }

  bool _isSolved(String word) {
    for (var cat in _solvedCategories) {
      if (cat.words.contains(word)) return true;
    }
    return false;
  }

  void _onSubmitGroup() {
    if (_selectedWords.length != 4 || _isGameOver) return;

    // Check which category this selection matches
    WordConnectionCategory? matchedCategory;
    for (var cat in _activeCategories) {
      if (cat.words.every((w) => _selectedWords.contains(w))) {
        matchedCategory = cat;
        break;
      }
    }

    if (matchedCategory != null) {
      HapticFeedbackUtil.success();
      setState(() {
        _solvedCategories.add(matchedCategory!);
        _selectedWords.clear();

        // Check win condition
        if (_solvedCategories.length == 4) {
          _isGameOver = true;
          _onGameComplete();
        }
      });
    } else {
      HapticFeedbackUtil.error();
      setState(() {
        _triesRemaining--;
        _selectedWords.clear();

        if (_triesRemaining <= 0) {
          _isGameOver = true;
          _onGameOver();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppLocalizations.of(context)!.snackbarIncorrectGroup(_triesRemaining)),
              duration: const Duration(seconds: 1),
            ),
          );
        }
      });
    }
  }

  void _onGameOver() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.gameOver),
        content: Text(AppLocalizations.of(context)!.loseTryAgainSolution),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _generatePuzzle();
              });
            },
            child: Text(AppLocalizations.of(context)!.playAgain),
          ),
        ],
      ),
    );
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('word_grid_connection');
    if (!mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: AppLocalizations.of(context)!.wellDone.toUpperCase(),
        message: AppLocalizations.of(context)!.completed,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          setState(() {
            _generatePuzzle();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Filter words that are not solved yet
    final remainingWords = _scrambledWords.where((w) => !_isSolved(w)).toList();

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'word_grid_connection'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'word_grid_connection'),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            setState(() {
              _generatePuzzle();
            });
          },
        ),
      ],
      body: Padding(
        padding: const EdgeInsets.all(DesignSystem.spaceMD),
        child: Column(
          children: [
            // Status bar (Tries & Solved categories banners)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'Tries remaining: $_triesRemaining',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: DesignSystem.primary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                  ),
                  child: Text(
                    'Solved: ${_solvedCategories.length} / 4',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: DesignSystem.primary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Solved categories list
            Column(
              children: _solvedCategories.map((cat) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: cat.color.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                    border: Border.all(color: cat.color, width: 1.5),
                  ),
                  child: Column(
                    children: [
                      Text(
                        cat.title,
                        style: TextStyle(fontWeight: FontWeight.bold, color: cat.color, fontSize: 13),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        cat.words.join(', '),
                        style: TextStyle(fontWeight: FontWeight.w600, color: isDark ? Colors.white : Colors.black87),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            // Word Grid (remaining ones)
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.1,
                ),
                itemCount: remainingWords.length,
                itemBuilder: (context, idx) {
                  final word = remainingWords[idx];
                  final isSelected = _selectedWords.contains(word);

                  return GestureDetector(
                    onTap: () => _onWordTapped(word),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? DesignSystem.primary.withValues(alpha: 0.2)
                            : (isDark ? DesignSystem.darkSurface : DesignSystem.surface),
                        borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                        border: Border.all(
                          color: isSelected
                              ? DesignSystem.primary
                              : (isDark ? DesignSystem.darkOutline : DesignSystem.outline),
                          width: 2,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        word,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: isSelected ? DesignSystem.primary : null,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Submit Button
            if (_selectedWords.length == 4)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _onSubmitGroup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DesignSystem.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                      ),
                    ),
                    child: Text(AppLocalizations.of(context)!.btnSubmitGroup, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
