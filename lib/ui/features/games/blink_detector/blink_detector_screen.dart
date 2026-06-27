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

class BlinkDetectorScreen extends ConsumerStatefulWidget {
  const BlinkDetectorScreen({super.key});

  @override
  ConsumerState<BlinkDetectorScreen> createState() => _BlinkDetectorScreenState();
}

class _BlinkDetectorScreenState extends ConsumerState<BlinkDetectorScreen> {
  final Random _random = Random();
  late Timer _blinkTimer;

  // Grid Config: 4x4 faces
  final int _gridSize = 4;
  late List<List<bool>> _isBlinking; // State of blinking eyes
  late int _targetRow;
  late int _targetCol;

  int _score = 0;
  final int _targetScore = 10;
  bool _isGameOver = false;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    _score = 0;
    _isGameOver = false;
    _generatePuzzle();
    _startBlinkingLoop();
  }

  void _generatePuzzle() {
    _isBlinking = List.generate(_gridSize, (_) => List.filled(_gridSize, false));
    _targetRow = _random.nextInt(_gridSize);
    _targetCol = _random.nextInt(_gridSize);
  }

  void _startBlinkingLoop() {
    // Schedule repeating blink loops every 2 seconds
    _blinkTimer = Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      if (_isGameOver) return;

      // 1. Trigger single blinks on random distractors
      for (int i = 0; i < 3; i++) {
        final r = _random.nextInt(_gridSize);
        final c = _random.nextInt(_gridSize);
        if (r == _targetRow && c == _targetCol) continue;
        _triggerBlink(r, c, durationMs: 250);
      }

      // 2. Trigger double blink on the target face
      _triggerBlink(_targetRow, _targetCol, durationMs: 150);
      Future.delayed(const Duration(milliseconds: 250), () {
        if (!mounted || _isGameOver) return;
        _triggerBlink(_targetRow, _targetCol, durationMs: 150);
      });
    });
  }

  void _triggerBlink(int r, int c, {required int durationMs}) {
    if (!mounted || _isGameOver) return;
    setState(() {
      _isBlinking[r][c] = true;
    });

    Future.delayed(Duration(milliseconds: durationMs), () {
      if (!mounted || _isGameOver) return;
      setState(() {
        _isBlinking[r][c] = false;
      });
    });
  }

  void _onFaceTap(int r, int c) {
    if (_isGameOver) return;

    if (r == _targetRow && c == _targetCol) {
      _score++;
      HapticFeedbackUtil.success();
      if (_score >= _targetScore) {
        _isGameOver = true;
        _onGameComplete();
      } else {
        setState(() {
          _generatePuzzle();
        });
      }
    } else {
      _score = max(0, _score - 2);
      HapticFeedbackUtil.error();
    }
  }

  void _onGameComplete() async {
    _blinkTimer.cancel();
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('blink_detector');
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
    _blinkTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'blink_detector'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'blink_detector'),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            _blinkTimer.cancel();
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
                Flexible(
                  child: const Text(
                    'Distractors blink once, Target blinks twice',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: DesignSystem.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                  ),
                  child: Text(
                    '${AppLocalizations.of(context)!.statScore}: $_score / $_targetScore',
                    style: TextStyle(fontWeight: FontWeight.bold, color: DesignSystem.primary),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  margin: const EdgeInsets.all(DesignSystem.spaceMD),
                  decoration: BoxDecoration(
                    color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                    borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                    border: Border.all(color: isDark ? DesignSystem.darkOutline : DesignSystem.outline, width: 2),
                  ),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _gridSize,
                    ),
                    itemCount: _gridSize * _gridSize,
                    itemBuilder: (context, index) {
                      final r = index ~/ _gridSize;
                      final c = index % _gridSize;
                      final isBlinking = _isBlinking[r][c];

                      return GestureDetector(
                        onTapDown: (_) => _onFaceTap(r, c),
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: isDark ? Colors.white10 : Colors.black.withValues(alpha: 0.03),
                            borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Eyes
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 12,
                                    height: isBlinking ? 2 : 12,
                                    decoration: BoxDecoration(
                                      color: isDark ? Colors.white : Colors.black87,
                                      borderRadius: isBlinking ? null : BorderRadius.circular(6),
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Container(
                                    width: 12,
                                    height: isBlinking ? 2 : 12,
                                    decoration: BoxDecoration(
                                      color: isDark ? Colors.white : Colors.black87,
                                      borderRadius: isBlinking ? null : BorderRadius.circular(6),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              // Mouth
                              Container(
                                width: 28,
                                height: 3,
                                decoration: BoxDecoration(
                                  color: isDark ? Colors.white70 : Colors.black54,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
