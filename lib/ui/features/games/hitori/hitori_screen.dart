import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../providers/user_providers.dart';
import 'hitori_provider.dart';

class HitoriScreen extends ConsumerStatefulWidget {
  const HitoriScreen({super.key});

  @override
  ConsumerState<HitoriScreen> createState() => _HitoriScreenState();
}

class _HitoriScreenState extends ConsumerState<HitoriScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(hitoriNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(bool won) {
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('hitori');
    } else {
      HapticFeedbackUtil.error();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'LOGIC ASCENDED!' : 'CLASHING NUMBERS',
        message: won ? 'You eliminated all duplicates.' : 'Try again to clear the grid.',
        onPlayAgain: () {
          ref.read(hitoriNotifierProvider.notifier).initGame();
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
    final state = ref.watch(hitoriNotifierProvider);
    final notifier = ref.read(hitoriNotifierProvider.notifier);

    ref.listen(hitoriNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.isGameWon);
      }
    });

    return GameScaffold(
      title: 'HITORI',
      subtitle: 'Paint out cells to leave no duplicate numbers in any row or column. No painted cells can be adjacent.',
      actions: [
        TangibleButton(
          color: DesignSystem.surface,
          shadowColor: DesignSystem.outlineVariant,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.initGame();
          },
          padding: const EdgeInsets.all(12),
          child: const Icon(Icons.refresh_rounded, size: 20, color: DesignSystem.ink),
        ),
      ],
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.5),
                        child: TangibleContainer(
                          color: DesignSystem.ink,
                          shadowColor: DesignSystem.inkSlate,
                          depth: 4.0,
                          radius: DesignSystem.radiusMD,
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: DesignSystem.surface,
                              borderRadius: BorderRadius.circular(DesignSystem.radiusMD - 4),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(DesignSystem.radiusMD - 4),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Column(
                                  children: List.generate(5, (r) => Expanded(
                                    child: Row(
                                      children: List.generate(5, (c) => Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            HapticFeedbackUtil.selectionClick();
                                            notifier.toggleCell(r, c);
                                          },
                                          child: AnimatedContainer(
                                            duration: const Duration(milliseconds: 200),
                                            decoration: BoxDecoration(
                                              color: state.painted[r][c] 
                                                ? DesignSystem.ink 
                                                : DesignSystem.surface,
                                              border: Border.all(color: DesignSystem.outline.withValues(alpha: 0.5), width: 0.5),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: FittedBox(
                                                  child: Text(
                                                    state.grid[r][c].toString(),
                                                    style: TextStyle(
                                                      color: state.painted[r][c] 
                                                        ? Colors.white 
                                                        : DesignSystem.ink,
                                                      fontWeight: FontWeight.w900,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                    ),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                );
              },
            ),
    );
  }
}
