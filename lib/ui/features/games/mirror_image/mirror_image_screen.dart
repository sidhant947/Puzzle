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
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildInstructions(context, l10n),
            const Spacer(),
            _buildQuestion(context, state.level.question),
            const Spacer(),
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
    return SizedBox(
      width: 200,
      height: 200,
      child: TangibleContainer(
        color: Theme.of(context).colorScheme.surface,
        child: CustomPaint(painter: ShapePainter(shape: shape)),
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
          return GestureDetector(
            onTap: () {
              HapticFeedbackUtil.selectionClick();
              ref.read(mirrorImageNotifierProvider.notifier).selectOption(index);
            },
            child: SizedBox(
              width: 140,
              height: 140,
              child: TangibleContainer(
                depth: isSelected ? 0.0 : 4.0,
                color: isSelected ? (state.isSolved ? DesignSystem.success.withValues(alpha: 0.1) : DesignSystem.error.withValues(alpha: 0.1)) : Theme.of(context).colorScheme.surface,
                child: CustomPaint(painter: ShapePainter(shape: state.level.options[index])),
              ),
            ),
          );
        }),
      ),
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('mirror_image');
    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        onHome: () { Navigator.of(context).pop(); Navigator.of(context).pop(); },
        onPlayAgain: () { ref.read(mirrorImageNotifierProvider.notifier).nextLevel(); Navigator.of(context).pop(); },
        title: 'CONGRATS',
        message: 'You found the correct reflection!',
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  final MirrorShape shape;
  ShapePainter({required this.shape});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = DesignSystem.primary..style = PaintingStyle.stroke..strokeWidth = 3..strokeCap = StrokeCap.round;
    final path = Path();
    if (shape.points.isNotEmpty) {
      path.moveTo(shape.points[0].dx * size.width, shape.points[0].dy * size.height);
      for (int i = 1; i < shape.points.length; i++) {
        path.lineTo(shape.points[i].dx * size.width, shape.points[i].dy * size.height);
      }
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
