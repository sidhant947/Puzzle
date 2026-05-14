import 'package:puzzle/l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context)!;
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
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(typingSpeedNotifierProvider);
    final notifier = ref.read(typingSpeedNotifierProvider.notifier);

    ref.listen(typingSpeedNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.isGameWon, next.wpm);
      }
    });

    return GameScaffold(
      title: l10n.typingSpeedTitle.toUpperCase(),
      subtitle: l10n.typingSpeedSubtitle,
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            _controller.clear();
            notifier.initGame();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.refresh_rounded,
            color: colorScheme.onSurface,
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
                          SizedBox(width: DesignSystem.spaceMD),
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
                          color: colorScheme.surface,
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
                      SizedBox(height: DesignSystem.spaceLG),
                      TangibleContainer(
                        color: colorScheme.surface,
                        radius: DesignSystem.radiusSM,
                        depth: 2,
                        padding: EdgeInsets.zero,
                        child: TextField(
                          controller: _controller,
                          autofocus: true,
                          minLines: 3,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          onChanged: (val) {
                            HapticFeedbackUtil.selectionClick();
                            notifier.onInputChange(val);
                          },
                          decoration: InputDecoration(
                            hintText: 'START TYPING...',
                            hintStyle: TextStyle(
                              color: colorScheme.outline,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2,
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: DesignSystem.spaceLG,
                              vertical: DesignSystem.spaceMD,
                            ),
                          ),
                          style: TextStyle(
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
                      Text(
                        'PRECISION IS KEY',
                        style: TextStyle(
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
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
      Color color = Theme.of(context).colorScheme.outline;
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
      color: Theme.of(context).colorScheme.surface,
      radius: DesignSystem.radiusSM,
      depth: 2,
      padding: const EdgeInsets.symmetric(vertical: DesignSystem.spaceSM),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.2,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
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

