import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'temporal_order_engine.dart';
import 'temporal_order_provider.dart';

class TemporalOrderScreen extends ConsumerWidget {
  const TemporalOrderScreen({super.key});

  static const List<IconData> iconsList = [
    Icons.wb_sunny_rounded,
    Icons.brightness_3_rounded,
    Icons.umbrella_rounded,
    Icons.eco_rounded,
    Icons.celebration_rounded,
    Icons.directions_bike_rounded,
    Icons.local_fire_department_rounded,
    Icons.key_rounded,
    Icons.face_rounded,
    Icons.pets_rounded,
    Icons.anchor_rounded,
    Icons.rocket_launch_rounded,
    Icons.music_note_rounded,
    Icons.favorite_rounded,
    Icons.lightbulb_rounded,
  ];

  static const List<Color> colorsList = [
    DesignSystem.accentAmber,
    DesignSystem.primary,
    DesignSystem.accentTeal,
    DesignSystem.accentBerry,
    Colors.deepOrangeAccent,
    Colors.indigoAccent,
    Colors.purpleAccent,
    Colors.pinkAccent,
    Colors.lightGreenAccent,
    Colors.cyanAccent,
    Colors.tealAccent,
    Colors.amberAccent,
    Colors.redAccent,
    Colors.blueAccent,
    Colors.limeAccent,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(temporalOrderNotifierProvider);
    final colorScheme = Theme.of(context).colorScheme;

    ref.listen(temporalOrderNotifierProvider, (previous, next) {
      if (next.status == TemporalOrderStatus.completed &&
          previous?.status != TemporalOrderStatus.completed) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'TEMPORAL ORDER COMPLETE',
            message: 'Incredible! Your temporal sequence memory is high-fidelity.',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(temporalOrderNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      } else if (next.status == TemporalOrderStatus.failure &&
          previous?.status != TemporalOrderStatus.failure) {
        HapticFeedbackUtil.error();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'GAME OVER',
            message: 'Incorrect sequence memory. Practice makes perfect!',
            isVictory: false,
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(temporalOrderNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      } else if (next.status == TemporalOrderStatus.success &&
          previous?.status != TemporalOrderStatus.success) {
        HapticFeedbackUtil.success();
      }
    });

    return GameScaffold(
      title: 'TEMPORAL ORDER',
      subtitle: 'Track the sequential timeline of icons',
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(temporalOrderNotifierProvider.notifier).reset();
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
              const Spacer(),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.6),
                child: Center(
                  child: _buildMainBody(ref, state, context),
                ),
              ),
              const Spacer(),
              _buildInstruction(state, context),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(TemporalOrderState state, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatCard('LEVEL', '${state.currentLevel}/5', DesignSystem.accentAmber, context),
        _buildStatCard('ROUND', '${state.currentRound}/3', DesignSystem.primary, context),
        _buildStatCard('SEQUENCE', '${state.sequence.length} ICONS', DesignSystem.accentTeal, context),
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

Widget _buildMainBody(WidgetRef ref, TemporalOrderState state, BuildContext context) {
  if (state.status == TemporalOrderStatus.showingSequence) {
    if (state.sequence.isEmpty) return const SizedBox.shrink();
    final itemIndex = state.sequence[state.currentIndexInSequence];
    final icon = iconsList[itemIndex];
    final color = colorsList[itemIndex];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TangibleContainer(
          color: Theme.of(context).colorScheme.surface,
          padding: const EdgeInsets.all(48),
          radius: DesignSystem.radiusMD,
          depth: 4,
          shadowColor: color.withValues(alpha: 0.15),
          child: Icon(
            icon,
            color: color,
            size: 80,
          ),
        ),
        const SizedBox(height: DesignSystem.spaceXL),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: (state.currentIndexInSequence + 1) / state.sequence.length,
              minHeight: 8,
              backgroundColor: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ),
      ],
    );
  }

  // Question phase
  final question = state.question;
  if (question == null) return const SizedBox.shrink();

  final isEarlier = question.type == QuestionType.earlier;

  return Padding(
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
                'ORDER QUERY',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                  color: isEarlier ? DesignSystem.accentAmber : DesignSystem.accentTeal,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Which of these items was shown ${isEarlier ? 'EARLIER' : 'LATER'}?',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: DesignSystem.spaceXL),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildOptionCard(ref, state, question.itemA, context),
            const SizedBox(width: DesignSystem.spaceMD),
            _buildOptionCard(ref, state, question.itemB, context),
          ],
        ),
      ],
    ),
  );
}

Widget _buildOptionCard(WidgetRef ref, TemporalOrderState state, int item, BuildContext context) {
  final icon = iconsList[item];
  final color = colorsList[item];
  final isSelected = state.selectedItem == item;
  final isCorrectAnswer = item == state.question?.correctItem;

  Color cardColor = Theme.of(context).colorScheme.surface;
  double depth = 2;

  if (state.status == TemporalOrderStatus.success || state.status == TemporalOrderStatus.failure) {
    if (isCorrectAnswer) {
      cardColor = DesignSystem.accentEmerald;
      depth = 0;
    } else if (isSelected) {
      cardColor = DesignSystem.error;
      depth = 0;
    }
  }

  return Expanded(
    child: TangibleButton(
      onTap: () {
        HapticFeedbackUtil.lightImpact();
        ref.read(temporalOrderNotifierProvider.notifier).selectOption(item);
      },
      color: cardColor,
      depth: depth,
      child: Container(
        padding: const EdgeInsets.all(32),
        alignment: Alignment.center,
        child: Icon(
          icon,
          color: (state.status == TemporalOrderStatus.success || state.status == TemporalOrderStatus.failure)
              ? Colors.white
              : color,
          size: 48,
        ),
      ),
    ),
  );
}

Widget _buildInstruction(TemporalOrderState state, BuildContext context) {
  String text = '';
  Color color = Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7);

  switch (state.status) {
    case TemporalOrderStatus.showingSequence:
      text = 'MEMORIZE THE SEQUENCE ORDER';
      color = DesignSystem.accentAmber;
      break;
    case TemporalOrderStatus.questioning:
      text = 'DETERMINE WHICH ITEM CAME FIRST/LAST';
      color = DesignSystem.primary;
      break;
    case TemporalOrderStatus.success:
    case TemporalOrderStatus.completed:
      text = 'CORRECT ORDER!';
      color = DesignSystem.accentEmerald;
      break;
    case TemporalOrderStatus.failure:
      text = 'WRONG TIMELINE!';
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
