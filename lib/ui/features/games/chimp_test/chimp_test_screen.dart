import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class ChimpTestScreen extends ConsumerStatefulWidget {
  const ChimpTestScreen({super.key});

  @override
  ConsumerState<ChimpTestScreen> createState() => _ChimpTestScreenState();
}

class _ChimpTestScreenState extends ConsumerState<ChimpTestScreen> {
  final Random _random = Random();
  static const int gridSize = 4;
  
  int _round = 1;
  static const int totalRounds = 3;
  int _lives = 3;
  
  // Grid layout representation: index corresponds to cell position (0 to 15)
  // Value at index holds the number shown (1 to 9), or 0 if empty
  late List<int> _grid;
  
  bool _numbersCovered = false;
  int _nextExpectedNumber = 1;
  final List<int> _correctlyTappedList = [];

  @override
  void initState() {
    super.initState();
    _startRound();
  }

  void _startRound() {
    setState(() {
      _grid = List.filled(gridSize * gridSize, 0);
      _numbersCovered = false;
      _nextExpectedNumber = 1;
      _correctlyTappedList.clear();

      // Place numbers 1 to 9 randomly on the grid
      final Set<int> positions = {};
      while (positions.length < 9) {
        positions.add(_random.nextInt(gridSize * gridSize));
      }

      final posList = positions.toList();
      for (int i = 0; i < 9; i++) {
        _grid[posList[i]] = i + 1; // Numbers 1 to 9
      }
    });
  }

  void _onCellTapped(int index) {
    final number = _grid[index];
    if (number == 0 || _correctlyTappedList.contains(number)) return;

    if (number == _nextExpectedNumber) {
      HapticFeedbackUtil.lightImpact();
      setState(() {
        _correctlyTappedList.add(number);
        _nextExpectedNumber++;
        
        // As soon as 1 is tapped, cover all numbers
        if (number == 1) {
          _numbersCovered = true;
        }
      });

      // Tapped all 9 correctly
      if (_correctlyTappedList.length == 9) {
        HapticFeedbackUtil.success();
        if (_round < totalRounds) {
          setState(() {
            _round++;
          });
          _startRound();
        } else {
          _gameComplete(true);
        }
      }
    } else {
      // Wrong tap
      HapticFeedbackUtil.error();
      setState(() {
        _lives--;
      });

      if (_lives <= 0) {
        _gameComplete(false);
      } else {
        _startRound(); // reset round
      }
    }
  }

  void _gameComplete(bool isVictory) {
    if (isVictory) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('chimp_test', xpAmount: 30);
    }
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? "CHIMP TEST ACED" : "TEST FAILED",
        message: isVictory 
            ? "Sensational working memory span! You equal chimpanzee levels of cognitive recall."
            : "You lost all lives. Keep training to scale up your memory grid capacity!",
        isVictory: isVictory,
        onHome: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
        onPlayAgain: () {
          Navigator.pop(context);
          setState(() {
            _round = 1;
            _lives = 3;
          });
          _startRound();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GameScaffold(
      title: "CHIMP TEST",
      subtitle: "MEMORIZE THE NUMBERS. TAPPING '1' COVERS THE TILES. SELECT IN ASCENDING ORDER.",
      body: LayoutBuilder(
        builder: (context, constraints) {
          final boardSize = min(constraints.maxWidth, constraints.maxHeight) * 0.85;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
            child: Column(
              children: [
                const SizedBox(height: DesignSystem.spaceLG),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ROUND: $_round / $totalRounds",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Row(
                      children: List.generate(3, (index) {
                        return Icon(
                          index < _lives ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                          color: DesignSystem.error,
                          size: 24,
                        );
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: DesignSystem.spaceLG),
                
                // Grid Board
                Expanded(
                  child: Center(
                    child: SizedBox(
                      width: boardSize,
                      height: boardSize,
                      child: TangibleContainer(
                        color: colorScheme.outline,
                        radius: DesignSystem.radiusMD,
                        padding: const EdgeInsets.all(DesignSystem.spaceXS),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: gridSize,
                            crossAxisSpacing: DesignSystem.spaceXS,
                            mainAxisSpacing: DesignSystem.spaceXS,
                          ),
                          itemCount: gridSize * gridSize,
                          itemBuilder: (context, index) {
                            final number = _grid[index];
                            final hasNumber = number > 0;
                            final isTapped = _correctlyTappedList.contains(number);
                            
                            // Display logic:
                            // If tapped, empty cell.
                            // If covered and has number, show blank active tile.
                            // If not covered and has number, show number.
                            final shouldShowNumber = hasNumber && !_numbersCovered && !isTapped;
                            final shouldShowCover = hasNumber && _numbersCovered && !isTapped;

                            return GestureDetector(
                              onTap: hasNumber ? () => _onCellTapped(index) : null,
                              child: TangibleContainer(
                                radius: DesignSystem.radiusSM,
                                depth: (shouldShowCover || shouldShowNumber) ? 2.0 : 0.0,
                                color: (shouldShowCover || shouldShowNumber)
                                    ? colorScheme.surface
                                    : colorScheme.outline.withValues(alpha: 0.2),
                                shadowColor: (shouldShowCover || shouldShowNumber)
                                    ? colorScheme.outline
                                    : Colors.transparent,
                                child: Center(
                                  child: shouldShowNumber
                                      ? Text(
                                          "$number",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900,
                                            color: colorScheme.onSurface,
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: DesignSystem.spaceLG),
              ],
            ),
          );
        },
      ),
    );
  }
}
