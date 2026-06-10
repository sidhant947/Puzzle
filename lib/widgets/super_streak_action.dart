import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_providers.dart';

class SuperStreakAction extends ConsumerWidget {
  const SuperStreakAction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataNotifierProvider);
    final streak = userData.superStreak ?? 0;
    final theme = Theme.of(context);

    if (streak == 0) return const SizedBox.shrink();

    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: theme.colorScheme.primary.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.local_fire_department_rounded,
              color: theme.colorScheme.primary,
              size: 18,
            ),
            const SizedBox(width: 4),
            Text(
              streak.toString(),
              style: theme.textTheme.labelMedium?.copyWith(
                fontFamily: 'Bebas Neue',
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.primary,
                letterSpacing: 1.0,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


