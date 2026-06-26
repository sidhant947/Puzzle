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

class DualTaskMemoryScreen extends ConsumerStatefulWidget {
  const DualTaskMemoryScreen({super.key});

  @override
  ConsumerState<DualTaskMemoryScreen> createState() => _DualTaskMemoryScreenState();
}

class _DualTaskMemoryScreenState extends ConsumerState<DualTaskMemoryScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 3;
  bool _isGameOver = false;

  // Game flow:
  // 1. Memorize 4 words (study mode)
  // 2. Distractor stage: Solve 2 quick math questions
  // 3. Recall mode: Multi-selection grid of words (select the original 4 words)
  int _gamePhase = 1; // 1 = Study, 2 = Math, 3 = Recall

  final List<String> _wordsPool = [
    'Apple', 'Banana', 'Carrot', 'Doctor', 'Elephant', 'Falcon', 'Giraffe', 'Helicopter',
    'Igloo', 'Jacket', 'Kettle', 'Lantern', 'Monkey', 'Notebook', 'Ostrich', 'Penguin',
    'Quiver', 'Rabbit', 'Speaker', 'Teapot', 'Umbrella', 'Violin', 'Window', 'Xylophone',
    'Yacht', 'Zebra', 'Planet', 'Rocket', 'Forest', 'Desert', 'Ocean', 'Mountain'
  ];

  late List<String> _targetWords;
  late List<String> _recallOptions;
  final List<String> _selectedRecallWords = [];

  // Math task data
  late int _mathNum1;
  late int _mathNum2;
  late int _mathCorrect;
  late List<int> _mathOptions;
  int _mathSolvedCount = 0;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _gamePhase = 1;
    _mathSolvedCount = 0;
    _selectedRecallWords.clear();

    // Select 4 random target words
    final shuffledPool = List<String>.from(_wordsPool)..shuffle(_random);
    _targetWords = shuffledPool.sublist(0, 4);

    // Create 8 options for recall (4 targets + 4 distractors)
    final distractors = shuffledPool.sublist(4, 8);
    _recallOptions = [..._targetWords, ...distractors]..shuffle(_random);

    _generateMathTask();
  }

  void _generateMathTask() {
    _mathNum1 = _random.nextInt(12) + 2;
    _mathNum2 = _random.nextInt(12) + 2;
    _mathCorrect = _mathNum1 + _mathNum2;
    _mathOptions = [
      _mathCorrect,
      _mathCorrect + _random.nextInt(3) + 1,
      _mathCorrect - _random.nextInt(3) - 1,
    ]..shuffle(_random);
  }

  void _onMathAnswer(int ans) {
    if (ans == _mathCorrect) {
      HapticFeedbackUtil.success();
      _mathSolvedCount++;
      if (_mathSolvedCount >= 2) {
        setState(() {
          _gamePhase = 3;
        });
      } else {
        setState(() {
          _generateMathTask();
        });
      }
    } else {
      HapticFeedbackUtil.error();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.snackbarIncorrectArithmetic)),
      );
      setState(() {
        _generateMathTask();
      });
    }
  }

  void _onRecallWordTapped(String word) {
    setState(() {
      HapticFeedbackUtil.lightImpact();
      if (_selectedRecallWords.contains(word)) {
        _selectedRecallWords.remove(word);
      } else {
        if (_selectedRecallWords.length < 4) {
          _selectedRecallWords.add(word);
        }
      }
    });
  }

  void _checkRecall() {
    bool correct = true;
    for (final word in _targetWords) {
      if (!_selectedRecallWords.contains(word)) {
        correct = false;
        break;
      }
    }

    if (correct) {
      _score++;
      HapticFeedbackUtil.success();
      if (_score >= _targetScore) {
        _isGameOver = true;
        _onGameComplete();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.snackbarCorrectRecall),
            backgroundColor: DesignSystem.gameGreen,
            duration: Duration(seconds: 1),
          ),
        );
        setState(() {
          _generatePuzzle();
        });
      }
    } else {
      HapticFeedbackUtil.error();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.snackbarWrongRecall),
          backgroundColor: DesignSystem.gameRed,
          duration: Duration(seconds: 2),
        ),
      );
      setState(() {
        _generatePuzzle();
      });
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('dual_task_memory');
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
      title: L10nGameHelpers.getGameTitle(context, 'dual_task_memory'),
      subtitle: _gamePhase == 1
          ? L10nGameHelpers.getGameSubtitle(context, 'dual_task_memory')
          : (_gamePhase == 2
              ? AppLocalizations.of(context)!.phaseCalculationLabel
              : L10nGameHelpers.getGameSubtitle(context, 'dual_task_memory')),
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
            // Score Board
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: DesignSystem.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
              ),
              child: Text(
                '${AppLocalizations.of(context)!.statScore}: $_score / $_targetScore',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: DesignSystem.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Center(
                child: _buildPhaseView(isDark),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhaseView(bool isDark) {
    if (_gamePhase == 1) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'WORDS TO MEMORIZE',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.1),
          ),
          const SizedBox(height: 24),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2.2,
            ),
            itemCount: 4,
            itemBuilder: (context, idx) {
              return Container(
                decoration: BoxDecoration(
                  color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                  border: Border.all(
                    color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                    width: 1.5,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  _targetWords[idx],
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                HapticFeedbackUtil.lightImpact();
                setState(() {
                  _gamePhase = 2;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: DesignSystem.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                ),
              ),
              child: const Text(
                'I\'VE MEMORIZED THEM',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      );
    } else if (_gamePhase == 2) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'CALCULATION STAGE',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          Text(
            'Progress: $_mathSolvedCount/2',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
              borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
              border: Border.all(
                color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                width: 2,
              ),
            ),
            child: Text(
              '$_mathNum1 + $_mathNum2 = ?',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _mathOptions.map((opt) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: 95,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () => _onMathAnswer(opt),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDark ? DesignSystem.darkSurface : Colors.white,
                      side: BorderSide(
                        color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                      ),
                    ),
                    child: Text(
                      '$opt',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      );
    } else {
      // Recall stage
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'RECALL WORD SET (${_selectedRecallWords.length}/4 selected)',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 2.2,
              ),
              itemCount: 8,
              itemBuilder: (context, idx) {
                final word = _recallOptions[idx];
                final isSelected = _selectedRecallWords.contains(word);
                return GestureDetector(
                  onTap: () => _onRecallWordTapped(word),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? DesignSystem.primary.withOpacity(0.1)
                          : (isDark ? DesignSystem.darkSurface : DesignSystem.surface),
                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                      border: Border.all(
                        color: isSelected
                            ? DesignSystem.primary
                            : (isDark ? DesignSystem.darkOutline : DesignSystem.outline),
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      word,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? DesignSystem.primary : null,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _selectedRecallWords.length == 4 ? _checkRecall : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: DesignSystem.gameGreen,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                ),
              ),
              child: const Text(
                'CHECK RECALL',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      );
    }
  }
}
