import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'source_monitoring_provider.dart';

class SourceMonitoringScreen extends ConsumerStatefulWidget {
  const SourceMonitoringScreen({super.key});

  @override
  ConsumerState<SourceMonitoringScreen> createState() => _SourceMonitoringScreenState();
}

class _SourceMonitoringScreenState extends ConsumerState<SourceMonitoringScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(sourceMonitoringNotifierProvider.notifier).initGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sourceMonitoringNotifierProvider);
    final colorScheme = Theme.of(context).colorScheme;

    ref.listen(sourceMonitoringNotifierProvider, (previous, next) {
      if (next.phase == SourceMonitoringPhase.complete && previous?.phase != SourceMonitoringPhase.complete) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'MEMORY MASTER!',
            message: 'You scored ${next.score} out of ${next.currentLevel?.questions.length}!',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(sourceMonitoringNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    if (state.isLoading || state.currentLevel == null) {
      return GameScaffold(
        title: 'SOURCE MONITORING',
        subtitle: 'Remember the context',
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (state.phase == SourceMonitoringPhase.memo) {
      return GameScaffold(
        title: 'MEMORIZE',
        subtitle: 'Remember which box each word is in.',
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(DesignSystem.spaceLG),
                itemCount: state.currentLevel!.items.length,
                itemBuilder: (context, index) {
                  final item = state.currentLevel!.items[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: DesignSystem.spaceMD),
                    child: TangibleContainer(
                      depth: 4.0,
                      color: item.color.withValues(alpha: 0.1),
                      padding: const EdgeInsets.all(DesignSystem.spaceLG),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.word, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          Text(item.sourceName, style: TextStyle(color: item.color, fontWeight: FontWeight.w900)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(DesignSystem.spaceLG),
              child: TangibleButton(
                onTap: () => ref.read(sourceMonitoringNotifierProvider.notifier).startRecall(),
                color: colorScheme.primary,
                child: const Text('START RECALL', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      );
    }

    final question = state.currentLevel!.questions[state.currentQuestionIndex];

    return GameScaffold(
      title: 'RECALL',
      subtitle: 'Which box was this word in?',
      body: Padding(
        padding: const EdgeInsets.all(DesignSystem.spaceLG),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TangibleContainer(
              depth: 8.0,
              color: colorScheme.surface,
              padding: const EdgeInsets.all(DesignSystem.spaceXL),
              child: Text(
                question.word,
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: DesignSystem.spaceXL * 2),
            Column(
              children: [
                _SourceButton(name: 'RED BOX', color: Colors.red),
                const SizedBox(height: DesignSystem.spaceMD),
                _SourceButton(name: 'BLUE BOX', color: Colors.blue),
                const SizedBox(height: DesignSystem.spaceMD),
                _SourceButton(name: 'GREEN BOX', color: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SourceButton extends ConsumerWidget {
  final String name;
  final Color color;
  const _SourceButton({required this.name, required this.color});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TangibleButton(
      onTap: () {
        HapticFeedbackUtil.lightImpact();
        ref.read(sourceMonitoringNotifierProvider.notifier).submitAnswer(name);
      },
      color: color.withValues(alpha: 0.1),
      child: Text(name, style: TextStyle(color: color, fontWeight: FontWeight.w900, fontSize: 18)),
    );
  }
}
