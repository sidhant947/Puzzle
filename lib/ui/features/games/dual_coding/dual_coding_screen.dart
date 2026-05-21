import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'dual_coding_engine.dart';
import 'dual_coding_provider.dart';

class DualCodingScreen extends ConsumerStatefulWidget {
  const DualCodingScreen({super.key});

  @override
  ConsumerState<DualCodingScreen> createState() => _DualCodingScreenState();
}

class _DualCodingScreenState extends ConsumerState<DualCodingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dualCodingNotifierProvider.notifier).initGame();
    });
  }

  void _triggerPitchHaptic(PitchType pitch) {
    switch (pitch) {
      case PitchType.low:
        HapticFeedbackUtil.lightImpact();
        break;
      case PitchType.mid:
        HapticFeedbackUtil.mediumImpact();
        break;
      case PitchType.high:
        HapticFeedbackUtil.heavyImpact();
        break;
    }
  }

  void _showCompletionDialog() {
    final state = ref.read(dualCodingNotifierProvider);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'DUAL CODING COMPLETE',
        message: 'Fantastic dual-task performance! Your working memory score: ${state.score}',
        isVictory: state.score >= 12,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(dualCodingNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(dualCodingNotifierProvider);
    final notifier = ref.read(dualCodingNotifierProvider.notifier);

    ref.listen(dualCodingNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        _showCompletionDialog();
      } else if (next.history.length > (previous?.history.length ?? 0)) {
        // Stimulus changed: play the corresponding pitch vibration!
        if (next.history.isNotEmpty) {
          _triggerPitchHaptic(next.history.last.pitch);
        }
      }
    });

    if (state.isLoading) {
      return const GameScaffold(
        title: 'DUAL CODING',
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final currentStim = state.history.isNotEmpty ? state.history.last : null;

    return GameScaffold(
      title: 'DUAL CODING',
      subtitle: 'Match Pitch and Card with 2-steps ago',
      actions: [
        _buildTimer(state.timeLeft),
      ],
      body: Padding(
        padding: const EdgeInsets.all(DesignSystem.spaceLG),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard('SCORE', '${state.score} PTS', DesignSystem.primary),
                _buildStatCard('ROUND', '${state.history.length}', DesignSystem.accentAmber),
              ],
            ),
            const SizedBox(height: DesignSystem.spaceLG),
            Expanded(
              child: Center(
                child: currentStim == null
                    ? const SizedBox.shrink()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildVisualPitchIndicator(currentStim.pitch),
                          const SizedBox(height: DesignSystem.spaceXL),
                          _buildVisualCard(currentStim.shape, currentStim.color),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: DesignSystem.spaceLG),
            Row(
              children: [
                Expanded(
                  child: TangibleButton(
                    onTap: () {
                      HapticFeedbackUtil.lightImpact();
                      notifier.pressCardMatch();
                    },
                    color: state.cardMatchPressed ? DesignSystem.success : colorScheme.surface,
                    depth: state.cardMatchPressed ? 0.0 : 2.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'CARD MATCH',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: state.cardMatchPressed ? Colors.white : colorScheme.onSurface,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: DesignSystem.spaceMD),
                Expanded(
                  child: TangibleButton(
                    onTap: () {
                      HapticFeedbackUtil.lightImpact();
                      notifier.pressPitchMatch();
                    },
                    color: state.pitchMatchPressed ? DesignSystem.success : colorScheme.surface,
                    depth: state.pitchMatchPressed ? 0.0 : 2.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'PITCH MATCH',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: state.pitchMatchPressed ? Colors.white : colorScheme.onSurface,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: DesignSystem.spaceMD),
            Text(
              state.history.length <= state.n
                  ? 'MEMORIZE CUES... COMPLYING IN ${state.n - state.history.length + 1}'
                  : 'ARE CUES DUAL MATCHING 2-STEPS AGO?',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w900,
                color: colorScheme.onSurface.withValues(alpha: 0.5),
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return TangibleContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Theme.of(context).colorScheme.surface,
      depth: 1,
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: color,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimer(int timeLeft) {
    return TangibleContainer(
      color: timeLeft < 10 ? DesignSystem.error.withValues(alpha: 0.1) : Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      radius: DesignSystem.radiusSM,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.timer_outlined,
            size: 16,
            color: timeLeft < 10 ? DesignSystem.error : Theme.of(context).colorScheme.onSurface,
          ),
          const SizedBox(width: 4),
          Text(
            timeLeft.toString(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: timeLeft < 10 ? DesignSystem.error : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVisualPitchIndicator(PitchType pitch) {
    String label = '';
    Color waveColor = Colors.grey;
    int count = 5;
    double heightMultiplier = 1.0;

    switch (pitch) {
      case PitchType.low:
        label = 'LOW TONE';
        waveColor = DesignSystem.accentAmber;
        count = 4;
        heightMultiplier = 0.5;
        break;
      case PitchType.mid:
        label = 'MID TONE';
        waveColor = DesignSystem.primary;
        count = 8;
        heightMultiplier = 1.0;
        break;
      case PitchType.high:
        label = 'HIGH TONE';
        waveColor = DesignSystem.accentBerry;
        count = 14;
        heightMultiplier = 1.6;
        break;
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.volume_up_rounded, color: waveColor, size: 18),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w900,
                color: waveColor,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 32,
          width: 140,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(count, (index) {
              double amplitude = (index % 2 == 0 ? 12 : 24) * heightMultiplier;
              return Container(
                width: 3,
                height: amplitude.clamp(4.0, 30.0),
                decoration: BoxDecoration(
                  color: waveColor.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(2),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildVisualCard(CardShape shape, CardColor color) {
    IconData icon;
    switch (shape) {
      case CardShape.circle:
        icon = Icons.lens_rounded;
        break;
      case CardShape.square:
        icon = Icons.square_rounded;
        break;
      case CardShape.triangle:
        icon = Icons.change_history_rounded;
        break;
      case CardShape.star:
        icon = Icons.star_rounded;
        break;
    }

    Color flutterColor;
    switch (color) {
      case CardColor.amber:
        flutterColor = DesignSystem.accentAmber;
        break;
      case CardColor.teal:
        flutterColor = DesignSystem.accentTeal;
        break;
      case CardColor.berry:
        flutterColor = DesignSystem.accentBerry;
        break;
      case CardColor.indigo:
        flutterColor = Colors.indigoAccent;
        break;
    }

    return TangibleContainer(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.all(32),
      radius: DesignSystem.radiusMD,
      depth: 4,
      shadowColor: flutterColor.withValues(alpha: 0.15),
      child: Icon(
        icon,
        color: flutterColor,
        size: 72,
      ),
    );
  }
}
