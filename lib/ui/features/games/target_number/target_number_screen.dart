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
          final isSmall = constraints.maxHeight < 620;
          final viewPadding = MediaQuery.of(context).padding;
          final availableHeight = constraints.maxHeight - viewPadding.top - viewPadding.bottom;

          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: availableHeight),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: DesignSystem.spaceSM),
                    
                    // Target Display
                    _buildTargetCard(state.target, isSmall),
                    
                    const SizedBox(height: DesignSystem.spaceSM),
                    
                    // Expression Display
                    _buildExpressionDisplay(state, isSmall),
                    
                    const SizedBox(height: DesignSystem.spaceMD),
                    
                    // Numbers Grid
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: isSmall ? 3.2 : 2.5,
                      mainAxisSpacing: isSmall ? DesignSystem.spaceXS : DesignSystem.spaceMD,
                      crossAxisSpacing: DesignSystem.spaceMD,
                      children: List.generate(state.numbers.length, (index) {
                        final isUsed = state.usedIndexes[index];
                        return _buildNumberButton(
                          state.numbers[index].toString(),
                          () {
                            HapticFeedbackUtil.selectionClick();
                            notifier.onNumberPressed(index);
                          },
                          isUsed,
                          isSmall,
                        );
                      }),
                    ),
                    
                    const SizedBox(height: DesignSystem.spaceMD),
                    
                    // Operators & Controls
                    _buildControls(notifier, isSmall),
                    
                    const SizedBox(height: DesignSystem.spaceLG),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTargetCard(int target, bool isSmall) {
    return Container(
      constraints: BoxConstraints(maxHeight: isSmall ? 80 : 120),
      child: FittedBox(
        fit: BoxFit.contain,
        child: TangibleContainer(
          color: DesignSystem.accentAmber,
          shadowColor: const Color(0xFFD97706),
          radius: DesignSystem.radiusLG,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'TARGET',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 10,
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
      ),
    );
  }

  Widget _buildExpressionDisplay(TargetNumberState state, bool isSmall) {
    final colorScheme = Theme.of(context).colorScheme;
    final allUsed = state.usedIndexes.every((u) => u);
    final isWrong = allUsed && state.currentResult != null && (state.currentResult! - state.target).abs() > 1e-6;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxHeight: isSmall ? 100 : 140),
      padding: EdgeInsets.all(isSmall ? DesignSystem.spaceSM : DesignSystem.spaceMD),
      decoration: BoxDecoration(
        color: isWrong ? DesignSystem.error.withValues(alpha: 0.05) : colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(
          color: isWrong 
              ? DesignSystem.error.withValues(alpha: 0.5) 
              : colorScheme.outline.withValues(alpha: 0.3), 
          width: 2
        ),
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.currentExpression.isEmpty ? '---' : state.currentExpression,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: state.currentExpression.isEmpty 
                    ? colorScheme.outline 
                    : (isWrong ? DesignSystem.error : colorScheme.onSurface),
                letterSpacing: 1.5,
              ),
            ),
            if (state.currentResult != null) ...[
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: (isWrong ? DesignSystem.error : DesignSystem.primary).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
                ),
                child: Text(
                  '= ${state.currentResult!.toStringAsFixed(state.currentResult! % 1 == 0 ? 0 : 2)}',
                  style: TextStyle(
                    color: isWrong ? DesignSystem.error : DesignSystem.primary,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildNumberButton(String label, VoidCallback onTap, bool isUsed, bool isSmall) {
    final colorScheme = Theme.of(context).colorScheme;
    return Opacity(
      opacity: isUsed ? 0.3 : 1.0,
      child: TangibleButton(
        onTap: isUsed ? null : onTap,
        color: colorScheme.surface,
        shadowColor: colorScheme.outline.withValues(alpha: 0.5),
        padding: EdgeInsets.zero,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: colorScheme.onSurface,
              fontSize: isSmall ? 22 : 28,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildControls(TargetNumberNotifier notifier, bool isSmall) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Operators
        Row(
          children: [
            _buildOpButton('+', () => notifier.onOperatorPressed('+'), isSmall),
            const SizedBox(width: DesignSystem.spaceSM),
            _buildOpButton('-', () => notifier.onOperatorPressed('-'), isSmall),
            const SizedBox(width: DesignSystem.spaceSM),
            _buildOpButton('*', () => notifier.onOperatorPressed('*'), isSmall),
            const SizedBox(width: DesignSystem.spaceSM),
            _buildOpButton('/', () => notifier.onOperatorPressed('/'), isSmall),
          ],
        ),
        SizedBox(height: isSmall ? DesignSystem.spaceSM : DesignSystem.spaceMD),
        Row(
          children: [
            _buildOpButton('(', () => notifier.onBracketPressed('('), isSmall),
            const SizedBox(width: DesignSystem.spaceSM),
            _buildOpButton(')', () => notifier.onBracketPressed(')'), isSmall),
            const SizedBox(width: DesignSystem.spaceSM),
            Expanded(
              flex: 1,
              child: _buildControlButton(Icons.undo_rounded, () {
                HapticFeedbackUtil.mediumImpact();
                notifier.onUndo();
              }, DesignSystem.error, isSmall),
            ),
            const SizedBox(width: DesignSystem.spaceSM),
            Expanded(
              flex: 1,
              child: _buildControlButton(Icons.refresh_rounded, () {
                HapticFeedbackUtil.heavyImpact();
                notifier.onClear();
              }, Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5), isSmall),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOpButton(String op, VoidCallback onTap, bool isSmall) {
    return Expanded(
      child: TangibleButton(
        onTap: () {
          HapticFeedbackUtil.lightImpact();
          onTap();
        },
        color: DesignSystem.primary,
        shadowColor: DesignSystem.primaryShadow,
        padding: EdgeInsets.symmetric(vertical: isSmall ? 10 : 14),
        child: Center(
          child: Text(
            op == '*' ? '×' : (op == '/' ? '÷' : op),
            style: TextStyle(
              color: Colors.white,
              fontSize: isSmall ? 18 : 22,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildControlButton(IconData icon, VoidCallback onTap, Color color, bool isSmall) {
    return TangibleButton(
      onTap: onTap,
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
      padding: EdgeInsets.symmetric(vertical: isSmall ? 10 : 14),
      child: Center(child: Icon(icon, color: color, size: isSmall ? 20 : 24)),
    );
  }
}
