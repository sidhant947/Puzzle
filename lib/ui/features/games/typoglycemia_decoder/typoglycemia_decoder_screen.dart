import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class TypoglycemiaDecoderScreen extends ConsumerStatefulWidget {
  const TypoglycemiaDecoderScreen({super.key});

  @override
  ConsumerState<TypoglycemiaDecoderScreen> createState() => _TypoglycemiaDecoderScreenState();
}

class _TypoglycemiaDecoderScreenState extends ConsumerState<TypoglycemiaDecoderScreen> {
  final List<String> _sentencePool = [
    "According to research at Cambridge University, the order of letters doesn't matter.",
    "The only important thing is that the first and last letter be in the right place.",
    "This is because the human mind does not read every letter by itself, but the word as a whole.",
    "A scrambled sentence is easy to read if the first and last letters are correct.",
    "Your brain can decode spelling mistakes and jumbled text without much effort.",
    "Reading typoglycemia text exercises your cognitive processing speed and vocabulary.",
    "Cognitive training helps improve focus, memory, and spatial reasoning skills.",
    "Solving puzzles every day keeps the brain active and sharpens concentration.",
    "Scientific studies show that reading jumbled words is a natural brain behavior.",
    "You are currently training your brain with these interactive mini-games.",
  ];

  late String _currentScrambled;
  late List<String> _currentOptions;
  late int _correctAnswerIndex;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    final random = Random();
    final sentence = _sentencePool[random.nextInt(_sentencePool.length)];

    final words = sentence.split(' ');
    final scrambledWords = words.map((word) {
      if (word.length <= 3) return word;
      String cleanWord = word;
      String punctuation = '';
      if (RegExp(r'[.,!?]').hasMatch(word.substring(word.length - 1))) {
        cleanWord = word.substring(0, word.length - 1);
        punctuation = word.substring(word.length - 1);
      }
      if (cleanWord.length <= 3) return word;
      
      final first = cleanWord.substring(0, 1);
      final last = cleanWord.substring(cleanWord.length - 1);
      final middle = cleanWord.substring(1, cleanWord.length - 1).split('');
      middle.shuffle(random);
      return '$first${middle.join()}$last$punctuation';
    }).toList();

    _currentScrambled = scrambledWords.join(' ');

    final d1Words = sentence.split(' ');
    if (d1Words.length > 3) {
      final temp = d1Words[2];
      d1Words[2] = d1Words[3];
      d1Words[3] = temp;
    }
    final d1 = d1Words.join(' ');

    String d2 = sentence
        .replaceAll('research', 'researcher')
        .replaceAll('important', 'impotent')
        .replaceAll('human', 'humor')
        .replaceAll('scrambled', 'screaming')
        .replaceAll('brain', 'brand')
        .replaceAll('puzzles', 'puddles')
        .replaceAll('interactive', 'internet');
    if (d2 == sentence) {
      d2 = '$sentence Extra.';
    }

    String d3 = sentence.replaceAll(' the ', ' that ').replaceAll(' to ', ' too ').replaceAll(' is ', ' was ');
    if (d3 == sentence) {
      d3 = '${sentence.substring(0, sentence.length - 1)}?';
    }

    final allOptions = [sentence, d1, d2, d3];
    allOptions.shuffle(random);

    _correctAnswerIndex = allOptions.indexOf(sentence);
    _currentOptions = allOptions;
  }

  void _onOptionSelected(int index) {
    if (index == _correctAnswerIndex) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('typoglycemia_decoder');
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => GameCompletionDialog(
          title: AppLocalizations.of(context)!.winDecodedCorrectly,
          message: AppLocalizations.of(context)!.winDecodedMessage,
          onPlayAgain: () {
            setState(() {
              _generatePuzzle();
            });
            Navigator.pop(context);
          },
          onHome: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
      );
    } else {
      HapticFeedbackUtil.error();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.snackbarIncorrectLookClose),
          duration: Duration(milliseconds: 1500),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final String scrambled = _currentScrambled;
    final List<String> options = _currentOptions;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'typoglycemia_decoder'),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.phaseDecodeTheSentence, style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),
            // Scrambled Text Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: TangibleContainer(
                depth: 3,
                color: DesignSystem.gamePurple,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.phaseDecodeTheSentence.toUpperCase(),
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.2, fontSize: 13),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        scrambled,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600, height: 1.4),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Options List
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => _onOptionSelected(index),
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text(
                            options[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, height: 1.3),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
