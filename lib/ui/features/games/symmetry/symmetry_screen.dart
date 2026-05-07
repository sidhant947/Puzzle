import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'symmetry_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';

class SymmetryScreen extends ConsumerWidget {
  const SymmetryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(symmetryNotifierProvider);
    final theme = Theme.of(context);

    ref.listen(symmetryNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        _showGameOverDialog(context, ref, theme);
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('SYMMETRY')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('MIRROR THE LEFT SIDE', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2)),
          const SizedBox(height: 32),
          Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Stack(
                  children: [
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6, crossAxisSpacing: 4, mainAxisSpacing: 4),
                      itemCount: 36,
                      itemBuilder: (context, index) {
                        final x = index % 6;
                        final y = index ~/ 6;
                        final isActive = state.grid[y][x];
                        final isEditable = x >= 3;
                        
                        return GestureDetector(
                          onTap: () {
                            if (isEditable) {
                              HapticFeedbackUtil.selectionClick();
                              ref.read(symmetryNotifierProvider.notifier).toggleCell(x, y);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isActive ? theme.colorScheme.primary : theme.colorScheme.surfaceVariant,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.black.withOpacity(0.05)),
                            ),
                          ),
                        );
                      },
                    ),
                    Center(
                      child: Container(width: 2, color: theme.colorScheme.primary, height: double.infinity),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref, ThemeData theme) {
    ref.read(gameStreakNotifierProvider.notifier).completeGame('symmetry', xpAmount: 25);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('PERFECT SYMMETRY'),
        content: const Text('You mirrored the pattern perfectly!'),
        actions: [TextButton(onPressed: () { Navigator.pop(context); Navigator.pop(context); }, child: const Text('CONTINUE'))],
      ),
    );
  }
}
