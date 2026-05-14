import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'mental_abacus_provider.dart';

class MentalAbacusScreen extends ConsumerStatefulWidget {
  const MentalAbacusScreen({super.key});

  @override
  ConsumerState<MentalAbacusScreen> createState() => _MentalAbacusScreenState();
}

class _MentalAbacusScreenState extends ConsumerState<MentalAbacusScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(mentalAbacusNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.mentalAbacusTitle.toUpperCase(),
        message: 'Your mental arithmetic is top-tier.',
        isVictory: true,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(mentalAbacusNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(mentalAbacusNotifierProvider);
    final notifier = ref.read(mentalAbacusNotifierProvider.notifier);

    ref.listen(mentalAbacusNotifierProvider, (previous, next) {
      if (next.isVictory && !(previous?.isVictory ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('mental_abacus');
        _showCompletionDialog();
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: 'Mental Abacus',
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Mental Abacus',
      subtitle: l10n.mentalAbacusSubtitle,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.all(DesignSystem.spaceLG),
                child: Column(
                  children: [
                    LinearProgressIndicator(
                      value: state.score / state.targetScore,
                      backgroundColor: colorScheme.outline.withValues(alpha: 0.5),
                      valueColor: const AlwaysStoppedAnimation<Color>(DesignSystem.success),
                    ),
                    SizedBox(height: DesignSystem.spaceXL),
                    Container(
                      padding: const EdgeInsets.all(DesignSystem.spaceLG),
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.5)),
                      ),
                      child: Text(
                        '${state.currentProblem?.value1} ${state.currentProblem?.operator} ${state.currentProblem?.value2} = ?',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 32),
                      ),
                    ),
                    const SizedBox(height: DesignSystem.spaceXL),
                    _buildAbacus(state, notifier),
                    const SizedBox(height: DesignSystem.spaceXL),
                    Text(
                      'Current Value: ${state.currentAbacusValue}',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: colorScheme.onSurface.withValues(alpha: 0.7)),
                    ),
                    SizedBox(height: DesignSystem.spaceLG),
                    TangibleButton(
                      onTap: notifier.submit,
                      color: DesignSystem.primary,
                      child: const Center(
                        child: Text(
                          'SUBMIT ANSWER',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAbacus(MentalAbacusState state, MentalAbacusNotifier notifier) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF5D4037), // Wooden color
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF3E2723), width: 8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(state.rods.length, (i) {
          return _buildRod(state.rods[i], i, notifier);
        }),
      ),
    );
  }

  Widget _buildRod(AbacusRodState rod, int index, MentalAbacusNotifier notifier) {
    return Column(
      children: [
        // Heaven bead (5)
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              HapticFeedbackUtil.lightImpact();
              notifier.toggleHeaven(index);
            },
            child: Container(
              width: 40,
              alignment: rod.heavenDown ? Alignment.bottomCenter : Alignment.topCenter,
              child: _buildBead(rod.heavenDown ? DesignSystem.accentAmber : Colors.white70),
            ),
          ),
        ),
        // Bar
        Container(
          width: 50,
          height: 4,
          color: const Color(0xFF3E2723),
        ),
        // Earth beads (1 each)
        Expanded(
          flex: 5,
          child: SizedBox(
            width: 40,
            child: Stack(
              children: List.generate(5, (i) {
                // There are 4 beads, but 5 possible positions (0, 1, 2, 3, 4 beads up)
                // This is a bit tricky to render as individual beads, let's simplify:
                // Beads 0..rod.earthUpCount-1 are up.
                // Beads rod.earthUpCount..3 are down.
                return Positioned(
                  left: 0,
                  right: 0,
                  top: i * 30.0 + (i >= rod.earthUpCount ? 30.0 : 0.0),
                  child: i < 4 ? GestureDetector(
                    onTap: () {
                      HapticFeedbackUtil.lightImpact();
                      // If user taps bead at index i:
                      // If bead is below the bar and moved up, all beads above it also move up.
                      // If bead is at the bar and moved down, all beads below it also move down.
                      // Simplified: set earthUpCount based on where they tap.
                      if (i < rod.earthUpCount) {
                        notifier.setEarthCount(index, i);
                      } else {
                        notifier.setEarthCount(index, i + 1);
                      }
                    },
                    child: _buildBead(i < rod.earthUpCount ? DesignSystem.success : Colors.white70),
                  ) : const SizedBox(),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBead(Color color) {
    return Container(
      width: 40,
      height: 25,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );
  }
}
