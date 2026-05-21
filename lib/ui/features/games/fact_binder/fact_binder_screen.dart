import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class FactBinderScreen extends ConsumerStatefulWidget {
  const FactBinderScreen({super.key});

  @override
  ConsumerState<FactBinderScreen> createState() => _FactBinderScreenState();
}

class _FactBinderScreenState extends ConsumerState<FactBinderScreen> {
  final Random _random = Random();
  
  // Static set of names, jobs, and hobbies
  final List<String> _names = ["Liam", "Sophia", "Noah", "Emma", "Ethan"];
  final List<String> _jobs = ["Architect", "Doctor", "Designer", "Chef", "Pilot"];
  final List<String> _hobbies = ["Hiking", "Painting", "Gardening", "Cooking", "Chess"];

  // Formed profiles for this game session
  late List<Map<String, String>> _profiles;
  
  int _memorizationIndex = 0;
  bool _isQuizPhase = false;
  
  int _quizQuestionIndex = 0;
  int _correctAnswers = 0;
  static const int totalQuestions = 3;
  
  // Current question states
  late String _questionText;
  late String _correctOption;
  late List<String> _options;

  Timer? _memorizeTimer;
  int _timeLeft = 5; // 5 seconds per avatar

  @override
  void initState() {
    super.initState();
    _generateProfiles();
    _startMemorizationCycle();
  }

  @override
  void dispose() {
    _memorizeTimer?.cancel();
    super.dispose();
  }

  void _generateProfiles() {
    // Generate 3 unique character profiles
    _profiles = [];
    final namesCopy = List<String>.from(_names)..shuffle();
    final jobsCopy = List<String>.from(_jobs)..shuffle();
    final hobbiesCopy = List<String>.from(_hobbies)..shuffle();

    for (int i = 0; i < 3; i++) {
      _profiles.add({
        'name': namesCopy[i],
        'job': jobsCopy[i],
        'hobby': hobbiesCopy[i],
      });
    }
  }

