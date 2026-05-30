import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../providers/user_providers.dart';
import 'venn_numbers_provider.dart';
import 'venn_numbers_engine.dart';

class VennNumbersScreen extends ConsumerStatefulWidget {
  const VennNumbersScreen({super.key});

  @override
  ConsumerState<VennNumbersScreen> createState() => _VennNumbersScreenState();
}

class _VennNumbersScreenState extends ConsumerState<VennNumbersScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(vennNumbersNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    final l10n = AppLocalizations.of(context)!;
    final won = score >= 5;
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('venn_numbers');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'VENN MASTER!' : l10n.timeUp.toUpperCase(),
        message: 'You categorized $score numbers!',
        onPlayAgain: () {
          ref.read(vennNumbersNotifierProvider.notifier).initGame();
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
    final state = ref.watch(vennNumbersNotifierProvider);
    final notifier = ref.read(vennNumbersNotifierProvider.notifier);

    ref.listen(vennNumbersNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: l10n.vennNumbersTitle.toUpperCase(),
      subtitle: l10n.vennNumbersSubtitle,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final problem = state.currentProblem;

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStat(l10n.timeLeft.toUpperCase(), '${state.timeLeft}s', DesignSystem.accentBerry),
                      _buildStat(l10n.score.toUpperCase(), '${state.score}', DesignSystem.accentEmerald),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TangibleContainer(
                    depth: 4.0,
                    color: colorScheme.onSurface,
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'NUMBER: ${problem.number}',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: colorScheme.surface,
                      ),
                    ),
                  ),
                  const Spacer(),
                  _buildVennDiagram(problem, notifier, constraints),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: WrapAlignment.center,
                      children: [
                        _buildRuleInfo('Circle A', problem.ruleA.description, DesignSystem.accentBerry),
                        _buildRuleInfo('Circle B', problem.ruleB.description, DesignSystem.accentEmerald),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStat(String label, String value, Color color) {
    return TangibleContainer(
      depth: 2.0,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
              letterSpacing: 1.2,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRuleInfo(String title, String desc, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 12)),
          Text(desc, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildVennDiagram(VennProblem problem, VennNumbersNotifier notifier, BoxConstraints constraints) {
    final size = constraints.maxWidth * 0.8;
    final circleSize = size * 0.65;
    
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Neither Region (Background)
            Positioned.fill(
              child: GestureDetector(
                onTap: () => notifier.onRegionSelected(VennRegion.neither),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Theme.of(context).colorScheme.outline, width: 2),
                  ),
                  child: const Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('NEITHER', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
            ),
            
            // Circle A
            Positioned(
              left: 0,
              child: _VennCircle(
                size: circleSize,
                color: DesignSystem.accentBerry.withValues(alpha: 0.4),
                label: 'A',
                onTap: () => notifier.onRegionSelected(VennRegion.aOnly),
              ),
            ),
            
            // Circle B
            Positioned(
              right: 0,
              child: _VennCircle(
                size: circleSize,
                color: DesignSystem.accentEmerald.withValues(alpha: 0.4),
                label: 'B',
                onTap: () => notifier.onRegionSelected(VennRegion.bOnly),
              ),
            ),
            
            // Intersection
            Positioned(
              child: GestureDetector(
                onTap: () => notifier.onRegionSelected(VennRegion.both),
                child: Container(
                  width: circleSize * 0.5,
                  height: circleSize * 0.5,
                  decoration: const BoxDecoration(
                    color: Colors.transparent, // Invisible trigger for center
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.8),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text('BOTH', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VennCircle extends StatelessWidget {
  final double size;
  final Color color;
  final String label;
  final VoidCallback onTap;

  const _VennCircle({
    required this.size,
    required this.color,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: color.withValues(alpha: 1.0), width: 2),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
