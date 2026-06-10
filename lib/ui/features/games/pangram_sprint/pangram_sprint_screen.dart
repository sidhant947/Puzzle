import "package:puzzle/l10n/app_localizations.dart";
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
import 'pangram_sprint_provider.dart';

class PangramSprintScreen extends ConsumerStatefulWidget {
  const PangramSprintScreen({super.key});

  @override
  ConsumerState<PangramSprintScreen> createState() => _PangramSprintScreenState();
}

class _PangramSprintScreenState extends ConsumerState<PangramSprintScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(pangramSprintNotifierProvider.notifier).initGame());
  }

  void _showCompletionDialog() {
    final state = ref.read(pangramSprintNotifierProvider);
    ref.read(gameStreakNotifierProvider.notifier).completeGame('pangram_sprint');
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'PANGRAM COMPLETE!',
        message: AppLocalizations.of(context)!.pangramSprintMessage,
        onPlayAgain: () {
          ref.read(pangramSprintNotifierProvider.notifier).initGame();
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
    final state = ref.watch(pangramSprintNotifierProvider);
    final notifier = ref.read(pangramSprintNotifierProvider.notifier);

    ref.listen(pangramSprintNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showCompletionDialog();
      }
    });

    return GameScaffold(
      title: 'PANGRAM SPRINT',
      subtitle: 'Build a sentence using every letter',
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
          ? const Center(child: CircularProgressIndicator(color: DesignSystem.gameBlue))
          : Column(
              children: [
                const SizedBox(height: DesignSystem.spaceMD),
                _AlphabetGrid(usedLetters: state.lettersUsed),
                const SizedBox(height: DesignSystem.spaceLG),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                    padding: const EdgeInsets.all(DesignSystem.spaceMD),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                      border: Border.all(color: colorScheme.outline, width: 2),
                    ),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          alignment: WrapAlignment.center,
                          children: List.generate(state.selectedWords.length, (index) {
                            return TangibleButton(
                              onTap: () => notifier.deselectWord(index),
                              color: DesignSystem.gameBlue,
                              shadowColor: const Color(0xFF1D4ED8),
                              depth: 2,
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              child: Text(
                                state.selectedWords[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: DesignSystem.spaceMD),
                  child: Icon(Icons.keyboard_arrow_down_rounded, color: DesignSystem.gameBlue),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.center,
                        children: List.generate(state.availableWords.length, (index) {
                          return TangibleButton(
                            onTap: () => notifier.selectWord(index),
                            color: colorScheme.surface,
                            shadowColor: colorScheme.outline,
                            depth: 3,
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            child: Text(
                              state.availableWords[index],
                              style: TextStyle(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: DesignSystem.spaceLG),
              ],
            ),
    );
  }
}

class _AlphabetGrid extends StatelessWidget {
  final Set<String> usedLetters;

  const _AlphabetGrid({required this.usedLetters});

  @override
  Widget build(BuildContext context) {
    const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: Wrap(
        spacing: 4,
        runSpacing: 4,
        alignment: WrapAlignment.center,
        children: alphabet.split('').map((letter) {
          final isUsed = usedLetters.contains(letter.toLowerCase());
          return Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isUsed ? DesignSystem.gameGreen : colorScheme.surface,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: isUsed ? DesignSystem.gameGreen : colorScheme.outline,
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                letter,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isUsed ? Colors.white : colorScheme.onSurface.withValues(alpha: 0.3),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
