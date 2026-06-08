import "package:puzzle/l10n/app_localizations.dart";
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
import 'affix_factory_provider.dart';

class AffixFactoryScreen extends ConsumerStatefulWidget {
  const AffixFactoryScreen({super.key});

  @override
  ConsumerState<AffixFactoryScreen> createState() => _AffixFactoryScreenState();
}

class _AffixFactoryScreenState extends ConsumerState<AffixFactoryScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(affixFactoryNotifierProvider.notifier).initGame());
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(affixFactoryNotifierProvider);
    ref.read(gameStreakNotifierProvider.notifier).completeGame('affix_factory');
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: state.isGameWon ? l10n.wellDone.toUpperCase() : l10n.gameOver.toUpperCase(),
        message: state.description,
        onPlayAgain: () {
          ref.read(affixFactoryNotifierProvider.notifier).initGame();
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
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(affixFactoryNotifierProvider);
    final notifier = ref.read(affixFactoryNotifierProvider.notifier);

    ref.listen(affixFactoryNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showCompletionDialog();
      }
    });

    return GameScaffold(
      title: 'AFFIX FACTORY',
      subtitle: 'Select all affixes that can be added to the root',
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
          ? const Center(child: CircularProgressIndicator(color: DesignSystem.primary))
          : LayoutBuilder(
              builder: (context, constraints) {
                return Padding(
                  padding: const EdgeInsets.all(DesignSystem.spaceLG),
                  child: Column(
                    children: [
                      const Spacer(),
                      TangibleContainer(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        color: DesignSystem.gameAmber,
                        shadowColor: DesignSystem.gameAmber.withValues(alpha: 0.7),
                        child: Text(
                          state.root,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      const SizedBox(height: DesignSystem.spaceXL),
                      Text(
                        'Select ${state.correctAffixes.length} affixes:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: DesignSystem.spaceMD),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        alignment: WrapAlignment.center,
                        children: state.options.map((option) {
                          final isSelected = state.selectedAffixes.contains(option);
                          final isCorrect = state.correctAffixes.contains(option);
                          
                          Color btnColor = isSelected ? DesignSystem.primary : colorScheme.surface;
                          Color shadowColor = isSelected ? DesignSystem.primary.withValues(alpha: 0.7) : colorScheme.outline;
                          
                          if (state.isGameOver) {
                            if (isCorrect) {
                              btnColor = DesignSystem.gameGreen;
                              shadowColor = DesignSystem.gameGreen.withValues(alpha: 0.7);
                            } else if (isSelected) {
                               btnColor = DesignSystem.error;
                               shadowColor = DesignSystem.error.withValues(alpha: 0.7);
                            }
                          }

                          return SizedBox(
                            width: constraints.maxWidth * 0.4,
                            child: TangibleButton(
                              onTap: () => notifier.toggleAffix(option),
                              color: btnColor,
                              shadowColor: shadowColor,
                              depth: 4,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Center(
                                child: Text(
                                  option,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                    color: (isSelected || (state.isGameOver && isCorrect)) 
                                        ? Colors.white 
                                        : colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const Spacer(),
                      TangibleButton(
                        onTap: state.selectedAffixes.length == state.correctAffixes.length ? notifier.submit : null,
                        color: state.selectedAffixes.length == state.correctAffixes.length ? DesignSystem.primary : colorScheme.surface.withValues(alpha: 0.5),
                        shadowColor: DesignSystem.primary.withValues(alpha: 0.5),
                        depth: 4,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: const Center(
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
