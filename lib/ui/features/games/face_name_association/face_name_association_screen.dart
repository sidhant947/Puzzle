import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'face_name_association_provider.dart';
import 'face_name_association_engine.dart';

class FaceNameAssociationScreen extends ConsumerStatefulWidget {
  const FaceNameAssociationScreen({super.key});

  @override
  ConsumerState<FaceNameAssociationScreen> createState() => _FaceNameAssociationScreenState();
}

class _FaceNameAssociationScreenState extends ConsumerState<FaceNameAssociationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(faceNameAssociationNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(bool isVictory) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(faceNameAssociationNotifierProvider);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? l10n.faceNameAssociationPerfect : l10n.faceNameAssociationGameOver,
        message: isVictory 
            ? l10n.faceNameAssociationWinMessage
            : l10n.faceNameAssociationLoseMessage(state.correctCount, state.studyFaces.length),
        isVictory: isVictory,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(faceNameAssociationNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(faceNameAssociationNotifierProvider);
    final notifier = ref.read(faceNameAssociationNotifierProvider.notifier);
    final l10n = AppLocalizations.of(context)!;

    ref.listen(faceNameAssociationNotifierProvider, (previous, next) async {
      if (next.phase == FaceNamePhase.result && previous?.phase != FaceNamePhase.result) {
        final isVictory = next.correctCount == next.studyFaces.length;
        if (isVictory) {
          HapticFeedbackUtil.victory();
          await ref.read(gameStreakNotifierProvider.notifier).completeGame('face_name_association');
        } else {
          HapticFeedbackUtil.vibrate();
        }
        if (!context.mounted) return;
        _showCompletionDialog(isVictory);
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.faceNameAssociationTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: l10n.faceNameAssociationTitle,
      subtitle: state.phase == FaceNamePhase.study 
          ? l10n.faceNameAssociationSubtitleStudy 
          : l10n.faceNameAssociationSubtitleTest,
      body: Padding(
        padding: const EdgeInsets.all(DesignSystem.spaceLG),
        child: state.phase == FaceNamePhase.study 
            ? _buildStudyPhase(state, notifier, l10n)
            : _buildTestingPhase(state, notifier),
      ),
    );
  }

  Widget _buildStudyPhase(FaceNameState state, FaceNameAssociationNotifier notifier, AppLocalizations l10n) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: DesignSystem.spaceMD,
              mainAxisSpacing: DesignSystem.spaceMD,
              childAspectRatio: 0.8,
            ),
            itemCount: state.studyFaces.length,
            itemBuilder: (context, index) {
              final face = state.studyFaces[index];
              return _buildFaceCard(face, showName: true);
            },
          ),
        ),
        const SizedBox(height: DesignSystem.spaceLG),
        TangibleButton(
          onTap: notifier.startTesting,
          color: DesignSystem.primary,
          child: Text(
            l10n.faceNameAssociationStartTest,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildTestingPhase(FaceNameState state, FaceNameAssociationNotifier notifier) {
    final face = state.studyFaces[state.currentTestIndex];
    return Column(
      children: [
        LinearProgressIndicator(
          value: (state.currentTestIndex) / state.studyFaces.length,
          backgroundColor: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
          valueColor: const AlwaysStoppedAnimation<Color>(DesignSystem.primary),
        ),
        SizedBox(height: DesignSystem.spaceXL),
        Expanded(
          flex: 2,
          child: Center(
            child: _buildFaceCard(face, showName: false, large: true),
          ),
        ),
        const SizedBox(height: DesignSystem.spaceXL),
        Expanded(
          flex: 3,
          child: Column(
            children: state.currentOptions.map((option) {
              return Padding(
                padding: const EdgeInsets.only(bottom: DesignSystem.spaceMD),
                child: TangibleButton(
                  onTap: () => notifier.onOptionSelected(option),
                  color: Theme.of(context).colorScheme.surface,
                  shadowColor: Theme.of(context).colorScheme.outline,
                  child: Text(
                    option,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildFaceCard(FaceData face, {bool showName = true, bool large = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: Theme.of(context).colorScheme.outline, width: 2),
      ),
      padding: const EdgeInsets.all(DesignSystem.spaceMD),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(large ? DesignSystem.spaceLG : DesignSystem.spaceMD),
            decoration: BoxDecoration(
              color: face.color,
              shape: BoxShape.circle,
            ),
            child: Icon(face.icon, size: large ? 80 : 48, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7)),
          ),
          if (showName) ...[
            SizedBox(height: DesignSystem.spaceMD),
            Text(
              face.name,
              style: TextStyle(
                fontSize: large ? 24 : 18,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
