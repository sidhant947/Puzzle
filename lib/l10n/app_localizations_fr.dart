// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Puzzle Hub';

  @override
  String get home => 'Accueil';

  @override
  String get settings => 'Paramètres';

  @override
  String get playAgain => 'Rejouer';

  @override
  String get seeCompleted => 'Revoir le Puzzle';

  @override
  String get finish => 'Terminer';

  @override
  String get congrats => 'Félicitations';

  @override
  String get perfectGradient => 'Dégradé Parfait !';

  @override
  String get wellDone => 'Bien joué';

  @override
  String get timeUp => 'Temps écoulé !';

  @override
  String get completed => 'Terminé !';

  @override
  String get score => 'Score';

  @override
  String get timeLeft => 'Temps';

  @override
  String get trials => 'Essais';

  @override
  String get numberRule => 'Règle du Nombre';

  @override
  String get colorRule => 'Règle de la Couleur';

  @override
  String get valid => 'Valide';

  @override
  String get invalid => 'Invalide';

  @override
  String get even => 'Pair';

  @override
  String get odd => 'Impair';

  @override
  String get red => 'Rouge';

  @override
  String get green => 'Vert';

  @override
  String get blue => 'Bleu';

  @override
  String get yes => 'Oui';

  @override
  String get no => 'Non';

  @override
  String get trueLabel => 'Vrai';

  @override
  String get falseLabel => 'Faux';

  @override
  String get clear => 'Effacer';

  @override
  String get north => 'Nord';

  @override
  String get south => 'Sud';

  @override
  String get east => 'Est';

  @override
  String get west => 'Ouest';

  @override
  String get target => 'Cible';

  @override
  String get moves => 'Mouvements';

  @override
  String get trialMode => 'Mode Essai';

  @override
  String get trialModeDescription =>
      'Résolvez 20 pour terminer au lieu du minuteur de 60s';

  @override
  String get appearance => 'Apparence';

  @override
  String get language => 'Langue';

  @override
  String get gameplay => 'Gameplay';

  @override
  String get supportUs => 'Soutenez-nous';

  @override
  String get systemLegal => 'Système & Légal';

  @override
  String get games => 'Jeux';

  @override
  String get solvedToday => 'Résolus Aujourd\'hui';

  @override
  String get searchGames => 'Rechercher des jeux...';

  @override
  String get readyToStart => 'PRÊT À ENTRAÎNER VOTRE CERVEAU ?';

  @override
  String get greatStart => 'BON DÉBUT ! CONTINUEZ SUR VOTRE LANCÉE.';

  @override
  String get onFire => 'EN FEU ! VOTRE CERVEAU ADORE ÇA.';

  @override
  String get incredible => 'INCROYABLE ! VOUS ÊTES UN MAÎTRE DES PUZZLES.';

  @override
  String get noGamesMatch => 'AUCUN JEU NE CORRESPOND À VOTRE RECHERCHE';

  @override
  String get categoryAll => 'TOUT';

  @override
  String get categoryAttention => 'ATTENTION';

  @override
  String get categoryLogic => 'LOGIQUE';

  @override
  String get categoryMath => 'MATHS';

  @override
  String get categoryWord => 'MOTS';

  @override
  String get categoryMemory => 'MÉMOIRE';

  @override
  String get categorySpatial => 'SPATIAL';

  @override
  String get themeLight => 'CLAIR';

  @override
  String get themeDark => 'SOMBRE';

  @override
  String get themeSystem => 'SYSTÈME';

  @override
  String get starOnGithub => 'Soutenir sur GitHub';

  @override
  String get sponsorOnGithub => 'Sponsoriser sur GitHub';

  @override
  String get privacyPolicy => 'Politique de Confidentialité';

  @override
  String get termsOfService => 'Conditions d\'Utilisation';

  @override
  String get licenses => 'Licences';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return 'Vous avez $maxTries essais pour trouver le mot caché de $wordLength lettres.';
  }

  @override
  String wordFoundMessage(String word) {
    return 'Mot trouvé avec succès : $word';
  }

  @override
  String gameOverMessage(String word) {
    return 'Le mot était : $word';
  }

  @override
  String get gameOver => 'Partie Terminée';

  @override
  String get crosswordTitle => 'Mots Croisés';

  @override
  String get crosswordSubtitle =>
      'Complétez la grille avec les bons mots selon les indices fournis.';

  @override
  String get wordSearchTitle => 'Mots Cachés';

  @override
  String get radicalRootsTitle => 'Radical Roots';

  @override
  String get radicalRootsSubtitle =>
      'Find the square or cube root of the given number. Round to the nearest integer if necessary.';

  @override
  String get radicalRootsGoalReached => 'Goal Reached!';

  @override
  String get radicalRootsTimeUp => 'Time\'s Up!';

  @override
  String radicalRootsScoreMessage(int score) {
    return 'You calculated $score roots correctly!';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return 'Keep practicing! You calculated $score roots.';
  }

  @override
  String get radicalRootsStart => 'Start Calculating';

  @override
  String get radicalRootsDescription =>
      'You have 60 seconds to solve as many as you can.';

  @override
  String get radicalRootsBest => 'Best';

  @override
  String get radicalRootsSeconds => '60 SECONDS';

  @override
  String get romanArithmeticTitle => 'Roman Arithmetic';

  @override
  String get romanArithmeticSubtitle =>
      'Solve addition and subtraction problems using Roman Numerals.';

  @override
  String get romanArithmeticGoalReached => 'Centurion Level!';

  @override
  String get romanArithmeticTimeUp => 'Time\'s Up!';

  @override
  String romanArithmeticScoreMessage(int score) {
    return 'You solved $score Roman problems!';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return 'Veni, Vidi, Vici! You solved $score problems.';
  }

  @override
  String get romanArithmeticStart => 'Begin Quest';

  @override
  String get romanArithmeticDescription =>
      'Convert and solve. You have 60 seconds.';

  @override
  String get romanArithmeticBest => 'Best';

  @override
  String get romanArithmeticSeconds => '60 SECONDS';

  @override
  String get wordSearchSubtitle =>
      'Trouvez tous les mots cachés dans la grille. Glissez pour sélectionner.';

  @override
  String get missingVowelsTitle => 'Voyelles Manquantes';

  @override
  String get missingVowelsSubtitle =>
      'Identifiez le mot dont les voyelles sont cachées.';

  @override
  String get missingVowelsWin => 'Voyelles Restaurées !';

  @override
  String get missingVowelsHowToPlay =>
      'Un mot est affiché avec ses voyelles (A, E, I, O, U) cachées. Devinez le mot complet !';

  @override
  String get wordScrambleTitle => 'Mots Mélangés';

  @override
  String get wordScrambleSubtitle =>
      'Appuyez sur les lettres pour déchiffrer le mot caché !';

  @override
  String get wordScrambleWin => 'Mot Déchiffré !';

  @override
  String get sudokuTitle => 'Sudoku';

  @override
  String get sudokuSubtitle =>
      'Complétez la grille pour que chaque ligne, colonne et carré de 3x3 contienne tous les chiffres de 1 à 9.';

  @override
  String get minesweeperTitle => 'Démineur';

  @override
  String get minesweeperSubtitle =>
      'Identifiez toutes les mines sans les déclencher.';

  @override
  String get minesweeperWin => 'Victoire !';

  @override
  String get minesweeperMines => 'MINES';

  @override
  String get minesweeperStatus => 'STATUT';

  @override
  String get minesweeperWon => 'GAGNÉ';

  @override
  String get minesweeperBoom => 'BOOM';

  @override
  String get minesweeperPlaying => 'EN COURS';

  @override
  String get minesweeperReveal => 'RÉVÉLER';

  @override
  String get minesweeperFlag => 'DRAPEAU';

  @override
  String get game2048Title => '2048';

  @override
  String get game2048Subtitle =>
      'Glissez dans n\'importe quelle direction pour fusionner les tuiles et atteindre la tuile 2048 !';

  @override
  String get nonogramTitle => 'Nonogramme';

  @override
  String get nonogramSubtitle =>
      'Révélez l\'image cachée en utilisant des indices logiques.';

  @override
  String get nonogramWin => 'Image Révélée !';

  @override
  String get pathFinderTitle => 'Chercheur de Chemin';

  @override
  String get pathFinderSubtitle => 'Trouvez le chemin caché de S à E.';

  @override
  String get pathFinderWin => 'Chemin Maîtrisé !';

  @override
  String get howToPlay => 'Comment Jouer';

  @override
  String get gotIt => 'Compris';

  @override
  String get akariTitle => 'Akari';

  @override
  String get akariSubtitle => 'Illuminez toutes les cellules blanches';

  @override
  String get akariHowToPlay =>
      'Placez des ampoules dans les cellules blanches pour illuminer toute la grille. Les ampoules éclairent leur ligne et colonne jusqu\'à ce qu\'elles rencontrent un mur. Deux ampoules ne peuvent pas s\'éclairer l\'une l\'autre. Les murs numérotés indiquent exactement combien d\'ampoules doivent être placées dans les cellules adjacentes.';

  @override
  String get akariWinTitle => 'LUMIÈRE !';

  @override
  String get akariWinMessage => 'Tout est parfaitement illuminé.';

  @override
  String get arithmeticChainTitle => 'Chaîne Calc';

  @override
  String get arithmeticChainSubtitle =>
      'Calculez le total courant dans votre tête';

  @override
  String get arithmeticChainWinTitle => 'NIVEAU SUPÉRIEUR !';

  @override
  String get arithmeticChainWinMessage => 'Votre calcul mental est affûté !';

  @override
  String get arithmeticChainLoseTitle => 'RÉESSAYEZ';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return 'La bonne réponse était $answer.';
  }

  @override
  String get arithmeticChainStart => 'COMMENCER';

  @override
  String get arithmeticChainNext => 'SUIVANT';

  @override
  String get attentionalBlinkTitle => 'Clignement Attentionnel';

  @override
  String get attentionalBlinkSubtitleWatch => 'SURVEILLEZ LES CHIFFRES';

  @override
  String get attentionalBlinkSubtitleInput =>
      'ENTREZ LES DEUX CHIFFRES QUE VOUS AVEZ VUS';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return 'Vous avez trouvé $score cibles !';
  }

  @override
  String get balanceScaleTitle => 'BALANCE';

  @override
  String get balanceScaleSubtitle =>
      'Déduisez le poids du dernier objet en fonction des balances.';

  @override
  String get balanceScaleWinTitle => 'ÉQUILIBRÉ !';

  @override
  String get balanceScaleWinMessage =>
      'Vous avez correctement déduit le poids !';

  @override
  String get balanceScaleLoseTitle => 'DÉSÉQUILIBRÉ';

  @override
  String get balanceScaleLoseMessage =>
      'Réessayez pour trouver le bon équilibre.';

  @override
  String get balanceScaleBack => 'RETOUR';

  @override
  String get balanceScaleSubmit => 'SOUMETTRE';

  @override
  String get binaryPuzzleTitle => 'PUZZLE BINAIRE';

  @override
  String get binaryPuzzleSubtitle =>
      'Remplissez avec 0 et 1. Max deux chiffres identiques adjacents. Autant de 0 que de 1 par ligne et colonne.';

  @override
  String get binaryPuzzleWinTitle => 'BIEN JOUÉ';

  @override
  String get binaryPuzzleWinMessage =>
      'Vous avez résolu le puzzle binaire avec une logique parfaite !';

  @override
  String get blockEscapeTitle => 'BLOCK ESCAPE';

  @override
  String get blockEscapeSubtitle =>
      'Faites glisser les blocs pour libérer un chemin pour que le bloc principal atteigne la sortie.';

  @override
  String get blockEscapeWinTitle => 'ÉCHAPPÉ !';

  @override
  String get blockEscapeWinMessage =>
      'Vous avez réussi à libérer le chemin pour le bloc principal !';

  @override
  String get boxCompletionTitle => 'Complétion de Cube';

  @override
  String get boxCompletionSubtitle => 'Quel cube peut être formé ?';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return 'Vous avez marqué $score points sur $totalTrials !';
  }

  @override
  String get boxCompletionOptions => 'OPTIONS';

  @override
  String get bridgesTitle => 'PONTS';

  @override
  String get bridgesSubtitle =>
      'Reliez les îles avec des ponts. Chaque île a besoin d\'un nombre spécifique de ponts. Les ponts ne peuvent pas se croiser.';

  @override
  String get bridgesWinTitle => 'CONNECTÉ !';

  @override
  String get bridgesWinMessage => 'Vous avez réussi à relier toutes les îles !';

  @override
  String get calculationSprintTitle => 'SPRINT DE CALCUL';

  @override
  String get calculationSprintSubtitle =>
      'Résolvez autant d\'équations que possible en 60 secondes.';

  @override
  String get calculationSprintGoalReached => 'OBJECTIF ATTEINT !';

  @override
  String get calculationSprintTimeUp => 'TEMPS ÉCOULÉ';

  @override
  String calculationSprintScoreMessage(int score) {
    return 'Excellente vitesse de calcul ! Vous avez marqué $score points.';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return 'Vous avez marqué $score points. Essayez de battre votre record !';
  }

  @override
  String get calculationSprintBest => 'MEILLEUR';

  @override
  String get calculationSprintSeconds => '60 SECONDES';

  @override
  String get calculationSprintDescription =>
      'Résolvez les équations rapidement.\nLes mauvaises réponses déduisent 3 secondes !';

  @override
  String get calculationSprintStart => 'COMMENCER LE SPRINT';

  @override
  String get categoryFluencyTitle => 'Fluidité par Catégorie';

  @override
  String get categoryFluencySubtitle =>
      'Entrez des éléments appartenant à la catégorie';

  @override
  String get categoryFluencyExpert => 'EXPERT EN FLUIDITÉ !';

  @override
  String get categoryFluencyTimeUp => 'TEMPS ÉCOULÉ !';

  @override
  String get categoryFluencyWinMessage => 'Vous avez un vaste vocabulaire !';

  @override
  String categoryFluencyFoundMessage(int count) {
    return 'Vous avez trouvé $count mots.';
  }

  @override
  String get categoryFluencyCategoryLabel => 'Catégorie :';

  @override
  String get categoryFluencyEnterItem => 'Entrez un élément...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target mots';
  }

  @override
  String get changeBlindnessTitle => 'Cécité au Changement';

  @override
  String get changeBlindnessSubtitle => 'REPÉREZ L\'ÉLÉMENT QUI CHANGE';

  @override
  String changeBlindnessScore(int score) {
    return 'SCORE : $score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return 'Vous avez trouvé $score changements !';
  }

  @override
  String get choiceRtTitle => 'Temps de Réaction';

  @override
  String get choiceRtSubtitle =>
      'Appuyez sur le carré actif aussi vite que possible';

  @override
  String choiceRtAvgMessage(String avg) {
    return 'Votre temps de réaction moyen : ${avg}ms';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return 'Temps restant : ${time}s';
  }

  @override
  String choiceRtTaps(int count) {
    return 'Appuis : $count';
  }

  @override
  String get colorFloodTitle => 'Color Flood';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return 'Coups : $moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => 'INONDATION RÉUSSIE !';

  @override
  String get colorFloodDryLand => 'TERRE FERME...';

  @override
  String get colorFloodWinMessage =>
      'Vous avez saturé toute la grille de couleur !';

  @override
  String get colorFloodLoseMessage => 'Vous n\'avez plus de coups. Réessayez !';

  @override
  String get colorMatchTitle => 'COLOR MATCH';

  @override
  String get colorMatchSubtitle =>
      'Ajustez les curseurs pour correspondre à la couleur cible aussi précisément que possible.';

  @override
  String get colorMatchTarget => 'CIBLE';

  @override
  String get colorMatchYours => 'VOTRE COULEUR';

  @override
  String get colorMatchCheck => 'VÉRIFIER';

  @override
  String get colorMatchResult => 'RÉSULTAT';

  @override
  String colorMatchAccuracy(String accuracy) {
    return 'Votre précision : $accuracy%';
  }

  @override
  String get corsiBlocksTitle => 'BLOCS DE CORSI';

  @override
  String get corsiBlocksSubtitle =>
      'Regardez les blocs s\'allumer et appuyez dessus dans le même ordre.';

  @override
  String get corsiBlocksWinTitle => 'MAÎTRE SPATIAL !';

  @override
  String get corsiBlocksLoseTitle => 'PERDU DANS L\'ESPACE';

  @override
  String corsiBlocksMessage(int score, int span) {
    return 'Vous avez rappelé $score séquences ! Votre empan de mémoire spatiale a atteint $span.';
  }

  @override
  String get corsiBlocksWatch => 'REGARDEZ LE MODÈLE';

  @override
  String get corsiBlocksRepeat => 'RÉPÉTEZ LE MODÈLE';

  @override
  String get corsiBlocksExcellent => 'EXCELLENT !';

  @override
  String get corsiBlocksSpan => 'EMPAN';

  @override
  String get crownTitle => 'COURONNE';

  @override
  String get crownSubtitle =>
      'Placez une couronne dans chaque ligne, colonne et région de couleur. Les couronnes ne peuvent pas être adjacentes, même en diagonale.';

  @override
  String get crownCrowned => 'COURONNÉ !';

  @override
  String get crownSuccess =>
      'Toutes les couronnes ont été placées avec succès avec une logique parfaite.';

  @override
  String get cryptogramTitle => 'CRYPTOGRAMME';

  @override
  String get cryptogramSubtitle =>
      'Attribuez des lettres pour décoder le message secret ! Chaque lettre codée représente une vraie lettre.';

  @override
  String get cryptogramBroken => 'CODE CASSÉ !';

  @override
  String get cryptogramEncrypted => 'CRYPTÉ';

  @override
  String get cryptogramSuccess => 'Vous avez décodé le message parfaitement.';

  @override
  String get cryptogramTryAgain => 'Réessayez pour briser le cryptage.';

  @override
  String get digitSpanReverseTitle => 'Mémoire Inverse';

  @override
  String get digitSpanReverseSubtitleMemorize => 'Mémorisez les chiffres';

  @override
  String get digitSpanReverseSubtitleEnter =>
      'Entrez les chiffres dans l\'ordre INVERSE';

  @override
  String get digitSpanReverseWinTitle => 'NIVEAU SUPÉRIEUR !';

  @override
  String get digitSpanReverseWinMessage =>
      'Votre mémoire de travail est impressionnante !';

  @override
  String get digitSpanReverseLoseTitle => 'RÉESSAYEZ';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return 'La bonne séquence inverse était $sequence.';
  }

  @override
  String get dividedAttentionTitle => 'Attention Divisée';

  @override
  String get dividedAttentionSubtitle =>
      'Appuyez à GAUCHE pour ÉTOILE ⭐ | Appuyez à DROITE pour ROUGE 🔴';

  @override
  String get dividedAttentionGameOverTitle => 'CONCENTRATION PERDUE';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return 'Le multitâche est difficile ! Votre score était $score.';
  }

  @override
  String dividedAttentionScore(int score) {
    return 'SCORE : $score';
  }

  @override
  String get doubleNBackTitle => 'Double N-Back';

  @override
  String doubleNBackSubtitle(int n) {
    return 'Faites correspondre les stimuli $n étapes en arrière';
  }

  @override
  String get doubleNBackGameOverTitle => 'PARTIE TERMINÉE';

  @override
  String doubleNBackGameOverMessage(int score) {
    return 'Vous avez marqué $score points au Double N-Back !';
  }

  @override
  String doubleNBackScore(int score) {
    return 'Score : $score';
  }

  @override
  String get doubleNBackPositionMatch => 'MATCH POSITION';

  @override
  String get doubleNBackLetterMatch => 'MATCH LETTRE';

  @override
  String get faceNameAssociationTitle => 'Visage-Nom';

  @override
  String get faceNameAssociationSubtitleStudy =>
      'Mémorisez le nom de chaque visage';

  @override
  String get faceNameAssociationSubtitleTest => 'Qui est-ce ?';

  @override
  String get faceNameAssociationPerfect => 'PARFAIT !';

  @override
  String get faceNameAssociationGameOver => 'PARTIE TERMINÉE';

  @override
  String get faceNameAssociationWinMessage =>
      'Vous avez une excellente mémoire des visages et des noms !';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return 'Vous avez $correct bonnes réponses sur $total.';
  }

  @override
  String get faceNameAssociationStartTest => 'COMMENCER LE TEST';

  @override
  String get flankerTestWinTitle => 'CONCENTRATION LASER !';

  @override
  String get flankerTestLoseTitle => 'DISTRAIT';

  @override
  String flankerTestScoreMessage(int score) {
    return 'Vous avez $score bonnes réponses !';
  }

  @override
  String get flankerTestTitle => 'TEST DE FLANKER';

  @override
  String get flankerTestSubtitle =>
      'Indiquez la direction de la flèche centrale, en ignorant les flèches latérales.';

  @override
  String get flankerTestLeft => 'GAUCHE';

  @override
  String get flankerTestRight => 'DROITE';

  @override
  String get fractionMatchTitle => 'Match de Fractions';

  @override
  String get fractionMatchSubtitle => 'Associez le visuel à sa fraction';

  @override
  String get fractionMatchLoseTitle => 'MAUVAISE FRACTION';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return 'La bonne réponse était $correctAnswer.';
  }

  @override
  String get goNoGoTitle => 'Go / No-Go';

  @override
  String get goNoGoSubtitle => 'Appuyez pour Vert, IGNOREZ Rouge !';

  @override
  String get goNoGoLoseTitle => 'RÉACTION STOPPÉE';

  @override
  String get goNoGoLoseMessage =>
      'Votre contrôle inhibiteur est mis à l\'épreuve !';

  @override
  String get goNoGoTapAnywhere => 'APPUYEZ N\'IMPORTE OÙ POUR CONTINUER';

  @override
  String get groceryListTitle => 'Liste de Courses';

  @override
  String get groceryListSubtitleMemorize =>
      'Mémorisez les articles et leurs catégories';

  @override
  String get groceryListSubtitleTest =>
      'À quelle catégorie cet article appartenait-il ?';

  @override
  String get groceryListWinTitle => 'GOUROU DES COURSES !';

  @override
  String get groceryListLoseTitle => 'OUBLIÉ QUELQUE CHOSE ?';

  @override
  String groceryListScoreMessage(int score) {
    return 'Vous avez marqué $score points dans la Liste de Courses !';
  }

  @override
  String get groceryListReady => 'JE SUIS PRÊT';

  @override
  String get groceryListWhereBelong => 'OÙ CELA VA-T-IL ?';

  @override
  String get hueSortTitle => 'HUE SORT';

  @override
  String get hueSortSubtitle =>
      'Échangez les tuiles pour créer une transition fluide entre les couleurs des coins. Les points indiquent les tuiles fixes.';

  @override
  String get hueSortWinTitle => 'DÉGRADÉ PARFAIT !';

  @override
  String get hueSortWinMessage =>
      'Vous avez parfaitement trié le spectre des couleurs !';

  @override
  String hueSortWrongTiles(int count) {
    return 'Tiles in wrong position: $count';
  }

  @override
  String get kenkenTitle => 'KenKen';

  @override
  String get kenkenWinTitle => 'GÉNIE !';

  @override
  String get kenkenLoseTitle => 'PARTIE TERMINÉE';

  @override
  String get kenkenWinMessage => 'Vous avez résolu le puzzle KenKen !';

  @override
  String get kenkenLoseMessage =>
      'Vérifiez les règles de ligne/colonne et de cage.';

  @override
  String kenkenSubtitle(int size) {
    return 'Remplissez 1-$size sans répétition par ligne/colonne';
  }

  @override
  String get letterCancellationTitle => 'Lettre Cancel';

  @override
  String get letterCancellationTitleFull => 'Annulation de Lettres';

  @override
  String letterCancellationScoreMessage(int score) {
    return 'Vous avez trouvé $score lettres !';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return 'Trouvez toutes les lettres \"$target\"';
  }

  @override
  String get letterCancellationFound => 'TROUVÉ';

  @override
  String get letterCancellationTime => 'TEMPS';

  @override
  String get lightsOutTitle => 'LIGHTS OUT';

  @override
  String get lightsOutSubtitle =>
      'Appuyer sur une tuile l\'inverse ainsi que ses voisins adjacents. Éteignez toutes les lumières.';

  @override
  String get lightsOutWinTitle => 'PUZZLE RÉSOLU !';

  @override
  String get lightsOutWinMessage =>
      'Vous avez réussi à éteindre toutes les lumières !';

  @override
  String get symmetryTitle => 'Symétrie';

  @override
  String get symmetrySubtitle =>
      'Reproduisez le motif de gauche sur la grille vide de droite.';

  @override
  String get semanticLinkTitle => 'Lien Sémantique';

  @override
  String get semanticLinkSubtitle => 'Trouvez le mot qui relie les trois';

  @override
  String get reflexTapTitle => 'Reflex Tap';

  @override
  String get visualStatisticalLearningTitle => 'Apprentissage Visuel';

  @override
  String get orbitTapTitle => 'Orbit Tap';

  @override
  String get orbitTapSubtitle =>
      'Appuyez quand les balles s\'alignent avec la porte';

  @override
  String get schulteTableTitle => 'Table de Schulte';

  @override
  String get multipleObjectTrackingTitle => 'Suivi d\'Objets';

  @override
  String get multipleObjectTrackingSubtitle =>
      'Observez les objets en surbrillance. Suivez-les dans leurs déplacements, puis sélectionnez-les.';

  @override
  String get sdmtTitle => 'Test SDMT';

  @override
  String get sdmtSubtitle =>
      'Utilisez la clé ci-dessus pour trouver le chiffre correspondant au symbole affiché.';

  @override
  String get memoryMatrixTitle => 'Matrice de Mémoire';

  @override
  String get memoryMatrixSubtitle =>
      'Mémorisez le motif et appuyez sur les tuiles.';

  @override
  String get mentalAbacusTitle => 'Abaque Mental';

  @override
  String get mentalAbacusSubtitle => 'Résolvez en utilisant le Soroban';

  @override
  String get spellingSprintTitle => 'Sprint d\'Orthographe';

  @override
  String get spellingSprintSubtitle =>
      'Course contre la montre pour épeler autant de mots que possible.';

  @override
  String get stopSignalTitle => 'Signal d\'Arrêt';

  @override
  String get stopSignalSubtitle =>
      'Appuyez sur la direction de la flèche, mais ARRÊTEZ immédiatement si elle devient ROUGE.';

  @override
  String get staircaseMemoryTitle => 'Mémoire en Escalier';

  @override
  String get vigilanceTaskTitle => 'Tâche de Vigilance';

  @override
  String get vigilanceTaskSubtitle =>
      'Appuyez sur le bouton quand l\'aiguille saute une position';

  @override
  String get logicalSyllogismsTitle => 'Syllogismes Logiques';

  @override
  String get logicalSyllogismsSubtitle =>
      'La conclusion est-elle logiquement valide ?';

  @override
  String get mathPathTitle => 'Math Path';

  @override
  String get mathPathSubtitle =>
      'Trouvez un chemin qui totalise exactement la somme cible.';

  @override
  String get sternbergTaskTitle => 'Tâche de Sternberg';

  @override
  String get sternbergTaskMemorize => 'Mémorisez les lettres';

  @override
  String get sternbergTaskWasLetterSet =>
      'Cette lettre était-elle dans l\'ensemble ?';

  @override
  String sternbergTaskScore(int score) {
    return 'Vous avez marqué $score points à la tâche de Sternberg !';
  }

  @override
  String get verbalAnalogiesTitle => 'Maître des Analogies !';

  @override
  String get verbalAnalogiesSubtitle => 'Complétez la relation';

  @override
  String get typingSpeedTitle => 'Vitesse de Frappe';

  @override
  String get typingSpeedSubtitle =>
      'Tapez la phrase exactement comme indiqué aussi vite que possible !';

  @override
  String get wordLadderTitle => 'Échelle de Mots';

  @override
  String get wordLadderSubtitle =>
      'Reliez les mots en changeant une lettre à la fois.';

  @override
  String get tangleFixTitle => 'Démêlé !';

  @override
  String get tangleFixSubtitle =>
      'Démêlez les lignes pour qu\'aucune ne s\'entrecroise';

  @override
  String get oddRotationTitle => 'Rotation Intruse';

  @override
  String get oddRotationSubtitle =>
      'L\'un d\'eux est en miroir. Pouvez-vous le trouver ?';

  @override
  String get towerOfLondonTitle => 'Tour de Londres';

  @override
  String get towerOfLondonSubtitle =>
      'Faites correspondre la configuration cible';

  @override
  String get symbolicFlankerTitle => 'Flanker Symbolique';

  @override
  String get symbolicFlankerSubtitle =>
      'Concentrez-vous sur le symbole central';

  @override
  String get stroopTestTitle => 'Test de Stroop';

  @override
  String get stroopTestSubtitle =>
      'Identifiez la couleur de l\'encre du mot affiché. Ignorez ce que le mot dit réellement !';

  @override
  String get wisconsinCardSortingTitle => 'Tri de Cartes Wisconsin';

  @override
  String get wisconsinCardSortingSubtitle =>
      'FAITES CORRESPONDRE LA CARTE À L\'UNE DES QUATRE CI-DESSUS';

  @override
  String get nBackTitle => 'Test N-Back';

  @override
  String get nBackSubtitle =>
      'Appuyez sur MATCH si la lettre actuelle correspond à celle d\'il y a 2 étapes.';

  @override
  String get rhythmMasterTitle => 'Maître du Rythme';

  @override
  String get rhythmMasterSubtitle =>
      'Appuyez en synchronisation avec l\'impulsion';

  @override
  String get pixelMimicTitle => 'Pixel Mimic';

  @override
  String get targetNumberTitle => 'Cible 24';

  @override
  String targetNumberSubtitle(int target) {
    return 'Utilisez les 4 nombres pour atteindre $target';
  }

  @override
  String get mirrorTracingTitle => 'Tracé Parfait !';

  @override
  String get mirrorTracingSubtitle =>
      'Tracez l\'étoile ! Les commandes sont INVERSÉES.';

  @override
  String get wordSurgeTitle => 'Word Surge';

  @override
  String get wordSurgeSubtitle => 'Synonymes & Antonymes';

  @override
  String get perspectiveTakingTitle => 'Prise de Perspective';

  @override
  String get perspectiveTakingTopDownView => 'VUE DE DESSUS';

  @override
  String get perspectiveTakingChoosePerspective => 'CHOISISSEZ LA PERSPECTIVE';

  @override
  String get perspectiveTakingCongrats =>
      'Vous avez un œil aiguisé pour les relations spatiales.';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return 'Quelle vue provient du $targetDirName ?';
  }

  @override
  String get paperFoldingTitle => 'Pliage Parfait !';

  @override
  String get paperFoldingSubtitle =>
      'À quoi cela ressemblera-t-il une fois déplié ?';

  @override
  String get waterSortTitle => 'Water Sort';

  @override
  String get waterSortSubtitle =>
      'Triez les couleurs pour que chaque tube ne contienne qu\'une seule couleur.';

  @override
  String get numericalEstimationTitle => 'Estimation Numérique';

  @override
  String get numericalEstimationSubtitle =>
      'Choisissez la réponse la plus proche rapidement !';

  @override
  String get lockPatternTitle => 'Schéma de Verrouillage';

  @override
  String get lockPatternSubtitle =>
      'Trouvez le schéma secret. Chaque essai donne un retour sur la position et les points.';

  @override
  String get primeHunterTitle => 'Chasseur de Primes';

  @override
  String get primeHunterSubtitle =>
      'Glissez à GAUCHE pour PREMIER | Glissez à DROITE pour COMPOSÉ';

  @override
  String get tracePathTitle => 'Trace Path';

  @override
  String get tracePathSubtitle =>
      'Suivez le chemin cible aussi précisément que possible';

  @override
  String get ruleSwitcherTitle => 'Rule Switcher';

  @override
  String get ruleSwitcherSubtitle => 'Appliquez la règle actuelle';

  @override
  String get choiceReactionTimeTitle => 'Temps de Réaction au Choix';

  @override
  String get pathRecallTitle => 'Rappel de Chemin';

  @override
  String get switchTaskTitle => 'Switch Task';

  @override
  String get switchTaskSubtitle =>
      'Faites attention à la règle ! Elle basculera entre la forme et la couleur.';

  @override
  String get mentalRotationTitle => 'Rotation Mentale';

  @override
  String get mentalRotationSubtitle =>
      'Ces formes sont-elles identiques, juste pivotées ?';

  @override
  String get missingOperatorTitle => 'Mix d\'Opérateurs';

  @override
  String get missingOperatorSubtitle =>
      'Remplissez les blancs pour compléter l\'équation';

  @override
  String get wordMastermindTitle => 'Word Mastermind';

  @override
  String get wordMastermindSubtitle =>
      'Craquez le code de 4 lettres ! Bulls (B) sont bien placés, Cows (C) sont mal placés.';

  @override
  String get simonSequenceTitle => 'Séquence';

  @override
  String get symbolLogicTitle => 'Logique des Symboles';

  @override
  String get symbolLogicSubtitle =>
      'Résolvez les équations visuelles pour trouver la valeur de chaque symbole. Quel est le résultat ?';

  @override
  String get silhouetteMatchTitle => 'Silhouette Match';

  @override
  String get silhouetteMatchSubtitle =>
      'Quelle silhouette correspond à cet objet ?';

  @override
  String get operationSpanTitle => 'Operation Span';

  @override
  String get operationSpanMathPhase => 'L\'équation est-elle correcte ?';

  @override
  String get operationSpanLetterPhase => 'Rappelez-vous de la lettre';

  @override
  String get operationSpanRecallPhase => 'Rappelez les lettres dans l\'ordre';

  @override
  String get operationSpanRoundComplete => 'Manche Terminée !';

  @override
  String operationSpanScore(int score) {
    return 'Vous avez marqué $score points à l\'Operation Span !';
  }

  @override
  String get slidePuzzleTitle => 'Puzzle Coulissant';

  @override
  String get slidePuzzleNewGame => 'NOUVEAU JEU';

  @override
  String get slidePuzzleInstructions =>
      'Réarrangez les tuiles dans l\'ordre numérique en les faisant glisser dans l\'espace vide.';

  @override
  String get slidePuzzleTileSlider => 'COULISSEUR DE TUILES';

  @override
  String get slidePuzzleCongrats =>
      'Vous avez réussi à ordonner toutes les tuiles.';

  @override
  String get visualSearchTitle => 'Recherche Visuelle';

  @override
  String get visualSearchSubtitle => 'Trouvez le symbole unique dans la grille';

  @override
  String get trailMakingTitle => 'Trail Making';

  @override
  String get trailMakingSubtitle =>
      'Reliez les nombres dans l\'ordre (1 -> 2 -> 3...) aussi vite que possible.';

  @override
  String get matrixReasoningTitle => 'Raisonnement Matriciel';

  @override
  String get matrixReasoningSubtitle => 'Complétez le motif dans la grille 3x3';

  @override
  String get tentsAndTreesTitle => 'Tentes & Arbres';

  @override
  String get tentsAndTreesSubtitle =>
      'Placez des tentes à côté des arbres. Les chiffres indiquent le nombre de tentes par ligne/colonne. Les tentes ne peuvent pas se toucher.';

  @override
  String get quickMathTitle => 'Calcul Rapide';

  @override
  String get magicSquaresTitle => 'Carré Magique';

  @override
  String magicSquaresSubtitle(int targetSum) {
    return 'Chaque ligne, colonne et diagonale doit totaliser $targetSum';
  }

  @override
  String get objectShuffleTitle => 'Object Shuffle';

  @override
  String get pipesTitle => 'Tuyaux';

  @override
  String get pipesSubtitle =>
      'Reliez les points de même couleur avec des tuyaux.';

  @override
  String get oddOneOutTitle => 'Cherchez l\'Intrus';

  @override
  String get oddOneOutSubtitle =>
      'Trouvez la tuile avec une couleur différente.';

  @override
  String get einsteinRiddleTitle => 'ÉNIGME d\'EINSTEIN';

  @override
  String get einsteinRiddleSubtitle =>
      'Utilisez les indices pour déduire les attributs de chaque maison.';

  @override
  String get einsteinRiddleHowToPlay =>
      'Chaque maison a des attributs uniques (couleur, nationalité, animal, etc.). Utilisez les indices pour remplir la grille et trouver la solution complète.';

  @override
  String get einsteinRiddleColor => 'Couleur';

  @override
  String get einsteinRiddleNationality => 'Nationalité';

  @override
  String get einsteinRiddleDrink => 'Boisson';

  @override
  String get einsteinRiddlePet => 'Animal';

  @override
  String get einsteinRiddleSmoke => 'Tabac';

  @override
  String get einsteinRiddleHouse => 'Maison';

  @override
  String get mirrorImageTitle => 'Image Miroir';

  @override
  String get mirrorImageSubtitle => 'Identifiez la bonne réflexion miroir.';

  @override
  String get mirrorImageHowToPlay =>
      'Regardez la forme et choisissez sa réflexion miroir correcte parmi les options proposées.';

  @override
  String get mentalMappingTitle => 'Cartographie Mentale';

  @override
  String get mentalMappingSubtitle =>
      'Suivez les directions et trouvez la destination.';

  @override
  String get mentalMappingHowToPlay =>
      'Une séquence de directions vous sera montrée (Nord, Sud, Est, Ouest). Suivez mentalement ces étapes à partir du centre de la grille et sélectionnez la destination finale.';

  @override
  String get memoryPalaceTitle => 'Palais de la Mémoire';

  @override
  String get memoryPalaceSubtitle =>
      'Rappelez-vous quel mot était à quel endroit.';

  @override
  String get memoryPalaceHowToPlay =>
      'Un ensemble de mots apparaîtra à différents endroits d\'une grille. Mémorisez leurs positions. Ensuite, vous devrez replacer les mots à leurs positions d\'origine.';

  @override
  String get countingSheepTitle => 'Comptage de Moutons';

  @override
  String get countingSheepSubtitle => 'Combien de moutons avez-vous vus ?';

  @override
  String get countingSheepHowToPlay =>
      'Des moutons traverseront l\'écran rapidement. Comptez-les au fur et à mesure et entrez le nombre total à la fin.';

  @override
  String get faceTraitAssociationTitle => 'Visage-Trait';

  @override
  String get faceTraitAssociationSubtitle =>
      'Mémorisez les traits de chaque visage';

  @override
  String get faceTraitAssociationHowToPlay =>
      'Plusieurs visages vous seront montrés, chacun avec un nom, une profession et un passe-temps. Mémorisez ces associations. Plus tard, vous devrez rappeler les traits spécifiques de chaque visage.';

  @override
  String get mentalCalendarTitle => 'Calendrier Mental';

  @override
  String get mentalCalendarSubtitle => 'Calculez le jour de la semaine';

  @override
  String get mentalCalendarHowToPlay =>
      'Une date aléatoire sera affichée. Utilisez le calcul mental pour déterminer quel jour de la semaine elle tombe.';

  @override
  String get vocabularyBuilderTitle => 'Vocabulaire';

  @override
  String get vocabularyBuilderSubtitle =>
      'Associez synonymes et antonymes sous pression.';

  @override
  String get vocabularyBuilderHowToPlay =>
      'Un mot cible et une relation (Synonyme ou Antonyme) vous seront montrés. Choisissez le mot correct. Soyez rapide !';

  @override
  String get grammarPoliceTitle => 'Police de la Grammaire';

  @override
  String get grammarPoliceSubtitle =>
      'Identifiez et corrigez les erreurs dans un texte défilant.';

  @override
  String get grammarPoliceHowToPlay =>
      'Des phrases défileront vers le haut. Certaines contiennent des erreurs. Appuyez sur les phrases erronées pour les \'corriger\'. Ne laissez pas passer trop d\'erreurs !';

  @override
  String get reverseStroopTitle => 'Stroop Inversé';

  @override
  String get reverseStroopSubtitle =>
      'Une variante du test de Stroop où la focalisation est inversée.';

  @override
  String get reverseStroopHowToPlay =>
      'Faites attention à l\'instruction ! S\'il est écrit \'TEXTE\', faites correspondre le sens. S\'il est écrit \'COULEUR\', faites correspondre la couleur de l\'encre.';

  @override
  String get game2048Instruction => 'GLISSEZ POUR FUSIONNER';

  @override
  String get fibonacciMergeTitle => 'Fibonacci Merge';

  @override
  String get fibonacciMergeSubtitle =>
      'Merge consecutive Fibonacci numbers (1, 1, 2, 3, 5, 8, 13...).';

  @override
  String get sequenceSleuthTitle => 'Sequence Sleuth';

  @override
  String get sequenceSleuthSubtitle =>
      'Find the missing number in the mathematical sequence.';

  @override
  String get divisibilityDashTitle => 'Divisibility Dash';

  @override
  String get divisibilityDashSubtitle =>
      'Tap all single-digit divisors (2-9) for the given number.';

  @override
  String get percentagePeakTitle => 'Percentage Peak';

  @override
  String get percentagePeakSubtitle =>
      'Solve mental percentage calculations quickly.';

  @override
  String get vennNumbersTitle => 'Venn Numbers';

  @override
  String get vennNumbersSubtitle =>
      'Categorize numbers into the correct Venn diagram regions.';

  @override
  String get commonDenominatorTitle => 'Common Denominator';

  @override
  String get commonDenominatorSubtitle =>
      'Find the Greatest Common Divisor or Least Common Multiple.';

  @override
  String get angleFinderTitle => 'Angle Finder';

  @override
  String get angleFinderSubtitle =>
      'Calculate the missing angle in the geometric problem.';

  @override
  String get sumSnakeTitle => 'Sum Snake';

  @override
  String get sumSnakeSubtitle =>
      'Connect adjacent numbers to reach the target sum.';
}
