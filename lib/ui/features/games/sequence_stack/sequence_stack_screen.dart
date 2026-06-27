import 'dart:async';
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

enum OpType { push, pop }

class StackOp {
  final OpType type;
  final String? color; // 'RED', 'GREEN', 'BLUE', 'YELLOW'

  StackOp({required this.type, this.color});
}

class SequenceStackScreen extends ConsumerStatefulWidget {
  const SequenceStackScreen({super.key});

  @override
  ConsumerState<SequenceStackScreen> createState() => _SequenceStackScreenState();
}

class _SequenceStackScreenState extends ConsumerState<SequenceStackScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 5;
  bool _isGameOver = false;

  // Phases: 'idle' -> 'playing_ops' -> 'recall'
  String _phase = 'idle';

  final List<StackOp> _ops = [];
  int _currentOpIndex = -1;
  Timer? _opTimer;

  late List<String> _correctStack;
  final List<String> _userStack = [];

  final List<String> _colors = ['RED', 'GREEN', 'BLUE', 'YELLOW'];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _opTimer?.cancel();
    super.dispose();
  }

  void _generatePuzzle() {
    _userStack.clear();
    _ops.clear();
    _currentOpIndex = -1;

    final simulated = <String>[];

    // Generate 5 random operations
    for (int i = 0; i < 5; i++) {
      // 30% chance to pop if stack is not empty
      if (simulated.isNotEmpty && _random.nextDouble() < 0.3) {
        simulated.removeLast();
        _ops.add(StackOp(type: OpType.pop));
      } else {
        final color = _colors[_random.nextInt(_colors.length)];
        simulated.add(color);
        _ops.add(StackOp(type: OpType.push, color: color));
      }
    }

    _correctStack = List<String>.from(simulated);
  }

  void _startOperations() {
    _generatePuzzle();
    setState(() {
      _phase = 'playing_ops';
      _currentOpIndex = 0;
    });

    _opTimer?.cancel();
    _opTimer = Timer.periodic(const Duration(milliseconds: 1600), (timer) {
      if (!mounted) return;
      setState(() {
        if (_currentOpIndex < _ops.length - 1) {
          _currentOpIndex++;
        } else {
          _opTimer?.cancel();
          _phase = 'recall';
        }
      });
    });
  }

  void _addColorToUserStack(String color) {
    if (_phase != 'recall') return;
    HapticFeedbackUtil.lightImpact();
    setState(() {
      if (_userStack.length < 5) {
        _userStack.add(color);
      }
    });
  }

  void _popUserStack() {
    if (_phase != 'recall' || _userStack.isEmpty) return;
    HapticFeedbackUtil.lightImpact();
    setState(() {
      _userStack.removeLast();
    });
  }

  void _onSubmit() {
    if (_phase != 'recall' || _isGameOver) return;

    // Compare lists
    bool isCorrect = _userStack.length == _correctStack.length;
    if (isCorrect) {
      for (int i = 0; i < _userStack.length; i++) {
        if (_userStack[i] != _correctStack[i]) {
          isCorrect = false;
          break;
        }
      }
    }

    if (isCorrect) {
      _score++;
      HapticFeedbackUtil.success();
      if (_score >= _targetScore) {
        _isGameOver = true;
        _onGameComplete();
      } else {
        _startOperations();
      }
    } else {
      HapticFeedbackUtil.error();
      final l10n = AppLocalizations.of(context)!;
      final correctStr = _correctStack.isEmpty ? 'EMPTY' : _correctStack.join(' -> ');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.snackbarIncorrectCorrectStack(correctStr)),
          duration: const Duration(milliseconds: 2000),
          backgroundColor: Colors.redAccent,
        ),
      );
      _startOperations();
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('sequence_stack');
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
            _phase = 'idle';
          });
        },
      ),
    );
  }

  Color _getColor(String colorName) {
    switch (colorName) {
      case 'RED': return Colors.redAccent;
      case 'GREEN': return Colors.green;
      case 'BLUE': return Colors.blue;
      case 'YELLOW': return Colors.amber;
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'sequence_stack'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'sequence_stack'),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            _opTimer?.cancel();
            setState(() {
              _score = 0;
              _isGameOver = false;
              _phase = 'idle';
            });
          },
        ),
      ],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(DesignSystem.spaceMD),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Score / Status
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
              if (_phase == 'idle') ...[
                const Icon(Icons.layers_rounded, size: 80, color: DesignSystem.primary),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _startOperations,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: DesignSystem.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignSystem.radiusMD)),
                  ),
                  child: Text(AppLocalizations.of(context)!.btnStartGame, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ] else if (_phase == 'playing_ops') ...[
                // Op animation card
                _buildOpAnimationCard(isDark),
                const SizedBox(height: 20),
                Text(
                  'Operation ${_currentOpIndex + 1} of ${_ops.length}',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ] else ...[
                // Recall phase: Rebuilding stack
                Expanded(
                  child: Row(
                    children: [
                      // User's stack display (left half)
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppLocalizations.of(context)!.target, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 12)),
                            const SizedBox(height: 12),
                            Container(
                              width: 110,
                              height: 220,
                              decoration: BoxDecoration(
                                color: isDark ? Colors.white10 : Colors.black12.withValues(alpha: 0.04),
                                borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                                border: Border.all(color: isDark ? Colors.white24 : Colors.black26),
                              ),
                              child: _userStack.isEmpty
                                  ? Center(child: Text(AppLocalizations.of(context)!.target, style: TextStyle(color: Colors.grey)))
                                  : Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: _userStack.reversed.map((colorName) {
                                        return Container(
                                          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: _getColor(colorName),
                                            borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            colorName,
                                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                            ),
                          ],
                        ),
                      ),
                      // Controls (right half)
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppLocalizations.of(context)!.target, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 12)),
                            const SizedBox(height: 12),
                            ..._colors.map((c) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4.0),
                                child: SizedBox(
                                  width: 120,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () => _addColorToUserStack(c),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: _getColor(c),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignSystem.radiusSM)),
                                    ),
                                    child: Text(c, style: const TextStyle(fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              );
                            }),
                            const SizedBox(height: 10),
                            IconButton(
                              icon: const Icon(Icons.backspace_rounded, size: 28, color: Colors.redAccent),
                              onPressed: _popUserStack,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _onSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignSystem.radiusMD)),
                    ),
                    child: Text(AppLocalizations.of(context)!.btnSubmitStack, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOpAnimationCard(bool isDark) {
    final op = _ops[_currentOpIndex];
    final isPush = op.type == OpType.push;

    return Container(
      width: 240,
      height: 160,
      decoration: BoxDecoration(
        color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: isDark ? DesignSystem.darkOutline : DesignSystem.outline, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isPush ? Icons.add_circle_outline_rounded : Icons.remove_circle_outline_rounded,
            size: 48,
            color: isPush ? Colors.green : Colors.redAccent,
          ),
          const SizedBox(height: 12),
          Text(
            isPush ? 'PUSH ${op.color}' : 'POP TOP',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isPush ? _getColor(op.color!) : Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
