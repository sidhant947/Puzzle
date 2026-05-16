// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Puzzle Hub';

  @override
  String get home => 'Inicio';

  @override
  String get settings => 'Ajustes';

  @override
  String get playAgain => 'Jugar de Nuevo';

  @override
  String get seeCompleted => 'Ver Completado';

  @override
  String get finish => 'Finalizar';

  @override
  String get congrats => '¡Felicidades!';

  @override
  String get perfectGradient => '¡Gradiente Perfecto!';

  @override
  String get wellDone => 'Bien Hecho';

  @override
  String get timeUp => '¡Tiempo Agotado!';

  @override
  String get completed => '¡Completado!';

  @override
  String get score => 'Puntuación';

  @override
  String get timeLeft => 'Tiempo';

  @override
  String get trials => 'Intentos';

  @override
  String get numberRule => 'Regla Numérica';

  @override
  String get colorRule => 'Regla de Color';

  @override
  String get valid => 'Válido';

  @override
  String get invalid => 'Inválido';

  @override
  String get even => 'Par';

  @override
  String get odd => 'Impar';

  @override
  String get red => 'Rojo';

  @override
  String get green => 'Verde';

  @override
  String get target => 'Objetivo';

  @override
  String get moves => 'Movimientos';

  @override
  String get trialMode => 'Modo de Prueba';

  @override
  String get trialModeDescription =>
      'Resuelve 20 para terminar en lugar de 60s';

  @override
  String get appearance => 'Apariencia';

  @override
  String get language => 'Idioma';

  @override
  String get gameplay => 'Jugabilidad';

  @override
  String get supportUs => 'Apóyanos';

  @override
  String get systemLegal => 'Sistema y Legal';

  @override
  String get games => 'Juegos';

  @override
  String get solvedToday => 'Resueltos Hoy';

  @override
  String get searchGames => 'Buscar juegos...';

  @override
  String get readyToStart => '¿LISTO PARA ENTRENAR TU CEREBRO?';

  @override
  String get greatStart => '¡BUEN COMIENZO! SIGUE ASÍ.';

  @override
  String get onFire => '¡EN RACHA! TU CEREBRO ESTÁ DISFRUTANDO.';

  @override
  String get incredible => '¡INCREÍBLE! ERES UN MAESTRO.';

  @override
  String get noGamesMatch => 'NINGÚN JUEGO COINCIDE CON TU BÚSQUEDA';

  @override
  String get categoryAll => 'TODOS';

  @override
  String get categoryAttention => 'ATENCIÓN';

  @override
  String get categoryLogic => 'LÓGICA';

  @override
  String get categoryMath => 'MATEMÁTICAS';

  @override
  String get categoryWord => 'PALABRAS';

  @override
  String get categoryMemory => 'MEMORIA';

  @override
  String get categorySpatial => 'ESPACIAL';

  @override
  String get themeLight => 'CLARO';

  @override
  String get themeDark => 'OSCURO';

  @override
  String get themeSystem => 'SISTEMA';

  @override
  String get starOnGithub => 'Estrella en GitHub';

  @override
  String get sponsorOnGithub => 'Patrocinar en GitHub';

  @override
  String get privacyPolicy => 'Política de Privacidad';

  @override
  String get termsOfService => 'Términos de Servicio';

  @override
  String get licenses => 'Licencias';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return 'Tienes $maxTries intentos para encontrar la palabra oculta de $wordLength letras.';
  }

  @override
  String wordFoundMessage(String word) {
    return 'Palabra encontrada con éxito: $word';
  }

  @override
  String gameOverMessage(String word) {
    return 'La palabra era: $word';
  }

  @override
  String get gameOver => 'Fin del Juego';

  @override
  String get crosswordTitle => 'Crossword';

  @override
  String get crosswordSubtitle =>
      'Complete the grid with the correct words based on the clues provided.';

  @override
  String get wordSearchTitle => 'Word Search';

  @override
  String get wordSearchSubtitle =>
      'Find all the hidden words in the grid. Drag to select.';

  @override
  String get missingVowelsTitle => 'Missing Vowels';

  @override
  String get missingVowelsSubtitle =>
      'Identify the word with its vowels hidden.';

  @override
  String get missingVowelsWin => 'Vowels Restored!';

  @override
  String get missingVowelsHowToPlay =>
      'A word is shown with its vowels (A, E, I, O, U) hidden. Guess the full word!';

  @override
  String get wordScrambleTitle => 'Word Scramble';

  @override
  String get wordScrambleSubtitle =>
      'Tap the letters to unscramble the hidden word!';

  @override
  String get wordScrambleWin => 'Word Unraveled!';

  @override
  String get sudokuTitle => 'Sudoku';

  @override
  String get sudokuSubtitle =>
      'Complete the grid so that every row, column, and 3x3 box contains all digits 1 to 9.';

  @override
  String get minesweeperTitle => 'Minesweeper';

  @override
  String get minesweeperSubtitle =>
      'Identify all the mines without triggering them.';

  @override
  String get minesweeperWin => 'Victory!';

  @override
  String get game2048Title => '2048';

  @override
  String get game2048Subtitle =>
      'Swipe in any direction to merge tiles and reach the 2048 tile!';

  @override
  String get nonogramTitle => 'Nonogram';

  @override
  String get nonogramSubtitle => 'Reveal the hidden image using logic clues.';

  @override
  String get nonogramWin => 'Image Revealed!';

  @override
  String get pathFinderTitle => 'Path Finder';

  @override
  String get pathFinderSubtitle => 'Find the hidden path from S to E.';

  @override
  String get pathFinderWin => 'Path Mastered!';

  @override
  String get howToPlay => 'How to Play';

  @override
  String get gotIt => 'Got it';

  @override
  String get akariTitle => 'Akari';

  @override
  String get akariSubtitle => 'Ilumina todas las celdas blancas';

  @override
  String get akariHowToPlay =>
      'Coloca bombillas en las celdas blancas para iluminar toda la cuadrícula. Las bombillas iluminan su fila y columna hasta chocar con una pared. Dos bombillas no pueden iluminarse entre sí. Las paredes numeradas indican cuántas bombillas deben colocarse en las celdas adyacentes (arriba, abajo, izquierda, derecha).';

  @override
  String get akariWinTitle => '¡LUCES ENCENDIDAS!';

  @override
  String get akariWinMessage => 'Todo está perfectamente iluminado.';

  @override
  String get arithmeticChainTitle => 'Chain Calc';

  @override
  String get arithmeticChainSubtitle =>
      'Calculate the running total in your head';

  @override
  String get arithmeticChainWinTitle => 'LEVEL UP!';

  @override
  String get arithmeticChainWinMessage => 'Your mental calculation is sharp!';

  @override
  String get arithmeticChainLoseTitle => 'TRY AGAIN';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return 'The correct answer was $answer.';
  }

  @override
  String get arithmeticChainStart => 'START';

  @override
  String get arithmeticChainNext => 'NEXT';

  @override
  String get attentionalBlinkTitle => 'Attentional Blink';

  @override
  String get attentionalBlinkSubtitleWatch => 'WATCH FOR THE NUMBERS';

  @override
  String get attentionalBlinkSubtitleInput => 'ENTER THE TWO NUMBERS YOU SAW';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return 'You scored $score targets!';
  }

  @override
  String get balanceScaleTitle => 'BALANCE SCALE';

  @override
  String get balanceScaleSubtitle =>
      'Deduce the weight of the last item based on the scales.';

  @override
  String get balanceScaleWinTitle => 'BALANCED!';

  @override
  String get balanceScaleWinMessage => 'You correctly deduced the weight!';

  @override
  String get balanceScaleLoseTitle => 'UNBALANCED';

  @override
  String get balanceScaleLoseMessage =>
      'Try again to find the correct balance.';

  @override
  String get balanceScaleBack => 'BACK';

  @override
  String get balanceScaleSubmit => 'SUBMIT';

  @override
  String get binaryPuzzleTitle => 'BINARY PUZZLE';

  @override
  String get binaryPuzzleSubtitle =>
      'Fill with 0 and 1. Max two of the same digit adjacent. Equal 0s and 1s in each row and column.';

  @override
  String get binaryPuzzleWinTitle => 'WELL DONE';

  @override
  String get binaryPuzzleWinMessage =>
      'You solved the binary puzzle with perfect logic!';

  @override
  String get blockEscapeTitle => 'BLOCK ESCAPE';

  @override
  String get blockEscapeSubtitle =>
      'Slide the blocks to clear a path for the primary block to reach the exit.';

  @override
  String get blockEscapeWinTitle => 'ESCAPE!';

  @override
  String get blockEscapeWinMessage =>
      'You successfully cleared the path for the primary block!';

  @override
  String get boxCompletionTitle => 'Box Completion';

  @override
  String get boxCompletionSubtitle => 'Which cube can be formed?';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return 'You scored $score correct out of $totalTrials!';
  }

  @override
  String get boxCompletionOptions => 'OPTIONS';

  @override
  String get bridgesTitle => 'BRIDGES';

  @override
  String get bridgesSubtitle =>
      'Connect islands with bridges. Each island needs a specific number of bridges. Bridges cannot cross.';

  @override
  String get bridgesWinTitle => 'CONNECTED!';

  @override
  String get bridgesWinMessage => 'You successfully connected all the islands!';

  @override
  String get calculationSprintTitle => 'CALCULATION SPRINT';

  @override
  String get calculationSprintSubtitle =>
      'Solve as many equations as possible in 60 seconds.';

  @override
  String get calculationSprintGoalReached => 'GOAL REACHED!';

  @override
  String get calculationSprintTimeUp => 'TIME IS UP';

  @override
  String calculationSprintScoreMessage(int score) {
    return 'Excellent calculation speed! You scored $score points.';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return 'You scored $score points. Try to beat your best!';
  }

  @override
  String get calculationSprintBest => 'BEST';

  @override
  String get calculationSprintSeconds => '60 SECONDS';

  @override
  String get calculationSprintDescription =>
      'Solve equations quickly.\nWrong answers deduct 3 seconds!';

  @override
  String get calculationSprintStart => 'START SPRINT';

  @override
  String get categoryFluencyTitle => 'Category Fluency';

  @override
  String get categoryFluencySubtitle => 'Enter items belonging to the category';

  @override
  String get categoryFluencyExpert => 'FLUENCY EXPERT!';

  @override
  String get categoryFluencyTimeUp => 'TIME UP!';

  @override
  String get categoryFluencyWinMessage => 'You have a vast vocabulary!';

  @override
  String categoryFluencyFoundMessage(int count) {
    return 'You found $count words.';
  }

  @override
  String get categoryFluencyCategoryLabel => 'Category:';

  @override
  String get categoryFluencyEnterItem => 'Enter an item...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target words';
  }

  @override
  String get changeBlindnessTitle => 'Change Blindness';

  @override
  String get changeBlindnessSubtitle => 'SPOT THE CHANGING ITEM';

  @override
  String changeBlindnessScore(int score) {
    return 'SCORE: $score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return 'You found $score changes!';
  }

  @override
  String get choiceRtTitle => 'Choice RT';

  @override
  String get choiceRtSubtitle => 'Tap the active square as fast as you can';

  @override
  String choiceRtAvgMessage(String avg) {
    return 'Your average reaction time: ${avg}ms';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return 'Time Remaining: ${time}s';
  }

  @override
  String choiceRtTaps(int count) {
    return 'Taps: $count';
  }

  @override
  String get colorFloodTitle => 'Color Flood';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return 'Moves: $moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => 'FLOOD SUCCESS!';

  @override
  String get colorFloodDryLand => 'DRY LAND...';

  @override
  String get colorFloodWinMessage =>
      'You saturated the entire grid with color!';

  @override
  String get colorFloodLoseMessage => 'You ran out of moves. Try again!';

  @override
  String get colorMatchTitle => 'COLOR MATCH';

  @override
  String get colorMatchSubtitle =>
      'Adjust the sliders to match the target color as closely as possible.';

  @override
  String get colorMatchTarget => 'TARGET';

  @override
  String get colorMatchYours => 'YOURS';

  @override
  String get colorMatchCheck => 'CHECK MATCH';

  @override
  String get colorMatchResult => 'MATCH RESULT';

  @override
  String colorMatchAccuracy(String accuracy) {
    return 'Your accuracy: $accuracy%';
  }

  @override
  String get corsiBlocksTitle => 'CORSI BLOCKS';

  @override
  String get corsiBlocksSubtitle =>
      'Watch the blocks light up and tap them in the same order.';

  @override
  String get corsiBlocksWinTitle => 'SPATIAL MASTER!';

  @override
  String get corsiBlocksLoseTitle => 'LOST IN SPACE';

  @override
  String corsiBlocksMessage(int score, int span) {
    return 'You recalled $score sequences! Your spatial memory span reached $span.';
  }

  @override
  String get corsiBlocksWatch => 'WATCH THE PATTERN';

  @override
  String get corsiBlocksRepeat => 'REPEAT THE PATTERN';

  @override
  String get corsiBlocksExcellent => 'EXCELLENT!';

  @override
  String get corsiBlocksSpan => 'SPAN';

  @override
  String get crownTitle => 'CROWN';

  @override
  String get crownSubtitle =>
      'Place one crown in each row, column, and color region. Crowns cannot be adjacent, even diagonally.';

  @override
  String get crownCrowned => 'CROWNED!';

  @override
  String get crownSuccess =>
      'All crowns placed successfully with perfect logic.';

  @override
  String get cryptogramTitle => 'CRYPTOGRAM';

  @override
  String get cryptogramSubtitle =>
      'Assign letters to decode the secret message! Each encoded letter represents a real letter.';

  @override
  String get cryptogramBroken => 'CODE BROKEN!';

  @override
  String get cryptogramEncrypted => 'ENCRYPTED';

  @override
  String get cryptogramSuccess => 'You decoded the message perfectly.';

  @override
  String get cryptogramTryAgain => 'Try again to break the encryption.';

  @override
  String get digitSpanReverseTitle => 'Reverse Span';

  @override
  String get digitSpanReverseSubtitleMemorize => 'Memorize the digits';

  @override
  String get digitSpanReverseSubtitleEnter => 'Enter digits in REVERSE order';

  @override
  String get digitSpanReverseWinTitle => 'LEVEL UP!';

  @override
  String get digitSpanReverseWinMessage => 'Your working memory is impressive!';

  @override
  String get digitSpanReverseLoseTitle => 'TRY AGAIN';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return 'The correct reverse sequence was $sequence.';
  }

  @override
  String get dividedAttentionTitle => 'Divided Attention';

  @override
  String get dividedAttentionSubtitle =>
      'Tap LEFT for STAR ⭐ | Tap RIGHT for RED 🔴';

  @override
  String get dividedAttentionGameOverTitle => 'FOCUS BROKEN';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return 'Multitasking is hard! Your score was $score.';
  }

  @override
  String dividedAttentionScore(int score) {
    return 'SCORE: $score';
  }

  @override
  String get doubleNBackTitle => 'Double N-Back';

  @override
  String doubleNBackSubtitle(int n) {
    return 'Match stimuli $n steps back';
  }

  @override
  String get doubleNBackGameOverTitle => 'GAME OVER';

  @override
  String doubleNBackGameOverMessage(int score) {
    return 'You scored $score points in Double N-Back!';
  }

  @override
  String doubleNBackScore(int score) {
    return 'Score: $score';
  }

  @override
  String get doubleNBackPositionMatch => 'POSITION MATCH';

  @override
  String get doubleNBackLetterMatch => 'LETTER MATCH';

  @override
  String get faceNameAssociationTitle => 'Face-Name';

  @override
  String get faceNameAssociationSubtitleStudy =>
      'Memorize the name for each face';

  @override
  String get faceNameAssociationSubtitleTest => 'Who is this?';

  @override
  String get faceNameAssociationPerfect => 'PERFECT!';

  @override
  String get faceNameAssociationGameOver => 'GAME OVER';

  @override
  String get faceNameAssociationWinMessage =>
      'You have a great memory for faces and names!';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return 'You got $correct out of $total correct.';
  }

  @override
  String get faceNameAssociationStartTest => 'START TEST';

  @override
  String get flankerTestWinTitle => 'LASER FOCUS!';

  @override
  String get flankerTestLoseTitle => 'DISTRACTED';

  @override
  String flankerTestScoreMessage(int score) {
    return 'You scored $score correctly!';
  }

  @override
  String get flankerTestTitle => 'FLANKER TEST';

  @override
  String get flankerTestSubtitle =>
      'Indicate the direction of the center arrow, ignoring the flanking arrows.';

  @override
  String get flankerTestLeft => 'LEFT';

  @override
  String get flankerTestRight => 'RIGHT';

  @override
  String get fractionMatchTitle => 'Fraction Match';

  @override
  String get fractionMatchSubtitle => 'Match the visual to its fraction';

  @override
  String get fractionMatchLoseTitle => 'FRACTION MISMATCH';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return 'The correct answer was $correctAnswer.';
  }

  @override
  String get goNoGoTitle => 'Go / No-Go';

  @override
  String get goNoGoSubtitle => 'Tap for Green, IGNORE Red!';

  @override
  String get goNoGoLoseTitle => 'REACTION STOPPED';

  @override
  String get goNoGoLoseMessage => 'Your inhibitory control is being tested!';

  @override
  String get goNoGoTapAnywhere => 'TAP ANYWHERE TO GO';

  @override
  String get groceryListTitle => 'Grocery List';

  @override
  String get groceryListSubtitleMemorize =>
      'Memorize the items and their categories';

  @override
  String get groceryListSubtitleTest =>
      'Which category did this item belong to?';

  @override
  String get groceryListWinTitle => 'GROCERY GURU!';

  @override
  String get groceryListLoseTitle => 'FORGOT SOMETHING?';

  @override
  String groceryListScoreMessage(int score) {
    return 'You scored $score points in Grocery List!';
  }

  @override
  String get groceryListReady => 'I\'M READY';

  @override
  String get groceryListWhereBelong => 'WHERE DOES THIS BELONG?';

  @override
  String get hueSortTitle => 'HUE SORT';

  @override
  String get hueSortSubtitle =>
      'Swap tiles to create a smooth transition between corner colors. Dots indicate fixed tiles.';

  @override
  String get hueSortWinTitle => 'PERFECT GRADIENT!';

  @override
  String get hueSortWinMessage => 'You perfectly sorted the color spectrum!';

  @override
  String get kenkenTitle => 'KenKen';

  @override
  String get kenkenWinTitle => 'GENIUS!';

  @override
  String get kenkenLoseTitle => 'GAME OVER';

  @override
  String get kenkenWinMessage => 'You solved the KenKen puzzle!';

  @override
  String get kenkenLoseMessage => 'Check the row/column and cage rules.';

  @override
  String kenkenSubtitle(int size) {
    return 'Fill 1-$size without repeating in rows/cols';
  }

  @override
  String get letterCancellationTitle => 'Letter Cancel';

  @override
  String get letterCancellationTitleFull => 'Letter Cancellation';

  @override
  String letterCancellationScoreMessage(int score) {
    return 'You found $score letters!';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return 'Find all \"$target\" letters';
  }

  @override
  String get letterCancellationFound => 'FOUND';

  @override
  String get letterCancellationTime => 'TIME';

  @override
  String get lightsOutTitle => 'LIGHTS OUT';

  @override
  String get lightsOutSubtitle =>
      'Tapping a tile toggles it and its adjacent neighbors. Turn off all lights to solve.';

  @override
  String get lightsOutWinTitle => 'PUZZLE SOLVED!';

  @override
  String get lightsOutWinMessage =>
      'You successfully turned off all the lights!';

  @override
  String get symmetryTitle => 'Symmetry';

  @override
  String get symmetrySubtitle =>
      'Mirror the pattern on the left onto the empty grid on the right.';

  @override
  String get semanticLinkTitle => 'Time\\';

  @override
  String get semanticLinkSubtitle => 'Find the word that connects all three';

  @override
  String get reflexTapTitle => 'Reflex Tap';

  @override
  String get visualStatisticalLearningTitle => 'Game Over';

  @override
  String get orbitTapTitle => 'Orbit Tap';

  @override
  String get orbitTapSubtitle => 'Tap when balls align with the gate';

  @override
  String get schulteTableTitle => 'Great Focus!';

  @override
  String get multipleObjectTrackingTitle => 'Object Tracker';

  @override
  String get multipleObjectTrackingSubtitle =>
      'Watch the highlighted objects. Track them as they move, then select them.';

  @override
  String get sdmtTitle => 'Sdmt Test';

  @override
  String get sdmtSubtitle =>
      'Use the key above to find the digit for the symbol shown.';

  @override
  String get memoryMatrixTitle => 'Goal Reached!';

  @override
  String get memoryMatrixSubtitle => 'Memorize the pattern and tap the tiles.';

  @override
  String get mentalAbacusTitle => 'Abacus Master!';

  @override
  String get mentalAbacusSubtitle => 'Solve using the Soroban';

  @override
  String get spellingSprintTitle => 'Spelling Sprint';

  @override
  String get spellingSprintSubtitle =>
      'Race against the clock to spell as many words as you can.';

  @override
  String get stopSignalTitle => 'Stop Signal';

  @override
  String get stopSignalSubtitle =>
      'Tap the arrow direction, but STOP immediately if the arrow turns RED.';

  @override
  String get staircaseMemoryTitle => 'Staircase Memory';

  @override
  String get vigilanceTaskTitle => 'Vigilance Task';

  @override
  String get vigilanceTaskSubtitle =>
      'Tap the button when the hand skips a position';

  @override
  String get logicalSyllogismsTitle => 'Logical Syllogisms';

  @override
  String get logicalSyllogismsSubtitle => 'Is the conclusion logically valid?';

  @override
  String get mathPathTitle => 'Math Path';

  @override
  String get mathPathSubtitle =>
      'Find a path that adds up exactly to the target sum.';

  @override
  String get sternbergTaskTitle => 'Game Over';

  @override
  String get verbalAnalogiesTitle => 'Analogy Master!';

  @override
  String get verbalAnalogiesSubtitle => 'Complete the relationship';

  @override
  String get typingSpeedTitle => 'Typing Speed';

  @override
  String get typingSpeedSubtitle =>
      'Type the phrase exactly as shown as fast as you can!';

  @override
  String get wordLadderTitle => 'Word Ladder';

  @override
  String get wordLadderSubtitle =>
      'Connect the words by changing one letter at a time.';

  @override
  String get tangleFixTitle => 'Untangled!';

  @override
  String get tangleFixSubtitle => 'Untangle the lines so none intersect';

  @override
  String get oddRotationTitle => 'Odd Rotation';

  @override
  String get oddRotationSubtitle =>
      'One of these is mirrored. Can you find it?';

  @override
  String get towerOfLondonTitle => 'Tower of London';

  @override
  String get towerOfLondonSubtitle => 'Match the target configuration';

  @override
  String get symbolicFlankerTitle => 'Time\\';

  @override
  String get symbolicFlankerSubtitle => 'Focus on the center symbol';

  @override
  String get stroopTestTitle => 'Stroop Test';

  @override
  String get stroopTestSubtitle =>
      'Identify the ink color of the word shown. Ignore what the word actually says!';

  @override
  String get wisconsinCardSortingTitle => 'Game Over';

  @override
  String get wisconsinCardSortingSubtitle =>
      'MATCH THE CARD TO ONE OF THE FOUR ABOVE';

  @override
  String get nBackTitle => 'N-Back Test';

  @override
  String get nBackSubtitle =>
      'Tap MATCH if the current letter matches the one shown 2 steps ago.';

  @override
  String get rhythmMasterTitle => 'Rhythm Master';

  @override
  String get rhythmMasterSubtitle => 'Tap in sync with the pulse';

  @override
  String get pixelMimicTitle => 'Pixel Mimic';

  @override
  String get targetNumberTitle => 'Target 24';

  @override
  String targetNumberSubtitle(Object target) {
    return 'Use all 4 numbers to reach $target';
  }

  @override
  String get mirrorTracingTitle => 'Traced To Perfection!';

  @override
  String get mirrorTracingSubtitle => 'Trace the star! Controls are MIRRORED.';

  @override
  String get wordSurgeTitle => 'Word Surge';

  @override
  String get wordSurgeSubtitle => 'Synonyms & Antonyms';

  @override
  String get perspectiveTakingTitle => '¡Gran Perspectiva!';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return '¿Qué vista es desde el $targetDirName?';
  }

  @override
  String get paperFoldingTitle => 'Unfolded Perfection!';

  @override
  String get paperFoldingSubtitle => 'What will it look like when unfolded?';

  @override
  String get waterSortTitle => 'Well Done!';

  @override
  String get waterSortSubtitle =>
      'Sort the colors so each tube contains only one color.';

  @override
  String get numericalEstimationTitle => 'Time\\';

  @override
  String get numericalEstimationSubtitle => 'Pick the closest answer fast!';

  @override
  String get lockPatternTitle => 'Lock Pattern';

  @override
  String get lockPatternSubtitle =>
      'Find the secret pattern. Every guess gives feedback on position and dots.';

  @override
  String get primeHunterTitle => 'Prime Hunter';

  @override
  String get primeHunterSubtitle =>
      'Swipe LEFT for PRIME | Swipe RIGHT for COMPOSITE';

  @override
  String get tracePathTitle => 'Trace Path';

  @override
  String get tracePathSubtitle =>
      'Follow the target path as closely as you can';

  @override
  String get ruleSwitcherTitle => 'Rule Switcher';

  @override
  String get ruleSwitcherSubtitle => 'Apply the current rule';

  @override
  String get choiceReactionTimeTitle => 'Time\\';

  @override
  String get pathRecallTitle => 'Path Recall';

  @override
  String get switchTaskTitle => 'Switch Task';

  @override
  String get switchTaskSubtitle =>
      'Pay attention to the rule! It will switch between matching the shape and matching the color.';

  @override
  String get mentalRotationTitle => 'Mental Rotation';

  @override
  String get mentalRotationSubtitle =>
      'Are these shapes the same, just rotated?';

  @override
  String get missingOperatorTitle => 'Operator Mix';

  @override
  String get missingOperatorSubtitle =>
      'Fill the blanks to complete the equation';

  @override
  String get wordMastermindTitle => 'Word Mastermind';

  @override
  String get wordMastermindSubtitle =>
      'Crack the 4-letter code! Bulls (B) are perfect spots, Cows (C) are wrong spots.';

  @override
  String get simonSequenceTitle => 'Sequence';

  @override
  String get symbolLogicTitle => 'Symbol Logic';

  @override
  String get symbolLogicSubtitle =>
      'Solve the visual equations to find the value of each symbol. What is the result of the last equation?';

  @override
  String get silhouetteMatchTitle => 'Matched!';

  @override
  String get silhouetteMatchSubtitle => 'Which silhouette matches this object?';

  @override
  String get operationSpanTitle => 'Game Over';

  @override
  String get slidePuzzleTitle => 'Slide Puzzle';

  @override
  String get visualSearchTitle => 'Visual Search';

  @override
  String get visualSearchSubtitle => 'Find the unique symbol in the grid';

  @override
  String get trailMakingTitle => 'Trail Making';

  @override
  String get trailMakingSubtitle =>
      'Connect the numbers in order (1 -> 2 -> 3...) as fast as you can.';

  @override
  String get matrixReasoningTitle => 'Matrix Reasoning';

  @override
  String get matrixReasoningSubtitle => 'Complete the pattern in the 3x3 grid';

  @override
  String get tentsAndTreesTitle => 'Tents & Trees';

  @override
  String get tentsAndTreesSubtitle =>
      'Place tents next to trees. Numbers indicate how many tents are in each row/column. Tents cannot touch each other.';

  @override
  String get quickMathTitle => 'Quick Math';

  @override
  String get magicSquaresTitle => 'Magic Square';

  @override
  String magicSquaresSubtitle(Object targetSum) {
    return 'Every row, column and diagonal must sum to $targetSum';
  }

  @override
  String get objectShuffleTitle => 'Object Shuffle';

  @override
  String get pipesTitle => 'Pipes';

  @override
  String get pipesSubtitle => 'Connect matching colored dots with pipes.';

  @override
  String get oddOneOutTitle => 'Odd One Out';

  @override
  String get oddOneOutSubtitle => 'Find the tile with a different color.';

  @override
  String get einsteinRiddleTitle => 'EINSTEIN RIDDLE';

  @override
  String get einsteinRiddleSubtitle =>
      'Use the clues to deduce the attributes of each house.';

  @override
  String get einsteinRiddleHowToPlay =>
      'Each house has unique attributes (color, nationality, pet, etc.). Use the provided clues to fill in the grid and find the complete solution.';

  @override
  String get mirrorImageTitle => 'Mirror Image';

  @override
  String get mirrorImageSubtitle => 'Identify the correct mirror reflection.';

  @override
  String get mirrorImageHowToPlay =>
      'Look at the shape and choose its correct mirror reflection from the options provided.';

  @override
  String get mentalMappingTitle => 'Mental Mapping';

  @override
  String get mentalMappingSubtitle =>
      'Follow the directions and find the destination.';

  @override
  String get mentalMappingHowToPlay =>
      'You will be shown a sequence of directions (North, South, East, West). Mentally follow these steps starting from the center of the grid and select the final destination.';

  @override
  String get memoryPalaceTitle => 'Memory Palace';

  @override
  String get memoryPalaceSubtitle =>
      'Remember which word was in which location.';

  @override
  String get memoryPalaceHowToPlay =>
      'A set of words will appear in different locations on a grid. Memorize their positions. Then, you will be asked to place the words back in their original locations.';

  @override
  String get countingSheepTitle => 'Counting Sheep';

  @override
  String get countingSheepSubtitle => 'How many sheep did you see?';

  @override
  String get countingSheepHowToPlay =>
      'Sheep will run across the screen quickly. Count them as they pass and enter the total number at the end.';

  @override
  String get faceTraitAssociationTitle => 'Face-Trait';

  @override
  String get faceTraitAssociationSubtitle => 'Memorize traits for each face';

  @override
  String get faceTraitAssociationHowToPlay =>
      'You will be shown several faces, each with a name, occupation, and hobby. Memorize these associations. Later, you will be asked to recall the specific traits for each face.';

  @override
  String get mentalCalendarTitle => 'Mental Calendar';

  @override
  String get mentalCalendarSubtitle => 'Calculate the day of the week';

  @override
  String get mentalCalendarHowToPlay =>
      'A random date will be shown. Use mental calculation (or the Doomsday algorithm) to determine which day of the week it falls on.';

  @override
  String get vocabularyBuilderTitle => 'Vocabulary Builder';

  @override
  String get vocabularyBuilderSubtitle =>
      'Match synonyms and antonyms under time pressure.';

  @override
  String get vocabularyBuilderHowToPlay =>
      'You will be shown a target word and a relation (Synonym or Antonym). Choose the correct word from the options that matches the relation. Be quick, the clock is ticking!';

  @override
  String get grammarPoliceTitle => 'Grammar Police';

  @override
  String get grammarPoliceSubtitle =>
      'Identify and correct errors in a scrolling wall of text.';

  @override
  String get grammarPoliceHowToPlay =>
      'Sentences will scroll up the screen. Some contain errors (spelling, grammar, or punctuation). Tap the sentences that contain errors to \'correct\' them. Don\'t let too many errors pass by!';

  @override
  String get reverseStroopTitle => 'Reverse Stroop';

  @override
  String get reverseStroopSubtitle =>
      'A variation of the Stroop test where the focus is switched.';

  @override
  String get reverseStroopHowToPlay =>
      'Pay attention to the instruction! If it says \'TEXT\', match the word\'s meaning. If it says \'COLOR\', match the ink color. The rules will switch frequently to test your focus.';

  @override
  String get game2048Instruction =>
      'DESLIZA EN CUALQUIER DIRECCIÓN PARA COMBINAR';
}
