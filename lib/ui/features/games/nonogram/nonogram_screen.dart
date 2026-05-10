import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'nonogram_provider.dart';

class NonogramScreen extends ConsumerStatefulWidget {
  const NonogramScreen({super.key});

  @override
  ConsumerState<NonogramScreen> createState() => _NonogramScreenState();
}

class _NonogramScreenState extends ConsumerState<NonogramScreen> {
  bool _isMarkMode = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(nonogramNotifierProvider);

    ref.listen(nonogramNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'IMAGE REVEALED!',
            message: 'Excellent logical deduction. The hidden image has been successfully revealed!',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(nonogramNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    return GameScaffold(
      title: 'NONOGRAM',
      subtitle: 'Reveal the hidden image using logic clues.',
      actions: [
        TangibleButton(
          color: DesignSystem.surface,
          shadowColor: DesignSystem.outlineVariant,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(nonogramNotifierProvider.notifier).reset();
          },
          padding: const EdgeInsets.all(12),
          child: const Icon(
            Icons.refresh_rounded,
            color: DesignSystem.ink,
            size: 20,
          ),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const SizedBox(height: DesignSystem.spaceSM),
              _buildStatusHeader(state),
              const SizedBox(height: DesignSystem.spaceMD),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD),
                  child: Column(
                    children: [
                      // Column Clues Area
                      Row(
                        children: [
                          const SizedBox(width: 40), // Row clues spacer
                          for (int c = 0; c < state.size; c++)
                            Expanded(child: _buildColClue(state.colClues[c])),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Grid + Row Clues Area
                      Expanded(
                        child: Column(
                          children: [
                            for (int r = 0; r < state.size; r++)
                              Expanded(
                                child: Row(
                                  children: [
                                    _buildRowClue(state.rowClues[r]),
                                    const SizedBox(width: 8),
                                    for (int c = 0; c < state.size; c++)
                                      Expanded(child: _buildCell(state, r, c)),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: DesignSystem.spaceMD),
              _buildControls(),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStatusHeader(NonogramState state) {
    return TangibleContainer(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      color: DesignSystem.accentBerry.withValues(alpha: 0.1),
      radius: DesignSystem.radiusFull,
      depth: 2,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.grid_on_rounded, size: 16, color: DesignSystem.accentBerry),
          SizedBox(width: 8),
          Text(
            'LOGIC GRID',
            style: TextStyle(
              color: DesignSystem.accentBerry,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.0,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColClue(List<int> clues) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          for (int clue in clues)
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  clue.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: DesignSystem.inkSlate,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRowClue(List<int> clues) {
    return Container(
      width: 40,
      margin: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          for (int clue in clues)
            Padding(
              padding: const EdgeInsets.only(right: 2),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  clue.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: DesignSystem.inkSlate,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCell(NonogramState state, int r, int c) {
    final value = state.grid[r][c];

    return Padding(
      padding: const EdgeInsets.all(1),
      child: TangibleContainer(
        depth: value == 1 ? 0 : 2.0,
        radius: 4,
        color: value == 1 ? DesignSystem.accentBerry : DesignSystem.surface,
        onTap: () {
          HapticFeedbackUtil.lightImpact();
          ref.read(nonogramNotifierProvider.notifier).toggleCell(r, c, _isMarkMode);
        },
        child: Center(
          child: value == 2
              ? const FittedBox(
                  child: Icon(
                    Icons.close_rounded,
                    color: DesignSystem.inkSlate,
                  ),
                )
              : null,
        ),
      ),
    );
  }


  Widget _buildControls() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
      child: Row(
        children: [
          Expanded(
            child: TangibleButton(
              onTap: () {
                HapticFeedbackUtil.selectionClick();
                setState(() => _isMarkMode = false);
              },
              color: !_isMarkMode ? DesignSystem.accentBerry : DesignSystem.surface,
              shadowColor: !_isMarkMode ? DesignSystem.accentBerry.withValues(alpha: 0.8) : DesignSystem.outlineVariant,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.square_rounded, color: !_isMarkMode ? Colors.white : DesignSystem.ink),
                  const SizedBox(width: 8),
                  Text(
                    'FILL',
                    style: TextStyle(color: !_isMarkMode ? Colors.white : DesignSystem.ink),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: DesignSystem.spaceMD),
          Expanded(
            child: TangibleButton(
              onTap: () {
                HapticFeedbackUtil.selectionClick();
                setState(() => _isMarkMode = true);
              },
              color: _isMarkMode ? DesignSystem.accentBerry : DesignSystem.surface,
              shadowColor: _isMarkMode ? DesignSystem.accentBerry.withValues(alpha: 0.8) : DesignSystem.outlineVariant,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.close_rounded, color: _isMarkMode ? Colors.white : DesignSystem.ink),
                  const SizedBox(width: 8),
                  Text(
                    'MARK',
                    style: TextStyle(color: _isMarkMode ? Colors.white : DesignSystem.ink),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
