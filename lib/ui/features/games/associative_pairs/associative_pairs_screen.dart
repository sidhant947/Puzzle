import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'associative_pairs_engine.dart';
import 'associative_pairs_provider.dart';

class AssociativePairsScreen extends ConsumerWidget {
  const AssociativePairsScreen({super.key});

  IconData _getShapeIcon(AssocShape shape) {
    switch (shape) {
      case AssocShape.circle:
        return Icons.lens_rounded;
      case AssocShape.square:
        return Icons.square_rounded;
      case AssocShape.triangle:
        return Icons.change_history_rounded;
      case AssocShape.star:
        return Icons.star_rounded;
      case AssocShape.diamond:
        return Icons.diamond_rounded;
      case AssocShape.hexagon:
        return Icons.hexagon_rounded;
      case AssocShape.heart:
        return Icons.favorite_rounded;
    }
  }

  Color _getColorValue(AssocColor color) {
    switch (color) {
      case AssocColor.amber:
        return DesignSystem.accentAmber;
      case AssocColor.teal:
        return DesignSystem.accentTeal;
      case AssocColor.berry:
        return DesignSystem.accentBerry;
      case AssocColor.indigo:
        return Colors.indigoAccent;
      case AssocColor.emerald:
        return DesignSystem.accentEmerald;
      case AssocColor.orange:
        return Colors.deepOrangeAccent;
      case AssocColor.purple:
        return Colors.purpleAccent;
    }
  }

  String _getColorName(AssocColor color) {
    return color.name.toUpperCase();
  }

