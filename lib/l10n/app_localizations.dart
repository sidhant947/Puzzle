import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Puzzle Hub'**
  String get appTitle;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @playAgain.
  ///
  /// In en, this message translates to:
  /// **'Play Again'**
  String get playAgain;

  /// No description provided for @seeCompleted.
  ///
  /// In en, this message translates to:
  /// **'See Completed'**
  String get seeCompleted;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @congrats.
  ///
  /// In en, this message translates to:
  /// **'Congrats'**
  String get congrats;

  /// No description provided for @perfectGradient.
  ///
  /// In en, this message translates to:
  /// **'Perfect Gradient!'**
  String get perfectGradient;

  /// No description provided for @wellDone.
  ///
  /// In en, this message translates to:
  /// **'Well Done'**
  String get wellDone;

  /// No description provided for @timeUp.
  ///
  /// In en, this message translates to:
  /// **'Time\'s Up!'**
  String get timeUp;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed!'**
  String get completed;

  /// No description provided for @score.
  ///
  /// In en, this message translates to:
  /// **'Score'**
  String get score;

  /// No description provided for @timeLeft.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get timeLeft;

  /// No description provided for @trials.
  ///
  /// In en, this message translates to:
  /// **'Trials'**
  String get trials;

  /// No description provided for @numberRule.
  ///
  /// In en, this message translates to:
  /// **'Number Rule'**
  String get numberRule;

  /// No description provided for @colorRule.
  ///
  /// In en, this message translates to:
  /// **'Color Rule'**
  String get colorRule;

  /// No description provided for @valid.
  ///
  /// In en, this message translates to:
  /// **'Valid'**
  String get valid;

  /// No description provided for @invalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid'**
  String get invalid;

  /// No description provided for @even.
  ///
  /// In en, this message translates to:
  /// **'Even'**
  String get even;

  /// No description provided for @odd.
  ///
  /// In en, this message translates to:
  /// **'Odd'**
  String get odd;

  /// No description provided for @red.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get red;

  /// No description provided for @green.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get green;

  /// No description provided for @target.
  ///
  /// In en, this message translates to:
  /// **'Target'**
  String get target;

  /// No description provided for @moves.
  ///
  /// In en, this message translates to:
  /// **'Moves'**
  String get moves;

  /// No description provided for @trialMode.
  ///
  /// In en, this message translates to:
  /// **'Trial Mode'**
  String get trialMode;

  /// No description provided for @trialModeDescription.
  ///
  /// In en, this message translates to:
  /// **'Solve 20 to finish instead of 60s timer'**
  String get trialModeDescription;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @gameplay.
  ///
  /// In en, this message translates to:
  /// **'Gameplay'**
  String get gameplay;

  /// No description provided for @supportUs.
  ///
  /// In en, this message translates to:
  /// **'Support Us'**
  String get supportUs;

  /// No description provided for @systemLegal.
  ///
  /// In en, this message translates to:
  /// **'System & Legal'**
  String get systemLegal;

  /// No description provided for @games.
  ///
  /// In en, this message translates to:
  /// **'Games'**
  String get games;

  /// No description provided for @solvedToday.
  ///
  /// In en, this message translates to:
  /// **'Solved Today'**
  String get solvedToday;

  /// No description provided for @searchGames.
  ///
  /// In en, this message translates to:
  /// **'Search Games...'**
  String get searchGames;

  /// No description provided for @readyToStart.
  ///
  /// In en, this message translates to:
  /// **'READY TO START YOUR BRAIN WORKOUT?'**
  String get readyToStart;

  /// No description provided for @greatStart.
  ///
  /// In en, this message translates to:
  /// **'GREAT START! KEEP THAT MOMENTUM.'**
  String get greatStart;

  /// No description provided for @onFire.
  ///
  /// In en, this message translates to:
  /// **'ON FIRE! YOUR BRAIN IS LOVING THIS.'**
  String get onFire;

  /// No description provided for @incredible.
  ///
  /// In en, this message translates to:
  /// **'INCREDIBLE! YOU\'RE A PUZZLE MASTER.'**
  String get incredible;

  /// No description provided for @noGamesMatch.
  ///
  /// In en, this message translates to:
  /// **'NO GAMES MATCH YOUR SEARCH'**
  String get noGamesMatch;

  /// No description provided for @categoryAll.
  ///
  /// In en, this message translates to:
  /// **'ALL'**
  String get categoryAll;

  /// No description provided for @categoryAttention.
  ///
  /// In en, this message translates to:
  /// **'ATTENTION'**
  String get categoryAttention;

  /// No description provided for @categoryLogic.
  ///
  /// In en, this message translates to:
  /// **'LOGIC'**
  String get categoryLogic;

  /// No description provided for @categoryMath.
  ///
  /// In en, this message translates to:
  /// **'MATH'**
  String get categoryMath;

  /// No description provided for @categoryWord.
  ///
  /// In en, this message translates to:
  /// **'WORD'**
  String get categoryWord;

  /// No description provided for @categoryMemory.
  ///
  /// In en, this message translates to:
  /// **'MEMORY'**
  String get categoryMemory;

  /// No description provided for @categorySpatial.
  ///
  /// In en, this message translates to:
  /// **'SPATIAL'**
  String get categorySpatial;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'LIGHT'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'DARK'**
  String get themeDark;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'SYSTEM'**
  String get themeSystem;

  /// No description provided for @starOnGithub.
  ///
  /// In en, this message translates to:
  /// **'Star on GitHub'**
  String get starOnGithub;

  /// No description provided for @sponsorOnGithub.
  ///
  /// In en, this message translates to:
  /// **'Sponsor on GitHub'**
  String get sponsorOnGithub;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @licenses.
  ///
  /// In en, this message translates to:
  /// **'Licenses'**
  String get licenses;

  /// No description provided for @findWordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You have {maxTries} tries to find the hidden {wordLength}-letter word.'**
  String findWordSubtitle(int maxTries, int wordLength);

  /// No description provided for @wordFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'Word found successfully: {word}'**
  String wordFoundMessage(String word);

  /// No description provided for @gameOverMessage.
  ///
  /// In en, this message translates to:
  /// **'The word was: {word}'**
  String gameOverMessage(String word);

  /// No description provided for @gameOver.
  ///
  /// In en, this message translates to:
  /// **'Game Over'**
  String get gameOver;

  /// No description provided for @crosswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Crossword'**
  String get crosswordTitle;

  /// No description provided for @crosswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Complete the grid with the correct words based on the clues provided.'**
  String get crosswordSubtitle;

  /// No description provided for @wordSearchTitle.
  ///
  /// In en, this message translates to:
  /// **'Word Search'**
  String get wordSearchTitle;

  /// No description provided for @wordSearchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find all the hidden words in the grid. Drag to select.'**
  String get wordSearchSubtitle;

  /// No description provided for @missingVowelsTitle.
  ///
  /// In en, this message translates to:
  /// **'Missing Vowels'**
  String get missingVowelsTitle;

  /// No description provided for @missingVowelsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify the word with its vowels hidden.'**
  String get missingVowelsSubtitle;

  /// No description provided for @missingVowelsWin.
  ///
  /// In en, this message translates to:
  /// **'Vowels Restored!'**
  String get missingVowelsWin;

  /// No description provided for @missingVowelsHowToPlay.
  ///
  /// In en, this message translates to:
  /// **'A word is shown with its vowels (A, E, I, O, U) hidden. Guess the full word!'**
  String get missingVowelsHowToPlay;

  /// No description provided for @wordScrambleTitle.
  ///
  /// In en, this message translates to:
  /// **'Word Scramble'**
  String get wordScrambleTitle;

  /// No description provided for @wordScrambleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap the letters to unscramble the hidden word!'**
  String get wordScrambleSubtitle;

  /// No description provided for @wordScrambleWin.
  ///
  /// In en, this message translates to:
  /// **'Word Unraveled!'**
  String get wordScrambleWin;

  /// No description provided for @sudokuTitle.
  ///
  /// In en, this message translates to:
  /// **'Sudoku'**
  String get sudokuTitle;

  /// No description provided for @sudokuSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Complete the grid so that every row, column, and 3x3 box contains all digits 1 to 9.'**
  String get sudokuSubtitle;

  /// No description provided for @minesweeperTitle.
  ///
  /// In en, this message translates to:
  /// **'Minesweeper'**
  String get minesweeperTitle;

  /// No description provided for @minesweeperSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify all the mines without triggering them.'**
  String get minesweeperSubtitle;

  /// No description provided for @minesweeperWin.
  ///
  /// In en, this message translates to:
  /// **'Victory!'**
  String get minesweeperWin;

  /// No description provided for @game2048Title.
  ///
  /// In en, this message translates to:
  /// **'2048'**
  String get game2048Title;

  /// No description provided for @game2048Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Swipe in any direction to merge tiles and reach the 2048 tile!'**
  String get game2048Subtitle;

  /// No description provided for @nonogramTitle.
  ///
  /// In en, this message translates to:
  /// **'Nonogram'**
  String get nonogramTitle;

  /// No description provided for @nonogramSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Reveal the hidden image using logic clues.'**
  String get nonogramSubtitle;

  /// No description provided for @nonogramWin.
  ///
  /// In en, this message translates to:
  /// **'Image Revealed!'**
  String get nonogramWin;

  /// No description provided for @pathFinderTitle.
  ///
  /// In en, this message translates to:
  /// **'Path Finder'**
  String get pathFinderTitle;

  /// No description provided for @pathFinderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find the hidden path from S to E.'**
  String get pathFinderSubtitle;

  /// No description provided for @pathFinderWin.
  ///
  /// In en, this message translates to:
  /// **'Path Mastered!'**
  String get pathFinderWin;

  /// No description provided for @howToPlay.
  ///
  /// In en, this message translates to:
  /// **'How to Play'**
  String get howToPlay;

  /// No description provided for @gotIt.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get gotIt;

  /// No description provided for @akariTitle.
  ///
  /// In en, this message translates to:
  /// **'Akari'**
  String get akariTitle;

  /// No description provided for @akariSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Illuminate all white cells'**
  String get akariSubtitle;

  /// No description provided for @akariHowToPlay.
  ///
  /// In en, this message translates to:
  /// **'Place lightbulbs in white cells to illuminate the entire grid. Bulbs light up their row and column until they hit a wall. No two bulbs can shine on each other. Numbered walls show exactly how many bulbs must be placed in adjacent cells (up, down, left, right).'**
  String get akariHowToPlay;

  /// No description provided for @akariWinTitle.
  ///
  /// In en, this message translates to:
  /// **'LIGHTS UP!'**
  String get akariWinTitle;

  /// No description provided for @akariWinMessage.
  ///
  /// In en, this message translates to:
  /// **'Everything is perfectly illuminated.'**
  String get akariWinMessage;

  /// No description provided for @arithmeticChainTitle.
  ///
  /// In en, this message translates to:
  /// **'Chain Calc'**
  String get arithmeticChainTitle;

  /// No description provided for @arithmeticChainSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Calculate the running total in your head'**
  String get arithmeticChainSubtitle;

  /// No description provided for @arithmeticChainWinTitle.
  ///
  /// In en, this message translates to:
  /// **'LEVEL UP!'**
  String get arithmeticChainWinTitle;

  /// No description provided for @arithmeticChainWinMessage.
  ///
  /// In en, this message translates to:
  /// **'Your mental calculation is sharp!'**
  String get arithmeticChainWinMessage;

  /// No description provided for @arithmeticChainLoseTitle.
  ///
  /// In en, this message translates to:
  /// **'TRY AGAIN'**
  String get arithmeticChainLoseTitle;

  /// No description provided for @arithmeticChainLoseMessage.
  ///
  /// In en, this message translates to:
  /// **'The correct answer was {answer}.'**
  String arithmeticChainLoseMessage(String answer);

  /// No description provided for @arithmeticChainStart.
  ///
  /// In en, this message translates to:
  /// **'START'**
  String get arithmeticChainStart;

  /// No description provided for @arithmeticChainNext.
  ///
  /// In en, this message translates to:
  /// **'NEXT'**
  String get arithmeticChainNext;

  /// No description provided for @attentionalBlinkTitle.
  ///
  /// In en, this message translates to:
  /// **'Attentional Blink'**
  String get attentionalBlinkTitle;

  /// No description provided for @attentionalBlinkSubtitleWatch.
  ///
  /// In en, this message translates to:
  /// **'WATCH FOR THE NUMBERS'**
  String get attentionalBlinkSubtitleWatch;

  /// No description provided for @attentionalBlinkSubtitleInput.
  ///
  /// In en, this message translates to:
  /// **'ENTER THE TWO NUMBERS YOU SAW'**
  String get attentionalBlinkSubtitleInput;

  /// No description provided for @attentionalBlinkScoreMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {score} targets!'**
  String attentionalBlinkScoreMessage(int score);

  /// No description provided for @balanceScaleTitle.
  ///
  /// In en, this message translates to:
  /// **'BALANCE SCALE'**
  String get balanceScaleTitle;

  /// No description provided for @balanceScaleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Deduce the weight of the last item based on the scales.'**
  String get balanceScaleSubtitle;

  /// No description provided for @balanceScaleWinTitle.
  ///
  /// In en, this message translates to:
  /// **'BALANCED!'**
  String get balanceScaleWinTitle;

  /// No description provided for @balanceScaleWinMessage.
  ///
  /// In en, this message translates to:
  /// **'You correctly deduced the weight!'**
  String get balanceScaleWinMessage;

  /// No description provided for @balanceScaleLoseTitle.
  ///
  /// In en, this message translates to:
  /// **'UNBALANCED'**
  String get balanceScaleLoseTitle;

  /// No description provided for @balanceScaleLoseMessage.
  ///
  /// In en, this message translates to:
  /// **'Try again to find the correct balance.'**
  String get balanceScaleLoseMessage;

  /// No description provided for @balanceScaleBack.
  ///
  /// In en, this message translates to:
  /// **'BACK'**
  String get balanceScaleBack;

  /// No description provided for @balanceScaleSubmit.
  ///
  /// In en, this message translates to:
  /// **'SUBMIT'**
  String get balanceScaleSubmit;

  /// No description provided for @binaryPuzzleTitle.
  ///
  /// In en, this message translates to:
  /// **'BINARY PUZZLE'**
  String get binaryPuzzleTitle;

  /// No description provided for @binaryPuzzleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Fill with 0 and 1. Max two of the same digit adjacent. Equal 0s and 1s in each row and column.'**
  String get binaryPuzzleSubtitle;

  /// No description provided for @binaryPuzzleWinTitle.
  ///
  /// In en, this message translates to:
  /// **'WELL DONE'**
  String get binaryPuzzleWinTitle;

  /// No description provided for @binaryPuzzleWinMessage.
  ///
  /// In en, this message translates to:
  /// **'You solved the binary puzzle with perfect logic!'**
  String get binaryPuzzleWinMessage;

  /// No description provided for @blockEscapeTitle.
  ///
  /// In en, this message translates to:
  /// **'BLOCK ESCAPE'**
  String get blockEscapeTitle;

  /// No description provided for @blockEscapeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Slide the blocks to clear a path for the primary block to reach the exit.'**
  String get blockEscapeSubtitle;

  /// No description provided for @blockEscapeWinTitle.
  ///
  /// In en, this message translates to:
  /// **'ESCAPE!'**
  String get blockEscapeWinTitle;

  /// No description provided for @blockEscapeWinMessage.
  ///
  /// In en, this message translates to:
  /// **'You successfully cleared the path for the primary block!'**
  String get blockEscapeWinMessage;

  /// No description provided for @boxCompletionTitle.
  ///
  /// In en, this message translates to:
  /// **'Box Completion'**
  String get boxCompletionTitle;

  /// No description provided for @boxCompletionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Which cube can be formed?'**
  String get boxCompletionSubtitle;

  /// No description provided for @boxCompletionScoreMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {score} correct out of {totalTrials}!'**
  String boxCompletionScoreMessage(int score, int totalTrials);

  /// No description provided for @boxCompletionOptions.
  ///
  /// In en, this message translates to:
  /// **'OPTIONS'**
  String get boxCompletionOptions;

  /// No description provided for @bridgesTitle.
  ///
  /// In en, this message translates to:
  /// **'BRIDGES'**
  String get bridgesTitle;

  /// No description provided for @bridgesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Connect islands with bridges. Each island needs a specific number of bridges. Bridges cannot cross.'**
  String get bridgesSubtitle;

  /// No description provided for @bridgesWinTitle.
  ///
  /// In en, this message translates to:
  /// **'CONNECTED!'**
  String get bridgesWinTitle;

  /// No description provided for @bridgesWinMessage.
  ///
  /// In en, this message translates to:
  /// **'You successfully connected all the islands!'**
  String get bridgesWinMessage;

  /// No description provided for @calculationSprintTitle.
  ///
  /// In en, this message translates to:
  /// **'CALCULATION SPRINT'**
  String get calculationSprintTitle;

  /// No description provided for @calculationSprintSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Solve as many equations as possible in 60 seconds.'**
  String get calculationSprintSubtitle;

  /// No description provided for @calculationSprintGoalReached.
  ///
  /// In en, this message translates to:
  /// **'GOAL REACHED!'**
  String get calculationSprintGoalReached;

  /// No description provided for @calculationSprintTimeUp.
  ///
  /// In en, this message translates to:
  /// **'TIME IS UP'**
  String get calculationSprintTimeUp;

  /// No description provided for @calculationSprintScoreMessage.
  ///
  /// In en, this message translates to:
  /// **'Excellent calculation speed! You scored {score} points.'**
  String calculationSprintScoreMessage(int score);

  /// No description provided for @calculationSprintTryAgainMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {score} points. Try to beat your best!'**
  String calculationSprintTryAgainMessage(int score);

  /// No description provided for @calculationSprintBest.
  ///
  /// In en, this message translates to:
  /// **'BEST'**
  String get calculationSprintBest;

  /// No description provided for @calculationSprintSeconds.
  ///
  /// In en, this message translates to:
  /// **'60 SECONDS'**
  String get calculationSprintSeconds;

  /// No description provided for @calculationSprintDescription.
  ///
  /// In en, this message translates to:
  /// **'Solve equations quickly.\nWrong answers deduct 3 seconds!'**
  String get calculationSprintDescription;

  /// No description provided for @calculationSprintStart.
  ///
  /// In en, this message translates to:
  /// **'START SPRINT'**
  String get calculationSprintStart;

  /// No description provided for @categoryFluencyTitle.
  ///
  /// In en, this message translates to:
  /// **'Category Fluency'**
  String get categoryFluencyTitle;

  /// No description provided for @categoryFluencySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter items belonging to the category'**
  String get categoryFluencySubtitle;

  /// No description provided for @categoryFluencyExpert.
  ///
  /// In en, this message translates to:
  /// **'FLUENCY EXPERT!'**
  String get categoryFluencyExpert;

  /// No description provided for @categoryFluencyTimeUp.
  ///
  /// In en, this message translates to:
  /// **'TIME UP!'**
  String get categoryFluencyTimeUp;

  /// No description provided for @categoryFluencyWinMessage.
  ///
  /// In en, this message translates to:
  /// **'You have a vast vocabulary!'**
  String get categoryFluencyWinMessage;

  /// No description provided for @categoryFluencyFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'You found {count} words.'**
  String categoryFluencyFoundMessage(int count);

  /// No description provided for @categoryFluencyCategoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Category:'**
  String get categoryFluencyCategoryLabel;

  /// No description provided for @categoryFluencyEnterItem.
  ///
  /// In en, this message translates to:
  /// **'Enter an item...'**
  String get categoryFluencyEnterItem;

  /// No description provided for @categoryFluencyWordCount.
  ///
  /// In en, this message translates to:
  /// **'{entered} / {target} words'**
  String categoryFluencyWordCount(int entered, int target);

  /// No description provided for @changeBlindnessTitle.
  ///
  /// In en, this message translates to:
  /// **'Change Blindness'**
  String get changeBlindnessTitle;

  /// No description provided for @changeBlindnessSubtitle.
  ///
  /// In en, this message translates to:
  /// **'SPOT THE CHANGING ITEM'**
  String get changeBlindnessSubtitle;

  /// No description provided for @changeBlindnessScore.
  ///
  /// In en, this message translates to:
  /// **'SCORE: {score}'**
  String changeBlindnessScore(int score);

  /// No description provided for @changeBlindnessFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'You found {score} changes!'**
  String changeBlindnessFoundMessage(int score);

  /// No description provided for @choiceRtTitle.
  ///
  /// In en, this message translates to:
  /// **'Choice RT'**
  String get choiceRtTitle;

  /// No description provided for @choiceRtSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap the active square as fast as you can'**
  String get choiceRtSubtitle;

  /// No description provided for @choiceRtAvgMessage.
  ///
  /// In en, this message translates to:
  /// **'Your average reaction time: {avg}ms'**
  String choiceRtAvgMessage(String avg);

  /// No description provided for @choiceRtTimeRemaining.
  ///
  /// In en, this message translates to:
  /// **'Time Remaining: {time}s'**
  String choiceRtTimeRemaining(int time);

  /// No description provided for @choiceRtTaps.
  ///
  /// In en, this message translates to:
  /// **'Taps: {count}'**
  String choiceRtTaps(int count);

  /// No description provided for @colorFloodTitle.
  ///
  /// In en, this message translates to:
  /// **'Color Flood'**
  String get colorFloodTitle;

  /// No description provided for @colorFloodSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Moves: {moves} / {maxMoves}'**
  String colorFloodSubtitle(int moves, int maxMoves);

  /// No description provided for @colorFloodSuccess.
  ///
  /// In en, this message translates to:
  /// **'FLOOD SUCCESS!'**
  String get colorFloodSuccess;

  /// No description provided for @colorFloodDryLand.
  ///
  /// In en, this message translates to:
  /// **'DRY LAND...'**
  String get colorFloodDryLand;

  /// No description provided for @colorFloodWinMessage.
  ///
  /// In en, this message translates to:
  /// **'You saturated the entire grid with color!'**
  String get colorFloodWinMessage;

  /// No description provided for @colorFloodLoseMessage.
  ///
  /// In en, this message translates to:
  /// **'You ran out of moves. Try again!'**
  String get colorFloodLoseMessage;

  /// No description provided for @colorMatchTitle.
  ///
  /// In en, this message translates to:
  /// **'COLOR MATCH'**
  String get colorMatchTitle;

  /// No description provided for @colorMatchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Adjust the sliders to match the target color as closely as possible.'**
  String get colorMatchSubtitle;

  /// No description provided for @colorMatchTarget.
  ///
  /// In en, this message translates to:
  /// **'TARGET'**
  String get colorMatchTarget;

  /// No description provided for @colorMatchYours.
  ///
  /// In en, this message translates to:
  /// **'YOURS'**
  String get colorMatchYours;

  /// No description provided for @colorMatchCheck.
  ///
  /// In en, this message translates to:
  /// **'CHECK MATCH'**
  String get colorMatchCheck;

  /// No description provided for @colorMatchResult.
  ///
  /// In en, this message translates to:
  /// **'MATCH RESULT'**
  String get colorMatchResult;

  /// No description provided for @colorMatchAccuracy.
  ///
  /// In en, this message translates to:
  /// **'Your accuracy: {accuracy}%'**
  String colorMatchAccuracy(String accuracy);

  /// No description provided for @corsiBlocksTitle.
  ///
  /// In en, this message translates to:
  /// **'CORSI BLOCKS'**
  String get corsiBlocksTitle;

  /// No description provided for @corsiBlocksSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Watch the blocks light up and tap them in the same order.'**
  String get corsiBlocksSubtitle;

  /// No description provided for @corsiBlocksWinTitle.
  ///
  /// In en, this message translates to:
  /// **'SPATIAL MASTER!'**
  String get corsiBlocksWinTitle;

  /// No description provided for @corsiBlocksLoseTitle.
  ///
  /// In en, this message translates to:
  /// **'LOST IN SPACE'**
  String get corsiBlocksLoseTitle;

  /// No description provided for @corsiBlocksMessage.
  ///
  /// In en, this message translates to:
  /// **'You recalled {score} sequences! Your spatial memory span reached {span}.'**
  String corsiBlocksMessage(int score, int span);

  /// No description provided for @corsiBlocksWatch.
  ///
  /// In en, this message translates to:
  /// **'WATCH THE PATTERN'**
  String get corsiBlocksWatch;

  /// No description provided for @corsiBlocksRepeat.
  ///
  /// In en, this message translates to:
  /// **'REPEAT THE PATTERN'**
  String get corsiBlocksRepeat;

  /// No description provided for @corsiBlocksExcellent.
  ///
  /// In en, this message translates to:
  /// **'EXCELLENT!'**
  String get corsiBlocksExcellent;

  /// No description provided for @corsiBlocksSpan.
  ///
  /// In en, this message translates to:
  /// **'SPAN'**
  String get corsiBlocksSpan;

  /// No description provided for @crownTitle.
  ///
  /// In en, this message translates to:
  /// **'CROWN'**
  String get crownTitle;

  /// No description provided for @crownSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Place one crown in each row, column, and color region. Crowns cannot be adjacent, even diagonally.'**
  String get crownSubtitle;

  /// No description provided for @crownCrowned.
  ///
  /// In en, this message translates to:
  /// **'CROWNED!'**
  String get crownCrowned;

  /// No description provided for @crownSuccess.
  ///
  /// In en, this message translates to:
  /// **'All crowns placed successfully with perfect logic.'**
  String get crownSuccess;

  /// No description provided for @cryptogramTitle.
  ///
  /// In en, this message translates to:
  /// **'CRYPTOGRAM'**
  String get cryptogramTitle;

  /// No description provided for @cryptogramSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Assign letters to decode the secret message! Each encoded letter represents a real letter.'**
  String get cryptogramSubtitle;

  /// No description provided for @cryptogramBroken.
  ///
  /// In en, this message translates to:
  /// **'CODE BROKEN!'**
  String get cryptogramBroken;

  /// No description provided for @cryptogramEncrypted.
  ///
  /// In en, this message translates to:
  /// **'ENCRYPTED'**
  String get cryptogramEncrypted;

  /// No description provided for @cryptogramSuccess.
  ///
  /// In en, this message translates to:
  /// **'You decoded the message perfectly.'**
  String get cryptogramSuccess;

  /// No description provided for @cryptogramTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again to break the encryption.'**
  String get cryptogramTryAgain;

  /// No description provided for @digitSpanReverseTitle.
  ///
  /// In en, this message translates to:
  /// **'Reverse Span'**
  String get digitSpanReverseTitle;

  /// No description provided for @digitSpanReverseSubtitleMemorize.
  ///
  /// In en, this message translates to:
  /// **'Memorize the digits'**
  String get digitSpanReverseSubtitleMemorize;

  /// No description provided for @digitSpanReverseSubtitleEnter.
  ///
  /// In en, this message translates to:
  /// **'Enter digits in REVERSE order'**
  String get digitSpanReverseSubtitleEnter;

  /// No description provided for @digitSpanReverseWinTitle.
  ///
  /// In en, this message translates to:
  /// **'LEVEL UP!'**
  String get digitSpanReverseWinTitle;

  /// No description provided for @digitSpanReverseWinMessage.
  ///
  /// In en, this message translates to:
  /// **'Your working memory is impressive!'**
  String get digitSpanReverseWinMessage;

  /// No description provided for @digitSpanReverseLoseTitle.
  ///
  /// In en, this message translates to:
  /// **'TRY AGAIN'**
  String get digitSpanReverseLoseTitle;

  /// No description provided for @digitSpanReverseLoseMessage.
  ///
  /// In en, this message translates to:
  /// **'The correct reverse sequence was {sequence}.'**
  String digitSpanReverseLoseMessage(String sequence);

  /// No description provided for @dividedAttentionTitle.
  ///
  /// In en, this message translates to:
  /// **'Divided Attention'**
  String get dividedAttentionTitle;

  /// No description provided for @dividedAttentionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap LEFT for STAR ⭐ | Tap RIGHT for RED 🔴'**
  String get dividedAttentionSubtitle;

  /// No description provided for @dividedAttentionGameOverTitle.
  ///
  /// In en, this message translates to:
  /// **'FOCUS BROKEN'**
  String get dividedAttentionGameOverTitle;

  /// No description provided for @dividedAttentionGameOverMessage.
  ///
  /// In en, this message translates to:
  /// **'Multitasking is hard! Your score was {score}.'**
  String dividedAttentionGameOverMessage(int score);

  /// No description provided for @dividedAttentionScore.
  ///
  /// In en, this message translates to:
  /// **'SCORE: {score}'**
  String dividedAttentionScore(int score);

  /// No description provided for @doubleNBackTitle.
  ///
  /// In en, this message translates to:
  /// **'Double N-Back'**
  String get doubleNBackTitle;

  /// No description provided for @doubleNBackSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Match stimuli {n} steps back'**
  String doubleNBackSubtitle(int n);

  /// No description provided for @doubleNBackGameOverTitle.
  ///
  /// In en, this message translates to:
  /// **'GAME OVER'**
  String get doubleNBackGameOverTitle;

  /// No description provided for @doubleNBackGameOverMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {score} points in Double N-Back!'**
  String doubleNBackGameOverMessage(int score);

  /// No description provided for @doubleNBackScore.
  ///
  /// In en, this message translates to:
  /// **'Score: {score}'**
  String doubleNBackScore(int score);

  /// No description provided for @doubleNBackPositionMatch.
  ///
  /// In en, this message translates to:
  /// **'POSITION MATCH'**
  String get doubleNBackPositionMatch;

  /// No description provided for @doubleNBackLetterMatch.
  ///
  /// In en, this message translates to:
  /// **'LETTER MATCH'**
  String get doubleNBackLetterMatch;

  /// No description provided for @faceNameAssociationTitle.
  ///
  /// In en, this message translates to:
  /// **'Face-Name'**
  String get faceNameAssociationTitle;

  /// No description provided for @faceNameAssociationSubtitleStudy.
  ///
  /// In en, this message translates to:
  /// **'Memorize the name for each face'**
  String get faceNameAssociationSubtitleStudy;

  /// No description provided for @faceNameAssociationSubtitleTest.
  ///
  /// In en, this message translates to:
  /// **'Who is this?'**
  String get faceNameAssociationSubtitleTest;

  /// No description provided for @faceNameAssociationPerfect.
  ///
  /// In en, this message translates to:
  /// **'PERFECT!'**
  String get faceNameAssociationPerfect;

  /// No description provided for @faceNameAssociationGameOver.
  ///
  /// In en, this message translates to:
  /// **'GAME OVER'**
  String get faceNameAssociationGameOver;

  /// No description provided for @faceNameAssociationWinMessage.
  ///
  /// In en, this message translates to:
  /// **'You have a great memory for faces and names!'**
  String get faceNameAssociationWinMessage;

  /// No description provided for @faceNameAssociationLoseMessage.
  ///
  /// In en, this message translates to:
  /// **'You got {correct} out of {total} correct.'**
  String faceNameAssociationLoseMessage(int correct, int total);

  /// No description provided for @faceNameAssociationStartTest.
  ///
  /// In en, this message translates to:
  /// **'START TEST'**
  String get faceNameAssociationStartTest;

  /// No description provided for @flankerTestWinTitle.
  ///
  /// In en, this message translates to:
  /// **'LASER FOCUS!'**
  String get flankerTestWinTitle;

  /// No description provided for @flankerTestLoseTitle.
  ///
  /// In en, this message translates to:
  /// **'DISTRACTED'**
  String get flankerTestLoseTitle;

  /// No description provided for @flankerTestScoreMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {score} correctly!'**
  String flankerTestScoreMessage(int score);

  /// No description provided for @flankerTestTitle.
  ///
  /// In en, this message translates to:
  /// **'FLANKER TEST'**
  String get flankerTestTitle;

  /// No description provided for @flankerTestSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Indicate the direction of the center arrow, ignoring the flanking arrows.'**
  String get flankerTestSubtitle;

  /// No description provided for @flankerTestLeft.
  ///
  /// In en, this message translates to:
  /// **'LEFT'**
  String get flankerTestLeft;

  /// No description provided for @flankerTestRight.
  ///
  /// In en, this message translates to:
  /// **'RIGHT'**
  String get flankerTestRight;

  /// No description provided for @fractionMatchTitle.
  ///
  /// In en, this message translates to:
  /// **'Fraction Match'**
  String get fractionMatchTitle;

  /// No description provided for @fractionMatchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Match the visual to its fraction'**
  String get fractionMatchSubtitle;

  /// No description provided for @fractionMatchLoseTitle.
  ///
  /// In en, this message translates to:
  /// **'FRACTION MISMATCH'**
  String get fractionMatchLoseTitle;

  /// No description provided for @fractionMatchLoseMessage.
  ///
  /// In en, this message translates to:
  /// **'The correct answer was {correctAnswer}.'**
  String fractionMatchLoseMessage(String correctAnswer);

  /// No description provided for @goNoGoTitle.
  ///
  /// In en, this message translates to:
  /// **'Go / No-Go'**
  String get goNoGoTitle;

  /// No description provided for @goNoGoSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap for Green, IGNORE Red!'**
  String get goNoGoSubtitle;

  /// No description provided for @goNoGoLoseTitle.
  ///
  /// In en, this message translates to:
  /// **'REACTION STOPPED'**
  String get goNoGoLoseTitle;

  /// No description provided for @goNoGoLoseMessage.
  ///
  /// In en, this message translates to:
  /// **'Your inhibitory control is being tested!'**
  String get goNoGoLoseMessage;

  /// No description provided for @goNoGoTapAnywhere.
  ///
  /// In en, this message translates to:
  /// **'TAP ANYWHERE TO GO'**
  String get goNoGoTapAnywhere;

  /// No description provided for @groceryListTitle.
  ///
  /// In en, this message translates to:
  /// **'Grocery List'**
  String get groceryListTitle;

  /// No description provided for @groceryListSubtitleMemorize.
  ///
  /// In en, this message translates to:
  /// **'Memorize the items and their categories'**
  String get groceryListSubtitleMemorize;

  /// No description provided for @groceryListSubtitleTest.
  ///
  /// In en, this message translates to:
  /// **'Which category did this item belong to?'**
  String get groceryListSubtitleTest;

  /// No description provided for @groceryListWinTitle.
  ///
  /// In en, this message translates to:
  /// **'GROCERY GURU!'**
  String get groceryListWinTitle;

  /// No description provided for @groceryListLoseTitle.
  ///
  /// In en, this message translates to:
  /// **'FORGOT SOMETHING?'**
  String get groceryListLoseTitle;

  /// No description provided for @groceryListScoreMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {score} points in Grocery List!'**
  String groceryListScoreMessage(int score);

  /// No description provided for @groceryListReady.
  ///
  /// In en, this message translates to:
  /// **'I\'M READY'**
  String get groceryListReady;

  /// No description provided for @groceryListWhereBelong.
  ///
  /// In en, this message translates to:
  /// **'WHERE DOES THIS BELONG?'**
  String get groceryListWhereBelong;

  /// No description provided for @hueSortTitle.
  ///
  /// In en, this message translates to:
  /// **'HUE SORT'**
  String get hueSortTitle;

  /// No description provided for @hueSortSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Swap tiles to create a smooth transition between corner colors. Dots indicate fixed tiles.'**
  String get hueSortSubtitle;

  /// No description provided for @hueSortWinTitle.
  ///
  /// In en, this message translates to:
  /// **'PERFECT GRADIENT!'**
  String get hueSortWinTitle;

  /// No description provided for @hueSortWinMessage.
  ///
  /// In en, this message translates to:
  /// **'You perfectly sorted the color spectrum!'**
  String get hueSortWinMessage;

  /// No description provided for @kenkenTitle.
  ///
  /// In en, this message translates to:
  /// **'KenKen'**
  String get kenkenTitle;

  /// No description provided for @kenkenWinTitle.
  ///
  /// In en, this message translates to:
  /// **'GENIUS!'**
  String get kenkenWinTitle;

  /// No description provided for @kenkenLoseTitle.
  ///
  /// In en, this message translates to:
  /// **'GAME OVER'**
  String get kenkenLoseTitle;

  /// No description provided for @kenkenWinMessage.
  ///
  /// In en, this message translates to:
  /// **'You solved the KenKen puzzle!'**
  String get kenkenWinMessage;

  /// No description provided for @kenkenLoseMessage.
  ///
  /// In en, this message translates to:
  /// **'Check the row/column and cage rules.'**
  String get kenkenLoseMessage;

  /// No description provided for @kenkenSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Fill 1-{size} without repeating in rows/cols'**
  String kenkenSubtitle(int size);

  /// No description provided for @letterCancellationTitle.
  ///
  /// In en, this message translates to:
  /// **'Letter Cancel'**
  String get letterCancellationTitle;

  /// No description provided for @letterCancellationTitleFull.
  ///
  /// In en, this message translates to:
  /// **'Letter Cancellation'**
  String get letterCancellationTitleFull;

  /// No description provided for @letterCancellationScoreMessage.
  ///
  /// In en, this message translates to:
  /// **'You found {score} letters!'**
  String letterCancellationScoreMessage(int score);

  /// No description provided for @letterCancellationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find all \"{target}\" letters'**
  String letterCancellationSubtitle(String target);

  /// No description provided for @letterCancellationFound.
  ///
  /// In en, this message translates to:
  /// **'FOUND'**
  String get letterCancellationFound;

  /// No description provided for @letterCancellationTime.
  ///
  /// In en, this message translates to:
  /// **'TIME'**
  String get letterCancellationTime;

  /// No description provided for @lightsOutTitle.
  ///
  /// In en, this message translates to:
  /// **'LIGHTS OUT'**
  String get lightsOutTitle;

  /// No description provided for @lightsOutSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tapping a tile toggles it and its adjacent neighbors. Turn off all lights to solve.'**
  String get lightsOutSubtitle;

  /// No description provided for @lightsOutWinTitle.
  ///
  /// In en, this message translates to:
  /// **'PUZZLE SOLVED!'**
  String get lightsOutWinTitle;

  /// No description provided for @lightsOutWinMessage.
  ///
  /// In en, this message translates to:
  /// **'You successfully turned off all the lights!'**
  String get lightsOutWinMessage;

  /// No description provided for @symmetryTitle.
  ///
  /// In en, this message translates to:
  /// **'Symmetry'**
  String get symmetryTitle;

  /// No description provided for @symmetrySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Mirror the pattern on the left onto the empty grid on the right.'**
  String get symmetrySubtitle;

  /// No description provided for @semanticLinkTitle.
  ///
  /// In en, this message translates to:
  /// **'Time\\'**
  String get semanticLinkTitle;

  /// No description provided for @semanticLinkSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find the word that connects all three'**
  String get semanticLinkSubtitle;

  /// No description provided for @reflexTapTitle.
  ///
  /// In en, this message translates to:
  /// **'Reflex Tap'**
  String get reflexTapTitle;

  /// No description provided for @visualStatisticalLearningTitle.
  ///
  /// In en, this message translates to:
  /// **'Game Over'**
  String get visualStatisticalLearningTitle;

  /// No description provided for @orbitTapTitle.
  ///
  /// In en, this message translates to:
  /// **'Orbit Tap'**
  String get orbitTapTitle;

  /// No description provided for @orbitTapSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap when balls align with the gate'**
  String get orbitTapSubtitle;

  /// No description provided for @schulteTableTitle.
  ///
  /// In en, this message translates to:
  /// **'Great Focus!'**
  String get schulteTableTitle;

  /// No description provided for @multipleObjectTrackingTitle.
  ///
  /// In en, this message translates to:
  /// **'Object Tracker'**
  String get multipleObjectTrackingTitle;

  /// No description provided for @multipleObjectTrackingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Watch the highlighted objects. Track them as they move, then select them.'**
  String get multipleObjectTrackingSubtitle;

  /// No description provided for @sdmtTitle.
  ///
  /// In en, this message translates to:
  /// **'Sdmt Test'**
  String get sdmtTitle;

  /// No description provided for @sdmtSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Use the key above to find the digit for the symbol shown.'**
  String get sdmtSubtitle;

  /// No description provided for @memoryMatrixTitle.
  ///
  /// In en, this message translates to:
  /// **'Goal Reached!'**
  String get memoryMatrixTitle;

  /// No description provided for @memoryMatrixSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Memorize the pattern and tap the tiles.'**
  String get memoryMatrixSubtitle;

  /// No description provided for @mentalAbacusTitle.
  ///
  /// In en, this message translates to:
  /// **'Abacus Master!'**
  String get mentalAbacusTitle;

  /// No description provided for @mentalAbacusSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Solve using the Soroban'**
  String get mentalAbacusSubtitle;

  /// No description provided for @spellingSprintTitle.
  ///
  /// In en, this message translates to:
  /// **'Spelling Sprint'**
  String get spellingSprintTitle;

  /// No description provided for @spellingSprintSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Race against the clock to spell as many words as you can.'**
  String get spellingSprintSubtitle;

  /// No description provided for @stopSignalTitle.
  ///
  /// In en, this message translates to:
  /// **'Stop Signal'**
  String get stopSignalTitle;

  /// No description provided for @stopSignalSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap the arrow direction, but STOP immediately if the arrow turns RED.'**
  String get stopSignalSubtitle;

  /// No description provided for @staircaseMemoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Staircase Memory'**
  String get staircaseMemoryTitle;

  /// No description provided for @vigilanceTaskTitle.
  ///
  /// In en, this message translates to:
  /// **'Vigilance Task'**
  String get vigilanceTaskTitle;

  /// No description provided for @vigilanceTaskSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap the button when the hand skips a position'**
  String get vigilanceTaskSubtitle;

  /// No description provided for @logicalSyllogismsTitle.
  ///
  /// In en, this message translates to:
  /// **'Logical Syllogisms'**
  String get logicalSyllogismsTitle;

  /// No description provided for @logicalSyllogismsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Is the conclusion logically valid?'**
  String get logicalSyllogismsSubtitle;

  /// No description provided for @mathPathTitle.
  ///
  /// In en, this message translates to:
  /// **'Math Path'**
  String get mathPathTitle;

  /// No description provided for @mathPathSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find a path that adds up exactly to the target sum.'**
  String get mathPathSubtitle;

  /// No description provided for @sternbergTaskTitle.
  ///
  /// In en, this message translates to:
  /// **'Game Over'**
  String get sternbergTaskTitle;

  /// No description provided for @verbalAnalogiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Analogy Master!'**
  String get verbalAnalogiesTitle;

  /// No description provided for @verbalAnalogiesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Complete the relationship'**
  String get verbalAnalogiesSubtitle;

  /// No description provided for @typingSpeedTitle.
  ///
  /// In en, this message translates to:
  /// **'Typing Speed'**
  String get typingSpeedTitle;

  /// No description provided for @typingSpeedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Type the phrase exactly as shown as fast as you can!'**
  String get typingSpeedSubtitle;

  /// No description provided for @wordLadderTitle.
  ///
  /// In en, this message translates to:
  /// **'Word Ladder'**
  String get wordLadderTitle;

  /// No description provided for @wordLadderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Connect the words by changing one letter at a time.'**
  String get wordLadderSubtitle;

  /// No description provided for @tangleFixTitle.
  ///
  /// In en, this message translates to:
  /// **'Untangled!'**
  String get tangleFixTitle;

  /// No description provided for @tangleFixSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Untangle the lines so none intersect'**
  String get tangleFixSubtitle;

  /// No description provided for @oddRotationTitle.
  ///
  /// In en, this message translates to:
  /// **'Odd Rotation'**
  String get oddRotationTitle;

  /// No description provided for @oddRotationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'One of these is mirrored. Can you find it?'**
  String get oddRotationSubtitle;

  /// No description provided for @towerOfLondonTitle.
  ///
  /// In en, this message translates to:
  /// **'Tower of London'**
  String get towerOfLondonTitle;

  /// No description provided for @towerOfLondonSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Match the target configuration'**
  String get towerOfLondonSubtitle;

  /// No description provided for @symbolicFlankerTitle.
  ///
  /// In en, this message translates to:
  /// **'Time\\'**
  String get symbolicFlankerTitle;

  /// No description provided for @symbolicFlankerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Focus on the center symbol'**
  String get symbolicFlankerSubtitle;

  /// No description provided for @stroopTestTitle.
  ///
  /// In en, this message translates to:
  /// **'Stroop Test'**
  String get stroopTestTitle;

  /// No description provided for @stroopTestSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify the ink color of the word shown. Ignore what the word actually says!'**
  String get stroopTestSubtitle;

  /// No description provided for @wisconsinCardSortingTitle.
  ///
  /// In en, this message translates to:
  /// **'Game Over'**
  String get wisconsinCardSortingTitle;

  /// No description provided for @wisconsinCardSortingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'MATCH THE CARD TO ONE OF THE FOUR ABOVE'**
  String get wisconsinCardSortingSubtitle;

  /// No description provided for @nBackTitle.
  ///
  /// In en, this message translates to:
  /// **'N-Back Test'**
  String get nBackTitle;

  /// No description provided for @nBackSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap MATCH if the current letter matches the one shown 2 steps ago.'**
  String get nBackSubtitle;

  /// No description provided for @rhythmMasterTitle.
  ///
  /// In en, this message translates to:
  /// **'Rhythm Master'**
  String get rhythmMasterTitle;

  /// No description provided for @rhythmMasterSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap in sync with the pulse'**
  String get rhythmMasterSubtitle;

  /// No description provided for @pixelMimicTitle.
  ///
  /// In en, this message translates to:
  /// **'Pixel Mimic'**
  String get pixelMimicTitle;

  /// No description provided for @targetNumberTitle.
  ///
  /// In en, this message translates to:
  /// **'Target 24'**
  String get targetNumberTitle;

  /// No description provided for @targetNumberSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Use all 4 numbers to reach {target}'**
  String targetNumberSubtitle(Object target);

  /// No description provided for @mirrorTracingTitle.
  ///
  /// In en, this message translates to:
  /// **'Traced To Perfection!'**
  String get mirrorTracingTitle;

  /// No description provided for @mirrorTracingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Trace the star! Controls are MIRRORED.'**
  String get mirrorTracingSubtitle;

  /// No description provided for @wordSurgeTitle.
  ///
  /// In en, this message translates to:
  /// **'Word Surge'**
  String get wordSurgeTitle;

  /// No description provided for @wordSurgeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Synonyms & Antonyms'**
  String get wordSurgeSubtitle;

  /// No description provided for @perspectiveTakingTitle.
  ///
  /// In en, this message translates to:
  /// **'Great Perspective!'**
  String get perspectiveTakingTitle;

  /// No description provided for @perspectiveTakingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Which view is from the {targetDirName}?'**
  String perspectiveTakingSubtitle(String targetDirName);

  /// No description provided for @paperFoldingTitle.
  ///
  /// In en, this message translates to:
  /// **'Unfolded Perfection!'**
  String get paperFoldingTitle;

  /// No description provided for @paperFoldingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'What will it look like when unfolded?'**
  String get paperFoldingSubtitle;

  /// No description provided for @waterSortTitle.
  ///
  /// In en, this message translates to:
  /// **'Well Done!'**
  String get waterSortTitle;

  /// No description provided for @waterSortSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sort the colors so each tube contains only one color.'**
  String get waterSortSubtitle;

  /// No description provided for @numericalEstimationTitle.
  ///
  /// In en, this message translates to:
  /// **'Time\\'**
  String get numericalEstimationTitle;

  /// No description provided for @numericalEstimationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pick the closest answer fast!'**
  String get numericalEstimationSubtitle;

  /// No description provided for @lockPatternTitle.
  ///
  /// In en, this message translates to:
  /// **'Lock Pattern'**
  String get lockPatternTitle;

  /// No description provided for @lockPatternSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find the secret pattern. Every guess gives feedback on position and dots.'**
  String get lockPatternSubtitle;

  /// No description provided for @primeHunterTitle.
  ///
  /// In en, this message translates to:
  /// **'Prime Hunter'**
  String get primeHunterTitle;

  /// No description provided for @primeHunterSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Swipe LEFT for PRIME | Swipe RIGHT for COMPOSITE'**
  String get primeHunterSubtitle;

  /// No description provided for @tracePathTitle.
  ///
  /// In en, this message translates to:
  /// **'Trace Path'**
  String get tracePathTitle;

  /// No description provided for @tracePathSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Follow the target path as closely as you can'**
  String get tracePathSubtitle;

  /// No description provided for @ruleSwitcherTitle.
  ///
  /// In en, this message translates to:
  /// **'Rule Switcher'**
  String get ruleSwitcherTitle;

  /// No description provided for @ruleSwitcherSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Apply the current rule'**
  String get ruleSwitcherSubtitle;

  /// No description provided for @choiceReactionTimeTitle.
  ///
  /// In en, this message translates to:
  /// **'Time\\'**
  String get choiceReactionTimeTitle;

  /// No description provided for @pathRecallTitle.
  ///
  /// In en, this message translates to:
  /// **'Path Recall'**
  String get pathRecallTitle;

  /// No description provided for @switchTaskTitle.
  ///
  /// In en, this message translates to:
  /// **'Switch Task'**
  String get switchTaskTitle;

  /// No description provided for @switchTaskSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pay attention to the rule! It will switch between matching the shape and matching the color.'**
  String get switchTaskSubtitle;

  /// No description provided for @mentalRotationTitle.
  ///
  /// In en, this message translates to:
  /// **'Mental Rotation'**
  String get mentalRotationTitle;

  /// No description provided for @mentalRotationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Are these shapes the same, just rotated?'**
  String get mentalRotationSubtitle;

  /// No description provided for @missingOperatorTitle.
  ///
  /// In en, this message translates to:
  /// **'Operator Mix'**
  String get missingOperatorTitle;

  /// No description provided for @missingOperatorSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Fill the blanks to complete the equation'**
  String get missingOperatorSubtitle;

  /// No description provided for @wordMastermindTitle.
  ///
  /// In en, this message translates to:
  /// **'Word Mastermind'**
  String get wordMastermindTitle;

  /// No description provided for @wordMastermindSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Crack the 4-letter code! Bulls (B) are perfect spots, Cows (C) are wrong spots.'**
  String get wordMastermindSubtitle;

  /// No description provided for @simonSequenceTitle.
  ///
  /// In en, this message translates to:
  /// **'Sequence'**
  String get simonSequenceTitle;

  /// No description provided for @symbolLogicTitle.
  ///
  /// In en, this message translates to:
  /// **'Symbol Logic'**
  String get symbolLogicTitle;

  /// No description provided for @symbolLogicSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Solve the visual equations to find the value of each symbol. What is the result of the last equation?'**
  String get symbolLogicSubtitle;

  /// No description provided for @silhouetteMatchTitle.
  ///
  /// In en, this message translates to:
  /// **'Matched!'**
  String get silhouetteMatchTitle;

  /// No description provided for @silhouetteMatchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Which silhouette matches this object?'**
  String get silhouetteMatchSubtitle;

  /// No description provided for @operationSpanTitle.
  ///
  /// In en, this message translates to:
  /// **'Game Over'**
  String get operationSpanTitle;

  /// No description provided for @slidePuzzleTitle.
  ///
  /// In en, this message translates to:
  /// **'Slide Puzzle'**
  String get slidePuzzleTitle;

  /// No description provided for @visualSearchTitle.
  ///
  /// In en, this message translates to:
  /// **'Visual Search'**
  String get visualSearchTitle;

  /// No description provided for @visualSearchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find the unique symbol in the grid'**
  String get visualSearchSubtitle;

  /// No description provided for @trailMakingTitle.
  ///
  /// In en, this message translates to:
  /// **'Trail Making'**
  String get trailMakingTitle;

  /// No description provided for @trailMakingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Connect the numbers in order (1 -> 2 -> 3...) as fast as you can.'**
  String get trailMakingSubtitle;

  /// No description provided for @matrixReasoningTitle.
  ///
  /// In en, this message translates to:
  /// **'Matrix Reasoning'**
  String get matrixReasoningTitle;

  /// No description provided for @matrixReasoningSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Complete the pattern in the 3x3 grid'**
  String get matrixReasoningSubtitle;

  /// No description provided for @tentsAndTreesTitle.
  ///
  /// In en, this message translates to:
  /// **'Tents & Trees'**
  String get tentsAndTreesTitle;

  /// No description provided for @tentsAndTreesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Place tents next to trees. Numbers indicate how many tents are in each row/column. Tents cannot touch each other.'**
  String get tentsAndTreesSubtitle;

  /// No description provided for @quickMathTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick Math'**
  String get quickMathTitle;

  /// No description provided for @magicSquaresTitle.
  ///
  /// In en, this message translates to:
  /// **'Magic Square'**
  String get magicSquaresTitle;

  /// No description provided for @magicSquaresSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Every row, column and diagonal must sum to {targetSum}'**
  String magicSquaresSubtitle(Object targetSum);

  /// No description provided for @objectShuffleTitle.
  ///
  /// In en, this message translates to:
  /// **'Object Shuffle'**
  String get objectShuffleTitle;

  /// No description provided for @pipesTitle.
  ///
  /// In en, this message translates to:
  /// **'Pipes'**
  String get pipesTitle;

  /// No description provided for @pipesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Connect matching colored dots with pipes.'**
  String get pipesSubtitle;

  /// No description provided for @oddOneOutTitle.
  ///
  /// In en, this message translates to:
  /// **'Odd One Out'**
  String get oddOneOutTitle;

  /// No description provided for @oddOneOutSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find the tile with a different color.'**
  String get oddOneOutSubtitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
