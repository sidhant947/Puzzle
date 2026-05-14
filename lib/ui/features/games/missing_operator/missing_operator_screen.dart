import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'missing_operator_provider.dart';

class MissingOperatorScreen extends ConsumerStatefulWidget {
  const MissingOperatorScreen({super.key});

  @override
  ConsumerState<MissingOperatorScreen> createState() => _MissingOperatorScreenState();
}

class _MissingOperatorScreenState extends ConsumerState<MissingOperatorScreen> {
  int? selectedSlot;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(missingOperatorNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(bool isVictory) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? 'EQUATION SOLVED!' : 'TRY AGAIN',
        message: isVictory 
            ? 'You found the correct operators!' 
            : 'That set of operators didn\'t equal ${ref.read(missingOperatorNotifierProvider).problem?.result}.',
        isVictory: isVictory,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          setState(() => selectedSlot = null);
          ref.read(missingOperatorNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(missingOperatorNotifierProvider);
    final notifier = ref.read(missingOperatorNotifierProvider.notifier);

    ref.listen(missingOperatorNotifierProvider, (previous, next) async {
      if (next.isGameOver && previous?.isGameOver != true) {
        if (next.isLastAnswerCorrect == true) {
          HapticFeedbackUtil.victory();
          await ref.read(gameStreakNotifierProvider.notifier).completeGame('missing_operator');
        } else {
          HapticFeedbackUtil.vibrate();
        }
        if (!context.mounted) return;
        _showCompletionDialog(next.isLastAnswerCorrect == true);
      }
    });

    if (state.problem == null) {
      return GameScaffold(
        title: l10n.missingOperatorTitle.toUpperCase(),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Operator Mix',
      subtitle: l10n.missingOperatorSubtitle,
      body: Column(
        children: [
          const SizedBox(height: DesignSystem.space2XL),
          
          // Equation Display
          Expanded(
            flex: 2,
            child: Center(
              child: _buildEquation(state),
            ),
          ),
          
          // Operator Selection
          Expanded(
            flex: 3,
            child: _buildOperatorGrid(notifier),
          ),
          
          const SizedBox(height: DesignSystem.space2XL),
        ],
      ),
    );
  }

  Widget _buildEquation(MissingOperatorState state) {
    final problem = state.problem!;
    List<Widget> children = [];

    for (int i = 0; i < problem.operands.length; i++) {
      children.add(_buildNumber(problem.operands[i]));
      if (i < problem.operators.length) {
        children.add(const SizedBox(width: DesignSystem.spaceXS));
        children.add(_buildOperatorSlot(i, state.userOperators[i]));
        children.add(const SizedBox(width: DesignSystem.spaceXS));
      }
    }

    children.add(const SizedBox(width: DesignSystem.spaceSM));
    children.add(Text('=', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Theme.of(context).colorScheme.onSurface)));
    children.add(const SizedBox(width: DesignSystem.spaceSM));
    children.add(_buildNumber(problem.result, color: DesignSystem.primary));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceSM),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }

  Widget _buildNumber(int val, {Color? color}) {
    final textColor = color ?? Theme.of(context).colorScheme.onSurface;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
        border: Border.all(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5), width: 2),
      ),
      child: Text(
        '$val',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: textColor),
      ),
    );
  }

  Widget _buildOperatorSlot(int index, String? op) {
    final isSelected = selectedSlot == index;
    final displayOp = op == '*' ? '×' : (op == '/' ? '÷' : op);
    
    return GestureDetector(
      onTap: () => setState(() => selectedSlot = index),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: isSelected ? DesignSystem.primary.withValues(alpha: 0.1) : Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
          border: Border.all(
            color: isSelected ? DesignSystem.primary : Theme.of(context).colorScheme.outline,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            displayOp ?? '?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: op == null ? Theme.of(context).colorScheme.outline : DesignSystem.accentAmber,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOperatorGrid(MissingOperatorNotifier notifier) {
    final operators = ['+', '-', '×', '÷'];
    final internalOps = ['+', '-', '*', '/'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: DesignSystem.spaceMD,
          mainAxisSpacing: DesignSystem.spaceMD,
          childAspectRatio: 1.5,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return TangibleButton(
            onTap: selectedSlot != null ? () {
              notifier.setOperator(selectedSlot!, internalOps[index]);
            } : () {},
            color: Theme.of(context).colorScheme.surface,
            shadowColor: Theme.of(context).colorScheme.outline,
            child: Center(
              child: Text(
                operators[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32, 
                  fontWeight: FontWeight.w900, 
                  color: Theme.of(context).colorScheme.onSurface,
                  height: 1.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
