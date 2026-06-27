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

class ActionSequenceRecallScreen extends ConsumerStatefulWidget {
  const ActionSequenceRecallScreen({super.key});

  @override
  ConsumerState<ActionSequenceRecallScreen> createState() => _ActionSequenceRecallScreenState();
}

class _ActionSequenceRecallScreenState extends ConsumerState<ActionSequenceRecallScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 3;
  bool _isGameOver = false;

  final List<String> _actionsPool = ['Jump', 'Wave', 'Bow', 'Spin'];
  late List<String> _sequence;
  final List<String> _userSequence = [];

  bool _isSequencePlaying = true;
  String _activeVisualAction = '';
  int _playingIdx = 0;
  Timer? _sequenceTimer;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  @override
  void dispose() {
    _sequenceTimer?.cancel();
    super.dispose();
  }

  void _generatePuzzle() {
    _sequenceTimer?.cancel();
    _isSequencePlaying = true;
    _userSequence.clear();
    _playingIdx = 0;
    _activeVisualAction = '';

    // Generate sequence of actions. Length scales with score (start with 3 actions, then 4, then 5)
    final seqLength = 3 + _score;
    _sequence = List.generate(seqLength, (i) => _actionsPool[_random.nextInt(_actionsPool.length)]);

    // Start playing sequence with a slight delay
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        _playSequence();
      }
    });
  }

  void _playSequence() {
    _sequenceTimer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (_playingIdx < _sequence.length) {
        setState(() {
          _activeVisualAction = _sequence[_playingIdx];
        });
        HapticFeedbackUtil.lightImpact();

        // Clear action briefly before next one
        Future.delayed(const Duration(milliseconds: 600), () {
          if (mounted) {
            setState(() {
              _activeVisualAction = '';
            });
          }
        });

        _playingIdx++;
      } else {
        timer.cancel();
        setState(() {
          _isSequencePlaying = false;
        });
      }
    });
  }

  void _onActionTapped(String action) {
    if (_isSequencePlaying || _isGameOver) return;

    HapticFeedbackUtil.lightImpact();
    setState(() {
      _userSequence.add(action);
      
      // Flash the selected action visually
      _activeVisualAction = action;
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) {
          setState(() {
            _activeVisualAction = '';
          });
        }
      });

      // Verify sequence correctness so far
      final idx = _userSequence.length - 1;
      if (_userSequence[idx] != _sequence[idx]) {
        HapticFeedbackUtil.error();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.snackbarIncorrectSequence),
            backgroundColor: DesignSystem.gameRed,
            duration: Duration(seconds: 1),
          ),
        );
        _generatePuzzle();
      } else {
        // Correct so far, check if finished
        if (_userSequence.length == _sequence.length) {
          _score++;
          HapticFeedbackUtil.success();
          if (_score >= _targetScore) {
            _isGameOver = true;
            _onGameComplete();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppLocalizations.of(context)!.snackbarSequenceMatched),
                backgroundColor: DesignSystem.gameGreen,
                duration: Duration(seconds: 1),
              ),
            );
            _generatePuzzle();
          }
        }
      }
    });
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('action_sequence_recall');
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
      title: L10nGameHelpers.getGameTitle(context, 'action_sequence_recall'),
      subtitle: _isSequencePlaying
          ? AppLocalizations.of(context)!.phaseWatchCarefully
          : AppLocalizations.of(context)!.phaseRepeatPattern,
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
      body: Padding(
        padding: const EdgeInsets.all(DesignSystem.spaceMD),
        child: Column(
          children: [
            // Score Board
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: DesignSystem.primary.withValues(alpha: 0.15),
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
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Visual character stage area
                    Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _activeVisualAction.isNotEmpty
                              ? DesignSystem.primary
                              : (isDark ? DesignSystem.darkOutline : DesignSystem.outline),
                          width: _activeVisualAction.isNotEmpty ? 4 : 2,
                        ),
                        boxShadow: _activeVisualAction.isNotEmpty
                            ? [
                                BoxShadow(
                                  color: DesignSystem.primary.withValues(alpha: 0.3),
                                  blurRadius: 15,
                                  spreadRadius: 2,
                                )
                              ]
                            : null,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _getVisualEmote(_activeVisualAction),
                              style: const TextStyle(fontSize: 72),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              _activeVisualAction.isNotEmpty ? _activeVisualAction.toUpperCase() : 'STANDBY',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: _activeVisualAction.isNotEmpty
                                    ? DesignSystem.primary
                                    : (isDark ? Colors.white30 : Colors.black38),
                                letterSpacing: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    if (!_isSequencePlaying) ...[
                      Text(
                        'YOUR TURN',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.2),
                      ),
                      const SizedBox(height: 20),
                      // Action buttons
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        alignment: WrapAlignment.center,
                        children: _actionsPool.map((act) {
                          return SizedBox(
                            width: 130,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () => _onActionTapped(act),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isDark ? DesignSystem.darkSurface : Colors.white,
                                side: BorderSide(
                                  color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                                  width: 1.5,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    _getVisualEmote(act),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    act,
                                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ] else ...[
                      Text(
                        'WATCH SEQUENCE...',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getVisualEmote(String action) {
    switch (action) {
      case 'Jump':
        return '🦘';
      case 'Wave':
        return '👋';
      case 'Bow':
        return '🙇';
      case 'Spin':
        return '🌀';
      default:
        return '🤖';
    }
  }
}
