import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import 'schulte_table_provider.dart';

class SchulteTableScreen extends ConsumerWidget {
  const SchulteTableScreen({super.key});

  String _formatDuration(Duration d) {
    String seconds = (d.inMilliseconds / 1000).toStringAsFixed(1);
    return '${seconds}s';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(schulteTableNotifierProvider);
    final notifier = ref.read(schulteTableNotifierProvider.notifier);

    ref.listen(schulteTableNotifierProvider, (previous, next) {
      if (next.status == SchulteStatus.completed && 
          previous?.status != SchulteStatus.completed) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'GREAT FOCUS!',
            message: 'You completed the table in ${_formatDuration(next.elapsedTime)}.\nKeep practicing to expand your peripheral vision!',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(schulteTableNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    return GameScaffold(
      title: 'SCHULTE TABLE',
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmall = constraints.maxHeight < 600;
            return Column(
              children: [
                SizedBox(height: isSmall ? 8 : 16),
                _buildHeader(state, isSmall),
                SizedBox(height: isSmall ? 16 : 32),
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: constraints.maxHeight * (isSmall ? 0.6 : 0.55),
                        maxWidth: constraints.maxWidth * 0.95,
                      ),
                      child: _buildGrid(state, notifier, isSmall),
                    ),
                  ),
                ),
                SizedBox(height: isSmall ? 16 : 32),
                _buildFooter(state, notifier, isSmall),
                SizedBox(height: isSmall ? 16 : 32),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(SchulteTableState state, bool isSmall) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatCard('TIME', _formatDuration(state.elapsedTime), DesignSystem.accentBerry, isSmall),
          _buildStatCard(
            'BEST', 
            state.bestTime != null ? _formatDuration(state.bestTime!) : '--', 
            DesignSystem.accentEmerald,
            isSmall
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color, bool isSmall) {
    return TangibleContainer(
      depth: isSmall ? 2.0 : 4.0,
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 16 : 24, 
        vertical: isSmall ? 8 : 12
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isSmall ? 10 : 12,
              fontWeight: FontWeight.w900,
              color: DesignSystem.outline,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: isSmall ? 2 : 4),
          Text(
            value,
            style: TextStyle(
              fontSize: isSmall ? 16 : 20,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid(SchulteTableState state, SchulteTableNotifier notifier, bool isSmall) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: EdgeInsets.all(isSmall ? 8 : 16),
        child: TangibleContainer(
          depth: isSmall ? 3.0 : 6.0,
          color: DesignSystem.ink,
          padding: EdgeInsets.all(isSmall ? 4 : 8),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: isSmall ? 4 : 8,
              mainAxisSpacing: isSmall ? 4 : 8,
            ),
            itemCount: 25,
            itemBuilder: (context, index) {
              final value = state.grid[index];
              final isTapped = value < state.nextNumber;

              return GestureDetector(
                onTap: () {
                  if (state.status == SchulteStatus.playing) {
                    if (value == state.nextNumber) {
                      HapticFeedbackUtil.lightImpact();
                    } else {
                      HapticFeedbackUtil.error();
                    }
                    notifier.tapNumber(value);
                  }
                },
                child: TangibleContainer(
                  depth: isTapped ? 0.0 : (isSmall ? 2.0 : 4.0),
                  color: isTapped 
                      ? DesignSystem.ink
                      : DesignSystem.surface,
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        value.toString(),
                        style: TextStyle(
                          fontSize: isSmall ? 16 : 20,
                          color: isTapped 
                              ? Colors.white.withValues(alpha: 0.2)
                              : DesignSystem.ink,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(SchulteTableState state, SchulteTableNotifier notifier, bool isSmall) {
    if (state.status == SchulteStatus.ready) {
      return TangibleButton(
        onTap: () {
          HapticFeedbackUtil.selectionClick();
          notifier.startGame();
        },
        child: const Text('START TEST'),
      );
    }

    return Column(
      children: [
        Text(
          'FIND NUMBER: ${state.nextNumber}',
          style: TextStyle(
            color: DesignSystem.primary,
            letterSpacing: 2.0,
            fontSize: isSmall ? 16 : 18,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: isSmall ? 4 : 8),
        Text(
          'FOCUS ON THE CENTER',
          style: TextStyle(
            color: DesignSystem.outline,
            fontSize: isSmall ? 10 : 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
