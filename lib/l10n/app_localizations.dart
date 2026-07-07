import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

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
    Locale('ar'),
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fa'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('mr'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('tr'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Puzzle Games'**
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

  /// No description provided for @playNext.
  ///
  /// In en, this message translates to:
  /// **'Play Next'**
  String get playNext;

  /// No description provided for @seeCompleted.
  ///
  /// In en, this message translates to:
  /// **'Review'**
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

  /// No description provided for @victory.
  ///
  /// In en, this message translates to:
  /// **'Victory!'**
  String get victory;

  /// No description provided for @gameWin.
  ///
  /// In en, this message translates to:
  /// **'WELL DONE!'**
  String get gameWin;

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

  /// No description provided for @blue.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get blue;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @trueLabel.
  ///
  /// In en, this message translates to:
  /// **'True'**
  String get trueLabel;

  /// No description provided for @falseLabel.
  ///
  /// In en, this message translates to:
  /// **'False'**
  String get falseLabel;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @north.
  ///
  /// In en, this message translates to:
  /// **'North'**
  String get north;

  /// No description provided for @south.
  ///
  /// In en, this message translates to:
  /// **'South'**
  String get south;

  /// No description provided for @east.
  ///
  /// In en, this message translates to:
  /// **'East'**
  String get east;

  /// No description provided for @west.
  ///
  /// In en, this message translates to:
  /// **'West'**
  String get west;

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

  /// No description provided for @radicalRootsTitle.
  ///
  /// In en, this message translates to:
  /// **'Radical Roots'**
  String get radicalRootsTitle;

  /// No description provided for @radicalRootsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find the square or cube root of the given number. Round to the nearest integer if necessary.'**
  String get radicalRootsSubtitle;

  /// No description provided for @radicalRootsGoalReached.
  ///
  /// In en, this message translates to:
  /// **'Goal Reached!'**
  String get radicalRootsGoalReached;

  /// No description provided for @radicalRootsTimeUp.
  ///
  /// In en, this message translates to:
  /// **'Time\'s Up!'**
  String get radicalRootsTimeUp;

  /// No description provided for @radicalRootsScoreMessage.
  ///
  /// In en, this message translates to:
  /// **'You calculated {score} roots correctly!'**
  String radicalRootsScoreMessage(int score);

  /// No description provided for @radicalRootsTryAgainMessage.
  ///
  /// In en, this message translates to:
  /// **'Keep practicing! You calculated {score} roots.'**
  String radicalRootsTryAgainMessage(int score);

  /// No description provided for @radicalRootsStart.
  ///
  /// In en, this message translates to:
  /// **'Start Calculating'**
  String get radicalRootsStart;

  /// No description provided for @radicalRootsDescription.
  ///
  /// In en, this message translates to:
  /// **'You have 60 seconds to solve as many as you can.'**
  String get radicalRootsDescription;

  /// No description provided for @radicalRootsBest.
  ///
  /// In en, this message translates to:
  /// **'Best'**
  String get radicalRootsBest;

  /// No description provided for @radicalRootsSeconds.
  ///
  /// In en, this message translates to:
  /// **'60 SECONDS'**
  String get radicalRootsSeconds;

  /// No description provided for @romanArithmeticTitle.
  ///
  /// In en, this message translates to:
  /// **'Roman Arithmetic'**
  String get romanArithmeticTitle;

  /// No description provided for @romanArithmeticSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Solve addition and subtraction problems using Roman Numerals.'**
  String get romanArithmeticSubtitle;

  /// No description provided for @romanArithmeticGoalReached.
  ///
  /// In en, this message translates to:
  /// **'Centurion Level!'**
  String get romanArithmeticGoalReached;

  /// No description provided for @romanArithmeticTimeUp.
  ///
  /// In en, this message translates to:
  /// **'Time\'s Up!'**
  String get romanArithmeticTimeUp;

  /// No description provided for @romanArithmeticScoreMessage.
  ///
  /// In en, this message translates to:
  /// **'You solved {score} Roman problems!'**
  String romanArithmeticScoreMessage(int score);

  /// No description provided for @romanArithmeticTryAgainMessage.
  ///
  /// In en, this message translates to:
  /// **'Veni, Vidi, Vici! You solved {score} problems.'**
  String romanArithmeticTryAgainMessage(int score);

  /// No description provided for @romanArithmeticStart.
  ///
  /// In en, this message translates to:
  /// **'Begin Quest'**
  String get romanArithmeticStart;

  /// No description provided for @romanArithmeticDescription.
  ///
  /// In en, this message translates to:
  /// **'Convert and solve. You have 60 seconds.'**
  String get romanArithmeticDescription;

  /// No description provided for @romanArithmeticBest.
  ///
  /// In en, this message translates to:
  /// **'Best'**
  String get romanArithmeticBest;

  /// No description provided for @romanArithmeticSeconds.
  ///
  /// In en, this message translates to:
  /// **'60 SECONDS'**
  String get romanArithmeticSeconds;

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

  /// No description provided for @minesweeperMines.
  ///
  /// In en, this message translates to:
  /// **'MINES'**
  String get minesweeperMines;

  /// No description provided for @minesweeperStatus.
  ///
  /// In en, this message translates to:
  /// **'STATUS'**
  String get minesweeperStatus;

  /// No description provided for @minesweeperWon.
  ///
  /// In en, this message translates to:
  /// **'WON'**
  String get minesweeperWon;

  /// No description provided for @minesweeperBoom.
  ///
  /// In en, this message translates to:
  /// **'BOOM'**
  String get minesweeperBoom;

  /// No description provided for @minesweeperPlaying.
  ///
  /// In en, this message translates to:
  /// **'PLAYING'**
  String get minesweeperPlaying;

  /// No description provided for @minesweeperReveal.
  ///
  /// In en, this message translates to:
  /// **'REVEAL'**
  String get minesweeperReveal;

  /// No description provided for @minesweeperFlag.
  ///
  /// In en, this message translates to:
  /// **'FLAG'**
  String get minesweeperFlag;

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

  /// No description provided for @magnetsTitle.
  ///
  /// In en, this message translates to:
  /// **'MAGNETS'**
  String get magnetsTitle;

  /// No description provided for @magnetsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Place magnets in the grid based on pole counts.'**
  String get magnetsSubtitle;

  /// No description provided for @magnetsHowToPlay.
  ///
  /// In en, this message translates to:
  /// **'Fill domino-sized containers with \'+\' and \'-\' magnets or leave them blank. Row and column clues specify the total number of each pole in that line. Identical poles cannot be adjacent orthogonally.'**
  String get magnetsHowToPlay;

  /// No description provided for @magnetsWinTitle.
  ///
  /// In en, this message translates to:
  /// **'POLARITY BALANCED!'**
  String get magnetsWinTitle;

  /// No description provided for @magnetsWinMessage.
  ///
  /// In en, this message translates to:
  /// **'All magnets are perfectly arranged!'**
  String get magnetsWinMessage;

  /// No description provided for @lighthousesTitle.
  ///
  /// In en, this message translates to:
  /// **'LIGHTHOUSES'**
  String get lighthousesTitle;

  /// No description provided for @lighthousesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Place ships based on lighthouse clues.'**
  String get lighthousesSubtitle;

  /// No description provided for @lighthousesHowToPlay.
  ///
  /// In en, this message translates to:
  /// **'Place 1x1 ships in the grid. Lighthouses indicate the total number of ships visible horizontally and vertically. Ships cannot touch lighthouses or each other, even diagonally.'**
  String get lighthousesHowToPlay;

  /// No description provided for @lighthousesWinTitle.
  ///
  /// In en, this message translates to:
  /// **'SEA SAFE!'**
  String get lighthousesWinTitle;

  /// No description provided for @lighthousesWinMessage.
  ///
  /// In en, this message translates to:
  /// **'All lighthouses are guiding the ships perfectly!'**
  String get lighthousesWinMessage;

  /// No description provided for @dominosaTitle.
  ///
  /// In en, this message translates to:
  /// **'DOMINOSA'**
  String get dominosaTitle;

  /// No description provided for @dominosaSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find all the hidden dominoes in the grid.'**
  String get dominosaSubtitle;

  /// No description provided for @dominosaHowToPlay.
  ///
  /// In en, this message translates to:
  /// **'Arrange a complete set of dominoes on a grid of numbers such that every pair of adjacent numbers is covered by exactly one domino. Each number pair exists only once in the set.'**
  String get dominosaHowToPlay;

  /// No description provided for @dominosaWinTitle.
  ///
  /// In en, this message translates to:
  /// **'DOMINO MASTER!'**
  String get dominosaWinTitle;

  /// No description provided for @dominosaWinMessage.
  ///
  /// In en, this message translates to:
  /// **'Every domino has been found and placed!'**
  String get dominosaWinMessage;

  /// No description provided for @skyscrapersTitle.
  ///
  /// In en, this message translates to:
  /// **'SKYSCRAPERS'**
  String get skyscrapersTitle;

  /// No description provided for @skyscrapersSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Fill the grid with building heights.'**
  String get skyscrapersSubtitle;

  /// No description provided for @skyscrapersHowToPlay.
  ///
  /// In en, this message translates to:
  /// **'Fill the grid with heights (1-N) such that each row and column contains each height exactly once. Clues on the edges indicate how many buildings are visible from that direction, with taller buildings blocking shorter ones.'**
  String get skyscrapersHowToPlay;

  /// No description provided for @skyscrapersWinTitle.
  ///
  /// In en, this message translates to:
  /// **'SKYLINE RESTORED!'**
  String get skyscrapersWinTitle;

  /// No description provided for @skyscrapersWinMessage.
  ///
  /// In en, this message translates to:
  /// **'All buildings are perfectly positioned!'**
  String get skyscrapersWinMessage;

  /// No description provided for @nurikabeTitle.
  ///
  /// In en, this message translates to:
  /// **'NURIKABE'**
  String get nurikabeTitle;

  /// No description provided for @nurikabeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Form a connected sea and separate islands.'**
  String get nurikabeSubtitle;

  /// No description provided for @nurikabeHowToPlay.
  ///
  /// In en, this message translates to:
  /// **'Shade cells to form a single connected \'sea\' (no 2x2 blocks). Unshaded cells form \'islands\', each containing exactly one number that represents its total area.'**
  String get nurikabeHowToPlay;

  /// No description provided for @nurikabeWinTitle.
  ///
  /// In en, this message translates to:
  /// **'SEA FLOWING!'**
  String get nurikabeWinTitle;

  /// No description provided for @nurikabeWinMessage.
  ///
  /// In en, this message translates to:
  /// **'Islands separated, sea connected!'**
  String get nurikabeWinMessage;

  /// No description provided for @fillominoTitle.
  ///
  /// In en, this message translates to:
  /// **'FILLOMINO'**
  String get fillominoTitle;

  /// No description provided for @fillominoSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Divide the grid into polyominoes of the specified sizes.'**
  String get fillominoSubtitle;

  /// No description provided for @fillominoHowToPlay.
  ///
  /// In en, this message translates to:
  /// **'Divide the grid into polyominoes such that each polyomino of size N contains the number N in all its cells. Polyominoes of the same size cannot be orthogonally adjacent.'**
  String get fillominoHowToPlay;

  /// No description provided for @fillominoWinTitle.
  ///
  /// In en, this message translates to:
  /// **'GRID DIVIDED!'**
  String get fillominoWinTitle;

  /// No description provided for @fillominoWinMessage.
  ///
  /// In en, this message translates to:
  /// **'Perfectly tiled with logic!'**
  String get fillominoWinMessage;

  /// No description provided for @hitoriTitle.
  ///
  /// In en, this message translates to:
  /// **'HITORI'**
  String get hitoriTitle;

  /// No description provided for @hitoriSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Shade duplicate numbers in each row and column.'**
  String get hitoriSubtitle;

  /// No description provided for @hitoriHowToPlay.
  ///
  /// In en, this message translates to:
  /// **'Shade cells so that no number appears more than once in any row or column. Shaded cells cannot be adjacent (orthogonally), and all unshaded cells must form a single connected group.'**
  String get hitoriHowToPlay;

  /// No description provided for @hitoriWinTitle.
  ///
  /// In en, this message translates to:
  /// **'HITORI MASTER!'**
  String get hitoriWinTitle;

  /// No description provided for @hitoriWinMessage.
  ///
  /// In en, this message translates to:
  /// **'You\'ve successfully resolved all the duplicates!'**
  String get hitoriWinMessage;

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

  /// No description provided for @hueSortWrongTiles.
  ///
  /// In en, this message translates to:
  /// **'Tiles in wrong position: {count}'**
  String hueSortWrongTiles(int count);

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
  /// **'Semantic Link'**
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
  /// **'Visual Stats Learning'**
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
  /// **'Schulte Table'**
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
  /// **'Memory Matrix'**
  String get memoryMatrixTitle;

  /// No description provided for @memoryMatrixSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Memorize the pattern and tap the tiles.'**
  String get memoryMatrixSubtitle;

  /// No description provided for @mentalAbacusTitle.
  ///
  /// In en, this message translates to:
  /// **'Mental Abacus'**
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
  /// **'Sternberg Task'**
  String get sternbergTaskTitle;

  /// No description provided for @sternbergTaskMemorize.
  ///
  /// In en, this message translates to:
  /// **'Memorize the letters'**
  String get sternbergTaskMemorize;

  /// No description provided for @sternbergTaskWasLetterSet.
  ///
  /// In en, this message translates to:
  /// **'Was this letter in the set?'**
  String get sternbergTaskWasLetterSet;

  /// No description provided for @sternbergTaskScore.
  ///
  /// In en, this message translates to:
  /// **'You scored {score} points in Sternberg Task!'**
  String sternbergTaskScore(int score);

  /// No description provided for @verbalAnalogiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Verbal Analogies'**
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
  /// **'Tangle Fix'**
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
  /// **'Symbolic Flanker'**
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
  /// **'Wisconsin Card Sort'**
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
  String targetNumberSubtitle(int target);

  /// No description provided for @mirrorTracingTitle.
  ///
  /// In en, this message translates to:
  /// **'Mirror Tracing'**
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
  /// **'Perspective Taking'**
  String get perspectiveTakingTitle;

  /// No description provided for @perspectiveTakingTopDownView.
  ///
  /// In en, this message translates to:
  /// **'TOP-DOWN VIEW'**
  String get perspectiveTakingTopDownView;

  /// No description provided for @perspectiveTakingChoosePerspective.
  ///
  /// In en, this message translates to:
  /// **'CHOOSE THE PERSPECTIVE'**
  String get perspectiveTakingChoosePerspective;

  /// No description provided for @perspectiveTakingCongrats.
  ///
  /// In en, this message translates to:
  /// **'You have a sharp eye for spatial relationships.'**
  String get perspectiveTakingCongrats;

  /// No description provided for @perspectiveTakingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Which view is from the {targetDirName}?'**
  String perspectiveTakingSubtitle(String targetDirName);

  /// No description provided for @paperFoldingTitle.
  ///
  /// In en, this message translates to:
  /// **'Paper Folding'**
  String get paperFoldingTitle;

  /// No description provided for @paperFoldingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'What will it look like when unfolded?'**
  String get paperFoldingSubtitle;

  /// No description provided for @waterSortTitle.
  ///
  /// In en, this message translates to:
  /// **'Water Sort'**
  String get waterSortTitle;

  /// No description provided for @waterSortSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sort the colors so each tube contains only one color.'**
  String get waterSortSubtitle;

  /// No description provided for @numericalEstimationTitle.
  ///
  /// In en, this message translates to:
  /// **'Numerical Estimation'**
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
  /// **'Choice Reaction Time'**
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
  /// **'Silhouette Match'**
  String get silhouetteMatchTitle;

  /// No description provided for @silhouetteMatchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Which silhouette matches this object?'**
  String get silhouetteMatchSubtitle;

  /// No description provided for @operationSpanTitle.
  ///
  /// In en, this message translates to:
  /// **'Operation Span'**
  String get operationSpanTitle;

  /// No description provided for @operationSpanMathPhase.
  ///
  /// In en, this message translates to:
  /// **'Is the equation correct?'**
  String get operationSpanMathPhase;

  /// No description provided for @operationSpanLetterPhase.
  ///
  /// In en, this message translates to:
  /// **'Remember the letter'**
  String get operationSpanLetterPhase;

  /// No description provided for @operationSpanRecallPhase.
  ///
  /// In en, this message translates to:
  /// **'Recall the letters in order'**
  String get operationSpanRecallPhase;

  /// No description provided for @operationSpanRoundComplete.
  ///
  /// In en, this message translates to:
  /// **'Round Complete!'**
  String get operationSpanRoundComplete;

  /// No description provided for @operationSpanScore.
  ///
  /// In en, this message translates to:
  /// **'You scored {score} points in Operation Span!'**
  String operationSpanScore(int score);

  /// No description provided for @slidePuzzleTitle.
  ///
  /// In en, this message translates to:
  /// **'Slide Puzzle'**
  String get slidePuzzleTitle;

  /// No description provided for @slidePuzzleNewGame.
  ///
  /// In en, this message translates to:
  /// **'NEW GAME'**
  String get slidePuzzleNewGame;

  /// No description provided for @slidePuzzleInstructions.
  ///
  /// In en, this message translates to:
  /// **'Rearrange the tiles into numerical order by sliding them into the empty space.'**
  String get slidePuzzleInstructions;

  /// No description provided for @slidePuzzleTileSlider.
  ///
  /// In en, this message translates to:
  /// **'TILE SLIDER'**
  String get slidePuzzleTileSlider;

  /// No description provided for @slidePuzzleCongrats.
  ///
  /// In en, this message translates to:
  /// **'You have successfully ordered all the tiles.'**
  String get slidePuzzleCongrats;

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
  String magicSquaresSubtitle(int targetSum);

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

  /// No description provided for @einsteinRiddleTitle.
  ///
  /// In en, this message translates to:
  /// **'EINSTEIN RIDDLE'**
  String get einsteinRiddleTitle;

  /// No description provided for @einsteinRiddleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Use the clues to deduce the attributes of each house.'**
  String get einsteinRiddleSubtitle;

  /// No description provided for @einsteinRiddleHowToPlay.
  ///
  /// In en, this message translates to:
  /// **'Each house has unique attributes (color, nationality, pet, etc.). Use the provided clues to fill in the grid and find the complete solution.'**
  String get einsteinRiddleHowToPlay;

  /// No description provided for @einsteinRiddleColor.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get einsteinRiddleColor;

  /// No description provided for @einsteinRiddleNationality.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get einsteinRiddleNationality;

  /// No description provided for @einsteinRiddleDrink.
  ///
  /// In en, this message translates to:
  /// **'Drink'**
  String get einsteinRiddleDrink;

  /// No description provided for @einsteinRiddlePet.
  ///
  /// In en, this message translates to:
  /// **'Pet'**
  String get einsteinRiddlePet;

  /// No description provided for @einsteinRiddleSmoke.
  ///
  /// In en, this message translates to:
  /// **'Smoke'**
  String get einsteinRiddleSmoke;

  /// No description provided for @einsteinRiddleHouse.
  ///
  /// In en, this message translates to:
  /// **'House'**
  String get einsteinRiddleHouse;

  /// No description provided for @mirrorImageTitle.
  ///
  /// In en, this message translates to:
  /// **'Mirror Image'**
  String get mirrorImageTitle;

  /// No description provided for @mirrorImageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify the correct mirror reflection.'**
  String get mirrorImageSubtitle;

  /// No description provided for @mirrorImageHowToPlay.
  ///
  /// In en, this message translates to:
  /// **'Look at the shape and choose its correct mirror reflection from the options provided.'**
  String get mirrorImageHowToPlay;

  /// No description provided for @mentalMappingTitle.
  ///
  /// In en, this message translates to:
  /// **'Mental Mapping'**
  String get mentalMappingTitle;

  /// No description provided for @mentalMappingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Follow the directions and find the destination.'**
  String get mentalMappingSubtitle;

  /// No description provided for @mentalMappingHowToPlay.
  ///
  /// In en, this message translates to:
  /// **'You will be shown a sequence of directions (North, South, East, West). Mentally follow these steps starting from the center of the grid and select the final destination.'**
  String get mentalMappingHowToPlay;

  /// No description provided for @memoryPalaceTitle.
  ///
  /// In en, this message translates to:
  /// **'Memory Palace'**
  String get memoryPalaceTitle;

  /// No description provided for @memoryPalaceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Remember which word was in which location.'**
  String get memoryPalaceSubtitle;

  /// No description provided for @memoryPalaceHowToPlay.
  ///
  /// In en, this message translates to:
  /// **'A set of words will appear in different locations on a grid. Memorize their positions. Then, you will be asked to place the words back in their original locations.'**
  String get memoryPalaceHowToPlay;

  /// No description provided for @countingSheepTitle.
  ///
  /// In en, this message translates to:
  /// **'Counting Sheep'**
  String get countingSheepTitle;

  /// No description provided for @countingSheepSubtitle.
  ///
  /// In en, this message translates to:
  /// **'How many sheep did you see?'**
  String get countingSheepSubtitle;

  /// No description provided for @countingSheepHowToPlay.
  ///
  /// In en, this message translates to:
  /// **'Sheep will run across the screen quickly. Count them as they pass and enter the total number at the end.'**
  String get countingSheepHowToPlay;

  /// No description provided for @faceTraitAssociationTitle.
  ///
  /// In en, this message translates to:
  /// **'Face-Trait'**
  String get faceTraitAssociationTitle;

  /// No description provided for @faceTraitAssociationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Memorize traits for each face'**
  String get faceTraitAssociationSubtitle;

  /// No description provided for @faceTraitAssociationHowToPlay.
  ///
  /// In en, this message translates to:
  /// **'You will be shown several faces, each with a name, occupation, and hobby. Memorize these associations. Later, you will be asked to recall the specific traits for each face.'**
  String get faceTraitAssociationHowToPlay;

  /// No description provided for @mentalCalendarTitle.
  ///
  /// In en, this message translates to:
  /// **'Mental Calendar'**
  String get mentalCalendarTitle;

  /// No description provided for @mentalCalendarSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Calculate the day of the week'**
  String get mentalCalendarSubtitle;

  /// No description provided for @mentalCalendarHowToPlay.
  ///
  /// In en, this message translates to:
  /// **'A random date will be shown. Use mental calculation (or the Doomsday algorithm) to determine which day of the week it falls on.'**
  String get mentalCalendarHowToPlay;

  /// No description provided for @vocabularyBuilderTitle.
  ///
  /// In en, this message translates to:
  /// **'Vocabulary Builder'**
  String get vocabularyBuilderTitle;

  /// No description provided for @vocabularyBuilderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Match synonyms and antonyms under time pressure.'**
  String get vocabularyBuilderSubtitle;

  /// No description provided for @vocabularyBuilderHowToPlay.
  ///
  /// In en, this message translates to:
  /// **'You will be shown a target word and a relation (Synonym or Antonym). Choose the correct word from the options that matches the relation. Be quick, the clock is ticking!'**
  String get vocabularyBuilderHowToPlay;

  /// No description provided for @correct.
  ///
  /// In en, this message translates to:
  /// **'CORRECT'**
  String get correct;

  /// No description provided for @incorrect.
  ///
  /// In en, this message translates to:
  /// **'INCORRECT'**
  String get incorrect;

  /// No description provided for @grammarPoliceTitle.
  ///
  /// In en, this message translates to:
  /// **'Grammar Police'**
  String get grammarPoliceTitle;

  /// No description provided for @grammarPoliceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify if the sentence is grammatically correct or contains errors.'**
  String get grammarPoliceSubtitle;

  /// No description provided for @grammarPoliceHowToPlay.
  ///
  /// In en, this message translates to:
  /// **'A sentence will appear in the center of the screen. Decide if it is grammatically correct or if it contains an error. Tap \'CORRECT\' if it\'s fine, or \'INCORRECT\' if you spot a mistake. Don\'t lose all your lives!'**
  String get grammarPoliceHowToPlay;

  /// No description provided for @reverseStroopTitle.
  ///
  /// In en, this message translates to:
  /// **'Reverse Stroop'**
  String get reverseStroopTitle;

  /// No description provided for @reverseStroopSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A variation of the Stroop test where the focus is switched.'**
  String get reverseStroopSubtitle;

  /// No description provided for @reverseStroopHowToPlay.
  ///
  /// In en, this message translates to:
  /// **'Pay attention to the instruction! If it says \'TEXT\', match the word\'s meaning. If it says \'COLOR\', match the ink color. The rules will switch frequently to test your focus.'**
  String get reverseStroopHowToPlay;

  /// No description provided for @game2048Instruction.
  ///
  /// In en, this message translates to:
  /// **'SWIPE IN ANY DIRECTION TO MERGE'**
  String get game2048Instruction;

  /// No description provided for @fibonacciMergeTitle.
  ///
  /// In en, this message translates to:
  /// **'Fibonacci Merge'**
  String get fibonacciMergeTitle;

  /// No description provided for @fibonacciMergeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Merge consecutive Fibonacci numbers (1, 1, 2, 3, 5, 8, 13...).'**
  String get fibonacciMergeSubtitle;

  /// No description provided for @sequenceSleuthTitle.
  ///
  /// In en, this message translates to:
  /// **'Sequence Sleuth'**
  String get sequenceSleuthTitle;

  /// No description provided for @sequenceSleuthSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find the missing number in the mathematical sequence.'**
  String get sequenceSleuthSubtitle;

  /// No description provided for @divisibilityDashTitle.
  ///
  /// In en, this message translates to:
  /// **'Divisibility Dash'**
  String get divisibilityDashTitle;

  /// No description provided for @divisibilityDashSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap all single-digit divisors (2-9) for the given number.'**
  String get divisibilityDashSubtitle;

  /// No description provided for @percentagePeakTitle.
  ///
  /// In en, this message translates to:
  /// **'Percentage Peak'**
  String get percentagePeakTitle;

  /// No description provided for @percentagePeakSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Solve mental percentage calculations quickly.'**
  String get percentagePeakSubtitle;

  /// No description provided for @vennNumbersTitle.
  ///
  /// In en, this message translates to:
  /// **'Venn Numbers'**
  String get vennNumbersTitle;

  /// No description provided for @vennNumbersSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Categorize numbers into the correct Venn diagram regions.'**
  String get vennNumbersSubtitle;

  /// No description provided for @commonDenominatorTitle.
  ///
  /// In en, this message translates to:
  /// **'Common Denominator'**
  String get commonDenominatorTitle;

  /// No description provided for @commonDenominatorSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find the Greatest Common Divisor or Least Common Multiple.'**
  String get commonDenominatorSubtitle;

  /// No description provided for @angleFinderTitle.
  ///
  /// In en, this message translates to:
  /// **'Angle Finder'**
  String get angleFinderTitle;

  /// No description provided for @angleFinderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Calculate the missing angle in the geometric problem.'**
  String get angleFinderSubtitle;

  /// No description provided for @sumSnakeTitle.
  ///
  /// In en, this message translates to:
  /// **'Sum Snake'**
  String get sumSnakeTitle;

  /// No description provided for @sumSnakeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Connect adjacent numbers to reach the target sum.'**
  String get sumSnakeSubtitle;

  /// No description provided for @baseShiftTitle.
  ///
  /// In en, this message translates to:
  /// **'BASE SHIFT BLITZ'**
  String get baseShiftTitle;

  /// No description provided for @baseShiftSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Solve in decimal'**
  String get baseShiftSubtitle;

  /// No description provided for @baseShiftDescription.
  ///
  /// In en, this message translates to:
  /// **'Solve the equation and type the answer in decimal (Base 10).'**
  String get baseShiftDescription;

  /// No description provided for @baseShiftEquation.
  ///
  /// In en, this message translates to:
  /// **'EQUATION'**
  String get baseShiftEquation;

  /// No description provided for @baseShiftHint.
  ///
  /// In en, this message translates to:
  /// **'Enter decimal result...'**
  String get baseShiftHint;

  /// No description provided for @baseShiftCorrect.
  ///
  /// In en, this message translates to:
  /// **'Correct!'**
  String get baseShiftCorrect;

  /// No description provided for @baseShiftIncorrect.
  ///
  /// In en, this message translates to:
  /// **'Incorrect!'**
  String get baseShiftIncorrect;

  /// No description provided for @baseShiftSubmit.
  ///
  /// In en, this message translates to:
  /// **'SUBMIT'**
  String get baseShiftSubmit;

  /// No description provided for @baseShiftQuickGuide.
  ///
  /// In en, this message translates to:
  /// **'Quick Guide:'**
  String get baseShiftQuickGuide;

  /// No description provided for @baseShiftBinary.
  ///
  /// In en, this message translates to:
  /// **'Binary (bin): Base 2 (0, 1)'**
  String get baseShiftBinary;

  /// No description provided for @baseShiftHex.
  ///
  /// In en, this message translates to:
  /// **'Hexadecimal (0x): Base 16 (0-9, A-F)'**
  String get baseShiftHex;

  /// No description provided for @baseShiftDecimal.
  ///
  /// In en, this message translates to:
  /// **'Decimal (dec): Base 10 (0-9)'**
  String get baseShiftDecimal;

  /// No description provided for @baseShiftWinTitle.
  ///
  /// In en, this message translates to:
  /// **'MATH WIZARD!'**
  String get baseShiftWinTitle;

  /// No description provided for @baseShiftWinMessage.
  ///
  /// In en, this message translates to:
  /// **'You correctly solved 5 base-shift equations!'**
  String get baseShiftWinMessage;

  /// No description provided for @blockCount3DTitle.
  ///
  /// In en, this message translates to:
  /// **'Block Count 3D'**
  String get blockCount3DTitle;

  /// No description provided for @blockCount3DSubtitle.
  ///
  /// In en, this message translates to:
  /// **'DRAG TO ROTATE • COUNT HIDDEN BLOCKS'**
  String get blockCount3DSubtitle;

  /// No description provided for @blockCount3DHowMany.
  ///
  /// In en, this message translates to:
  /// **'HOW MANY BLOCKS?'**
  String get blockCount3DHowMany;

  /// No description provided for @blockCount3DSubmitGuess.
  ///
  /// In en, this message translates to:
  /// **'SUBMIT GUESS'**
  String get blockCount3DSubmitGuess;

  /// No description provided for @blockCount3DNotQuite.
  ///
  /// In en, this message translates to:
  /// **'Not quite! Try rotating to count again.'**
  String get blockCount3DNotQuite;

  /// No description provided for @blockCount3DExcellent.
  ///
  /// In en, this message translates to:
  /// **'EXCELLENT'**
  String get blockCount3DExcellent;

  /// No description provided for @blockCount3DWinMessage.
  ///
  /// In en, this message translates to:
  /// **'You correctly identified all {count} blocks!'**
  String blockCount3DWinMessage(int count);

  /// No description provided for @blockCount3DHowToPlayDescription.
  ///
  /// In en, this message translates to:
  /// **'1. Drag your finger across the 3D viewport to rotate the block stack.\n\n2. Count all the blocks in the stack.\n\n3. Remember: a block in the air must have structural support blocks underneath it (hidden blocks!).\n\n4. Type your answer in the input field and tap \"SUBMIT GUESS\" to check.'**
  String get blockCount3DHowToPlayDescription;

  /// No description provided for @alphabetSudokuTitle.
  ///
  /// In en, this message translates to:
  /// **'ALPHABET SUDOKU'**
  String get alphabetSudokuTitle;

  /// No description provided for @alphabetSudokuSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Fill the grid so every row, column, and box contains letters A-I.'**
  String get alphabetSudokuSubtitle;

  /// No description provided for @alphabetSudokuWinTitle.
  ///
  /// In en, this message translates to:
  /// **'SUDOKU SOLVED!'**
  String get alphabetSudokuWinTitle;

  /// No description provided for @alphabetSudokuWinMessage.
  ///
  /// In en, this message translates to:
  /// **'Brilliant! You mastered the letters.'**
  String get alphabetSudokuWinMessage;

  /// No description provided for @classicMazeTitle.
  ///
  /// In en, this message translates to:
  /// **'Classic Maze'**
  String get classicMazeTitle;

  /// No description provided for @classicMazeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'EXPLORE & SOLVE • A NEW MAZE EACH GAME'**
  String get classicMazeSubtitle;

  /// No description provided for @classicMazeWinTitle.
  ///
  /// In en, this message translates to:
  /// **'MAZE CLEARED'**
  String get classicMazeWinTitle;

  /// No description provided for @classicMazeWinMessage.
  ///
  /// In en, this message translates to:
  /// **'Incredible navigation! You solved the maze in {count} moves.'**
  String classicMazeWinMessage(int count);

  /// No description provided for @classicMazeMoves.
  ///
  /// In en, this message translates to:
  /// **'MOVES: '**
  String get classicMazeMoves;

  /// No description provided for @classicMazeHowToPlayDescription.
  ///
  /// In en, this message translates to:
  /// **'1. Guide the glowing yellow marble (player) to the green portal (exit) at the bottom-right.\n\n2. Use swipes anywhere on the maze, physical keyboard arrow keys, or the arrow pad buttons at the bottom to move.\n\n3. The purple trail shows the path you have explored. Backtrack onto your trail to erase it dynamically!\n\n4. Toggle difficulties from the top action bar to challenge yourself with larger mazes!'**
  String get classicMazeHowToPlayDescription;

  /// No description provided for @conjunctionSearchTitle.
  ///
  /// In en, this message translates to:
  /// **'Conjunction Search'**
  String get conjunctionSearchTitle;

  /// No description provided for @conjunctionSearchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Attentional Focus & Feature Conjunction'**
  String get conjunctionSearchSubtitle;

  /// No description provided for @conjunctionSearchWinTitle.
  ///
  /// In en, this message translates to:
  /// **'VICTORY'**
  String get conjunctionSearchWinTitle;

  /// No description provided for @conjunctionSearchWinMessage.
  ///
  /// In en, this message translates to:
  /// **'You have found all targets with perfect attentional focus!'**
  String get conjunctionSearchWinMessage;

  /// No description provided for @conjunctionSearchHowToPlayDescription.
  ///
  /// In en, this message translates to:
  /// **'A specific target shape and color combination will be shown in the instructions. Find and tap it in the dense grid as quickly as possible. Distractor shapes share either the same color or shape, so look closely!'**
  String get conjunctionSearchHowToPlayDescription;

  /// No description provided for @conjunctionSearchRound.
  ///
  /// In en, this message translates to:
  /// **'ROUND: '**
  String get conjunctionSearchRound;

  /// No description provided for @conjunctionSearchScore.
  ///
  /// In en, this message translates to:
  /// **'SCORE: '**
  String get conjunctionSearchScore;

  /// No description provided for @conjunctionSearchFind.
  ///
  /// In en, this message translates to:
  /// **'FIND: '**
  String get conjunctionSearchFind;

  /// No description provided for @shapeCircle.
  ///
  /// In en, this message translates to:
  /// **'CIRCLE'**
  String get shapeCircle;

  /// No description provided for @shapeSquare.
  ///
  /// In en, this message translates to:
  /// **'SQUARE'**
  String get shapeSquare;

  /// No description provided for @shapeTriangle.
  ///
  /// In en, this message translates to:
  /// **'TRIANGLE'**
  String get shapeTriangle;

  /// No description provided for @shapeStar.
  ///
  /// In en, this message translates to:
  /// **'STAR'**
  String get shapeStar;

  /// No description provided for @shapeRectangle.
  ///
  /// In en, this message translates to:
  /// **'RECTANGLE'**
  String get shapeRectangle;

  /// No description provided for @shapeEllipse.
  ///
  /// In en, this message translates to:
  /// **'ELLIPSE'**
  String get shapeEllipse;

  /// No description provided for @shapeTrapezoid.
  ///
  /// In en, this message translates to:
  /// **'TRAPEZOID'**
  String get shapeTrapezoid;

  /// No description provided for @colorRedLabel.
  ///
  /// In en, this message translates to:
  /// **'RED'**
  String get colorRedLabel;

  /// No description provided for @colorBlueLabel.
  ///
  /// In en, this message translates to:
  /// **'BLUE'**
  String get colorBlueLabel;

  /// No description provided for @colorGreenLabel.
  ///
  /// In en, this message translates to:
  /// **'GREEN'**
  String get colorGreenLabel;

  /// No description provided for @colorAmberLabel.
  ///
  /// In en, this message translates to:
  /// **'AMBER'**
  String get colorAmberLabel;

  /// No description provided for @cubeNetFoldTitle.
  ///
  /// In en, this message translates to:
  /// **'Cube Net Fold'**
  String get cubeNetFoldTitle;

  /// No description provided for @cubeNetFoldSubtitle.
  ///
  /// In en, this message translates to:
  /// **'SELECT THE MATCHING 3D CUBE OPTION'**
  String get cubeNetFoldSubtitle;

  /// No description provided for @cubeNetFoldWinTitle.
  ///
  /// In en, this message translates to:
  /// **'CORRECT'**
  String get cubeNetFoldWinTitle;

  /// No description provided for @cubeNetFoldWinMessage.
  ///
  /// In en, this message translates to:
  /// **'You have perfect 3D spatial folding logic!'**
  String get cubeNetFoldWinMessage;

  /// No description provided for @cubeNetFoldHowToPlayDescription.
  ///
  /// In en, this message translates to:
  /// **'1. Look at the unfolded 2D net at the top.\n\n2. Mentally fold the net into a 3D cube.\n\n3. Choose the option below that represents a valid 3D perspective of that folded cube.\n\n4. Be careful: opposite faces in the net cannot be adjacent in 3D, and the order of adjacent faces must match!'**
  String get cubeNetFoldHowToPlayDescription;

  /// No description provided for @cubeNetFoldUnfoldedNet.
  ///
  /// In en, this message translates to:
  /// **'UNFOLDED 2D NET'**
  String get cubeNetFoldUnfoldedNet;

  /// No description provided for @cubeNetFoldWhichMatches.
  ///
  /// In en, this message translates to:
  /// **'WHICH CUBE MATCHES?'**
  String get cubeNetFoldWhichMatches;

  /// No description provided for @cubeNetFoldIncorrect.
  ///
  /// In en, this message translates to:
  /// **'Incorrect fold logic! Tap Reset or change your choice.'**
  String get cubeNetFoldIncorrect;

  /// No description provided for @cubeNetFoldSubmitChoice.
  ///
  /// In en, this message translates to:
  /// **'SUBMIT CHOICE'**
  String get cubeNetFoldSubmitChoice;

  /// No description provided for @cubeNetFoldFailed.
  ///
  /// In en, this message translates to:
  /// **'FAILED (TAP RESET)'**
  String get cubeNetFoldFailed;

  /// No description provided for @faceTraitAssociationMemorize.
  ///
  /// In en, this message translates to:
  /// **'MEMORIZE ALL 4 PEOPLE'**
  String get faceTraitAssociationMemorize;

  /// No description provided for @faceTraitAssociationPersonOf.
  ///
  /// In en, this message translates to:
  /// **'PERSON {current} OF {total}'**
  String faceTraitAssociationPersonOf(int current, int total);

  /// No description provided for @faceTraitAssociationWhatOccupation.
  ///
  /// In en, this message translates to:
  /// **'WHAT IS THEIR OCCUPATION?'**
  String get faceTraitAssociationWhatOccupation;

  /// No description provided for @faceTraitAssociationWhatHobby.
  ///
  /// In en, this message translates to:
  /// **'WHAT IS THEIR HOBBY?'**
  String get faceTraitAssociationWhatHobby;

  /// No description provided for @faceTraitAssociationWinTitle.
  ///
  /// In en, this message translates to:
  /// **'MEMORY MASTER!'**
  String get faceTraitAssociationWinTitle;

  /// No description provided for @faceTraitAssociationLoseTitle.
  ///
  /// In en, this message translates to:
  /// **'GAME OVER'**
  String get faceTraitAssociationLoseTitle;

  /// No description provided for @faceTraitAssociationScoreMessage.
  ///
  /// In en, this message translates to:
  /// **'You got {correct} out of {total} correct.'**
  String faceTraitAssociationScoreMessage(int correct, int total);

  /// No description provided for @topologyTitle.
  ///
  /// In en, this message translates to:
  /// **'TOPOLOGY'**
  String get topologyTitle;

  /// No description provided for @topologySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Are these shapes topologically equivalent? (Can one be deformed into the other without cutting or gluing?)'**
  String get topologySubtitle;

  /// No description provided for @topologyWinTitle.
  ///
  /// In en, this message translates to:
  /// **'GEOMETRY GENIUS!'**
  String get topologyWinTitle;

  /// No description provided for @topologyWinMessage.
  ///
  /// In en, this message translates to:
  /// **'You correctly identified 10 topological pairs!'**
  String get topologyWinMessage;

  /// No description provided for @topologyScore.
  ///
  /// In en, this message translates to:
  /// **'SCORE: '**
  String get topologyScore;

  /// No description provided for @semanticDistanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Semantic Distance'**
  String get semanticDistanceTitle;

  /// No description provided for @semanticDistanceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Measure the conceptual distance between words'**
  String get semanticDistanceSubtitle;

  /// No description provided for @oxymoronHuntTitle.
  ///
  /// In en, this message translates to:
  /// **'Oxymoron Hunt'**
  String get oxymoronHuntTitle;

  /// No description provided for @oxymoronHuntSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pair contradictory words in the grid'**
  String get oxymoronHuntSubtitle;

  /// No description provided for @portmanteauSplitTitle.
  ///
  /// In en, this message translates to:
  /// **'Portmanteau Split'**
  String get portmanteauSplitTitle;

  /// No description provided for @portmanteauSplitSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify the source words of a portmanteau'**
  String get portmanteauSplitSubtitle;

  /// No description provided for @chainReactionTitle.
  ///
  /// In en, this message translates to:
  /// **'Chain Reaction'**
  String get chainReactionTitle;

  /// No description provided for @chainReactionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Connect words using overlapping letters'**
  String get chainReactionSubtitle;

  /// No description provided for @rhymeMasterTitle.
  ///
  /// In en, this message translates to:
  /// **'Rhyme Master'**
  String get rhymeMasterTitle;

  /// No description provided for @rhymeMasterSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify words that rhyme with the target'**
  String get rhymeMasterSubtitle;

  /// No description provided for @definitionDashTitle.
  ///
  /// In en, this message translates to:
  /// **'Definition Dash'**
  String get definitionDashTitle;

  /// No description provided for @definitionDashSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Match the correct word to its definition'**
  String get definitionDashSubtitle;

  /// No description provided for @syllableStackTitle.
  ///
  /// In en, this message translates to:
  /// **'Syllable Stack'**
  String get syllableStackTitle;

  /// No description provided for @syllableStackSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Stack syllables to form complete words'**
  String get syllableStackSubtitle;

  /// No description provided for @sentenceUnscrambleTitle.
  ///
  /// In en, this message translates to:
  /// **'Sentence Unscramble'**
  String get sentenceUnscrambleTitle;

  /// No description provided for @sentenceUnscrambleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Reorder words to form a valid sentence'**
  String get sentenceUnscrambleSubtitle;

  /// No description provided for @grammarSortTitle.
  ///
  /// In en, this message translates to:
  /// **'Grammar Sort'**
  String get grammarSortTitle;

  /// No description provided for @grammarSortSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Categorize words by their part of speech'**
  String get grammarSortSubtitle;

  /// No description provided for @vowelReconstructTitle.
  ///
  /// In en, this message translates to:
  /// **'Vowel Reconstruct'**
  String get vowelReconstructTitle;

  /// No description provided for @vowelReconstructSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Fill in the missing vowels in the sentence'**
  String get vowelReconstructSubtitle;

  /// No description provided for @consonantReconstructTitle.
  ///
  /// In en, this message translates to:
  /// **'Consonant Reconstruct'**
  String get consonantReconstructTitle;

  /// No description provided for @consonantReconstructSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Fill in the missing consonants in the sentence'**
  String get consonantReconstructSubtitle;

  /// No description provided for @homophoneHuntTitle.
  ///
  /// In en, this message translates to:
  /// **'Homophone Hunt'**
  String get homophoneHuntTitle;

  /// No description provided for @silentLetterSearchTitle.
  ///
  /// In en, this message translates to:
  /// **'Silent Letter Search'**
  String get silentLetterSearchTitle;

  /// No description provided for @silentLetterSearchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify silent letters in the given words'**
  String get silentLetterSearchSubtitle;

  /// No description provided for @palindromeBuilderTitle.
  ///
  /// In en, this message translates to:
  /// **'Palindrome Builder'**
  String get palindromeBuilderTitle;

  /// No description provided for @palindromeBuilderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create a palindrome by adding minimal letters'**
  String get palindromeBuilderSubtitle;

  /// No description provided for @phoneticGuessTitle.
  ///
  /// In en, this message translates to:
  /// **'Phonetic Guess'**
  String get phoneticGuessTitle;

  /// No description provided for @phoneticGuessSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify the word from its phonetic spelling'**
  String get phoneticGuessSubtitle;

  /// No description provided for @spoonerismSolverTitle.
  ///
  /// In en, this message translates to:
  /// **'Spoonerism Solver'**
  String get spoonerismSolverTitle;

  /// No description provided for @spoonerismSolverSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify the correct spoonerism for the phrase'**
  String get spoonerismSolverSubtitle;

  /// No description provided for @etymonOddballTitle.
  ///
  /// In en, this message translates to:
  /// **'Etymon Oddball'**
  String get etymonOddballTitle;

  /// No description provided for @etymonOddballSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find the word that does not share the same root'**
  String get etymonOddballSubtitle;

  /// No description provided for @etymologyOriginTitle.
  ///
  /// In en, this message translates to:
  /// **'Etymology Origin'**
  String get etymologyOriginTitle;

  /// No description provided for @etymologyOriginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Guess the origin language of the loanword'**
  String get etymologyOriginSubtitle;

  /// No description provided for @affixFactoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Affix Factory'**
  String get affixFactoryTitle;

  /// No description provided for @affixFactorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create valid words using prefixes and suffixes'**
  String get affixFactorySubtitle;

  /// No description provided for @cognateCatchTitle.
  ///
  /// In en, this message translates to:
  /// **'Cognate Catch'**
  String get cognateCatchTitle;

  /// No description provided for @cognateCatchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Distinguish between true cognates and false friends'**
  String get cognateCatchSubtitle;

  /// No description provided for @compoundConnectTitle.
  ///
  /// In en, this message translates to:
  /// **'Compound Connect'**
  String get compoundConnectTitle;

  /// No description provided for @compoundConnectSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Combine two words to form a compound word'**
  String get compoundConnectSubtitle;

  /// No description provided for @pangramSprintTitle.
  ///
  /// In en, this message translates to:
  /// **'Pangram Sprint'**
  String get pangramSprintTitle;

  /// No description provided for @pangramSprintSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Build a sentence using every letter of the alphabet'**
  String get pangramSprintSubtitle;

  /// No description provided for @anagramDefinitionTitle.
  ///
  /// In en, this message translates to:
  /// **'Anagram Definition'**
  String get anagramDefinitionTitle;

  /// No description provided for @anagramDefinitionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Solve the anagram based on its definition'**
  String get anagramDefinitionSubtitle;

  /// No description provided for @letterBridgeTitle.
  ///
  /// In en, this message translates to:
  /// **'Letter Bridge'**
  String get letterBridgeTitle;

  /// No description provided for @letterBridgeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find the missing letter that bridges two words'**
  String get letterBridgeSubtitle;

  /// No description provided for @letterFrequencyScanTitle.
  ///
  /// In en, this message translates to:
  /// **'Letter Frequency Scan'**
  String get letterFrequencyScanTitle;

  /// No description provided for @letterFrequencyScanSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Count how many times a letter appears in the text'**
  String get letterFrequencyScanSubtitle;

  /// No description provided for @oneLetterShiftTitle.
  ///
  /// In en, this message translates to:
  /// **'One-Letter Shift'**
  String get oneLetterShiftTitle;

  /// No description provided for @oneLetterShiftSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Transform one word into another with one letter change'**
  String get oneLetterShiftSubtitle;

  /// No description provided for @vocabularyBuilderMessage.
  ///
  /// In en, this message translates to:
  /// **'Great job! Your vocabulary is impressive. Score: {arg0}'**
  String vocabularyBuilderMessage(String arg0);

  /// No description provided for @symmetryMessage.
  ///
  /// In en, this message translates to:
  /// **'You mirrored the pattern perfectly with surgical precision.'**
  String get symmetryMessage;

  /// No description provided for @temporalOrderMessage.
  ///
  /// In en, this message translates to:
  /// **'Incredible! Your temporal sequence memory is high-fidelity.'**
  String get temporalOrderMessage;

  /// No description provided for @temporalOrderMessage1.
  ///
  /// In en, this message translates to:
  /// **'Incorrect sequence memory. Practice makes perfect!'**
  String get temporalOrderMessage1;

  /// No description provided for @wordSearchMessage.
  ///
  /// In en, this message translates to:
  /// **'All words found successfully with keen observation.'**
  String get wordSearchMessage;

  /// No description provided for @colorMatchMessage.
  ///
  /// In en, this message translates to:
  /// **'Your accuracy: {arg0}%'**
  String colorMatchMessage(String arg0);

  /// No description provided for @semanticLinkMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {arg0} points!'**
  String semanticLinkMessage(String arg0);

  /// No description provided for @reflexTapMessage.
  ///
  /// In en, this message translates to:
  /// **'You tapped {arg0} targets!'**
  String reflexTapMessage(String arg0);

  /// No description provided for @angleFinderMessage.
  ///
  /// In en, this message translates to:
  /// **'Your geometric intuition is perfect!'**
  String get angleFinderMessage;

  /// No description provided for @angleFinderMessage1.
  ///
  /// In en, this message translates to:
  /// **'The correct answer was {arg0}°'**
  String angleFinderMessage1(String arg0);

  /// No description provided for @angleFinderText.
  ///
  /// In en, this message translates to:
  /// **'{arg0}°'**
  String angleFinderText(String arg0);

  /// No description provided for @visualStatisticalLearningMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {arg0} correct patterns!'**
  String visualStatisticalLearningMessage(String arg0);

  /// No description provided for @nonogramText.
  ///
  /// In en, this message translates to:
  /// **'Error: {arg0}'**
  String nonogramText(String arg0);

  /// No description provided for @mentalCalendarMessage.
  ///
  /// In en, this message translates to:
  /// **'You got {arg0} correct out of 10!'**
  String mentalCalendarMessage(String arg0);

  /// No description provided for @orbitTapMessage.
  ///
  /// In en, this message translates to:
  /// **'You successfully tapped {arg0} times!'**
  String orbitTapMessage(String arg0);

  /// No description provided for @schulteTableMessage.
  ///
  /// In en, this message translates to:
  /// **'You completed the table in {arg0}.\nKeep practicing to expand your peripheral vision!'**
  String schulteTableMessage(String arg0);

  /// No description provided for @schulteTableText.
  ///
  /// In en, this message translates to:
  /// **'START TEST'**
  String get schulteTableText;

  /// No description provided for @relationalMemoryMessage.
  ///
  /// In en, this message translates to:
  /// **'Fabulous spatial relational memory accuracy!'**
  String get relationalMemoryMessage;

  /// No description provided for @sudokuText.
  ///
  /// In en, this message translates to:
  /// **'Error: {arg0}'**
  String sudokuText(String arg0);

  /// No description provided for @sdmtMessage.
  ///
  /// In en, this message translates to:
  /// **'You matched {arg0} symbols! This test measures your scanning speed and visual attention.'**
  String sdmtMessage(String arg0);

  /// No description provided for @futoshikiMessage.
  ///
  /// In en, this message translates to:
  /// **'Incredible! You solved the Futoshiki Latin Square.'**
  String get futoshikiMessage;

  /// No description provided for @letterFrequencyScanMessage.
  ///
  /// In en, this message translates to:
  /// **'You correctly counted {arg0} occurrences of \"{arg1}\".'**
  String letterFrequencyScanMessage(String arg0, String arg1);

  /// No description provided for @letterFrequencyScanText.
  ///
  /// In en, this message translates to:
  /// **'Incorrect. The count was {arg0}.'**
  String letterFrequencyScanText(String arg0);

  /// No description provided for @memoryMatrixMessage.
  ///
  /// In en, this message translates to:
  /// **'Impressive! Your working memory is sharp. Daily goal complete!'**
  String get memoryMatrixMessage;

  /// No description provided for @memoryMatrixMessage1.
  ///
  /// In en, this message translates to:
  /// **'Focus and try again to improve your memory score.'**
  String get memoryMatrixMessage1;

  /// No description provided for @contextCluesMessage.
  ///
  /// In en, this message translates to:
  /// **'Exceptional! Your vocabulary and contextual analysis are top notch.'**
  String get contextCluesMessage;

  /// No description provided for @contextCluesMessage1.
  ///
  /// In en, this message translates to:
  /// **'Wrong word selected! Train your verbal context reasoning and try again.'**
  String get contextCluesMessage1;

  /// No description provided for @oneLetterShiftMessage.
  ///
  /// In en, this message translates to:
  /// **'You correctly shifted {arg0} to {arg1}.'**
  String oneLetterShiftMessage(String arg0, String arg1);

  /// No description provided for @mentalAbacusMessage.
  ///
  /// In en, this message translates to:
  /// **'Your mental arithmetic is top-tier.'**
  String get mentalAbacusMessage;

  /// No description provided for @fractionMatcherMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {arg0} points matching representations!'**
  String fractionMatcherMessage(String arg0);

  /// No description provided for @spellingSprintMessage.
  ///
  /// In en, this message translates to:
  /// **'You spelled all 10 words correctly!'**
  String get spellingSprintMessage;

  /// No description provided for @spellingSprintMessage1.
  ///
  /// In en, this message translates to:
  /// **'You spelled {arg0} words.'**
  String spellingSprintMessage1(String arg0);

  /// No description provided for @stopSignalMessage.
  ///
  /// In en, this message translates to:
  /// **'You achieved {arg0} correct responses! This test measures your ability to inhibit a planned action.'**
  String stopSignalMessage(String arg0);

  /// No description provided for @grammarPoliceMessage.
  ///
  /// In en, this message translates to:
  /// **'Game Over! You maintained order in the world of grammar. Score: {arg0}'**
  String grammarPoliceMessage(String arg0);

  /// No description provided for @consonantReconstructMessage.
  ///
  /// In en, this message translates to:
  /// **'You reconstructed a score of {arg0}!'**
  String consonantReconstructMessage(String arg0);

  /// No description provided for @rhymeMasterMessage.
  ///
  /// In en, this message translates to:
  /// **'You found {arg0} out of {arg1} rhymes!'**
  String rhymeMasterMessage(String arg0, String arg1);

  /// No description provided for @vigilanceTaskMessage.
  ///
  /// In en, this message translates to:
  /// **'Hits: {arg0}, Misses: {arg1}\nFalse Alarms: {arg2}'**
  String vigilanceTaskMessage(String arg0, String arg1, String arg2);

  /// No description provided for @silhouetteMatchOrthoMessage.
  ///
  /// In en, this message translates to:
  /// **'You have flawless orthographic alignment skills!'**
  String get silhouetteMatchOrthoMessage;

  /// No description provided for @silhouetteMatchOrthoText.
  ///
  /// In en, this message translates to:
  /// **'GOT IT'**
  String get silhouetteMatchOrthoText;

  /// No description provided for @silhouetteMatchOrthoText1.
  ///
  /// In en, this message translates to:
  /// **'Incorrect perspective projection! Tap Reset to try again.'**
  String get silhouetteMatchOrthoText1;

  /// No description provided for @fibonacciMergeMessage.
  ///
  /// In en, this message translates to:
  /// **'{arg0}: {arg1}'**
  String fibonacciMergeMessage(String arg0, String arg1);

  /// No description provided for @factorFinderMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {arg0} points by finding all factors!'**
  String factorFinderMessage(String arg0);

  /// No description provided for @logicalSyllogismsMessage.
  ///
  /// In en, this message translates to:
  /// **'You solved {arg0} syllogisms correctly!'**
  String logicalSyllogismsMessage(String arg0);

  /// No description provided for @rotatingMazeMessage.
  ///
  /// In en, this message translates to:
  /// **'You successfully navigated the kinetic rotating maze!'**
  String get rotatingMazeMessage;

  /// No description provided for @rotatingMazeText.
  ///
  /// In en, this message translates to:
  /// **'GOT IT'**
  String get rotatingMazeText;

  /// No description provided for @rotatingMazeText1.
  ///
  /// In en, this message translates to:
  /// **'🌀 Maze rotated 90°! Grid shifted!'**
  String get rotatingMazeText1;

  /// No description provided for @mathPathMessage.
  ///
  /// In en, this message translates to:
  /// **'You found the path that adds up to the target!'**
  String get mathPathMessage;

  /// No description provided for @bridgesMessage.
  ///
  /// In en, this message translates to:
  /// **'You successfully connected all the islands!'**
  String get bridgesMessage;

  /// No description provided for @compoundConnectMessage.
  ///
  /// In en, this message translates to:
  /// **'The compound word is {arg0}{arg1}.'**
  String compoundConnectMessage(String arg0, String arg1);

  /// No description provided for @pangramSprintMessage.
  ///
  /// In en, this message translates to:
  /// **'You built a sentence using all 26 letters.'**
  String get pangramSprintMessage;

  /// No description provided for @mirrorImageMessage.
  ///
  /// In en, this message translates to:
  /// **'You perfectly identified the reflection.'**
  String get mirrorImageMessage;

  /// No description provided for @mirrorImageText.
  ///
  /// In en, this message translates to:
  /// **'MIRROR IMAGE'**
  String get mirrorImageText;

  /// No description provided for @reverseStroopMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {arg0} points! Keep your eye on the instructions.'**
  String reverseStroopMessage(String arg0);

  /// No description provided for @verbalAnalogiesMessage.
  ///
  /// In en, this message translates to:
  /// **'You have a sharp mind for relationships.'**
  String get verbalAnalogiesMessage;

  /// No description provided for @corsiBlocksMessage1.
  ///
  /// In en, this message translates to:
  /// **'You recalled {arg1} sequences! Your spatial memory span reached {arg0}.'**
  String corsiBlocksMessage1(String arg0, String arg1);

  /// No description provided for @wordLadderMessage.
  ///
  /// In en, this message translates to:
  /// **'You successfully connected {arg0} to {arg1} in {arg2} steps.'**
  String wordLadderMessage(String arg0, String arg1, String arg2);

  /// No description provided for @d2AttentionMessage.
  ///
  /// In en, this message translates to:
  /// **'Incredible selective scanning! Final score: {arg0}.'**
  String d2AttentionMessage(String arg0);

  /// No description provided for @d2AttentionText.
  ///
  /// In en, this message translates to:
  /// **'HOW TO PLAY'**
  String get d2AttentionText;

  /// No description provided for @d2AttentionText1.
  ///
  /// In en, this message translates to:
  /// **'GOT IT'**
  String get d2AttentionText1;

  /// No description provided for @tangleFixMessage.
  ///
  /// In en, this message translates to:
  /// **'All lines are clear and smooth.'**
  String get tangleFixMessage;

  /// No description provided for @distractorMatrixMessage.
  ///
  /// In en, this message translates to:
  /// **'Incredible! You recalled patterns despite cognitive math distractors!'**
  String get distractorMatrixMessage;

  /// No description provided for @distractorMatrixMessage1.
  ///
  /// In en, this message translates to:
  /// **'The distractors got you! Retrain your working memory.'**
  String get distractorMatrixMessage1;

  /// No description provided for @sentenceUnscrambleMessage.
  ///
  /// In en, this message translates to:
  /// **'You unscrambled a score of {arg0}!'**
  String sentenceUnscrambleMessage(String arg0);

  /// No description provided for @kakuroMessage.
  ///
  /// In en, this message translates to:
  /// **'Incredible! You matched all sum segments perfectly.'**
  String get kakuroMessage;

  /// No description provided for @symbolicFlankerMessage.
  ///
  /// In en, this message translates to:
  /// **'You got {arg0} correct out of {arg1}!'**
  String symbolicFlankerMessage(String arg0, String arg1);

  /// No description provided for @stroopTestMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {arg0} correctly! Focus on the color of the ink, not the word.'**
  String stroopTestMessage(String arg0);

  /// No description provided for @wisconsinCardSortingMessage.
  ///
  /// In en, this message translates to:
  /// **'You correctly sorted {arg0} cards!'**
  String wisconsinCardSortingMessage(String arg0);

  /// No description provided for @nBackMessage.
  ///
  /// In en, this message translates to:
  /// **'You achieved {arg0} 2-back matches! Your working memory is vital for multitasking.'**
  String nBackMessage(String arg0);

  /// No description provided for @rhythmMasterMessage.
  ///
  /// In en, this message translates to:
  /// **'You got {arg0} perfect hits and {arg1} points!'**
  String rhythmMasterMessage(String arg0, String arg1);

  /// No description provided for @groceryListMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {arg0} points in Grocery List!'**
  String groceryListMessage(String arg0, Object score);

  /// No description provided for @groceryListText.
  ///
  /// In en, this message translates to:
  /// **'I\\'**
  String get groceryListText;

  /// No description provided for @mirrorTracingMessage.
  ///
  /// In en, this message translates to:
  /// **'Your brain successfully rewired its coordination.'**
  String get mirrorTracingMessage;

  /// No description provided for @moduloClockMessage.
  ///
  /// In en, this message translates to:
  /// **'Excellent modular mental math coordination! Score: {arg0}'**
  String moduloClockMessage(String arg0);

  /// No description provided for @moduloClockMessage1.
  ///
  /// In en, this message translates to:
  /// **'You managed {arg0} of {arg1} modular clock solutions. Score: {arg2}'**
  String moduloClockMessage1(String arg0, String arg1, String arg2);

  /// No description provided for @crownMessage.
  ///
  /// In en, this message translates to:
  /// **'All crowns placed successfully with perfect logic.'**
  String get crownMessage;

  /// No description provided for @dualCodingMessage.
  ///
  /// In en, this message translates to:
  /// **'Fantastic dual-task performance! Your working memory score: {arg0}'**
  String dualCodingMessage(String arg0);

  /// No description provided for @inequalityDashMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {arg0} points matching inequalities!'**
  String inequalityDashMessage(String arg0);

  /// No description provided for @sourceMonitoringMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {arg0} out of {arg1}!'**
  String sourceMonitoringMessage(String arg0, String arg1);

  /// No description provided for @sourceMonitoringText.
  ///
  /// In en, this message translates to:
  /// **'START RECALL'**
  String get sourceMonitoringText;

  /// No description provided for @memoryPalaceText.
  ///
  /// In en, this message translates to:
  /// **'AVAILABLE WORDS'**
  String get memoryPalaceText;

  /// No description provided for @target10Message.
  ///
  /// In en, this message translates to:
  /// **'You scored {arg0} points matching numbers to 10!'**
  String target10Message(String arg0);

  /// No description provided for @paperFoldingMessage.
  ///
  /// In en, this message translates to:
  /// **'You can see the patterns in your mind.'**
  String get paperFoldingMessage;

  /// No description provided for @topologyText.
  ///
  /// In en, this message translates to:
  /// **'{arg0}{arg1} / 10'**
  String topologyText(String arg0, String arg1);

  /// No description provided for @waterSortMessage.
  ///
  /// In en, this message translates to:
  /// **'You sorted all the colors perfectly!'**
  String get waterSortMessage;

  /// No description provided for @anagramDefinitionMessage.
  ///
  /// In en, this message translates to:
  /// **'The word was indeed \"{arg0}\".'**
  String anagramDefinitionMessage(String arg0);

  /// No description provided for @game2048Message.
  ///
  /// In en, this message translates to:
  /// **'{arg0}: {arg1}\n{arg2}'**
  String game2048Message(String arg0, String arg1, String arg2);

  /// No description provided for @game2048Message1.
  ///
  /// In en, this message translates to:
  /// **'{arg0}: {arg1}'**
  String game2048Message1(String arg0, String arg1);

  /// No description provided for @numericalEstimationMessage.
  ///
  /// In en, this message translates to:
  /// **'You made {arg0} correct estimations.'**
  String numericalEstimationMessage(String arg0);

  /// No description provided for @grammarSortMessage.
  ///
  /// In en, this message translates to:
  /// **'You sorted {arg0} words correctly!'**
  String grammarSortMessage(String arg0);

  /// No description provided for @vowelReconstructMessage.
  ///
  /// In en, this message translates to:
  /// **'You reconstructed a score of {arg0}!'**
  String vowelReconstructMessage(String arg0);

  /// No description provided for @spatialConflictMessage.
  ///
  /// In en, this message translates to:
  /// **'You achieved a score of {arg0} with {arg1} errors!'**
  String spatialConflictMessage(String arg0, String arg1);

  /// No description provided for @spatialConflictText.
  ///
  /// In en, this message translates to:
  /// **'HOW TO PLAY'**
  String get spatialConflictText;

  /// No description provided for @spatialConflictText1.
  ///
  /// In en, this message translates to:
  /// **'GOT IT'**
  String get spatialConflictText1;

  /// No description provided for @tracePathMessage.
  ///
  /// In en, this message translates to:
  /// **'Your accuracy was {arg0}%!'**
  String tracePathMessage(String arg0);

  /// No description provided for @ruleSwitcherMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {arg0} correct out of {arg1}!'**
  String ruleSwitcherMessage(String arg0, String arg1);

  /// No description provided for @collatzMessage.
  ///
  /// In en, this message translates to:
  /// **'You took {arg0} steps. Min possible was {arg1}.'**
  String collatzMessage(String arg0, String arg1);

  /// No description provided for @collatzText.
  ///
  /// In en, this message translates to:
  /// **'/ 2'**
  String get collatzText;

  /// No description provided for @collatzText1.
  ///
  /// In en, this message translates to:
  /// **'+ 1'**
  String get collatzText1;

  /// No description provided for @collatzText2.
  ///
  /// In en, this message translates to:
  /// **'3n + 1'**
  String get collatzText2;

  /// No description provided for @divisibilityDashMessage.
  ///
  /// In en, this message translates to:
  /// **'You solved {arg0} numbers!'**
  String divisibilityDashMessage(String arg0);

  /// No description provided for @switchTaskMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {arg0} correctly! Fast switching is key to mental flexibility.'**
  String switchTaskMessage(String arg0);

  /// No description provided for @sequenceSleuthMessage.
  ///
  /// In en, this message translates to:
  /// **'You solved {arg0} sequences!'**
  String sequenceSleuthMessage(String arg0);

  /// No description provided for @changeBlindnessMessage.
  ///
  /// In en, this message translates to:
  /// **'You found {arg0} changes!'**
  String changeBlindnessMessage(String arg0);

  /// No description provided for @mentalRotationMessage.
  ///
  /// In en, this message translates to:
  /// **'You rotated {arg0} shapes correctly!'**
  String mentalRotationMessage(String arg0);

  /// No description provided for @wordMastermindMessage.
  ///
  /// In en, this message translates to:
  /// **'You mastered the code!\nThe word was: {arg0}'**
  String wordMastermindMessage(String arg0);

  /// No description provided for @wordMastermindMessage1.
  ///
  /// In en, this message translates to:
  /// **'The hidden word was: {arg0}'**
  String wordMastermindMessage1(String arg0);

  /// No description provided for @wordMastermindText.
  ///
  /// In en, this message translates to:
  /// **'{arg0}'**
  String wordMastermindText(String arg0);

  /// No description provided for @simonSequenceMessage.
  ///
  /// In en, this message translates to:
  /// **'You memorized all 10 tiles!'**
  String get simonSequenceMessage;

  /// No description provided for @simonSequenceMessage1.
  ///
  /// In en, this message translates to:
  /// **'Try again to master the sequence.'**
  String get simonSequenceMessage1;

  /// No description provided for @oxymoronHuntMessage.
  ///
  /// In en, this message translates to:
  /// **'You found {arg0} oxymorons!'**
  String oxymoronHuntMessage(String arg0);

  /// No description provided for @spotlightTrackMessage.
  ///
  /// In en, this message translates to:
  /// **'Incredible spatial tracking! You scored {arg0} points.'**
  String spotlightTrackMessage(String arg0);

  /// No description provided for @spotlightTrackText.
  ///
  /// In en, this message translates to:
  /// **'HOW TO PLAY'**
  String get spotlightTrackText;

  /// No description provided for @spotlightTrackText1.
  ///
  /// In en, this message translates to:
  /// **'GOT IT'**
  String get spotlightTrackText1;

  /// No description provided for @spotlightTrackText2.
  ///
  /// In en, this message translates to:
  /// **'START ROUND'**
  String get spotlightTrackText2;

  /// No description provided for @vennNumbersMessage.
  ///
  /// In en, this message translates to:
  /// **'You categorized {arg0} numbers!'**
  String vennNumbersMessage(String arg0);

  /// No description provided for @vennNumbersText.
  ///
  /// In en, this message translates to:
  /// **'NEITHER'**
  String get vennNumbersText;

  /// No description provided for @vennNumbersText1.
  ///
  /// In en, this message translates to:
  /// **'BOTH'**
  String get vennNumbersText1;

  /// No description provided for @silhouetteMatchMessage.
  ///
  /// In en, this message translates to:
  /// **'Your brain is excellent at 3D to 2D translation.'**
  String get silhouetteMatchMessage;

  /// No description provided for @sumSnakeMessage.
  ///
  /// In en, this message translates to:
  /// **'Target {arg0} reached with perfect precision!'**
  String sumSnakeMessage(String arg0);

  /// No description provided for @sumSnakeText.
  ///
  /// In en, this message translates to:
  /// **'CLEAR PATH'**
  String get sumSnakeText;

  /// No description provided for @percentagePeakMessage.
  ///
  /// In en, this message translates to:
  /// **'You solved {arg0} percentage problems!'**
  String percentagePeakMessage(String arg0);

  /// No description provided for @trailMakingMessage.
  ///
  /// In en, this message translates to:
  /// **'You completed {arg0} trails! This test measures your visual search speed and mental flexibility.'**
  String trailMakingMessage(String arg0);

  /// No description provided for @matrixReasoningMessage.
  ///
  /// In en, this message translates to:
  /// **'You completed {arg0} matrices correctly!'**
  String matrixReasoningMessage(String arg0);

  /// No description provided for @tentsAndTreesMessage.
  ///
  /// In en, this message translates to:
  /// **'You have successfully placed all the tents.'**
  String get tentsAndTreesMessage;

  /// No description provided for @klotskiMessage.
  ///
  /// In en, this message translates to:
  /// **'Sensational sliding! You freed the Hero block in {arg0} moves.'**
  String klotskiMessage(String arg0);

  /// No description provided for @sumPyramidMessage.
  ///
  /// In en, this message translates to:
  /// **'You solved {arg0} sum pyramids successfully!'**
  String sumPyramidMessage(String arg0);

  /// No description provided for @simonCommandMessage.
  ///
  /// In en, this message translates to:
  /// **'Excellent selective response and focus! Total Score: {arg0}'**
  String simonCommandMessage(String arg0);

  /// No description provided for @simonCommandMessage1.
  ///
  /// In en, this message translates to:
  /// **'You scored {arg0} but did not reach {arg1} matches in time.'**
  String simonCommandMessage1(String arg0, String arg1);

  /// No description provided for @syllableStackMessage.
  ///
  /// In en, this message translates to:
  /// **'You stacked up a score of {arg0}!'**
  String syllableStackMessage(String arg0);

  /// No description provided for @slitherlinkMessage.
  ///
  /// In en, this message translates to:
  /// **'Awesome! You successfully completed the loop puzzle.'**
  String get slitherlinkMessage;

  /// No description provided for @quickMathMessage.
  ///
  /// In en, this message translates to:
  /// **'You solved {arg0} problems!'**
  String quickMathMessage(String arg0);

  /// No description provided for @commonDenominatorMessage.
  ///
  /// In en, this message translates to:
  /// **'You solved {arg0} GCD/LCM problems!'**
  String commonDenominatorMessage(String arg0);

  /// No description provided for @chainReactionMessage.
  ///
  /// In en, this message translates to:
  /// **'Your final score is {arg0}. You built a chain of {arg1} words.'**
  String chainReactionMessage(String arg0, String arg1);

  /// No description provided for @chainReactionText.
  ///
  /// In en, this message translates to:
  /// **'{arg0}'**
  String chainReactionText(String arg0);

  /// No description provided for @associativePairsMessage.
  ///
  /// In en, this message translates to:
  /// **'Brilliant! You associated visual traits flawlessly.'**
  String get associativePairsMessage;

  /// No description provided for @associativePairsMessage1.
  ///
  /// In en, this message translates to:
  /// **'Wrong association! Sharpen your link memory and try again.'**
  String get associativePairsMessage1;

  /// No description provided for @portmanteauSplitMessage.
  ///
  /// In en, this message translates to:
  /// **'You split {arg0} portmanteaus!'**
  String portmanteauSplitMessage(String arg0);

  /// No description provided for @magicSquaresText.
  ///
  /// In en, this message translates to:
  /// **'CLEAR'**
  String get magicSquaresText;

  /// No description provided for @alphabetSudokuText.
  ///
  /// In en, this message translates to:
  /// **'Error: {arg0}'**
  String alphabetSudokuText(String arg0);

  /// No description provided for @pipesMessage.
  ///
  /// In en, this message translates to:
  /// **'You connected all the pipes and filled the grid.'**
  String get pipesMessage;

  /// No description provided for @dualMirrorMessage.
  ///
  /// In en, this message translates to:
  /// **'You navigated both icons to their targets!'**
  String get dualMirrorMessage;

  /// No description provided for @binaryCodeMessage.
  ///
  /// In en, this message translates to:
  /// **'Sensational rapid decimal translation! Final Score: {arg0}'**
  String binaryCodeMessage(String arg0);

  /// No description provided for @binaryCodeMessage1.
  ///
  /// In en, this message translates to:
  /// **'You correctly converted {arg0} binary numbers. Score: {arg1}'**
  String binaryCodeMessage1(String arg0, String arg1);

  /// No description provided for @oddOneOutMessage.
  ///
  /// In en, this message translates to:
  /// **'You found 50 odd ones! Final score: {arg0}'**
  String oddOneOutMessage(String arg0);

  /// No description provided for @oddOneOutMessage1.
  ///
  /// In en, this message translates to:
  /// **'Your score: {arg0}'**
  String oddOneOutMessage1(String arg0);

  /// No description provided for @letterBridgeMessage.
  ///
  /// In en, this message translates to:
  /// **'You found the bridge letter: {arg0}'**
  String letterBridgeMessage(String arg0);

  /// No description provided for @imReady.
  ///
  /// In en, this message translates to:
  /// **'I\'M READY'**
  String get imReady;

  /// No description provided for @soptTitle.
  ///
  /// In en, this message translates to:
  /// **'Self-Ordered Pointing'**
  String get soptTitle;

  /// No description provided for @soptSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap a different card each time. The positions shuffle!'**
  String get soptSubtitle;

  /// No description provided for @soptWinTitle.
  ///
  /// In en, this message translates to:
  /// **'Sequence Master!'**
  String get soptWinTitle;

  /// No description provided for @soptGameOverMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {score} points by successfully tracking shuffled cards!'**
  String soptGameOverMessage(int score);

  /// No description provided for @soptChooseNovel.
  ///
  /// In en, this message translates to:
  /// **'Tap a new card'**
  String get soptChooseNovel;

  /// No description provided for @soptGreatJob.
  ///
  /// In en, this message translates to:
  /// **'Great job!'**
  String get soptGreatJob;

  /// No description provided for @soptAlreadyTapped.
  ///
  /// In en, this message translates to:
  /// **'Already tapped!'**
  String get soptAlreadyTapped;

  /// No description provided for @soptGrid.
  ///
  /// In en, this message translates to:
  /// **'Grid'**
  String get soptGrid;

  /// No description provided for @contRecogTitle.
  ///
  /// In en, this message translates to:
  /// **'Continuous Recognition'**
  String get contRecogTitle;

  /// No description provided for @contRecogSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Have you seen this card before in this session?'**
  String get contRecogSubtitle;

  /// No description provided for @contRecogWinTitle.
  ///
  /// In en, this message translates to:
  /// **'Recognition Genius!'**
  String get contRecogWinTitle;

  /// No description provided for @contRecogGameOverMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {score} correct recognitions!'**
  String contRecogGameOverMessage(int score);

  /// No description provided for @contRecogCorrect.
  ///
  /// In en, this message translates to:
  /// **'Correct!'**
  String get contRecogCorrect;

  /// No description provided for @contRecogWrong.
  ///
  /// In en, this message translates to:
  /// **'Wrong!'**
  String get contRecogWrong;

  /// No description provided for @contRecogOldOrNew.
  ///
  /// In en, this message translates to:
  /// **'Is this old or new?'**
  String get contRecogOldOrNew;

  /// No description provided for @contRecogNew.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get contRecogNew;

  /// No description provided for @contRecogOld.
  ///
  /// In en, this message translates to:
  /// **'Old'**
  String get contRecogOld;

  /// No description provided for @contRecogSeenPool.
  ///
  /// In en, this message translates to:
  /// **'Seen Pool'**
  String get contRecogSeenPool;

  /// No description provided for @dnmsTitle.
  ///
  /// In en, this message translates to:
  /// **'Non-Matching Memory'**
  String get dnmsTitle;

  /// No description provided for @dnmsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap the card that was not in the memorized sample.'**
  String get dnmsSubtitle;

  /// No description provided for @dnmsWinTitle.
  ///
  /// In en, this message translates to:
  /// **'Non-Matching Expert!'**
  String get dnmsWinTitle;

  /// No description provided for @dnmsGameOverMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {score} correct answers in Delayed Non-Matching!'**
  String dnmsGameOverMessage(int score);

  /// No description provided for @dnmsChooseNovel.
  ///
  /// In en, this message translates to:
  /// **'Tap the new card'**
  String get dnmsChooseNovel;

  /// No description provided for @dnmsMemorizeSample.
  ///
  /// In en, this message translates to:
  /// **'Memorize this card'**
  String get dnmsMemorizeSample;

  /// No description provided for @dnmsWaitForIt.
  ///
  /// In en, this message translates to:
  /// **'Wait for it...'**
  String get dnmsWaitForIt;

  /// No description provided for @dnmsExcellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent!'**
  String get dnmsExcellent;

  /// No description provided for @dnmsSampleTapped.
  ///
  /// In en, this message translates to:
  /// **'That was the sample!'**
  String get dnmsSampleTapped;

  /// No description provided for @dnmsCards.
  ///
  /// In en, this message translates to:
  /// **'Cards'**
  String get dnmsCards;

  /// No description provided for @symSpanTitle.
  ///
  /// In en, this message translates to:
  /// **'Symmetry Span'**
  String get symSpanTitle;

  /// No description provided for @symSpanSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Recall cell patterns while identifying vertical symmetry.'**
  String get symSpanSubtitle;

  /// No description provided for @symSpanWinTitle.
  ///
  /// In en, this message translates to:
  /// **'Symmetry Master!'**
  String get symSpanWinTitle;

  /// No description provided for @symSpanGameOverMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {score} points by recalling layouts and identifying symmetry!'**
  String symSpanGameOverMessage(int score);

  /// No description provided for @symSpanMemorizeRed.
  ///
  /// In en, this message translates to:
  /// **'Memorize red cell location'**
  String get symSpanMemorizeRed;

  /// No description provided for @symSpanIsSymmetric.
  ///
  /// In en, this message translates to:
  /// **'Is the pattern symmetrical?'**
  String get symSpanIsSymmetric;

  /// No description provided for @symSpanRecallSequence.
  ///
  /// In en, this message translates to:
  /// **'Recall sequence in correct order'**
  String get symSpanRecallSequence;

  /// No description provided for @symSpanGreatJob.
  ///
  /// In en, this message translates to:
  /// **'Great job!'**
  String get symSpanGreatJob;

  /// No description provided for @symSpanTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again!'**
  String get symSpanTryAgain;

  /// No description provided for @symSpanLength.
  ///
  /// In en, this message translates to:
  /// **'Length'**
  String get symSpanLength;

  /// No description provided for @readingSpanTitle.
  ///
  /// In en, this message translates to:
  /// **'Reading Span'**
  String get readingSpanTitle;

  /// No description provided for @readingSpanSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Verify sentences while remembering a sequence of letters.'**
  String get readingSpanSubtitle;

  /// No description provided for @readingSpanWinTitle.
  ///
  /// In en, this message translates to:
  /// **'Reading Expert!'**
  String get readingSpanWinTitle;

  /// No description provided for @readingSpanGameOverMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {score} points in the Reading Span memory challenge!'**
  String readingSpanGameOverMessage(int score);

  /// No description provided for @readingSpanTrueFalse.
  ///
  /// In en, this message translates to:
  /// **'Is this statement true or false?'**
  String get readingSpanTrueFalse;

  /// No description provided for @readingSpanMemorizeLetter.
  ///
  /// In en, this message translates to:
  /// **'Memorize this letter'**
  String get readingSpanMemorizeLetter;

  /// No description provided for @readingSpanRecallLetters.
  ///
  /// In en, this message translates to:
  /// **'Recall letters in sequence'**
  String get readingSpanRecallLetters;

  /// No description provided for @readingSpanGreatJob.
  ///
  /// In en, this message translates to:
  /// **'Great job!'**
  String get readingSpanGreatJob;

  /// No description provided for @readingSpanTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again!'**
  String get readingSpanTryAgain;

  /// No description provided for @readingSpanYourSequence.
  ///
  /// In en, this message translates to:
  /// **'Your sequence: {sequence}'**
  String readingSpanYourSequence(String sequence);

  /// No description provided for @readingSpanLength.
  ///
  /// In en, this message translates to:
  /// **'Length'**
  String get readingSpanLength;

  /// No description provided for @readingSpanSentence1.
  ///
  /// In en, this message translates to:
  /// **'The sun rises in the east.'**
  String get readingSpanSentence1;

  /// No description provided for @readingSpanSentence2.
  ///
  /// In en, this message translates to:
  /// **'Ice is boiling hot.'**
  String get readingSpanSentence2;

  /// No description provided for @readingSpanSentence3.
  ///
  /// In en, this message translates to:
  /// **'Fish can breathe underwater.'**
  String get readingSpanSentence3;

  /// No description provided for @readingSpanSentence4.
  ///
  /// In en, this message translates to:
  /// **'Dogs have wings and can fly.'**
  String get readingSpanSentence4;

  /// No description provided for @readingSpanSentence5.
  ///
  /// In en, this message translates to:
  /// **'Water freezes at 0 degrees Celsius.'**
  String get readingSpanSentence5;

  /// No description provided for @readingSpanSentence6.
  ///
  /// In en, this message translates to:
  /// **'Cats bark like small dogs.'**
  String get readingSpanSentence6;

  /// No description provided for @readingSpanSentence7.
  ///
  /// In en, this message translates to:
  /// **'Trees have green leaves in summer.'**
  String get readingSpanSentence7;

  /// No description provided for @readingSpanSentence8.
  ///
  /// In en, this message translates to:
  /// **'Rain falls upwards from the ground.'**
  String get readingSpanSentence8;

  /// No description provided for @readingSpanSentence9.
  ///
  /// In en, this message translates to:
  /// **'A triangle has four equal sides.'**
  String get readingSpanSentence9;

  /// No description provided for @readingSpanSentence10.
  ///
  /// In en, this message translates to:
  /// **'Apples are a type of sweet fruit.'**
  String get readingSpanSentence10;

  /// No description provided for @readingSpanSentence11.
  ///
  /// In en, this message translates to:
  /// **'The moon is made of cheddar cheese.'**
  String get readingSpanSentence11;

  /// No description provided for @readingSpanSentence12.
  ///
  /// In en, this message translates to:
  /// **'Automobiles have wheels to roll.'**
  String get readingSpanSentence12;

  /// No description provided for @readingSpanSentence13.
  ///
  /// In en, this message translates to:
  /// **'Fire is freezing cold.'**
  String get readingSpanSentence13;

  /// No description provided for @readingSpanSentence14.
  ///
  /// In en, this message translates to:
  /// **'Paper is made from processed wood.'**
  String get readingSpanSentence14;

  /// No description provided for @readingSpanSentence15.
  ///
  /// In en, this message translates to:
  /// **'Birds have feathers to help them fly.'**
  String get readingSpanSentence15;

  /// No description provided for @readingSpanSentence16.
  ///
  /// In en, this message translates to:
  /// **'Bananas grow on pine trees.'**
  String get readingSpanSentence16;

  /// No description provided for @readingSpanSentence17.
  ///
  /// In en, this message translates to:
  /// **'An elephant is smaller than an ant.'**
  String get readingSpanSentence17;

  /// No description provided for @readingSpanSentence18.
  ///
  /// In en, this message translates to:
  /// **'Books contain printed pages of text.'**
  String get readingSpanSentence18;

  /// No description provided for @countingSpanTitle.
  ///
  /// In en, this message translates to:
  /// **'Counting Span'**
  String get countingSpanTitle;

  /// No description provided for @countingSpanSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Count blue circles only. Then recall the sequence of counts.'**
  String get countingSpanSubtitle;

  /// No description provided for @countingSpanWinTitle.
  ///
  /// In en, this message translates to:
  /// **'Counting Genius!'**
  String get countingSpanWinTitle;

  /// No description provided for @countingSpanGameOverMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {score} points in the Counting Span memory challenge!'**
  String countingSpanGameOverMessage(int score);

  /// No description provided for @countingSpanCountCircles.
  ///
  /// In en, this message translates to:
  /// **'Count only blue circles'**
  String get countingSpanCountCircles;

  /// No description provided for @countingSpanRecallCounts.
  ///
  /// In en, this message translates to:
  /// **'Recall counts in correct order'**
  String get countingSpanRecallCounts;

  /// No description provided for @countingSpanGreatJob.
  ///
  /// In en, this message translates to:
  /// **'Great job!'**
  String get countingSpanGreatJob;

  /// No description provided for @countingSpanTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again!'**
  String get countingSpanTryAgain;

  /// No description provided for @countingSpanYourSequence.
  ///
  /// In en, this message translates to:
  /// **'Your sequence: {sequence}'**
  String countingSpanYourSequence(String sequence);

  /// No description provided for @countingSpanLength.
  ///
  /// In en, this message translates to:
  /// **'Length'**
  String get countingSpanLength;

  /// No description provided for @objDispTitle.
  ///
  /// In en, this message translates to:
  /// **'Object Displacement'**
  String get objDispTitle;

  /// No description provided for @objDispSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Memorize layout. Find and tap the one object that shifts position.'**
  String get objDispSubtitle;

  /// No description provided for @objDispWinTitle.
  ///
  /// In en, this message translates to:
  /// **'Spatial Genius!'**
  String get objDispWinTitle;

  /// No description provided for @objDispGameOverMessage.
  ///
  /// In en, this message translates to:
  /// **'You correctly identified {score} displaced objects!'**
  String objDispGameOverMessage(int score);

  /// No description provided for @objDispMemorizeAll.
  ///
  /// In en, this message translates to:
  /// **'Memorize all placements'**
  String get objDispMemorizeAll;

  /// No description provided for @objDispWaitingShift.
  ///
  /// In en, this message translates to:
  /// **'Waiting for layout shift...'**
  String get objDispWaitingShift;

  /// No description provided for @objDispTapMoved.
  ///
  /// In en, this message translates to:
  /// **'Tap the object that moved'**
  String get objDispTapMoved;

  /// No description provided for @objDispExcellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent!'**
  String get objDispExcellent;

  /// No description provided for @objDispWrongObject.
  ///
  /// In en, this message translates to:
  /// **'Wrong object!'**
  String get objDispWrongObject;

  /// No description provided for @objDispItems.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get objDispItems;

  /// No description provided for @mandalaTitle.
  ///
  /// In en, this message translates to:
  /// **'Mandala Recall'**
  String get mandalaTitle;

  /// No description provided for @mandalaSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Memorize color configuration. Pick colors and repaint the tiles.'**
  String get mandalaSubtitle;

  /// No description provided for @mandalaWinTitle.
  ///
  /// In en, this message translates to:
  /// **'Mandala Artist!'**
  String get mandalaWinTitle;

  /// No description provided for @mandalaGameOverMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {score} points by recreating colored geometric layouts!'**
  String mandalaGameOverMessage(int score);

  /// No description provided for @mandalaMemorizeColors.
  ///
  /// In en, this message translates to:
  /// **'Memorize tile colors'**
  String get mandalaMemorizeColors;

  /// No description provided for @mandalaPaintCells.
  ///
  /// In en, this message translates to:
  /// **'Paint cells to match original'**
  String get mandalaPaintCells;

  /// No description provided for @mandalaExcellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent!'**
  String get mandalaExcellent;

  /// No description provided for @mandalaIncorrectMatch.
  ///
  /// In en, this message translates to:
  /// **'Incorrect match!'**
  String get mandalaIncorrectMatch;

  /// No description provided for @mandalaSubmitRepaint.
  ///
  /// In en, this message translates to:
  /// **'Submit Repaint'**
  String get mandalaSubmitRepaint;

  /// No description provided for @mandalaTiles.
  ///
  /// In en, this message translates to:
  /// **'Tiles'**
  String get mandalaTiles;

  /// No description provided for @runningSpanTitle.
  ///
  /// In en, this message translates to:
  /// **'Running Span'**
  String get runningSpanTitle;

  /// No description provided for @runningSpanSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Watch the letters. When they stop, input the last N letters in order.'**
  String get runningSpanSubtitle;

  /// No description provided for @runningSpanWinTitle.
  ///
  /// In en, this message translates to:
  /// **'Buffer Master!'**
  String get runningSpanWinTitle;

  /// No description provided for @runningSpanGameOverMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {score} points in Running Memory Span!'**
  String runningSpanGameOverMessage(int score);

  /// No description provided for @runningSpanPrepareRecall.
  ///
  /// In en, this message translates to:
  /// **'Prepare to recall last {count} letters'**
  String runningSpanPrepareRecall(int count);

  /// No description provided for @runningSpanWatchCarefully.
  ///
  /// In en, this message translates to:
  /// **'Watch carefully...'**
  String get runningSpanWatchCarefully;

  /// No description provided for @runningSpanEnterLast.
  ///
  /// In en, this message translates to:
  /// **'Enter last {count} letters'**
  String runningSpanEnterLast(int count);

  /// No description provided for @runningSpanGreatJob.
  ///
  /// In en, this message translates to:
  /// **'Great job!'**
  String get runningSpanGreatJob;

  /// No description provided for @runningSpanIncorrectBuffer.
  ///
  /// In en, this message translates to:
  /// **'Incorrect buffer!'**
  String get runningSpanIncorrectBuffer;

  /// No description provided for @runningSpanRecallLast.
  ///
  /// In en, this message translates to:
  /// **'Recall last {count}'**
  String runningSpanRecallLast(int count);

  /// No description provided for @runningSpanStopsRandomly.
  ///
  /// In en, this message translates to:
  /// **'The stream stops randomly!'**
  String get runningSpanStopsRandomly;

  /// No description provided for @runningSpanEntered.
  ///
  /// In en, this message translates to:
  /// **'Entered: {sequence}'**
  String runningSpanEntered(String sequence);

  /// No description provided for @runningSpanNItems.
  ///
  /// In en, this message translates to:
  /// **'N-Items'**
  String get runningSpanNItems;

  /// No description provided for @spatialCabinetTitle.
  ///
  /// In en, this message translates to:
  /// **'Spatial Cabinets'**
  String get spatialCabinetTitle;

  /// No description provided for @spatialCabinetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Memorize which cabinet drawer contains which object.'**
  String get spatialCabinetSubtitle;

  /// No description provided for @spatialCabinetWinTitle.
  ///
  /// In en, this message translates to:
  /// **'Cabinet Expert!'**
  String get spatialCabinetWinTitle;

  /// No description provided for @spatialCabinetGameOverMessage.
  ///
  /// In en, this message translates to:
  /// **'You scored {score} points in Spatial Cabinet Memory!'**
  String spatialCabinetGameOverMessage(int score);

  /// No description provided for @spatialCabinetMemorize.
  ///
  /// In en, this message translates to:
  /// **'Memorize item locations'**
  String get spatialCabinetMemorize;

  /// No description provided for @spatialCabinetWhereIs.
  ///
  /// In en, this message translates to:
  /// **'Where is the {itemName}?'**
  String spatialCabinetWhereIs(String itemName);

  /// No description provided for @spatialCabinetCorrect.
  ///
  /// In en, this message translates to:
  /// **'Correct!'**
  String get spatialCabinetCorrect;

  /// No description provided for @spatialCabinetWrongDrawer.
  ///
  /// In en, this message translates to:
  /// **'Wrong drawer!'**
  String get spatialCabinetWrongDrawer;

  /// No description provided for @spatialCabinetItems.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get spatialCabinetItems;

  /// No description provided for @cabinetItemKey.
  ///
  /// In en, this message translates to:
  /// **'Key'**
  String get cabinetItemKey;

  /// No description provided for @cabinetItemApple.
  ///
  /// In en, this message translates to:
  /// **'Apple'**
  String get cabinetItemApple;

  /// No description provided for @cabinetItemDiamond.
  ///
  /// In en, this message translates to:
  /// **'Diamond'**
  String get cabinetItemDiamond;

  /// No description provided for @cabinetItemBook.
  ///
  /// In en, this message translates to:
  /// **'Book'**
  String get cabinetItemBook;

  /// No description provided for @cabinetItemUmbrella.
  ///
  /// In en, this message translates to:
  /// **'Umbrella'**
  String get cabinetItemUmbrella;

  /// No description provided for @cabinetItemCoffee.
  ///
  /// In en, this message translates to:
  /// **'Coffee'**
  String get cabinetItemCoffee;

  /// No description provided for @cabinetItemLock.
  ///
  /// In en, this message translates to:
  /// **'Lock'**
  String get cabinetItemLock;

  /// No description provided for @cabinetItemPet.
  ///
  /// In en, this message translates to:
  /// **'Pet'**
  String get cabinetItemPet;

  /// No description provided for @cabinetItemCar.
  ///
  /// In en, this message translates to:
  /// **'Car'**
  String get cabinetItemCar;

  /// No description provided for @gamesTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'GAMES'**
  String get gamesTitleLabel;

  /// No description provided for @yourFavorites.
  ///
  /// In en, this message translates to:
  /// **'YOUR FAVORITES'**
  String get yourFavorites;

  /// No description provided for @readyForWorkout.
  ///
  /// In en, this message translates to:
  /// **'READY FOR YOUR DAILY WORKOUT?'**
  String get readyForWorkout;

  /// No description provided for @greatStartKeepGoing.
  ///
  /// In en, this message translates to:
  /// **'GREAT START! KEEP GOING.'**
  String get greatStartKeepGoing;

  /// No description provided for @onFireToday.
  ///
  /// In en, this message translates to:
  /// **'YOU\'RE ON FIRE TODAY!'**
  String get onFireToday;

  /// No description provided for @incredibleSolvingToday.
  ///
  /// In en, this message translates to:
  /// **'INCREDIBLE SOLVING TODAY!'**
  String get incredibleSolvingToday;

  /// No description provided for @newGameLabel.
  ///
  /// In en, this message translates to:
  /// **'NEW'**
  String get newGameLabel;

  /// No description provided for @slitherlinkTitle.
  ///
  /// In en, this message translates to:
  /// **'Slitherlink'**
  String get slitherlinkTitle;

  /// No description provided for @slitherlinkSubtitle.
  ///
  /// In en, this message translates to:
  /// **'LOOP THE PIN GRID USING NUMBER CLUES.'**
  String get slitherlinkSubtitle;

  /// No description provided for @futoshikiTitle.
  ///
  /// In en, this message translates to:
  /// **'Futoshiki'**
  String get futoshikiTitle;

  /// No description provided for @futoshikiSubtitle.
  ///
  /// In en, this message translates to:
  /// **'FILL GRIDS WITH GREATER-THAN CLUES.'**
  String get futoshikiSubtitle;

  /// No description provided for @kakuroTitle.
  ///
  /// In en, this message translates to:
  /// **'Kakuro'**
  String get kakuroTitle;

  /// No description provided for @kakuroSubtitle.
  ///
  /// In en, this message translates to:
  /// **'SOLVE CROSSWORDS WITH NUMBERS AND SUMS.'**
  String get kakuroSubtitle;

  /// No description provided for @inequalityDashTitle.
  ///
  /// In en, this message translates to:
  /// **'Inequality Dash'**
  String get inequalityDashTitle;

  /// No description provided for @inequalityDashSubtitle.
  ///
  /// In en, this message translates to:
  /// **'SOLVE INEQUALITIES UNDER TIME PRESSURE.'**
  String get inequalityDashSubtitle;

  /// No description provided for @factorFinderTitle.
  ///
  /// In en, this message translates to:
  /// **'Factor Finder'**
  String get factorFinderTitle;

  /// No description provided for @factorFinderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'IDENTIFY ALL FACTORS OF TARGET NUMBERS.'**
  String get factorFinderSubtitle;

  /// No description provided for @collatzTitle.
  ///
  /// In en, this message translates to:
  /// **'Collatz Path'**
  String get collatzTitle;

  /// No description provided for @collatzSubtitle.
  ///
  /// In en, this message translates to:
  /// **'NAVIGATE THE 3N+1 SEQUENCE.'**
  String get collatzSubtitle;

  /// No description provided for @sumPyramidTitle.
  ///
  /// In en, this message translates to:
  /// **'Sum Pyramid'**
  String get sumPyramidTitle;

  /// No description provided for @sumPyramidSubtitle.
  ///
  /// In en, this message translates to:
  /// **'FILL PYRAMID CELLS WITH SUM MATH CLUES.'**
  String get sumPyramidSubtitle;

  /// No description provided for @target10Title.
  ///
  /// In en, this message translates to:
  /// **'Target 10'**
  String get target10Title;

  /// No description provided for @target10Subtitle.
  ///
  /// In en, this message translates to:
  /// **'COMBINE NUMBER TILES TO REAP TEN SUMS.'**
  String get target10Subtitle;

  /// No description provided for @fractionMatcherTitle.
  ///
  /// In en, this message translates to:
  /// **'Fraction Matcher'**
  String get fractionMatcherTitle;

  /// No description provided for @fractionMatcherSubtitle.
  ///
  /// In en, this message translates to:
  /// **'MATCH EQUIVALENT FRACTIONS VISUALLY.'**
  String get fractionMatcherSubtitle;

  /// No description provided for @dualCodingTitle.
  ///
  /// In en, this message translates to:
  /// **'Dual Coding'**
  String get dualCodingTitle;

  /// No description provided for @dualCodingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'MATCH LETTERS AND SYMBOLS CONCURRENTLY.'**
  String get dualCodingSubtitle;

  /// No description provided for @distractorMatrixTitle.
  ///
  /// In en, this message translates to:
  /// **'Distractor Matrix'**
  String get distractorMatrixTitle;

  /// No description provided for @distractorMatrixSubtitle.
  ///
  /// In en, this message translates to:
  /// **'FIND TARGET SHAPES AMID DISTRACTORS.'**
  String get distractorMatrixSubtitle;

  /// No description provided for @temporalOrderTitle.
  ///
  /// In en, this message translates to:
  /// **'Temporal Order'**
  String get temporalOrderTitle;

  /// No description provided for @temporalOrderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'RECALL THE CHRONOLOGICAL SEQUENCE.'**
  String get temporalOrderSubtitle;

  /// No description provided for @associativePairsTitle.
  ///
  /// In en, this message translates to:
  /// **'Associative Pairs'**
  String get associativePairsTitle;

  /// No description provided for @associativePairsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'PAIR AND MATCH CORRESPONDING SYMBOLS.'**
  String get associativePairsSubtitle;

  /// No description provided for @blockCount3dTitle.
  ///
  /// In en, this message translates to:
  /// **'3D Block Count'**
  String get blockCount3dTitle;

  /// No description provided for @blockCount3dSubtitle.
  ///
  /// In en, this message translates to:
  /// **'COUNT BLOCKS IN THREE-DIMENSIONAL SPACE.'**
  String get blockCount3dSubtitle;

  /// No description provided for @rotatingMazeTitle.
  ///
  /// In en, this message translates to:
  /// **'Rotating Maze'**
  String get rotatingMazeTitle;

  /// No description provided for @rotatingMazeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'ROTATE MAZES TO GUIDE BALLS TO THE EXIT.'**
  String get rotatingMazeSubtitle;

  /// No description provided for @silhouetteMatchOrthoTitle.
  ///
  /// In en, this message translates to:
  /// **'Silhouette Match'**
  String get silhouetteMatchOrthoTitle;

  /// No description provided for @silhouetteMatchOrthoSubtitle.
  ///
  /// In en, this message translates to:
  /// **'MATCH 3D OBJECTS WITH ORTHO SHADOWS.'**
  String get silhouetteMatchOrthoSubtitle;

  /// No description provided for @spatialConflictTitle.
  ///
  /// In en, this message translates to:
  /// **'Spatial Conflict'**
  String get spatialConflictTitle;

  /// No description provided for @spatialConflictSubtitle.
  ///
  /// In en, this message translates to:
  /// **'RESOLVE TEXT AND DIRECTION DISCREPANCIES.'**
  String get spatialConflictSubtitle;

  /// No description provided for @spotlightTrackTitle.
  ///
  /// In en, this message translates to:
  /// **'Spotlight Track'**
  String get spotlightTrackTitle;

  /// No description provided for @spotlightTrackSubtitle.
  ///
  /// In en, this message translates to:
  /// **'TRACK BLINKING ITEMS IN MOVING SHADOWS.'**
  String get spotlightTrackSubtitle;

  /// No description provided for @d2AttentionTitle.
  ///
  /// In en, this message translates to:
  /// **'d2 Attention'**
  String get d2AttentionTitle;

  /// No description provided for @d2AttentionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'TAP TARGET SYMBOLS WITH STRICT CRITERIA.'**
  String get d2AttentionSubtitle;

  /// No description provided for @dualMirrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Dual Mirror Nav'**
  String get dualMirrorTitle;

  /// No description provided for @dualMirrorSubtitle.
  ///
  /// In en, this message translates to:
  /// **'NAVIGATE TWO MAZES AT ONCE.'**
  String get dualMirrorSubtitle;

  /// No description provided for @contextCluesTitle.
  ///
  /// In en, this message translates to:
  /// **'Context Clues'**
  String get contextCluesTitle;

  /// No description provided for @contextCluesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'INFER HIDDEN WORDS FROM CONTEXT HINTS.'**
  String get contextCluesSubtitle;

  /// No description provided for @digitSpanReverseSubtitle.
  ///
  /// In en, this message translates to:
  /// **'RECALL NUMBER DIGITS IN REVERSE ORDER.'**
  String get digitSpanReverseSubtitle;

  /// No description provided for @faceNameAssociationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'RECALL NAMES FOR DIVERSE PRESENTED FACES.'**
  String get faceNameAssociationSubtitle;

  /// No description provided for @staircaseMemorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'MEMORIZE BLOCKS IN STEPWISE SEQUENCE.'**
  String get staircaseMemorySubtitle;

  /// No description provided for @choiceReactionTimeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'TAP SPECIFIC BUTTONS MATCHING CUES FAST.'**
  String get choiceReactionTimeSubtitle;

  /// No description provided for @attentionalBlinkSubtitle.
  ///
  /// In en, this message translates to:
  /// **'SPARK RAPID TARGETS FLASHING IN STREAMS.'**
  String get attentionalBlinkSubtitle;

  /// No description provided for @visualStatisticalLearningSubtitle.
  ///
  /// In en, this message translates to:
  /// **'LEARN TEMPORAL SHAPE PATTERNS VISUALLY.'**
  String get visualStatisticalLearningSubtitle;

  /// No description provided for @sternbergTaskSubtitle.
  ///
  /// In en, this message translates to:
  /// **'RECALL IF SYMBOL WAS IN THE MEMORY SET.'**
  String get sternbergTaskSubtitle;

  /// No description provided for @operationSpanSubtitle.
  ///
  /// In en, this message translates to:
  /// **'SOLVE MATH AND RECALL ALPHABET STRINGS.'**
  String get operationSpanSubtitle;

  /// No description provided for @continuousRecognitionTitle.
  ///
  /// In en, this message translates to:
  /// **'Continuous Recog'**
  String get continuousRecognitionTitle;

  /// No description provided for @continuousRecognitionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'IDENTIFY IF THE CARD PRESENTED IS OLD OR NEW.'**
  String get continuousRecognitionSubtitle;

  /// No description provided for @symmetrySpanTitle.
  ///
  /// In en, this message translates to:
  /// **'Symmetry Span'**
  String get symmetrySpanTitle;

  /// No description provided for @symmetrySpanSubtitle.
  ///
  /// In en, this message translates to:
  /// **'RECALL CELL COORDINATES AMID VERTICAL SYMMETRY DECISIONS.'**
  String get symmetrySpanSubtitle;

  /// No description provided for @objectDisplacementTitle.
  ///
  /// In en, this message translates to:
  /// **'Object Displacement'**
  String get objectDisplacementTitle;

  /// No description provided for @objectDisplacementSubtitle.
  ///
  /// In en, this message translates to:
  /// **'STUDY PLACEMENTS AND TAP THE SINGLE OBJECT THAT MOVED.'**
  String get objectDisplacementSubtitle;

  /// No description provided for @mandalaRecallTitle.
  ///
  /// In en, this message translates to:
  /// **'Mandala Recall'**
  String get mandalaRecallTitle;

  /// No description provided for @mandalaRecallSubtitle.
  ///
  /// In en, this message translates to:
  /// **'MEMORIZE COLOR TILES AND REPAINT MANDALAS FROM PALETTE.'**
  String get mandalaRecallSubtitle;

  /// No description provided for @runningMemorySpanTitle.
  ///
  /// In en, this message translates to:
  /// **'Running Span'**
  String get runningMemorySpanTitle;

  /// No description provided for @runningMemorySpanSubtitle.
  ///
  /// In en, this message translates to:
  /// **'MONITOR RUNNING LETTERS AND RECALL THE LAST N ITEMS.'**
  String get runningMemorySpanSubtitle;

  /// No description provided for @spatialCabinetMemoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Spatial Cabinets'**
  String get spatialCabinetMemoryTitle;

  /// No description provided for @spatialCabinetMemorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'MEMORIZE AND LOCATE ITEMS BEHIND CABINET DOORS.'**
  String get spatialCabinetMemorySubtitle;

  /// No description provided for @pathRecallSubtitle.
  ///
  /// In en, this message translates to:
  /// **'MEMORIZE AND REPEAT PATHWAY SELECTIONS.'**
  String get pathRecallSubtitle;

  /// No description provided for @objectShuffleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'TRACK ITEMS SHUFFLED UNDER DEEP CUPS.'**
  String get objectShuffleSubtitle;

  /// No description provided for @groceryListSubtitle.
  ///
  /// In en, this message translates to:
  /// **'MEMORIZE AND CHECK OFF ITEMS ON THE LIST.'**
  String get groceryListSubtitle;

  /// No description provided for @quickMathSubtitle.
  ///
  /// In en, this message translates to:
  /// **'SOLVE ARITHMETIC QUESTIONS AT TOP SPEED.'**
  String get quickMathSubtitle;

  /// No description provided for @mathGuessTitle.
  ///
  /// In en, this message translates to:
  /// **'Math Guess'**
  String get mathGuessTitle;

  /// No description provided for @mathGuessSubtitle.
  ///
  /// In en, this message translates to:
  /// **'GUESS THE HIDDEN NUMBER WITHIN 15 CHANCES.'**
  String get mathGuessSubtitle;

  /// No description provided for @reflexTapSubtitle.
  ///
  /// In en, this message translates to:
  /// **'TAP STIMULI AS FAST AS HUMANLY POSSIBLE.'**
  String get reflexTapSubtitle;

  /// No description provided for @pixelMimicSubtitle.
  ///
  /// In en, this message translates to:
  /// **'MIMIC DESIGN PATTERNS ON PIXEL GRIDS.'**
  String get pixelMimicSubtitle;

  /// No description provided for @simonSequenceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'REPEAT SHAPE SEQUENCES FROM MEMORY.'**
  String get simonSequenceSubtitle;

  /// No description provided for @slidePuzzleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'REARRANGE SQUARE SLIDING GRID TILES.'**
  String get slidePuzzleSubtitle;

  /// No description provided for @findWordTitle.
  ///
  /// In en, this message translates to:
  /// **'Find Word'**
  String get findWordTitle;

  /// No description provided for @schulteTableSubtitle.
  ///
  /// In en, this message translates to:
  /// **'TAP NUMBERS FROM ONE TO TWENTY-FIVE.'**
  String get schulteTableSubtitle;

  /// No description provided for @simonCommandTitle.
  ///
  /// In en, this message translates to:
  /// **'Simon Command'**
  String get simonCommandTitle;

  /// No description provided for @simonCommandSubtitle.
  ///
  /// In en, this message translates to:
  /// **'PERFORM VOICE INSTRUCTIONS QUICKLY.'**
  String get simonCommandSubtitle;

  /// No description provided for @binaryCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'Binary Speed'**
  String get binaryCodeTitle;

  /// No description provided for @binaryCodeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'TRANSLATE BINARY CODES INTO DECIMAL.'**
  String get binaryCodeSubtitle;

  /// No description provided for @moduloClockTitle.
  ///
  /// In en, this message translates to:
  /// **'Modulo Clock'**
  String get moduloClockTitle;

  /// No description provided for @moduloClockSubtitle.
  ///
  /// In en, this message translates to:
  /// **'CALCULATE MATH EQUATIONS USING CLOCKS.'**
  String get moduloClockSubtitle;

  /// No description provided for @chimpTestTitle.
  ///
  /// In en, this message translates to:
  /// **'Chimp Test'**
  String get chimpTestTitle;

  /// No description provided for @chimpTestSubtitle.
  ///
  /// In en, this message translates to:
  /// **'TAP RANDOM NUMBERS IN ASCENDING ORDER.'**
  String get chimpTestSubtitle;

  /// No description provided for @relationalMemoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Relational Memory'**
  String get relationalMemoryTitle;

  /// No description provided for @relationalMemorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'RECALL THE EXACT GRID ITEM POSITIONS.'**
  String get relationalMemorySubtitle;

  /// No description provided for @factBinderTitle.
  ///
  /// In en, this message translates to:
  /// **'Fact Binder'**
  String get factBinderTitle;

  /// No description provided for @factBinderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'CONNECT SYMBOLS AND RECALL STATEMENTS.'**
  String get factBinderSubtitle;

  /// No description provided for @sourceMonitoringTitle.
  ///
  /// In en, this message translates to:
  /// **'Source Monitoring'**
  String get sourceMonitoringTitle;

  /// No description provided for @sourceMonitoringSubtitle.
  ///
  /// In en, this message translates to:
  /// **'REMEMBER THE CONTEXT.'**
  String get sourceMonitoringSubtitle;

  /// No description provided for @klotskiTitle.
  ///
  /// In en, this message translates to:
  /// **'Klotski Escape'**
  String get klotskiTitle;

  /// No description provided for @klotskiSubtitle.
  ///
  /// In en, this message translates to:
  /// **'SLIDE BLOCKS TO REACH THE EXITS.'**
  String get klotskiSubtitle;

  /// No description provided for @homophoneHuntSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the correctly spelled homophone'**
  String get homophoneHuntSubtitle;

  /// No description provided for @laserLinkTitle.
  ///
  /// In en, this message translates to:
  /// **'Laser Link'**
  String get laserLinkTitle;

  /// No description provided for @laserLinkSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Rotate mirrors to reflect lasers and power up all the targets.'**
  String get laserLinkSubtitle;

  /// No description provided for @laserLinkCongrats.
  ///
  /// In en, this message translates to:
  /// **'Precision reflection! You\'ve successfully powered the entire grid.'**
  String get laserLinkCongrats;

  /// No description provided for @crossSectionSliceTitle.
  ///
  /// In en, this message translates to:
  /// **'Cross-Section Slice'**
  String get crossSectionSliceTitle;

  /// No description provided for @crossSectionSliceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify the correct 2D cross-section of a 3D object from a specific angle.'**
  String get crossSectionSliceSubtitle;

  /// No description provided for @crossSectionSliceCongrats.
  ///
  /// In en, this message translates to:
  /// **'Incredible 3D visualization! You saw right through that shape.'**
  String get crossSectionSliceCongrats;

  /// No description provided for @shadowPivotTitle.
  ///
  /// In en, this message translates to:
  /// **'Shadow Pivot'**
  String get shadowPivotTitle;

  /// No description provided for @shadowPivotCongrats.
  ///
  /// In en, this message translates to:
  /// **'Dynamic spatial reasoning! You mastered the light and shadow.'**
  String get shadowPivotCongrats;

  /// No description provided for @shadowPivotSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Predict the shadow cast by a 3D object as it rotates on different axes.'**
  String get shadowPivotSubtitle;

  /// No description provided for @interlockPuzzleTitle.
  ///
  /// In en, this message translates to:
  /// **'Interlock Puzzle'**
  String get interlockPuzzleTitle;

  /// No description provided for @interlockPuzzleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Disassemble or assemble complex interlocking blocks in the correct sequence.'**
  String get interlockPuzzleSubtitle;

  /// No description provided for @interlockPuzzleCongrats.
  ///
  /// In en, this message translates to:
  /// **'Logical deconstruction! You\'ve unraveled the puzzle perfectly.'**
  String get interlockPuzzleCongrats;

  /// No description provided for @pathIntersectTitle.
  ///
  /// In en, this message translates to:
  /// **'Path Intersect'**
  String get pathIntersectTitle;

  /// No description provided for @pathIntersectSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Navigate multiple paths simultaneously to reach their respective targets without collision.'**
  String get pathIntersectSubtitle;

  /// No description provided for @pathIntersectCongrats.
  ///
  /// In en, this message translates to:
  /// **'Synchronized navigation! You\'ve reached all targets flawlessly.'**
  String get pathIntersectCongrats;

  /// No description provided for @negativeSpaceDetectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Negative Space'**
  String get negativeSpaceDetectionTitle;

  /// No description provided for @negativeSpaceDetectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify the shape formed by the empty space between objects.'**
  String get negativeSpaceDetectionSubtitle;

  /// No description provided for @negativeSpaceDetectionCongrats.
  ///
  /// In en, this message translates to:
  /// **'Keen perception! You\'ve mastered the art of seeing what\'s not there.'**
  String get negativeSpaceDetectionCongrats;

  /// No description provided for @compassMazeTitle.
  ///
  /// In en, this message translates to:
  /// **'Compass Maze'**
  String get compassMazeTitle;

  /// No description provided for @compassMazeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Navigate a maze where movement directions change based on your compass orientation.'**
  String get compassMazeSubtitle;

  /// No description provided for @compassMazeCongrats.
  ///
  /// In en, this message translates to:
  /// **'Expert navigation! You\'ve found the exit through the shifting directions.'**
  String get compassMazeCongrats;

  /// No description provided for @complexFoldingNetsTitle.
  ///
  /// In en, this message translates to:
  /// **'Folding Nets'**
  String get complexFoldingNetsTitle;

  /// No description provided for @complexFoldingNetsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Determine which complex 3D shape will be formed by folding a non-standard 2D net.'**
  String get complexFoldingNetsSubtitle;

  /// No description provided for @complexFoldingNetsCongrats.
  ///
  /// In en, this message translates to:
  /// **'Advanced folding logic! You\'ve successfully visualized the 3D form.'**
  String get complexFoldingNetsCongrats;

  /// No description provided for @compassMazeMessage.
  ///
  /// In en, this message translates to:
  /// **'Navigate the maze using the compass.'**
  String get compassMazeMessage;

  /// No description provided for @negativeSpaceDetectionMessage.
  ///
  /// In en, this message translates to:
  /// **'Identify the hidden object in the space.'**
  String get negativeSpaceDetectionMessage;

  /// No description provided for @shikakuTitle.
  ///
  /// In en, this message translates to:
  /// **'Shikaku'**
  String get shikakuTitle;

  /// No description provided for @shikakuSubtitle.
  ///
  /// In en, this message translates to:
  /// **'DIVIDE THE GRID INTO SQUARES AND RECTANGLES MATCHING THE NUMBERS.'**
  String get shikakuSubtitle;

  /// No description provided for @countdownMathTitle.
  ///
  /// In en, this message translates to:
  /// **'Countdown Math'**
  String get countdownMathTitle;

  /// No description provided for @countdownMathSubtitle.
  ///
  /// In en, this message translates to:
  /// **'COMBINE RANDOM NUMBERS TO CALCULATE THE THREE-DIGIT TARGET.'**
  String get countdownMathSubtitle;

  /// No description provided for @narrativeRecallTitle.
  ///
  /// In en, this message translates to:
  /// **'Narrative Recall'**
  String get narrativeRecallTitle;

  /// No description provided for @narrativeRecallSubtitle.
  ///
  /// In en, this message translates to:
  /// **'READ A STORY AND RECALL SPECIFIC QUANTITATIVE AND FACTUAL DETAILS.'**
  String get narrativeRecallSubtitle;

  /// No description provided for @shellGameTitle.
  ///
  /// In en, this message translates to:
  /// **'Shell Game'**
  String get shellGameTitle;

  /// No description provided for @shellGameSubtitle.
  ///
  /// In en, this message translates to:
  /// **'TRACK A HIDDEN BALL AS THE SHUFFLING CUPS SWAP PLACES.'**
  String get shellGameSubtitle;

  /// No description provided for @typoglycemiaDecoderTitle.
  ///
  /// In en, this message translates to:
  /// **'Typoglycemia Decoder'**
  String get typoglycemiaDecoderTitle;

  /// No description provided for @typoglycemiaDecoderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'UNSCRAMBLE AND READ JUMBLED SENTENCES SPEEDILY.'**
  String get typoglycemiaDecoderSubtitle;

  /// No description provided for @shapeShifterTitle.
  ///
  /// In en, this message translates to:
  /// **'Shape Shifter'**
  String get shapeShifterTitle;

  /// No description provided for @shapeShifterSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap the target shape-color combination.'**
  String get shapeShifterSubtitle;

  /// No description provided for @gokigenNanameTitle.
  ///
  /// In en, this message translates to:
  /// **'Gokigen Naname'**
  String get gokigenNanameTitle;

  /// No description provided for @gokigenNanameSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Draw diagonals to connect points without loops.'**
  String get gokigenNanameSubtitle;

  /// No description provided for @matrixMultiplierTitle.
  ///
  /// In en, this message translates to:
  /// **'Matrix Multiplier'**
  String get matrixMultiplierTitle;

  /// No description provided for @matrixMultiplierSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select a row and column to multiply to the target.'**
  String get matrixMultiplierSubtitle;

  /// No description provided for @wordAssociationRecallTitle.
  ///
  /// In en, this message translates to:
  /// **'Word Association'**
  String get wordAssociationRecallTitle;

  /// No description provided for @wordAssociationRecallSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Recall paired word associations from memory.'**
  String get wordAssociationRecallSubtitle;

  /// No description provided for @gearRotationTitle.
  ///
  /// In en, this message translates to:
  /// **'Gear Rotation'**
  String get gearRotationTitle;

  /// No description provided for @gearRotationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Predict the rotation direction of the last gear.'**
  String get gearRotationSubtitle;

  /// No description provided for @wordWheelTitle.
  ///
  /// In en, this message translates to:
  /// **'Word Wheel'**
  String get wordWheelTitle;

  /// No description provided for @wordWheelSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Make words using letters on the wheel, including the center letter.'**
  String get wordWheelSubtitle;

  /// No description provided for @oddEvenFlashTitle.
  ///
  /// In en, this message translates to:
  /// **'Odd-Even Flash'**
  String get oddEvenFlashTitle;

  /// No description provided for @oddEvenFlashSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Quickly match the number parity with the color rule.'**
  String get oddEvenFlashSubtitle;

  /// No description provided for @norinoriTitle.
  ///
  /// In en, this message translates to:
  /// **'Norinori'**
  String get norinoriTitle;

  /// No description provided for @norinoriSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Shade exactly two connected cells in each room.'**
  String get norinoriSubtitle;

  /// No description provided for @algebraicBalanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Algebraic Balance'**
  String get algebraicBalanceTitle;

  /// No description provided for @algebraicBalanceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Solve the equations to find the target sum.'**
  String get algebraicBalanceSubtitle;

  /// No description provided for @patternSequenceDrawTitle.
  ///
  /// In en, this message translates to:
  /// **'Pattern Recall'**
  String get patternSequenceDrawTitle;

  /// No description provided for @patternSequenceDrawSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Repeat the animated path sequence on the grid.'**
  String get patternSequenceDrawSubtitle;

  /// No description provided for @tangramTitle.
  ///
  /// In en, this message translates to:
  /// **'Tangram Puzzle'**
  String get tangramTitle;

  /// No description provided for @tangramSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Arrange the shapes to fill the target silhouette.'**
  String get tangramSubtitle;

  /// No description provided for @semanticAssociationTitle.
  ///
  /// In en, this message translates to:
  /// **'Association Word'**
  String get semanticAssociationTitle;

  /// No description provided for @semanticAssociationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find the word connecting all three clues.'**
  String get semanticAssociationSubtitle;

  /// No description provided for @peripheralFocusTitle.
  ///
  /// In en, this message translates to:
  /// **'Peripheral Focus'**
  String get peripheralFocusTitle;

  /// No description provided for @peripheralFocusSubtitle.
  ///
  /// In en, this message translates to:
  /// **'React to flashing side panels while solving math.'**
  String get peripheralFocusSubtitle;

  /// No description provided for @masyuTitle.
  ///
  /// In en, this message translates to:
  /// **'Masyu Loop'**
  String get masyuTitle;

  /// No description provided for @masyuSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Draw a single loop matching Masyu circle rules.'**
  String get masyuSubtitle;

  /// No description provided for @mathMazeTitle.
  ///
  /// In en, this message translates to:
  /// **'Math Maze'**
  String get mathMazeTitle;

  /// No description provided for @mathMazeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Trace a path that evaluates to the target total.'**
  String get mathMazeSubtitle;

  /// No description provided for @storyBuilderTitle.
  ///
  /// In en, this message translates to:
  /// **'Story Builder'**
  String get storyBuilderTitle;

  /// No description provided for @storyBuilderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Reconstruct the chronological sequence of the story.'**
  String get storyBuilderSubtitle;

  /// No description provided for @mirrorMazeTitle.
  ///
  /// In en, this message translates to:
  /// **'Mirror Maze'**
  String get mirrorMazeTitle;

  /// No description provided for @mirrorMazeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Redirect a laser beam using diagonal mirrors.'**
  String get mirrorMazeSubtitle;

  /// No description provided for @wordGridConnectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Word Connections'**
  String get wordGridConnectionTitle;

  /// No description provided for @wordGridConnectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Group 16 words into four categories of four.'**
  String get wordGridConnectionSubtitle;

  /// No description provided for @shapeShifterPeripheralTitle.
  ///
  /// In en, this message translates to:
  /// **'Peripheral Shapes'**
  String get shapeShifterPeripheralTitle;

  /// No description provided for @shapeShifterPeripheralSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Track peripheral shape changes while matching central values.'**
  String get shapeShifterPeripheralSubtitle;

  /// No description provided for @soundWaveMatchTitle.
  ///
  /// In en, this message translates to:
  /// **'Sound Wave Match'**
  String get soundWaveMatchTitle;

  /// No description provided for @soundWaveMatchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap when the visual wave frequency aligns with pitch changes.'**
  String get soundWaveMatchSubtitle;

  /// No description provided for @multiTrackCounterTitle.
  ///
  /// In en, this message translates to:
  /// **'Multi-Track Counter'**
  String get multiTrackCounterTitle;

  /// No description provided for @multiTrackCounterSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap when any counter increments to a target multiplier.'**
  String get multiTrackCounterSubtitle;

  /// No description provided for @colorWordMatchUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Color Match-Up'**
  String get colorWordMatchUpTitle;

  /// No description provided for @colorWordMatchUpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Determine if two colored words match based on changing rules.'**
  String get colorWordMatchUpSubtitle;

  /// No description provided for @signalAndNoiseTitle.
  ///
  /// In en, this message translates to:
  /// **'Signal & Noise'**
  String get signalAndNoiseTitle;

  /// No description provided for @signalAndNoiseSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Locate target alphanumeric characters hidden in static noise.'**
  String get signalAndNoiseSubtitle;

  /// No description provided for @focusTunnelTitle.
  ///
  /// In en, this message translates to:
  /// **'Focus Tunnel'**
  String get focusTunnelTitle;

  /// No description provided for @focusTunnelSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify matching symbols appearing on moving tunnel walls.'**
  String get focusTunnelSubtitle;

  /// No description provided for @targetPursuerTitle.
  ///
  /// In en, this message translates to:
  /// **'Target Pursuer'**
  String get targetPursuerTitle;

  /// No description provided for @targetPursuerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Track multiple overlapping circles and select the original target.'**
  String get targetPursuerSubtitle;

  /// No description provided for @gridGazeTitle.
  ///
  /// In en, this message translates to:
  /// **'Grid Gaze'**
  String get gridGazeTitle;

  /// No description provided for @gridGazeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify which grid cell flashed with a different duration.'**
  String get gridGazeSubtitle;

  /// No description provided for @doubleTroubleTitle.
  ///
  /// In en, this message translates to:
  /// **'Double Trouble'**
  String get doubleTroubleTitle;

  /// No description provided for @doubleTroubleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Play two separate simple games simultaneously on split-screen.'**
  String get doubleTroubleSubtitle;

  /// No description provided for @syncRhythmTitle.
  ///
  /// In en, this message translates to:
  /// **'Sync Rhythm'**
  String get syncRhythmTitle;

  /// No description provided for @syncRhythmSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap when visual metronome sweep matches syncopated beat.'**
  String get syncRhythmSubtitle;

  /// No description provided for @ghostTapTitle.
  ///
  /// In en, this message translates to:
  /// **'Ghost Tap'**
  String get ghostTapTitle;

  /// No description provided for @ghostTapSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap when the invisible pulse reaches its maximum height.'**
  String get ghostTapSubtitle;

  /// No description provided for @attentionalRsvpTitle.
  ///
  /// In en, this message translates to:
  /// **'Attentional RSVP'**
  String get attentionalRsvpTitle;

  /// No description provided for @attentionalRsvpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify digits appearing in rapid serial letter flash.'**
  String get attentionalRsvpSubtitle;

  /// No description provided for @colorMazeNavTitle.
  ///
  /// In en, this message translates to:
  /// **'Color Maze Nav'**
  String get colorMazeNavTitle;

  /// No description provided for @colorMazeNavSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Navigate maze tiles matching dynamic permission colors.'**
  String get colorMazeNavSubtitle;

  /// No description provided for @dynamicSalienceTitle.
  ///
  /// In en, this message translates to:
  /// **'Dynamic Salience'**
  String get dynamicSalienceTitle;

  /// No description provided for @dynamicSalienceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find the shape moving with slightly different dynamics.'**
  String get dynamicSalienceSubtitle;

  /// No description provided for @chalkAndTalkTitle.
  ///
  /// In en, this message translates to:
  /// **'Chalk & Talk'**
  String get chalkAndTalkTitle;

  /// No description provided for @chalkAndTalkSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Type words heard in audio while ignoring visual distractors.'**
  String get chalkAndTalkSubtitle;

  /// No description provided for @blinkDetectorTitle.
  ///
  /// In en, this message translates to:
  /// **'Blink Detector'**
  String get blinkDetectorTitle;

  /// No description provided for @blinkDetectorSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap the grid face that blinks twice in rapid succession.'**
  String get blinkDetectorSubtitle;

  /// No description provided for @frequencyTapTitle.
  ///
  /// In en, this message translates to:
  /// **'Frequency Tap'**
  String get frequencyTapTitle;

  /// No description provided for @frequencyTapSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap the button matching the target light pulse frequency.'**
  String get frequencyTapSubtitle;

  /// No description provided for @yajilinTitle.
  ///
  /// In en, this message translates to:
  /// **'Yajilin Loop'**
  String get yajilinTitle;

  /// No description provided for @yajilinSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Place black cells and draw a single loop matching clues.'**
  String get yajilinSubtitle;

  /// No description provided for @heyawakeTitle.
  ///
  /// In en, this message translates to:
  /// **'Heyawake Grid'**
  String get heyawakeTitle;

  /// No description provided for @heyawakeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Shade grid rooms without adjacent black cells.'**
  String get heyawakeSubtitle;

  /// No description provided for @gokigenVariantTitle.
  ///
  /// In en, this message translates to:
  /// **'Gokigen Variant'**
  String get gokigenVariantTitle;

  /// No description provided for @gokigenVariantSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Draw loop-free diagonals meeting vertex counts.'**
  String get gokigenVariantSubtitle;

  /// No description provided for @sheepAndWolvesTitle.
  ///
  /// In en, this message translates to:
  /// **'Sheep & Wolves'**
  String get sheepAndWolvesTitle;

  /// No description provided for @sheepAndWolvesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Draw a loop separating sheep from wolves.'**
  String get sheepAndWolvesSubtitle;

  /// No description provided for @islandNurikabeTitle.
  ///
  /// In en, this message translates to:
  /// **'Island Nurikabe'**
  String get islandNurikabeTitle;

  /// No description provided for @islandNurikabeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Form islands matching numerical size constraints.'**
  String get islandNurikabeSubtitle;

  /// No description provided for @shakashakaTitle.
  ///
  /// In en, this message translates to:
  /// **'Shakashaka Rects'**
  String get shakashakaTitle;

  /// No description provided for @shakashakaSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Place triangular tiles to form rectangular white areas.'**
  String get shakashakaSubtitle;

  /// No description provided for @litsTetrisTitle.
  ///
  /// In en, this message translates to:
  /// **'LITS Tetromino'**
  String get litsTetrisTitle;

  /// No description provided for @litsTetrisSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Place tetrominoes in rooms with no adjacent duplicates.'**
  String get litsTetrisSubtitle;

  /// No description provided for @tapaWallTitle.
  ///
  /// In en, this message translates to:
  /// **'Tapa Wall'**
  String get tapaWallTitle;

  /// No description provided for @tapaWallSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Shade cells to form a continuous black wall pattern.'**
  String get tapaWallSubtitle;

  /// No description provided for @triangularBridgesTitle.
  ///
  /// In en, this message translates to:
  /// **'Triangular Bridges'**
  String get triangularBridgesTitle;

  /// No description provided for @triangularBridgesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Connect islands in 3 directions meeting requirements.'**
  String get triangularBridgesSubtitle;

  /// No description provided for @rippleEffectTitle.
  ///
  /// In en, this message translates to:
  /// **'Ripple Effect'**
  String get rippleEffectTitle;

  /// No description provided for @rippleEffectSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Fill numbers in rooms respecting spacing distance constraints.'**
  String get rippleEffectSubtitle;

  /// No description provided for @suguruTectonicTitle.
  ///
  /// In en, this message translates to:
  /// **'Suguru Grid'**
  String get suguruTectonicTitle;

  /// No description provided for @suguruTectonicSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Fill room blocks with numbers 1 to K with no neighbors equal.'**
  String get suguruTectonicSubtitle;

  /// No description provided for @tennerGridTitle.
  ///
  /// In en, this message translates to:
  /// **'Tenner Grid'**
  String get tennerGridTitle;

  /// No description provided for @tennerGridSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Fill rows with digits 0-9 matching column totals.'**
  String get tennerGridSubtitle;

  /// No description provided for @kakurasuSumsTitle.
  ///
  /// In en, this message translates to:
  /// **'Kakurasu Sums'**
  String get kakurasuSumsTitle;

  /// No description provided for @kakurasuSumsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Shade cells to meet weighted row/col index sums.'**
  String get kakurasuSumsSubtitle;

  /// No description provided for @corralLoopTitle.
  ///
  /// In en, this message translates to:
  /// **'Corral Loop'**
  String get corralLoopTitle;

  /// No description provided for @corralLoopSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Draw a single loop enclosing numbers matching visibility.'**
  String get corralLoopSubtitle;

  /// No description provided for @stostoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Stostone Gravity'**
  String get stostoneTitle;

  /// No description provided for @stostoneSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Shade cells that drop down to fill bottom rows perfectly.'**
  String get stostoneSubtitle;

  /// No description provided for @tripletsLogicTitle.
  ///
  /// In en, this message translates to:
  /// **'Triplets Trio'**
  String get tripletsLogicTitle;

  /// No description provided for @tripletsLogicSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Fill grid with three shapes avoiding three-in-a-row.'**
  String get tripletsLogicSubtitle;

  /// No description provided for @galaxiesSymTitle.
  ///
  /// In en, this message translates to:
  /// **'Galaxies Symmetry'**
  String get galaxiesSymTitle;

  /// No description provided for @galaxiesSymSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Divide grid into rotationally symmetric galaxy shapes.'**
  String get galaxiesSymSubtitle;

  /// No description provided for @matrixMultiplierMatchTitle.
  ///
  /// In en, this message translates to:
  /// **'Matrix Matcher'**
  String get matrixMultiplierMatchTitle;

  /// No description provided for @matrixMultiplierMatchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Multiply row and column values to match target dot product.'**
  String get matrixMultiplierMatchSubtitle;

  /// No description provided for @primeFactorTreesTitle.
  ///
  /// In en, this message translates to:
  /// **'Prime Factor Trees'**
  String get primeFactorTreesTitle;

  /// No description provided for @primeFactorTreesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Decompose composite numbers into prime leaf factor pairs.'**
  String get primeFactorTreesSubtitle;

  /// No description provided for @vektorVectorTitle.
  ///
  /// In en, this message translates to:
  /// **'Vector Vector'**
  String get vektorVectorTitle;

  /// No description provided for @vektorVectorSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Scale vectors to make their sum land on the target.'**
  String get vektorVectorSubtitle;

  /// No description provided for @binomialMatchTitle.
  ///
  /// In en, this message translates to:
  /// **'Binomial Match'**
  String get binomialMatchTitle;

  /// No description provided for @binomialMatchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Match quadratic formulas with factored binomial values.'**
  String get binomialMatchSubtitle;

  /// No description provided for @percentageShoppingTitle.
  ///
  /// In en, this message translates to:
  /// **'Percentage Shopping'**
  String get percentageShoppingTitle;

  /// No description provided for @percentageShoppingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Calculate discount percentages and final checkout totals.'**
  String get percentageShoppingSubtitle;

  /// No description provided for @cryptoArithmeticTitle.
  ///
  /// In en, this message translates to:
  /// **'Crypto-Arithmetic'**
  String get cryptoArithmeticTitle;

  /// No description provided for @cryptoArithmeticSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Crack character-digit substitution cipher math problems.'**
  String get cryptoArithmeticSubtitle;

  /// No description provided for @fractionalPizzaTitle.
  ///
  /// In en, this message translates to:
  /// **'Fractional Pizza'**
  String get fractionalPizzaTitle;

  /// No description provided for @fractionalPizzaSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Partition pizza slices to match target sum fractions.'**
  String get fractionalPizzaSubtitle;

  /// No description provided for @numberBondsTitle.
  ///
  /// In en, this message translates to:
  /// **'Number Bonds'**
  String get numberBondsTitle;

  /// No description provided for @numberBondsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Link node values to equal a target connection sum.'**
  String get numberBondsSubtitle;

  /// No description provided for @gridSumLineTitle.
  ///
  /// In en, this message translates to:
  /// **'Grid Sum Line'**
  String get gridSumLineTitle;

  /// No description provided for @gridSumLineSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Draw a path whose values evaluate exactly to the target.'**
  String get gridSumLineSubtitle;

  /// No description provided for @binaryScaleBalanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Binary Scale Balance'**
  String get binaryScaleBalanceTitle;

  /// No description provided for @binaryScaleBalanceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Balance decimal weight using power-of-two blocks.'**
  String get binaryScaleBalanceSubtitle;

  /// No description provided for @moduloPathTitle.
  ///
  /// In en, this message translates to:
  /// **'Modulo Path'**
  String get moduloPathTitle;

  /// No description provided for @moduloPathSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Traverse grid cells matching modulo remainder values.'**
  String get moduloPathSubtitle;

  /// No description provided for @digitSwapEqTitle.
  ///
  /// In en, this message translates to:
  /// **'Digit Swap Equations'**
  String get digitSwapEqTitle;

  /// No description provided for @digitSwapEqSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Swap single digits between equations to correct both.'**
  String get digitSwapEqSubtitle;

  /// No description provided for @areaPerimeterMatchTitle.
  ///
  /// In en, this message translates to:
  /// **'Area & Perimeter'**
  String get areaPerimeterMatchTitle;

  /// No description provided for @areaPerimeterMatchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Draw rectangles matching target area and perimeter values.'**
  String get areaPerimeterMatchSubtitle;

  /// No description provided for @inequalityBalanceOpsTitle.
  ///
  /// In en, this message translates to:
  /// **'Inequality Balance'**
  String get inequalityBalanceOpsTitle;

  /// No description provided for @inequalityBalanceOpsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Place inequality symbols between complex math terms.'**
  String get inequalityBalanceOpsSubtitle;

  /// No description provided for @graphCoordinatePlotTitle.
  ///
  /// In en, this message translates to:
  /// **'Graph Plotter'**
  String get graphCoordinatePlotTitle;

  /// No description provided for @graphCoordinatePlotSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Plot grid coordinates matching linear/quadratic curves.'**
  String get graphCoordinatePlotSubtitle;

  /// No description provided for @baseConversionRunTitle.
  ///
  /// In en, this message translates to:
  /// **'Base Conversion'**
  String get baseConversionRunTitle;

  /// No description provided for @baseConversionRunSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Convert values between binary, decimal, hex, and octal.'**
  String get baseConversionRunSubtitle;

  /// No description provided for @unitConverterProTitle.
  ///
  /// In en, this message translates to:
  /// **'Unit Converter'**
  String get unitConverterProTitle;

  /// No description provided for @unitConverterProSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Answer quick unit conversions under time limits.'**
  String get unitConverterProSubtitle;

  /// No description provided for @auditoryNBackTitle.
  ///
  /// In en, this message translates to:
  /// **'Auditory N-Back'**
  String get auditoryNBackTitle;

  /// No description provided for @auditoryNBackSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Match spoken letters heard N steps back from memory.'**
  String get auditoryNBackSubtitle;

  /// No description provided for @abstractPatternRecallTitle.
  ///
  /// In en, this message translates to:
  /// **'Pattern Layering'**
  String get abstractPatternRecallTitle;

  /// No description provided for @abstractPatternRecallSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Reconstruct layered colorful shapes from memory study.'**
  String get abstractPatternRecallSubtitle;

  /// No description provided for @roomInspectorTitle.
  ///
  /// In en, this message translates to:
  /// **'Room Inspector'**
  String get roomInspectorTitle;

  /// No description provided for @roomInspectorSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify furniture modifications made while screen was blank.'**
  String get roomInspectorSubtitle;

  /// No description provided for @voiceToFaceMatchTitle.
  ///
  /// In en, this message translates to:
  /// **'Voice-Face Match'**
  String get voiceToFaceMatchTitle;

  /// No description provided for @voiceToFaceMatchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select correct face associated with spoken audio voice clip.'**
  String get voiceToFaceMatchSubtitle;

  /// No description provided for @spatialGridMemory3DTitle.
  ///
  /// In en, this message translates to:
  /// **'3D Spatial Memory'**
  String get spatialGridMemory3DTitle;

  /// No description provided for @spatialGridMemory3DSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Recall flashed blocks in a rotated 3D cube grid structure.'**
  String get spatialGridMemory3DSubtitle;

  /// No description provided for @sequenceStackTitle.
  ///
  /// In en, this message translates to:
  /// **'Sequence Stack'**
  String get sequenceStackTitle;

  /// No description provided for @sequenceStackSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Reconstruct plate stack additions and removals in order.'**
  String get sequenceStackSubtitle;

  /// No description provided for @semanticCategoryRecallTitle.
  ///
  /// In en, this message translates to:
  /// **'Category Recall'**
  String get semanticCategoryRecallTitle;

  /// No description provided for @semanticCategoryRecallSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify study words matching requested category targets.'**
  String get semanticCategoryRecallSubtitle;

  /// No description provided for @gridDisplacementTitle.
  ///
  /// In en, this message translates to:
  /// **'Grid Displacement'**
  String get gridDisplacementTitle;

  /// No description provided for @gridDisplacementSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify shifted icons comparing layout to original.'**
  String get gridDisplacementSubtitle;

  /// No description provided for @soundSequenceMatchTitle.
  ///
  /// In en, this message translates to:
  /// **'Sound Sequence Match'**
  String get soundSequenceMatchTitle;

  /// No description provided for @soundSequenceMatchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Repeat note sequences played on a virtual keyboard.'**
  String get soundSequenceMatchSubtitle;

  /// No description provided for @cardCountingMemoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Card Counter'**
  String get cardCountingMemoryTitle;

  /// No description provided for @cardCountingMemorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify cards already dealt in continuous card deal runs.'**
  String get cardCountingMemorySubtitle;

  /// No description provided for @directionsRecallTitle.
  ///
  /// In en, this message translates to:
  /// **'Directions Recall'**
  String get directionsRecallTitle;

  /// No description provided for @directionsRecallSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Navigate grid maps matching path directions from memory.'**
  String get directionsRecallSubtitle;

  /// No description provided for @eventTimelineMemoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Event Timeline'**
  String get eventTimelineMemoryTitle;

  /// No description provided for @eventTimelineMemorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Arrange historical/fictional event cards chronologically.'**
  String get eventTimelineMemorySubtitle;

  /// No description provided for @featureMatrixRecallTitle.
  ///
  /// In en, this message translates to:
  /// **'Feature Matrix'**
  String get featureMatrixRecallTitle;

  /// No description provided for @featureMatrixRecallSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Answer query prompts about cell shape-color attributes.'**
  String get featureMatrixRecallSubtitle;

  /// No description provided for @delayedMatchSampleTitle.
  ///
  /// In en, this message translates to:
  /// **'Delayed Match'**
  String get delayedMatchSampleTitle;

  /// No description provided for @delayedMatchSampleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Match target symbol after solving math distractors.'**
  String get delayedMatchSampleSubtitle;

  /// No description provided for @symbolDigitAssocTitle.
  ///
  /// In en, this message translates to:
  /// **'Symbol-Digit Assoc'**
  String get symbolDigitAssocTitle;

  /// No description provided for @symbolDigitAssocSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Solve symbol translation sheets matching digit keys.'**
  String get symbolDigitAssocSubtitle;

  /// No description provided for @dualTaskMemoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Dual-Task Memory'**
  String get dualTaskMemoryTitle;

  /// No description provided for @dualTaskMemorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Memorize word sets while resolving quick arithmetic tasks.'**
  String get dualTaskMemorySubtitle;

  /// No description provided for @actionSequenceRecallTitle.
  ///
  /// In en, this message translates to:
  /// **'Action Recall'**
  String get actionSequenceRecallTitle;

  /// No description provided for @actionSequenceRecallSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Repeat character gesture animation sequences in order.'**
  String get actionSequenceRecallSubtitle;

  /// No description provided for @tangramPolygonTitle.
  ///
  /// In en, this message translates to:
  /// **'Tangram Fit'**
  String get tangramPolygonTitle;

  /// No description provided for @tangramPolygonSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Arrange polygon shapes to fill silhouette outlines.'**
  String get tangramPolygonSubtitle;

  /// No description provided for @mazeNav3DTitle.
  ///
  /// In en, this message translates to:
  /// **'3D Maze Nav'**
  String get mazeNav3DTitle;

  /// No description provided for @mazeNav3DSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Navigate 3D isometric maze routes from first-person view.'**
  String get mazeNav3DSubtitle;

  /// No description provided for @isometricProjectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Isometric Projector'**
  String get isometricProjectionTitle;

  /// No description provided for @isometricProjectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Match 3D block figures to orthographic 2D top/front views.'**
  String get isometricProjectionSubtitle;

  /// No description provided for @polyominoPackingTitle.
  ///
  /// In en, this message translates to:
  /// **'Polyomino Packing'**
  String get polyominoPackingTitle;

  /// No description provided for @polyominoPackingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pack random polyomino block pieces into target areas.'**
  String get polyominoPackingSubtitle;

  /// No description provided for @spatialGridRotationTitle.
  ///
  /// In en, this message translates to:
  /// **'Spatial Grid Rotation'**
  String get spatialGridRotationTitle;

  /// No description provided for @spatialGridRotationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Match 3D block arrangements rotated along axis coordinates.'**
  String get spatialGridRotationSubtitle;

  /// No description provided for @wireLoopGameTitle.
  ///
  /// In en, this message translates to:
  /// **'Wire Loop'**
  String get wireLoopGameTitle;

  /// No description provided for @wireLoopGameSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Drag metal rings along wire splines without contact.'**
  String get wireLoopGameSubtitle;

  /// No description provided for @origamiUnfoldTitle.
  ///
  /// In en, this message translates to:
  /// **'Origami Unfold'**
  String get origamiUnfoldTitle;

  /// No description provided for @origamiUnfoldSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify hole punch patterns after unfolding folded sheets.'**
  String get origamiUnfoldSubtitle;

  /// No description provided for @ropeTangleSolverTitle.
  ///
  /// In en, this message translates to:
  /// **'Rope Untangler'**
  String get ropeTangleSolverTitle;

  /// No description provided for @ropeTangleSolverSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Drag nodes to layout planar graphs with zero line crosses.'**
  String get ropeTangleSolverSubtitle;

  /// No description provided for @gridFitTetrisTitle.
  ///
  /// In en, this message translates to:
  /// **'Grid Fit Solver'**
  String get gridFitTetrisTitle;

  /// No description provided for @gridFitTetrisSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Arrange static irregular blocks to fit container bounds.'**
  String get gridFitTetrisSubtitle;

  /// No description provided for @vectorGridAlignmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Vector Alignment'**
  String get vectorGridAlignmentTitle;

  /// No description provided for @vectorGridAlignmentSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Scale and rotate shapes to match shadow template targets.'**
  String get vectorGridAlignmentSubtitle;

  /// No description provided for @blockStackingPhysicsTitle.
  ///
  /// In en, this message translates to:
  /// **'Block Stacking'**
  String get blockStackingPhysicsTitle;

  /// No description provided for @blockStackingPhysicsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Stack irregular block panels balancing gravity weight.'**
  String get blockStackingPhysicsSubtitle;

  /// No description provided for @crossSectionMatch3DTitle.
  ///
  /// In en, this message translates to:
  /// **'3D Cross Section'**
  String get crossSectionMatch3DTitle;

  /// No description provided for @crossSectionMatch3DSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify 2D slice geometries cut from 3D shapes.'**
  String get crossSectionMatch3DSubtitle;

  /// No description provided for @symmetryPaintTitle.
  ///
  /// In en, this message translates to:
  /// **'Symmetry Paint'**
  String get symmetryPaintTitle;

  /// No description provided for @symmetryPaintSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Draw mirror image segments reflecting across symmetry axes.'**
  String get symmetryPaintSubtitle;

  /// No description provided for @rollingBlockBloxTitle.
  ///
  /// In en, this message translates to:
  /// **'Rolling Block'**
  String get rollingBlockBloxTitle;

  /// No description provided for @rollingBlockBloxSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Roll block pieces to land vertically in target slots.'**
  String get rollingBlockBloxSubtitle;

  /// No description provided for @perspectiveShiftViewTitle.
  ///
  /// In en, this message translates to:
  /// **'Perspective Shift'**
  String get perspectiveShiftViewTitle;

  /// No description provided for @perspectiveShiftViewSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Rotate block clusters until they spell letters/words.'**
  String get perspectiveShiftViewSubtitle;

  /// No description provided for @networkFlowSphericalTitle.
  ///
  /// In en, this message translates to:
  /// **'Network Flow'**
  String get networkFlowSphericalTitle;

  /// No description provided for @networkFlowSphericalSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Connect grid flows on wrapping cylindrical coordinates.'**
  String get networkFlowSphericalSubtitle;

  /// No description provided for @layeredSilhouetteBlendTitle.
  ///
  /// In en, this message translates to:
  /// **'Silhouette Blend'**
  String get layeredSilhouetteBlendTitle;

  /// No description provided for @layeredSilhouetteBlendSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Stack colored layers to match target translucent shapes.'**
  String get layeredSilhouetteBlendSubtitle;

  /// No description provided for @wordWheelPangramTitle.
  ///
  /// In en, this message translates to:
  /// **'Word Anagrams'**
  String get wordWheelPangramTitle;

  /// No description provided for @wordWheelPangramSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Construct words containing central target letters from wheels.'**
  String get wordWheelPangramSubtitle;

  /// No description provided for @letterGridSwapperTitle.
  ///
  /// In en, this message translates to:
  /// **'Letter Swapper'**
  String get letterGridSwapperTitle;

  /// No description provided for @letterGridSwapperSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Swap adjacent letter tiles to complete row and col words.'**
  String get letterGridSwapperSubtitle;

  /// No description provided for @synonymMatchTitle.
  ///
  /// In en, this message translates to:
  /// **'Synonym Match'**
  String get synonymMatchTitle;

  /// No description provided for @synonymMatchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Match falling word targets with synonyms or antonyms.'**
  String get synonymMatchSubtitle;

  /// No description provided for @vowelDropTitle.
  ///
  /// In en, this message translates to:
  /// **'Vowel Drop'**
  String get vowelDropTitle;

  /// No description provided for @vowelDropSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Drop vowels into coordinate grids completing words.'**
  String get vowelDropSubtitle;

  /// No description provided for @letterBalanceScaleTitle.
  ///
  /// In en, this message translates to:
  /// **'Word Balance Scale'**
  String get letterBalanceScaleTitle;

  /// No description provided for @letterBalanceScaleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Spell words whose letter values balance weights.'**
  String get letterBalanceScaleSubtitle;

  /// No description provided for @wordChainShiritoriTitle.
  ///
  /// In en, this message translates to:
  /// **'Word Chain'**
  String get wordChainShiritoriTitle;

  /// No description provided for @wordChainShiritoriSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Link word loops starting with preceding letter outputs.'**
  String get wordChainShiritoriSubtitle;

  /// No description provided for @affixBuilderTitle.
  ///
  /// In en, this message translates to:
  /// **'Affix Builder'**
  String get affixBuilderTitle;

  /// No description provided for @affixBuilderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Combine prefixes/suffixes to construct target vocabularies.'**
  String get affixBuilderSubtitle;

  /// No description provided for @decipherCrypticCluesTitle.
  ///
  /// In en, this message translates to:
  /// **'Cryptic Decipher'**
  String get decipherCrypticCluesTitle;

  /// No description provided for @decipherCrypticCluesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Solve word-play puzzles and decrypt spelling riddles.'**
  String get decipherCrypticCluesSubtitle;

  /// No description provided for @boggleWordSearchTitle.
  ///
  /// In en, this message translates to:
  /// **'Boggle Connect'**
  String get boggleWordSearchTitle;

  /// No description provided for @boggleWordSearchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Trace adjacent connected paths to find hidden words.'**
  String get boggleWordSearchSubtitle;

  /// No description provided for @idiomUnscrambleTitle.
  ///
  /// In en, this message translates to:
  /// **'Idiom Unscramble'**
  String get idiomUnscrambleTitle;

  /// No description provided for @idiomUnscrambleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Arrange scrambled word arrays to match idiom meanings.'**
  String get idiomUnscrambleSubtitle;

  /// No description provided for @letterPyramidsTitle.
  ///
  /// In en, this message translates to:
  /// **'Letter Pyramids'**
  String get letterPyramidsTitle;

  /// No description provided for @letterPyramidsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Build word towers adding single anagram letters per tier.'**
  String get letterPyramidsSubtitle;

  /// No description provided for @soundAlikeHomophonesTitle.
  ///
  /// In en, this message translates to:
  /// **'Homophone Matches'**
  String get soundAlikeHomophonesTitle;

  /// No description provided for @soundAlikeHomophonesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify correct homophone spellings for sentences.'**
  String get soundAlikeHomophonesSubtitle;

  /// No description provided for @wordGridSudokuTitle.
  ///
  /// In en, this message translates to:
  /// **'Word Sudoku'**
  String get wordGridSudokuTitle;

  /// No description provided for @wordGridSudokuSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tesselate letters in grid rows forming words.'**
  String get wordGridSudokuSubtitle;

  /// No description provided for @portmanteauFactoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Portmanteau Factory'**
  String get portmanteauFactoryTitle;

  /// No description provided for @portmanteauFactorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Merge semantic components creating compound words.'**
  String get portmanteauFactorySubtitle;

  /// No description provided for @codedCrosswordsCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'Codewords Crossword'**
  String get codedCrosswordsCodeTitle;

  /// No description provided for @codedCrosswordsCodeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Solve grid crosswords matching number-to-letter codes.'**
  String get codedCrosswordsCodeSubtitle;

  /// No description provided for @wordSnakeTrailTitle.
  ///
  /// In en, this message translates to:
  /// **'Word Snake'**
  String get wordSnakeTrailTitle;

  /// No description provided for @wordSnakeTrailSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Trace snake-like letter trails spelling thematic words.'**
  String get wordSnakeTrailSubtitle;

  /// No description provided for @typingRhythmSpeedTitle.
  ///
  /// In en, this message translates to:
  /// **'Typing Flow'**
  String get typingRhythmSpeedTitle;

  /// No description provided for @typingRhythmSpeedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Type vocabularies matching metronome rhythm beats.'**
  String get typingRhythmSpeedSubtitle;

  /// No description provided for @errorSomethingWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorSomethingWrong;

  /// No description provided for @errorUnexpected.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred'**
  String get errorUnexpected;

  /// No description provided for @errorTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get errorTryAgain;

  /// No description provided for @leaveReview.
  ///
  /// In en, this message translates to:
  /// **'Leave Review'**
  String get leaveReview;

  /// No description provided for @reportError.
  ///
  /// In en, this message translates to:
  /// **'Report Error'**
  String get reportError;

  /// No description provided for @statsTitle.
  ///
  /// In en, this message translates to:
  /// **'Stats'**
  String get statsTitle;

  /// No description provided for @statsAchievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get statsAchievements;

  /// No description provided for @statsWeeklyActivity.
  ///
  /// In en, this message translates to:
  /// **'Weekly Activity'**
  String get statsWeeklyActivity;

  /// No description provided for @statsDayStreak.
  ///
  /// In en, this message translates to:
  /// **'{days} Day Streak'**
  String statsDayStreak(int days);

  /// No description provided for @statsTotalXp.
  ///
  /// In en, this message translates to:
  /// **'Total XP'**
  String get statsTotalXp;

  /// No description provided for @statsSolved.
  ///
  /// In en, this message translates to:
  /// **'Solved'**
  String get statsSolved;

  /// No description provided for @statsLevel.
  ///
  /// In en, this message translates to:
  /// **'Level {level}'**
  String statsLevel(int level);

  /// No description provided for @statsMaintainStreak.
  ///
  /// In en, this message translates to:
  /// **'Maintain your streak!'**
  String get statsMaintainStreak;

  /// No description provided for @statsPercentToLevel.
  ///
  /// In en, this message translates to:
  /// **'{percent}% to Level {level}'**
  String statsPercentToLevel(int percent, int level);

  /// No description provided for @statsCognitiveProfile.
  ///
  /// In en, this message translates to:
  /// **'Cognitive Profile'**
  String get statsCognitiveProfile;

  /// No description provided for @statsLocked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get statsLocked;

  /// No description provided for @achievementSeeker.
  ///
  /// In en, this message translates to:
  /// **'Seeker'**
  String get achievementSeeker;

  /// No description provided for @achievementSeekerDesc.
  ///
  /// In en, this message translates to:
  /// **'Earn 100 XP'**
  String get achievementSeekerDesc;

  /// No description provided for @achievementApprentice.
  ///
  /// In en, this message translates to:
  /// **'Apprentice'**
  String get achievementApprentice;

  /// No description provided for @achievementApprenticeDesc.
  ///
  /// In en, this message translates to:
  /// **'Earn 1,000 XP'**
  String get achievementApprenticeDesc;

  /// No description provided for @achievementStrategist.
  ///
  /// In en, this message translates to:
  /// **'Strategist'**
  String get achievementStrategist;

  /// No description provided for @achievementStrategistDesc.
  ///
  /// In en, this message translates to:
  /// **'Earn 5,000 XP'**
  String get achievementStrategistDesc;

  /// No description provided for @achievementElite.
  ///
  /// In en, this message translates to:
  /// **'Elite'**
  String get achievementElite;

  /// No description provided for @achievementEliteDesc.
  ///
  /// In en, this message translates to:
  /// **'Earn 10,000 XP'**
  String get achievementEliteDesc;

  /// No description provided for @achievementVeteran.
  ///
  /// In en, this message translates to:
  /// **'Veteran'**
  String get achievementVeteran;

  /// No description provided for @achievementVeteranDesc.
  ///
  /// In en, this message translates to:
  /// **'Earn 25,000 XP'**
  String get achievementVeteranDesc;

  /// No description provided for @achievementMaster.
  ///
  /// In en, this message translates to:
  /// **'Master'**
  String get achievementMaster;

  /// No description provided for @achievementMasterDesc.
  ///
  /// In en, this message translates to:
  /// **'Earn 50,000 XP'**
  String get achievementMasterDesc;

  /// No description provided for @achievementGrandmaster.
  ///
  /// In en, this message translates to:
  /// **'Grandmaster'**
  String get achievementGrandmaster;

  /// No description provided for @achievementGrandmasterDesc.
  ///
  /// In en, this message translates to:
  /// **'Earn 100,000 XP'**
  String get achievementGrandmasterDesc;

  /// No description provided for @achievementLegend.
  ///
  /// In en, this message translates to:
  /// **'Legend'**
  String get achievementLegend;

  /// No description provided for @achievementLegendDesc.
  ///
  /// In en, this message translates to:
  /// **'Earn 250,000 XP'**
  String get achievementLegendDesc;

  /// No description provided for @achievementMythic.
  ///
  /// In en, this message translates to:
  /// **'Mythic'**
  String get achievementMythic;

  /// No description provided for @achievementMythicDesc.
  ///
  /// In en, this message translates to:
  /// **'Earn 500,000 XP'**
  String get achievementMythicDesc;

  /// No description provided for @achievementEternal.
  ///
  /// In en, this message translates to:
  /// **'Eternal'**
  String get achievementEternal;

  /// No description provided for @achievementEternalDesc.
  ///
  /// In en, this message translates to:
  /// **'Earn 1,000,000 XP'**
  String get achievementEternalDesc;

  /// No description provided for @winFoundIt.
  ///
  /// In en, this message translates to:
  /// **'Found It!'**
  String get winFoundIt;

  /// No description provided for @winExcellentTracking.
  ///
  /// In en, this message translates to:
  /// **'Excellent tracking speed!'**
  String get winExcellentTracking;

  /// No description provided for @loseMissedIt.
  ///
  /// In en, this message translates to:
  /// **'Missed It!'**
  String get loseMissedIt;

  /// No description provided for @loseKeepEyes.
  ///
  /// In en, this message translates to:
  /// **'Keep your eyes on the target.'**
  String get loseKeepEyes;

  /// No description provided for @winDecodedCorrectly.
  ///
  /// In en, this message translates to:
  /// **'Decoded Correctly!'**
  String get winDecodedCorrectly;

  /// No description provided for @winDecodedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your brain successfully read the jumbled text!'**
  String get winDecodedMessage;

  /// No description provided for @loseTryAgainDecryption.
  ///
  /// In en, this message translates to:
  /// **'Try again to break the encryption.'**
  String get loseTryAgainDecryption;

  /// No description provided for @winTargetReached.
  ///
  /// In en, this message translates to:
  /// **'Target Reached!'**
  String get winTargetReached;

  /// No description provided for @winExcellentCalculations.
  ///
  /// In en, this message translates to:
  /// **'Excellent calculations!'**
  String get winExcellentCalculations;

  /// No description provided for @winCodeBroken.
  ///
  /// In en, this message translates to:
  /// **'Code Broken!'**
  String get winCodeBroken;

  /// No description provided for @winDecodedPerfectly.
  ///
  /// In en, this message translates to:
  /// **'You decoded the message perfectly.'**
  String get winDecodedPerfectly;

  /// No description provided for @loseEncrypted.
  ///
  /// In en, this message translates to:
  /// **'Encrypted'**
  String get loseEncrypted;

  /// No description provided for @winAmazing.
  ///
  /// In en, this message translates to:
  /// **'Amazing!'**
  String get winAmazing;

  /// No description provided for @winReachedTarget.
  ///
  /// In en, this message translates to:
  /// **'You reached the target number!'**
  String get winReachedTarget;

  /// No description provided for @loseTryAgainSolution.
  ///
  /// In en, this message translates to:
  /// **'Try again to find the solution.'**
  String get loseTryAgainSolution;

  /// No description provided for @winExcellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent!'**
  String get winExcellent;

  /// No description provided for @winLevelUp.
  ///
  /// In en, this message translates to:
  /// **'Level Up!'**
  String get winLevelUp;

  /// No description provided for @winPerfect.
  ///
  /// In en, this message translates to:
  /// **'Perfect!'**
  String get winPerfect;

  /// No description provided for @winFloodSuccess.
  ///
  /// In en, this message translates to:
  /// **'Flood Success!'**
  String get winFloodSuccess;

  /// No description provided for @loseDryLand.
  ///
  /// In en, this message translates to:
  /// **'Dry Land...'**
  String get loseDryLand;

  /// No description provided for @winRoundComplete.
  ///
  /// In en, this message translates to:
  /// **'Round Complete'**
  String get winRoundComplete;

  /// No description provided for @winStayVigilant.
  ///
  /// In en, this message translates to:
  /// **'Stay Vigilant!'**
  String get winStayVigilant;

  /// No description provided for @loseKeepWatch.
  ///
  /// In en, this message translates to:
  /// **'Keep Watch!'**
  String get loseKeepWatch;

  /// No description provided for @winFocusMaster.
  ///
  /// In en, this message translates to:
  /// **'Focus Master!'**
  String get winFocusMaster;

  /// No description provided for @loseConcentrationBroken.
  ///
  /// In en, this message translates to:
  /// **'Concentration Broken'**
  String get loseConcentrationBroken;

  /// No description provided for @winSpeedDemon.
  ///
  /// In en, this message translates to:
  /// **'Speed Demon!'**
  String get winSpeedDemon;

  /// No description provided for @loseSlowSteady.
  ///
  /// In en, this message translates to:
  /// **'Slow & Steady'**
  String get loseSlowSteady;

  /// No description provided for @loseTimeExpired.
  ///
  /// In en, this message translates to:
  /// **'Time Expired'**
  String get loseTimeExpired;

  /// No description provided for @winSharpEyes.
  ///
  /// In en, this message translates to:
  /// **'Sharp Eyes!'**
  String get winSharpEyes;

  /// No description provided for @loseLostTrack.
  ///
  /// In en, this message translates to:
  /// **'Lost Track'**
  String get loseLostTrack;

  /// No description provided for @winOrbitMaster.
  ///
  /// In en, this message translates to:
  /// **'Orbit Master!'**
  String get winOrbitMaster;

  /// No description provided for @loseOutOfSync.
  ///
  /// In en, this message translates to:
  /// **'Out of Sync'**
  String get loseOutOfSync;

  /// No description provided for @winSharpReflexes.
  ///
  /// In en, this message translates to:
  /// **'Sharp Reflexes!'**
  String get winSharpReflexes;

  /// No description provided for @loseOutOfTime.
  ///
  /// In en, this message translates to:
  /// **'Out of Time'**
  String get loseOutOfTime;

  /// No description provided for @winSurgeComplete.
  ///
  /// In en, this message translates to:
  /// **'Surge Complete!'**
  String get winSurgeComplete;

  /// No description provided for @loseTimeExpiredExcl.
  ///
  /// In en, this message translates to:
  /// **'Time Expired!'**
  String get loseTimeExpiredExcl;

  /// No description provided for @winMathGenius.
  ///
  /// In en, this message translates to:
  /// **'Math Genius!'**
  String get winMathGenius;

  /// No description provided for @loseTimeUp.
  ///
  /// In en, this message translates to:
  /// **'Time Up'**
  String get loseTimeUp;

  /// No description provided for @winPlanningMaster.
  ///
  /// In en, this message translates to:
  /// **'Planning Master!'**
  String get winPlanningMaster;

  /// No description provided for @loseOutOfMoves.
  ///
  /// In en, this message translates to:
  /// **'Out of Moves'**
  String get loseOutOfMoves;

  /// No description provided for @winTotalControl.
  ///
  /// In en, this message translates to:
  /// **'Total Control!'**
  String get winTotalControl;

  /// No description provided for @loseInhibitionFail.
  ///
  /// In en, this message translates to:
  /// **'Inhibition Fail'**
  String get loseInhibitionFail;

  /// No description provided for @winMimicMaster.
  ///
  /// In en, this message translates to:
  /// **'Mimic Master!'**
  String get winMimicMaster;

  /// No description provided for @losePatternMismatch.
  ///
  /// In en, this message translates to:
  /// **'Pattern Mismatch'**
  String get losePatternMismatch;

  /// No description provided for @winMemoryMaster.
  ///
  /// In en, this message translates to:
  /// **'Memory Master!'**
  String get winMemoryMaster;

  /// No description provided for @loseFadingEcho.
  ///
  /// In en, this message translates to:
  /// **'Fading Echo'**
  String get loseFadingEcho;

  /// No description provided for @winNeuroMaster.
  ///
  /// In en, this message translates to:
  /// **'Neuro-Master!'**
  String get winNeuroMaster;

  /// No description provided for @loseBrainFog.
  ///
  /// In en, this message translates to:
  /// **'Brain Fog'**
  String get loseBrainFog;

  /// No description provided for @winBrainWizard.
  ///
  /// In en, this message translates to:
  /// **'Brain Wizard!'**
  String get winBrainWizard;

  /// No description provided for @winSpatialMaster.
  ///
  /// In en, this message translates to:
  /// **'Spatial Master!'**
  String get winSpatialMaster;

  /// No description provided for @loseLostInSpace.
  ///
  /// In en, this message translates to:
  /// **'Lost in Space'**
  String get loseLostInSpace;

  /// No description provided for @winSequenceMaster.
  ///
  /// In en, this message translates to:
  /// **'Sequence Master!'**
  String get winSequenceMaster;

  /// No description provided for @winCountingGenius.
  ///
  /// In en, this message translates to:
  /// **'Counting Genius!'**
  String get winCountingGenius;

  /// No description provided for @winNonMatchingExpert.
  ///
  /// In en, this message translates to:
  /// **'Non-Matching Expert!'**
  String get winNonMatchingExpert;

  /// No description provided for @winSymmetryMaster.
  ///
  /// In en, this message translates to:
  /// **'Symmetry Master!'**
  String get winSymmetryMaster;

  /// No description provided for @winCabinetExpert.
  ///
  /// In en, this message translates to:
  /// **'Cabinet Expert!'**
  String get winCabinetExpert;

  /// No description provided for @winSpatialGenius.
  ///
  /// In en, this message translates to:
  /// **'Spatial Genius!'**
  String get winSpatialGenius;

  /// No description provided for @winReadingExpert.
  ///
  /// In en, this message translates to:
  /// **'Reading Expert!'**
  String get winReadingExpert;

  /// No description provided for @winRecognitionGenius.
  ///
  /// In en, this message translates to:
  /// **'Recognition Genius!'**
  String get winRecognitionGenius;

  /// No description provided for @winMandalaArtist.
  ///
  /// In en, this message translates to:
  /// **'Mandala Artist!'**
  String get winMandalaArtist;

  /// No description provided for @winTrackerPro.
  ///
  /// In en, this message translates to:
  /// **'Tracker Pro!'**
  String get winTrackerPro;

  /// No description provided for @loseLostTrail.
  ///
  /// In en, this message translates to:
  /// **'Lost Trail'**
  String get loseLostTrail;

  /// No description provided for @winLogicMaster.
  ///
  /// In en, this message translates to:
  /// **'Logic Master!'**
  String get winLogicMaster;

  /// No description provided for @loseWrongAnswer.
  ///
  /// In en, this message translates to:
  /// **'Wrong Answer'**
  String get loseWrongAnswer;

  /// No description provided for @winPathfinder.
  ///
  /// In en, this message translates to:
  /// **'Pathfinder!'**
  String get winPathfinder;

  /// No description provided for @loseLostYourWay.
  ///
  /// In en, this message translates to:
  /// **'Lost Your Way'**
  String get loseLostYourWay;

  /// No description provided for @winMentalGymnast.
  ///
  /// In en, this message translates to:
  /// **'Mental Gymnast!'**
  String get winMentalGymnast;

  /// No description provided for @loseWiresCrossed.
  ///
  /// In en, this message translates to:
  /// **'Wires Crossed'**
  String get loseWiresCrossed;

  /// No description provided for @winCorrect.
  ///
  /// In en, this message translates to:
  /// **'Correct!'**
  String get winCorrect;

  /// No description provided for @loseWrong.
  ///
  /// In en, this message translates to:
  /// **'Wrong'**
  String get loseWrong;

  /// No description provided for @winRhythmGod.
  ///
  /// In en, this message translates to:
  /// **'Rhythm God!'**
  String get winRhythmGod;

  /// No description provided for @loseOffBeat.
  ///
  /// In en, this message translates to:
  /// **'Off Beat'**
  String get loseOffBeat;

  /// No description provided for @winSteadyHands.
  ///
  /// In en, this message translates to:
  /// **'Steady Hands!'**
  String get winSteadyHands;

  /// No description provided for @loseShakyLine.
  ///
  /// In en, this message translates to:
  /// **'Shaky Line'**
  String get loseShakyLine;

  /// No description provided for @winEquationSolved.
  ///
  /// In en, this message translates to:
  /// **'Equation Solved!'**
  String get winEquationSolved;

  /// No description provided for @winMasterHunter.
  ///
  /// In en, this message translates to:
  /// **'Master Hunter!'**
  String get winMasterHunter;

  /// No description provided for @loseHuntEnded.
  ///
  /// In en, this message translates to:
  /// **'Hunt Ended'**
  String get loseHuntEnded;

  /// No description provided for @winFluencyExpert.
  ///
  /// In en, this message translates to:
  /// **'Fluency Expert!'**
  String get winFluencyExpert;

  /// No description provided for @loseTimeUpExcl.
  ///
  /// In en, this message translates to:
  /// **'Time Up!'**
  String get loseTimeUpExcl;

  /// No description provided for @winSharpEye.
  ///
  /// In en, this message translates to:
  /// **'Sharp Eye!'**
  String get winSharpEye;

  /// No description provided for @loseMismatched.
  ///
  /// In en, this message translates to:
  /// **'Mismatched'**
  String get loseMismatched;

  /// No description provided for @winFibonacciMaster.
  ///
  /// In en, this message translates to:
  /// **'Fibonacci Master!'**
  String get winFibonacciMaster;

  /// No description provided for @winMathWizard.
  ///
  /// In en, this message translates to:
  /// **'Math Wizard!'**
  String get winMathWizard;

  /// No description provided for @winPercentagePro.
  ///
  /// In en, this message translates to:
  /// **'Percentage Pro!'**
  String get winPercentagePro;

  /// No description provided for @winSleuthMaster.
  ///
  /// In en, this message translates to:
  /// **'Sleuth Master!'**
  String get winSleuthMaster;

  /// No description provided for @winDivisibilityWhiz.
  ///
  /// In en, this message translates to:
  /// **'Divisibility Whiz!'**
  String get winDivisibilityWhiz;

  /// No description provided for @winVennMaster.
  ///
  /// In en, this message translates to:
  /// **'Venn Master!'**
  String get winVennMaster;

  /// No description provided for @winChimpTestAced.
  ///
  /// In en, this message translates to:
  /// **'Chimp Test Aced'**
  String get winChimpTestAced;

  /// No description provided for @loseTestFailed.
  ///
  /// In en, this message translates to:
  /// **'Test Failed'**
  String get loseTestFailed;

  /// No description provided for @winChimpMessage.
  ///
  /// In en, this message translates to:
  /// **'Sensational working memory span! You equal chimpanzee levels of cognitive recall.'**
  String get winChimpMessage;

  /// No description provided for @loseChimpMessage.
  ///
  /// In en, this message translates to:
  /// **'You lost all lives. Keep training to scale up your memory grid capacity!'**
  String get loseChimpMessage;

  /// No description provided for @winPerfectRecall.
  ///
  /// In en, this message translates to:
  /// **'Perfect Recall!'**
  String get winPerfectRecall;

  /// No description provided for @winRememberedAll.
  ///
  /// In en, this message translates to:
  /// **'You remembered all details correctly!'**
  String get winRememberedAll;

  /// No description provided for @loseSomeDetailsWrong.
  ///
  /// In en, this message translates to:
  /// **'Some details were remembered incorrectly.'**
  String get loseSomeDetailsWrong;

  /// No description provided for @winShikakuSolved.
  ///
  /// In en, this message translates to:
  /// **'You successfully solved the Shikaku puzzle.'**
  String get winShikakuSolved;

  /// No description provided for @snackbarIncorrectSum.
  ///
  /// In en, this message translates to:
  /// **'Incorrect sum! Try another one.'**
  String get snackbarIncorrectSum;

  /// No description provided for @snackbarCorrectMatch.
  ///
  /// In en, this message translates to:
  /// **'Correct match!'**
  String get snackbarCorrectMatch;

  /// No description provided for @snackbarWrongMatch.
  ///
  /// In en, this message translates to:
  /// **'Wrong match! Study a new shape.'**
  String get snackbarWrongMatch;

  /// No description provided for @snackbarAlignedPerfectly.
  ///
  /// In en, this message translates to:
  /// **'Aligned perfectly! Next target...'**
  String get snackbarAlignedPerfectly;

  /// No description provided for @snackbarNotAligned.
  ///
  /// In en, this message translates to:
  /// **'Not aligned yet! Keep adjusting the rotation, scale, or positions.'**
  String get snackbarNotAligned;

  /// No description provided for @snackbarWordMustContainCentral.
  ///
  /// In en, this message translates to:
  /// **'Word must contain the central letter \"{letter}\"!'**
  String snackbarWordMustContainCentral(String letter);

  /// No description provided for @snackbarWordAlreadyFound.
  ///
  /// In en, this message translates to:
  /// **'Word already found!'**
  String get snackbarWordAlreadyFound;

  /// No description provided for @snackbarNotAValidWord.
  ///
  /// In en, this message translates to:
  /// **'Not a valid word!'**
  String get snackbarNotAValidWord;

  /// No description provided for @snackbarIncorrectLookClose.
  ///
  /// In en, this message translates to:
  /// **'Incorrect reading. Look closely at the words!'**
  String get snackbarIncorrectLookClose;

  /// No description provided for @snackbarIncorrectCorrectAnswer.
  ///
  /// In en, this message translates to:
  /// **'Incorrect! The correct answer was {answer}'**
  String snackbarIncorrectCorrectAnswer(String answer);

  /// No description provided for @hideGame.
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get hideGame;

  /// No description provided for @unhideGame.
  ///
  /// In en, this message translates to:
  /// **'Unhide'**
  String get unhideGame;

  /// No description provided for @favoriteGame.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favoriteGame;

  /// No description provided for @unfavoriteGame.
  ///
  /// In en, this message translates to:
  /// **'Unfavorite'**
  String get unfavoriteGame;

  /// No description provided for @hiddenGames.
  ///
  /// In en, this message translates to:
  /// **'HIDDEN GAMES'**
  String get hiddenGames;

  /// No description provided for @showHiddenGames.
  ///
  /// In en, this message translates to:
  /// **'Show Hidden Games ({count})'**
  String showHiddenGames(int count);

  /// No description provided for @noHiddenGames.
  ///
  /// In en, this message translates to:
  /// **'No hidden games'**
  String get noHiddenGames;

  /// No description provided for @gameHidden.
  ///
  /// In en, this message translates to:
  /// **'Game hidden'**
  String get gameHidden;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @snackbarCorrect.
  ///
  /// In en, this message translates to:
  /// **'Correct!'**
  String get snackbarCorrect;

  /// No description provided for @snackbarIncorrectTryNew.
  ///
  /// In en, this message translates to:
  /// **'Incorrect recall! Try a new grid.'**
  String get snackbarIncorrectTryNew;

  /// No description provided for @snackbarAllCorrect.
  ///
  /// In en, this message translates to:
  /// **'All associations correct!'**
  String get snackbarAllCorrect;

  /// No description provided for @snackbarIncorrectStudyAgain.
  ///
  /// In en, this message translates to:
  /// **'Incorrect translations! Study the association key again.'**
  String get snackbarIncorrectStudyAgain;

  /// No description provided for @snackbarIncorrectArithmetic.
  ///
  /// In en, this message translates to:
  /// **'Incorrect arithmetic! Try again.'**
  String get snackbarIncorrectArithmetic;

  /// No description provided for @snackbarCorrectRecall.
  ///
  /// In en, this message translates to:
  /// **'Correct recall!'**
  String get snackbarCorrectRecall;

  /// No description provided for @snackbarWrongRecall.
  ///
  /// In en, this message translates to:
  /// **'Wrong recall selection! Try a new set.'**
  String get snackbarWrongRecall;

  /// No description provided for @snackbarPieceDoesNotFit.
  ///
  /// In en, this message translates to:
  /// **'Piece does not fit there!'**
  String get snackbarPieceDoesNotFit;

  /// No description provided for @snackbarInvalidStep.
  ///
  /// In en, this message translates to:
  /// **'Invalid step! {mod} mod {modulus} is not {remainder}.'**
  String snackbarInvalidStep(int mod, int modulus, int remainder);

  /// No description provided for @snackbarIncorrectGroup.
  ///
  /// In en, this message translates to:
  /// **'Incorrect group! {tries} tries remaining.'**
  String snackbarIncorrectGroup(int tries);

  /// No description provided for @snackbarIncorrectSwapped.
  ///
  /// In en, this message translates to:
  /// **'Incorrect! Swapped items are highlighted in green.'**
  String get snackbarIncorrectSwapped;

  /// No description provided for @snackbarIncorrectDestination.
  ///
  /// In en, this message translates to:
  /// **'Incorrect! The final destination was ({x}, {y}).'**
  String snackbarIncorrectDestination(int x, int y);

  /// No description provided for @snackbarIncorrectCorrectCount.
  ///
  /// In en, this message translates to:
  /// **'Incorrect! The correct count for {suit} was {count}.'**
  String snackbarIncorrectCorrectCount(String suit, int count);

  /// No description provided for @snackbarIncorrectSequence.
  ///
  /// In en, this message translates to:
  /// **'Incorrect sequence! Watch closely again.'**
  String get snackbarIncorrectSequence;

  /// No description provided for @snackbarSequenceMatched.
  ///
  /// In en, this message translates to:
  /// **'Sequence matched! Increasing length...'**
  String get snackbarSequenceMatched;

  /// No description provided for @snackbarIncorrectAnswer.
  ///
  /// In en, this message translates to:
  /// **'Incorrect answer! Try again.'**
  String get snackbarIncorrectAnswer;

  /// No description provided for @snackbarIncorrectCorrectValue.
  ///
  /// In en, this message translates to:
  /// **'Incorrect! The correct value was {value}'**
  String snackbarIncorrectCorrectValue(String value);

  /// No description provided for @snackbarIncorrectSlices.
  ///
  /// In en, this message translates to:
  /// **'Incorrect! You selected {selected} slices, but need {required}.'**
  String snackbarIncorrectSlices(int selected, String required);

  /// No description provided for @snackbarReachedEndNoMatch.
  ///
  /// In en, this message translates to:
  /// **'Reached end but total does not match target!'**
  String get snackbarReachedEndNoMatch;

  /// No description provided for @snackbarCorrectOrder.
  ///
  /// In en, this message translates to:
  /// **'Correct chronological order!'**
  String get snackbarCorrectOrder;

  /// No description provided for @snackbarIncorrectOrder.
  ///
  /// In en, this message translates to:
  /// **'Incorrect order! Study again.'**
  String get snackbarIncorrectOrder;

  /// No description provided for @snackbarIncorrectMissingValue.
  ///
  /// In en, this message translates to:
  /// **'Incorrect! The missing value was {value}'**
  String snackbarIncorrectMissingValue(String value);

  /// No description provided for @snackbarIncorrectLetterDigit.
  ///
  /// In en, this message translates to:
  /// **'Incorrect! {letter} = {digit}'**
  String snackbarIncorrectLetterDigit(String letter, int digit);

  /// No description provided for @snackbarIncorrectCorrectPoint.
  ///
  /// In en, this message translates to:
  /// **'Incorrect! The correct point was ({x}, {y}).'**
  String snackbarIncorrectCorrectPoint(int x, int y);

  /// No description provided for @snackbarReachedExit.
  ///
  /// In en, this message translates to:
  /// **'Reached the exit! Generating next maze...'**
  String get snackbarReachedExit;

  /// No description provided for @snackbarCannotMoveBlocked.
  ///
  /// In en, this message translates to:
  /// **'Cannot move forward: Blocked by wall!'**
  String get snackbarCannotMoveBlocked;

  /// No description provided for @snackbarIncorrectCorrectStack.
  ///
  /// In en, this message translates to:
  /// **'Incorrect! The correct final stack was: {stack}'**
  String snackbarIncorrectCorrectStack(String stack);

  /// No description provided for @snackbarIncorrectStudyStory.
  ///
  /// In en, this message translates to:
  /// **'Incorrect sequence! Study the story again.'**
  String get snackbarIncorrectStudyStory;

  /// No description provided for @snackbarScaleNotBalanced.
  ///
  /// In en, this message translates to:
  /// **'Scale is not balanced! Current weight is {current}, Target is {target}.'**
  String snackbarScaleNotBalanced(int current, int target);

  /// No description provided for @snackbarWordMatchedTracing.
  ///
  /// In en, this message translates to:
  /// **'Word matched! Tracing next word...'**
  String get snackbarWordMatchedTracing;

  /// No description provided for @snackbarIncorrectTraceFromStart.
  ///
  /// In en, this message translates to:
  /// **'Incorrect sequence! Try tracing from the start cell.'**
  String get snackbarIncorrectTraceFromStart;

  /// No description provided for @snackbarIncorrectCorrectForm.
  ///
  /// In en, this message translates to:
  /// **'Incorrect! The factored form is {form}'**
  String snackbarIncorrectCorrectForm(String form);

  /// No description provided for @snackbarIncorrectInequality.
  ///
  /// In en, this message translates to:
  /// **'Incorrect! {left} ({leftVal}) {correct} {right} ({rightVal})'**
  String snackbarIncorrectInequality(
      String left, int leftVal, String correct, String right, int rightVal);

  /// No description provided for @snackbarIncorrectBaseConversion.
  ///
  /// In en, this message translates to:
  /// **'Incorrect! The correct answer was {answer}'**
  String snackbarIncorrectBaseConversion(String answer);

  /// No description provided for @snackbarIncorrectStudyPairs.
  ///
  /// In en, this message translates to:
  /// **'Incorrect! Let\'s study the pairs again.'**
  String get snackbarIncorrectStudyPairs;

  /// No description provided for @snackbarAlignedCorrectly.
  ///
  /// In en, this message translates to:
  /// **'Aligned and correctly identified!'**
  String get snackbarAlignedCorrectly;

  /// No description provided for @snackbarIncorrectPerspective.
  ///
  /// In en, this message translates to:
  /// **'Incorrect perspective angle rotation! Try aligning them first.'**
  String get snackbarIncorrectPerspective;

  /// No description provided for @btnShuffleCups.
  ///
  /// In en, this message translates to:
  /// **'Shuffle Cups'**
  String get btnShuffleCups;

  /// No description provided for @btnSubmitGroup.
  ///
  /// In en, this message translates to:
  /// **'Submit Group'**
  String get btnSubmitGroup;

  /// No description provided for @btnYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get btnYes;

  /// No description provided for @btnNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get btnNo;

  /// No description provided for @btnGotIt.
  ///
  /// In en, this message translates to:
  /// **'Got It'**
  String get btnGotIt;

  /// No description provided for @btnSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get btnSubmit;

  /// No description provided for @btnShowHint.
  ///
  /// In en, this message translates to:
  /// **'Show Hint'**
  String get btnShowHint;

  /// No description provided for @btnSubmitAlignment.
  ///
  /// In en, this message translates to:
  /// **'Submit Alignment'**
  String get btnSubmitAlignment;

  /// No description provided for @btnSubmitLocation.
  ///
  /// In en, this message translates to:
  /// **'Submit Location'**
  String get btnSubmitLocation;

  /// No description provided for @btnStartDealing.
  ///
  /// In en, this message translates to:
  /// **'Start Dealing'**
  String get btnStartDealing;

  /// No description provided for @btnImReady.
  ///
  /// In en, this message translates to:
  /// **'I\'m Ready'**
  String get btnImReady;

  /// No description provided for @btnStartGame.
  ///
  /// In en, this message translates to:
  /// **'Start Game'**
  String get btnStartGame;

  /// No description provided for @btnSubmitStack.
  ///
  /// In en, this message translates to:
  /// **'Submit Stack'**
  String get btnSubmitStack;

  /// No description provided for @btnImReadyToAnswer.
  ///
  /// In en, this message translates to:
  /// **'I\'m Ready to Answer'**
  String get btnImReadyToAnswer;

  /// No description provided for @btnNoMatch.
  ///
  /// In en, this message translates to:
  /// **'No Match'**
  String get btnNoMatch;

  /// No description provided for @btnMatch.
  ///
  /// In en, this message translates to:
  /// **'Match'**
  String get btnMatch;

  /// No description provided for @btnMatchColor.
  ///
  /// In en, this message translates to:
  /// **'MATCH COLOR'**
  String get btnMatchColor;

  /// No description provided for @btnMatchWord.
  ///
  /// In en, this message translates to:
  /// **'MATCH WORD'**
  String get btnMatchWord;

  /// No description provided for @btnGuess.
  ///
  /// In en, this message translates to:
  /// **'Guess'**
  String get btnGuess;

  /// No description provided for @btnPlayNow.
  ///
  /// In en, this message translates to:
  /// **'Play Now'**
  String get btnPlayNow;

  /// No description provided for @btnClear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get btnClear;

  /// No description provided for @phaseWatchCarefully.
  ///
  /// In en, this message translates to:
  /// **'Watch carefully...'**
  String get phaseWatchCarefully;

  /// No description provided for @phaseTapCupWithBall.
  ///
  /// In en, this message translates to:
  /// **'Tap the cup with the ball!'**
  String get phaseTapCupWithBall;

  /// No description provided for @phaseTrackTheBall.
  ///
  /// In en, this message translates to:
  /// **'Track the ball'**
  String get phaseTrackTheBall;

  /// No description provided for @phaseFindTheBall.
  ///
  /// In en, this message translates to:
  /// **'Find the ball under the yellow cup!'**
  String get phaseFindTheBall;

  /// No description provided for @phaseBallUnderCup.
  ///
  /// In en, this message translates to:
  /// **'The ball is under the highlighted cup. Remember it!'**
  String get phaseBallUnderCup;

  /// No description provided for @phaseWrongCup.
  ///
  /// In en, this message translates to:
  /// **'Wrong cup! The ball was under the highlighted cup.'**
  String get phaseWrongCup;

  /// No description provided for @phaseDecodeTheSentence.
  ///
  /// In en, this message translates to:
  /// **'Decode the sentence'**
  String get phaseDecodeTheSentence;

  /// No description provided for @phaseFindTheTarget.
  ///
  /// In en, this message translates to:
  /// **'Find the target'**
  String get phaseFindTheTarget;

  /// No description provided for @phaseTargetNumber.
  ///
  /// In en, this message translates to:
  /// **'Target Number'**
  String get phaseTargetNumber;

  /// No description provided for @phaseSelectNumberToBegin.
  ///
  /// In en, this message translates to:
  /// **'Select a number to begin'**
  String get phaseSelectNumberToBegin;

  /// No description provided for @phaseMemorizeDetails.
  ///
  /// In en, this message translates to:
  /// **'Memorize the details'**
  String get phaseMemorizeDetails;

  /// No description provided for @phaseReadAndMemorize.
  ///
  /// In en, this message translates to:
  /// **'Read and Memorize Details:'**
  String get phaseReadAndMemorize;

  /// No description provided for @phaseSolveTheGrid.
  ///
  /// In en, this message translates to:
  /// **'Solve the grid'**
  String get phaseSolveTheGrid;

  /// No description provided for @phaseDirectionsList.
  ///
  /// In en, this message translates to:
  /// **'Directions List:'**
  String get phaseDirectionsList;

  /// No description provided for @phaseYourStack.
  ///
  /// In en, this message translates to:
  /// **'Your Stack'**
  String get phaseYourStack;

  /// No description provided for @phaseEmpty.
  ///
  /// In en, this message translates to:
  /// **'Empty'**
  String get phaseEmpty;

  /// No description provided for @phaseTapToAdd.
  ///
  /// In en, this message translates to:
  /// **'Tap to Add'**
  String get phaseTapToAdd;

  /// No description provided for @phaseCalculationLabel.
  ///
  /// In en, this message translates to:
  /// **'Calculation:'**
  String get phaseCalculationLabel;

  /// No description provided for @phaseTimeLeft.
  ///
  /// In en, this message translates to:
  /// **'Time: {time}s'**
  String phaseTimeLeft(int time);

  /// No description provided for @phaseRemember2Back.
  ///
  /// In en, this message translates to:
  /// **'Remember 2 steps back'**
  String get phaseRemember2Back;

  /// No description provided for @phaseMatch.
  ///
  /// In en, this message translates to:
  /// **'Match'**
  String get phaseMatch;

  /// No description provided for @hintTypeRhymingWord.
  ///
  /// In en, this message translates to:
  /// **'Type a rhyming word...'**
  String get hintTypeRhymingWord;

  /// No description provided for @hintStartTyping.
  ///
  /// In en, this message translates to:
  /// **'Start typing...'**
  String get hintStartTyping;

  /// No description provided for @hintTypeHeardWord.
  ///
  /// In en, this message translates to:
  /// **'Type the heard word'**
  String get hintTypeHeardWord;

  /// No description provided for @hintTypeGuess.
  ///
  /// In en, this message translates to:
  /// **'Type your guess...'**
  String get hintTypeGuess;

  /// No description provided for @hintTypeAnswerHere.
  ///
  /// In en, this message translates to:
  /// **'Type answer here'**
  String get hintTypeAnswerHere;

  /// No description provided for @hintEnterNextWord.
  ///
  /// In en, this message translates to:
  /// **'Enter next word...'**
  String get hintEnterNextWord;

  /// No description provided for @howToPlayTitle.
  ///
  /// In en, this message translates to:
  /// **'How to Play'**
  String get howToPlayTitle;

  /// No description provided for @howToPlayStep1.
  ///
  /// In en, this message translates to:
  /// **'1. A secret number is chosen between 1 and 10,000.'**
  String get howToPlayStep1;

  /// No description provided for @howToPlayStep2.
  ///
  /// In en, this message translates to:
  /// **'2. Type your guess on the number pad and submit it.'**
  String get howToPlayStep2;

  /// No description provided for @howToPlayStep3.
  ///
  /// In en, this message translates to:
  /// **'3. If wrong, you will get feedback on whether the secret is higher or lower.'**
  String get howToPlayStep3;

  /// No description provided for @howToPlayStep4.
  ///
  /// In en, this message translates to:
  /// **'4. You have exactly 15 attempts to find the secret number.'**
  String get howToPlayStep4;

  /// No description provided for @noGuessesYet.
  ///
  /// In en, this message translates to:
  /// **'No Guesses Yet'**
  String get noGuessesYet;

  /// No description provided for @chancesLeft.
  ///
  /// In en, this message translates to:
  /// **'Chances Left'**
  String get chancesLeft;

  /// No description provided for @guessesMade.
  ///
  /// In en, this message translates to:
  /// **'Guesses Made'**
  String get guessesMade;

  /// No description provided for @feedbackFindNumber.
  ///
  /// In en, this message translates to:
  /// **'Find the number between 1 and 10,000!'**
  String get feedbackFindNumber;

  /// No description provided for @feedbackEnterNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a number between 1 and 10,000!'**
  String get feedbackEnterNumber;

  /// No description provided for @feedbackCorrectExcl.
  ///
  /// In en, this message translates to:
  /// **'Correct! The number was {number}.'**
  String feedbackCorrectExcl(int number);

  /// No description provided for @feedbackCorrectEmoji.
  ///
  /// In en, this message translates to:
  /// **'Correct!'**
  String get feedbackCorrectEmoji;

  /// No description provided for @feedbackTooLow.
  ///
  /// In en, this message translates to:
  /// **'Too Low'**
  String get feedbackTooLow;

  /// No description provided for @feedbackTooHigh.
  ///
  /// In en, this message translates to:
  /// **'Too High'**
  String get feedbackTooHigh;

  /// No description provided for @feedbackGameOver.
  ///
  /// In en, this message translates to:
  /// **'Game Over! The number was {number}.'**
  String feedbackGameOver(int number);

  /// No description provided for @feedbackGuessResult.
  ///
  /// In en, this message translates to:
  /// **'{guess} is {result}!'**
  String feedbackGuessResult(int guess, String result);

  /// No description provided for @feedbackWinMessage.
  ///
  /// In en, this message translates to:
  /// **'Correct! You found {number} with {guesses} guesses left!'**
  String feedbackWinMessage(int number, int guesses);

  /// No description provided for @feedbackLoseMessage.
  ///
  /// In en, this message translates to:
  /// **'Out of guesses! The number was {number}.'**
  String feedbackLoseMessage(int number);

  /// No description provided for @statTime.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get statTime;

  /// No description provided for @statScore.
  ///
  /// In en, this message translates to:
  /// **'Score'**
  String get statScore;

  /// No description provided for @statGrid.
  ///
  /// In en, this message translates to:
  /// **'Grid'**
  String get statGrid;

  /// No description provided for @statMatches.
  ///
  /// In en, this message translates to:
  /// **'Matches'**
  String get statMatches;

  /// No description provided for @statLives.
  ///
  /// In en, this message translates to:
  /// **'Lives'**
  String get statLives;

  /// No description provided for @statBeats.
  ///
  /// In en, this message translates to:
  /// **'Beats'**
  String get statBeats;

  /// No description provided for @statPerfect.
  ///
  /// In en, this message translates to:
  /// **'Perfect'**
  String get statPerfect;

  /// No description provided for @statSeenPool.
  ///
  /// In en, this message translates to:
  /// **'Seen Pool'**
  String get statSeenPool;

  /// No description provided for @statCards.
  ///
  /// In en, this message translates to:
  /// **'Cards'**
  String get statCards;

  /// No description provided for @statSpan.
  ///
  /// In en, this message translates to:
  /// **'Span'**
  String get statSpan;

  /// No description provided for @statLength.
  ///
  /// In en, this message translates to:
  /// **'Length'**
  String get statLength;

  /// No description provided for @statItems.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get statItems;

  /// No description provided for @statProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get statProgress;

  /// No description provided for @statTrials.
  ///
  /// In en, this message translates to:
  /// **'Trials'**
  String get statTrials;

  /// No description provided for @statTrails.
  ///
  /// In en, this message translates to:
  /// **'Trails'**
  String get statTrails;

  /// No description provided for @statMoves.
  ///
  /// In en, this message translates to:
  /// **'Moves'**
  String get statMoves;

  /// No description provided for @statFocalSearch.
  ///
  /// In en, this message translates to:
  /// **'Focal search on oscillations'**
  String get statFocalSearch;

  /// No description provided for @phaseMemorizeSequence.
  ///
  /// In en, this message translates to:
  /// **'Memorize the sequence order'**
  String get phaseMemorizeSequence;

  /// No description provided for @phaseDetermineOrder.
  ///
  /// In en, this message translates to:
  /// **'Determine which item came first/last'**
  String get phaseDetermineOrder;

  /// No description provided for @phaseCorrectOrder.
  ///
  /// In en, this message translates to:
  /// **'Correct order!'**
  String get phaseCorrectOrder;

  /// No description provided for @phaseWrongTimeline.
  ///
  /// In en, this message translates to:
  /// **'Wrong timeline!'**
  String get phaseWrongTimeline;

  /// No description provided for @phaseWatchPattern.
  ///
  /// In en, this message translates to:
  /// **'Watch the pattern'**
  String get phaseWatchPattern;

  /// No description provided for @phaseRepeatPattern.
  ///
  /// In en, this message translates to:
  /// **'Repeat the pattern'**
  String get phaseRepeatPattern;

  /// No description provided for @phaseExcellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent!'**
  String get phaseExcellent;

  /// No description provided for @phaseTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again!'**
  String get phaseTryAgain;

  /// No description provided for @phaseChooseWordFit.
  ///
  /// In en, this message translates to:
  /// **'Choose the word that fits'**
  String get phaseChooseWordFit;

  /// No description provided for @phaseExcellentContextual.
  ///
  /// In en, this message translates to:
  /// **'Excellent contextual match!'**
  String get phaseExcellentContextual;

  /// No description provided for @phaseIncorrectMatch.
  ///
  /// In en, this message translates to:
  /// **'Incorrect match'**
  String get phaseIncorrectMatch;

  /// No description provided for @phaseMemorizePattern.
  ///
  /// In en, this message translates to:
  /// **'Memorize the pattern'**
  String get phaseMemorizePattern;

  /// No description provided for @phaseSelectTiles.
  ///
  /// In en, this message translates to:
  /// **'Select the tiles'**
  String get phaseSelectTiles;

  /// No description provided for @phaseWrongTile.
  ///
  /// In en, this message translates to:
  /// **'Wrong tile'**
  String get phaseWrongTile;

  /// No description provided for @phaseMemorizeRedCell.
  ///
  /// In en, this message translates to:
  /// **'Memorize red cell location'**
  String get phaseMemorizeRedCell;

  /// No description provided for @phaseIsSymmetrical.
  ///
  /// In en, this message translates to:
  /// **'Is the pattern symmetrical?'**
  String get phaseIsSymmetrical;

  /// No description provided for @phaseRecallSequence.
  ///
  /// In en, this message translates to:
  /// **'Recall sequence in correct order'**
  String get phaseRecallSequence;

  /// No description provided for @phaseGreatJob.
  ///
  /// In en, this message translates to:
  /// **'Great job!'**
  String get phaseGreatJob;

  /// No description provided for @phaseChooseNovelCard.
  ///
  /// In en, this message translates to:
  /// **'Choose a novel card'**
  String get phaseChooseNovelCard;

  /// No description provided for @phaseAlreadyTapped.
  ///
  /// In en, this message translates to:
  /// **'Already tapped!'**
  String get phaseAlreadyTapped;

  /// No description provided for @phaseCountBlueCircles.
  ///
  /// In en, this message translates to:
  /// **'Count only blue circles'**
  String get phaseCountBlueCircles;

  /// No description provided for @phaseRecallCountsOrder.
  ///
  /// In en, this message translates to:
  /// **'Recall counts in correct order'**
  String get phaseRecallCountsOrder;

  /// No description provided for @phaseChooseNovel.
  ///
  /// In en, this message translates to:
  /// **'Choose the novel card'**
  String get phaseChooseNovel;

  /// No description provided for @phaseMemorizeCard.
  ///
  /// In en, this message translates to:
  /// **'Memorize this card'**
  String get phaseMemorizeCard;

  /// No description provided for @phaseWaitForIt.
  ///
  /// In en, this message translates to:
  /// **'Wait for it...'**
  String get phaseWaitForIt;

  /// No description provided for @phaseThatWasSample.
  ///
  /// In en, this message translates to:
  /// **'That was the sample!'**
  String get phaseThatWasSample;

  /// No description provided for @phaseSolveDistractor.
  ///
  /// In en, this message translates to:
  /// **'Solve the distractor question!'**
  String get phaseSolveDistractor;

  /// No description provided for @phaseSelectMemorized.
  ///
  /// In en, this message translates to:
  /// **'Select the memorized cells'**
  String get phaseSelectMemorized;

  /// No description provided for @phasePerfectRecall.
  ///
  /// In en, this message translates to:
  /// **'Perfect recall!'**
  String get phasePerfectRecall;

  /// No description provided for @phaseWrongExcl.
  ///
  /// In en, this message translates to:
  /// **'Wrong!'**
  String get phaseWrongExcl;

  /// No description provided for @phaseMemorizePlacements.
  ///
  /// In en, this message translates to:
  /// **'Memorize all placements'**
  String get phaseMemorizePlacements;

  /// No description provided for @phaseWaitingForShift.
  ///
  /// In en, this message translates to:
  /// **'Waiting for layout shift...'**
  String get phaseWaitingForShift;

  /// No description provided for @phaseTapMovedObject.
  ///
  /// In en, this message translates to:
  /// **'Tap the object that moved'**
  String get phaseTapMovedObject;

  /// No description provided for @phaseWrongObject.
  ///
  /// In en, this message translates to:
  /// **'Wrong object!'**
  String get phaseWrongObject;

  /// No description provided for @phaseStudyColorShape.
  ///
  /// In en, this message translates to:
  /// **'Study the color-shape connections'**
  String get phaseStudyColorShape;

  /// No description provided for @phaseTapMatchingTrait.
  ///
  /// In en, this message translates to:
  /// **'Tap the matching trait'**
  String get phaseTapMatchingTrait;

  /// No description provided for @phaseGreatRecall.
  ///
  /// In en, this message translates to:
  /// **'Great recall!'**
  String get phaseGreatRecall;

  /// No description provided for @phaseWrongLink.
  ///
  /// In en, this message translates to:
  /// **'Wrong link!'**
  String get phaseWrongLink;

  /// No description provided for @phaseTrueOrFalse.
  ///
  /// In en, this message translates to:
  /// **'Is this statement true or false?'**
  String get phaseTrueOrFalse;

  /// No description provided for @phaseMemorizeLetter.
  ///
  /// In en, this message translates to:
  /// **'Memorize this letter'**
  String get phaseMemorizeLetter;

  /// No description provided for @phaseRecallLettersSequence.
  ///
  /// In en, this message translates to:
  /// **'Recall letters in sequence'**
  String get phaseRecallLettersSequence;

  /// No description provided for @phaseMemorizeTileColors.
  ///
  /// In en, this message translates to:
  /// **'Memorize tile colors'**
  String get phaseMemorizeTileColors;

  /// No description provided for @phasePaintCells.
  ///
  /// In en, this message translates to:
  /// **'Paint cells to match original'**
  String get phasePaintCells;

  /// No description provided for @phaseIncorrectMatchExcl.
  ///
  /// In en, this message translates to:
  /// **'Incorrect match!'**
  String get phaseIncorrectMatchExcl;

  /// No description provided for @phaseKeepYourEyes.
  ///
  /// In en, this message translates to:
  /// **'Keep your eyes on it!'**
  String get phaseKeepYourEyes;

  /// No description provided for @phaseWhereIsTarget.
  ///
  /// In en, this message translates to:
  /// **'Where is the target object?'**
  String get phaseWhereIsTarget;

  /// No description provided for @phaseTrackStar.
  ///
  /// In en, this message translates to:
  /// **'Track Star'**
  String get phaseTrackStar;

  /// No description provided for @dialogIncorrectSequenceStudy.
  ///
  /// In en, this message translates to:
  /// **'Incorrect sequence! Study the story again.'**
  String get dialogIncorrectSequenceStudy;

  /// No description provided for @dialogStoryReconstruct.
  ///
  /// In en, this message translates to:
  /// **'Reconstruct the story by tapping sentences in order'**
  String get dialogStoryReconstruct;

  /// No description provided for @dialogMemorizeOrder.
  ///
  /// In en, this message translates to:
  /// **'Memorize the chronological order of events'**
  String get dialogMemorizeOrder;

  /// No description provided for @dialogMemorizeWordPairs.
  ///
  /// In en, this message translates to:
  /// **'Memorize these word pairs'**
  String get dialogMemorizeWordPairs;

  /// No description provided for @dialogWhichWordPaired.
  ///
  /// In en, this message translates to:
  /// **'Which word was paired with the target?'**
  String get dialogWhichWordPaired;

  /// No description provided for @dialogWatchSequence.
  ///
  /// In en, this message translates to:
  /// **'Watch the sequence path'**
  String get dialogWatchSequence;

  /// No description provided for @dialogRepeatPath.
  ///
  /// In en, this message translates to:
  /// **'Repeat the path sequence'**
  String get dialogRepeatPath;

  /// No description provided for @dialogShapeShifterTap.
  ///
  /// In en, this message translates to:
  /// **'Tap shapes that match the active target'**
  String get dialogShapeShifterTap;

  /// No description provided for @dialogFocusTunnelTap.
  ///
  /// In en, this message translates to:
  /// **'Tap incoming shapes ONLY if they match the symbol seen 2 steps ago (2-Back).'**
  String get dialogFocusTunnelTap;

  /// No description provided for @dialogSequenceStackBuild.
  ///
  /// In en, this message translates to:
  /// **'Mentally track stack operations, then rebuild the final stack from bottom to top.'**
  String get dialogSequenceStackBuild;

  /// No description provided for @dialogFactorTreeComplete.
  ///
  /// In en, this message translates to:
  /// **'Complete the factor tree by tapping nodes and matching factors!'**
  String get dialogFactorTreeComplete;

  /// No description provided for @dialogBinaryScaleBalance.
  ///
  /// In en, this message translates to:
  /// **'Balance the scale by selecting powers of two (binary weights) that sum to the target.'**
  String get dialogBinaryScaleBalance;

  /// No description provided for @dialogMatrixMultiplierSelect.
  ///
  /// In en, this message translates to:
  /// **'Select one row and one column that multiply to the target'**
  String get dialogMatrixMultiplierSelect;

  /// No description provided for @dialogOddEvenFlashTap.
  ///
  /// In en, this message translates to:
  /// **'Tap the card when the active rule is satisfied'**
  String get dialogOddEvenFlashTap;

  /// No description provided for @dialogBaseConversionConvert.
  ///
  /// In en, this message translates to:
  /// **'Convert the value from the source base to the destination base.'**
  String get dialogBaseConversionConvert;

  /// No description provided for @dialogGhostTapSync.
  ///
  /// In en, this message translates to:
  /// **'Synchronize with the rhythm, then tap when the invisible pulse would reach peak size.'**
  String get dialogGhostTapSync;

  /// No description provided for @dialogFrequencyTapIdentify.
  ///
  /// In en, this message translates to:
  /// **'Identify which pulsing light matches the requested target frequency.'**
  String get dialogFrequencyTapIdentify;

  /// No description provided for @dialogLetterGridSwap.
  ///
  /// In en, this message translates to:
  /// **'Swap adjacent letters to form the target words in rows.'**
  String get dialogLetterGridSwap;

  /// No description provided for @dialogGraphCoordinatePlot.
  ///
  /// In en, this message translates to:
  /// **'Plot the coordinates on the Cartesian plane satisfying the equation.'**
  String get dialogGraphCoordinatePlot;

  /// No description provided for @dialogDigitSwapEquation.
  ///
  /// In en, this message translates to:
  /// **'Swap one digit from the top equation with one from the bottom equation to make both correct.'**
  String get dialogDigitSwapEquation;

  /// No description provided for @dialogAreaPerimeterAdjust.
  ///
  /// In en, this message translates to:
  /// **'Adjust the rectangle dimensions to match the target area and perimeter.'**
  String get dialogAreaPerimeterAdjust;

  /// No description provided for @dialogCrackCipher.
  ///
  /// In en, this message translates to:
  /// **'Crack character-digit substitution cipher math problems.'**
  String get dialogCrackCipher;

  /// No description provided for @dialogPeripheralFocus.
  ///
  /// In en, this message translates to:
  /// **'Solve math center equations, tap side panels when they flash'**
  String get dialogPeripheralFocus;

  /// No description provided for @dialogGokigenSatisfy.
  ///
  /// In en, this message translates to:
  /// **'Satisfy vertex clues and avoid closed loops'**
  String get dialogGokigenSatisfy;

  /// No description provided for @dialogPercentageCalculate.
  ///
  /// In en, this message translates to:
  /// **'Calculate discount percentages and final checkout totals.'**
  String get dialogPercentageCalculate;

  /// No description provided for @dialogBinomialMatch.
  ///
  /// In en, this message translates to:
  /// **'Match quadratic formulas with factored binomial values.'**
  String get dialogBinomialMatch;

  /// No description provided for @dialogNumberBondsCalculate.
  ///
  /// In en, this message translates to:
  /// **'Calculate the missing value in the number bond hierarchy.'**
  String get dialogNumberBondsCalculate;

  /// No description provided for @correctLowercase.
  ///
  /// In en, this message translates to:
  /// **'correct'**
  String get correctLowercase;

  /// No description provided for @incorrectLowercase.
  ///
  /// In en, this message translates to:
  /// **'incorrect'**
  String get incorrectLowercase;

  /// No description provided for @notAValidWord.
  ///
  /// In en, this message translates to:
  /// **'Not a valid word'**
  String get notAValidWord;

  /// No description provided for @enterNumberRange.
  ///
  /// In en, this message translates to:
  /// **'ENTER A NUMBER BETWEEN 1 AND 10,000!'**
  String get enterNumberRange;

  /// No description provided for @correctExclEmoji.
  ///
  /// In en, this message translates to:
  /// **'Correct!'**
  String get correctExclEmoji;

  /// No description provided for @wrongExcl.
  ///
  /// In en, this message translates to:
  /// **'Wrong!'**
  String get wrongExcl;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'bn',
        'de',
        'en',
        'es',
        'fa',
        'fr',
        'hi',
        'id',
        'it',
        'ja',
        'ko',
        'mr',
        'pl',
        'pt',
        'ru',
        'ta',
        'te',
        'th',
        'tr',
        'ur',
        'vi',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'mr':
      return AppLocalizationsMr();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
