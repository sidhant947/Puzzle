import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'topology_provider.dart';
import 'package:puzzle/l10n/app_localizations.dart';

class TopologyScreen extends ConsumerStatefulWidget {
  const TopologyScreen({super.key});

  @override
  ConsumerState<TopologyScreen> createState() => _TopologyScreenState();
}

class _TopologyScreenState extends ConsumerState<TopologyScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(topologyNotifierProvider.notifier).initGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(topologyNotifierProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    ref.listen(topologyNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: l10n.topologyWinTitle,
            message: l10n.topologyWinMessage,
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(topologyNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    if (state.isLoading || state.currentLevel == null) {
      return GameScaffold(
        title: l10n.topologyTitle,
        subtitle: l10n.topologySubtitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final level = state.currentLevel!;

    return GameScaffold(
      title: l10n.topologyTitle,
      subtitle: l10n.topologySubtitle,
      onReset: () {
        HapticFeedbackUtil.mediumImpact();
        ref.read(topologyNotifierProvider.notifier).reset();
      },
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${l10n.topologyScore}${state.score} / 10', style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: DesignSystem.spaceXL),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ShapeCard(char: level.char1),
              const SizedBox(width: DesignSystem.spaceXL),
              _ShapeCard(char: level.char2),
            ],
          ),
          const SizedBox(height: DesignSystem.spaceXL * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TangibleButton(
                onTap: () {
                  HapticFeedbackUtil.lightImpact();
                  ref.read(topologyNotifierProvider.notifier).submitAnswer(true);
                },
                color: DesignSystem.accentEmerald,
                child: Text(l10n.yes.toUpperCase(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
              ),
              const SizedBox(width: DesignSystem.spaceXL),
              TangibleButton(
                onTap: () {
                  HapticFeedbackUtil.lightImpact();
                  ref.read(topologyNotifierProvider.notifier).submitAnswer(false);
                },
                color: colorScheme.error,
                child: Text(l10n.no.toUpperCase(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
              ),
            ],
          ),
          const SizedBox(height: DesignSystem.spaceLG),
          if (state.message != null)
            Text(
              state.message == 'correct' ? l10n.baseShiftCorrect : l10n.baseShiftIncorrect,
              style: TextStyle(
                color: state.message == 'correct' ? DesignSystem.accentEmerald : colorScheme.error,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
        ],
      ),
    );
  }
}

class _ShapeCard extends StatelessWidget {
  final String char;
  const _ShapeCard({required this.char});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return TangibleContainer(
      depth: 4.0,
      color: colorScheme.surface,
      padding: const EdgeInsets.all(DesignSystem.spaceXL),
      child: Text(
        char,
        style: TextStyle(fontSize: 80, fontWeight: FontWeight.w300, color: colorScheme.primary, fontFamily: 'monospace'),
      ),
    );
  }
}
