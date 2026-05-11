import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? 'PERFECT!' : 'GAME OVER',
        message: isVictory 
            ? 'You have a great memory for faces and names!' 
            : 'You got ${ref.read(faceNameAssociationNotifierProvider).correctCount} out of ${ref.read(faceNameAssociationNotifierProvider).studyFaces.length} correct.',
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
      return const GameScaffold(
        title: 'Face-Name',
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Face-Name',
      subtitle: state.phase == FaceNamePhase.study 
          ? 'Memorize the name for each face' 
          : 'Who is this?',
      body: Padding(
        padding: const EdgeInsets.all(DesignSystem.spaceLG),
        child: state.phase == FaceNamePhase.study 
            ? _buildStudyPhase(state, notifier)
            : _buildTestingPhase(state, notifier),
      ),
    );
  }

  Widget _buildStudyPhase(FaceNameState state, FaceNameAssociationNotifier notifier) {
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
          child: const Text(
            'START TEST',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
          backgroundColor: DesignSystem.outline,
          valueColor: const AlwaysStoppedAnimation<Color>(DesignSystem.primary),
        ),
        const SizedBox(height: DesignSystem.spaceXL),
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
                  color: DesignSystem.surface,
                  shadowColor: DesignSystem.outlineVariant,
                  child: Text(
                    option,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: DesignSystem.ink),
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
        color: DesignSystem.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: DesignSystem.outlineVariant, width: 2),
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
            child: Icon(face.icon, size: large ? 80 : 48, color: DesignSystem.ink.withValues(alpha: 0.7)),
          ),
          if (showName) ...[
            const SizedBox(height: DesignSystem.spaceMD),
            Text(
              face.name,
              style: TextStyle(
                fontSize: large ? 24 : 18,
                fontWeight: FontWeight.w900,
                color: DesignSystem.ink,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
