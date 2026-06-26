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

class WordWheelPuzzle {
  final String pangram;
  final String centralLetter;
  final List<String> letters; // Must be exactly 7 letters (including central)
  final Set<String> validWords;

  WordWheelPuzzle({
    required this.pangram,
    required this.centralLetter,
    required this.letters,
    required this.validWords,
  });
}

class WordWheelScreen extends ConsumerStatefulWidget {
  const WordWheelScreen({super.key});

  @override
  ConsumerState<WordWheelScreen> createState() => _WordWheelScreenState();
}

class _WordWheelScreenState extends ConsumerState<WordWheelScreen> {
  final Random _random = Random();

  final List<WordWheelPuzzle> _puzzles = [
    WordWheelPuzzle(
      pangram: 'PROJECT',
      centralLetter: 'R',
      letters: ['P', 'R', 'O', 'J', 'E', 'C', 'T'],
      validWords: {'PROJECT', 'ROPE', 'PORT', 'CROP', 'PORE', 'CORE', 'TORN', 'ROTE', 'RECOPT'},
    ),
    WordWheelPuzzle(
      pangram: 'FLUTTER',
      centralLetter: 'E',
      letters: ['F', 'L', 'U', 'T', 'T', 'E', 'R'],
      validWords: {'FLUTTER', 'FLUTE', 'RULE', 'LUTE', 'FUEL', 'TURF', 'LEFT', 'TRUE', 'REFT'},
    ),
    WordWheelPuzzle(
      pangram: 'SPATIAL',
      centralLetter: 'A',
      letters: ['S', 'P', 'A', 'T', 'I', 'A', 'L'],
      validWords: {'SPATIAL', 'SPIT', 'PATH', 'TAIL', 'SLIP', 'PAST', 'SALT', 'LAPS', 'ALAS'},
    ),
    WordWheelPuzzle(
      pangram: 'ORANGES',
      centralLetter: 'G',
      letters: ['O', 'R', 'A', 'N', 'G', 'E', 'S'],
      validWords: {'ORANGES', 'ORANGE', 'GEAR', 'RAGE', 'SANG', 'SONG', 'GONE', 'RANG', 'SNUG'},
    ),
  ];

  late WordWheelPuzzle _currentPuzzle;
  late List<String> _outerLetters;
  String _currentInput = '';
  final Set<String> _foundWords = {};
  int _score = 0;
  final int _targetScore = 4; // User needs to find 4 words
  bool _isGameOver = false;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _foundWords.clear();
    _currentInput = '';
    _isGameOver = false;
    _score = 0;

    _currentPuzzle = _puzzles[_random.nextInt(_puzzles.length)];
    // Outer letters are all except central
    _outerLetters = List.from(_currentPuzzle.letters)
      ..remove(_currentPuzzle.centralLetter);
    _outerLetters.shuffle(_random);
  }

  void _onLetterTapped(String letter) {
    if (_isGameOver) return;
    HapticFeedbackUtil.lightImpact();
    setState(() {
      _currentInput += letter;
    });
  }

  void _onBackspace() {
    if (_currentInput.isEmpty || _isGameOver) return;
    HapticFeedbackUtil.lightImpact();
    setState(() {
      _currentInput = _currentInput.substring(0, _currentInput.length - 1);
    });
  }

  void _onSubmit() {
    if (_isGameOver || _currentInput.isEmpty) return;

    final word = _currentInput.toUpperCase();
    if (!word.contains(_currentPuzzle.centralLetter)) {
      HapticFeedbackUtil.error();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.snackbarWordMustContainCentral(_currentPuzzle.centralLetter)),
          duration: const Duration(seconds: 1),
        ),
      );
      setState(() {
        _currentInput = '';
      });
      return;
    }

    if (_foundWords.contains(word)) {
      HapticFeedbackUtil.error();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.snackbarWordAlreadyFound),
          duration: const Duration(seconds: 1),
        ),
      );
      setState(() {
        _currentInput = '';
      });
      return;
    }

    // Check against predefined list or general anagram
    bool isValid = _currentPuzzle.validWords.contains(word) || 
                  (word.length >= 3 && _isValidAnagram(word, _currentPuzzle.letters));

    if (isValid) {
      HapticFeedbackUtil.success();
      setState(() {
        _foundWords.add(word);
        _score++;
        _currentInput = '';

        if (_score >= _targetScore) {
          _isGameOver = true;
          _onGameComplete();
        }
      });
    } else {
      HapticFeedbackUtil.error();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.snackbarNotAValidWord),
          duration: const Duration(seconds: 1),
        ),
      );
      setState(() {
        _currentInput = '';
      });
    }
  }

  bool _isValidAnagram(String input, List<String> availableLetters) {
    final inputChars = input.split('');
    final availCopy = List<String>.from(availableLetters);
    for (var char in inputChars) {
      if (!availCopy.contains(char)) return false;
      availCopy.remove(char);
    }
    return true;
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('word_wheel');
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

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'word_wheel'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'word_wheel'),
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
      body: Column(
        children: [
          // Header / Input Board
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 56,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                      borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                      border: Border.all(
                        color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      _currentInput,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: DesignSystem.primary,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                const SizedBox(width: DesignSystem.spaceSM),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: DesignSystem.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                  ),
                  child: Text(
                    '$_score / $_targetScore',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: DesignSystem.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
          // Interactive Letter Wheel
          Expanded(
            child: Center(
              child: SizedBox(
                width: 280,
                height: 280,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer Letters
                    ...List.generate(6, (index) {
                      final double angle = (index * 2 * pi / 6) - pi / 2;
                      final double radius = 90.0;
                      final double x = radius * cos(angle);
                      final double y = radius * sin(angle);
                      final letter = _outerLetters[index];

                      return Transform.translate(
                        offset: Offset(x, y),
                        child: GestureDetector(
                          onTap: () => _onLetterTapped(letter),
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: isDark ? DesignSystem.darkSurface : Colors.white,
                            child: Text(
                              letter,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: isDark ? Colors.white : Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    // Central Letter
                    GestureDetector(
                      onTap: () => _onLetterTapped(_currentPuzzle.centralLetter),
                      child: Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          color: DesignSystem.primary,
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            )
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          _currentPuzzle.centralLetter,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Found Words Lists & Controls
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            height: 60,
            alignment: Alignment.center,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _foundWords.map((word) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  color: DesignSystem.gameGreen.withOpacity(0.15),
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    child: Text(
                      word,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: DesignSystem.gameGreen,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // Buttons
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.backspace_rounded, size: 28),
                  onPressed: _onBackspace,
                ),
                ElevatedButton(
                  onPressed: _onSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: DesignSystem.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                    ),
                  ),
                  child: Text(AppLocalizations.of(context)!.btnSubmit, style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
