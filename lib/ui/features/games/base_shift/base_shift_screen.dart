import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'base_shift_provider.dart';
import 'package:puzzle/l10n/app_localizations.dart';

class BaseShiftScreen extends ConsumerStatefulWidget {
  const BaseShiftScreen({super.key});

  @override
  ConsumerState<BaseShiftScreen> createState() => _BaseShiftScreenState();
}

class _BaseShiftScreenState extends ConsumerState<BaseShiftScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(baseShiftNotifierProvider.notifier).initGame();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(baseShiftNotifierProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    ref.listen(baseShiftNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: l10n.baseShiftWinTitle,
            message: l10n.baseShiftWinMessage,
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(baseShiftNotifierProvider.notifier).reset();
              _controller.clear();
              Navigator.of(context).pop();
            },
          ),
        );
      }
      if (next.currentLevel != previous?.currentLevel) {
        _controller.clear();
      }
    });

    if (state.isLoading || state.currentLevel == null) {
      return GameScaffold(
        title: l10n.baseShiftTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final level = state.currentLevel!;

    return GameScaffold(
      title: l10n.baseShiftTitle,
      subtitle: l10n.baseShiftSubtitle,
      onReset: () {
        HapticFeedbackUtil.mediumImpact();
        ref.read(baseShiftNotifierProvider.notifier).reset();
      },
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DesignSystem.spaceLG),
        child: Column(
          children: [
            TangibleContainer(
              depth: 4.0,
              color: colorScheme.surface,
              padding: const EdgeInsets.all(DesignSystem.spaceLG),
              child: Column(
                children: [
                  Text(
                    l10n.baseShiftEquation,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: colorScheme.primary),
                  ),
                  const SizedBox(height: DesignSystem.spaceSM),
                  Text(
                    level.expression,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
            const SizedBox(height: DesignSystem.spaceXL),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: l10n.baseShiftHint,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: colorScheme.surface,
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              onSubmitted: (val) => ref.read(baseShiftNotifierProvider.notifier).submitAnswer(val),
            ),
            const SizedBox(height: DesignSystem.spaceLG),
            if (state.message != null)
              Text(
                state.message == 'correct' ? l10n.baseShiftCorrect : l10n.baseShiftIncorrect,
                style: TextStyle(
                  color: state.message == 'correct' ? DesignSystem.accentEmerald : colorScheme.error,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            const SizedBox(height: DesignSystem.spaceLG),
            TangibleButton(
              onTap: () => ref.read(baseShiftNotifierProvider.notifier).submitAnswer(_controller.text),
              color: colorScheme.primary,
              child: Text(l10n.baseShiftSubmit, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: DesignSystem.spaceXL),
            TangibleContainer(
              depth: 2.0,
              color: colorScheme.surface,
              padding: const EdgeInsets.all(DesignSystem.spaceMD),
              child: Column(
                children: [
                  Text(l10n.baseShiftQuickGuide, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(l10n.baseShiftBinary),
                  Text(l10n.baseShiftHex),
                  Text(l10n.baseShiftDecimal),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
