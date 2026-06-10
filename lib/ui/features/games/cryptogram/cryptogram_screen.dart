import "package:puzzle/l10n/app_localizations.dart";
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../providers/user_providers.dart';
import 'cryptogram_provider.dart';

class CryptogramScreen extends ConsumerStatefulWidget {
  const CryptogramScreen({super.key});

  @override
  ConsumerState<CryptogramScreen> createState() => _CryptogramScreenState();
}

class _CryptogramScreenState extends ConsumerState<CryptogramScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(cryptogramNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(bool won) {
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('cryptogram');
    } else {
      HapticFeedbackUtil.error();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'CODE BROKEN!' : 'ENCRYPTED',
        message: won ? 'You decoded the message perfectly.' : 'Try again to break the encryption.',
        onPlayAgain: () {
          ref.read(cryptogramNotifierProvider.notifier).initGame();
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
    final state = ref.watch(cryptogramNotifierProvider);
    final notifier = ref.read(cryptogramNotifierProvider.notifier);

    ref.listen(cryptogramNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.isGameWon);
      }
    });

    return GameScaffold(
      title: l10n.cryptogramTitle.toUpperCase(),
      subtitle: l10n.cryptogramSubtitle,
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.initGame();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded, size: 20, color: colorScheme.onSurface),
        ),
      ],
      body: state.isLoading
          ? Center(child: CircularProgressIndicator())
          : LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.5),
                          child: TangibleContainer(
                            color: colorScheme.onSurface,
                            shadowColor: colorScheme.onSurface.withValues(alpha: 0.7),
                            depth: 4.0,
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: colorScheme.surface,
                                borderRadius: BorderRadius.circular(DesignSystem.radiusLG - 4),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(DesignSystem.radiusLG - 4),
                                child: SingleChildScrollView(
                                  padding: const EdgeInsets.all(DesignSystem.spaceMD),
                                  physics: const BouncingScrollPhysics(),
                                  child: Wrap(
                                    spacing: 6,
                                    runSpacing: 16,
                                    alignment: WrapAlignment.center,
                                    children: _buildQuoteWidgets(state, notifier),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: DesignSystem.spaceMD),
                    _buildKeyboard(notifier, state.userMapping),
                    const SizedBox(height: DesignSystem.spaceLG),
                  ],
                );
              },
            ),
    );
  }

  List<Widget> _buildQuoteWidgets(CryptogramState state, CryptogramNotifier notifier) {
    List<Widget> widgets = [];
    final words = state.encodedQuote.split(' ');

    for (var word in words) {
      widgets.add(
        Wrap(
          spacing: 2,
          children: word.split('').map((char) {
            if ("ABCDEFGHIJKLMNOPQRSTUVWXYZ".contains(char)) {
              final isSelected = state.selectedLetter == char;
              final assigned = state.userMapping[char];
              return GestureDetector(
                onTap: () {
                  HapticFeedbackUtil.selectionClick();
                  notifier.selectLetter(char);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 24,
                      child: FittedBox(
                        child: Text(
                          assigned ?? '_',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: assigned != null ? DesignSystem.primary : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    TangibleContainer(
                      depth: isSelected ? 1.0 : 3.0,
                      radius: DesignSystem.radiusXS,
                      color: isSelected ? DesignSystem.primary.withValues(alpha: 0.1) : Theme.of(context).scaffoldBackgroundColor,
                      shadowColor: isSelected ? DesignSystem.primary : Theme.of(context).colorScheme.outline,
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      child: Text(
                        char,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                          color: isSelected ? DesignSystem.primary : Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  char, 
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              );
            }
          }).toList(),
        ),
      );
    }
    return widgets;
  }

  Widget _buildKeyboard(CryptogramNotifier notifier, Map<String, String> mapping) {
    const rows = [
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['Z', 'X', 'C', 'V', 'B', 'N', 'M', 'DEL'],
    ];

    final assignedLetters = mapping.values.toSet();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: rows.map((row) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: row.map((letter) {
                if (letter == 'DEL') {
                  return Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: TangibleButton(
                        color: DesignSystem.accentBerry,
                        shadowColor: const Color(0xFFBE185D),
                        padding: EdgeInsets.zero,
                        onTap: () {
                          HapticFeedbackUtil.mediumImpact();
                          notifier.clearAssignment();
                        },
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          child: const Icon(Icons.backspace_rounded, color: Colors.white, size: 16),
                        ),
                      ),
                    ),
                  );
                }
                final isUsed = assignedLetters.contains(letter);
                return Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: TangibleButton(
                      color: isUsed ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).colorScheme.surface,
                      shadowColor: Theme.of(context).colorScheme.outline,
                      padding: EdgeInsets.zero,
                      onTap: () {
                        HapticFeedbackUtil.selectionClick();
                        notifier.assignLetter(letter);
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          letter,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: isUsed ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3) : Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        }).toList(),
      ),
    );
  }
}
