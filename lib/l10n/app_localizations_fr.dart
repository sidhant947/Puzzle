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
}
