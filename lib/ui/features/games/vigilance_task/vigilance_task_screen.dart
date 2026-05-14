import 'package:puzzle/l10n/app_localizations.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'vigilance_task_provider.dart';

class VigilanceTaskScreen extends ConsumerStatefulWidget {
  const VigilanceTaskScreen({super.key});

  @override
  ConsumerState<VigilanceTaskScreen> createState() => _VigilanceTaskScreenState();
}

class _VigilanceTaskScreenState extends ConsumerState<VigilanceTaskScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(vigilanceNotifierProvider.notifier).startGame();
    });
  }

  void _showCompletionDialog(bool isVictory, int hits, int misses, int falseAlarms) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? 'STAY VIGILANT!' : 'KEEP WATCH!',
        message: 'Hits: $hits, Misses: $misses\nFalse Alarms: $falseAlarms',
        isVictory: isVictory,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(vigilanceNotifierProvider.notifier).startGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(vigilanceNotifierProvider);
    
    ref.listen(vigilanceNotifierProvider, (previous, next) async {
      if (next.phase == VigilancePhase.result && previous?.phase != VigilancePhase.result) {
        final isVictory = next.hits > next.misses;
        if (isVictory) {
          HapticFeedbackUtil.victory();
          await ref.read(gameStreakNotifierProvider.notifier).completeGame('vigilance_task');
        } else {
          HapticFeedbackUtil.vibrate();
        }
        if (!context.mounted) return;
        _showCompletionDialog(isVictory, next.hits, next.misses, next.falseAlarms);
      }
    });

    return GameScaffold(
      title: l10n.vigilanceTaskTitle.toUpperCase(),
      subtitle: l10n.vigilanceTaskSubtitle,
      body: Column(
        children: [
          const SizedBox(height: DesignSystem.spaceXL),
          
          // Clock Face
          Expanded(
            flex: 3,
            child: Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: CustomPaint(
                  painter: ClockPainter(
                    currentPosition: state.currentPosition,
                    outlineColor: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: DesignSystem.space2XL),
          
          // Action Button
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: DesignSystem.space2XL),
              child: TangibleButton(
                onTap: () {
                  HapticFeedbackUtil.lightImpact();
                  ref.read(vigilanceNotifierProvider.notifier).onUserTap();
                },
                color: DesignSystem.primary,
                child: const Center(
                  child: Text(
                    'SKIP!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: DesignSystem.space2XL),
        ],
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final int currentPosition;
  final Color outlineColor;

  ClockPainter({
    required this.currentPosition,
    required this.outlineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    
    final paint = Paint()
      ..color = outlineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    // Draw clock circle
    canvas.drawCircle(center, radius, paint);

    // Draw ticks
    for (int i = 0; i < 60; i++) {
      final angle = (i * 6 - 90) * pi / 180;
      final isMajor = i % 5 == 0;
      final tickLength = isMajor ? 15.0 : 8.0;
      
      final start = Offset(
        center.dx + (radius - tickLength) * cos(angle),
        center.dy + (radius - tickLength) * sin(angle),
      );
      final end = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
      
      paint.strokeWidth = isMajor ? 3 : 1;
      canvas.drawLine(start, end, paint);
    }

    // Draw Hand
    final handAngle = (currentPosition * 6 - 90) * pi / 180;
    final handPaint = Paint()
      ..color = DesignSystem.primary
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    final handEnd = Offset(
      center.dx + (radius - 20) * cos(handAngle),
      center.dy + (radius - 20) * sin(handAngle),
    );
    
    canvas.drawLine(center, handEnd, handPaint);
    
    // Draw Center Circle
    canvas.drawCircle(center, 8, Paint()..color = DesignSystem.primary);
  }

  @override
  bool shouldRepaint(covariant ClockPainter oldDelegate) {
    return oldDelegate.currentPosition != currentPosition;
  }
}
