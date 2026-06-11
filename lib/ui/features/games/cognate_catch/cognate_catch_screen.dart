import 'package:puzzle/utils/l10n_game_helpers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
import 'cognate_catch_provider.dart';

class CognateCatchScreen extends ConsumerStatefulWidget {
  const CognateCatchScreen({super.key});

  @override
  ConsumerState<CognateCatchScreen> createState() => _CognateCatchScreenState();
}

class _CognateCatchScreenState extends ConsumerState<CognateCatchScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(cognateCatchNotifierProvider.notifier).initGame());
  }

  void _showCompletionDialog() {
    final state = ref.read(cognateCatchNotifierProvider);
    ref.read(gameStreakNotifierProvider.notifier).completeGame('cognate_catch');
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: state.isGameWon ? 'CORRECT!' : 'WRONG',
        message: state.description,
        onPlayAgain: () {
          ref.read(cognateCatchNotifierProvider.notifier).initGame();
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
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(cognateCatchNotifierProvider);
    final notifier = ref.read(cognateCatchNotifierProvider.notifier);

    ref.listen(cognateCatchNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showCompletionDialog();
      }
    });

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'cognate_catch'),
      subtitle: L10nGameHelpers.getGameTitle(context, 'cognate_catch'),
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () => notifier.initGame(),
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded, size: 20, color: colorScheme.onSurface),
        ),
      ],
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator(color: DesignSystem.gamePurple))
          : Padding(
              padding: const EdgeInsets.all(DesignSystem.spaceLG),
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    'Do these words share an origin?',
                    style: TextStyle(
                      fontSize: DesignSystem.fontSizeLG,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: DesignSystem.spaceXL),
                  Row(
                    children: [
                      Expanded(
                        child: _WordCard(
                          word: state.word1,
                          language: 'English',
                          color: DesignSystem.gamePurple,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD),
                        child: Icon(Icons.compare_arrows_rounded, 
                          color: colorScheme.onSurface.withValues(alpha: 0.3),
                          size: 32,
                        ),
                      ),
                      Expanded(
                        child: _WordCard(
                          word: state.word2,
                          language: state.language,
                          color: DesignSystem.gameIndigo,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: TangibleButton(
                          onTap: () => notifier.selectAnswer(true),
                          color: DesignSystem.gameGreen,
                          shadowColor: const Color(0xFF166534),
                          depth: 4,
                          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                          child: const FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Column(
                              children: [
                                Icon(Icons.check_circle_outline_rounded, color: Colors.white, size: 32),
                                SizedBox(height: 8),
                                Text(
                                  'COGNATES',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: DesignSystem.spaceLG),
                      Expanded(
                        child: TangibleButton(
                          onTap: () => notifier.selectAnswer(false),
                          color: DesignSystem.error,
                          shadowColor: const Color(0xFF991B1B),
                          depth: 4,
                          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                          child: const FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Column(
                              children: [
                                Icon(Icons.cancel_outlined, color: Colors.white, size: 32),
                                SizedBox(height: 8),
                                Text(
                                  'FALSE FRIENDS',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: DesignSystem.space2XL),
                ],
              ),
            ),
    );
  }
}

class _WordCard extends StatelessWidget {
  final String word;
  final String language;
  final Color color;

  const _WordCard({
    required this.word,
    required this.language,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TangibleContainer(
      padding: const EdgeInsets.all(DesignSystem.spaceLG),
      color: color.withValues(alpha: 0.1),
      shadowColor: color.withValues(alpha: 0.2),
      depth: 2,
      child: Column(
        children: [
          Text(
            language.toUpperCase(),
            style: TextStyle(
              fontSize: DesignSystem.fontSizeXS,
              fontWeight: FontWeight.w800,
              color: color,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: DesignSystem.spaceSM),
          FittedBox(
            child: Text(
              word,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
