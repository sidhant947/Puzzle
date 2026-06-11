import 'package:puzzle/utils/l10n_game_helpers.dart';
import "package:puzzle/l10n/app_localizations.dart";

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
import 'compound_connect_provider.dart';

class CompoundConnectScreen extends ConsumerStatefulWidget {
  const CompoundConnectScreen({super.key});

  @override
  ConsumerState<CompoundConnectScreen> createState() => _CompoundConnectScreenState();
}

class _CompoundConnectScreenState extends ConsumerState<CompoundConnectScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(compoundConnectNotifierProvider.notifier).initGame());
  }

  void _showCompletionDialog() {
    final state = ref.read(compoundConnectNotifierProvider);
    ref.read(gameStreakNotifierProvider.notifier).completeGame('compound_connect');
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: state.isGameWon ? 'CORRECT!' : 'WRONG',
        message: AppLocalizations.of(context)!.compoundConnectMessage((state.prefix).toString(), (state.correctSuffix).toString()),
        onPlayAgain: () {
          ref.read(compoundConnectNotifierProvider.notifier).initGame();
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
    final state = ref.watch(compoundConnectNotifierProvider);
    final notifier = ref.read(compoundConnectNotifierProvider.notifier);

    ref.listen(compoundConnectNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showCompletionDialog();
      }
    });

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'compound_connect'),
      subtitle: L10nGameHelpers.getGameTitle(context, 'compound_connect'),
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
          ? const Center(child: CircularProgressIndicator(color: DesignSystem.gameIndigo))
          : Padding(
              padding: const EdgeInsets.all(DesignSystem.spaceLG),
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TangibleContainer(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                        color: DesignSystem.gameIndigo,
                        shadowColor: const Color(0xFF4F46E5),
                        depth: 4,
                        child: Text(
                          state.prefix,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD),
                        child: Icon(Icons.add_rounded, size: 32, color: DesignSystem.gameIndigo),
                      ),
                      TangibleContainer(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                        color: colorScheme.surface,
                        shadowColor: colorScheme.outline,
                        depth: 2,
                        child: Text(
                          '?',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            color: colorScheme.onSurface.withValues(alpha: 0.3),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    'Select the correct suffix:',
                    style: TextStyle(
                      fontSize: DesignSystem.fontSizeLG,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: DesignSystem.spaceXL),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: DesignSystem.spaceMD,
                    crossAxisSpacing: DesignSystem.spaceMD,
                    childAspectRatio: 2.5,
                    children: state.options.map((option) {
                      return TangibleButton(
                        onTap: () => notifier.selectSuffix(option),
                        color: colorScheme.surface,
                        shadowColor: colorScheme.outline,
                        depth: 3,
                        child: Center(
                          child: Text(
                            option,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: DesignSystem.gameIndigo,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const Spacer(),
                ],
              ),
            ),
    );
  }
}
