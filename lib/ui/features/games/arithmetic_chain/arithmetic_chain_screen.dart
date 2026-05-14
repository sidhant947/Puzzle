import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'arithmetic_chain_provider.dart';

class ArithmeticChainScreen extends ConsumerStatefulWidget {
  const ArithmeticChainScreen({super.key});

  @override
  ConsumerState<ArithmeticChainScreen> createState() => _ArithmeticChainScreenState();
}

class _ArithmeticChainScreenState extends ConsumerState<ArithmeticChainScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(arithmeticChainNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(bool isVictory) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? l10n.arithmeticChainWinTitle : l10n.arithmeticChainLoseTitle,
        message: isVictory 
            ? l10n.arithmeticChainWinMessage 
            : l10n.arithmeticChainLoseMessage(ref.read(arithmeticChainNotifierProvider).answer.toString()),
        isVictory: isVictory,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(arithmeticChainNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(arithmeticChainNotifierProvider);
    final notifier = ref.read(arithmeticChainNotifierProvider.notifier);

    ref.listen(arithmeticChainNotifierProvider, (previous, next) async {
      if (next.phase == GamePhase.result && previous?.phase != GamePhase.result) {
        final isVictory = int.tryParse(next.userInput) == next.answer;
        if (isVictory) {
          HapticFeedbackUtil.victory();
          await ref.read(gameStreakNotifierProvider.notifier).completeGame('arithmetic_chain');
        } else {
          HapticFeedbackUtil.vibrate();
        }
        if (!context.mounted) return;
        _showCompletionDialog(isVictory);
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.arithmeticChainTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: l10n.arithmeticChainTitle,
      subtitle: l10n.arithmeticChainSubtitle,
      body: Column(
        children: [
          const SizedBox(height: DesignSystem.spaceXL),
          
          // Display Area
          Expanded(
            flex: 2,
            child: Center(
              child: _buildMainDisplay(state, l10n),
            ),
          ),
          
          // Input Area
          if (state.phase == GamePhase.input)
            Expanded(
              flex: 3,
              child: _buildNumpad(state, notifier),
            )
          else
            const Spacer(flex: 3),
            
          const SizedBox(height: DesignSystem.space2XL),
        ],
      ),
    );
  }

  Widget _buildMainDisplay(ArithmeticChainState state, AppLocalizations l10n) {
    String text = '';
    Color color = Theme.of(context).colorScheme.onSurface;

    if (state.phase == GamePhase.sequence) {
      if (state.currentOpIndex == -1) {
        text = state.startValue.toString();
        color = DesignSystem.primary;
      } else {
        final op = state.operations[state.currentOpIndex];
        text = '${op['op']} ${op['val']}';
        color = _getOpColor(op['op']);
      }
    } else if (state.phase == GamePhase.input) {
      text = state.userInput.isEmpty ? '?' : state.userInput;
      color = DesignSystem.accentAmber;
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: FadeTransition(opacity: animation, child: child));
      },
      child: KeyedSubtree(
        key: ValueKey(text),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (state.phase == GamePhase.sequence)
               Text(
                state.currentOpIndex == -1 ? l10n.arithmeticChainStart : l10n.arithmeticChainNext,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.0,
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7).withValues(alpha: 0.5),
                ),
              ),
            Text(
              text,
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.w900,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getOpColor(String op) {
    switch (op) {
      case '+': return DesignSystem.success;
      case '-': return DesignSystem.error;
      case '×': return DesignSystem.primary;
      case '÷': return DesignSystem.accentBerry;
      default: return Theme.of(context).colorScheme.onSurface;
    }
  }

  Widget _buildNumpad(ArithmeticChainState state, ArithmeticChainNotifier notifier) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: Column(
        children: [
          Row(
            children: [
              _buildNumButton('1', () => notifier.onNumberPressed('1')),
              const SizedBox(width: DesignSystem.spaceMD),
              _buildNumButton('2', () => notifier.onNumberPressed('2')),
              const SizedBox(width: DesignSystem.spaceMD),
              _buildNumButton('3', () => notifier.onNumberPressed('3')),
            ],
          ),
          const SizedBox(height: DesignSystem.spaceMD),
          Row(
            children: [
              _buildNumButton('4', () => notifier.onNumberPressed('4')),
              const SizedBox(width: DesignSystem.spaceMD),
              _buildNumButton('5', () => notifier.onNumberPressed('5')),
              const SizedBox(width: DesignSystem.spaceMD),
              _buildNumButton('6', () => notifier.onNumberPressed('6')),
            ],
          ),
          const SizedBox(height: DesignSystem.spaceMD),
          Row(
            children: [
              _buildNumButton('7', () => notifier.onNumberPressed('7')),
              const SizedBox(width: DesignSystem.spaceMD),
              _buildNumButton('8', () => notifier.onNumberPressed('8')),
              const SizedBox(width: DesignSystem.spaceMD),
              _buildNumButton('9', () => notifier.onNumberPressed('9')),
            ],
          ),
          const SizedBox(height: DesignSystem.spaceMD),
          Row(
            children: [
              _buildControlButton(Icons.backspace_rounded, notifier.onBackspace, DesignSystem.error),
              const SizedBox(width: DesignSystem.spaceMD),
              _buildNumButton('0', () => notifier.onNumberPressed('0')),
              const SizedBox(width: DesignSystem.spaceMD),
              _buildControlButton(Icons.check_circle_rounded, notifier.onSubmit, DesignSystem.success),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNumButton(String label, VoidCallback onTap) {
    return Expanded(
      child: TangibleButton(
        onTap: onTap,
        color: Theme.of(context).colorScheme.surface,
        shadowColor: Theme.of(context).colorScheme.outline,
        child: Text(
          label,
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 24, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }

  Widget _buildControlButton(IconData icon, VoidCallback onTap, Color color) {
    return Expanded(
      child: TangibleButton(
        onTap: onTap,
        color: Theme.of(context).colorScheme.surface,
        shadowColor: Theme.of(context).colorScheme.outline,
        child: Icon(icon, color: color, size: 28),
      ),
    );
  }
}
