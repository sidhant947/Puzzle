import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/haptic_feedback.dart';
import 'n_back_provider.dart';

class NBackScreen extends ConsumerStatefulWidget {
  const NBackScreen({super.key});

  @override
  ConsumerState<NBackScreen> createState() => _NBackScreenState();
}

class _NBackScreenState extends ConsumerState<NBackScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(nBackNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    final l10n = AppLocalizations.of(context)!;
    bool won = score >= 10;
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('n_back');
    } else {
      HapticFeedbackUtil.heavyImpact();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'MEMORY MASTER!' : 'FADING ECHO',
        message: 'You achieved $score 2-back matches! Your working memory is vital for multitasking.',
        onPlayAgain: () {
          ref.read(nBackNotifierProvider.notifier).initGame();
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
    final state = ref.watch(nBackNotifierProvider);
    final notifier = ref.read(nBackNotifierProvider.notifier);

    ref.listen(nBackNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: l10n.nBackTitle.toUpperCase(),
      subtitle: l10n.nBackSubtitle,
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
                      Text(
                        'REMEMBER 2 STEPS BACK',
                        style: TextStyle(
                          letterSpacing: 2, 
                          fontWeight: FontWeight.w800, 
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                          fontSize: isSmall ? 10 : 12,
                        ),
                      ),
                      SizedBox(height: isSmall ? 20 : 40),
                      _buildSymbolDisplay(state, isSmall),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(DesignSystem.spaceLG),
                        child: TangibleButton(
                          onTap: () {
                            HapticFeedbackUtil.lightImpact();
                            notifier.onMatchTap();
                          },
                          color: state.lastMatchResult == true 
                              ? DesignSystem.success 
                              : (state.lastMatchResult == false ? DesignSystem.error : DesignSystem.primary),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: const Center(
                              child: Text(
                                'MATCH',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 24,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
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

  Widget _buildSymbolDisplay(NBackState state, bool isSmall) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: TangibleContainer(
        key: ValueKey(state.currentSymbol),
        color: Theme.of(context).colorScheme.surface,
        shadowColor: Theme.of(context).colorScheme.outline,
        depth: 4.0,
        padding: const EdgeInsets.all(40),
        child: Text(
          state.currentSymbol,
          style: TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.w900,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }

  Widget _buildStats(NBackState state, bool isSmall) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStat('TIME', '${state.timeLeft}s', state.timeLeft < 10 ? DesignSystem.error : DesignSystem.primary, isSmall),
          _buildStat('MATCHES', '${state.score}', DesignSystem.success, isSmall),
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
        horizontal: isSmall ? 16 : 24, 
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
              fontSize: isSmall ? 18 : 24,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
