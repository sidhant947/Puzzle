import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'fraction_match_provider.dart';

class FractionMatchScreen extends ConsumerStatefulWidget {
  const FractionMatchScreen({super.key});

  @override
  ConsumerState<FractionMatchScreen> createState() => _FractionMatchScreenState();
}

class _FractionMatchScreenState extends ConsumerState<FractionMatchScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(fractionMatchNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'FRACTION MISMATCH',
        message: 'The correct answer was ${ref.read(fractionMatchNotifierProvider).correctAnswer}.',
        isVictory: false,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(fractionMatchNotifierProvider.notifier).resetGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(fractionMatchNotifierProvider);
    final notifier = ref.read(fractionMatchNotifierProvider.notifier);

    ref.listen(fractionMatchNotifierProvider, (previous, next) async {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.vibrate();
        _showCompletionDialog();
      } else if (next.score > (previous?.score ?? 0)) {
        HapticFeedbackUtil.selectionClick();
        if (next.score % 5 == 0) {
          await ref.read(gameStreakNotifierProvider.notifier).completeGame('fraction_match');
        }
      }
    });

    if (state.isLoading) {
      return const GameScaffold(
        title: 'Fraction Match',
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Fraction Match',
      subtitle: 'Match the visual to its fraction',
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceLG),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TangibleContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  radius: DesignSystem.radiusMD,
                  color: DesignSystem.surface,
                  child: Text(
                    'SCORE: ${state.score}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: DesignSystem.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: _buildVisualFraction(state.numerator, state.denominator),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(DesignSystem.spaceLG),
              child: Column(
                children: [
                  Row(
                    children: [
                      _buildOption(state.options[0], notifier),
                      const SizedBox(width: DesignSystem.spaceMD),
                      _buildOption(state.options[1], notifier),
                    ],
                  ),
                  const SizedBox(height: DesignSystem.spaceMD),
                  Row(
                    children: [
                      _buildOption(state.options[2], notifier),
                      const SizedBox(width: DesignSystem.spaceMD),
                      _buildOption(state.options[3], notifier),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVisualFraction(int n, int d) {
    return Container(
      width: 200,
      height: 200,
      decoration: const BoxDecoration(
        color: DesignSystem.surface,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: DesignSystem.outlineVariant,
            offset: Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: CustomPaint(
        painter: FractionPainter(n, d),
      ),
    );
  }

  Widget _buildOption(String text, FractionMatchNotifier notifier) {
    return Expanded(
      child: TangibleButton(
        onTap: () => notifier.onOptionTap(text),
        color: DesignSystem.surface,
        shadowColor: DesignSystem.outlineVariant,
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: DesignSystem.ink,
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}

class FractionPainter extends CustomPainter {
  final int numerator;
  final int denominator;

  FractionPainter(this.numerator, this.denominator);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);
    
    final paintBase = Paint()
      ..color = DesignSystem.outline.withValues(alpha: 0.5)
      ..style = PaintingStyle.fill;
    
    final paintFill = Paint()
      ..color = DesignSystem.primary
      ..style = PaintingStyle.fill;
    
    final paintBorder = Paint()
      ..color = DesignSystem.ink
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw base circle
    canvas.drawCircle(center, radius, paintBase);

    // Draw filled segments
    double sweepAngle = (2 * pi) / denominator;
    for (int i = 0; i < numerator; i++) {
      canvas.drawArc(rect, -pi / 2 + (i * sweepAngle), sweepAngle, true, paintFill);
    }

    // Draw lines
    for (int i = 0; i < denominator; i++) {
      double angle = -pi / 2 + (i * sweepAngle);
      canvas.drawLine(
        center,
        Offset(center.dx + radius * cos(angle), center.dy + radius * sin(angle)),
        paintBorder,
      );
    }
    
    // Draw outer circle
    canvas.drawCircle(center, radius, paintBorder);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
