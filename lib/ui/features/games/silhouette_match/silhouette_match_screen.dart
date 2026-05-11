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
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'MATCHED!',
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
      return const GameScaffold(
        title: 'Silhouette Match',
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Silhouette Match',
      subtitle: 'Which silhouette matches this object?',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DesignSystem.spaceLG),
        child: Column(
          children: [
            const Text(
              'TARGET OBJECT',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: DesignSystem.inkSlate,
              ),
            ),
            const SizedBox(height: DesignSystem.spaceMD),
            _buildTarget(state.target),
            const SizedBox(height: DesignSystem.spaceXL),
            const Text(
              'OPTIONS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: DesignSystem.inkSlate,
              ),
            ),
            const SizedBox(height: DesignSystem.spaceMD),
            Wrap(
              spacing: DesignSystem.spaceMD,
              runSpacing: DesignSystem.spaceMD,
              alignment: WrapAlignment.center,
              children: List.generate(state.options.length, (index) {
                return _buildOption(state, notifier, index);
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTarget(List<ProjectedCube> cubes) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        boxShadow: [
          BoxShadow(
            color: DesignSystem.ink.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: CustomPaint(
        painter: SilhouettePainter(cubes, isWireframe: true),
      ),
    );
  }

  Widget _buildOption(SilhouetteMatchState state, SilhouetteMatchNotifier notifier, int index) {
    final isSelected = state.selectedIndex == index;
    final isCorrect = state.correctIndex == index;
    final showResult = state.selectedIndex != null;

    Color borderColor = DesignSystem.outline;
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          border: Border.all(color: borderColor, width: 3),
          boxShadow: [
            BoxShadow(
              color: DesignSystem.ink.withValues(alpha: 0.05),
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
              painter: SilhouettePainter(state.options[index], isWireframe: false),
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

  SilhouettePainter(this.cubes, {required this.isWireframe});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);

    if (isWireframe) {
      final paint = Paint()
        ..color = DesignSystem.ink
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke;

      for (var cube in cubes) {
        for (var edge in cube.edges) {
          canvas.drawLine(cube.vertices[edge[0]], cube.vertices[edge[1]], paint);
        }
      }
    } else {
      final paint = Paint()
        ..color = DesignSystem.inkSlate
        ..style = PaintingStyle.fill;

      for (var cube in cubes) {
        for (var face in cube.faces) {
          final path = Path();
          path.moveTo(cube.vertices[face[0]].dx, cube.vertices[face[0]].dy);
          for (int i = 1; i < face.length; i++) {
            path.lineTo(cube.vertices[face[i]].dx, cube.vertices[face[i]].dy);
          }
          path.close();
          canvas.drawPath(path, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
