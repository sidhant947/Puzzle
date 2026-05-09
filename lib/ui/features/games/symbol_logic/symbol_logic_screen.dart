import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import 'symbol_logic_provider.dart';
import 'symbol_logic_engine.dart';

class SymbolLogicScreen extends ConsumerStatefulWidget {
  const SymbolLogicScreen({super.key});

  @override
  ConsumerState<SymbolLogicScreen> createState() => _SymbolLogicScreenState();
}

class _SymbolLogicScreenState extends ConsumerState<SymbolLogicScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(symbolLogicNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(bool won) {
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('symbol_logic');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'LOGIC MASTER!' : 'WRONG ANSWER',
        message: won ? 'You solved the visual equations!' : 'Try again.',
        onPlayAgain: () {
          ref.read(symbolLogicNotifierProvider.notifier).initGame();
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
    final state = ref.watch(symbolLogicNotifierProvider);
    final notifier = ref.read(symbolLogicNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(symbolLogicNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.isGameWon);
      }
    });

    return GameScaffold(
      title: 'SYMBOL LOGIC',
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            const Text(
                              'Solve for the final equation!',
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            ...state.equations.map((eq) => _buildEquationRow(eq, theme)),
                            const SizedBox(height: 24),
                            // Input Display
                            Container(
                              width: 120,
                              height: 60,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                                border: Border.all(
                                  color: state.isInvalidGuess ? DesignSystem.gameRose : theme.colorScheme.primary,
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  state.currentInput,
                                  style: theme.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Number Pad
                    _buildNumberPad(notifier, theme),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildEquationRow(SymbolEquation eq, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(eq.symbols[0], size: 40, color: DesignSystem.gameAmber),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text('+', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Icon(eq.symbols[1], size: 40, color: DesignSystem.gameBlue),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text('=', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Text(
            eq.isQuestion ? '?' : eq.result.toString(),
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: eq.isQuestion ? theme.colorScheme.primary : theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberPad(SymbolLogicNotifier notifier, ThemeData theme) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final buttonWidth = (constraints.maxWidth - 24) / 3;
        final buttonHeight = (buttonWidth * 0.8).clamp(48.0, 60.0);

        return Column(
          children: [
            for (var row in [[1, 2, 3], [4, 5, 6], [7, 8, 9]])
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: row.map((n) => _PadButton(
                  label: n.toString(),
                  onTap: () => notifier.onNumberPressed(n.toString()),
                  width: buttonWidth,
                  height: buttonHeight,
                )).toList(),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _PadButton(
                  label: '⌫',
                  onTap: notifier.onBackspace,
                  color: DesignSystem.gameRose,
                  width: buttonWidth,
                  height: buttonHeight,
                ),
                _PadButton(
                  label: '0',
                  onTap: () => notifier.onNumberPressed('0'),
                  width: buttonWidth,
                  height: buttonHeight,
                ),
                _PadButton(
                  label: '✓',
                  onTap: notifier.submitGuess,
                  color: DesignSystem.gameGreen,
                  width: buttonWidth,
                  height: buttonHeight,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _PadButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color? color;
  final double width;
  final double height;

  const _PadButton({
    required this.label,
    required this.onTap,
    this.color,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
        child: Container(
          width: width.clamp(0.0, 80.0),
          height: height,
          decoration: BoxDecoration(
            color: color?.withValues(alpha: 0.1) ?? theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
            border: Border.all(color: color ?? theme.colorScheme.outline.withValues(alpha: 0.3)),
          ),
          child: Center(
            child: Text(
              label,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: color ?? theme.colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
