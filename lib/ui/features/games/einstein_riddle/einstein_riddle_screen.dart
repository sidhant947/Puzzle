import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'einstein_riddle_provider.dart';

class EinsteinRiddleScreen extends ConsumerStatefulWidget {
  const EinsteinRiddleScreen({super.key});

  @override
  ConsumerState<EinsteinRiddleScreen> createState() => _EinsteinRiddleScreenState();
}

class _EinsteinRiddleScreenState extends ConsumerState<EinsteinRiddleScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(einsteinRiddleNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.congrats,
        message: l10n.completed,
        isVictory: true,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(einsteinRiddleNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(einsteinRiddleNotifierProvider);
    final notifier = ref.read(einsteinRiddleNotifierProvider.notifier);

    ref.listen(einsteinRiddleNotifierProvider, (previous, next) {
      if (next.isVictory && !(previous?.isVictory ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('einstein_riddle');
        _showCompletionDialog();
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.einsteinRiddleTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: l10n.einsteinRiddleTitle,
      subtitle: l10n.einsteinRiddleSubtitle,
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          padding: const EdgeInsets.all(8),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(l10n.howToPlay),
                content: Text(l10n.einsteinRiddleHowToPlay),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(l10n.gotIt),
                  ),
                ],
              ),
            );
          },
          child: Icon(Icons.help_outline, color: colorScheme.onSurface),
        ),
      ],
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(DesignSystem.spaceLG),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildGrid(state, notifier),
                  const SizedBox(height: DesignSystem.spaceXL),
                  _buildClues(state),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid(EinsteinRiddleState state, EinsteinRiddleNotifier notifier) {
    final l10n = AppLocalizations.of(context)!;
    final houses = state.options['House']!;
    final categories = state.categories.where((c) => c != 'House').toList();

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Table(
        border: TableBorder.all(color: Theme.of(context).colorScheme.outline, width: 0.5),
        children: [
          TableRow(
            children: [
              _Cell(text: _translateCategory('House', l10n), isHeader: true),
              ...houses.map((h) => _Cell(text: h, isHeader: true)),
            ],
          ),
          ...categories.map((cat) {
            return TableRow(
              children: [
                _Cell(text: _translateCategory(cat, l10n), isHeader: true),
                ...houses.map((house) {
                  final value = state.userSolution[house]![cat] ?? '-';
                  return GestureDetector(
                    onTap: () => _showPicker(context, _translateCategory(cat, l10n), state.options[cat]!, (val) {
                      notifier.updateAssignment(house, cat, val);
                    }),
                    child: _Cell(text: value),
                  );
                }),
              ],
            );
          }),
        ],
      ),
    );
  }

  String _translateCategory(String cat, AppLocalizations l10n) {
    switch (cat) {
      case 'Color': return l10n.einsteinRiddleColor;
      case 'Nationality': return l10n.einsteinRiddleNationality;
      case 'Drink': return l10n.einsteinRiddleDrink;
      case 'Pet': return l10n.einsteinRiddlePet;
      case 'Cigar': return l10n.einsteinRiddleSmoke;
      case 'House': return l10n.einsteinRiddleHouse;
      default: return cat;
    }
  }

  Widget _buildClues(EinsteinRiddleState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "CLUES",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        const SizedBox(height: DesignSystem.spaceSM),
        ...state.clues.map((clue) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("• ", style: TextStyle(fontWeight: FontWeight.bold)),
              Expanded(child: Text(clue)),
            ],
          ),
        )),
      ],
    );
  }

  void _showPicker(BuildContext context, String title, List<String> options, Function(String) onSelect) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(options[index]),
                      onTap: () {
                        onSelect(options[index]);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Cell extends StatelessWidget {
  final String text;
  final bool isHeader;

  const _Cell({required this.text, this.isHeader = false});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(4),
      height: 60,
      alignment: Alignment.center,
      color: isHeader ? colorScheme.surfaceContainerHighest : null,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
