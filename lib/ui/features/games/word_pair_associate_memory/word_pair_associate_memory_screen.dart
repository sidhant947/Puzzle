import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'word_pair_associate_memory_engine.dart';

class WordPairAssociateMemoryScreen extends ConsumerStatefulWidget {
  const WordPairAssociateMemoryScreen({super.key});

  @override
  ConsumerState<WordPairAssociateMemoryScreen> createState() => _WordPairAssociateMemoryScreenState();
}

class _WordPairAssociateMemoryScreenState extends ConsumerState<WordPairAssociateMemoryScreen> {
  static const int targetScore = 8;

  late WordPairAssociateRound _currentRound;
  int _score = 0;
  int _queryIndex = 0;
  bool _isStudyPhase = true;
  bool _isGameOver = false;
  int _studySecondsLeft = 4;
  String? _selectedOption;
  Timer? _studyTimer;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  @override
  void dispose() {
    _studyTimer?.cancel();
    super.dispose();
  }

  void _startNewGame() {
    _studyTimer?.cancel();
    setState(() {
      _score = 0;
      _isGameOver = false;
      _loadNewRound();
    });
  }

  void _loadNewRound() {
    _studyTimer?.cancel();
    final count = _score < 3 ? 3 : (_score < 6 ? 4 : 5);
    _currentRound = WordPairAssociateMemoryEngine.generateRound(count: count);
    _queryIndex = 0;
    _isStudyPhase = true;
    _selectedOption = null;
    _studySecondsLeft = 3 + count;

    _studyTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_studySecondsLeft <= 1) {
        timer.cancel();
        if (mounted) {
          setState(() {
            _isStudyPhase = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _studySecondsLeft--;
          });
        }
      }
    });
  }

  void _submitChoice(String choice) {
    if (_isGameOver || _isStudyPhase || _selectedOption != null) return;

    final target = _currentRound.queryPairs[_queryIndex].wordB;
    final isCorrect = choice == target;

    setState(() {
      _selectedOption = choice;
    });

    if (isCorrect) {
      HapticFeedbackUtil.lightImpact();
      Future.delayed(const Duration(milliseconds: 300), () {
        if (!mounted || _isGameOver) return;

        setState(() {
          _queryIndex++;
          _selectedOption = null;
        });

        if (_queryIndex >= _currentRound.queryPairs.length) {
          HapticFeedbackUtil.victory();
          setState(() {
            _score++;
          });

          if (_score >= targetScore) {
            setState(() {
              _isGameOver = true;
            });
            ref.read(gameStreakNotifierProvider.notifier).completeGame('word_pair_associate_memory');
            _showWinDialog();
            return;
          }

          _loadNewRound();
        }
      });
    } else {
      HapticFeedbackUtil.error();
      Future.delayed(const Duration(milliseconds: 500), () {
        if (!mounted || _isGameOver) return;
        _loadNewRound();
      });
    }
  }

  void _showWinDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.wordPairAssociateMemoryWinTitle,
        message: l10n.wordPairAssociateMemoryWinMessage,
        onPlayAgain: () {
          Navigator.of(context).pop();
          _startNewGame();
        },
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GameScaffold(
      title: l10n.wordPairAssociateMemoryTitle,
      subtitle: l10n.wordPairAssociateMemorySubtitle,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignSystem.spaceLG,
            vertical: DesignSystem.spaceMD,
          ),
          child: Column(
            children: [
              _buildHeader(colorScheme),
              const SizedBox(height: DesignSystem.spaceMD),
              Expanded(
                child: _isStudyPhase
                    ? _buildStudyStage(colorScheme)
                    : _buildTestingStage(colorScheme),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TangibleContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: colorScheme.surface,
          child: Row(
            children: [
              Icon(
                _isStudyPhase ? Icons.visibility_rounded : Icons.quiz_rounded,
                size: 18,
                color: DesignSystem.gameIndigo,
              ),
              const SizedBox(width: 6),
              Text(
                _isStudyPhase ? 'STUDY: $_studySecondsLeft s' : 'RECALL ${_queryIndex + 1} / ${_currentRound.queryPairs.length}',
                style: const TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                  color: DesignSystem.gameIndigo,
                ),
              ),
            ],
          ),
        ),
        TangibleContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: colorScheme.surface,
          child: Row(
            children: [
              const Icon(Icons.stars_rounded, size: 18, color: DesignSystem.primary),
              const SizedBox(width: 6),
              Text(
                '$_score / $targetScore',
                style: const TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                  color: DesignSystem.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStudyStage(ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.5), width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'MEMORIZE ASSOCIATED PAIRS',
            style: TextStyle(
              fontFamily: 'Bebas Neue',
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 20),
          ..._currentRound.studyPairs.map((pair) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                decoration: BoxDecoration(
                  color: DesignSystem.gameIndigo.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                  border: Border.all(color: DesignSystem.gameIndigo, width: 1.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      pair.wordA,
                      style: const TextStyle(
                        fontFamily: 'Bebas Neue',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: DesignSystem.gameIndigo,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(Icons.arrow_forward_rounded, size: 18),
                    ),
                    Text(
                      pair.wordB,
                      style: TextStyle(
                        fontFamily: 'Bebas Neue',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTestingStage(ColorScheme colorScheme) {
    final query = _currentRound.queryPairs[_queryIndex];
    final allChoices = _currentRound.studyPairs.map((p) => p.wordB).toList();

    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
              border: Border.all(color: colorScheme.outline.withValues(alpha: 0.5), width: 2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'WHICH WORD WAS PAIRED WITH THIS CUE?',
                  style: TextStyle(
                    fontFamily: 'Geist',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  query.wordA,
                  style: const TextStyle(
                    fontFamily: 'Bebas Neue',
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: DesignSystem.gameIndigo,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: DesignSystem.spaceMD),
        Expanded(
          flex: 4,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: DesignSystem.spaceMD,
              mainAxisSpacing: DesignSystem.spaceMD,
              childAspectRatio: 2.2,
            ),
            itemCount: allChoices.length,
            itemBuilder: (context, idx) {
              final choice = allChoices[idx];
              final isSelected = _selectedOption == choice;
              final isCorrect = query.wordB == choice;

              Color btnColor = colorScheme.surface;
              Color textColor = colorScheme.onSurface;

              if (_selectedOption != null) {
                if (isCorrect) {
                  btnColor = DesignSystem.success.withValues(alpha: 0.2);
                  textColor = DesignSystem.success;
                } else if (isSelected) {
                  btnColor = DesignSystem.error.withValues(alpha: 0.2);
                  textColor = DesignSystem.error;
                }
              }

              return TangibleButton(
                color: btnColor,
                onTap: () => _submitChoice(choice),
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Center(
                  child: Text(
                    choice,
                    style: TextStyle(
                      fontFamily: 'Bebas Neue',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
