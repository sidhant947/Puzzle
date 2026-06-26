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

class StoryBuilderPuzzle {
  final List<String> sentences;
  StoryBuilderPuzzle({required this.sentences});
}

class StoryBuilderScreen extends ConsumerStatefulWidget {
  const StoryBuilderScreen({super.key});

  @override
  ConsumerState<StoryBuilderScreen> createState() => _StoryBuilderScreenState();
}

class _StoryBuilderScreenState extends ConsumerState<StoryBuilderScreen> {
  final Random _random = Random();

  final List<StoryBuilderPuzzle> _storiesPool = [
    StoryBuilderPuzzle(sentences: [
      'Bob decided to cook a gourmet dinner for his friends.',
      'He accidentally swapped the salt with sugar in the soup.',
      'His friends pretended to enjoy the sweet chicken soup.',
      'They all ordered pizza secretly on the way home.',
    ]),
    StoryBuilderPuzzle(sentences: [
      'A little puppy found a shiny red ball in the park.',
      'He chased it down a steep grassy hill laughing.',
      'The ball rolled straight into a sleeping cat\'s paws.',
      'They ended up playing together until sunset.',
    ]),
    StoryBuilderPuzzle(sentences: [
      'An astronaut landed on a mysterious purple planet.',
      'She stepped out and noticed the gravity was extremely low.',
      'A small bounce sent her floating 50 feet into the air.',
      'She had to use her jetpack to return safely to the ship.',
    ]),
  ];

  late StoryBuilderPuzzle _currentStory;
  late List<String> _scrambledSentences;
  final List<String> _userSequence = [];
  bool _isStudyMode = true;

  int _score = 0;
  final int _targetScore = 3;
  bool _isGameOver = false;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _isStudyMode = true;
    _userSequence.clear();
    _currentStory = _storiesPool[_random.nextInt(_storiesPool.length)];

    _scrambledSentences = List.from(_currentStory.sentences)..shuffle(_random);
  }

  void _onSentenceTapped(String sentence) {
    if (_isStudyMode || _isGameOver) return;

    if (_userSequence.contains(sentence)) return;

    final stepIndex = _userSequence.length;
    final correctSentence = _currentStory.sentences[stepIndex];

    if (sentence == correctSentence) {
      HapticFeedbackUtil.success();
      setState(() {
        _userSequence.add(sentence);

        // Check if story is fully reconstructed
        if (_userSequence.length == _currentStory.sentences.length) {
          _score++;
          if (_score >= _targetScore) {
            _isGameOver = true;
            _onGameComplete();
          } else {
            Future.delayed(const Duration(milliseconds: 1000), () {
              if (mounted) {
                setState(() {
                  _generatePuzzle();
                });
              }
            });
          }
        }
      });
    } else {
      HapticFeedbackUtil.error();
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.snackbarIncorrectStudyStory), duration: Duration(seconds: 2)),
      );
      setState(() {
        _isStudyMode = true;
        _userSequence.clear();
      });
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('story_builder');
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
      title: L10nGameHelpers.getGameTitle(context, 'story_builder'),
      subtitle: _isStudyMode ? AppLocalizations.of(context)!.phaseMemorizeSequence : L10nGameHelpers.getGameSubtitle(context, 'story_builder'),
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
            // Score indicator
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: DesignSystem.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
              ),
              child: Text(
                '${AppLocalizations.of(context)!.statScore}: $_score / $_targetScore',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: DesignSystem.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: _isStudyMode ? _buildStudyView(isDark) : _buildRecallView(isDark),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudyView(bool isDark) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _currentStory.sentences.length,
            itemBuilder: (context, idx) {
              return Card(
                elevation: 0,
                color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                  side: BorderSide(
                    color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                    width: 1.5,
                  ),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: DesignSystem.primary,
                    foregroundColor: Colors.white,
                    child: Text('${idx + 1}'),
                  ),
                  title: Text(
                    _currentStory.sentences[idx],
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            setState(() {
              _isStudyMode = false;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: DesignSystem.primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
            ),
          ),
          child: Text(AppLocalizations.of(context)!.btnImReady, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildRecallView(bool isDark) {
    return ListView.builder(
      itemCount: _scrambledSentences.length,
      itemBuilder: (context, idx) {
        final sentence = _scrambledSentences[idx];
        final isCorrectlyPlaced = _userSequence.contains(sentence);
        final correctIndex = _userSequence.indexOf(sentence);

        return Card(
          elevation: 0,
          color: isCorrectlyPlaced
              ? DesignSystem.gameGreen.withOpacity(0.15)
              : (isDark ? DesignSystem.darkSurface : DesignSystem.surface),
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
            side: BorderSide(
              color: isCorrectlyPlaced
                  ? DesignSystem.gameGreen
                  : (isDark ? DesignSystem.darkOutline : DesignSystem.outline),
              width: 1.5,
            ),
          ),
          child: ListTile(
            onTap: () => _onSentenceTapped(sentence),
            leading: CircleAvatar(
              backgroundColor: isCorrectlyPlaced ? DesignSystem.gameGreen : Colors.grey,
              foregroundColor: Colors.white,
              child: Text(isCorrectlyPlaced ? '${correctIndex + 1}' : '?'),
            ),
            title: Text(
              sentence,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: isCorrectlyPlaced ? DesignSystem.gameGreen : null,
              ),
            ),
          ),
        );
      },
    );
  }
}
