// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Puzzle Hub';

  @override
  String get home => 'Home';

  @override
  String get settings => 'Settings';

  @override
  String get playAgain => 'Play Again';

  @override
  String get playNext => 'Play Next';

  @override
  String get seeCompleted => 'Review';

  @override
  String get finish => 'Finish';

  @override
  String get congrats => 'Congrats';

  @override
  String get perfectGradient => 'Perfect Gradient!';

  @override
  String get wellDone => 'Well Done';

  @override
  String get timeUp => 'Time\'s Up!';

  @override
  String get victory => 'Victory!';

  @override
  String get gameWin => 'WELL DONE!';

  @override
  String get completed => 'Completed!';

  @override
  String get score => 'Score';

  @override
  String get timeLeft => 'Time';

  @override
  String get trials => 'Trials';

  @override
  String get numberRule => 'Number Rule';

  @override
  String get colorRule => 'Color Rule';

  @override
  String get valid => 'Valid';

  @override
  String get invalid => 'Invalid';

  @override
  String get even => 'Even';

  @override
  String get odd => 'Odd';

  @override
  String get red => 'Red';

  @override
  String get green => 'Green';

  @override
  String get blue => 'Blue';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get trueLabel => 'True';

  @override
  String get falseLabel => 'False';

  @override
  String get clear => 'Clear';

  @override
  String get north => 'North';

  @override
  String get south => 'South';

  @override
  String get east => 'East';

  @override
  String get west => 'West';

  @override
  String get target => 'Target';

  @override
  String get moves => 'Moves';

  @override
  String get trialMode => 'Trial Mode';

  @override
  String get trialModeDescription => 'Solve 20 to finish instead of 60s timer';

  @override
  String get appearance => 'Appearance';

  @override
  String get language => 'Language';

  @override
  String get gameplay => 'Gameplay';

  @override
  String get supportUs => 'Support Us';

  @override
  String get systemLegal => 'System & Legal';

  @override
  String get games => 'Games';

  @override
  String get solvedToday => 'Solved Today';

  @override
  String get searchGames => 'Search Games...';

  @override
  String get readyToStart => 'READY TO START YOUR BRAIN WORKOUT?';

  @override
  String get greatStart => 'GREAT START! KEEP THAT MOMENTUM.';

  @override
  String get onFire => 'ON FIRE! YOUR BRAIN IS LOVING THIS.';

  @override
  String get incredible => 'INCREDIBLE! YOU\'RE A PUZZLE MASTER.';

  @override
  String get noGamesMatch => 'NO GAMES MATCH YOUR SEARCH';

  @override
  String get categoryAll => 'ALL';

  @override
  String get categoryAttention => 'ATTENTION';

  @override
  String get categoryLogic => 'LOGIC';

  @override
  String get categoryMath => 'MATH';

  @override
  String get categoryWord => 'WORD';

  @override
  String get categoryMemory => 'MEMORY';

  @override
  String get categorySpatial => 'SPATIAL';

  @override
  String get themeLight => 'LIGHT';

  @override
  String get themeDark => 'DARK';

  @override
  String get themeSystem => 'SYSTEM';

  @override
  String get starOnGithub => 'Star on GitHub';

  @override
  String get sponsorOnGithub => 'Sponsor on GitHub';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get licenses => 'Licenses';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return 'You have $maxTries tries to find the hidden $wordLength-letter word.';
  }

  @override
  String wordFoundMessage(String word) {
    return 'Word found successfully: $word';
  }

  @override
  String gameOverMessage(String word) {
    return 'The word was: $word';
  }

  @override
  String get gameOver => 'Game Over';

  @override
  String get crosswordTitle => 'Crossword';

  @override
  String get crosswordSubtitle =>
      'Complete the grid with the correct words based on the clues provided.';

  @override
  String get wordSearchTitle => 'Word Search';

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
  String get minesweeperMines => 'MINES';

  @override
  String get minesweeperStatus => 'STATUS';

  @override
  String get minesweeperWon => 'WON';

  @override
  String get minesweeperBoom => 'BOOM';

  @override
  String get minesweeperPlaying => 'PLAYING';

  @override
  String get minesweeperReveal => 'REVEAL';

  @override
  String get minesweeperFlag => 'FLAG';

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
  String get magnetsTitle => 'MAGNETS';

  @override
  String get magnetsSubtitle =>
      'Place magnets in the grid based on pole counts.';

  @override
  String get magnetsHowToPlay =>
      'Fill domino-sized containers with \'+\' and \'-\' magnets or leave them blank. Row and column clues specify the total number of each pole in that line. Identical poles cannot be adjacent orthogonally.';

  @override
  String get magnetsWinTitle => 'POLARITY BALANCED!';

  @override
  String get magnetsWinMessage => 'All magnets are perfectly arranged!';

  @override
  String get lighthousesTitle => 'LIGHTHOUSES';

  @override
  String get lighthousesSubtitle => 'Place ships based on lighthouse clues.';

  @override
  String get lighthousesHowToPlay =>
      'Place 1x1 ships in the grid. Lighthouses indicate the total number of ships visible horizontally and vertically. Ships cannot touch lighthouses or each other, even diagonally.';

  @override
  String get lighthousesWinTitle => 'SEA SAFE!';

  @override
  String get lighthousesWinMessage =>
      'All lighthouses are guiding the ships perfectly!';

  @override
  String get dominosaTitle => 'DOMINOSA';

  @override
  String get dominosaSubtitle => 'Find all the hidden dominoes in the grid.';

  @override
  String get dominosaHowToPlay =>
      'Arrange a complete set of dominoes on a grid of numbers such that every pair of adjacent numbers is covered by exactly one domino. Each number pair exists only once in the set.';

  @override
  String get dominosaWinTitle => 'DOMINO MASTER!';

  @override
  String get dominosaWinMessage => 'Every domino has been found and placed!';

  @override
  String get skyscrapersTitle => 'SKYSCRAPERS';

  @override
  String get skyscrapersSubtitle => 'Fill the grid with building heights.';

  @override
  String get skyscrapersHowToPlay =>
      'Fill the grid with heights (1-N) such that each row and column contains each height exactly once. Clues on the edges indicate how many buildings are visible from that direction, with taller buildings blocking shorter ones.';

  @override
  String get skyscrapersWinTitle => 'SKYLINE RESTORED!';

  @override
  String get skyscrapersWinMessage => 'All buildings are perfectly positioned!';

  @override
  String get nurikabeTitle => 'NURIKABE';

  @override
  String get nurikabeSubtitle => 'Form a connected sea and separate islands.';

  @override
  String get nurikabeHowToPlay =>
      'Shade cells to form a single connected \'sea\' (no 2x2 blocks). Unshaded cells form \'islands\', each containing exactly one number that represents its total area.';

  @override
  String get nurikabeWinTitle => 'SEA FLOWING!';

  @override
  String get nurikabeWinMessage => 'Islands separated, sea connected!';

  @override
  String get fillominoTitle => 'FILLOMINO';

  @override
  String get fillominoSubtitle =>
      'Divide the grid into polyominoes of the specified sizes.';

  @override
  String get fillominoHowToPlay =>
      'Divide the grid into polyominoes such that each polyomino of size N contains the number N in all its cells. Polyominoes of the same size cannot be orthogonally adjacent.';

  @override
  String get fillominoWinTitle => 'GRID DIVIDED!';

  @override
  String get fillominoWinMessage => 'Perfectly tiled with logic!';

  @override
  String get hitoriTitle => 'HITORI';

  @override
  String get hitoriSubtitle =>
      'Shade duplicate numbers in each row and column.';

  @override
  String get hitoriHowToPlay =>
      'Shade cells so that no number appears more than once in any row or column. Shaded cells cannot be adjacent (orthogonally), and all unshaded cells must form a single connected group.';

  @override
  String get hitoriWinTitle => 'HITORI MASTER!';

  @override
  String get hitoriWinMessage =>
      'You\'ve successfully resolved all the duplicates!';

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
  String get akariSubtitle => 'Illuminate all white cells';

  @override
  String get akariHowToPlay =>
      'Place lightbulbs in white cells to illuminate the entire grid. Bulbs light up their row and column until they hit a wall. No two bulbs can shine on each other. Numbered walls show exactly how many bulbs must be placed in adjacent cells (up, down, left, right).';

  @override
  String get akariWinTitle => 'LIGHTS UP!';

  @override
  String get akariWinMessage => 'Everything is perfectly illuminated.';

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
  String hueSortWrongTiles(int count) {
    return 'Tiles in wrong position: $count';
  }

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
  String get semanticLinkTitle => 'Semantic Link';

  @override
  String get semanticLinkSubtitle => 'Find the word that connects all three';

  @override
  String get reflexTapTitle => 'Reflex Tap';

  @override
  String get visualStatisticalLearningTitle => 'Visual Stats Learning';

  @override
  String get orbitTapTitle => 'Orbit Tap';

  @override
  String get orbitTapSubtitle => 'Tap when balls align with the gate';

  @override
  String get schulteTableTitle => 'Schulte Table';

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
  String get memoryMatrixTitle => 'Memory Matrix';

  @override
  String get memoryMatrixSubtitle => 'Memorize the pattern and tap the tiles.';

  @override
  String get mentalAbacusTitle => 'Mental Abacus';

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
  String get sternbergTaskTitle => 'Sternberg Task';

  @override
  String get sternbergTaskMemorize => 'Memorize the letters';

  @override
  String get sternbergTaskWasLetterSet => 'Was this letter in the set?';

  @override
  String sternbergTaskScore(int score) {
    return 'You scored $score points in Sternberg Task!';
  }

  @override
  String get verbalAnalogiesTitle => 'Verbal Analogies';

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
  String get tangleFixTitle => 'Tangle Fix';

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
  String get symbolicFlankerTitle => 'Symbolic Flanker';

  @override
  String get symbolicFlankerSubtitle => 'Focus on the center symbol';

  @override
  String get stroopTestTitle => 'Stroop Test';

  @override
  String get stroopTestSubtitle =>
      'Identify the ink color of the word shown. Ignore what the word actually says!';

  @override
  String get wisconsinCardSortingTitle => 'Wisconsin Card Sort';

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
  String targetNumberSubtitle(int target) {
    return 'Use all 4 numbers to reach $target';
  }

  @override
  String get mirrorTracingTitle => 'Mirror Tracing';

  @override
  String get mirrorTracingSubtitle => 'Trace the star! Controls are MIRRORED.';

  @override
  String get wordSurgeTitle => 'Word Surge';

  @override
  String get wordSurgeSubtitle => 'Synonyms & Antonyms';

  @override
  String get perspectiveTakingTitle => 'Perspective Taking';

  @override
  String get perspectiveTakingTopDownView => 'TOP-DOWN VIEW';

  @override
  String get perspectiveTakingChoosePerspective => 'CHOOSE THE PERSPECTIVE';

  @override
  String get perspectiveTakingCongrats =>
      'You have a sharp eye for spatial relationships.';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return 'Which view is from the $targetDirName?';
  }

  @override
  String get paperFoldingTitle => 'Paper Folding';

  @override
  String get paperFoldingSubtitle => 'What will it look like when unfolded?';

  @override
  String get waterSortTitle => 'Water Sort';

  @override
  String get waterSortSubtitle =>
      'Sort the colors so each tube contains only one color.';

  @override
  String get numericalEstimationTitle => 'Numerical Estimation';

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
  String get choiceReactionTimeTitle => 'Choice Reaction Time';

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
  String get silhouetteMatchTitle => 'Silhouette Match';

  @override
  String get silhouetteMatchSubtitle => 'Which silhouette matches this object?';

  @override
  String get operationSpanTitle => 'Operation Span';

  @override
  String get operationSpanMathPhase => 'Is the equation correct?';

  @override
  String get operationSpanLetterPhase => 'Remember the letter';

  @override
  String get operationSpanRecallPhase => 'Recall the letters in order';

  @override
  String get operationSpanRoundComplete => 'Round Complete!';

  @override
  String operationSpanScore(int score) {
    return 'You scored $score points in Operation Span!';
  }

  @override
  String get slidePuzzleTitle => 'Slide Puzzle';

  @override
  String get slidePuzzleNewGame => 'NEW GAME';

  @override
  String get slidePuzzleInstructions =>
      'Rearrange the tiles into numerical order by sliding them into the empty space.';

  @override
  String get slidePuzzleTileSlider => 'TILE SLIDER';

  @override
  String get slidePuzzleCongrats =>
      'You have successfully ordered all the tiles.';

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
  String magicSquaresSubtitle(int targetSum) {
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
  String get einsteinRiddleColor => 'Color';

  @override
  String get einsteinRiddleNationality => 'Nationality';

  @override
  String get einsteinRiddleDrink => 'Drink';

  @override
  String get einsteinRiddlePet => 'Pet';

  @override
  String get einsteinRiddleSmoke => 'Smoke';

  @override
  String get einsteinRiddleHouse => 'House';

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
  String get correct => 'CORRECT';

  @override
  String get incorrect => 'INCORRECT';

  @override
  String get grammarPoliceTitle => 'Grammar Police';

  @override
  String get grammarPoliceSubtitle =>
      'Identify if the sentence is grammatically correct or contains errors.';

  @override
  String get grammarPoliceHowToPlay =>
      'A sentence will appear in the center of the screen. Decide if it is grammatically correct or if it contains an error. Tap \'CORRECT\' if it\'s fine, or \'INCORRECT\' if you spot a mistake. Don\'t lose all your lives!';

  @override
  String get reverseStroopTitle => 'Reverse Stroop';

  @override
  String get reverseStroopSubtitle =>
      'A variation of the Stroop test where the focus is switched.';

  @override
  String get reverseStroopHowToPlay =>
      'Pay attention to the instruction! If it says \'TEXT\', match the word\'s meaning. If it says \'COLOR\', match the ink color. The rules will switch frequently to test your focus.';

  @override
  String get game2048Instruction => 'SWIPE IN ANY DIRECTION TO MERGE';

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

  @override
  String get baseShiftTitle => 'BASE SHIFT BLITZ';

  @override
  String get baseShiftSubtitle => 'Solve in decimal';

  @override
  String get baseShiftDescription =>
      'Solve the equation and type the answer in decimal (Base 10).';

  @override
  String get baseShiftEquation => 'EQUATION';

  @override
  String get baseShiftHint => 'Enter decimal result...';

  @override
  String get baseShiftCorrect => 'Correct!';

  @override
  String get baseShiftIncorrect => 'Incorrect!';

  @override
  String get baseShiftSubmit => 'SUBMIT';

  @override
  String get baseShiftQuickGuide => 'Quick Guide:';

  @override
  String get baseShiftBinary => 'Binary (bin): Base 2 (0, 1)';

  @override
  String get baseShiftHex => 'Hexadecimal (0x): Base 16 (0-9, A-F)';

  @override
  String get baseShiftDecimal => 'Decimal (dec): Base 10 (0-9)';

  @override
  String get baseShiftWinTitle => 'MATH WIZARD!';

  @override
  String get baseShiftWinMessage =>
      'You correctly solved 5 base-shift equations!';

  @override
  String get blockCount3DTitle => 'Block Count 3D';

  @override
  String get blockCount3DSubtitle => 'DRAG TO ROTATE • COUNT HIDDEN BLOCKS';

  @override
  String get blockCount3DHowMany => 'HOW MANY BLOCKS?';

  @override
  String get blockCount3DSubmitGuess => 'SUBMIT GUESS';

  @override
  String get blockCount3DNotQuite => 'Not quite! Try rotating to count again.';

  @override
  String get blockCount3DExcellent => 'EXCELLENT';

  @override
  String blockCount3DWinMessage(int count) {
    return 'You correctly identified all $count blocks!';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '1. Drag your finger across the 3D viewport to rotate the block stack.\n\n2. Count all the blocks in the stack.\n\n3. Remember: a block in the air must have structural support blocks underneath it (hidden blocks!).\n\n4. Type your answer in the input field and tap \"SUBMIT GUESS\" to check.';

  @override
  String get alphabetSudokuTitle => 'ALPHABET SUDOKU';

  @override
  String get alphabetSudokuSubtitle =>
      'Fill the grid so every row, column, and box contains letters A-I.';

  @override
  String get alphabetSudokuWinTitle => 'SUDOKU SOLVED!';

  @override
  String get alphabetSudokuWinMessage => 'Brilliant! You mastered the letters.';

  @override
  String get classicMazeTitle => 'Classic Maze';

  @override
  String get classicMazeSubtitle => 'EXPLORE & SOLVE • A NEW MAZE EACH GAME';

  @override
  String get classicMazeWinTitle => 'MAZE CLEARED';

  @override
  String classicMazeWinMessage(int count) {
    return 'Incredible navigation! You solved the maze in $count moves.';
  }

  @override
  String get classicMazeMoves => 'MOVES: ';

  @override
  String get classicMazeHowToPlayDescription =>
      '1. Guide the glowing yellow marble (player) to the green portal (exit) at the bottom-right.\n\n2. Use swipes anywhere on the maze, physical keyboard arrow keys, or the arrow pad buttons at the bottom to move.\n\n3. The purple trail shows the path you have explored. Backtrack onto your trail to erase it dynamically!\n\n4. Toggle difficulties from the top action bar to challenge yourself with larger mazes!';

  @override
  String get conjunctionSearchTitle => 'Conjunction Search';

  @override
  String get conjunctionSearchSubtitle =>
      'Attentional Focus & Feature Conjunction';

  @override
  String get conjunctionSearchWinTitle => 'VICTORY';

  @override
  String get conjunctionSearchWinMessage =>
      'You have found all targets with perfect attentional focus!';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      'A specific target shape and color combination will be shown in the instructions. Find and tap it in the dense grid as quickly as possible. Distractor shapes share either the same color or shape, so look closely!';

  @override
  String get conjunctionSearchRound => 'ROUND: ';

  @override
  String get conjunctionSearchScore => 'SCORE: ';

  @override
  String get conjunctionSearchFind => 'FIND: ';

  @override
  String get shapeCircle => 'CIRCLE';

  @override
  String get shapeSquare => 'SQUARE';

  @override
  String get shapeTriangle => 'TRIANGLE';

  @override
  String get shapeStar => 'STAR';

  @override
  String get shapeRectangle => 'RECTANGLE';

  @override
  String get shapeEllipse => 'ELLIPSE';

  @override
  String get shapeTrapezoid => 'TRAPEZOID';

  @override
  String get colorRedLabel => 'RED';

  @override
  String get colorBlueLabel => 'BLUE';

  @override
  String get colorGreenLabel => 'GREEN';

  @override
  String get colorAmberLabel => 'AMBER';

  @override
  String get cubeNetFoldTitle => 'Cube Net Fold';

  @override
  String get cubeNetFoldSubtitle => 'SELECT THE MATCHING 3D CUBE OPTION';

  @override
  String get cubeNetFoldWinTitle => 'CORRECT';

  @override
  String get cubeNetFoldWinMessage =>
      'You have perfect 3D spatial folding logic!';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '1. Look at the unfolded 2D net at the top.\n\n2. Mentally fold the net into a 3D cube.\n\n3. Choose the option below that represents a valid 3D perspective of that folded cube.\n\n4. Be careful: opposite faces in the net cannot be adjacent in 3D, and the order of adjacent faces must match!';

  @override
  String get cubeNetFoldUnfoldedNet => 'UNFOLDED 2D NET';

  @override
  String get cubeNetFoldWhichMatches => 'WHICH CUBE MATCHES?';

  @override
  String get cubeNetFoldIncorrect =>
      'Incorrect fold logic! Tap Reset or change your choice.';

  @override
  String get cubeNetFoldSubmitChoice => 'SUBMIT CHOICE';

  @override
  String get cubeNetFoldFailed => 'FAILED (TAP RESET)';

  @override
  String get faceTraitAssociationMemorize => 'MEMORIZE ALL 4 PEOPLE';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return 'PERSON $current OF $total';
  }

  @override
  String get faceTraitAssociationWhatOccupation => 'WHAT IS THEIR OCCUPATION?';

  @override
  String get faceTraitAssociationWhatHobby => 'WHAT IS THEIR HOBBY?';

  @override
  String get faceTraitAssociationWinTitle => 'MEMORY MASTER!';

  @override
  String get faceTraitAssociationLoseTitle => 'GAME OVER';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return 'You got $correct out of $total correct.';
  }

  @override
  String get topologyTitle => 'TOPOLOGY';

  @override
  String get topologySubtitle =>
      'Are these shapes topologically equivalent? (Can one be deformed into the other without cutting or gluing?)';

  @override
  String get topologyWinTitle => 'GEOMETRY GENIUS!';

  @override
  String get topologyWinMessage =>
      'You correctly identified 10 topological pairs!';

  @override
  String get topologyScore => 'SCORE: ';

  @override
  String get semanticDistanceTitle => 'Semantic Distance';

  @override
  String get semanticDistanceSubtitle =>
      'Measure the conceptual distance between words';

  @override
  String get oxymoronHuntTitle => 'Oxymoron Hunt';

  @override
  String get oxymoronHuntSubtitle => 'Pair contradictory words in the grid';

  @override
  String get portmanteauSplitTitle => 'Portmanteau Split';

  @override
  String get portmanteauSplitSubtitle =>
      'Identify the source words of a portmanteau';

  @override
  String get chainReactionTitle => 'Chain Reaction';

  @override
  String get chainReactionSubtitle => 'Connect words using overlapping letters';

  @override
  String get rhymeMasterTitle => 'Rhyme Master';

  @override
  String get rhymeMasterSubtitle => 'Identify words that rhyme with the target';

  @override
  String get definitionDashTitle => 'Definition Dash';

  @override
  String get definitionDashSubtitle =>
      'Match the correct word to its definition';

  @override
  String get syllableStackTitle => 'Syllable Stack';

  @override
  String get syllableStackSubtitle => 'Stack syllables to form complete words';

  @override
  String get sentenceUnscrambleTitle => 'Sentence Unscramble';

  @override
  String get sentenceUnscrambleSubtitle =>
      'Reorder words to form a valid sentence';

  @override
  String get grammarSortTitle => 'Grammar Sort';

  @override
  String get grammarSortSubtitle => 'Categorize words by their part of speech';

  @override
  String get vowelReconstructTitle => 'Vowel Reconstruct';

  @override
  String get vowelReconstructSubtitle =>
      'Fill in the missing vowels in the sentence';

  @override
  String get consonantReconstructTitle => 'Consonant Reconstruct';

  @override
  String get consonantReconstructSubtitle =>
      'Fill in the missing consonants in the sentence';

  @override
  String get homophoneHuntTitle => 'Homophone Hunt';

  @override
  String get silentLetterSearchTitle => 'Silent Letter Search';

  @override
  String get silentLetterSearchSubtitle =>
      'Identify silent letters in the given words';

  @override
  String get palindromeBuilderTitle => 'Palindrome Builder';

  @override
  String get palindromeBuilderSubtitle =>
      'Create a palindrome by adding minimal letters';

  @override
  String get phoneticGuessTitle => 'Phonetic Guess';

  @override
  String get phoneticGuessSubtitle =>
      'Identify the word from its phonetic spelling';

  @override
  String get spoonerismSolverTitle => 'Spoonerism Solver';

  @override
  String get spoonerismSolverSubtitle =>
      'Identify the correct spoonerism for the phrase';

  @override
  String get etymonOddballTitle => 'Etymon Oddball';

  @override
  String get etymonOddballSubtitle =>
      'Find the word that does not share the same root';

  @override
  String get etymologyOriginTitle => 'Etymology Origin';

  @override
  String get etymologyOriginSubtitle =>
      'Guess the origin language of the loanword';

  @override
  String get affixFactoryTitle => 'Affix Factory';

  @override
  String get affixFactorySubtitle =>
      'Create valid words using prefixes and suffixes';

  @override
  String get cognateCatchTitle => 'Cognate Catch';

  @override
  String get cognateCatchSubtitle =>
      'Distinguish between true cognates and false friends';

  @override
  String get compoundConnectTitle => 'Compound Connect';

  @override
  String get compoundConnectSubtitle =>
      'Combine two words to form a compound word';

  @override
  String get pangramSprintTitle => 'Pangram Sprint';

  @override
  String get pangramSprintSubtitle =>
      'Build a sentence using every letter of the alphabet';

  @override
  String get anagramDefinitionTitle => 'Anagram Definition';

  @override
  String get anagramDefinitionSubtitle =>
      'Solve the anagram based on its definition';

  @override
  String get letterBridgeTitle => 'Letter Bridge';

  @override
  String get letterBridgeSubtitle =>
      'Find the missing letter that bridges two words';

  @override
  String get letterFrequencyScanTitle => 'Letter Frequency Scan';

  @override
  String get letterFrequencyScanSubtitle =>
      'Count how many times a letter appears in the text';

  @override
  String get oneLetterShiftTitle => 'One-Letter Shift';

  @override
  String get oneLetterShiftSubtitle =>
      'Transform one word into another with one letter change';

  @override
  String vocabularyBuilderMessage(String arg0) {
    return 'Great job! Your vocabulary is impressive. Score: $arg0';
  }

  @override
  String get symmetryMessage =>
      'You mirrored the pattern perfectly with surgical precision.';

  @override
  String get temporalOrderMessage =>
      'Incredible! Your temporal sequence memory is high-fidelity.';

  @override
  String get temporalOrderMessage1 =>
      'Incorrect sequence memory. Practice makes perfect!';

  @override
  String get wordSearchMessage =>
      'All words found successfully with keen observation.';

  @override
  String colorMatchMessage(String arg0) {
    return 'Your accuracy: $arg0%';
  }

  @override
  String semanticLinkMessage(String arg0) {
    return 'You scored $arg0 points!';
  }

  @override
  String reflexTapMessage(String arg0) {
    return 'You tapped $arg0 targets!';
  }

  @override
  String get angleFinderMessage => 'Your geometric intuition is perfect!';

  @override
  String angleFinderMessage1(String arg0) {
    return 'The correct answer was $arg0°';
  }

  @override
  String angleFinderText(String arg0) {
    return '$arg0°';
  }

  @override
  String visualStatisticalLearningMessage(String arg0) {
    return 'You scored $arg0 correct patterns!';
  }

  @override
  String nonogramText(String arg0) {
    return 'Error: $arg0';
  }

  @override
  String mentalCalendarMessage(String arg0) {
    return 'You got $arg0 correct out of 10!';
  }

  @override
  String orbitTapMessage(String arg0) {
    return 'You successfully tapped $arg0 times!';
  }

  @override
  String schulteTableMessage(String arg0) {
    return 'You completed the table in $arg0.\nKeep practicing to expand your peripheral vision!';
  }

  @override
  String get schulteTableText => 'START TEST';

  @override
  String get relationalMemoryMessage =>
      'Fabulous spatial relational memory accuracy!';

  @override
  String sudokuText(String arg0) {
    return 'Error: $arg0';
  }

  @override
  String sdmtMessage(String arg0) {
    return 'You matched $arg0 symbols! This test measures your scanning speed and visual attention.';
  }

  @override
  String get futoshikiMessage =>
      'Incredible! You solved the Futoshiki Latin Square.';

  @override
  String letterFrequencyScanMessage(String arg0, String arg1) {
    return 'You correctly counted $arg0 occurrences of \"$arg1\".';
  }

  @override
  String letterFrequencyScanText(String arg0) {
    return 'Incorrect. The count was $arg0.';
  }

  @override
  String get memoryMatrixMessage =>
      'Impressive! Your working memory is sharp. Daily goal complete!';

  @override
  String get memoryMatrixMessage1 =>
      'Focus and try again to improve your memory score.';

  @override
  String get contextCluesMessage =>
      'Exceptional! Your vocabulary and contextual analysis are top notch.';

  @override
  String get contextCluesMessage1 =>
      'Wrong word selected! Train your verbal context reasoning and try again.';

  @override
  String oneLetterShiftMessage(String arg0, String arg1) {
    return 'You correctly shifted $arg0 to $arg1.';
  }

  @override
  String get mentalAbacusMessage => 'Your mental arithmetic is top-tier.';

  @override
  String fractionMatcherMessage(String arg0) {
    return 'You scored $arg0 points matching representations!';
  }

  @override
  String get spellingSprintMessage => 'You spelled all 10 words correctly!';

  @override
  String spellingSprintMessage1(String arg0) {
    return 'You spelled $arg0 words.';
  }

  @override
  String stopSignalMessage(String arg0) {
    return 'You achieved $arg0 correct responses! This test measures your ability to inhibit a planned action.';
  }

  @override
  String grammarPoliceMessage(String arg0) {
    return 'Game Over! You maintained order in the world of grammar. Score: $arg0';
  }

  @override
  String consonantReconstructMessage(String arg0) {
    return 'You reconstructed a score of $arg0!';
  }

  @override
  String rhymeMasterMessage(String arg0, String arg1) {
    return 'You found $arg0 out of $arg1 rhymes!';
  }

  @override
  String vigilanceTaskMessage(String arg0, String arg1, String arg2) {
    return 'Hits: $arg0, Misses: $arg1\nFalse Alarms: $arg2';
  }

  @override
  String get silhouetteMatchOrthoMessage =>
      'You have flawless orthographic alignment skills!';

  @override
  String get silhouetteMatchOrthoText => 'GOT IT';

  @override
  String get silhouetteMatchOrthoText1 =>
      'Incorrect perspective projection! Tap Reset to try again.';

  @override
  String fibonacciMergeMessage(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String factorFinderMessage(String arg0) {
    return 'You scored $arg0 points by finding all factors!';
  }

  @override
  String logicalSyllogismsMessage(String arg0) {
    return 'You solved $arg0 syllogisms correctly!';
  }

  @override
  String get rotatingMazeMessage =>
      'You successfully navigated the kinetic rotating maze!';

  @override
  String get rotatingMazeText => 'GOT IT';

  @override
  String get rotatingMazeText1 => '🌀 Maze rotated 90°! Grid shifted!';

  @override
  String get mathPathMessage =>
      'You found the path that adds up to the target!';

  @override
  String get bridgesMessage => 'You successfully connected all the islands!';

  @override
  String compoundConnectMessage(String arg0, String arg1) {
    return 'The compound word is $arg0$arg1.';
  }

  @override
  String get pangramSprintMessage =>
      'You built a sentence using all 26 letters.';

  @override
  String get mirrorImageMessage => 'You perfectly identified the reflection.';

  @override
  String get mirrorImageText => 'MIRROR IMAGE';

  @override
  String reverseStroopMessage(String arg0) {
    return 'You scored $arg0 points! Keep your eye on the instructions.';
  }

  @override
  String get verbalAnalogiesMessage =>
      'You have a sharp mind for relationships.';

  @override
  String corsiBlocksMessage1(String arg0, String arg1) {
    return 'You recalled $arg1 sequences! Your spatial memory span reached $arg0.';
  }

  @override
  String wordLadderMessage(String arg0, String arg1, String arg2) {
    return 'You successfully connected $arg0 to $arg1 in $arg2 steps.';
  }

  @override
  String d2AttentionMessage(String arg0) {
    return 'Incredible selective scanning! Final score: $arg0.';
  }

  @override
  String get d2AttentionText => 'HOW TO PLAY';

  @override
  String get d2AttentionText1 => 'GOT IT';

  @override
  String get tangleFixMessage => 'All lines are clear and smooth.';

  @override
  String get distractorMatrixMessage =>
      'Incredible! You recalled patterns despite cognitive math distractors!';

  @override
  String get distractorMatrixMessage1 =>
      'The distractors got you! Retrain your working memory.';

  @override
  String sentenceUnscrambleMessage(String arg0) {
    return 'You unscrambled a score of $arg0!';
  }

  @override
  String get kakuroMessage =>
      'Incredible! You matched all sum segments perfectly.';

  @override
  String symbolicFlankerMessage(String arg0, String arg1) {
    return 'You got $arg0 correct out of $arg1!';
  }

  @override
  String stroopTestMessage(String arg0) {
    return 'You scored $arg0 correctly! Focus on the color of the ink, not the word.';
  }

  @override
  String wisconsinCardSortingMessage(String arg0) {
    return 'You correctly sorted $arg0 cards!';
  }

  @override
  String nBackMessage(String arg0) {
    return 'You achieved $arg0 2-back matches! Your working memory is vital for multitasking.';
  }

  @override
  String rhythmMasterMessage(String arg0, String arg1) {
    return 'You got $arg0 perfect hits and $arg1 points!';
  }

  @override
  String groceryListMessage(String arg0, Object score) {
    return 'You scored $arg0 points in Grocery List!';
  }

  @override
  String get groceryListText => 'I\\';

  @override
  String get mirrorTracingMessage =>
      'Your brain successfully rewired its coordination.';

  @override
  String moduloClockMessage(String arg0) {
    return 'Excellent modular mental math coordination! Score: $arg0';
  }

  @override
  String moduloClockMessage1(String arg0, String arg1, String arg2) {
    return 'You managed $arg0 of $arg1 modular clock solutions. Score: $arg2';
  }

  @override
  String get crownMessage =>
      'All crowns placed successfully with perfect logic.';

  @override
  String dualCodingMessage(String arg0) {
    return 'Fantastic dual-task performance! Your working memory score: $arg0';
  }

  @override
  String inequalityDashMessage(String arg0) {
    return 'You scored $arg0 points matching inequalities!';
  }

  @override
  String sourceMonitoringMessage(String arg0, String arg1) {
    return 'You scored $arg0 out of $arg1!';
  }

  @override
  String get sourceMonitoringText => 'START RECALL';

  @override
  String get memoryPalaceText => 'AVAILABLE WORDS';

  @override
  String target10Message(String arg0) {
    return 'You scored $arg0 points matching numbers to 10!';
  }

  @override
  String get paperFoldingMessage => 'You can see the patterns in your mind.';

  @override
  String topologyText(String arg0, String arg1) {
    return '$arg0$arg1 / 10';
  }

  @override
  String get waterSortMessage => 'You sorted all the colors perfectly!';

  @override
  String anagramDefinitionMessage(String arg0) {
    return 'The word was indeed \"$arg0\".';
  }

  @override
  String game2048Message(String arg0, String arg1, String arg2) {
    return '$arg0: $arg1\n$arg2';
  }

  @override
  String game2048Message1(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String numericalEstimationMessage(String arg0) {
    return 'You made $arg0 correct estimations.';
  }

  @override
  String grammarSortMessage(String arg0) {
    return 'You sorted $arg0 words correctly!';
  }

  @override
  String vowelReconstructMessage(String arg0) {
    return 'You reconstructed a score of $arg0!';
  }

  @override
  String spatialConflictMessage(String arg0, String arg1) {
    return 'You achieved a score of $arg0 with $arg1 errors!';
  }

  @override
  String get spatialConflictText => 'HOW TO PLAY';

  @override
  String get spatialConflictText1 => 'GOT IT';

  @override
  String tracePathMessage(String arg0) {
    return 'Your accuracy was $arg0%!';
  }

  @override
  String ruleSwitcherMessage(String arg0, String arg1) {
    return 'You scored $arg0 correct out of $arg1!';
  }

  @override
  String collatzMessage(String arg0, String arg1) {
    return 'You took $arg0 steps. Min possible was $arg1.';
  }

  @override
  String get collatzText => '/ 2';

  @override
  String get collatzText1 => '+ 1';

  @override
  String get collatzText2 => '3n + 1';

  @override
  String divisibilityDashMessage(String arg0) {
    return 'You solved $arg0 numbers!';
  }

  @override
  String switchTaskMessage(String arg0) {
    return 'You scored $arg0 correctly! Fast switching is key to mental flexibility.';
  }

  @override
  String sequenceSleuthMessage(String arg0) {
    return 'You solved $arg0 sequences!';
  }

  @override
  String changeBlindnessMessage(String arg0) {
    return 'You found $arg0 changes!';
  }

  @override
  String mentalRotationMessage(String arg0) {
    return 'You rotated $arg0 shapes correctly!';
  }

  @override
  String wordMastermindMessage(String arg0) {
    return 'You mastered the code!\nThe word was: $arg0';
  }

  @override
  String wordMastermindMessage1(String arg0) {
    return 'The hidden word was: $arg0';
  }

  @override
  String wordMastermindText(String arg0) {
    return '$arg0';
  }

  @override
  String get simonSequenceMessage => 'You memorized all 10 tiles!';

  @override
  String get simonSequenceMessage1 => 'Try again to master the sequence.';

  @override
  String oxymoronHuntMessage(String arg0) {
    return 'You found $arg0 oxymorons!';
  }

  @override
  String spotlightTrackMessage(String arg0) {
    return 'Incredible spatial tracking! You scored $arg0 points.';
  }

  @override
  String get spotlightTrackText => 'HOW TO PLAY';

  @override
  String get spotlightTrackText1 => 'GOT IT';

  @override
  String get spotlightTrackText2 => 'START ROUND';

  @override
  String vennNumbersMessage(String arg0) {
    return 'You categorized $arg0 numbers!';
  }

  @override
  String get vennNumbersText => 'NEITHER';

  @override
  String get vennNumbersText1 => 'BOTH';

  @override
  String get silhouetteMatchMessage =>
      'Your brain is excellent at 3D to 2D translation.';

  @override
  String sumSnakeMessage(String arg0) {
    return 'Target $arg0 reached with perfect precision!';
  }

  @override
  String get sumSnakeText => 'CLEAR PATH';

  @override
  String percentagePeakMessage(String arg0) {
    return 'You solved $arg0 percentage problems!';
  }

  @override
  String trailMakingMessage(String arg0) {
    return 'You completed $arg0 trails! This test measures your visual search speed and mental flexibility.';
  }

  @override
  String matrixReasoningMessage(String arg0) {
    return 'You completed $arg0 matrices correctly!';
  }

  @override
  String get tentsAndTreesMessage =>
      'You have successfully placed all the tents.';

  @override
  String klotskiMessage(String arg0) {
    return 'Sensational sliding! You freed the Hero block in $arg0 moves.';
  }

  @override
  String sumPyramidMessage(String arg0) {
    return 'You solved $arg0 sum pyramids successfully!';
  }

  @override
  String simonCommandMessage(String arg0) {
    return 'Excellent selective response and focus! Total Score: $arg0';
  }

  @override
  String simonCommandMessage1(String arg0, String arg1) {
    return 'You scored $arg0 but did not reach $arg1 matches in time.';
  }

  @override
  String syllableStackMessage(String arg0) {
    return 'You stacked up a score of $arg0!';
  }

  @override
  String get slitherlinkMessage =>
      'Awesome! You successfully completed the loop puzzle.';

  @override
  String quickMathMessage(String arg0) {
    return 'You solved $arg0 problems!';
  }

  @override
  String commonDenominatorMessage(String arg0) {
    return 'You solved $arg0 GCD/LCM problems!';
  }

  @override
  String chainReactionMessage(String arg0, String arg1) {
    return 'Your final score is $arg0. You built a chain of $arg1 words.';
  }

  @override
  String chainReactionText(String arg0) {
    return '$arg0';
  }

  @override
  String get associativePairsMessage =>
      'Brilliant! You associated visual traits flawlessly.';

  @override
  String get associativePairsMessage1 =>
      'Wrong association! Sharpen your link memory and try again.';

  @override
  String portmanteauSplitMessage(String arg0) {
    return 'You split $arg0 portmanteaus!';
  }

  @override
  String get magicSquaresText => 'CLEAR';

  @override
  String alphabetSudokuText(String arg0) {
    return 'Error: $arg0';
  }

  @override
  String get pipesMessage => 'You connected all the pipes and filled the grid.';

  @override
  String get dualMirrorMessage => 'You navigated both icons to their targets!';

  @override
  String binaryCodeMessage(String arg0) {
    return 'Sensational rapid decimal translation! Final Score: $arg0';
  }

  @override
  String binaryCodeMessage1(String arg0, String arg1) {
    return 'You correctly converted $arg0 binary numbers. Score: $arg1';
  }

  @override
  String oddOneOutMessage(String arg0) {
    return 'You found 50 odd ones! Final score: $arg0';
  }

  @override
  String oddOneOutMessage1(String arg0) {
    return 'Your score: $arg0';
  }

  @override
  String letterBridgeMessage(String arg0) {
    return 'You found the bridge letter: $arg0';
  }

  @override
  String get imReady => 'I\'M READY';

  @override
  String get soptTitle => 'Self-Ordered Pointing';

  @override
  String get soptSubtitle =>
      'Tap a different card each time. The positions shuffle!';

  @override
  String get soptWinTitle => 'Sequence Master!';

  @override
  String soptGameOverMessage(int score) {
    return 'You scored $score points by successfully tracking shuffled cards!';
  }

  @override
  String get soptChooseNovel => 'Tap a new card';

  @override
  String get soptGreatJob => 'Great job!';

  @override
  String get soptAlreadyTapped => 'Already tapped!';

  @override
  String get soptGrid => 'Grid';

  @override
  String get contRecogTitle => 'Continuous Recognition';

  @override
  String get contRecogSubtitle =>
      'Have you seen this card before in this session?';

  @override
  String get contRecogWinTitle => 'Recognition Genius!';

  @override
  String contRecogGameOverMessage(int score) {
    return 'You scored $score correct recognitions!';
  }

  @override
  String get contRecogCorrect => 'Correct!';

  @override
  String get contRecogWrong => 'Wrong!';

  @override
  String get contRecogOldOrNew => 'Is this old or new?';

  @override
  String get contRecogNew => 'New';

  @override
  String get contRecogOld => 'Old';

  @override
  String get contRecogSeenPool => 'Seen Pool';

  @override
  String get dnmsTitle => 'Non-Matching Memory';

  @override
  String get dnmsSubtitle =>
      'Tap the card that was not in the memorized sample.';

  @override
  String get dnmsWinTitle => 'Non-Matching Expert!';

  @override
  String dnmsGameOverMessage(int score) {
    return 'You scored $score correct answers in Delayed Non-Matching!';
  }

  @override
  String get dnmsChooseNovel => 'Tap the new card';

  @override
  String get dnmsMemorizeSample => 'Memorize this card';

  @override
  String get dnmsWaitForIt => 'Wait for it...';

  @override
  String get dnmsExcellent => 'Excellent!';

  @override
  String get dnmsSampleTapped => 'That was the sample!';

  @override
  String get dnmsCards => 'Cards';

  @override
  String get symSpanTitle => 'Symmetry Span';

  @override
  String get symSpanSubtitle =>
      'Recall cell patterns while identifying vertical symmetry.';

  @override
  String get symSpanWinTitle => 'Symmetry Master!';

  @override
  String symSpanGameOverMessage(int score) {
    return 'You scored $score points by recalling layouts and identifying symmetry!';
  }

  @override
  String get symSpanMemorizeRed => 'Memorize red cell location';

  @override
  String get symSpanIsSymmetric => 'Is the pattern symmetrical?';

  @override
  String get symSpanRecallSequence => 'Recall sequence in correct order';

  @override
  String get symSpanGreatJob => 'Great job!';

  @override
  String get symSpanTryAgain => 'Try again!';

  @override
  String get symSpanLength => 'Length';

  @override
  String get readingSpanTitle => 'Reading Span';

  @override
  String get readingSpanSubtitle =>
      'Verify sentences while remembering a sequence of letters.';

  @override
  String get readingSpanWinTitle => 'Reading Expert!';

  @override
  String readingSpanGameOverMessage(int score) {
    return 'You scored $score points in the Reading Span memory challenge!';
  }

  @override
  String get readingSpanTrueFalse => 'Is this statement true or false?';

  @override
  String get readingSpanMemorizeLetter => 'Memorize this letter';

  @override
  String get readingSpanRecallLetters => 'Recall letters in sequence';

  @override
  String get readingSpanGreatJob => 'Great job!';

  @override
  String get readingSpanTryAgain => 'Try again!';

  @override
  String readingSpanYourSequence(String sequence) {
    return 'Your sequence: $sequence';
  }

  @override
  String get readingSpanLength => 'Length';

  @override
  String get readingSpanSentence1 => 'The sun rises in the east.';

  @override
  String get readingSpanSentence2 => 'Ice is boiling hot.';

  @override
  String get readingSpanSentence3 => 'Fish can breathe underwater.';

  @override
  String get readingSpanSentence4 => 'Dogs have wings and can fly.';

  @override
  String get readingSpanSentence5 => 'Water freezes at 0 degrees Celsius.';

  @override
  String get readingSpanSentence6 => 'Cats bark like small dogs.';

  @override
  String get readingSpanSentence7 => 'Trees have green leaves in summer.';

  @override
  String get readingSpanSentence8 => 'Rain falls upwards from the ground.';

  @override
  String get readingSpanSentence9 => 'A triangle has four equal sides.';

  @override
  String get readingSpanSentence10 => 'Apples are a type of sweet fruit.';

  @override
  String get readingSpanSentence11 => 'The moon is made of cheddar cheese.';

  @override
  String get readingSpanSentence12 => 'Automobiles have wheels to roll.';

  @override
  String get readingSpanSentence13 => 'Fire is freezing cold.';

  @override
  String get readingSpanSentence14 => 'Paper is made from processed wood.';

  @override
  String get readingSpanSentence15 => 'Birds have feathers to help them fly.';

  @override
  String get readingSpanSentence16 => 'Bananas grow on pine trees.';

  @override
  String get readingSpanSentence17 => 'An elephant is smaller than an ant.';

  @override
  String get readingSpanSentence18 => 'Books contain printed pages of text.';

  @override
  String get countingSpanTitle => 'Counting Span';

  @override
  String get countingSpanSubtitle =>
      'Count blue circles only. Then recall the sequence of counts.';

  @override
  String get countingSpanWinTitle => 'Counting Genius!';

  @override
  String countingSpanGameOverMessage(int score) {
    return 'You scored $score points in the Counting Span memory challenge!';
  }

  @override
  String get countingSpanCountCircles => 'Count only blue circles';

  @override
  String get countingSpanRecallCounts => 'Recall counts in correct order';

  @override
  String get countingSpanGreatJob => 'Great job!';

  @override
  String get countingSpanTryAgain => 'Try again!';

  @override
  String countingSpanYourSequence(String sequence) {
    return 'Your sequence: $sequence';
  }

  @override
  String get countingSpanLength => 'Length';

  @override
  String get objDispTitle => 'Object Displacement';

  @override
  String get objDispSubtitle =>
      'Memorize layout. Find and tap the one object that shifts position.';

  @override
  String get objDispWinTitle => 'Spatial Genius!';

  @override
  String objDispGameOverMessage(int score) {
    return 'You correctly identified $score displaced objects!';
  }

  @override
  String get objDispMemorizeAll => 'Memorize all placements';

  @override
  String get objDispWaitingShift => 'Waiting for layout shift...';

  @override
  String get objDispTapMoved => 'Tap the object that moved';

  @override
  String get objDispExcellent => 'Excellent!';

  @override
  String get objDispWrongObject => 'Wrong object!';

  @override
  String get objDispItems => 'Items';

  @override
  String get mandalaTitle => 'Mandala Recall';

  @override
  String get mandalaSubtitle =>
      'Memorize color configuration. Pick colors and repaint the tiles.';

  @override
  String get mandalaWinTitle => 'Mandala Artist!';

  @override
  String mandalaGameOverMessage(int score) {
    return 'You scored $score points by recreating colored geometric layouts!';
  }

  @override
  String get mandalaMemorizeColors => 'Memorize tile colors';

  @override
  String get mandalaPaintCells => 'Paint cells to match original';

  @override
  String get mandalaExcellent => 'Excellent!';

  @override
  String get mandalaIncorrectMatch => 'Incorrect match!';

  @override
  String get mandalaSubmitRepaint => 'Submit Repaint';

  @override
  String get mandalaTiles => 'Tiles';

  @override
  String get runningSpanTitle => 'Running Span';

  @override
  String get runningSpanSubtitle =>
      'Watch the letters. When they stop, input the last N letters in order.';

  @override
  String get runningSpanWinTitle => 'Buffer Master!';

  @override
  String runningSpanGameOverMessage(int score) {
    return 'You scored $score points in Running Memory Span!';
  }

  @override
  String runningSpanPrepareRecall(int count) {
    return 'Prepare to recall last $count letters';
  }

  @override
  String get runningSpanWatchCarefully => 'Watch carefully...';

  @override
  String runningSpanEnterLast(int count) {
    return 'Enter last $count letters';
  }

  @override
  String get runningSpanGreatJob => 'Great job!';

  @override
  String get runningSpanIncorrectBuffer => 'Incorrect buffer!';

  @override
  String runningSpanRecallLast(int count) {
    return 'Recall last $count';
  }

  @override
  String get runningSpanStopsRandomly => 'The stream stops randomly!';

  @override
  String runningSpanEntered(String sequence) {
    return 'Entered: $sequence';
  }

  @override
  String get runningSpanNItems => 'N-Items';

  @override
  String get spatialCabinetTitle => 'Spatial Cabinets';

  @override
  String get spatialCabinetSubtitle =>
      'Memorize which cabinet drawer contains which object.';

  @override
  String get spatialCabinetWinTitle => 'Cabinet Expert!';

  @override
  String spatialCabinetGameOverMessage(int score) {
    return 'You scored $score points in Spatial Cabinet Memory!';
  }

  @override
  String get spatialCabinetMemorize => 'Memorize item locations';

  @override
  String spatialCabinetWhereIs(String itemName) {
    return 'Where is the $itemName?';
  }

  @override
  String get spatialCabinetCorrect => 'Correct!';

  @override
  String get spatialCabinetWrongDrawer => 'Wrong drawer!';

  @override
  String get spatialCabinetItems => 'Items';

  @override
  String get cabinetItemKey => 'Key';

  @override
  String get cabinetItemApple => 'Apple';

  @override
  String get cabinetItemDiamond => 'Diamond';

  @override
  String get cabinetItemBook => 'Book';

  @override
  String get cabinetItemUmbrella => 'Umbrella';

  @override
  String get cabinetItemCoffee => 'Coffee';

  @override
  String get cabinetItemLock => 'Lock';

  @override
  String get cabinetItemPet => 'Pet';

  @override
  String get cabinetItemCar => 'Car';

  @override
  String get gamesTitleLabel => 'GAMES';

  @override
  String get yourFavorites => 'YOUR FAVORITES';

  @override
  String get readyForWorkout => 'READY FOR YOUR DAILY WORKOUT?';

  @override
  String get greatStartKeepGoing => 'GREAT START! KEEP GOING.';

  @override
  String get onFireToday => 'YOU\'RE ON FIRE TODAY!';

  @override
  String get incredibleSolvingToday => 'INCREDIBLE SOLVING TODAY!';

  @override
  String get newGameLabel => 'NEW';

  @override
  String get slitherlinkTitle => 'Slitherlink';

  @override
  String get slitherlinkSubtitle => 'LOOP THE PIN GRID USING NUMBER CLUES.';

  @override
  String get futoshikiTitle => 'Futoshiki';

  @override
  String get futoshikiSubtitle => 'FILL GRIDS WITH GREATER-THAN CLUES.';

  @override
  String get kakuroTitle => 'Kakuro';

  @override
  String get kakuroSubtitle => 'SOLVE CROSSWORDS WITH NUMBERS AND SUMS.';

  @override
  String get inequalityDashTitle => 'Inequality Dash';

  @override
  String get inequalityDashSubtitle =>
      'SOLVE INEQUALITIES UNDER TIME PRESSURE.';

  @override
  String get factorFinderTitle => 'Factor Finder';

  @override
  String get factorFinderSubtitle => 'IDENTIFY ALL FACTORS OF TARGET NUMBERS.';

  @override
  String get collatzTitle => 'Collatz Path';

  @override
  String get collatzSubtitle => 'NAVIGATE THE 3N+1 SEQUENCE.';

  @override
  String get sumPyramidTitle => 'Sum Pyramid';

  @override
  String get sumPyramidSubtitle => 'FILL PYRAMID CELLS WITH SUM MATH CLUES.';

  @override
  String get target10Title => 'Target 10';

  @override
  String get target10Subtitle => 'COMBINE NUMBER TILES TO REAP TEN SUMS.';

  @override
  String get fractionMatcherTitle => 'Fraction Matcher';

  @override
  String get fractionMatcherSubtitle => 'MATCH EQUIVALENT FRACTIONS VISUALLY.';

  @override
  String get dualCodingTitle => 'Dual Coding';

  @override
  String get dualCodingSubtitle => 'MATCH LETTERS AND SYMBOLS CONCURRENTLY.';

  @override
  String get distractorMatrixTitle => 'Distractor Matrix';

  @override
  String get distractorMatrixSubtitle => 'FIND TARGET SHAPES AMID DISTRACTORS.';

  @override
  String get temporalOrderTitle => 'Temporal Order';

  @override
  String get temporalOrderSubtitle => 'RECALL THE CHRONOLOGICAL SEQUENCE.';

  @override
  String get associativePairsTitle => 'Associative Pairs';

  @override
  String get associativePairsSubtitle =>
      'PAIR AND MATCH CORRESPONDING SYMBOLS.';

  @override
  String get blockCount3dTitle => '3D Block Count';

  @override
  String get blockCount3dSubtitle => 'COUNT BLOCKS IN THREE-DIMENSIONAL SPACE.';

  @override
  String get rotatingMazeTitle => 'Rotating Maze';

  @override
  String get rotatingMazeSubtitle => 'ROTATE MAZES TO GUIDE BALLS TO THE EXIT.';

  @override
  String get silhouetteMatchOrthoTitle => 'Silhouette Match';

  @override
  String get silhouetteMatchOrthoSubtitle =>
      'MATCH 3D OBJECTS WITH ORTHO SHADOWS.';

  @override
  String get spatialConflictTitle => 'Spatial Conflict';

  @override
  String get spatialConflictSubtitle =>
      'RESOLVE TEXT AND DIRECTION DISCREPANCIES.';

  @override
  String get spotlightTrackTitle => 'Spotlight Track';

  @override
  String get spotlightTrackSubtitle =>
      'TRACK BLINKING ITEMS IN MOVING SHADOWS.';

  @override
  String get d2AttentionTitle => 'd2 Attention';

  @override
  String get d2AttentionSubtitle => 'TAP TARGET SYMBOLS WITH STRICT CRITERIA.';

  @override
  String get dualMirrorTitle => 'Dual Mirror Nav';

  @override
  String get dualMirrorSubtitle => 'NAVIGATE TWO MAZES AT ONCE.';

  @override
  String get contextCluesTitle => 'Context Clues';

  @override
  String get contextCluesSubtitle => 'INFER HIDDEN WORDS FROM CONTEXT HINTS.';

  @override
  String get digitSpanReverseSubtitle =>
      'RECALL NUMBER DIGITS IN REVERSE ORDER.';

  @override
  String get faceNameAssociationSubtitle =>
      'RECALL NAMES FOR DIVERSE PRESENTED FACES.';

  @override
  String get staircaseMemorySubtitle => 'MEMORIZE BLOCKS IN STEPWISE SEQUENCE.';

  @override
  String get choiceReactionTimeSubtitle =>
      'TAP SPECIFIC BUTTONS MATCHING CUES FAST.';

  @override
  String get attentionalBlinkSubtitle =>
      'SPARK RAPID TARGETS FLASHING IN STREAMS.';

  @override
  String get visualStatisticalLearningSubtitle =>
      'LEARN TEMPORAL SHAPE PATTERNS VISUALLY.';

  @override
  String get sternbergTaskSubtitle => 'RECALL IF SYMBOL WAS IN THE MEMORY SET.';

  @override
  String get operationSpanSubtitle => 'SOLVE MATH AND RECALL ALPHABET STRINGS.';

  @override
  String get continuousRecognitionTitle => 'Continuous Recog';

  @override
  String get continuousRecognitionSubtitle =>
      'IDENTIFY IF THE CARD PRESENTED IS OLD OR NEW.';

  @override
  String get symmetrySpanTitle => 'Symmetry Span';

  @override
  String get symmetrySpanSubtitle =>
      'RECALL CELL COORDINATES AMID VERTICAL SYMMETRY DECISIONS.';

  @override
  String get objectDisplacementTitle => 'Object Displacement';

  @override
  String get objectDisplacementSubtitle =>
      'STUDY PLACEMENTS AND TAP THE SINGLE OBJECT THAT MOVED.';

  @override
  String get mandalaRecallTitle => 'Mandala Recall';

  @override
  String get mandalaRecallSubtitle =>
      'MEMORIZE COLOR TILES AND REPAINT MANDALAS FROM PALETTE.';

  @override
  String get runningMemorySpanTitle => 'Running Span';

  @override
  String get runningMemorySpanSubtitle =>
      'MONITOR RUNNING LETTERS AND RECALL THE LAST N ITEMS.';

  @override
  String get spatialCabinetMemoryTitle => 'Spatial Cabinets';

  @override
  String get spatialCabinetMemorySubtitle =>
      'MEMORIZE AND LOCATE ITEMS BEHIND CABINET DOORS.';

  @override
  String get pathRecallSubtitle => 'MEMORIZE AND REPEAT PATHWAY SELECTIONS.';

  @override
  String get objectShuffleSubtitle => 'TRACK ITEMS SHUFFLED UNDER DEEP CUPS.';

  @override
  String get groceryListSubtitle => 'MEMORIZE AND CHECK OFF ITEMS ON THE LIST.';

  @override
  String get quickMathSubtitle => 'SOLVE ARITHMETIC QUESTIONS AT TOP SPEED.';

  @override
  String get mathGuessTitle => 'Math Guess';

  @override
  String get mathGuessSubtitle => 'GUESS THE HIDDEN NUMBER WITHIN 15 CHANCES.';

  @override
  String get reflexTapSubtitle => 'TAP STIMULI AS FAST AS HUMANLY POSSIBLE.';

  @override
  String get pixelMimicSubtitle => 'MIMIC DESIGN PATTERNS ON PIXEL GRIDS.';

  @override
  String get simonSequenceSubtitle => 'REPEAT SHAPE SEQUENCES FROM MEMORY.';

  @override
  String get slidePuzzleSubtitle => 'REARRANGE SQUARE SLIDING GRID TILES.';

  @override
  String get findWordTitle => 'Find Word';

  @override
  String get schulteTableSubtitle => 'TAP NUMBERS FROM ONE TO TWENTY-FIVE.';

  @override
  String get simonCommandTitle => 'Simon Command';

  @override
  String get simonCommandSubtitle => 'PERFORM VOICE INSTRUCTIONS QUICKLY.';

  @override
  String get binaryCodeTitle => 'Binary Speed';

  @override
  String get binaryCodeSubtitle => 'TRANSLATE BINARY CODES INTO DECIMAL.';

  @override
  String get moduloClockTitle => 'Modulo Clock';

  @override
  String get moduloClockSubtitle => 'CALCULATE MATH EQUATIONS USING CLOCKS.';

  @override
  String get chimpTestTitle => 'Chimp Test';

  @override
  String get chimpTestSubtitle => 'TAP RANDOM NUMBERS IN ASCENDING ORDER.';

  @override
  String get relationalMemoryTitle => 'Relational Memory';

  @override
  String get relationalMemorySubtitle =>
      'RECALL THE EXACT GRID ITEM POSITIONS.';

  @override
  String get factBinderTitle => 'Fact Binder';

  @override
  String get factBinderSubtitle => 'CONNECT SYMBOLS AND RECALL STATEMENTS.';

  @override
  String get sourceMonitoringTitle => 'Source Monitoring';

  @override
  String get sourceMonitoringSubtitle => 'REMEMBER THE CONTEXT.';

  @override
  String get klotskiTitle => 'Klotski Escape';

  @override
  String get klotskiSubtitle => 'SLIDE BLOCKS TO REACH THE EXITS.';

  @override
  String get homophoneHuntSubtitle => 'Choose the correctly spelled homophone';

  @override
  String get laserLinkTitle => 'Laser Link';

  @override
  String get laserLinkSubtitle =>
      'Rotate mirrors to reflect lasers and power up all the targets.';

  @override
  String get laserLinkCongrats =>
      'Precision reflection! You\'ve successfully powered the entire grid.';

  @override
  String get crossSectionSliceTitle => 'Cross-Section Slice';

  @override
  String get crossSectionSliceSubtitle =>
      'Identify the correct 2D cross-section of a 3D object from a specific angle.';

  @override
  String get crossSectionSliceCongrats =>
      'Incredible 3D visualization! You saw right through that shape.';

  @override
  String get shadowPivotTitle => 'Shadow Pivot';

  @override
  String get shadowPivotCongrats =>
      'Dynamic spatial reasoning! You mastered the light and shadow.';

  @override
  String get shadowPivotSubtitle =>
      'Predict the shadow cast by a 3D object as it rotates on different axes.';

  @override
  String get interlockPuzzleTitle => 'Interlock Puzzle';

  @override
  String get interlockPuzzleSubtitle =>
      'Disassemble or assemble complex interlocking blocks in the correct sequence.';

  @override
  String get interlockPuzzleCongrats =>
      'Logical deconstruction! You\'ve unraveled the puzzle perfectly.';

  @override
  String get pathIntersectTitle => 'Path Intersect';

  @override
  String get pathIntersectSubtitle =>
      'Navigate multiple paths simultaneously to reach their respective targets without collision.';

  @override
  String get pathIntersectCongrats =>
      'Synchronized navigation! You\'ve reached all targets flawlessly.';

  @override
  String get negativeSpaceDetectionTitle => 'Negative Space';

  @override
  String get negativeSpaceDetectionSubtitle =>
      'Identify the shape formed by the empty space between objects.';

  @override
  String get negativeSpaceDetectionCongrats =>
      'Keen perception! You\'ve mastered the art of seeing what\'s not there.';

  @override
  String get compassMazeTitle => 'Compass Maze';

  @override
  String get compassMazeSubtitle =>
      'Navigate a maze where movement directions change based on your compass orientation.';

  @override
  String get compassMazeCongrats =>
      'Expert navigation! You\'ve found the exit through the shifting directions.';

  @override
  String get complexFoldingNetsTitle => 'Folding Nets';

  @override
  String get complexFoldingNetsSubtitle =>
      'Determine which complex 3D shape will be formed by folding a non-standard 2D net.';

  @override
  String get complexFoldingNetsCongrats =>
      'Advanced folding logic! You\'ve successfully visualized the 3D form.';

  @override
  String get compassMazeMessage => 'Navigate the maze using the compass.';

  @override
  String get negativeSpaceDetectionMessage =>
      'Identify the hidden object in the space.';
}
