import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../providers/user_providers.dart';
import 'sopt_provider.dart';

class SoptScreen extends ConsumerStatefulWidget {
  const SoptScreen({super.key});

  @override
  ConsumerState<SoptScreen> createState() => _SoptScreenState();
}

class _SoptScreenState extends ConsumerState<SoptScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(soptNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    bool won = score >= 15;
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('sopt');
    } else {
      HapticFeedbackUtil.heavyImpact();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? AppLocalizations.of(context)!.soptWinTitle : AppLocalizations.of(context)!.gameOver,
        message: AppLocalizations.of(context)!.soptGameOverMessage(score),
        isVictory: won,
        onPlayAgain: () {
          ref.read(soptNotifierProvider.notifier).initGame();
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
    final state = ref.watch(soptNotifierProvider);

    ref.listen(soptNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'sopt'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'sopt'),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isSmall = constraints.maxHeight < 600;
                  final crossAxisCount = state.gridSize <= 4 ? 2 : (state.gridSize <= 9 ? 3 : 4);
                  
                  final gridHeightLimit = constraints.maxHeight - (isSmall ? 180 : 240);
                  final gridWidth = (constraints.maxWidth - 48).clamp(0.0, gridHeightLimit > 0 ? gridHeightLimit : 100.0);
                  
                  return Column(
                    children: [
                      SizedBox(height: isSmall ? 8 : 16),
                      _buildStats(state, isSmall),
                      const Spacer(),
                      _buildPhaseIndicator(state),
                      SizedBox(height: isSmall ? 8 : 20),
                      _buildGrid(state, gridWidth, crossAxisCount),
                      const Spacer(),
                      if (state.lastRoundCorrect != null)
                        _buildResult(state.lastRoundCorrect!)
                      else
                        SizedBox(height: isSmall ? 40 : 80),
                      SizedBox(height: isSmall ? 12 : 24),
                    ],
                  );
                },
              ),
            ),
    );
  }

  Widget _buildPhaseIndicator(SoptState state) {
    final l10n = AppLocalizations.of(context)!;
    String text = l10n.soptChooseNovel;
    Color color = DesignSystem.primary;
    if (state.lastRoundCorrect == true) {
      text = l10n.soptGreatJob;
      color = DesignSystem.success;
    } else if (state.lastRoundCorrect == false) {
      text = l10n.soptAlreadyTapped;
      color = DesignSystem.error;
    }

    return Text(
      text,
      style: TextStyle(
        letterSpacing: 1.5,
        fontWeight: FontWeight.w800,
        color: color,
        fontSize: 14,
      ),
    );
  }

  Widget _buildGrid(SoptState state, double gridWidth, int crossAxisCount) {
    return SizedBox(
      width: gridWidth,
      height: gridWidth,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: state.items.length,
        itemBuilder: (context, index) {
          final item = state.items[index];
          
          return TangibleButton(
            onTap: () {
              HapticFeedbackUtil.lightImpact();
              ref.read(soptNotifierProvider.notifier).onTapItem(item.id);
            },
            color: Theme.of(context).colorScheme.surface,
            shadowColor: Theme.of(context).colorScheme.outline,
            depth: 3.0,
            child: Center(
              child: Icon(
                item.icon,
                color: item.color,
                size: state.gridSize <= 6 ? 48 : 36,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildResult(bool correct) {
    return Icon(
      correct ? Icons.check_circle_rounded : Icons.cancel_rounded,
      color: correct ? DesignSystem.success : DesignSystem.error,
      size: 60,
    );
  }

  Widget _buildStats(SoptState state, bool isSmall) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStat(l10n.statTime, '${state.timeLeft}s', state.timeLeft < 10 ? DesignSystem.error : DesignSystem.primary, isSmall),
          _buildStat(l10n.statGrid, '${state.gridSize}', DesignSystem.accentAmber, isSmall),
          _buildStat(l10n.statScore, '${state.score}', DesignSystem.success, isSmall),
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
        vertical: isSmall ? 4 : 8,
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
