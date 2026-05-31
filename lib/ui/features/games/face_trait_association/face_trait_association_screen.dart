import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/tangible.dart';
import 'face_trait_association_provider.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../../widgets/game_completion_dialog.dart';

class FaceTraitAssociationScreen extends ConsumerWidget {
  const FaceTraitAssociationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(faceTraitAssociationNotifierProvider);

    ref.listen(faceTraitAssociationNotifierProvider, (previous, next) {
      if (next.phase == GamePhase.result && previous?.phase != GamePhase.result) {
        _showResultDialog(context, ref, next);
      }
    });

    return GameScaffold(
      title: l10n.faceTraitAssociationTitle.toUpperCase(),
      subtitle: l10n.faceTraitAssociationSubtitle,
      body: _buildBody(context, ref, state),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, FaceTraitAssociationState state) {
    switch (state.phase) {
      case GamePhase.study:
        return _buildStudyPhase(context, ref, state);
      case GamePhase.test:
        return _buildTestPhase(context, ref, state);
      case GamePhase.result:
        return const Center(child: CircularProgressIndicator());
    }
  }

  Widget _buildStudyPhase(BuildContext context, WidgetRef ref, FaceTraitAssociationState state) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: DesignSystem.spaceMD),
          child: Text(
            l10n.faceTraitAssociationMemorize,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 1.2),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: DesignSystem.spaceMD,
                mainAxisSpacing: DesignSystem.spaceMD,
                childAspectRatio: 0.75,
              ),
              itemCount: state.trials.length,
              itemBuilder: (context, index) {
                final face = state.trials[index];
                return TangibleContainer(
                  padding: const EdgeInsets.all(DesignSystem.spaceMD),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(face.imageUrl, style: const TextStyle(fontSize: 40)),
                      const SizedBox(height: DesignSystem.spaceMD),
                      Text(
                        face.name.toUpperCase(),
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: DesignSystem.spaceSM),
                      _buildTraitRow(Icons.work_rounded, face.occupation, fontSize: 12, iconSize: 14),
                      const SizedBox(height: 4),
                      _buildTraitRow(Icons.favorite_rounded, face.hobby, fontSize: 12, iconSize: 14),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(DesignSystem.spaceLG),
          child: TangibleButton(
            onTap: () {
              HapticFeedbackUtil.heavyImpact();
              ref.read(faceTraitAssociationNotifierProvider.notifier).startTest();
            },
            child: Center(
              child: Text(
                l10n.arithmeticChainStart.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTraitRow(IconData icon, String text, {double fontSize = 18, double iconSize = 20}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: iconSize, color: DesignSystem.primary),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildTestPhase(BuildContext context, WidgetRef ref, FaceTraitAssociationState state) {
    final l10n = AppLocalizations.of(context)!;
    final face = state.trials[state.currentIndex];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(DesignSystem.spaceLG),
      child: Column(
        children: [
          Text(
            l10n.faceTraitAssociationPersonOf(state.currentIndex + 1, state.trials.length),
            style: const TextStyle(fontWeight: FontWeight.w900, color: DesignSystem.primary),
          ),
          const SizedBox(height: DesignSystem.spaceLG),
          TangibleContainer(
            padding: const EdgeInsets.all(DesignSystem.spaceLG),
            child: Column(
              children: [
                Text(face.imageUrl, style: const TextStyle(fontSize: 60)),
                const SizedBox(height: DesignSystem.spaceMD),
                Text(
                  face.name.toUpperCase(),
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          const SizedBox(height: DesignSystem.spaceXL),
          Text(l10n.faceTraitAssociationWhatOccupation, style: const TextStyle(fontWeight: FontWeight.w900)),
          const SizedBox(height: DesignSystem.spaceMD),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: state.occupationOptions.map((opt) {
              final isSelected = state.selectedOccupation == opt;
              return TangibleButton(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                depth: isSelected ? 0.0 : 4.0,
                color: isSelected ? DesignSystem.primary : Theme.of(context).colorScheme.surface,
                onTap: () => ref.read(faceTraitAssociationNotifierProvider.notifier).selectOccupation(opt),
                child: Text(opt, style: TextStyle(fontSize: 14, color: isSelected ? Colors.white : null)),
              );
            }).toList(),
          ),
          const SizedBox(height: DesignSystem.spaceXL),
          Text(l10n.faceTraitAssociationWhatHobby, style: const TextStyle(fontWeight: FontWeight.w900)),
          const SizedBox(height: DesignSystem.spaceMD),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: state.hobbyOptions.map((opt) {
              final isSelected = state.selectedHobby == opt;
              return TangibleButton(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                depth: isSelected ? 0.0 : 4.0,
                color: isSelected ? DesignSystem.primary : Theme.of(context).colorScheme.surface,
                onTap: () => ref.read(faceTraitAssociationNotifierProvider.notifier).selectHobby(opt),
                child: Text(opt, style: TextStyle(fontSize: 14, color: isSelected ? Colors.white : null)),
              );
            }).toList(),
          ),
          const SizedBox(height: DesignSystem.spaceXL),
          TangibleButton(
            onTap: (state.selectedOccupation != null && state.selectedHobby != null)
                ? () {
                    HapticFeedbackUtil.selectionClick();
                    ref.read(faceTraitAssociationNotifierProvider.notifier).submitAnswer();
                  }
                : null,
            color: (state.selectedOccupation != null && state.selectedHobby != null)
                ? DesignSystem.accentGreen
                : Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
            child: Center(
              child: Text(
                l10n.finish.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showResultDialog(BuildContext context, WidgetRef ref, FaceTraitAssociationState state) {
    final l10n = AppLocalizations.of(context)!;
    final won = state.correctCount == state.trials.length;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? l10n.faceTraitAssociationWinTitle : l10n.faceTraitAssociationLoseTitle,
        message: l10n.faceTraitAssociationScoreMessage(state.correctCount, state.trials.length),
        onPlayAgain: () {
          Navigator.pop(context);
          ref.read(faceTraitAssociationNotifierProvider.notifier).reset();
        },
        onHome: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
    );
  }
}
