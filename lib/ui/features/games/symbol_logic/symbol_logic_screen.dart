import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/haptic_feedback.dart';
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
    final l10n = AppLocalizations.of(context)!;
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('symbol_logic');
    } else {
      HapticFeedbackUtil.heavyImpact();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'LOGIC MASTER!' : 'WRONG ANSWER',
        message: won ? 'You solved the visual equations! Your deductive reasoning is impressive.' : 'Try again to find the hidden values.',
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
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(symbolLogicNotifierProvider);
    final notifier = ref.read(symbolLogicNotifierProvider.notifier);

    ref.listen(symbolLogicNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.isGameWon);
      }
    });

    return GameScaffold(
      title: l10n.symbolLogicTitle.toUpperCase(),
      subtitle: l10n.symbolLogicSubtitle,
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.initGame();
          },
          padding: const EdgeInsets.all(8),
          child: Icon(
            Icons.refresh_rounded,
            color: colorScheme.onSurface,
            size: 18,
          ),
        ),
      ],
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isSmall = constraints.maxHeight < 600;
                  return Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.all(isSmall ? 12 : 24),
                            child: Column(
                              children: [
                                TangibleContainer(
                                  color: colorScheme.surface,
                                  shadowColor: colorScheme.outline,
                                  depth: isSmall ? 2.0 : 4.0,
                                  padding: EdgeInsets.all(isSmall ? 8 : 16),
                                  child: Column(
                                    children: state.equations.map((eq) => _buildEquationRow(eq, isSmall)).toList(),
                                  ),
                                ),
                                SizedBox(height: isSmall ? 16 : 32),
                                Text(
                                  'YOUR ANSWER',
                                  style: TextStyle(
                                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                                    fontSize: isSmall ? 10 : 12,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2,
                                  ),
                                ),
                                SizedBox(height: isSmall ? 8 : 12),
                                TangibleContainer(
                                  color: colorScheme.onSurface,
                                  shadowColor: colorScheme.onSurface.withValues(alpha: 0.7),
                                  depth: isSmall ? 2.0 : 4.0,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isSmall ? 30 : 40, 
                                    vertical: isSmall ? 10 : 20
                                  ),
                                  child: Text(
                                    state.currentInput.isEmpty ? '?' : state.currentInput,
                                    style: TextStyle(
                                      fontSize: isSmall ? 32 : 40,
                                      fontWeight: FontWeight.w900,
                                      color: state.isInvalidGuess ? DesignSystem.error : colorScheme.surface,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      _buildNumberPad(notifier, isSmall),
                      SizedBox(height: isSmall ? 8 : 24),
                    ],
                  );
                },
              ),
            ),
    );
  }

  Widget _buildEquationRow(SymbolEquation eq, bool isSmall) {
    final iconSize = isSmall ? 28.0 : 36.0;
    final fontSize = isSmall ? 20.0 : 24.0;
    final resultSize = isSmall ? 24.0 : 28.0;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: isSmall ? 4 : 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(eq.symbols[0], size: iconSize, color: DesignSystem.accentAmber),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isSmall ? 8 : 12),
            child: Text('+', style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w900, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7))),
          ),
          Icon(eq.symbols[1], size: iconSize, color: DesignSystem.accentIndigo),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isSmall ? 8 : 12),
            child: Text('=', style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w900, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7))),
          ),
          SizedBox(
            width: isSmall ? 50 : 60,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                eq.isQuestion ? '?' : eq.result.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: resultSize,
                  fontWeight: FontWeight.w900,
                  color: eq.isQuestion ? DesignSystem.primary : Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberPad(SymbolLogicNotifier notifier, bool isSmall) {
    final keyHeight = isSmall ? 40.0 : 50.0;
    final fontSize = isSmall ? 20.0 : 24.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: Column(
        children: [
          for (var row in [[1, 2, 3], [4, 5, 6], [7, 8, 9]])
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: row.map((n) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TangibleButton(
                    onTap: () {
                      HapticFeedbackUtil.lightImpact();
                      notifier.onNumberPressed(n.toString());
                    },
                    color: Theme.of(context).colorScheme.surface,
                    shadowColor: Theme.of(context).colorScheme.outline,
                    child: Container(
                      height: keyHeight,
                      alignment: Alignment.center,
                      child: Text(
                        n.toString(),
                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: fontSize, color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ),
                  ),
                ),
              )).toList(),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TangibleButton(
                    onTap: () {
                      HapticFeedbackUtil.mediumImpact();
                      notifier.onBackspace();
                    },
                    color: Theme.of(context).colorScheme.surface,
                    shadowColor: Theme.of(context).colorScheme.outline,
                    child: Container(
                      height: keyHeight,
                      alignment: Alignment.center,
                      child: Icon(Icons.backspace_rounded, color: DesignSystem.error, size: isSmall ? 20 : 24),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TangibleButton(
                    onTap: () {
                      HapticFeedbackUtil.lightImpact();
                      notifier.onNumberPressed('0');
                    },
                    color: Theme.of(context).colorScheme.surface,
                    shadowColor: Theme.of(context).colorScheme.outline,
                    child: Container(
                      height: keyHeight,
                      alignment: Alignment.center,
                      child: Text(
                        '0',
                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: fontSize, color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TangibleButton(
                    onTap: () {
                      HapticFeedbackUtil.heavyImpact();
                      notifier.submitGuess();
                    },
                    color: DesignSystem.primary,
                    shadowColor: const Color(0xFF1E3A8A),
                    child: Container(
                      height: keyHeight,
                      alignment: Alignment.center,
                      child: Icon(Icons.check_rounded, color: Colors.white, size: isSmall ? 20 : 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
