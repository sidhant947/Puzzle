import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class SemanticAssociationPuzzle {
  final List<String> clues;
  final String answer;

  SemanticAssociationPuzzle({required this.clues, required this.answer});
}

class SemanticAssociationScreen extends ConsumerStatefulWidget {
  const SemanticAssociationScreen({super.key});

  @override
  ConsumerState<SemanticAssociationScreen> createState() => _SemanticAssociationScreenState();
}

class _SemanticAssociationScreenState extends ConsumerState<SemanticAssociationScreen> {
  final Random _random = Random();
  final TextEditingController _controller = TextEditingController();

  final List<SemanticAssociationPuzzle> _puzzlePool = [
    SemanticAssociationPuzzle(clues: ['Swiss', 'Cottage', 'Cake'], answer: 'CHEESE'),
    SemanticAssociationPuzzle(clues: ['Time', 'Bandit', 'Wrist'], answer: 'WATCH'),
    SemanticAssociationPuzzle(clues: ['Spade', 'Heart', 'House'], answer: 'CARD'),
    SemanticAssociationPuzzle(clues: ['Electric', 'Guitar', 'Wire'], answer: 'CABLE'),
    SemanticAssociationPuzzle(clues: ['Foot', 'Tennis', 'Snow'], answer: 'SHOE'),
    SemanticAssociationPuzzle(clues: ['Paper', 'Source', 'Light'], answer: 'PLATE'),
    SemanticAssociationPuzzle(clues: ['Water', 'River', 'Blood'], answer: 'BANK'),
    SemanticAssociationPuzzle(clues: ['Cracker', 'Nap', 'Cheese'], answer: 'JACK'),
  ];

  late SemanticAssociationPuzzle _currentPuzzle;
  int _score = 0;
  final int _targetScore = 4;
  bool _isGameOver = false;
  bool _showHint = false;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _controller.clear();
    _showHint = false;
    _currentPuzzle = _puzzlePool[_random.nextInt(_puzzlePool.length)];
  }

  void _onSubmit() {
    if (_isGameOver) return;

    final input = _controller.text.trim().toUpperCase();
    if (input == _currentPuzzle.answer) {
      _score++;
      HapticFeedbackUtil.success();
      if (_score >= _targetScore) {
        _isGameOver = true;
        _onGameComplete();
      } else {
        setState(() {
          _generatePuzzle();
        });
      }
    } else {
      HapticFeedbackUtil.error();
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.snackbarIncorrectAnswer), duration: Duration(seconds: 1)),
      );
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('semantic_association');
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'semantic_association'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'semantic_association'),
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Column(
              children: [
                // Score card
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: DesignSystem.primary.withOpacity(0.1),
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
                // Clue Card list
                Column(
                  children: _currentPuzzle.clues.map((clue) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      width: 260,
                      decoration: BoxDecoration(
                        color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                        border: Border.all(
                          color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                          width: 2,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        clue.toUpperCase(),
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: DesignSystem.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 30),
                // Hint display
                if (_showHint)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      'Hint: Starts with "${_currentPuzzle.answer[0]}" (${_currentPuzzle.answer.length} letters)',
                      style: const TextStyle(color: DesignSystem.gameOrange, fontWeight: FontWeight.w600),
                    ),
                  ),
                // Text Input Field
                SizedBox(
                  width: 260,
                  child: TextField(
                    controller: _controller,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      hintText: 'TYPE ANSWER HERE',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                      ),
                    ),
                    onSubmitted: (_) => _onSubmit(),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        HapticFeedbackUtil.lightImpact();
                        setState(() {
                          _showHint = true;
                        });
                      },
                      child: Text(AppLocalizations.of(context)!.btnShowHint),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: _onSubmit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: DesignSystem.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                        ),
                      ),
                      child: Text(AppLocalizations.of(context)!.btnSubmit),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
