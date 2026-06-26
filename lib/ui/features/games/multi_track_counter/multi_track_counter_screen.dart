import 'dart:async';
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

class MultiTrackCounterScreen extends ConsumerStatefulWidget {
  const MultiTrackCounterScreen({super.key});

  @override
  ConsumerState<MultiTrackCounterScreen> createState() => _MultiTrackCounterScreenState();
}

class _MultiTrackCounterScreenState extends ConsumerState<MultiTrackCounterScreen> {
  final Random _random = Random();
  late Timer _gameTimer;
  int _score = 0;
  final int _targetScore = 10;
  bool _isGameOver = false;

  // Game configuration
  final int _targetMultiplier = 5; // e.g. multiples of 5 are the targets
  late List<int> _trackValues;
  late List<double> _trackSpeeds; // time in seconds between updates
  late List<double> _timeSinceLastUpdate;
  final int _numTracks = 3;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    _score = 0;
    _isGameOver = false;
    _trackValues = List.generate(_numTracks, (_) => _random.nextInt(15) + 1);
    // Speeds range from 0.8s to 2.0s
    _trackSpeeds = List.generate(_numTracks, (index) => 0.8 + _random.nextDouble() * 1.2);
    _timeSinceLastUpdate = List.filled(_numTracks, 0.0);

    // Periodically update the timers (every 100ms)
    _gameTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_isGameOver) return;
      _updateTracks();
    });
  }

  void _updateTracks() {
    setState(() {
      for (int i = 0; i < _numTracks; i++) {
        _timeSinceLastUpdate[i] += 0.1;
        if (_timeSinceLastUpdate[i] >= _trackSpeeds[i]) {
          _timeSinceLastUpdate[i] = 0.0;
          // Increment or decrement slightly
          _trackValues[i] = (_trackValues[i] + 1) % 50;
          // 10% chance to change speed slightly to keep player on toes
          if (_random.nextDouble() < 0.1) {
            _trackSpeeds[i] = 0.6 + _random.nextDouble() * 1.4;
          }
        }
      }
    });
  }

  void _handleTrackTap(int trackIndex) {
    if (_isGameOver) return;

    final value = _trackValues[trackIndex];
    final isMatch = value > 0 && value % _targetMultiplier == 0;

    setState(() {
      if (isMatch) {
        _score++;
        HapticFeedbackUtil.success();
        // Reset the value to a random non-matching number to avoid double-tap abuse
        int newVal = _random.nextInt(15) + 1;
        while (newVal % _targetMultiplier == 0) {
          newVal = _random.nextInt(15) + 1;
        }
        _trackValues[trackIndex] = newVal;

        if (_score >= _targetScore) {
          _isGameOver = true;
          _onGameComplete();
        }
      } else {
        _score = max(0, _score - 1);
        HapticFeedbackUtil.error();
        // Shift speed as a small visual indicator/penalty
        _trackSpeeds[trackIndex] = 0.5;
      }
    });
  }

  void _onGameComplete() async {
    _gameTimer.cancel();
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('multi_track_counter');
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
    _gameTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'multi_track_counter'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'multi_track_counter'),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            _gameTimer.cancel();
            setState(() {
              _startNewGame();
            });
          },
        ),
      ],
      body: Padding(
        padding: const EdgeInsets.all(DesignSystem.spaceMD),
        child: Column(
          children: [
            // Score Banner
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: DesignSystem.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                border: Border.all(color: DesignSystem.primary.withOpacity(0.2), width: 1.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TARGET RULE:',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white70 : Colors.black87,
                        ),
                  ),
                  Text(
                    'Multiple of $_targetMultiplier',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: DesignSystem.gameOrange,
                        ),
                  ),
                  Text(
                    '$_score / $_targetScore',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: DesignSystem.primary,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // The Lanes
            Expanded(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _numTracks,
                separatorBuilder: (context, index) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final val = _trackValues[index];
                  final isTarget = val > 0 && val % _targetMultiplier == 0;
                  final progress = _timeSinceLastUpdate[index] / _trackSpeeds[index];

                  return InkWell(
                    onTap: () => _handleTrackTap(index),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                        border: Border.all(
                          color: isTarget
                              ? DesignSystem.gameOrange.withOpacity(0.8)
                              : (isDark ? DesignSystem.darkOutline : DesignSystem.outline),
                          width: isTarget ? 3.0 : 1.5,
                        ),
                        boxShadow: isTarget
                            ? [
                                BoxShadow(
                                  color: DesignSystem.gameOrange.withOpacity(0.2),
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                )
                              ]
                            : null,
                      ),
                      child: Stack(
                        children: [
                          // Progress indicator for updates
                          Positioned(
                            left: 0,
                            bottom: 0,
                            right: 0,
                            height: 6,
                            child: LinearProgressIndicator(
                              value: progress,
                              backgroundColor: Colors.transparent,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                isTarget
                                    ? DesignSystem.gameOrange.withOpacity(0.5)
                                    : DesignSystem.primary.withOpacity(0.3),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.speed_rounded,
                                      color: isDark ? Colors.white60 : Colors.black45,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      'LANE ${index + 1}',
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: isDark ? Colors.white60 : Colors.black.withValues(alpha: 0.57),
                                          ),
                                    ),
                                  ],
                                ),
                                // Value bubble
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: isTarget
                                        ? DesignSystem.gameOrange
                                        : (isDark ? Colors.grey[800] : Colors.grey[200]),
                                    shape: BoxShape.circle,
                                    boxShadow: isTarget
                                        ? [
                                            BoxShadow(
                                              color: DesignSystem.gameOrange.withOpacity(0.4),
                                              blurRadius: 8,
                                              spreadRadius: 2,
                                            )
                                          ]
                                        : null,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '$val',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: isTarget ? Colors.white : (isDark ? Colors.white : Colors.black87),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
