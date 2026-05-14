import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../providers/user_providers.dart';
import 'reflex_tap_provider.dart';

class ReflexTapScreen extends ConsumerStatefulWidget {
  const ReflexTapScreen({super.key});

  @override
  ConsumerState<ReflexTapScreen> createState() => _ReflexTapScreenState();
}

class _ReflexTapScreenState extends ConsumerState<ReflexTapScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(reflexTapNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    final l10n = AppLocalizations.of(context)!;
    bool won = score >= 15;
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('reflex_tap');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'SHARP REFLEXES!' : 'OUT OF TIME',
        message: 'You tapped $score targets!',
        onPlayAgain: () {
          ref.read(reflexTapNotifierProvider.notifier).initGame();
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
    final state = ref.watch(reflexTapNotifierProvider);
    final notifier = ref.read(reflexTapNotifierProvider.notifier);

    ref.listen(reflexTapNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: l10n.reflexTapTitle.toUpperCase(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStat('TIME', '${state.timeLeft}s',
                          DesignSystem.accentBerry),
                      _buildStat(
                          'TAPS', '${state.score}', DesignSystem.accentAmber),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: constraints.maxHeight * 0.6),
                      child: TangibleContainer(
                        depth: 4.0,
                        color: colorScheme.onSurface,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(DesignSystem.radiusMD - 1),
                          child: GestureDetector(
                            onTap: notifier.onMissed,
                            child: Container(
                              color: Colors.transparent,
                              child: LayoutBuilder(
                                builder: (context, boardConstraints) {
                                  return Stack(
                                    children: [
                                      Positioned(
                                        left: (state.targetPosition.x *
                                                    boardConstraints.maxWidth -
                                                (state.targetSize / 2))
                                            .clamp(
                                                0,
                                                boardConstraints.maxWidth -
                                                    state.targetSize),
                                        top: (state.targetPosition.y *
                                                    boardConstraints.maxHeight -
                                                (state.targetSize / 2))
                                            .clamp(
                                                0,
                                                boardConstraints.maxHeight -
                                                    state.targetSize),
                                        child: _Target(
                                          size: state.targetSize.clamp(0,
                                              boardConstraints.maxWidth * 0.3),
                                          onTap: notifier.onTargetTapped,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  child: Text(
                    'Tap the targets as fast as you can!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colorScheme.outline.withValues(alpha: 0.5),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStat(String label, String value, Color color) {
    return TangibleContainer(
      depth: 2.0,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
              letterSpacing: 1.2,
            ),
          ),
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

class _Target extends StatelessWidget {
  final double size;
  final VoidCallback onTap;

  const _Target({required this.size, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
      onTapDown: (_) => onTap(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: DesignSystem.accentBerry,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: DesignSystem.accentBerry.withValues(alpha: 0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: Colors.white, width: 4),
        ),
        child: const Center(
          child: Icon(Icons.gps_fixed_rounded, color: Colors.white),
        ),
      ),
    );
  }
}
