import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/haptic_feedback.dart';
import 'switch_task_provider.dart';
import 'switch_task_engine.dart';

class SwitchTaskScreen extends ConsumerStatefulWidget {
  const SwitchTaskScreen({super.key});

  @override
  ConsumerState<SwitchTaskScreen> createState() => _SwitchTaskScreenState();
}

class _SwitchTaskScreenState extends ConsumerState<SwitchTaskScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(switchTaskNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    final l10n = AppLocalizations.of(context)!;
    bool won = score >= 15;
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('switch_task');
    } else {
      HapticFeedbackUtil.heavyImpact();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'MENTAL GYMNAST!' : 'WIRES CROSSED',
        message:
            'You scored $score correctly! Fast switching is key to mental flexibility.',
        onPlayAgain: () {
          ref.read(switchTaskNotifierProvider.notifier).initGame();
          Navigator.pop(context);
        },
        onHome: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = ref.watch(switchTaskNotifierProvider);
    final notifier = ref.read(switchTaskNotifierProvider.notifier);

    ref.listen(switchTaskNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: l10n.switchTaskTitle.toUpperCase(),
      subtitle: l10n.switchTaskSubtitle,
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isSmall = constraints.maxHeight < 600;
                  return Column(
                    children: [
                      SizedBox(height: isSmall ? 8 : 16),
                      _buildStats(state, isSmall),
                      Spacer(),
                      TangibleContainer(
                        color: state.rule == SwitchRule.color
                            ? DesignSystem.accentIndigo.withValues(alpha: 0.1)
                            : DesignSystem.accentOrange.withValues(alpha: 0.1),
                        shadowColor: theme.scaffoldBackgroundColor,
                        depth: 2.0, // Reduced depth
                        padding: EdgeInsets.symmetric(
                            horizontal: isSmall ? 12 : 20,
                            vertical: isSmall ? 6 : 10),
                        child: Text(
                          state.rule == SwitchRule.color
                              ? 'MATCH COLOR'
                              : 'MATCH SHAPE',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                            fontSize: isSmall ? 14 : 16, // Reduced font size
                            color: state.rule == SwitchRule.color
                                ? DesignSystem.accentIndigo
                                : DesignSystem.accentOrange,
                          ),
                        ),
                      ),
                      SizedBox(height: isSmall ? 16 : 32),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight:
                              constraints.maxHeight * (isSmall ? 0.3 : 0.25),
                        ),
                        child: TangibleContainer(
                          color: colorScheme.surface,
                          shadowColor: colorScheme.outline,
                          depth: 3.0, // Reduced depth
                          padding: EdgeInsets.all(isSmall ? 12 : 24),
                          child: FittedBox(
                            child: Icon(
                              state.item.shape,
                              size: 100, // Reduced base size
                              color: state.item.color,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
                        child: Row(
                          children: state.options.map((option) {
                            return Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: isSmall ? 4 : 6),
                                child: TangibleButton(
                                  onTap: () {
                                    HapticFeedbackUtil.lightImpact();
                                    notifier.onOptionSelected(option);
                                  },
                                  color: colorScheme.surface,
                                  shadowColor: colorScheme.outline,
                                  depth: 3.0, // Added depth
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: isSmall
                                            ? 8
                                            : 14), // Reduced padding
                                    alignment: Alignment.center,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        option,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 14, // Reduced font size
                                          color: colorScheme.onSurface,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: isSmall ? 12 : 24),
                    ],
                  );
                },
              ),
            ),
    );
  }

  Widget _buildStats(SwitchTaskState state, bool isSmall) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStat(
              'TIME',
              '${state.timeLeft}s',
              state.timeLeft < 10 ? DesignSystem.error : DesignSystem.primary,
              isSmall),
          _buildStat('SCORE', '${state.score}', DesignSystem.success, isSmall),
        ],
      ),
    );
  }

  Widget _buildStat(String label, String value, Color color, bool isSmall) {
    return TangibleContainer(
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.outline,
      depth: isSmall ? 2.0 : 4.0,
      padding: EdgeInsets.symmetric(
          horizontal: isSmall ? 16 : 24, vertical: isSmall ? 4 : 8),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isSmall ? 8 : 10,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              letterSpacing: 1.5,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: isSmall ? 18 : 24,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
