import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'context_clues_provider.dart';

class ContextCluesScreen extends ConsumerWidget {
  const ContextCluesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(contextCluesNotifierProvider);
    final colorScheme = Theme.of(context).colorScheme;

    ref.listen(contextCluesNotifierProvider, (previous, next) {
      if (next.status == ContextCluesStatus.completed &&
          previous?.status != ContextCluesStatus.completed) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'CONTEXT CLUES COMPLETE',
            message: AppLocalizations.of(context)!.contextCluesMessage,
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(contextCluesNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      } else if (next.status == ContextCluesStatus.failure &&
          previous?.status != ContextCluesStatus.failure) {
        HapticFeedbackUtil.error();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'GAME OVER',
            message: AppLocalizations.of(context)!.contextCluesMessage1,
            isVictory: false,
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(contextCluesNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      } else if (next.status == ContextCluesStatus.success &&
          previous?.status != ContextCluesStatus.success) {
        HapticFeedbackUtil.success();
      }
    });

    return GameScaffold(
      title: 'CONTEXT CLUES',
      subtitle: 'Deduce words from context and definition clues',
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(contextCluesNotifierProvider.notifier).reset();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.refresh_rounded,
            color: colorScheme.onSurface,
            size: 20,
          ),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const SizedBox(height: DesignSystem.spaceXL),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: DesignSystem.spaceLG),
                    physics: const BouncingScrollPhysics(),
                    child: _buildMainBody(ref, state, context),
                  ),
                ),
              ),
              _buildInstruction(state, context),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildMainBody(WidgetRef ref, ContextCluesState state, BuildContext context) {
    if (state.questions.isEmpty || state.currentQuestionIndex >= state.questions.length) {
      return const CircularProgressIndicator();
    }

    final question = state.questions[state.currentQuestionIndex];
    final colorScheme = Theme.of(context).colorScheme;
    final isMobile = DesignSystem.isMobile(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TangibleContainer(
            color: colorScheme.surface,
            depth: 4,
            padding: const EdgeInsets.all(24),
            radius: DesignSystem.radiusMD,
            child: Column(
              children: [
                Text(
                  'SENTENCE CLUE',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    color: DesignSystem.accentAmber,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  question.sentence,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: DesignSystem.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                  ),
                  child: Text(
                    question.clue,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface.withValues(alpha: 0.8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: DesignSystem.spaceXL),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 2 : 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: isMobile ? 2.2 : 3.0,
            ),
            itemCount: question.options.length,
            itemBuilder: (context, index) {
              final option = question.options[index];
              final isCorrectAnswer = option == question.correctWord;
              final isSelected = state.selectedOption == option;

              Color btnColor = colorScheme.surface;
              double depth = 2;

              if (state.selectedOption != null) {
                if (isCorrectAnswer) {
                  btnColor = DesignSystem.accentEmerald;
                  depth = 0;
                } else if (isSelected) {
                  btnColor = DesignSystem.error;
                  depth = 0;
                }
              }

              return TangibleButton(
                onTap: () {
                  HapticFeedbackUtil.lightImpact();
                  ref.read(contextCluesNotifierProvider.notifier).answerQuestion(option);
                },
                color: btnColor,
                depth: depth,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      option.toUpperCase(),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: state.selectedOption != null
                            ? Colors.white
                            : colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInstruction(ContextCluesState state, BuildContext context) {
    String text = 'CHOOSE THE WORD THAT FITS';
    Color color = DesignSystem.primary;

    if (state.status == ContextCluesStatus.success || state.status == ContextCluesStatus.completed) {
      text = 'EXCELLENT CONTEXTUAL MATCH!';
      color = DesignSystem.accentEmerald;
    } else if (state.status == ContextCluesStatus.failure) {
      text = 'INCORRECT MATCH';
      color = DesignSystem.error;
    }

    return TangibleContainer(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: color.withValues(alpha: 0.1),
      radius: DesignSystem.radiusFull,
      depth: 1,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
