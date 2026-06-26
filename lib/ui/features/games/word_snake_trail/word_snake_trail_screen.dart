import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class WordSnakeTrailScreen extends ConsumerStatefulWidget {
  const WordSnakeTrailScreen({super.key});

  @override
  ConsumerState<WordSnakeTrailScreen> createState() => _WordSnakeTrailScreenState();
}

class _WordSnakeTrailScreenState extends ConsumerState<WordSnakeTrailScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 3;
  bool _isGameOver = false;

  final int _gridSize = 4;
  late List<List<String>> _grid;

  // The secret word trail (sequential cell coordinates)
  late List<Point<int>> _secretTrail;
  late String _secretWord;
  final List<Point<int>> _userTrail = [];

  final List<String> _wordsPool = [
    'BLUE', 'ROSE', 'PINE', 'DESK', 'STAR', 'FISH', 'PLAN', 'WIND', 'GOLD', 'LION'
  ];

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _userTrail.clear();
    _secretWord = _wordsPool[_random.nextInt(_wordsPool.length)];

    // Generate grid matrix filled with random letters
    _grid = List.generate(_gridSize, (_) => List.generate(_gridSize, (_) {
      return String.fromCharCode(65 + _random.nextInt(26)); // Random A-Z
    }));

    // Inject secret word trail sequence of cells (random walk)
    int cx = _random.nextInt(_gridSize);
    int cy = _random.nextInt(_gridSize);
    _secretTrail = [Point(cx, cy)];
    _grid[cy][cx] = _secretWord[0];

    for (int i = 1; i < _secretWord.length; i++) {
      final neighbors = <Point<int>>[];
      if (cx > 0) neighbors.add(Point(cx - 1, cy));
      if (cx < _gridSize - 1) neighbors.add(Point(cx + 1, cy));
      if (cy > 0) neighbors.add(Point(cx, cy - 1));
      if (cy < _gridSize - 1) neighbors.add(Point(cx, cy + 1));

      // Exclude already visited coordinates in secret trail if possible
      final unvisited = neighbors.where((pt) => !_secretTrail.contains(pt)).toList();
      final targetPoint = unvisited.isNotEmpty
          ? unvisited[_random.nextInt(unvisited.length)]
          : neighbors[_random.nextInt(neighbors.length)];

      cx = targetPoint.x;
      cy = targetPoint.y;
      _secretTrail.add(targetPoint);
      _grid[cy][cx] = _secretWord[i];
    }
  }

  void _onCellTapped(int r, int c) {
    if (_isGameOver) return;

    final cellPoint = Point(c, r);
    final expectedIndex = _userTrail.length;

    // Check if cell corresponds to the next letter in the secret trail
    if (expectedIndex < _secretTrail.length && _secretTrail[expectedIndex] == cellPoint) {
      HapticFeedbackUtil.lightImpact();
      setState(() {
        _userTrail.add(cellPoint);

        // Check if full word trail successfully traced
        if (_userTrail.length == _secretTrail.length) {
          _score++;
          HapticFeedbackUtil.success();
          if (_score >= _targetScore) {
            _isGameOver = true;
            _onGameComplete();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Word matched! Tracing next word...'),
                backgroundColor: DesignSystem.gameGreen,
                duration: Duration(seconds: 1),
              ),
            );
            setState(() {
              _generatePuzzle();
            });
          }
        }
      });
    } else {
      HapticFeedbackUtil.error();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect sequence! Try tracing from the start cell.'),
          backgroundColor: DesignSystem.error,
          duration: Duration(milliseconds: 600),
        ),
      );
      setState(() {
        _userTrail.clear();
      });
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('word_snake_trail');
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
      title: 'WORD SNAKE',
      subtitle: 'Locate and trace the letters of the target word in a continuous connecting path.',
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
            // Score and Target info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: DesignSystem.primary.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                  ),
                  child: Text(
                    'TARGET WORD: $_secretWord',
                    style: TextStyle(fontWeight: FontWeight.bold, color: DesignSystem.primary, fontSize: 16),
                  ),
                ),
                Text(
                  'Score: $_score / $_targetScore',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // The trace grid
            Expanded(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                      border: Border.all(
                        color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                        width: 2,
                      ),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: 16,
                      itemBuilder: (context, idx) {
                        final r = idx ~/ 4;
                        final c = idx % 4;
                        final cellPoint = Point(c, r);
                        final isTraced = _userTrail.contains(cellPoint);

                        return GestureDetector(
                          onTap: () => _onCellTapped(r, c),
                          child: Container(
                            decoration: BoxDecoration(
                              color: isTraced
                                  ? DesignSystem.gameGreen.withOpacity(0.2)
                                  : (isDark ? Colors.white10 : Colors.grey[100]),
                              borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                              border: Border.all(
                                color: isTraced ? DesignSystem.gameGreen : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              _grid[r][c],
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: isTraced ? DesignSystem.gameGreen : null,
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
            const SizedBox(height: 20),
            // Trail Progress Tracker
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_secretWord.length, (idx) {
                final active = _userTrail.length > idx;
                return Container(
                  width: 14,
                  height: 14,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: active ? DesignSystem.gameGreen : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
