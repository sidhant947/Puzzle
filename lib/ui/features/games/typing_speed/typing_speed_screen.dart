import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import 'typing_speed_provider.dart';

class TypingSpeedScreen extends ConsumerStatefulWidget {
  const TypingSpeedScreen({super.key});

  @override
  ConsumerState<TypingSpeedScreen> createState() => _TypingSpeedScreenState();
}

class _TypingSpeedScreenState extends ConsumerState<TypingSpeedScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(typingSpeedNotifierProvider.notifier).initGame());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showGameOverDialog(bool won, double wpm) {
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('typing_speed');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'SPEED DEMON!' : 'TIME EXPIRED',
        message: won 
            ? 'You typed at ${wpm.toStringAsFixed(1)} WPM!' 
            : 'Try to be faster next time.',
        onPlayAgain: () {
          _controller.clear();
          ref.read(typingSpeedNotifierProvider.notifier).initGame();
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
    final state = ref.watch(typingSpeedNotifierProvider);
    final notifier = ref.read(typingSpeedNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(typingSpeedNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.isGameWon, next.wpm);
      }
    });

    return GameScaffold(
      title: 'TYPING SPEED',
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStatCard('TIME', '${state.timeLeft}s', DesignSystem.gameRose, theme),
                        _buildStatCard('GOAL', 'MATCH TEXT', DesignSystem.gameBlue, theme),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.2)),
                      ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: _buildTextSpans(state.targetPhrase, state.currentInput, theme),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextField(
                      controller: _controller,
                      autofocus: true,
                      onChanged: notifier.onInputChange,
                      decoration: InputDecoration(
                        hintText: 'Start typing...',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        filled: true,
                        fillColor: theme.colorScheme.surface,
                      ),
                      style: theme.textTheme.titleLarge,
                      textAlign: TextAlign.center,
                      textCapitalization: TextCapitalization.characters,
                    ),
                    const Spacer(),
                    const Text('Type exactly as shown to finish!', style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
    );
  }

  List<TextSpan> _buildTextSpans(String target, String input, ThemeData theme) {
    List<TextSpan> spans = [];
    for (int i = 0; i < target.length; i++) {
      Color color = Colors.grey.withValues(alpha: 0.5);
      if (i < input.length) {
        color = input[i].toUpperCase() == target[i].toUpperCase() 
            ? DesignSystem.gameGreen 
            : DesignSystem.gameRose;
      }
      spans.add(TextSpan(
        text: target[i],
        style: TextStyle(
          color: color,
          fontSize: 24,
          fontWeight: FontWeight.w900,
          letterSpacing: 2,
        ),
      ));
    }
    return spans;
  }

  Widget _buildStatCard(String label, String value, Color color, ThemeData theme) {
    return Column(
      children: [
        Text(label, style: theme.textTheme.labelSmall?.copyWith(letterSpacing: 1.5, color: Colors.grey)),
        Text(value, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900, color: color)),
      ],
    );
  }
}
