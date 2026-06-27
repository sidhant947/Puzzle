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

class SymbolDigitAssocScreen extends ConsumerStatefulWidget {
  const SymbolDigitAssocScreen({super.key});

  @override
  ConsumerState<SymbolDigitAssocScreen> createState() => _SymbolDigitAssocScreenState();
}

class _SymbolDigitAssocScreenState extends ConsumerState<SymbolDigitAssocScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 3;
  bool _isGameOver = false;

  final List<String> _symbols = ['◆', '▲', '●', '★', '♣', '♦', '♥', '♠', '☯'];
  late Map<String, int> _assocKey; // Map symbol to digit
  late List<String> _challengeSymbols; // Sequence of symbols to translate
  late List<int?> _userAnswers; // User translation inputs
  int _activeChallengeIdx = 0;

  bool _isStudyPhase = true;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _isStudyPhase = true;
    _activeChallengeIdx = 0;

    // Generate random symbol to digit map
    final shuffledDigits = List<int>.generate(9, (i) => i + 1)..shuffle(_random);
    _assocKey = {};
    for (int i = 0; i < 9; i++) {
      _assocKey[_symbols[i]] = shuffledDigits[i];
    }

    // Pick 4 symbols for the challenge sheet
    _challengeSymbols = List<String>.from(_symbols)..shuffle(_random);
    _challengeSymbols = _challengeSymbols.sublist(0, 4);

    _userAnswers = List<int?>.filled(4, null);
  }

  void _onDigitInput(int value) {
    if (_isStudyPhase || _isGameOver) return;

    setState(() {
      _userAnswers[_activeChallengeIdx] = value;
      HapticFeedbackUtil.lightImpact();
      if (_activeChallengeIdx < 3) {
        _activeChallengeIdx++;
      }
    });
  }

  void _checkAnswers() {
    bool correct = true;
    for (int i = 0; i < 4; i++) {
      final symbol = _challengeSymbols[i];
      final correctDigit = _assocKey[symbol];
      if (_userAnswers[i] != correctDigit) {
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
            content: Text(AppLocalizations.of(context)!.snackbarAllCorrect),
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
          content: Text(AppLocalizations.of(context)!.snackbarIncorrectStudyAgain),
          backgroundColor: DesignSystem.gameRed,
          duration: Duration(seconds: 2),
        ),
      );
      setState(() {
        _isStudyPhase = true;
        _userAnswers = List<int?>.filled(4, null);
        _activeChallengeIdx = 0;
      });
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('symbol_digit_assoc');
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
      title: L10nGameHelpers.getGameTitle(context, 'symbol_digit_assoc'),
      subtitle: _isStudyPhase
          ? L10nGameHelpers.getGameSubtitle(context, 'symbol_digit_assoc')
          : L10nGameHelpers.getGameSubtitle(context, 'symbol_digit_assoc'),
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
                color: DesignSystem.primary.withValues(alpha: 0.15),
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
            const SizedBox(height: 20),
            Expanded(
              child: _isStudyPhase ? _buildStudyView(isDark) : _buildRecallView(isDark),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudyView(bool isDark) {
    return Column(
      children: [
        const Text(
          'ASSOCIATION KEY',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.2),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: 9,
            itemBuilder: (context, idx) {
              final symbol = _symbols[idx];
              final digit = _assocKey[symbol];
              return Container(
                decoration: BoxDecoration(
                  color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                  border: Border.all(
                    color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                    width: 1.5,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      symbol,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: DesignSystem.primary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '=  $digit',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
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
            onPressed: () {
              HapticFeedbackUtil.lightImpact();
              setState(() {
                _isStudyPhase = false;
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
              'START TRANSLATING',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecallView(bool isDark) {
    return Column(
      children: [
        const Text(
          'TRANSLATION SHEET',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (i) {
            final active = _activeChallengeIdx == i;
            final val = _userAnswers[i];
            return GestureDetector(
              onTap: () {
                setState(() {
                  _activeChallengeIdx = i;
                });
              },
              child: Container(
                width: 70,
                height: 100,
                decoration: BoxDecoration(
                  color: active
                      ? DesignSystem.primary.withValues(alpha: 0.08)
                      : (isDark ? DesignSystem.darkSurface : DesignSystem.surface),
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                  border: Border.all(
                    color: active
                        ? DesignSystem.primary
                        : (isDark ? DesignSystem.darkOutline : DesignSystem.outline),
                    width: active ? 2 : 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _challengeSymbols[i],
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      width: 32,
                      height: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isDark ? Colors.black26 : Colors.black12,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        val != null ? '$val' : '',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        const Spacer(),
        // Number Keypad 1-9
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.5,
          ),
          itemCount: 9,
          itemBuilder: (context, idx) {
            final val = idx + 1;
            return ElevatedButton(
              onPressed: () => _onDigitInput(val),
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark ? DesignSystem.darkSurface : Colors.white,
                foregroundColor: isDark ? Colors.white : Colors.black87,
                side: BorderSide(
                  color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                ),
              ),
              child: Text(
                '$val',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _userAnswers[_activeChallengeIdx] = null;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                    ),
                  ),
                  child: Text(AppLocalizations.of(context)!.btnClear),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _userAnswers.contains(null) ? null : _checkAnswers,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: DesignSystem.gameGreen,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.btnSubmit,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
