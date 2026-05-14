import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'double_n_back_provider.dart';

class DoubleNBackScreen extends ConsumerStatefulWidget {
  const DoubleNBackScreen({super.key});

  @override
  ConsumerState<DoubleNBackScreen> createState() => _DoubleNBackScreenState();
}

class _DoubleNBackScreenState extends ConsumerState<DoubleNBackScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(doubleNBackNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(doubleNBackNotifierProvider);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.doubleNBackGameOverTitle,
        message: l10n.doubleNBackGameOverMessage(state.score),
        isVictory: state.score > 10,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(doubleNBackNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(doubleNBackNotifierProvider);
    final notifier = ref.read(doubleNBackNotifierProvider.notifier);
    final l10n = AppLocalizations.of(context)!;

    ref.listen(doubleNBackNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('double_n_back');
        _showCompletionDialog();
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.doubleNBackTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final currentStim = state.sequence.isNotEmpty ? state.sequence.last : null;

    return GameScaffold(
      title: l10n.doubleNBackTitle,
      subtitle: l10n.doubleNBackSubtitle(state.n),
      actions: [
        _buildTimer(state.timeLeft),
      ],
      body: Padding(
        padding: const EdgeInsets.all(DesignSystem.spaceLG),
        child: Column(
          children: [
            Text(
              l10n.doubleNBackScore(state.score),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: DesignSystem.primary),
            ),
            const SizedBox(height: DesignSystem.spaceLG),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildGrid(currentStim?.position),
                    const SizedBox(height: DesignSystem.space2XL),
                    Text(
                      currentStim?.letter ?? '',
                      style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w900, color: DesignSystem.accentBerry),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TangibleButton(
                    onTap: notifier.pressPositionMatch,
                    color: state.positionMatchPressed
                        ? DesignSystem.success
                        : colorScheme.surface,
                    child: Center(
                      child: Text(
                        l10n.doubleNBackPositionMatch,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 12,
                          color: state.positionMatchPressed
                              ? Colors.white
                              : colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: DesignSystem.spaceMD),
                Expanded(
                  child: TangibleButton(
                    onTap: notifier.pressLetterMatch,
                    color: state.letterMatchPressed
                        ? DesignSystem.success
                        : colorScheme.surface,
                    child: Center(
                      child: Text(
                        l10n.doubleNBackLetterMatch,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 12,
                          color: state.letterMatchPressed
                              ? Colors.white
                              : colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(int? activePosition) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        padding: const EdgeInsets.all(DesignSystem.spaceSM),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          border: Border.all(color: Theme.of(context).colorScheme.outline, width: 2),
        ),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            final isActive = index == activePosition;
            return AnimatedContainer(
              duration: Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: isActive ? DesignSystem.primary : Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                border: Border.all(
                  color: isActive ? DesignSystem.primary : Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
                  width: 2,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTimer(int timeLeft) {
    return TangibleContainer(
      color: timeLeft < 10 ? DesignSystem.error.withValues(alpha: 0.1) : Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      radius: DesignSystem.radiusSM,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.timer_outlined, size: 16, color: timeLeft < 10 ? DesignSystem.error : Theme.of(context).colorScheme.onSurface),
          SizedBox(width: 4),
          Text(
            timeLeft.toString(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: timeLeft < 10 ? DesignSystem.error : Theme.of(context).colorScheme.onSurface),
          ),
        ],
      ),
    );
  }
}
