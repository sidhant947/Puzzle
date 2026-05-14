import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/haptic_feedback.dart';
import 'sdmt_provider.dart';

class SDMTScreen extends ConsumerStatefulWidget {
  const SDMTScreen({super.key});

  @override
  ConsumerState<SDMTScreen> createState() => _SDMTScreenState();
}

class _SDMTScreenState extends ConsumerState<SDMTScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(sdmtNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    final l10n = AppLocalizations.of(context)!;
    bool won = score >= 30;
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('sdmt');
    } else {
      HapticFeedbackUtil.heavyImpact();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'SPEED DEMON!' : 'SLOW & STEADY',
        message: 'You matched $score symbols! This test measures your scanning speed and visual attention.',
        onPlayAgain: () {
          ref.read(sdmtNotifierProvider.notifier).initGame();
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
    final state = ref.watch(sdmtNotifierProvider);
    final notifier = ref.read(sdmtNotifierProvider.notifier);

    ref.listen(sdmtNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: l10n.sdmtTitle.toUpperCase(),
      subtitle: l10n.sdmtSubtitle,
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
                      const SizedBox(height: 20),
                      _buildKey(state),
                      const Spacer(),
                      _buildTargetSymbol(state),
                      const Spacer(),
                      _buildNumpad(notifier, isSmall),
                      SizedBox(height: isSmall ? 12 : 24),
                    ],
                  );
                },
              ),
            ),
    );
  }

  Widget _buildKey(SdmtState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TangibleContainer(
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: state.symbolKey.entries.map((entry) {
            return Column(
              children: [
                Icon(entry.key, size: 24, color: DesignSystem.primary),
                SizedBox(height: 4),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          entry.value.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTargetSymbol(SdmtState state) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 150),
      child: TangibleContainer(
        key: ValueKey(state.currentSymbol),
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.all(40),
        child: Icon(state.currentSymbol, size: 80, color: Theme.of(context).colorScheme.onSurface),
      ),
    );
  }

  Widget _buildNumpad(SdmtNotifier notifier, bool isSmall) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.8,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: 9,
        itemBuilder: (context, index) {
          final digit = index + 1;
          return TangibleButton(
            onTap: () {
              HapticFeedbackUtil.lightImpact();
              notifier.onDigitTap(digit);
            },
            color: Theme.of(context).colorScheme.surface,
            padding: EdgeInsets.zero,
            child: Center(
              child: Text(
                digit.toString(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStats(SdmtState state, bool isSmall) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStat('TIME', '${state.timeLeft}s', state.timeLeft < 10 ? DesignSystem.error : DesignSystem.primary, isSmall),
          _buildStat('SCORE', '${state.score}', DesignSystem.success, isSmall),
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
        horizontal: isSmall ? 12 : 16, 
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
              fontSize: isSmall ? 18 : 22,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
