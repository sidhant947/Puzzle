import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/haptic_feedback.dart';
import 'stop_signal_provider.dart';

class StopSignalScreen extends ConsumerStatefulWidget {
  const StopSignalScreen({super.key});

  @override
  ConsumerState<StopSignalScreen> createState() => _StopSignalScreenState();
}

class _StopSignalScreenState extends ConsumerState<StopSignalScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(stopSignalNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    final l10n = AppLocalizations.of(context)!;
    bool won = score >= 20;
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('stop_signal');
    } else {
      HapticFeedbackUtil.heavyImpact();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'TOTAL CONTROL!' : 'INHIBITION FAIL',
        message: 'You achieved $score correct responses! This test measures your ability to inhibit a planned action.',
        onPlayAgain: () {
          ref.read(stopSignalNotifierProvider.notifier).initGame();
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
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(stopSignalNotifierProvider);
    final notifier = ref.read(stopSignalNotifierProvider.notifier);

    ref.listen(stopSignalNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: l10n.stopSignalTitle.toUpperCase(),
      subtitle: l10n.stopSignalSubtitle,
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
                      const Spacer(),
                      _buildArrow(state),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Expanded(
                              child: TangibleButton(
                                onTap: () {
                                  HapticFeedbackUtil.lightImpact();
                                  notifier.onDirectionTap(0);
                                },
                                color: colorScheme.surface,
                                padding: const EdgeInsets.symmetric(vertical: 32),
                                child: Icon(Icons.arrow_back_rounded, size: 48, color: colorScheme.onSurface),
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: TangibleButton(
                                onTap: () {
                                  HapticFeedbackUtil.lightImpact();
                                  notifier.onDirectionTap(1);
                                },
                                color: colorScheme.surface,
                                padding: const EdgeInsets.symmetric(vertical: 32),
                                child: Icon(Icons.arrow_forward_rounded, size: 48, color: colorScheme.onSurface),
                              ),
                            ),
                          ],
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

  Widget _buildArrow(StopSignalState state) {
    if (state.currentTrial == null) return const SizedBox(height: 120);

    final color = state.isStopVisible ? DesignSystem.error : DesignSystem.primary;
    final icon = state.currentTrial!.direction == 0 ? Icons.arrow_back_rounded : Icons.arrow_forward_rounded;

    return TangibleContainer(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.all(40),
      child: Icon(icon, size: 120, color: color),
    );
  }

  Widget _buildStats(StopSignalState state, bool isSmall) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStat('TIME', '${state.timeLeft}s', state.timeLeft < 10 ? DesignSystem.error : DesignSystem.primary, isSmall),
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
        horizontal: isSmall ? 12 : 16, 
        vertical: isSmall ? 4 : 8
      ),
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
              fontSize: isSmall ? 18 : 22,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
