import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
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
      ref.read(gameStreakNotifierProvider.notifier).completeGame('cryptogram');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'CODE BROKEN!' : 'ENCRYPTED',
        message: won ? 'You decoded the message perfectly.' : 'Try again.',
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
    final state = ref.watch(cryptogramNotifierProvider);
    final notifier = ref.read(cryptogramNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(cryptogramNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.isGameWon);
      }
    });

    return GameScaffold(
      title: 'CRYPTOGRAM',
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('Assign letters to decode the secret message!'),
                    const SizedBox(height: 30),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 20,
                          alignment: WrapAlignment.center,
                          children: _buildQuoteWidgets(state, notifier, theme),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildKeyboard(notifier, theme, state.userMapping),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
    );
  }

  List<Widget> _buildQuoteWidgets(CryptogramState state, CryptogramNotifier notifier, ThemeData theme) {
    List<Widget> widgets = [];
    final words = state.encodedQuote.split(' ');

    for (var word in words) {
      widgets.add(
        Wrap(
          spacing: 4,
          children: word.split('').map((char) {
            if ("ABCDEFGHIJKLMNOPQRSTUVWXYZ".contains(char)) {
              final isSelected = state.selectedLetter == char;
              final assigned = state.userMapping[char];
              return GestureDetector(
                onTap: () => notifier.selectLetter(char),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      assigned ?? '_',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: assigned != null ? theme.colorScheme.primary : Colors.grey.withValues(alpha: 0.5),
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 30,
                      decoration: BoxDecoration(
                        color: isSelected ? theme.colorScheme.primaryContainer : theme.colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: isSelected ? theme.colorScheme.primary : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          char,
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: isSelected ? theme.colorScheme.onPrimaryContainer : theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(char, style: theme.textTheme.headlineSmall),
              );
            }
          }).toList(),
        ),
      );
    }
    return widgets;
  }

  Widget _buildKeyboard(CryptogramNotifier notifier, ThemeData theme, Map<String, String> mapping) {
    const rows = [
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['Z', 'X', 'C', 'V', 'B', 'N', 'M', 'CLR'],
    ];

    final assignedLetters = mapping.values.toSet();

    return Column(
      children: rows.map((row) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: row.map((letter) {
              if (letter == 'CLR') {
                return _KeyButton(
                  label: '⌫',
                  onTap: notifier.clearAssignment,
                  color: DesignSystem.gameRose,
                );
              }
              final isUsed = assignedLetters.contains(letter);
              return _KeyButton(
                label: letter,
                onTap: () => notifier.assignLetter(letter),
                isUsed: isUsed,
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}

class _KeyButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isUsed;
  final Color? color;

  const _KeyButton({required this.label, required this.onTap, this.isUsed = false, this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          width: 34,
          height: 44,
          decoration: BoxDecoration(
            color: color?.withValues(alpha: 0.1) ?? (isUsed ? Colors.grey.withValues(alpha: 0.1) : theme.colorScheme.surface),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: color ?? theme.colorScheme.outline.withValues(alpha: 0.2)),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color ?? (isUsed ? Colors.grey : theme.colorScheme.onSurface),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
