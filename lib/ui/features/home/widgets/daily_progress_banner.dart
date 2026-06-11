import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/widgets/tangible.dart';

class DailyProgressBanner extends ConsumerWidget {
  const DailyProgressBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final streaks = ref.watch(gameStreakNotifierProvider);
    final solvedToday = streaks.values.where((s) => s.solvedToday).length;

    final encouragement = switch (solvedToday) {
      0 => l10n.readyForWorkout,
      < 3 => l10n.greatStartKeepGoing,
      < 7 => l10n.onFireToday,
      _ => l10n.incredibleSolvingToday,
    };

    final displayColor =
        solvedToday > 0 ? DesignSystem.primary : DesignSystem.gameBlue;

    return TangibleContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: displayColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
              child: Text(
                '$solvedToday',
                style: const TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.0,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.solvedToday.toUpperCase(),
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.brightness == Brightness.dark
                        ? const Color(0xFF94A3B8)
                        : const Color(0xFF475569),
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  encouragement.toUpperCase(),
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontSize: 18.0,
                    letterSpacing: 0.5,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
