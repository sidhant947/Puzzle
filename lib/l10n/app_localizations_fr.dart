// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Jeux de Puzzle';

  @override
  String get home => 'Accueil';

  @override
  String get settings => 'Paramètres';

  @override
  String get playAgain => 'Rejouer';

  @override
  String get playNext => 'Suivant';

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
  String get victory => 'Victoire !';

  @override
  String get gameWin => 'BIEN JOUÉ !';

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
  String get radicalRootsTitle => 'Racines Radicales';

  @override
  String get radicalRootsSubtitle =>
      'Trouvez la racine carrée ou cubique du nombre donné. Arrondissez à l\'entier le plus proche si nécessaire.';

  @override
  String get radicalRootsGoalReached => 'Objectif atteint !';

  @override
  String get radicalRootsTimeUp => 'Temps écoulé !';

  @override
  String radicalRootsScoreMessage(int score) {
    return 'Vous avez calculé $score racines correctement !';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return 'Continuez à vous entraîner ! Vous avez calculé $score racines.';
  }

  @override
  String get radicalRootsStart => 'Commencer à calculer';

  @override
  String get radicalRootsDescription =>
      'Vous avez 60 secondes pour en résoudre un maximum.';

  @override
  String get radicalRootsBest => 'Meilleur';

  @override
  String get radicalRootsSeconds => '60 SECONDES';

  @override
  String get romanArithmeticTitle => 'Arithmétique Romaine';

  @override
  String get romanArithmeticSubtitle =>
      'Résolvez des problèmes d\'addition et de soustraction en utilisant des chiffres romains.';

  @override
  String get romanArithmeticGoalReached => 'Niveau Centurion !';

  @override
  String get romanArithmeticTimeUp => 'Temps écoulé !';

  @override
  String romanArithmeticScoreMessage(int score) {
    return 'Vous avez résolu $score problèmes romains !';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return 'Veni, Vidi, Vici ! Vous avez résolu $score problèmes.';
  }

  @override
  String get romanArithmeticStart => 'Commencer la quête';

  @override
  String get romanArithmeticDescription =>
      'Convertissez et résolvez. Vous avez 60 secondes.';

  @override
  String get romanArithmeticBest => 'Meilleur';

  @override
  String get romanArithmeticSeconds => '60 SECONDES';

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
  String get magnetsTitle => 'AIMANTS';

  @override
  String get magnetsSubtitle =>
      'Placez des aimants dans la grille en fonction du nombre de pôles.';

  @override
  String get magnetsHowToPlay =>
      'Remplissez des conteneurs de la taille d\'un domino avec des aimants \'+\' et \'-\' ou laissez-les vides. Les indices de ligne et de colonne spécifient le nombre total de chaque pôle sur cette ligne. Des pôles identiques ne peuvent pas être adjacents orthogonalement.';

  @override
  String get magnetsWinTitle => 'POLARITÉ ÉQUILIBRÉE !';

  @override
  String get magnetsWinMessage =>
      'Tous les aimants sont parfaitement disposés !';

  @override
  String get lighthousesTitle => 'PHARES';

  @override
  String get lighthousesSubtitle =>
      'Placez des navires en fonction des indices des phares.';

  @override
  String get lighthousesHowToPlay =>
      'Placez des navires 1x1 dans la grille. Les phares indiquent le nombre total de navires visibles horizontalement et verticalement. Les navires ne peuvent pas toucher les phares ni se toucher entre eux, même en diagonale.';

  @override
  String get lighthousesWinTitle => 'MER SÉCURISÉE !';

  @override
  String get lighthousesWinMessage =>
      'Tous les phares guident parfaitement les navires !';

  @override
  String get dominosaTitle => 'DOMINOSA';

  @override
  String get dominosaSubtitle =>
      'Trouvez tous les dominos cachés dans la grille.';

  @override
  String get dominosaHowToPlay =>
      'Disposez un jeu complet de dominos sur une grille de nombres de sorte que chaque paire de nombres adjacents soit couverte par exactement un domino. Chaque paire de nombres n\'existe qu\'une seule fois dans le jeu.';

  @override
  String get dominosaWinTitle => 'MAÎTRE DES DOMINOS !';

  @override
  String get dominosaWinMessage => 'Chaque domino a été trouvé et placé !';

  @override
  String get skyscrapersTitle => 'GRATTE-CIEL';

  @override
  String get skyscrapersSubtitle =>
      'Remplissez la grille avec les hauteurs des bâtiments.';

  @override
  String get skyscrapersHowToPlay =>
      'Remplissez la grille avec des hauteurs (1-N) de sorte que chaque ligne et colonne contienne chaque hauteur exactement une fois. Les indices sur les bords indiquent combien de bâtiments sont visibles depuis cette direction, les bâtiments plus grands bloquant les plus petits.';

  @override
  String get skyscrapersWinTitle => 'SKYLINE RESTAURÉE !';

  @override
  String get skyscrapersWinMessage =>
      'Tous les bâtiments sont parfaitement positionnés !';

  @override
  String get nurikabeTitle => 'NURIKABE';

  @override
  String get nurikabeSubtitle =>
      'Formez une mer connectée et séparez les îles.';

  @override
  String get nurikabeHowToPlay =>
      'Ombrez les cases pour former une seule « mer » connectée (pas de blocs 2x2). Les cases non ombrées forment des « îles », chacune contenant exactement un nombre qui représente sa surface totale.';

  @override
  String get nurikabeWinTitle => 'LA MER COULE !';

  @override
  String get nurikabeWinMessage => 'Îles séparées, mer connectée !';

  @override
  String get fillominoTitle => 'FILLOMINO';

  @override
  String get fillominoSubtitle =>
      'Divisez la grille en polyominos des tailles spécifiées.';

  @override
  String get fillominoHowToPlay =>
      'Divisez la grille en polyominos de sorte que chaque polyomino de taille N contienne le nombre N dans toutes ses cases. Les polyominos de même taille ne peuvent pas être adjacents orthogonalement.';

  @override
  String get fillominoWinTitle => 'GRILLE DIVISÉE !';

  @override
  String get fillominoWinMessage => 'Parfaitement carrelé avec logique !';

  @override
  String get hitoriTitle => 'HITORI';

  @override
  String get hitoriSubtitle =>
      'Ombrez les numéros en double dans chaque ligne et colonne.';

  @override
  String get hitoriHowToPlay =>
      'Ombrez les cases de sorte qu\'aucun nombre n\'apparaisse plus d\'une fois dans une ligne ou une colonne. Les cases ombrées ne peuvent pas être adjacentes (orthogonalement), et toutes les cases non ombrées doivent former un seul groupe connecté.';

  @override
  String get hitoriWinTitle => 'MAÎTRE HITORI !';

  @override
  String get hitoriWinMessage =>
      'Vous avez réussi à résoudre tous les doublons !';

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
    return 'Tuiles en mauvaise position : $count';
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
  String get orbitTapTapToHit =>
      'Touchez lorsqu\'une balle entre dans la porte';

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
  String get verbalAnalogiesTitle => 'Analogies verbales';

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
  String get tangleFixTitle => 'Démêlage';

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
  String get mirrorTracingTitle => 'Dessin en miroir';

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
  String get paperFoldingTitle => 'Pliage de papier';

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
  String get correct => 'CORRECT';

  @override
  String get incorrect => 'INCORRECT';

  @override
  String get grammarPoliceTitle => 'Police de la Grammaire';

  @override
  String get grammarPoliceSubtitle =>
      'Identifiez si la phrase est grammaticalement correcte ou contient des erreurs.';

  @override
  String get grammarPoliceHowToPlay =>
      'Une phrase apparaîtra au centre de l\'écran. Décidez si elle est grammaticalement correcte ou si elle contient une erreur. Appuyez sur \'CORRECT\' si elle est correcte, ou sur \'INCORRECT\' si vous repérez une erreur. Ne perdez pas toutes vos vies !';

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
  String get fibonacciMergeTitle => 'Fusion de Fibonacci';

  @override
  String get fibonacciMergeSubtitle =>
      'Fusionnez les nombres de Fibonacci consécutifs (1, 1, 2, 3, 5, 8, 13...).';

  @override
  String get sequenceSleuthTitle => 'Détective de Séquences';

  @override
  String get sequenceSleuthSubtitle =>
      'Trouvez le nombre manquant dans la séquence mathématique.';

  @override
  String get divisibilityDashTitle => 'Course à la Divisibilité';

  @override
  String get divisibilityDashSubtitle =>
      'Appuyez sur tous les diviseurs à un chiffre (2-9) pour le nombre donné.';

  @override
  String get percentagePeakTitle => 'Sommet du Pourcentage';

  @override
  String get percentagePeakSubtitle =>
      'Résolvez des calculs de pourcentage mentaux rapidement.';

  @override
  String get vennNumbersTitle => 'Nombres de Venn';

  @override
  String get vennNumbersSubtitle =>
      'Catégorisez les nombres dans les bonnes régions du diagramme de Venn.';

  @override
  String get commonDenominatorTitle => 'Dénominateur Commun';

  @override
  String get commonDenominatorSubtitle =>
      'Trouvez le Plus Grand Commun Diviseur ou le Plus Petit Commun Multiple.';

  @override
  String get angleFinderTitle => 'Chercheur d\'Angle';

  @override
  String get angleFinderSubtitle =>
      'Calculez l\'angle manquant dans le problème géométrique.';

  @override
  String get sumSnakeTitle => 'Serpent de Somme';

  @override
  String get sumSnakeSubtitle =>
      'Reliez les nombres adjacents pour atteindre la somme cible.';

  @override
  String get baseShiftTitle => 'BLITZ DE CHANGEMENT DE BASE';

  @override
  String get baseShiftSubtitle => 'Résoudre en décimal';

  @override
  String get baseShiftDescription =>
      'Résolvez l\'équation et tapez la réponse en décimal (Base 10).';

  @override
  String get baseShiftEquation => 'ÉQUATION';

  @override
  String get baseShiftHint => 'Entrez le résultat décimal...';

  @override
  String get baseShiftCorrect => 'Correct !';

  @override
  String get baseShiftIncorrect => 'Incorrect !';

  @override
  String get baseShiftSubmit => 'SOUMETTRE';

  @override
  String get baseShiftQuickGuide => 'Guide Rapide :';

  @override
  String get baseShiftBinary => 'Binaire (bin) : Base 2 (0, 1)';

  @override
  String get baseShiftHex => 'Hexadécimal (0x) : Base 16 (0-9, A-F)';

  @override
  String get baseShiftDecimal => 'Décimal (dec) : Base 10 (0-9)';

  @override
  String get baseShiftWinTitle => 'SORCIER DES MATHS !';

  @override
  String get baseShiftWinMessage =>
      'Vous avez résolu correctement 5 équations de changement de base !';

  @override
  String get blockCount3DTitle => 'Comptage de Blocs 3D';

  @override
  String get blockCount3DSubtitle =>
      'GLISSEZ POUR PIVOTER • COMPTEZ LES BLOCS CACHÉS';

  @override
  String get blockCount3DHowMany => 'COMBIEN DE BLOCS ?';

  @override
  String get blockCount3DSubmitGuess => 'SOUMETTRE LA RÉPONSE';

  @override
  String get blockCount3DNotQuite =>
      'Pas tout à fait ! Essayez de pivoter pour recompter.';

  @override
  String get blockCount3DExcellent => 'EXCELLENT';

  @override
  String blockCount3DWinMessage(int count) {
    return 'Vous avez correctement identifié les $count blocs !';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '1. Glissez votre doigt sur la vue 3D pour faire pivoter la pile.\n\n2. Comptez tous les blocs de la pile.\n\n3. Rappel : un bloc en l\'air doit avoir des blocs de support en dessous (blocs cachés !).\n\n4. Tapez votre réponse et appuyez sur \"SOUMETTRE LA RÉPONSE\".';

  @override
  String get alphabetSudokuTitle => 'SUDOKU ALPHABÉTIQUE';

  @override
  String get alphabetSudokuSubtitle =>
      'Remplissez la grille pour que chaque ligne, colonne et carré contienne les lettres A-I.';

  @override
  String get alphabetSudokuWinTitle => 'SUDOKU RÉSOLU !';

  @override
  String get alphabetSudokuWinMessage =>
      'Brillant ! Vous avez maîtrisé les lettres.';

  @override
  String get classicMazeTitle => 'Labyrinthe Classique';

  @override
  String get classicMazeSubtitle =>
      'EXPLOREZ ET RÉSOLVEZ • UN NOUVEAU LABYRINTHE À CHAQUE JEU';

  @override
  String get classicMazeWinTitle => 'LABYRINTHE TERMINÉ';

  @override
  String classicMazeWinMessage(int count) {
    return 'Navigation incroyable ! Vous avez résolu le labyrinthe en $count mouvements.';
  }

  @override
  String get classicMazeMoves => 'MOUVEMENTS : ';

  @override
  String get classicMazeHowToPlayDescription =>
      '1. Guidez la bille jaune (joueur) vers le portail vert (sortie) en bas à droite.\n\n2. Glissez n\'importe où, utilisez les flèches du clavier ou les boutons pour vous déplacer.\n\n3. La trace violette montre le chemin exploré. Revenez sur vos pas pour l\'effacer !\n\n4. Changez la difficulté pour des labyrinthes plus grands.';

  @override
  String get conjunctionSearchTitle => 'Recherche de Conjonction';

  @override
  String get conjunctionSearchSubtitle =>
      'Focalisation attentionnelle et conjonction de caractéristiques';

  @override
  String get conjunctionSearchWinTitle => 'VICTOIRE';

  @override
  String get conjunctionSearchWinMessage =>
      'Vous avez trouvé toutes les cibles avec une focalisation attentionnelle parfaite !';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      'Une combinaison spécifique de forme et de couleur sera affichée. Trouvez-la et appuyez dessus le plus vite possible. Les distracteurs partagent soit la couleur, soit la forme !';

  @override
  String get conjunctionSearchRound => 'MANCHE : ';

  @override
  String get conjunctionSearchScore => 'SCORE : ';

  @override
  String get conjunctionSearchFind => 'TROUVEZ : ';

  @override
  String get shapeCircle => 'CERCLE';

  @override
  String get shapeSquare => 'CARRÉ';

  @override
  String get shapeTriangle => 'TRIANGLE';

  @override
  String get shapeStar => 'ÉTOILE';

  @override
  String get shapeRectangle => 'RECTANGLE';

  @override
  String get shapeEllipse => 'ELLIPSE';

  @override
  String get shapeTrapezoid => 'TRAPÈZE';

  @override
  String get colorRedLabel => 'ROUGE';

  @override
  String get colorBlueLabel => 'BLEU';

  @override
  String get colorGreenLabel => 'VERT';

  @override
  String get colorAmberLabel => 'AMBRE';

  @override
  String get cubeNetFoldTitle => 'Pliage de Cube';

  @override
  String get cubeNetFoldSubtitle => 'SÉLECTIONNEZ LE CUBE 3D CORRESPONDANT';

  @override
  String get cubeNetFoldWinTitle => 'CORRECT';

  @override
  String get cubeNetFoldWinMessage =>
      'Vous avez une logique de pliage spatial 3D parfaite !';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '1. Regardez le patron 2D en haut.\n\n2. Pliez mentalement le patron en un cube 3D.\n\n3. Choisissez l\'option qui représente une perspective 3D valide de ce cube.\n\n4. Attention : les faces opposées dans le patron ne peuvent pas être adjacentes en 3D.';

  @override
  String get cubeNetFoldUnfoldedNet => 'PATRON 2D DÉPLIÉ';

  @override
  String get cubeNetFoldWhichMatches => 'QUEL CUBE CORRESPOND ?';

  @override
  String get cubeNetFoldIncorrect =>
      'Logique de pliage incorrecte ! Appuyez sur Reset ou changez votre choix.';

  @override
  String get cubeNetFoldSubmitChoice => 'SOUMETTRE LE CHOIX';

  @override
  String get cubeNetFoldFailed => 'ÉCHEC (APPUYEZ SUR RESET)';

  @override
  String get faceTraitAssociationMemorize => 'MÉMORISEZ LES 4 PERSONNES';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return 'PERSONNE $current SUR $total';
  }

  @override
  String get faceTraitAssociationWhatOccupation =>
      'QUELLE EST LEUR PROFESSION ?';

  @override
  String get faceTraitAssociationWhatHobby => 'QUEL EST LEUR PASSE-TEMPS ?';

  @override
  String get faceTraitAssociationWinTitle => 'MAÎTRE DE LA MÉMOIRE !';

  @override
  String get faceTraitAssociationLoseTitle => 'PARTIE TERMINÉE';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return 'Vous avez $correct bonnes réponses sur $total.';
  }

  @override
  String get topologyTitle => 'TOPOLOGIE';

  @override
  String get topologySubtitle =>
      'Ces formes sont-elles topologiquement équivalentes ? (Peut-on en déformer une en l\'autre sans couper ni coller ?)';

  @override
  String get topologyWinTitle => 'GÉNIE DE LA GÉOMÉTRIE !';

  @override
  String get topologyWinMessage =>
      'Vous avez correctement identifié 10 paires topologiques !';

  @override
  String get topologyScore => 'SCORE : ';

  @override
  String get semanticDistanceTitle => 'Distance sémantique';

  @override
  String get semanticDistanceSubtitle =>
      'Mesurez la distance conceptuelle entre les mots';

  @override
  String get oxymoronHuntTitle => 'Chasse aux oxymores';

  @override
  String get oxymoronHuntSubtitle =>
      'Associez des mots contradictoires dans la grille';

  @override
  String get portmanteauSplitTitle => 'Séparation de mot-valise';

  @override
  String get portmanteauSplitSubtitle =>
      'Identifiez les mots sources d\'un mot-valise';

  @override
  String get chainReactionTitle => 'Réaction en chaîne';

  @override
  String get chainReactionSubtitle =>
      'Connectez les mots en utilisant des lettres superposées';

  @override
  String get rhymeMasterTitle => 'Maître des rimes';

  @override
  String get rhymeMasterSubtitle =>
      'Identifiez les mots qui riment avec la cible';

  @override
  String get definitionDashTitle => 'Sprint de définitions';

  @override
  String get definitionDashSubtitle =>
      'Faites correspondre le mot correct à sa définition';

  @override
  String get syllableStackTitle => 'Pile de syllabes';

  @override
  String get syllableStackSubtitle =>
      'Empilez les syllabes pour former des mots complets';

  @override
  String get sentenceUnscrambleTitle => 'Phrase mélangée';

  @override
  String get sentenceUnscrambleSubtitle =>
      'Réordonnez les mots pour former une phrase valide';

  @override
  String get grammarSortTitle => 'Tri grammatical';

  @override
  String get grammarSortSubtitle =>
      'Catégorisez les mots par leur nature grammaticale';

  @override
  String get vowelReconstructTitle => 'Reconstruction de voyelles';

  @override
  String get vowelReconstructSubtitle =>
      'Remplissez les voyelles manquantes dans la phrase';

  @override
  String get consonantReconstructTitle => 'Reconstruction de consonnes';

  @override
  String get consonantReconstructSubtitle =>
      'Remplissez les consonnes manquantes dans la phrase';

  @override
  String get homophoneHuntTitle => 'Chasse aux homophones';

  @override
  String get silentLetterSearchTitle => 'Recherche de lettres muettes';

  @override
  String get silentLetterSearchSubtitle =>
      'Identifiez les lettres muettes dans les mots donnés';

  @override
  String get palindromeBuilderTitle => 'Constructeur de palindromes';

  @override
  String get palindromeBuilderSubtitle =>
      'Créez un palindrome en ajoutant un minimum de lettres';

  @override
  String get phoneticGuessTitle => 'Devinette phonétique';

  @override
  String get phoneticGuessSubtitle =>
      'Identifiez le mot à partir de son orthographe phonétique';

  @override
  String get spoonerismSolverTitle => 'Solveur de contrepèteries';

  @override
  String get spoonerismSolverSubtitle =>
      'Identifiez la contrepèterie correcte pour la phrase';

  @override
  String get etymonOddballTitle => 'Intrus étymologique';

  @override
  String get etymonOddballSubtitle =>
      'Trouvez le mot qui ne partage pas la même racine';

  @override
  String get etymologyOriginTitle => 'Origine étymologique';

  @override
  String get etymologyOriginSubtitle =>
      'Devinez la langue d\'origine de l\'emprunt';

  @override
  String get affixFactoryTitle => 'Usine d\'affixes';

  @override
  String get affixFactorySubtitle =>
      'Créez des mots valides en utilisant des préfixes et des suffixes';

  @override
  String get cognateCatchTitle => 'Attrape-cognats';

  @override
  String get cognateCatchSubtitle =>
      'Distinguez les vrais cognats des faux amis';

  @override
  String get compoundConnectTitle => 'Connexion composée';

  @override
  String get compoundConnectSubtitle =>
      'Combinez deux mots pour former un mot composé';

  @override
  String get pangramSprintTitle => 'Sprint de pangrammes';

  @override
  String get pangramSprintSubtitle =>
      'Construisez une phrase en utilisant chaque lettre de l\'alphabet';

  @override
  String get anagramDefinitionTitle => 'Définition d\'anagramme';

  @override
  String get anagramDefinitionSubtitle =>
      'Résolvez l\'anagramme en fonction de sa définition';

  @override
  String get letterBridgeTitle => 'Pont de lettres';

  @override
  String get letterBridgeSubtitle =>
      'Trouvez la lettre manquante qui relie deux mots';

  @override
  String get letterFrequencyScanTitle => 'Scan de fréquence de lettres';

  @override
  String get letterFrequencyScanSubtitle =>
      'Comptez combien de fois une lettre apparaît dans le texte';

  @override
  String get oneLetterShiftTitle => 'Décalage d\'une lettre';

  @override
  String get oneLetterShiftSubtitle =>
      'Transformez un mot en un autre avec un changement d\'une seule lettre';

  @override
  String vocabularyBuilderMessage(String arg0) {
    return 'Excellent travail ! Votre vocabulaire est impressionnant. Score : $arg0';
  }

  @override
  String get symmetryMessage =>
      'Vous avez reflété le motif parfaitement avec une précision chirurgicale.';

  @override
  String get temporalOrderMessage =>
      'Incroyable ! Votre mémoire de séquence temporelle est de haute fidélité.';

  @override
  String get temporalOrderMessage1 =>
      'Mémoire de séquence incorrecte. C\'est en forgeant qu\'on devient forgeron !';

  @override
  String get wordSearchMessage =>
      'Tous les mots ont été trouvés avec succès grâce à votre sens de l\'observation.';

  @override
  String colorMatchMessage(String arg0) {
    return 'Votre précision : $arg0%';
  }

  @override
  String semanticLinkMessage(String arg0) {
    return 'Vous avez marqué $arg0 points !';
  }

  @override
  String reflexTapMessage(String arg0) {
    return 'Vous avez tapé $arg0 cibles !';
  }

  @override
  String get angleFinderMessage => 'Votre intuition géométrique est parfaite !';

  @override
  String angleFinderMessage1(String arg0) {
    return 'La réponse correcte était $arg0°';
  }

  @override
  String angleFinderText(String arg0) {
    return '$arg0°';
  }

  @override
  String visualStatisticalLearningMessage(String arg0) {
    return 'Vous avez marqué $arg0 motifs corrects !';
  }

  @override
  String nonogramText(String arg0) {
    return 'Erreur : $arg0';
  }

  @override
  String mentalCalendarMessage(String arg0) {
    return 'Vous avez eu $arg0 bonnes réponses sur 10 !';
  }

  @override
  String orbitTapMessage(String arg0) {
    return 'Vous avez réussi à taper $arg0 fois !';
  }

  @override
  String schulteTableMessage(String arg0) {
    return 'Vous avez terminé le tableau en $arg0.\nContinuez à vous entraîner pour élargir votre vision périphérique !';
  }

  @override
  String get schulteTableText => 'COMMENCER LE TEST';

  @override
  String get relationalMemoryMessage =>
      'Précision fabuleuse de la mémoire relationnelle spatiale !';

  @override
  String sudokuText(String arg0) {
    return 'Erreur : $arg0';
  }

  @override
  String sdmtMessage(String arg0) {
    return 'Vous avez fait correspondre $arg0 symboles ! Ce test mesure votre vitesse de balayage et votre attention visuelle.';
  }

  @override
  String get futoshikiMessage =>
      'Incroyable ! Vous avez résolu le carré latin Futoshiki.';

  @override
  String letterFrequencyScanMessage(String arg0, String arg1) {
    return 'Vous avez correctement compté $arg0 occurrences de \"$arg1\".';
  }

  @override
  String letterFrequencyScanText(String arg0) {
    return 'Incorrect. Le compte était $arg0.';
  }

  @override
  String get memoryMatrixMessage =>
      'Impressionnant ! Votre mémoire de travail est aiguisée. Objectif quotidien atteint !';

  @override
  String get memoryMatrixMessage1 =>
      'Concentrez-vous et réessayez pour améliorer votre score de mémoire.';

  @override
  String get contextCluesMessage =>
      'Exceptionnel ! Votre vocabulaire et votre analyse contextuelle sont de premier ordre.';

  @override
  String get contextCluesMessage1 =>
      'Mauvais mot sélectionné ! Entraînez votre raisonnement contextuel verbal et réessayez.';

  @override
  String oneLetterShiftMessage(String arg0, String arg1) {
    return 'Vous avez correctement transformé $arg0 en $arg1.';
  }

  @override
  String get mentalAbacusMessage => 'Votre calcul mental est de haut niveau.';

  @override
  String fractionMatcherMessage(String arg0) {
    return 'Vous avez marqué $arg0 points en faisant correspondre les représentations !';
  }

  @override
  String get spellingSprintMessage =>
      'Vous avez orthographié les 10 mots correctement !';

  @override
  String spellingSprintMessage1(String arg0) {
    return 'Vous avez orthographié $arg0 mots.';
  }

  @override
  String stopSignalMessage(String arg0) {
    return 'Vous avez obtenu $arg0 réponses correctes ! Ce test mesure votre capacité à inhiber une action prévue.';
  }

  @override
  String grammarPoliceMessage(String arg0) {
    return 'Fin du jeu ! Vous avez maintenu l\'ordre dans le monde de la grammaire. Score : $arg0';
  }

  @override
  String consonantReconstructMessage(String arg0) {
    return 'Vous avez reconstruit un score de $arg0 !';
  }

  @override
  String rhymeMasterMessage(String arg0, String arg1) {
    return 'Vous avez trouvé $arg0 rimes sur $arg1 !';
  }

  @override
  String vigilanceTaskMessage(String arg0, String arg1, String arg2) {
    return 'Succès : $arg0, Échecs : $arg1\nFausses alertes : $arg2';
  }

  @override
  String get silhouetteMatchOrthoMessage =>
      'Vous avez des compétences d\'alignement orthographique impeccables !';

  @override
  String get silhouetteMatchOrthoText => 'COMPRIS';

  @override
  String get silhouetteMatchOrthoText1 =>
      'Projection en perspective incorrecte ! Appuyez sur Reset pour réessayer.';

  @override
  String fibonacciMergeMessage(String arg0, String arg1) {
    return '$arg0 : $arg1';
  }

  @override
  String factorFinderMessage(String arg0) {
    return 'Vous avez marqué $arg0 points en trouvant tous les facteurs !';
  }

  @override
  String logicalSyllogismsMessage(String arg0) {
    return 'Vous avez résolu $arg0 syllogismes correctement !';
  }

  @override
  String get rotatingMazeMessage =>
      'Vous avez navigué avec succès dans le labyrinthe rotatif cinétique !';

  @override
  String get rotatingMazeText => 'COMPRIS';

  @override
  String get rotatingMazeText1 =>
      '🌀 Labyrinthe pivoté de 90° ! Grille décalée !';

  @override
  String get mathPathMessage =>
      'Vous avez trouvé le chemin qui correspond à la somme cible !';

  @override
  String get bridgesMessage =>
      'Vous avez connecté avec succès toutes les îles !';

  @override
  String compoundConnectMessage(String arg0, String arg1) {
    return 'Le mot composé est $arg0$arg1.';
  }

  @override
  String get pangramSprintMessage =>
      'Vous avez construit une phrase en utilisant les 26 lettres.';

  @override
  String get mirrorImageMessage =>
      'Vous avez parfaitement identifié le reflet.';

  @override
  String get mirrorImageText => 'IMAGE MIROIR';

  @override
  String reverseStroopMessage(String arg0) {
    return 'Vous avez marqué $arg0 points ! Gardez un œil sur les instructions.';
  }

  @override
  String get verbalAnalogiesMessage =>
      'Vous avez un esprit vif pour les relations.';

  @override
  String corsiBlocksMessage1(String arg0, String arg1) {
    return 'Vous avez rappelé $arg1 séquences ! Votre empan de mémoire spatiale a atteint $arg0.';
  }

  @override
  String wordLadderMessage(String arg0, String arg1, String arg2) {
    return 'Vous avez réussi à relier $arg0 à $arg1 en $arg2 étapes.';
  }

  @override
  String d2AttentionMessage(String arg0) {
    return 'Scan sélectif incroyable ! Score final : $arg0.';
  }

  @override
  String get d2AttentionText => 'COMMENT JOUER';

  @override
  String get d2AttentionText1 => 'COMPRIS';

  @override
  String get tangleFixMessage => 'Toutes les lignes sont claires et lisses.';

  @override
  String get distractorMatrixMessage =>
      'Incroyable ! Vous avez rappelé des motifs malgré les distracteurs mathématiques cognitifs !';

  @override
  String get distractorMatrixMessage1 =>
      'Les distracteurs vous ont eu ! Réentraînez votre mémoire de travail.';

  @override
  String sentenceUnscrambleMessage(String arg0) {
    return 'Vous avez reconstitué un score de $arg0 !';
  }

  @override
  String get kakuroMessage =>
      'Incroyable ! Vous avez fait correspondre parfaitement tous les segments de somme.';

  @override
  String symbolicFlankerMessage(String arg0, String arg1) {
    return 'Vous avez eu $arg0 bonnes réponses sur $arg1 !';
  }

  @override
  String stroopTestMessage(String arg0) {
    return 'Vous avez $arg0 bonnes réponses ! Concentrez-vous sur la couleur de l\'encre, pas sur le mot.';
  }

  @override
  String wisconsinCardSortingMessage(String arg0) {
    return 'Vous avez correctement trié $arg0 cartes !';
  }

  @override
  String nBackMessage(String arg0) {
    return 'Vous avez réussi $arg0 correspondances 2-back ! Votre mémoire de travail est vitale pour le multitâche.';
  }

  @override
  String rhythmMasterMessage(String arg0, String arg1) {
    return 'Vous avez $arg0 coups parfaits et $arg1 points !';
  }

  @override
  String groceryListMessage(String arg0, Object score) {
    return 'Vous avez marqué $arg0 points dans Liste de courses !';
  }

  @override
  String get groceryListText => 'JE SUIS';

  @override
  String get mirrorTracingMessage =>
      'Votre cerveau a réussi à recâbler sa coordination.';

  @override
  String moduloClockMessage(String arg0) {
    return 'Excellente coordination mathématique mentale modulaire ! Score : $arg0';
  }

  @override
  String moduloClockMessage1(String arg0, String arg1, String arg2) {
    return 'Vous avez réussi $arg0 sur $arg1 solutions d\'horloge modulaire. Score : $arg2';
  }

  @override
  String get crownMessage =>
      'Toutes les couronnes ont été placées avec succès avec une logique parfaite.';

  @override
  String dualCodingMessage(String arg0) {
    return 'Performance fantastique en double tâche ! Votre score de mémoire de travail : $arg0';
  }

  @override
  String inequalityDashMessage(String arg0) {
    return 'Vous avez marqué $arg0 points en faisant correspondre les inégalités !';
  }

  @override
  String sourceMonitoringMessage(String arg0, String arg1) {
    return 'Vous avez eu $arg0 bonnes réponses sur $arg1 !';
  }

  @override
  String get sourceMonitoringText => 'COMMENCER LE RAPPEL';

  @override
  String get memoryPalaceText => 'MOTS DISPONIBLES';

  @override
  String target10Message(String arg0) {
    return 'Vous avez marqué $arg0 points en faisant correspondre les nombres à 10 !';
  }

  @override
  String get paperFoldingMessage =>
      'Vous pouvez voir les motifs dans votre esprit.';

  @override
  String topologyText(String arg0, String arg1) {
    return '$arg0$arg1 / 10';
  }

  @override
  String get waterSortMessage =>
      'Vous avez trié toutes les couleurs parfaitement !';

  @override
  String anagramDefinitionMessage(String arg0) {
    return 'Le mot était bien \"$arg0\".';
  }

  @override
  String game2048Message(String arg0, String arg1, String arg2) {
    return '$arg0 : $arg1\n$arg2';
  }

  @override
  String game2048Message1(String arg0, String arg1) {
    return '$arg0 : $arg1';
  }

  @override
  String numericalEstimationMessage(String arg0) {
    return 'Vous avez fait $arg0 estimations correctes.';
  }

  @override
  String grammarSortMessage(String arg0) {
    return 'Vous avez classé $arg0 mots correctement !';
  }

  @override
  String vowelReconstructMessage(String arg0) {
    return 'Vous avez reconstruit un score de $arg0 !';
  }

  @override
  String spatialConflictMessage(String arg0, String arg1) {
    return 'Vous avez obtenu un score de $arg0 avec $arg1 erreurs !';
  }

  @override
  String get spatialConflictText => 'COMMENT JOUER';

  @override
  String get spatialConflictText1 => 'COMPRIS';

  @override
  String tracePathMessage(String arg0) {
    return 'Votre précision était de $arg0% !';
  }

  @override
  String ruleSwitcherMessage(String arg0, String arg1) {
    return 'Vous avez $arg0 bonnes réponses sur $arg1 !';
  }

  @override
  String collatzMessage(String arg0, String arg1) {
    return 'Cela vous a pris $arg0 étapes. Le minimum possible était $arg1.';
  }

  @override
  String get collatzText => '/ 2';

  @override
  String get collatzText1 => '+ 1';

  @override
  String get collatzText2 => '3n + 1';

  @override
  String divisibilityDashMessage(String arg0) {
    return 'Vous avez résolu $arg0 nombres !';
  }

  @override
  String switchTaskMessage(String arg0) {
    return 'Vous avez $arg0 bonnes réponses ! Le changement rapide est la clé de la flexibilité mentale.';
  }

  @override
  String sequenceSleuthMessage(String arg0) {
    return 'Vous avez résolu $arg0 séquences !';
  }

  @override
  String changeBlindnessMessage(String arg0) {
    return 'Vous avez trouvé $arg0 changements !';
  }

  @override
  String mentalRotationMessage(String arg0) {
    return 'Vous avez fait pivoter $arg0 formes correctement !';
  }

  @override
  String wordMastermindMessage(String arg0) {
    return 'Vous avez maîtrisé le code !\nLe mot était : $arg0';
  }

  @override
  String wordMastermindMessage1(String arg0) {
    return 'Le mot caché était : $arg0';
  }

  @override
  String wordMastermindText(String arg0) {
    return '$arg0';
  }

  @override
  String get simonSequenceMessage => 'Vous avez mémorisé les 10 tuiles !';

  @override
  String get simonSequenceMessage1 => 'Réessayez pour maîtriser la séquence.';

  @override
  String oxymoronHuntMessage(String arg0) {
    return 'Vous avez trouvé $arg0 oxymores !';
  }

  @override
  String spotlightTrackMessage(String arg0) {
    return 'Suivi spatial incroyable ! Vous avez marqué $arg0 points.';
  }

  @override
  String get spotlightTrackText => 'COMMENT JOUER';

  @override
  String get spotlightTrackText1 => 'COMPRIS';

  @override
  String get spotlightTrackText2 => 'COMMENCER LE TOUR';

  @override
  String vennNumbersMessage(String arg0) {
    return 'Vous avez catégorisé $arg0 nombres !';
  }

  @override
  String get vennNumbersText => 'AUCUN DES DEUX';

  @override
  String get vennNumbersText1 => 'LES DEUX';

  @override
  String get silhouetteMatchMessage =>
      'Votre cerveau est excellent pour la traduction de la 3D vers la 2D.';

  @override
  String sumSnakeMessage(String arg0) {
    return 'Cible $arg0 atteinte avec une précision parfaite !';
  }

  @override
  String get sumSnakeText => 'EFFACER LE CHEMIN';

  @override
  String percentagePeakMessage(String arg0) {
    return 'Vous avez résolu $arg0 problèmes de pourcentage !';
  }

  @override
  String trailMakingMessage(String arg0) {
    return 'Vous avez terminé $arg0 parcours ! Ce test mesure votre vitesse de recherche visuelle et votre flexibilité mentale.';
  }

  @override
  String matrixReasoningMessage(String arg0) {
    return 'Vous avez complété $arg0 matrices correctement !';
  }

  @override
  String get tentsAndTreesMessage =>
      'Vous avez placé toutes les tentes avec succès.';

  @override
  String klotskiMessage(String arg0) {
    return 'Glissement sensationnel ! Vous avez libéré le bloc Héros en $arg0 mouvements.';
  }

  @override
  String sumPyramidMessage(String arg0) {
    return 'Vous avez résolu $arg0 pyramides de sommes avec succès !';
  }

  @override
  String simonCommandMessage(String arg0) {
    return 'Excellente réponse sélective et concentration ! Score total : $arg0';
  }

  @override
  String simonCommandMessage1(String arg0, String arg1) {
    return 'Vous avez marqué $arg0 mais n\'avez pas atteint $arg1 correspondances à temps.';
  }

  @override
  String syllableStackMessage(String arg0) {
    return 'Vous avez accumulé un score de $arg0 !';
  }

  @override
  String get slitherlinkMessage =>
      'Génial ! Vous avez réussi à terminer le puzzle de boucle.';

  @override
  String quickMathMessage(String arg0) {
    return 'Vous avez résolu $arg0 problèmes !';
  }

  @override
  String commonDenominatorMessage(String arg0) {
    return 'Vous avez résolu $arg0 problèmes de PGCD/PPCM !';
  }

  @override
  String chainReactionMessage(String arg0, String arg1) {
    return 'Votre score final est $arg0. Vous avez construit une chaîne de $arg1 mots.';
  }

  @override
  String chainReactionText(String arg0) {
    return '$arg0';
  }

  @override
  String get associativePairsMessage =>
      'Brillant ! Vous avez associé les traits visuels sans faille.';

  @override
  String get associativePairsMessage1 =>
      'Mauvaise association ! Aiguisez votre mémoire des liens et réessayez.';

  @override
  String portmanteauSplitMessage(String arg0) {
    return 'Vous avez séparé $arg0 mots-valises !';
  }

  @override
  String get magicSquaresText => 'EFFACER';

  @override
  String alphabetSudokuText(String arg0) {
    return 'Erreur : $arg0';
  }

  @override
  String get pipesMessage =>
      'Vous avez connecté tous les tuyaux et rempli la grille.';

  @override
  String get dualMirrorMessage =>
      'Vous avez navigué les deux icônes vers leurs cibles !';

  @override
  String binaryCodeMessage(String arg0) {
    return 'Traduction décimale rapide sensationnelle ! Score final : $arg0';
  }

  @override
  String binaryCodeMessage1(String arg0, String arg1) {
    return 'Vous avez correctement converti $arg0 nombres binaires. Score : $arg1';
  }

  @override
  String oddOneOutMessage(String arg0) {
    return 'Vous avez trouvé 50 intrus ! Score final : $arg0';
  }

  @override
  String oddOneOutMessage1(String arg0) {
    return 'Votre score : $arg0';
  }

  @override
  String letterBridgeMessage(String arg0) {
    return 'Vous avez trouvé la lettre pont : $arg0';
  }

  @override
  String get imReady => 'JE SUIS PRÊT';

  @override
  String get soptTitle => 'Pointage auto-commandé';

  @override
  String get soptSubtitle =>
      'Appuyez sur une carte différente à chaque fois. Les positions bougent !';

  @override
  String get soptWinTitle => 'Maître de séquence !';

  @override
  String soptGameOverMessage(int score) {
    return 'Vous avez marqué $score points en suivant avec succès les cartes mélangées !';
  }

  @override
  String get soptChooseNovel => 'Appuyez sur une nouvelle carte';

  @override
  String get soptGreatJob => 'Super travail !';

  @override
  String get soptAlreadyTapped => 'Déjà exploité !';

  @override
  String get soptGrid => 'Grille';

  @override
  String get contRecogTitle => 'Reconnaissance continue';

  @override
  String get contRecogSubtitle =>
      'Avez-vous déjà vu cette carte lors de cette session ?';

  @override
  String get contRecogWinTitle => 'Génie de la reconnaissance !';

  @override
  String contRecogGameOverMessage(int score) {
    return 'Vous avez obtenu $score reconnaissances correctes !';
  }

  @override
  String get contRecogCorrect => 'Correct!';

  @override
  String get contRecogWrong => 'Faux!';

  @override
  String get contRecogOldOrNew => 'Est-ce ancien ou nouveau ?';

  @override
  String get contRecogNew => 'Nouveau';

  @override
  String get contRecogOld => 'Vieux';

  @override
  String get contRecogSeenPool => 'Piscine vue';

  @override
  String get dnmsTitle => 'Mémoire non correspondante';

  @override
  String get dnmsSubtitle =>
      'Appuyez sur la carte qui ne figurait pas dans l\'échantillon mémorisé.';

  @override
  String get dnmsWinTitle => 'Expert sans correspondance !';

  @override
  String dnmsGameOverMessage(int score) {
    return 'Vous avez obtenu $score bonnes réponses en cas de non-correspondance différée !';
  }

  @override
  String get dnmsChooseNovel => 'Appuyez sur la nouvelle carte';

  @override
  String get dnmsMemorizeSample => 'Mémorisez cette carte';

  @override
  String get dnmsWaitForIt => 'Attends...';

  @override
  String get dnmsExcellent => 'Excellent!';

  @override
  String get dnmsSampleTapped => 'C\'était l\'échantillon !';

  @override
  String get dnmsCards => 'Cartes';

  @override
  String get symSpanTitle => 'Portée de symétrie';

  @override
  String get symSpanSubtitle =>
      'Rappelez-vous les modèles de cellules tout en identifiant la symétrie verticale.';

  @override
  String get symSpanWinTitle => 'Maître de la symétrie !';

  @override
  String symSpanGameOverMessage(int score) {
    return 'Vous avez marqué $score points en rappelant les dispositions et en identifiant la symétrie !';
  }

  @override
  String get symSpanMemorizeRed =>
      'Mémoriser l\'emplacement des globules rouges';

  @override
  String get symSpanIsSymmetric => 'Le motif est-il symétrique ?';

  @override
  String get symSpanRecallSequence => 'Séquence de rappel dans le bon ordre';

  @override
  String get symSpanGreatJob => 'Super travail !';

  @override
  String get symSpanTryAgain => 'Essayer à nouveau!';

  @override
  String get symSpanLength => 'Longueur';

  @override
  String get readingSpanTitle => 'Durée de lecture';

  @override
  String get readingSpanSubtitle =>
      'Vérifiez les phrases tout en mémorisant une séquence de lettres.';

  @override
  String get readingSpanWinTitle => 'Expert en lecture !';

  @override
  String readingSpanGameOverMessage(int score) {
    return 'Vous avez marqué $score points dans le défi de mémoire Reading Span !';
  }

  @override
  String get readingSpanTrueFalse =>
      'Cette affirmation est-elle vraie ou fausse ?';

  @override
  String get readingSpanMemorizeLetter => 'Mémorisez cette lettre';

  @override
  String get readingSpanRecallLetters => 'Rappeler les lettres dans l\'ordre';

  @override
  String get readingSpanGreatJob => 'Super travail !';

  @override
  String get readingSpanTryAgain => 'Essayer à nouveau!';

  @override
  String readingSpanYourSequence(String sequence) {
    return 'Votre séquence : $sequence';
  }

  @override
  String get readingSpanLength => 'Longueur';

  @override
  String get readingSpanSentence1 => 'Le soleil se lève à l\'est.';

  @override
  String get readingSpanSentence2 => 'La glace est bouillante.';

  @override
  String get readingSpanSentence3 =>
      'Les poissons peuvent respirer sous l\'eau.';

  @override
  String get readingSpanSentence4 =>
      'Les chiens ont des ailes et peuvent voler.';

  @override
  String get readingSpanSentence5 => 'L\'eau gèle à 0 degré Celsius.';

  @override
  String get readingSpanSentence6 =>
      'Les chats aboient comme des petits chiens.';

  @override
  String get readingSpanSentence7 =>
      'Les arbres ont des feuilles vertes en été.';

  @override
  String get readingSpanSentence8 => 'La pluie tombe du sol vers le haut.';

  @override
  String get readingSpanSentence9 => 'Un triangle a quatre côtés égaux.';

  @override
  String get readingSpanSentence10 => 'Les pommes sont un type de fruit sucré.';

  @override
  String get readingSpanSentence11 => 'La lune est faite de fromage cheddar.';

  @override
  String get readingSpanSentence12 =>
      'Les automobiles ont des roues pour rouler.';

  @override
  String get readingSpanSentence13 => 'Le feu est glacial.';

  @override
  String get readingSpanSentence14 =>
      'Le papier est fabriqué à partir de bois transformé.';

  @override
  String get readingSpanSentence15 =>
      'Les oiseaux ont des plumes pour les aider à voler.';

  @override
  String get readingSpanSentence16 => 'Les bananes poussent sur les pins.';

  @override
  String get readingSpanSentence17 =>
      'Un éléphant est plus petit qu\'une fourmi.';

  @override
  String get readingSpanSentence18 =>
      'Les livres contiennent des pages de texte imprimées.';

  @override
  String get countingSpanTitle => 'Durée de comptage';

  @override
  String get countingSpanSubtitle =>
      'Comptez uniquement les cercles bleus. Rappelez-vous ensuite la séquence des comptes.';

  @override
  String get countingSpanWinTitle => 'Génie du comptage !';

  @override
  String countingSpanGameOverMessage(int score) {
    return 'Vous avez marqué $score points dans le défi de mémoire Counting Span !';
  }

  @override
  String get countingSpanCountCircles => 'Comptez uniquement les cercles bleus';

  @override
  String get countingSpanRecallCounts =>
      'Les rappels comptent dans le bon ordre';

  @override
  String get countingSpanGreatJob => 'Super travail !';

  @override
  String get countingSpanTryAgain => 'Essayer à nouveau!';

  @override
  String countingSpanYourSequence(String sequence) {
    return 'Votre séquence : $sequence';
  }

  @override
  String get countingSpanLength => 'Longueur';

  @override
  String get objDispTitle => 'Déplacement d\'objet';

  @override
  String get objDispSubtitle =>
      'Mémorisez la mise en page. Recherchez et appuyez sur le seul objet qui change de position.';

  @override
  String get objDispWinTitle => 'Génie spatial !';

  @override
  String objDispGameOverMessage(int score) {
    return 'Vous avez correctement identifié les objets déplacés $score !';
  }

  @override
  String get objDispMemorizeAll => 'Mémorisez tous les emplacements';

  @override
  String get objDispWaitingShift =>
      'En attente du changement de disposition...';

  @override
  String get objDispTapMoved => 'Appuyez sur l\'objet qui a bougé';

  @override
  String get objDispExcellent => 'Excellent!';

  @override
  String get objDispWrongObject => 'Mauvais objet !';

  @override
  String get objDispItems => 'Articles';

  @override
  String get mandalaTitle => 'Rappel de mandalas';

  @override
  String get mandalaSubtitle =>
      'Mémorisez la configuration des couleurs. Choisissez les couleurs et repeignez les carreaux.';

  @override
  String get mandalaWinTitle => 'Artiste Mandala!';

  @override
  String mandalaGameOverMessage(int score) {
    return 'Vous avez marqué $score points en recréant des dispositions géométriques colorées !';
  }

  @override
  String get mandalaMemorizeColors => 'Mémoriser les couleurs des carreaux';

  @override
  String get mandalaPaintCells =>
      'Peindre les cellules pour qu\'elles correspondent à l\'original';

  @override
  String get mandalaExcellent => 'Excellent!';

  @override
  String get mandalaIncorrectMatch => 'Correspondance incorrecte !';

  @override
  String get mandalaSubmitRepaint => 'Repeindre';

  @override
  String get mandalaTiles => 'Carrelage';

  @override
  String get runningSpanTitle => 'Durée de fonctionnement';

  @override
  String get runningSpanSubtitle =>
      'Regardez les lettres. Lorsqu\'ils s\'arrêtent, saisissez les N dernières lettres dans l\'ordre.';

  @override
  String get runningSpanWinTitle => 'Maître tampon !';

  @override
  String runningSpanGameOverMessage(int score) {
    return 'Vous avez marqué $score points dans Running Memory Span !';
  }

  @override
  String runningSpanPrepareRecall(int count) {
    return 'Préparez-vous à rappeler les $count dernières lettres';
  }

  @override
  String get runningSpanWatchCarefully => 'Regardez attentivement...';

  @override
  String runningSpanEnterLast(int count) {
    return 'Saisissez les $count dernières lettres';
  }

  @override
  String get runningSpanGreatJob => 'Super travail !';

  @override
  String get runningSpanIncorrectBuffer => 'Tampon incorrect !';

  @override
  String runningSpanRecallLast(int count) {
    return 'Rappeler le dernier $count';
  }

  @override
  String get runningSpanStopsRandomly =>
      'Le flux s\'arrête de manière aléatoire !';

  @override
  String runningSpanEntered(String sequence) {
    return 'Entré : $sequence';
  }

  @override
  String get runningSpanNItems => 'N-articles';

  @override
  String get spatialCabinetTitle => 'Armoires spatiales';

  @override
  String get spatialCabinetSubtitle =>
      'Mémorisez quel tiroir d’armoire contient quel objet.';

  @override
  String get spatialCabinetWinTitle => 'Expert en cabinet !';

  @override
  String spatialCabinetGameOverMessage(int score) {
    return 'Vous avez marqué $score points dans la mémoire de l\'armoire spatiale !';
  }

  @override
  String get spatialCabinetMemorize =>
      'Mémoriser les emplacements des articles';

  @override
  String spatialCabinetWhereIs(String itemName) {
    return 'Où est le $itemName ?';
  }

  @override
  String get spatialCabinetCorrect => 'Correct!';

  @override
  String get spatialCabinetWrongDrawer => 'Mauvais tiroir !';

  @override
  String get spatialCabinetItems => 'Articles';

  @override
  String get cabinetItemKey => 'Clé';

  @override
  String get cabinetItemApple => 'Pomme';

  @override
  String get cabinetItemDiamond => 'Diamant';

  @override
  String get cabinetItemBook => 'Livre';

  @override
  String get cabinetItemUmbrella => 'Parapluie';

  @override
  String get cabinetItemCoffee => 'Café';

  @override
  String get cabinetItemLock => 'Verrouillage';

  @override
  String get cabinetItemPet => 'Animal de compagnie';

  @override
  String get cabinetItemCar => 'Voiture';

  @override
  String get gamesTitleLabel => 'JEUX';

  @override
  String get yourFavorites => 'VOS FAVORIS';

  @override
  String get readyForWorkout => 'PRÊT POUR VOTRE ENTRAÎNEMENT QUOTIDIEN ?';

  @override
  String get greatStartKeepGoing => 'BON DÉBUT ! CONTINUEZ AINSI.';

  @override
  String get onFireToday => 'VOUS ÊTES EN FORME AUJOURD\'HUI !';

  @override
  String get incredibleSolvingToday => 'RÉSOLUTIONS INCROYABLES AUJOURD\'HUI !';

  @override
  String get newGameLabel => 'NOUVEAU';

  @override
  String get slitherlinkTitle => 'Slitherlink';

  @override
  String get slitherlinkSubtitle =>
      'BOUCLEZ LA GRILLE DE PINS EN UTILISANT LES INDICES NUMÉRIQUES.';

  @override
  String get futoshikiTitle => 'Futoshiki';

  @override
  String get futoshikiSubtitle =>
      'REMPLISSEZ LES GRILLES AVEC DES INDICES PLUS GRAND QUE.';

  @override
  String get kakuroTitle => 'Kakuro';

  @override
  String get kakuroSubtitle =>
      'RÉSOLVEZ DES MOTS CROISÉS AVEC DES CHIFFRES ET DES SOMMES.';

  @override
  String get inequalityDashTitle => 'Sprint d\'Inégalités';

  @override
  String get inequalityDashSubtitle =>
      'RÉSOLVEZ DES INÉGALITÉS SOUS LA PRESSION DU TEMPS.';

  @override
  String get factorFinderTitle => 'Chercheur de Facteurs';

  @override
  String get factorFinderSubtitle =>
      'IDENTIFIEZ TOUS LES FACTEURS DES NOMBRES CIBLES.';

  @override
  String get collatzTitle => 'Chemin de Collatz';

  @override
  String get collatzSubtitle => 'NAVIGUEZ DANS LA SÉQUENCE 3N+1.';

  @override
  String get sumPyramidTitle => 'Pyramide de Sommes';

  @override
  String get sumPyramidSubtitle =>
      'REMPLISSEZ LES CELLULES DE LA PYRAMIDE AVEC DES INDICES MATHÉMATIQUES DE SOMME.';

  @override
  String get target10Title => 'Cible 10';

  @override
  String get target10Subtitle =>
      'COMBINEZ LES TUILES NUMÉRIQUES POUR OBTENIR DES SOMMES DE DIX.';

  @override
  String get fractionMatcherTitle => 'Correspondance de Fractions';

  @override
  String get fractionMatcherSubtitle =>
      'FAITES CORRESPONDRE LES FRACTIONS ÉQUIVALENTES VISUELLEMENT.';

  @override
  String get dualCodingTitle => 'Double Codage';

  @override
  String get dualCodingSubtitle =>
      'FAITES CORRESPONDRE LES LETTRES ET LES SYMBOLES SIMULTANÉMENT.';

  @override
  String get distractorMatrixTitle => 'Matrice de Distracteurs';

  @override
  String get distractorMatrixSubtitle =>
      'TROUVEZ LES FORMES CIBLES PARMI LES DISTRACTEURS.';

  @override
  String get temporalOrderTitle => 'Ordre Temporel';

  @override
  String get temporalOrderSubtitle =>
      'RAPPELEZ-VOUS LA SÉQUENCE CHRONOLOGIQUE.';

  @override
  String get associativePairsTitle => 'Paires Associatives';

  @override
  String get associativePairsSubtitle =>
      'ASSOCIEZ ET FAITES CORRESPONDRE LES SYMBOLES CORRESPONDANTS.';

  @override
  String get blockCount3dTitle => 'Comptage de Blocs 3D';

  @override
  String get blockCount3dSubtitle =>
      'COMPTEZ LES BLOCS DANS UN ESPACE TRIDIMENSIONNEL.';

  @override
  String get rotatingMazeTitle => 'Labyrinthe Rotatif';

  @override
  String get rotatingMazeSubtitle =>
      'FAITES PIVOTER LES LABYRINTHES POUR GUIDER LES BALLES VERS LA SORTIE.';

  @override
  String get silhouetteMatchOrthoTitle =>
      'Correspondance de Silhouettes (Ortho)';

  @override
  String get silhouetteMatchOrthoSubtitle =>
      'FAITES CORRESPONDRE LES OBJETS 3D AVEC LES OMBRES ORTHO.';

  @override
  String get spatialConflictTitle => 'Conflit Spatial';

  @override
  String get spatialConflictSubtitle =>
      'RÉSOLVEZ LES DISCRÉPANCES ENTRE LE TEXTE ET LA DIRECTION.';

  @override
  String get spotlightTrackTitle => 'Poursuite de Projecteur';

  @override
  String get spotlightTrackSubtitle =>
      'SUIVEZ LES ÉLÉMENTS CLIGNOTANTS DANS LES OMBRES EN MOUVEMENT.';

  @override
  String get d2AttentionTitle => 'Attention d2';

  @override
  String get d2AttentionSubtitle =>
      'APPUYEZ SUR LES SYMBOLES CIBLES AVEC DES CRITÈRES STRICTS.';

  @override
  String get dualMirrorTitle => 'Navigation Miroir Double';

  @override
  String get dualMirrorSubtitle => 'NAVIGUEZ DANS DEUX LABYRINTHES À LA FOIS.';

  @override
  String get contextCluesTitle => 'Indices de Contexte';

  @override
  String get contextCluesSubtitle =>
      'DÉDUISEZ LES MOTS CACHÉS À PARTIR D\'INDICES CONTEXTUELS.';

  @override
  String get digitSpanReverseSubtitle =>
      'RAPPELEZ-VOUS LES CHIFFRES DANS L\'ORDRE INVERSE.';

  @override
  String get faceNameAssociationSubtitle =>
      'RAPPELEZ-VOUS LES NOMS POUR DIVERS VISAGES PRÉSENTÉS.';

  @override
  String get staircaseMemorySubtitle =>
      'MÉMORISEZ LES BLOCS DANS UNE SÉQUENCE GRADUELLE.';

  @override
  String get choiceReactionTimeSubtitle =>
      'APPUYEZ RAPIDEMENT SUR LES BOUTONS SPÉCIFIQUES CORRESPONDANT AUX INDICES.';

  @override
  String get attentionalBlinkSubtitle =>
      'DÉTECTEZ LES CIBLES RAPIDES CLIGNOTANT DANS LES FLUX.';

  @override
  String get visualStatisticalLearningSubtitle =>
      'APPRENEZ LES MODÈLES DE FORMES TEMPORELLES VISUELLEMENT.';

  @override
  String get sternbergTaskSubtitle =>
      'RAPPELEZ-VOUS SI LE SYMBOLE ÉTAIT DANS L\'ENSEMBLE DE MÉMOIRE.';

  @override
  String get operationSpanSubtitle =>
      'RÉSOLVEZ LES MATHS ET RAPPELEZ-VOUS LES CHAÎNES ALPHABÉTIQUES.';

  @override
  String get continuousRecognitionTitle => 'Reconnaissance Continue';

  @override
  String get continuousRecognitionSubtitle =>
      'IDENTIFIEZ SI LA CARTE PRÉSENTÉE EST ANCIENNE OU NOUVELLE.';

  @override
  String get symmetrySpanTitle => 'Amplitude de Symétrie';

  @override
  String get symmetrySpanSubtitle =>
      'RAPPELEZ-VOUS LES COORDONNÉES DES CELLULES PARMI LES DÉCISIONS DE SYMÉTRIE VERTICALE.';

  @override
  String get objectDisplacementTitle => 'Déplacement d\'Objets';

  @override
  String get objectDisplacementSubtitle =>
      'ÉTUDIEZ LES PLACEMENTS ET APPUYEZ SUR LE SEUL OBJET QUI A BOUGÉ.';

  @override
  String get mandalaRecallTitle => 'Mémoire de Mandala';

  @override
  String get mandalaRecallSubtitle =>
      'MÉMORISEZ LES TUILES DE COULEUR ET REPEIGNEZ LES MANDALAS DEPUIS LA PALETTE.';

  @override
  String get runningMemorySpanTitle => 'Amplitude de Mémoire Courante';

  @override
  String get runningMemorySpanSubtitle =>
      'SURVEILLEZ LES LETTRES COURANTES ET RAPPELEZ-VOUS LES N DERNIERS ÉLÉMENTS.';

  @override
  String get spatialCabinetMemoryTitle => 'Cabinets Spatiaux';

  @override
  String get spatialCabinetMemorySubtitle =>
      'MÉMORISEZ ET LOCALISEZ LES ÉLÉMENTS DERRIÈRE LES PORTES DES CABINETS.';

  @override
  String get pathRecallSubtitle =>
      'MÉMORISEZ ET RÉPÉTEZ LES SÉLECTIONS DE CHEMINS.';

  @override
  String get objectShuffleSubtitle =>
      'SUIVEZ LES ÉLÉMENTS MÉLANGÉS SOUS DES COUPES PROFONDES.';

  @override
  String get groceryListSubtitle =>
      'MÉMORISEZ ET COCHEZ LES ÉLÉMENTS SUR LA LISTE.';

  @override
  String get quickMathSubtitle =>
      'RÉSOLVEZ DES QUESTIONS D\'ARITHMÉTIQUE À VITESSE MAXIMALE.';

  @override
  String get mathGuessTitle => 'Devinette Mathématique';

  @override
  String get mathGuessSubtitle => 'DEVINEZ LE NOMBRE CACHÉ EN 15 CHANCES.';

  @override
  String get reflexTapSubtitle =>
      'APPUYEZ SUR LES STIMULI AUSSI VITE QUE HUMAINEMENT POSSIBLE.';

  @override
  String get pixelMimicSubtitle =>
      'IMITEZ LES MODÈLES DE CONCEPTION SUR DES GRILLES DE PIXELS.';

  @override
  String get simonSequenceSubtitle =>
      'RÉPÉTEZ LES SÉQUENCES DE FORMES DE MÉMOIRE.';

  @override
  String get slidePuzzleSubtitle =>
      'RÉARRANGEZ LES TUILES DE LA GRILLE COULISSANTE CARRÉE.';

  @override
  String get findWordTitle => 'Trouver le Mot';

  @override
  String get schulteTableSubtitle =>
      'APPUYEZ SUR LES CHIFFRES DE UN À VINGT-CINQ.';

  @override
  String get simonCommandTitle => 'Commande de Simon';

  @override
  String get simonCommandSubtitle =>
      'EFFECTUEZ LES INSTRUCTIONS VOCALES RAPIDEMENT.';

  @override
  String get binaryCodeTitle => 'Vitesse Binaire';

  @override
  String get binaryCodeSubtitle => 'TRADUISEZ LES CODES BINAIRES EN DÉCIMAL.';

  @override
  String get moduloClockTitle => 'Horloge Modulo';

  @override
  String get moduloClockSubtitle =>
      'CALCULEZ DES ÉQUATIONS MATHÉMATIQUES À L\'AIDE D\'HORLOGES.';

  @override
  String get chimpTestTitle => 'Test du Chimpanzé';

  @override
  String get chimpTestSubtitle =>
      'APPUYEZ SUR DES CHIFFRES ALÉATOIRES DANS L\'ORDRE CROISSANT.';

  @override
  String get relationalMemoryTitle => 'Mémoire Relationnelle';

  @override
  String get relationalMemorySubtitle =>
      'RAPPELEZ-VOUS LES POSITIONS EXACTES DES ÉLÉMENTS DE LA GRILLE.';

  @override
  String get factBinderTitle => 'Classeur de Faits';

  @override
  String get factBinderSubtitle =>
      'CONNECTEZ LES SYMBOLES ET RAPPELEZ-VOUS LES ÉNONCÉS.';

  @override
  String get sourceMonitoringTitle => 'Surveillance de Source';

  @override
  String get sourceMonitoringSubtitle => 'RAPPELEZ-VOUS LE CONTEXTE.';

  @override
  String get klotskiTitle => 'Évasion de Klotski';

  @override
  String get klotskiSubtitle =>
      'FAITES GLISSER LES BLOCS POUR ATTEINDRE LES SORTIES.';

  @override
  String get homophoneHuntSubtitle =>
      'Choisissez l\'homophone correctement orthographié';

  @override
  String get laserLinkTitle => 'Lien laser';

  @override
  String get laserLinkSubtitle =>
      'Faites pivoter les miroirs pour réfléchir les lasers et alimenter toutes les cibles.';

  @override
  String get laserLinkCongrats =>
      'Réflexion de précision ! Vous avez alimenté avec succès toute la grille.';

  @override
  String get crossSectionSliceTitle => 'Coupe transversale';

  @override
  String get crossSectionSliceSubtitle =>
      'Identifiez la section transversale 2D correcte d\'un objet 3D sous un angle spécifique.';

  @override
  String get crossSectionSliceCongrats =>
      'Visualisation 3D incroyable ! Vous avez vu clair à travers cette forme.';

  @override
  String get shadowPivotTitle => 'Pivot d\'ombre';

  @override
  String get shadowPivotCongrats =>
      'Raisonnement spatial dynamique ! Vous maîtrisez l\'ombre et la lumière.';

  @override
  String get shadowPivotSubtitle =>
      'Prédisez l\'ombre portée par un objet 3D lorsqu\'il tourne sur différents axes.';

  @override
  String get interlockPuzzleTitle => 'Puzzle d\'imbrication';

  @override
  String get interlockPuzzleSubtitle =>
      'Démontez ou assemblez des blocs imbriqués complexes dans le bon ordre.';

  @override
  String get interlockPuzzleCongrats =>
      'Déconstruction logique ! Vous avez résolu l\'énigme parfaitement.';

  @override
  String get pathIntersectTitle => 'Intersection de chemins';

  @override
  String get pathIntersectSubtitle =>
      'Naviguez sur plusieurs chemins simultanément pour atteindre leurs cibles respectives sans collision.';

  @override
  String get pathIntersectCongrats =>
      'Navigation synchronisée ! Vous avez atteint toutes les cibles sans faute.';

  @override
  String get negativeSpaceDetectionTitle => 'Espace négatif';

  @override
  String get negativeSpaceDetectionSubtitle =>
      'Identifiez la forme formée par l\'espace vide entre les objets.';

  @override
  String get negativeSpaceDetectionCongrats =>
      'Perception aiguë ! Vous maîtrisez l\'art de voir ce qui n\'est pas là.';

  @override
  String get compassMazeTitle => 'Labyrinthe à boussole';

  @override
  String get compassMazeSubtitle =>
      'Naviguez dans un labyrinthe où les directions de mouvement changent en fonction de l\'orientation de votre boussole.';

  @override
  String get compassMazeCongrats =>
      'Navigation experte ! Vous avez trouvé la sortie à travers les directions changeantes.';

  @override
  String get complexFoldingNetsTitle => 'Filets de pliage';

  @override
  String get complexFoldingNetsSubtitle =>
      'Déterminez quelle forme 3D complexe sera formée en pliant un filet 2D non standard.';

  @override
  String get complexFoldingNetsCongrats =>
      'Logique de pliage avancée ! Vous avez réussi à visualiser la forme 3D.';

  @override
  String get compassMazeMessage =>
      'Naviguez dans le labyrinthe à l\'aide de la boussole.';

  @override
  String get negativeSpaceDetectionMessage =>
      'Identifiez l\'objet caché dans l\'espace.';

  @override
  String get shikakuTitle => 'Shikaku';

  @override
  String get shikakuSubtitle =>
      'DIVISEZ LA GRILLE EN CARRÉS ET RECTANGLES CORRESPONDANTS AUX CHIFFRES.';

  @override
  String get countdownMathTitle => 'Mathématiques du compte à rebours';

  @override
  String get countdownMathSubtitle =>
      'COMBINEZ DES NOMBRES ALÉATOIRES POUR CALCULER LA CIBLE À TROIS CHIFFRES.';

  @override
  String get narrativeRecallTitle => 'Rappel narratif';

  @override
  String get narrativeRecallSubtitle =>
      'LISEZ UNE HISTOIRE ET RAPPELEZ DES DÉTAILS QUANTITATIFS ET FACTUELS SPÉCIFIQUES.';

  @override
  String get shellGameTitle => 'Jeu de coquillages';

  @override
  String get shellGameSubtitle =>
      'SUIVEZ UNE BALLE CACHÉE PENDANT QUE LES TASSES SHUFFLING ÉCHANGENT DE PLACE.';

  @override
  String get typoglycemiaDecoderTitle => 'Décodeur de typoglycémie';

  @override
  String get typoglycemiaDecoderSubtitle =>
      'Déchiffrez et lisez rapidement les phrases confuses.';

  @override
  String get shapeShifterTitle => 'Changeur de forme';

  @override
  String get shapeShifterSubtitle =>
      'Appuyez sur la combinaison forme-couleur cible.';

  @override
  String get gokigenNanameTitle => 'Gokigen Naname';

  @override
  String get gokigenNanameSubtitle =>
      'Dessinez des diagonales pour relier des points sans boucles.';

  @override
  String get matrixMultiplierTitle => 'Multiplicateur matriciel';

  @override
  String get matrixMultiplierSubtitle =>
      'Sélectionnez une ligne et une colonne à multiplier par rapport à la cible.';

  @override
  String get wordAssociationRecallTitle => 'Association de mots';

  @override
  String get wordAssociationRecallSubtitle =>
      'Rappelez-vous les associations de mots appariés de mémoire.';

  @override
  String get gearRotationTitle => 'Rotation des engrenages';

  @override
  String get gearRotationSubtitle =>
      'Prédisez le sens de rotation du dernier engrenage.';

  @override
  String get wordWheelTitle => 'Roue des mots';

  @override
  String get wordWheelSubtitle =>
      'Créez des mots en utilisant les lettres de la roue, y compris la lettre centrale.';

  @override
  String get oddEvenFlashTitle => 'Flash impair-pair';

  @override
  String get oddEvenFlashSubtitle =>
      'Faites rapidement correspondre la parité des nombres avec la règle de couleur.';

  @override
  String get norinoriTitle => 'Norinori';

  @override
  String get norinoriSubtitle =>
      'Ombrez exactement deux cellules connectées dans chaque pièce.';

  @override
  String get algebraicBalanceTitle => 'Équilibre algébrique';

  @override
  String get algebraicBalanceSubtitle =>
      'Résolvez les équations pour trouver la somme cible.';

  @override
  String get patternSequenceDrawTitle => 'Rappel de modèle';

  @override
  String get patternSequenceDrawSubtitle =>
      'Répétez la séquence de chemin animé sur la grille.';

  @override
  String get tangramTitle => 'Puzzle Tangram';

  @override
  String get tangramSubtitle =>
      'Disposez les formes pour remplir la silhouette cible.';

  @override
  String get semanticAssociationTitle => 'Mot d\'association';

  @override
  String get semanticAssociationSubtitle =>
      'Trouvez le mot reliant les trois indices.';

  @override
  String get peripheralFocusTitle => 'Mise au point périphérique';

  @override
  String get peripheralFocusSubtitle =>
      'Réagissez aux panneaux latéraux clignotants tout en résolvant des mathématiques.';

  @override
  String get masyuTitle => 'Boucle Masyu';

  @override
  String get masyuSubtitle =>
      'Dessinez une seule boucle correspondant aux règles du cercle Masyu.';

  @override
  String get mathMazeTitle => 'Labyrinthe mathématique';

  @override
  String get mathMazeSubtitle =>
      'Tracez un chemin qui correspond au total cible.';

  @override
  String get storyBuilderTitle => 'Créateur d\'histoire';

  @override
  String get storyBuilderSubtitle =>
      'Reconstituez la séquence chronologique de l’histoire.';

  @override
  String get mirrorMazeTitle => 'Labyrinthe de miroirs';

  @override
  String get mirrorMazeSubtitle =>
      'Redirigez un faisceau laser à l’aide de miroirs diagonaux.';

  @override
  String get wordGridConnectionTitle => 'Connexions de mots';

  @override
  String get wordGridConnectionSubtitle =>
      'Regroupez 16 mots en quatre catégories de quatre.';

  @override
  String get shapeShifterPeripheralTitle => 'Formes périphériques';

  @override
  String get shapeShifterPeripheralSubtitle =>
      'Suivez les changements de forme périphérique tout en faisant correspondre les valeurs centrales.';

  @override
  String get soundWaveMatchTitle => 'Correspondance des ondes sonores';

  @override
  String get soundWaveMatchSubtitle =>
      'Appuyez lorsque la fréquence de l\'onde visuelle s\'aligne avec les changements de hauteur.';

  @override
  String get multiTrackCounterTitle => 'Compteur multipiste';

  @override
  String get multiTrackCounterSubtitle =>
      'Appuyez lorsqu\'un compteur augmente jusqu\'à un multiplicateur cible.';

  @override
  String get colorWordMatchUpTitle => 'Correspondance des couleurs';

  @override
  String get colorWordMatchUpSubtitle =>
      'Déterminez si deux mots colorés correspondent en fonction des règles changeantes.';

  @override
  String get signalAndNoiseTitle => 'Signal et bruit';

  @override
  String get signalAndNoiseSubtitle =>
      'Localisez les caractères alphanumériques cibles cachés dans le bruit statique.';

  @override
  String get focusTunnelTitle => 'Tunnel de mise au point';

  @override
  String get focusTunnelSubtitle =>
      'Identifiez les symboles correspondants apparaissant sur les parois du tunnel en mouvement.';

  @override
  String get targetPursuerTitle => 'Poursuivant de la cible';

  @override
  String get targetPursuerSubtitle =>
      'Suivez plusieurs cercles qui se chevauchent et sélectionnez la cible d\'origine.';

  @override
  String get gridGazeTitle => 'Regard de grille';

  @override
  String get gridGazeSubtitle =>
      'Identifiez quelle cellule de la grille a clignoté avec une durée différente.';

  @override
  String get doubleTroubleTitle => 'Double problème';

  @override
  String get doubleTroubleSubtitle =>
      'Jouez simultanément à deux jeux simples distincts sur écran partagé.';

  @override
  String get syncRhythmTitle => 'Rythme de synchronisation';

  @override
  String get syncRhythmSubtitle =>
      'Appuyez lorsque le balayage du métronome visuel correspond au rythme syncopé.';

  @override
  String get ghostTapTitle => 'Robinet fantôme';

  @override
  String get ghostTapSubtitle =>
      'Appuyez lorsque l\'impulsion invisible atteint sa hauteur maximale.';

  @override
  String get attentionalRsvpTitle => 'RSVP attentionnel';

  @override
  String get attentionalRsvpSubtitle =>
      'Identifiez les chiffres apparaissant en flash rapide des lettres en série.';

  @override
  String get colorMazeNavTitle => 'Navigation dans le labyrinthe de couleurs';

  @override
  String get colorMazeNavSubtitle =>
      'Parcourez les tuiles du labyrinthe en faisant correspondre les couleurs d\'autorisation dynamiques.';

  @override
  String get dynamicSalienceTitle => 'Saillance dynamique';

  @override
  String get dynamicSalienceSubtitle =>
      'Trouvez la forme en mouvement avec une dynamique légèrement différente.';

  @override
  String get chalkAndTalkTitle => 'Craie et discussion';

  @override
  String get chalkAndTalkSubtitle =>
      'Tapez les mots entendus dans l\'audio tout en ignorant les distractions visuelles.';

  @override
  String get blinkDetectorTitle => 'Détecteur de clignotement';

  @override
  String get blinkDetectorSubtitle =>
      'Appuyez sur la face de la grille qui clignote deux fois de suite.';

  @override
  String get frequencyTapTitle => 'Prise de fréquence';

  @override
  String get frequencyTapSubtitle =>
      'Appuyez sur le bouton correspondant à la fréquence d\'impulsion lumineuse cible.';

  @override
  String get yajilinTitle => 'Boucle Yajilin';

  @override
  String get yajilinSubtitle =>
      'Placez des cellules noires et tracez une seule boucle correspondant aux indices.';

  @override
  String get heyawakeTitle => 'Grille Heyawake';

  @override
  String get heyawakeSubtitle =>
      'Ombragez les pièces sans cellules noires adjacentes.';

  @override
  String get gokigenVariantTitle => 'Variante Gokigen';

  @override
  String get gokigenVariantSubtitle =>
      'Dessinez des diagonales sans boucle répondant au nombre de sommets.';

  @override
  String get sheepAndWolvesTitle => 'Moutons et loups';

  @override
  String get sheepAndWolvesSubtitle =>
      'Tracez une boucle séparant les moutons des loups.';

  @override
  String get islandNurikabeTitle => 'Île de Nurikabe';

  @override
  String get islandNurikabeSubtitle =>
      'Formez des îlots correspondant aux contraintes de taille numérique.';

  @override
  String get shakashakaTitle => 'Shakashaka Rects';

  @override
  String get shakashakaSubtitle =>
      'Placez des carreaux triangulaires pour former des zones blanches rectangulaires.';

  @override
  String get litsTetrisTitle => 'LITS Tétromino';

  @override
  String get litsTetrisSubtitle =>
      'Placez les tétrominos dans des pièces sans doublons adjacents.';

  @override
  String get tapaWallTitle => 'Mur de tapas';

  @override
  String get tapaWallSubtitle =>
      'Ombrez les cellules pour former un motif mural noir continu.';

  @override
  String get triangularBridgesTitle => 'Ponts triangulaires';

  @override
  String get triangularBridgesSubtitle =>
      'Connectez les îles dans 3 directions répondant aux exigences.';

  @override
  String get rippleEffectTitle => 'Effet d\'entraînement';

  @override
  String get rippleEffectSubtitle =>
      'Remplissez les numéros dans les pièces en respectant les contraintes de distance d\'espacement.';

  @override
  String get suguruTectonicTitle => 'Grille Suguru';

  @override
  String get suguruTectonicSubtitle =>
      'Remplissez les blocs de pièces avec les numéros 1 à K sans voisins égaux.';

  @override
  String get tennerGridTitle => 'Grille Tenner';

  @override
  String get tennerGridSubtitle =>
      'Remplissez les lignes avec les chiffres 0 à 9 correspondant aux totaux des colonnes.';

  @override
  String get kakurasuSumsTitle => 'Sommes de Kakurasu';

  @override
  String get kakurasuSumsSubtitle =>
      'Ombrez les cellules pour respecter les sommes pondérées des indices de ligne/colonne.';

  @override
  String get corralLoopTitle => 'Boucle de corral';

  @override
  String get corralLoopSubtitle =>
      'Dessinez une seule boucle contenant des nombres correspondant à la visibilité.';

  @override
  String get stostoneTitle => 'Gravité de Stostone';

  @override
  String get stostoneSubtitle =>
      'Ombrez les cellules qui descendent pour remplir parfaitement les rangées du bas.';

  @override
  String get tripletsLogicTitle => 'Trio de triplés';

  @override
  String get tripletsLogicSubtitle =>
      'Remplissez la grille avec trois formes en évitant les trois à la suite.';

  @override
  String get galaxiesSymTitle => 'Symétrie des galaxies';

  @override
  String get galaxiesSymSubtitle =>
      'Divisez la grille en formes de galaxies à rotation symétrique.';

  @override
  String get matrixMultiplierMatchTitle => 'Matcheur de matrice';

  @override
  String get matrixMultiplierMatchSubtitle =>
      'Multipliez les valeurs des lignes et des colonnes pour correspondre au produit scalaire cible.';

  @override
  String get primeFactorTreesTitle => 'Arbres à facteurs premiers';

  @override
  String get primeFactorTreesSubtitle =>
      'Décomposez les nombres composés en paires de facteurs feuilles premiers.';

  @override
  String get vektorVectorTitle => 'Vecteur Vecteur';

  @override
  String get vektorVectorSubtitle =>
      'Mettez les vecteurs à l’échelle pour que leur somme atterrisse sur la cible.';

  @override
  String get binomialMatchTitle => 'Correspondance binomiale';

  @override
  String get binomialMatchSubtitle =>
      'Faites correspondre les formules quadratiques avec des valeurs binomiales factorisées.';

  @override
  String get percentageShoppingTitle => 'Pourcentage d\'achats';

  @override
  String get percentageShoppingSubtitle =>
      'Calculez les pourcentages de remise et les totaux de paiement final.';

  @override
  String get cryptoArithmeticTitle => 'Crypto-arithmétique';

  @override
  String get cryptoArithmeticSubtitle =>
      'Résolvez les problèmes mathématiques de chiffrement par substitution de caractères et de chiffres.';

  @override
  String get fractionalPizzaTitle => 'Pizza fractionnée';

  @override
  String get fractionalPizzaSubtitle =>
      'Partitionnez les tranches de pizza pour qu\'elles correspondent aux fractions de somme cibles.';

  @override
  String get numberBondsTitle => 'Liaisons numériques';

  @override
  String get numberBondsSubtitle =>
      'Liez les valeurs des nœuds pour qu’elles soient égales à une somme de connexion cible.';

  @override
  String get gridSumLineTitle => 'Ligne de somme de grille';

  @override
  String get gridSumLineSubtitle =>
      'Tracez un chemin dont les valeurs correspondent exactement à la cible.';

  @override
  String get binaryScaleBalanceTitle => 'Balance à échelle binaire';

  @override
  String get binaryScaleBalanceSubtitle =>
      'Équilibrez le poids décimal en utilisant des blocs puissance de deux.';

  @override
  String get moduloPathTitle => 'Chemin modulo';

  @override
  String get moduloPathSubtitle =>
      'Parcourez les cellules de la grille correspondant aux valeurs de reste modulo.';

  @override
  String get digitSwapEqTitle => 'Équations d\'échange de chiffres';

  @override
  String get digitSwapEqSubtitle =>
      'Échangez des chiffres entre les équations pour corriger les deux.';

  @override
  String get areaPerimeterMatchTitle => 'Superficie et périmètre';

  @override
  String get areaPerimeterMatchSubtitle =>
      'Dessinez des rectangles correspondant aux valeurs de la zone cible et du périmètre.';

  @override
  String get inequalityBalanceOpsTitle => 'Équilibre des inégalités';

  @override
  String get inequalityBalanceOpsSubtitle =>
      'Placez des symboles d\'inégalité entre des termes mathématiques complexes.';

  @override
  String get graphCoordinatePlotTitle => 'Traceur de graphiques';

  @override
  String get graphCoordinatePlotSubtitle =>
      'Tracez les coordonnées de la grille correspondant aux courbes linéaires/quadratiques.';

  @override
  String get baseConversionRunTitle => 'Conversion de base';

  @override
  String get baseConversionRunSubtitle =>
      'Convertissez les valeurs entre binaire, décimal, hexadécimal et octal.';

  @override
  String get unitConverterProTitle => 'Convertisseur d\'unités';

  @override
  String get unitConverterProSubtitle =>
      'Répondez à des conversions d\'unités rapides dans des délais impartis.';

  @override
  String get auditoryNBackTitle => 'N-Back auditif';

  @override
  String get auditoryNBackSubtitle =>
      'Faites correspondre les lettres parlées entendues N recule de la mémoire.';

  @override
  String get abstractPatternRecallTitle => 'Superposition de motifs';

  @override
  String get abstractPatternRecallSubtitle =>
      'Reconstruisez des formes colorées en couches à partir de l\'étude de la mémoire.';

  @override
  String get roomInspectorTitle => 'Inspecteur de salle';

  @override
  String get roomInspectorSubtitle =>
      'Identifiez les modifications apportées au mobilier alors que l\'écran était vide.';

  @override
  String get voiceToFaceMatchTitle => 'Correspondance voix-visage';

  @override
  String get voiceToFaceMatchSubtitle =>
      'Sélectionnez le visage correct associé au clip vocal audio parlé.';

  @override
  String get spatialGridMemory3DTitle => 'Mémoire spatiale 3D';

  @override
  String get spatialGridMemory3DSubtitle =>
      'Rappelez-vous des blocs flashés dans une structure de grille cubique 3D pivotée.';

  @override
  String get sequenceStackTitle => 'Pile de séquence';

  @override
  String get sequenceStackSubtitle =>
      'Reconstruisez les ajouts et les retraits de la pile de plaques dans l\'ordre.';

  @override
  String get semanticCategoryRecallTitle => 'Rappel de catégorie';

  @override
  String get semanticCategoryRecallSubtitle =>
      'Identifiez les mots d’étude correspondant aux cibles de catégorie demandées.';

  @override
  String get gridDisplacementTitle => 'Déplacement de la grille';

  @override
  String get gridDisplacementSubtitle =>
      'Identifiez les icônes décalées en comparant la mise en page à l\'original.';

  @override
  String get soundSequenceMatchTitle => 'Correspondance de séquence sonore';

  @override
  String get soundSequenceMatchSubtitle =>
      'Répétez des séquences de notes jouées sur un clavier virtuel.';

  @override
  String get cardCountingMemoryTitle => 'Compteur de cartes';

  @override
  String get cardCountingMemorySubtitle =>
      'Identifiez les cartes déjà distribuées lors de tirages continus de distribution de cartes.';

  @override
  String get directionsRecallTitle => 'Rappel des directions';

  @override
  String get directionsRecallSubtitle =>
      'Parcourez les cartes quadrillées correspondant aux directions de chemin de la mémoire.';

  @override
  String get eventTimelineMemoryTitle => 'Chronologie de l\'événement';

  @override
  String get eventTimelineMemorySubtitle =>
      'Organisez les cartes d\'événements historiques/fictifs par ordre chronologique.';

  @override
  String get featureMatrixRecallTitle => 'Matrice des fonctionnalités';

  @override
  String get featureMatrixRecallSubtitle =>
      'Répondez aux invites de requête sur les attributs de forme et de couleur des cellules.';

  @override
  String get delayedMatchSampleTitle => 'Match retardé';

  @override
  String get delayedMatchSampleSubtitle =>
      'Faites correspondre le symbole cible après avoir résolu les distractions mathématiques.';

  @override
  String get symbolDigitAssocTitle => 'Association symbole-chiffre';

  @override
  String get symbolDigitAssocSubtitle =>
      'Résolvez les feuilles de traduction de symboles correspondant aux clés numériques.';

  @override
  String get dualTaskMemoryTitle => 'Mémoire double tâche';

  @override
  String get dualTaskMemorySubtitle =>
      'Mémorisez des ensembles de mots tout en résolvant des tâches arithmétiques rapides.';

  @override
  String get actionSequenceRecallTitle => 'Rappel d\'action';

  @override
  String get actionSequenceRecallSubtitle =>
      'Répétez les séquences d’animation des gestes des personnages dans l’ordre.';

  @override
  String get tangramPolygonTitle => 'Coupe Tangram';

  @override
  String get tangramPolygonSubtitle =>
      'Disposez les formes de polygones pour remplir les contours des silhouettes.';

  @override
  String get mazeNav3DTitle => 'Navigation dans un labyrinthe 3D';

  @override
  String get mazeNav3DSubtitle =>
      'Parcourez les itinéraires du labyrinthe isométrique 3D à partir de la vue à la première personne.';

  @override
  String get isometricProjectionTitle => 'Projecteur isométrique';

  @override
  String get isometricProjectionSubtitle =>
      'Faites correspondre les figures de blocs 3D aux vues orthographiques de dessus/de face 2D.';

  @override
  String get polyominoPackingTitle => 'Emballage Polyomino';

  @override
  String get polyominoPackingSubtitle =>
      'Emballez des morceaux de blocs polyomino aléatoires dans les zones cibles.';

  @override
  String get spatialGridRotationTitle => 'Rotation de la grille spatiale';

  @override
  String get spatialGridRotationSubtitle =>
      'Faites correspondre les dispositions de blocs 3D pivotées le long des coordonnées de l\'axe.';

  @override
  String get wireLoopGameTitle => 'Boucle de fil';

  @override
  String get wireLoopGameSubtitle =>
      'Faites glisser les anneaux métalliques le long des cannelures métalliques sans contact.';

  @override
  String get origamiUnfoldTitle => 'Origami Déplier';

  @override
  String get origamiUnfoldSubtitle =>
      'Identifiez les modèles de perforation après avoir déplié les feuilles pliées.';

  @override
  String get ropeTangleSolverTitle => 'Démêleur de corde';

  @override
  String get ropeTangleSolverSubtitle =>
      'Faites glisser les nœuds pour disposer des graphiques planaires avec des croisements de lignes nulles.';

  @override
  String get gridFitTetrisTitle => 'Solveur d\'ajustement de grille';

  @override
  String get gridFitTetrisSubtitle =>
      'Disposez les blocs statiques irréguliers pour s\'adapter aux limites du conteneur.';

  @override
  String get vectorGridAlignmentTitle => 'Alignement vectoriel';

  @override
  String get vectorGridAlignmentSubtitle =>
      'Mettez à l\'échelle et faites pivoter les formes pour qu\'elles correspondent aux cibles du modèle d\'ombre.';

  @override
  String get blockStackingPhysicsTitle => 'Empilage de blocs';

  @override
  String get blockStackingPhysicsSubtitle =>
      'Empilez des panneaux de blocs irréguliers en équilibrant le poids de la gravité.';

  @override
  String get crossSectionMatch3DTitle => 'Coupe transversale 3D';

  @override
  String get crossSectionMatch3DSubtitle =>
      'Identifiez les géométries de tranches 2D découpées à partir de formes 3D.';

  @override
  String get symmetryPaintTitle => 'Peinture Symétrie';

  @override
  String get symmetryPaintSubtitle =>
      'Dessinez des segments d’image miroir réfléchissant sur les axes de symétrie.';

  @override
  String get rollingBlockBloxTitle => 'Bloc roulant';

  @override
  String get rollingBlockBloxSubtitle =>
      'Faites rouler les blocs pour atterrir verticalement dans les emplacements cibles.';

  @override
  String get perspectiveShiftViewTitle => 'Changement de perspective';

  @override
  String get perspectiveShiftViewSubtitle =>
      'Faites pivoter les groupes de blocs jusqu\'à ce qu\'ils épellent des lettres/mots.';

  @override
  String get networkFlowSphericalTitle => 'Flux de réseau';

  @override
  String get networkFlowSphericalSubtitle =>
      'Connectez les flux de grille en enveloppant les coordonnées cylindriques.';

  @override
  String get layeredSilhouetteBlendTitle => 'Mélange de silhouettes';

  @override
  String get layeredSilhouetteBlendSubtitle =>
      'Empilez les calques colorés pour correspondre aux formes translucides cibles.';

  @override
  String get wordWheelPangramTitle => 'Anagrammes de mots';

  @override
  String get wordWheelPangramSubtitle =>
      'Construisez des mots contenant des lettres cibles centrales à partir de roues.';

  @override
  String get letterGridSwapperTitle => 'Échangeur de lettres';

  @override
  String get letterGridSwapperSubtitle =>
      'Échangez les tuiles de lettres adjacentes pour compléter les mots de ligne et de colonne.';

  @override
  String get synonymMatchTitle => 'Correspondance de synonymes';

  @override
  String get synonymMatchSubtitle =>
      'Faites correspondre les mots cibles qui tombent avec des synonymes ou des antonymes.';

  @override
  String get vowelDropTitle => 'Chute de voyelle';

  @override
  String get vowelDropSubtitle =>
      'Déposez les voyelles dans des grilles de coordonnées en complétant les mots.';

  @override
  String get letterBalanceScaleTitle => 'Échelle d\'équilibre des mots';

  @override
  String get letterBalanceScaleSubtitle =>
      'Épelez des mots dont les valeurs de lettre équilibrent les poids.';

  @override
  String get wordChainShiritoriTitle => 'Chaîne de mots';

  @override
  String get wordChainShiritoriSubtitle =>
      'Liez les boucles de mots commençant par les lettres précédentes.';

  @override
  String get affixBuilderTitle => 'Générateur d\'affixes';

  @override
  String get affixBuilderSubtitle =>
      'Combinez des préfixes/suffixes pour construire des vocabulaires cibles.';

  @override
  String get decipherCrypticCluesTitle => 'Décryptage énigmatique';

  @override
  String get decipherCrypticCluesSubtitle =>
      'Résolvez des énigmes de jeux de mots et déchiffrez des énigmes d’orthographe.';

  @override
  String get boggleWordSearchTitle => 'Connexion Boggle';

  @override
  String get boggleWordSearchSubtitle =>
      'Tracez les chemins connectés adjacents pour trouver des mots cachés.';

  @override
  String get idiomUnscrambleTitle => 'Déchiffrer l\'idiome';

  @override
  String get idiomUnscrambleSubtitle =>
      'Organisez les tableaux de mots brouillés pour qu\'ils correspondent aux significations des idiomes.';

  @override
  String get letterPyramidsTitle => 'Pyramides de lettres';

  @override
  String get letterPyramidsSubtitle =>
      'Construisez des tours de mots en ajoutant des lettres d\'anagramme uniques par niveau.';

  @override
  String get soundAlikeHomophonesTitle => 'Correspondances homophones';

  @override
  String get soundAlikeHomophonesSubtitle =>
      'Identifiez les orthographes homophones correctes des phrases.';

  @override
  String get wordGridSudokuTitle => 'Sudoku des mots';

  @override
  String get wordGridSudokuSubtitle =>
      'Tesseler les lettres dans les rangées de la grille formant des mots.';

  @override
  String get portmanteauFactoryTitle => 'Usine de valises';

  @override
  String get portmanteauFactorySubtitle =>
      'Fusionnez les composants sémantiques en créant des mots composés.';

  @override
  String get codedCrosswordsCodeTitle => 'Mots de code Mots croisés';

  @override
  String get codedCrosswordsCodeSubtitle =>
      'Résolvez les mots croisés de la grille en faisant correspondre les codes chiffres à lettres.';

  @override
  String get wordSnakeTrailTitle => 'Mot Serpent';

  @override
  String get wordSnakeTrailSubtitle =>
      'Tracez des traces de lettres ressemblant à des serpents pour épeler des mots thématiques.';

  @override
  String get typingRhythmSpeedTitle => 'Flux de frappe';

  @override
  String get typingRhythmSpeedSubtitle =>
      'Tapez des vocabulaires correspondant aux battements du rythme du métronome.';

  @override
  String get errorSomethingWrong => 'Something went wrong';

  @override
  String get errorUnexpected => 'An unexpected error occurred';

  @override
  String get errorTryAgain => 'Try Again';

  @override
  String get leaveReview => 'Leave Review';

  @override
  String get reportError => 'Report Error';

  @override
  String get statsTitle => 'Stats';

  @override
  String get statsAchievements => 'Achievements';

  @override
  String get statsWeeklyActivity => 'Weekly Activity';

  @override
  String statsDayStreak(int days) {
    return '$days Day Streak';
  }

  @override
  String get statsTotalXp => 'Total XP';

  @override
  String get statsSolved => 'Solved';

  @override
  String statsLevel(int level) {
    return 'Level $level';
  }

  @override
  String get statsMaintainStreak => 'Maintain your streak!';

  @override
  String statsPercentToLevel(int percent, int level) {
    return '$percent% to Level $level';
  }

  @override
  String get statsCognitiveProfile => 'Cognitive Profile';

  @override
  String get statsLocked => 'Locked';

  @override
  String get achievementSeeker => 'Seeker';

  @override
  String get achievementSeekerDesc => 'Earn 100 XP';

  @override
  String get achievementApprentice => 'Apprentice';

  @override
  String get achievementApprenticeDesc => 'Earn 1,000 XP';

  @override
  String get achievementStrategist => 'Strategist';

  @override
  String get achievementStrategistDesc => 'Earn 5,000 XP';

  @override
  String get achievementElite => 'Elite';

  @override
  String get achievementEliteDesc => 'Earn 10,000 XP';

  @override
  String get achievementVeteran => 'Veteran';

  @override
  String get achievementVeteranDesc => 'Earn 25,000 XP';

  @override
  String get achievementMaster => 'Master';

  @override
  String get achievementMasterDesc => 'Earn 50,000 XP';

  @override
  String get achievementGrandmaster => 'Grandmaster';

  @override
  String get achievementGrandmasterDesc => 'Earn 100,000 XP';

  @override
  String get achievementLegend => 'Legend';

  @override
  String get achievementLegendDesc => 'Earn 250,000 XP';

  @override
  String get achievementMythic => 'Mythic';

  @override
  String get achievementMythicDesc => 'Earn 500,000 XP';

  @override
  String get achievementEternal => 'Eternal';

  @override
  String get achievementEternalDesc => 'Earn 1,000,000 XP';

  @override
  String get winFoundIt => 'Found It!';

  @override
  String get winExcellentTracking => 'Excellent tracking speed!';

  @override
  String get loseMissedIt => 'Missed It!';

  @override
  String get loseKeepEyes => 'Keep your eyes on the target.';

  @override
  String get winDecodedCorrectly => 'Decoded Correctly!';

  @override
  String get winDecodedMessage =>
      'Your brain successfully read the jumbled text!';

  @override
  String get loseTryAgainDecryption => 'Try again to break the encryption.';

  @override
  String get winTargetReached => 'Target Reached!';

  @override
  String get winExcellentCalculations => 'Excellent calculations!';

  @override
  String get winCodeBroken => 'Code Broken!';

  @override
  String get winDecodedPerfectly => 'You decoded the message perfectly.';

  @override
  String get loseEncrypted => 'Encrypted';

  @override
  String get winAmazing => 'Amazing!';

  @override
  String get winReachedTarget => 'You reached the target number!';

  @override
  String get loseTryAgainSolution => 'Try again to find the solution.';

  @override
  String get winExcellent => 'Excellent!';

  @override
  String get winLevelUp => 'Level Up!';

  @override
  String get winPerfect => 'Perfect!';

  @override
  String get winFloodSuccess => 'Flood Success!';

  @override
  String get loseDryLand => 'Dry Land...';

  @override
  String get winRoundComplete => 'Round Complete';

  @override
  String get winStayVigilant => 'Stay Vigilant!';

  @override
  String get loseKeepWatch => 'Keep Watch!';

  @override
  String get winFocusMaster => 'Focus Master!';

  @override
  String get loseConcentrationBroken => 'Concentration Broken';

  @override
  String get winSpeedDemon => 'Speed Demon!';

  @override
  String get loseSlowSteady => 'Slow & Steady';

  @override
  String get loseTimeExpired => 'Time Expired';

  @override
  String get winSharpEyes => 'Sharp Eyes!';

  @override
  String get loseLostTrack => 'Lost Track';

  @override
  String get winOrbitMaster => 'Orbit Master!';

  @override
  String get loseOutOfSync => 'Out of Sync';

  @override
  String get winSharpReflexes => 'Sharp Reflexes!';

  @override
  String get loseOutOfTime => 'Out of Time';

  @override
  String get winSurgeComplete => 'Surge Complete!';

  @override
  String get loseTimeExpiredExcl => 'Time Expired!';

  @override
  String get winMathGenius => 'Math Genius!';

  @override
  String get loseTimeUp => 'Time Up';

  @override
  String get winPlanningMaster => 'Planning Master!';

  @override
  String get loseOutOfMoves => 'Out of Moves';

  @override
  String get winTotalControl => 'Total Control!';

  @override
  String get loseInhibitionFail => 'Inhibition Fail';

  @override
  String get winMimicMaster => 'Mimic Master!';

  @override
  String get losePatternMismatch => 'Pattern Mismatch';

  @override
  String get winMemoryMaster => 'Memory Master!';

  @override
  String get loseFadingEcho => 'Fading Echo';

  @override
  String get winNeuroMaster => 'Neuro-Master!';

  @override
  String get loseBrainFog => 'Brain Fog';

  @override
  String get winBrainWizard => 'Brain Wizard!';

  @override
  String get winSpatialMaster => 'Spatial Master!';

  @override
  String get loseLostInSpace => 'Lost in Space';

  @override
  String get winSequenceMaster => 'Sequence Master!';

  @override
  String get winCountingGenius => 'Counting Genius!';

  @override
  String get winNonMatchingExpert => 'Non-Matching Expert!';

  @override
  String get winSymmetryMaster => 'Symmetry Master!';

  @override
  String get winCabinetExpert => 'Cabinet Expert!';

  @override
  String get winSpatialGenius => 'Spatial Genius!';

  @override
  String get winReadingExpert => 'Reading Expert!';

  @override
  String get winRecognitionGenius => 'Recognition Genius!';

  @override
  String get winMandalaArtist => 'Mandala Artist!';

  @override
  String get winTrackerPro => 'Tracker Pro!';

  @override
  String get loseLostTrail => 'Lost Trail';

  @override
  String get winLogicMaster => 'Logic Master!';

  @override
  String get loseWrongAnswer => 'Wrong Answer';

  @override
  String get winPathfinder => 'Pathfinder!';

  @override
  String get loseLostYourWay => 'Lost Your Way';

  @override
  String get winMentalGymnast => 'Mental Gymnast!';

  @override
  String get loseWiresCrossed => 'Wires Crossed';

  @override
  String get winCorrect => 'Correct!';

  @override
  String get loseWrong => 'Wrong';

  @override
  String get winRhythmGod => 'Rhythm God!';

  @override
  String get loseOffBeat => 'Off Beat';

  @override
  String get winSteadyHands => 'Steady Hands!';

  @override
  String get loseShakyLine => 'Shaky Line';

  @override
  String get winEquationSolved => 'Equation Solved!';

  @override
  String get winMasterHunter => 'Master Hunter!';

  @override
  String get loseHuntEnded => 'Hunt Ended';

  @override
  String get winFluencyExpert => 'Fluency Expert!';

  @override
  String get loseTimeUpExcl => 'Time Up!';

  @override
  String get winSharpEye => 'Sharp Eye!';

  @override
  String get loseMismatched => 'Mismatched';

  @override
  String get winFibonacciMaster => 'Fibonacci Master!';

  @override
  String get winMathWizard => 'Math Wizard!';

  @override
  String get winPercentagePro => 'Percentage Pro!';

  @override
  String get winSleuthMaster => 'Sleuth Master!';

  @override
  String get winDivisibilityWhiz => 'Divisibility Whiz!';

  @override
  String get winVennMaster => 'Venn Master!';

  @override
  String get winChimpTestAced => 'Chimp Test Aced';

  @override
  String get loseTestFailed => 'Test Failed';

  @override
  String get winChimpMessage =>
      'Sensational working memory span! You equal chimpanzee levels of cognitive recall.';

  @override
  String get loseChimpMessage =>
      'You lost all lives. Keep training to scale up your memory grid capacity!';

  @override
  String get winPerfectRecall => 'Perfect Recall!';

  @override
  String get winRememberedAll => 'You remembered all details correctly!';

  @override
  String get loseSomeDetailsWrong =>
      'Some details were remembered incorrectly.';

  @override
  String get winShikakuSolved => 'You successfully solved the Shikaku puzzle.';

  @override
  String get snackbarIncorrectSum => 'Incorrect sum! Try another one.';

  @override
  String get snackbarCorrectMatch => 'Correct match!';

  @override
  String get snackbarWrongMatch => 'Wrong match! Study a new shape.';

  @override
  String get snackbarAlignedPerfectly => 'Aligned perfectly! Next target...';

  @override
  String get snackbarNotAligned =>
      'Not aligned yet! Keep adjusting the rotation, scale, or positions.';

  @override
  String snackbarWordMustContainCentral(String letter) {
    return 'Word must contain the central letter \"$letter\"!';
  }

  @override
  String get snackbarWordAlreadyFound => 'Word already found!';

  @override
  String get snackbarNotAValidWord => 'Not a valid word!';

  @override
  String get snackbarIncorrectLookClose =>
      'Incorrect reading. Look closely at the words!';

  @override
  String snackbarIncorrectCorrectAnswer(String answer) {
    return 'Incorrect! The correct answer was $answer';
  }

  @override
  String get hideGame => 'Masquer';

  @override
  String get unhideGame => 'Afficher';

  @override
  String get favoriteGame => 'Favori';

  @override
  String get unfavoriteGame => 'Retirer des favoris';

  @override
  String get hiddenGames => 'JEUX MASQUÉS';

  @override
  String showHiddenGames(int count) {
    return 'Afficher les jeux masqués ($count)';
  }

  @override
  String get noHiddenGames => 'Aucun jeu masqué';

  @override
  String get gameHidden => 'Jeu masqué';

  @override
  String get undo => 'Annuler';

  @override
  String get snackbarCorrect => 'Correct!';

  @override
  String get snackbarIncorrectTryNew => 'Incorrect recall! Try a new grid.';

  @override
  String get snackbarAllCorrect => 'All associations correct!';

  @override
  String get snackbarIncorrectStudyAgain =>
      'Incorrect translations! Study the association key again.';

  @override
  String get snackbarIncorrectArithmetic => 'Incorrect arithmetic! Try again.';

  @override
  String get snackbarCorrectRecall => 'Correct recall!';

  @override
  String get snackbarWrongRecall => 'Wrong recall selection! Try a new set.';

  @override
  String get snackbarPieceDoesNotFit => 'Piece does not fit there!';

  @override
  String snackbarInvalidStep(int mod, int modulus, int remainder) {
    return 'Invalid step! $mod mod $modulus is not $remainder.';
  }

  @override
  String snackbarIncorrectGroup(int tries) {
    return 'Incorrect group! $tries tries remaining.';
  }

  @override
  String get snackbarIncorrectSwapped =>
      'Incorrect! Swapped items are highlighted in green.';

  @override
  String snackbarIncorrectDestination(int x, int y) {
    return 'Incorrect! The final destination was ($x, $y).';
  }

  @override
  String snackbarIncorrectCorrectCount(String suit, int count) {
    return 'Incorrect! The correct count for $suit was $count.';
  }

  @override
  String get snackbarIncorrectSequence =>
      'Incorrect sequence! Watch closely again.';

  @override
  String get snackbarSequenceMatched =>
      'Sequence matched! Increasing length...';

  @override
  String get snackbarIncorrectAnswer => 'Incorrect answer! Try again.';

  @override
  String snackbarIncorrectCorrectValue(String value) {
    return 'Incorrect! The correct value was $value';
  }

  @override
  String snackbarIncorrectSlices(int selected, String required) {
    return 'Incorrect! You selected $selected slices, but need $required.';
  }

  @override
  String get snackbarReachedEndNoMatch =>
      'Reached end but total does not match target!';

  @override
  String get snackbarCorrectOrder => 'Correct chronological order!';

  @override
  String get snackbarIncorrectOrder => 'Incorrect order! Study again.';

  @override
  String snackbarIncorrectMissingValue(String value) {
    return 'Incorrect! The missing value was $value';
  }

  @override
  String snackbarIncorrectLetterDigit(String letter, int digit) {
    return 'Incorrect! $letter = $digit';
  }

  @override
  String snackbarIncorrectCorrectPoint(int x, int y) {
    return 'Incorrect! The correct point was ($x, $y).';
  }

  @override
  String get snackbarReachedExit => 'Reached the exit! Generating next maze...';

  @override
  String get snackbarCannotMoveBlocked =>
      'Cannot move forward: Blocked by wall!';

  @override
  String snackbarIncorrectCorrectStack(String stack) {
    return 'Incorrect! The correct final stack was: $stack';
  }

  @override
  String get snackbarIncorrectStudyStory =>
      'Incorrect sequence! Study the story again.';

  @override
  String snackbarScaleNotBalanced(int current, int target) {
    return 'Scale is not balanced! Current weight is $current, Target is $target.';
  }

  @override
  String get snackbarWordMatchedTracing => 'Word matched! Tracing next word...';

  @override
  String get snackbarIncorrectTraceFromStart =>
      'Incorrect sequence! Try tracing from the start cell.';

  @override
  String snackbarIncorrectCorrectForm(String form) {
    return 'Incorrect! The factored form is $form';
  }

  @override
  String snackbarIncorrectInequality(
      String left, int leftVal, String correct, String right, int rightVal) {
    return 'Incorrect! $left ($leftVal) $correct $right ($rightVal)';
  }

  @override
  String snackbarIncorrectBaseConversion(String answer) {
    return 'Incorrect! The correct answer was $answer';
  }

  @override
  String get snackbarIncorrectStudyPairs =>
      'Incorrect! Let\'s study the pairs again.';

  @override
  String get snackbarAlignedCorrectly => 'Aligned and correctly identified!';

  @override
  String get snackbarIncorrectPerspective =>
      'Incorrect perspective angle rotation! Try aligning them first.';

  @override
  String get btnShuffleCups => 'Shuffle Cups';

  @override
  String get btnSubmitGroup => 'Submit Group';

  @override
  String get btnYes => 'Yes';

  @override
  String get btnNo => 'No';

  @override
  String get btnGotIt => 'Got It';

  @override
  String get btnSubmit => 'Submit';

  @override
  String get btnShowHint => 'Show Hint';

  @override
  String get btnSubmitAlignment => 'Submit Alignment';

  @override
  String get btnSubmitLocation => 'Submit Location';

  @override
  String get btnStartDealing => 'Start Dealing';

  @override
  String get btnImReady => 'I\'m Ready';

  @override
  String get btnStartGame => 'Start Game';

  @override
  String get btnSubmitStack => 'Submit Stack';

  @override
  String get btnImReadyToAnswer => 'I\'m Ready to Answer';

  @override
  String get btnNoMatch => 'No Match';

  @override
  String get btnMatch => 'Match';

  @override
  String get btnMatchColor => 'CORRESPONDANCE COULEUR';

  @override
  String get btnMatchWord => 'CORRESPONDANCE MOT';

  @override
  String get btnGuess => 'Guess';

  @override
  String get btnPlayNow => 'Play Now';

  @override
  String get btnClear => 'Clear';

  @override
  String get phaseWatchCarefully => 'Watch carefully...';

  @override
  String get phaseTapCupWithBall => 'Tap the cup with the ball!';

  @override
  String get phaseTrackTheBall => 'Track the ball';

  @override
  String get phaseFindTheBall => 'Find the ball under the yellow cup!';

  @override
  String get phaseBallUnderCup =>
      'The ball is under the highlighted cup. Remember it!';

  @override
  String get phaseWrongCup =>
      'Wrong cup! The ball was under the highlighted cup.';

  @override
  String get phaseDecodeTheSentence => 'Decode the sentence';

  @override
  String get phaseFindTheTarget => 'Find the target';

  @override
  String get phaseTargetNumber => 'Target Number';

  @override
  String get phaseSelectNumberToBegin => 'Select a number to begin';

  @override
  String get phaseMemorizeDetails => 'Memorize the details';

  @override
  String get phaseReadAndMemorize => 'Read and Memorize Details:';

  @override
  String get phaseSolveTheGrid => 'Solve the grid';

  @override
  String get phaseDirectionsList => 'Directions List:';

  @override
  String get phaseYourStack => 'Your Stack';

  @override
  String get phaseEmpty => 'Empty';

  @override
  String get phaseTapToAdd => 'Tap to Add';

  @override
  String get phaseCalculationLabel => 'Calculation:';

  @override
  String phaseTimeLeft(int time) {
    return 'Time: ${time}s';
  }

  @override
  String get phaseRemember2Back => 'Remember 2 steps back';

  @override
  String get phaseMatch => 'Match';

  @override
  String get hintTypeRhymingWord => 'Type a rhyming word...';

  @override
  String get hintStartTyping => 'Start typing...';

  @override
  String get hintTypeHeardWord => 'Type the heard word';

  @override
  String get hintTypeGuess => 'Type your guess...';

  @override
  String get hintTypeAnswerHere => 'Type answer here';

  @override
  String get hintEnterNextWord => 'Enter next word...';

  @override
  String get howToPlayTitle => 'How to Play';

  @override
  String get howToPlayStep1 =>
      '1. A secret number is chosen between 1 and 10,000.';

  @override
  String get howToPlayStep2 =>
      '2. Type your guess on the number pad and submit it.';

  @override
  String get howToPlayStep3 =>
      '3. If wrong, you will get feedback on whether the secret is higher or lower.';

  @override
  String get howToPlayStep4 =>
      '4. You have exactly 15 attempts to find the secret number.';

  @override
  String get noGuessesYet => 'No Guesses Yet';

  @override
  String get chancesLeft => 'Chances Left';

  @override
  String get guessesMade => 'Guesses Made';

  @override
  String get feedbackFindNumber => 'Find the number between 1 and 10,000!';

  @override
  String get feedbackEnterNumber => 'Enter a number between 1 and 10,000!';

  @override
  String feedbackCorrectExcl(int number) {
    return 'Correct! The number was $number.';
  }

  @override
  String get feedbackCorrectEmoji => 'Correct!';

  @override
  String get feedbackTooLow => 'Too Low';

  @override
  String get feedbackTooHigh => 'Too High';

  @override
  String feedbackGameOver(int number) {
    return 'Game Over! The number was $number.';
  }

  @override
  String feedbackGuessResult(int guess, String result) {
    return '$guess is $result!';
  }

  @override
  String feedbackWinMessage(int number, int guesses) {
    return 'Correct! You found $number with $guesses guesses left!';
  }

  @override
  String feedbackLoseMessage(int number) {
    return 'Out of guesses! The number was $number.';
  }

  @override
  String get statTime => 'Time';

  @override
  String get statScore => 'Score';

  @override
  String get statGrid => 'Grid';

  @override
  String get statMatches => 'Matches';

  @override
  String get statLives => 'Lives';

  @override
  String get statBeats => 'Beats';

  @override
  String get statPerfect => 'Perfect';

  @override
  String get statSeenPool => 'Seen Pool';

  @override
  String get statCards => 'Cards';

  @override
  String get statSpan => 'Span';

  @override
  String get statLength => 'Length';

  @override
  String get statItems => 'Items';

  @override
  String get statProgress => 'Progress';

  @override
  String get statTrials => 'Trials';

  @override
  String get statTrails => 'Trails';

  @override
  String get statMoves => 'Moves';

  @override
  String get statFocalSearch => 'Focal search on oscillations';

  @override
  String get phaseMemorizeSequence => 'Memorize the sequence order';

  @override
  String get phaseDetermineOrder => 'Determine which item came first/last';

  @override
  String get phaseCorrectOrder => 'Correct order!';

  @override
  String get phaseWrongTimeline => 'Wrong timeline!';

  @override
  String get phaseWatchPattern => 'Watch the pattern';

  @override
  String get phaseRepeatPattern => 'Repeat the pattern';

  @override
  String get phaseExcellent => 'Excellent!';

  @override
  String get phaseTryAgain => 'Try again!';

  @override
  String get phaseChooseWordFit => 'Choose the word that fits';

  @override
  String get phaseExcellentContextual => 'Excellent contextual match!';

  @override
  String get phaseIncorrectMatch => 'Incorrect match';

  @override
  String get phaseMemorizePattern => 'Memorize the pattern';

  @override
  String get phaseSelectTiles => 'Select the tiles';

  @override
  String get phaseWrongTile => 'Wrong tile';

  @override
  String get phaseMemorizeRedCell => 'Memorize red cell location';

  @override
  String get phaseIsSymmetrical => 'Is the pattern symmetrical?';

  @override
  String get phaseRecallSequence => 'Recall sequence in correct order';

  @override
  String get phaseGreatJob => 'Great job!';

  @override
  String get phaseChooseNovelCard => 'Choose a novel card';

  @override
  String get phaseAlreadyTapped => 'Already tapped!';

  @override
  String get phaseCountBlueCircles => 'Count only blue circles';

  @override
  String get phaseRecallCountsOrder => 'Recall counts in correct order';

  @override
  String get phaseChooseNovel => 'Choose the novel card';

  @override
  String get phaseMemorizeCard => 'Memorize this card';

  @override
  String get phaseWaitForIt => 'Wait for it...';

  @override
  String get phaseThatWasSample => 'That was the sample!';

  @override
  String get phaseSolveDistractor => 'Solve the distractor question!';

  @override
  String get phaseSelectMemorized => 'Select the memorized cells';

  @override
  String get phasePerfectRecall => 'Perfect recall!';

  @override
  String get phaseWrongExcl => 'Wrong!';

  @override
  String get phaseMemorizePlacements => 'Memorize all placements';

  @override
  String get phaseWaitingForShift => 'Waiting for layout shift...';

  @override
  String get phaseTapMovedObject => 'Tap the object that moved';

  @override
  String get phaseWrongObject => 'Wrong object!';

  @override
  String get phaseStudyColorShape => 'Study the color-shape connections';

  @override
  String get phaseTapMatchingTrait => 'Tap the matching trait';

  @override
  String get phaseGreatRecall => 'Great recall!';

  @override
  String get phaseWrongLink => 'Wrong link!';

  @override
  String get phaseTrueOrFalse => 'Is this statement true or false?';

  @override
  String get phaseMemorizeLetter => 'Memorize this letter';

  @override
  String get phaseRecallLettersSequence => 'Recall letters in sequence';

  @override
  String get phaseMemorizeTileColors => 'Memorize tile colors';

  @override
  String get phasePaintCells => 'Paint cells to match original';

  @override
  String get phaseIncorrectMatchExcl => 'Incorrect match!';

  @override
  String get phaseKeepYourEyes => 'Keep your eyes on it!';

  @override
  String get phaseWhereIsTarget => 'Where is the target object?';

  @override
  String get phaseTrackStar => 'Track Star';

  @override
  String get dialogIncorrectSequenceStudy =>
      'Incorrect sequence! Study the story again.';

  @override
  String get dialogStoryReconstruct =>
      'Reconstruct the story by tapping sentences in order';

  @override
  String get dialogMemorizeOrder =>
      'Memorize the chronological order of events';

  @override
  String get dialogMemorizeWordPairs => 'Memorize these word pairs';

  @override
  String get dialogWhichWordPaired => 'Which word was paired with the target?';

  @override
  String get dialogWatchSequence => 'Watch the sequence path';

  @override
  String get dialogRepeatPath => 'Repeat the path sequence';

  @override
  String get dialogShapeShifterTap => 'Tap shapes that match the active target';

  @override
  String get dialogFocusTunnelTap =>
      'Tap incoming shapes ONLY if they match the symbol seen 2 steps ago (2-Back).';

  @override
  String get dialogSequenceStackBuild =>
      'Mentally track stack operations, then rebuild the final stack from bottom to top.';

  @override
  String get dialogFactorTreeComplete =>
      'Complete the factor tree by tapping nodes and matching factors!';

  @override
  String get dialogBinaryScaleBalance =>
      'Balance the scale by selecting powers of two (binary weights) that sum to the target.';

  @override
  String get dialogMatrixMultiplierSelect =>
      'Select one row and one column that multiply to the target';

  @override
  String get dialogOddEvenFlashTap =>
      'Tap the card when the active rule is satisfied';

  @override
  String get dialogBaseConversionConvert =>
      'Convert the value from the source base to the destination base.';

  @override
  String get dialogGhostTapSync =>
      'Synchronize with the rhythm, then tap when the invisible pulse would reach peak size.';

  @override
  String get dialogFrequencyTapIdentify =>
      'Identify which pulsing light matches the requested target frequency.';

  @override
  String get dialogLetterGridSwap =>
      'Swap adjacent letters to form the target words in rows.';

  @override
  String get dialogGraphCoordinatePlot =>
      'Plot the coordinates on the Cartesian plane satisfying the equation.';

  @override
  String get dialogDigitSwapEquation =>
      'Swap one digit from the top equation with one from the bottom equation to make both correct.';

  @override
  String get dialogAreaPerimeterAdjust =>
      'Adjust the rectangle dimensions to match the target area and perimeter.';

  @override
  String get dialogCrackCipher =>
      'Crack character-digit substitution cipher math problems.';

  @override
  String get dialogPeripheralFocus =>
      'Solve math center equations, tap side panels when they flash';

  @override
  String get dialogGokigenSatisfy =>
      'Satisfy vertex clues and avoid closed loops';

  @override
  String get dialogPercentageCalculate =>
      'Calculate discount percentages and final checkout totals.';

  @override
  String get dialogBinomialMatch =>
      'Match quadratic formulas with factored binomial values.';

  @override
  String get dialogNumberBondsCalculate =>
      'Calculate the missing value in the number bond hierarchy.';

  @override
  String get correctLowercase => 'correct';

  @override
  String get incorrectLowercase => 'incorrect';

  @override
  String get notAValidWord => 'Not a valid word';

  @override
  String get enterNumberRange => 'ENTER A NUMBER BETWEEN 1 AND 10,000!';

  @override
  String get correctExclEmoji => 'Correct!';

  @override
  String get wrongExcl => 'Wrong!';
}
