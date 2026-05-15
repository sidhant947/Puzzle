import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import '../../../../providers/user_providers.dart';
import 'mental_calendar_provider.dart';
import 'mental_calendar_engine.dart';

class MentalCalendarScreen extends ConsumerWidget {
  const MentalCalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mentalCalendarNotifierProvider);
    final l10n = AppLocalizations.of(context)!;

    return GameScaffold(
      title: l10n.mentalCalendarTitle,
      subtitle: l10n.mentalCalendarSubtitle,
      onHowToPlay: () => _showHowToPlay(context, l10n),
      body: state.phase == MentalCalendarPhase.result
          ? _buildResult(context, ref, state)
          : _buildGame(ref, state),
    );
  }

  void _showHowToPlay(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.howToPlay),
        content: Text(l10n.mentalCalendarHowToPlay),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.gotIt),
          ),
        ],
      ),
    );
  }

  Widget _buildGame(WidgetRef ref, MentalCalendarState state) {
    final dateStr = DateFormat('MMMM d, yyyy').format(state.currentDate);
    
    final days = List.generate(7, (index) {
      return DateFormat('EEEE').format(DateTime(2024, 1, index + 1));
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${state.totalTrials + 1} / 10',
          style: DesignSystem.theme.textTheme.labelLarge?.copyWith(
            color: DesignSystem.primary,
            fontWeight: FontWeight.w900,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: DesignSystem.spaceLG),
        TangibleContainer(
          padding: const EdgeInsets.all(DesignSystem.spaceXL),
          child: Column(
            children: [
              Text(
                dateStr,
                style: DesignSystem.theme.textTheme.displayLarge?.copyWith(
                  fontSize: 32,
                  color: DesignSystem.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: DesignSystem.spaceMD),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: (state.difficulty == Difficulty.hard 
                          ? DesignSystem.error 
                          : (state.difficulty == Difficulty.medium ? DesignSystem.accentAmber : DesignSystem.success))
                      .withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
                ),
                child: Text(
                  state.difficulty.name.toUpperCase(),
                  style: DesignSystem.theme.textTheme.labelLarge?.copyWith(
                    color: state.difficulty == Difficulty.hard 
                        ? DesignSystem.error 
                        : (state.difficulty == Difficulty.medium ? DesignSystem.accentAmber : DesignSystem.success),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: DesignSystem.space2XL),
        Wrap(
          spacing: DesignSystem.spaceMD,
          runSpacing: DesignSystem.spaceMD,
          alignment: WrapAlignment.center,
          children: List.generate(7, (index) {
            final dayIndex = index + 1;
            return SizedBox(
              width: 140,
              child: TangibleButton(
                onTap: () => ref.read(mentalCalendarNotifierProvider.notifier).submitAnswer(dayIndex),
                color: DesignSystem.surface,
                child: Text(
                  days[index],
                  style: const TextStyle(color: DesignSystem.ink, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: DesignSystem.spaceXL),
        if (state.lastResult != null)
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: state.lastResult! ? DesignSystem.success.withValues(alpha: 0.1) : DesignSystem.error.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
            ),
            child: Text(
              state.lastResult! ? 'CORRECT!' : 'WRONG',
              style: DesignSystem.theme.textTheme.headlineMedium?.copyWith(
                color: state.lastResult! ? DesignSystem.success : DesignSystem.error,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildResult(BuildContext context, WidgetRef ref, MentalCalendarState state) {
    Future.microtask(() {
      final score = state.correctCount;
      if (score >= 7) {
        ref.read(gameStreakNotifierProvider.notifier).completeGame('mental_calendar');
      }
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => GameCompletionDialog(
          onHome: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          onPlayAgain: () {
            Navigator.of(context).pop();
            ref.read(mentalCalendarNotifierProvider.notifier).resetGame();
          },
          title: 'RESULT',
          message: 'You got $score correct out of 10!',
        ),
      );
    });
    return const Center(child: CircularProgressIndicator());
  }
}
