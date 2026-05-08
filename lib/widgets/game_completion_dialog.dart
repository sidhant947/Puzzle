import 'package:flutter/material.dart';
import '../utils/design_system.dart';

class GameCompletionDialog extends StatelessWidget {
  final VoidCallback onHome;
  final VoidCallback onPlayAgain;
  final String title;
  final String message;

  const GameCompletionDialog({
    super.key,
    required this.onHome,
    required this.onPlayAgain,
    this.title = 'CONGRATS',
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      backgroundColor: theme.colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignSystem.radiusXL),
        side: BorderSide(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      title: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(DesignSystem.spaceMD),
              decoration: BoxDecoration(
                color: DesignSystem.gameAmber.withValues(alpha: 0.1),
                shape: BoxShape.circle,
                border: Border.all(color: DesignSystem.gameAmber.withValues(alpha: 0.3), width: 2),
              ),
              child: Icon(
                Icons.auto_awesome_rounded,
                color: DesignSystem.gameAmber,
                size: 48,
              ),
            ),
            const SizedBox(height: DesignSystem.spaceMD),
            Text(
              title,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD, vertical: DesignSystem.spaceMD),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: onPlayAgain,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('PLAY AGAIN'),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: onHome,
                style: TextButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'HOME',
                  style: TextStyle(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
