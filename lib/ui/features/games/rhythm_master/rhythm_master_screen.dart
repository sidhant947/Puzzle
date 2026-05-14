import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'rhythm_master_provider.dart';

class RhythmMasterScreen extends ConsumerStatefulWidget {
  const RhythmMasterScreen({super.key});

  @override
  ConsumerState<RhythmMasterScreen> createState() => _RhythmMasterScreenState();
}

class _RhythmMasterScreenState extends ConsumerState<RhythmMasterScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _lastBeatTime = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
      ref.read(rhythmMasterNotifierProvider.notifier).onBeat(_controller.value);
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _lastBeatTime = DateTime.now().millisecondsSinceEpoch;
        _controller.forward(from: 0);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(rhythmMasterNotifierProvider.notifier).initGame();
      _lastBeatTime = DateTime.now().millisecondsSinceEpoch;
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showGameOverDialog(int score, int perfect) {
    final l10n = AppLocalizations.of(context)!;
    bool won = perfect >= 10;
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('rhythm_master');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'RHYTHM GOD!' : 'OFF BEAT',
        message: 'You got $perfect perfect hits and $score points!',
        isVictory: won,
        onPlayAgain: () {
          ref.read(rhythmMasterNotifierProvider.notifier).initGame();
          _controller.forward(from: 0);
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
    final state = ref.watch(rhythmMasterNotifierProvider);
    
    ref.listen(rhythmMasterNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        _controller.stop();
        HapticFeedbackUtil.victory();
        _showGameOverDialog(next.score, next.perfectHits);
      }
      if (next.bpm != (previous?.bpm ?? 60)) {
        _controller.duration = Duration(milliseconds: (60000 / next.bpm).toInt());
      }
    });

    return GameScaffold(
      title: l10n.rhythmMasterTitle.toUpperCase(),
      subtitle: l10n.rhythmMasterSubtitle,
      body: GestureDetector(
        onTapDown: (_) {
          final now = DateTime.now().millisecondsSinceEpoch;
          final diff = (now - _lastBeatTime).abs();
          // We check diff against the interval to see if it's "late" vs "early" for the next beat
          final interval = (60000 / state.bpm).toInt();
          final effectiveDiff = diff > interval / 2 ? (interval - diff).abs() : diff;
          
          HapticFeedbackUtil.lightImpact();
          ref.read(rhythmMasterNotifierProvider.notifier).onTap(effectiveDiff);
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(DesignSystem.spaceLG),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStat('BEATS', '${state.totalBeats}/20', DesignSystem.accentBerry),
                    _buildStat('PERFECT', '${state.perfectHits}', DesignSystem.success),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Accuracy Label
                      Positioned(
                        top: 20,
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 200),
                          child: Text(
                            state.lastAccuracyLabel,
                            key: ValueKey(state.totalBeats),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: _getAccuracyColor(state.lastAccuracyLabel),
                              letterSpacing: 4.0,
                            ),
                          ),
                        ),
                      ),
                      // Static Ring
                      Container(
                        width: 280,
                        height: 280,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: colorScheme.outline.withValues(alpha: 0.5).withValues(alpha: 0.2), width: 4),
                        ),
                      ),
                      // Pulsing Circle
                      Container(
                        width: 280 * (1.0 - state.currentPulse),
                        height: 280 * (1.0 - state.currentPulse),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: DesignSystem.primary.withValues(alpha: 0.3 * (1.0 - state.currentPulse)),
                          border: Border.all(color: DesignSystem.primary, width: 2),
                        ),
                      ),
                      // Center Target
                      TangibleContainer(
                        depth: 4.0,
                        radius: 100,
                        padding: const EdgeInsets.all(40),
                        color: colorScheme.surface,
                        child: Icon(Icons.favorite_rounded, color: DesignSystem.error, size: 40),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(DesignSystem.spaceXL),
                child: Text(
                  'TAP THE CENTER ON THE BEAT',
                  style: TextStyle(
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2.0,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getAccuracyColor(String label) {
    switch (label) {
      case 'PERFECT': return DesignSystem.success;
      case 'GREAT': return DesignSystem.primary;
      case 'GOOD': return DesignSystem.accentAmber;
      case 'OK': return DesignSystem.accentOrange;
      default: return DesignSystem.error;
    }
  }

  Widget _buildStat(String label, String value, Color color) {
    return TangibleContainer(
      depth: 2.0,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: color)),
        ],
      ),
    );
  }
}