  void _startMemorizationCycle() {
    setState(() {
      _timeLeft = 5;
    });

    _memorizeTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        if (_timeLeft > 1) {
          _timeLeft--;
        } else {
          _timeLeft = 0;
          _memorizeTimer?.cancel();
          _nextMemorizeOrQuiz();
        }
      });
    });
  }

  void _nextMemorizeOrQuiz() {
    if (_memorizationIndex < 2) {
      setState(() {
        _memorizationIndex++;
      });
      _startMemorizationCycle();
    } else {
      setState(() {
        _isQuizPhase = true;
      });
      _generateQuizQuestion();
    }
  }

  void _generateQuizQuestion() {
    // Select one of the 3 profiles randomly to quiz
    final targetProfile = _profiles[_random.nextInt(3)];
    final quizType = _random.nextInt(3); // 0: job from name, 1: hobby from name, 2: name from hobby

    setState(() {
      if (quizType == 0) {
        _questionText = "WHAT IS ${targetProfile['name']?.toUpperCase()}'S PROFESSION?";
        _correctOption = targetProfile['job']!;
        // Pool options from all jobs
        final Set<String> ops = {_correctOption};
        while (ops.length < 4) {
          ops.add(_jobs[_random.nextInt(_jobs.length)]);
        }
        _options = ops.toList()..shuffle();
      } else if (quizType == 1) {
        _questionText = "WHAT IS ${targetProfile['name']?.toUpperCase()}'S FAVORITE HOBBY?";
        _correctOption = targetProfile['hobby']!;
        final Set<String> ops = {_correctOption};
        while (ops.length < 4) {
          ops.add(_hobbies[_random.nextInt(_hobbies.length)]);
        }
        _options = ops.toList()..shuffle();
      } else {
        _questionText = "WHOSE PROFESSION IS ${targetProfile['job']?.toUpperCase()}?";
        _correctOption = targetProfile['name']!;
        final Set<String> ops = {_correctOption};
        while (ops.length < 4) {
          ops.add(_names[_random.nextInt(_names.length)]);
        }
        _options = ops.toList()..shuffle();
      }
    });
  }

  void _submitOption(String selected) {
    final isCorrect = selected == _correctOption;

    if (isCorrect) {
      HapticFeedbackUtil.success();
      _correctAnswers++;
    } else {
      HapticFeedbackUtil.error();
    }

    if (_quizQuestionIndex < totalQuestions - 1) {
      setState(() {
        _quizQuestionIndex++;
      });
      _generateQuizQuestion();
    } else {
      // Completed!
      final win = _correctAnswers >= 2; // Need 2 of 3 to pass
      if (win) {
        ref.read(gameStreakNotifierProvider.notifier).completeGame('fact_binder', xpAmount: 30);
      }
      
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => GameCompletionDialog(
          title: win ? "PROFILES BINDER SOLVED" : "PROFILES MISMATCHED",
          message: win
              ? "Magnificent semantic profile association memory! Correct answers: $_correctAnswers / $totalQuestions"
              : "You missed several associations. Keep training to link facts cleanly!",
          isVictory: win,
          onHome: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          onPlayAgain: () {
            Navigator.pop(context);
            setState(() {
              _memorizationIndex = 0;
              _quizQuestionIndex = 0;
              _correctAnswers = 0;
              _isQuizPhase = false;
            });
            _generateProfiles();
            _startMemorizationCycle();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GameScaffold(
      title: "FACT BINDER",
      subtitle: _isQuizPhase
          ? "ANSWER THE QUIZ QUESTIONS BASED ON THE MEMORIZED PROFILES!"
          : "MEMORIZE THE AVATAR PROFILE INFORMATION BEFORE THEY CHANGE!",
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
        child: Column(
          children: [
            const SizedBox(height: DesignSystem.spaceLG),
            
            // Memorization display
            if (!_isQuizPhase) ...[
              Text(
                "MEMORIZING: $_timeLeft s",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: DesignSystem.error,
                ),
              ),
              const Spacer(),
              
              // Character Card
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 320),
                  child: TangibleContainer(
                    color: colorScheme.surface,
                    shadowColor: DesignSystem.primary.withValues(alpha: 0.15),
                    padding: const EdgeInsets.all(28),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Avatar Sphere
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: DesignSystem.primary.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person_rounded,
                            size: 48,
                            color: DesignSystem.primary,
                          ),
                        ),
                        const SizedBox(height: DesignSystem.spaceLG),
                        Text(
                          _profiles[_memorizationIndex]['name']?.toUpperCase() ?? "",
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(height: DesignSystem.spaceMD),
                        Row(
                          children: [
                            const Icon(Icons.work_rounded, size: 16, color: DesignSystem.accentBerry),
                            const SizedBox(width: 8),
                            Text(
                              "JOB: ${_profiles[_memorizationIndex]['job']}",
                              style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        const SizedBox(height: DesignSystem.spaceSM),
                        Row(
                          children: [
                            const Icon(Icons.sports_esports_rounded, size: 16, color: DesignSystem.accentEmerald),
                            const SizedBox(width: 8),
                            Text(
                              "HOBBY: ${_profiles[_memorizationIndex]['hobby']}",
                              style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],

            // Quiz display
            if (_isQuizPhase) ...[
              Text(
                "QUESTION: ${_quizQuestionIndex + 1} / $totalQuestions",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: colorScheme.onSurface,
                ),
              ),
              const Spacer(),
              
              // Question Box
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TangibleContainer(
                  color: colorScheme.surface,
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    _questionText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: colorScheme.onSurface,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              
              // Multiple-Choice Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: DesignSystem.spaceMD,
                  mainAxisSpacing: DesignSystem.spaceMD,
                  childAspectRatio: 2.2,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  final opt = _options[index];
                  return TangibleButton(
                    onTap: () => _submitOption(opt),
                    color: colorScheme.surface,
                    shadowColor: colorScheme.outline,
                    child: Center(
                      child: Text(
                        opt,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: DesignSystem.space2XL),
            ],
          ],
        ),
      ),
    );
  }
}
