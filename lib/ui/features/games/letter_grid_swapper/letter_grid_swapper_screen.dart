import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class LetterGridSwapperScreen extends ConsumerStatefulWidget {
  const LetterGridSwapperScreen({super.key});

  @override
  ConsumerState<LetterGridSwapperScreen> createState() => _LetterGridSwapperScreenState();
}

class _LetterGridSwapperScreenState extends ConsumerState<LetterGridSwapperScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 3;
  bool _isGameOver = false;

  late List<String> _targetWords;
  late List<String> _grid; // 9 letters in 1D list representing 3x3 grid
  int? _selectedTileIndex;

  final List<List<String>> _wordSets = [
    ['CAT', 'DOG', 'SUN'],
    ['RED', 'BOX', 'FLY'],
    ['SKY', 'MAP', 'HAT'],
    ['CUP', 'PEN', 'WET'],
    ['ICE', 'RUN', 'TOY'],
  ];

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _targetWords = _wordSets[_random.nextInt(_wordSets.length)];
    // Build letters
    final letters = _targetWords.join('').split('');

    // Perform random swaps to jumble
    _grid = List<String>.from(letters);
    int swapCount = 0;
    while (swapCount < 4) {
      final i1 = _random.nextInt(9);
      final i2 = _random.nextInt(9);
      if (i1 != i2 && _isAdjacent(i1, i2)) {
        final temp = _grid[i1];
        _grid[i1] = _grid[i2];
        _grid[i2] = temp;
        swapCount++;
      }
    }

    // Ensure it's not solved by chance
    if (_checkSolvedState()) {
      _generatePuzzle();
    } else {
      _selectedTileIndex = null;
    }
  }

  bool _isAdjacent(int i1, int i2) {
    final r1 = i1 ~/ 3;
    final c1 = i1 % 3;
    final r2 = i2 ~/ 3;
    final c2 = i2 % 3;
    return (r1 == r2 && (c1 - c2).abs() == 1) || (c1 == c2 && (r1 - r2).abs() == 1);
  }

  void _handleTileTap(int index) {
    if (_isGameOver) return;

    if (_selectedTileIndex == null) {
      HapticFeedbackUtil.lightImpact();
      setState(() {
        _selectedTileIndex = index;
      });
    } else {
      final prevIndex = _selectedTileIndex!;
      if (prevIndex == index) {
        // Deselect
        setState(() {
          _selectedTileIndex = null;
        });
      } else if (_isAdjacent(prevIndex, index)) {
        // Swap adjacent tiles
        HapticFeedbackUtil.mediumImpact();
        setState(() {
          final temp = _grid[prevIndex];
          _grid[prevIndex] = _grid[index];
          _grid[index] = temp;
          _selectedTileIndex = null;
        });

        // Check if solved
        if (_checkSolvedState()) {
          HapticFeedbackUtil.success();
          setState(() {
            _score++;
            if (_score >= _targetScore) {
              _isGameOver = true;
              _onGameComplete();
            } else {
              _generatePuzzle();
            }
          });
        }
      } else {
        // Select new tile instead
        HapticFeedbackUtil.lightImpact();
        setState(() {
          _selectedTileIndex = index;
        });
      }
    }
  }

  bool _checkSolvedState() {
    final row0 = _grid.sublist(0, 3).join('');
    final row1 = _grid.sublist(3, 6).join('');
    final row2 = _grid.sublist(6, 9).join('');

    return row0 == _targetWords[0] && row1 == _targetWords[1] && row2 == _targetWords[2];
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('letter_grid_swapper');
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
            _score = 0;
            _isGameOver = false;
            _generatePuzzle();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: 'LETTER SWAPPER',
      subtitle: 'Swap adjacent letters to form the target words in rows.',
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            setState(() {
              _score = 0;
              _isGameOver = false;
              _generatePuzzle();
            });
          },
        ),
      ],
      body: Padding(
        padding: const EdgeInsets.all(DesignSystem.spaceMD),
        child: Column(
          children: [
            // Target words panel
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: DesignSystem.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'TARGET WORDS:',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        _targetWords.join('  •  '),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: DesignSystem.gameOrange,
                            ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: DesignSystem.primary.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                    ),
                    child: Text(
                      'Score: $_score / $_targetScore',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: DesignSystem.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // The Grid
            Expanded(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                      borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                      border: Border.all(
                        color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                        width: 2,
                      ),
                    ),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        final isSelected = _selectedTileIndex == index;
                        final letter = _grid[index];

                        return GestureDetector(
                          onTap: () => _handleTileTap(index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? DesignSystem.gameOrange.withOpacity(0.2)
                                  : (isDark ? Colors.grey[900] : Colors.grey[100]),
                              borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                              border: Border.all(
                                color: isSelected
                                    ? DesignSystem.gameOrange
                                    : (isDark ? Colors.white10 : Colors.black.withValues(alpha: 0.1)),
                                width: isSelected ? 3.0 : 1.5,
                              ),
                              boxShadow: isSelected
                                  ? [BoxShadow(color: DesignSystem.gameOrange.withOpacity(0.3), blurRadius: 6)]
                                  : null,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              letter,
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? DesignSystem.gameOrange
                                    : (isDark ? Colors.white : Colors.black87),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
