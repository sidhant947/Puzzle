import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class WordAssociationRecallScreen extends ConsumerStatefulWidget {
  const WordAssociationRecallScreen({super.key});

  @override
  ConsumerState<WordAssociationRecallScreen> createState() => _WordAssociationRecallScreenState();
}

class _WordAssociationRecallScreenState extends ConsumerState<WordAssociationRecallScreen> {
  final Random _random = Random();

  final List<String> _wordPool = [
    'Apple', 'Banana', 'Cloud', 'Ocean', 'Bicycle', 'Forest', 'Window', 'Chair',
    'Hammer', 'Pencil', 'Castle', 'Guitar', 'Bridge', 'Mountain', 'Robot', 'Clock',
    'Jacket', 'Balloon', 'Submarine', 'Kangaroo', 'Candle', 'Rocket', 'Mirror', 'Telescope',
    'Backpack', 'Umbrella', 'Pillow', 'Feather', 'Compass', 'Suitcase', 'Lantern', 'Anchor'
  ];

  // Game state
  bool _isStudyMode = true;
  int _studyIndex = 0;
  int _recallIndex = 0;
  bool _isGameOver = false;

  late List<MapEntry<String, String>> _pairs;
  late List<List<String>> _multipleChoices; // multiple choices for recall questions

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _isStudyMode = true;
    _studyIndex = 0;
    _recallIndex = 0;
    _isGameOver = false;

    // Pick 5 unique random words for left and 5 for right
    final shuffled = List<String>.from(_wordPool)..shuffle(_random);
    final leftWords = shuffled.sublist(0, 5);
    final rightWords = shuffled.sublist(5, 10);

    _pairs = List.generate(5, (i) => MapEntry(leftWords[i], rightWords[i]));

    // Generate multiple choices for each recall question
    _multipleChoices = [];
    for (int i = 0; i < 5; i++) {
      final choices = <String>{_pairs[i].value};
      // Pull random incorrect options from the rightWords or word pool
      while (choices.length < 4) {
        final rWord = _wordPool[_random.nextInt(_wordPool.length)];
        if (rWord != _pairs[i].key && rWord != _pairs[i].value) {
          choices.add(rWord);
        }
      }
      final choicesList = choices.toList()..shuffle(_random);
      _multipleChoices.add(choicesList);
    }
  }

  void _onNextStudy() {
    HapticFeedbackUtil.lightImpact();
    setState(() {
      if (_studyIndex < _pairs.length - 1) {
        _studyIndex++;
      } else {
        _isStudyMode = false;
      }
    });
  }

  void _onAnswerSelected(String answer) {
    if (_isGameOver) return;

    final correctAnswer = _pairs[_recallIndex].value;
    if (answer == correctAnswer) {
      HapticFeedbackUtil.success();
      setState(() {
        if (_recallIndex < _pairs.length - 1) {
          _recallIndex++;
        } else {
          _isGameOver = true;
          _onGameComplete();
        }
      });
    } else {
      HapticFeedbackUtil.error();
      // Restart study mode to reinforce learning
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect! Let\'s study the pairs again.'),
          duration: Duration(seconds: 2),
        ),
      );
      setState(() {
        _isStudyMode = true;
        _studyIndex = 0;
        _recallIndex = 0;
      });
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('word_association_recall');
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
      title: 'WORD ASSOCIATION',
      subtitle: _isStudyMode ? 'Memorize these word pairs' : 'Which word was paired with the target?',
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
        child: Padding(
          padding: const EdgeInsets.all(DesignSystem.spaceMD),
          child: _isStudyMode ? _buildStudyView(isDark) : _buildRecallView(isDark),
        ),
      ),
    );
  }

  Widget _buildStudyView(bool isDark) {
    final currentPair = _pairs[_studyIndex];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Pair ${_studyIndex + 1} of ${_pairs.length}',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: DesignSystem.primary,
              ),
        ),
        const SizedBox(height: DesignSystem.spaceMD),
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
            borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
            border: Border.all(
              color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
              width: 2,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentPair.key,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: DesignSystem.gameBlue,
                    ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Icon(Icons.link_rounded, size: 32, color: Colors.grey),
              ),
              Text(
                currentPair.value,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: DesignSystem.gamePurple,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: _onNextStudy,
          style: ElevatedButton.styleFrom(
            backgroundColor: DesignSystem.primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
            ),
          ),
          child: Text(
            _studyIndex < _pairs.length - 1 ? 'NEXT PAIR' : 'START RECALL',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildRecallView(bool isDark) {
    final targetWord = _pairs[_recallIndex].key;
    final choices = _multipleChoices[_recallIndex];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Question ${_recallIndex + 1} of ${_pairs.length}',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: DesignSystem.primary,
              ),
        ),
        const SizedBox(height: DesignSystem.spaceMD),
        Text(
          'What was paired with:',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: DesignSystem.spaceXS),
        Text(
          targetWord,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: DesignSystem.gameBlue,
              ),
        ),
        const SizedBox(height: 40),
        Column(
          children: choices.map((choice) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                width: 280,
                height: 56,
                child: OutlinedButton(
                  onPressed: () => _onAnswerSelected(choice),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                    ),
                  ),
                  child: Text(
                    choice,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
