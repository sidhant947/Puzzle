import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class ShellGameScreen extends ConsumerStatefulWidget {
  const ShellGameScreen({super.key});

  @override
  ConsumerState<ShellGameScreen> createState() => _ShellGameScreenState();
}

class _ShellGameScreenState extends ConsumerState<ShellGameScreen> {
  final Random _random = Random();

  // Cup index (0, 1, 2). The ball is always under Cup 0.
  // We keep track of which slot (0: Left, 1: Middle, 2: Right) each cup is in.
  // cupSlots[i] is the slot index for Cup i.
  late List<int> _cupSlots;

  bool _isShuffling = false;
  bool _revealed = true;
  String _statusText = 'Find the ball under the yellow cup!';
  int? _tappedCupIndex;

  @override
  void initState() {
    super.initState();
    _resetGame();
  }

  void _resetGame() {
    setState(() {
      _cupSlots = [0, 1, 2]; // Cup 0 in slot 0, Cup 1 in slot 1, Cup 2 in slot 2.
      _revealed = true;
      _isShuffling = false;
      _tappedCupIndex = null;
      _statusText = 'The ball is under the highlighted cup (Left). Remember it!';
    });
  }

  void _startShuffle() {
    HapticFeedbackUtil.lightImpact();
    setState(() {
      _revealed = false;
      _isShuffling = true;
      _statusText = 'WATCH CAREFULLY...';
    });

    int swapsRemaining = _random.nextInt(7) + 9; // Random 9 to 15 swaps
    Timer.periodic(const Duration(milliseconds: 330), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (swapsRemaining > 0) {
        // Pick two random cups to swap slots
        int cupA = _random.nextInt(3);
        int cupB = (cupA + 1 + _random.nextInt(2)) % 3;

        setState(() {
          final temp = _cupSlots[cupA];
          _cupSlots[cupA] = _cupSlots[cupB];
          _cupSlots[cupB] = temp;
        });

        HapticFeedbackUtil.lightImpact();
        swapsRemaining--;
      } else {
        timer.cancel();
        setState(() {
          _isShuffling = false;
          _statusText = 'TAP THE CUP WITH THE BALL!';
        });
      }
    });
  }

  void _onCupTapped(int cupIndex) {
    if (_isShuffling || !_revealed && _tappedCupIndex != null) return;
    if (_revealed) {
      // Game hasn't started shuffle
      _startShuffle();
      return;
    }

    setState(() {
      _tappedCupIndex = cupIndex;
      _revealed = true;
    });

    final isCorrect = cupIndex == 0; // Cup 0 contains the ball

    if (isCorrect) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('shell_game');
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'FOUND IT!',
            message: 'Excellent tracking speed!',
            onPlayAgain: () {
              setState(() {
                _resetGame();
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
      setState(() {
        _statusText = 'Wrong cup! The ball was under the highlighted cup.';
      });
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => GameCompletionDialog(
          title: 'MISSED IT!',
          message: 'Keep your eyes on the target.',
          onPlayAgain: () {
            _resetGame();
            Navigator.pop(context);
          },
          onHome: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GameScaffold(
      title: 'SHELL GAME',
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Track the ball', style: Theme.of(context).textTheme.titleMedium),
                  IconButton(
                    icon: const Icon(Icons.refresh_rounded),
                    onPressed: _resetGame,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              _statusText,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 64),
            // The Cups Area
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final double w = constraints.maxWidth;
                      final double cupW = 80.0;
                      final double slotStep = (w - cupW) / 2;

                      return Stack(
                        alignment: Alignment.center,
                        children: List.generate(3, (cupIndex) {
                          // Cup 0 is the ball-carrying cup (colored yellow/orange for start)
                          final currentSlot = _cupSlots[cupIndex];
                          final double leftPosition = currentSlot * slotStep;

                          return AnimatedPositioned(
                            duration: const Duration(milliseconds: 260),
                            curve: Curves.easeInOut,
                            left: leftPosition,
                            child: GestureDetector(
                              onTap: () => _onCupTapped(cupIndex),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // The Cup container
                                  Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      // Under cup: Ball (if revealed and it is Cup 0)
                                      if (_revealed && cupIndex == 0)
                                        Container(
                                          margin: const EdgeInsets.only(bottom: 10),
                                          width: 28,
                                          height: 28,
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      // Cup itself: move up if revealed
                                      AnimatedContainer(
                                        duration: const Duration(milliseconds: 220),
                                        margin: EdgeInsets.only(bottom: _revealed ? 45.0 : 0.0),
                                        width: cupW,
                                        height: 90,
                                        decoration: BoxDecoration(
                                          color: cupIndex == 0 && _revealed ? DesignSystem.gameAmber : colorScheme.onSurface,
                                          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.15),
                                              blurRadius: 4,
                                              offset: const Offset(0, 4),
                                            )
                                          ]
                                        ),
                                        child: const SizedBox.shrink(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
              ),
            ),
            if (_revealed && _tappedCupIndex == null)
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: ElevatedButton(
                  onPressed: _startShuffle,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: DesignSystem.gameAmber,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                  ),
                  child: const Text('SHUFFLE CUPS', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
