import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'sum_pyramid_provider.dart';

class SumPyramidScreen extends ConsumerStatefulWidget {
  const SumPyramidScreen({super.key});

  @override
  ConsumerState<SumPyramidScreen> createState() => _SumPyramidScreenState();
}

class _SumPyramidScreenState extends ConsumerState<SumPyramidScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(sumPyramidNotifierProvider.notifier).initGame();
    });
  }

  void _handleKeypadTap(String val) {
    HapticFeedbackUtil.lightImpact();
    final notifier = ref.read(sumPyramidNotifierProvider.notifier);
    if (val == '⌫') {
      notifier.deleteDigit();
    } else if (val == 'C') {
      notifier.clearBlock();
    } else if (val == '✓') {
      final success = notifier.submitAnswers();
      if (success) {
        HapticFeedbackUtil.victory();
      } else {
        HapticFeedbackUtil.error();
      }
    } else {
      notifier.enterDigit(val);
    }
  }

  Widget _buildBlock(int index, double blockSize, ColorScheme colorScheme, SumPyramidState state) {
    final level = state.currentLevel!;
    final isHidden = level.isHidden[index];
    final isSelected = state.selectedBlockIndex == index;
    final isWrong = state.wrongBlocks.contains(index);

    String text = '';
    if (isHidden) {
      text = state.userValues[index];
    } else {
      text = '${level.correctValues[index]}';
    }

    Color blockColor;
    Color shadowColor;
    double depth;
    TextStyle textStyle;

    if (isHidden) {
      if (isSelected) {
        blockColor = colorScheme.primary;
        shadowColor = colorScheme.primary.withValues(alpha: 0.5);
        depth = 2.0;
        textStyle = TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: blockSize * 0.35,
          color: Colors.white,
        );
      } else if (isWrong) {
        blockColor = colorScheme.error.withValues(alpha: 0.1);
        shadowColor = colorScheme.error;
        depth = 4.0;
        textStyle = TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: blockSize * 0.35,
          color: colorScheme.error,
        );
      } else {
        blockColor = colorScheme.surface;
        shadowColor = colorScheme.outline;
        depth = 5.0;
        textStyle = TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: blockSize * 0.35,
          color: text.isEmpty ? colorScheme.onSurface.withValues(alpha: 0.3) : colorScheme.onSurface,
        );
      }
    } else {
      // Fixed/permanent block
      blockColor = colorScheme.outline.withValues(alpha: 0.15);
      shadowColor = colorScheme.outline.withValues(alpha: 0.3);
      depth = 0.0; // flat
      textStyle = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: blockSize * 0.32,
        color: colorScheme.onSurface.withValues(alpha: 0.7),
      );
    }

    return Container(
      margin: const EdgeInsets.all(DesignSystem.spaceXS),
      width: blockSize,
      height: blockSize,
      child: TangibleButton(
        depth: depth,
        color: blockColor,
        shadowColor: shadowColor,
        radius: DesignSystem.radiusXS,
        padding: EdgeInsets.zero,
        onTap: isHidden
            ? () {
                HapticFeedbackUtil.selectionClick();
                ref.read(sumPyramidNotifierProvider.notifier).selectBlock(index);
              }
            : null,
        child: Center(
          child: Text(
            text.isEmpty ? '?' : text,
            style: textStyle,
          ),
        ),
      ),
    );
  }

  Widget _buildKeypadButton(String label, ColorScheme colorScheme, {double widthFactor = 1.0}) {
    Color? color = colorScheme.surface;
    Color? shadowColor = colorScheme.outline;
    TextStyle style = TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 20,
      color: colorScheme.onSurface,
    );

    if (label == '✓') {
      color = DesignSystem.accentEmerald;
      shadowColor = DesignSystem.accentEmerald.withValues(alpha: 0.7);
      style = const TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 20,
        color: Colors.white,
      );
    } else if (label == '⌫' || label == 'C') {
      color = colorScheme.outline.withValues(alpha: 0.5);
      shadowColor = colorScheme.outline;
      style = TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 16,
        color: colorScheme.onSurface,
      );
    }

    return Expanded(
      flex: (widthFactor * 10).round(),
      child: Padding(
        padding: const EdgeInsets.all(DesignSystem.spaceXS),
        child: TangibleButton(
          depth: 4.0,
          color: color,
          shadowColor: shadowColor,
          radius: DesignSystem.radiusXS,
          padding: EdgeInsets.zero,
          onTap: () => _handleKeypadTap(label),
          child: Center(
            child: Text(
              label,
              style: style,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sumPyramidNotifierProvider);
    final colorScheme = Theme.of(context).colorScheme;

    ref.listen(sumPyramidNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'GAME OVER',
            message: 'You solved ${next.score} sum pyramids successfully!',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(sumPyramidNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    if (state.isLoading || state.currentLevel == null) {
      return GameScaffold(
        title: 'SUM PYRAMID',
        subtitle: 'Fill in the sum pyramid',
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return GameScaffold(
      title: 'SUM PYRAMID',
      subtitle: 'Each block is the sum of the two blocks directly below it.',
      onReset: () {
        HapticFeedbackUtil.mediumImpact();
        ref.read(sumPyramidNotifierProvider.notifier).reset();
      },
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxHeight < 550;

          // Compute size of blocks in the pyramid
          // The base has 4 blocks. Width of 4 blocks + margins should fit within constraints width
          final double availableWidth = constraints.maxWidth - (DesignSystem.spaceMD * 2);
          final double maxBlockSize = (availableWidth / 5.2).clamp(42.0, 75.0);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD, vertical: DesignSystem.spaceSM),
            child: Column(
              children: [
                // Top status bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TangibleContainer(
                        depth: 4.0,
                        padding: const EdgeInsets.symmetric(
                          vertical: DesignSystem.spaceSM,
                          horizontal: DesignSystem.spaceMD,
                        ),
                        color: colorScheme.surface,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.stars_rounded, color: DesignSystem.accentAmber, size: 20),
                            const SizedBox(width: DesignSystem.spaceXS),
                            Text(
                              'SCORE: ${state.score}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: DesignSystem.spaceMD),
                    Expanded(
                      child: TangibleContainer(
                        depth: 4.0,
                        padding: const EdgeInsets.symmetric(
                          vertical: DesignSystem.spaceSM,
                          horizontal: DesignSystem.spaceMD,
                        ),
                        color: state.timeLeft <= 10
                            ? colorScheme.error.withValues(alpha: 0.1)
                            : colorScheme.surface,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.timer_rounded,
                              color: state.timeLeft <= 10 ? colorScheme.error : colorScheme.primary,
                              size: 20,
                            ),
                            const SizedBox(width: DesignSystem.spaceXS),
                            Text(
                              '${state.timeLeft}s',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                                color: state.timeLeft <= 10 ? colorScheme.error : null,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isSmallScreen ? DesignSystem.spaceSM : DesignSystem.spaceMD),

                // Pyramid Area
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Row 3 (Apex)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildBlock(9, maxBlockSize, colorScheme, state),
                            ],
                          ),
                          // Row 2
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildBlock(7, maxBlockSize, colorScheme, state),
                              _buildBlock(8, maxBlockSize, colorScheme, state),
                            ],
                          ),
                          // Row 1
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildBlock(4, maxBlockSize, colorScheme, state),
                              _buildBlock(5, maxBlockSize, colorScheme, state),
                              _buildBlock(6, maxBlockSize, colorScheme, state),
                            ],
                          ),
                          // Row 0 (Base)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildBlock(0, maxBlockSize, colorScheme, state),
                              _buildBlock(1, maxBlockSize, colorScheme, state),
                              _buildBlock(2, maxBlockSize, colorScheme, state),
                              _buildBlock(3, maxBlockSize, colorScheme, state),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: isSmallScreen ? DesignSystem.spaceSM : DesignSystem.spaceMD),

                // Numeric Keypad
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 450),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Keypad row 1: 1, 2, 3, C
                      SizedBox(
                        height: 52,
                        child: Row(
                          children: [
                            _buildKeypadButton('1', colorScheme),
                            _buildKeypadButton('2', colorScheme),
                            _buildKeypadButton('3', colorScheme),
                            _buildKeypadButton('C', colorScheme),
                          ],
                        ),
                      ),
                      // Keypad row 2: 4, 5, 6, ⌫
                      SizedBox(
                        height: 52,
                        child: Row(
                          children: [
                            _buildKeypadButton('4', colorScheme),
                            _buildKeypadButton('5', colorScheme),
                            _buildKeypadButton('6', colorScheme),
                            _buildKeypadButton('⌫', colorScheme),
                          ],
                        ),
                      ),
                      // Keypad row 3: 7, 8, 9, ✓
                      SizedBox(
                        height: 52,
                        child: Row(
                          children: [
                            _buildKeypadButton('7', colorScheme),
                            _buildKeypadButton('8', colorScheme),
                            _buildKeypadButton('9', colorScheme),
                            _buildKeypadButton('✓', colorScheme),
                          ],
                        ),
                      ),
                      // Keypad row 4: 0
                      SizedBox(
                        height: 52,
                        child: Row(
                          children: [
                            _buildKeypadButton('0', colorScheme, widthFactor: 3.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: DesignSystem.spaceXS),
              ],
            ),
          );
        },
      ),
    );
  }
}
