import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../utils/design_system.dart';
import 'akari_provider.dart';

class AkariScreen extends ConsumerStatefulWidget {
  const AkariScreen({super.key});

  @override
  ConsumerState<AkariScreen> createState() => _AkariScreenState();
}

class _AkariScreenState extends ConsumerState<AkariScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(akariNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'LIGHTS UP!',
        message: 'Everything is perfectly illuminated.',
        isVictory: true,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(akariNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(akariNotifierProvider);
    final notifier = ref.read(akariNotifierProvider.notifier);

    ref.listen(akariNotifierProvider, (previous, next) {
      if (next.isVictory && !(previous?.isVictory ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('akari');
        _showCompletionDialog();
      }
    });

    if (state.isLoading) {
      return const GameScaffold(
        title: 'Akari',
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Akari',
      subtitle: 'Illuminate all white cells',
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(DesignSystem.spaceLG),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: DesignSystem.ink, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: LayoutBuilder(builder: (context, constraints) {
                final cellSize = constraints.maxWidth / state.grid.length;
                return Column(
                  children: List.generate(state.grid.length, (r) {
                    return Row(
                      children: List.generate(state.grid.length, (c) {
                        return _buildCell(state, notifier, r, c, cellSize);
                      }),
                    );
                  }),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCell(AkariState state, AkariNotifier notifier, int r, int c, double size) {
    final val = state.grid[r][c];
    final isBulb = state.bulbs[r][c];
    final isLit = state.lit[r][c];

    if (val >= -1) {
      // Wall
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: DesignSystem.ink,
          border: Border.all(color: DesignSystem.inkSlate, width: 0.5),
        ),
        child: val >= 0
            ? Center(
                child: Text(
                  val.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              )
            : null,
      );
    } else {
      // White cell
      return GestureDetector(
        onTap: () => notifier.toggleBulb(r, c),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: isLit ? DesignSystem.accentAmber.withValues(alpha: 0.3) : Colors.white,
            border: Border.all(color: DesignSystem.outline, width: 0.5),
          ),
          child: Center(
            child: isBulb
                ? const Icon(
                    Icons.lightbulb,
                    color: DesignSystem.accentAmber,
                    size: 28,
                  )
                : null,
          ),
        ),
      );
    }
  }
}
