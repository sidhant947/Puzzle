// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'पज़ल गेम्स';

  @override
  String get home => 'होम';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get playAgain => 'फिर से खेलें';

  @override
  String get playNext => 'अगला खेलें';

  @override
  String get seeCompleted => 'पहेली की समीक्षा करें';

  @override
  String get finish => 'समाप्त करें';

  @override
  String get congrats => 'बधाई हो';

  @override
  String get perfectGradient => 'सही ग्रेडिएंट!';

  @override
  String get wellDone => 'बहुत बढ़िया';

  @override
  String get timeUp => 'समय समाप्त!';

  @override
  String get victory => 'विजय!';

  @override
  String get gameWin => 'बहुत बढ़िया!';

  @override
  String get completed => 'पूरा हुआ!';

  @override
  String get score => 'स्कोर';

  @override
  String get timeLeft => 'समय';

  @override
  String get trials => 'प्रयास';

  @override
  String get numberRule => 'संख्या नियम';

  @override
  String get colorRule => 'रंग नियम';

  @override
  String get valid => 'मान्य';

  @override
  String get invalid => 'अमान्य';

  @override
  String get even => 'सम';

  @override
  String get odd => 'विषम';

  @override
  String get red => 'लाल';

  @override
  String get green => 'हरा';

  @override
  String get blue => 'नीला';

  @override
  String get yes => 'हाँ';

  @override
  String get no => 'नहीं';

  @override
  String get trueLabel => 'सत्य';

  @override
  String get falseLabel => 'असत्य';

  @override
  String get clear => 'साफ करें';

  @override
  String get north => 'उत्तर';

  @override
  String get south => 'दक्षिण';

  @override
  String get east => 'पूर्व';

  @override
  String get west => 'पश्चिम';

  @override
  String get target => 'लक्ष्य';

  @override
  String get moves => 'चालें';

  @override
  String get trialMode => 'ट्रायल मोड';

  @override
  String get trialModeDescription => '60 सेकंड के टाइमर के बजाय 20 हल करें';

  @override
  String get appearance => 'दिखावट';

  @override
  String get language => 'भाषा';

  @override
  String get gameplay => 'गेमप्ले';

  @override
  String get supportUs => 'हमें सपोर्ट करें';

  @override
  String get systemLegal => 'सिस्टम और कानूनी';

  @override
  String get games => 'गेम';

  @override
  String get solvedToday => 'आज हल किए गए';

  @override
  String get searchGames => 'गेम खोजें...';

  @override
  String get readyToStart => 'क्या आप अपने दिमाग की कसरत के लिए तैयार हैं?';

  @override
  String get greatStart => 'शानदार शुरुआत! इसे जारी रखें।';

  @override
  String get onFire => 'कमाल है! आपका दिमाग इसका आनंद ले रहा है।';

  @override
  String get incredible => 'अविश्वसनीय! आप पहेली के उस्ताद हैं।';

  @override
  String get noGamesMatch => 'आपकी खोज से कोई गेम मेल नहीं खाता';

  @override
  String get categoryAll => 'सभी';

  @override
  String get categoryAttention => 'एकाग्रता';

  @override
  String get categoryLogic => 'तर्क';

  @override
  String get categoryMath => 'गणित';

  @override
  String get categoryWord => 'शब्द';

  @override
  String get categoryMemory => 'याददाश्त';

  @override
  String get categorySpatial => 'स्थानिक';

  @override
  String get themeLight => 'लाइट';

  @override
  String get themeDark => 'डार्क';

  @override
  String get themeSystem => 'सिस्टम';

  @override
  String get starOnGithub => 'GitHub पर स्टार दें';

  @override
  String get sponsorOnGithub => 'GitHub पर स्पॉन्सर करें';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get termsOfService => 'सेवा की शर्तें';

  @override
  String get licenses => 'लाइसेंस';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return 'छिपे हुए $wordLength-अक्षरों वाले शब्द को खोजने के लिए आपके पास $maxTries प्रयास हैं।';
  }

  @override
  String wordFoundMessage(String word) {
    return 'शब्द सफलतापूर्वक मिल गया: $word';
  }

  @override
  String gameOverMessage(String word) {
    return 'शब्द था: $word';
  }

  @override
  String get gameOver => 'खेल समाप्त';

  @override
  String get crosswordTitle => 'क्रॉसवर्ड';

  @override
  String get crosswordSubtitle =>
      'दिए गए सुरागों के आधार पर ग्रिड को सही शब्दों से भरें।';

  @override
  String get wordSearchTitle => 'शब्द खोज';

  @override
  String get radicalRootsTitle => 'रेडिकल रूट्स';

  @override
  String get radicalRootsSubtitle =>
      'दिए गए नंबर का वर्ग या घन मूल निकालें। यदि आवश्यक हो तो निकटतम पूर्णांक तक पूर्णांकित करें।';

  @override
  String get radicalRootsGoalReached => 'लक्ष्य प्राप्त हुआ!';

  @override
  String get radicalRootsTimeUp => 'समय समाप्त!';

  @override
  String radicalRootsScoreMessage(int score) {
    return 'आपने $score जड़ों की सही गणना की!';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return 'अभ्यास करते रहें! आपने $score जड़ों की गणना की।';
  }

  @override
  String get radicalRootsStart => 'गणना शुरू करें';

  @override
  String get radicalRootsDescription =>
      'आपके पास जितने हो सकें उतने हल करने के लिए 60 सेकंड हैं।';

  @override
  String get radicalRootsBest => 'सर्वश्रेष्ठ';

  @override
  String get radicalRootsSeconds => '60 सेकंड';

  @override
  String get romanArithmeticTitle => 'रोमन अंकगणित';

  @override
  String get romanArithmeticSubtitle =>
      'रोमन अंकों का उपयोग करके जोड़ और घटाव की समस्याओं को हल करें।';

  @override
  String get romanArithmeticGoalReached => 'सेंचुरियन स्तर!';

  @override
  String get romanArithmeticTimeUp => 'समय समाप्त!';

  @override
  String romanArithmeticScoreMessage(int score) {
    return 'आपने $score रोमन समस्याओं को हल किया!';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return 'वेनी, विडी, विची! आपने $score समस्याओं को हल किया।';
  }

  @override
  String get romanArithmeticStart => 'क्वेस्ट शुरू करें';

  @override
  String get romanArithmeticDescription =>
      'बदलें और हल करें। आपके पास 60 सेकंड हैं।';

  @override
  String get romanArithmeticBest => 'सर्वश्रेष्ठ';

  @override
  String get romanArithmeticSeconds => '60 सेकंड';

  @override
  String get wordSearchSubtitle =>
      'ग्रिड में सभी छिपे हुए शब्दों को खोजें। चुनने के लिए ड्रैग करें।';

  @override
  String get missingVowelsTitle => 'गायब स्वर (Vowels)';

  @override
  String get missingVowelsSubtitle => 'छिपे हुए स्वरों वाले शब्द को पहचानें।';

  @override
  String get missingVowelsWin => 'स्वर बहाल हुए!';

  @override
  String get missingVowelsHowToPlay =>
      'एक शब्द उसके स्वरों (A, E, I, O, U) के बिना दिखाया जाएगा। पूरे शब्द का अनुमान लगाएं!';

  @override
  String get wordScrambleTitle => 'शब्द हाथापाई';

  @override
  String get wordScrambleSubtitle =>
      'छिपे हुए शब्द को सुलझाने के लिए अक्षरों पर टैप करें!';

  @override
  String get wordScrambleWin => 'शब्द सुलझ गया!';

  @override
  String get sudokuTitle => 'सुडोकु';

  @override
  String get sudokuSubtitle =>
      'ग्रिड को इस तरह पूरा करें कि हर पंक्ति, कॉलम और 3x3 बॉक्स में 1 से 9 तक के सभी अंक हों।';

  @override
  String get minesweeperTitle => 'माइनस्वीपर';

  @override
  String get minesweeperSubtitle =>
      'बिना ट्रिगर किए सभी बारूदी सुरंगों को पहचानें।';

  @override
  String get minesweeperWin => 'विजय!';

  @override
  String get minesweeperMines => 'सुरंगें';

  @override
  String get minesweeperStatus => 'स्थिति';

  @override
  String get minesweeperWon => 'जीते';

  @override
  String get minesweeperBoom => 'धमाका';

  @override
  String get minesweeperPlaying => 'खेल रहे हैं';

  @override
  String get minesweeperReveal => 'दिखाएँ';

  @override
  String get minesweeperFlag => 'फ्लैग';

  @override
  String get game2048Title => '2048';

  @override
  String get game2048Subtitle =>
      'टाइल्स को मर्ज करने और 2048 टैल तक पहुँचने के लिए किसी भी दिशा में स्वाइप करें!';

  @override
  String get nonogramTitle => 'नोनोग्राम';

  @override
  String get nonogramSubtitle =>
      'तर्क सुराग का उपयोग करके छिपी हुई छवि को प्रकट करें।';

  @override
  String get nonogramWin => 'छवि प्रकट हुई!';

  @override
  String get magnetsTitle => 'मैग्नेट';

  @override
  String get magnetsSubtitle => 'ध्रुव गणना के आधार पर ग्रिड में मैग्नेट रखें।';

  @override
  String get magnetsHowToPlay =>
      'डोमिनोज़ के आकार के कंटेनरों को \'+\' और \'-\' मैग्नेट से भरें या उन्हें खाली छोड़ दें। पंक्ति और स्तंभ संकेत उस रेखा में प्रत्येक ध्रुव की कुल संख्या निर्दिष्ट करते हैं। समान ध्रुव ऑर्थोगोनली (लंबवत या क्षैतिज रूप से) आसन्न नहीं हो सकते।';

  @override
  String get magnetsWinTitle => 'ध्रुवीयता संतुलित!';

  @override
  String get magnetsWinMessage => 'सभी मैग्नेट पूरी तरह से व्यवस्थित हैं!';

  @override
  String get lighthousesTitle => 'लाइटहाउस';

  @override
  String get lighthousesSubtitle => 'लाइटहाउस संकेतों के आधार पर जहाज रखें।';

  @override
  String get lighthousesHowToPlay =>
      'ग्रिड में 1x1 जहाज रखें। लाइटहाउस क्षैतिज और ऊर्ध्वाधर रूप से दिखाई देने वाले जहाजों की कुल संख्या का संकेत देते हैं। जहाज लाइटहाउस या एक-दूसरे को नहीं छू सकते, यहाँ तक कि तिरछे भी नहीं।';

  @override
  String get lighthousesWinTitle => 'सुरक्षित समुद्र!';

  @override
  String get lighthousesWinMessage =>
      'सभी लाइटहाउस जहाजों का पूरी तरह से मार्गदर्शन कर रहे हैं!';

  @override
  String get dominosaTitle => 'डोमिनोसा';

  @override
  String get dominosaSubtitle => 'ग्रिड में छिपे हुए सभी डोमिनोज़ खोजें।';

  @override
  String get dominosaHowToPlay =>
      'संख्याओं के ग्रिड पर डोमिनोज़ का एक पूरा सेट इस तरह व्यवस्थित करें कि आसन्न संख्याओं का प्रत्येक जोड़ा बिल्कुल एक डोमिनोज़ से ढका हो। प्रत्येक संख्या युग्म सेट में केवल एक बार मौजूद होता है।';

  @override
  String get dominosaWinTitle => 'डोमिनोज़ मास्टर!';

  @override
  String get dominosaWinMessage => 'हर डोमिनोज़ मिल गया है और रख दिया गया है!';

  @override
  String get skyscrapersTitle => 'स्काईस्क्रेपर्स';

  @override
  String get skyscrapersSubtitle => 'ग्रिड को इमारतों की ऊंचाई से भरें।';

  @override
  String get skyscrapersHowToPlay =>
      'ग्रिड को ऊंचाई (1-N) से भरें ताकि प्रत्येक पंक्ति और स्तंभ में प्रत्येक ऊंचाई बिल्कुल एक बार हो। किनारों पर संकेत बताते हैं कि उस दिशा से कितनी इमारतें दिखाई दे रही हैं, जिसमें ऊंची इमारतें छोटी इमारतों को रोकती हैं।';

  @override
  String get skyscrapersWinTitle => 'क्षितिज बहाल!';

  @override
  String get skyscrapersWinMessage => 'सभी इमारतें पूरी तरह से स्थित हैं!';

  @override
  String get nurikabeTitle => 'नुरिकाबे';

  @override
  String get nurikabeSubtitle => 'एक जुड़ा हुआ समुद्र और अलग द्वीप बनाएं।';

  @override
  String get nurikabeHowToPlay =>
      'एक एकल जुड़ा हुआ \'समुद्र\' (कोई 2x2 ब्लॉक नहीं) बनाने के लिए सेल को शेड करें। बिना शेड वाले सेल \'द्वीप\' बनाते हैं, जिनमें से प्रत्येक में बिल्कुल एक संख्या होती है जो उसके कुल क्षेत्रफल का प्रतिनिधित्व करती है।';

  @override
  String get nurikabeWinTitle => 'बहता हुआ समुद्र!';

  @override
  String get nurikabeWinMessage => 'द्वीप अलग हो गए, समुद्र जुड़ गया!';

  @override
  String get fillominoTitle => 'फिलोमिनो';

  @override
  String get fillominoSubtitle =>
      'ग्रिड को निर्दिष्ट आकार के पॉलिमिनो में विभाजित करें।';

  @override
  String get fillominoHowToPlay =>
      'ग्रिड को पॉलिमिनो में विभाजित करें ताकि आकार N के प्रत्येक पॉलिमिनो में उसके सभी सेल में संख्या N हो। समान आकार के पॉलिमिनो ऑर्थोगोनली आसन्न नहीं हो सकते।';

  @override
  String get fillominoWinTitle => 'ग्रिड विभाजित!';

  @override
  String get fillominoWinMessage => 'तर्क के साथ पूरी तरह से टाइल किया गया!';

  @override
  String get hitoriTitle => 'हितोरी';

  @override
  String get hitoriSubtitle =>
      'प्रत्येक पंक्ति और स्तंभ में डुप्लिकेट नंबरों को शेड करें।';

  @override
  String get hitoriHowToPlay =>
      'सेल को शेड करें ताकि कोई भी नंबर किसी भी पंक्ति या स्तंभ में एक से अधिक बार न आए। शेड किए गए सेल आसन्न (ऑर्थोगोनली) नहीं हो सकते, और सभी बिना शेड वाले सेल को एक एकल जुड़ा हुआ समूह बनाना चाहिए।';

  @override
  String get hitoriWinTitle => 'हितोरी मास्टर!';

  @override
  String get hitoriWinMessage =>
      'आपने सफलतापूर्वक सभी डुप्लिकेट को हल कर लिया है!';

  @override
  String get pathFinderTitle => 'पाथ फाइंडर';

  @override
  String get pathFinderSubtitle => 'S से E तक का छिपा हुआ रास्ता खोजें।';

  @override
  String get pathFinderWin => 'रास्ता मिल गया!';

  @override
  String get howToPlay => 'कैसे खेलें';

  @override
  String get gotIt => 'समझ गया';

  @override
  String get akariTitle => 'अकारी';

  @override
  String get akariSubtitle => 'सभी सफेद कोशिकाओं को रोशन करें';

  @override
  String get akariHowToPlay =>
      'पूरी ग्रिड को रोशन करने के लिए सफेद कोशिकाओं में लाइटबल्ब रखें। बल्ब अपनी पंक्ति और कॉलम को तब तक रोशन करते हैं जब तक कि वे दीवार से न टकराएं। दो बल्ब एक-दूसरे पर चमक नहीं सकते। नंबर वाली दीवारें दिखाती हैं कि आस-पास की कोशिकाओं में कितने बल्ब होने चाहिए।';

  @override
  String get akariWinTitle => 'रोशनी हो गई!';

  @override
  String get akariWinMessage => 'सब कुछ पूरी तरह से रोशन है।';

  @override
  String get arithmeticChainTitle => 'चेन कैलकुलेशन';

  @override
  String get arithmeticChainSubtitle => 'अपने मन में कुल योग की गणना करें';

  @override
  String get arithmeticChainWinTitle => 'लेवल अप!';

  @override
  String get arithmeticChainWinMessage => 'आपकी मानसिक गणना तेज है!';

  @override
  String get arithmeticChainLoseTitle => 'फिर से कोशिश करें';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return 'सही उत्तर $answer था।';
  }

  @override
  String get arithmeticChainStart => 'शुरू करें';

  @override
  String get arithmeticChainNext => 'अगला';

  @override
  String get attentionalBlinkTitle => 'अटेंशनल ब्लिंक';

  @override
  String get attentionalBlinkSubtitleWatch => 'संख्याओं पर ध्यान दें';

  @override
  String get attentionalBlinkSubtitleInput =>
      'वे दो संख्याएं दर्ज करें जो आपने देखीं';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return 'आपने $score लक्ष्य हासिल किए!';
  }

  @override
  String get balanceScaleTitle => 'तराजू';

  @override
  String get balanceScaleSubtitle =>
      'तराजू के आधार पर आखिरी वस्तु के वजन का अनुमान लगाएं।';

  @override
  String get balanceScaleWinTitle => 'संतुलित!';

  @override
  String get balanceScaleWinMessage => 'आपने वजन का सही अनुमान लगाया!';

  @override
  String get balanceScaleLoseTitle => 'असंतुलित';

  @override
  String get balanceScaleLoseMessage =>
      'सही संतुलन खोजने के लिए फिर से प्रयास करें।';

  @override
  String get balanceScaleBack => 'पीछे';

  @override
  String get balanceScaleSubmit => 'सबमिट करें';

  @override
  String get binaryPuzzleTitle => 'बाइनरी पहेली';

  @override
  String get binaryPuzzleSubtitle =>
      '0 और 1 से भरें। एक ही अंक के अधिकतम दो अंक पास-पास हो सकते हैं। प्रत्येक पंक्ति और कॉलम में बराबर 0 और 1 होने चाहिए।';

  @override
  String get binaryPuzzleWinTitle => 'बहुत बढ़िया';

  @override
  String get binaryPuzzleWinMessage =>
      'आपने सही तर्क के साथ बाइनरी पहेली को हल किया!';

  @override
  String get blockEscapeTitle => 'ब्लॉक एस्केप';

  @override
  String get blockEscapeSubtitle =>
      'मुख्य ब्लॉक के बाहर निकलने का रास्ता बनाने के लिए ब्लॉक्स को खिसकाएं।';

  @override
  String get blockEscapeWinTitle => 'बच निकलें!';

  @override
  String get blockEscapeWinMessage =>
      'आपने मुख्य ब्लॉक के लिए रास्ता सफलतापूर्वक साफ कर दिया!';

  @override
  String get boxCompletionTitle => 'बॉक्स पूरा करना';

  @override
  String get boxCompletionSubtitle => 'कौन सा घन बनाया जा सकता है?';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return 'आपने $totalTrials में से $score सही स्कोर किया!';
  }

  @override
  String get boxCompletionOptions => 'विकल्प';

  @override
  String get bridgesTitle => 'पुल (Bridges)';

  @override
  String get bridgesSubtitle =>
      'द्वीपों को पुलों से जोड़ें। प्रत्येक द्वीप को पुलों की एक विशिष्ट संख्या की आवश्यकता होती है। पुल एक-दूसरे को काट नहीं सकते।';

  @override
  String get bridgesWinTitle => 'जुड़ा हुआ!';

  @override
  String get bridgesWinMessage => 'आपने सभी द्वीपों को सफलतापूर्वक जोड़ दिया!';

  @override
  String get calculationSprintTitle => 'कैलकुलेशन स्प्रिंट';

  @override
  String get calculationSprintSubtitle =>
      '60 सेकंड में अधिक से अधिक समीकरण हल करें।';

  @override
  String get calculationSprintGoalReached => 'लक्ष्य पूरा हुआ!';

  @override
  String get calculationSprintTimeUp => 'समय समाप्त';

  @override
  String calculationSprintScoreMessage(int score) {
    return 'शानदार कैलकुलेशन स्पीड! आपने $score अंक प्राप्त किए।';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return 'आपने $score अंक प्राप्त किए। अपना सर्वश्रेष्ठ रिकॉर्ड तोड़ने की कोशिश करें!';
  }

  @override
  String get calculationSprintBest => 'सर्वश्रेष्ठ';

  @override
  String get calculationSprintSeconds => '60 सेकंड';

  @override
  String get calculationSprintDescription =>
      'तेजी से समीकरण हल करें।\nगलत उत्तर पर 3 सेकंड कट जाएंगे!';

  @override
  String get calculationSprintStart => 'स्प्रिंट शुरू करें';

  @override
  String get categoryFluencyTitle => 'श्रेणी प्रवाह (Category Fluency)';

  @override
  String get categoryFluencySubtitle => 'श्रेणी से संबंधित वस्तुएं दर्ज करें';

  @override
  String get categoryFluencyExpert => 'प्रवाह विशेषज्ञ!';

  @override
  String get categoryFluencyTimeUp => 'समय समाप्त!';

  @override
  String get categoryFluencyWinMessage => 'आपकी शब्दावली बहुत विशाल है!';

  @override
  String categoryFluencyFoundMessage(int count) {
    return 'आपको $count शब्द मिले।';
  }

  @override
  String get categoryFluencyCategoryLabel => 'श्रेणी:';

  @override
  String get categoryFluencyEnterItem => 'वस्तु दर्ज करें...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target शब्द';
  }

  @override
  String get changeBlindnessTitle => 'चेंज ब्लाइंडनेस';

  @override
  String get changeBlindnessSubtitle => 'बदलती हुई वस्तु को पहचानें';

  @override
  String changeBlindnessScore(int score) {
    return 'स्कोर: $score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return 'आपको $score बदलाव मिले!';
  }

  @override
  String get choiceRtTitle => 'चॉइस आरटी';

  @override
  String get choiceRtSubtitle => 'सक्रिय वर्ग पर जितनी जल्दी हो सके टैप करें';

  @override
  String choiceRtAvgMessage(String avg) {
    return 'आपकी औसत प्रतिक्रिया समय: ${avg}ms';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return 'शेष समय: ${time}s';
  }

  @override
  String choiceRtTaps(int count) {
    return 'टैप: $count';
  }

  @override
  String get colorFloodTitle => 'कलर फ्लड';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return 'चालें: $moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => 'फ्लड सफल!';

  @override
  String get colorFloodDryLand => 'असफल...';

  @override
  String get colorFloodWinMessage => 'आपने पूरी ग्रिड को रंग से भर दिया!';

  @override
  String get colorFloodLoseMessage =>
      'आपकी चालें समाप्त हो गईं। फिर से कोशिश करें!';

  @override
  String get colorMatchTitle => 'कलर मैच';

  @override
  String get colorMatchSubtitle =>
      'लक्ष्य रंग से यथासंभव मेल खाने के लिए स्लाइडर्स को समायोजित करें।';

  @override
  String get colorMatchTarget => 'लक्ष्य';

  @override
  String get colorMatchYours => 'आपका';

  @override
  String get colorMatchCheck => 'मैच चेक करें';

  @override
  String get colorMatchResult => 'मैच परिणाम';

  @override
  String colorMatchAccuracy(String accuracy) {
    return 'आपकी सटीकता: $accuracy%';
  }

  @override
  String get corsiBlocksTitle => 'कोर्सी ब्लॉक्स';

  @override
  String get corsiBlocksSubtitle =>
      'ब्लॉकों को जलते हुए देखें और उन्हें उसी क्रम में टैप करें।';

  @override
  String get corsiBlocksWinTitle => 'स्थानिक मास्टर!';

  @override
  String get corsiBlocksLoseTitle => 'स्थान भूल गए';

  @override
  String corsiBlocksMessage(int score, int span) {
    return 'आपने $score अनुक्रमों को याद किया! आपकी स्थानिक स्मृति अवधि $span तक पहुँच गई।';
  }

  @override
  String get corsiBlocksWatch => 'पैटर्न देखें';

  @override
  String get corsiBlocksRepeat => 'पैटर्न दोहराएं';

  @override
  String get corsiBlocksExcellent => 'उत्कृष्ट!';

  @override
  String get corsiBlocksSpan => 'अवधि';

  @override
  String get crownTitle => 'क्राउन';

  @override
  String get crownSubtitle =>
      'प्रत्येक पंक्ति, कॉलम और रंग क्षेत्र में एक क्राउन रखें। क्राउन पास-पास नहीं हो सकते, तिरछे भी नहीं।';

  @override
  String get crownCrowned => 'सफल!';

  @override
  String get crownSuccess => 'सभी क्राउन सही तर्क के साथ सफलतापूर्वक रखे गए।';

  @override
  String get cryptogramTitle => 'क्रिप्टोग्राम';

  @override
  String get cryptogramSubtitle =>
      'गुप्त संदेश को डिकोड करने के लिए अक्षर असाइन करें! प्रत्येक एन्कोडेड अक्षर एक वास्तविक अक्षर का प्रतिनिधित्व करता है।';

  @override
  String get cryptogramBroken => 'कोड टूट गया!';

  @override
  String get cryptogramEncrypted => 'एन्क्रिप्टेड';

  @override
  String get cryptogramSuccess => 'आपने संदेश को पूरी तरह से डिकोड कर लिया है।';

  @override
  String get cryptogramTryAgain =>
      'एन्क्रिप्शन को तोड़ने के लिए फिर से प्रयास करें।';

  @override
  String get digitSpanReverseTitle => 'रिवर्स स्पैन';

  @override
  String get digitSpanReverseSubtitleMemorize => 'अंकों को याद रखें';

  @override
  String get digitSpanReverseSubtitleEnter =>
      'अंकों को उल्टे क्रम में दर्ज करें';

  @override
  String get digitSpanReverseWinTitle => 'लेवल अप!';

  @override
  String get digitSpanReverseWinMessage => 'आपकी वर्किंग मेमोरी प्रभावशाली है!';

  @override
  String get digitSpanReverseLoseTitle => 'फिर से कोशिश करें';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return 'सही उल्टा अनुक्रम $sequence था।';
  }

  @override
  String get dividedAttentionTitle => 'विभाजित ध्यान';

  @override
  String get dividedAttentionSubtitle =>
      'तारे ⭐ के लिए बाएं टैप करें | लाल 🔴 के लिए दाएं टैप करें';

  @override
  String get dividedAttentionGameOverTitle => 'फोकस टूट गया';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return 'मल्टीटास्किंग कठिन है! आपका स्कोर $score था।';
  }

  @override
  String dividedAttentionScore(int score) {
    return 'स्कोर: $score';
  }

  @override
  String get doubleNBackTitle => 'Double N-Back';

  @override
  String doubleNBackSubtitle(int n) {
    return '$n कदम पीछे के उत्तेजनाओं का मिलान करें';
  }

  @override
  String get doubleNBackGameOverTitle => 'खेल समाप्त';

  @override
  String doubleNBackGameOverMessage(int score) {
    return 'आपने Double N-Back में $score अंक प्राप्त किए!';
  }

  @override
  String doubleNBackScore(int score) {
    return 'स्कोर: $score';
  }

  @override
  String get doubleNBackPositionMatch => 'स्थान मिलान';

  @override
  String get doubleNBackLetterMatch => 'अक्षर मिलान';

  @override
  String get faceNameAssociationTitle => 'चेहरा-नाम संबंध';

  @override
  String get faceNameAssociationSubtitleStudy =>
      'प्रत्येक चेहरे के लिए नाम याद रखें';

  @override
  String get faceNameAssociationSubtitleTest => 'यह कौन है?';

  @override
  String get faceNameAssociationPerfect => 'एकदम सही!';

  @override
  String get faceNameAssociationGameOver => 'खेल समाप्त';

  @override
  String get faceNameAssociationWinMessage =>
      'चेहरों और नामों के लिए आपकी याददाश्त बहुत अच्छी है!';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return 'आपने $total में से $correct सही प्राप्त किए।';
  }

  @override
  String get faceNameAssociationStartTest => 'टेस्ट शुरू करें';

  @override
  String get flankerTestWinTitle => 'लेजर फोकस!';

  @override
  String get flankerTestLoseTitle => 'ध्यान भटक गया';

  @override
  String flankerTestScoreMessage(int score) {
    return 'आपने $score सही स्कोर किया!';
  }

  @override
  String get flankerTestTitle => 'फ्लैंकर टेस्ट';

  @override
  String get flankerTestSubtitle =>
      'आस-पास के तीरों को अनदेखा करते हुए बीच वाले तीर की दिशा बताएं।';

  @override
  String get flankerTestLeft => 'बायां';

  @override
  String get flankerTestRight => 'दायां';

  @override
  String get fractionMatchTitle => 'भिन्न मिलान (Fraction Match)';

  @override
  String get fractionMatchSubtitle => 'चित्र का उसके भिन्न से मिलान करें';

  @override
  String get fractionMatchLoseTitle => 'भिन्न मेल नहीं खाया';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return 'सही उत्तर $correctAnswer था।';
  }

  @override
  String get goNoGoTitle => 'Go / No-Go';

  @override
  String get goNoGoSubtitle =>
      'हरे रंग के लिए टैप करें, लाल रंग को अनदेखा करें!';

  @override
  String get goNoGoLoseTitle => 'प्रतिक्रिया रुकी';

  @override
  String get goNoGoLoseMessage =>
      'आपके निरोधात्मक नियंत्रण का परीक्षण किया जा रहा है!';

  @override
  String get goNoGoTapAnywhere => 'शुरू करने के लिए कहीं भी टैप करें';

  @override
  String get groceryListTitle => 'किराने की सूची';

  @override
  String get groceryListSubtitleMemorize =>
      'वस्तुओं और उनकी श्रेणियों को याद रखें';

  @override
  String get groceryListSubtitleTest => 'यह वस्तु किस श्रेणी की थी?';

  @override
  String get groceryListWinTitle => 'किराना गुरु!';

  @override
  String get groceryListLoseTitle => 'कुछ भूल गए?';

  @override
  String groceryListScoreMessage(int score) {
    return 'आपने किराने की सूची में $score अंक प्राप्त किए!';
  }

  @override
  String get groceryListReady => 'मैं तैयार हूँ';

  @override
  String get groceryListWhereBelong => 'यह कहाँ का है?';

  @override
  String get hueSortTitle => 'रंग छँटाई (Hue Sort)';

  @override
  String get hueSortSubtitle =>
      'कोने के रंगों के बीच एक सुचारु परिवर्तन बनाने के लिए टाइल्स को बदलें। बिंदु निश्चित टाइल्स को दर्शाते हैं।';

  @override
  String get hueSortWinTitle => 'सही ग्रेडिएंट!';

  @override
  String get hueSortWinMessage =>
      'आपने रंग स्पेक्ट्रम को पूरी तरह से व्यवस्थित किया!';

  @override
  String hueSortWrongTiles(int count) {
    return 'गलत स्थिति में टाइलें: $count';
  }

  @override
  String get kenkenTitle => 'केनकेन';

  @override
  String get kenkenWinTitle => 'प्रतिभाशाली!';

  @override
  String get kenkenLoseTitle => 'खेल समाप्त';

  @override
  String get kenkenWinMessage => 'आपने केनकेन पहेली को हल कर लिया है!';

  @override
  String get kenkenLoseMessage => 'पंक्ति/कॉलम और केज नियमों की जाँच करें।';

  @override
  String kenkenSubtitle(int size) {
    return 'पंक्तियों/कॉलमों में दोहराए बिना 1-$size भरें';
  }

  @override
  String get letterCancellationTitle => 'अक्षर रद्दीकरण';

  @override
  String get letterCancellationTitleFull => 'अक्षर रद्दीकरण';

  @override
  String letterCancellationScoreMessage(int score) {
    return 'आपको $score अक्षर मिले!';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return 'सभी \"$target\" अक्षर खोजें';
  }

  @override
  String get letterCancellationFound => 'मिला';

  @override
  String get letterCancellationTime => 'समय';

  @override
  String get lightsOutTitle => 'लाइट्स आउट';

  @override
  String get lightsOutSubtitle =>
      'एक टाइल पर टैप करने से वह और उसके पास वाले पड़ोसी बदल जाते हैं। हल करने के लिए सभी लाइटें बंद करें।';

  @override
  String get lightsOutWinTitle => 'पहेली हल हुई!';

  @override
  String get lightsOutWinMessage => 'आपने सफलतापूर्वक सभी लाइटें बंद कर दीं!';

  @override
  String get symmetryTitle => 'समरूपता (Symmetry)';

  @override
  String get symmetrySubtitle =>
      'बाईं ओर के पैटर्न को दाईं ओर की खाली ग्रिड पर मिरर करें।';

  @override
  String get semanticLinkTitle => 'सिमेंटिक लिंक';

  @override
  String get semanticLinkSubtitle => 'वह शब्द खोजें जो तीनों को जोड़ता है';

  @override
  String get reflexTapTitle => 'रिफ्लेक्स टैप';

  @override
  String get visualStatisticalLearningTitle => 'विजुअल स्टैटिस्टिकल लर्निंग';

  @override
  String get orbitTapTitle => 'ऑर्बिट टैप';

  @override
  String get orbitTapSubtitle => 'जब गेंदें गेट के साथ संरेखित हों तब टैप करें';

  @override
  String get schulteTableTitle => 'शल्टे टेबल';

  @override
  String get multipleObjectTrackingTitle => 'ऑब्जेक्ट ट्रैकर';

  @override
  String get multipleObjectTrackingSubtitle =>
      'हाइलाइट की गई वस्तुओं को देखें। उनके हिलने पर उन्हें ट्रैक करें, फिर उन्हें चुनें।';

  @override
  String get sdmtTitle => 'Sdmt टेस्ट';

  @override
  String get sdmtSubtitle =>
      'उपयोग करें दिखाएँ प्रतीक के लिए अंक खोजने के लिए ऊपर दी गई कुंजी का।';

  @override
  String get memoryMatrixTitle => 'मेमोरी मैट्रिक्स';

  @override
  String get memoryMatrixSubtitle => 'पैटर्न याद रखें और टाइल्स पर टैप करें।';

  @override
  String get mentalAbacusTitle => 'मानसिक अबेकस';

  @override
  String get mentalAbacusSubtitle => 'सोरोबन का उपयोग करके हल करें';

  @override
  String get spellingSprintTitle => 'स्पेलिंग स्प्रिंट';

  @override
  String get spellingSprintSubtitle =>
      'जितने शब्द आप कर सकते हैं उतने स्पेल करने के लिए समय के खिलाफ दौड़ें।';

  @override
  String get stopSignalTitle => 'स्टॉप सिग्नल';

  @override
  String get stopSignalSubtitle =>
      'तीर की दिशा में टैप करें, लेकिन यदि तीर लाल हो जाए तो तुरंत रुकें।';

  @override
  String get staircaseMemoryTitle => 'सीढ़ी स्मृति (Staircase Memory)';

  @override
  String get vigilanceTaskTitle => 'सतर्कता कार्य (Vigilance Task)';

  @override
  String get vigilanceTaskSubtitle => 'जब सुई एक स्थान छोड़ दे तो बटन टैप करें';

  @override
  String get logicalSyllogismsTitle => 'तार्किक न्यायवाक्य';

  @override
  String get logicalSyllogismsSubtitle =>
      'क्या निष्कर्ष तार्किक रूप से मान्य है?';

  @override
  String get mathPathTitle => 'मैथ पाथ';

  @override
  String get mathPathSubtitle =>
      'एक ऐसा रास्ता खोजें जो लक्ष्य योग के बिल्कुल बराबर हो।';

  @override
  String get sternbergTaskTitle => 'स्टर्नबर्ग टास्क';

  @override
  String get sternbergTaskMemorize => 'अक्षरों को याद रखें';

  @override
  String get sternbergTaskWasLetterSet => 'क्या यह अक्षर सेट में था?';

  @override
  String sternbergTaskScore(int score) {
    return 'आपने स्टर्नबर्ग टास्क में $score अंक प्राप्त किए!';
  }

  @override
  String get verbalAnalogiesTitle => 'शाब्दिक समरूपता';

  @override
  String get verbalAnalogiesSubtitle => 'संबंध को पूरा करें';

  @override
  String get typingSpeedTitle => 'टाइपिंग स्पीड';

  @override
  String get typingSpeedSubtitle =>
      'दिखाए गए वाक्यांश को जितनी जल्दी हो सके टाइप करें!';

  @override
  String get wordLadderTitle => 'वर्ड लैडर';

  @override
  String get wordLadderSubtitle =>
      'एक बार में एक अक्षर बदलकर शब्दों को जोड़ें।';

  @override
  String get tangleFixTitle => 'उलझन सुलझाना';

  @override
  String get tangleFixSubtitle =>
      'लाइनों को सुलझाएं ताकि कोई भी एक-दूसरे को न काटे';

  @override
  String get oddRotationTitle => 'विषम रोटेशन';

  @override
  String get oddRotationSubtitle =>
      'इनमें से एक मिरर की गई है। क्या आप इसे ढूंढ सकते हैं?';

  @override
  String get towerOfLondonTitle => 'टावर ऑफ लंदन';

  @override
  String get towerOfLondonSubtitle => 'लक्ष्य कॉन्फ़िगरेशन का मिलान करें';

  @override
  String get symbolicFlankerTitle => 'सिम्बोलिक फ्लैंकर';

  @override
  String get symbolicFlankerSubtitle => 'बीच वाले प्रतीक पर ध्यान दें';

  @override
  String get stroopTestTitle => 'स्ट्रूप टेस्ट';

  @override
  String get stroopTestSubtitle =>
      'दिखाए गए शब्द की स्याही के रंग को पहचानें। शब्द के वास्तविक अर्थ को अनदेखा करें!';

  @override
  String get wisconsinCardSortingTitle => 'विस्कॉन्सिन कार्ड सॉर्ट';

  @override
  String get wisconsinCardSortingSubtitle =>
      'कार्ड का ऊपर दिए गए चार में से एक से मिलान करें';

  @override
  String get nBackTitle => 'N-Back टेस्ट';

  @override
  String get nBackSubtitle =>
      'यदि वर्तमान अक्षर 2 कदम पहले दिखाए गए अक्षर से मेल खाता है तो मैच पर टैप करें।';

  @override
  String get rhythmMasterTitle => 'रिदम मास्टर';

  @override
  String get rhythmMasterSubtitle => 'पल्स के साथ तालमेल में टैप करें';

  @override
  String get pixelMimicTitle => 'पिक्सेल मिमिक';

  @override
  String get targetNumberTitle => 'लक्ष्य 24';

  @override
  String targetNumberSubtitle(int target) {
    return '$target तक पहुँचने के लिए सभी 4 संख्याओं का उपयोग करें';
  }

  @override
  String get mirrorTracingTitle => 'दर्पण अनुरेखण';

  @override
  String get mirrorTracingSubtitle =>
      'तारे को ट्रेस करें! नियंत्रण मिरर किए गए हैं।';

  @override
  String get wordSurgeTitle => 'वर्ड सर्ज';

  @override
  String get wordSurgeSubtitle => 'पर्यायवाची और विलोम';

  @override
  String get perspectiveTakingTitle => 'परिप्रेक्ष्य लेना';

  @override
  String get perspectiveTakingTopDownView => 'ऊपर से नीचे का दृश्य';

  @override
  String get perspectiveTakingChoosePerspective => 'परिप्रेक्ष्य चुनें';

  @override
  String get perspectiveTakingCongrats =>
      'स्थानिक संबंधों के लिए आपकी नजर पैनी है।';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return '$targetDirName से कौन सा दृश्य है?';
  }

  @override
  String get paperFoldingTitle => 'कागज मोड़ना';

  @override
  String get paperFoldingSubtitle => 'खोलने पर यह कैसा दिखेगा?';

  @override
  String get waterSortTitle => 'वॉटर सॉर्ट';

  @override
  String get waterSortSubtitle =>
      'रंगों को छाँटें ताकि प्रत्येक ट्यूब में केवल एक ही रंग हो।';

  @override
  String get numericalEstimationTitle => 'संख्यात्मक अनुमान';

  @override
  String get numericalEstimationSubtitle => 'जल्दी से सबसे करीबी उत्तर चुनें!';

  @override
  String get lockPatternTitle => 'लॉक पैटर्न';

  @override
  String get lockPatternSubtitle =>
      'गुप्त पैटर्न खोजें। प्रत्येक अनुमान स्थान और बिंदुओं पर फीडबैक देता है।';

  @override
  String get primeHunterTitle => 'प्राइम हंटर';

  @override
  String get primeHunterSubtitle =>
      'अभाज्य (PRIME) के लिए बाएं स्वाइप करें | भाज्य (COMPOSITE) के लिए दाएं स्वाइप करें';

  @override
  String get tracePathTitle => 'ट्रेस पाथ';

  @override
  String get tracePathSubtitle => 'लक्ष्य पथ का यथासंभव बारीकी से पालन करें';

  @override
  String get ruleSwitcherTitle => 'रूल स्विचर';

  @override
  String get ruleSwitcherSubtitle => 'वर्तमान नियम लागू करें';

  @override
  String get choiceReactionTimeTitle => 'प्रतिक्रिया समय';

  @override
  String get pathRecallTitle => 'path recall';

  @override
  String get switchTaskTitle => 'स्विच टास्क';

  @override
  String get switchTaskSubtitle =>
      'नियम पर ध्यान दें! यह आकार मिलान और रंग मिलान के बीच स्विच करेगा।';

  @override
  String get mentalRotationTitle => 'मानसिक रोटेशन';

  @override
  String get mentalRotationSubtitle =>
      'क्या ये आकार एक जैसे हैं, बस घुमाए गए हैं?';

  @override
  String get missingOperatorTitle => 'ऑपरेटर मिक्स';

  @override
  String get missingOperatorSubtitle =>
      'समीकरण को पूरा करने के लिए रिक्त स्थान भरें';

  @override
  String get wordMastermindTitle => 'वर्ड मास्टरमाइंड';

  @override
  String get wordMastermindSubtitle =>
      '4-अक्षरों वाला कोड क्रैक करें! बुल्स (B) सही स्थान हैं, काउज़ (C) गलत स्थान हैं।';

  @override
  String get simonSequenceTitle => 'अनुक्रम';

  @override
  String get symbolLogicTitle => 'प्रतीक तर्क (Symbol Logic)';

  @override
  String get symbolLogicSubtitle =>
      'प्रत्येक प्रतीक का मान ज्ञात करने के लिए दृश्य समीकरणों को हल करें। अंतिम समीकरण का परिणाम क्या है?';

  @override
  String get silhouetteMatchTitle => 'सिलुएशन मिलान';

  @override
  String get silhouetteMatchSubtitle =>
      'इस वस्तु से कौन सा छायाचित्र (Silhouette) मेल खाता है?';

  @override
  String get operationSpanTitle => 'ऑपरेशन स्पैन';

  @override
  String get operationSpanMathPhase => 'क्या समीकरण सही है?';

  @override
  String get operationSpanLetterPhase => 'अक्षर याद रखें';

  @override
  String get operationSpanRecallPhase => 'अक्षरों को क्रम में याद करें';

  @override
  String get operationSpanRoundComplete => 'राउंड पूरा हुआ!';

  @override
  String operationSpanScore(int score) {
    return 'आपने ऑपरेशन स्पैन में $score अंक प्राप्त किए!';
  }

  @override
  String get slidePuzzleTitle => 'स्लाइड पहेली';

  @override
  String get slidePuzzleNewGame => 'नया गेम';

  @override
  String get slidePuzzleInstructions =>
      'खाली जगह में खिसकाकर टाइल्स को संख्यात्मक क्रम में व्यवस्थित करें।';

  @override
  String get slidePuzzleTileSlider => 'टाइल स्लाइडर';

  @override
  String get slidePuzzleCongrats =>
      'आपने सभी टाइल्स को सफलतापूर्वक व्यवस्थित कर लिया है।';

  @override
  String get visualSearchTitle => 'दृश्य खोज (Visual Search)';

  @override
  String get visualSearchSubtitle => 'ग्रिड में अद्वितीय प्रतीक खोजें';

  @override
  String get trailMakingTitle => 'ट्रेल मेकिंग';

  @override
  String get trailMakingSubtitle =>
      'संख्याओं को क्रम में (1 -> 2 -> 3...) जितनी जल्दी हो सके जोड़ें।';

  @override
  String get matrixReasoningTitle => 'मैट्रिक्स रीजनिंग';

  @override
  String get matrixReasoningSubtitle => '3x3 ग्रिड में पैटर्न को पूरा करें';

  @override
  String get tentsAndTreesTitle => 'तंबू और पेड़';

  @override
  String get tentsAndTreesSubtitle =>
      'पेड़ों के पास तंबू लगाएं। संख्याएं बताती हैं कि प्रत्येक पंक्ति/कॉलम में कितने तंबू हैं। तंबू एक-दूसरे को छू नहीं सकते।';

  @override
  String get quickMathTitle => 'क्विक मैथ';

  @override
  String get magicSquaresTitle => 'मैजिक स्क्वायर';

  @override
  String magicSquaresSubtitle(int targetSum) {
    return 'प्रत्येक पंक्ति, कॉलम और विकर्ण का योग $targetSum होना चाहिए';
  }

  @override
  String get objectShuffleTitle => 'ऑब्जेक्ट शफल';

  @override
  String get pipesTitle => 'पाइप्स';

  @override
  String get pipesSubtitle => 'मैचिंग रंगीन डॉट्स को पाइप से जोड़ें।';

  @override
  String get oddOneOutTitle => 'सबसे अलग खोजें';

  @override
  String get oddOneOutSubtitle => 'अलग रंग वाली टाइल खोजें।';

  @override
  String get einsteinRiddleTitle => 'आइंस्टीन पहेली';

  @override
  String get einsteinRiddleSubtitle =>
      'प्रत्येक घर की विशेषताओं का अनुमान लगाने के लिए सुरागों का उपयोग करें।';

  @override
  String get einsteinRiddleHowToPlay =>
      'प्रत्येक घर की अनूठी विशेषताएं (रंग, राष्ट्रीयता, पालतू जानवर, आदि) हैं। ग्रिड को भरने और पूरा समाधान खोजने के लिए दिए गए सुरागों का उपयोग करें।';

  @override
  String get einsteinRiddleColor => 'रंग';

  @override
  String get einsteinRiddleNationality => 'राष्ट्रीयता';

  @override
  String get einsteinRiddleDrink => 'पेय';

  @override
  String get einsteinRiddlePet => 'पालतू जानवर';

  @override
  String get einsteinRiddleSmoke => 'धूम्रपान';

  @override
  String get einsteinRiddleHouse => 'घर';

  @override
  String get mirrorImageTitle => 'मिरर इमेज';

  @override
  String get mirrorImageSubtitle => 'सही दर्पण प्रतिबिंब को पहचानें।';

  @override
  String get mirrorImageHowToPlay =>
      'आकार को देखें और दिए गए विकल्पों में से उसका सही दर्पण प्रतिबिंब चुनें।';

  @override
  String get mentalMappingTitle => 'मानसिक मानचित्रण';

  @override
  String get mentalMappingSubtitle =>
      'दिशानिर्देशों का पालन करें और गंतव्य खोजें।';

  @override
  String get mentalMappingHowToPlay =>
      'आपको दिशाओं का एक अनुक्रम (उत्तर, दक्षिण, पूर्व, पश्चिम) दिखाया जाएगा। ग्रिड के केंद्र से शुरू करके इन चरणों का मानसिक रूप से पालन करें और अंतिम गंतव्य चुनें।';

  @override
  String get memoryPalaceTitle => 'मेमोरी पैलेस';

  @override
  String get memoryPalaceSubtitle => 'याद रखें कि कौन सा शब्द किस स्थान पर था।';

  @override
  String get memoryPalaceHowToPlay =>
      'ग्रिड पर अलग-अलग स्थानों पर शब्दों का एक सेट दिखाई देगा। उनके स्थान याद रखें। फिर, आपसे शब्दों को उनके मूल स्थानों पर वापस रखने के लिए कहा जाएगा।';

  @override
  String get countingSheepTitle => 'भेड़ें गिनना';

  @override
  String get countingSheepSubtitle => 'आपने कितनी भेड़ें देखीं?';

  @override
  String get countingSheepHowToPlay =>
      'भेड़ें स्क्रीन पर तेजी से दौड़ेंगी। उनके गुजरने पर उन्हें गिनें और अंत में कुल संख्या दर्ज करें।';

  @override
  String get faceTraitAssociationTitle => 'चेहरा-विशेषता संबंध';

  @override
  String get faceTraitAssociationSubtitle =>
      'प्रत्येक चेहरे के लिए विशेषताएं याद रखें';

  @override
  String get faceTraitAssociationHowToPlay =>
      'आपको कई चेहरे दिखाए जाएंगे, जिनमें से प्रत्येक का नाम, पेशा और शौक होगा। इन संबंधों को याद रखें। बाद में, आपसे प्रत्येक चेहरे के लिए विशिष्ट विशेषताओं को याद करने के लिए कहा जाएगा।';

  @override
  String get mentalCalendarTitle => 'मानसिक कैलेंडर';

  @override
  String get mentalCalendarSubtitle => 'सप्ताह के दिन की गणना करें';

  @override
  String get mentalCalendarHowToPlay =>
      'एक रैंडम तारीख दिखाई जाएगी। यह सप्ताह के किस दिन पड़ती है, यह निर्धारित करने के लिए मानसिक गणना (या डूम्सडे एल्गोरिथम) का उपयोग करें।';

  @override
  String get vocabularyBuilderTitle => 'शब्दावली निर्माता';

  @override
  String get vocabularyBuilderSubtitle =>
      'समय के दबाव में पर्यायवाची और विलोम शब्दों का मिलान करें।';

  @override
  String get vocabularyBuilderHowToPlay =>
      'आपको एक लक्ष्य शब्द और एक संबंध (पर्यायवाची या विलोम) दिखाया जाएगा। विकल्पों में से सही शब्द चुनें जो संबंध से मेल खाता हो। जल्दी करें, घड़ी चल रही है!';

  @override
  String get correct => 'सही';

  @override
  String get incorrect => 'गलत';

  @override
  String get grammarPoliceTitle => 'ग्रामर पुलिस';

  @override
  String get grammarPoliceSubtitle =>
      'पहचानें कि वाक्य व्याकरण की दृष्टि से सही है या उसमें त्रुटियां हैं।';

  @override
  String get grammarPoliceHowToPlay =>
      'स्क्रीन के बीच में एक वाक्य दिखाई देगा। तय करें कि क्या यह व्याकरणिक रूप से सही है या इसमें कोई त्रुटि है। यदि यह ठीक है तो \'सही\' पर टैप करें, या यदि आपको कोई गलती दिखती है तो \'गलत\' पर टैप करें। अपनी सभी जानें न गवाएं!';

  @override
  String get reverseStroopTitle => 'रिवर्स स्ट्रूप';

  @override
  String get reverseStroopSubtitle =>
      'स्ट्रूप टेस्ट का एक प्रकार जहाँ फोकस बदल दिया जाता है।';

  @override
  String get reverseStroopHowToPlay =>
      'निर्देश पर ध्यान दें! यदि यह \'TEXT\' कहता है, तो शब्द के अर्थ का मिलान करें। यदि यह \'COLOR\' कहता है, तो स्याही के रंग का मिलान करें। आपके फोकस का परीक्षण करने के लिए नियम बार-बार बदलेंगे।';

  @override
  String get game2048Instruction =>
      'मर्ज करने के लिए किसी भी दिशा में स्वाइप करें';

  @override
  String get fibonacciMergeTitle => 'फिबोनाची मर्ज';

  @override
  String get fibonacciMergeSubtitle =>
      'लगातार फिबोनाची संख्याओं (1, 1, 2, 3, 5, 8, 13...) को मिलाएं।';

  @override
  String get sequenceSleuthTitle => 'क्रम का पता लगाने वाला';

  @override
  String get sequenceSleuthSubtitle =>
      'गणितीय क्रम में लुप्त संख्या ज्ञात कीजिए।';

  @override
  String get divisibilityDashTitle => 'विभाज्यता डैश';

  @override
  String get divisibilityDashSubtitle =>
      'दी गई संख्या के लिए सभी एक-अंकों वाले विभाजकों (2-9) पर टैप करें।';

  @override
  String get percentagePeakTitle => 'प्रतिशत शिखर';

  @override
  String get percentagePeakSubtitle =>
      'मानसिक प्रतिशत गणनाओं को तेज़ी से हल करें।';

  @override
  String get vennNumbersTitle => 'वेन संख्याएं';

  @override
  String get vennNumbersSubtitle =>
      'संख्याओं को सही वेन आरेख क्षेत्रों में वर्गीकृत करें।';

  @override
  String get commonDenominatorTitle => 'सामान्य हर (Common Denominator)';

  @override
  String get commonDenominatorSubtitle =>
      'महत्तम समापवर्तक (GCD) या लघुत्तम समापवर्त्य (LCM) ज्ञात कीजिए।';

  @override
  String get angleFinderTitle => 'कोण खोजने वाला';

  @override
  String get angleFinderSubtitle =>
      'ज्यामितीय समस्या में लुप्त कोण की गणना करें।';

  @override
  String get sumSnakeTitle => 'योग साँप';

  @override
  String get sumSnakeSubtitle =>
      'लक्ष्य योग तक पहुँचने के लिए आस-पास की संख्याओं को जोड़ें।';

  @override
  String get baseShiftTitle => 'बेस शिफ्ट ब्लिट्ज़';

  @override
  String get baseShiftSubtitle => 'दशमलव में हल करें';

  @override
  String get baseShiftDescription =>
      'समीकरण हल करें और उत्तर दशमलव (बेस 10) में टाइप करें।';

  @override
  String get baseShiftEquation => 'समीकरण';

  @override
  String get baseShiftHint => 'दशमलव परिणाम दर्ज करें...';

  @override
  String get baseShiftCorrect => 'सही!';

  @override
  String get baseShiftIncorrect => 'गलत!';

  @override
  String get baseShiftSubmit => 'सबमिट करें';

  @override
  String get baseShiftQuickGuide => 'त्वरित मार्गदर्शिका:';

  @override
  String get baseShiftBinary => 'बाइनरी (bin): बेस 2 (0, 1)';

  @override
  String get baseShiftHex => 'हेक्साडेसिमल (0x): बेस 16 (0-9, A-F)';

  @override
  String get baseShiftDecimal => 'दशमलव (dec): बेस 10 (0-9)';

  @override
  String get baseShiftWinTitle => 'गणित के जादूगर!';

  @override
  String get baseShiftWinMessage =>
      'आपने 5 बेस-शिफ्ट समीकरणों को सफलतापूर्वक हल किया!';

  @override
  String get blockCount3DTitle => 'ब्लॉक गणना 3D';

  @override
  String get blockCount3DSubtitle =>
      'घुमाने के लिए ड्रैग करें • छिपे हुए ब्लॉकों को गिनें';

  @override
  String get blockCount3DHowMany => 'कितने ब्लॉक हैं?';

  @override
  String get blockCount3DSubmitGuess => 'अनुमान सबमिट करें';

  @override
  String get blockCount3DNotQuite =>
      'बिल्कुल नहीं! फिर से गिनने के लिए घुमाने की कोशिश करें।';

  @override
  String get blockCount3DExcellent => 'उत्कृष्ट';

  @override
  String blockCount3DWinMessage(int count) {
    return 'आपने सभी $count ब्लॉकों की सही पहचान की!';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '1. ब्लॉक स्टैक को घुमाने के लिए 3D व्यूपोर्ट पर अपनी उंगली खींचें।\n\n2. स्टैक में सभी ब्लॉकों को गिनें।\n\n3. याद रखें: हवा में एक ब्लॉक के नीचे संरचनात्मक समर्थन ब्लॉक होने चाहिए (छिपे हुए ब्लॉक!)।\n\n4. अपना उत्तर टाइप करें और जाँचने के लिए \"अनुमान सबमिट करें\" पर टैप करें।';

  @override
  String get alphabetSudokuTitle => 'वर्णमाला सुडोकु';

  @override
  String get alphabetSudokuSubtitle =>
      'ग्रिड को इस तरह भरें कि हर पंक्ति, कॉलम और बॉक्स में A-I अक्षर हों।';

  @override
  String get alphabetSudokuWinTitle => 'सुडोकु हल हुआ!';

  @override
  String get alphabetSudokuWinMessage =>
      'शानदार! आपने अक्षरों में महारत हासिल कर ली है।';

  @override
  String get classicMazeTitle => 'क्लासिक भूलभुलैया';

  @override
  String get classicMazeSubtitle => 'खोजें और हल करें • हर बार एक नई भूलभुलैया';

  @override
  String get classicMazeWinTitle => 'भूलभुलैया साफ हुई';

  @override
  String classicMazeWinMessage(int count) {
    return 'अविश्वसनीय नेविगेशन! आपने $count चालों में भूलभुलैया को हल किया।';
  }

  @override
  String get classicMazeMoves => 'चालें: ';

  @override
  String get classicMazeHowToPlayDescription =>
      '1. चमकते पीले कंचे (खिलाड़ी) को नीचे-दाएं स्थित हरे पोर्टल (निकास) तक ले जाएं।\n\n2. स्थानांतरित करने के लिए भूलभुलैया पर कहीं भी स्वाइप करें, कीबोर्ड एरो कीज़ या नीचे दिए गए बटन का उपयोग करें।\n\n3. बैंगनी निशान आपके द्वारा खोजे गए रास्ते को दिखाता है। इसे मिटाने के लिए अपने रास्ते पर वापस आएं!\n\n4. बड़ी भूलभुलैया के साथ खुद को चुनौती देने के लिए कठिनाई बदलें।';

  @override
  String get conjunctionSearchTitle => 'संयोजन खोज (Conjunction Search)';

  @override
  String get conjunctionSearchSubtitle => 'अटेंशनल फोकस और फीचर कंजंक्चर';

  @override
  String get conjunctionSearchWinTitle => 'विजय';

  @override
  String get conjunctionSearchWinMessage =>
      'आपने सही एकाग्रता के साथ सभी लक्ष्यों को पा लिया है!';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      'निर्देशों में एक विशिष्ट आकार और रंग संयोजन दिखाया जाएगा। इसे ग्रिड में जितनी जल्दी हो सके ढूंढें और टैप करें। विचलित करने वाले आकार या तो रंग या आकार साझा करते हैं, इसलिए ध्यान से देखें!';

  @override
  String get conjunctionSearchRound => 'राउंड: ';

  @override
  String get conjunctionSearchScore => 'स्कोर: ';

  @override
  String get conjunctionSearchFind => 'खोजें: ';

  @override
  String get shapeCircle => 'वृत्त (CIRCLE)';

  @override
  String get shapeSquare => 'वर्ग (SQUARE)';

  @override
  String get shapeTriangle => 'त्रिकोण (TRIANGLE)';

  @override
  String get shapeStar => 'तारा (STAR)';

  @override
  String get shapeRectangle => 'आयताकार';

  @override
  String get shapeEllipse => 'अंडाकार';

  @override
  String get shapeTrapezoid => 'समलम्ब';

  @override
  String get colorRedLabel => 'लाल (RED)';

  @override
  String get colorBlueLabel => 'नीला (BLUE)';

  @override
  String get colorGreenLabel => 'हरा (GREEN)';

  @override
  String get colorAmberLabel => 'एम्बर (AMBER)';

  @override
  String get cubeNetFoldTitle => 'क्यूब नेट फोल्ड';

  @override
  String get cubeNetFoldSubtitle =>
      'मिलान करने वाले 3D क्यूब विकल्प का चयन करें';

  @override
  String get cubeNetFoldWinTitle => 'सही';

  @override
  String get cubeNetFoldWinMessage =>
      'आपके पास सटीक 3D स्थानिक फोल्डिंग तर्क है!';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '1. ऊपर खुले हुए 2D नेट को देखें।\n\n2. नेट को मानसिक रूप से एक 3D क्यूब में मोड़ें।\n\n3. नीचे वह विकल्प चुनें जो उस मुड़े हुए क्यूब के वैध 3D परिप्रेक्ष्य का प्रतिनिधित्व करता है।\n\n4. सावधान रहें: नेट में विपरीत फलक 3D में पास-पास नहीं हो सकते, और आस-पास के फलकों का क्रम मेल खाना चाहिए!';

  @override
  String get cubeNetFoldUnfoldedNet => 'खुला हुआ 2D नेट';

  @override
  String get cubeNetFoldWhichMatches => 'कौन सा क्यूब मेल खाता है?';

  @override
  String get cubeNetFoldIncorrect =>
      'गलत फोल्डिंग तर्क! रीसेट टैप करें या अपनी पसंद बदलें।';

  @override
  String get cubeNetFoldSubmitChoice => 'विकल्प सबमिट करें';

  @override
  String get cubeNetFoldFailed => 'विफल (रीसेट टैप करें)';

  @override
  String get faceTraitAssociationMemorize => 'सभी 4 लोगों को याद रखें';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return 'व्यक्ति $total में से $current';
  }

  @override
  String get faceTraitAssociationWhatOccupation => 'उनका पेशा क्या है?';

  @override
  String get faceTraitAssociationWhatHobby => 'उनका शौक क्या है?';

  @override
  String get faceTraitAssociationWinTitle => 'मेमोरी मास्टर!';

  @override
  String get faceTraitAssociationLoseTitle => 'खेल समाप्त';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return 'आपने $total में से $correct सही प्राप्त किए।';
  }

  @override
  String get topologyTitle => 'टोपोलॉजी';

  @override
  String get topologySubtitle =>
      'क्या ये आकार टोपोलॉजिक रूप से समान हैं? (क्या एक को बिना काटे या चिपकाए दूसरे में बदला जा सकता है?)';

  @override
  String get topologyWinTitle => 'ज्यामिति के जादूगर!';

  @override
  String get topologyWinMessage => 'आपने 10 टोपोलॉजिकल जोड़ों की सही पहचान की!';

  @override
  String get topologyScore => 'स्कोर: ';

  @override
  String get semanticDistanceTitle => 'सिमेंटिक दूरी';

  @override
  String get semanticDistanceSubtitle => 'शब्दों के बीच वैचारिक दूरी को मापें';

  @override
  String get oxymoronHuntTitle => 'ऑक्सीमोरोन हंट';

  @override
  String get oxymoronHuntSubtitle =>
      'ग्रिड में विरोधाभासी शब्दों की जोड़ी बनाएं';

  @override
  String get portmanteauSplitTitle => 'पोर्टमँटो स्प्लिट';

  @override
  String get portmanteauSplitSubtitle =>
      'एक पोर्टमँटो के स्रोत शब्दों की पहचान करें';

  @override
  String get chainReactionTitle => 'चेन रिएक्शन';

  @override
  String get chainReactionSubtitle =>
      'ओवरलैपिंग अक्षरों का उपयोग करके शब्दों को जोड़ें';

  @override
  String get rhymeMasterTitle => 'राइम मास्टर';

  @override
  String get rhymeMasterSubtitle =>
      'उन शब्दों की पहचान करें जो लक्ष्य के साथ तुकबंदी करते हैं';

  @override
  String get definitionDashTitle => 'डेफिनिशन डैश';

  @override
  String get definitionDashSubtitle => 'सही शब्द को उसकी परिभाषा से मिलाएं';

  @override
  String get syllableStackTitle => 'सिलेबल स्टैक';

  @override
  String get syllableStackSubtitle =>
      'पूर्ण शब्द बनाने के लिए शब्दांशों को स्टैक करें';

  @override
  String get sentenceUnscrambleTitle => 'वाक्य सुलझाएं';

  @override
  String get sentenceUnscrambleSubtitle =>
      'एक मान्य वाक्य बनाने के लिए शब्दों को पुनर्व्यवस्थित करें';

  @override
  String get grammarSortTitle => 'व्याकरण छँटाई';

  @override
  String get grammarSortSubtitle =>
      'शब्दों को उनके भाषण के हिस्से के अनुसार वर्गीकृत करें';

  @override
  String get vowelReconstructTitle => 'स्वर पुनर्निर्माण';

  @override
  String get vowelReconstructSubtitle => 'वाक्य में लुप्त स्वरों को भरें';

  @override
  String get consonantReconstructTitle => 'व्यंजन पुनर्निर्माण';

  @override
  String get consonantReconstructSubtitle => 'वाक्य में लुप्त व्यंजनों को भरें';

  @override
  String get homophoneHuntTitle => 'होमोफोन हंट';

  @override
  String get silentLetterSearchTitle => 'मूक अक्षर खोज';

  @override
  String get silentLetterSearchSubtitle =>
      'दिए गए शब्दों में मूक अक्षरों की पहचान करें';

  @override
  String get palindromeBuilderTitle => 'पालिंड्रोम बिल्डर';

  @override
  String get palindromeBuilderSubtitle =>
      'न्यूनतम अक्षर जोड़कर एक पालिंड्रोम बनाएं';

  @override
  String get phoneticGuessTitle => 'ध्वन्यात्मक अनुमान';

  @override
  String get phoneticGuessSubtitle =>
      'इसकी ध्वन्यात्मक वर्तनी से शब्द की पहचान करें';

  @override
  String get spoonerismSolverTitle => 'स्पूनरिज्म सॉल्वर';

  @override
  String get spoonerismSolverSubtitle =>
      'वाक्यांश के लिए सही स्पूनरिज्म की पहचान करें';

  @override
  String get etymonOddballTitle => 'एटिमोन ऑडबॉल';

  @override
  String get etymonOddballSubtitle =>
      'वह शब्द खोजें जो एक ही जड़ को साझा नहीं करता है';

  @override
  String get etymologyOriginTitle => 'व्युत्पत्ति मूल';

  @override
  String get etymologyOriginSubtitle => 'ऋण शब्द की मूल भाषा का अनुमान लगाएं';

  @override
  String get affixFactoryTitle => 'अफ़िक्स फैक्ट्री';

  @override
  String get affixFactorySubtitle =>
      'उपसर्गों और प्रत्ययों का उपयोग करके मान्य शब्द बनाएं';

  @override
  String get cognateCatchTitle => 'कॉग्नेट कैच';

  @override
  String get cognateCatchSubtitle =>
      'सच्चे कॉग्नेट्स और झूठे दोस्तों के बीच अंतर करें';

  @override
  String get compoundConnectTitle => 'कंपाउंड कनेक्ट';

  @override
  String get compoundConnectSubtitle =>
      'एक यौगिक शब्द बनाने के लिए दो शब्दों को मिलाएं';

  @override
  String get pangramSprintTitle => 'पैंग्राम स्प्रिंट';

  @override
  String get pangramSprintSubtitle =>
      'वर्णमाला के प्रत्येक अक्षर का उपयोग करके एक वाक्य बनाएं';

  @override
  String get anagramDefinitionTitle => 'एनाग्राम परिभाषा';

  @override
  String get anagramDefinitionSubtitle =>
      'इसकी परिभाषा के आधार पर एनाग्राम को हल करें';

  @override
  String get letterBridgeTitle => 'लेटर ब्रिज';

  @override
  String get letterBridgeSubtitle =>
      'दो शब्दों को जोड़ने वाले लुप्त अक्षर को खोजें';

  @override
  String get letterFrequencyScanTitle => 'अक्षर आवृत्ति स्कैन';

  @override
  String get letterFrequencyScanSubtitle =>
      'गिनें कि पाठ में एक अक्षर कितनी बार आता है';

  @override
  String get oneLetterShiftTitle => 'एक-अक्षर बदलाव';

  @override
  String get oneLetterShiftSubtitle =>
      'एक अक्षर परिवर्तन के साथ एक शब्द को दूसरे में बदलें';

  @override
  String vocabularyBuilderMessage(String arg0) {
    return 'बहुत अच्छा काम! आपकी शब्दावली प्रभावशाली है। स्कोर: $arg0';
  }

  @override
  String get symmetryMessage =>
      'आपने सर्जिकल सटीकता के साथ पैटर्न को पूरी तरह से मिरर किया।';

  @override
  String get temporalOrderMessage =>
      'अविश्वसनीय! आपकी लौकिक अनुक्रम स्मृति उच्च-निष्ठा वाली है।';

  @override
  String get temporalOrderMessage1 =>
      'गलत अनुक्रम स्मृति। अभ्यास परिपूर्ण बनाता है!';

  @override
  String get wordSearchMessage =>
      'गहरी निगरानी के साथ सभी शब्द सफलतापूर्वक मिल गए।';

  @override
  String colorMatchMessage(String arg0) {
    return 'आपकी सटीकता: $arg0%';
  }

  @override
  String semanticLinkMessage(String arg0) {
    return 'आपने $arg0 अंक प्राप्त किए!';
  }

  @override
  String reflexTapMessage(String arg0) {
    return 'आपने $arg0 लक्ष्यों पर टैप किया!';
  }

  @override
  String get angleFinderMessage => 'आपका ज्यामितीय अंतर्ज्ञान एकदम सही है!';

  @override
  String angleFinderMessage1(String arg0) {
    return 'सही उत्तर $arg0° था';
  }

  @override
  String angleFinderText(String arg0) {
    return '$arg0°';
  }

  @override
  String visualStatisticalLearningMessage(String arg0) {
    return 'आपने $arg0 सही पैटर्न स्कोर किए!';
  }

  @override
  String nonogramText(String arg0) {
    return 'त्रुटि: $arg0';
  }

  @override
  String mentalCalendarMessage(String arg0) {
    return 'आपने 10 में से $arg0 सही प्राप्त किए!';
  }

  @override
  String orbitTapMessage(String arg0) {
    return 'आपने सफलतापूर्वक $arg0 बार टैप किया!';
  }

  @override
  String schulteTableMessage(String arg0) {
    return 'आपने $arg0 में तालिका पूरी की।\nअपनी परिधीय दृष्टि का विस्तार करने के लिए अभ्यास जारी रखें!';
  }

  @override
  String get schulteTableText => 'परीक्षण शुरू करें';

  @override
  String get relationalMemoryMessage =>
      'शानदार स्थानिक संबंधपरक स्मृति सटीकता!';

  @override
  String sudokuText(String arg0) {
    return 'त्रुटि: $arg0';
  }

  @override
  String sdmtMessage(String arg0) {
    return 'आपने $arg0 प्रतीकों का मिलान किया! यह परीक्षण आपकी स्कैनिंग गति और दृश्य ध्यान को मापता है।';
  }

  @override
  String get futoshikiMessage =>
      'अविश्वसनीय! आपने फुतोशिकी लैटिन स्क्वायर को हल कर लिया।';

  @override
  String letterFrequencyScanMessage(String arg0, String arg1) {
    return 'आपने \"$arg1\" की $arg0 बार होने वाली घटनाओं को सही ढंग से गिना।';
  }

  @override
  String letterFrequencyScanText(String arg0) {
    return 'गलत। गिनती $arg0 थी।';
  }

  @override
  String get memoryMatrixMessage =>
      'प्रभावशाली! आपकी वर्किंग मेमोरी तेज है। दैनिक लक्ष्य पूरा हुआ!';

  @override
  String get memoryMatrixMessage1 =>
      'अपना मेमोरी स्कोर सुधारने के लिए ध्यान केंद्रित करें और फिर से प्रयास करें।';

  @override
  String get contextCluesMessage =>
      'असाधारण! आपकी शब्दावली और प्रासंगिक विश्लेषण शीर्ष पायदान पर हैं।';

  @override
  String get contextCluesMessage1 =>
      'गलत शब्द चुना गया! अपने मौखिक संदर्भ तर्क को प्रशिक्षित करें और फिर से प्रयास करें।';

  @override
  String oneLetterShiftMessage(String arg0, String arg1) {
    return 'आपने $arg0 को $arg1 में सफलतापूर्वक स्थानांतरित कर दिया।';
  }

  @override
  String get mentalAbacusMessage => 'आपका मानसिक अंकगणित शीर्ष स्तर का है।';

  @override
  String fractionMatcherMessage(String arg0) {
    return 'आपने अभ्यावेदन का मिलान करके $arg0 अंक प्राप्त किए!';
  }

  @override
  String get spellingSprintMessage => 'आपने सभी 10 शब्दों की सही वर्तनी लिखी!';

  @override
  String spellingSprintMessage1(String arg0) {
    return 'आपने $arg0 शब्दों की सही वर्तनी लिखी।';
  }

  @override
  String stopSignalMessage(String arg0) {
    return 'आपने $arg0 सही प्रतिक्रियाएँ प्राप्त कीं! यह परीक्षण एक नियोजित क्रिया को रोकने की आपकी क्षमता को मापता है।';
  }

  @override
  String grammarPoliceMessage(String arg0) {
    return 'खेल समाप्त! आपने व्याकरण की दुनिया में व्यवस्था बनाए रखी। स्कोर: $arg0';
  }

  @override
  String consonantReconstructMessage(String arg0) {
    return 'आपने $arg0 का स्कोर पुनर्निर्मित किया!';
  }

  @override
  String rhymeMasterMessage(String arg0, String arg1) {
    return 'आपको $arg1 में से $arg0 तुकबंदी मिली!';
  }

  @override
  String vigilanceTaskMessage(String arg0, String arg1, String arg2) {
    return 'हिट्स: $arg0, मिस: $arg1\nगलत अलार्म: $arg2';
  }

  @override
  String get silhouetteMatchOrthoMessage =>
      'आपके पास त्रुटिहीन ऑर्थोग्राफिक एलाइनमेंट कौशल है!';

  @override
  String get silhouetteMatchOrthoText => 'समझ गया';

  @override
  String get silhouetteMatchOrthoText1 =>
      'गलत परिप्रेक्ष्य प्रक्षेपण! पुनः प्रयास करने के लिए रीसेट पर टैप करें।';

  @override
  String fibonacciMergeMessage(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String factorFinderMessage(String arg0) {
    return 'आपने सभी गुणनखंड खोजकर $arg0 अंक प्राप्त किए!';
  }

  @override
  String logicalSyllogismsMessage(String arg0) {
    return 'आपने $arg0 न्यायवाक्यों को सही ढंग से हल किया!';
  }

  @override
  String get rotatingMazeMessage =>
      'आपने काइनेटिक रोटेटिंग भूलभुलैया को सफलतापूर्वक नेविगेट किया!';

  @override
  String get rotatingMazeText => 'समझ गया';

  @override
  String get rotatingMazeText1 => '🌀 भूलभुलैया 90° घूम गई! ग्रिड शिफ्ट हो गई!';

  @override
  String get mathPathMessage =>
      'आपको वह रास्ता मिल गया जो लक्ष्य तक जुड़ता है!';

  @override
  String get bridgesMessage => 'आपने सभी द्वीपों को सफलतापूर्वक जोड़ दिया!';

  @override
  String compoundConnectMessage(String arg0, String arg1) {
    return 'यौगिक शब्द $arg0$arg1 है।';
  }

  @override
  String get pangramSprintMessage =>
      'आपने सभी 26 अक्षरों का उपयोग करके एक वाक्य बनाया।';

  @override
  String get mirrorImageMessage => 'आपने प्रतिबिंब की पूरी तरह से पहचान की।';

  @override
  String get mirrorImageText => 'दर्पण छवि';

  @override
  String reverseStroopMessage(String arg0) {
    return 'आपने $arg0 अंक प्राप्त किए! निर्देशों पर अपनी नज़र रखें।';
  }

  @override
  String get verbalAnalogiesMessage => 'रिश्तों के लिए आपका दिमाग तेज है।';

  @override
  String corsiBlocksMessage1(String arg0, String arg1) {
    return 'आपने $arg1 अनुक्रमों को याद किया! आपकी स्थानिक स्मृति अवधि $arg0 तक पहुँच गई।';
  }

  @override
  String wordLadderMessage(String arg0, String arg1, String arg2) {
    return 'आपने $arg2 चरणों में $arg0 को $arg1 से सफलतापूर्वक जोड़ दिया।';
  }

  @override
  String d2AttentionMessage(String arg0) {
    return 'अविश्वसनीय चयनात्मक स्कैनिंग! अंतिम स्कोर: $arg0।';
  }

  @override
  String get d2AttentionText => 'कैसे खेलें';

  @override
  String get d2AttentionText1 => 'समझ गया';

  @override
  String get tangleFixMessage => 'सभी लाइनें साफ और चिकनी हैं।';

  @override
  String get distractorMatrixMessage =>
      'अविश्वसनीय! संज्ञानात्मक गणित विचलित करने वालों के बावजूद आपको पैटर्न याद रहे!';

  @override
  String get distractorMatrixMessage1 =>
      'डिस्ट्रैक्टर्स ने आपको पकड़ लिया! अपनी वर्किंग मेमोरी को फिर से प्रशिक्षित करें।';

  @override
  String sentenceUnscrambleMessage(String arg0) {
    return 'आपने $arg0 का स्कोर सुलझा लिया!';
  }

  @override
  String get kakuroMessage =>
      'अविश्वसनीय! आपने सभी योग खंडों का पूरी तरह से मिलान किया।';

  @override
  String symbolicFlankerMessage(String arg0, String arg1) {
    return 'आपने $arg1 में से $arg0 सही प्राप्त किए!';
  }

  @override
  String stroopTestMessage(String arg0) {
    return 'आपने $arg0 सही स्कोर किया! शब्द पर नहीं, स्याही के रंग पर ध्यान दें।';
  }

  @override
  String wisconsinCardSortingMessage(String arg0) {
    return 'आपने $arg0 कार्डों को सही ढंग से वर्गीकृत किया!';
  }

  @override
  String nBackMessage(String arg0) {
    return 'आपने $arg0 2-बैक मैच हासिल किए! मल्टीटास्किंग के लिए आपकी वर्किंग मेमोरी महत्वपूर्ण है।';
  }

  @override
  String rhythmMasterMessage(String arg0, String arg1) {
    return 'आपको $arg0 परफेक्ट हिट और $arg1 पॉइंट मिले!';
  }

  @override
  String groceryListMessage(String arg0, Object score) {
    return 'आपने किराने की सूची में $arg0 अंक प्राप्त किए!';
  }

  @override
  String get groceryListText => 'मैं';

  @override
  String get mirrorTracingMessage =>
      'आपके मस्तिष्क ने अपने समन्वय को सफलतापूर्वक पुनर्गठित किया।';

  @override
  String moduloClockMessage(String arg0) {
    return 'उत्कृष्ट मॉड्यूलर मानसिक गणित समन्वय! स्कोर: $arg0';
  }

  @override
  String moduloClockMessage1(String arg0, String arg1, String arg2) {
    return 'आपने $arg1 में से $arg0 मॉड्यूलर क्लॉक समाधान प्रबंधित किए। स्कोर: $arg2';
  }

  @override
  String get crownMessage => 'सभी क्राउन सही तर्क के साथ सफलतापूर्वक रखे गए।';

  @override
  String dualCodingMessage(String arg0) {
    return 'शानदार दोहरी कार्यक्षमता! आपकी वर्किंग मेमोरी स्कोर: $arg0';
  }

  @override
  String inequalityDashMessage(String arg0) {
    return 'आपने असमानताओं का मिलान करके $arg0 अंक प्राप्त किए!';
  }

  @override
  String sourceMonitoringMessage(String arg0, String arg1) {
    return 'आपने $arg1 में से $arg0 स्कोर किया!';
  }

  @override
  String get sourceMonitoringText => 'रिकॉल शुरू करें';

  @override
  String get memoryPalaceText => 'उपलब्ध शब्द';

  @override
  String target10Message(String arg0) {
    return 'आपने संख्याओं को 10 से मिलाकर $arg0 अंक प्राप्त किए!';
  }

  @override
  String get paperFoldingMessage => 'आप अपने मन में पैटर्न देख सकते हैं।';

  @override
  String topologyText(String arg0, String arg1) {
    return '$arg0$arg1 / 10';
  }

  @override
  String get waterSortMessage => 'आपने सभी रंगों को पूरी तरह से छाँट दिया!';

  @override
  String anagramDefinitionMessage(String arg0) {
    return 'शब्द वास्तव में \"$arg0\" था।';
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
    return 'आपने $arg0 सही अनुमान लगाए।';
  }

  @override
  String grammarSortMessage(String arg0) {
    return 'आपने $arg0 शब्दों को सही ढंग से वर्गीकृत किया!';
  }

  @override
  String vowelReconstructMessage(String arg0) {
    return 'आपने $arg0 का स्कोर पुनर्निर्मित किया!';
  }

  @override
  String spatialConflictMessage(String arg0, String arg1) {
    return 'आपने $arg1 त्रुटियों के साथ $arg0 का स्कोर हासिल किया!';
  }

  @override
  String get spatialConflictText => 'कैसे खेलें';

  @override
  String get spatialConflictText1 => 'समझ गया';

  @override
  String tracePathMessage(String arg0) {
    return 'आपकी सटीकता $arg0% थी!';
  }

  @override
  String ruleSwitcherMessage(String arg0, String arg1) {
    return 'आपने $arg1 में से $arg0 सही स्कोर किया!';
  }

  @override
  String collatzMessage(String arg0, String arg1) {
    return 'आपने $arg0 कदम उठाए। न्यूनतम संभव $arg1 था।';
  }

  @override
  String get collatzText => '/ 2';

  @override
  String get collatzText1 => '+ 1';

  @override
  String get collatzText2 => '3n + 1';

  @override
  String divisibilityDashMessage(String arg0) {
    return 'आपने $arg0 नंबरों को हल किया!';
  }

  @override
  String switchTaskMessage(String arg0) {
    return 'आपने $arg0 सही स्कोर किया! मानसिक लचीलेपन के लिए तेजी से स्विच करना महत्वपूर्ण है।';
  }

  @override
  String sequenceSleuthMessage(String arg0) {
    return 'आपने $arg0 अनुक्रम हल किए!';
  }

  @override
  String changeBlindnessMessage(String arg0) {
    return 'आपको $arg0 बदलाव मिले!';
  }

  @override
  String mentalRotationMessage(String arg0) {
    return 'आपने $arg0 आकृतियों को सही ढंग से घुमाया!';
  }

  @override
  String wordMastermindMessage(String arg0) {
    return 'आपने कोड में महारत हासिल कर ली!\nशब्द था: $arg0';
  }

  @override
  String wordMastermindMessage1(String arg0) {
    return 'छिपा हुआ शब्द था: $arg0';
  }

  @override
  String wordMastermindText(String arg0) {
    return '$arg0';
  }

  @override
  String get simonSequenceMessage => 'आपने सभी 10 टाइलें याद कर लीं!';

  @override
  String get simonSequenceMessage1 =>
      'अनुक्रम में महारत हासिल करने के लिए फिर से प्रयास करें।';

  @override
  String oxymoronHuntMessage(String arg0) {
    return 'आपको $arg0 ऑक्सीमोरोन मिले!';
  }

  @override
  String spotlightTrackMessage(String arg0) {
    return 'अविश्वसनीय स्थानिक ट्रैकिंग! आपने $arg0 अंक प्राप्त किए।';
  }

  @override
  String get spotlightTrackText => 'कैसे खेलें';

  @override
  String get spotlightTrackText1 => 'समझ गया';

  @override
  String get spotlightTrackText2 => 'राउंड शुरू करें';

  @override
  String vennNumbersMessage(String arg0) {
    return 'आपने $arg0 संख्याओं को वर्गीकृत किया!';
  }

  @override
  String get vennNumbersText => 'दोनों में से कोई नहीं';

  @override
  String get vennNumbersText1 => 'दोनों';

  @override
  String get silhouetteMatchMessage =>
      'आपका मस्तिष्क 3D से 2D अनुवाद में उत्कृष्ट है।';

  @override
  String sumSnakeMessage(String arg0) {
    return 'लक्ष्य $arg0 पूर्ण सटीकता के साथ प्राप्त हुआ!';
  }

  @override
  String get sumSnakeText => 'रास्ता साफ करें';

  @override
  String percentagePeakMessage(String arg0) {
    return 'आपने $arg0 प्रतिशत समस्याओं को हल किया!';
  }

  @override
  String trailMakingMessage(String arg0) {
    return 'आपने $arg0 ट्रेल्स पूरे किए! यह परीक्षण आपकी दृश्य खोज गति और मानसिक लचीलेपन को मापता है।';
  }

  @override
  String matrixReasoningMessage(String arg0) {
    return 'आपने $arg0 मेट्रिसेस को सही ढंग से पूरा किया!';
  }

  @override
  String get tentsAndTreesMessage => 'आपने सभी तंबू सफलतापूर्वक लगा दिए हैं।';

  @override
  String klotskiMessage(String arg0) {
    return 'शानदार स्लाइडिंग! आपने $arg0 चालों में हीरो ब्लॉक को मुक्त कर दिया।';
  }

  @override
  String sumPyramidMessage(String arg0) {
    return 'आपने $arg0 योग पिरामिडों को सफलतापूर्वक हल किया!';
  }

  @override
  String simonCommandMessage(String arg0) {
    return 'उत्कृष्ट चयनात्मक प्रतिक्रिया और ध्यान! कुल स्कोर: $arg0';
  }

  @override
  String simonCommandMessage1(String arg0, String arg1) {
    return 'आपने $arg0 स्कोर किया लेकिन समय पर $arg1 मैच तक नहीं पहुँच पाए।';
  }

  @override
  String syllableStackMessage(String arg0) {
    return 'आपने $arg0 का स्कोर खड़ा कर दिया!';
  }

  @override
  String get slitherlinkMessage =>
      'बहुत बढ़िया! आपने सफलतापूर्वक लूप पहेली पूरी की।';

  @override
  String quickMathMessage(String arg0) {
    return 'आपने $arg0 समस्याएँ हल कीं!';
  }

  @override
  String commonDenominatorMessage(String arg0) {
    return 'आपने $arg0 GCD/LCM समस्याएँ हल कीं!';
  }

  @override
  String chainReactionMessage(String arg0, String arg1) {
    return 'आपका अंतिम स्कोर $arg0 है। आपने $arg1 शब्दों की एक श्रृंखला बनाई।';
  }

  @override
  String chainReactionText(String arg0) {
    return '$arg0';
  }

  @override
  String get associativePairsMessage =>
      'शानदार! आपने दृश्य लक्षणों को त्रुटिहीन रूप से जोड़ा।';

  @override
  String get associativePairsMessage1 =>
      'गलत संबंध! अपनी लिंक मेमोरी को तेज करें और फिर से प्रयास करें।';

  @override
  String portmanteauSplitMessage(String arg0) {
    return 'आपने $arg0 पोर्टमँटो को विभाजित किया!';
  }

  @override
  String get magicSquaresText => 'साफ करें';

  @override
  String alphabetSudokuText(String arg0) {
    return 'त्रुटि: $arg0';
  }

  @override
  String get pipesMessage => 'आपने सभी पाइपों को जोड़ दिया और ग्रिड भर दी।';

  @override
  String get dualMirrorMessage =>
      'आपने दोनों आइकनों को उनके लक्ष्यों तक पहुँचाया!';

  @override
  String binaryCodeMessage(String arg0) {
    return 'शानदार तीव्र दशमलव अनुवाद! अंतिम स्कोर: $arg0';
  }

  @override
  String binaryCodeMessage1(String arg0, String arg1) {
    return 'आपने $arg0 बाइनरी नंबरों को सही ढंग से परिवर्तित किया। स्कोर: $arg1';
  }

  @override
  String oddOneOutMessage(String arg0) {
    return 'आपको 50 विषम मिले! अंतिम स्कोर: $arg0';
  }

  @override
  String oddOneOutMessage1(String arg0) {
    return 'आपका स्कोर: $arg0';
  }

  @override
  String letterBridgeMessage(String arg0) {
    return 'आपको ब्रिज अक्षर मिल गया: $arg0';
  }

  @override
  String get imReady => 'मैं तैयार हूँ';

  @override
  String get soptTitle => 'स्व-आदेशित इशारा';

  @override
  String get soptSubtitle => 'हर बार एक अलग कार्ड टैप करें। पदों में फेरबदल!';

  @override
  String get soptWinTitle => 'अनुक्रम मास्टर!';

  @override
  String soptGameOverMessage(int score) {
    return 'आपने फेरबदल किए गए कार्डों को सफलतापूर्वक ट्रैक करके __स्कोर__ अंक अर्जित किए!';
  }

  @override
  String get soptChooseNovel => 'एक नया कार्ड टैप करें';

  @override
  String get soptGreatJob => 'अच्छा काम!';

  @override
  String get soptAlreadyTapped => 'पहले ही टैप किया जा चुका है!';

  @override
  String get soptGrid => 'ग्रिड';

  @override
  String get contRecogTitle => 'निरंतर पहचान';

  @override
  String get contRecogSubtitle =>
      'क्या आपने इस सत्र में यह कार्ड पहले देखा है?';

  @override
  String get contRecogWinTitle => 'पहचान प्रतिभा!';

  @override
  String contRecogGameOverMessage(int score) {
    return 'आपने __स्कोर__ सही मान्यता प्राप्त की है!';
  }

  @override
  String get contRecogCorrect => 'सही!';

  @override
  String get contRecogWrong => 'गलत!';

  @override
  String get contRecogOldOrNew => 'क्या यह पुराना है या नया?';

  @override
  String get contRecogNew => 'नया';

  @override
  String get contRecogOld => 'पुराना';

  @override
  String get contRecogSeenPool => 'पूल देखा';

  @override
  String get dnmsTitle => 'मेल न खाने वाली मेमोरी';

  @override
  String get dnmsSubtitle =>
      'उस कार्ड को टैप करें जो याद किए गए नमूने में नहीं था।';

  @override
  String get dnmsWinTitle => 'गैर-मिलान विशेषज्ञ!';

  @override
  String dnmsGameOverMessage(int score) {
    return 'आपने विलंबित गैर-मिलान में सही उत्तरों में __स्कोर__ अंक प्राप्त किए!';
  }

  @override
  String get dnmsChooseNovel => 'नया कार्ड टैप करें';

  @override
  String get dnmsMemorizeSample => 'इस कार्ड को याद रखें';

  @override
  String get dnmsWaitForIt => 'इसके लिए प्रतीक्षा कीजिए...';

  @override
  String get dnmsExcellent => 'उत्कृष्ट!';

  @override
  String get dnmsSampleTapped => 'वह नमूना था!';

  @override
  String get dnmsCards => 'कार्ड';

  @override
  String get symSpanTitle => 'समरूपता अवधि';

  @override
  String get symSpanSubtitle =>
      'ऊर्ध्वाधर समरूपता की पहचान करते समय सेल पैटर्न को याद करें।';

  @override
  String get symSpanWinTitle => 'समरूपता मास्टर!';

  @override
  String symSpanGameOverMessage(int score) {
    return 'आपने लेआउट को याद करके और समरूपता की पहचान करके __स्कोर__ अंक अर्जित किए!';
  }

  @override
  String get symSpanMemorizeRed => 'लाल कोशिका स्थान याद रखें';

  @override
  String get symSpanIsSymmetric => 'क्या पैटर्न सममित है?';

  @override
  String get symSpanRecallSequence => 'अनुक्रम को सही क्रम में याद करें';

  @override
  String get symSpanGreatJob => 'अच्छा काम!';

  @override
  String get symSpanTryAgain => 'पुनः प्रयास करें!';

  @override
  String get symSpanLength => 'लंबाई';

  @override
  String get readingSpanTitle => 'पढ़ना अवधि';

  @override
  String get readingSpanSubtitle =>
      'अक्षरों का क्रम याद रखते हुए वाक्यों का सत्यापन करें।';

  @override
  String get readingSpanWinTitle => 'पढ़ने में विशेषज्ञ!';

  @override
  String readingSpanGameOverMessage(int score) {
    return 'आपने रीडिंग स्पैन मेमोरी चैलेंज में $score अंक अर्जित किए!';
  }

  @override
  String get readingSpanTrueFalse => 'यह कथन सही है या गलत?';

  @override
  String get readingSpanMemorizeLetter => 'इस पत्र को याद रखें';

  @override
  String get readingSpanRecallLetters => 'अक्षरों को क्रम से याद करें';

  @override
  String get readingSpanGreatJob => 'अच्छा काम!';

  @override
  String get readingSpanTryAgain => 'पुनः प्रयास करें!';

  @override
  String readingSpanYourSequence(String sequence) {
    return 'आपका क्रम: __अनुक्रम__';
  }

  @override
  String get readingSpanLength => 'लंबाई';

  @override
  String get readingSpanSentence1 => 'सूरज पूर्व में उगता है।';

  @override
  String get readingSpanSentence2 => 'बर्फ गरम होकर उबल रही है.';

  @override
  String get readingSpanSentence3 => 'मछली पानी के अंदर सांस ले सकती है.';

  @override
  String get readingSpanSentence4 =>
      'कुत्तों के पंख होते हैं और वे उड़ सकते हैं।';

  @override
  String get readingSpanSentence5 => 'पानी 0 डिग्री सेल्सियस पर जम जाता है।';

  @override
  String get readingSpanSentence6 =>
      'बिल्लियाँ छोटे कुत्तों की तरह भौंकती हैं।';

  @override
  String get readingSpanSentence7 =>
      'ग्रीष्म ऋतु में पेड़ों की पत्तियाँ हरी होती हैं।';

  @override
  String get readingSpanSentence8 => 'वर्षा ज़मीन से ऊपर की ओर गिरती है।';

  @override
  String get readingSpanSentence9 => 'एक त्रिभुज की चार बराबर भुजाएँ होती हैं।';

  @override
  String get readingSpanSentence10 => 'सेब एक प्रकार का मीठा फल है।';

  @override
  String get readingSpanSentence11 => 'चांद चेडर चीज़ से बना है.';

  @override
  String get readingSpanSentence12 =>
      'ऑटोमोबाइल में घूमने के लिए पहिए होते हैं।';

  @override
  String get readingSpanSentence13 => 'आग जमा देने वाली ठंड है.';

  @override
  String get readingSpanSentence14 => 'कागज प्रसंस्कृत लकड़ी से बनाया जाता है।';

  @override
  String get readingSpanSentence15 =>
      'पक्षियों को उड़ने में मदद करने के लिए पंख होते हैं।';

  @override
  String get readingSpanSentence16 => 'केले देवदार के पेड़ों पर उगते हैं।';

  @override
  String get readingSpanSentence17 => 'हाथी चींटी से भी छोटा होता है।';

  @override
  String get readingSpanSentence18 =>
      'पुस्तकों में पाठ के मुद्रित पृष्ठ होते हैं।';

  @override
  String get countingSpanTitle => 'स्पैन की गिनती';

  @override
  String get countingSpanSubtitle =>
      'केवल नीले वृत्त ही गिनें। फिर गिनती का क्रम याद करें।';

  @override
  String get countingSpanWinTitle => 'प्रतिभा की गिनती!';

  @override
  String countingSpanGameOverMessage(int score) {
    return 'आपने काउंटिंग स्पैन मेमोरी चैलेंज में $score अंक अर्जित किए!';
  }

  @override
  String get countingSpanCountCircles => 'केवल नीले वृत्त ही गिनें';

  @override
  String get countingSpanRecallCounts => 'सही क्रम में गिनती याद रखें';

  @override
  String get countingSpanGreatJob => 'अच्छा काम!';

  @override
  String get countingSpanTryAgain => 'पुनः प्रयास करें!';

  @override
  String countingSpanYourSequence(String sequence) {
    return 'आपका क्रम: __अनुक्रम__';
  }

  @override
  String get countingSpanLength => 'लंबाई';

  @override
  String get objDispTitle => 'वस्तु विस्थापन';

  @override
  String get objDispSubtitle =>
      'लेआउट याद रखें. उस एक ऑब्जेक्ट को ढूंढें और टैप करें जो स्थिति बदलता है।';

  @override
  String get objDispWinTitle => 'स्थानिक प्रतिभा!';

  @override
  String objDispGameOverMessage(int score) {
    return 'आपने $score विस्थापित वस्तुओं की सही पहचान की है!';
  }

  @override
  String get objDispMemorizeAll => 'सभी प्लेसमेंट याद रखें';

  @override
  String get objDispWaitingShift =>
      'लेआउट परिवर्तन की प्रतीक्षा की जा रही है...';

  @override
  String get objDispTapMoved => 'उस ऑब्जेक्ट को टैप करें जो स्थानांतरित हुआ';

  @override
  String get objDispExcellent => 'उत्कृष्ट!';

  @override
  String get objDispWrongObject => 'ग़लत वस्तु!';

  @override
  String get objDispItems => 'सामान';

  @override
  String get mandalaTitle => 'मंडला स्मरण';

  @override
  String get mandalaSubtitle =>
      'रंग विन्यास याद रखें. रंग चुनें और टाइल्स को फिर से रंगें।';

  @override
  String get mandalaWinTitle => 'मंडला कलाकार!';

  @override
  String mandalaGameOverMessage(int score) {
    return 'आपने रंगीन ज्यामितीय लेआउट को फिर से बनाकर __स्कोर__ अंक अर्जित किए!';
  }

  @override
  String get mandalaMemorizeColors => 'टाइल के रंग याद रखें';

  @override
  String get mandalaPaintCells =>
      'मूल से मेल खाने के लिए कोशिकाओं को पेंट करें';

  @override
  String get mandalaExcellent => 'उत्कृष्ट!';

  @override
  String get mandalaIncorrectMatch => 'ग़लत मिलान!';

  @override
  String get mandalaSubmitRepaint => 'पुनः रंगना सबमिट करें';

  @override
  String get mandalaTiles => 'टाइल्स';

  @override
  String get runningSpanTitle => 'रनिंग स्पैन';

  @override
  String get runningSpanSubtitle =>
      'पत्र देखो. जब वे रुकें, तो क्रम से अंतिम N अक्षर दर्ज करें।';

  @override
  String get runningSpanWinTitle => 'बफर मास्टर!';

  @override
  String runningSpanGameOverMessage(int score) {
    return 'आपने रनिंग मेमोरी स्पैन में __स्कोर__ अंक अर्जित किए!';
  }

  @override
  String runningSpanPrepareRecall(int count) {
    return 'पिछले $count अक्षरों को याद करने की तैयारी करें';
  }

  @override
  String get runningSpanWatchCarefully => 'ध्यान से देखो...';

  @override
  String runningSpanEnterLast(int count) {
    return 'अंतिम $count अक्षर दर्ज करें';
  }

  @override
  String get runningSpanGreatJob => 'अच्छा काम!';

  @override
  String get runningSpanIncorrectBuffer => 'ग़लत बफ़र!';

  @override
  String runningSpanRecallLast(int count) {
    return 'अंतिम $count याद करें';
  }

  @override
  String get runningSpanStopsRandomly => 'धारा बेतरतीब ढंग से रुक जाती है!';

  @override
  String runningSpanEntered(String sequence) {
    return 'प्रविष्ट: __अनुक्रम__';
  }

  @override
  String get runningSpanNItems => 'एन-आइटम';

  @override
  String get spatialCabinetTitle => 'स्थानिक मंत्रिमंडल';

  @override
  String get spatialCabinetSubtitle =>
      'याद रखें कि किस कैबिनेट दराज में कौन सी वस्तु है।';

  @override
  String get spatialCabinetWinTitle => 'कैबिनेट विशेषज्ञ!';

  @override
  String spatialCabinetGameOverMessage(int score) {
    return 'आपने स्थानिक कैबिनेट मेमोरी में $score अंक अर्जित किए!';
  }

  @override
  String get spatialCabinetMemorize => 'आइटम स्थान याद रखें';

  @override
  String spatialCabinetWhereIs(String itemName) {
    return '__आइटमनाम__ कहां है?';
  }

  @override
  String get spatialCabinetCorrect => 'सही!';

  @override
  String get spatialCabinetWrongDrawer => 'गलत दराज!';

  @override
  String get spatialCabinetItems => 'सामान';

  @override
  String get cabinetItemKey => 'चाबी';

  @override
  String get cabinetItemApple => 'सेब';

  @override
  String get cabinetItemDiamond => 'डायमंड';

  @override
  String get cabinetItemBook => 'किताब';

  @override
  String get cabinetItemUmbrella => 'छाता';

  @override
  String get cabinetItemCoffee => 'कॉफी';

  @override
  String get cabinetItemLock => 'ताला';

  @override
  String get cabinetItemPet => 'पालतू';

  @override
  String get cabinetItemCar => 'कार';

  @override
  String get gamesTitleLabel => 'खेल';

  @override
  String get yourFavorites => 'आपके पसंदीदा';

  @override
  String get readyForWorkout => 'अपने दैनिक कसरत के लिए तैयार हैं?';

  @override
  String get greatStartKeepGoing => 'शानदार शुरुआत! जारी रखें।';

  @override
  String get onFireToday => 'आज आप बहुत शानदार खेल रहे हैं!';

  @override
  String get incredibleSolvingToday => 'आज अविश्वसनीय समाधान!';

  @override
  String get newGameLabel => 'नया';

  @override
  String get slitherlinkTitle => 'स्लिदरलिंक';

  @override
  String get slitherlinkSubtitle =>
      'संख्या संकेतों का उपयोग करके पिन ग्रिड को लूप करें।';

  @override
  String get futoshikiTitle => 'फुतोशिकी';

  @override
  String get futoshikiSubtitle => 'ग्रेटर-देन संकेतों के साथ ग्रिड भरें।';

  @override
  String get kakuroTitle => 'काकुरो';

  @override
  String get kakuroSubtitle => 'संख्याओं और योगों के साथ क्रॉसवर्ड हल करें।';

  @override
  String get inequalityDashTitle => 'असमानता डैश';

  @override
  String get inequalityDashSubtitle => 'समय के दबाव में असमानताओं को हल करें।';

  @override
  String get factorFinderTitle => 'गुणनखंड खोजक';

  @override
  String get factorFinderSubtitle =>
      'लक्ष्य संख्याओं के सभी गुणनखंडों की पहचान करें।';

  @override
  String get collatzTitle => 'कोलात्ज़ पथ';

  @override
  String get collatzSubtitle => '3N+1 अनुक्रम नेविगेट करें।';

  @override
  String get sumPyramidTitle => 'योग पिरामिड';

  @override
  String get sumPyramidSubtitle =>
      'पिरामिड सेल को योग गणित संकेतों के साथ भरें।';

  @override
  String get target10Title => 'लक्ष्य 10';

  @override
  String get target10Subtitle =>
      'दस योग प्राप्त करने के लिए संख्या टाइलों को संयोजित करें।';

  @override
  String get fractionMatcherTitle => 'भिन्न मिलानकर्ता';

  @override
  String get fractionMatcherSubtitle =>
      'समान भिन्नों का दृश्य रूप से मिलान करें।';

  @override
  String get dualCodingTitle => 'दोहरी कोडिंग';

  @override
  String get dualCodingSubtitle => 'एक साथ अक्षरों और प्रतीकों का मिलान करें।';

  @override
  String get distractorMatrixTitle => 'विक्षेपक मैट्रिक्स';

  @override
  String get distractorMatrixSubtitle =>
      'विक्षेपकों के बीच लक्ष्य आकृतियाँ खोजें।';

  @override
  String get temporalOrderTitle => 'कालिक क्रम';

  @override
  String get temporalOrderSubtitle => 'कालानुक्रमिक अनुक्रम को याद करें।';

  @override
  String get associativePairsTitle => 'सहयोगी जोड़े';

  @override
  String get associativePairsSubtitle =>
      'संबंधित प्रतीकों का मिलान करें और जोड़ें।';

  @override
  String get blockCount3dTitle => '3D ब्लॉक गणना';

  @override
  String get blockCount3dSubtitle =>
      'त्रि-आयामी स्थान में ब्लॉकों की गणना करें।';

  @override
  String get rotatingMazeTitle => 'घूर्णन भूलभुलैया';

  @override
  String get rotatingMazeSubtitle =>
      'गेंदों को निकास तक ले जाने के लिए भूलभुलैया को घुमाएं।';

  @override
  String get silhouetteMatchOrthoTitle => 'सिल्हूट मिलान (ऑर्थो)';

  @override
  String get silhouetteMatchOrthoSubtitle =>
      'ऑर्थो छाया के साथ 3D वस्तुओं का मिलान करें।';

  @override
  String get spatialConflictTitle => 'स्थानिक संघर्ष';

  @override
  String get spatialConflictSubtitle => 'पाठ और दिशा विसंगतियों को हल करें।';

  @override
  String get spotlightTrackTitle => 'स्पॉटलाइट ट्रैक';

  @override
  String get spotlightTrackSubtitle =>
      'चलती छाया में चमकती वस्तुओं को ट्रैक करें।';

  @override
  String get d2AttentionTitle => 'd2 ध्यान';

  @override
  String get d2AttentionSubtitle =>
      'सख्त मानदंडों के साथ लक्ष्य प्रतीकों को टैप करें।';

  @override
  String get dualMirrorTitle => 'दोहरा दर्पण नेविगेशन';

  @override
  String get dualMirrorSubtitle => 'एक साथ दो भूलभुलैया नेविगेट करें।';

  @override
  String get contextCluesTitle => 'संदर्भ संकेत';

  @override
  String get contextCluesSubtitle =>
      'संदर्भ संकेतों से छिपे हुए शब्दों का अनुमान लगाएं।';

  @override
  String get digitSpanReverseSubtitle =>
      'विपरीत क्रम में संख्या अंकों को याद करें।';

  @override
  String get faceNameAssociationSubtitle =>
      'प्रस्तुत विभिन्न चेहरों के नाम याद करें।';

  @override
  String get staircaseMemorySubtitle =>
      'चरणबद्ध अनुक्रम में ब्लॉकों को याद करें।';

  @override
  String get choiceReactionTimeSubtitle =>
      'संकेतों से मेल खाते विशिष्ट बटनों को तेज़ी से टैप करें।';

  @override
  String get attentionalBlinkSubtitle =>
      'धाराओं में चमकते तेज़ लक्ष्यों को पहचानें।';

  @override
  String get visualStatisticalLearningSubtitle =>
      'आकृतियों के कालिक पैटर्न को दृश्य रूप से सीखें।';

  @override
  String get sternbergTaskSubtitle =>
      'याद करें कि क्या प्रतीक मेमोरी सेट में था।';

  @override
  String get operationSpanSubtitle =>
      'गणित हल करें और वर्णमाला स्ट्रिंग्स को याद करें।';

  @override
  String get continuousRecognitionTitle => 'निरंतर पहचान';

  @override
  String get continuousRecognitionSubtitle =>
      'पहचानें कि क्या प्रस्तुत कार्ड पुराना है या नया।';

  @override
  String get symmetrySpanTitle => 'समरूपता अवधि';

  @override
  String get symmetrySpanSubtitle =>
      'ऊर्ध्वाधर समरूपता निर्णयों के बीच सेल निर्देशांक याद करें।';

  @override
  String get objectDisplacementTitle => 'वस्तु विस्थापन';

  @override
  String get objectDisplacementSubtitle =>
      'स्थानों का अध्ययन करें और उस एक वस्तु को टैप करें जो हिल गई है।';

  @override
  String get mandalaRecallTitle => 'मंडला रिकॉल';

  @override
  String get mandalaRecallSubtitle =>
      'रंगीन टाइलों को याद करें और पैलेट से मंडला को फिर से पेंट करें।';

  @override
  String get runningMemorySpanTitle => 'रनिंग मेमोरी स्पैन';

  @override
  String get runningMemorySpanSubtitle =>
      'चल रहे अक्षरों की निगरानी करें और अंतिम N वस्तुओं को याद करें।';

  @override
  String get spatialCabinetMemoryTitle => 'स्थानिक कैबिनेट';

  @override
  String get spatialCabinetMemorySubtitle =>
      'कैबिनेट दरवाजों के पीछे की वस्तुओं को याद करें और खोजें।';

  @override
  String get pathRecallSubtitle => 'पथ चयन को याद करें और दोहराएं।';

  @override
  String get objectShuffleSubtitle =>
      'गहरे कपों के नीचे फेरबदल की गई वस्तुओं को ट्रैक करें।';

  @override
  String get groceryListSubtitle =>
      'सूची में मौजूद वस्तुओं को याद करें और चेक ऑफ करें।';

  @override
  String get quickMathSubtitle => 'अंकगणितीय प्रश्नों को तेज़ गति से हल करें।';

  @override
  String get mathGuessTitle => 'गणित अनुमान';

  @override
  String get mathGuessSubtitle =>
      '15 अवसरों के भीतर छिपी हुई संख्या का अनुमान लगाएं।';

  @override
  String get reflexTapSubtitle => 'जितनी जल्दी हो सके उत्तेजनाओं को टैप करें।';

  @override
  String get pixelMimicSubtitle =>
      'पिक्सेल ग्रिड पर डिज़ाइन पैटर्न की नकल करें।';

  @override
  String get simonSequenceSubtitle => 'स्मृति से आकृति अनुक्रमों को दोहराएं।';

  @override
  String get slidePuzzleSubtitle =>
      'वर्गाकार स्लाइडिंग ग्रिड टाइलों को पुनर्व्यवस्थित करें।';

  @override
  String get findWordTitle => 'शब्द खोजें';

  @override
  String get schulteTableSubtitle => 'एक से पच्चीस तक की संख्याओं को टैप करें।';

  @override
  String get simonCommandTitle => 'साइमन कमांड';

  @override
  String get simonCommandSubtitle =>
      'ध्वनि निर्देशों को तेज़ी से निष्पादित करें।';

  @override
  String get binaryCodeTitle => 'बाइनरी गति';

  @override
  String get binaryCodeSubtitle => 'बाइनरी कोड को दशमलव में बदलें।';

  @override
  String get moduloClockTitle => 'मोडुलो घड़ी';

  @override
  String get moduloClockSubtitle =>
      'घड़ियों का उपयोग करके गणित समीकरणों की गणना करें।';

  @override
  String get chimpTestTitle => 'चिंपैंजी परीक्षण';

  @override
  String get chimpTestSubtitle =>
      'आरोही क्रम में यादृच्छिक संख्याओं को टैप करें।';

  @override
  String get relationalMemoryTitle => 'संबंधपरक स्मृति';

  @override
  String get relationalMemorySubtitle =>
      'सटीक ग्रिड आइटम स्थितियों को याद करें।';

  @override
  String get factBinderTitle => 'तथ्य बाइंडर';

  @override
  String get factBinderSubtitle => 'प्रतीकों को जोड़ें और कथनों को याद करें।';

  @override
  String get sourceMonitoringTitle => 'स्रोत निगरानी';

  @override
  String get sourceMonitoringSubtitle => 'संदर्भ याद रखें।';

  @override
  String get klotskiTitle => 'क्लोत्स्की एस्केप';

  @override
  String get klotskiSubtitle =>
      'निकास तक पहुँचने के लिए ब्लॉकों को स्लाइड करें।';

  @override
  String get homophoneHuntSubtitle => 'सही वर्तनी वाले होमोफोन का चयन करें';

  @override
  String get laserLinkTitle => 'लेज़र लिंक';

  @override
  String get laserLinkSubtitle =>
      'लेज़र को परावर्तित करने और सभी लक्ष्यों को सक्रिय करने के लिए दर्पणों को घुमाएँ।';

  @override
  String get laserLinkCongrats =>
      'सटीक परावर्तन! आपने सफलतापूर्वक पूरे ग्रिड को सक्रिय कर दिया है।';

  @override
  String get crossSectionSliceTitle => 'क्रॉस-सेक्शन स्लाइस';

  @override
  String get crossSectionSliceSubtitle =>
      'एक विशिष्ट कोण से 3D वस्तु के सही 2D क्रॉस-सेक्शन की पहचान करें।';

  @override
  String get crossSectionSliceCongrats =>
      'अविश्वसनीय 3D विज़ुअलाइज़ेशन! आपने उस आकार के बिल्कुल पार देखा।';

  @override
  String get shadowPivotTitle => 'शैडो पिवट';

  @override
  String get shadowPivotCongrats =>
      'गतिशील स्थानिक तर्क! आपने प्रकाश और छाया पर महारत हासिल की।';

  @override
  String get shadowPivotSubtitle =>
      'एक 3D वस्तु द्वारा डाली गई छाया का अनुमान लगाएं क्योंकि यह विभिन्न अक्षों पर घूमती है।';

  @override
  String get interlockPuzzleTitle => 'इंटरलॉक पहेली';

  @override
  String get interlockPuzzleSubtitle =>
      'सही क्रम में जटिल इंटरलॉकिंग ब्लॉकों को अलग करें या इकट्ठा करें।';

  @override
  String get interlockPuzzleCongrats =>
      'तार्किक डिकंस्ट्रक्शन! आपने पहेली को पूरी तरह से सुलझा लिया है।';

  @override
  String get pathIntersectTitle => 'पथ प्रतिच्छेदन';

  @override
  String get pathIntersectSubtitle =>
      'बिना किसी टक्कर के अपने संबंधित लक्ष्यों तक पहुँचने के लिए एक साथ कई पथों पर नेविगेट करें।';

  @override
  String get pathIntersectCongrats =>
      'सिंक्रोनाइज़्ड नेविगेशन! आप बिना किसी गलती के सभी लक्ष्यों तक पहुँच गए हैं।';

  @override
  String get negativeSpaceDetectionTitle => 'नकारात्मक स्थान';

  @override
  String get negativeSpaceDetectionSubtitle =>
      'वस्तुओं के बीच खाली स्थान द्वारा बने आकार की पहचान करें।';

  @override
  String get negativeSpaceDetectionCongrats =>
      'तीक्ष्ण धारणा! आपने वह देखने की कला में महारत हासिल कर ली है जो वहां नहीं है।';

  @override
  String get compassMazeTitle => 'कंपास भूलभुलैया';

  @override
  String get compassMazeSubtitle =>
      'ऐसी भूलभुलैया में नेविगेट करें जहाँ आपके कंपास के ओरिएंटेशन के आधार पर गति की दिशाएँ बदलती हैं।';

  @override
  String get compassMazeCongrats =>
      'विशेषज्ञ नेविगेशन! आपने बदलती दिशाओं के माध्यम से निकास पा लिया है।';

  @override
  String get complexFoldingNetsTitle => 'फोल्डिंग नेट्स';

  @override
  String get complexFoldingNetsSubtitle =>
      'निर्धारित करें कि एक गैर-मानक 2D नेट को फोल्ड करके कौन सा जटिल 3D आकार बनेगा।';

  @override
  String get complexFoldingNetsCongrats =>
      'उन्नत फोल्डिंग तर्क! आपने सफलतापूर्वक 3D रूप की कल्पना की है।';

  @override
  String get compassMazeMessage =>
      'कंपास का उपयोग करके भूलभुलैया में नेविगेट करें।';

  @override
  String get negativeSpaceDetectionMessage =>
      'स्थान में छिपी वस्तु की पहचान करें।';

  @override
  String get shikakuTitle => 'Shikaku';

  @override
  String get shikakuSubtitle =>
      'DIVIDE THE GRID INTO SQUARES AND RECTANGLES MATCHING THE NUMBERS.';

  @override
  String get countdownMathTitle => 'Countdown Math';

  @override
  String get countdownMathSubtitle =>
      'COMBINE RANDOM NUMBERS TO CALCULATE THE THREE-DIGIT TARGET.';

  @override
  String get narrativeRecallTitle => 'Narrative Recall';

  @override
  String get narrativeRecallSubtitle =>
      'READ A STORY AND RECALL SPECIFIC QUANTITATIVE AND FACTUAL DETAILS.';

  @override
  String get shellGameTitle => 'Shell Game';

  @override
  String get shellGameSubtitle =>
      'TRACK A HIDDEN BALL AS THE SHUFFLING CUPS SWAP PLACES.';

  @override
  String get typoglycemiaDecoderTitle => 'Typoglycemia Decoder';

  @override
  String get typoglycemiaDecoderSubtitle =>
      'UNSCRAMBLE AND READ JUMBLED SENTENCES SPEEDILY.';
}
