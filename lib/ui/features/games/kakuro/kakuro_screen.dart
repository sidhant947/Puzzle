import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'kakuro_provider.dart';
import 'kakuro_engine.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';

class KakuroScreen extends ConsumerWidget {
  const KakuroScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(kakuroNotifierProvider);
    final notifier = ref.read(kakuroNotifierProvider.notifier);

    ref.listen(kakuroNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'CROSS SUMS MATCHED',
            message: 'Incredible! You matched all sum segments perfectly.',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              notifier.newGame();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    return GameScaffold(
      title: 'Kakuro',
      subtitle: 'Fill digits 1-9 in empty cells. Segment sums must equal their clues without duplicates.',
      actions: [
        TangibleButton(
          color: Theme.of(context).colorScheme.surface,
          shadowColor: Theme.of(context).colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.reset();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded, size: 20, color: Theme.of(context).colorScheme.onSurface),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          final boardWidth = constraints.maxWidth * 0.85;
          final boardSize = boardWidth > 320.0 ? 320.0 : boardWidth;

          return Column(
            children: [
              const Spacer(),
              Center(
                child: TangibleContainer(
                  color: Theme.of(context).colorScheme.surface,
                  shadowColor: Theme.of(context).colorScheme.outline,
                  depth: 4.0,
                  radius: DesignSystem.radiusLG,
                  padding: const EdgeInsets.all(DesignSystem.spaceMD),
                  child: SizedBox(
                    width: boardSize,
                    height: boardSize,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: state.level.size,
                        crossAxisSpacing: DesignSystem.spaceSM,
                        mainAxisSpacing: DesignSystem.spaceSM,
                      ),
                      itemCount: state.level.size * state.level.size,
                      itemBuilder: (context, index) {
                        final r = index ~/ state.level.size;
                        final c = index % state.level.size;
                        final cell = state.level.grid[r][c];
                        return _buildCell(context, cell, state, notifier);
                      },
                    ),
                  ),
                ),
              ),
              const Spacer(),
              _buildInputKeyboard(context, state, notifier),
              const Spacer(),
              ],
              );
              },
              ),    );
  }

  Widget _buildCell(
    BuildContext context,
    KakuroCell cell,
    KakuroState state,
    KakuroNotifier notifier,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (cell.isBlock) {
      return TangibleContainer(
        color: colorScheme.outline.withValues(alpha: 0.4),
        shadowColor: Colors.transparent,
        depth: 0.0,
        radius: DesignSystem.radiusSM,
        child: const SizedBox.shrink(),
      );
    }

    if (cell.isClue) {
      return TangibleContainer(
        color: colorScheme.outline.withValues(alpha: 0.15),
        shadowColor: Colors.transparent,
        depth: 0.0,
        radius: DesignSystem.radiusSM,
        padding: EdgeInsets.zero,
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: _KakuroCluePainter(colorScheme.onSurface),
              ),
            ),
            if (cell.hClue != null)
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 2, right: 4),
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    heightFactor: 0.5,
                    child: FittedBox(
                      alignment: Alignment.topRight,
                      child: Text(
                        '${cell.hClue}',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: DesignSystem.accentEmerald,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            if (cell.vClue != null)
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 2, left: 4),
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    heightFactor: 0.5,
                    child: FittedBox(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        '${cell.vClue}',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: DesignSystem.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
    }

    // White cell
    final val = state.currentValues[Point(cell.c, cell.r)];
    final isSelected = state.selectedRow == cell.r && state.selectedCol == cell.c;

    Color cellColor = colorScheme.surface;
    Color? shadowColor = colorScheme.outline;
    double depth = 2.0;

    if (isSelected) {
      cellColor = DesignSystem.primary;
      shadowColor = DesignSystem.primary.withValues(alpha: 0.5);
      depth = 2.0;
    }

    return GestureDetector(
      onTap: () {
        HapticFeedbackUtil.lightImpact();
        notifier.selectCell(cell.r, cell.c);
      },
      child: TangibleContainer(
        color: cellColor,
        shadowColor: shadowColor,
        depth: depth,
        radius: DesignSystem.radiusSM,
        padding: EdgeInsets.zero,
        child: Center(
          child: FittedBox(
            child: Text(
              val != null ? '$val' : '',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: isSelected ? Colors.white : colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputKeyboard(BuildContext context, KakuroState state, KakuroNotifier notifier) {
    final colorScheme = Theme.of(context).colorScheme;

    Widget buildButton(int val) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: TangibleButton(
            onTap: () {
              HapticFeedbackUtil.lightImpact();
              notifier.setCellValue(val);
            },
            color: colorScheme.surface,
            shadowColor: colorScheme.outline,
            padding: const EdgeInsets.symmetric(vertical: 8),
            radius: DesignSystem.radiusSM,
            child: Center(
              child: Text(
                '$val',
                style: TextStyle(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 1; i <= 5; i++) buildButton(i),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 6; i <= 9; i++) buildButton(i),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: TangibleButton(
                    onTap: () {
                      HapticFeedbackUtil.lightImpact();
                      notifier.setCellValue(null);
                    },
                    color: colorScheme.surface,
                    shadowColor: colorScheme.outline,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    radius: DesignSystem.radiusSM,
                    child: Center(
                      child: Icon(
                        Icons.backspace_outlined,
                        color: DesignSystem.error,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _KakuroCluePainter extends CustomPainter {
  final Color color;

  _KakuroCluePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha: 0.3)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset.zero, Offset(size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
