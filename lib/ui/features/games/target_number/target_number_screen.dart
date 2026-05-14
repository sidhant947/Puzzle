import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'target_number_provider.dart';

class TargetNumberScreen extends ConsumerStatefulWidget {
  const TargetNumberScreen({super.key});

  @override
  ConsumerState<TargetNumberScreen> createState() => _TargetNumberScreenState();
}

class _TargetNumberScreenState extends ConsumerState<TargetNumberScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(targetNumberNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(bool isVictory) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? 'AMAZING!' : 'GAME OVER',
        message: isVictory 
            ? 'You reached the target number!' 
            : 'Try again to find the solution.',
        isVictory: isVictory,
        onHome: () {
          Navigator.of(context).pop(); // Dialog
          Navigator.of(context).pop(); // Game
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(targetNumberNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(targetNumberNotifierProvider);
    final notifier = ref.read(targetNumberNotifierProvider.notifier);

    ref.listen(targetNumberNotifierProvider, (previous, next) async {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        if (next.isGameWon) {
          HapticFeedbackUtil.victory();
          await ref.read(gameStreakNotifierProvider.notifier).completeGame('target_number');
        } else {
          HapticFeedbackUtil.vibrate();
        }
        if (!context.mounted) return;
        _showCompletionDialog(next.isGameWon);
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.targetNumberTitle.toUpperCase(),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Target 24',
      subtitle: l10n.targetNumberSubtitle(state.target),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double cardHeight = constraints.maxHeight * 0.2;
          final double displayHeight = constraints.maxHeight * 0.2;

          return Column(
            children: [
              const Spacer(),
              
              // Target Display
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: cardHeight),
                child: _buildTargetCard(state.target),
              ),
              
              const Spacer(),
              
              // Expression Display
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: displayHeight),
                child: _buildExpressionDisplay(state),
              ),
              
              const Spacer(),
              
              // Numbers Grid
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                child: Wrap(
                  spacing: DesignSystem.spaceMD,
                  runSpacing: DesignSystem.spaceMD,
                  alignment: WrapAlignment.center,
                  children: List.generate(state.numbers.length, (index) {
                    final isUsed = state.usedIndexes[index];
                    return _buildNumberButton(
                      state.numbers[index].toString(),
                      () {
                        HapticFeedbackUtil.selectionClick();
                        notifier.onNumberPressed(index);
                      },
                      isUsed,
                    );
                  }),
                ),
              ),
              
              const Spacer(),
              
              // Operators & Controls
              _buildControls(notifier),
              
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTargetCard(int target) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: TangibleContainer(
        color: DesignSystem.accentAmber,
        shadowColor: const Color(0xFFD97706),
        radius: DesignSystem.radiusXL,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'TARGET',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.w900,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              '$target',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpressionDisplay(TargetNumberState state) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      padding: const EdgeInsets.all(DesignSystem.spaceLG),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5), width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              state.currentExpression.isEmpty ? '???' : state.currentExpression,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: state.currentExpression.isEmpty 
                    ? Theme.of(context).colorScheme.outline 
                    : Theme.of(context).colorScheme.onSurface,
                letterSpacing: 2.0,
              ),
            ),
          ),
          if (state.currentResult != null) ...[
            const SizedBox(height: DesignSystem.spaceXS),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: DesignSystem.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '= ${state.currentResult!.toStringAsFixed(state.currentResult! % 1 == 0 ? 0 : 2)}',
                  style: const TextStyle(
                    color: DesignSystem.primary,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildNumberButton(String label, VoidCallback onTap, bool isUsed) {
    return Opacity(
      opacity: isUsed ? 0.4 : 1.0,
      child: TangibleButton(
        onTap: isUsed ? () {} : onTap,
        color: Theme.of(context).colorScheme.surface,
        shadowColor: Theme.of(context).colorScheme.outline,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Text(
          label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  Widget _buildControls(TargetNumberNotifier notifier) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Operators
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildOpButton('+', () {
                HapticFeedbackUtil.lightImpact();
                notifier.onOperatorPressed('+');
              }),
              _buildOpButton('-', () {
                HapticFeedbackUtil.lightImpact();
                notifier.onOperatorPressed('-');
              }),
              _buildOpButton('*', () {
                HapticFeedbackUtil.lightImpact();
                notifier.onOperatorPressed('*');
              }),
              _buildOpButton('/', () {
                HapticFeedbackUtil.lightImpact();
                notifier.onOperatorPressed('/');
              }),
            ],
          ),
          const SizedBox(height: DesignSystem.spaceSM),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildOpButton('(', () {
                HapticFeedbackUtil.lightImpact();
                notifier.onBracketPressed('(');
              }),
              _buildOpButton(')', () {
                HapticFeedbackUtil.lightImpact();
                notifier.onBracketPressed(')');
              }),
              _buildControlButton(Icons.undo_rounded, () {
                HapticFeedbackUtil.mediumImpact();
                notifier.onUndo();
              }, DesignSystem.error),
              _buildControlButton(Icons.refresh_rounded, () {
                HapticFeedbackUtil.heavyImpact();
                notifier.onClear();
              }, Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOpButton(String op, VoidCallback onTap) {
    return TangibleButton(
      onTap: onTap,
      color: DesignSystem.primary,
      shadowColor: DesignSystem.primaryShadow,
      padding: const EdgeInsets.all(16),
      child: Text(
        op == '*' ? '×' : (op == '/' ? '÷' : op),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget _buildControlButton(IconData icon, VoidCallback onTap, Color color) {
    return TangibleButton(
      onTap: onTap,
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.outline,
      padding: const EdgeInsets.all(16),
      child: Icon(icon, color: color, size: 24),
    );
  }
}
