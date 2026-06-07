// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'பசில் ஹப்';

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
  String get visualStatisticalLearningTitle => 'விளையாட்டு முடிந்தது';

  @override
  String get orbitTapTitle => 'சுற்றுப்பாதை தட்டல்';

  @override
  String get orbitTapSubtitle =>
      'பந்துகள் நுழைவாயிலுடன் சீரமைக்கும்போது தட்டவும்';

  @override
  String get schulteTableTitle => 'சிறந்த கவனம்!';

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
  String get memoryMatrixTitle => 'இலக்கு எட்டப்பட்டது!';

  @override
  String get memoryMatrixSubtitle =>
      'அமைப்பை மனப்பாடம் செய்து கட்டங்களைத் தட்டவும்.';

  @override
  String get mentalAbacusTitle => 'அபாகஸ் மாஸ்டர்!';

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
  String get verbalAnalogiesTitle => 'ஒப்புமை மாஸ்டர்!';

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
  String get tangleFixTitle => 'சிக்கல் தீர்ந்தது!';

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
  String get wisconsinCardSortingTitle => 'விளையாட்டு முடிந்தது';

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
  String get mirrorTracingTitle => 'கச்சிதமான வரைதல்!';

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
  String get paperFoldingTitle => 'மடிப்பு பிரித்தல்!';

  @override
  String get paperFoldingSubtitle => 'பிரிக்கும்போது இது எப்படி இருக்கும்?';

  @override
  String get waterSortTitle => 'மிகச்சிறப்பு!';

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
  String get silhouetteMatchTitle => 'பொருந்தியது!';

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
}
