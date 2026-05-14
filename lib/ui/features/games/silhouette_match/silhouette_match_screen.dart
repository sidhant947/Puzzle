import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../utils/design_system.dart';
import 'silhouette_match_provider.dart';
import 'silhouette_match_engine.dart';

class SilhouetteMatchScreen extends ConsumerStatefulWidget {
  const SilhouetteMatchScreen({super.key});

  @override
  ConsumerState<SilhouetteMatchScreen> createState() => _SilhouetteMatchScreenState();
}

class _SilhouetteMatchScreenState extends ConsumerState<SilhouetteMatchScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(silhouetteMatchNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.silhouetteMatchTitle.toUpperCase(),
        message: 'Your brain is excellent at 3D to 2D translation.',
        isVictory: true,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(silhouetteMatchNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(silhouetteMatchNotifierProvider);
    final notifier = ref.read(silhouetteMatchNotifierProvider.notifier);

    ref.listen(silhouetteMatchNotifierProvider, (previous, next) {
      if (next.isVictory && !(previous?.isVictory ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('silhouette_match');
        _showCompletionDialog();
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: 'Silhouette Match',
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Silhouette Match',
      subtitle: l10n.silhouetteMatchSubtitle,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DesignSystem.spaceLG),
        child: Column(
          children: [
            Text(
              'TARGET OBJECT',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            SizedBox(height: DesignSystem.spaceMD),
            _buildTarget(state.target, colorScheme.onSurface),
            const SizedBox(height: DesignSystem.spaceXL),
            Text(
              'OPTIONS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: DesignSystem.spaceMD),
            Wrap(
              spacing: DesignSystem.spaceMD,
              runSpacing: DesignSystem.spaceMD,
              alignment: WrapAlignment.center,
              children: List.generate(state.options.length, (index) {
                return _buildOption(state, notifier, index, colorScheme.onSurface);
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTarget(List<ProjectedCube> cubes, Color onSurfaceColor) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        boxShadow: [
          BoxShadow(
            color: onSurfaceColor.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: CustomPaint(
        painter: SilhouettePainter(cubes, onSurfaceColor: onSurfaceColor, isWireframe: true),
      ),
    );
  }

  Widget _buildOption(SilhouetteMatchState state, SilhouetteMatchNotifier notifier, int index, Color onSurfaceColor) {
    final isSelected = state.selectedIndex == index;
    final isCorrect = state.correctIndex == index;
    final showResult = state.selectedIndex != null;

    Color borderColor = Theme.of(context).colorScheme.outline.withValues(alpha: 0.5);
    if (showResult) {
      if (isCorrect) {
        borderColor = DesignSystem.success;
      } else if (isSelected) {
        borderColor = DesignSystem.error;
      }
    } else if (isSelected) {
      borderColor = DesignSystem.primary;
    }

    return GestureDetector(
      onTap: () => notifier.selectOption(index),
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          border: Border.all(color: borderColor, width: 3),
          boxShadow: [
            BoxShadow(
              color: onSurfaceColor.withValues(alpha: 0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: const Size(120, 120),
              painter: SilhouettePainter(state.options[index], onSurfaceColor: onSurfaceColor, isWireframe: false),
            ),
            if (showResult && isCorrect)
              const Positioned(top: 4, right: 4, child: Icon(Icons.check_circle, color: DesignSystem.success, size: 20)),
            if (showResult && isSelected && !isCorrect)
              const Positioned(top: 4, right: 4, child: Icon(Icons.cancel, color: DesignSystem.error, size: 20)),
          ],
        ),
      ),
    );
  }
}

class SilhouettePainter extends CustomPainter {
  final List<ProjectedCube> cubes;
  final bool isWireframe;
  final Color onSurfaceColor;

  SilhouettePainter(this.cubes, {required this.onSurfaceColor, required this.isWireframe});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);

    if (isWireframe) {
      final paint = Paint()
        ..color = DesignSystem.primary
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke;

      for (var cube in cubes) {
        for (var edge in cube.edges) {
          canvas.drawLine(cube.vertices[edge[0]], cube.vertices[edge[1]], paint);
        }
      }
    } else {
      final fillPaint = Paint()
        ..color = DesignSystem.primary.withValues(alpha: 0.4)
        ..style = PaintingStyle.fill;

      final strokePaint = Paint()
        ..color = DesignSystem.primary
        ..strokeWidth = 1.5
        ..style = PaintingStyle.stroke;

      for (var cube in cubes) {
        final path = Path();
        for (var face in cube.faces) {
          path.moveTo(cube.vertices[face[0]].dx, cube.vertices[face[0]].dy);
          for (int i = 1; i < face.length; i++) {
            path.lineTo(cube.vertices[face[i]].dx, cube.vertices[face[i]].dy);
          }
          path.close();
        }
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, strokePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
