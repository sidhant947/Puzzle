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
  String targetNumberSubtitle(int target);

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
