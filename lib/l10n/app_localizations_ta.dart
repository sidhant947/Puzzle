// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'பசில் விளையாட்டுகள்';

  @override
  String get home => 'முகப்பு';

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get playAgain => 'மீண்டும் விளையாடு';

  @override
  String get playNext => 'அடுத்தது விளையாடு';

  @override
  String get seeCompleted => 'மதிப்பாய்வு';

  @override
  String get finish => 'முடிக்கவும்';

  @override
  String get congrats => 'வாழ்த்துக்கள்';

  @override
  String get perfectGradient => 'சரியான கிரேடியன்ட்!';

  @override
  String get wellDone => 'மிகச்சிறப்பு';

  @override
  String get timeUp => 'நேரம் முடிந்தது!';

  @override
  String get victory => 'வெற்றி!';

  @override
  String get gameWin => 'நன்று!';

  @override
  String get completed => 'முடிந்தது!';

  @override
  String get score => 'மதிப்பெண்';

  @override
  String get timeLeft => 'நேரம்';

  @override
  String get trials => 'முயற்சிகள்';

  @override
  String get numberRule => 'எண் விதி';

  @override
  String get colorRule => 'நிற விதி';

  @override
  String get valid => 'செல்லுபடியாகும்';

  @override
  String get invalid => 'செல்லுபடியாகாது';

  @override
  String get even => 'இரட்டை';

  @override
  String get odd => 'ஒற்றை';

  @override
  String get red => 'சிவப்பு';

  @override
  String get green => 'பச்சை';

  @override
  String get blue => 'நீலம்';

  @override
  String get yes => 'ஆம்';

  @override
  String get no => 'இல்லை';

  @override
  String get trueLabel => 'உண்மை';

  @override
  String get falseLabel => 'தவறு';

  @override
  String get clear => 'அழிக்கவும்';

  @override
  String get north => 'வடக்கு';

  @override
  String get south => 'தெற்கு';

  @override
  String get east => 'கிழக்கு';

  @override
  String get west => 'மேற்கு';

  @override
  String get target => 'இலக்கு';

  @override
  String get moves => 'நகர்வுகள்';

  @override
  String get trialMode => 'முயற்சி முறை';

  @override
  String get trialModeDescription =>
      '60 வினாடி நேரத்திற்குப் பதில் 20 புதிர்களைத் தீர்த்து முடிக்கவும்';

  @override
  String get appearance => 'தோற்றம்';

  @override
  String get language => 'மொழி';

  @override
  String get gameplay => 'விளையாட்டு முறை';

  @override
  String get supportUs => 'எங்களுக்கு ஆதரவளிக்கவும்';

  @override
  String get systemLegal => 'அமைப்பு மற்றும் சட்டம்';

  @override
  String get games => 'விளையாட்டுகள்';

  @override
  String get solvedToday => 'இன்று தீர்க்கப்பட்டவை';

  @override
  String get searchGames => 'விளையாட்டுகளைத் தேடவும்...';

  @override
  String get readyToStart => 'உங்கள் மூளைக்கான பயிற்சியைத் தொடங்கத் தயாரா?';

  @override
  String get greatStart => 'சிறந்த ஆரம்பம்! இதே வேகத்தைத் தொடரவும்.';

  @override
  String get onFire => 'அருமை! உங்கள் மூளை இதை விரும்புகிறது.';

  @override
  String get incredible => 'நம்பமுடியாதது! நீங்கள் ஒரு புதிர் மாஸ்டர்.';

  @override
  String get noGamesMatch => 'உங்கள் தேடலுக்கு ஏற்ற விளையாட்டுகள் இல்லை';

  @override
  String get categoryAll => 'அனைத்தும்';

  @override
  String get categoryAttention => 'கவனம்';

  @override
  String get categoryLogic => 'தருக்கம்';

  @override
  String get categoryMath => 'கணிதம்';

  @override
  String get categoryWord => 'வார்த்தை';

  @override
  String get categoryMemory => 'நினைவாற்றல்';

  @override
  String get categorySpatial => 'இடம் சார்ந்த';

  @override
  String get themeLight => 'வெளிச்சம்';

  @override
  String get themeDark => 'இருள்';

  @override
  String get themeSystem => 'அமைப்பு';

  @override
  String get starOnGithub => 'GitHub இல் ஸ்டார் செய்யவும்';

  @override
  String get sponsorOnGithub => 'GitHub இல் ஸ்பான்சர் செய்யவும்';

  @override
  String get privacyPolicy => 'தனியுரிமைக் கொள்கை';

  @override
  String get termsOfService => 'சேவை விதிமுறைகள்';

  @override
  String get licenses => 'உரிமங்கள்';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return 'மறைக்கப்பட்ட $wordLength-எழுத்து வார்த்தையைக் கண்டுபிடிக்க உங்களுக்கு $maxTries முயற்சிகள் உள்ளன.';
  }

  @override
  String wordFoundMessage(String word) {
    return 'வார்த்தை வெற்றிகரமாகக் கண்டறியப்பட்டது: $word';
  }

  @override
  String gameOverMessage(String word) {
    return 'அந்த வார்த்தை: $word';
  }

  @override
  String get gameOver => 'விளையாட்டு முடிந்தது';

  @override
  String get crosswordTitle => 'குறுக்கெழுத்து';

  @override
  String get crosswordSubtitle =>
      'வழங்கப்பட்ட குறிப்புகளின் அடிப்படையில் சரியான வார்த்தைகளைக் கொண்டு கட்டத்தை நிரப்பவும்.';

  @override
  String get wordSearchTitle => 'வார்த்தை தேடல்';

  @override
  String get radicalRootsTitle => 'வர்க்கமூலங்கள்';

  @override
  String get radicalRootsSubtitle =>
      'கொடுக்கப்பட்ட எண்ணின் வர்க்கமூலம் அல்லது கனமூலத்தைக் கண்டறியவும். தேவைப்பட்டால் அருகிலுள்ள முழு எண்ணிற்கு மாற்றவும்.';

  @override
  String get radicalRootsGoalReached => 'இலக்கு எட்டப்பட்டது!';

  @override
  String get radicalRootsTimeUp => 'நேரம் முடிந்தது!';

  @override
  String radicalRootsScoreMessage(int score) {
    return 'நீங்கள் $score மூலங்களைச் சரியாகக் கணக்கிட்டுள்ளீர்கள்!';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return 'தொடர்ந்து பயிற்சி செய்யுங்கள்! நீங்கள் $score மூலங்களைக் கணக்கிட்டுள்ளீர்கள்.';
  }

  @override
  String get radicalRootsStart => 'கணக்கிடத் தொடங்கவும்';

  @override
  String get radicalRootsDescription =>
      'உங்களால் முடிந்தவரை தீர்க்க உங்களுக்கு 60 வினாடிகள் உள்ளன.';

  @override
  String get radicalRootsBest => 'சிறந்தவை';

  @override
  String get radicalRootsSeconds => '60 வினாடிகள்';

  @override
  String get romanArithmeticTitle => 'ரோமன் எண்கணிதம்';

  @override
  String get romanArithmeticSubtitle =>
      'ரோமன் எண்களைப் பயன்படுத்தி கூட்டல் மற்றும் கழித்தல் கணக்குகளைத் தீர்க்கவும்.';

  @override
  String get romanArithmeticGoalReached => 'செஞ்சுரியன் நிலை!';

  @override
  String get romanArithmeticTimeUp => 'நேரம் முடிந்தது!';

  @override
  String romanArithmeticScoreMessage(int score) {
    return 'நீங்கள் $score ரோமன் கணக்குகளைத் தீர்த்துள்ளீர்கள்!';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return 'வேனி, விடி, விச்சி! நீங்கள் $score கணக்குகளைத் தீர்த்துள்ளீர்கள்.';
  }

  @override
  String get romanArithmeticStart => 'தேடலைத் தொடங்கவும்';

  @override
  String get romanArithmeticDescription =>
      'மாற்றி தீர்க்கவும். உங்களுக்கு 60 வினாடிகள் உள்ளன.';

  @override
  String get romanArithmeticBest => 'சிறந்தவை';

  @override
  String get romanArithmeticSeconds => '60 வினாடிகள்';

  @override
  String get wordSearchSubtitle =>
      'கட்டத்தில் மறைந்துள்ள அனைத்து வார்த்தைகளையும் கண்டறியவும். தேர்ந்தெடுக்க இழுக்கவும்.';

  @override
  String get missingVowelsTitle => 'விடுபட்ட உயிர் எழுத்துக்கள்';

  @override
  String get missingVowelsSubtitle =>
      'உயிர் எழுத்துக்கள் மறைக்கப்பட்ட வார்த்தையைக் கண்டறியவும்.';

  @override
  String get missingVowelsWin => 'உயிர் எழுத்துக்கள் மீட்டெடுக்கப்பட்டன!';

  @override
  String get missingVowelsHowToPlay =>
      'ஒரு வார்த்தை அதன் உயிர் எழுத்துக்கள் (A, E, I, O, U) மறைக்கப்பட்ட நிலையில் காட்டப்படும். முழு வார்த்தையையும் யூகிக்கவும்!';

  @override
  String get wordScrambleTitle => 'வார்த்தை குழப்பம்';

  @override
  String get wordScrambleSubtitle =>
      'மறைக்கப்பட்ட வார்த்தையை அறிய எழுத்துக்களைத் தட்டவும்!';

  @override
  String get wordScrambleWin => 'வார்த்தை கண்டறியப்பட்டது!';

  @override
  String get sudokuTitle => 'சுடோகு';

  @override
  String get sudokuSubtitle =>
      'ஒவ்வொரு வரிசை, நிரல் மற்றும் 3x3 பெட்டியிலும் 1 முதல் 9 வரையிலான அனைத்து எண்களும் இருக்குமாறு கட்டத்தை நிரப்பவும்.';

  @override
  String get minesweeperTitle => 'மைன்ஸ்வீப்பர்';

  @override
  String get minesweeperSubtitle =>
      'வெடிக்கச் செய்யாமல் அனைத்து கண்ணிவெடிகளையும் கண்டறியவும்.';

  @override
  String get minesweeperWin => 'வெற்றி!';

  @override
  String get minesweeperMines => 'கண்ணிவெடிகள்';

  @override
  String get minesweeperStatus => 'நிலை';

  @override
  String get minesweeperWon => 'வெற்றி';

  @override
  String get minesweeperBoom => 'வெடிப்பு';

  @override
  String get minesweeperPlaying => 'விளையாடுகிறது';

  @override
  String get minesweeperReveal => 'வெளிப்படுத்து';

  @override
  String get minesweeperFlag => 'கொடி';

  @override
  String get game2048Title => '2048';

  @override
  String get game2048Subtitle =>
      'கட்டங்களை இணைத்து 2048 கட்டத்தை அடைய எந்த திசையிலும் ஸ்வைப் செய்யவும்!';

  @override
  String get nonogramTitle => 'நோனோகிராம்';

  @override
  String get nonogramSubtitle =>
      'தருக்க குறிப்புகளைப் பயன்படுத்தி மறைக்கப்பட்ட படத்தைக் கண்டறியவும்.';

  @override
  String get nonogramWin => 'படம் வெளிப்பட்டது!';

  @override
  String get magnetsTitle => 'காந்தங்கள்';

  @override
  String get magnetsSubtitle =>
      'துருவ எண்ணிக்கையின் அடிப்படையில் கட்டத்தில் காந்தங்களை வைக்கவும்.';

  @override
  String get magnetsHowToPlay =>
      'டோமினோ அளவிலான கொள்கலன்களை \'+\' மற்றும் \'-\' காந்தங்களால் நிரப்பவும் அல்லது காலியாக விடவும். வரிசை மற்றும் நெடுவரிசை குறிப்புகள் அந்த வரியில் உள்ள ஒவ்வொரு துருவத்தின் மொத்த எண்ணிக்கையைக் குறிப்பிடுகின்றன. ஒரே மாதிரியான துருவங்கள் செங்குத்தாகவோ அல்லது கிடைமட்டமாகவோ அடுத்தடுத்து இருக்கக்கூடாது.';

  @override
  String get magnetsWinTitle => 'துருவமுனைப்பு சமநிலைப்படுத்தப்பட்டது!';

  @override
  String get magnetsWinMessage =>
      'அனைத்து காந்தங்களும் கச்சிதமாக அமைக்கப்பட்டுள்ளன!';

  @override
  String get lighthousesTitle => 'கலங்கரை விளக்கங்கள்';

  @override
  String get lighthousesSubtitle =>
      'கலங்கரை விளக்கக் குறிப்புகளின் அடிப்படையில் கப்பல்களை வைக்கவும்.';

  @override
  String get lighthousesHowToPlay =>
      'கட்டத்தில் 1x1 கப்பல்களை வைக்கவும். கலங்கரை விளக்கங்கள் கிடைமட்டமாகவும் செங்குத்தாகவும் தெரியும் கப்பல்களின் மொத்த எண்ணிக்கையைக் குறிக்கின்றன. கப்பல்கள் கலங்கரை விளக்கங்களையோ அல்லது ஒன்றையொன்று தொடக்கூடாது, மூலைவிட்டமாக கூட.';

  @override
  String get lighthousesWinTitle => 'கடல் பாதுகாப்பு!';

  @override
  String get lighthousesWinMessage =>
      'அனைத்து கலங்கரை விளக்கங்களும் கப்பல்களை கச்சிதமாக வழிநடத்துகின்றன!';

  @override
  String get dominosaTitle => 'டோமினோசா';

  @override
  String get dominosaSubtitle =>
      'கட்டத்தில் மறைந்திருக்கும் அனைத்து டோமினோக்களையும் கண்டறியவும்.';

  @override
  String get dominosaHowToPlay =>
      'எண்களின் கட்டத்தில் டோமினோக்களின் முழுமையான தொகுப்பை வரிசைப்படுத்தவும், இதனால் அடுத்தடுத்த எண்களின் ஒவ்வொரு ஜோடியும் சரியாக ஒரு டோமினோவால் மூடப்பட்டிருக்கும். ஒவ்வொரு எண் ஜோடியும் தொகுப்பில் ஒரு முறை மட்டுமே இருக்கும்.';

  @override
  String get dominosaWinTitle => 'டோமினோ மாஸ்டர்!';

  @override
  String get dominosaWinMessage =>
      'ஒவ்வொரு டோமினோவும் கண்டறியப்பட்டு வைக்கப்பட்டுள்ளது!';

  @override
  String get skyscrapersTitle => 'வானளாவிய கட்டிடங்கள்';

  @override
  String get skyscrapersSubtitle => 'கட்டிட உயரங்களுடன் கட்டத்தை நிரப்பவும்.';

  @override
  String get skyscrapersHowToPlay =>
      'ஒவ்வொரு வரிசையிலும் நெடுவரிசையிலும் ஒவ்வொரு உயரமும் சரியாக ஒரு முறை இருக்குமாறு கட்டத்தை உயரங்களால் (1-N) நிரப்பவும். விளிம்புகளில் உள்ள குறிப்புகள் அந்த திசையில் இருந்து எத்தனை கட்டிடங்கள் தெரியும் என்பதைக் குறிக்கின்றன, உயரமான கட்டிடங்கள் குட்டையான கட்டிடங்களை மறைக்கின்றன.';

  @override
  String get skyscrapersWinTitle => 'ஸ்கைலைன் மீட்டெடுக்கப்பட்டது!';

  @override
  String get skyscrapersWinMessage =>
      'அனைத்து கட்டிடங்களும் கச்சிதமாக நிலைநிறுத்தப்பட்டுள்ளன!';

  @override
  String get nurikabeTitle => 'நுரிகாபே';

  @override
  String get nurikabeSubtitle =>
      'இணைக்கப்பட்ட கடல் and தனித்தனி தீவுகளை உருவாக்கவும்.';

  @override
  String get nurikabeHowToPlay =>
      'ஒரு இணைக்கப்பட்ட \'கடலை\' உருவாக்க செல்களை நிழலிடவும் (2x2 தொகுதிகள் இல்லை). நிழலிடப்படாத செல்கள் \'தீவுகளை\' உருவாக்குகின்றன, ஒவ்வொன்றும் அதன் மொத்த பரப்பளவைக் குறிக்கும் சரியாக ஒரு எண்ணைக் கொண்டிருக்கும்.';

  @override
  String get nurikabeWinTitle => 'கடல் பாய்கிறது!';

  @override
  String get nurikabeWinMessage =>
      'தீவுகள் பிரிக்கப்பட்டன, கடல் இணைக்கப்பட்டது!';

  @override
  String get fillominoTitle => 'ஃபில்லோமினோ';

  @override
  String get fillominoSubtitle =>
      'குறிப்பிட்ட அளவிலான பாலியோமினோக்களாக கட்டத்தைப் பிரிக்கவும்.';

  @override
  String get fillominoHowToPlay =>
      'கட்டத்தைப் பாலியோமினோக்களாகப் பிரிக்கவும், இதனால் N அளவுள்ள ஒவ்வொரு பாலியோமினோவும் அதன் அனைத்து செல்களிலும் N எண்ணைக் கொண்டிருக்கும். ஒரே அளவுள்ள பாலியோமினோக்கள் அடுத்தடுத்து இருக்கக்கூடாது.';

  @override
  String get fillominoWinTitle => 'கட்டம் பிரிக்கப்பட்டது!';

  @override
  String get fillominoWinMessage =>
      'தர்க்கத்துடன் கச்சிதமாக அடுக்கப்பட்டுள்ளது!';

  @override
  String get hitoriTitle => 'ஹிடோரி';

  @override
  String get hitoriSubtitle =>
      'ஒவ்வொரு வரிசையிலும் நெடுவரிசையிலும் உள்ள நகல் எண்களை நிழலிடவும்.';

  @override
  String get hitoriHowToPlay =>
      'எந்த வரிசையிலும் அல்லது நெடுவரிசையிலும் எந்த எண்ணும் ஒன்றுக்கு மேற்பட்ட முறை வராதபடி செல்களை நிழலிடவும். நிழலிடப்பட்ட செல்கள் அடுத்தடுத்து இருக்கக்கூடாது, மேலும் நிழலிடப்படாத அனைத்து செல்களும் ஒரு இணைக்கப்பட்ட குழுவை உருவாக்க வேண்டும்.';

  @override
  String get hitoriWinTitle => 'ஹிடோரி மாஸ்டர்!';

  @override
  String get hitoriWinMessage =>
      'நகல்கள் அனைத்தையும் வெற்றிகரமாகத் தீர்த்துவிட்டீர்கள்!';

  @override
  String get pathFinderTitle => 'பாதை தேடுபவர்';

  @override
  String get pathFinderSubtitle =>
      'S இலிருந்து E வரையிலான மறைக்கப்பட்ட பாதையைக் கண்டறியவும்.';

  @override
  String get pathFinderWin => 'பாதை கண்டறியப்பட்டது!';

  @override
  String get howToPlay => 'விளையாடுவது எப்படி';

  @override
  String get gotIt => 'புரிந்தது';

  @override
  String get akariTitle => 'அகாரி';

  @override
  String get akariSubtitle => 'அனைத்து வெள்ளை அறைகளையும் ஒளிரச் செய்யவும்';

  @override
  String get akariHowToPlay =>
      'முழு கட்டத்தையும் ஒளிரச் செய்ய வெள்ளை அறைகளில் மின்விளக்குகளை வைக்கவும். விளக்குகள் சுவர் வரை அவற்றின் வரிசை மற்றும் நிரலை ஒளிரச் செய்யும். இரண்டு விளக்குகள் ஒன்றுக்கொன்று ஒளிரக்கூடாது. எண் கொண்ட சுவர்கள் அருகில் உள்ள அறைகளில் (மேலே, கீழே, இடது, வலது) எத்தனை விளக்குகள் வைக்கப்பட வேண்டும் என்பதைக் காட்டுகின்றன.';

  @override
  String get akariWinTitle => 'விளக்குகள் எரிந்தன!';

  @override
  String get akariWinMessage => 'அனைத்தும் கச்சிதமாக ஒளிர்கின்றன.';

  @override
  String get arithmeticChainTitle => 'சங்கிலி கணக்கு';

  @override
  String get arithmeticChainSubtitle =>
      'நடப்பு மொத்தத்தை உங்கள் மனதில் கணக்கிடுங்கள்';

  @override
  String get arithmeticChainWinTitle => 'அடுத்த நிலை!';

  @override
  String get arithmeticChainWinMessage =>
      'உங்கள் மனக் கணக்கீடு கூர்மையாக உள்ளது!';

  @override
  String get arithmeticChainLoseTitle => 'மீண்டும் முயற்சிக்கவும்';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return 'சரியான பதில் $answer.';
  }

  @override
  String get arithmeticChainStart => 'தொடங்கு';

  @override
  String get arithmeticChainNext => 'அடுத்து';

  @override
  String get attentionalBlinkTitle => 'கவனச் சிமிட்டல்';

  @override
  String get attentionalBlinkSubtitleWatch => 'எண்களைக் கவனிக்கவும்';

  @override
  String get attentionalBlinkSubtitleInput =>
      'நீங்கள் பார்த்த இரண்டு எண்களை உள்ளிடவும்';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return 'நீங்கள் $score இலக்குகளைப் பெற்றுள்ளீர்கள்!';
  }

  @override
  String get balanceScaleTitle => 'தராசு';

  @override
  String get balanceScaleSubtitle =>
      'தராசுகளின் அடிப்படையில் கடைசி பொருளின் எடையைக் கண்டறியவும்.';

  @override
  String get balanceScaleWinTitle => 'சமநிலை!';

  @override
  String get balanceScaleWinMessage =>
      'நீங்கள் எடையைச் சரியாகக் கண்டறிந்துள்ளீர்கள்!';

  @override
  String get balanceScaleLoseTitle => 'சமநிலையற்றது';

  @override
  String get balanceScaleLoseMessage =>
      'சரியான சமநிலையைக் கண்டறிய மீண்டும் முயற்சிக்கவும்.';

  @override
  String get balanceScaleBack => 'பின்செல்';

  @override
  String get balanceScaleSubmit => 'சமர்ப்பி';

  @override
  String get binaryPuzzleTitle => 'பைனரி புதிர்';

  @override
  String get binaryPuzzleSubtitle =>
      '0 மற்றும் 1 ஆல் நிரப்பவும். ஒரே எண் தொடர்ச்சியாக இரண்டுக்கு மேல் வரக்கூடாது. ஒவ்வொரு வரிசையிலும் நிரலிலும் சமமான 0 மற்றும் 1 இருக்க வேண்டும்.';

  @override
  String get binaryPuzzleWinTitle => 'மிகச்சிறப்பு';

  @override
  String get binaryPuzzleWinMessage =>
      'சரியான தருக்கத்துடன் பைனரி புதிரைத் தீர்த்துள்ளீர்கள்!';

  @override
  String get blockEscapeTitle => 'பிளாக் எஸ்கேப்';

  @override
  String get blockEscapeSubtitle =>
      'முக்கிய பிளாக் வெளியேற பாதையை உருவாக்க மற்ற பிளாக்குகளை நகர்த்தவும்.';

  @override
  String get blockEscapeWinTitle => 'தப்பித்தல்!';

  @override
  String get blockEscapeWinMessage =>
      'முக்கிய பிளாக்கிற்கான பாதையை வெற்றிகரமாக உருவாக்கிவிட்டீர்கள்!';

  @override
  String get boxCompletionTitle => 'பெட்டி பூர்த்தி';

  @override
  String get boxCompletionSubtitle => 'எந்த கனசதுரத்தை உருவாக்க முடியும்?';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return 'நீங்கள் $totalTrials முயற்சிகளில் $score சரியான பதில்களைப் பெற்றுள்ளீர்கள்!';
  }

  @override
  String get boxCompletionOptions => 'விருப்பங்கள்';

  @override
  String get bridgesTitle => 'பாலங்கள்';

  @override
  String get bridgesSubtitle =>
      'தீவுகளை பாலங்களால் இணைக்கவும். ஒவ்வொரு தீவிற்கும் குறிப்பிட்ட எண்ணிக்கையிலான பாலங்கள் தேவை. பாலங்கள் ஒன்றையொன்று குறுக்கக் கூடாது.';

  @override
  String get bridgesWinTitle => 'இணைக்கப்பட்டது!';

  @override
  String get bridgesWinMessage =>
      'அனைத்து தீவுகளையும் வெற்றிகரமாக இணைத்துவிட்டீர்கள்!';

  @override
  String get calculationSprintTitle => 'கணக்கீட்டு ஓட்டம்';

  @override
  String get calculationSprintSubtitle =>
      '60 வினாடிகளில் முடிந்தவரை பல சமன்பாடுகளைத் தீர்க்கவும்.';

  @override
  String get calculationSprintGoalReached => 'இலக்கு எட்டப்பட்டது!';

  @override
  String get calculationSprintTimeUp => 'நேரம் முடிந்தது';

  @override
  String calculationSprintScoreMessage(int score) {
    return 'அருமையான கணக்கீட்டு வேகம்! நீங்கள் $score புள்ளிகள் பெற்றுள்ளீர்கள்.';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return 'நீங்கள் $score புள்ளிகள் பெற்றுள்ளீர்கள். உங்கள் சிறந்த மதிப்பெண்ணை முறியடிக்க முயலுங்கள்!';
  }

  @override
  String get calculationSprintBest => 'சிறந்தது';

  @override
  String get calculationSprintSeconds => '60 வினாடிகள்';

  @override
  String get calculationSprintDescription =>
      'சமன்பாடுகளை விரைவாகத் தீர்க்கவும்.\nதவறான பதில்களுக்கு 3 வினாடிகள் குறைக்கப்படும்!';

  @override
  String get calculationSprintStart => 'ஓட்டத்தைத் தொடங்கு';

  @override
  String get categoryFluencyTitle => 'வகை சரளம்';

  @override
  String get categoryFluencySubtitle => 'வகையைச் சார்ந்த பொருட்களை உள்ளிடவும்';

  @override
  String get categoryFluencyExpert => 'சரள நிபுணர்!';

  @override
  String get categoryFluencyTimeUp => 'நேரம் முடிந்தது!';

  @override
  String get categoryFluencyWinMessage => 'உங்களிடம் பரந்த சொல்லகராதி உள்ளது!';

  @override
  String categoryFluencyFoundMessage(int count) {
    return 'நீங்கள் $count வார்த்தைகளைக் கண்டறிந்துள்ளீர்கள்.';
  }

  @override
  String get categoryFluencyCategoryLabel => 'வகை:';

  @override
  String get categoryFluencyEnterItem => 'ஒரு பொருளை உள்ளிடவும்...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target வார்த்தைகள்';
  }

  @override
  String get changeBlindnessTitle => 'மாற்றத்தைக் காணாமை';

  @override
  String get changeBlindnessSubtitle => 'மாறும் பொருளைக் கண்டறியவும்';

  @override
  String changeBlindnessScore(int score) {
    return 'மதிப்பெண்: $score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return 'நீங்கள் $score மாற்றங்களைக் கண்டறிந்துள்ளீர்கள்!';
  }

  @override
  String get choiceRtTitle => 'தேர்வு எதிர்வினை';

  @override
  String get choiceRtSubtitle =>
      'செயலில் உள்ள சதுரத்தை முடிந்தவரை வேகமாகத் தட்டவும்';

  @override
  String choiceRtAvgMessage(String avg) {
    return 'உங்கள் சராசரி எதிர்வினை நேரம்: ${avg}ms';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return 'மீதமுள்ள நேரம்: ${time}s';
  }

  @override
  String choiceRtTaps(int count) {
    return 'தட்டல்கள்: $count';
  }

  @override
  String get colorFloodTitle => 'வண்ண வெள்ளம்';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return 'நகர்வுகள்: $moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => 'வெள்ளம் வெற்றி!';

  @override
  String get colorFloodDryLand => 'உலர் நிலம்...';

  @override
  String get colorFloodWinMessage =>
      'முழு கட்டத்தையும் வண்ணத்தால் நிரப்பிவிட்டீர்கள்!';

  @override
  String get colorFloodLoseMessage =>
      'உங்கள் நகர்வுகள் முடிந்துவிட்டன. மீண்டும் முயற்சிக்கவும்!';

  @override
  String get colorMatchTitle => 'வண்ணப் பொருத்தம்';

  @override
  String get colorMatchSubtitle =>
      'இலக்கு வண்ணத்துடன் முடிந்தவரை நெருக்கமாகப் பொருந்த ஸ்லைடர்களைச் சரிசெய்யவும்.';

  @override
  String get colorMatchTarget => 'இலக்கு';

  @override
  String get colorMatchYours => 'உங்களுடையது';

  @override
  String get colorMatchCheck => 'பொருத்தத்தைச் சரிபார்க்கவும்';

  @override
  String get colorMatchResult => 'பொருத்த முடிவு';

  @override
  String colorMatchAccuracy(String accuracy) {
    return 'உங்கள் துல்லியம்: $accuracy%';
  }

  @override
  String get corsiBlocksTitle => 'கோர்சி பிளாக்குகள்';

  @override
  String get corsiBlocksSubtitle =>
      'பிளாக்குகள் ஒளிர்வதைக் கவனித்து அதே வரிசையில் தட்டவும்.';

  @override
  String get corsiBlocksWinTitle => 'இடஞ்சார்ந்த மாஸ்டர்!';

  @override
  String get corsiBlocksLoseTitle => 'இடத்தில் தொலைந்தது';

  @override
  String corsiBlocksMessage(int score, int span) {
    return 'நீங்கள் $score வரிசைகளை நினைவில் வைத்துள்ளீர்கள்! உங்கள் இடஞ்சார்ந்த நினைவக வரம்பு $span ஐ எட்டியது.';
  }

  @override
  String get corsiBlocksWatch => 'நடைமுறையைக் கவனிக்கவும்';

  @override
  String get corsiBlocksRepeat => 'நடைமுறையை மீண்டும் செய்யவும்';

  @override
  String get corsiBlocksExcellent => 'அருமை!';

  @override
  String get corsiBlocksSpan => 'வரம்பு';

  @override
  String get crownTitle => 'கிரீடம்';

  @override
  String get crownSubtitle =>
      'ஒவ்வொரு வரிசை, நிரல் மற்றும் வண்ணப் பகுதியில் ஒரு கிரீடத்தை வைக்கவும். கிரீடங்கள் அருகருகே இருக்கக்கூடாது, குறுக்காகக் கூட இருக்கக்கூடாது.';

  @override
  String get crownCrowned => 'கிரீடம் சூட்டப்பட்டது!';

  @override
  String get crownSuccess =>
      'சரியான தருக்கத்துடன் அனைத்து கிரீடங்களும் வெற்றிகரமாக வைக்கப்பட்டன.';

  @override
  String get cryptogramTitle => 'கிரிப்டோகிராம்';

  @override
  String get cryptogramSubtitle =>
      'ரகசிய செய்தியைப் புரிந்துகொள்ள எழுத்துக்களை ஒதுக்கவும்! ஒவ்வொரு குறியீட்டு எழுத்தும் ஒரு உண்மையான எழுத்தைக் குறிக்கிறது.';

  @override
  String get cryptogramBroken => 'குறியீடு உடைக்கப்பட்டது!';

  @override
  String get cryptogramEncrypted => 'குறியாக்கம் செய்யப்பட்டது';

  @override
  String get cryptogramSuccess =>
      'செய்தியை நீங்கள் கச்சிதமாகப் புரிந்துகொண்டீர்கள்.';

  @override
  String get cryptogramTryAgain =>
      'குறியாக்கத்தை உடைக்க மீண்டும் முயற்சிக்கவும்.';

  @override
  String get digitSpanReverseTitle => 'தலைகீழ் எண்கள்';

  @override
  String get digitSpanReverseSubtitleMemorize => 'எண்களை மனப்பாடம் செய்யவும்';

  @override
  String get digitSpanReverseSubtitleEnter =>
      'எண்களை தலைகீழ் வரிசையில் உள்ளிடவும்';

  @override
  String get digitSpanReverseWinTitle => 'அடுத்த நிலை!';

  @override
  String get digitSpanReverseWinMessage =>
      'உங்கள் பணி நினைவகம் ஈர்க்கக்கூடியது!';

  @override
  String get digitSpanReverseLoseTitle => 'மீண்டும் முயற்சிக்கவும்';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return 'சரியான தலைகீழ் வரிசை $sequence.';
  }

  @override
  String get dividedAttentionTitle => 'பிரிக்கப்பட்ட கவனம்';

  @override
  String get dividedAttentionSubtitle =>
      'நட்சத்திரத்திற்கு ⭐ இடதுபுறம் தட்டவும் | சிவப்பு 🔴 நிறத்திற்கு வலதுபுறம் தட்டவும்';

  @override
  String get dividedAttentionGameOverTitle => 'கவனம் சிதறியது';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return 'ஒரே நேரத்தில் பல வேலைகளைச் செய்வது கடினம்! உங்கள் மதிப்பெண் $score.';
  }

  @override
  String dividedAttentionScore(int score) {
    return 'மதிப்பெண்: $score';
  }

  @override
  String get doubleNBackTitle => 'டபுள் N-பேக்';

  @override
  String doubleNBackSubtitle(int n) {
    return '$n படிகளுக்கு முந்தைய தூண்டுதல்களைப் பொருத்தவும்';
  }

  @override
  String get doubleNBackGameOverTitle => 'விளையாட்டு முடிந்தது';

  @override
  String doubleNBackGameOverMessage(int score) {
    return 'டபுள் N-பேக்கில் நீங்கள் $score புள்ளிகள் பெற்றுள்ளீர்கள்!';
  }

  @override
  String doubleNBackScore(int score) {
    return 'மதிப்பெண்: $score';
  }

  @override
  String get doubleNBackPositionMatch => 'நிலை பொருத்தம்';

  @override
  String get doubleNBackLetterMatch => 'எழுத்து பொருத்தம்';

  @override
  String get faceNameAssociationTitle => 'முகம்-பெயர்';

  @override
  String get faceNameAssociationSubtitleStudy =>
      'ஒவ்வொரு முகத்திற்கும் பெயரை மனப்பாடம் செய்யவும்';

  @override
  String get faceNameAssociationSubtitleTest => 'இது யார்?';

  @override
  String get faceNameAssociationPerfect => 'கச்சிதம்!';

  @override
  String get faceNameAssociationGameOver => 'விளையாட்டு முடிந்தது';

  @override
  String get faceNameAssociationWinMessage =>
      'முகங்களையும் பெயர்களையும் நினைவில் வைத்துக் கொள்ளும் சிறந்த நினைவாற்றல் உங்களிடம் உள்ளது!';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return 'நீங்கள் $total இல் $correct சரியான பதில்களைப் பெற்றுள்ளீர்கள்.';
  }

  @override
  String get faceNameAssociationStartTest => 'தேர்வைத் தொடங்கவும்';

  @override
  String get flankerTestWinTitle => 'லேசர் கவனம்!';

  @override
  String get flankerTestLoseTitle => 'கவனம் சிதறியது';

  @override
  String flankerTestScoreMessage(int score) {
    return 'நீங்கள் $score சரியான பதில்களைப் பெற்றுள்ளீர்கள்!';
  }

  @override
  String get flankerTestTitle => 'பிளாங்கர் சோதனை';

  @override
  String get flankerTestSubtitle =>
      'பக்கவாட்டு அம்புகளைப் புறக்கணித்து, மைய அம்புக்குறியின் திசையைக் குறிப்பிடவும்.';

  @override
  String get flankerTestLeft => 'இடது';

  @override
  String get flankerTestRight => 'வலது';

  @override
  String get fractionMatchTitle => 'பின்னப் பொருத்தம்';

  @override
  String get fractionMatchSubtitle => 'படத்தை அதன் பின்னத்துடன் பொருத்தவும்';

  @override
  String get fractionMatchLoseTitle => 'பின்னப் பொருந்தாமை';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return 'சரியான பதில் $correctAnswer.';
  }

  @override
  String get goNoGoTitle => 'செல் / செல்லாதே';

  @override
  String get goNoGoSubtitle =>
      'பச்சை நிறத்திற்குத் தட்டவும், சிவப்பு நிறத்தைப் புறக்கணிக்கவும்!';

  @override
  String get goNoGoLoseTitle => 'எதிர்வினை நிறுத்தப்பட்டது';

  @override
  String get goNoGoLoseMessage =>
      'உங்கள் தடுப்பு கட்டுப்பாடு சோதிக்கப்படுகிறது!';

  @override
  String get goNoGoTapAnywhere => 'தொடங்க எங்கு வேண்டுமானாலும் தட்டவும்';

  @override
  String get groceryListTitle => 'மளிகைப் பட்டியல்';

  @override
  String get groceryListSubtitleMemorize =>
      'பொருட்களையும் அவற்றின் வகைகளையும் மனப்பாடம் செய்யவும்';

  @override
  String get groceryListSubtitleTest => 'இந்தப் பொருள் எந்த வகையைச் சேர்ந்தது?';

  @override
  String get groceryListWinTitle => 'மளிகை நிபுணர்!';

  @override
  String get groceryListLoseTitle => 'ஏதாவது மறந்துவிட்டதா?';

  @override
  String groceryListScoreMessage(int score) {
    return 'மளிகைப் பட்டியலில் நீங்கள் $score புள்ளிகள் பெற்றுள்ளீர்கள்!';
  }

  @override
  String get groceryListReady => 'நான் தயார்';

  @override
  String get groceryListWhereBelong => 'இது எங்கே இருக்க வேண்டும்?';

  @override
  String get hueSortTitle => 'நிற வகைப்படுத்தல்';

  @override
  String get hueSortSubtitle =>
      'மூலை வண்ணங்களுக்கு இடையே மென்மையான மாற்றத்தை உருவாக்க கட்டங்களை மாற்றவும். புள்ளிகள் நிலையான கட்டங்களைக் குறிக்கின்றன.';

  @override
  String get hueSortWinTitle => 'சரியான கிரேடியன்ட்!';

  @override
  String get hueSortWinMessage =>
      'வண்ண நிறமாலையை நீங்கள் கச்சிதமாக வரிசைப்படுத்தியுள்ளீர்கள்!';

  @override
  String hueSortWrongTiles(int count) {
    return 'தவறான நிலையில் உள்ள கட்டங்கள்: $count';
  }

  @override
  String get kenkenTitle => 'கென்கென்';

  @override
  String get kenkenWinTitle => 'மேதை!';

  @override
  String get kenkenLoseTitle => 'விளையாட்டு முடிந்தது';

  @override
  String get kenkenWinMessage =>
      'நீங்கள் கென்கென் புதிரைத் தீர்த்துவிட்டீர்கள்!';

  @override
  String get kenkenLoseMessage =>
      'வரிசை/நிரல் மற்றும் கூண்டு விதிகளைச் சரிபார்க்கவும்.';

  @override
  String kenkenSubtitle(int size) {
    return 'வரிசை/நிரலில் மீண்டும் வராமல் 1-$size வரை நிரப்பவும்';
  }

  @override
  String get letterCancellationTitle => 'எழுத்து ரத்து';

  @override
  String get letterCancellationTitleFull => 'எழுத்து ரத்து செய்தல்';

  @override
  String letterCancellationScoreMessage(int score) {
    return 'நீங்கள் $score எழுத்துக்களைக் கண்டறிந்துள்ளீர்கள்!';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return '\"$target\" எழுத்துக்கள் அனைத்தையும் கண்டறியவும்';
  }

  @override
  String get letterCancellationFound => 'கண்டறியப்பட்டது';

  @override
  String get letterCancellationTime => 'நேரம்';

  @override
  String get lightsOutTitle => 'லைட்ஸ் அவுட்';

  @override
  String get lightsOutSubtitle =>
      'ஒரு கட்டத்தைத் தட்டினால் அதுவும் அதன் அருகிலுள்ள கட்டங்களும் மாறும். தீர்க்க அனைத்து விளக்குகளையும் அணைக்கவும்.';

  @override
  String get lightsOutWinTitle => 'புதிர் தீர்க்கப்பட்டது!';

  @override
  String get lightsOutWinMessage =>
      'அனைத்து விளக்குகளையும் வெற்றிகரமாக அணைத்துவிட்டீர்கள்!';

  @override
  String get symmetryTitle => 'சமச்சீர்';

  @override
  String get symmetrySubtitle =>
      'இடதுபுறம் உள்ள அமைப்பை வலதுபுறம் உள்ள காலிக் கட்டத்தில் பிரதிபலிக்கவும்.';

  @override
  String get semanticLinkTitle => 'சொற்பொருள் இணைப்பு';

  @override
  String get semanticLinkSubtitle =>
      'மூன்றையும் இணைக்கும் வார்த்தையைக் கண்டறியவும்';

  @override
  String get reflexTapTitle => 'மின்னல் தட்டல்';

  @override
  String get visualStatisticalLearningTitle => 'காட்சி புள்ளியியல் கற்றல்';

  @override
  String get orbitTapTitle => 'சுற்றுப்பாதை தட்டல்';

  @override
  String get orbitTapSubtitle =>
      'பந்துகள் நுழைவாயிலுடன் சீரமைக்கும்போது தட்டவும்';

  @override
  String get orbitTapTapToHit => 'பந்து வாயிலுக்குள் நுழையும் போது தட்டவும்';

  @override
  String get schulteTableTitle => 'ஷுல்ட் அட்டவணை';

  @override
  String get multipleObjectTrackingTitle => 'பொருள் கண்காணிப்பு';

  @override
  String get multipleObjectTrackingSubtitle =>
      'தனிப்படுத்தப்பட்ட பொருட்களைக் கவனிக்கவும். அவை நகரும்போது அவற்றைக் கண்காணித்து, பின் அவற்றைத் தேர்ந்தெடுக்கவும்.';

  @override
  String get sdmtTitle => 'Sdmt சோதனை';

  @override
  String get sdmtSubtitle =>
      'காட்டப்பட்டுள்ள குறியீட்டிற்கான எண்ணைக் கண்டறிய மேலே உள்ள குறியீட்டைப் பயன்படுத்தவும்.';

  @override
  String get memoryMatrixTitle => 'நினைவக அணி';

  @override
  String get memoryMatrixSubtitle =>
      'அமைப்பை மனப்பாடம் செய்து கட்டங்களைத் தட்டவும்.';

  @override
  String get mentalAbacusTitle => 'மன அபாகஸ்';

  @override
  String get mentalAbacusSubtitle => 'சோரோபனைப் பயன்படுத்தி தீர்க்கவும்';

  @override
  String get spellingSprintTitle => 'எழுத்து ஓட்டம்';

  @override
  String get spellingSprintSubtitle =>
      'நேரத்திற்கு எதிராக விரைவாக வார்த்தைகளை எழுத்துக் கூட்டவும்.';

  @override
  String get stopSignalTitle => 'நிறுத்து சமிக்ஞை';

  @override
  String get stopSignalSubtitle =>
      'அம்பு திசையில் தட்டவும், ஆனால் அம்பு சிவப்பாக மாறினால் உடனடியாக நிறுத்தவும்.';

  @override
  String get staircaseMemoryTitle => 'ஏணி நினைவகம்';

  @override
  String get vigilanceTaskTitle => 'விழிப்புணர்வு பணி';

  @override
  String get vigilanceTaskSubtitle =>
      'முள் ஒரு இடத்தைத் தாண்டும்போது பொத்தானைத் தட்டவும்';

  @override
  String get logicalSyllogismsTitle => 'தருக்க நியாயங்கள்';

  @override
  String get logicalSyllogismsSubtitle =>
      'முடிவு தருக்க ரீதியாக செல்லுபடியாகுமா?';

  @override
  String get mathPathTitle => 'கணிதப் பாதை';

  @override
  String get mathPathSubtitle =>
      'இலக்கு தொகையைச் சரியாகக் கொடுக்கும் பாதையைக் கண்டறியவும்.';

  @override
  String get sternbergTaskTitle => 'ஸ்டெர்ன்பெர்க் பணி';

  @override
  String get sternbergTaskMemorize => 'எழுத்துக்களை மனப்பாடம் செய்யவும்';

  @override
  String get sternbergTaskWasLetterSet => 'இந்த எழுத்து தொகுப்பில் இருந்ததா?';

  @override
  String sternbergTaskScore(int score) {
    return 'ஸ்டெர்ன்பெர்க் பணியில் நீங்கள் $score புள்ளிகள் பெற்றுள்ளீர்கள்!';
  }

  @override
  String get verbalAnalogiesTitle => 'வாய்மொழி ஒப்புமைகள்';

  @override
  String get verbalAnalogiesSubtitle => 'உறவைப் பூர்த்தி செய்யவும்';

  @override
  String get typingSpeedTitle => 'தட்டச்சு வேகம்';

  @override
  String get typingSpeedSubtitle =>
      'காட்டப்பட்டுள்ள சொற்றொடரை முடிந்தவரை வேகமாகத் தட்டச்சு செய்யவும்!';

  @override
  String get wordLadderTitle => 'வார்த்தை ஏணி';

  @override
  String get wordLadderSubtitle =>
      'ஒவ்வொரு முறையும் ஒரு எழுத்தை மாற்றி வார்த்தைகளை இணைக்கவும்.';

  @override
  String get tangleFixTitle => 'சிக்கல் திருத்தம்';

  @override
  String get tangleFixSubtitle =>
      'கோடுகள் ஒன்றையொன்று குறுக்கிடாதபடி சிக்கலைத் தீர்க்கவும்';

  @override
  String get oddRotationTitle => 'மாறுபட்ட சுழற்சி';

  @override
  String get oddRotationSubtitle =>
      'இவற்றில் ஒன்று பிரதிபலிக்கப்பட்டுள்ளது. உங்களால் அதைக் கண்டறிய முடியுமா?';

  @override
  String get towerOfLondonTitle => 'லண்டன் கோபுரம்';

  @override
  String get towerOfLondonSubtitle => 'இலக்கு அமைப்போடு பொருத்தவும்';

  @override
  String get symbolicFlankerTitle => 'குறியீட்டு பிளாங்கர்';

  @override
  String get symbolicFlankerSubtitle => 'மையக் குறியீட்டில் கவனம் செலுத்தவும்';

  @override
  String get stroopTestTitle => 'ஸ்ட்ரூப் சோதனை';

  @override
  String get stroopTestSubtitle =>
      'காட்டப்பட்டுள்ள வார்த்தையின் மை நிறத்தைக் கண்டறியவும். வார்த்தை என்ன சொல்கிறது என்பதைப் புறக்கணிக்கவும்!';

  @override
  String get wisconsinCardSortingTitle =>
      'விஸ்கான்சின் கார்டு வரிசைப்படுத்துதல்';

  @override
  String get wisconsinCardSortingSubtitle =>
      'மேலே உள்ள நான்கில் ஒன்றோடு கார்டைப் பொருத்தவும்';

  @override
  String get nBackTitle => 'N-பேக் சோதனை';

  @override
  String get nBackSubtitle =>
      'தற்போதைய எழுத்து 2 படிகளுக்கு முன் காட்டப்பட்ட எழுத்துடன் பொருந்தினால் MATCH ஐத் தட்டவும்.';

  @override
  String get rhythmMasterTitle => 'தாள மாஸ்டர்';

  @override
  String get rhythmMasterSubtitle => 'துடிப்புடன் ஒத்திசைவாகத் தட்டவும்';

  @override
  String get pixelMimicTitle => 'பிக்சல் மிமிக்';

  @override
  String get targetNumberTitle => 'இலக்கு 24';

  @override
  String targetNumberSubtitle(int target) {
    return '$target ஐ அடைய 4 எண்களையும் பயன்படுத்தவும்';
  }

  @override
  String get mirrorTracingTitle => 'கண்ணாடி வரைதல்';

  @override
  String get mirrorTracingSubtitle =>
      'நட்சத்திரத்தை வரையவும்! கட்டுப்பாடுகள் தலைகீழாக (மிரர்) இருக்கும்.';

  @override
  String get wordSurgeTitle => 'வார்த்தை எழுச்சி';

  @override
  String get wordSurgeSubtitle => 'சரியான மற்றும் எதிர்ச்சொற்கள்';

  @override
  String get perspectiveTakingTitle => 'பார்வைக் கோணம்';

  @override
  String get perspectiveTakingTopDownView => 'மேலிருந்து பார்க்கும் காட்சி';

  @override
  String get perspectiveTakingChoosePerspective =>
      'பார்வையைத் தேர்ந்தெடுக்கவும்';

  @override
  String get perspectiveTakingCongrats =>
      'இடஞ்சார்ந்த உறவுகளைக் கண்டறியும் கூர்மையான பார்வை உங்களிடம் உள்ளது.';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return '$targetDirName திசையிலிருந்து எந்தக் காட்சி தெரிகிறது?';
  }

  @override
  String get paperFoldingTitle => 'காகித மடிப்பு';

  @override
  String get paperFoldingSubtitle => 'பிரிக்கும்போது இது எப்படி இருக்கும்?';

  @override
  String get waterSortTitle => 'நீர் வரிசைப்படுத்துதல்';

  @override
  String get waterSortSubtitle =>
      'ஒவ்வொரு குழாயிலும் ஒரு நிறம் மட்டுமே இருக்குமாறு வண்ணங்களை வரிசைப்படுத்தவும்.';

  @override
  String get numericalEstimationTitle => 'எண் மதிப்பீடு';

  @override
  String get numericalEstimationSubtitle =>
      'அருகிலுள்ள பதிலை விரைவாகத் தேர்ந்தெடுக்கவும்!';

  @override
  String get lockPatternTitle => 'லாக் பேட்டர்ன்';

  @override
  String get lockPatternSubtitle =>
      'ரகசிய அமைப்பைக் கண்டறியவும். ஒவ்வொரு யூகமும் நிலை மற்றும் புள்ளிகள் பற்றிய கருத்தைத் தரும்.';

  @override
  String get primeHunterTitle => 'பகா எண் வேட்டையன்';

  @override
  String get primeHunterSubtitle =>
      'பகா எண்ணிற்கு இடதுபுறம் ஸ்வைப் செய்யவும் | பகு எண்ணிற்கு வலதுபுறம் ஸ்வைப் செய்யவும்';

  @override
  String get tracePathTitle => 'பாதை வரைதல்';

  @override
  String get tracePathSubtitle =>
      'இலக்கு பாதையை முடிந்தவரை நெருக்கமாகப் பின்தொடரவும்';

  @override
  String get ruleSwitcherTitle => 'விதி மாற்றி';

  @override
  String get ruleSwitcherSubtitle => 'தற்போதைய விதியைப் பயன்படுத்தவும்';

  @override
  String get choiceReactionTimeTitle => 'தேர்வு எதிர்வினை நேரம்';

  @override
  String get pathRecallTitle => 'பாதை நினைவுகூர்தல்';

  @override
  String get switchTaskTitle => 'பணி மாற்றம்';

  @override
  String get switchTaskSubtitle =>
      'விதியைக் கவனிக்கவும்! இது வடிவம் பொருத்தம் மற்றும் வண்ணப் பொருத்தத்திற்கு இடையே மாறும்.';

  @override
  String get mentalRotationTitle => 'மன சுழற்சி';

  @override
  String get mentalRotationSubtitle =>
      'இந்த வடிவங்கள் ஒன்றே தானா, சுழற்றப்பட்டுள்ளதா?';

  @override
  String get missingOperatorTitle => 'விடுபட்ட குறியீடு';

  @override
  String get missingOperatorSubtitle =>
      'சமன்பாட்டைப் பூர்த்தி செய்ய காலியிடங்களை நிரப்பவும்';

  @override
  String get wordMastermindTitle => 'வார்த்தை மாஸ்டர்மைண்ட்';

  @override
  String get wordMastermindSubtitle =>
      '4-எழுத்து குறியீட்டை உடைக்கவும்! புல்ஸ் (B) சரியான இடம், கௌஸ் (C) தவறான இடம்.';

  @override
  String get simonSequenceTitle => 'வரிசைமுறை';

  @override
  String get symbolLogicTitle => 'குறியீட்டு தருக்கம்';

  @override
  String get symbolLogicSubtitle =>
      'ஒவ்வொரு குறியீட்டின் மதிப்பையும் கண்டறிய காட்சி சமன்பாடுகளைத் தீர்க்கவும். கடைசி சமன்பாட்டின் முடிவு என்ன?';

  @override
  String get silhouetteMatchTitle => 'நிழல் பொருத்தம்';

  @override
  String get silhouetteMatchSubtitle =>
      'இந்தப் பொருளுடன் எந்த நிழற்படம் பொருந்துகிறது?';

  @override
  String get operationSpanTitle => 'செயல்பாட்டு வரம்பு';

  @override
  String get operationSpanMathPhase => 'சமன்பாடு சரியானதா?';

  @override
  String get operationSpanLetterPhase => 'எழுத்தை நினைவில் வைக்கவும்';

  @override
  String get operationSpanRecallPhase => 'எழுத்துக்களை வரிசையாக நினைவுகூரவும்';

  @override
  String get operationSpanRoundComplete => 'சுற்று முடிந்தது!';

  @override
  String operationSpanScore(int score) {
    return 'செயல்பாட்டு வரம்பில் நீங்கள் $score புள்ளிகள் பெற்றுள்ளீர்கள்!';
  }

  @override
  String get slidePuzzleTitle => 'ஸ்லைடு புதிர்';

  @override
  String get slidePuzzleNewGame => 'புதிய விளையாட்டு';

  @override
  String get slidePuzzleInstructions =>
      'கட்டங்களை காலியிடத்திற்கு நகர்த்தி எண்களின் வரிசையில் அடுக்கவும்.';

  @override
  String get slidePuzzleTileSlider => 'கட்ட ஸ்லைடர்';

  @override
  String get slidePuzzleCongrats =>
      'அனைத்து கட்டங்களையும் நீங்கள் வெற்றிகரமாக அடுக்கிவிட்டீர்கள்.';

  @override
  String get visualSearchTitle => 'காட்சித் தேடல்';

  @override
  String get visualSearchSubtitle =>
      'கட்டத்தில் உள்ள தனித்துவமான குறியீட்டைக் கண்டறியவும்';

  @override
  String get trailMakingTitle => 'தொடர் வரைதல்';

  @override
  String get trailMakingSubtitle =>
      'எண்களை வரிசையாக (1 -> 2 -> 3...) முடிந்தவரை வேகமாக இணைக்கவும்.';

  @override
  String get matrixReasoningTitle => 'மேட்ரிக்ஸ் பகுத்தறிவு';

  @override
  String get matrixReasoningSubtitle =>
      '3x3 கட்டத்தில் அமைப்பைப் பூர்த்தி செய்யவும்';

  @override
  String get tentsAndTreesTitle => 'கூடாரங்கள் & மரங்கள்';

  @override
  String get tentsAndTreesSubtitle =>
      'மரங்களுக்கு அருகில் கூடாரங்களை வைக்கவும். எண்கள் ஒவ்வொரு வரிசை/நிரலிலும் எத்தனை கூடாரங்கள் உள்ளன என்பதைக் குறிக்கின்றன. கூடாரங்கள் ஒன்றையொன்று தொடக்கூடாது.';

  @override
  String get quickMathTitle => 'விரைவு கணிதம்';

  @override
  String get magicSquaresTitle => 'மாயச் சதுரம்';

  @override
  String magicSquaresSubtitle(int targetSum) {
    return 'ஒவ்வொரு வரிசை, நிரல் மற்றும் மூலைவிட்டத்தின் கூடுதல் $targetSum ஆக இருக்க வேண்டும்';
  }

  @override
  String get objectShuffleTitle => 'பொருள் மாற்றம்';

  @override
  String get pipesTitle => 'குழாய்கள்';

  @override
  String get pipesSubtitle =>
      'பொருந்தும் வண்ணப் புள்ளிகளைக் குழாய்களால் இணைக்கவும்.';

  @override
  String get oddOneOutTitle => 'மாறுபட்டதைக் கண்டுபிடி';

  @override
  String get oddOneOutSubtitle =>
      'வேறுபட்ட நிறத்தில் உள்ள கட்டத்தைக் கண்டறியவும்.';

  @override
  String get einsteinRiddleTitle => 'ஐன்ஸ்டீன் புதிர்';

  @override
  String get einsteinRiddleSubtitle =>
      'ஒவ்வொரு வீட்டின் பண்புகளையும் கண்டறிய குறிப்புகளைப் பயன்படுத்தவும்.';

  @override
  String get einsteinRiddleHowToPlay =>
      'ஒவ்வொரு வீட்டிற்கும் தனித்துவமான பண்புகள் (நிறம், தேசியம், செல்லப்பிராணி போன்றவை) உள்ளன. கட்டத்தை நிரப்பவும் முழுமையான தீர்வைக் கண்டறியவும் வழங்கப்பட்ட குறிப்புகளைப் பயன்படுத்தவும்.';

  @override
  String get einsteinRiddleColor => 'நிறம்';

  @override
  String get einsteinRiddleNationality => 'தேசியம்';

  @override
  String get einsteinRiddleDrink => 'பானம்';

  @override
  String get einsteinRiddlePet => 'செல்லப்பிராணி';

  @override
  String get einsteinRiddleSmoke => 'புகை';

  @override
  String get einsteinRiddleHouse => 'வீடு';

  @override
  String get mirrorImageTitle => 'ஆடி பிம்பம்';

  @override
  String get mirrorImageSubtitle => 'சரியான ஆடி பிம்பத்தைக் கண்டறியவும்.';

  @override
  String get mirrorImageHowToPlay =>
      'வடிவத்தைப் பார்த்து, வழங்கப்பட்ட விருப்பங்களிலிருந்து அதன் சரியான ஆடி பிம்பத்தைத் தேர்ந்தெடுக்கவும்.';

  @override
  String get mentalMappingTitle => 'மன வரைபடம்';

  @override
  String get mentalMappingSubtitle =>
      'திசைகளைப் பின்பற்றி இலக்கைக் கண்டறியவும்.';

  @override
  String get mentalMappingHowToPlay =>
      'உங்களுக்கு திசைகளின் வரிசை (வடக்கு, தெற்கு, கிழக்கு, மேற்கு) காட்டப்படும். கட்டத்தின் மையத்திலிருந்து தொடங்கி மனதளவில் இந்தப் படிகளைப் பின்பற்றி இறுதி இலக்கைத் தேர்ந்தெடுக்கவும்.';

  @override
  String get memoryPalaceTitle => 'நினைவக அரண்மனை';

  @override
  String get memoryPalaceSubtitle =>
      'எந்த வார்த்தை எந்த இடத்தில் இருந்தது என்பதை நினைவில் கொள்க.';

  @override
  String get memoryPalaceHowToPlay =>
      'கட்டத்தின் வெவ்வேறு இடங்களில் வார்த்தைகளின் தொகுப்பு தோன்றும். அவற்றின் நிலைகளை மனப்பாடம் செய்யவும். பிறகு, வார்த்தைகளை அவற்றின் அசல் இடங்களில் மீண்டும் வைக்குமாறு கேட்கப்படுவீர்கள்.';

  @override
  String get countingSheepTitle => 'ஆடுகளை எண்ணுதல்';

  @override
  String get countingSheepSubtitle => 'நீங்கள் எத்தனை ஆடுகளைப் பார்த்தீர்கள்?';

  @override
  String get countingSheepHowToPlay =>
      'ஆடுகள் திரையில் வேகமாக ஓடும். அவை செல்லும்போது அவற்றை எண்ணி இறுதியில் மொத்த எண்ணிக்கையை உள்ளிடவும்.';

  @override
  String get faceTraitAssociationTitle => 'முகம்-பண்பு';

  @override
  String get faceTraitAssociationSubtitle =>
      'ஒவ்வொரு முகத்திற்கும் பண்புகளை மனப்பாடம் செய்யவும்';

  @override
  String get faceTraitAssociationHowToPlay =>
      'உங்களுக்கு பெயர், தொழில் மற்றும் பொழுதுபோக்குடன் பல முகங்கள் காட்டப்படும். இந்தத் தொடர்புகளை மனப்பாடம் செய்யவும். பின்னர், ஒவ்வொரு முகத்திற்கும் குறிப்பிட்ட பண்புகளை நினைவுகூருமாறு கேட்கப்படுவீர்கள்.';

  @override
  String get mentalCalendarTitle => 'மன காலண்டர்';

  @override
  String get mentalCalendarSubtitle => 'வாரத்தின் நாளைக் கணக்கிடுங்கள்';

  @override
  String get mentalCalendarHowToPlay =>
      'ஒரு சீரற்ற தேதி காட்டப்படும். அது வாரத்தின் எந்த நாளில் வருகிறது என்பதைத் தீர்மானிக்க மனக் கணக்கீட்டைப் (அல்லது டூம்ஸ்டே அல்காரிதம்) பயன்படுத்தவும்.';

  @override
  String get vocabularyBuilderTitle => 'சொல்லகராதி வளர்ப்பவர்';

  @override
  String get vocabularyBuilderSubtitle =>
      'நேர அழுத்தத்தின் கீழ் ஒத்த மற்றும் எதிர்ச்சொற்களைப் பொருத்தவும்.';

  @override
  String get vocabularyBuilderHowToPlay =>
      'உங்களுக்கு ஒரு இலக்கு வார்த்தை மற்றும் ஒரு தொடர்பு (ஒத்த அல்லது எதிர்ச்சொல்) காட்டப்படும். விருப்பங்களிலிருந்து தொடர்புடன் பொருந்தும் சரியான வார்த்தையைத் தேர்ந்தெடுக்கவும். விரைவாகச் செய்யுங்கள், நேரம் ஓடிக்கொண்டிருக்கிறது!';

  @override
  String get correct => 'சரி';

  @override
  String get incorrect => 'தவறு';

  @override
  String get grammarPoliceTitle => 'இலக்கணக் காவலர்';

  @override
  String get grammarPoliceSubtitle =>
      'வாக்கியம் இலக்கணப்படி சரியானதா அல்லது பிழைகள் உள்ளதா என்பதைக் கண்டறியவும்.';

  @override
  String get grammarPoliceHowToPlay =>
      'திரையின் நடுவில் ஒரு வாக்கியம் தோன்றும். அது இலக்கணப்படி சரியானதா அல்லது பிழையுள்ளதா என்பதை முடிவு செய்யவும். சரியாக இருந்தால் \'சரி\' என்பதையும், தவறு இருந்தால் \'தவறு\' என்பதையும் தட்டவும். உங்கள் உயிர்கள் அனைத்தையும் இழக்காதீர்கள்!';

  @override
  String get reverseStroopTitle => 'தலைகீழ் ஸ்ட்ரூப்';

  @override
  String get reverseStroopSubtitle =>
      'கவனம் மாற்றப்படும் ஸ்ட்ரூப் சோதனையின் ஒரு மாறுபாடு.';

  @override
  String get reverseStroopHowToPlay =>
      'அறிவுறுத்தலைக் கவனிக்கவும்! அது \'TEXT\' என்று சொன்னால், வார்த்தையின் அர்த்தத்தைப் பொருத்தவும். அது \'COLOR\' என்று சொன்னால், மை நிறத்தைப் பொருத்தவும். உங்கள் கவனத்தைச் சோதிக்க விதிகள் அடிக்கடி மாறும்.';

  @override
  String get game2048Instruction => 'இணைக்க எந்த திசையிலும் ஸ்வைப் செய்யவும்';

  @override
  String get fibonacciMergeTitle => 'பிபனச்சி இணைப்பு';

  @override
  String get fibonacciMergeSubtitle =>
      'தொடர்ச்சியான பிபனச்சி எண்களை (1, 1, 2, 3, 5, 8, 13...) இணைக்கவும்.';

  @override
  String get sequenceSleuthTitle => 'வரிசைமுறை துப்பறிவாளர்';

  @override
  String get sequenceSleuthSubtitle =>
      'கணித வரிசையில் விடுபட்ட எண்ணைக் கண்டறியவும்.';

  @override
  String get divisibilityDashTitle => 'வகுபடும் வேகம்';

  @override
  String get divisibilityDashSubtitle =>
      'கொடுக்கப்பட்ட எண்ணிற்கான அனைத்து ஒற்றை இலக்க வகுப்பிகளையும் (2-9) தட்டவும்.';

  @override
  String get percentagePeakTitle => 'சதவீத சிகரம்';

  @override
  String get percentagePeakSubtitle =>
      'மன சதவீதக் கணக்கீடுகளை விரைவாகத் தீர்க்கவும்.';

  @override
  String get vennNumbersTitle => 'வென் எண்கள்';

  @override
  String get vennNumbersSubtitle =>
      'எண்களைச் சரியான வென் வரைபடப் பகுதிகளாக வகைப்படுத்தவும்.';

  @override
  String get commonDenominatorTitle => 'பொதுவான வகுத்தி';

  @override
  String get commonDenominatorSubtitle =>
      'மீப்பெரு பொது வகுத்தி அல்லது மீச்சிறு பொது மடங்கைக் கண்டறியவும்.';

  @override
  String get angleFinderTitle => 'கோணம் கண்டறிபவர்';

  @override
  String get angleFinderSubtitle =>
      'வடிவியல் கணக்கில் விடுபட்ட கோணத்தைக் கணக்கிடுங்கள்.';

  @override
  String get sumSnakeTitle => 'கூடுதல் பாம்பு';

  @override
  String get sumSnakeSubtitle =>
      'இலக்கு தொகையை அடைய அருகிலுள்ள எண்களை இணைக்கவும்.';

  @override
  String get baseShiftTitle => 'அடிமான மாற்றம்';

  @override
  String get baseShiftSubtitle => 'தசமத்தில் தீர்க்கவும்';

  @override
  String get baseShiftDescription =>
      'சமன்பாட்டைத் தீர்த்து, பதிலைத் தசமத்தில் (அடிமானம் 10) தட்டச்சு செய்யவும்.';

  @override
  String get baseShiftEquation => 'சமன்பாடு';

  @override
  String get baseShiftHint => 'தசம முடிவை உள்ளிடவும்...';

  @override
  String get baseShiftCorrect => 'சரி!';

  @override
  String get baseShiftIncorrect => 'தவறு!';

  @override
  String get baseShiftSubmit => 'சமர்ப்பி';

  @override
  String get baseShiftQuickGuide => 'விரைவு வழிகாட்டி:';

  @override
  String get baseShiftBinary => 'பைனரி (bin): அடிமானம் 2 (0, 1)';

  @override
  String get baseShiftHex => 'ஹெக்ஸாடெசிமல் (0x): அடிமானம் 16 (0-9, A-F)';

  @override
  String get baseShiftDecimal => 'தசமம் (dec): அடிமானம் 10 (0-9)';

  @override
  String get baseShiftWinTitle => 'கணித மந்திரவாதி!';

  @override
  String get baseShiftWinMessage =>
      'நீங்கள் 5 அடிமான மாற்றச் சமன்பாடுகளைச் சரியாகத் தீர்த்துள்ளீர்கள்!';

  @override
  String get blockCount3DTitle => '3D பிளாக் எண்ணுதல்';

  @override
  String get blockCount3DSubtitle =>
      'சுழற்ற இழுக்கவும் • மறைக்கப்பட்ட பிளாக்குகளை எண்ணவும்';

  @override
  String get blockCount3DHowMany => 'எத்தனை பிளாக்குகள் உள்ளன?';

  @override
  String get blockCount3DSubmitGuess => 'யூகத்தைச் சமர்ப்பிக்கவும்';

  @override
  String get blockCount3DNotQuite =>
      'சரியாக இல்லை! மீண்டும் எண்ண சுழற்ற முயற்சிக்கவும்.';

  @override
  String get blockCount3DExcellent => 'அருமை';

  @override
  String blockCount3DWinMessage(int count) {
    return 'நீங்கள் அனைத்து $count பிளாக்குகளையும் சரியாகக் கண்டறிந்துவிட்டீர்கள்!';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '1. பிளாக் அடுக்கைச் சுழற்ற 3D வியூபோர்ட்டில் உங்கள் விரலை இழுக்கவும்.\n\n2. அடுக்கில் உள்ள அனைத்து பிளாக்குகளையும் எண்ணவும்.\n\n3. நினைவில் கொள்க: காற்றில் இருக்கும் பிளாக்கிற்கு அடியில் கட்டமைப்பு ஆதரவு பிளாக்குகள் இருக்க வேண்டும் (மறைக்கப்பட்ட பிளாக்குகள்!).\n\n4. உள்ளீட்டுப் புலத்தில் உங்கள் பதிலைத் தட்டச்சு செய்து, சரிபார்க்க \"யூகத்தைச் சமர்ப்பிக்கவும்\" என்பதைத் தட்டவும்.';

  @override
  String get alphabetSudokuTitle => 'எழுத்து சுடோகு';

  @override
  String get alphabetSudokuSubtitle =>
      'ஒவ்வொரு வரிசை, நிரல் மற்றும் பெட்டியிலும் A-I எழுத்துக்கள் இருக்குமாறு கட்டத்தை நிரப்பவும்.';

  @override
  String get alphabetSudokuWinTitle => 'சுடோகு தீர்க்கப்பட்டது!';

  @override
  String get alphabetSudokuWinMessage =>
      'அற்புதம்! நீங்கள் எழுத்துக்களில் தேர்ச்சி பெற்றுவிட்டீர்கள்.';

  @override
  String get classicMazeTitle => 'கிளாசிக் மேஸ்';

  @override
  String get classicMazeSubtitle =>
      'ஆராய்ந்து தீர்க்கவும் • ஒவ்வொரு முறை விளையாடும்போதும் புதிய மேஸ்';

  @override
  String get classicMazeWinTitle => 'மேஸ் முடிந்தது';

  @override
  String classicMazeWinMessage(int count) {
    return 'அருமையான வழிசெலுத்தல்! நீங்கள் $count நகர்வுகளில் மேஸைத் தீர்த்துள்ளீர்கள்.';
  }

  @override
  String get classicMazeMoves => 'நகர்வுகள்: ';

  @override
  String get classicMazeHowToPlayDescription =>
      '1. ஒளிரும் மஞ்சள் உருண்டையை (வீரர்) கீழ் வலதுபுறத்தில் உள்ள பச்சை போர்ட்டலுக்கு (வெளியேறும் வழி) கொண்டு செல்லுங்கள்.\n\n2. நகர்த்த மேஸில் எங்கு வேண்டுமானாலும் ஸ்வைப் செய்யவும் அல்லது கீபோர்டு அம்பு விசைகள் அல்லது கீழே உள்ள பொத்தான்களைப் பயன்படுத்தவும்.\n\n3. ஊதா நிறப் பாதை நீங்கள் ஆராய்ந்த பாதையைக் காட்டுகிறது. பாதையில் பின்னோக்கிச் சென்று அதை அழிக்கலாம்!\n\n4. பெரிய மேஸ்கள் மூலம் உங்களை நீங்களே சவாலுக்கு உட்படுத்த மேலே உள்ள பட்டியில் இருந்து சிரம நிலைகளை மாற்றவும்!';

  @override
  String get conjunctionSearchTitle => 'இணைப்புத் தேடல்';

  @override
  String get conjunctionSearchSubtitle => 'கவனம் & பண்பு இணைப்பு';

  @override
  String get conjunctionSearchWinTitle => 'வெற்றி';

  @override
  String get conjunctionSearchWinMessage =>
      'சரியான கவனத்துடன் நீங்கள் அனைத்து இலக்குகளையும் கண்டறிந்துவிட்டீர்கள்!';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      'அறிவுறுத்தல்களில் ஒரு குறிப்பிட்ட இலக்கு வடிவம் மற்றும் வண்ணக் கலவை காட்டப்படும். அடர்த்தியான கட்டத்தில் அதை முடிந்தவரை விரைவாகக் கண்டறிந்து தட்டவும். திசைதிருப்பும் வடிவங்கள் ஒரே நிறத்தையோ அல்லது வடிவத்தையோ கொண்டிருக்கும், எனவே கூர்ந்து கவனிக்கவும்!';

  @override
  String get conjunctionSearchRound => 'சுற்று: ';

  @override
  String get conjunctionSearchScore => 'மதிப்பெண்: ';

  @override
  String get conjunctionSearchFind => 'கண்டறி: ';

  @override
  String get shapeCircle => 'வட்டம்';

  @override
  String get shapeSquare => 'சதுரம்';

  @override
  String get shapeTriangle => 'முக்கோணம்';

  @override
  String get shapeStar => 'நட்சத்திரம்';

  @override
  String get shapeRectangle => 'செவ்வகம்';

  @override
  String get shapeEllipse => 'நீள்வட்டம்';

  @override
  String get shapeTrapezoid => 'சரிவகம்';

  @override
  String get colorRedLabel => 'சிவப்பு';

  @override
  String get colorBlueLabel => 'நீலம்';

  @override
  String get colorGreenLabel => 'பச்சை';

  @override
  String get colorAmberLabel => 'ஆம்பர்';

  @override
  String get cubeNetFoldTitle => 'கியூப் நெட் மடிப்பு';

  @override
  String get cubeNetFoldSubtitle =>
      'பொருந்தும் 3D கியூப் விருப்பத்தைத் தேர்ந்தெடுக்கவும்';

  @override
  String get cubeNetFoldWinTitle => 'சரி';

  @override
  String get cubeNetFoldWinMessage =>
      'உங்களிடம் சரியான 3D இடஞ்சார்ந்த மடிப்பு தருக்கம் உள்ளது!';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '1. மேலே உள்ள விரிக்கப்பட்ட 2D வலையைப் பாருங்கள்.\n\n2. மனதளவில் அந்த வலையை 3D கனசதுரமாக மடிக்கவும்.\n\n3. அந்த மடிக்கப்பட்ட கனசதுரத்தின் சரியான 3D காட்சியைக் குறிக்கும் விருப்பத்தை கீழே தேர்ந்தெடுக்கவும்.\n\n4. கவனமாக இருங்கள்: வலையில் எதிரெதிர் முகங்கள் 3D இல் அருகருகே இருக்க முடியாது!';

  @override
  String get cubeNetFoldUnfoldedNet => 'விரிக்கப்பட்ட 2D வலை';

  @override
  String get cubeNetFoldWhichMatches => 'எந்த கியூப் பொருந்துகிறது?';

  @override
  String get cubeNetFoldIncorrect =>
      'தவறான மடிப்பு தருக்கம்! ரீசெட் செய்யவும் அல்லது உங்கள் விருப்பத்தை மாற்றவும்.';

  @override
  String get cubeNetFoldSubmitChoice => 'விருப்பத்தைச் சமர்ப்பிக்கவும்';

  @override
  String get cubeNetFoldFailed => 'தோல்வி (மீண்டும் முயற்சிக்கவும்)';

  @override
  String get faceTraitAssociationMemorize =>
      'அனைத்து 4 பேரையும் மனப்பாடம் செய்யவும்';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return '$total பேரில் $current-வது நபர்';
  }

  @override
  String get faceTraitAssociationWhatOccupation => 'அவர்களின் தொழில் என்ன?';

  @override
  String get faceTraitAssociationWhatHobby => 'அவர்களின் பொழுதுபோக்கு என்ன?';

  @override
  String get faceTraitAssociationWinTitle => 'நினைவக மாஸ்டர்!';

  @override
  String get faceTraitAssociationLoseTitle => 'விளையாட்டு முடிந்தது';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return 'நீங்கள் $total இல் $correct சரியான பதில்களைப் பெற்றுள்ளீர்கள்.';
  }

  @override
  String get topologyTitle => 'டோபாலஜி';

  @override
  String get topologySubtitle =>
      'இந்த வடிவங்கள் டோபாலஜிகல் முறையில் சமமானவையா? (வெட்டாமலோ ஒட்டாமலோ ஒன்றை மற்றொன்றாக மாற்ற முடியுமா?)';

  @override
  String get topologyWinTitle => 'வடிவியல் மேதை!';

  @override
  String get topologyWinMessage =>
      'நீங்கள் 10 டோபாலஜிகல் ஜோடிகளைச் சரியாகக் கண்டறிந்துள்ளீர்கள்!';

  @override
  String get topologyScore => 'மதிப்பெண்: ';

  @override
  String get semanticDistanceTitle => 'சொற்பொருள் தூரம்';

  @override
  String get semanticDistanceSubtitle =>
      'வார்த்தைகளுக்கு இடையிலான கருத்தியல் தூரத்தை அளவிடவும்';

  @override
  String get oxymoronHuntTitle => 'முரண்மொழி வேட்டை';

  @override
  String get oxymoronHuntSubtitle =>
      'கட்டத்தில் உள்ள முரணான வார்த்தைகளை இணையாக்கவும்';

  @override
  String get portmanteauSplitTitle => 'கலப்புச் சொல் பிரிப்பு';

  @override
  String get portmanteauSplitSubtitle =>
      'ஒரு கலப்புச் சொல்லின் மூல வார்த்தைகளை அடையாளம் காணவும்';

  @override
  String get chainReactionTitle => 'தொடர் வினை';

  @override
  String get chainReactionSubtitle =>
      'ஒன்றோடொன்று இணையும் எழுத்துக்களைப் பயன்படுத்தி வார்த்தைகளை இணைக்கவும்';

  @override
  String get rhymeMasterTitle => 'எதுகை மோனை மாஸ்டர்';

  @override
  String get rhymeMasterSubtitle =>
      'இலக்குடன் எதுகையாக வரும் வார்த்தைகளை அடையாளம் காணவும்';

  @override
  String get definitionDashTitle => 'விளக்க ஓட்டம்';

  @override
  String get definitionDashSubtitle =>
      'சரியான வார்த்தையை அதன் விளக்கத்துடன் பொருத்தவும்';

  @override
  String get syllableStackTitle => 'அசை அடுக்கு';

  @override
  String get syllableStackSubtitle =>
      'முழு வார்த்தைகளை உருவாக்க அசைகளை அடுக்கவும்';

  @override
  String get sentenceUnscrambleTitle => 'வாக்கிய வரிசை மாற்றம்';

  @override
  String get sentenceUnscrambleSubtitle =>
      'சரியான வாக்கியத்தை உருவாக்க வார்த்தைகளை வரிசைப்படுத்தவும்';

  @override
  String get grammarSortTitle => 'இலக்கண வகைப்பாடு';

  @override
  String get grammarSortSubtitle =>
      'வார்த்தைகளை அவற்றின் இலக்கண வகைகளின்படி வகைப்படுத்தவும்';

  @override
  String get vowelReconstructTitle => 'உயிரெழுத்து மறுசீரமைப்பு';

  @override
  String get vowelReconstructSubtitle =>
      'வாக்கியத்தில் விடுபட்ட உயிரெழுத்துக்களை நிரப்பவும்';

  @override
  String get consonantReconstructTitle => 'மெய்யெழுத்து மறுசீரமைப்பு';

  @override
  String get consonantReconstructSubtitle =>
      'வாக்கியத்தில் விடுபட்ட மெய்யெழுத்துக்களை நிரப்பவும்';

  @override
  String get homophoneHuntTitle => 'ஒரே ஒலிப்புச் சொல் வேட்டை';

  @override
  String get silentLetterSearchTitle => 'ஒலிக்காத எழுத்துத் தேடல்';

  @override
  String get silentLetterSearchSubtitle =>
      'கொடுக்கப்பட்ட வார்த்தைகளில் ஒலிக்காத எழுத்துக்களை அடையாளம் காணவும்';

  @override
  String get palindromeBuilderTitle => 'மாலைமாற்று சொற்படைப்பு';

  @override
  String get palindromeBuilderSubtitle =>
      'குறைந்தபட்ச எழுத்துக்களைச் சேர்த்து ஒரு மாலைமாற்றுச் சொல்லை உருவாக்கவும்';

  @override
  String get phoneticGuessTitle => 'ஒலிப்பு யூகிக்கவும்';

  @override
  String get phoneticGuessSubtitle =>
      'ஒலிப்பு எழுத்துப்பிழையிலிருந்து வார்த்தையை அடையாளம் காணவும்';

  @override
  String get spoonerismSolverTitle => 'ஸ்பூனரிஸம் தீர்வி';

  @override
  String get spoonerismSolverSubtitle =>
      'வாக்கியத்திற்கான சரியான ஸ்பூனரிஸத்தை அடையாளம் காணவும்';

  @override
  String get etymonOddballTitle => 'வேர்ச் சொல் மாறுபாடு';

  @override
  String get etymonOddballSubtitle =>
      'ஒரே வேர்ச் சொல்லைப் பகிராத வார்த்தையைக் கண்டறியவும்';

  @override
  String get etymologyOriginTitle => 'வேர்ச்சொல் தோற்றம்';

  @override
  String get etymologyOriginSubtitle =>
      'கடன்பெற்ற சொல்லின் மூல மொழியை யூகிக்கவும்';

  @override
  String get affixFactoryTitle => 'ஒட்டு தொழிற்சாலை';

  @override
  String get affixFactorySubtitle =>
      'முன்னொட்டுகள் மற்றும் பின்னொட்டுகளைப் பயன்படுத்தி சரியான வார்த்தைகளை உருவாக்கவும்';

  @override
  String get cognateCatchTitle => 'ஒரே மூலச் சொல் பிடி';

  @override
  String get cognateCatchSubtitle =>
      'உண்மையான மூலச் சொற்களுக்கும் தவறான நண்பர்களுக்கும் இடையில் வேறுபடுத்தவும்';

  @override
  String get compoundConnectTitle => 'கூட்டுச்சொல் இணைப்பு';

  @override
  String get compoundConnectSubtitle =>
      'ஒரு கூட்டுச்சொல்லை உருவாக்க இரண்டு வார்த்தைகளை இணைக்கவும்';

  @override
  String get pangramSprintTitle => 'பான் கிராம் ஓட்டம்';

  @override
  String get pangramSprintSubtitle =>
      'அனைத்து எழுத்துக்களையும் பயன்படுத்தி ஒரு வாக்கியத்தை உருவாக்கவும்';

  @override
  String get anagramDefinitionTitle => 'அனகிராம் விளக்கம்';

  @override
  String get anagramDefinitionSubtitle =>
      'விளக்கத்தின் அடிப்படையில் அனகிராமைத் தீர்க்கவும்';

  @override
  String get letterBridgeTitle => 'எழுத்துப் பாலம்';

  @override
  String get letterBridgeSubtitle =>
      'இரண்டு வார்த்தைகளை இணைக்கும் விடுபட்ட எழுத்தைக் கண்டறியவும்';

  @override
  String get letterFrequencyScanTitle => 'எழுத்து அதிர்வெண் ஸ்கேன்';

  @override
  String get letterFrequencyScanSubtitle =>
      'உரையில் ஒரு எழுத்து எத்தனை முறை தோன்றுகிறது என்பதை எண்ணுங்கள்';

  @override
  String get oneLetterShiftTitle => 'ஓர் எழுத்து மாற்றம்';

  @override
  String get oneLetterShiftSubtitle =>
      'ஓர் எழுத்து மாற்றத்தின் மூலம் ஒரு வார்த்தையை மற்றொரு வார்த்தையாக மாற்றவும்';

  @override
  String vocabularyBuilderMessage(String arg0) {
    return 'சிறந்த பணி! உங்கள் சொல்லகராதி ஈர்க்கக்கூடியது. மதிப்பெண்: $arg0';
  }

  @override
  String get symmetryMessage =>
      'நீங்கள் வடிவத்தை அறுவை சிகிச்சை துல்லியத்துடன் கச்சிதமாக பிரதிபலித்தீர்கள்.';

  @override
  String get temporalOrderMessage =>
      'அবিশ্বাস্য! உங்கள் காலவரிசை நினைவாற்றல் மிக உயர்ந்தது.';

  @override
  String get temporalOrderMessage1 =>
      'தவறான வரிசை நினைவாற்றல். பயிற்சி உங்களை முழுமையாக்கும்!';

  @override
  String get wordSearchMessage =>
      'கூர்மையான கவனிப்புடன் அனைத்து வார்த்தைகளும் வெற்றிகரமாக கண்டறியப்பட்டன.';

  @override
  String colorMatchMessage(String arg0) {
    return 'உங்கள் துல்லியம்: $arg0%';
  }

  @override
  String semanticLinkMessage(String arg0) {
    return 'நீங்கள் $arg0 மதிப்பெண்கள் பெற்றுள்ளீர்கள்!';
  }

  @override
  String reflexTapMessage(String arg0) {
    return 'நீங்கள் $arg0 இலக்குகளைத் தட்டினீர்கள்!';
  }

  @override
  String get angleFinderMessage => 'உங்கள் வடிவியல் உள்ளுணர்வு கச்சிதமானது!';

  @override
  String angleFinderMessage1(String arg0) {
    return 'சரியான பதில் $arg0°';
  }

  @override
  String angleFinderText(String arg0) {
    return '$arg0°';
  }

  @override
  String visualStatisticalLearningMessage(String arg0) {
    return 'நீங்கள் $arg0 சரியான வடிவங்களை மதிப்பெண் செய்துள்ளீர்கள்!';
  }

  @override
  String nonogramText(String arg0) {
    return 'பிழை: $arg0';
  }

  @override
  String mentalCalendarMessage(String arg0) {
    return 'நீங்கள் 10-க்கு $arg0 சரியான பதில்களைப் பெற்றுள்ளீர்கள்!';
  }

  @override
  String orbitTapMessage(String arg0) {
    return 'நீங்கள் வெற்றிகரமாக $arg0 முறை தட்டினீர்கள்!';
  }

  @override
  String schulteTableMessage(String arg0) {
    return 'நீங்கள் $arg0 நேரத்தில் அட்டவணையை முடித்தீர்கள்.\nஉங்கள் புறப் பார்வையை விரிவுபடுத்த தொடர்ந்து பயிற்சி செய்யுங்கள்!';
  }

  @override
  String get schulteTableText => 'சோதனையைத் தொடங்கு';

  @override
  String get relationalMemoryMessage =>
      'அற்புதமான இடஞ்சார்ந்த தொடர்பு நினைவாற்றல் துல்லியம்!';

  @override
  String sudokuText(String arg0) {
    return 'பிழை: $arg0';
  }

  @override
  String sdmtMessage(String arg0) {
    return 'நீங்கள் $arg0 குறியீடுகளைப் பொருத்தியுள்ளீர்கள்! இந்தச் சோதனை உங்கள் ஸ்கேனிங் வேகம் மற்றும் காட்சி கவனத்தை அளவிடுகிறது.';
  }

  @override
  String get futoshikiMessage =>
      'அற்புதம்! நீங்கள் புடோஷிகி லத்தீன் சதுரத்தைத் தீர்த்துவிட்டீர்கள்.';

  @override
  String letterFrequencyScanMessage(String arg0, String arg1) {
    return '\"$arg1\" எத்தனை முறை வந்துள்ளது என்பதை சரியாக $arg0 என்று எண்ணியுள்ளீர்கள்.';
  }

  @override
  String letterFrequencyScanText(String arg0) {
    return 'தவறு. எண்ணிக்கை $arg0.';
  }

  @override
  String get memoryMatrixMessage =>
      'ஈர்க்கக்கூடியது! உங்கள் வேலை நினைவாற்றல் கூர்மையாக உள்ளது. தினசரி இலக்கு முடிந்தது!';

  @override
  String get memoryMatrixMessage1 =>
      'உங்கள் நினைவாற்றல் மதிப்பெண்ணை மேம்படுத்த கவனம் செலுத்தி மீண்டும் முயற்சிக்கவும்.';

  @override
  String get contextCluesMessage =>
      'விதிவிலக்கானது! உங்கள் சொல்லகராதி மற்றும் சூழல் ஆய்வு மிகச் சிறப்பானது.';

  @override
  String get contextCluesMessage1 =>
      'தவறான வார்த்தை தேர்ந்தெடுக்கப்பட்டது! உங்கள் வாய்மொழி சூழல் பகுத்தறிவைப் பயிற்றுவித்து மீண்டும் முயற்சிக்கவும்.';

  @override
  String oneLetterShiftMessage(String arg0, String arg1) {
    return 'நீங்கள் வெற்றிகரமாக $arg0-லிருந்து $arg1-க்கு மாற்றினீர்கள்.';
  }

  @override
  String get mentalAbacusMessage => 'உங்கள் மனக் கணக்கீடு மிக உயர்ந்தது.';

  @override
  String fractionMatcherMessage(String arg0) {
    return 'பிரதிநிதித்துவங்களைப் பொருத்துவதன் மூலம் நீங்கள் $arg0 மதிப்பெண்கள் பெற்றுள்ளீர்கள்!';
  }

  @override
  String get spellingSprintMessage =>
      'நீங்கள் அனைத்து 10 வார்த்தைகளையும் சரியாக உச்சரித்துள்ளீர்கள்!';

  @override
  String spellingSprintMessage1(String arg0) {
    return 'நீங்கள் $arg0 வார்த்தைகளைச் சரியாக உச்சரித்துள்ளீர்கள்.';
  }

  @override
  String stopSignalMessage(String arg0) {
    return 'நீங்கள் $arg0 சரியான பதில்களைப் பெற்றுள்ளீர்கள்! இந்தச் சோதனை ஒரு திட்டமிட்ட செயலைத் தடுக்கும் உங்கள் திறனை அளவிடுகிறது.';
  }

  @override
  String grammarPoliceMessage(String arg0) {
    return 'விளையாட்டு முடிந்தது! இலக்கண உலகில் நீங்கள் ஒழுங்கைப் பராமரித்தீர்கள். மதிப்பெண்: $arg0';
  }

  @override
  String consonantReconstructMessage(String arg0) {
    return 'நீங்கள் $arg0 மதிப்பெண்ணை மறுசீரமைத்துள்ளீர்கள்!';
  }

  @override
  String rhymeMasterMessage(String arg0, String arg1) {
    return 'நீங்கள் $arg1-இல் $arg0 எதுகை மோனைகளைக் கண்டறிந்துள்ளீர்கள்!';
  }

  @override
  String vigilanceTaskMessage(String arg0, String arg1, String arg2) {
    return 'சரி: $arg0, தவறு: $arg1\nதவறான எச்சரிக்கைகள்: $arg2';
  }

  @override
  String get silhouetteMatchOrthoMessage =>
      'உங்களிடம் குறைபாடற்ற எழுத்து சீரமைப்பு திறன் உள்ளது!';

  @override
  String get silhouetteMatchOrthoText => 'புரிந்தது';

  @override
  String get silhouetteMatchOrthoText1 =>
      'தவறான முன்னோக்குத் திட்டம்! மீண்டும் முயல ரீசெட்டைத் தட்டவும்.';

  @override
  String fibonacciMergeMessage(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String factorFinderMessage(String arg0) {
    return 'அனைத்து காரணிகளையும் கண்டறிந்ததன் மூலம் நீங்கள் $arg0 மதிப்பெண்கள் பெற்றுள்ளீர்கள்!';
  }

  @override
  String logicalSyllogismsMessage(String arg0) {
    return 'நீங்கள் $arg0 தர்க்கரீதியான வாதங்களைச் சரியாகத் தீர்த்துள்ளீர்கள்!';
  }

  @override
  String get rotatingMazeMessage =>
      'இயக்கமுறை சுழலும் গোলகধাঁধாவில் வெற்றிகரமாகப் பயணித்தீர்கள்!';

  @override
  String get rotatingMazeText => 'புரிந்தது';

  @override
  String get rotatingMazeText1 => '🌀 গোলகধাঁধা 90° சுழன்றது! கட்டம் மாறியது!';

  @override
  String get mathPathMessage =>
      'இலக்கு தொகையைச் சேர்க்கும் பாதையை நீங்கள் கண்டறிந்துவிட்டீர்கள்!';

  @override
  String get bridgesMessage =>
      'அனைத்துத் தீவுகளையும் வெற்றிகரமாக இணைத்துவிட்டீர்கள்!';

  @override
  String compoundConnectMessage(String arg0, String arg1) {
    return 'கூட்டுச் சொல் $arg0$arg1 ஆகும்.';
  }

  @override
  String get pangramSprintMessage =>
      'அனைத்து 26 எழுத்துக்களையும் பயன்படுத்தி ஒரு வாக்கியத்தை உருவாக்கினீர்கள்.';

  @override
  String get mirrorImageMessage =>
      'பிரதிபலிப்பை நீங்கள் கச்சிதமாக அடையாளம் கண்டீர்கள்.';

  @override
  String get mirrorImageText => 'கண்ணாடி பிம்பம்';

  @override
  String reverseStroopMessage(String arg0) {
    return 'நீங்கள் $arg0 மதிப்பெண்கள் பெற்றுள்ளீர்கள்! அறிவுறுத்தல்களில் கவனமாக இருங்கள்.';
  }

  @override
  String get verbalAnalogiesMessage =>
      'உறவுகளைப் புரிந்துகொள்வதில் உங்களுக்குக் கூர்மையான அறிவு உள்ளது.';

  @override
  String corsiBlocksMessage1(String arg0, String arg1) {
    return 'நீங்கள் $arg1 வரிசைகளை நினைவுகூர்ந்தீர்கள்! உங்கள் இடஞ்சார்ந்த நினைவாற்றல் அளவு $arg0-ஐ எட்டியது.';
  }

  @override
  String wordLadderMessage(String arg0, String arg1, String arg2) {
    return 'நீங்கள் $arg0-ஐ $arg1-உடன் $arg2 படிகளில் வெற்றிகரமாக இணைத்துள்ளீர்கள்.';
  }

  @override
  String d2AttentionMessage(String arg0) {
    return 'அற்புதமான தேர்ந்தெடுக்கப்பட்ட ஸ்கேனிங்! இறுதி மதிப்பெண்: $arg0.';
  }

  @override
  String get d2AttentionText => 'எப்படி விளையாடுவது';

  @override
  String get d2AttentionText1 => 'புரிந்தது';

  @override
  String get tangleFixMessage =>
      'அனைத்து கோடுகளும் தெளிவாகவும் சீராகவும் உள்ளன.';

  @override
  String get distractorMatrixMessage =>
      'அற்புதம்! கணித கவனச்சிதறல்கள் இருந்தபோதிலும் நீங்கள் வடிவங்களை நினைவில் வைத்துள்ளீர்கள்!';

  @override
  String get distractorMatrixMessage1 =>
      'கவனச்சிதறல்கள் உங்களை வென்றுவிட்டன! உங்கள் நினைவாற்றலை மீண்டும் பயிற்றுவிக்கவும்.';

  @override
  String sentenceUnscrambleMessage(String arg0) {
    return 'நீங்கள் $arg0 மதிப்பெண்ணை வரிசை மாற்றியுள்ளீர்கள்!';
  }

  @override
  String get kakuroMessage =>
      'அற்புதம்! நீங்கள் அனைத்து கூடுதல் பகுதிகளையும் கச்சிதமாகப் பொருத்தியுள்ளீர்கள்.';

  @override
  String symbolicFlankerMessage(String arg0, String arg1) {
    return 'நீங்கள் $arg1-க்கு $arg0 சரியான பதில்களைப் பெற்றுள்ளீர்கள்!';
  }

  @override
  String stroopTestMessage(String arg0) {
    return 'நீங்கள் $arg0 மதிப்பெண் பெற்றுள்ளீர்கள்! வார்த்தையில் அல்ல, மை நிறத்தில் கவனம் செலுத்துங்கள்.';
  }

  @override
  String wisconsinCardSortingMessage(String arg0) {
    return 'நீங்கள் $arg0 அட்டைகளைச் சரியாக வகைப்படுத்தியுள்ளீர்கள்!';
  }

  @override
  String nBackMessage(String arg0) {
    return 'நீங்கள் $arg0 முறை 2-பேக் பொருத்தங்களைச் செய்துள்ளீர்கள்! பல பணிகளைச் செய்ய உங்கள் நினைவாற்றல் முக்கியமானது.';
  }

  @override
  String rhythmMasterMessage(String arg0, String arg1) {
    return 'நீங்கள் $arg0 சரியான தட்டல்கள் மற்றும் $arg1 புள்ளிகளைப் பெற்றுள்ளீர்கள்!';
  }

  @override
  String groceryListMessage(String arg0, Object score) {
    return 'மளிகைப் பட்டியலில் நீங்கள் $arg0 மதிப்பெண்கள் பெற்றுள்ளீர்கள்!';
  }

  @override
  String get groceryListText => 'நான்';

  @override
  String get mirrorTracingMessage =>
      'உங்கள் மூளை அதன் ஒருங்கிணைப்பை வெற்றிகரமாக மறுசீரமைத்துள்ளது.';

  @override
  String moduloClockMessage(String arg0) {
    return 'சிறந்த மாடுலர் மனக் கணக்கீட்டு ஒருங்கிணைப்பு! மதிப்பெண்: $arg0';
  }

  @override
  String moduloClockMessage1(String arg0, String arg1, String arg2) {
    return 'நீங்கள் $arg1-இல் $arg0 மாடுலர் கடிகாரத் தீர்வுகளைச் செய்துள்ளீர்கள். மதிப்பெண்: $arg2';
  }

  @override
  String get crownMessage =>
      'அனைத்து கிரீடங்களும் சரியான தர்க்கத்துடன் வெற்றிகரமாக வைக்கப்பட்டுள்ளன.';

  @override
  String dualCodingMessage(String arg0) {
    return 'அற்புதமான இரட்டைப் பணி செயல்பாடு! உங்கள் நினைவாற்றல் மதிப்பெண்: $arg0';
  }

  @override
  String inequalityDashMessage(String arg0) {
    return 'சமமற்ற தன்மைகளைப் பொருத்துவதன் மூலம் நீங்கள் $arg0 மதிப்பெண்கள் பெற்றுள்ளீர்கள்!';
  }

  @override
  String sourceMonitoringMessage(String arg0, String arg1) {
    return 'நீங்கள் $arg1-க்கு $arg0 மதிப்பெண் பெற்றுள்ளீர்கள்!';
  }

  @override
  String get sourceMonitoringText => 'நினைவுகூரத் தொடங்கு';

  @override
  String get memoryPalaceText => 'கிடைக்கும் வார்த்தைகள்';

  @override
  String target10Message(String arg0) {
    return 'எண்களை 10-உடன் பொருத்துவதன் மூலம் நீங்கள் $arg0 மதிப்பெண்கள் பெற்றுள்ளீர்கள்!';
  }

  @override
  String get paperFoldingMessage =>
      'உங்கள் மனதில் வடிவங்களை உங்களால் பார்க்க முடிகிறது.';

  @override
  String topologyText(String arg0, String arg1) {
    return '$arg0$arg1 / 10';
  }

  @override
  String get waterSortMessage =>
      'நீங்கள் அனைத்து வண்ணங்களையும் கச்சிதமாக வகைப்படுத்தியுள்ளீர்கள்!';

  @override
  String anagramDefinitionMessage(String arg0) {
    return 'வார்த்தை உண்மையில் \"$arg0\" தான்.';
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
    return 'நீங்கள் $arg0 சரியான மதிப்பீடுகளைச் செய்துள்ளீர்கள்.';
  }

  @override
  String grammarSortMessage(String arg0) {
    return 'நீங்கள் $arg0 வார்த்தைகளைச் சரியாக வகைப்படுத்தியுள்ளீர்கள்!';
  }

  @override
  String vowelReconstructMessage(String arg0) {
    return 'நீங்கள் $arg0 மதிப்பெண்ணை மறுசீரமைத்துள்ளீர்கள்!';
  }

  @override
  String spatialConflictMessage(String arg0, String arg1) {
    return 'நீங்கள் $arg1 பிழைகளுடன் $arg0 மதிப்பெண்களைப் பெற்றுள்ளீர்கள்!';
  }

  @override
  String get spatialConflictText => 'எப்படி விளையாடுவது';

  @override
  String get spatialConflictText1 => 'புரிந்தது';

  @override
  String tracePathMessage(String arg0) {
    return 'உங்கள் துல்லியம் $arg0% ஆகும்!';
  }

  @override
  String ruleSwitcherMessage(String arg0, String arg1) {
    return 'நீங்கள் $arg1-க்கு $arg0 சரியான மதிப்பெண் பெற்றுள்ளீர்கள்!';
  }

  @override
  String collatzMessage(String arg0, String arg1) {
    return 'நீங்கள் $arg0 படிகளை எடுத்துள்ளீர்கள். குறைந்தபட்சம் $arg1 ஆகும்.';
  }

  @override
  String get collatzText => '/ 2';

  @override
  String get collatzText1 => '+ 1';

  @override
  String get collatzText2 => '3n + 1';

  @override
  String divisibilityDashMessage(String arg0) {
    return 'நீங்கள் $arg0 எண்களைத் தீர்த்துள்ளீர்கள்!';
  }

  @override
  String switchTaskMessage(String arg0) {
    return 'நீங்கள் $arg0 மதிப்பெண் பெற்றுள்ளீர்கள்! மன நெகிழ்வுத்தன்மைக்கு விரைவான மாற்றம் முக்கியமானது.';
  }

  @override
  String sequenceSleuthMessage(String arg0) {
    return 'நீங்கள் $arg0 வரிசைகளைத் தீர்த்துள்ளீர்கள்!';
  }

  @override
  String changeBlindnessMessage(String arg0) {
    return 'நீங்கள் $arg0 மாற்றங்களைக் கண்டறிந்துள்ளீர்கள்!';
  }

  @override
  String mentalRotationMessage(String arg0) {
    return 'நீங்கள் $arg0 வடிவங்களைச் சரியாகச் சுழற்றியுள்ளீர்கள்!';
  }

  @override
  String wordMastermindMessage(String arg0) {
    return 'நீங்கள் குறியீட்டை மாஸ்டர் செய்துவிட்டீர்கள்!\nவார்த்தை: $arg0';
  }

  @override
  String wordMastermindMessage1(String arg0) {
    return 'மறைக்கப்பட்ட வார்த்தை: $arg0';
  }

  @override
  String wordMastermindText(String arg0) {
    return '$arg0';
  }

  @override
  String get simonSequenceMessage =>
      'நீங்கள் அனைத்து 10 கட்டங்களையும் நினைவில் வைத்துள்ளீர்கள்!';

  @override
  String get simonSequenceMessage1 =>
      'வரிசையை மாஸ்டர் செய்ய மீண்டும் முயற்சிக்கவும்.';

  @override
  String oxymoronHuntMessage(String arg0) {
    return 'நீங்கள் $arg0 முரண்மொழிகளைக் கண்டறிந்துள்ளீர்கள்!';
  }

  @override
  String spotlightTrackMessage(String arg0) {
    return 'அற்புதமான இடஞ்சார்ந்த கண்காணிப்பு! நீங்கள் $arg0 மதிப்பெண்கள் பெற்றுள்ளீர்கள்.';
  }

  @override
  String get spotlightTrackText => 'எப்படி விளையாடுவது';

  @override
  String get spotlightTrackText1 => 'புரிந்தது';

  @override
  String get spotlightTrackText2 => 'சுற்றைத் தொடங்கு';

  @override
  String vennNumbersMessage(String arg0) {
    return 'நீங்கள் $arg0 எண்களை வகைப்படுத்தியுள்ளீர்கள்!';
  }

  @override
  String get vennNumbersText => 'எதுவுமில்லை';

  @override
  String get vennNumbersText1 => 'இரண்டும்';

  @override
  String get silhouetteMatchMessage =>
      '3D-யிலிருந்து 2D-க்கு மொழிபெயர்ப்பதில் உங்கள் மூளை சிறந்தது.';

  @override
  String sumSnakeMessage(String arg0) {
    return 'இலக்கு $arg0 கச்சிதமான துல்லியத்துடன் எட்டப்பட்டது!';
  }

  @override
  String get sumSnakeText => 'பாதையைச் சுத்தம் செய்';

  @override
  String percentagePeakMessage(String arg0) {
    return 'நீங்கள் $arg0 சதவீதக் கணக்குகளைத் தீர்த்துள்ளீர்கள்!';
  }

  @override
  String trailMakingMessage(String arg0) {
    return 'நீங்கள் $arg0 தடங்களை முடித்துள்ளீர்கள்! இந்தச் சோதனை உங்கள் காட்சித் தேடல் வேகம் மற்றும் மன நெகிழ்வுத்தன்மையை அளவிடுகிறது.';
  }

  @override
  String matrixReasoningMessage(String arg0) {
    return 'நீங்கள் $arg0 அணிகளைச் சரியாக முடித்துள்ளீர்கள்!';
  }

  @override
  String get tentsAndTreesMessage =>
      'அனைத்துக் கூடாரங்களையும் வெற்றிகரமாக அமைத்துவிட்டீர்கள்.';

  @override
  String klotskiMessage(String arg0) {
    return 'அற்புதமான சறுக்கல்! ஹீரோ பிளாக்கை $arg0 நகர்வுகளில் விடுவித்துவிட்டீர்கள்.';
  }

  @override
  String sumPyramidMessage(String arg0) {
    return 'நீங்கள் $arg0 கூடுதல் பிரமிடுகளை வெற்றிகரமாகத் தீர்த்துவிட்டீர்கள்!';
  }

  @override
  String simonCommandMessage(String arg0) {
    return 'சிறந்த தேர்ந்தெடுக்கப்பட்ட பதில் மற்றும் கவனம்! மொத்த மதிப்பெண்: $arg0';
  }

  @override
  String simonCommandMessage1(String arg0, String arg1) {
    return 'நீங்கள் $arg0 மதிப்பெண் பெற்றுள்ளீர்கள், ஆனால் குறித்த நேரத்திற்குள் $arg1 பொருத்தங்களை அடையவில்லை.';
  }

  @override
  String syllableStackMessage(String arg0) {
    return 'நீங்கள் $arg0 மதிப்பெண்ணுக்கு அசைகளை அடுக்கியுள்ளீர்கள்!';
  }

  @override
  String get slitherlinkMessage =>
      'அற்புதம்! நீங்கள் வெற்றிகரமாக வளைய புதிரை முடித்துவிட்டீர்கள்.';

  @override
  String quickMathMessage(String arg0) {
    return 'நீங்கள் $arg0 கணக்குகளைத் தீர்த்துள்ளீர்கள்!';
  }

  @override
  String commonDenominatorMessage(String arg0) {
    return 'நீங்கள் $arg0 மீ.பொ.வ/மீ.சி.ம கணக்குகளைத் தீர்த்துள்ளீர்கள்!';
  }

  @override
  String chainReactionMessage(String arg0, String arg1) {
    return 'உங்கள் இறுதி மதிப்பெண் $arg0. நீங்கள் $arg1 வார்த்தைகளின் சங்கிலியை உருவாக்கியுள்ளீர்கள்.';
  }

  @override
  String chainReactionText(String arg0) {
    return '$arg0';
  }

  @override
  String get associativePairsMessage =>
      'அற்புதம்! காட்சிப் பண்புகளை நீங்கள் குறைபாடற்ற முறையில் இணைத்துள்ளீர்கள்.';

  @override
  String get associativePairsMessage1 =>
      'தவறான தொடர்பு! உங்கள் நினைவாற்றலைக் கூர்மையாக்கி மீண்டும் முயற்சிக்கவும்.';

  @override
  String portmanteauSplitMessage(String arg0) {
    return 'நீங்கள் $arg0 கலப்புச் சொற்களைப் பிரித்துள்ளீர்கள்!';
  }

  @override
  String get magicSquaresText => 'சுத்தம் செய்';

  @override
  String alphabetSudokuText(String arg0) {
    return 'பிழை: $arg0';
  }

  @override
  String get pipesMessage =>
      'அனைத்துப் குழாய்களையும் இணைத்து கட்டத்தை நிரப்பிவிட்டீர்கள்.';

  @override
  String get dualMirrorMessage =>
      'இரு சின்னங்களையும் அவற்றின் இலக்குகளுக்குக் கொண்டு சேர்த்துவிட்டீர்கள்!';

  @override
  String binaryCodeMessage(String arg0) {
    return 'அற்புதமான வேகமான தசம மொழிபெயர்ப்பு! இறுதி மதிப்பெண்: $arg0';
  }

  @override
  String binaryCodeMessage1(String arg0, String arg1) {
    return 'நீங்கள் $arg0 பைனரி எண்களைச் சரியாக மாற்றியுள்ளீர்கள். மதிப்பெண்: $arg1';
  }

  @override
  String oddOneOutMessage(String arg0) {
    return 'நீங்கள் 50 மாறுபட்டவற்றைக் கண்டறிந்துள்ளீர்கள்! இறுதி மதிப்பெண்: $arg0';
  }

  @override
  String oddOneOutMessage1(String arg0) {
    return 'உங்கள் மதிப்பெண்: $arg0';
  }

  @override
  String letterBridgeMessage(String arg0) {
    return 'பாலம் எழுத்தை நீங்கள் கண்டறிந்துவிட்டீர்கள்: $arg0';
  }

  @override
  String get imReady => 'நான் தயார்';

  @override
  String get soptTitle => 'சுய-வரிசைப்படுத்தப்பட்ட சுட்டி';

  @override
  String get soptSubtitle =>
      'ஒவ்வொரு முறையும் வெவ்வேறு கார்டைத் தட்டவும். பதவிகள் மாறுகின்றன!';

  @override
  String get soptWinTitle => 'சீக்வென்ஸ் மாஸ்டர்!';

  @override
  String soptGameOverMessage(int score) {
    return 'மாற்றப்பட்ட கார்டுகளை வெற்றிகரமாகக் கண்காணிப்பதன் மூலம் $score புள்ளிகளைப் பெற்றுள்ளீர்கள்!';
  }

  @override
  String get soptChooseNovel => 'புதிய அட்டையைத் தட்டவும்';

  @override
  String get soptGreatJob => 'பெரிய வேலை!';

  @override
  String get soptAlreadyTapped => 'ஏற்கனவே தட்டப்பட்டது!';

  @override
  String get soptGrid => 'கட்டம்';

  @override
  String get contRecogTitle => 'தொடர்ச்சியான அங்கீகாரம்';

  @override
  String get contRecogSubtitle =>
      'இந்த அமர்வில் இந்தக் கார்டை இதற்கு முன் பார்த்திருக்கிறீர்களா?';

  @override
  String get contRecogWinTitle => 'அங்கீகாரம் மேதை!';

  @override
  String contRecogGameOverMessage(int score) {
    return 'நீங்கள் $score சரியான அங்கீகாரங்களைப் பெற்றுள்ளீர்கள்!';
  }

  @override
  String get contRecogCorrect => 'சரி!';

  @override
  String get contRecogWrong => 'தவறு!';

  @override
  String get contRecogOldOrNew => 'இது பழையதா அல்லது புதியதா?';

  @override
  String get contRecogNew => 'புதியது';

  @override
  String get contRecogOld => 'பழையது';

  @override
  String get contRecogSeenPool => 'பார்த்தது குளம்';

  @override
  String get dnmsTitle => 'பொருந்தாத நினைவகம்';

  @override
  String get dnmsSubtitle =>
      'மனப்பாடம் செய்யப்பட்ட மாதிரியில் இல்லாத கார்டைத் தட்டவும்.';

  @override
  String get dnmsWinTitle => 'பொருந்தாத நிபுணர்!';

  @override
  String dnmsGameOverMessage(int score) {
    return 'தாமதமான பொருத்தமற்றதில் $score சரியான விடைகளைப் பெற்றுள்ளீர்கள்!';
  }

  @override
  String get dnmsChooseNovel => 'புதிய அட்டையைத் தட்டவும்';

  @override
  String get dnmsMemorizeSample => 'இந்த அட்டையை மனப்பாடம் செய்யுங்கள்';

  @override
  String get dnmsWaitForIt => 'காத்திருங்கள்...';

  @override
  String get dnmsExcellent => 'சிறப்பானது!';

  @override
  String get dnmsSampleTapped => 'அது மாதிரி இருந்தது!';

  @override
  String get dnmsCards => 'அட்டைகள்';

  @override
  String get symSpanTitle => 'சமச்சீர் இடைவெளி';

  @override
  String get symSpanSubtitle =>
      'செங்குத்து சமச்சீர் அடையாளம் காணும் போது செல் வடிவங்களை நினைவுபடுத்தவும்.';

  @override
  String get symSpanWinTitle => 'சமச்சீர் மாஸ்டர்!';

  @override
  String symSpanGameOverMessage(int score) {
    return 'தளவமைப்புகளை நினைவுபடுத்துவதன் மூலமும் சமச்சீர்வை அடையாளம் காண்பதன் மூலமும் $score புள்ளிகளைப் பெற்றுள்ளீர்கள்!';
  }

  @override
  String get symSpanMemorizeRed =>
      'சிவப்பு செல் இருப்பிடத்தை நினைவில் கொள்ளுங்கள்';

  @override
  String get symSpanIsSymmetric => 'முறை சமச்சீராக உள்ளதா?';

  @override
  String get symSpanRecallSequence =>
      'வரிசையை சரியான வரிசையில் நினைவுபடுத்தவும்';

  @override
  String get symSpanGreatJob => 'பெரிய வேலை!';

  @override
  String get symSpanTryAgain => 'மீண்டும் முயற்சிக்கவும்!';

  @override
  String get symSpanLength => 'நீளம்';

  @override
  String get readingSpanTitle => 'வாசிப்பு இடைவெளி';

  @override
  String get readingSpanSubtitle =>
      'எழுத்துக்களின் வரிசையை நினைவில் வைத்துக்கொண்டு வாக்கியங்களைச் சரிபார்க்கவும்.';

  @override
  String get readingSpanWinTitle => 'வாசிப்பு நிபுணரே!';

  @override
  String readingSpanGameOverMessage(int score) {
    return 'ரீடிங் ஸ்பான் நினைவக சவாலில் $score புள்ளிகளைப் பெற்றுள்ளீர்கள்!';
  }

  @override
  String get readingSpanTrueFalse => 'இந்தக் கூற்று உண்மையா பொய்யா?';

  @override
  String get readingSpanMemorizeLetter => 'இந்த கடிதத்தை மனப்பாடம் செய்யுங்கள்';

  @override
  String get readingSpanRecallLetters => 'கடிதங்களை வரிசையாக நினைவு கூருங்கள்';

  @override
  String get readingSpanGreatJob => 'பெரிய வேலை!';

  @override
  String get readingSpanTryAgain => 'மீண்டும் முயற்சிக்கவும்!';

  @override
  String readingSpanYourSequence(String sequence) {
    return 'உங்கள் வரிசை: $sequence';
  }

  @override
  String get readingSpanLength => 'நீளம்';

  @override
  String get readingSpanSentence1 => 'சூரியன் கிழக்கில் உதிக்கிறான்.';

  @override
  String get readingSpanSentence2 => 'பனி சூடாகக் கொதித்துக் கொண்டிருக்கிறது.';

  @override
  String get readingSpanSentence3 =>
      'மீன்கள் நீருக்கடியில் சுவாசிக்க முடியும்.';

  @override
  String get readingSpanSentence4 =>
      'நாய்களுக்கு இறக்கைகள் உள்ளன, பறக்கக் கூடியவை.';

  @override
  String get readingSpanSentence5 => 'நீர் 0 டிகிரி செல்சியஸில் உறைகிறது.';

  @override
  String get readingSpanSentence6 =>
      'பூனைகள் சிறிய நாய்களைப் போல குரைக்கின்றன.';

  @override
  String get readingSpanSentence7 =>
      'கோடையில் மரங்களில் பச்சை இலைகள் இருக்கும்.';

  @override
  String get readingSpanSentence8 =>
      'மழை தரையில் இருந்து மேல் நோக்கி விழுகிறது.';

  @override
  String get readingSpanSentence9 =>
      'ஒரு முக்கோணம் நான்கு சம பக்கங்களைக் கொண்டது.';

  @override
  String get readingSpanSentence10 => 'ஆப்பிள் ஒரு வகையான இனிப்பு பழம்.';

  @override
  String get readingSpanSentence11 => 'சந்திரன் செடார் பாலாடைக்கட்டியால் ஆனது.';

  @override
  String get readingSpanSentence12 =>
      'ஆட்டோமொபைல்களில் உருட்ட சக்கரங்கள் உள்ளன.';

  @override
  String get readingSpanSentence13 => 'நெருப்பு குளிர்ச்சியாக இருக்கிறது.';

  @override
  String get readingSpanSentence14 =>
      'காகிதம் பதப்படுத்தப்பட்ட மரத்திலிருந்து தயாரிக்கப்படுகிறது.';

  @override
  String get readingSpanSentence15 => 'பறவைகளுக்கு பறக்க உதவும் இறகுகள் உள்ளன.';

  @override
  String get readingSpanSentence16 => 'வாழைப்பழங்கள் பைன் மரங்களில் வளரும்.';

  @override
  String get readingSpanSentence17 => 'யானை எறும்பை விட சிறியது.';

  @override
  String get readingSpanSentence18 =>
      'புத்தகங்களில் உரை அச்சிடப்பட்ட பக்கங்கள் உள்ளன.';

  @override
  String get countingSpanTitle => 'எண்ணும் இடைவெளி';

  @override
  String get countingSpanSubtitle =>
      'நீல வட்டங்களை மட்டும் எண்ணுங்கள். பின்னர் எண்ணிக்கைகளின் வரிசையை நினைவுபடுத்துங்கள்.';

  @override
  String get countingSpanWinTitle => 'எண்ணும் மேதை!';

  @override
  String countingSpanGameOverMessage(int score) {
    return 'கவுண்டிங் ஸ்பான் நினைவக சவாலில் $score புள்ளிகளைப் பெற்றுள்ளீர்கள்!';
  }

  @override
  String get countingSpanCountCircles => 'நீல வட்டங்களை மட்டும் எண்ணுங்கள்';

  @override
  String get countingSpanRecallCounts => 'ரீகால் எண்ணிக்கைகள் சரியான வரிசையில்';

  @override
  String get countingSpanGreatJob => 'பெரிய வேலை!';

  @override
  String get countingSpanTryAgain => 'மீண்டும் முயற்சிக்கவும்!';

  @override
  String countingSpanYourSequence(String sequence) {
    return 'உங்கள் வரிசை: $sequence';
  }

  @override
  String get countingSpanLength => 'நீளம்';

  @override
  String get objDispTitle => 'பொருள் இடப்பெயர்ச்சி';

  @override
  String get objDispSubtitle =>
      'அமைப்பை மனப்பாடம் செய்யுங்கள். நிலையை மாற்றும் ஒரு பொருளைக் கண்டுபிடித்து தட்டவும்.';

  @override
  String get objDispWinTitle => 'இடஞ்சார்ந்த மேதை!';

  @override
  String objDispGameOverMessage(int score) {
    return 'நீங்கள் $score இடம்பெயர்ந்த பொருட்களை சரியாக அடையாளம் கண்டுள்ளீர்கள்!';
  }

  @override
  String get objDispMemorizeAll => 'எல்லா இடங்களையும் மனப்பாடம் செய்யுங்கள்';

  @override
  String get objDispWaitingShift =>
      'தளவமைப்பு மாற்றத்திற்காக காத்திருக்கிறது...';

  @override
  String get objDispTapMoved => 'நகர்த்திய பொருளைத் தட்டவும்';

  @override
  String get objDispExcellent => 'சிறப்பானது!';

  @override
  String get objDispWrongObject => 'தவறான பொருள்!';

  @override
  String get objDispItems => 'பொருட்கள்';

  @override
  String get mandalaTitle => 'மண்டலா நினைவு';

  @override
  String get mandalaSubtitle =>
      'வண்ண உள்ளமைவை நினைவில் கொள்க. வண்ணங்களைத் தேர்ந்தெடுத்து ஓடுகளை மீண்டும் பூசவும்.';

  @override
  String get mandalaWinTitle => 'மண்டலக் கலைஞர்!';

  @override
  String mandalaGameOverMessage(int score) {
    return 'வண்ண வடிவியல் தளவமைப்புகளை மீண்டும் உருவாக்குவதன் மூலம் $score புள்ளிகளைப் பெற்றுள்ளீர்கள்!';
  }

  @override
  String get mandalaMemorizeColors => 'ஓடு வண்ணங்களை நினைவில் கொள்ளுங்கள்';

  @override
  String get mandalaPaintCells => 'அசலைப் பொருத்த கலங்களை பெயிண்ட் செய்யவும்';

  @override
  String get mandalaExcellent => 'சிறப்பானது!';

  @override
  String get mandalaIncorrectMatch => 'தவறான பொருத்தம்!';

  @override
  String get mandalaSubmitRepaint => 'மீண்டும் பெயின்ட் சமர்ப்பிக்கவும்';

  @override
  String get mandalaTiles => 'ஓடுகள்';

  @override
  String get runningSpanTitle => 'ரன்னிங் ஸ்பான்';

  @override
  String get runningSpanSubtitle =>
      'கடிதங்களைப் பாருங்கள். அவை நிறுத்தப்பட்டதும், கடைசி N எழுத்துக்களை வரிசையாக உள்ளிடவும்.';

  @override
  String get runningSpanWinTitle => 'தாங்கல் மாஸ்டர்!';

  @override
  String runningSpanGameOverMessage(int score) {
    return 'ரன்னிங் மெமரி ஸ்பானில் $score புள்ளிகளைப் பெற்றுள்ளீர்கள்!';
  }

  @override
  String runningSpanPrepareRecall(int count) {
    return 'கடைசி $count கடிதங்களை நினைவுகூரத் தயாராகுங்கள்';
  }

  @override
  String get runningSpanWatchCarefully => 'கவனமாக பாருங்கள்...';

  @override
  String runningSpanEnterLast(int count) {
    return 'கடைசி $count எழுத்துக்களை உள்ளிடவும்';
  }

  @override
  String get runningSpanGreatJob => 'பெரிய வேலை!';

  @override
  String get runningSpanIncorrectBuffer => 'தவறான தாங்கல்!';

  @override
  String runningSpanRecallLast(int count) {
    return 'கடந்த $count ஐ நினைவுபடுத்து';
  }

  @override
  String get runningSpanStopsRandomly => 'தாரை தாரையாக நிற்கிறது!';

  @override
  String runningSpanEntered(String sequence) {
    return 'உள்ளிடப்பட்டது: $sequence';
  }

  @override
  String get runningSpanNItems => 'N-உருப்படிகள்';

  @override
  String get spatialCabinetTitle => 'இடஞ்சார்ந்த அலமாரிகள்';

  @override
  String get spatialCabinetSubtitle =>
      'எந்த கேபினட் டிராயரில் எந்த பொருள் உள்ளது என்பதை நினைவில் கொள்ளுங்கள்.';

  @override
  String get spatialCabinetWinTitle => 'அமைச்சரவை நிபுணரே!';

  @override
  String spatialCabinetGameOverMessage(int score) {
    return 'ஸ்பேஷியல் கேபினட் நினைவகத்தில் $score புள்ளிகளைப் பெற்றுள்ளீர்கள்!';
  }

  @override
  String get spatialCabinetMemorize =>
      'உருப்படிகளின் இருப்பிடங்களை நினைவில் கொள்க';

  @override
  String spatialCabinetWhereIs(String itemName) {
    return '$itemName எங்கே உள்ளது?';
  }

  @override
  String get spatialCabinetCorrect => 'சரி!';

  @override
  String get spatialCabinetWrongDrawer => 'தவறான டிராயர்!';

  @override
  String get spatialCabinetItems => 'பொருட்கள்';

  @override
  String get cabinetItemKey => 'முக்கிய';

  @override
  String get cabinetItemApple => 'ஆப்பிள்';

  @override
  String get cabinetItemDiamond => 'வைரம்';

  @override
  String get cabinetItemBook => 'புத்தகம்';

  @override
  String get cabinetItemUmbrella => 'குடை';

  @override
  String get cabinetItemCoffee => 'காபி';

  @override
  String get cabinetItemLock => 'பூட்டு';

  @override
  String get cabinetItemPet => 'செல்லப்பிராணி';

  @override
  String get cabinetItemCar => 'கார்';

  @override
  String get gamesTitleLabel => 'விளையாட்டுகள்';

  @override
  String get yourFavorites => 'உங்கள் விருப்பமானவை';

  @override
  String get readyForWorkout => 'உங்கள் தினசரி பயிற்சிக்காக தயாரா?';

  @override
  String get greatStartKeepGoing => 'சிறந்த தொடக்கம்! தொடர்ந்து முன்னேறுங்கள்.';

  @override
  String get onFireToday => 'இன்று நீங்கள் மிகச்சிறப்பாக செயல்படுகிறீர்கள்!';

  @override
  String get incredibleSolvingToday => 'இன்று வியக்கத்தக்க தீர்வுகள்!';

  @override
  String get newGameLabel => 'புதியது';

  @override
  String get slitherlinkTitle => 'ஸ்லிதர்லிங்க்';

  @override
  String get slitherlinkSubtitle =>
      'எண் குறிப்புகளைப் பயன்படுத்தி பின் கிரிடை லூப் செய்யவும்.';

  @override
  String get futoshikiTitle => 'புடோஷிகி';

  @override
  String get futoshikiSubtitle =>
      'பெரியது-சிறியது குறிப்புகளைக் கொண்டு கிரிட்களை நிரப்பவும்.';

  @override
  String get kakuroTitle => 'காகுரோ';

  @override
  String get kakuroSubtitle =>
      'எண்கள் மற்றும் கூட்டல்களைக் கொண்டு குறுக்கெழுத்து புதிர்களைத் தீர்க்கவும்.';

  @override
  String get inequalityDashTitle => 'சமனின்மை டேஷ்';

  @override
  String get inequalityDashSubtitle =>
      'கால அழுத்தத்தில் சமனின்மைகளைத் தீர்க்கவும்.';

  @override
  String get factorFinderTitle => 'காரணி கண்டுபிடிப்பான்';

  @override
  String get factorFinderSubtitle =>
      'இலக்கு எண்களின் அனைத்து காரணிகளையும் கண்டறியவும்.';

  @override
  String get collatzTitle => 'கோலாட்ஸ் பாதை';

  @override
  String get collatzSubtitle => '3N+1 வரிசையில் பயணிக்கவும்.';

  @override
  String get sumPyramidTitle => 'கூட்டல் பிரமிடு';

  @override
  String get sumPyramidSubtitle =>
      'கூட்டல் கணக்கு குறிப்புகளைக் கொண்டு பிரமிடு கட்டங்களை நிரப்பவும்.';

  @override
  String get target10Title => 'இலக்கு 10';

  @override
  String get target10Subtitle =>
      'பத்து கூட்டலைப் பெற எண் கட்டங்களை இணைக்கவும்.';

  @override
  String get fractionMatcherTitle => 'பின்னப் பொருத்தம்';

  @override
  String get fractionMatcherSubtitle =>
      'சமமான பின்னங்களை காட்சி ரீதியாகப் பொருத்தவும்.';

  @override
  String get dualCodingTitle => 'இரட்டைக் குறியீட்டு முறை';

  @override
  String get dualCodingSubtitle =>
      'எழுத்துக்களையும் குறியீடுகளையும் ஒரே நேரத்தில் பொருத்தவும்.';

  @override
  String get distractorMatrixTitle => 'கவனச்சிதறல் மேட்ரிக்ஸ்';

  @override
  String get distractorMatrixSubtitle =>
      'கவனச்சிதறல்களுக்கு மத்தியில் இலக்கு வடிவங்களைக் கண்டறியவும்.';

  @override
  String get temporalOrderTitle => 'கால வரிசை';

  @override
  String get temporalOrderSubtitle => 'கால வரிசை முறையை நினைவுபடுத்தவும்.';

  @override
  String get associativePairsTitle => 'தொடர்புடைய ஜோடிகள்';

  @override
  String get associativePairsSubtitle =>
      'தொடர்புடைய குறியீடுகளை ஜோடி சேர்த்து பொருத்தவும்.';

  @override
  String get blockCount3dTitle => '3D பிளாக் எண்ணிக்கை';

  @override
  String get blockCount3dSubtitle =>
      'முப்பரிமாண வெளியில் பிளாக்குகளை எண்ணவும்.';

  @override
  String get rotatingMazeTitle => 'சுழலும் பிரமை';

  @override
  String get rotatingMazeSubtitle =>
      'பந்துகளை வெளியேறும் வழிக்கு கொண்டு செல்ல பிரமைகளைச் சுழற்றவும்.';

  @override
  String get silhouetteMatchOrthoTitle => 'நிழற்படப் பொருத்தம் (ஆர்த்தோ)';

  @override
  String get silhouetteMatchOrthoSubtitle =>
      '3D பொருள்களை ஆர்த்தோ நிழல்களுடன் பொருத்தவும்.';

  @override
  String get spatialConflictTitle => 'இடஞ்சார்ந்த மோதல்';

  @override
  String get spatialConflictSubtitle =>
      'உரை மற்றும் திசை முரண்பாடுகளைத் தீர்க்கவும்.';

  @override
  String get spotlightTrackTitle => 'ஸ்பாட்லைட் டிராக்';

  @override
  String get spotlightTrackSubtitle =>
      'நகரும் நிழல்களில் மின்னும் பொருட்களைப் பின்தொடரவும்.';

  @override
  String get d2AttentionTitle => 'd2 கவனிப்பு';

  @override
  String get d2AttentionSubtitle =>
      'கடுமையான அளவுகோல்களுடன் இலக்கு குறியீடுகளைத் தட்டவும்.';

  @override
  String get dualMirrorTitle => 'இரட்டை கண்ணாடி வழிசெலுத்தல்';

  @override
  String get dualMirrorSubtitle =>
      'ஒரே நேரத்தில் இரண்டு பிரமைகளில் பயணிக்கவும்.';

  @override
  String get contextCluesTitle => 'சூழல் குறிப்புகள்';

  @override
  String get contextCluesSubtitle =>
      'சூழல் குறிப்புகளிலிருந்து மறைந்திருக்கும் சொற்களை யூகிக்கவும்.';

  @override
  String get digitSpanReverseSubtitle =>
      'எண்களை தலைகீழ் வரிசையில் நினைவுபடுத்தவும்.';

  @override
  String get faceNameAssociationSubtitle =>
      'காட்டப்பட்ட பல்வேறு முகங்களின் பெயர்களை நினைவுபடுத்தவும்.';

  @override
  String get staircaseMemorySubtitle =>
      'பிளாக்குகளை படிப்படியான வரிசையில் மனப்பாடம் செய்யவும்.';

  @override
  String get choiceReactionTimeSubtitle =>
      'குறிப்புகளுக்குப் பொருத்தமான குறிப்பிட்ட பொத்தான்களை வேகமாகத் தட்டவும்.';

  @override
  String get attentionalBlinkSubtitle =>
      'வேகமாக மின்னும் இலக்குகளைக் கண்டறியவும்.';

  @override
  String get visualStatisticalLearningSubtitle =>
      'வடிவங்களின் கால வரிசை முறைகளை காட்சி ரீதியாகக் கற்கவும்.';

  @override
  String get sternbergTaskSubtitle =>
      'குறியீடு மெமரி செட்டில் இருந்ததா என்று நினைவுபடுத்தவும்.';

  @override
  String get operationSpanSubtitle =>
      'கணக்குகளைத் தீர்த்து அகரவரிசைத் தொடர்களை நினைவுபடுத்தவும்.';

  @override
  String get continuousRecognitionTitle => 'தொடர் அங்கீகாரம்';

  @override
  String get continuousRecognitionSubtitle =>
      'காட்டப்பட்ட கார்டு பழையதா அல்லது புதியதா என அடையாளம் காணவும்.';

  @override
  String get symmetrySpanTitle => 'சமச்சீர் அளவு';

  @override
  String get symmetrySpanSubtitle =>
      'செங்குத்து சமச்சீர் முடிவுகளுக்கு மத்தியில் கட்டங்களின் ஆயத்தொலைவுகளை நினைவுபடுத்தவும்.';

  @override
  String get objectDisplacementTitle => 'பொருள் இடமாற்றம்';

  @override
  String get objectDisplacementSubtitle =>
      'இடங்களைப் படித்து, நகர்ந்த ஒரு பொருளை மட்டும் தட்டவும்.';

  @override
  String get mandalaRecallTitle => 'மண்டலா நினைவு';

  @override
  String get mandalaRecallSubtitle =>
      'வண்ணக் கட்டங்களை மனப்பாடம் செய்து, தட்டிலிருந்து மண்டலாவிற்கு மீண்டும் வண்ணம் தீட்டவும்.';

  @override
  String get runningMemorySpanTitle => 'ரன்னிங் ஸ்பான்';

  @override
  String get runningMemorySpanSubtitle =>
      'ஓடும் எழுத்துக்களைக் கண்காணித்து, கடைசி N பொருட்களை நினைவுபடுத்தவும்.';

  @override
  String get spatialCabinetMemoryTitle => 'இடஞ்சார்ந்த அலமாரிகள்';

  @override
  String get spatialCabinetMemorySubtitle =>
      'அலமாரி கதவுகளுக்குப் பின்னால் உள்ள பொருட்களை மனப்பாடம் செய்து கண்டறியவும்.';

  @override
  String get pathRecallSubtitle =>
      'பாதை தேர்வுகளை மனப்பாடம் செய்து மீண்டும் செய்யவும்.';

  @override
  String get objectShuffleSubtitle =>
      'ஆழமான கோப்பைகளுக்கு அடியில் மாற்றப்படும் பொருட்களைப் பின்தொடரவும்.';

  @override
  String get groceryListSubtitle =>
      'பட்டியலில் உள்ள பொருட்களை மனப்பாடம் செய்து டிக் செய்யவும்.';

  @override
  String get quickMathSubtitle => 'கணக்கு கேள்விகளை அதிவேகமாகத் தீர்க்கவும்.';

  @override
  String get mathGuessTitle => 'கணக்கு யூகங்கள்';

  @override
  String get mathGuessSubtitle =>
      'மறைந்திருக்கும் எண்ணை 15 வாய்ப்புகளுக்குள் யூகிக்கவும்.';

  @override
  String get reflexTapSubtitle =>
      'தூண்டுதல்களை மனித சக்தியால் இயன்ற அளவு வேகமாகத் தட்டவும்.';

  @override
  String get pixelMimicSubtitle =>
      'பிக்சல் கிரிட்களில் வடிவமைப்பு முறைகளை அப்படியே செய்யவும்.';

  @override
  String get simonSequenceSubtitle =>
      'வடிவ வரிசைகளை நினைவகத்திலிருந்து மீண்டும் செய்யவும்.';

  @override
  String get slidePuzzleSubtitle =>
      'சதுர ஸ்லைடிங் கிரிட் கட்டங்களை வரிசைப்படுத்தவும்.';

  @override
  String get findWordTitle => 'சொல்லைக் கண்டுபிடி';

  @override
  String get schulteTableSubtitle =>
      'ஒன்றிலிருந்து இருபத்தைந்து வரையிலான எண்களைத் தட்டவும்.';

  @override
  String get simonCommandTitle => 'சைமன் கட்டளை';

  @override
  String get simonCommandSubtitle => 'குரல் வழிமுறைகளை வேகமாகச் செய்யவும்.';

  @override
  String get binaryCodeTitle => 'பைனரி வேகம்';

  @override
  String get binaryCodeSubtitle => 'பைனரி குறியீடுகளை தசம எண்களாக மாற்றவும்.';

  @override
  String get moduloClockTitle => 'மாடுலோ கடிகாரம்';

  @override
  String get moduloClockSubtitle =>
      'கடிகாரங்களைப் பயன்படுத்தி கணக்கு சமன்பாடுகளைக் கணக்கிடவும்.';

  @override
  String get chimpTestTitle => 'சிம்பன்சி சோதனை';

  @override
  String get chimpTestSubtitle => 'சீரற்ற எண்களை ஏறுவரிசையில் தட்டவும்.';

  @override
  String get relationalMemoryTitle => 'உறவுமுறை நினைவு';

  @override
  String get relationalMemorySubtitle =>
      'கிரிட் பொருட்களின் சரியான இடங்களை நினைவுபடுத்தவும்.';

  @override
  String get factBinderTitle => 'தகவல் பிணைப்பான்';

  @override
  String get factBinderSubtitle =>
      'குறியீடுகளை இணைத்து கூற்றுகளை நினைவுபடுத்தவும்.';

  @override
  String get sourceMonitoringTitle => 'மூலக் கண்காணிப்பு';

  @override
  String get sourceMonitoringSubtitle => 'சூழலை நினைவில் கொள்க.';

  @override
  String get klotskiTitle => 'கிளாட்ஸ்கி தப்பித்தல்';

  @override
  String get klotskiSubtitle =>
      'வெளியேறும் வழியை அடைய பிளாக்குகளை நகர்த்தவும்.';

  @override
  String get homophoneHuntSubtitle =>
      'சரியான எழுத்துப்பிழை கொண்ட ஒரே ஒலிப்புச் சொல்லைத் தேர்ந்தெடுக்கவும்';

  @override
  String get laserLinkTitle => 'லேசர் இணைப்பு';

  @override
  String get laserLinkSubtitle =>
      'லேசர்களைப் பிரதிபலிக்க கண்ணாடிகளைச் சுழற்றுங்கள் மற்றும் அனைத்து இலக்குகளையும் மேம்படுத்தவும்.';

  @override
  String get laserLinkCongrats =>
      'துல்லியமான பிரதிபலிப்பு! முழு கட்டத்தையும் வெற்றிகரமாக இயக்கினீர்கள்.';

  @override
  String get crossSectionSliceTitle => 'குறுக்குவெட்டு துண்டு';

  @override
  String get crossSectionSliceSubtitle =>
      'ஒரு குறிப்பிட்ட கோணத்தில் இருந்து 3D பொருளின் சரியான 2D குறுக்குவெட்டை அடையாளம் காணவும்.';

  @override
  String get crossSectionSliceCongrats =>
      'நம்பமுடியாத 3D காட்சிப்படுத்தல்! அந்த வடிவத்தின் ஊடாக நீங்கள் சரியாகப் பார்த்தீர்கள்.';

  @override
  String get shadowPivotTitle => 'நிழல் பிவோட்';

  @override
  String get shadowPivotCongrats =>
      'மாறும் இடஞ்சார்ந்த பகுத்தறிவு! நீங்கள் ஒளி மற்றும் நிழலில் தேர்ச்சி பெற்றீர்கள்.';

  @override
  String get shadowPivotSubtitle =>
      'ஒரு 3D பொருள் வெவ்வேறு அச்சுகளில் சுழலும் போது விழும் நிழலைக் கணிக்கவும்.';

  @override
  String get interlockPuzzleTitle => 'இன்டர்லாக் புதிர்';

  @override
  String get interlockPuzzleSubtitle =>
      'சிக்கலான ஒன்றோடொன்று இணைக்கப்பட்ட தொகுதிகளை சரியான வரிசையில் பிரிக்கவும் அல்லது இணைக்கவும்.';

  @override
  String get interlockPuzzleCongrats =>
      'தர்க்கரீதியான மறுகட்டமைப்பு! நீங்கள் புதிரை கச்சிதமாக அவிழ்த்துவிட்டீர்கள்.';

  @override
  String get pathIntersectTitle => 'பாதை குறுக்கீடு';

  @override
  String get pathIntersectSubtitle =>
      'மோதல் இல்லாமல் அந்தந்த இலக்குகளை அடைய ஒரே நேரத்தில் பல பாதைகளில் செல்லவும்.';

  @override
  String get pathIntersectCongrats =>
      'ஒத்திசைக்கப்பட்ட வழிசெலுத்தல்! நீங்கள் அனைத்து இலக்குகளையும் குறைபாடற்ற முறையில் அடைந்துவிட்டீர்கள்.';

  @override
  String get negativeSpaceDetectionTitle => 'எதிர்மறை வெளி';

  @override
  String get negativeSpaceDetectionSubtitle =>
      'பொருட்களுக்கு இடையே உள்ள காலியான இடத்தால் உருவான வடிவத்தை அடையாளம் காணவும்.';

  @override
  String get negativeSpaceDetectionCongrats =>
      'தீவிரமான உணர்தல்! இல்லாததைப் பார்க்கும் கலையில் நீங்கள் தேர்ச்சி பெற்றுள்ளீர்கள்.';

  @override
  String get compassMazeTitle => 'திசைகாட்டி பிரமை';

  @override
  String get compassMazeSubtitle =>
      'உங்கள் திசைகாட்டி நோக்குநிலையின் அடிப்படையில் இயக்க திசைகள் மாறும் பிரமை வழிசெலுத்தவும்.';

  @override
  String get compassMazeCongrats =>
      'நிபுணத்துவ வழிசெலுத்தல்! மாறும் திசைகளின் வழியாக வெளியேறும் வழியை நீங்கள் கண்டுபிடித்துவிட்டீர்கள்.';

  @override
  String get complexFoldingNetsTitle => 'மடிப்பு வலைகள்';

  @override
  String get complexFoldingNetsSubtitle =>
      'தரமற்ற 2D வலையை மடிப்பதன் மூலம் எந்த சிக்கலான 3D வடிவம் உருவாகும் என்பதை தீர்மானிக்கவும்.';

  @override
  String get complexFoldingNetsCongrats =>
      'மேம்பட்ட மடிப்பு தர்க்கம்! நீங்கள் 3D வடிவத்தை வெற்றிகரமாக காட்சிப்படுத்தியுள்ளீர்கள்.';

  @override
  String get compassMazeMessage =>
      'திசைகாட்டியைப் பயன்படுத்தி பிரமை வழிசெலுத்தவும்.';

  @override
  String get negativeSpaceDetectionMessage =>
      'வெளியில் மறைந்திருக்கும் பொருளை அடையாளம் காணவும்.';

  @override
  String get shikakuTitle => 'ஷிகாகு';

  @override
  String get shikakuSubtitle =>
      'எண்களுடன் பொருந்தக்கூடிய சதுரங்கள் மற்றும் செவ்வகங்களாக கட்டத்தை பிரிக்கவும்.';

  @override
  String get countdownMathTitle => 'கவுண்டவுன் கணிதம்';

  @override
  String get countdownMathSubtitle =>
      'மூன்று இலக்க இலக்கைக் கணக்கிட, ரேண்டம் எண்களை இணைக்கவும்.';

  @override
  String get narrativeRecallTitle => 'கதை நினைவு';

  @override
  String get narrativeRecallSubtitle =>
      'ஒரு கதையைப் படித்து, குறிப்பிட்ட அளவு மற்றும் உண்மை விவரங்களை நினைவுபடுத்தவும்.';

  @override
  String get shellGameTitle => 'ஷெல் விளையாட்டு';

  @override
  String get shellGameSubtitle =>
      'ஒரு மறைக்கப்பட்ட பந்தை மாற்றும் கோப்பைகளை மாற்றும் இடங்களாகக் கண்காணிக்கவும்.';

  @override
  String get typoglycemiaDecoderTitle => 'டைபோகிளைசீமியா டிகோடர்';

  @override
  String get typoglycemiaDecoderSubtitle =>
      'துண்டித்து, குழப்பமான வாக்கியங்களை விரைவாகப் படியுங்கள்.';

  @override
  String get shapeShifterTitle => 'வடிவ மாற்றி';

  @override
  String get shapeShifterSubtitle => 'இலக்கு வடிவம்-வண்ண கலவையைத் தட்டவும்.';

  @override
  String get gokigenNanameTitle => 'கோகிஜென் நாமே';

  @override
  String get gokigenNanameSubtitle =>
      'சுழல்கள் இல்லாமல் புள்ளிகளை இணைக்க மூலைவிட்டங்களை வரையவும்.';

  @override
  String get matrixMultiplierTitle => 'மேட்ரிக்ஸ் பெருக்கி';

  @override
  String get matrixMultiplierSubtitle =>
      'இலக்கைப் பெருக்க ஒரு வரிசை மற்றும் நெடுவரிசையைத் தேர்ந்தெடுக்கவும்.';

  @override
  String get wordAssociationRecallTitle => 'வார்த்தை சங்கம்';

  @override
  String get wordAssociationRecallSubtitle =>
      'நினைவகத்திலிருந்து இணைக்கப்பட்ட வார்த்தை சங்கங்களை நினைவுபடுத்தவும்.';

  @override
  String get gearRotationTitle => 'கியர் சுழற்சி';

  @override
  String get gearRotationSubtitle => 'கடைசி கியரின் சுழற்சி திசையை கணிக்கவும்.';

  @override
  String get wordWheelTitle => 'வார்த்தை சக்கரம்';

  @override
  String get wordWheelSubtitle =>
      'மைய எழுத்து உட்பட சக்கரத்தில் உள்ள எழுத்துக்களைப் பயன்படுத்தி வார்த்தைகளை உருவாக்கவும்.';

  @override
  String get oddEvenFlashTitle => 'ஒற்றைப்படை-இரட்டை ஃப்ளாஷ்';

  @override
  String get oddEvenFlashSubtitle =>
      'வண்ண விதியுடன் எண் சமநிலையை விரைவாகப் பொருத்தவும்.';

  @override
  String get norinoriTitle => 'நோரினோரி';

  @override
  String get norinoriSubtitle =>
      'ஒவ்வொரு அறையிலும் சரியாக இணைக்கப்பட்ட இரண்டு செல்களை நிழலிடுங்கள்.';

  @override
  String get algebraicBalanceTitle => 'இயற்கணித சமநிலை';

  @override
  String get algebraicBalanceSubtitle =>
      'இலக்கு தொகையைக் கண்டறிய சமன்பாடுகளைத் தீர்க்கவும்.';

  @override
  String get patternSequenceDrawTitle => 'பேட்டர்ன் ரீகால்';

  @override
  String get patternSequenceDrawSubtitle =>
      'கட்டத்தின் மீது அனிமேஷன் செய்யப்பட்ட பாதை வரிசையை மீண்டும் செய்யவும்.';

  @override
  String get tangramTitle => 'டாங்கிராம் புதிர்';

  @override
  String get tangramSubtitle =>
      'இலக்கு நிழற்படத்தை நிரப்ப வடிவங்களை ஒழுங்கமைக்கவும்.';

  @override
  String get semanticAssociationTitle => 'சங்க வார்த்தை';

  @override
  String get semanticAssociationSubtitle =>
      'மூன்று தடயங்களையும் இணைக்கும் வார்த்தையைக் கண்டறியவும்.';

  @override
  String get peripheralFocusTitle => 'புற கவனம்';

  @override
  String get peripheralFocusSubtitle =>
      'கணிதத்தை தீர்க்கும் போது பக்கவாட்டு பேனல்கள் ஒளிரும்.';

  @override
  String get masyuTitle => 'மஸ்யு லூப்';

  @override
  String get masyuSubtitle =>
      'மஸ்யு வட்ட விதிகளுக்குப் பொருந்தும் ஒற்றை வளையத்தை வரையவும்.';

  @override
  String get mathMazeTitle => 'கணித பிரமை';

  @override
  String get mathMazeSubtitle =>
      'இலக்கு மொத்தத்தை மதிப்பிடும் பாதையைக் கண்டறியவும்.';

  @override
  String get storyBuilderTitle => 'கதை கட்டுபவர்';

  @override
  String get storyBuilderSubtitle =>
      'கதையின் காலவரிசை வரிசையை மறுகட்டமைக்கவும்.';

  @override
  String get mirrorMazeTitle => 'மிரர் பிரமை';

  @override
  String get mirrorMazeSubtitle =>
      'மூலைவிட்ட கண்ணாடிகளைப் பயன்படுத்தி லேசர் கற்றையைத் திருப்பிவிடவும்.';

  @override
  String get wordGridConnectionTitle => 'வார்த்தை இணைப்புகள்';

  @override
  String get wordGridConnectionSubtitle =>
      '16 சொற்களை நான்காக நான்கு வகைகளாகத் தொகுக்கவும்.';

  @override
  String get shapeShifterPeripheralTitle => 'புற வடிவங்கள்';

  @override
  String get shapeShifterPeripheralSubtitle =>
      'மைய மதிப்புகளைப் பொருத்தும்போது புற வடிவ மாற்றங்களைக் கண்காணிக்கவும்.';

  @override
  String get soundWaveMatchTitle => 'ஒலி அலை பொருத்தம்';

  @override
  String get soundWaveMatchSubtitle =>
      'காட்சி அலை அதிர்வெண் சுருதி மாற்றங்களுடன் சீரமைக்கும்போது தட்டவும்.';

  @override
  String get multiTrackCounterTitle => 'மல்டி-ட்ராக் கவுண்டர்';

  @override
  String get multiTrackCounterSubtitle =>
      'இலக்கு பெருக்கிக்கு எந்த கவுண்டரும் அதிகரிக்கும் போது தட்டவும்.';

  @override
  String get colorWordMatchUpTitle => 'வண்ண பொருத்தம்';

  @override
  String get colorWordMatchUpSubtitle =>
      'மாற்றும் விதிகளின் அடிப்படையில் இரண்டு வண்ண வார்த்தைகள் பொருந்துமா என்பதைத் தீர்மானிக்கவும்.';

  @override
  String get signalAndNoiseTitle => 'சிக்னல் & சத்தம்';

  @override
  String get signalAndNoiseSubtitle =>
      'நிலையான இரைச்சலில் மறைந்திருக்கும் இலக்க எண்ணெழுத்து எழுத்துக்களைக் கண்டறியவும்.';

  @override
  String get focusTunnelTitle => 'ஃபோகஸ் டன்னல்';

  @override
  String get focusTunnelSubtitle =>
      'நகரும் சுரங்கப்பாதைச் சுவர்களில் தோன்றும் பொருத்தமான சின்னங்களை அடையாளம் காணவும்.';

  @override
  String get targetPursuerTitle => 'இலக்கு பின்தொடர்பவர்';

  @override
  String get targetPursuerSubtitle =>
      'பல ஒன்றுடன் ஒன்று வட்டங்களைக் கண்காணித்து அசல் இலக்கைத் தேர்ந்தெடுக்கவும்.';

  @override
  String get gridGazeTitle => 'கட்டம் பார்வை';

  @override
  String get gridGazeSubtitle =>
      'எந்த கிரிட் செல் வேறு கால இடைவெளியில் ஒளிர்ந்தது என்பதைக் கண்டறியவும்.';

  @override
  String get doubleTroubleTitle => 'இரட்டை சிக்கல்';

  @override
  String get doubleTroubleSubtitle =>
      'ஸ்பிளிட் ஸ்கிரீனில் இரண்டு தனித்தனி எளிய கேம்களை ஒரே நேரத்தில் விளையாடுங்கள்.';

  @override
  String get syncRhythmTitle => 'ஒத்திசைவு ரிதம்';

  @override
  String get syncRhythmSubtitle =>
      'காட்சி மெட்ரோனோம் ஸ்வீப் ஒத்திசைக்கப்பட்ட துடிப்புடன் பொருந்தும்போது தட்டவும்.';

  @override
  String get ghostTapTitle => 'பேய் தட்டு';

  @override
  String get ghostTapSubtitle =>
      'கண்ணுக்கு தெரியாத துடிப்பு அதன் அதிகபட்ச உயரத்தை அடையும் போது தட்டவும்.';

  @override
  String get attentionalRsvpTitle => 'கவனத்திற்குரிய RSVP';

  @override
  String get attentionalRsvpSubtitle =>
      'ரேபிட் சீரிஸ் லெட்டர் ஃபிளாஷில் தோன்றும் இலக்கங்களை அடையாளம் காணவும்.';

  @override
  String get colorMazeNavTitle => 'கலர் பிரமை நவ்';

  @override
  String get colorMazeNavSubtitle =>
      'டைனமிக் அனுமதி வண்ணங்களுடன் பொருந்தக்கூடிய பிரமை டைல்களை வழிசெலுத்தவும்.';

  @override
  String get dynamicSalienceTitle => 'டைனமிக் சாலியன்ஸ்';

  @override
  String get dynamicSalienceSubtitle =>
      'சற்று மாறுபட்ட இயக்கவியலுடன் நகரும் வடிவத்தைக் கண்டறியவும்.';

  @override
  String get chalkAndTalkTitle => 'சுண்ணாம்பு & பேச்சு';

  @override
  String get chalkAndTalkSubtitle =>
      'காட்சித் திசைதிருப்பலைப் புறக்கணித்து ஆடியோவில் கேட்கும் வார்த்தைகளைத் தட்டச்சு செய்யவும்.';

  @override
  String get blinkDetectorTitle => 'பிளிங்க் டிடெக்டர்';

  @override
  String get blinkDetectorSubtitle =>
      'வேகமாக அடுத்தடுத்து இரண்டு முறை சிமிட்டும் கட்ட முகத்தைத் தட்டவும்.';

  @override
  String get frequencyTapTitle => 'அதிர்வெண் தட்டு';

  @override
  String get frequencyTapSubtitle =>
      'இலக்கு ஒளி துடிப்பு அதிர்வெண்ணுடன் பொருந்தும் பொத்தானைத் தட்டவும்.';

  @override
  String get yajilinTitle => 'Yajilin';

  @override
  String get yajilinSubtitle =>
      'கருப்பு கலங்களை வைத்து, ஒற்றை வளையத்தில் பொருந்தக்கூடிய தடயங்களை வரையவும்.';

  @override
  String get heyawakeTitle => 'Heyawake';

  @override
  String get heyawakeSubtitle =>
      'அருகில் கருப்பு செல்கள் இல்லாமல் நிழல் கட்ட அறைகள்.';

  @override
  String get gokigenVariantTitle => 'கோகிஜென் மாறுபாடு';

  @override
  String get gokigenVariantSubtitle => 'லூப் இல்லாத மூலைவிட்டங்களை வரையவும்.';

  @override
  String get sheepAndWolvesTitle => 'செம்மறி & ஓநாய்கள்';

  @override
  String get sheepAndWolvesSubtitle =>
      'ஓநாய்களிலிருந்து ஆடுகளை பிரிக்கும் வளையத்தை வரையவும்.';

  @override
  String get islandNurikabeTitle => 'நூரிகாபே தீவு';

  @override
  String get islandNurikabeSubtitle =>
      'எண் அளவுக் கட்டுப்பாடுகளுக்குப் பொருந்தும் படிவத் தீவுகள்.';

  @override
  String get shakashakaTitle => 'ஷகாஷகா ரெக்ட்ஸ்';

  @override
  String get shakashakaSubtitle =>
      'செவ்வக வெள்ளை பகுதிகளை உருவாக்க முக்கோண ஓடுகளை வைக்கவும்.';

  @override
  String get litsTetrisTitle => 'LITS டெட்ரோமினோ';

  @override
  String get litsTetrisSubtitle =>
      'டெட்ரோமினோக்களை அருகில் உள்ள நகல்கள் இல்லாத அறைகளில் வைக்கவும்.';

  @override
  String get tapaWallTitle => 'டப்பா சுவர்';

  @override
  String get tapaWallSubtitle =>
      'தொடர்ச்சியான கருப்பு சுவர் வடிவத்தை உருவாக்க நிழல் செல்கள்.';

  @override
  String get triangularBridgesTitle => 'முக்கோண பாலங்கள்';

  @override
  String get triangularBridgesSubtitle =>
      'தேவைகளை பூர்த்தி செய்யும் தீவுகளை 3 திசைகளில் இணைக்கவும்.';

  @override
  String get rippleEffectTitle => 'சிற்றலை விளைவு';

  @override
  String get rippleEffectSubtitle =>
      'இடைவெளி தூரக் கட்டுப்பாடுகளைப் பொறுத்து அறைகளில் எண்களை நிரப்பவும்.';

  @override
  String get suguruTectonicTitle => 'சுகுரு கட்டம்';

  @override
  String get suguruTectonicSubtitle =>
      'அறைத் தொகுதிகளை 1 முதல் K வரை உள்ள எண்களுடன் அண்டை நாடுகளுக்கு சமமாக நிரப்பவும்.';

  @override
  String get tennerGridTitle => 'டென்னர் கட்டம்';

  @override
  String get tennerGridSubtitle =>
      'நெடுவரிசையின் மொத்த எண்ணிக்கையுடன் 0-9 பொருந்தக்கூடிய இலக்கங்களுடன் வரிசைகளை நிரப்பவும்.';

  @override
  String get kakurasuSumsTitle => 'ககுராசு தொகைகள்';

  @override
  String get kakurasuSumsSubtitle =>
      'எடையுள்ள வரிசை/கோல் குறியீட்டுத் தொகைகளைச் சந்திக்க நிழல் செல்கள்.';

  @override
  String get corralLoopTitle => 'கோரல் லூப்';

  @override
  String get corralLoopSubtitle =>
      'பார்வைக்கு பொருந்தும் எண்களை இணைக்கும் ஒற்றை வளையத்தை வரையவும்.';

  @override
  String get stostoneTitle => 'ஸ்டோஸ்டோன் ஈர்ப்பு';

  @override
  String get stostoneSubtitle =>
      'கீழ் வரிசைகளை முழுமையாக நிரப்ப கீழே விழும் செல்கள் நிழல்.';

  @override
  String get tripletsLogicTitle => 'மும்மூர்த்திகள் மூவர்';

  @override
  String get tripletsLogicSubtitle =>
      'ஒரு வரிசையில் மூன்று வடிவங்களைத் தவிர்த்து, கட்டத்தை நிரப்பவும்.';

  @override
  String get galaxiesSymTitle => 'Galaxies Symmetry';

  @override
  String get galaxiesSymSubtitle =>
      'கட்டத்தை சுழற்சி சமச்சீர் விண்மீன் வடிவங்களாக பிரிக்கவும்.';

  @override
  String get matrixMultiplierMatchTitle => 'மேட்ரிக்ஸ் மேட்சர்';

  @override
  String get matrixMultiplierMatchSubtitle =>
      'இலக்கு புள்ளி தயாரிப்புடன் பொருந்த வரிசை மற்றும் நெடுவரிசை மதிப்புகளை பெருக்கவும்.';

  @override
  String get primeFactorTreesTitle => 'முதன்மை காரணி மரங்கள்';

  @override
  String get primeFactorTreesSubtitle =>
      'கலப்பு எண்களை பிரதான இலை காரணி ஜோடிகளாக சிதைக்கவும்.';

  @override
  String get vektorVectorTitle => 'திசையன் திசையன்';

  @override
  String get vektorVectorSubtitle =>
      'திசையன்களை அவற்றின் தொகை இலக்கை அடைய அளவிடவும்.';

  @override
  String get binomialMatchTitle => 'இருசொற் பொருத்தம்';

  @override
  String get binomialMatchSubtitle =>
      'காரணியாக்கப்பட்ட பைனோமியல் மதிப்புகளுடன் இருபடி சூத்திரங்களைப் பொருத்தவும்.';

  @override
  String get percentageShoppingTitle => 'சதவீதம் ஷாப்பிங்';

  @override
  String get percentageShoppingSubtitle =>
      'தள்ளுபடி சதவீதங்கள் மற்றும் இறுதி செக்அவுட் மொத்தங்களைக் கணக்கிடுங்கள்.';

  @override
  String get cryptoArithmeticTitle => 'கிரிப்டோ-எண்கணிதம்';

  @override
  String get cryptoArithmeticSubtitle =>
      'கிராக் எழுத்து-இலக்க மாற்று மறைக்குறியீடு கணித சிக்கல்கள்.';

  @override
  String get fractionalPizzaTitle => 'பகுதியளவு பீஸ்ஸா';

  @override
  String get fractionalPizzaSubtitle =>
      'இலக்குத் தொகைப் பின்னங்களைப் பொருத்த பீஸ்ஸா துண்டுகளைப் பிரிக்கவும்.';

  @override
  String get numberBondsTitle => 'எண் பத்திரங்கள்';

  @override
  String get numberBondsSubtitle =>
      'இலக்கு இணைப்புத் தொகைக்கு சமமான இணைப்பு முனை மதிப்புகள்.';

  @override
  String get gridSumLineTitle => 'கிரிட் சம் லைன்';

  @override
  String get gridSumLineSubtitle =>
      'இலக்கை சரியாக மதிப்பிடும் ஒரு பாதையை வரையவும்.';

  @override
  String get binaryScaleBalanceTitle => 'பைனரி ஸ்கேல் பேலன்ஸ்';

  @override
  String get binaryScaleBalanceSubtitle =>
      'பவர் ஆஃப் டூ பிளாக்குகளைப் பயன்படுத்தி தசம எடையை சமநிலைப்படுத்தவும்.';

  @override
  String get moduloPathTitle => 'மாடுலோ பாதை';

  @override
  String get moduloPathSubtitle =>
      'டிராவர்ஸ் கிரிட் செல்கள் மாடுலோ எஞ்சிய மதிப்புகளுடன் பொருந்தும்.';

  @override
  String get digitSwapEqTitle => 'இலக்க இடமாற்று சமன்பாடுகள்';

  @override
  String get digitSwapEqSubtitle =>
      'இரண்டையும் சரிசெய்ய சமன்பாடுகளுக்கு இடையில் ஒற்றை இலக்கங்களை மாற்றவும்.';

  @override
  String get areaPerimeterMatchTitle => 'பகுதி & சுற்றளவு';

  @override
  String get areaPerimeterMatchSubtitle =>
      'இலக்கு பகுதி மற்றும் சுற்றளவு மதிப்புகளுடன் பொருந்தக்கூடிய செவ்வகங்களை வரையவும்.';

  @override
  String get inequalityBalanceOpsTitle => 'சமத்துவமின்மை சமநிலை';

  @override
  String get inequalityBalanceOpsSubtitle =>
      'சிக்கலான கணித சொற்களுக்கு இடையில் சமத்துவமின்மை குறியீடுகளை வைக்கவும்.';

  @override
  String get graphCoordinatePlotTitle => 'கிராஃப் ப்ளாட்டர்';

  @override
  String get graphCoordinatePlotSubtitle => 'ப்ளாட் கிரிட் ஒருங்கிணைக்கிறது.';

  @override
  String get baseConversionRunTitle => 'அடிப்படை மாற்றம்';

  @override
  String get baseConversionRunSubtitle =>
      'பைனரி, தசமம், ஹெக்ஸ் மற்றும் ஆக்டல் இடையே மதிப்புகளை மாற்றவும்.';

  @override
  String get unitConverterProTitle => 'அலகு மாற்றி';

  @override
  String get unitConverterProSubtitle =>
      'நேர வரம்புகளின் கீழ் விரைவான அலகு மாற்றங்களுக்கு பதிலளிக்கவும்.';

  @override
  String get auditoryNBackTitle => 'ஆடிட்டரி என்-பேக்';

  @override
  String get auditoryNBackSubtitle =>
      'N நினைவகத்திலிருந்து பின்வாங்கப்பட்ட N அடிகளைக் கேட்ட பேச்சு எழுத்துக்களைப் பொருத்து.';

  @override
  String get abstractPatternRecallTitle => 'பேட்டர்ன் லேயரிங்';

  @override
  String get abstractPatternRecallSubtitle =>
      'நினைவக ஆய்வில் இருந்து அடுக்கு வண்ணமயமான வடிவங்களை மறுகட்டமைக்கவும்.';

  @override
  String get roomInspectorTitle => 'அறை ஆய்வாளர்';

  @override
  String get roomInspectorSubtitle =>
      'திரை காலியாக இருக்கும்போது செய்யப்பட்ட மரச்சாமான்கள் மாற்றங்களை அடையாளம் காணவும்.';

  @override
  String get voiceToFaceMatchTitle => 'குரல்-முகப் பொருத்தம்';

  @override
  String get voiceToFaceMatchSubtitle =>
      'பேச்சு ஆடியோ குரல் கிளிப்புடன் தொடர்புடைய சரியான முகத்தைத் தேர்ந்தெடுக்கவும்.';

  @override
  String get spatialGridMemory3DTitle => '3D ஸ்பேஷியல் மெமரி';

  @override
  String get spatialGridMemory3DSubtitle =>
      'சுழற்றப்பட்ட 3D கனசதுர கட்ட அமைப்பில் ஃபிளாஷ் செய்யப்பட்ட தொகுதிகளை நினைவுபடுத்தவும்.';

  @override
  String get sequenceStackTitle => 'வரிசை அடுக்கு';

  @override
  String get sequenceStackSubtitle =>
      'தட்டு ஸ்டாக் சேர்த்தல் மற்றும் அகற்றுதல்களை வரிசையாக மறுகட்டமைக்கவும்.';

  @override
  String get semanticCategoryRecallTitle => 'வகை நினைவு';

  @override
  String get semanticCategoryRecallSubtitle =>
      'கோரப்பட்ட வகை இலக்குகளுடன் பொருந்தும் ஆய்வு வார்த்தைகளை அடையாளம் காணவும்.';

  @override
  String get gridDisplacementTitle => 'கட்டம் இடமாற்றம்';

  @override
  String get gridDisplacementSubtitle =>
      'அசல் அமைப்பை ஒப்பிட்டு மாற்றப்பட்ட ஐகான்களை அடையாளம் காணவும்.';

  @override
  String get soundSequenceMatchTitle => 'ஒலி வரிசை பொருத்தம்';

  @override
  String get soundSequenceMatchSubtitle =>
      'மெய்நிகர் விசைப்பலகையில் இயக்கப்பட்ட குறிப்பு வரிசைகளை மீண்டும் செய்யவும்.';

  @override
  String get cardCountingMemoryTitle => 'அட்டை கவுண்டர்';

  @override
  String get cardCountingMemorySubtitle =>
      'தொடர்ச்சியான கார்டு டீல் ரன்களில் ஏற்கனவே கொடுக்கப்பட்ட கார்டுகளை அடையாளம் காணவும்.';

  @override
  String get directionsRecallTitle => 'திசைகள் நினைவு';

  @override
  String get directionsRecallSubtitle =>
      'நினைவகத்திலிருந்து பாதை திசைகளுடன் பொருந்தக்கூடிய கட்ட வரைபடங்களுக்கு செல்லவும்.';

  @override
  String get eventTimelineMemoryTitle => 'நிகழ்வு காலவரிசை';

  @override
  String get eventTimelineMemorySubtitle =>
      'வரலாற்று/கற்பனை நிகழ்வு அட்டைகளை காலவரிசைப்படி வரிசைப்படுத்துங்கள்.';

  @override
  String get featureMatrixRecallTitle => 'அம்சம் மேட்ரிக்ஸ்';

  @override
  String get featureMatrixRecallSubtitle =>
      'செல் வடிவம்-வண்ணப் பண்புகளைப் பற்றிய பதில் வினவல் கேட்கிறது.';

  @override
  String get delayedMatchSampleTitle => 'தாமதமான போட்டி';

  @override
  String get delayedMatchSampleSubtitle =>
      'கணித கவனச்சிதறல்களைத் தீர்த்த பிறகு இலக்கு சின்னத்தைப் பொருத்தவும்.';

  @override
  String get symbolDigitAssocTitle => 'சின்னம்-இலக்க அசோக்';

  @override
  String get symbolDigitAssocSubtitle =>
      'இலக்க விசைகளுடன் பொருந்தும் குறியீட்டு மொழிபெயர்ப்புத் தாள்களைத் தீர்க்கவும்.';

  @override
  String get dualTaskMemoryTitle => 'இரட்டை பணி நினைவகம்';

  @override
  String get dualTaskMemorySubtitle =>
      'விரைவான எண்கணித பணிகளை தீர்க்கும் போது வார்த்தை தொகுப்புகளை மனப்பாடம் செய்யுங்கள்.';

  @override
  String get actionSequenceRecallTitle => 'அதிரடி ரீகால்';

  @override
  String get actionSequenceRecallSubtitle =>
      'கேரக்டர் சைகை அனிமேஷன் வரிசைகளை வரிசையாக மீண்டும் செய்யவும்.';

  @override
  String get tangramPolygonTitle => 'டாங்க்ராம் பொருத்தம்';

  @override
  String get tangramPolygonSubtitle =>
      'சில்ஹவுட் அவுட்லைன்களை நிரப்ப பலகோண வடிவங்களை வரிசைப்படுத்தவும்.';

  @override
  String get mazeNav3DTitle => '3D பிரமை நவ்';

  @override
  String get mazeNav3DSubtitle =>
      'முதல் நபர் பார்வையில் இருந்து 3D ஐசோமெட்ரிக் பிரமை வழிகளுக்கு செல்லவும்.';

  @override
  String get isometricProjectionTitle => 'ஐசோமெட்ரிக் ப்ரொஜெக்டர்';

  @override
  String get isometricProjectionSubtitle =>
      'ஆர்த்தோகிராஃபிக் 2D மேல்/முன் காட்சிகளுடன் 3D பிளாக் புள்ளிவிவரங்களைப் பொருத்தவும்.';

  @override
  String get polyominoPackingTitle => 'பாலியோமினோ பேக்கிங்';

  @override
  String get polyominoPackingSubtitle =>
      'சீரற்ற பாலியோமினோ தொகுதி துண்டுகளை இலக்கு பகுதிகளில் அடைக்கவும்.';

  @override
  String get spatialGridRotationTitle => 'ஸ்பேஷியல் கிரிட் சுழற்சி';

  @override
  String get spatialGridRotationSubtitle =>
      'அச்சு ஆயத்தொலைவுகளுடன் சுழற்றப்பட்ட 3D தொகுதி ஏற்பாடுகளை பொருத்தவும்.';

  @override
  String get wireLoopGameTitle => 'கம்பி வளையம்';

  @override
  String get wireLoopGameSubtitle =>
      'தொடர்பு இல்லாமல் கம்பி ஸ்ப்லைன்களுடன் உலோக வளையங்களை இழுக்கவும்.';

  @override
  String get origamiUnfoldTitle => 'ஓரிகமி அன்ஃபோல்ட்';

  @override
  String get origamiUnfoldSubtitle =>
      'மடிந்த தாள்களை விரித்த பிறகு துளை பஞ்ச் வடிவங்களை அடையாளம் காணவும்.';

  @override
  String get ropeTangleSolverTitle => 'கயிறு அவிழ்ப்பான்';

  @override
  String get ropeTangleSolverSubtitle =>
      'பூஜ்ஜிய கோடு குறுக்குகளுடன் பிளானர் வரைபடங்களை அமைக்க முனைகளை இழுக்கவும்.';

  @override
  String get gridFitTetrisTitle => 'கிரிட் ஃபிட் தீர்வு';

  @override
  String get gridFitTetrisSubtitle =>
      'கொள்கலன் எல்லைகளை பொருத்த நிலையான ஒழுங்கற்ற தொகுதிகள் ஏற்பாடு.';

  @override
  String get vectorGridAlignmentTitle => 'திசையன் சீரமைப்பு';

  @override
  String get vectorGridAlignmentSubtitle =>
      'நிழல் டெம்ப்ளேட் இலக்குகளை பொருத்த வடிவங்களை அளவிடவும் மற்றும் சுழற்றவும்.';

  @override
  String get blockStackingPhysicsTitle => 'பிளாக் ஸ்டாக்கிங்';

  @override
  String get blockStackingPhysicsSubtitle =>
      'ஈர்ப்பு எடையை சமநிலைப்படுத்தும் ஒழுங்கற்ற தொகுதி பேனல்களை அடுக்கி வைக்கவும்.';

  @override
  String get crossSectionMatch3DTitle => '3D குறுக்குவெட்டு';

  @override
  String get crossSectionMatch3DSubtitle =>
      '3D வடிவங்களில் இருந்து வெட்டப்பட்ட 2D ஸ்லைஸ் வடிவவியலைக் கண்டறியவும்.';

  @override
  String get symmetryPaintTitle => 'சமச்சீர் பெயிண்ட்';

  @override
  String get symmetryPaintSubtitle =>
      'சமச்சீர் அச்சுகள் முழுவதும் பிரதிபலிக்கும் கண்ணாடி படப் பகுதிகளை வரையவும்.';

  @override
  String get rollingBlockBloxTitle => 'ரோலிங் பிளாக்';

  @override
  String get rollingBlockBloxSubtitle =>
      'இலக்கு ஸ்லாட்டுகளில் செங்குத்தாக தரையிறங்க பிளாக் துண்டுகளை உருட்டவும்.';

  @override
  String get perspectiveShiftViewTitle => 'முன்னோக்கு மாற்றம்';

  @override
  String get perspectiveShiftViewSubtitle =>
      'எழுத்துகள்/சொற்களை உச்சரிக்கும் வரை தொகுதி கிளஸ்டர்களை சுழற்றுங்கள்.';

  @override
  String get networkFlowSphericalTitle => 'நெட்வொர்க் ஓட்டம்';

  @override
  String get networkFlowSphericalSubtitle =>
      'ரேப்பிங் உருளை ஆயங்களில் கிரிட் பாய்களை இணைக்கவும்.';

  @override
  String get layeredSilhouetteBlendTitle => 'சில்ஹவுட் கலவை';

  @override
  String get layeredSilhouetteBlendSubtitle =>
      'இலக்கு ஒளிஊடுருவக்கூடிய வடிவங்களைப் பொருத்த வண்ண அடுக்குகளை அடுக்கி வைக்கவும்.';

  @override
  String get wordWheelPangramTitle => 'வார்த்தை அனகிராம்கள்';

  @override
  String get wordWheelPangramSubtitle =>
      'சக்கரங்களிலிருந்து மைய இலக்கு எழுத்துக்களைக் கொண்ட சொற்களை உருவாக்கவும்.';

  @override
  String get letterGridSwapperTitle => 'கடிதம் மாற்றுபவர்';

  @override
  String get letterGridSwapperSubtitle =>
      'வரிசை மற்றும் கோல் வார்த்தைகளை முடிக்க, அருகிலுள்ள எழுத்து ஓடுகளை மாற்றவும்.';

  @override
  String get synonymMatchTitle => 'ஒத்தப் பொருத்தம்';

  @override
  String get synonymMatchSubtitle =>
      'விழும் வார்த்தை இலக்குகளை ஒத்த சொற்கள் அல்லது எதிர்ச்சொற்களுடன் பொருத்தவும்.';

  @override
  String get vowelDropTitle => 'உயிர் துளி';

  @override
  String get vowelDropSubtitle =>
      'வார்த்தைகளை நிறைவு செய்யும் ஆய கட்டங்களில் உயிரெழுத்துக்களை விடுங்கள்.';

  @override
  String get letterBalanceScaleTitle => 'வார்த்தை இருப்பு அளவுகோல்';

  @override
  String get letterBalanceScaleSubtitle =>
      'சொற்களை உச்சரிக்கவும், அதன் எழுத்து சமநிலை எடைகளை மதிப்பிடுகிறது.';

  @override
  String get wordChainShiritoriTitle => 'வார்த்தை சங்கிலி';

  @override
  String get wordChainShiritoriSubtitle =>
      'முந்தைய எழுத்து வெளியீடுகளுடன் தொடங்கும் வார்த்தை சுழல்களை இணைக்கவும்.';

  @override
  String get affixBuilderTitle => 'இணைப்பு பில்டர்';

  @override
  String get affixBuilderSubtitle =>
      'இலக்கு சொல்லகராதிகளை உருவாக்க முன்னொட்டுகள்/பின்னொட்டுகளை இணைக்கவும்.';

  @override
  String get decipherCrypticCluesTitle => 'க்ரிப்டிக் டெசிஃபர்';

  @override
  String get decipherCrypticCluesSubtitle =>
      'வார்த்தை விளையாட்டு புதிர்களை தீர்க்கவும் மற்றும் எழுத்துப்பிழை புதிர்களை மறைகுறியாக்கவும்.';

  @override
  String get boggleWordSearchTitle => 'பாக்ல் கனெக்ட்';

  @override
  String get boggleWordSearchSubtitle =>
      'மறைக்கப்பட்ட வார்த்தைகளைக் கண்டறிய, இணைக்கப்பட்ட பாதைகளை கண்டறியவும்.';

  @override
  String get idiomUnscrambleTitle => 'இடியோம் அன்சிக்ரம்பிள்';

  @override
  String get idiomUnscrambleSubtitle =>
      'சொற்பொருள் அர்த்தங்களுடன் பொருந்த, துருவிய வார்த்தை வரிசைகளை ஒழுங்கமைக்கவும்.';

  @override
  String get letterPyramidsTitle => 'எழுத்து பிரமிடுகள்';

  @override
  String get letterPyramidsSubtitle =>
      'ஒரு அடுக்குக்கு ஒற்றை அனகிராம் எழுத்துக்களைச் சேர்த்து வார்த்தை கோபுரங்களை உருவாக்கவும்.';

  @override
  String get soundAlikeHomophonesTitle => 'ஹோமோஃபோன் பொருத்தங்கள்';

  @override
  String get soundAlikeHomophonesSubtitle =>
      'வாக்கியங்களுக்கான சரியான ஹோமோஃபோன் எழுத்துப்பிழைகளை அடையாளம் காணவும்.';

  @override
  String get wordGridSudokuTitle => 'வார்த்தை சுடோகு';

  @override
  String get wordGridSudokuSubtitle =>
      'வார்த்தைகளை உருவாக்கும் கட்ட வரிசைகளில் டெஸ்ஸலேட் எழுத்துக்கள்.';

  @override
  String get portmanteauFactoryTitle => 'Portmanteau தொழிற்சாலை';

  @override
  String get portmanteauFactorySubtitle =>
      'கூட்டு சொற்களை உருவாக்கும் சொற்பொருள் கூறுகளை ஒன்றிணைக்கவும்.';

  @override
  String get codedCrosswordsCodeTitle =>
      'குறியீட்டு வார்த்தைகள் குறுக்கெழுத்து';

  @override
  String get codedCrosswordsCodeSubtitle =>
      'எண்-க்கு-எழுத்து குறியீடுகளுடன் பொருந்தக்கூடிய கிரிட் குறுக்கெழுத்துக்களைத் தீர்க்கவும்.';

  @override
  String get wordSnakeTrailTitle => 'வார்த்தை பாம்பு';

  @override
  String get wordSnakeTrailSubtitle =>
      'கருப்பொருள் சொற்களை உச்சரிக்கும் பாம்பு போன்ற எழுத்து சுவடுகளைக் கண்டறியவும்.';

  @override
  String get typingRhythmSpeedTitle => 'தட்டச்சு ஓட்டம்';

  @override
  String get typingRhythmSpeedSubtitle =>
      'மெட்ரோனோம் ரிதம் பீட்களுடன் பொருந்தக்கூடிய சொற்களஞ்சிய வகை.';

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
  String get hideGame => 'மறை';

  @override
  String get unhideGame => 'காட்டு';

  @override
  String get favoriteGame => 'விருப்பமானது';

  @override
  String get unfavoriteGame => 'விருப்பத்தை நீக்கு';

  @override
  String get hiddenGames => 'மறைக்கப்பட்ட விளையாட்டுகள்';

  @override
  String showHiddenGames(int count) {
    return 'மறைக்கப்பட்ட விளையாட்டுகளைக் காட்டு ($count)';
  }

  @override
  String get noHiddenGames => 'மறைக்கப்பட்ட விளையாட்டுகள் இல்லை';

  @override
  String get gameHidden => 'விளையாட்டு மறைக்கப்பட்டது';

  @override
  String get undo => 'செயல்தவிர்';

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
  String get btnMatchColor => 'வண்ணத்தை பொருத்து';

  @override
  String get btnMatchWord => 'வார்த்தையை பொருத்து';

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

  @override
  String get kurodokoTitle => 'Kurodoko';

  @override
  String get kurodokoSubtitle =>
      'Place black cells so numbers see the exact count of white cells.';

  @override
  String get kurodokoWinTitle => 'WHERE IS BLACK SOLVED!';

  @override
  String get kurodokoWinMessage =>
      'You mastered the visibility paths and isolated all black cells!';

  @override
  String get subitizingRushTitle => 'Subitize Rush';

  @override
  String get subitizingRushSubtitle =>
      'Instantly identify the quantity of flashed dots without counting.';

  @override
  String get subitizingRushWinTitle => 'RAPID VISION!';

  @override
  String get subitizingRushWinMessage =>
      'Your instant visual numerosity estimation is outstanding!';

  @override
  String get tapaTitle => 'Tapa';

  @override
  String get tapaSubtitle =>
      'Shade cells to form a continuous wall without 2x2 blocks.';

  @override
  String get tapaWinTitle => 'TAPA WALL COMPLETED!';

  @override
  String get tapaWinMessage =>
      'All numbered cell constraints perfectly satisfied!';

  @override
  String get exponentTowerTitle => 'Exponent Tower';

  @override
  String get exponentTowerSubtitle =>
      'Order dynamic power expressions from smallest to largest.';

  @override
  String get exponentTowerWinTitle => 'TOWER STACKED!';

  @override
  String get exponentTowerWinMessage =>
      'All power magnitudes calculated with perfect precision!';

  @override
  String get posnerSpatialCueingTitle => 'Spatial Cue';

  @override
  String get posnerSpatialCueingSubtitle =>
      'React swiftly to directional target appearances following spatial cues.';

  @override
  String get posnerSpatialCueingWinTitle => 'ALERT VISION!';

  @override
  String get posnerSpatialCueingWinMessage =>
      'Fast visual orienting and stimulus detection recorded!';

  @override
  String get gearTrainDirectionTitle => 'Gear Train';

  @override
  String get gearTrainDirectionSubtitle =>
      'Deduce the rotation direction of the target gear in the mechanical train.';

  @override
  String get gearTrainDirectionWinTitle => 'MECHANISM SOLVED!';

  @override
  String get gearTrainDirectionWinMessage =>
      'Kinematic gear rotational transmissions accurately traced!';

  @override
  String get continuousPairedAssociateTitle => 'Pair Associate';

  @override
  String get continuousPairedAssociateSubtitle =>
      'Memorize symbol pairs and recall the matching partner.';

  @override
  String get continuousPairedAssociateWinTitle => 'PAIRS LINKED!';

  @override
  String get continuousPairedAssociateWinMessage =>
      'Strong associative memory pathways established!';

  @override
  String get heyawakeWinTitle => 'ROOMS BALANCED!';

  @override
  String get heyawakeWinMessage =>
      'All room division rules and white path connections satisfied!';

  @override
  String get setTheoryVennTitle => 'Venn Sets';

  @override
  String get setTheoryVennSubtitle =>
      'Select the corresponding regions of the Venn diagram for the set formula.';

  @override
  String get setTheoryVennWinTitle => 'SET LOGIC MASTER!';

  @override
  String get setTheoryVennWinMessage =>
      'All set operations, unions, and intersections deduced flawlessly!';

  @override
  String get navonHierarchicalTitle => 'Navon Global';

  @override
  String get navonHierarchicalSubtitle =>
      'Identify either the large global letter or small local letters under prompt rules.';

  @override
  String get navonHierarchicalWinTitle => 'FOCUS SHARPENED!';

  @override
  String get navonHierarchicalWinMessage =>
      'Outstanding selective attention and global-local perception!';

  @override
  String get masyuWinTitle => 'MASYU LOOP SOLVED!';

  @override
  String get masyuWinMessage =>
      'All pearl turning and straight passage rules strictly satisfied!';

  @override
  String get primeGapHuntTitle => 'Prime Gap';

  @override
  String get primeGapHuntSubtitle =>
      'Calculate the arithmetic difference between consecutive prime numbers.';

  @override
  String get primeGapHuntWinTitle => 'GAP CALCULATED!';

  @override
  String get primeGapHuntWinMessage =>
      'Mastery of prime distribution and mental subtraction displayed!';

  @override
  String get yajilinWinTitle => 'YAJILIN SOLVED!';

  @override
  String get yajilinWinMessage =>
      'All arrow clue raycasts and orthogonal black cell separations satisfied!';

  @override
  String get algebraicInequalitySolverTitle => 'Inequality';

  @override
  String get algebraicInequalitySolverSubtitle =>
      'Solve linear single-variable algebraic inequalities swiftly.';

  @override
  String get algebraicInequalitySolverWinTitle => 'ALGEBRA EXPERT!';

  @override
  String get algebraicInequalitySolverWinMessage =>
      'Fast inequality reduction and algebraic balance achieved!';

  @override
  String get attentionalBlinkProbeTitle => 'Blink Probe';

  @override
  String get attentionalBlinkProbeSubtitle =>
      'Detect second target stimuli presented rapidly after primary targets.';

  @override
  String get attentionalBlinkProbeWinTitle => 'TEMPORAL FOCUS!';

  @override
  String get attentionalBlinkProbeWinMessage =>
      'Exceptional temporal visual processing across the blink refractory window!';

  @override
  String get modularClockArithmeticTitle => 'Clock Modulo';

  @override
  String get modularClockArithmeticSubtitle =>
      'Calculate cyclical clock time arithmetic under modulo 12 algebra.';

  @override
  String get modularClockArithmeticWinTitle => 'CLOCKWORK PRECISION!';

  @override
  String get modularClockArithmeticWinMessage =>
      'All modular hour shifts calculated with ease!';

  @override
  String get temporalOrderJudgmentTitle => 'Time Order';

  @override
  String get temporalOrderJudgmentSubtitle =>
      'Discriminate which of two millisecond-separated stimulus circles flashed first.';

  @override
  String get temporalOrderJudgmentWinTitle => 'ULTRA-FAST PERCEPTION!';

  @override
  String get temporalOrderJudgmentWinMessage =>
      'High-resolution temporal distinction demonstrated!';

  @override
  String get polyominoTilingTitle => 'Polyomino';

  @override
  String get polyominoTilingSubtitle =>
      'Rotate and assemble tetromino geometric shapes to tile the grid without gaps.';

  @override
  String get polyominoTilingWinTitle => 'GRID TILED!';

  @override
  String get polyominoTilingWinMessage =>
      'Seamless geometric spatial arrangement completed!';

  @override
  String get pythagoreanTripleBuilderTitle => 'Pythagoras';

  @override
  String get pythagoreanTripleBuilderSubtitle =>
      'Find the missing hypotenuse or leg value in integer Pythagorean triangles.';

  @override
  String get pythagoreanTripleBuilderWinTitle => 'GEOMETRY MASTER!';

  @override
  String get pythagoreanTripleBuilderWinMessage =>
      'All right-triangle integer triples rapidly solved!';

  @override
  String get visualSearchConjunctionTitle => 'Conj. Search';

  @override
  String get visualSearchConjunctionSubtitle =>
      'Quickly locate target shapes combining multiple feature dimensions (color and form).';

  @override
  String get visualSearchConjunctionWinTitle => 'CONJUNCTION FOCUS!';

  @override
  String get visualSearchConjunctionWinMessage =>
      'Flawless multi-feature parallel and serial visual search!';

  @override
  String get wireframe3DRotationTitle => 'Wireframe 3D';

  @override
  String get wireframe3DRotationSubtitle =>
      'Identify the correctly rotated 3D geometric wireframe following angular transformation.';

  @override
  String get wireframe3DRotationWinTitle => '3D ROTATION MASTER!';

  @override
  String get wireframe3DRotationWinMessage =>
      'Precise 3D mental rotation and spatial orientation demonstrated!';

  @override
  String get wordPairAssociateMemoryTitle => 'Word Pairs';

  @override
  String get wordPairAssociateMemorySubtitle =>
      'Memorize associated word connections and select the target paired with the cue.';

  @override
  String get wordPairAssociateMemoryWinTitle => 'ASSOCIATION MASTER!';

  @override
  String get wordPairAssociateMemoryWinMessage =>
      'Strong episodic associative memory retention achieved!';

  @override
  String get binaryMatrixRankTitle => 'Matrix Rank';

  @override
  String get binaryMatrixRankSubtitle =>
      'Determine the linear algebraic rank of the 3x3 binary matrix over Galois field GF(2).';

  @override
  String get binaryMatrixRankWinTitle => 'RANK COMPUTED!';

  @override
  String get binaryMatrixRankWinMessage =>
      'Exact linear independence and matrix rank determined!';

  @override
  String get visualCrowdingAcuityTitle => 'Visual Crowd';

  @override
  String get visualCrowdingAcuitySubtitle =>
      'Identify the opening direction of the center Landolt ring amid flanking distractors.';

  @override
  String get visualCrowdingAcuityWinTitle => 'SHARP PERCEPTION!';

  @override
  String get visualCrowdingAcuityWinMessage =>
      'Excellent foveal spatial resolution under visual crowding conditions!';

  @override
  String get probeDigitSpanTitle => 'Digit Probe';

  @override
  String get probeDigitSpanSubtitle =>
      'Observe a fast serial sequence of numbers and recall the item following the probe digit.';

  @override
  String get probeDigitSpanWinTitle => 'SERIAL PROBE MASTER!';

  @override
  String get probeDigitSpanWinMessage =>
      'Flawless short-term serial position memory retrieval!';

  @override
  String get abReversalOddballTitle => 'A-B Reversal';

  @override
  String get abReversalOddballSubtitle =>
      'Respond to target stimuli and dynamically switch response criteria upon rule reversal.';

  @override
  String get abReversalOddballWinTitle => 'FLEXIBILITY MASTER!';

  @override
  String get abReversalOddballWinMessage =>
      'Exceptional cognitive switching and perceptual flexibility demonstrated!';

  @override
  String get conundrumAnagramTitle => 'Conundrum';

  @override
  String get conundrumAnagramSubtitle =>
      'Unscramble all 9 letters to discover the hidden full dictionary word.';

  @override
  String get conundrumAnagramWinTitle => 'CONUNDRUM CRACKED!';

  @override
  String get conundrumAnagramWinMessage =>
      'All 9-letter anagram conundrums successfully unscrambled!';

  @override
  String get vectorDotProductTitle => 'Dot Product';

  @override
  String get vectorDotProductSubtitle =>
      'Calculate the algebraic inner product u • v = (u_x * v_x) + (u_y * v_y).';

  @override
  String get vectorDotProductWinTitle => 'INNER PRODUCT COMPUTED!';

  @override
  String get vectorDotProductWinMessage =>
      'Exact geometric and algebraic vector projections achieved!';

  @override
  String get stroopNumberSizeTitle => 'Size Stroop';

  @override
  String get stroopNumberSizeSubtitle =>
      'Compare either numerical magnitude or physical font size under Stroop interference.';

  @override
  String get stroopNumberSizeWinTitle => 'INHIBITION EXPERT!';

  @override
  String get stroopNumberSizeWinMessage =>
      'Flawless perceptual conflict resolution under size-congruity Stroop!';

  @override
  String get wordLadderStepTitle => 'Word Ladder';

  @override
  String get wordLadderStepSubtitle =>
      'Complete the single-letter transformation sequence between source and destination words.';

  @override
  String get wordLadderStepWinTitle => 'LADDER CLIMBED!';

  @override
  String get wordLadderStepWinMessage =>
      'All single-letter step transformations completed!';

  @override
  String get corsiBackwardSpanTitle => 'Corsi Backward';

  @override
  String get corsiBackwardSpanSubtitle =>
      'Observe a sequential spatial block tapping pattern and reproduce it in exact reverse order.';

  @override
  String get corsiBackwardSpanWinTitle => 'BACKWARD SPAN PRO!';

  @override
  String get corsiBackwardSpanWinMessage =>
      'Exceptional visuospatial working memory manipulation and reverse sequencing!';
}
