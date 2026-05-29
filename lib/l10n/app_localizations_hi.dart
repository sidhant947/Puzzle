// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'पज़ल हब';

  @override
  String get home => 'होम';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get playAgain => 'फिर से खेलें';

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
    return 'Tiles in wrong position: $count';
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
  String get visualStatisticalLearningTitle => 'खेल समाप्त';

  @override
  String get orbitTapTitle => 'ऑर्बिट टैप';

  @override
  String get orbitTapSubtitle => 'जब गेंदें गेट के साथ संरेखित हों तब टैप करें';

  @override
  String get schulteTableTitle => 'शानदार फोकस!';

  @override
  String get multipleObjectTrackingTitle => 'ऑब्जेक्ट ट्रैकर';

  @override
  String get multipleObjectTrackingSubtitle =>
      'हाइलाइट की गई वस्तुओं को देखें। उनके हिलने पर उन्हें ट्रैक करें, फिर उन्हें चुनें।';

  @override
  String get sdmtTitle => 'Sdmt टेस्ट';

  @override
  String get sdmtSubtitle =>
      'दिखाए गए प्रतीक के लिए अंक खोजने के लिए ऊपर दी गई कुंजी का उपयोग करें।';

  @override
  String get memoryMatrixTitle => 'लक्ष्य पूरा हुआ!';

  @override
  String get memoryMatrixSubtitle => 'पैटर्न याद रखें और टाइल्स पर टैप करें।';

  @override
  String get mentalAbacusTitle => 'अबेकस मास्टर!';

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
  String get verbalAnalogiesTitle => 'एनालॉजी मास्टर!';

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
  String get tangleFixTitle => 'सुलझ गया!';

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
  String get wisconsinCardSortingTitle => 'खेल समाप्त';

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
  String get mirrorTracingTitle => 'सही ट्रेसिंग!';

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
  String get paperFoldingTitle => 'अनफोल्डेड परफेक्शन!';

  @override
  String get paperFoldingSubtitle => 'खोलने पर यह कैसा दिखेगा?';

  @override
  String get waterSortTitle => 'बहुत बढ़िया!';

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
  String get pathRecallTitle => 'पाथ रिकॉल';

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
  String get silhouetteMatchTitle => 'मैच हुआ!';

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
  String get grammarPoliceTitle => 'ग्रामर पुलिस';

  @override
  String get grammarPoliceSubtitle =>
      'टेक्स्ट की स्क्रॉलिंग दीवार में त्रुटियों को पहचानें और ठीक करें।';

  @override
  String get grammarPoliceHowToPlay =>
      'वाक्य स्क्रीन पर ऊपर की ओर स्क्रॉल करेंगे। कुछ में त्रुटियां (वर्तनी, व्याकरण, या विराम चिह्न) होती हैं। त्रुटियों वाले वाक्यों को \'ठीक\' करने के लिए उन पर टैप करें। बहुत अधिक त्रुटियों को न जाने दें!';

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
}
