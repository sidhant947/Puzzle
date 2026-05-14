import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'lock_pattern_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class LockPatternScreen extends ConsumerStatefulWidget {
  const LockPatternScreen({super.key});

  @override
  ConsumerState<LockPatternScreen> createState() => _LockPatternScreenState();
}

class _LockPatternScreenState extends ConsumerState<LockPatternScreen> {
  final GlobalKey _gridKey = GlobalKey();

  void _handlePointerEvent(
      PointerEvent event, LockPatternState state, LockPatternNotifier notifier) {
    final RenderBox? renderBox =
        _gridKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final localPosition = renderBox.globalToLocal(event.position);
    final size = renderBox.size;
    final dotSize = size.width / 3;

    final int col = (localPosition.dx / dotSize).floor();
    final int row = (localPosition.dy / dotSize).floor();

    if (col >= 0 && col < 3 && row >= 0 && row < 3) {
      final int dotIndex = row * 3 + col;

      // Check if we are close enough to the center of the dot
      final center =
          Offset(col * dotSize + dotSize / 2, row * dotSize + dotSize / 2);
      if ((localPosition - center).distance < dotSize * 0.4) {
        if (!state.currentGuess.contains(dotIndex)) {
          HapticFeedbackUtil.lightImpact();
          notifier.addDot(dotIndex);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(lockPatternNotifierProvider);
    final notifier = ref.read(lockPatternNotifierProvider.notifier);

    ref.listen(lockPatternNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        if (next.isWon) {
          HapticFeedbackUtil.victory();
          ref.read(gameStreakNotifierProvider.notifier).completeGame('lock_pattern');
        } else {
          HapticFeedbackUtil.vibrate();
        }
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: next.isWon ? 'MASTERMIND!' : 'OUT OF TRIES',
            message: next.isWon
                ? 'You cracked the code in ${next.guesses.length} attempts!'
                : 'The secret pattern was too complex this time.',
            isVictory: next.isWon,
            onPlayAgain: () {
              notifier.initGame();
              Navigator.pop(context);
            },
            onHome: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        );
      }
    });

    return GameScaffold(
      title: l10n.lockPatternTitle.toUpperCase(),
      subtitle: l10n.lockPatternSubtitle,
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.initGame();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.refresh_rounded,
            color: colorScheme.onSurface,
            size: 20,
          ),
        ),
      ],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: DesignSystem.spaceLG),
            child: Text(
              'GUESS ${state.guesses.length + 1} OF ${state.maxTries}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                color: colorScheme.onSurface.withValues(alpha: 0.5),
                letterSpacing: 2.0,
              ),
            ),
          ),
          _buildTriesIndicator(state),
          Expanded(
            flex: 2,
            child: _buildHistory(state),
          ),
          const Divider(height: 1),
          Expanded(
            flex: 4,
            child: Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: Padding(
                  padding: const EdgeInsets.all(DesignSystem.spaceXL),
                  child: Listener(
                    onPointerDown: (event) =>
                        _handlePointerEvent(event, state, notifier),
                    onPointerMove: (event) =>
                        _handlePointerEvent(event, state, notifier),
                    onPointerUp: (event) => notifier.submitGuess(),
                    child: Container(
                      key: _gridKey,
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius:
                            BorderRadius.circular(DesignSystem.radiusLG),
                        boxShadow: [
                          BoxShadow(
                            color: colorScheme.outline.withValues(alpha: 0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                        border: Border.all(
                            color: colorScheme.outline.withValues(alpha: 0.2),
                            width: 2),
                      ),
                      child: CustomPaint(
                        painter: _PatternPainter(
                          pattern: state.currentGuess,
                          color: DesignSystem.primary,
                          dotColor:
                              colorScheme.onSurface.withValues(alpha: 0.1),
                        ),
                        size: Size.infinite,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(DesignSystem.spaceLG, 0,
                DesignSystem.spaceLG, DesignSystem.spaceXL),
            child: Column(
              children: [
                Text(
                  '${state.currentGuess.length} / ${state.patternLength} DOTS',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: state.currentGuess.length == state.patternLength
                        ? DesignSystem.primary
                        : colorScheme.onSurface.withValues(alpha: 0.7),
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'DRAW TO GUESS THE PATTERN',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: colorScheme.onSurface.withValues(alpha: 0.3),
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTriesIndicator(LockPatternState state) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(DesignSystem.spaceLG),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 4,
        runSpacing: 4,
        children: List.generate(state.maxTries, (index) {
          final bool isUsed = index < state.guesses.length;
          return Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isUsed
                  ? colorScheme.onSurface.withValues(alpha: 0.2)
                  : DesignSystem.primary,
              border: Border.all(
                  color: colorScheme.onSurface.withValues(alpha: 0.1),
                  width: 1),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildHistory(LockPatternState state) {
    if (state.guesses.isEmpty) {
      return Center(
        child: Text(
          'NO GUESSES YET',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w900,
            color:
                Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3),
            letterSpacing: 1.0,
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      scrollDirection: Axis.horizontal,
      itemCount: state.guesses.length,
      separatorBuilder: (context, index) =>
          const SizedBox(width: DesignSystem.spaceMD),
      itemBuilder: (context, index) {
        final guess = state.guesses[index];
        return _buildGuessCard(guess, index + 1);
      },
    );
  }

  Widget _buildGuessCard(LockPatternGuess guess, int index) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '#$index',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w900,
            color: colorScheme.onSurface.withValues(alpha: 0.3),
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: 80,
          height: 80,
          child: TangibleContainer(
            padding: const EdgeInsets.all(8),
            color: colorScheme.surface,
            child: CustomPaint(
              painter: _PatternPainter(
                pattern: guess.pattern,
                color: colorScheme.onSurface,
                feedback: guess.feedback,
                dotRadius: 4,
                strokeWidth: 3,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...List.generate(
              guess.feedback
                  .where((f) => f == LockPatternDotStatus.correct)
                  .length,
              (_) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 1),
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: DesignSystem.success,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            ...List.generate(
              guess.feedback
                  .where((f) => f == LockPatternDotStatus.wrongPosition)
                  .length,
              (_) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 1),
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: DesignSystem.accentAmber,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PatternPainter extends CustomPainter {
  final List<int> pattern;
  final Color color;
  final Color? dotColor;
  final List<LockPatternDotStatus>? feedback;
  final double dotRadius;
  final double strokeWidth;

  _PatternPainter({
    required this.pattern,
    required this.color,
    this.dotColor,
    this.feedback,
    this.dotRadius = 8,
    this.strokeWidth = 6,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final dotPaint = Paint()
      ..color = dotColor ?? color.withValues(alpha: 0.2)
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..color = color.withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final double dotSpacing = size.width / 3;

    // Draw grid of dots
    for (int i = 0; i < 9; i++) {
      final double x = (i % 3) * dotSpacing + dotSpacing / 2;
      final double y = (i ~/ 3) * dotSpacing + dotSpacing / 2;
      canvas.drawCircle(Offset(x, y), dotRadius, dotPaint);
    }

    // Draw pattern lines first so dots are on top
    if (pattern.isNotEmpty) {
      final path = Path();
      final firstX = (pattern[0] % 3) * dotSpacing + dotSpacing / 2;
      final firstY = (pattern[0] ~/ 3) * dotSpacing + dotSpacing / 2;
      path.moveTo(firstX, firstY);

      for (int i = 1; i < pattern.length; i++) {
        final x = (pattern[i] % 3) * dotSpacing + dotSpacing / 2;
        final y = (pattern[i] ~/ 3) * dotSpacing + dotSpacing / 2;
        path.lineTo(x, y);
      }
      canvas.drawPath(path, linePaint);

      // Draw active dots
      for (int i = 0; i < pattern.length; i++) {
        final x = (pattern[i] % 3) * dotSpacing + dotSpacing / 2;
        final y = (pattern[i] ~/ 3) * dotSpacing + dotSpacing / 2;

        final activeDotPaint = Paint()
          ..color = color
          ..style = PaintingStyle.fill;
        final double radius = i == 0 ? dotRadius * 1.5 : dotRadius * 1.2;
        canvas.drawCircle(Offset(x, y), radius, activeDotPaint);

        // Add a small white center to active dots for better contrast
        final whitePaint = Paint()
          ..color = Colors.white.withValues(alpha: 0.5)
          ..style = PaintingStyle.fill;
        canvas.drawCircle(Offset(x, y), radius * 0.4, whitePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _PatternPainter oldDelegate) {
    return oldDelegate.pattern != pattern || oldDelegate.color != color;
  }
}
