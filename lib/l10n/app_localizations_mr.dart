// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'पझल गेम्स';

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
  String get victory => 'विजय!';

  @override
  String get gameWin => 'शाब्बास!';

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
  String get visualStatisticalLearningTitle =>
      'व्हिज्युअल स्टॅटिस्टिकल लर्निंग';

  @override
  String get orbitTapTitle => 'ऑर्बिट टॅप';

  @override
  String get orbitTapSubtitle => 'जेव्हा गोळे गेटशी जुळतील तेव्हा टॅप करा';

  @override
  String get schulteTableTitle => 'शुल्टे टेबल';

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
  String get memoryMatrixTitle => 'मेमरी मॅट्रिक्स';

  @override
  String get memoryMatrixSubtitle => 'पॅटर्न लक्षात ठेवा आणि टाइल्स टॅप करा.';

  @override
  String get mentalAbacusTitle => 'मानसिक अबॅकस';

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
  String get verbalAnalogiesTitle => 'शाब्दिक समरूपता';

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
  String get tangleFixTitle => 'गुंता सोडवणे';

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
  String get wisconsinCardSortingTitle => 'विस्कॉन्सिन कार्ड सॉर्ट';

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
  String get mirrorTracingTitle => 'मिरर ट्रेसिंग';

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
  String get paperFoldingTitle => 'पेपर फोल्डिंग';

  @override
  String get paperFoldingSubtitle => 'उघडल्यावर ते कसे दिसेल?';

  @override
  String get waterSortTitle => 'वॉटर सॉर्ट';

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
  String get silhouetteMatchTitle => 'सिल्युएट मॅच';

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
  String get shapeRectangle => 'आयत';

  @override
  String get shapeEllipse => 'लंबवर्तुळ';

  @override
  String get shapeTrapezoid => 'ट्रॅपेझॉइड';

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

  @override
  String get semanticDistanceTitle => 'सिमेंटिक अंतर';

  @override
  String get semanticDistanceSubtitle => 'शब्दांमधील वैचारिक अंतर मोजा';

  @override
  String get oxymoronHuntTitle => 'विरोधाभास शोध';

  @override
  String get oxymoronHuntSubtitle =>
      'ग्रिडमधील परस्परविरोधी शब्दांच्या जोड्या लावा';

  @override
  String get portmanteauSplitTitle => 'मिश्र शब्द विभागणी';

  @override
  String get portmanteauSplitSubtitle => 'मिश्र शब्दाचे मूळ शब्द ओळखा';

  @override
  String get chainReactionTitle => 'साखळी अभिक्रिया';

  @override
  String get chainReactionSubtitle =>
      'ओव्हरलॅपिंग अक्षरांचा वापर करून शब्द जोडा';

  @override
  String get rhymeMasterTitle => 'यमक मास्टर';

  @override
  String get rhymeMasterSubtitle => 'लक्ष्य शब्दाशी यमक जुळणारे शब्द ओळखा';

  @override
  String get definitionDashTitle => 'व्याख्या धाव';

  @override
  String get definitionDashSubtitle =>
      'योग्य शब्दाची त्याच्या व्याख्येशी जोडी लावा';

  @override
  String get syllableStackTitle => 'अक्षर संच';

  @override
  String get syllableStackSubtitle => 'पूर्ण शब्द तयार करण्यासाठी अक्षरे साचवा';

  @override
  String get sentenceUnscrambleTitle => 'वाक्य उलगडा';

  @override
  String get sentenceUnscrambleSubtitle =>
      'वैध वाक्य तयार करण्यासाठी शब्दांचा क्रम लावा';

  @override
  String get grammarSortTitle => 'व्याकरण वर्गीकरण';

  @override
  String get grammarSortSubtitle => 'शब्दांचे त्यांच्या जातीनुसार वर्गीकरण करा';

  @override
  String get vowelReconstructTitle => 'स्वर पुनर्बांधणी';

  @override
  String get vowelReconstructSubtitle => 'वाक्यातील गहाळ स्वर भरा';

  @override
  String get consonantReconstructTitle => 'व्यंजन पुनर्बांधणी';

  @override
  String get consonantReconstructSubtitle => 'वाक्यातील गहाळ व्यंजने भरा';

  @override
  String get homophoneHuntTitle => 'समानार्थी शब्द शोध';

  @override
  String get silentLetterSearchTitle => 'मूक अक्षर शोध';

  @override
  String get silentLetterSearchSubtitle =>
      'दिलेल्या शब्दांमधील मूक अक्षरे ओळखा';

  @override
  String get palindromeBuilderTitle => 'पालिंड्रोम निर्माता';

  @override
  String get palindromeBuilderSubtitle =>
      'किमान अक्षरे जोडून पालिंड्रोम तयार करा';

  @override
  String get phoneticGuessTitle => 'ध्वन्यात्मक अंदाज';

  @override
  String get phoneticGuessSubtitle =>
      'शब्दाच्या ध्वन्यात्मक स्पेलिंगवरून तो ओळखा';

  @override
  String get spoonerismSolverTitle => 'स्पूनरिझम सॉल्वर';

  @override
  String get spoonerismSolverSubtitle => 'वाक्यांशासाठी योग्य स्पूनरिझम ओळखा';

  @override
  String get etymonOddballTitle => 'व्युत्पत्ती वेगळेपण';

  @override
  String get etymonOddballSubtitle => 'एकच मूळ नसलेला शब्द शोधा';

  @override
  String get etymologyOriginTitle => 'व्युत्पत्ती मूळ';

  @override
  String get etymologyOriginSubtitle => 'परकीय शब्दाच्या मूळ भाषेचा अंदाज लावा';

  @override
  String get affixFactoryTitle => 'प्रत्यय कारखाना';

  @override
  String get affixFactorySubtitle =>
      'उपसर्ग आणि प्रत्यय वापरून वैध शब्द तयार करा';

  @override
  String get cognateCatchTitle => 'समानार्थी शब्द पकडा';

  @override
  String get cognateCatchSubtitle =>
      'खरे आणि खोटे समानार्थी शब्द यातील फरक ओळखा';

  @override
  String get compoundConnectTitle => 'संयुक्त जोडणी';

  @override
  String get compoundConnectSubtitle =>
      'संयुक्त शब्द तयार करण्यासाठी दोन शब्द एकत्र करा';

  @override
  String get pangramSprintTitle => 'पॅन्ग्राम स्प्रिंट';

  @override
  String get pangramSprintSubtitle =>
      'मुळाक्षरातील प्रत्येक अक्षर वापरून वाक्य तयार करा';

  @override
  String get anagramDefinitionTitle => 'अॅनाग्राम व्याख्या';

  @override
  String get anagramDefinitionSubtitle => 'व्याख्येच्या आधारे अॅनाग्राम सोडवा';

  @override
  String get letterBridgeTitle => 'अक्षर पूल';

  @override
  String get letterBridgeSubtitle => 'दोन शब्दांना जोडणारे गहाळ अक्षर शोधा';

  @override
  String get letterFrequencyScanTitle => 'अक्षर वारंवारता स्कॅन';

  @override
  String get letterFrequencyScanSubtitle =>
      'मजकुरात एखादे अक्षर किती वेळा आले आहे ते मोजा';

  @override
  String get oneLetterShiftTitle => 'एक-अक्षर बदल';

  @override
  String get oneLetterShiftSubtitle =>
      'एक अक्षर बदलून एका शब्दाचे दुसऱ्या शब्दात रूपांतर करा';

  @override
  String vocabularyBuilderMessage(String arg0) {
    return 'उत्तम काम! तुमचा शब्दसंग्रह प्रभावी आहे. गुण: $arg0';
  }

  @override
  String get symmetryMessage => 'तुम्ही पॅटर्नचे अचूक प्रतिबिंब तयार केले आहे.';

  @override
  String get temporalOrderMessage =>
      'अविश्वसनीय! तुमची कालक्रमानुसार स्मृती खूप चांगली आहे.';

  @override
  String get temporalOrderMessage1 =>
      'चुकीची क्रमवारी स्मृती. सरावाने माणूस परिपूर्ण होतो!';

  @override
  String get wordSearchMessage =>
      'सूक्ष्म निरीक्षणाने सर्व शब्द यशस्वीरित्या सापडले.';

  @override
  String colorMatchMessage(String arg0) {
    return 'तुमची अचूकता: $arg0%';
  }

  @override
  String semanticLinkMessage(String arg0) {
    return 'तुम्ही $arg0 गुण मिळवले!';
  }

  @override
  String reflexTapMessage(String arg0) {
    return 'तुम्ही $arg0 लक्षांवर टॅप केले!';
  }

  @override
  String get angleFinderMessage => 'तुमची भूमितीय अंतर्ज्ञान उत्तम आहे!';

  @override
  String angleFinderMessage1(String arg0) {
    return 'योग्य उत्तर $arg0° होते';
  }

  @override
  String angleFinderText(String arg0) {
    return '$arg0°';
  }

  @override
  String visualStatisticalLearningMessage(String arg0) {
    return 'तुम्ही $arg0 अचूक पॅटर्न ओळखले!';
  }

  @override
  String nonogramText(String arg0) {
    return 'त्रुटी: $arg0';
  }

  @override
  String mentalCalendarMessage(String arg0) {
    return 'तुम्ही १० पैकी $arg0 बरोबर मिळवले!';
  }

  @override
  String orbitTapMessage(String arg0) {
    return 'तुम्ही यशस्वीरित्या $arg0 वेळा टॅप केले!';
  }

  @override
  String schulteTableMessage(String arg0) {
    return 'तुम्ही $arg0 मध्ये तक्ता पूर्ण केला. आपली दृष्टी विस्तारण्यासाठी सराव सुरू ठेवा!';
  }

  @override
  String get schulteTableText => 'चाचणी सुरू करा';

  @override
  String get relationalMemoryMessage => 'विलक्षण अवकाशीय स्मृती अचूकता!';

  @override
  String sudokuText(String arg0) {
    return 'त्रुटी: $arg0';
  }

  @override
  String sdmtMessage(String arg0) {
    return 'तुम्ही $arg0 चिन्हे जुळवली! ही चाचणी तुमचा स्कॅनिंग वेग आणि दृश्य लक्ष मोजते.';
  }

  @override
  String get futoshikiMessage =>
      'अविश्वसनीय! तुम्ही फुतोशिकी लॅटिन स्क्वेअर सोडवले.';

  @override
  String letterFrequencyScanMessage(String arg0, String arg1) {
    return 'तुम्ही \"$arg1\" अक्षराच्या $arg0 घटना अचूकपणे मोजल्या.';
  }

  @override
  String letterFrequencyScanText(String arg0) {
    return 'चूक. गणना $arg0 होती.';
  }

  @override
  String get memoryMatrixMessage =>
      'प्रभावी! तुमची मेमरी तीक्ष्ण आहे. दैनिक लक्ष्य पूर्ण!';

  @override
  String get memoryMatrixMessage1 =>
      'तुमचा मेमरी स्कोअर सुधारण्यासाठी लक्ष केंद्रित करा आणि पुन्हा प्रयत्न करा.';

  @override
  String get contextCluesMessage =>
      'अपवादात्मक! तुमचा शब्दसंग्रह आणि संदर्भात्मक विश्लेषण उत्कृष्ट आहे.';

  @override
  String get contextCluesMessage1 =>
      'चुकीचा शब्द निवडला! तुमचे शाब्दिक संदर्भातील तर्क प्रशिक्षित करा आणि पुन्हा प्रयत्न करा.';

  @override
  String oneLetterShiftMessage(String arg0, String arg1) {
    return 'तुम्ही यशस्वीरित्या $arg0 मधून $arg1 मध्ये बदल केले.';
  }

  @override
  String get mentalAbacusMessage => 'तुमचे मानसिक अंकगणित उच्च दर्जाचे आहे.';

  @override
  String fractionMatcherMessage(String arg0) {
    return 'तुम्ही जोड्या जुळवून $arg0 गुण मिळवले!';
  }

  @override
  String get spellingSprintMessage =>
      'तुम्ही सर्व १० शब्दांचे स्पेलिंग बरोबर लिहिले!';

  @override
  String spellingSprintMessage1(String arg0) {
    return 'तुम्ही $arg0 शब्दांचे स्पेलिंग बरोबर लिहिले.';
  }

  @override
  String stopSignalMessage(String arg0) {
    return 'तुम्ही $arg0 अचूक प्रतिसाद दिले! ही चाचणी नियोजित कृती रोखण्याच्या तुमच्या क्षमतेचे मोजमाप करते.';
  }

  @override
  String grammarPoliceMessage(String arg0) {
    return 'खेळ संपला! तुम्ही व्याकरणाच्या जगात सुव्यवस्था राखली. गुण: $arg0';
  }

  @override
  String consonantReconstructMessage(String arg0) {
    return 'तुम्ही $arg0 स्कोअरची पुनर्बांधणी केली!';
  }

  @override
  String rhymeMasterMessage(String arg0, String arg1) {
    return 'तुम्हाला $arg1 पैकी $arg0 यमक सापडले!';
  }

  @override
  String vigilanceTaskMessage(String arg0, String arg1, String arg2) {
    return 'हिट्स: $arg0, चुका: $arg1\nखोटे अलार्म: $arg2';
  }

  @override
  String get silhouetteMatchOrthoMessage =>
      'तुमची रेखाटन संरेखन कौशल्ये निर्दोष आहेत!';

  @override
  String get silhouetteMatchOrthoText => 'समजले';

  @override
  String get silhouetteMatchOrthoText1 =>
      'चुकीचा दृष्टीकोन! पुन्हा प्रयत्न करण्यासाठी रिसेटवर टॅप करा.';

  @override
  String fibonacciMergeMessage(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String factorFinderMessage(String arg0) {
    return 'तुम्ही सर्व अवयव शोधून $arg0 गुण मिळवले!';
  }

  @override
  String logicalSyllogismsMessage(String arg0) {
    return 'तुम्ही $arg0 तर्कशास्त्र अचूकपणे सोडवले!';
  }

  @override
  String get rotatingMazeMessage =>
      'तुम्ही फिरणाऱ्या चक्रव्यूहातून यशस्वीरित्या मार्ग काढला!';

  @override
  String get rotatingMazeText => 'समजले';

  @override
  String get rotatingMazeText1 => '🌀 चक्रव्यूह ९०° फिरला! ग्रिड बदलली!';

  @override
  String get mathPathMessage =>
      'तुम्हाला लक्ष्यापर्यंत पोहोचणारा मार्ग सापडला!';

  @override
  String get bridgesMessage => 'तुम्ही सर्व बेटे यशस्वीरित्या जोडली!';

  @override
  String compoundConnectMessage(String arg0, String arg1) {
    return 'संयुक्त शब्द $arg0$arg1 आहे.';
  }

  @override
  String get pangramSprintMessage => 'तुम्ही २६ अक्षरे वापरून वाक्य तयार केले.';

  @override
  String get mirrorImageMessage => 'तुम्ही प्रतिबिंब अचूकपणे ओळखले.';

  @override
  String get mirrorImageText => 'दर्पण प्रतिमा';

  @override
  String reverseStroopMessage(String arg0) {
    return 'तुम्ही $arg0 गुण मिळवले! सूचनांकडे लक्ष द्या.';
  }

  @override
  String get verbalAnalogiesMessage =>
      'नात्यांच्या बाबतीत तुमचे मन तीक्ष्ण आहे.';

  @override
  String corsiBlocksMessage1(String arg0, String arg1) {
    return 'तुम्ही $arg1 क्रम लक्षात ठेवले! तुमची अवकाशीय स्मृती व्याप्ती $arg0 पर्यंत पोहोचली.';
  }

  @override
  String wordLadderMessage(String arg0, String arg1, String arg2) {
    return 'तुम्ही यशस्वीरित्या $arg2 पायऱ्यांमध्ये $arg0 ला $arg1 शी जोडले.';
  }

  @override
  String d2AttentionMessage(String arg0) {
    return 'अविश्वसनीय निवडक स्कॅनिंग! अंतिम गुण: $arg0.';
  }

  @override
  String get d2AttentionText => 'कसे खेळायचे';

  @override
  String get d2AttentionText1 => 'समजले';

  @override
  String get tangleFixMessage => 'सर्व रेषा स्पष्ट आणि गुळगुळीत आहेत.';

  @override
  String get distractorMatrixMessage =>
      'अविश्वसनीय! गणिताच्या अडथळ्यांनंतरही तुम्ही पॅटर्न लक्षात ठेवले!';

  @override
  String get distractorMatrixMessage1 =>
      'तुम्ही अडथळ्यात अडकलात! तुमची कार्यरत स्मृती पुन्हा प्रशिक्षित करा.';

  @override
  String sentenceUnscrambleMessage(String arg0) {
    return 'तुम्ही $arg0 गुणांचे वाक्य सोडवले!';
  }

  @override
  String get kakuroMessage =>
      'अविश्वसनीय! तुम्ही सर्व बेरीज विभागांना पूर्णपणे जुळवले.';

  @override
  String symbolicFlankerMessage(String arg0, String arg1) {
    return 'तुम्ही $arg1 पैकी $arg0 बरोबर मिळवले!';
  }

  @override
  String stroopTestMessage(String arg0) {
    return 'तुम्ही $arg0 अचूक गुण मिळवले! शब्दाकडे नाही, तर शाईच्या रंगाकडे लक्ष द्या.';
  }

  @override
  String wisconsinCardSortingMessage(String arg0) {
    return 'तुम्ही $arg0 कार्डे बरोबर वर्गीकृत केली!';
  }

  @override
  String nBackMessage(String arg0) {
    return 'तुम्ही $arg0 २-बॅक जोड्या जुळवल्या! मल्टीटास्किंगसाठी तुमची कार्यरत स्मृती महत्त्वाची आहे.';
  }

  @override
  String rhythmMasterMessage(String arg0, String arg1) {
    return 'तुम्ही $arg0 अचूक फटके आणि $arg1 गुण मिळवले!';
  }

  @override
  String groceryListMessage(String arg0, Object score) {
    return 'तुम्ही किराणा यादीमध्ये $arg0 गुण मिळवले!';
  }

  @override
  String get groceryListText => 'मी';

  @override
  String get mirrorTracingMessage =>
      'तुमच्या मेंदूने त्याच्या समन्वयाची यशस्वीरित्या पुनर्रचना केली.';

  @override
  String moduloClockMessage(String arg0) {
    return 'उत्कृष्ट मॉड्युलर मानसिक गणित समन्वय! गुण: $arg0';
  }

  @override
  String moduloClockMessage1(String arg0, String arg1, String arg2) {
    return 'तुम्ही $arg1 पैकी $arg0 मॉड्युलर क्लॉक सोल्यूशन्स मॅनेज केले. गुण: $arg2';
  }

  @override
  String get crownMessage =>
      'योग्य तर्कासह सर्व मुकुट यशस्वीरित्या ठेवले गेले.';

  @override
  String dualCodingMessage(String arg0) {
    return 'विलक्षण दुहेरी कार्यक्षमता! तुमचा कार्यरत स्मृती स्कोअर: $arg0';
  }

  @override
  String inequalityDashMessage(String arg0) {
    return 'तुम्ही असमानता जुळवून $arg0 गुण मिळवले!';
  }

  @override
  String sourceMonitoringMessage(String arg0, String arg1) {
    return 'तुम्ही $arg1 पैकी $arg0 गुण मिळवले!';
  }

  @override
  String get sourceMonitoringText => 'आठवायला सुरुवात करा';

  @override
  String get memoryPalaceText => 'उपलब्ध शब्द';

  @override
  String target10Message(String arg0) {
    return 'तुम्ही १० पर्यंत संख्या जोडून $arg0 गुण मिळवले!';
  }

  @override
  String get paperFoldingMessage => 'तुम्ही तुमच्या मनात पॅटर्न पाहू शकता.';

  @override
  String topologyText(String arg0, String arg1) {
    return '$arg0$arg1 / १०';
  }

  @override
  String get waterSortMessage => 'तुम्ही सर्व रंग अचूकपणे लावले!';

  @override
  String anagramDefinitionMessage(String arg0) {
    return 'तो शब्द खरोखर \"$arg0\" होता.';
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
    return 'तुम्ही $arg0 अचूक अंदाज लावले.';
  }

  @override
  String grammarSortMessage(String arg0) {
    return 'तुम्ही $arg0 शब्द अचूकपणे वर्गीकृत केले!';
  }

  @override
  String vowelReconstructMessage(String arg0) {
    return 'तुम्ही $arg0 स्कोअरची पुनर्बांधणी केली!';
  }

  @override
  String spatialConflictMessage(String arg0, String arg1) {
    return 'तुम्ही $arg1 त्रुटींसह $arg0 गुण मिळवले!';
  }

  @override
  String get spatialConflictText => 'कसे खेळायचे';

  @override
  String get spatialConflictText1 => 'समजले';

  @override
  String tracePathMessage(String arg0) {
    return 'तुमची अचूकता $arg0% होती!';
  }

  @override
  String ruleSwitcherMessage(String arg0, String arg1) {
    return 'तुम्ही $arg1 पैकी $arg0 बरोबर गुण मिळवले!';
  }

  @override
  String collatzMessage(String arg0, String arg1) {
    return 'तुम्ही $arg0 पावले उचलली. किमान शक्य $arg1 होती.';
  }

  @override
  String get collatzText => '/ २';

  @override
  String get collatzText1 => '+ १';

  @override
  String get collatzText2 => '3n + 1';

  @override
  String divisibilityDashMessage(String arg0) {
    return 'तुम्ही $arg0 संख्या सोडवल्या!';
  }

  @override
  String switchTaskMessage(String arg0) {
    return 'तुम्ही $arg0 बरोबर गुण मिळवले! मानसिक लवचिकतेसाठी वेगाने बदल करणे महत्त्वाचे आहे.';
  }

  @override
  String sequenceSleuthMessage(String arg0) {
    return 'तुम्ही $arg0 क्रम सोडवले!';
  }

  @override
  String changeBlindnessMessage(String arg0) {
    return 'तुम्हाला $arg0 बदल सापडले!';
  }

  @override
  String mentalRotationMessage(String arg0) {
    return 'तुम्ही $arg0 आकार बरोबर फिरवले!';
  }

  @override
  String wordMastermindMessage(String arg0) {
    return 'तुम्ही कोडमध्ये प्राविण्य मिळवले!\nतो शब्द होता: $arg0';
  }

  @override
  String wordMastermindMessage1(String arg0) {
    return 'तो लपलेला शब्द होता: $arg0';
  }

  @override
  String wordMastermindText(String arg0) {
    return '$arg0';
  }

  @override
  String get simonSequenceMessage => 'तुम्ही सर्व १० टाइल्स लक्षात ठेवल्या!';

  @override
  String get simonSequenceMessage1 =>
      'क्रमात प्राविण्य मिळवण्यासाठी पुन्हा प्रयत्न करा.';

  @override
  String oxymoronHuntMessage(String arg0) {
    return 'तुम्हाला $arg0 विरोधाभास सापडले!';
  }

  @override
  String spotlightTrackMessage(String arg0) {
    return 'अविश्वसनीय अवकाशीय ट्रॅकिंग! तुम्ही $arg0 गुण मिळवले.';
  }

  @override
  String get spotlightTrackText => 'कसे खेळायचे';

  @override
  String get spotlightTrackText1 => 'समजले';

  @override
  String get spotlightTrackText2 => 'फेरी सुरू करा';

  @override
  String vennNumbersMessage(String arg0) {
    return 'तुम्ही $arg0 संख्या वर्गीकृत केल्या!';
  }

  @override
  String get vennNumbersText => 'दोन्हीपैकी काहीही नाही';

  @override
  String get vennNumbersText1 => 'दोन्ही';

  @override
  String get silhouetteMatchMessage =>
      'तुमचा मेंदू ३डी ते २डी अनुवादात उत्कृष्ट आहे.';

  @override
  String sumSnakeMessage(String arg0) {
    return 'अचूकतेसह लक्ष्य $arg0 गाठले!';
  }

  @override
  String get sumSnakeText => 'मार्ग मोकळा करा';

  @override
  String percentagePeakMessage(String arg0) {
    return 'तुम्ही $arg0 टक्केवारीची उदाहरणे सोडवली!';
  }

  @override
  String trailMakingMessage(String arg0) {
    return 'तुम्ही $arg0 ट्रेल्स पूर्ण केले! ही चाचणी तुमचा व्हिज्युअल शोध वेग आणि मानसिक लवचिकता मोजते.';
  }

  @override
  String matrixReasoningMessage(String arg0) {
    return 'तुम्ही $arg0 मॅट्रिक्स बरोबर पूर्ण केले!';
  }

  @override
  String get tentsAndTreesMessage =>
      'तुम्ही सर्व तंबू यशस्वीरित्या लावले आहेत.';

  @override
  String klotskiMessage(String arg0) {
    return 'विलक्षण स्लाइडिंग! तुम्ही $arg0 चालींमध्ये हिरो ब्लॉक मुक्त केला.';
  }

  @override
  String sumPyramidMessage(String arg0) {
    return 'तुम्ही $arg0 बेरीज पिरामिड यशस्वीरित्या सोडवले!';
  }

  @override
  String simonCommandMessage(String arg0) {
    return 'उत्कृष्ट निवडक प्रतिसाद आणि लक्ष! एकूण गुण: $arg0';
  }

  @override
  String simonCommandMessage1(String arg0, String arg1) {
    return 'तुम्ही $arg0 गुण मिळवले पण वेळेत $arg1 जोड्यांपर्यंत पोहोचू शकला नाही.';
  }

  @override
  String syllableStackMessage(String arg0) {
    return 'तुम्ही $arg0 स्कोअरचा संच तयार केला!';
  }

  @override
  String get slitherlinkMessage =>
      'छान! तुम्ही यशस्वीरित्या लूप पहेली पूर्ण केली.';

  @override
  String quickMathMessage(String arg0) {
    return 'तुम्ही $arg0 उदाहरणे सोडवली!';
  }

  @override
  String commonDenominatorMessage(String arg0) {
    return 'तुम्ही $arg0 मसावि/लसावि उदाहरणे सोडवली!';
  }

  @override
  String chainReactionMessage(String arg0, String arg1) {
    return 'तुमचा अंतिम स्कोअर $arg0 आहे. तुम्ही $arg1 शब्दांची साखळी तयार केली.';
  }

  @override
  String chainReactionText(String arg0) {
    return '$arg0';
  }

  @override
  String get associativePairsMessage =>
      'उत्कृष्ट! तुम्ही दृश्य वैशिष्ट्ये निर्दोषपणे जोडली.';

  @override
  String get associativePairsMessage1 =>
      'चुकीचे कनेक्शन! तुमची मेमरी तीक्ष्ण करा आणि पुन्हा प्रयत्न करा.';

  @override
  String portmanteauSplitMessage(String arg0) {
    return 'तुम्ही $arg0 मिश्र शब्द वेगळे केले!';
  }

  @override
  String get magicSquaresText => 'साफ करा';

  @override
  String alphabetSudokuText(String arg0) {
    return 'त्रुटी: $arg0';
  }

  @override
  String get pipesMessage => 'तुम्ही सर्व पाईप्स जोडले आणि ग्रिड भरली.';

  @override
  String get dualMirrorMessage =>
      'तुम्ही दोन्ही चिन्हांना त्यांच्या लक्ष्यापर्यंत पोहोचवले!';

  @override
  String binaryCodeMessage(String arg0) {
    return 'विलक्षण जलद दशांश रूपांतर! अंतिम गुण: $arg0';
  }

  @override
  String binaryCodeMessage1(String arg0, String arg1) {
    return 'तुम्ही $arg0 बायनरी संख्या बरोबर रूपांतरित केल्या. गुण: $arg1';
  }

  @override
  String oddOneOutMessage(String arg0) {
    return 'तुम्हाला ५० वेगळे शब्द सापडले! अंतिम गुण: $arg0';
  }

  @override
  String oddOneOutMessage1(String arg0) {
    return 'तुमचा स्कोअर: $arg0';
  }

  @override
  String letterBridgeMessage(String arg0) {
    return 'तुम्हाला जोड अक्षर सापडले: $arg0';
  }

  @override
  String get imReady => 'मी तयार आहे';

  @override
  String get soptTitle => 'स्व-आदेशित पॉइंटिंग';

  @override
  String get soptSubtitle =>
      'प्रत्येक वेळी वेगळ्या कार्डावर टॅप करा. पोझिशन्स फेरफार!';

  @override
  String get soptWinTitle => 'सिक्वेन्स मास्टर!';

  @override
  String soptGameOverMessage(int score) {
    return 'शफल केलेल्या कार्डांचा यशस्वीपणे मागोवा घेऊन तुम्ही $score गुण मिळवले!';
  }

  @override
  String get soptChooseNovel => 'नवीन कार्ड टॅप करा';

  @override
  String get soptGreatJob => 'छान काम!';

  @override
  String get soptAlreadyTapped => 'आधीच टॅप केले!';

  @override
  String get soptGrid => 'ग्रिड';

  @override
  String get contRecogTitle => 'सतत ओळख';

  @override
  String get contRecogSubtitle =>
      'या सत्रात तुम्ही हे कार्ड आधी पाहिले आहे का?';

  @override
  String get contRecogWinTitle => 'ओळख अलौकिक बुद्धिमत्ता!';

  @override
  String contRecogGameOverMessage(int score) {
    return 'तुम्ही $score योग्य ओळख मिळवल्या!';
  }

  @override
  String get contRecogCorrect => 'बरोबर!';

  @override
  String get contRecogWrong => 'चुकीचे!';

  @override
  String get contRecogOldOrNew => 'हे जुने की नवीन?';

  @override
  String get contRecogNew => 'नवीन';

  @override
  String get contRecogOld => 'जुने';

  @override
  String get contRecogSeenPool => 'पूल पाहिला';

  @override
  String get dnmsTitle => 'न जुळणारी मेमरी';

  @override
  String get dnmsSubtitle => 'लक्षात ठेवलेल्या नमुन्यात नसलेले कार्ड टॅप करा.';

  @override
  String get dnmsWinTitle => 'न जुळणारे तज्ञ!';

  @override
  String dnmsGameOverMessage(int score) {
    return 'तुम्ही विलंबित नॉन-मॅचिंगमध्ये $score योग्य उत्तरे मिळवली आहेत!';
  }

  @override
  String get dnmsChooseNovel => 'नवीन कार्डावर टॅप करा';

  @override
  String get dnmsMemorizeSample => 'हे कार्ड लक्षात ठेवा';

  @override
  String get dnmsWaitForIt => 'त्याची वाट पहा...';

  @override
  String get dnmsExcellent => 'उत्कृष्ट!';

  @override
  String get dnmsSampleTapped => 'तो नमुना होता!';

  @override
  String get dnmsCards => 'कार्ड्स';

  @override
  String get symSpanTitle => 'सममिती स्पॅन';

  @override
  String get symSpanSubtitle => 'अनुलंब सममिती ओळखताना सेल नमुने आठवा.';

  @override
  String get symSpanWinTitle => 'सममिती मास्टर!';

  @override
  String symSpanGameOverMessage(int score) {
    return 'लेआउट्स आठवून आणि सममिती ओळखून तुम्ही $score गुण मिळवले!';
  }

  @override
  String get symSpanMemorizeRed => 'लाल पेशींचे स्थान लक्षात ठेवा';

  @override
  String get symSpanIsSymmetric => 'नमुना सममितीय आहे का?';

  @override
  String get symSpanRecallSequence => 'क्रम योग्य क्रमाने आठवा';

  @override
  String get symSpanGreatJob => 'छान काम!';

  @override
  String get symSpanTryAgain => 'पुन्हा प्रयत्न करा!';

  @override
  String get symSpanLength => 'लांबी';

  @override
  String get readingSpanTitle => 'वाचन कालावधी';

  @override
  String get readingSpanSubtitle =>
      'अक्षरांचा क्रम लक्षात ठेवताना वाक्यांची पडताळणी करा.';

  @override
  String get readingSpanWinTitle => 'वाचन तज्ञ!';

  @override
  String readingSpanGameOverMessage(int score) {
    return 'तुम्ही रीडिंग स्पॅन मेमरी चॅलेंजमध्ये $score गुण मिळवले आहेत!';
  }

  @override
  String get readingSpanTrueFalse => 'हे विधान खरे की खोटे?';

  @override
  String get readingSpanMemorizeLetter => 'हे पत्र लक्षात ठेवा';

  @override
  String get readingSpanRecallLetters => 'क्रमाने अक्षरे आठवा';

  @override
  String get readingSpanGreatJob => 'छान काम!';

  @override
  String get readingSpanTryAgain => 'पुन्हा प्रयत्न करा!';

  @override
  String readingSpanYourSequence(String sequence) {
    return 'तुमचा क्रम: $sequence';
  }

  @override
  String get readingSpanLength => 'लांबी';

  @override
  String get readingSpanSentence1 => 'सूर्य पूर्वेला उगवतो.';

  @override
  String get readingSpanSentence2 => 'बर्फ गरम उकळत आहे.';

  @override
  String get readingSpanSentence3 => 'मासे पाण्याखाली श्वास घेऊ शकतात.';

  @override
  String get readingSpanSentence4 => 'कुत्र्यांना पंख असतात आणि ते उडू शकतात.';

  @override
  String get readingSpanSentence5 => '० अंश सेल्सिअस तापमानावर पाणी गोठते.';

  @override
  String get readingSpanSentence6 => 'मांजरी लहान कुत्र्यांप्रमाणे भुंकतात.';

  @override
  String get readingSpanSentence7 => 'उन्हाळ्यात झाडांना हिरवी पाने असतात.';

  @override
  String get readingSpanSentence8 => 'पाऊस जमिनीवरून वरच्या दिशेने पडतो.';

  @override
  String get readingSpanSentence9 => 'त्रिकोणाला चार समान बाजू असतात.';

  @override
  String get readingSpanSentence10 => 'सफरचंद हे एक प्रकारचे गोड फळ आहे.';

  @override
  String get readingSpanSentence11 => 'चंद्र चेडर चीज बनलेला आहे.';

  @override
  String get readingSpanSentence12 => 'ऑटोमोबाईलला फिरण्यासाठी चाके असतात.';

  @override
  String get readingSpanSentence13 => 'आग गोठवणारी थंड आहे.';

  @override
  String get readingSpanSentence14 =>
      'प्रक्रिया केलेल्या लाकडापासून कागद तयार केला जातो.';

  @override
  String get readingSpanSentence15 =>
      'पक्ष्यांना उडण्यास मदत करण्यासाठी पंख असतात.';

  @override
  String get readingSpanSentence16 => 'केळी पाइनच्या झाडांवर वाढतात.';

  @override
  String get readingSpanSentence17 => 'हत्ती मुंगीपेक्षा लहान असतो.';

  @override
  String get readingSpanSentence18 =>
      'पुस्तकांमध्ये मजकूराची मुद्रित पृष्ठे असतात.';

  @override
  String get countingSpanTitle => 'मोजणीचा कालावधी';

  @override
  String get countingSpanSubtitle =>
      'फक्त निळी मंडळे मोजा. मग मोजणीचा क्रम आठवा.';

  @override
  String get countingSpanWinTitle => 'अलौकिक बुद्धिमत्ता मोजत आहे!';

  @override
  String countingSpanGameOverMessage(int score) {
    return 'तुम्ही काउंटिंग स्पॅन मेमरी चॅलेंजमध्ये $score गुण मिळवले!';
  }

  @override
  String get countingSpanCountCircles => 'फक्त निळी मंडळे मोजा';

  @override
  String get countingSpanRecallCounts => 'योग्य क्रमाने संख्या आठवा';

  @override
  String get countingSpanGreatJob => 'छान काम!';

  @override
  String get countingSpanTryAgain => 'पुन्हा प्रयत्न करा!';

  @override
  String countingSpanYourSequence(String sequence) {
    return 'तुमचा क्रम: $sequence';
  }

  @override
  String get countingSpanLength => 'लांबी';

  @override
  String get objDispTitle => 'ऑब्जेक्ट विस्थापन';

  @override
  String get objDispSubtitle =>
      'लेआउट लक्षात ठेवा. स्थान बदलणारी एक वस्तू शोधा आणि टॅप करा.';

  @override
  String get objDispWinTitle => 'अवकाशीय अलौकिक बुद्धिमत्ता!';

  @override
  String objDispGameOverMessage(int score) {
    return 'तुम्ही $score विस्थापित वस्तू योग्यरित्या ओळखल्या आहेत!';
  }

  @override
  String get objDispMemorizeAll => 'सर्व प्लेसमेंट लक्षात ठेवा';

  @override
  String get objDispWaitingShift => 'लेआउट शिफ्टची प्रतीक्षा करत आहे...';

  @override
  String get objDispTapMoved => 'हलवलेल्या ऑब्जेक्टवर टॅप करा';

  @override
  String get objDispExcellent => 'उत्कृष्ट!';

  @override
  String get objDispWrongObject => 'चुकीचा आक्षेप!';

  @override
  String get objDispItems => 'वस्तू';

  @override
  String get mandalaTitle => 'मांडला आठवण';

  @override
  String get mandalaSubtitle =>
      'रंग कॉन्फिगरेशन लक्षात ठेवा. रंग निवडा आणि टाइल पुन्हा रंगवा.';

  @override
  String get mandalaWinTitle => 'मांडला कलाकार!';

  @override
  String mandalaGameOverMessage(int score) {
    return 'रंगीत भौमितिक मांडणी पुन्हा तयार करून तुम्ही $score गुण मिळवले!';
  }

  @override
  String get mandalaMemorizeColors => 'टाइलचे रंग लक्षात ठेवा';

  @override
  String get mandalaPaintCells => 'मूळ जुळण्यासाठी पेशी रंगवा';

  @override
  String get mandalaExcellent => 'उत्कृष्ट!';

  @override
  String get mandalaIncorrectMatch => 'अयोग्य जुळणी!';

  @override
  String get mandalaSubmitRepaint => 'पुन्हा पेंट सबमिट करा';

  @override
  String get mandalaTiles => 'फरशा';

  @override
  String get runningSpanTitle => 'रनिंग स्पॅन';

  @override
  String get runningSpanSubtitle =>
      'अक्षरे पहा. जेव्हा ते थांबतात, तेव्हा शेवटचे N अक्षरे क्रमाने इनपुट करा.';

  @override
  String get runningSpanWinTitle => 'बफर मास्टर!';

  @override
  String runningSpanGameOverMessage(int score) {
    return 'रनिंग मेमरी स्पॅनमध्ये तुम्ही $score गुण मिळवले!';
  }

  @override
  String runningSpanPrepareRecall(int count) {
    return 'शेवटची $count अक्षरे आठवण्याची तयारी करा';
  }

  @override
  String get runningSpanWatchCarefully => 'काळजीपूर्वक पहा...';

  @override
  String runningSpanEnterLast(int count) {
    return 'शेवटची $count अक्षरे प्रविष्ट करा';
  }

  @override
  String get runningSpanGreatJob => 'छान काम!';

  @override
  String get runningSpanIncorrectBuffer => 'चुकीचा बफर!';

  @override
  String runningSpanRecallLast(int count) {
    return 'शेवटचे $count आठवा';
  }

  @override
  String get runningSpanStopsRandomly => 'प्रवाह यादृच्छिकपणे थांबतो!';

  @override
  String runningSpanEntered(String sequence) {
    return 'प्रविष्ट केले: $sequence';
  }

  @override
  String get runningSpanNItems => 'एन-आयटम्स';

  @override
  String get spatialCabinetTitle => 'अवकाशीय कॅबिनेट';

  @override
  String get spatialCabinetSubtitle =>
      'कोणत्या कॅबिनेट ड्रॉवरमध्ये कोणती वस्तू आहे ते लक्षात ठेवा.';

  @override
  String get spatialCabinetWinTitle => 'कॅबिनेट तज्ञ!';

  @override
  String spatialCabinetGameOverMessage(int score) {
    return 'तुम्ही स्पेशियल कॅबिनेट मेमरीमध्ये $score गुण मिळवले आहेत!';
  }

  @override
  String get spatialCabinetMemorize => 'आयटम स्थाने लक्षात ठेवा';

  @override
  String spatialCabinetWhereIs(String itemName) {
    return '$itemName कुठे आहे?';
  }

  @override
  String get spatialCabinetCorrect => 'बरोबर!';

  @override
  String get spatialCabinetWrongDrawer => 'चुकीचा ड्रॉवर!';

  @override
  String get spatialCabinetItems => 'वस्तू';

  @override
  String get cabinetItemKey => 'की';

  @override
  String get cabinetItemApple => 'सफरचंद';

  @override
  String get cabinetItemDiamond => 'हिरा';

  @override
  String get cabinetItemBook => 'पुस्तक';

  @override
  String get cabinetItemUmbrella => 'छत्री';

  @override
  String get cabinetItemCoffee => 'कॉफी';

  @override
  String get cabinetItemLock => 'कुलूप';

  @override
  String get cabinetItemPet => 'पाळीव प्राणी';

  @override
  String get cabinetItemCar => 'कार';

  @override
  String get gamesTitleLabel => 'खेळ';

  @override
  String get yourFavorites => 'तुमचे आवडते';

  @override
  String get readyForWorkout => 'तुमच्या दैनंदिन व्यायामासाठी तयार आहात का?';

  @override
  String get greatStartKeepGoing => 'उत्तम सुरुवात! चालू ठेवा.';

  @override
  String get onFireToday => 'आज तुम्ही जोरात आहात!';

  @override
  String get incredibleSolvingToday => 'आज अविश्वसनीय सोडवणूक!';

  @override
  String get newGameLabel => 'नवीन';

  @override
  String get slitherlinkTitle => 'स्लिदरलिंक';

  @override
  String get slitherlinkSubtitle =>
      'संख्या संकेतांचा वापर करून पिन ग्रिड लूप करा.';

  @override
  String get futoshikiTitle => 'फुतोशिकी';

  @override
  String get futoshikiSubtitle => 'ग्रेटर-दॅन संकेतांसह ग्रिड भरा.';

  @override
  String get kakuroTitle => 'काकुरो';

  @override
  String get kakuroSubtitle => 'संख्या आणि बेरजेसह क्रॉसवर्ड सोडवा.';

  @override
  String get inequalityDashTitle => 'असमानता डॅश';

  @override
  String get inequalityDashSubtitle => 'वेळेच्या दबावाखाली असमानता सोडवा.';

  @override
  String get factorFinderTitle => 'विभाजक शोधक';

  @override
  String get factorFinderSubtitle => 'लक्ष्य संख्यांचे सर्व विभाजक ओळखा.';

  @override
  String get collatzTitle => 'कोलात्झ मार्ग';

  @override
  String get collatzSubtitle => '3N+1 क्रमामध्ये नेव्हिगेट करा.';

  @override
  String get sumPyramidTitle => 'बेरीज पिरॅमिड';

  @override
  String get sumPyramidSubtitle => 'बेरीज गणित संकेतांसह पिरॅमिडचे कप्पे भरा.';

  @override
  String get target10Title => 'लक्ष्य १०';

  @override
  String get target10Subtitle =>
      'दहा बेरीज मिळविण्यासाठी संख्यांच्या फरशा एकत्र करा.';

  @override
  String get fractionMatcherTitle => 'अपूर्णांक जुळवणी';

  @override
  String get fractionMatcherSubtitle => 'समान अपूर्णांक दृश्यमानपणे जुळवा.';

  @override
  String get dualCodingTitle => 'दुहेरी कोडिंग';

  @override
  String get dualCodingSubtitle => 'एकाच वेळी अक्षरे आणि चिन्हे जुळवा.';

  @override
  String get distractorMatrixTitle => 'विक्षेपक मॅट्रिक्स';

  @override
  String get distractorMatrixSubtitle => 'विक्षेपकांमधून लक्ष्य आकार शोधा.';

  @override
  String get temporalOrderTitle => 'कालिक क्रम';

  @override
  String get temporalOrderSubtitle => 'कालानुक्रमिक क्रम आठवा.';

  @override
  String get associativePairsTitle => 'सहयोगी जोड्या';

  @override
  String get associativePairsSubtitle =>
      'संबंधित चिन्हांच्या जोड्या लावा आणि जुळवा.';

  @override
  String get blockCount3dTitle => '3D ठोकळे मोजणे';

  @override
  String get blockCount3dSubtitle => 'त्रिमितीय जागेतील ठोकळे मोजा.';

  @override
  String get rotatingMazeTitle => 'फिरणारी भूलभुलैया';

  @override
  String get rotatingMazeSubtitle =>
      'चेंडूंना बाहेर जाण्याच्या मार्गापर्यंत नेण्यासाठी भूलभुलैया फिरवा.';

  @override
  String get silhouetteMatchOrthoTitle => 'सिल्हूट जुळवणी (ऑर्थो)';

  @override
  String get silhouetteMatchOrthoSubtitle =>
      '3D वस्तूंना ऑर्थो सावल्यांशी जुळवा.';

  @override
  String get spatialConflictTitle => 'स्थानिक संघर्ष';

  @override
  String get spatialConflictSubtitle => 'मजकूर आणि दिशा विसंगती सोडवा.';

  @override
  String get spotlightTrackTitle => 'स्पॉटलाईट ट्रॅक';

  @override
  String get spotlightTrackSubtitle =>
      'फिरणाऱ्या सावल्यांमधील चमकणाऱ्या वस्तूंचा मागोवा घ्या.';

  @override
  String get d2AttentionTitle => 'd2 लक्ष चाचणी';

  @override
  String get d2AttentionSubtitle => 'कडक निकषांसह लक्ष्य चिन्हांना टॅप करा.';

  @override
  String get dualMirrorTitle => 'दुहेरी आरसा नेव्हिगेशन';

  @override
  String get dualMirrorSubtitle => 'एकाच वेळी दोन भूलभुलैयांमधून मार्ग काढा.';

  @override
  String get contextCluesTitle => 'संदर्भ संकेत';

  @override
  String get contextCluesSubtitle => 'संदर्भ संकेतांवरून लपलेले शब्द ओळखा.';

  @override
  String get digitSpanReverseSubtitle => 'संख्यांचे अंक उलट क्रमाने आठवा.';

  @override
  String get faceNameAssociationSubtitle =>
      'सादर केलेल्या विविध चेहऱ्यांची नावे आठवा.';

  @override
  String get staircaseMemorySubtitle =>
      'टप्प्याटप्प्याने ठोकळ्यांचा क्रम लक्षात ठेवा.';

  @override
  String get choiceReactionTimeSubtitle =>
      'संकेतांशी जुळणारे विशिष्ट बटण वेगाने टॅप करा.';

  @override
  String get attentionalBlinkSubtitle =>
      'प्रवाहामध्ये चमकणारे वेगवान लक्ष्य ओळखा.';

  @override
  String get visualStatisticalLearningSubtitle =>
      'आकारांचे कालिक नमुने दृश्यमानपणे शिका.';

  @override
  String get sternbergTaskSubtitle => 'चिन्ह मेमरी सेटमध्ये होते का ते आठवा.';

  @override
  String get operationSpanSubtitle =>
      'गणित सोडवा आणि मुळाक्षरांची मालिका आठवा.';

  @override
  String get continuousRecognitionTitle => 'सतत ओळख';

  @override
  String get continuousRecognitionSubtitle =>
      'सादर केलेले कार्ड जुने आहे की नवीन ते ओळखा.';

  @override
  String get symmetrySpanTitle => 'सममिती कालावधी';

  @override
  String get symmetrySpanSubtitle =>
      'उभ्या सममिती निर्णयांदरम्यान सेलचे सहनिर्देशांक आठवा.';

  @override
  String get objectDisplacementTitle => 'वस्तू विस्थापन';

  @override
  String get objectDisplacementSubtitle =>
      'जागा अभ्यासा आणि हललेल्या एका वस्तूवर टॅप करा.';

  @override
  String get mandalaRecallTitle => 'मंडला आठवणे';

  @override
  String get mandalaRecallSubtitle =>
      'रंगीत फरशा लक्षात ठेवा आणि पॅलेटमधून मंडला पुन्हा रंगवा.';

  @override
  String get runningMemorySpanTitle => 'रनिंग मेमरी स्पॅन';

  @override
  String get runningMemorySpanSubtitle =>
      'वाहणाऱ्या अक्षरांचे निरीक्षण करा आणि शेवटच्या N वस्तू आठवा.';

  @override
  String get spatialCabinetMemoryTitle => 'स्थानिक कपाट';

  @override
  String get spatialCabinetMemorySubtitle =>
      'कपाटाच्या खणांमागील वस्तू लक्षात ठेवा आणि शोधा.';

  @override
  String get pathRecallSubtitle => 'मार्गाची निवड लक्षात ठेवा आणि पुन्हा करा.';

  @override
  String get objectShuffleSubtitle =>
      'खोल कपांखालील वस्तूंच्या अदलाबदलीचा मागोवा घ्या.';

  @override
  String get groceryListSubtitle =>
      'यादीतील वस्तू लक्षात ठेवा आणि त्यावर खुणा करा.';

  @override
  String get quickMathSubtitle => 'गणिती प्रश्न वेगाने सोडवा.';

  @override
  String get mathGuessTitle => 'गणिती अंदाज';

  @override
  String get mathGuessSubtitle => '१५ संधींमध्ये लपलेली संख्या ओळखा.';

  @override
  String get reflexTapSubtitle =>
      'जितक्या वेगाने शक्य असेल तितक्या वेगाने टॅप करा.';

  @override
  String get pixelMimicSubtitle =>
      'पिक्सेल ग्रिडवर डिझाइन नमुन्यांची नक्कल करा.';

  @override
  String get simonSequenceSubtitle => 'स्मृतीतून आकारांचा क्रम पुन्हा करा.';

  @override
  String get slidePuzzleSubtitle =>
      'चौकोनी सरकत्या फरशा पुन्हा व्यवस्थित लावा.';

  @override
  String get findWordTitle => 'शब्द शोधा';

  @override
  String get schulteTableSubtitle => 'एक ते पंचवीस पर्यंतचे अंक टॅप करा.';

  @override
  String get simonCommandTitle => 'सायमन कमांड';

  @override
  String get simonCommandSubtitle => 'आवाज सूचनांचे वेगाने पालन करा.';

  @override
  String get binaryCodeTitle => 'बायनरी स्पीड';

  @override
  String get binaryCodeSubtitle => 'बायनरी कोडचे दशांश संख्येत रूपांतर करा.';

  @override
  String get moduloClockTitle => 'मॉड्यूलो घड्याळ';

  @override
  String get moduloClockSubtitle => 'घड्याळांचा वापर करून गणिती समीकरणे सोडवा.';

  @override
  String get chimpTestTitle => 'चिपांझी चाचणी';

  @override
  String get chimpTestSubtitle => 'यादृच्छिक अंक चढत्या क्रमाने टॅप करा.';

  @override
  String get relationalMemoryTitle => 'संबंधात्मक स्मृती';

  @override
  String get relationalMemorySubtitle => 'ग्रिड वस्तूंच्या अचूक जागा आठवा.';

  @override
  String get factBinderTitle => 'फॅक्ट बाइंडर';

  @override
  String get factBinderSubtitle => 'चिन्हे जोडा आणि विधाने आठवा.';

  @override
  String get sourceMonitoringTitle => 'स्रोत देखरेख';

  @override
  String get sourceMonitoringSubtitle => 'संदर्भ लक्षात ठेवा.';

  @override
  String get klotskiTitle => 'क्लोतस्की एस्केप';

  @override
  String get klotskiSubtitle =>
      'बाहेर पडण्याच्या मार्गापर्यंत पोहोचण्यासाठी ठोकळे सरकवा.';

  @override
  String get homophoneHuntSubtitle =>
      'योग्य स्पेलिंग असलेला समानार्थी शब्द निवडा';

  @override
  String get laserLinkTitle => 'लेझر लिंक';

  @override
  String get laserLinkSubtitle =>
      'लेझर परावर्तित करण्यासाठी आणि सर्व लक्ष्यांना ऊर्जा देण्यासाठी आरसे फिरवा.';

  @override
  String get laserLinkCongrats =>
      'अचूक परावर्तन! तुम्ही संपूर्ण ग्रिड यशस्वीरित्या सक्रिय केले आहे.';

  @override
  String get crossSectionSliceTitle => 'क्रॉस-सेक्शन स्लाईस';

  @override
  String get crossSectionSliceSubtitle =>
      'विशिष्ट कोनातून 3D वस्तूचा योग्य 2D क्रॉस-सेक्शन ओळखा.';

  @override
  String get crossSectionSliceCongrats =>
      'अविश्वसनीय 3D व्हिज्युअलायझेशन! तुम्ही त्या आकाराच्या पलीकडे स्पष्टपणे पाहिले.';

  @override
  String get shadowPivotTitle => 'शॅडो पिव्होट';

  @override
  String get shadowPivotCongrats =>
      'गतिशील स्थानिक तर्क! तुम्ही प्रकाश आणि सावलीवर प्रभुत्व मिळवले.';

  @override
  String get shadowPivotSubtitle =>
      '3D वस्तू वेगवेगळ्या अक्षांवर फिरत असताना पडणाऱ्या सावलीचा अंदाज लावा.';

  @override
  String get interlockPuzzleTitle => 'इंटरलॉक कोडे';

  @override
  String get interlockPuzzleSubtitle =>
      'जटिल इंटरलॉकिंग ब्लॉक्स योग्य क्रमाने वेगळे करा किंवा एकत्र करा.';

  @override
  String get interlockPuzzleCongrats =>
      'तार्किक डिकन्स्ट्रक्शन! तुम्ही कोडे उत्तम प्रकारे उलगडले आहे.';

  @override
  String get pathIntersectTitle => 'पथ इंटरसेक्ट';

  @override
  String get pathIntersectSubtitle =>
      'विना-टक्कर त्यांच्या संबंधित लक्ष्यांपर्यंत पोहोचण्यासाठी एकाच वेळी अनेक मार्गांनी नेव्हिगेट करा.';

  @override
  String get pathIntersectCongrats =>
      'सिंक्रोनाइझ केलेले नेव्हिगेशन! तुम्ही सर्व लक्ष्यांपर्यंत बिनचूक पोहोचला आहात.';

  @override
  String get negativeSpaceDetectionTitle => 'नकारात्मक जागा';

  @override
  String get negativeSpaceDetectionSubtitle =>
      'वस्तूंमधील रिकाम्या जागेने तयार झालेला आकार ओळखा.';

  @override
  String get negativeSpaceDetectionCongrats =>
      'तीक्ष्ण आकलन! जे तिथे नाही ते पाहण्याच्या कलेत तुम्ही प्रभुत्व मिळवले आहे.';

  @override
  String get compassMazeTitle => 'होकायंत्र चक्रव्यूह';

  @override
  String get compassMazeSubtitle =>
      'तुमच्या होकायंत्राच्या अभिमुखतेनुसार हालचालींच्या दिशा बदलणाऱ्या चक्रव्यूहातून मार्ग काढा.';

  @override
  String get compassMazeCongrats =>
      'तज्ञ नेव्हिगेशन! तुम्ही बदलत्या दिशांमधून बाहेर पडण्याचा मार्ग शोधला आहे.';

  @override
  String get complexFoldingNetsTitle => 'फोल्डिंग नेट्स';

  @override
  String get complexFoldingNetsSubtitle =>
      'नॉन-स्टँडर्ड 2D नेट फोल्ड करून कोणता जटिल 3D आकार तयार होईल ते ठरवा.';

  @override
  String get complexFoldingNetsCongrats =>
      'प्रगत फोल्डिंग लॉजिक! तुम्ही 3D फॉर्म यशस्वीरित्या व्हिज्युअलाइज केला आहे.';

  @override
  String get compassMazeMessage => 'होकायंत्र वापरून चक्रव्यूहातून मार्ग काढा.';

  @override
  String get negativeSpaceDetectionMessage => 'जागेतील लपलेली वस्तू ओळखा.';

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

  @override
  String get shapeShifterTitle => 'Shape Shifter';

  @override
  String get shapeShifterSubtitle => 'Tap the target shape-color combination.';

  @override
  String get gokigenNanameTitle => 'Gokigen Naname';

  @override
  String get gokigenNanameSubtitle =>
      'Draw diagonals to connect points without loops.';

  @override
  String get matrixMultiplierTitle => 'Matrix Multiplier';

  @override
  String get matrixMultiplierSubtitle =>
      'Select a row and column to multiply to the target.';

  @override
  String get wordAssociationRecallTitle => 'Word Association';

  @override
  String get wordAssociationRecallSubtitle =>
      'Recall paired word associations from memory.';

  @override
  String get gearRotationTitle => 'Gear Rotation';

  @override
  String get gearRotationSubtitle =>
      'Predict the rotation direction of the last gear.';

  @override
  String get wordWheelTitle => 'Word Wheel';

  @override
  String get wordWheelSubtitle =>
      'Make words using letters on the wheel, including the center letter.';

  @override
  String get oddEvenFlashTitle => 'Odd-Even Flash';

  @override
  String get oddEvenFlashSubtitle =>
      'Quickly match the number parity with the color rule.';

  @override
  String get norinoriTitle => 'Norinori';

  @override
  String get norinoriSubtitle =>
      'Shade exactly two connected cells in each room.';

  @override
  String get algebraicBalanceTitle => 'Algebraic Balance';

  @override
  String get algebraicBalanceSubtitle =>
      'Solve the equations to find the target sum.';

  @override
  String get patternSequenceDrawTitle => 'Pattern Recall';

  @override
  String get patternSequenceDrawSubtitle =>
      'Repeat the animated path sequence on the grid.';

  @override
  String get tangramTitle => 'Tangram Puzzle';

  @override
  String get tangramSubtitle =>
      'Arrange the shapes to fill the target silhouette.';

  @override
  String get semanticAssociationTitle => 'Association Word';

  @override
  String get semanticAssociationSubtitle =>
      'Find the word connecting all three clues.';

  @override
  String get peripheralFocusTitle => 'Peripheral Focus';

  @override
  String get peripheralFocusSubtitle =>
      'React to flashing side panels while solving math.';

  @override
  String get masyuTitle => 'Masyu Loop';

  @override
  String get masyuSubtitle => 'Draw a single loop matching Masyu circle rules.';

  @override
  String get mathMazeTitle => 'Math Maze';

  @override
  String get mathMazeSubtitle =>
      'Trace a path that evaluates to the target total.';

  @override
  String get storyBuilderTitle => 'Story Builder';

  @override
  String get storyBuilderSubtitle =>
      'Reconstruct the chronological sequence of the story.';

  @override
  String get mirrorMazeTitle => 'Mirror Maze';

  @override
  String get mirrorMazeSubtitle =>
      'Redirect a laser beam using diagonal mirrors.';

  @override
  String get wordGridConnectionTitle => 'Word Connections';

  @override
  String get wordGridConnectionSubtitle =>
      'Group 16 words into four categories of four.';
}
