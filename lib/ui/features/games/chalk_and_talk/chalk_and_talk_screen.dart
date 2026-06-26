import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class ChalkAndTalkScreen extends ConsumerStatefulWidget {
  const ChalkAndTalkScreen({super.key});

  @override
  ConsumerState<ChalkAndTalkScreen> createState() => _ChalkAndTalkScreenState();
}

class _ChalkAndTalkScreenState extends ConsumerState<ChalkAndTalkScreen> {
  final Random _random = Random();
  final TextEditingController _textController = TextEditingController();

  final List<String> _words = [
    'CAT', 'DOG', 'RED', 'BLUE', 'SUN', 'MOON', 'TREE', 'BIRD', 'FISH', 'STAR',
    'BALL', 'BOOK', 'CUP', 'KEY', 'LAMP', 'DOOR', 'WIND', 'FIRE', 'ROAD', 'SHIP'
  ];

  late String _voiceWord;  // Word the user "hears" (represented visually as a speaker + subtitle later, or text clue here)
  late String _visualWord; // Word shown on the blackboard (the distractor)

  int _score = 0;
  final int _targetScore = 5;
  bool _isGameOver = false;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _textController.clear();
    // Choose two distinct words
    final voiceIdx = _random.nextInt(_words.length);
    int visualIdx = _random.nextInt(_words.length);
    while (visualIdx == voiceIdx) {
      visualIdx = _random.nextInt(_words.length);
    }

    setState(() {
      _voiceWord = _words[voiceIdx];
      _visualWord = _words[visualIdx];
    });
  }

  void _onSubmit() {
    if (_isGameOver) return;

    final entry = _textController.text.trim().toUpperCase();
    if (entry == _voiceWord) {
      _score++;
      HapticFeedbackUtil.success();
      if (_score >= _targetScore) {
        _isGameOver = true;
        _onGameComplete();
      } else {
        _generatePuzzle();
      }
    } else {
      _score = max(0, _score - 1);
      HapticFeedbackUtil.error();
      _generatePuzzle();
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('chalk_and_talk');
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
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: 'CHALK & TALK',
      subtitle: 'Read the HEARD word cue at the top, type it while ignoring the blackboard distractor.',
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
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(DesignSystem.spaceMD),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Score
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: DesignSystem.primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                ),
                child: Text(
                  'Score: $_score / $_targetScore',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: DesignSystem.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 30),
              // Heard/Voice Cue indicator (simulating what the user "hears")
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark ? DesignSystem.darkSurface : Colors.grey[100],
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.volume_up_rounded, color: Colors.blue, size: 28),
                    const SizedBox(width: 12),
                    Text(
                      'YOU HEAR:  "$_voiceWord"',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.0,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Blackboard Distractor Area
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E3A2F), // Chalkboard green
                  borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                  border: Border.all(color: const Color(0xFF8B5A2B), width: 8), // Wood border
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  _visualWord,
                  style: const TextStyle(
                    fontFamily: 'Courier',
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                    letterSpacing: 4.0,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Input Field
              SizedBox(
                width: 250,
                child: TextField(
                  controller: _textController,
                  autocorrect: false,
                  enableSuggestions: false,
                  textCapitalization: TextCapitalization.characters,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 2.0),
                  decoration: InputDecoration(
                    hintText: 'TYPE THE HEARD WORD',
                    hintStyle: const TextStyle(fontSize: 14, letterSpacing: 1.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: DesignSystem.primary, width: 2),
                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                    ),
                  ),
                  onSubmitted: (_) => _onSubmit(),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: _onSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: DesignSystem.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                    ),
                  ),
                  child: const Text('SUBMIT', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