  String _getShapeName(AssocShape shape) {
    return shape.name.toUpperCase();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(associativePairsNotifierProvider);
    final colorScheme = Theme.of(context).colorScheme;

    ref.listen(associativePairsNotifierProvider, (previous, next) {
      if (next.status == AssociativeStatus.completed &&
          previous?.status != AssociativeStatus.completed) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'ASSOCIATIVE PAIRS COMPLETE',
            message: 'Brilliant! You associated visual traits flawlessly.',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(associativePairsNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      } else if (next.status == AssociativeStatus.failure &&
          previous?.status != AssociativeStatus.failure) {
        HapticFeedbackUtil.error();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'GAME OVER',
            message: 'Wrong association! Sharpen your link memory and try again.',
            isVictory: false,
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(associativePairsNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      } else if (next.status == AssociativeStatus.success &&
          previous?.status != AssociativeStatus.success) {
        HapticFeedbackUtil.success();
      }
    });

    return GameScaffold(
      title: 'ASSOCIATIVE PAIRS',
      subtitle: 'Memorize and link colors to shapes',
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(associativePairsNotifierProvider.notifier).reset();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.refresh_rounded,
            color: colorScheme.onSurface,
            size: 20,
          ),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const SizedBox(height: DesignSystem.spaceMD),
              _buildHeader(state, context),
              Expanded(
                child: Center(
                  child: _buildMainBody(ref, state, context),
                ),
              ),
              _buildInstruction(state, context),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(AssociativePairsState state, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatCard('LEVEL', '${state.currentLevel}/5', DesignSystem.accentAmber, context),
        _buildStatCard('PAIRS', '${state.pairs.length}', DesignSystem.primary, context),
        if (state.status == AssociativeStatus.questioning)
          _buildStatCard(
              'PROGRESS',
              '${state.currentQuestionIndex + 1}/${state.questions.length}',
              DesignSystem.accentTeal,
              context),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, Color color, BuildContext context) {
    return TangibleContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Theme.of(context).colorScheme.surface,
      depth: 2,
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: color,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainBody(WidgetRef ref, AssociativePairsState state, BuildContext context) {
    if (state.status == AssociativeStatus.memorizing) {
      return _buildMemorizeBody(ref, state, context);
    }
    return _buildQuestionBody(ref, state, context);
  }

  Widget _buildMemorizeBody(WidgetRef ref, AssociativePairsState state, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: state.pairs.map((pair) {
                final colorVal = _getColorValue(pair.color);
                final shapeIcon = _getShapeIcon(pair.shape);

                return TangibleContainer(
                  color: Theme.of(context).colorScheme.surface,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  depth: 2,
                  radius: DesignSystem.radiusMD,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(shapeIcon, color: colorVal, size: 36),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _getShapeName(pair.shape),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              _getColorName(pair.color),
                              style: TextStyle(
                                fontSize: 10,
                                color: colorVal,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: DesignSystem.space2XL),
            TangibleButton(
              onTap: () {
                HapticFeedbackUtil.success();
                ref.read(associativePairsNotifierProvider.notifier).startTesting();
              },
              color: DesignSystem.primary,
              depth: 3,
              child: Container(
                width: 200,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: const Text(
                  'READY TO RECALL',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionBody(WidgetRef ref, AssociativePairsState state, BuildContext context) {
    if (state.questions.isEmpty || state.currentQuestionIndex >= state.questions.length) {
      return const SizedBox.shrink();
    }

    final question = state.questions[state.currentQuestionIndex];
    final isShapeToColor = question.type == AssociativeQuestionType.shapeToColor;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TangibleContainer(
              color: Theme.of(context).colorScheme.surface,
              depth: 4,
              padding: const EdgeInsets.all(24),
              radius: DesignSystem.radiusMD,
              child: Column(
                children: [
                  Text(
                    'ASSOCIATIVE RECALL',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      color: isShapeToColor ? DesignSystem.accentAmber : DesignSystem.accentTeal,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    isShapeToColor
                        ? 'What color was associated with this shape?'
                        : 'Which shape was associated with this color?',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (isShapeToColor)
                    Icon(
                      _getShapeIcon(question.target.shape),
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 64,
                    )
                  else
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: _getColorValue(question.target.color),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: _getColorValue(question.target.color).withValues(alpha: 0.3),
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: DesignSystem.space2XL),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.8,
              ),
              itemCount: question.options.length,
              itemBuilder: (context, index) {
                final option = question.options[index];
                final isCorrectAnswer = option == question.correctOption;
                final isSelected = state.selectedOption == option;

                Color btnColor = Theme.of(context).colorScheme.surface;
                double depth = 2;

                if (state.selectedOption != null) {
                  if (isCorrectAnswer) {
                    btnColor = DesignSystem.accentEmerald;
                    depth = 0;
                  } else if (isSelected) {
                    btnColor = DesignSystem.error;
                    depth = 0;
                  }
                }

                return TangibleButton(
                  onTap: () {
                    HapticFeedbackUtil.lightImpact();
                    ref.read(associativePairsNotifierProvider.notifier).answerQuestion(option);
                  },
                  color: btnColor,
                  depth: depth,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: isShapeToColor
                        ? FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: _getColorValue(option as AssocColor),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  _getColorName(option),
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900,
                                    color: state.selectedOption != null
                                        ? Colors.white
                                        : Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Icon(
                            _getShapeIcon(option as AssocShape),
                            color: state.selectedOption != null
                                ? Colors.white
                                : Theme.of(context).colorScheme.onSurface,
                            size: 32,
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstruction(AssociativePairsState state, BuildContext context) {
    String text = '';
    Color color = Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7);

    switch (state.status) {
      case AssociativeStatus.memorizing:
        text = 'STUDY THE COLOR-SHAPE CONNECTIONS';
        color = DesignSystem.accentAmber;
        break;
      case AssociativeStatus.questioning:
        text = 'TAP THE MATCHING TRAIT';
        color = DesignSystem.primary;
        break;
      case AssociativeStatus.success:
      case AssociativeStatus.completed:
        text = 'GREAT RECALL!';
        color = DesignSystem.accentEmerald;
        break;
      case AssociativeStatus.failure:
        text = 'WRONG LINK!';
        color = DesignSystem.error;
        break;
    }

    return TangibleContainer(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: color.withValues(alpha: 0.1),
      radius: DesignSystem.radiusFull,
      depth: 1,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
