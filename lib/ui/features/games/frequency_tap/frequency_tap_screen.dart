import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class FrequencyTapScreen extends ConsumerStatefulWidget {
  const FrequencyTapScreen({super.key});

  @override
  ConsumerState<FrequencyTapScreen> createState() => _FrequencyTapScreenState();
}

class _FrequencyTapScreenState extends ConsumerState<FrequencyTapScreen> with TickerProviderStateMixin {
  final Random _random = Random();

  // Two pulsing lights
  late AnimationController _pulseControllerA;
  late AnimationController _pulseControllerB;

  late double _freqA; // e.g. 1.0Hz or 2.5Hz
  late double _freqB;

  // Active target details
  late double _targetFrequency;
  late int _targetIndex; // 0 for A, 1 for B

  int _score = 0;
  final int _targetScore = 10;
  bool _isGameOver = false;

  @override
  void initState() {
    super.initState();
    _pulseControllerA = AnimationController(vsync: this);
    _pulseControllerB = AnimationController(vsync: this);

    _startNewGame();
  }

  void _startNewGame() {
    _score = 0;
    _isGameOver = false;
    _generatePuzzle();
  }

  void _generatePuzzle() {
    // Generate distinct frequencies: Slow (e.g. 1.0 Hz) vs Fast (e.g. 3.0 Hz)
    final frequencies = [1.0, 2.5, 4.0];
    frequencies.shuffle(_random);

    _freqA = frequencies[0];
    _freqB = frequencies[1];

    _pulseControllerA.duration = Duration(milliseconds: (1000 / _freqA).round());
    _pulseControllerB.duration = Duration(milliseconds: (1000 / _freqB).round());

    _pulseControllerA.repeat(reverse: true);
    _pulseControllerB.repeat(reverse: true);

    setState(() {
      _targetIndex = _random.nextInt(2);
      _targetFrequency = (_targetIndex == 0) ? _freqA : _freqB;
    });
  }

  void _onSelect(int index) {
    if (_isGameOver) return;

    if (index == _targetIndex) {
      _score++;
      HapticFeedbackUtil.success();
      if (_score >= _targetScore) {
        _isGameOver = true;
        _onGameComplete();
      } else {
        _generatePuzzle();
      }
    } else {
      _score = max(0, _score - 2);
      HapticFeedbackUtil.error();
      _generatePuzzle();
    }
  }

  void _onGameComplete() async {
    _pulseControllerA.stop();
    _pulseControllerB.stop();
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('frequency_tap');
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
            _startNewGame();
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _pulseControllerA.dispose();
    _pulseControllerB.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: 'FREQUENCY TAP',
      subtitle: 'Identify which pulsing light matches the requested target frequency.',
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            setState(() {
              _startNewGame();
            });
          },
        ),
      ],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Compare pulse rates side by side',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: DesignSystem.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                  ),
                  child: Text(
                    'Score: $_score / $_targetScore',
                    style: TextStyle(fontWeight: FontWeight.bold, color: DesignSystem.primary),
                  ),
                ),
              ],
            ),
          ),
          // Target Display Card
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: DesignSystem.gameOrange.withOpacity(0.15),
              borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
              border: Border.all(color: DesignSystem.gameOrange, width: 2),
            ),
            child: Text(
              'FIND: $_targetFrequency Hz  (pulses/sec)',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: DesignSystem.gameOrange,
                letterSpacing: 1.0,
              ),
            ),
          ),
          // Pulsing Area
          Expanded(
            child: Row(
              children: [
                // Light A
                Expanded(
                  child: GestureDetector(
                    onTapDown: (_) => _onSelect(0),
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDark ? DesignSystem.darkSurface : Colors.grey[100],
                        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                        border: Border.all(color: isDark ? DesignSystem.darkOutline : DesignSystem.outline),
                      ),
                      alignment: Alignment.center,
                      child: AnimatedBuilder(
                        animation: _pulseControllerA,
                        builder: (context, child) {
                          final double scale = 0.5 + 0.5 * _pulseControllerA.value;
                          return Container(
                            width: 120 * scale,
                            height: 120 * scale,
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.8 * _pulseControllerA.value),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.4),
                                  blurRadius: 15,
                                  spreadRadius: 3,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                // Light B
                Expanded(
                  child: GestureDetector(
                    onTapDown: (_) => _onSelect(1),
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDark ? DesignSystem.darkSurface : Colors.grey[100],
                        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                        border: Border.all(color: isDark ? DesignSystem.darkOutline : DesignSystem.outline),
                      ),
                      alignment: Alignment.center,
                      child: AnimatedBuilder(
                        animation: _pulseControllerB,
                        builder: (context, child) {
                          final double scale = 0.5 + 0.5 * _pulseControllerB.value;
                          return Container(
                            width: 120 * scale,
                            height: 120 * scale,
                            decoration: BoxDecoration(
                              color: Colors.purple.withOpacity(0.8 * _pulseControllerB.value),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.purple.withOpacity(0.4),
                                  blurRadius: 15,
                                  spreadRadius: 3,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'TAP THE PANEL THAT MATCHES THE TARGET PULSE RATE',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
