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

    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.local_fire_department_rounded,
            color: theme.colorScheme.primary,
            size: 24,
          ),
          const SizedBox(width: 4),
          Text(
            streak.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
