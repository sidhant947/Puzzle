import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import 'mirror_image_engine.dart';
import 'mirror_image_provider.dart';

class MirrorImageScreen extends ConsumerWidget {
  const MirrorImageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(mirrorImageNotifierProvider);

    ref.listen(mirrorImageNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return GameScaffold(
      title: l10n.mirrorImageTitle.toUpperCase(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildInstructions(context, l10n),
            const SizedBox(height: 24),
            _buildQuestion(context, state.level.question),
            const SizedBox(height: 32),
            _buildOptions(context, ref, state),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructions(BuildContext context, AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TangibleContainer(
        radius: DesignSystem.radiusMD,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('MIRROR IMAGE', style: TextStyle(color: DesignSystem.primary, fontSize: 14, letterSpacing: 2, fontWeight: FontWeight.w900)),
            const SizedBox(height: 8),
            Text(l10n.mirrorImageHowToPlay, textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7), fontSize: 12, fontWeight: FontWeight.w500, height: 1.5)),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestion(BuildContext context, MirrorShape shape) {
    return Center(
      child: SizedBox(
        width: 180,
        height: 180,
        child: TangibleContainer(
          color: Theme.of(context).colorScheme.surface,
          padding: const EdgeInsets.all(20),
          child: SizedBox.expand(
            child: CustomPaint(
              painter: ShapePainter(
                shape: shape,
                color: DesignSystem.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptions(BuildContext context, WidgetRef ref, MirrorImageState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        children: List.generate(state.level.options.length, (index) {
          final isSelected = state.selectedIndex == index;
          final isCorrect = state.level.correctIndex == index;
          
          Color? buttonColor;
          if (isSelected) {
            buttonColor = isCorrect 
                ? DesignSystem.success.withValues(alpha: 0.2) 
                : DesignSystem.error.withValues(alpha: 0.2);
          } else {
            buttonColor = Theme.of(context).colorScheme.surface;
          }

          return SizedBox(
            width: 130,
            height: 130,
            child: TangibleButton(
              onTap: state.isSolved ? null : () {
                HapticFeedbackUtil.selectionClick();
                ref.read(mirrorImageNotifierProvider.notifier).selectOption(index);
              },
              color: buttonColor,
              depth: isSelected ? 2.0 : 6.0,
              padding: const EdgeInsets.all(16),
              child: SizedBox.expand(
                child: CustomPaint(
                  painter: ShapePainter(
                    shape: state.level.options[index],
                    color: isSelected 
                        ? (isCorrect ? DesignSystem.success : DesignSystem.error)
                        : DesignSystem.primary,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    // Award XP and update streak
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('mirror_image');
    
    if (!context.mounted) return;
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'MIRROR MASTER!',
        message: 'You perfectly identified the reflection.',
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(mirrorImageNotifierProvider.notifier).nextLevel();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  final MirrorShape shape;
  final Color color;
  
  ShapePainter({required this.shape, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;
    
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;
      
    final path = Path();
    if (shape.points.isNotEmpty) {
      path.moveTo(
        shape.points[0].dx.clamp(0.0, 1.0) * size.width, 
        shape.points[0].dy.clamp(0.0, 1.0) * size.height
      );
      for (int i = 1; i < shape.points.length; i++) {
        path.lineTo(
          shape.points[i].dx.clamp(0.0, 1.0) * size.width, 
          shape.points[i].dy.clamp(0.0, 1.0) * size.height
        );
      }
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant ShapePainter oldDelegate) => 
      oldDelegate.shape != shape || oldDelegate.color != color;
}
