import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/user_providers.dart';
import '../../../utils/design_system.dart';
import '../../../utils/haptic_feedback.dart';
import '../../../widgets/tangible.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOutCubic,
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _randomizeName() {
    final randomNames = [
      'Brainiac', 'Logician', 'Mindbender', 'Puzzle Master', 'Enigma', 
      'Cipher', 'Pattern Seeker', 'Thinker', 'Curious Mind', 'Grid Solver', 
      'Theorem', 'Paradox', 'Turing', 'Ada', 'Noether', 'Einstein', 
      'Hypatia', 'Archimedes', 'Euler', 'Galileo', 'Ramanujan'
    ];
    final random = Random();
    final randomName = randomNames[random.nextInt(randomNames.length)];
    _nameController.text = randomName;
    
    // Put cursor at the end of the text
    _nameController.selection = TextSelection.fromPosition(
      TextPosition(offset: randomName.length),
    );
    
    // Light tactile tick
    HapticFeedbackUtil.light();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      HapticFeedbackUtil.victory();
      await ref.read(userDataNotifierProvider.notifier).updateOnboarding(name);
    } else {
      HapticFeedbackUtil.vibrate();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Switch to split dual-column layout on screen widths above 750px
    final bool isWideScreen = screenWidth > 750;
    
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG, vertical: DesignSystem.spaceXL),
            child: Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: isWideScreen ? 920 : 420),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: isWideScreen
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Left Column (Hero Header & Key pillars)
                            Expanded(
                              flex: 6,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _buildHeader(context),
                                  const SizedBox(height: DesignSystem.spaceXL),
                                  _buildPillarsCard(context),
                                ],
                              ),
                            ),
                            const SizedBox(width: DesignSystem.space2XL),
                            // Right Column (Interactive Name Input & Submit)
                            Expanded(
                              flex: 5,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _buildNameForm(context),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildHeader(context),
                            const SizedBox(height: DesignSystem.spaceXL),
                            _buildPillarsCard(context),
                            const SizedBox(height: DesignSystem.spaceXL),
                            _buildNameForm(context),
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Brand / Logo Hero
        Container(
          padding: const EdgeInsets.all(DesignSystem.spaceMD),
          decoration: BoxDecoration(
            color: DesignSystem.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
            border: Border.all(
              color: DesignSystem.primary.withValues(alpha: 0.2),
              width: 3,
            ),
          ),
          child: const Icon(
            Icons.psychology_rounded,
            color: DesignSystem.primary,
            size: 56,
          ),
        ),
        const SizedBox(height: DesignSystem.spaceLG),
        
        // Welcome Title
        Text(
          'YOUR COGNITIVE SANCTUARY',
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: 2.0,
            color: colorScheme.onSurface,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: DesignSystem.spaceSM),
        Text(
          'A calm, elegant space built to hone your daily focus, protect your privacy, and foster cognitive flow.',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.6),
            height: 1.4,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildPillarsCard(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return TangibleContainer(
      radius: DesignSystem.radiusLG,
      padding: const EdgeInsets.all(DesignSystem.spaceLG),
      color: colorScheme.surface,
      child: Column(
        children: [
          _buildPillar(
            context,
            icon: Icons.block_rounded,
            iconColor: DesignSystem.error,
            title: '100% AD-FREE & OFFLINE',
            subtitle: 'Zero distractions, zero banners. Just you and your flow state, anywhere on earth.',
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: DesignSystem.spaceMD),
            child: Divider(height: 1),
          ),
          _buildPillar(
            context,
            icon: Icons.grid_view_rounded,
            iconColor: DesignSystem.gamePurple,
            title: '136+ HANDCRAFTED GAMES',
            subtitle: 'Explore distinct visual challenges across Logic, Spatial, Attention, Memory, and Math.',
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: DesignSystem.spaceMD),
            child: Divider(height: 1),
          ),
          _buildPillar(
            context,
            icon: Icons.code_rounded,
            iconColor: DesignSystem.success,
            title: 'OPEN SOURCE & CLEAN',
            subtitle: 'No data collection. No telemetry. Fully transparent software, owned by the community.',
          ),
        ],
      ),
    );
  }

  Widget _buildNameForm(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "WHAT SHOULD WE CALL YOU?",
            textAlign: TextAlign.center,
            style: theme.textTheme.labelLarge?.copyWith(
              letterSpacing: 1.5,
              color: colorScheme.onSurface.withValues(alpha: 0.6),
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: DesignSystem.spaceSM),
          
          // Tactile Text Input Box with Randomize Shuffle Button
          TangibleContainer(
            radius: DesignSystem.radiusMD,
            padding: const EdgeInsets.only(left: DesignSystem.spaceMD),
            color: colorScheme.surface,
            child: TextFormField(
              controller: _nameController,
              textCapitalization: TextCapitalization.words,
              maxLength: 15,
              style: TextStyle(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                hintText: 'ENTER YOUR NAME...',
                hintStyle: TextStyle(
                  color: colorScheme.onSurface.withValues(alpha: 0.3),
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.0,
                ),
                suffixIcon: Tooltip(
                  message: 'Randomize Name',
                  child: IconButton(
                    icon: const Icon(
                      Icons.casino_rounded,
                      color: DesignSystem.primary,
                      size: 24,
                    ),
                    onPressed: _randomizeName,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'PLEASE ENTER A NAME';
                }
                if (value.trim().length < 2) {
                  return 'NAME IS TOO SHORT';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: DesignSystem.spaceLG),
          
          // Tangible Submit Button
          TangibleButton(
            onTap: _submit,
            color: DesignSystem.primary,
            shadowColor: DesignSystem.primaryShadow,
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: const Center(
              child: Text(
                'BEGIN MY JOURNEY',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPillar(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 20,
          ),
        ),
        const SizedBox(width: DesignSystem.spaceMD),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: colorScheme.onSurface,
                  letterSpacing: 0.8,
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.5),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
