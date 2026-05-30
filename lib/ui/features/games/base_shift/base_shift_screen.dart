import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'base_shift_provider.dart';

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

    ref.listen(baseShiftNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'MATH WIZARD!',
            message: 'You correctly solved 5 base-shift equations!',
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
        title: 'BASE SHIFT BLITZ',
        subtitle: 'Solve in decimal',
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final level = state.currentLevel!;

    return GameScaffold(
      title: 'BASE SHIFT BLITZ',
      subtitle: 'Solve the equation and type the answer in decimal (Base 10).',
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
                    'EQUATION',
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
                hintText: 'Enter decimal result...',
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
                state.message!,
                style: TextStyle(
                  color: state.message == 'Correct!' ? DesignSystem.accentEmerald : colorScheme.error,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            const SizedBox(height: DesignSystem.spaceLG),
            TangibleButton(
              onTap: () => ref.read(baseShiftNotifierProvider.notifier).submitAnswer(_controller.text),
              color: colorScheme.primary,
              child: const Text('SUBMIT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: DesignSystem.spaceXL),
            TangibleContainer(
              depth: 2.0,
              color: colorScheme.surface,
              padding: const EdgeInsets.all(DesignSystem.spaceMD),
              child: const Column(
                children: [
                  Text('Quick Guide:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Binary (bin): Base 2 (0, 1)'),
                  Text('Hexadecimal (0x): Base 16 (0-9, A-F)'),
                  Text('Decimal (dec): Base 10 (0-9)'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
