// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'पझल हब';

  @override
  String get home => 'होम';

  @override
  String get settings => 'सेटिंग्ज';

  @override
  String get playAgain => 'पुन्हा खेळा';

  @override
  String get playNext => 'पुढील खेळा';

  @override
  String get seeCompleted => 'पुनरावलोकन';

  @override
  String get finish => 'पूर्ण करा';

  @override
  String get congrats => 'अभिनंदन';

  @override
  String get perfectGradient => 'परिपूर्ण ग्रेडियंट!';

  @override
  String get wellDone => 'छान केले';

  @override
  String get timeUp => 'वेळ संपली!';

  @override
  String get completed => 'पूर्ण झाले!';

  @override
  String get score => 'स्कोअर';

  @override
  String get timeLeft => 'वेळ';

  @override
  String get trials => 'चाचण्या';

  @override
  String get numberRule => 'संख्येचा नियम';

  @override
  String get colorRule => 'रंगाचा नियम';

  @override
  String get valid => 'वैध';

  @override
  String get invalid => 'अवैध';

  @override
  String get even => 'सम';

  @override
  String get odd => 'विषम';

  @override
  String get red => 'लाल';

  @override
  String get green => 'हिरवा';

  @override
  String get blue => 'निळा';

  @override
  String get yes => 'हो';

  @override
  String get no => 'नाही';

  @override
  String get trueLabel => 'खरे';

  @override
  String get falseLabel => 'खोटे';

  @override
  String get clear => 'पुसा';

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
  String get moves => 'चाली';

  @override
  String get trialMode => 'ट्रायल मोड';

  @override
  String get trialModeDescription =>
      '60 सेकंदांच्या वेळेऐवजी 20 सोडवून पूर्ण करा';

  @override
  String get appearance => 'स्वरूप';

  @override
  String get language => 'भाषा';

  @override
  String get gameplay => 'गेमप्ले';

  @override
  String get supportUs => 'आम्हाला पाठिंबा द्या';

  @override
  String get systemLegal => 'सिस्टम आणि कायदेशीर';

  @override
  String get games => 'खेळ';

  @override
  String get solvedToday => 'आज सोडवलेले';

  @override
  String get searchGames => 'खेळ शोधा...';

  @override
  String get readyToStart => 'तुमचा मेंदूचा व्यायाम सुरू करण्यास तयार आहात का?';

  @override
  String get greatStart => 'उत्तम सुरुवात! हा वेग कायम ठेवा.';

  @override
  String get onFire => 'मस्त खेळताय! तुमचा मेंदू याला दाद देतोय.';

  @override
  String get incredible => 'अविश्वसनीय! तुम्ही पझल मास्टर आहात.';

  @override
  String get noGamesMatch => 'तुमच्या शोधाशी जुळणारे खेळ नाहीत';

  @override
  String get categoryAll => 'सर्व';

  @override
  String get categoryAttention => 'एकाग्रता';

  @override
  String get categoryLogic => 'तर्कशास्त्र';

  @override
  String get categoryMath => 'गणित';

  @override
  String get categoryWord => 'शब्द';

  @override
  String get categoryMemory => 'स्मरणशक्ती';

  @override
  String get categorySpatial => 'स्थानिक';

  @override
  String get themeLight => 'प्रकाश';

  @override
  String get themeDark => 'गडद';

  @override
  String get themeSystem => 'सिस्टम';

  @override
  String get starOnGithub => 'GitHub वर स्टार द्या';

  @override
  String get sponsorOnGithub => 'GitHub वर स्पॉन्सर करा';

  @override
  String get privacyPolicy => 'गोपनीयता धोरण';

  @override
  String get termsOfService => 'सेवा अटी';

  @override
  String get licenses => 'परवाने';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return 'लपलेला $wordLength-अक्षरी शब्द शोधण्यासाठी तुमच्याकडे $maxTries प्रयत्न आहेत.';
  }

  @override
  String wordFoundMessage(String word) {
    return 'शब्द यशस्वीरित्या सापडला: $word';
  }

  @override
  String gameOverMessage(String word) {
    return 'तो शब्द होता: $word';
  }

  @override
  String get gameOver => 'खेळ संपला';

  @override
  String get crosswordTitle => 'शब्दकोडे';

  @override
  String get crosswordSubtitle =>
      'दिलेल्या संकेतांच्या आधारे ग्रिडमध्ये योग्य शब्द भरून पूर्ण करा.';

  @override
  String get wordSearchTitle => 'शब्द शोध';

  @override
  String get radicalRootsTitle => 'रॅडिकल रूट्स';

  @override
  String get radicalRootsSubtitle =>
      'दिलेल्या संख्येचे वर्गमूळ किंवा घनमूळ शोधा. आवश्यक असल्यास जवळच्या पूर्णांकापर्यंत राऊंड करा.';

  @override
  String get radicalRootsGoalReached => 'लक्ष्य गाठले!';

  @override
  String get radicalRootsTimeUp => 'वेळ संपली!';

  @override
  String radicalRootsScoreMessage(int score) {
    return 'तुम्ही $score मुळे अचूक मोजली आहेत!';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return 'सराव करत राहा! तुम्ही $score मुळे मोजली.';
  }

  @override
  String get radicalRootsStart => 'मोजणी सुरू करा';

  @override
  String get radicalRootsDescription =>
      'तुमच्याकडे शक्य तितके सोडवण्यासाठी 60 सेकंद आहेत.';

  @override
  String get radicalRootsBest => 'सर्वोत्तम';

  @override
  String get radicalRootsSeconds => '60 सेकंद';

  @override
  String get romanArithmeticTitle => 'रोमन अंकगणित';

  @override
  String get romanArithmeticSubtitle =>
      'रोमन अंक वापरून बेरीज आणि वजाबाकीची उदाहरणे सोडवा.';

  @override
  String get romanArithmeticGoalReached => 'सेंच्युरियन लेव्हल!';

  @override
  String get romanArithmeticTimeUp => 'वेळ संपली!';

  @override
  String romanArithmeticScoreMessage(int score) {
    return 'तुम्ही $score रोमन उदाहरणे सोडवली आहेत!';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return 'वेनी, विडी, विची! तुम्ही $score उदाहरणे सोडवली.';
  }

  @override
  String get romanArithmeticStart => 'शोध सुरू करा';

  @override
  String get romanArithmeticDescription =>
      'रूपांतरित करा आणि सोडवा. तुमच्याकडे 60 सेकंद आहेत.';

  @override
  String get romanArithmeticBest => 'सर्वोत्तम';

  @override
  String get romanArithmeticSeconds => '60 सेकंद';

  @override
  String get wordSearchSubtitle =>
      'ग्रिडमधील सर्व लपलेले शब्द शोधा. निवडण्यासाठी ड्रॅग करा.';

  @override
  String get missingVowelsTitle => 'गहाळ स्वर';

  @override
  String get missingVowelsSubtitle => 'स्वर लपवलेला शब्द ओळखा.';

  @override
  String get missingVowelsWin => 'स्वर पुनर्संचयित झाले!';

  @override
  String get missingVowelsHowToPlay =>
      'एक शब्द त्याचे स्वर (A, E, I, O, U) लपवून दाखवला जातो. पूर्ण शब्द ओळखा!';

  @override
  String get wordScrambleTitle => 'शब्द गोंधळ';

  @override
  String get wordScrambleSubtitle =>
      'लपलेला शब्द उलगडण्यासाठी अक्षरांवर टॅप करा!';

  @override
  String get wordScrambleWin => 'शब्द उलगडला!';

  @override
  String get sudokuTitle => 'सुडोकू';

  @override
  String get sudokuSubtitle =>
      'प्रत्येक रांग, स्तंभ आणि 3x3 बॉक्समध्ये 1 ते 9 पर्यंतचे सर्व अंक येतील अशा प्रकारे ग्रिड पूर्ण करा.';

  @override
  String get minesweeperTitle => 'माइनस्वीपर';

  @override
  String get minesweeperSubtitle => 'स्फोट न करता सर्व सुरूंग ओळखा.';

  @override
  String get minesweeperWin => 'विजय!';

  @override
  String get minesweeperMines => 'सुरूंग';

  @override
  String get minesweeperStatus => 'स्थिती';

  @override
  String get minesweeperWon => 'जिंकले';

  @override
  String get minesweeperBoom => 'धडाका';

  @override
  String get minesweeperPlaying => 'खेळत आहे';

  @override
  String get minesweeperReveal => 'प्रकट करा';

  @override
  String get minesweeperFlag => 'झेंडा';

  @override
  String get game2048Title => '2048';

  @override
  String get game2048Subtitle =>
      'टाइल विलीन करण्यासाठी आणि 2048 टाइलपर्यंत पोहोचण्यासाठी कोणत्याही दिशेने स्वाइप करा!';

  @override
  String get nonogramTitle => 'नॉनोग्राम';

  @override
  String get nonogramSubtitle =>
      'तर्कसंगत संकेतांचा वापर करून लपवलेले चित्र प्रकट करा.';

  @override
  String get nonogramWin => 'चित्र प्रकट झाले!';

  @override
  String get magnetsTitle => 'मॅग्नेट्स';

  @override
  String get magnetsSubtitle =>
      'ध्रुवांच्या संख्येवर आधारित ग्रिडमध्ये मॅग्नेट्स ठेवा.';

  @override
  String get magnetsHowToPlay =>
      'डोमिनो-आकाराचे कंटेनर \'+\' आणि \'-\' मॅग्नेट्सने भरा किंवा रिकामे सोडा. पंक्ती आणि स्तंभ संकेत त्या ओळीतील प्रत्येक ध्रुवाची एकूण संख्या दर्शवतात. समान ध्रुव एकमेकांच्या शेजारी (उभे किंवा आडवे) असू शकत नाहीत.';

  @override
  String get magnetsWinTitle => 'ध्रुवीयता संतुलित!';

  @override
  String get magnetsWinMessage => 'सर्व मॅग्नेट्स उत्तम प्रकारे मांडले आहेत!';

  @override
  String get lighthousesTitle => 'दीपगृहे';

  @override
  String get lighthousesSubtitle => 'दीपगृहांच्या संकेतांवर आधारित जहाजे ठेवा.';

  @override
  String get lighthousesHowToPlay =>
      'ग्रिडमध्ये १x१ जहाजे ठेवा. दीपगृहे आडव्या आणि उभ्या दिशेने दिसणाऱ्या जहाजांची एकूण संख्या दर्शवतात. जहाजे दीपगृहांना किंवा एकमेकांना स्पर्श करू शकत नाहीत, अगदी तिरपे देखील नाही.';

  @override
  String get lighthousesWinTitle => 'समुद्र सुरक्षित!';

  @override
  String get lighthousesWinMessage =>
      'सर्व दीपगृहे जहाजांना उत्तम प्रकारे मार्गदर्शन करत आहेत!';

  @override
  String get dominosaTitle => 'डोमिनोसा';

  @override
  String get dominosaSubtitle => 'ग्रिडमध्ये लपलेले सर्व डोमिनो शोधा.';

  @override
  String get dominosaHowToPlay =>
      'संख्यांच्या ग्रिडवर डोमिनोचा एक पूर्ण संच अशा प्रकारे लावा की लगतच्या संख्यांची प्रत्येक जोडी तंतोतंत एका डोमिनोने झाकली जाईल. प्रत्येक संख्या जोडी संचामध्ये फक्त एकदाच असते.';

  @override
  String get dominosaWinTitle => 'डोमिनो मास्टर!';

  @override
  String get dominosaWinMessage =>
      'प्रत्येक डोमिनो सापडला आहे आणि ठेवला गेला आहे!';

  @override
  String get skyscrapersTitle => 'स्कायस्क्रेपर्स';

  @override
  String get skyscrapersSubtitle => 'ग्रिड इमारतींच्या उंचीने भरा.';

  @override
  String get skyscrapersHowToPlay =>
      'ग्रिड उंचीने (1-N) भरा जेणेकरणून प्रत्येक पंक्ती आणि स्तंभात प्रत्येक उंची तंतोतंत एकदा येईल. कडांवरील संकेत त्या दिशेने किती इमारती दिसतात हे दर्शवतात, उंच इमारती लहान इमारतींना अडवतात.';

  @override
  String get skyscrapersWinTitle => 'स्कायलाईन पुनर्संचयित!';

  @override
  String get skyscrapersWinMessage => 'सर्व इमारती उत्तम स्थितीत आहेत!';

  @override
  String get nurikabeTitle => 'नुरिकाबे';

  @override
  String get nurikabeSubtitle => 'जोडलेला समुद्र आणि वेगळी बेटे तयार करा.';

  @override
  String get nurikabeHowToPlay =>
      'एक जोडलेला \'समुद्र\' (२x२ ब्लॉक नाही) तयार करण्यासाठी सेल्स शेड करा. शेड न केलेले सेल्स \'बेटे\' तयार करतात, ज्यामध्ये प्रत्येकी तंतोतंत एक संख्या असते जी त्याच्या एकूण क्षेत्राचे प्रतिनिधित्व करते.';

  @override
  String get nurikabeWinTitle => 'समुद्र प्रवाहित!';

  @override
  String get nurikabeWinMessage => 'बेटे वेगळी झाली, समुद्र जोडला गेला!';

  @override
  String get fillominoTitle => 'फिलोमिनो';

  @override
  String get fillominoSubtitle =>
      'ग्रिडला विशिष्ट आकाराच्या पॉलिमिनोमध्ये विभागून घ्या.';

  @override
  String get fillominoHowToPlay =>
      'ग्रिडला पॉलिमिनोमध्ये विभागून घ्या जेणेकरून N आकाराच्या प्रत्येक पॉलिमिनोमध्ये त्याच्या सर्व सेल्समध्ये N संख्या असेल. समान आकाराचे पॉलिमिनो एकमेकांच्या शेजारी असू शकत नाहीत.';

  @override
  String get fillominoWinTitle => 'ग्रिड विभागले गेले!';

  @override
  String get fillominoWinMessage => 'लॉजिकसह उत्तम प्रकारे मांडलेले!';

  @override
  String get hitoriTitle => 'हितोरी';

  @override
  String get hitoriSubtitle =>
      'प्रत्येक पंक्ती आणि स्तंभातील डुप्लिकेट संख्या शेड करा.';

  @override
  String get hitoriHowToPlay =>
      'सेल्स शेड करा जेणेकरून कोणतीही संख्या कोणतीही पंक्ती किंवा स्तंभात एकापेक्षा जास्त वेळा येणार नाही. शेड केलेले सेल्स शेजारी (उभे किंवा आडवे) असू शकत नाहीत आणि सर्व शेड न केलेल्या सेल्सनी एक जोडलेला गट तयार केला पाहिजे.';

  @override
  String get hitoriWinTitle => 'हितोरी मास्टर!';

  @override
  String get hitoriWinMessage =>
      'तुम्ही सर्व डुप्लिकेट्स यशस्वीरित्या सोडवले आहेत!';

  @override
  String get pathFinderTitle => 'पाथ फाइंडर';

  @override
  String get pathFinderSubtitle => 'S पासून E पर्यंत लपलेला मार्ग शोधा.';

  @override
  String get pathFinderWin => 'मार्गात प्रभुत्व मिळवले!';

  @override
  String get howToPlay => 'कसे खेळायचे';

  @override
  String get gotIt => 'समजले';

  @override
  String get akariTitle => 'अकारी';

  @override
  String get akariSubtitle => 'सर्व पांढऱ्या पेशी प्रकाशित करा';

  @override
  String get akariHowToPlay =>
      'संपूर्ण ग्रिड प्रकाशित करण्यासाठी पांढऱ्या पेशींमध्ये लाइटबल्ब ठेवा. बल्ब भिंतीला धडकेपर्यंत त्यांच्या रांगेत आणि स्तंभात प्रकाश देतात. दोन बल्ब एकमेकांवर प्रकाश टाकू शकत नाहीत. क्रमांकित भिंती शेजारील पेशींमध्ये (वर, खाली, डावीकडे, उजवीकडे) किती बल्ब ठेवले पाहिजेत हे दर्शवतात.';

  @override
  String get akariWinTitle => 'प्रकाश लागला!';

  @override
  String get akariWinMessage => 'सर्व काही उत्तम प्रकारे प्रकाशित झाले आहे.';

  @override
  String get arithmeticChainTitle => 'चेन कॅल्क';

  @override
  String get arithmeticChainSubtitle =>
      'तुमच्या मनात चालू असलेल्या बेरजेची गणना करा';

  @override
  String get arithmeticChainWinTitle => 'लेव्हल अप!';

  @override
  String get arithmeticChainWinMessage => 'तुमची मानसिक गणना तीव्र आहे!';

  @override
  String get arithmeticChainLoseTitle => 'पुन्हा प्रयत्न करा';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return 'योग्य उत्तर $answer होते.';
  }

  @override
  String get arithmeticChainStart => 'सुरू करा';

  @override
  String get arithmeticChainNext => 'पुढील';

  @override
  String get attentionalBlinkTitle => 'अटेंशनल ब्लिंक';

  @override
  String get attentionalBlinkSubtitleWatch => 'संख्येवर लक्ष ठेवा';

  @override
  String get attentionalBlinkSubtitleInput =>
      'तुम्ही पाहिलेल्या दोन संख्या प्रविष्ट करा';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return 'तुम्ही $score लक्ष्ये मिळवली आहेत!';
  }

  @override
  String get balanceScaleTitle => 'बॅलन्स स्केल';

  @override
  String get balanceScaleSubtitle =>
      'तराजूच्या आधारे शेवटच्या वस्तूचे वजन ओळखा.';

  @override
  String get balanceScaleWinTitle => 'संतुलित!';

  @override
  String get balanceScaleWinMessage => 'तुम्ही वजन अचूक ओळखले!';

  @override
  String get balanceScaleLoseTitle => 'असंतुलित';

  @override
  String get balanceScaleLoseMessage =>
      'योग्य संतुलन शोधण्यासाठी पुन्हा प्रयत्न करा.';

  @override
  String get balanceScaleBack => 'परत';

  @override
  String get balanceScaleSubmit => 'सबमिट';

  @override
  String get binaryPuzzleTitle => 'बायनरी पझल';

  @override
  String get binaryPuzzleSubtitle =>
      '0 आणि 1 ने भरा. सलग दोनपेक्षा जास्त समान अंक नकोत. प्रत्येक रांगेत आणि स्तंभात 0 आणि 1 ची संख्या समान असावी.';

  @override
  String get binaryPuzzleWinTitle => 'छान केले';

  @override
  String get binaryPuzzleWinMessage => 'तुम्ही बायनरी पझल अचूक तर्काने सोडवले!';

  @override
  String get blockEscapeTitle => 'ब्लॉक एस्केप';

  @override
  String get blockEscapeSubtitle =>
      'मुख्य ब्लॉकला बाहेर पडण्यासाठी मार्ग मोकळा करण्यासाठी ब्लॉक सरकवा.';

  @override
  String get blockEscapeWinTitle => 'सुटका!';

  @override
  String get blockEscapeWinMessage =>
      'तुम्ही मुख्य ब्लॉकसाठी मार्ग यशस्वीरित्या मोकळा केला!';

  @override
  String get boxCompletionTitle => 'बॉक्स पूर्ण करणे';

  @override
  String get boxCompletionSubtitle => 'कोणता घन तयार होऊ शकतो?';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return 'तुम्ही $totalTrials पैकी $score अचूक मिळवले आहेत!';
  }

  @override
  String get boxCompletionOptions => 'पर्याय';

  @override
  String get bridgesTitle => 'ब्रिजेस';

  @override
  String get bridgesSubtitle =>
      'पुल बांधून बेटे जोडा. प्रत्येक बेटाला ठराविक संख्येने पूल हवे असतात. पूल एकमेकांना ओलांडू शकत नाहीत.';

  @override
  String get bridgesWinTitle => 'जोडले गेले!';

  @override
  String get bridgesWinMessage => 'तुम्ही सर्व बेटे यशस्वीरित्या जोडली आहेत!';

  @override
  String get calculationSprintTitle => 'कॅल्क्युलेशन स्प्रिंट';

  @override
  String get calculationSprintSubtitle =>
      '60 सेकंदात शक्य तितकी समीकरणे सोडवा.';

  @override
  String get calculationSprintGoalReached => 'लक्ष्य गाठले!';

  @override
  String get calculationSprintTimeUp => 'वेळ संपली';

  @override
  String calculationSprintScoreMessage(int score) {
    return 'उत्कृष्ट गणना वेग! तुम्ही $score गुण मिळवले.';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return 'तुम्ही $score गुण मिळवले. तुमचे सर्वोत्तम रेकॉर्ड मोडण्याचा प्रयत्न करा!';
  }

  @override
  String get calculationSprintBest => 'सर्वोत्तम';

  @override
  String get calculationSprintSeconds => '60 सेकंद';

  @override
  String get calculationSprintDescription =>
      'समीकरणे वेगाने सोडवा.\nचुकीच्या उत्तरासाठी 3 सेकंद कापले जातील!';

  @override
  String get calculationSprintStart => 'स्प्रिंट सुरू करा';

  @override
  String get categoryFluencyTitle => 'कॅटेगरी फ्लुएंसी';

  @override
  String get categoryFluencySubtitle => 'वर्गाशी संबंधित वस्तू प्रविष्ट करा';

  @override
  String get categoryFluencyExpert => 'फ्लुएंसी तज्ञ!';

  @override
  String get categoryFluencyTimeUp => 'वेळ संपली!';

  @override
  String get categoryFluencyWinMessage => 'तुमचा शब्दसंग्रह अफाट आहे!';

  @override
  String categoryFluencyFoundMessage(int count) {
    return 'तुम्हाला $count शब्द सापडले.';
  }

  @override
  String get categoryFluencyCategoryLabel => 'वर्ग:';

  @override
  String get categoryFluencyEnterItem => 'वस्तू प्रविष्ट करा...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target शब्द';
  }

  @override
  String get changeBlindnessTitle => 'चेंज ब्लाइंडनेस';

  @override
  String get changeBlindnessSubtitle => 'बदलणारी वस्तू ओळखा';

  @override
  String changeBlindnessScore(int score) {
    return 'स्कोअर: $score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return 'तुम्हाला $score बदल सापडले!';
  }

  @override
  String get choiceRtTitle => 'चॉइस RT';

  @override
  String get choiceRtSubtitle => 'सक्रिय चौकोनावर शक्य तितक्या वेगाने टॅप करा';

  @override
  String choiceRtAvgMessage(String avg) {
    return 'तुमची सरासरी प्रतिसाद वेळ: ${avg}ms';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return 'उरलेला वेळ: ${time}s';
  }

  @override
  String choiceRtTaps(int count) {
    return 'टॅप्स: $count';
  }

  @override
  String get colorFloodTitle => 'कलर फ्लड';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return 'चाली: $moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => 'फ्लड यशस्वी!';

  @override
  String get colorFloodDryLand => 'कोरडी जमीन...';

  @override
  String get colorFloodWinMessage => 'तुम्ही संपूर्ण ग्रिड रंगाने भरला आहे!';

  @override
  String get colorFloodLoseMessage =>
      'तुमच्या चाली संपल्या. पुन्हा प्रयत्न करा!';

  @override
  String get colorMatchTitle => 'कलर मॅच';

  @override
  String get colorMatchSubtitle =>
      'लक्ष्य रंगाशी शक्य तितक्या जवळून जुळण्यासाठी स्लाइडर समायोजित करा.';

  @override
  String get colorMatchTarget => 'लक्ष्य';

  @override
  String get colorMatchYours => 'तुमचा';

  @override
  String get colorMatchCheck => 'मॅच तपासा';

  @override
  String get colorMatchResult => 'मॅच निकाल';

  @override
  String colorMatchAccuracy(String accuracy) {
    return 'तुमची अचूकता: $accuracy%';
  }

  @override
  String get corsiBlocksTitle => 'कोर्सी ब्लॉक्स';

  @override
  String get corsiBlocksSubtitle =>
      'ब्लॉक्स उजळताना पहा आणि त्याच क्रमाने त्यांना टॅप करा.';

  @override
  String get corsiBlocksWinTitle => 'स्थानिक मास्टर!';

  @override
  String get corsiBlocksLoseTitle => 'अवकाशात हरवले';

  @override
  String corsiBlocksMessage(int score, int span) {
    return 'तुम्ही $score क्रम लक्षात ठेवले! तुमची स्थानिक स्मरणशक्ती $span पर्यंत पोहोचली.';
  }

  @override
  String get corsiBlocksWatch => 'पॅटर्न पहा';

  @override
  String get corsiBlocksRepeat => 'पॅटर्नची पुनरावृत्ती करा';

  @override
  String get corsiBlocksExcellent => 'उत्कृष्ट!';

  @override
  String get corsiBlocksSpan => 'मर्यादा';

  @override
  String get crownTitle => 'क्राउन';

  @override
  String get crownSubtitle =>
      'प्रत्येक रांग, स्तंभ आणि रंगाच्या प्रदेशात एक मुकुट ठेवा. मुकुट शेजारी नसावेत, अगदी तिरकसपणेही नाही.';

  @override
  String get crownCrowned => 'मुकुट घातला!';

  @override
  String get crownSuccess => 'अचूक तर्काने सर्व मुकुट यशस्वीरित्या ठेवले गेले.';

  @override
  String get cryptogramTitle => 'क्रिप्टोग्राम';

  @override
  String get cryptogramSubtitle =>
      'गुप्त संदेशाचा उलगडा करण्यासाठी अक्षरे नियुक्त करा! प्रत्येक एन्कोड केलेले अक्षर एका वास्तविक अक्षराचे प्रतिनिधित्व करते.';

  @override
  String get cryptogramBroken => 'कोड उलगडला!';

  @override
  String get cryptogramEncrypted => 'एन्क्रिप्टेड';

  @override
  String get cryptogramSuccess => 'तुम्ही संदेशाचा अचूक उलगडा केला.';

  @override
  String get cryptogramTryAgain =>
      'एन्क्रिप्शन तोडण्यासाठी पुन्हा प्रयत्न करा.';

  @override
  String get digitSpanReverseTitle => 'रिव्हर्स स्पॅन';

  @override
  String get digitSpanReverseSubtitleMemorize => 'अंक लक्षात ठेवा';

  @override
  String get digitSpanReverseSubtitleEnter => 'उलट क्रमाने अंक प्रविष्ट करा';

  @override
  String get digitSpanReverseWinTitle => 'लेव्हल अप!';

  @override
  String get digitSpanReverseWinMessage => 'तुमची वर्किंग मेमरी प्रभावी आहे!';

  @override
  String get digitSpanReverseLoseTitle => 'पुन्हा प्रयत्न करा';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return 'योग्य उलट क्रम $sequence होता.';
  }

  @override
  String get dividedAttentionTitle => 'विभाजित एकाग्रता';

  @override
  String get dividedAttentionSubtitle =>
      'तारा ⭐ साठी डावीकडे टॅप करा | लाल 🔴 साठी उजवीकडे टॅप करा';

  @override
  String get dividedAttentionGameOverTitle => 'एकाग्रता भंग';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return 'मल्टीटास्किंग कठीण आहे! तुमचा स्कोअर $score होता.';
  }

  @override
  String dividedAttentionScore(int score) {
    return 'स्कोअर: $score';
  }

  @override
  String get doubleNBackTitle => 'डबल एन-बॅक';

  @override
  String doubleNBackSubtitle(int n) {
    return '$n पावले आधीच्या उत्तेजनाशी जुळवा';
  }

  @override
  String get doubleNBackGameOverTitle => 'खेळ संपला';

  @override
  String doubleNBackGameOverMessage(int score) {
    return 'तुम्ही डबल एन-बॅक मध्ये $score गुण मिळवले!';
  }

  @override
  String doubleNBackScore(int score) {
    return 'स्कोअर: $score';
  }

  @override
  String get doubleNBackPositionMatch => 'स्थान मॅच';

  @override
  String get doubleNBackLetterMatch => 'अक्षर मॅच';

  @override
  String get faceNameAssociationTitle => 'चेहरा-नाव';

  @override
  String get faceNameAssociationSubtitleStudy =>
      'प्रत्येक चेहऱ्यासाठी नाव लक्षात ठेवा';

  @override
  String get faceNameAssociationSubtitleTest => 'हे कोण आहे?';

  @override
  String get faceNameAssociationPerfect => 'परिपूर्ण!';

  @override
  String get faceNameAssociationGameOver => 'खेळ संपला';

  @override
  String get faceNameAssociationWinMessage =>
      'तुमची चेहरे आणि नावे लक्षात ठेवण्याची स्मरणशक्ती उत्तम आहे!';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return 'तुम्ही $total पैकी $correct अचूक मिळवले.';
  }

  @override
  String get faceNameAssociationStartTest => 'चाचणी सुरू करा';

  @override
  String get flankerTestWinTitle => 'लेझर फोकस!';

  @override
  String get flankerTestLoseTitle => 'एकाग्रता विचलित';

  @override
  String flankerTestScoreMessage(int score) {
    return 'तुम्ही $score अचूक मिळवले!';
  }

  @override
  String get flankerTestTitle => 'फ्लँकर टेस्ट';

  @override
  String get flankerTestSubtitle =>
      'बाजूच्या बाणांकडे दुर्लक्ष करून मधल्या बाणाची दिशा दर्शवा.';

  @override
  String get flankerTestLeft => 'डावे';

  @override
  String get flankerTestRight => 'उजवे';

  @override
  String get fractionMatchTitle => 'अपूर्णांक मॅच';

  @override
  String get fractionMatchSubtitle => 'चित्राला त्याच्या अपूर्णांकाशी जुळवा';

  @override
  String get fractionMatchLoseTitle => 'अपूर्णांक जुळत नाही';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return 'योग्य उत्तर $correctAnswer होते.';
  }

  @override
  String get goNoGoTitle => 'गो / नो-गो';

  @override
  String get goNoGoSubtitle => 'हिरव्यासाठी टॅप करा, लालकडे दुर्लक्ष करा!';

  @override
  String get goNoGoLoseTitle => 'प्रतिसाद थांबला';

  @override
  String get goNoGoLoseMessage =>
      'तुमच्या निरोधक नियंत्रणाची चाचणी घेतली जात आहे!';

  @override
  String get goNoGoTapAnywhere => 'सुरू करण्यासाठी कुठेही टॅप करा';

  @override
  String get groceryListTitle => 'किराणा यादी';

  @override
  String get groceryListSubtitleMemorize =>
      'वस्तू आणि त्यांचे वर्ग लक्षात ठेवा';

  @override
  String get groceryListSubtitleTest => 'ही वस्तू कोणत्या वर्गातील होती?';

  @override
  String get groceryListWinTitle => 'ग्रोसरी गुरु!';

  @override
  String get groceryListLoseTitle => 'काही विसरलात का?';

  @override
  String groceryListScoreMessage(int score) {
    return 'तुम्ही किराणा यादीमध्ये $score गुण मिळवले!';
  }

  @override
  String get groceryListReady => 'मी तयार आहे';

  @override
  String get groceryListWhereBelong => 'हे कुठे असावे?';

  @override
  String get hueSortTitle => 'ह्यू सॉर्ट';

  @override
  String get hueSortSubtitle =>
      'कोपऱ्यातील रंगांमध्ये सुरळीत संक्रमण तयार करण्यासाठी टाइल्स बदला. ठिपके स्थिर टाइल्स दर्शवतात.';

  @override
  String get hueSortWinTitle => 'परिपूर्ण ग्रेडियंट!';

  @override
  String get hueSortWinMessage =>
      'तुम्ही रंग स्पेक्ट्रम उत्तम प्रकारे क्रमवारी लावला आहे!';

  @override
  String hueSortWrongTiles(int count) {
    return 'चुकीच्या ठिकाणी असलेल्या टाइल्स: $count';
  }

  @override
  String get kenkenTitle => 'केनकेन';

  @override
  String get kenkenWinTitle => 'अलौकिक बुद्धिमत्ता!';

  @override
  String get kenkenLoseTitle => 'खेळ संपला';

  @override
  String get kenkenWinMessage => 'तुम्ही केनकेन पझल सोडवले आहे!';

  @override
  String get kenkenLoseMessage => 'रांग/स्तंभ आणि पिंजऱ्याचे नियम तपासा.';

  @override
  String kenkenSubtitle(int size) {
    return 'रांग/स्तंभात पुनरावृत्ती न करता 1-$size भरा';
  }

  @override
  String get letterCancellationTitle => 'अक्षर रद्द करणे';

  @override
  String get letterCancellationTitleFull => 'अक्षर रद्द करण्याची चाचणी';

  @override
  String letterCancellationScoreMessage(int score) {
    return 'तुम्हाला $score अक्षरे सापडली!';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return 'सर्व \"$target\" अक्षरे शोधा';
  }

  @override
  String get letterCancellationFound => 'सापडले';

  @override
  String get letterCancellationTime => 'वेळ';

  @override
  String get lightsOutTitle => 'लाइट्स आऊट';

  @override
  String get lightsOutSubtitle =>
      'टाइल टॅप केल्याने ती आणि तिच्या शेजारील टाइल्स टॉगल होतात. सोडवण्यासाठी सर्व दिवे बंद करा.';

  @override
  String get lightsOutWinTitle => 'पझल सोडवले!';

  @override
  String get lightsOutWinMessage =>
      'तुम्ही यशस्वीरित्या सर्व दिवे बंद केले आहेत!';

  @override
  String get symmetryTitle => 'सममिती';

  @override
  String get symmetrySubtitle =>
      'डावीकडील पॅटर्न उजवीकडील रिकाम्या ग्रिडवर मिरर करा.';

  @override
  String get semanticLinkTitle => 'सिमेंटिक लिंक';

  @override
  String get semanticLinkSubtitle => 'तिन्हींना जोडणारा शब्द शोधा';

  @override
  String get reflexTapTitle => 'रिफ्लेक्स टॅप';

  @override
  String get visualStatisticalLearningTitle => 'खेळ संपला';

  @override
  String get orbitTapTitle => 'ऑर्बिट टॅप';

  @override
  String get orbitTapSubtitle => 'जेव्हा गोळे गेटशी जुळतील तेव्हा टॅप करा';

  @override
  String get schulteTableTitle => 'उत्तम एकाग्रता!';

  @override
  String get multipleObjectTrackingTitle => 'ऑब्जेक्ट ट्रॅकर';

  @override
  String get multipleObjectTrackingSubtitle =>
      'हायलाइट केलेल्या वस्तूंवर लक्ष ठेवा. त्या हलताना त्यांचा मागोवा घ्या, मग त्यांना निवडा.';

  @override
  String get sdmtTitle => 'Sdmt चाचणी';

  @override
  String get sdmtSubtitle =>
      'दाखवलेल्या चिन्हासाठी अंक शोधण्यासाठी वरील की वापरा.';

  @override
  String get memoryMatrixTitle => 'लक्ष्य गाठले!';

  @override
  String get memoryMatrixSubtitle => 'पॅटर्न लक्षात ठेवा आणि टाइल्स टॅप करा.';

  @override
  String get mentalAbacusTitle => 'अॅबॅकस मास्टर!';

  @override
  String get mentalAbacusSubtitle => 'सोरोबन वापरून सोडवा';

  @override
  String get spellingSprintTitle => 'स्पेलिंग स्प्रिंट';

  @override
  String get spellingSprintSubtitle =>
      'शक्य तितक्या शब्दांचे स्पेलिंग वेगाने सांगा.';

  @override
  String get stopSignalTitle => 'स्टॉप सिग्नल';

  @override
  String get stopSignalSubtitle =>
      'बाणाच्या दिशेने टॅप करा, पण बाण लाल झाल्यास लगेच थांबा.';

  @override
  String get staircaseMemoryTitle => 'स्टेअरकेस मेमरी';

  @override
  String get vigilanceTaskTitle => 'सतर्कता कार्य';

  @override
  String get vigilanceTaskSubtitle =>
      'जेव्हा काटा एखादे स्थान सोडून जातो तेव्हा बटण टॅप करा';

  @override
  String get logicalSyllogismsTitle => 'तार्किक अनुमान';

  @override
  String get logicalSyllogismsSubtitle =>
      'निष्कर्ष तार्किकदृष्ट्या वैध आहे का?';

  @override
  String get mathPathTitle => 'मॅथ पाथ';

  @override
  String get mathPathSubtitle =>
      'असा मार्ग शोधा ज्याची बेरीज बरोबर लक्ष्य बेरजेइतकी असेल.';

  @override
  String get sternbergTaskTitle => 'स्टर्नबर्ग टास्क';

  @override
  String get sternbergTaskMemorize => 'अक्षरे लक्षात ठेवा';

  @override
  String get sternbergTaskWasLetterSet => 'हे अक्षर संचात होते का?';

  @override
  String sternbergTaskScore(int score) {
    return 'तुम्ही स्टर्नबर्ग टास्कमध्ये $score गुण मिळवले!';
  }

  @override
  String get verbalAnalogiesTitle => 'अॅनालॉजी मास्टर!';

  @override
  String get verbalAnalogiesSubtitle => 'संबंध पूर्ण करा';

  @override
  String get typingSpeedTitle => 'टायपिंग वेग';

  @override
  String get typingSpeedSubtitle =>
      'दाखवलेला वाक्प्रचार शक्य तितक्या वेगाने तंतोतंत टाइप करा!';

  @override
  String get wordLadderTitle => 'शब्द शिडी';

  @override
  String get wordLadderSubtitle => 'एक वेळी एक अक्षर बदलून शब्द जोडा.';

  @override
  String get tangleFixTitle => 'सुटले!';

  @override
  String get tangleFixSubtitle =>
      'ओळी अशा प्रकारे सोडवा की त्या एकमेकांना छेदणार नाहीत';

  @override
  String get oddRotationTitle => 'विषम रोटेशन';

  @override
  String get oddRotationSubtitle =>
      'यातील एक मिरर इमेज आहे. तुम्ही ती शोधू शकता का?';

  @override
  String get towerOfLondonTitle => 'टावर ऑफ लंडन';

  @override
  String get towerOfLondonSubtitle => 'लक्ष्य संरचनेशी जुळवा';

  @override
  String get symbolicFlankerTitle => 'सिम्बॉलिक फ्लँकर';

  @override
  String get symbolicFlankerSubtitle => 'मधल्या चिन्हावर लक्ष केंद्रित करा';

  @override
  String get stroopTestTitle => 'स्ट्रूप टेस्ट';

  @override
  String get stroopTestSubtitle =>
      'दाखवलेल्या शब्दाचा शाईचा रंग ओळखा. शब्दाच्या प्रत्यक्ष अर्थाकडे दुर्लक्ष करा!';

  @override
  String get wisconsinCardSortingTitle => 'खेळ संपला';

  @override
  String get wisconsinCardSortingSubtitle =>
      'वरील चारपैकी एका कार्डाशी कार्ड जुळवा';

  @override
  String get nBackTitle => 'एन-बॅक टेस्ट';

  @override
  String get nBackSubtitle =>
      'जर सध्याचे अक्षर 2 पावले आधी दाखवलेल्या अक्षराशी जुळत असेल तर MATCH टॅप करा.';

  @override
  String get rhythmMasterTitle => 'रिदम मास्टर';

  @override
  String get rhythmMasterSubtitle => 'नाडीच्या तालात टॅप करा';

  @override
  String get pixelMimicTitle => 'पिक्सेल मिमिक';

  @override
  String get targetNumberTitle => 'टारगेट 24';

  @override
  String targetNumberSubtitle(int target) {
    return '$target पर्यंत पोहोचण्यासाठी सर्व 4 संख्या वापरा';
  }

  @override
  String get mirrorTracingTitle => 'उत्कृष्ट ट्रेसिंग!';

  @override
  String get mirrorTracingSubtitle =>
      'ताऱ्याचा मागोवा घ्या! नियंत्रणे उलटी (मिरर) आहेत.';

  @override
  String get wordSurgeTitle => 'वर्ड सर्ज';

  @override
  String get wordSurgeSubtitle => 'समानार्थी आणि विरुद्धार्थी शब्द';

  @override
  String get perspectiveTakingTitle => 'दृष्टिकोन घेणे';

  @override
  String get perspectiveTakingTopDownView => 'वरचा दृष्टिकोन';

  @override
  String get perspectiveTakingChoosePerspective => 'दृष्टिकोन निवडा';

  @override
  String get perspectiveTakingCongrats =>
      'तुमची स्थानिक संबंधांसाठी तीव्र नजर आहे.';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return '$targetDirName कडून कोणता दृष्टिकोन आहे?';
  }

  @override
  String get paperFoldingTitle => 'अनफोल्डेड परफेक्शन!';

  @override
  String get paperFoldingSubtitle => 'उघडल्यावर ते कसे दिसेल?';

  @override
  String get waterSortTitle => 'छान केले!';

  @override
  String get waterSortSubtitle =>
      'रंग अशा प्रकारे लावा की प्रत्येक ट्यूबमध्ये फक्त एकच रंग असेल.';

  @override
  String get numericalEstimationTitle => 'संख्यात्मक अंदाज';

  @override
  String get numericalEstimationSubtitle => 'जवळपासचे उत्तर वेगाने निवडा!';

  @override
  String get lockPatternTitle => 'लॉक पॅटर्न';

  @override
  String get lockPatternSubtitle =>
      'गुप्त पॅटर्न शोधा. प्रत्येक अंदाज स्थान आणि ठिपक्यांवर फीडबॅक देतो.';

  @override
  String get primeHunterTitle => 'प्राइम हंटर';

  @override
  String get primeHunterSubtitle =>
      'मूळ संख्येसाठी डावीकडे स्वाइप करा | संयुक्त संख्येसाठी उजवीकडे स्वाइप करा';

  @override
  String get tracePathTitle => 'ट्रेस पाथ';

  @override
  String get tracePathSubtitle =>
      'लक्ष्य मार्गाचा शक्य तितक्या जवळून पाठपुरावा करा';

  @override
  String get ruleSwitcherTitle => 'रुल स्विचर';

  @override
  String get ruleSwitcherSubtitle => 'सध्याचा नियम लागू करा';

  @override
  String get choiceReactionTimeTitle => 'चॉइस रिअॅक्शन टाइम';

  @override
  String get pathRecallTitle => 'पाथ रिकॉल';

  @override
  String get switchTaskTitle => 'स्विच टास्क';

  @override
  String get switchTaskSubtitle =>
      'नियमाकडे लक्ष द्या! ते आकार जुळवणे आणि रंग जुळवणे यांच्यात बदलेल.';

  @override
  String get mentalRotationTitle => 'मानसिक फिरवणे';

  @override
  String get mentalRotationSubtitle => 'हे आकार सारखेच आहेत का, फक्त फिरवलेले?';

  @override
  String get missingOperatorTitle => 'ऑपरेटर मिक्स';

  @override
  String get missingOperatorSubtitle =>
      'समीकरण पूर्ण करण्यासाठी रिकाम्या जागा भरा';

  @override
  String get wordMastermindTitle => 'वर्ड मास्टरमाइंड';

  @override
  String get wordMastermindSubtitle =>
      '4-अक्षरी कोड फोडा! बुल्स (B) म्हणजे अचूक स्थान, काऊज (C) म्हणजे चुकीचे स्थान.';

  @override
  String get simonSequenceTitle => 'अनुक्रम';

  @override
  String get symbolLogicTitle => 'चिन्ह तर्कशास्त्र';

  @override
  String get symbolLogicSubtitle =>
      'प्रत्येक चिन्हाचे मूल्य शोधण्यासाठी व्हिज्युअल समीकरणे सोडवा. शेवटच्या समीकरणाचा निकाल काय आहे?';

  @override
  String get silhouetteMatchTitle => 'जुळले!';

  @override
  String get silhouetteMatchSubtitle => 'या वस्तूशी कोणती सावली जुळते?';

  @override
  String get operationSpanTitle => 'ऑपरेशन स्पॅन';

  @override
  String get operationSpanMathPhase => 'समीकरण बरोबर आहे का?';

  @override
  String get operationSpanLetterPhase => 'अक्षर लक्षात ठेवा';

  @override
  String get operationSpanRecallPhase => 'क्रमाने अक्षरे आठवा';

  @override
  String get operationSpanRoundComplete => 'फेरी पूर्ण!';

  @override
  String operationSpanScore(int score) {
    return 'तुम्ही ऑपरेशन स्पॅनमध्ये $score गुण मिळवले!';
  }

  @override
  String get slidePuzzleTitle => 'स्लाइड पझल';

  @override
  String get slidePuzzleNewGame => 'नवीन खेळ';

  @override
  String get slidePuzzleInstructions =>
      'टाइल्स रिकाम्या जागेत सरकवून संख्यात्मक क्रमाने लावा.';

  @override
  String get slidePuzzleTileSlider => 'टाइल स्लाइडर';

  @override
  String get slidePuzzleCongrats =>
      'तुम्ही सर्व टाइल्स यशस्वीरित्या लावले आहेत.';

  @override
  String get visualSearchTitle => 'व्हिज्युअल शोध';

  @override
  String get visualSearchSubtitle => 'ग्रिडमध्ये एकमेव चिन्ह शोधा';

  @override
  String get trailMakingTitle => 'ट्रेल मेकिंग';

  @override
  String get trailMakingSubtitle =>
      'शक्य तितक्या वेगाने क्रमाने (1 -> 2 -> 3...) संख्या जोडा.';

  @override
  String get matrixReasoningTitle => 'मॅट्रिक्स रिझनिंग';

  @override
  String get matrixReasoningSubtitle => '3x3 ग्रिडमधील पॅटर्न पूर्ण करा';

  @override
  String get tentsAndTreesTitle => 'तंबू आणि झाडे';

  @override
  String get tentsAndTreesSubtitle =>
      'झाडांच्या शेजारी तंबू लावा. संख्या प्रत्येक रांगेत/स्तंभात किती तंबू आहेत हे दर्शवतात. तंबू एकमेकांना स्पर्श करू शकत नाहीत.';

  @override
  String get quickMathTitle => 'क्विक मॅथ';

  @override
  String get magicSquaresTitle => 'मॅजिक स्क्वेअर';

  @override
  String magicSquaresSubtitle(int targetSum) {
    return 'प्रत्येक रांग, स्तंभ आणि कर्णाची बेरीज $targetSum असावी';
  }

  @override
  String get objectShuffleTitle => 'ऑब्जेक्ट शफल';

  @override
  String get pipesTitle => 'पाईप्स';

  @override
  String get pipesSubtitle => 'जुळणारे रंगीत ठिपके पाईपने जोडा.';

  @override
  String get oddOneOutTitle => 'वेगळे ओळखा';

  @override
  String get oddOneOutSubtitle => 'वेगळ्या रंगाची टाइल शोधा.';

  @override
  String get einsteinRiddleTitle => 'आईन्स्टाईन रिडल';

  @override
  String get einsteinRiddleSubtitle =>
      'प्रत्येक घराची वैशिष्ट्ये ओळखण्यासाठी संकेत वापरा.';

  @override
  String get einsteinRiddleHowToPlay =>
      'प्रत्येक घराची वैशिष्ट्ये (रंग, राष्ट्रीयत्व, पाळीव प्राणी इ.) वेगळी आहेत. ग्रिड भरण्यासाठी आणि पूर्ण उपाय शोधण्यासाठी दिलेले संकेत वापरा.';

  @override
  String get einsteinRiddleColor => 'रंग';

  @override
  String get einsteinRiddleNationality => 'राष्ट्रीयत्व';

  @override
  String get einsteinRiddleDrink => 'पेय';

  @override
  String get einsteinRiddlePet => 'पाळीव प्राणी';

  @override
  String get einsteinRiddleSmoke => 'धूम्रपान';

  @override
  String get einsteinRiddleHouse => 'घर';

  @override
  String get mirrorImageTitle => 'मिरर इमेज';

  @override
  String get mirrorImageSubtitle => 'योग्य आरशातील प्रतिबिंब ओळखा.';

  @override
  String get mirrorImageHowToPlay =>
      'आकार पहा आणि दिलेल्या पर्यायांतून त्याचे योग्य आरशातील प्रतिबिंब निवडा.';

  @override
  String get mentalMappingTitle => 'मानसिक मॅपिंग';

  @override
  String get mentalMappingSubtitle => 'दिशांचे पालन करा आणि गंतव्यस्थान शोधा.';

  @override
  String get mentalMappingHowToPlay =>
      'तुम्हाला दिशांचा एक क्रम (उत्तर, दक्षिण, पूर्व, पश्चिम) दाखवला जाईल. ग्रिडच्या मध्यभागापासून सुरू होणाऱ्या या चरणांचे मानसिकरित्या पालन करा आणि अंतिम गंतव्यस्थान निवडा.';

  @override
  String get memoryPalaceTitle => 'मेमरी पॅलेस';

  @override
  String get memoryPalaceSubtitle =>
      'कोणता शब्द कोणत्या ठिकाणी होता ते लक्षात ठेवा.';

  @override
  String get memoryPalaceHowToPlay =>
      'ग्रिडवर वेगवेगळ्या ठिकाणी शब्दांचा संच दिसेल. त्यांची ठिकाणे लक्षात ठेवा. त्यानंतर, तुम्हाला शब्द त्यांच्या मूळ ठिकाणी परत ठेवण्यास सांगितले जाईल.';

  @override
  String get countingSheepTitle => 'मेंढ्या मोजणे';

  @override
  String get countingSheepSubtitle => 'तुम्ही किती मेंढ्या पाहिल्या?';

  @override
  String get countingSheepHowToPlay =>
      'मेंढ्या स्क्रीनवरून वेगाने धावतील. त्या जाताना त्यांना मोजा आणि शेवटी एकूण संख्या प्रविष्ट करा.';

  @override
  String get faceTraitAssociationTitle => 'फेस-ट्रेट';

  @override
  String get faceTraitAssociationSubtitle =>
      'प्रत्येक चेहऱ्यासाठी वैशिष्ट्ये लक्षात ठेवा';

  @override
  String get faceTraitAssociationHowToPlay =>
      'तुम्हाला नाव, व्यवसाय आणि छंद असलेले अनेक चेहरे दाखवले जातील. हे संबंध लक्षात ठेवा. नंतर, तुम्हाला प्रत्येक चेहऱ्यासाठी विशिष्ट वैशिष्ट्ये आठवण्यास सांगितले जाईल.';

  @override
  String get mentalCalendarTitle => 'मानसिक कॅलेंडर';

  @override
  String get mentalCalendarSubtitle => 'आठवड्याचा दिवस ओळखा';

  @override
  String get mentalCalendarHowToPlay =>
      'एक यादृच्छिक तारीख दाखवली जाईल. ती आठवड्याच्या कोणत्या दिवशी येते हे ठरवण्यासाठी मानसिक गणना वापरा.';

  @override
  String get vocabularyBuilderTitle => 'व्होकॅब्युलरी बिल्डर';

  @override
  String get vocabularyBuilderSubtitle =>
      'वेळेच्या दबावाखाली समानार्थी आणि विरुद्धार्थी शब्द जुळवा.';

  @override
  String get vocabularyBuilderHowToPlay =>
      'तुम्हाला एक लक्ष्य शब्द आणि संबंध (समानार्थी किंवा विरुद्धार्थी) दाखवला जाईल. पर्यायांतून संबंधाशी जुळणारा योग्य शब्द निवडा. जलद व्हा, वेळ संपत आहे!';

  @override
  String get correct => 'बरोबर';

  @override
  String get incorrect => 'चूक';

  @override
  String get grammarPoliceTitle => 'ग्रामर पोलीस';

  @override
  String get grammarPoliceSubtitle =>
      'वाक्य व्याकरणदृष्ट्या बरोबर आहे की त्यात चुका आहेत हे ओळखा.';

  @override
  String get grammarPoliceHowToPlay =>
      'स्क्रीनच्या मध्यभागी एक वाक्य दिसेल. ते व्याकरणदृष्ट्या बरोबर आहे की त्यात चूक आहे हे ठरवा. जर ते ठीक असेल तर \'बरोबर\' वर टॅप करा, किंवा तुम्हाला चूक आढळल्यास \'चूक\' वर टॅप करा. तुमचे सर्व प्राण गमावू नका!';

  @override
  String get reverseStroopTitle => 'रिव्हर्स स्ट्रूप';

  @override
  String get reverseStroopSubtitle =>
      'स्ट्रूप टेस्टचा एक प्रकार जिथे लक्ष बदलले जाते.';

  @override
  String get reverseStroopHowToPlay =>
      'सूचनेकडे लक्ष द्या! जर ते \'TEXT\' म्हणत असेल, तर शब्दाचा अर्थ जुळवा. जर ते \'COLOR\' म्हणत असेल, तर शाईचा रंग जुळवा. तुमची एकाग्रता तपासण्यासाठी नियम वारंवार बदलतील.';

  @override
  String get game2048Instruction =>
      'विलीन करण्यासाठी कोणत्याही दिशेने स्वाइप करा';

  @override
  String get fibonacciMergeTitle => 'फिबोनाची मर्ज';

  @override
  String get fibonacciMergeSubtitle =>
      'सलग फिबोनाची संख्या (1, 1, 2, 3, 5, 8, 13...) विलीन करा.';

  @override
  String get sequenceSleuthTitle => 'सिक्वेन्स स्लीथ';

  @override
  String get sequenceSleuthSubtitle => 'गणितीय क्रमातील गहाळ संख्या शोधा.';

  @override
  String get divisibilityDashTitle => 'डिव्हिजिबिलिटी डॅश';

  @override
  String get divisibilityDashSubtitle =>
      'दिलेल्या संख्येसाठी सर्व एक-अंकी विभाजक (2-9) टॅप करा.';

  @override
  String get percentagePeakTitle => 'परसेंटेज पीक';

  @override
  String get percentagePeakSubtitle => 'मानसिक टक्केवारी गणना वेगाने सोडवा.';

  @override
  String get vennNumbersTitle => 'व्हेन नंबर्ज';

  @override
  String get vennNumbersSubtitle =>
      'संख्येचे योग्य व्हेन डायग्राम प्रदेशात वर्गीकरण करा.';

  @override
  String get commonDenominatorTitle => 'कॉमन डिनॉमिनेटर';

  @override
  String get commonDenominatorSubtitle =>
      'सर्वात मोठा सामायिक विभाजक किंवा सर्वात लहान सामायिक विभाज्य शोधा.';

  @override
  String get angleFinderTitle => 'अँगल फाइंडर';

  @override
  String get angleFinderSubtitle => 'भूमितीय समस्येतील गहाळ कोन ओळखा.';

  @override
  String get sumSnakeTitle => 'सम स्नेक';

  @override
  String get sumSnakeSubtitle =>
      'लक्ष्य बेरजेपर्यंत पोहोचण्यासाठी शेजारील संख्या जोडा.';

  @override
  String get baseShiftTitle => 'बेस शिफ्ट ब्लिट्झ';

  @override
  String get baseShiftSubtitle => 'दशांश मध्ये सोडवा';

  @override
  String get baseShiftDescription =>
      'समीकरण सोडवा आणि उत्तर दशांश (Base 10) मध्ये टाइप करा.';

  @override
  String get baseShiftEquation => 'समीकरण';

  @override
  String get baseShiftHint => 'दशांश निकाल प्रविष्ट करा...';

  @override
  String get baseShiftCorrect => 'बरोबर!';

  @override
  String get baseShiftIncorrect => 'चुकीचे!';

  @override
  String get baseShiftSubmit => 'सबमिट';

  @override
  String get baseShiftQuickGuide => 'क्विक गाइड:';

  @override
  String get baseShiftBinary => 'बायनरी (bin): बेस 2 (0, 1)';

  @override
  String get baseShiftHex => 'हेक्साडेसिमल (0x): बेस 16 (0-9, A-F)';

  @override
  String get baseShiftDecimal => 'दशांश (dec): बेस 10 (0-9)';

  @override
  String get baseShiftWinTitle => 'मॅथ विझार्ड!';

  @override
  String get baseShiftWinMessage =>
      'तुम्ही 5 बेस-शिफ्ट समीकरणे अचूक सोडवली आहेत!';

  @override
  String get blockCount3DTitle => 'ब्लॉक काउंट 3D';

  @override
  String get blockCount3DSubtitle =>
      'फिरवण्यासाठी ड्रॅग करा • लपलेले ब्लॉक मोजा';

  @override
  String get blockCount3DHowMany => 'किती ब्लॉक आहेत?';

  @override
  String get blockCount3DSubmitGuess => 'अंदाज सबमिट करा';

  @override
  String get blockCount3DNotQuite =>
      'अगदी बरोबर नाही! पुन्हा मोजण्यासाठी फिरवून पहा.';

  @override
  String get blockCount3DExcellent => 'उत्कृष्ट';

  @override
  String blockCount3DWinMessage(int count) {
    return 'तुम्ही सर्व $count ब्लॉक अचूक ओळखले आहेत!';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '1. ब्लॉक स्टॅक फिरवण्यासाठी तुमची बोट 3D व्ह्यूपोर्टवर ड्रॅग करा.\n\n2. स्टॅकमधील सर्व ब्लॉक मोजा.\n\n3. लक्षात ठेवा: हवेत असलेल्या ब्लॉकच्या खाली आधार देणारे ब्लॉक असणे आवश्यक आहे (लपलेले ब्लॉक!).\n\n4. इनपुट फील्डमध्ये तुमचे उत्तर टाइप करा आणि तपासण्यासाठी \"अंदाज सबमिट करा\" टॅप करा.';

  @override
  String get alphabetSudokuTitle => 'अल्फाबेट सुडोकू';

  @override
  String get alphabetSudokuSubtitle =>
      'प्रत्येक रांग, स्तंभ आणि बॉक्समध्ये A-I अक्षरे असतील अशा प्रकारे ग्रिड भरा.';

  @override
  String get alphabetSudokuWinTitle => 'सुडोकू सोडवला!';

  @override
  String get alphabetSudokuWinMessage =>
      'छान! तुम्ही अक्षरांवर प्रभुत्व मिळवले आहे.';

  @override
  String get classicMazeTitle => 'क्लासिक मेझ';

  @override
  String get classicMazeSubtitle =>
      'शोधा आणि सोडवा • प्रत्येक खेळासाठी नवीन भूलभुलैया';

  @override
  String get classicMazeWinTitle => 'भूलभुलैया पूर्ण!';

  @override
  String classicMazeWinMessage(int count) {
    return 'अविश्वसनीय नेव्हिगेशन! तुम्ही $count चालींमध्ये भूलभुलैया सोडवली.';
  }

  @override
  String get classicMazeMoves => 'चाली: ';

  @override
  String get classicMazeHowToPlayDescription =>
      '1. चमकणाऱ्या पिवळ्या गोटीला (खेळाडू) खालच्या उजव्या बाजूला असलेल्या हिरव्या पोर्टलकडे (बाहेर पडण्याचा मार्ग) न्या.\n\n2. हलवण्यासाठी भूलभुलैयावर कोठेही स्वाइप करा, कीबोर्डवरील बाण की वापरा किंवा तळाशी असलेले बटण वापरा.\n\n3. जांभळा मार्ग तुम्ही शोधलेला मार्ग दर्शवतो. तुमच्या मार्गावर परत येऊन तो पुसा!\n\n4. मोठ्या भूलभुलैयासह स्वतःला आव्हान देण्यासाठी वरच्या बारमधून काठिण्य पातळी बदला!';

  @override
  String get conjunctionSearchTitle => 'कंजंक्शन सर्च';

  @override
  String get conjunctionSearchSubtitle => 'एकाग्रता आणि वैशिष्ट्य संयोजन';

  @override
  String get conjunctionSearchWinTitle => 'विजय';

  @override
  String get conjunctionSearchWinMessage =>
      'तुम्ही अचूक एकाग्रतेने सर्व लक्ष्ये शोधली आहेत!';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      'सूचनांमध्ये एक विशिष्ट लक्ष्य आकार आणि रंगाचे संयोजन दाखवले जाईल. दाट ग्रिडमध्ये शक्य तितक्या वेगाने ते शोधा आणि टॅप करा. दिशाभूल करणारे आकार एकतर समान रंग किंवा आकार सामायिक करतात, म्हणून काळजीपूर्वक पहा!';

  @override
  String get conjunctionSearchRound => 'फेरी: ';

  @override
  String get conjunctionSearchScore => 'स्कोअर: ';

  @override
  String get conjunctionSearchFind => 'शोधा: ';

  @override
  String get shapeCircle => 'वर्तुळ';

  @override
  String get shapeSquare => 'चौरस';

  @override
  String get shapeTriangle => 'त्रिकोण';

  @override
  String get shapeStar => 'तारा';

  @override
  String get colorRedLabel => 'लाल';

  @override
  String get colorBlueLabel => 'निळा';

  @override
  String get colorGreenLabel => 'हिरवा';

  @override
  String get colorAmberLabel => 'अंबर';

  @override
  String get cubeNetFoldTitle => 'क्यूब नेट फोल्ड';

  @override
  String get cubeNetFoldSubtitle => 'जुळणारा 3D क्यूब निवडा';

  @override
  String get cubeNetFoldWinTitle => 'बरोबर';

  @override
  String get cubeNetFoldWinMessage =>
      'तुमचे 3D स्थानिक फोल्डिंग तर्क परिपूर्ण आहे!';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '1. वरती उघडलेला 2D नेट पहा.\n\n2. मनात त्या नेटचा 3D घन तयार करा.\n\n3. खालीलपैकी तो पर्याय निवडा जो त्या दुमडलेल्या घनाचे वैध 3D दृश्य दर्शवतो.\n\n4. सावध राहा: नेटमधील समोरासमोरच्या बाजू 3D मध्ये शेजारी असू शकत नाहीत!';

  @override
  String get cubeNetFoldUnfoldedNet => 'उघडलेला 2D नेट';

  @override
  String get cubeNetFoldWhichMatches => 'कोणता घन जुळतो?';

  @override
  String get cubeNetFoldIncorrect =>
      'चुकीचे फोल्डिंग तर्क! रीसेट टॅप करा किंवा तुमची निवड बदला.';

  @override
  String get cubeNetFoldSubmitChoice => 'निवड सबमिट करा';

  @override
  String get cubeNetFoldFailed => 'अयशस्वी (रीसेट टॅप करा)';

  @override
  String get faceTraitAssociationMemorize => 'सर्व 4 लोक लक्षात ठेवा';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return '$total पैकी $current व्यक्ती';
  }

  @override
  String get faceTraitAssociationWhatOccupation => 'त्यांचा व्यवसाय काय आहे?';

  @override
  String get faceTraitAssociationWhatHobby => 'त्यांचा छंद काय आहे?';

  @override
  String get faceTraitAssociationWinTitle => 'मेमरी मास्टर!';

  @override
  String get faceTraitAssociationLoseTitle => 'खेळ संपला';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return 'तुम्ही $total पैकी $correct अचूक मिळवले.';
  }

  @override
  String get topologyTitle => 'टोपोलॉजी';

  @override
  String get topologySubtitle =>
      'हे आकार टोपोलॉजिकली समान आहेत का? (एक कापल्याशिवाय किंवा चिकटवल्याशिवाय दुसऱ्यात बदलता येतो का?)';

  @override
  String get topologyWinTitle => 'भूमिती तज्ञ!';

  @override
  String get topologyWinMessage =>
      'तुम्ही 10 टोपोलॉजिकल जोड्या अचूक ओळखल्या आहेत!';

  @override
  String get topologyScore => 'स्कोअर: ';
}
