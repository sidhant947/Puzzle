import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'color_match_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';

class ColorMatchScreen extends ConsumerWidget {
  const ColorMatchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(colorMatchNotifierProvider);
    final theme = Theme.of(context);

    ref.listen(colorMatchNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        _showGameOverDialog(context, ref, next, theme);
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('COLOR MATCH')),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                _buildColorBox('TARGET', state.targetColor, theme),
                _buildColorBox('YOURS', state.currentColor, theme),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                _buildSlider('RED', (state.currentColor.r * 255.0).round().toDouble(), (v) => ref.read(colorMatchNotifierProvider.notifier).updateColor(v, (state.currentColor.g * 255.0).round().toDouble(), (state.currentColor.b * 255.0).round().toDouble()), Colors.red),
                _buildSlider('GREEN', (state.currentColor.g * 255.0).round().toDouble(), (v) => ref.read(colorMatchNotifierProvider.notifier).updateColor((state.currentColor.r * 255.0).round().toDouble(), v, (state.currentColor.b * 255.0).round().toDouble()), Colors.green),
                _buildSlider('BLUE', (state.currentColor.b * 255.0).round().toDouble(), (v) => ref.read(colorMatchNotifierProvider.notifier).updateColor((state.currentColor.r * 255.0).round().toDouble(), (state.currentColor.g * 255.0).round().toDouble(), v), Colors.blue),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () => ref.read(colorMatchNotifierProvider.notifier).submit(),
                  style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 54)),
                  child: const Text('CHECK MATCH'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorBox(String label, Color color, ThemeData theme) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 24),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2)),
          const SizedBox(height: 12),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10)],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlider(String label, double value, ValueChanged<double> onChanged, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: color)),
        Slider(
          value: value,
          min: 0,
          max: 255,
          activeColor: color,
          onChanged: onChanged,
        ),
      ],
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref, ColorMatchState state, ThemeData theme) {
    ref.read(gameStreakNotifierProvider.notifier).completeGame('color_match', xpAmount: state.score.toInt());
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('MATCH RESULT'),
        content: Text('Your accuracy: ${state.score.toStringAsFixed(1)}%'),
        actions: [TextButton(onPressed: () { Navigator.pop(context); Navigator.pop(context); }, child: const Text('CONTINUE'))],
      ),
    );
  }
}
