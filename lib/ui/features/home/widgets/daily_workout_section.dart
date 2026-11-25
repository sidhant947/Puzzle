import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/providers/game_providers.dart';
import 'package:puzzle/providers/game_session_provider.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/utils/navigation_utils.dart';
import 'package:puzzle/widgets/tangible.dart';

class DailyWorkoutSection extends ConsumerWidget {
  const DailyWorkoutSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final workoutGames = ref.watch(dailyWorkoutGamesProvider);
    final streaks = ref.watch(gameStreakNotifierProvider);

    final completedCount = workoutGames.where((g) => streaks[g.id]?.solvedToday ?? false).length;
    final isAllCompleted = completedCount == workoutGames.length && workoutGames.isNotEmpty;
    final progress = workoutGames.isEmpty ? 0.0 : completedCount / workoutGames.length;

    return TangibleContainer(
      color: colorScheme.surface,
      padding: const EdgeInsets.symmetric(
        horizontal: DesignSystem.spaceMD,
        vertical: DesignSystem.spaceMD,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        l10n.readyForWorkout.toUpperCase(),
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: DesignSystem.fontDisplay,
                          fontSize: DesignSystem.fontSizeMD,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ),
                    Text(
                      l10n.solvedToday.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: DesignSystem.spaceSM),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isAllCompleted
                      ? DesignSystem.success.withValues(alpha: 0.15)
                      : DesignSystem.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isAllCompleted ? Icons.check_rounded : Icons.flag_rounded,
                      size: 13,
                      color: isAllCompleted ? DesignSystem.success : DesignSystem.primary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$completedCount / ${workoutGames.length}',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                        color: isAllCompleted ? DesignSystem.success : DesignSystem.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: DesignSystem.spaceSM + 2),
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 4,
              backgroundColor: colorScheme.outline.withValues(alpha: 0.12),
              valueColor: AlwaysStoppedAnimation<Color>(
                isAllCompleted ? DesignSystem.success : DesignSystem.primary,
              ),
            ),
          ),
          const SizedBox(height: DesignSystem.spaceMD),
          for (int i = 0; i < workoutGames.length; i++) ...[
            if (i > 0)
              Divider(
                height: 12,
                thickness: 0.8,
                color: colorScheme.outline.withValues(alpha: 0.08),
              ),
            _WorkoutGameRow(
              index: i + 1,
              game: workoutGames[i],
              isSolvedToday: streaks[workoutGames[i].id]?.solvedToday ?? false,
            ),
          ],
        ],
      ),
    );
  }
}

class _WorkoutGameRow extends ConsumerWidget {
  final int index;
  final GameMetadata game;
  final bool isSolvedToday;

  const _WorkoutGameRow({
    required this.index,
    required this.game,
    required this.isSolvedToday,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final gameTitle = L10nGameHelpers.getGameTitle(context, game.id);

    return InkWell(
      onTap: () {
        HapticFeedbackUtil.lightImpact();
        ScaffoldMessenger.of(context).clearSnackBars();
        ref.read(gameSessionNotifierProvider.notifier).setSession(
          gameId: game.id,
          category: game.category,
          query: '',
        );
        Navigator.push(
          context,
          CustomPageRoute(page: game.builder(context)),
        );
      },
      borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: DesignSystem.spaceXS,
          vertical: 6.0,
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: game.color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
              ),
              child: Icon(
                game.icon,
                color: game.color,
                size: 20,
              ),
            ),
            const SizedBox(width: DesignSystem.spaceSM + 2),
            Expanded(
              child: Text(
                gameTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 13.5,
                  letterSpacing: 0.3,
                ),
              ),
            ),
            const SizedBox(width: DesignSystem.spaceSM),
            if (isSolvedToday)
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: DesignSystem.success.withValues(alpha: 0.15),
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: DesignSystem.success,
                  size: 16,
                ),
              )
            else
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: game.color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.play_arrow_rounded,
                      color: game.color,
                      size: 14,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      'PLAY',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        color: game.color,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
