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

class PatternSequenceDrawScreen extends ConsumerStatefulWidget {
  const PatternSequenceDrawScreen({super.key});

  @override
  ConsumerState<PatternSequenceDrawScreen> createState() => _PatternSequenceDrawScreenState();
}

class _PatternSequenceDrawScreenState extends ConsumerState<PatternSequenceDrawScreen> {
  final Random _random = Random();
  final int _gridSize = 3; // 3x3 grid

  // Game state
  final List<int> _targetSequence = [];
  final List<int> _userSequence = [];
  bool _isPlayingSequence = true;
  int _activeSeqIndex = -1; // dot currently highlighted in play mode

  int _score = 0;
  final int _targetScore = 5;
  bool _isGameOver = false;

  @override
  void initState() {
    super.initState();
    _startNewRound();
  }

  void _startNewRound() {
    _userSequence.clear();
    _generateRandomPath();
    _playSequence();
  }

  void _generateRandomPath() {
    // Generate a self-avoiding walk path of length 5 on the 3x3 grid
    _targetSequence.clear();

    int current = _random.nextInt(9);
    _targetSequence.add(current);

    while (_targetSequence.length < 5) {
      final neighbors = _getNeighbors(current);
      // Filter out already visited nodes to avoid self-crossing
      final unvisited = neighbors.where((n) => !_targetSequence.contains(n)).toList();

      if (unvisited.isEmpty) {
        // Backtrack or restart if stuck
        _targetSequence.clear();
        current = _random.nextInt(9);
        _targetSequence.add(current);
        continue;
      }

      final next = unvisited[_random.nextInt(unvisited.length)];
      _targetSequence.add(next);
      current = next;
    }
  }

  List<int> _getNeighbors(int index) {
    int r = index ~/ _gridSize;
    int c = index % _gridSize;
    List<int> result = [];

    // Orthogonal and diagonal neighbors
    for (int dr = -1; dr <= 1; dr++) {
      for (int dc = -1; dc <= 1; dc++) {
        if (dr == 0 && dc == 0) continue;
        int nr = r + dr;
        int nc = c + dc;
        if (nr >= 0 && nr < _gridSize && nc >= 0 && nc < _gridSize) {
          result.add(nr * _gridSize + nc);
        }
      }
    }
    return result;
  }

  Future<void> _playSequence() async {
    setState(() {
      _isPlayingSequence = true;
      _activeSeqIndex = -1;
    });

    await Future.delayed(const Duration(milliseconds: 600));

    for (int i = 0; i < _targetSequence.length; i++) {
      if (!mounted) return;
      setState(() {
        _activeSeqIndex = _targetSequence[i];
      });
      HapticFeedbackUtil.lightImpact();
      await Future.delayed(const Duration(milliseconds: 600));
    }

    if (!mounted) return;
    setState(() {
      _isPlayingSequence = false;
      _activeSeqIndex = -1;
    });
  }

  void _onDotTapped(int index) {
    if (_isPlayingSequence || _isGameOver) return;

    HapticFeedbackUtil.lightImpact();
    setState(() {
      _userSequence.add(index);

      // Verify sequence so far
      int currentStep = _userSequence.length - 1;
      if (_userSequence[currentStep] != _targetSequence[currentStep]) {
        HapticFeedbackUtil.error();
        _userSequence.clear();
        _playSequence(); // replay sequence as reminder
        return;
      }

      // Check if path is complete
      if (_userSequence.length == _targetSequence.length) {
        _score++;
        HapticFeedbackUtil.success();

        if (_score >= _targetScore) {
          _isGameOver = true;
          _onGameComplete();
        } else {
          Future.delayed(const Duration(milliseconds: 600), () {
            if (mounted) _startNewRound();
          });
        }
      }
    });
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('pattern_sequence_draw');
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
            _startNewRound();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'pattern_sequence_draw'),
      subtitle: _isPlayingSequence ? AppLocalizations.of(context)!.phaseWatchPattern : AppLocalizations.of(context)!.phaseRepeatPattern,
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            setState(() {
              _startNewRound();
            });
          },
        ),
      ],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Score Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: DesignSystem.primary.withValues(alpha: 0.1),
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
          const SizedBox(height: 40),
          // 3x3 Dot Grid Canvas
          Center(
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                border: Border.all(
                  color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                  width: 2,
                ),
              ),
              child: Stack(
                children: [
                  // Draw active paths
                  CustomPaint(
                    size: const Size(300, 300),
                    painter: _SequencePathPainter(
                      sequence: _isPlayingSequence ? _targetSequence : _userSequence,
                      activeSeqIndex: _activeSeqIndex,
                      isPlaying: _isPlayingSequence,
                    ),
                  ),
                  // Dots
                  GridView.builder(
                    padding: const EdgeInsets.all(24),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                    ),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      final isTargetActive = _isPlayingSequence && _activeSeqIndex == index;
                      final isUserTapped = !_isPlayingSequence && _userSequence.contains(index);

                      Color dotColor = isDark ? Colors.white24 : Colors.black12;
                      if (isTargetActive) dotColor = DesignSystem.primary;
                      if (isUserTapped) dotColor = DesignSystem.gameGreen;

                      return GestureDetector(
                        onTap: () => _onDotTapped(index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          decoration: BoxDecoration(
                            color: dotColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isTargetActive || isUserTapped
                                  ? Colors.white
                                  : Colors.transparent,
                              width: 3,
                            ),
                            boxShadow: isTargetActive || isUserTapped
                                ? [
                                    BoxShadow(
                                      color: (isTargetActive ? DesignSystem.primary : DesignSystem.gameGreen)
                                          .withValues(alpha: 0.4),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    )
                                  ]
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SequencePathPainter extends CustomPainter {
  final List<int> sequence;
  final int activeSeqIndex;
  final bool isPlaying;

  _SequencePathPainter({
    required this.sequence,
    required this.activeSeqIndex,
    required this.isPlaying,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (sequence.isEmpty) return;

    final paint = Paint()
      ..color = isPlaying ? DesignSystem.primary.withValues(alpha: 0.5) : DesignSystem.gameGreen.withValues(alpha: 0.5)
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final double stepX = (size.width - 48) / 2.0;
    final double stepY = (size.height - 48) / 2.0;

    Offset getCoordinate(int index) {
      int r = index ~/ 3;
      int c = index % 3;
      return Offset(24 + c * stepX, 24 + r * stepY);
    }

    final path = Path();
    path.moveTo(getCoordinate(sequence.first).dx, getCoordinate(sequence.first).dy);

    // If playing, draw path only up to active dot
    int limit = sequence.length;
    if (isPlaying && activeSeqIndex != -1) {
      limit = sequence.indexOf(activeSeqIndex) + 1;
    }

    for (int i = 1; i < limit; i++) {
      final coord = getCoordinate(sequence[i]);
      path.lineTo(coord.dx, coord.dy);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_SequencePathPainter oldDelegate) {
    return oldDelegate.sequence != sequence ||
        oldDelegate.activeSeqIndex != activeSeqIndex ||
        oldDelegate.isPlaying != isPlaying;
  }
}
