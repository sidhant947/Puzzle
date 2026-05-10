import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
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
      HapticFeedbackUtil.victory();
    } else {
      HapticFeedbackUtil.error();
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

    ref.listen(typingSpeedNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.isGameWon, next.wpm);
      }
    });

    return GameScaffold(
      title: 'TYPING SPEED',
      subtitle: 'Type the phrase exactly as shown as fast as you can!',
      actions: [
        TangibleButton(
          color: DesignSystem.surface,
          shadowColor: DesignSystem.outlineVariant,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            _controller.clear();
            notifier.initGame();
          },
          padding: const EdgeInsets.all(12),
          child: const Icon(
            Icons.refresh_rounded,
            color: DesignSystem.ink,
            size: 20,
          ),
        ),
      ],
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : LayoutBuilder(
              builder: (context, constraints) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                  child: Column(
                    children: [
                      SizedBox(height: constraints.maxHeight * 0.05),
                      Row(
                        children: [
                          Expanded(
                            child: _buildStatCard('TIME LEFT', '${state.timeLeft}s', DesignSystem.accentBerry),
                          ),
                          const SizedBox(width: DesignSystem.spaceMD),
                          Expanded(
                            child: _buildStatCard('WPM', state.wpm.toStringAsFixed(0), DesignSystem.accentEmerald),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: constraints.maxHeight * 0.3,
                        ),
                        child: TangibleContainer(
                          color: DesignSystem.surface,
                          radius: DesignSystem.radiusMD,
                          depth: 2,
                          padding: const EdgeInsets.all(DesignSystem.spaceMD),
                          child: Center(
                            child: SingleChildScrollView(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: _buildTextSpans(state.targetPhrase, state.currentInput),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: DesignSystem.spaceLG),
                      TangibleContainer(
                        color: DesignSystem.surface,
                        radius: DesignSystem.radiusSM,
                        depth: 2,
                        padding: EdgeInsets.zero,
                        child: TextField(
                          controller: _controller,
                          autofocus: true,
                          onChanged: (val) {
                            HapticFeedbackUtil.selectionClick();
                            notifier.onInputChange(val);
                          },
                          decoration: InputDecoration(
                            hintText: 'START TYPING...',
                            hintStyle: TextStyle(
                              color: DesignSystem.outlineVariant,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2,
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: DesignSystem.spaceLG,
                              vertical: DesignSystem.spaceSM,
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: DesignSystem.primary,
                            letterSpacing: 1,
                          ),
                          textAlign: TextAlign.center,
                          textCapitalization: TextCapitalization.characters,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'PRECISION IS KEY',
                        style: TextStyle(
                          color: DesignSystem.inkSlate,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.05),
                    ],
                  ),
                );
              },
            ),
    );
  }

  List<TextSpan> _buildTextSpans(String target, String input) {
    List<TextSpan> spans = [];
    for (int i = 0; i < target.length; i++) {
      Color color = DesignSystem.outlineVariant;
      if (i < input.length) {
        color = input[i].toUpperCase() == target[i].toUpperCase() 
            ? DesignSystem.success 
            : DesignSystem.error;
      }
      spans.add(TextSpan(
        text: target[i],
        style: TextStyle(
          color: color,
          fontSize: 22,
          fontWeight: FontWeight.w900,
          letterSpacing: 1,
        ),
      ));
    }
    return spans;
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return TangibleContainer(
      color: DesignSystem.surface,
      radius: DesignSystem.radiusSM,
      depth: 2,
      padding: const EdgeInsets.symmetric(vertical: DesignSystem.spaceSM),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.2,
              color: DesignSystem.inkSlate,
            ),
          ),
          const SizedBox(height: DesignSystem.spaceXS),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

