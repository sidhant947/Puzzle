import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../core/juice/game_scaffold.dart';
import 'tower_of_london_provider.dart';

class TowerOfLondonScreen extends ConsumerStatefulWidget {
  const TowerOfLondonScreen({super.key});

  @override
  ConsumerState<TowerOfLondonScreen> createState() => _TowerOfLondonScreenState();
}

class _TowerOfLondonScreenState extends ConsumerState<TowerOfLondonScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(towerOfLondonNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(bool isVictory, bool isOutOfMoves) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? 'PLANNING MASTER!' : 'OUT OF MOVES',
        message: isVictory 
            ? 'You solved it in ${ref.read(towerOfLondonNotifierProvider).moves} moves!' 
            : 'You exceeded the move limit. Try more efficient planning.',
        isVictory: isVictory,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(towerOfLondonNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(towerOfLondonNotifierProvider);
    final notifier = ref.read(towerOfLondonNotifierProvider.notifier);

    ref.listen(towerOfLondonNotifierProvider, (previous, next) async {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        if (next.isVictory) {
          HapticFeedbackUtil.victory();
          await ref.read(gameStreakNotifierProvider.notifier).completeGame('tower_of_london');
        } else {
          HapticFeedbackUtil.vibrate();
        }
        if (!context.mounted) return;
        final isOutOfMoves = next.moves >= next.maxMoves;
        _showCompletionDialog(next.isVictory, isOutOfMoves);
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.towerOfLondonTitle.toUpperCase(),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Tower of London',
      subtitle: l10n.towerOfLondonSubtitle,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Center(
              child: _buildStat('MOVES', '${state.moves}/${state.maxMoves}', color: state.moves >= state.maxMoves - 2 ? DesignSystem.error : null),
            ),
          ),
          Text(
            'TARGET',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w900,
              letterSpacing: 2.0,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: DesignSystem.spaceSM),
          SizedBox(
            height: 120,
            child: _buildPegs(state.targetConfig, isTarget: true),
          ),
          const Divider(height: DesignSystem.spaceXL),
          Expanded(
            child: Center(
              child: _buildPegs(state.currentConfig, onPegTap: notifier.selectPeg, selectedPeg: state.selectedPeg),
            ),
          ),
          const SizedBox(height: DesignSystem.spaceXL),
        ],
      ),
    );
  }

  Widget _buildStat(String label, String value, {Color? color}) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7))),
        Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: color ?? Theme.of(context).colorScheme.onSurface)),
      ],
    );
  }

  Widget _buildPegs(List<List<int>> config, {Function(int)? onPegTap, int? selectedPeg, bool isTarget = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(3, (i) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onPegTap != null ? () => onPegTap(i) : null,
          child: SizedBox(
            width: isTarget ? 60 : 100, // Large hit area
            child: _buildPeg(i, config[i], isSelected: selectedPeg == i, isTarget: isTarget),
          ),
        );
      }),
    );
  }

  Widget _buildPeg(int index, List<int> beads, {bool isSelected = false, bool isTarget = false}) {
    double pegHeight = index == 0 ? 100 : (index == 1 ? 75 : 50);
    if (isTarget) pegHeight *= 0.8;
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: isTarget ? 6 : 10,
              height: pegHeight,
              decoration: BoxDecoration(
                color: isSelected ? DesignSystem.primary : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: isTarget ? 2 : 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: beads.asMap().entries.map((entry) {
                  final i = entry.key;
                  final b = entry.value;
                  final isHighlighted = isSelected && i == beads.length - 1;
                  return _buildBead(b, isTarget, isHighlighted: isHighlighted);
                }).toList().reversed.toList(),
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Container(
          width: isTarget ? 30 : 50,
          height: isTarget ? 4 : 8,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7).withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }

  Widget _buildBead(int type, bool isTarget, {bool isHighlighted = false}) {
    Color color;
    switch (type) {
      case 1: color = DesignSystem.error; break;
      case 2: color = DesignSystem.success; break;
      case 3: color = DesignSystem.primary; break;
      default: color = Colors.grey;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isTarget ? 20 : 36,
      height: isTarget ? 20 : 36,
      margin: const EdgeInsets.symmetric(vertical: 1),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: isHighlighted 
            ? Border.all(color: Colors.white, width: 3)
            : null,
        boxShadow: isTarget ? null : [
          BoxShadow(
            color: isHighlighted ? Colors.white.withValues(alpha: 0.6) : color.withValues(alpha: 0.4),
            blurRadius: isHighlighted ? 12 : 4,
            spreadRadius: isHighlighted ? 2 : 0,
            offset: isHighlighted ? Offset.zero : const Offset(0, 2),
          ),
        ],
      ),
      child: isHighlighted 
          ? Center(
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            )
          : null,
    );
  }
}
