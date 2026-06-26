import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';

class NarrativeRecallScreen extends ConsumerStatefulWidget {
  const NarrativeRecallScreen({super.key});

  @override
  ConsumerState<NarrativeRecallScreen> createState() => _NarrativeRecallScreenState();
}

class _NarrativeRecallScreenState extends ConsumerState<NarrativeRecallScreen> {
  bool _showingStory = true;
  int _timeLeft = 20;
  Timer? _timer;

  int _currentQuestionIndex = 0;
  final List<int> _userAnswers = [];

  late Map<String, dynamic> _currentStoryData;

  void _generateRandomStory() {
    final random = Random();

    final names = ['Emily', 'Arthur', 'Sophia', 'Lucas', 'Olivia', 'Ethan'];
    final name = names[random.nextInt(names.length)];

    final counts1 = [3, 4, 5, 6];
    final count1 = counts1[random.nextInt(counts1.length)];
    final colors1 = ['red', 'blue', 'green', 'yellow'];
    final color1 = colors1[random.nextInt(colors1.length)];
    final items1 = ['apples', 'balloons', 'books', 'pens'];
    final item1 = items1[random.nextInt(items1.length)];

    final counts2 = [2, 7, 8, 12];
    final count2 = counts2[random.nextInt(counts2.length)];
    final colors2 = ['purple', 'white', 'black', 'orange'];
    final color2 = colors2[random.nextInt(colors2.length)];
    final items2 = ['tarts', 'cupcakes', 'boxes', 'bags'];
    final item2 = items2[random.nextInt(items2.length)];

    final locations = ['supermarket', 'bakery', 'bookstore', 'local market'];
    final location = locations[random.nextInt(locations.length)];

    final times = ['4:30 PM', '8:15 AM', '6:00 PM', '2:45 PM'];
    final time = times[random.nextInt(times.length)];

    final spendOptions = [15, 25, 45, 60];
    final spend = spendOptions[random.nextInt(spendOptions.length)];

    final storyText = '$name bought $count1 $color1 $item1, and $count2 $color2 $item2 from the $location at $time. Spending a total of $spend dollars.';

    final q1Options = ['3', '4', '5', '6'].toList()..shuffle(random);
    final q1 = {
      'question': 'How many $color1 $item1 did $name buy?',
      'options': q1Options,
      'answer': q1Options.indexOf('$count1'),
    };

    final q2Options = times.toList()..shuffle(random);
    final q2 = {
      'question': 'What time did $name visit the $location?',
      'options': q2Options,
      'answer': q2Options.indexOf(time),
    };

    final q3Options = ['15 dollars', '25 dollars', '45 dollars', '60 dollars'].toList()..shuffle(random);
    final q3 = {
      'question': 'How much money did $name spend in total?',
      'options': q3Options,
      'answer': q3Options.indexOf('$spend dollars'),
    };

    _currentStoryData = {
      'story': storyText,
      'questions': [q1, q2, q3],
    };
  }

  @override
  void initState() {
    super.initState();
    _startStoryPhase();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startStoryPhase() {
    _generateRandomStory();
    _showingStory = true;
    _timeLeft = 25;
    _currentQuestionIndex = 0;
    _userAnswers.clear();

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 1) {
          _timeLeft--;
        } else {
          _timer?.cancel();
          _startQuizPhase();
        }
      });
    });
  }

  void _startQuizPhase() {
    _timer?.cancel();
    setState(() {
      _showingStory = false;
    });
  }

  void _answerQuestion(int optionIndex) {
    HapticFeedbackUtil.lightImpact();
    _userAnswers.add(optionIndex);

    if (_currentQuestionIndex < 2) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      _evaluateQuiz();
    }
  }

  void _evaluateQuiz() {
    final questions = _currentStoryData['questions'] as List;
    bool allCorrect = true;

    for (int i = 0; i < 3; i++) {
      if (_userAnswers[i] != questions[i]['answer']) {
        allCorrect = false;
      }
    }

    if (allCorrect) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('narrative_recall');
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          final l10n = AppLocalizations.of(context)!;
          return GameCompletionDialog(
            title: l10n.phasePerfectRecall,
            message: l10n.completed,
            onPlayAgain: () {
              setState(() {
                _startStoryPhase();
              });
              Navigator.pop(context);
            },
            onHome: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          );
        },
      );
    } else {
      HapticFeedbackUtil.error();
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          final l10n = AppLocalizations.of(context)!;
          return GameCompletionDialog(
            title: l10n.gameOver,
            message: l10n.completed,
            onPlayAgain: () {
              _startStoryPhase();
              Navigator.pop(context);
            },
            onHome: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'narrative_recall'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'narrative_recall'),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.phaseMemorizeDetails, style: Theme.of(context).textTheme.titleMedium),
                if (_showingStory)
                  Text(l10n.phaseTimeLeft(_timeLeft), style: const TextStyle(fontWeight: FontWeight.bold, color: DesignSystem.gameRose)),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: _showingStory ? _buildStoryView() : _buildQuizView(),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildStoryView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Read and Memorize Details:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        TangibleContainer(
          depth: 3,
          color: Theme.of(context).colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              _currentStoryData['story'],
              style: const TextStyle(fontSize: 18, height: 1.5, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: _startQuizPhase,
          style: ElevatedButton.styleFrom(
            backgroundColor: DesignSystem.gameRose,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ),
          child: Text(AppLocalizations.of(context)!.btnImReadyToAnswer, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildQuizView() {
    final question = _currentStoryData['questions'][_currentQuestionIndex];
    final options = question['options'] as List<String>;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Question ${_currentQuestionIndex + 1} of 3',
          style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          question['question'],
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        ...List.generate(options.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _answerQuestion(index),
                style: ElevatedButton.styleFrom(
                  elevation: 2,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  options[index],
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
