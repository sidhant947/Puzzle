import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'magnets_provider.dart';

class MagnetsScreen extends ConsumerStatefulWidget {
  const MagnetsScreen({super.key});

  @override
  ConsumerState<MagnetsScreen> createState() => _MagnetsScreenState();
}

class _MagnetsScreenState extends ConsumerState<MagnetsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(magnetsNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.magnetsWinTitle,
        message: l10n.magnetsWinMessage,
        isVictory: true,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(magnetsNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(magnetsNotifierProvider);
    final notifier = ref.read(magnetsNotifierProvider.notifier);

    ref.listen(magnetsNotifierProvider, (previous, next) {
      if (next.isVictory && !(previous?.isVictory ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('magnets');
        _showCompletionDialog();
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.magnetsTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: l10n.magnetsTitle,
      subtitle: l10n.magnetsSubtitle,
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          padding: const EdgeInsets.all(8),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(l10n.howToPlay),
                content: Text(l10n.magnetsHowToPlay),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(l10n.gotIt),
                  ),
                ],
              ),
            );
          },
          child: Icon(Icons.help_outline, color: colorScheme.onSurface),
        ),
      ],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(DesignSystem.spaceLG),
          child: AspectRatio(
            aspectRatio: 1,
            child: LayoutBuilder(builder: (context, constraints) {
              final size = state.rowPos.length;
              final cellSize = constraints.maxWidth / (size + 2);
              return Column(
                children: [
                  // Top clues: + counts
                  Row(
                    children: [
                      SizedBox(width: cellSize * 2),
                      ...List.generate(size, (i) => _buildClue(state.colPos[i], cellSize, colorScheme.primary, '+')),
                    ],
                  ),
                  // Top clues: - counts
                  Row(
                    children: [
                      SizedBox(width: cellSize * 2),
                      ...List.generate(size, (i) => _buildClue(state.colNeg[i], cellSize, colorScheme.error, '-')),
                    ],
                  ),
                  // Middle rows
                  ...List.generate(size, (r) {
                    return Row(
                      children: [
                        _buildClue(state.rowPos[r], cellSize, colorScheme.primary, '+'),
                        _buildClue(state.rowNeg[r], cellSize, colorScheme.error, '-'),
                        ...List.generate(size, (c) => _buildCell(state, notifier, r, c, cellSize)),
                      ],
                    );
                  }),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildClue(int val, double size, Color color, String sign) {
    return Container(
      width: size,
      height: size,
      child: Center(
        child: Text(
          val == -1 ? '' : val.toString(),
          style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildCell(MagnetsState state, MagnetsNotifier notifier, int r, int c, double size) {
    final colorScheme = Theme.of(context).colorScheme;
    
    // Find domino
    int domIdx = -1;
    int cellIdx = -1; // 0 or 1
    for (int i = 0; i < state.dominoes.length; i++) {
      if (state.dominoes[i][0][0] == r && state.dominoes[i][0][1] == c) {
        domIdx = i;
        cellIdx = 0;
        break;
      }
      if (state.dominoes[i][1][0] == r && state.dominoes[i][1][1] == c) {
        domIdx = i;
        cellIdx = 1;
        break;
      }
    }

    if (domIdx == -1) return Container(width: size, height: size);

    int s = state.states[domIdx];
    int cellType = 0; // 0: blank, 1: +, 2: -
    if (s == 1) cellType = (cellIdx == 0 ? 1 : 2);
    else if (s == 2) cellType = (cellIdx == 0 ? 2 : 1);

    return GestureDetector(
      onTap: () => notifier.toggleDomino(domIdx),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: cellType == 1 ? colorScheme.primary.withValues(alpha: 0.2) : (cellType == 2 ? colorScheme.error.withValues(alpha: 0.2) : colorScheme.surface),
          border: Border.all(color: colorScheme.outline.withValues(alpha: 0.3), width: 1),
        ),
        child: Center(
          child: Text(
            cellType == 1 ? '+' : (cellType == 2 ? '-' : ''),
            style: TextStyle(
              color: cellType == 1 ? colorScheme.primary : (cellType == 2 ? colorScheme.error : Colors.transparent),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
