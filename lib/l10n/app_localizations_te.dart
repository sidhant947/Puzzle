// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'పజిల్ హబ్';

  @override
  String get home => 'హోమ్';

  @override
  String get settings => 'సెట్టింగ్స్';

  @override
  String get playAgain => 'మళ్ళీ ఆడండి';

  @override
  String get playNext => 'తదుపరి ప్లే చేయండి';

  @override
  String get seeCompleted => 'సమీక్ష';

  @override
  String get finish => 'ముగించు';

  @override
  String get congrats => 'అభినందనలు';

  @override
  String get perfectGradient => 'ఖచ్చితమైన గ్రేడియంట్!';

  @override
  String get wellDone => 'శభాష్';

  @override
  String get timeUp => 'సమయం ముగిసింది!';

  @override
  String get victory => 'విజయం!';

  @override
  String get gameWin => 'చాలా బాగుంది!';

  @override
  String get completed => 'పూర్తయింది!';

  @override
  String get score => 'స్కోరు';

  @override
  String get timeLeft => 'సమయం';

  @override
  String get trials => 'ప్రయత్నాలు';

  @override
  String get numberRule => 'సంఖ్య నియమం';

  @override
  String get colorRule => 'రంగు నియమం';

  @override
  String get valid => 'చెల్లుతుంది';

  @override
  String get invalid => 'చెల్లదు';

  @override
  String get even => 'సరి';

  @override
  String get odd => 'బేసి';

  @override
  String get red => 'ఎరుపు';

  @override
  String get green => 'ఆకుపచ్చ';

  @override
  String get blue => 'నీలం';

  @override
  String get yes => 'అవును';

  @override
  String get no => 'కాదు';

  @override
  String get trueLabel => 'నిజం';

  @override
  String get falseLabel => 'అబద్ధం';

  @override
  String get clear => 'క్లియర్';

  @override
  String get north => 'ఉత్తరం';

  @override
  String get south => 'దక్షిణం';

  @override
  String get east => 'తూర్పు';

  @override
  String get west => 'పడమర';

  @override
  String get target => 'లక్ష్యం';

  @override
  String get moves => 'ఎత్తుగడలు';

  @override
  String get trialMode => 'ట్రయల్ మోడ్';

  @override
  String get trialModeDescription =>
      '60 సెకన్ల టైమర్ బదులుగా 20 పరిష్కరించి ముగించండి';

  @override
  String get appearance => 'రూపురేఖలు';

  @override
  String get language => 'భాష';

  @override
  String get gameplay => 'గేమ్ ప్లే';

  @override
  String get supportUs => 'మాకు మద్దతు ఇవ్వండి';

  @override
  String get systemLegal => 'సిస్టమ్ & లీగల్';

  @override
  String get games => 'ఆటలు';

  @override
  String get solvedToday => 'ఈరోజు పరిష్కరించినవి';

  @override
  String get searchGames => 'ఆటల కోసం వెతకండి...';

  @override
  String get readyToStart =>
      'మీ మెదడుకు వ్యాయామం ప్రారంభించడానికి సిద్ధంగా ఉన్నారా?';

  @override
  String get greatStart => 'గొప్ప ప్రారంభం! ఇదే ఉత్సాహాన్ని కొనసాగించండి.';

  @override
  String get onFire => 'అద్భుతం! మీ మెదడు దీనిని ఇష్టపడుతోంది.';

  @override
  String get incredible => 'నమ్మశక్యం కానిది! మీరు పజిల్ మాస్టర్.';

  @override
  String get noGamesMatch => 'మీ వెతుకులాటకు సరిపోయే ఆటలు లేవు';

  @override
  String get categoryAll => 'అన్నీ';

  @override
  String get categoryAttention => 'ఏకాగ్రత';

  @override
  String get categoryLogic => 'తర్కం';

  @override
  String get categoryMath => 'గణితం';

  @override
  String get categoryWord => 'పదం';

  @override
  String get categoryMemory => 'జ్ఞాపకశక్తి';

  @override
  String get categorySpatial => 'స్థలసంబంధిత';

  @override
  String get themeLight => 'లైట్';

  @override
  String get themeDark => 'డార్క్';

  @override
  String get themeSystem => 'సిస్టమ్';

  @override
  String get starOnGithub => 'GitHub లో స్టార్ ఇవ్వండి';

  @override
  String get sponsorOnGithub => 'GitHub లో స్పాన్సర్ చేయండి';

  @override
  String get privacyPolicy => 'గోప్యతా విధానం';

  @override
  String get termsOfService => 'సేవా నిబంధనలు';

  @override
  String get licenses => 'లైసెన్సులు';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return 'దాగి ఉన్న $wordLength-అక్షరాల పదాన్ని కనుగొనడానికి మీకు $maxTries ప్రయత్నాలు ఉన్నాయి.';
  }

  @override
  String wordFoundMessage(String word) {
    return 'పదం విజయవంతంగా కనుగొనబడింది: $word';
  }

  @override
  String gameOverMessage(String word) {
    return 'ఆ పదం: $word';
  }

  @override
  String get gameOver => 'ఆట ముగిసింది';

  @override
  String get crosswordTitle => 'క్రాస్ వర్డ్';

  @override
  String get crosswordSubtitle =>
      'ఇచ్చిన ఆధారాల ఆధారంగా సరైన పదాలతో గ్రిడ్‌ను పూర్తి చేయండి.';

  @override
  String get wordSearchTitle => 'వర్డ్ సెర్చ్';

  @override
  String get radicalRootsTitle => 'రాడికల్ రూట్స్';

  @override
  String get radicalRootsSubtitle =>
      'ఇచ్చిన సంఖ్య యొక్క వర్గమూలం లేదా ఘనమూలాన్ని కనుగొనండి. అవసరమైతే సమీప పూర్ణాంకానికి సవరించండి.';

  @override
  String get radicalRootsGoalReached => 'లక్ష్యాన్ని చేరుకున్నారు!';

  @override
  String get radicalRootsTimeUp => 'సమయం ముగిసింది!';

  @override
  String radicalRootsScoreMessage(int score) {
    return 'మీరు $score మూలాలను సరిగ్గా లెక్కించారు!';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return 'ప్రాక్టీస్ చేస్తూ ఉండండి! మీరు $score మూలాలను లెక్కించారు.';
  }

  @override
  String get radicalRootsStart => 'లెక్కించడం ప్రారంభించండి';

  @override
  String get radicalRootsDescription =>
      'మీకు వీలైనన్ని పరిష్కరించడానికి 60 సెకన్ల సమయం ఉంది.';

  @override
  String get radicalRootsBest => 'ఉత్తమ';

  @override
  String get radicalRootsSeconds => '60 సెకన్లు';

  @override
  String get romanArithmeticTitle => 'రోమన్ అరిథ్మెటిక్';

  @override
  String get romanArithmeticSubtitle =>
      'రోమన్ అంకెలను ఉపయోగించి కూడిక మరియు తీసివేత సమస్యలను పరిష్కరించండి.';

  @override
  String get romanArithmeticGoalReached => 'సెంచూరియన్ స్థాయి!';

  @override
  String get romanArithmeticTimeUp => 'సమయం ముగిసింది!';

  @override
  String romanArithmeticScoreMessage(int score) {
    return 'మీరు $score రోమన్ సమస్యలను పరిష్కరించారు!';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return 'వేని, వీడి, వీచి! మీరు $score సమస్యలను పరిష్కరించారు.';
  }

  @override
  String get romanArithmeticStart => 'అన్వేషణ ప్రారంభించండి';

  @override
  String get romanArithmeticDescription =>
      'మార్చండి మరియు పరిష్కరించండి. మీకు 60 సెకన్లు ఉన్నాయి.';

  @override
  String get romanArithmeticBest => 'ఉత్తమ';

  @override
  String get romanArithmeticSeconds => '60 సెకన్లు';

  @override
  String get wordSearchSubtitle =>
      'గ్రిడ్‌లో దాగి ఉన్న అన్ని పదాలను కనుగొనండి. ఎంచుకోవడానికి డ్రాగ్ చేయండి.';

  @override
  String get missingVowelsTitle => 'మిస్సింగ్ వోవెల్స్';

  @override
  String get missingVowelsSubtitle => 'అచ్చులు దాగి ఉన్న పదాన్ని గుర్తించండి.';

  @override
  String get missingVowelsWin => 'అచ్చులు పునరుద్ధరించబడ్డాయి!';

  @override
  String get missingVowelsHowToPlay =>
      'ఒక పదం దాని అచ్చులు (A, E, I, O, U) దాగి ఉన్నట్లు చూపబడుతుంది. పూర్తి పదాన్ని ఊహించండి!';

  @override
  String get wordScrambleTitle => 'వర్డ్ స్క్రాంబుల్';

  @override
  String get wordScrambleSubtitle =>
      'దాగి ఉన్న పదాన్ని విప్పడానికి అక్షరాలను నొక్కండి!';

  @override
  String get wordScrambleWin => 'పదం విప్పబడింది!';

  @override
  String get sudokuTitle => 'సుడోకు';

  @override
  String get sudokuSubtitle =>
      'ప్రతి అడ్డు వరుస, నిలువు వరుస మరియు 3x3 బాక్స్‌లో 1 నుండి 9 వరకు అన్ని అంకెలు ఉండేలా గ్రిడ్‌ను పూర్తి చేయండి.';

  @override
  String get minesweeperTitle => 'మైన్‌స్వీపర్';

  @override
  String get minesweeperSubtitle => 'పేలకుండా అన్ని మైన్లను గుర్తించండి.';

  @override
  String get minesweeperWin => 'విజయం!';

  @override
  String get minesweeperMines => 'మైన్లు';

  @override
  String get minesweeperStatus => 'స్థితి';

  @override
  String get minesweeperWon => 'గెలిచారు';

  @override
  String get minesweeperBoom => 'పేలుడు';

  @override
  String get minesweeperPlaying => 'ఆడుతున్నారు';

  @override
  String get minesweeperReveal => 'బయటపెట్టు';

  @override
  String get minesweeperFlag => 'జెండా';

  @override
  String get game2048Title => '2048';

  @override
  String get game2048Subtitle =>
      'టైల్స్‌ను విలీనం చేయడానికి మరియు 2048 టైల్‌కు చేరుకోవడానికి ఏ దిశలోనైనా స్వైప్ చేయండి!';

  @override
  String get nonogramTitle => 'నోనోగ్రామ్';

  @override
  String get nonogramSubtitle =>
      'తర్కం ఆధారంగా దాగి ఉన్న చిత్రాన్ని బయటపెట్టండి.';

  @override
  String get nonogramWin => 'చిత్రం బయటపడింది!';

  @override
  String get magnetsTitle => 'అయస్కాంతాలు';

  @override
  String get magnetsSubtitle =>
      'పోల్ కౌంట్ల ఆధారంగా గ్రిడ్‌లో అయస్కాంతాలను ఉంచండి.';

  @override
  String get magnetsHowToPlay =>
      'డొమినో పరిమాణపు కంటైనర్‌లను \'+\' మరియు \'-\' అయస్కాంతాలతో నింపండి లేదా ఖాళీగా వదిలివేయండి. అడ్డు వరుస మరియు నిలువు వరుస ఆధారాలు ఆ లైన్‌లోని ప్రతి పోల్ యొక్క మొత్తం సంఖ్యను తెలియజేస్తాయి. ఒకే రకమైన పోల్స్ పక్కపక్కనే ఉండకూడదు.';

  @override
  String get magnetsWinTitle => 'ధృవణత సమతుల్యం!';

  @override
  String get magnetsWinMessage => 'అన్ని అయస్కాంతాలు సరిగ్గా అమర్చబడ్డాయి!';

  @override
  String get lighthousesTitle => 'లైట్‌హౌస్‌లు';

  @override
  String get lighthousesSubtitle => 'లైట్‌హౌస్ క్లూల ఆధారంగా షిప్పులను ఉంచండి.';

  @override
  String get lighthousesHowToPlay =>
      'గ్రిడ్‌లో 1x1 షిప్పులను ఉంచండి. లైట్‌హౌస్‌లు అడ్డంగా మరియు నిలువుగా కనిపించే షిప్పుల మొత్తం సంఖ్యను సూచిస్తాయి. షిప్పులు లైట్‌హౌస్‌లను లేదా ఒకదానికొకటి తాకకూడదు, వికర్ణంగా కూడా.';

  @override
  String get lighthousesWinTitle => 'సముద్రం సురక్షితం!';

  @override
  String get lighthousesWinMessage =>
      'అన్ని లైట్‌హౌస్‌లు షిప్పులకు సరిగ్గా మార్గనిర్దేశం చేస్తున్నాయి!';

  @override
  String get dominosaTitle => 'డొమినోసా';

  @override
  String get dominosaSubtitle =>
      'గ్రిడ్‌లో దాగి ఉన్న అన్ని డొమినోలను కనుగొనండి.';

  @override
  String get dominosaHowToPlay =>
      'సంఖ్యల గ్రిడ్‌పై పూర్తి డొమినోల సెట్‌ను అమర్చండి, తద్వారా పక్కపక్కనే ఉన్న సంఖ్యల ప్రతి జంట సరిగ్గా ఒక డొమినోతో కప్పబడి ఉంటుంది. ప్రతి సంఖ్య జంట సెట్‌లో ఒకసారి మాత్రమే ఉంటుంది.';

  @override
  String get dominosaWinTitle => 'డొమినో మాస్టర్!';

  @override
  String get dominosaWinMessage => 'ప్రతి డొమినో కనుగొనబడింది మరియు ఉంచబడింది!';

  @override
  String get skyscrapersTitle => 'స్కైస్క్రాపర్స్';

  @override
  String get skyscrapersSubtitle => 'గ్రిడ్‌ను భవనాల ఎత్తులతో నింపండి.';

  @override
  String get skyscrapersHowToPlay =>
      'ప్రతి అడ్డు వరుస మరియు నిలువు వరుసలో ప్రతి ఎత్తు సరిగ్గా ఒకసారి ఉండేలా గ్రిడ్‌ను ఎత్తులతో (1-N) నింపండి. అంచులలోని క్లూలు ఆ దిశ నుండి ఎన్ని భవనాలు కనిపిస్తాయో సూచిస్తాయి, ఎత్తైన భవనాలు తక్కువ ఎత్తు ఉన్న భవనాలను అడ్డుకుంటాయి.';

  @override
  String get skyscrapersWinTitle => 'స్కైలైన్ పునరుద్ధరించబడింది!';

  @override
  String get skyscrapersWinMessage => 'అన్ని భవనాలు సరిగ్గా అమర్చబడ్డాయి!';

  @override
  String get nurikabeTitle => 'నూరికాబే';

  @override
  String get nurikabeSubtitle =>
      'అనుసంధానించబడిన సముద్రం మరియు విడివిడి ద్వీపాలను ఏర్పాటు చేయండి.';

  @override
  String get nurikabeHowToPlay =>
      'ఒకే అనుసంధానించబడిన \'సముద్రం\' (2x2 బ్లాక్‌లు ఉండకూడదు) ఏర్పరచడానికి సెల్‌లను షేడ్ చేయండి. షేడ్ చేయని సెల్‌లు \'ద్వీపాలను\' ఏర్పరుస్తాయి, ప్రతి ద్వీపంలో దాని మొత్తం వైశాల్యాన్ని సూచించే ఖచ్చితంగా ఒక సంఖ్య ఉంటుంది.';

  @override
  String get nurikabeWinTitle => 'సముద్రం ప్రవహిస్తోంది!';

  @override
  String get nurikabeWinMessage => 'ద్వీపాలు విడిపోయాయి, సముద్రం కలిసింది!';

  @override
  String get fillominoTitle => 'ఫిల్లోమినో';

  @override
  String get fillominoSubtitle =>
      'గ్రిడ్‌ను నిర్దేశించిన పరిమాణాల పాలిమినోలుగా విభజించండి.';

  @override
  String get fillominoHowToPlay =>
      'గ్రిడ్‌ను పాలిమినోలుగా విభజించండి, తద్వారా N పరిమాణం కలిగిన ప్రతి పాలిమినో దానిలోని అన్ని సెల్‌లలో N సంఖ్యను కలిగి ఉంటుంది. ఒకే పరిమాణం కలిగిన పాలిమినోలు పక్కపక్కనే ఉండకూడదు.';

  @override
  String get fillominoWinTitle => 'గ్రిడ్ విభజించబడింది!';

  @override
  String get fillominoWinMessage => 'తర్కంతో సరిగ్గా అమర్చబడింది!';

  @override
  String get hitoriTitle => 'హిటోరి';

  @override
  String get hitoriSubtitle =>
      'ప్రతి అడ్డు వరుస మరియు నిలువు వరుసలో ఉన్న నకిలీ సంఖ్యలను షేడ్ చేయండి.';

  @override
  String get hitoriHowToPlay =>
      'ఏ అడ్డు వరుస లేదా నిలువు వరుసలోనైనా ఏ సంఖ్య ఒకటి కంటే ఎక్కువసార్లు కనిపించకుండా సెల్‌లను షేడ్ చేయండి. షేడ్ చేసిన సెల్‌లు పక్కపక్కనే ఉండకూడదు మరియు షేడ్ చేయని సెల్‌లన్నీ ఒకే అనుసంధానించబడిన సమూహంగా ఉండాలి.';

  @override
  String get hitoriWinTitle => 'హిటోరి మాస్టర్!';

  @override
  String get hitoriWinMessage =>
      'మీరు విజయవంతంగా అన్ని నకిలీలను పరిష్కరించారు!';

  @override
  String get pathFinderTitle => 'పాత్ ఫైండర్';

  @override
  String get pathFinderSubtitle =>
      'S నుండి E వరకు దాగి ఉన్న మార్గాన్ని కనుగొనండి.';

  @override
  String get pathFinderWin => 'మార్గం కనుగొనబడింది!';

  @override
  String get howToPlay => 'ఎలా ఆడాలి';

  @override
  String get gotIt => 'అర్థమైంది';

  @override
  String get akariTitle => 'అకారీ';

  @override
  String get akariSubtitle => 'అన్ని తెల్లటి గడులను వెలిగించండి';

  @override
  String get akariHowToPlay =>
      'మొత్తం గ్రిడ్‌ను వెలిగించడానికి తెల్లటి గడులలో లైట్ బల్బులను ఉంచండి. బల్బులు గోడ తగిలే వరకు వాటి వరుస మరియు నిలువు వరుసను వెలిగిస్తాయి. ఏ రెండు బల్బులు ఒకదానిపై ఒకటి ప్రకాశించకూడదు. సంఖ్యల గోడలు ఆనుకుని ఉన్న గడులలో (పైన, కింద, ఎడమ, కుడి) సరిగ్గా ఎన్ని బల్బులు ఉంచాలో చూపుతాయి.';

  @override
  String get akariWinTitle => 'లైట్లు వెలిగాయి!';

  @override
  String get akariWinMessage => 'అన్నీ ఖచ్చితంగా వెలిగిపోయాయి.';

  @override
  String get arithmeticChainTitle => 'చైన్ కాల్క్';

  @override
  String get arithmeticChainSubtitle =>
      'మీ మనసులో రన్నింగ్ టోటల్‌ను లెక్కించండి';

  @override
  String get arithmeticChainWinTitle => 'లెవల్ అప్!';

  @override
  String get arithmeticChainWinMessage => 'మీ మానసిక గణన పదునుగా ఉంది!';

  @override
  String get arithmeticChainLoseTitle => 'మళ్ళీ ప్రయత్నించండి';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return 'సరైన సమాధానం $answer.';
  }

  @override
  String get arithmeticChainStart => 'ప్రారంభించు';

  @override
  String get arithmeticChainNext => 'తదుపరి';

  @override
  String get attentionalBlinkTitle => 'అటెన్షనల్ బ్లింక్';

  @override
  String get attentionalBlinkSubtitleWatch => 'సంఖ్యల కోసం చూడండి';

  @override
  String get attentionalBlinkSubtitleInput =>
      'మీరు చూసిన రెండు సంఖ్యలను నమోదు చేయండి';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return 'మీరు $score లక్ష్యాలను స్కోర్ చేశారు!';
  }

  @override
  String get balanceScaleTitle => 'బ్యాలెన్స్ స్కేల్';

  @override
  String get balanceScaleSubtitle =>
      'త్రాసుల ఆధారంగా చివరి వస్తువు బరువును ఊహించండి.';

  @override
  String get balanceScaleWinTitle => 'సమతుల్యం!';

  @override
  String get balanceScaleWinMessage => 'మీరు బరువును సరిగ్గా ఊహించారు!';

  @override
  String get balanceScaleLoseTitle => 'అసమతుల్యం';

  @override
  String get balanceScaleLoseMessage =>
      'సరైన బ్యాలెన్స్‌ను కనుగొనడానికి మళ్ళీ ప్రయత్నించండి.';

  @override
  String get balanceScaleBack => 'వెనుకకు';

  @override
  String get balanceScaleSubmit => 'సమర్పించు';

  @override
  String get binaryPuzzleTitle => 'బైనరీ పజిల్';

  @override
  String get binaryPuzzleSubtitle =>
      '0 మరియు 1 తో నింపండి. ఒకే అంకె పక్కపక్కన గరిష్టంగా రెండు మాత్రమే ఉండాలి. ప్రతి అడ్డు మరియు నిలువు వరుసలో సమానంగా 0లు మరియు 1లు ఉండాలి.';

  @override
  String get binaryPuzzleWinTitle => 'శభాష్';

  @override
  String get binaryPuzzleWinMessage =>
      'మీరు ఖచ్చితమైన తర్కంతో బైనరీ పజిల్‌ను పరిష్కరించారు!';

  @override
  String get blockEscapeTitle => 'బ్లాక్ ఎస్కేప్';

  @override
  String get blockEscapeSubtitle =>
      'ప్రధాన బ్లాక్ బయటకు వెళ్ళడానికి మార్గం సుగమం చేయడానికి బ్లాకులను జరపండి.';

  @override
  String get blockEscapeWinTitle => 'తప్పించుకున్నారు!';

  @override
  String get blockEscapeWinMessage =>
      'మీరు ప్రధాన బ్లాక్ కోసం మార్గాన్ని విజయవంతంగా క్లియర్ చేశారు!';

  @override
  String get boxCompletionTitle => 'బాక్స్ కంప్లీషన్';

  @override
  String get boxCompletionSubtitle => 'ఏ ఘనాన్ని ఏర్పరచవచ్చు?';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return 'మీరు $totalTrials ప్రయత్నాలలో $score సరైనవి సాధించారు!';
  }

  @override
  String get boxCompletionOptions => 'ఆప్షన్స్';

  @override
  String get bridgesTitle => 'బ్రిడ్జెస్';

  @override
  String get bridgesSubtitle =>
      'ద్వీపాలను వంతెనలతో అనుసంధానించండి. ప్రతి ద్వీపానికి నిర్దిష్ట సంఖ్యలో వంతెనలు అవసరం. వంతెనలు ఒకదానికొకటి దాటకూడదు.';

  @override
  String get bridgesWinTitle => 'అనుసంధానించబడింది!';

  @override
  String get bridgesWinMessage =>
      'మీరు అన్ని ద్వీపాలను విజయవంతంగా అనుసంధానించారు!';

  @override
  String get calculationSprintTitle => 'లెక్కల పరుగు';

  @override
  String get calculationSprintSubtitle =>
      '60 సెకన్లలో వీలైనన్ని సమీకరణాలను పరిష్కరించండి.';

  @override
  String get calculationSprintGoalReached => 'లక్ష్యాన్ని చేరుకున్నారు!';

  @override
  String get calculationSprintTimeUp => 'సమయం ముగిసింది';

  @override
  String calculationSprintScoreMessage(int score) {
    return 'అద్భుతమైన గణన వేగం! మీరు $score పాయింట్లు సాధించారు.';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return 'మీరు $score పాయింట్లు సాధించారు. మీ ఉత్తమ స్కోరును అధిగమించడానికి ప్రయత్నించండి!';
  }

  @override
  String get calculationSprintBest => 'ఉత్తమ';

  @override
  String get calculationSprintSeconds => '60 సెకన్లు';

  @override
  String get calculationSprintDescription =>
      'సమీకరణాలను వేగంగా పరిష్కరించండి.\nతప్పు సమాధానాలకు 3 సెకన్లు తగ్గుతాయి!';

  @override
  String get calculationSprintStart => 'స్ప్రింట్ ప్రారంభించండి';

  @override
  String get categoryFluencyTitle => 'కేటగిరీ ఫ్లూయెన్సీ';

  @override
  String get categoryFluencySubtitle =>
      'కేటగిరీకి చెందిన వస్తువులను నమోదు చేయండి';

  @override
  String get categoryFluencyExpert => 'ఫ్లూయెన్సీ నిపుణుడు!';

  @override
  String get categoryFluencyTimeUp => 'సమయం ముగిసింది!';

  @override
  String get categoryFluencyWinMessage => 'మీకు విస్తారమైన పదజాలం ఉంది!';

  @override
  String categoryFluencyFoundMessage(int count) {
    return 'మీరు $count పదాలను కనుగొన్నారు.';
  }

  @override
  String get categoryFluencyCategoryLabel => 'కేటగిరీ:';

  @override
  String get categoryFluencyEnterItem => 'ఒక వస్తువును నమోదు చేయండి...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target పదాలు';
  }

  @override
  String get changeBlindnessTitle => 'ఛేంజ్ బ్లైండ్‌నెస్';

  @override
  String get changeBlindnessSubtitle => 'మారుతున్న వస్తువును గుర్తించండి';

  @override
  String changeBlindnessScore(int score) {
    return 'స్కోరు: $score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return 'మీరు $score మార్పులను కనుగొన్నారు!';
  }

  @override
  String get choiceRtTitle => 'చాయిస్ RT';

  @override
  String get choiceRtSubtitle => 'యాక్టివ్ స్క్వేర్‌ను వీలైనంత వేగంగా నొక్కండి';

  @override
  String choiceRtAvgMessage(String avg) {
    return 'మీ సగటు ప్రతిచర్య సమయం: ${avg}ms';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return 'మిగిలి ఉన్న సమయం: ${time}s';
  }

  @override
  String choiceRtTaps(int count) {
    return 'నొక్కినవి: $count';
  }

  @override
  String get colorFloodTitle => 'కలర్ ఫ్లడ్';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return 'ఎత్తుగడలు: $moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => 'ఫ్లడ్ సక్సెస్!';

  @override
  String get colorFloodDryLand => 'డ్రై ల్యాండ్...';

  @override
  String get colorFloodWinMessage => 'మీరు మొత్తం గ్రిడ్‌ను రంగుతో నింపారు!';

  @override
  String get colorFloodLoseMessage =>
      'మీ ఎత్తుగడలు పూర్తయ్యాయి. మళ్ళీ ప్రయత్నించండి!';

  @override
  String get colorMatchTitle => 'కలర్ మ్యాచ్';

  @override
  String get colorMatchSubtitle =>
      'టార్గెట్ రంగుతో వీలైనంత దగ్గరగా సరిపోలడానికి స్లైడర్‌లను సర్దుబాటు చేయండి.';

  @override
  String get colorMatchTarget => 'టార్గెట్';

  @override
  String get colorMatchYours => 'మీది';

  @override
  String get colorMatchCheck => 'మ్యాచ్ తనిఖీ చేయండి';

  @override
  String get colorMatchResult => 'మ్యాచ్ ఫలితం';

  @override
  String colorMatchAccuracy(String accuracy) {
    return 'మీ ఖచ్చితత్వం: $accuracy%';
  }

  @override
  String get corsiBlocksTitle => 'కోర్సీ బ్లాక్స్';

  @override
  String get corsiBlocksSubtitle =>
      'బ్లాక్స్ వెలగడం చూడండి మరియు అదే క్రమంలో వాటిని నొక్కండి.';

  @override
  String get corsiBlocksWinTitle => 'స్థలసంబంధిత మాస్టర్!';

  @override
  String get corsiBlocksLoseTitle => 'స్థలంలో తప్పిపోయారు';

  @override
  String corsiBlocksMessage(int score, int span) {
    return 'మీరు $score వరుస క్రమాలను గుర్తుంచుకున్నారు! మీ జ్ఞాపకశక్తి సామర్థ్యం $span కి చేరుకుంది.';
  }

  @override
  String get corsiBlocksWatch => 'నమూనాను చూడండి';

  @override
  String get corsiBlocksRepeat => 'నమూనాను పునరావృతం చేయండి';

  @override
  String get corsiBlocksExcellent => 'అద్భుతం!';

  @override
  String get corsiBlocksSpan => 'సామర్థ్యం';

  @override
  String get crownTitle => 'కిరీటం';

  @override
  String get crownSubtitle =>
      'ప్రతి అడ్డు వరుస, నిలువు వరుస మరియు రంగు ప్రాంతంలో ఒక కిరీటాన్ని ఉంచండి. కిరీటాలు పక్కపక్కనే ఉండకూడదు, మూలల్లో కూడా ఉండకూడదు.';

  @override
  String get crownCrowned => 'కిరీటం ఉంచబడింది!';

  @override
  String get crownSuccess =>
      'ఖచ్చితమైన తర్కంతో అన్ని కిరీటాలు విజయవంతంగా ఉంచబడ్డాయి.';

  @override
  String get cryptogramTitle => 'క్రిప్టోగ్రామ్';

  @override
  String get cryptogramSubtitle =>
      'రహస్య సందేశాన్ని డీకోడ్ చేయడానికి అక్షరాలను కేటాయించండి! ప్రతి ఎన్‌కోడ్ చేసిన అక్షరం ఒక నిజమైన అక్షరాన్ని సూచిస్తుంది.';

  @override
  String get cryptogramBroken => 'కోడ్ ఛేదించబడింది!';

  @override
  String get cryptogramEncrypted => 'ఎన్‌క్రిప్ట్ చేయబడింది';

  @override
  String get cryptogramSuccess => 'మీరు సందేశాన్ని ఖచ్చితంగా డీకోడ్ చేశారు.';

  @override
  String get cryptogramTryAgain =>
      'ఎన్‌క్రిప్షన్‌ను ఛేదించడానికి మళ్ళీ ప్రయత్నించండి.';

  @override
  String get digitSpanReverseTitle => 'రివర్స్ స్పాన్';

  @override
  String get digitSpanReverseSubtitleMemorize => 'అంకెలను గుర్తుంచుకోండి';

  @override
  String get digitSpanReverseSubtitleEnter =>
      'అంకెలను రివర్స్ క్రమంలో నమోదు చేయండి';

  @override
  String get digitSpanReverseWinTitle => 'లెవల్ అప్!';

  @override
  String get digitSpanReverseWinMessage => 'మీ జ్ఞాపకశక్తి ఆకట్టుకుంటుంది!';

  @override
  String get digitSpanReverseLoseTitle => 'మళ్ళీ ప్రయత్నించండి';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return 'సరైన రివర్స్ క్రమం $sequence.';
  }

  @override
  String get dividedAttentionTitle => 'డివైడెడ్ అటెన్షన్';

  @override
  String get dividedAttentionSubtitle =>
      'స్టార్ ⭐ కోసం ఎడమవైపు నొక్కండి | ఎరుపు 🔴 కోసం కుడివైపు నొక్కండి';

  @override
  String get dividedAttentionGameOverTitle => 'ఏకాగ్రత దెబ్బతింది';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return 'మల్టీటాస్కింగ్ కష్టం! మీ స్కోరు $score.';
  }

  @override
  String dividedAttentionScore(int score) {
    return 'స్కోరు: $score';
  }

  @override
  String get doubleNBackTitle => 'డబుల్ N-బ్యాక్';

  @override
  String doubleNBackSubtitle(int n) {
    return '$n అడుగుల వెనుక ఉన్న ఉద్దీపనలతో సరిపోల్చండి';
  }

  @override
  String get doubleNBackGameOverTitle => 'ఆట ముగిసింది';

  @override
  String doubleNBackGameOverMessage(int score) {
    return 'మీరు డబుల్ N-బ్యాక్‌లో $score పాయింట్లు సాధించారు!';
  }

  @override
  String doubleNBackScore(int score) {
    return 'స్కోరు: $score';
  }

  @override
  String get doubleNBackPositionMatch => 'స్థానం మ్యాచ్';

  @override
  String get doubleNBackLetterMatch => 'అక్షరం మ్యాచ్';

  @override
  String get faceNameAssociationTitle => 'ముఖం-పేరు';

  @override
  String get faceNameAssociationSubtitleStudy =>
      'ప్రతి ముఖానికి పేరును గుర్తుంచుకోండి';

  @override
  String get faceNameAssociationSubtitleTest => 'ఇది ఎవరు?';

  @override
  String get faceNameAssociationPerfect => 'ఖచ్చితం!';

  @override
  String get faceNameAssociationGameOver => 'ఆట ముగిసింది';

  @override
  String get faceNameAssociationWinMessage =>
      'ముఖాలను మరియు పేర్లను గుర్తుంచుకోవడంలో మీకు గొప్ప జ్ఞాపకశక్తి ఉంది!';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return 'మీరు $total కి $correct సరైనవి సాధించారు.';
  }

  @override
  String get faceNameAssociationStartTest => 'పరీక్ష ప్రారంభించండి';

  @override
  String get flankerTestWinTitle => 'లేజర్ ఫోకస్!';

  @override
  String get flankerTestLoseTitle => 'ఏకాగ్రత తప్పింది';

  @override
  String flankerTestScoreMessage(int score) {
    return 'మీరు $score సరైనవి సాధించారు!';
  }

  @override
  String get flankerTestTitle => 'ఫ్లాంకర్ టెస్ట్';

  @override
  String get flankerTestSubtitle =>
      'పక్కన ఉన్న బాణాలను విస్మరించి, మధ్యలో ఉన్న బాణం దిశను సూచించండి.';

  @override
  String get flankerTestLeft => 'ఎడమ';

  @override
  String get flankerTestRight => 'కుడి';

  @override
  String get fractionMatchTitle => 'ఫ్రాక్షన్ మ్యాచ్';

  @override
  String get fractionMatchSubtitle => 'చిత్రాన్ని దాని భిన్నంతో సరిపోల్చండి';

  @override
  String get fractionMatchLoseTitle => 'భిన్నం సరిపోలలేదు';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return 'సరైన సమాధానం $correctAnswer.';
  }

  @override
  String get goNoGoTitle => 'గో / నో-గో';

  @override
  String get goNoGoSubtitle => 'ఆకుపచ్చ కోసం నొక్కండి, ఎరుపును విస్మరించండి!';

  @override
  String get goNoGoLoseTitle => 'ప్రతిచర్య ఆగిపోయింది';

  @override
  String get goNoGoLoseMessage => 'మీ నియంత్రణ పరీక్షించబడుతోంది!';

  @override
  String get goNoGoTapAnywhere => 'ప్రారంభించడానికి ఎక్కడైనా నొక్కండి';

  @override
  String get groceryListTitle => 'సరుకుల జాబితా';

  @override
  String get groceryListSubtitleMemorize =>
      'వస్తువులను మరియు వాటి కేటగిరీలను గుర్తుంచుకోండి';

  @override
  String get groceryListSubtitleTest => 'ఈ వస్తువు ఏ కేటగిరీకి చెందినది?';

  @override
  String get groceryListWinTitle => 'గ్రోసరీ గురు!';

  @override
  String get groceryListLoseTitle => 'ఏదైనా మర్చిపోయారా?';

  @override
  String groceryListScoreMessage(int score) {
    return 'మీరు సరుకుల జాబితాలో $score పాయింట్లు సాధించారు!';
  }

  @override
  String get groceryListReady => 'నేను సిద్ధం';

  @override
  String get groceryListWhereBelong => 'ఇది ఎక్కడ ఉండాలి?';

  @override
  String get hueSortTitle => 'హ్యూ సార్ట్';

  @override
  String get hueSortSubtitle =>
      'మూలల రంగుల మధ్య సున్నితమైన మార్పును సృష్టించడానికి టైల్స్‌ను మార్చండి. చుక్కలు స్థిరమైన టైల్స్‌ను సూచిస్తాయి.';

  @override
  String get hueSortWinTitle => 'ఖచ్చితమైన గ్రేడియంట్!';

  @override
  String get hueSortWinMessage => 'మీరు రంగులను ఖచ్చితంగా క్రమబద్ధీకరించారు!';

  @override
  String hueSortWrongTiles(int count) {
    return 'తప్పు స్థానంలో ఉన్న టైల్స్: $count';
  }

  @override
  String get kenkenTitle => 'కెన్‌కెన్';

  @override
  String get kenkenWinTitle => 'మేధావి!';

  @override
  String get kenkenLoseTitle => 'ఆట ముగిసింది';

  @override
  String get kenkenWinMessage => 'మీరు కెన్‌కెన్ పజిల్‌ను పరిష్కరించారు!';

  @override
  String get kenkenLoseMessage =>
      'అడ్డు/నిలువు వరుస మరియు కేజ్ నియమాలను తనిఖీ చేయండి.';

  @override
  String kenkenSubtitle(int size) {
    return 'అడ్డు/నిలువు వరుసలలో పునరావృతం కాకుండా 1-$size నింపండి';
  }

  @override
  String get letterCancellationTitle => 'లెటర్ క్యాన్సిల్';

  @override
  String get letterCancellationTitleFull => 'లెటర్ క్యాన్సిలేషన్';

  @override
  String letterCancellationScoreMessage(int score) {
    return 'మీరు $score అక్షరాలను కనుగొన్నారు!';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return '\"$target\" అక్షరాలన్నీ కనుగొనండి';
  }

  @override
  String get letterCancellationFound => 'కనుగొన్నారు';

  @override
  String get letterCancellationTime => 'సమయం';

  @override
  String get lightsOutTitle => 'లైట్స్ అవుట్';

  @override
  String get lightsOutSubtitle =>
      'ఒక టైల్‌ను నొక్కితే అది మరియు దాని పక్కన ఉన్నవి మారుతాయి. పరిష్కరించడానికి అన్ని లైట్లను ఆపివేయండి.';

  @override
  String get lightsOutWinTitle => 'పజిల్ పరిష్కరించబడింది!';

  @override
  String get lightsOutWinMessage => 'మీరు విజయవంతంగా అన్ని లైట్లను ఆపివేశారు!';

  @override
  String get symmetryTitle => 'సిమ్మెట్రీ';

  @override
  String get symmetrySubtitle =>
      'ఎడమవైపు ఉన్న నమూనాను కుడివైపు ఉన్న ఖాళీ గ్రిడ్‌పై ప్రతిబింబించండి.';

  @override
  String get semanticLinkTitle => 'సెమాంటిక్ లింక్';

  @override
  String get semanticLinkSubtitle => 'మూడింటినీ కలిపే పదాన్ని కనుగొనండి';

  @override
  String get reflexTapTitle => 'రిఫ్లెక్స్ ట్యాప్';

  @override
  String get visualStatisticalLearningTitle =>
      'విజువల్ స్టాటిస్టికల్ లెర్నింగ్';

  @override
  String get orbitTapTitle => 'ఆర్బిట్ ట్యాప్';

  @override
  String get orbitTapSubtitle => 'బంతులు గేటుతో సమలేఖనం అయినప్పుడు నొక్కండి';

  @override
  String get schulteTableTitle => 'షుల్టే టేబుల్';

  @override
  String get multipleObjectTrackingTitle => 'ఆబ్జెక్ట్ ట్రాకర్';

  @override
  String get multipleObjectTrackingSubtitle =>
      'హైలైట్ చేసిన వస్తువులను చూడండి. అవి కదులుతున్నప్పుడు వాటిని ట్రాక్ చేయండి, ఆపై వాటిని ఎంచుకోండి.';

  @override
  String get sdmtTitle => 'Sdmt పరీక్ష';

  @override
  String get sdmtSubtitle =>
      'చూపిన గుర్తుకు అంకెను కనుగొనడానికి పైన ఉన్న కీని ఉపయోగించండి.';

  @override
  String get memoryMatrixTitle => 'మెమరీ మ్యాట్రిక్స్';

  @override
  String get memoryMatrixSubtitle =>
      'నమూనాను గుర్తుంచుకోండి మరియు టైల్స్‌ను నొక్కండి.';

  @override
  String get mentalAbacusTitle => 'మెంటల్ అబాకస్';

  @override
  String get mentalAbacusSubtitle => 'సోరోబాన్ ఉపయోగించి పరిష్కరించండి';

  @override
  String get spellingSprintTitle => 'స్పెల్లింగ్ స్ప్రింట్';

  @override
  String get spellingSprintSubtitle =>
      'వీలైనన్ని పదాల స్పెల్లింగ్‌లను వేగంగా చెప్పండి.';

  @override
  String get stopSignalTitle => 'స్టాప్ సిగ్నల్';

  @override
  String get stopSignalSubtitle =>
      'బాణం దిశలో నొక్కండి, కానీ బాణం ఎరుపు రంగులోకి మారితే వెంటనే ఆపండి.';

  @override
  String get staircaseMemoryTitle => 'స్టెయిర్‌కేస్ మెమరీ';

  @override
  String get vigilanceTaskTitle => 'విజిలెన్స్ టాస్క్';

  @override
  String get vigilanceTaskSubtitle =>
      'ముల్లు ఒక స్థానాన్ని దాటినప్పుడు బటన్ నొక్కండి';

  @override
  String get logicalSyllogismsTitle => 'లాజికల్ సిలోజిజమ్స్';

  @override
  String get logicalSyllogismsSubtitle => 'ముగింపు తార్కికంగా చెల్లుతుందా?';

  @override
  String get mathPathTitle => 'మ్యాథ్ పాత్';

  @override
  String get mathPathSubtitle =>
      'లక్ష్య మొత్తానికి సరిగ్గా సరిపోయే మార్గాన్ని కనుగొనండి.';

  @override
  String get sternbergTaskTitle => 'స్టెర్న్‌బర్గ్ టాస్క్';

  @override
  String get sternbergTaskMemorize => 'అక్షరాలను గుర్తుంచుకోండి';

  @override
  String get sternbergTaskWasLetterSet => 'ఈ అక్షరం సెట్‌లో ఉందా?';

  @override
  String sternbergTaskScore(int score) {
    return 'మీరు స్టెర్న్‌బర్గ్ టాస్క్‌లో $score పాయింట్లు సాధించారు!';
  }

  @override
  String get verbalAnalogiesTitle => 'శాబ్దిక పోలికలు';

  @override
  String get verbalAnalogiesSubtitle => 'సంబంధాన్ని పూర్తి చేయండి';

  @override
  String get typingSpeedTitle => 'టైపింగ్ వేగం';

  @override
  String get typingSpeedSubtitle =>
      'చూపిన వాక్యాన్ని వీలైనంత వేగంగా ఖచ్చితంగా టైప్ చేయండి!';

  @override
  String get wordLadderTitle => 'వర్డ్ లాడర్';

  @override
  String get wordLadderSubtitle =>
      'ఒక్కో అక్షరాన్ని మారుస్తూ పదాలను అనుసంధానించండి.';

  @override
  String get tangleFixTitle => 'చిక్కుముడిని విప్పడం';

  @override
  String get tangleFixSubtitle =>
      'లైన్లు ఒకదానికొకటి తాకకుండా చిక్కు వీడదీయండి';

  @override
  String get oddRotationTitle => 'ఆడ్ రొటేషన్';

  @override
  String get oddRotationSubtitle =>
      'వీటిలో ఒకటి ప్రతిబింబించబడింది. మీరు దానిని కనుగొనగలరా?';

  @override
  String get towerOfLondonTitle => 'టవర్ ఆఫ్ లండన్';

  @override
  String get towerOfLondonSubtitle => 'లక్ష్య నమూనాతో సరిపోల్చండి';

  @override
  String get symbolicFlankerTitle => 'సింబాలిక్ ఫ్లాంకర్';

  @override
  String get symbolicFlankerSubtitle => 'మధ్య గుర్తుపై దృష్టి పెట్టండి';

  @override
  String get stroopTestTitle => 'స్ట్రూప్ టెస్ట్';

  @override
  String get stroopTestSubtitle =>
      'చూపిన పదం యొక్క రంగును గుర్తించండి. పదం దేనిని సూచిస్తుందో విస్మరించండి!';

  @override
  String get wisconsinCardSortingTitle => 'विस्काన్సిన్ కార్డ్ సార్టింగ్';

  @override
  String get wisconsinCardSortingSubtitle =>
      'కార్డును పైన ఉన్న నాలుగింటిలో ఒకదానితో సరిపోల్చండి';

  @override
  String get nBackTitle => 'N-బ్యాక్ టెస్ట్';

  @override
  String get nBackSubtitle =>
      'ప్రస్తుత అక్షరం 2 అడుగుల క్రితం చూపిన అక్షరంతో సరిపోలితే MATCH నొక్కండి.';

  @override
  String get rhythmMasterTitle => 'రిథమ్ మాస్టర్';

  @override
  String get rhythmMasterSubtitle => 'లయకు అనుగుణంగా నొక్కండి';

  @override
  String get pixelMimicTitle => 'పిక్సెల్ మిమిక్';

  @override
  String get targetNumberTitle => 'టార్గెట్ 24';

  @override
  String targetNumberSubtitle(int target) {
    return '$target కి చేరుకోవడానికి మొత్తం 4 సంఖ్యలను ఉపయోగించండి';
  }

  @override
  String get mirrorTracingTitle => 'మిర్రర్ ట్రేసింగ్';

  @override
  String get mirrorTracingSubtitle =>
      'స్టార్‌ను ట్రేస్ చేయండి! నియంత్రణలు ప్రతిబింబించబడతాయి.';

  @override
  String get wordSurgeTitle => 'వర్డ్ సర్జ్';

  @override
  String get wordSurgeSubtitle => 'పర్యాయపదాలు & వ్యతిరేక పదాలు';

  @override
  String get perspectiveTakingTitle => 'దృక్పథం తీసుకోవడం';

  @override
  String get perspectiveTakingTopDownView => 'టాప్-డౌన్ వ్యూ';

  @override
  String get perspectiveTakingChoosePerspective => 'దృక్పథాన్ని ఎంచుకోండి';

  @override
  String get perspectiveTakingCongrats =>
      'స్థలసంబంధిత సంబంధాలపై మీకు మంచి అవగాహన ఉంది.';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return '$targetDirName నుండి ఏ వ్యూ కనిపిస్తుంది?';
  }

  @override
  String get paperFoldingTitle => 'పేపర్ ఫోల్డింగ్';

  @override
  String get paperFoldingSubtitle => 'విప్పినప్పుడు ఇది ఎలా కనిపిస్తుంది?';

  @override
  String get waterSortTitle => 'వాటర్ సార్టింగ్';

  @override
  String get waterSortSubtitle =>
      'ప్రతి ట్యూబ్‌లో ఒకే రంగు ఉండేలా రంగులను క్రమబద్ధీకరించండి.';

  @override
  String get numericalEstimationTitle => 'సంఖ్యా అంచనా';

  @override
  String get numericalEstimationSubtitle =>
      'సమీప సమాధానాన్ని వేగంగా ఎంచుకోండి!';

  @override
  String get lockPatternTitle => 'లాక్ ప్యాటర్న్';

  @override
  String get lockPatternSubtitle =>
      'రహస్య నమూనాను కనుగొనండి. ప్రతి ఊహ స్థానం మరియు చుక్కలపై అభిప్రాయాన్ని ఇస్తుంది.';

  @override
  String get primeHunterTitle => 'ప్రైమ్ హంటర్';

  @override
  String get primeHunterSubtitle =>
      'ప్రధాన సంఖ్య కోసం ఎడమవైపు స్వైప్ చేయండి | సంయుక్త సంఖ్య కోసం కుడివైపు స్వైప్ చేయండి';

  @override
  String get tracePathTitle => 'ట్రేస్ పాత్';

  @override
  String get tracePathSubtitle =>
      'లక్ష్య మార్గాన్ని వీలైనంత దగ్గరగా అనుసరించండి';

  @override
  String get ruleSwitcherTitle => 'రూల్ స్విచ్చర్';

  @override
  String get ruleSwitcherSubtitle => 'ప్రస్తుత నియమాన్ని వర్తింపజేయండి';

  @override
  String get choiceReactionTimeTitle => 'చాయిస్ రియాక్షన్ టైమ్';

  @override
  String get pathRecallTitle => 'పాత్ రికాల్';

  @override
  String get switchTaskTitle => 'స్విచ్ టాస్క్';

  @override
  String get switchTaskSubtitle =>
      'నియమంపై దృష్టి పెట్టండి! ఇది ఆకారం మరియు రంగుల మధ్య మారుతూ ఉంటుంది.';

  @override
  String get mentalRotationTitle => 'మెంటల్ రొటేషన్';

  @override
  String get mentalRotationSubtitle => 'ఈ ఆకారాలు ఒకటేనా, కేవలం తిప్పబడ్డాయా?';

  @override
  String get missingOperatorTitle => 'ఆపరేటర్ మిక్స్';

  @override
  String get missingOperatorSubtitle =>
      'సమీకరణాన్ని పూర్తి చేయడానికి ఖాళీలను నింపండి';

  @override
  String get wordMastermindTitle => 'వర్డ్ మాస్టర్‌మైండ్';

  @override
  String get wordMastermindSubtitle =>
      '4-అక్షరాల కోడ్‌ను ఛేదించండి! బుల్స్ (B) సరైన స్థానాలు, కౌస్ (C) తప్పుడు స్థానాలు.';

  @override
  String get simonSequenceTitle => 'సీక్వెన్స్';

  @override
  String get symbolLogicTitle => 'సింబల్ లాజిక్';

  @override
  String get symbolLogicSubtitle =>
      'ప్రతి గుర్తు విలువను కనుగొనడానికి సమీకరణాలను పరిష్కరించండి. చివరి సమీకరణం ఫలితం ఏమిటి?';

  @override
  String get silhouetteMatchTitle => 'సిల్హౌట్ మ్యాచ్';

  @override
  String get silhouetteMatchSubtitle => 'ఏ సిల్హౌట్ ఈ వస్తువుతో సరిపోలుతుంది?';

  @override
  String get operationSpanTitle => 'ఆపరేషన్ స్పాన్';

  @override
  String get operationSpanMathPhase => 'సమీకరణం సరైనదేనా?';

  @override
  String get operationSpanLetterPhase => 'అక్షరాన్ని గుర్తుంచుకోండి';

  @override
  String get operationSpanRecallPhase =>
      'అక్షరాలను క్రమంలో గుర్తుకు తెచ్చుకోండి';

  @override
  String get operationSpanRoundComplete => 'రౌండ్ పూర్తయింది!';

  @override
  String operationSpanScore(int score) {
    return 'మీరు ఆపరేషన్ స్పాన్‌లో $score పాయింట్లు సాధించారు!';
  }

  @override
  String get slidePuzzleTitle => 'స్లైడ్ పజిల్';

  @override
  String get slidePuzzleNewGame => 'కొత్త ఆట';

  @override
  String get slidePuzzleInstructions =>
      'టైల్స్‌ను ఖాళీ ప్రదేశంలోకి జరుపుతూ సంఖ్యా క్రమంలో అమర్చండి.';

  @override
  String get slidePuzzleTileSlider => 'టైల్ స్లైడర్';

  @override
  String get slidePuzzleCongrats => 'మీరు అన్ని టైల్స్‌ను విజయవంతంగా అమర్చారు.';

  @override
  String get visualSearchTitle => 'విజువల్ సెర్చ్';

  @override
  String get visualSearchSubtitle => 'గ్రిడ్‌లో ప్రత్యేకమైన గుర్తును కనుగొనండి';

  @override
  String get trailMakingTitle => 'ట్రైల్ మేకింగ్';

  @override
  String get trailMakingSubtitle =>
      'సంఖ్యలను క్రమంలో (1 -> 2 -> 3...) వీలైనంత వేగంగా అనుసంధానించండి.';

  @override
  String get matrixReasoningTitle => 'మ్యాట్రిక్స్ రీజనింగ్';

  @override
  String get matrixReasoningSubtitle => '3x3 గ్రిడ్‌లో నమూనాను పూర్తి చేయండి';

  @override
  String get tentsAndTreesTitle => 'టెంట్లు & చెట్లు';

  @override
  String get tentsAndTreesSubtitle =>
      'చెట్ల పక్కన టెంట్లను ఉంచండి. సంఖ్యలు ప్రతి అడ్డు/నిలువు వరుసలో ఎన్ని టెంట్లు ఉన్నాయో సూచిస్తాయి. టెంట్లు ఒకదానికొకటి తాకకూడదు.';

  @override
  String get quickMathTitle => 'క్విక్ మ్యాథ్';

  @override
  String get magicSquaresTitle => 'మ్యాజిక్ స్క్వేర్';

  @override
  String magicSquaresSubtitle(int targetSum) {
    return 'ప్రతి అడ్డు వరుస, నిలువు వరుస మరియు కర్ణం మొత్తం $targetSum ఉండాలి';
  }

  @override
  String get objectShuffleTitle => 'ఆబ్జెక్ట్ షఫుల్';

  @override
  String get pipesTitle => 'పైప్స్';

  @override
  String get pipesSubtitle => 'సరిపోలే రంగు చుక్కలను పైపులతో అనుసంధానించండి.';

  @override
  String get oddOneOutTitle => 'ఆడ్ వన్ అవుట్';

  @override
  String get oddOneOutSubtitle => 'వేరే రంగు ఉన్న టైల్‌ను కనుగొనండి.';

  @override
  String get einsteinRiddleTitle => 'ఐన్ స్టీన్ రిడిల్';

  @override
  String get einsteinRiddleSubtitle =>
      'ప్రతి ఇంటి లక్షణాలను ఊహించడానికి ఆధారాలను ఉపయోగించండి.';

  @override
  String get einsteinRiddleHowToPlay =>
      'ప్రతి ఇంటికి ప్రత్యేక లక్షణాలు (రంగు, జాతీయత, పెంపుడు జంతువు మొదలైనవి) ఉంటాయి. గ్రిడ్‌ను నింపి పూర్తి పరిష్కారాన్ని కనుగొనడానికి ఇచ్చిన ఆధారాలను ఉపయోగించండి.';

  @override
  String get einsteinRiddleColor => 'రంగు';

  @override
  String get einsteinRiddleNationality => 'జాతీయత';

  @override
  String get einsteinRiddleDrink => 'పానీయం';

  @override
  String get einsteinRiddlePet => 'పెంపుడు జంతువు';

  @override
  String get einsteinRiddleSmoke => 'పొగతాగడం';

  @override
  String get einsteinRiddleHouse => 'ఇల్లు';

  @override
  String get mirrorImageTitle => 'మిర్రర్ ఇమేజ్';

  @override
  String get mirrorImageSubtitle => 'సరైన అద్దం ప్రతిబింబాన్ని గుర్తించండి.';

  @override
  String get mirrorImageHowToPlay =>
      'ఆకారాన్ని చూడండి మరియు ఇచ్చిన ఆప్షన్ల నుండి దాని సరైన అద్దం ప్రతిబింబాన్ని ఎంచుకోండి.';

  @override
  String get mentalMappingTitle => 'మెంటల్ మ్యాపింగ్';

  @override
  String get mentalMappingSubtitle =>
      'దిశలను అనుసరించండి మరియు గమ్యాన్ని కనుగొనండి.';

  @override
  String get mentalMappingHowToPlay =>
      'మీకు దిశల వరుస క్రమం (ఉత్తరం, దక్షిణం, తూర్పు, పడమర) చూపబడుతుంది. గ్రిడ్ మధ్య నుండి ప్రారంభించి మనసులో ఈ దశలను అనుసరించి తుది గమ్యాన్ని ఎంచుకోండి.';

  @override
  String get memoryPalaceTitle => 'మెమరీ ప్యాలెస్';

  @override
  String get memoryPalaceSubtitle => 'ఏ పదం ఏ స్థానంలో ఉందో గుర్తుంచుకోండి.';

  @override
  String get memoryPalaceHowToPlay =>
      'గ్రిడ్‌లో వివిధ స్థానాల్లో పదాల సమితి కనిపిస్తుంది. వాటి స్థానాలను గుర్తుంచుకోండి. ఆపై, పదాలను వాటి అసలు స్థానాల్లో తిరిగి ఉంచమని మిమ్మల్ని అడుగుతారు.';

  @override
  String get countingSheepTitle => 'గొర్రెలను లెక్కించడం';

  @override
  String get countingSheepSubtitle => 'మీరు ఎన్ని గొర్రెలను చూశారు?';

  @override
  String get countingSheepHowToPlay =>
      'గొర్రెలు స్క్రీన్ పై వేగంగా పరిగెత్తుతాయి. అవి వెళ్తున్నప్పుడు వాటిని లెక్కించండి మరియు చివరలో మొత్తం సంఖ్యను నమోదు చేయండి.';

  @override
  String get faceTraitAssociationTitle => 'ఫేస్-ట్రైట్';

  @override
  String get faceTraitAssociationSubtitle =>
      'ప్రతి ముఖం యొక్క లక్షణాలను గుర్తుంచుకోండి';

  @override
  String get faceTraitAssociationHowToPlay =>
      'మీకు పేరు, వృత్తి మరియు అభిరుచితో పాటు అనేక ముఖాలు చూపబడతాయి. ఈ సంబంధాలను గుర్తుంచుకోండి. తరువాత, ప్రతి ముఖం యొక్క నిర్దిష్ట లక్షణాలను గుర్తుకు తెచ్చుకోమని మిమ్మల్ని అడుగుతారు.';

  @override
  String get mentalCalendarTitle => 'మెంటల్ క్యాలెండర్';

  @override
  String get mentalCalendarSubtitle => 'వారంలోని రోజును లెక్కించండి';

  @override
  String get mentalCalendarHowToPlay =>
      'ఒక యాదృచ్ఛిక తేదీ చూపబడుతుంది. అది వారంలోని ఏ రోజున వస్తుందో నిర్ధారించడానికి మానసిక గణనను ఉపయోగించండి.';

  @override
  String get vocabularyBuilderTitle => 'వొకాబ్యులరీ బిల్డర్';

  @override
  String get vocabularyBuilderSubtitle =>
      'సమయ ఒత్తిడిలో పర్యాయపదాలు మరియు వ్యతిరేక పదాలను సరిపోల్చండి.';

  @override
  String get vocabularyBuilderHowToPlay =>
      'మీకు ఒక టార్గెట్ పదం మరియు సంబంధం (పర్యాయపదం లేదా వ్యతిరేక పదం) చూపబడుతుంది. సంబంధానికి సరిపోయే సరైన పదాన్ని ఎంచుకోండి. వేగంగా చేయండి, సమయం మించిపోతోంది!';

  @override
  String get correct => 'సరైనది';

  @override
  String get incorrect => 'తప్పు';

  @override
  String get grammarPoliceTitle => 'గ్రామర్ పోలీస్';

  @override
  String get grammarPoliceSubtitle =>
      'వాక్యం వ్యాకరణపరంగా సరైనదా లేదా తప్పులు ఉన్నాయా అని గుర్తించండి.';

  @override
  String get grammarPoliceHowToPlay =>
      'స్క్రీన్ మధ్యలో ఒక వాక్యం కనిపిస్తుంది. అది వ్యాకరణపరంగా సరైనదా లేదా అందులో లోపం ఉందా అని నిర్ణయించండి. అది బాగుంటే \'సరైనది\' అని, లేదా మీరు తప్పును గుర్తిస్తే \'తప్పు\' అని ట్యాప్ చేయండి. మీ ప్రాణాలన్నింటినీ కోల్పోకండి!';

  @override
  String get reverseStroopTitle => 'రివర్స్ స్ట్రూప్';

  @override
  String get reverseStroopSubtitle =>
      'ఏకాగ్రత పరీక్షించే స్ట్రూప్ టెస్ట్ యొక్క వైవిధ్యం.';

  @override
  String get reverseStroopHowToPlay =>
      'సూచనలపై దృష్టి పెట్టండి! అది \'TEXT\' అని చెబితే, పదం యొక్క అర్థాన్ని సరిపోల్చండి. అది \'COLOR\' అని చెబితే, రంగును సరిపోల్చండి. మీ ఏకాగ్రతను పరీక్షించడానికి నియమాలు తరచుగా మారుతుంటాయి.';

  @override
  String get game2048Instruction =>
      'విలీనం చేయడానికి ఏ దిశలోనైనా స్వైప్ చేయండి';

  @override
  String get fibonacciMergeTitle => 'ఫైబోనాక్సీ విలీనం';

  @override
  String get fibonacciMergeSubtitle =>
      'వరుస ఫైబోనాక్సీ సంఖ్యలను (1, 1, 2, 3, 5, 8, 13...) విలీనం చేయండి.';

  @override
  String get sequenceSleuthTitle => 'సీక్వెన్స్ స్లీత్';

  @override
  String get sequenceSleuthSubtitle =>
      'గణిత వరుస క్రమంలో మిస్సింగ్ సంఖ్యను కనుగొనండి.';

  @override
  String get divisibilityDashTitle => 'డివిజిబిలిటీ డాష్';

  @override
  String get divisibilityDashSubtitle =>
      'ఇచ్చిన సంఖ్యకు ఒక అంకె గల భాజకాలను (2-9) నొక్కండి.';

  @override
  String get percentagePeakTitle => 'పర్సెంటేజ్ పీక్';

  @override
  String get percentagePeakSubtitle =>
      'మానసిక శాతం గణనలను వేగంగా పరిష్కరించండి.';

  @override
  String get vennNumbersTitle => 'వెన్ నంబర్స్';

  @override
  String get vennNumbersSubtitle =>
      'వెన్ డయాగ్రామ్ ప్రాంతాలలో సంఖ్యలను వర్గీకరించండి.';

  @override
  String get commonDenominatorTitle => 'కామన్ డినామినేటర్';

  @override
  String get commonDenominatorSubtitle =>
      'గరిష్ట సామాన్య భాజకం లేదా కనిష్ట సామాన్య గుణిజాన్ని కనుగొనండి.';

  @override
  String get angleFinderTitle => 'యాంగిల్ ఫైండర్';

  @override
  String get angleFinderSubtitle =>
      'జ్యామితి సమస్యలో మిస్సింగ్ కోణాన్ని లెక్కించండి.';

  @override
  String get sumSnakeTitle => 'సమ్ స్నేక్';

  @override
  String get sumSnakeSubtitle =>
      'లక్ష్య మొత్తాన్ని చేరుకోవడానికి పక్కపక్కన ఉన్న సంఖ్యలను కలపండి.';

  @override
  String get baseShiftTitle => 'బేస్ షిఫ్ట్ బ్లిట్జ్';

  @override
  String get baseShiftSubtitle => 'దశాంశంలో పరిష్కరించండి';

  @override
  String get baseShiftDescription =>
      'సమీకరణాన్ని పరిష్కరించండి మరియు సమాధానాన్ని దశాంశంలో (బేస్ 10) టైప్ చేయండి.';

  @override
  String get baseShiftEquation => 'సమీకరణం';

  @override
  String get baseShiftHint => 'దశాంశ ఫలితాన్ని నమోదు చేయండి...';

  @override
  String get baseShiftCorrect => 'సరైనది!';

  @override
  String get baseShiftIncorrect => 'తప్పు!';

  @override
  String get baseShiftSubmit => 'సమర్పించు';

  @override
  String get baseShiftQuickGuide => 'త్వరిత గైడ్:';

  @override
  String get baseShiftBinary => 'బైనరీ (bin): బేస్ 2 (0, 1)';

  @override
  String get baseShiftHex => 'హెక్సాడెసిమల్ (0x): బేస్ 16 (0-9, A-F)';

  @override
  String get baseShiftDecimal => 'దశాంశం (dec): బేస్ 10 (0-9)';

  @override
  String get baseShiftWinTitle => 'మ్యాథ్ విజార్డ్!';

  @override
  String get baseShiftWinMessage =>
      'మీరు 5 బేస్-షిఫ్ట్ సమీకరణాలను సరిగ్గా పరిష్కరించారు!';

  @override
  String get blockCount3DTitle => 'బ్లాక్ కౌంట్ 3D';

  @override
  String get blockCount3DSubtitle =>
      'తిప్పడానికి డ్రాగ్ చేయండి • దాగి ఉన్న బ్లాకులను లెక్కించండి';

  @override
  String get blockCount3DHowMany => 'ఎన్ని బ్లాకులు ఉన్నాయి?';

  @override
  String get blockCount3DSubmitGuess => 'ఊహను సమర్పించండి';

  @override
  String get blockCount3DNotQuite =>
      'సరైనది కాదు! మళ్ళీ లెక్కించడానికి తిప్పండి.';

  @override
  String get blockCount3DExcellent => 'అద్భుతం';

  @override
  String blockCount3DWinMessage(int count) {
    return 'మీరు అన్ని $count బ్లాకులను సరిగ్గా గుర్తించారు!';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '1. బ్లాక్ స్టాక్ తిప్పడానికి 3D వ్యూపోర్ట్ పై మీ వేలిని డ్రాగ్ చేయండి.\n\n2. స్టాక్ లో ఉన్న అన్ని బ్లాకులను లెక్కించండి.\n\n3. గుర్తుంచుకోండి: గాలిలో ఉన్న బ్లాక్ కింద కచ్చితంగా సపోర్ట్ బ్లాకులు ఉండాలి (దాగి ఉన్న బ్లాకులు!).\n\n4. ఇన్‌పుట్ ఫీల్డ్ లో మీ సమాధానాన్ని టైప్ చేసి, తనిఖీ చేయడానికి \"ఊహను సమర్పించండి\" నొక్కండి.';

  @override
  String get alphabetSudokuTitle => 'ఆల్ఫాబెట్ సుడోకు';

  @override
  String get alphabetSudokuSubtitle =>
      'ప్రతి అడ్డు, నిలువు వరుస మరియు బాక్స్ లో A-I అక్షరాలు ఉండేలా గ్రిడ్ నింపండి.';

  @override
  String get alphabetSudokuWinTitle => 'సుడోకు పరిష్కరించబడింది!';

  @override
  String get alphabetSudokuWinMessage =>
      'అద్భుతం! మీరు అక్షరాలపై పట్టు సాధించారు.';

  @override
  String get classicMazeTitle => 'క్లాసిక్ మేజ్';

  @override
  String get classicMazeSubtitle =>
      'అన్వేషించండి & పరిష్కరించండి • ప్రతి ఆటలో ఒక కొత్త మేజ్';

  @override
  String get classicMazeWinTitle => 'మేజ్ క్లియర్ చేయబడింది';

  @override
  String classicMazeWinMessage(int count) {
    return 'అద్భుతమైన నావిగేషన్! మీరు $count ఎత్తుగడలలో మేజ్ పరిష్కరించారు.';
  }

  @override
  String get classicMazeMoves => 'ఎత్తుగడలు: ';

  @override
  String get classicMazeHowToPlayDescription =>
      '1. పసుపు రంగు మార్బుల్ ను (ప్లేయర్) కుడి వైపు కింద ఉన్న గ్రీన్ పోర్టల్ (ఎగ్జిట్) కి చేర్చండి.\n\n2. కదలడానికి మేజ్ పై స్వైప్ చేయండి, కీబోర్డ్ బాణం గుర్తులు లేదా కింద ఉన్న బటన్లను ఉపయోగించండి.\n\n3. ఊదా రంగు దారి మీరు అన్వేషించిన మార్గాన్ని చూపుతుంది. మార్గంపై వెనక్కి వెళ్తే అది చెరిగిపోతుంది!\n\n4. పెద్ద మేజ్ లతో మిమ్మల్ని మీరు సవాలు చేసుకోవడానికి పైన ఉన్న కష్టతర స్థాయిలను మార్చుకోండి!';

  @override
  String get conjunctionSearchTitle => 'కంజంక్షన్ సెర్చ్';

  @override
  String get conjunctionSearchSubtitle => 'ఏకాగ్రత మరియు ఫీచర్ కంజంక్షన్';

  @override
  String get conjunctionSearchWinTitle => 'విజయం';

  @override
  String get conjunctionSearchWinMessage =>
      'మీరు ఖచ్చితమైన ఏకాగ్రతతో అన్ని లక్ష్యాలను కనుగొన్నారు!';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      'సూచనలలో ఒక నిర్దిష్ట లక్ష్య ఆకారం మరియు రంగు కలయిక చూపబడుతుంది. గ్రిడ్ లో దానిని వీలైనంత వేగంగా కనుగొని నొక్కండి. ఇతర ఆకారాలు అదే రంగు లేదా ఆకారాన్ని కలిగి ఉంటాయి, కాబట్టి జాగ్రత్తగా చూడండి!';

  @override
  String get conjunctionSearchRound => 'రౌండ్: ';

  @override
  String get conjunctionSearchScore => 'స్కోరు: ';

  @override
  String get conjunctionSearchFind => 'కనుగొనండి: ';

  @override
  String get shapeCircle => 'వృత్తం';

  @override
  String get shapeSquare => 'చతురస్రం';

  @override
  String get shapeTriangle => 'త్రిభుజం';

  @override
  String get shapeStar => 'నక్షత్రం';

  @override
  String get shapeRectangle => 'RECTANGLE';

  @override
  String get shapeEllipse => 'ELLIPSE';

  @override
  String get shapeTrapezoid => 'TRAPEZOID';

  @override
  String get colorRedLabel => 'ఎరుపు';

  @override
  String get colorBlueLabel => 'నీలం';

  @override
  String get colorGreenLabel => 'ఆకుపచ్చ';

  @override
  String get colorAmberLabel => 'అంబర్';

  @override
  String get cubeNetFoldTitle => 'క్యూబ్ నెట్ ఫోల్డ్';

  @override
  String get cubeNetFoldSubtitle => 'సరిపోలే 3D క్యూబ్ ఆప్షన్ ను ఎంచుకోండి';

  @override
  String get cubeNetFoldWinTitle => 'సరైనది';

  @override
  String get cubeNetFoldWinMessage =>
      'మీకు ఖచ్చితమైన 3D స్పేషియల్ ఫోల్డింగ్ లాజిక్ ఉంది!';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '1. పైన ఉన్న 2D నెట్ ను చూడండి.\n\n2. మనసులో ఆ నెట్ ను 3D క్యూబ్ గా మడవండి.\n\n3. ఆ మడిచిన క్యూబ్ యొక్క సరైన 3D దృశ్యాన్ని సూచించే ఆప్షన్ ను ఎంచుకోండి.\n\n4. జాగ్రత్త: నెట్ లో ఎదురెదురుగా ఉన్న ముఖాలు 3D లో పక్కపక్కన ఉండకూడదు!';

  @override
  String get cubeNetFoldUnfoldedNet => 'విప్పిన 2D నెట్';

  @override
  String get cubeNetFoldWhichMatches => 'ఏ క్యూబ్ సరిపోలుతుంది?';

  @override
  String get cubeNetFoldIncorrect =>
      'తప్పుడు ఫోల్డింగ్ లాజిక్! రీసెట్ నొక్కండి లేదా మీ ఎంపికను మార్చండి.';

  @override
  String get cubeNetFoldSubmitChoice => 'ఎంపికను సమర్పించండి';

  @override
  String get cubeNetFoldFailed => 'విఫలమైంది (రీసెట్ నొక్కండి)';

  @override
  String get faceTraitAssociationMemorize => 'నలుగురినీ గుర్తుంచుకోండి';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return '$total లో $current వ్యక్తి';
  }

  @override
  String get faceTraitAssociationWhatOccupation => 'వారి వృత్తి ఏమిటి?';

  @override
  String get faceTraitAssociationWhatHobby => 'వారి అభిరుచి ఏమిటి?';

  @override
  String get faceTraitAssociationWinTitle => 'మెమరీ మాస్టర్!';

  @override
  String get faceTraitAssociationLoseTitle => 'ఆట ముగిసింది';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return 'మీరు $total కి $correct సరైనవి సాధించారు.';
  }

  @override
  String get topologyTitle => 'టొపాలజీ';

  @override
  String get topologySubtitle =>
      'ఈ ఆకారాలు టొపాలజికల్ గా సమానమా? (ఒక దానిని కోయకుండా లేదా అతికించకుండా మరొక ఆకారంలోకి మార్చవచ్చా?)';

  @override
  String get topologyWinTitle => 'జ్యామితి మేధావి!';

  @override
  String get topologyWinMessage =>
      'మీరు 10 టొపాలజికల్ జతలను సరిగ్గా గుర్తించారు!';

  @override
  String get topologyScore => 'స్కోరు: ';

  @override
  String get semanticDistanceTitle => 'సెమాంటిక్ డిస్టెన్స్';

  @override
  String get semanticDistanceSubtitle => 'పదాల మధ్య భావనాత్మక దూరాన్ని కొలవండి';

  @override
  String get oxymoronHuntTitle => 'ఆక్సిమోరాన్ హంట్';

  @override
  String get oxymoronHuntSubtitle =>
      'గ్రిడ్‌లో పరస్పర విరుద్ధ పదాలను జత చేయండి';

  @override
  String get portmanteauSplitTitle => 'పోర్ట్‌మాంట్యూ స్ప్లిట్';

  @override
  String get portmanteauSplitSubtitle =>
      'పోర్ట్‌మాంట్యూ యొక్క మూల పదాలను గుర్తించండి';

  @override
  String get chainReactionTitle => 'చైన్ రియాక్షన్';

  @override
  String get chainReactionSubtitle =>
      'అతివ్యాప్తి చెందుతున్న అక్షరాలను ఉపయోగించి పదాలను కలపండి';

  @override
  String get rhymeMasterTitle => 'ప్రాస మాస్టర్';

  @override
  String get rhymeMasterSubtitle =>
      'లక్ష్య పదంతో ప్రాస కుదిరే పదాలను గుర్తించండి';

  @override
  String get definitionDashTitle => 'నిర్వచన వేగం';

  @override
  String get definitionDashSubtitle => 'సరైన పదాన్ని దాని నిర్వచనంతో జత చేయండి';

  @override
  String get syllableStackTitle => 'సిలబుల్ స్టాక్';

  @override
  String get syllableStackSubtitle =>
      'పూర్తి పదాలను రూపొందించడానికి అక్షర భాగాలను అమర్చండి';

  @override
  String get sentenceUnscrambleTitle => 'సెంటెన్స్ అన్‌స్క్రాంబుల్';

  @override
  String get sentenceUnscrambleSubtitle =>
      'సరైన వాక్యాన్ని రూపొందించడానికి పదాలను క్రమబద్ధీకరించండి';

  @override
  String get grammarSortTitle => 'వ్యాకరణ వర్గీకరణ';

  @override
  String get grammarSortSubtitle => 'భాషా భాగాల ప్రకారం పదాలను వర్గీకరించండి';

  @override
  String get vowelReconstructTitle => 'అచ్చుల పునర్నిర్మాణం';

  @override
  String get vowelReconstructSubtitle => 'వాక్యంలో లోపించిన అచ్చులను పూరించండి';

  @override
  String get consonantReconstructTitle => 'హల్లుల పునర్నిర్మాణం';

  @override
  String get consonantReconstructSubtitle =>
      'వాక్యంలో లోపించిన హల్లులను పూరించండి';

  @override
  String get homophoneHuntTitle => 'హోమోఫోన్ హంట్';

  @override
  String get silentLetterSearchTitle => 'సైలెంట్ లెటర్ సెర్చ్';

  @override
  String get silentLetterSearchSubtitle =>
      'ఇచ్చిన పదాలలో సైలెంట్ లెటర్లను గుర్తించండి';

  @override
  String get palindromeBuilderTitle => 'పాలిండ్రోమ్ బిల్డర్';

  @override
  String get palindromeBuilderSubtitle =>
      'కనీస అక్షరాలను జోడించడం ద్వారా పాలిండ్రోమ్‌ను సృష్టించండి';

  @override
  String get phoneticGuessTitle => 'ఫోనెటిక్ గెస్';

  @override
  String get phoneticGuessSubtitle =>
      'దాని ధ్వని ఉచ్చారణ ఆధారంగా పదాన్ని గుర్తించండి';

  @override
  String get spoonerismSolverTitle => 'స్పూనరిజం సోల్వర్';

  @override
  String get spoonerismSolverSubtitle =>
      'వాక్యం కోసం సరైన స్పూనరిజంను గుర్తించండి';

  @override
  String get etymonOddballTitle => 'ఎటిమాన్ ఆడ్‌బాల్';

  @override
  String get etymonOddballSubtitle => 'ఒకే మూలాన్ని పంచుకోని పదాన్ని కనుగొనండి';

  @override
  String get etymologyOriginTitle => 'ఎటిమాలజీ ఆరిజిన్';

  @override
  String get etymologyOriginSubtitle => 'అన్యదేశ పదం యొక్క మూల భాషను ఊహించండి';

  @override
  String get affixFactoryTitle => 'అఫిక్స్ ఫ్యాక్టరీ';

  @override
  String get affixFactorySubtitle =>
      'ఉపసర్గలు మరియు ప్రత్యయాలను ఉపయోగించి సరైన పదాలను సృష్టించండి';

  @override
  String get cognateCatchTitle => 'కాగ్నేట్ క్యాచ్';

  @override
  String get cognateCatchSubtitle =>
      'నిజమైన కాగ్నేట్‌లు మరియు తప్పుడు స్నేహితుల మధ్య తేడాను గుర్తించండి';

  @override
  String get compoundConnectTitle => 'కాంపౌండ్ కనెక్ట్';

  @override
  String get compoundConnectSubtitle =>
      'రెండు పదాలను కలిపి ఒక సంయుక్త పదాన్ని రూపొందించండి';

  @override
  String get pangramSprintTitle => 'పాంగ్రామ్ స్ప్రింట్';

  @override
  String get pangramSprintSubtitle =>
      'వర్ణమాలలోని ప్రతి అక్షరాన్ని ఉపయోగించి ఒక వాక్యాన్ని రూపొందించండి';

  @override
  String get anagramDefinitionTitle => 'అనగ్రామ్ డెఫినిషన్';

  @override
  String get anagramDefinitionSubtitle =>
      'నిర్వచనం ఆధారంగా అనగ్రామ్‌ను పరిష్కరించండి';

  @override
  String get letterBridgeTitle => 'లెటర్ బ్రిడ్జ్';

  @override
  String get letterBridgeSubtitle =>
      'రెండు పదాలను కలిపే లోపించిన అక్షరాన్ని కనుగొనండి';

  @override
  String get letterFrequencyScanTitle => 'లెటర్ ఫ్రీక్వెన్సీ స్కాన్';

  @override
  String get letterFrequencyScanSubtitle =>
      'టెక్స్ట్‌లో ఒక అక్షరం ఎన్నిసార్లు కనిపిస్తుందో లెక్కించండి';

  @override
  String get oneLetterShiftTitle => 'వన్-లెటర్ షిఫ్ట్';

  @override
  String get oneLetterShiftSubtitle =>
      'ఒక అక్షరం మార్పుతో ఒక పదాన్ని మరొక పదంగా మార్చండి';

  @override
  String vocabularyBuilderMessage(String arg0) {
    return 'చాలా బాగుంది! మీ పదజాలం ఆకట్టుకునేలా ఉంది. స్కోరు: $arg0';
  }

  @override
  String get symmetryMessage =>
      'మీరు నమూనాను అత్యంత ఖచ్చితత్వంతో ప్రతిబింబించారు.';

  @override
  String get temporalOrderMessage =>
      'అద్భుతం! మీ టెంపోరల్ సీక్వెన్స్ మెమరీ అసాధారణంగా ఉంది.';

  @override
  String get temporalOrderMessage1 =>
      'తప్పు సీక్వెన్స్ మెమరీ. సాధన చేస్తే అంతా సాధ్యమే!';

  @override
  String get wordSearchMessage =>
      'సూక్ష్మ పరిశీలనతో అన్ని పదాలు విజయవంతంగా కనుగొనబడ్డాయి.';

  @override
  String colorMatchMessage(String arg0) {
    return 'మీ ఖచ్చితత్వం: $arg0%';
  }

  @override
  String semanticLinkMessage(String arg0) {
    return 'మీరు $arg0 పాయింట్లు సాధించారు!';
  }

  @override
  String reflexTapMessage(String arg0) {
    return 'మీరు $arg0 టార్గెట్‌లను ట్యాప్ చేశారు!';
  }

  @override
  String get angleFinderMessage => 'మీ రేఖాగణిత అంతర్ దృష్టి సంపూర్ణంగా ఉంది!';

  @override
  String angleFinderMessage1(String arg0) {
    return 'సరైన సమాధానం $arg0°';
  }

  @override
  String angleFinderText(String arg0) {
    return '$arg0°';
  }

  @override
  String visualStatisticalLearningMessage(String arg0) {
    return 'మీరు $arg0 సరైన నమూనాలను సాధించారు!';
  }

  @override
  String nonogramText(String arg0) {
    return 'లోపం: $arg0';
  }

  @override
  String mentalCalendarMessage(String arg0) {
    return 'మీరు 10కి $arg0 సరైనవి సాధించారు!';
  }

  @override
  String orbitTapMessage(String arg0) {
    return 'మీరు విజయవంతంగా $arg0 సార్లు ట్యాప్ చేశారు!';
  }

  @override
  String schulteTableMessage(String arg0) {
    return 'మీరు $arg0లో పట్టికను పూర్తి చేశారు.\\nమీ పెరిఫెరల్ విజన్‌ను పెంచుకోవడానికి సాధన చేస్తూ ఉండండి!';
  }

  @override
  String get schulteTableText => 'పరీక్షను ప్రారంభించండి';

  @override
  String get relationalMemoryMessage =>
      'అద్భుతమైన స్పేషియల్ రిలేషనల్ మెమరీ ఖచ్చితత్వం!';

  @override
  String sudokuText(String arg0) {
    return 'లోపం: $arg0';
  }

  @override
  String sdmtMessage(String arg0) {
    return 'మీరు $arg0 చిహ్నాలను జత చేశారు! ఈ పరీక్ష మీ స్కానింగ్ వేగం మరియు విజువల్ అటెన్షన్‌ను కొలుస్తుంది.';
  }

  @override
  String get futoshikiMessage =>
      'అద్భుతం! మీరు ఫుతోషికి లాటిన్ స్క్వేర్‌ను పరిష్కరించారు.';

  @override
  String letterFrequencyScanMessage(String arg0, String arg1) {
    return 'మీరు \"$arg1\" యొక్క $arg0 ఉనికిని సరిగ్గా లెక్కించారు.';
  }

  @override
  String letterFrequencyScanText(String arg0) {
    return 'తప్పు. లెక్కింపు $arg0.';
  }

  @override
  String get memoryMatrixMessage =>
      'ఆకట్టుకునేలా ఉంది! మీ వర్కింగ్ మెమరీ షార్ప్‌గా ఉంది. రోజువారీ లక్ష్యం పూర్తయింది!';

  @override
  String get memoryMatrixMessage1 =>
      'ఏకాగ్రత వహించండి మరియు మీ మెమరీ స్కోర్‌ను మెరుగుపరచుకోవడానికి మళ్ళీ ప్రయత్నించండి.';

  @override
  String get contextCluesMessage =>
      'అసాధారణం! మీ పదజాలం మరియు సందర్భోచిత విశ్లేషణ అద్భుతంగా ఉన్నాయి.';

  @override
  String get contextCluesMessage1 =>
      'తప్పు పదం ఎంచుకోబడింది! మీ వెర్బల్ కాంటెక్స్ట్ రీజనింగ్‌ను మెరుగుపరుచుకోండి మరియు మళ్ళీ ప్రయత్నించండి.';

  @override
  String oneLetterShiftMessage(String arg0, String arg1) {
    return 'మీరు $arg0ని $arg1కి సరిగ్గా మార్చారు.';
  }

  @override
  String get mentalAbacusMessage =>
      'మీ మెంటల్ అరిథ్మెటిక్ అత్యుత్తమ స్థాయిలో ఉంది.';

  @override
  String fractionMatcherMessage(String arg0) {
    return 'రిప్రజెంటేషన్‌లను జత చేయడం ద్వారా మీరు $arg0 పాయింట్లు సాధించారు!';
  }

  @override
  String get spellingSprintMessage =>
      'మీరు మొత్తం 10 పదాలను సరిగ్గా స్పెల్లింగ్ చేశారు!';

  @override
  String spellingSprintMessage1(String arg0) {
    return 'మీరు $arg0 పదాలను స్పెల్లింగ్ చేశారు.';
  }

  @override
  String stopSignalMessage(String arg0) {
    return 'మీరు $arg0 సరైన ప్రతిస్పందనలను సాధించారు! ఈ పరీక్ష ఒక ప్రణాళికాబద్ధమైన చర్యను అడ్డుకునే మీ సామర్థ్యాన్ని కొలుస్తుంది.';
  }

  @override
  String grammarPoliceMessage(String arg0) {
    return 'ఆట ముగిసింది! వ్యాకరణ ప్రపంచంలో మీరు క్రమశిక్షణను కాపాడారు. స్కోరు: $arg0';
  }

  @override
  String consonantReconstructMessage(String arg0) {
    return 'మీరు $arg0 స్కోరును పునర్నిర్మించారు!';
  }

  @override
  String rhymeMasterMessage(String arg0, String arg1) {
    return 'మీరు $arg1కి $arg0 ప్రాసలను కనుగొన్నారు!';
  }

  @override
  String vigilanceTaskMessage(String arg0, String arg1, String arg2) {
    return 'హిట్‌లు: $arg0, మిస్సులు: $arg1\\nతప్పుడు అలారాలు: $arg2';
  }

  @override
  String get silhouetteMatchOrthoMessage =>
      'మీకు అద్భుతమైన ఆర్థోగ్రాఫిక్ అలైన్‌మెంట్ నైపుణ్యాలు ఉన్నాయి!';

  @override
  String get silhouetteMatchOrthoText => 'అర్థమైంది';

  @override
  String get silhouetteMatchOrthoText1 =>
      'తప్పు పర్స్పెక్టివ్ ప్రొజెక్షన్! మళ్ళీ ప్రయత్నించడానికి రీసెట్ (Reset) ట్యాప్ చేయండి.';

  @override
  String fibonacciMergeMessage(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String factorFinderMessage(String arg0) {
    return 'అన్ని కారణాంకాలను కనుగొనడం ద్వారా మీరు $arg0 పాయింట్లు సాధించారు!';
  }

  @override
  String logicalSyllogismsMessage(String arg0) {
    return 'మీరు $arg0 సిలోజిజంలను సరిగ్గా పరిష్కరించారు!';
  }

  @override
  String get rotatingMazeMessage =>
      'మీరు కైనెటిక్ రొటేటింగ్ మేజ్‌ను విజయవంతంగా దాటారు!';

  @override
  String get rotatingMazeText => 'అర్థమైంది';

  @override
  String get rotatingMazeText1 => '🌀 మేజ్ 90° తిరిగింది! గ్రిడ్ మారింది!';

  @override
  String get mathPathMessage =>
      'మీరు లక్ష్యానికి చేర్చే మార్గాన్ని కనుగొన్నారు!';

  @override
  String get bridgesMessage => 'మీరు అన్ని ద్వీపాలను విజయవంతంగా కలిపారు!';

  @override
  String compoundConnectMessage(String arg0, String arg1) {
    return 'ఆ సంయుక్త పదం $arg0$arg1.';
  }

  @override
  String get pangramSprintMessage =>
      'మీరు మొత్తం 26 అక్షరాలను ఉపయోగించి ఒక వాక్యాన్ని రూపొందించారు.';

  @override
  String get mirrorImageMessage => 'మీరు ప్రతిబింబాన్ని సరిగ్గా గుర్తించారు.';

  @override
  String get mirrorImageText => 'అద్దం ప్రతిబింబం';

  @override
  String reverseStroopMessage(String arg0) {
    return 'మీరు $arg0 పాయింట్లు సాధించారు! సూచనలను గమనిస్తూ ఉండండి.';
  }

  @override
  String get verbalAnalogiesMessage =>
      'సంబంధాలను గుర్తించడంలో మీకు చురుకైన మేధస్సు ఉంది.';

  @override
  String corsiBlocksMessage1(String arg0, String arg1) {
    return 'మీరు $arg1 క్రమాలను గుర్తుంచుకున్నారు! మీ స్పేషియల్ మెమరీ స్పాన్ $arg0 కి చేరుకుంది.';
  }

  @override
  String wordLadderMessage(String arg0, String arg1, String arg2) {
    return 'మీరు $arg0 నుండి $arg1 కి $arg2 అడుగులలో విజయవంతంగా కలిపారు.';
  }

  @override
  String d2AttentionMessage(String arg0) {
    return 'అద్భుతమైన సెలెక్టివ్ స్కానింగ్! తుది స్కోరు: $arg0.';
  }

  @override
  String get d2AttentionText => 'ఎలా ఆడాలి';

  @override
  String get d2AttentionText1 => 'అర్థమైంది';

  @override
  String get tangleFixMessage => 'అన్ని గీతలు స్పష్టంగా మరియు సాఫీగా ఉన్నాయి.';

  @override
  String get distractorMatrixMessage =>
      'అద్భుతం! గణిత పరమైన ఆటంకాలు ఉన్నప్పటికీ మీరు నమూనాలను గుర్తుంచుకున్నారు!';

  @override
  String get distractorMatrixMessage1 =>
      'ఆటంకాల వల్ల మీరు విఫలమయ్యారు! మీ వర్కింగ్ మెమరీకి మళ్ళీ శిక్షణ ఇవ్వండి.';

  @override
  String sentenceUnscrambleMessage(String arg0) {
    return 'మీరు $arg0 స్కోరుతో వాక్యాన్ని సరిచేశారు!';
  }

  @override
  String get kakuroMessage =>
      'అద్భుతం! మీరు అన్ని సమ్ సెగ్మెంట్లను సరిగ్గా జత చేశారు.';

  @override
  String symbolicFlankerMessage(String arg0, String arg1) {
    return 'మీరు $arg1 కి గాను $arg0 సరిగ్గా పూర్తి చేశారు!';
  }

  @override
  String stroopTestMessage(String arg0) {
    return 'మీరు $arg0 సరిగ్గా సాధించారు! పదం మీద కాకుండా, రంగు మీద దృష్టి పెట్టండి.';
  }

  @override
  String wisconsinCardSortingMessage(String arg0) {
    return 'మీరు $arg0 కార్డులను సరిగ్గా వర్గీకరించారు!';
  }

  @override
  String nBackMessage(String arg0) {
    return 'మీరు $arg0 2-back మ్యాచులను సాధించారు! మల్టీటాస్కింగ్ కోసం మీ వర్కింగ్ మెమరీ చాలా ముఖ్యం.';
  }

  @override
  String rhythmMasterMessage(String arg0, String arg1) {
    return 'మీరు $arg0 ఖచ్చితమైన హిట్స్ మరియు $arg1 పాయింట్లు సాధించారు!';
  }

  @override
  String groceryListMessage(String arg0, Object score) {
    return 'మీరు గ్రోసరీ లిస్ట్‌లో $arg0 పాయింట్లు సాధించారు!';
  }

  @override
  String get groceryListText => 'నేను\\';

  @override
  String get mirrorTracingMessage =>
      'మీ మెదడు దాని సమన్వయాన్ని విజయవంతంగా పునర్నిర్మించుకుంది.';

  @override
  String moduloClockMessage(String arg0) {
    return 'అద్భుతమైన మోడ్యులర్ మెంటల్ మ్యాథ్ సమన్వయం! స్కోరు: $arg0';
  }

  @override
  String moduloClockMessage1(String arg0, String arg1, String arg2) {
    return 'మీరు $arg1 మోడ్యులర్ క్లాక్ పరిష్కారాలలో $arg0 సాధించారు. స్కోరు: $arg2';
  }

  @override
  String get crownMessage =>
      'సరైన లాజిక్‌తో అన్ని కిరీటాలను విజయవంతంగా అమర్చారు.';

  @override
  String dualCodingMessage(String arg0) {
    return 'అద్భుతమైన డ్యూయల్-టాస్క్ ప్రదర్శన! మీ వర్కింగ్ మెమరీ స్కోరు: $arg0';
  }

  @override
  String inequalityDashMessage(String arg0) {
    return 'అసమానతలను జత చేయడంలో మీరు $arg0 పాయింట్లు సాధించారు!';
  }

  @override
  String sourceMonitoringMessage(String arg0, String arg1) {
    return 'మీరు $arg1 కి గాను $arg0 సాధించారు!';
  }

  @override
  String get sourceMonitoringText => 'గుర్తు తెచ్చుకోవడం ప్రారంభించండి';

  @override
  String get memoryPalaceText => 'అందుబాటులో ఉన్న పదాలు';

  @override
  String target10Message(String arg0) {
    return 'సంఖ్యలను 10 కి జత చేయడంలో మీరు $arg0 పాయింట్లు సాధించారు!';
  }

  @override
  String get paperFoldingMessage => 'మీరు మీ మనస్సులో నమూనాలను చూడగలరు.';

  @override
  String topologyText(String arg0, String arg1) {
    return '$arg0$arg1 / 10';
  }

  @override
  String get waterSortMessage => 'మీరు అన్ని రంగులను సరిగ్గా వర్గీకరించారు!';

  @override
  String anagramDefinitionMessage(String arg0) {
    return 'ఆ పదం నిజంగా \"$arg0\".';
  }

  @override
  String game2048Message(String arg0, String arg1, String arg2) {
    return '$arg0: $arg1\\n$arg2';
  }

  @override
  String game2048Message1(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String numericalEstimationMessage(String arg0) {
    return 'మీరు $arg0 సరైన అంచనాలు వేశారు.';
  }

  @override
  String grammarSortMessage(String arg0) {
    return 'మీరు $arg0 పదాలను సరిగ్గా వర్గీకరించారు!';
  }

  @override
  String vowelReconstructMessage(String arg0) {
    return 'మీరు $arg0 స్కోరుతో పునర్నిర్మించారు!';
  }

  @override
  String spatialConflictMessage(String arg0, String arg1) {
    return 'మీరు $arg1 తప్పులతో $arg0 స్కోరు సాధించారు!';
  }

  @override
  String get spatialConflictText => 'ఎలా ఆడాలి';

  @override
  String get spatialConflictText1 => 'అర్థమైంది';

  @override
  String tracePathMessage(String arg0) {
    return 'మీ ఖచ్చితత్వం $arg0%!';
  }

  @override
  String ruleSwitcherMessage(String arg0, String arg1) {
    return 'మీరు $arg1 కి గాను $arg0 సరిగ్గా సాధించారు!';
  }

  @override
  String collatzMessage(String arg0, String arg1) {
    return 'మీరు $arg0 అడుగులు తీసుకున్నారు. సాధ్యమైన కనిష్ట అడుగులు $arg1.';
  }

  @override
  String get collatzText => '/ 2';

  @override
  String get collatzText1 => '+ 1';

  @override
  String get collatzText2 => '3n + 1';

  @override
  String divisibilityDashMessage(String arg0) {
    return 'మీరు $arg0 సంఖ్యలను పరిష్కరించారు!';
  }

  @override
  String switchTaskMessage(String arg0) {
    return 'మీరు $arg0 సరిగ్గా సాధించారు! వేగంగా మారడం మానసిక సౌలభ్యానికి కీలకం.';
  }

  @override
  String sequenceSleuthMessage(String arg0) {
    return 'మీరు $arg0 క్రమాలను పరిష్కరించారు!';
  }

  @override
  String changeBlindnessMessage(String arg0) {
    return 'మీరు $arg0 మార్పులను కనుగొన్నారు!';
  }

  @override
  String mentalRotationMessage(String arg0) {
    return 'మీరు $arg0 ఆకారాలను సరిగ్గా తిప్పారు!';
  }

  @override
  String wordMastermindMessage(String arg0) {
    return 'మీరు కోడ్‌ను ఛేదించారు!\\nఆ పదం: $arg0';
  }

  @override
  String wordMastermindMessage1(String arg0) {
    return 'దాగి ఉన్న పదం: $arg0';
  }

  @override
  String wordMastermindText(String arg0) {
    return '$arg0';
  }

  @override
  String get simonSequenceMessage => 'మీరు మొత్తం 10 టైల్స్ గుర్తుంచుకున్నారు!';

  @override
  String get simonSequenceMessage1 =>
      'ఆ క్రమాన్ని నేర్చుకోవడానికి మళ్ళీ ప్రయత్నించండి.';

  @override
  String oxymoronHuntMessage(String arg0) {
    return 'మీరు $arg0 ఆక్సిమోరాన్‌లను కనుగొన్నారు!';
  }

  @override
  String spotlightTrackMessage(String arg0) {
    return 'అద్భుతమైన స్పేషియల్ ట్రాకింగ్! మీరు $arg0 పాయింట్లు సాధించారు.';
  }

  @override
  String get spotlightTrackText => 'ఎలా ఆడాలి';

  @override
  String get spotlightTrackText1 => 'అర్థమైంది';

  @override
  String get spotlightTrackText2 => 'రౌండ్ ప్రారంభించండి';

  @override
  String vennNumbersMessage(String arg0) {
    return 'మీరు $arg0 సంఖ్యలను వర్గీకరించారు!';
  }

  @override
  String get vennNumbersText => 'రెండూ కాదు';

  @override
  String get vennNumbersText1 => 'రెండూ';

  @override
  String get silhouetteMatchMessage =>
      'మీ మెదడు 3D నుండి 2D కి మార్చడంలో అద్భుతంగా పనిచేస్తుంది.';

  @override
  String sumSnakeMessage(String arg0) {
    return 'సంపూర్ణ ఖచ్చితత్వంతో లక్ష్యం $arg0 చేరుకున్నారు!';
  }

  @override
  String get sumSnakeText => 'మార్గాన్ని శుభ్రం చేయండి';

  @override
  String percentagePeakMessage(String arg0) {
    return 'మీరు $arg0 శాతానికి సంబంధించిన సమస్యలను పరిష్కరించారు!';
  }

  @override
  String trailMakingMessage(String arg0) {
    return 'మీరు $arg0 ట్రయల్స్ పూర్తి చేశారు! ఈ పరీక్ష మీ విజువల్ సెర్చ్ స్పీడ్ మరియు మానసిక సౌలభ్యాన్ని కొలుస్తుంది.';
  }

  @override
  String matrixReasoningMessage(String arg0) {
    return 'మీరు $arg0 మ్యాట్రిక్స్‌లను సరిగ్గా పూర్తి చేశారు!';
  }

  @override
  String get tentsAndTreesMessage => 'మీరు అన్ని టెంట్లను విజయవంతంగా అమర్చారు.';

  @override
  String klotskiMessage(String arg0) {
    return 'అద్భుతమైన స్లైడింగ్! మీరు హీరో బ్లాక్‌ను $arg0 కదలికలలో విడిపించారు.';
  }

  @override
  String sumPyramidMessage(String arg0) {
    return 'మీరు $arg0 సమ్ పిరమిడ్లను విజయవంతంగా పరిష్కరించారు!';
  }

  @override
  String simonCommandMessage(String arg0) {
    return 'అద్భుతమైన సెలెక్టివ్ రెస్పాన్స్ మరియు ఫోకస్! మొత్తం స్కోరు: $arg0';
  }

  @override
  String simonCommandMessage1(String arg0, String arg1) {
    return 'మీరు $arg0 సాధించారు, కానీ సమయానికి $arg1 మ్యాచులను చేరుకోలేదు.';
  }

  @override
  String syllableStackMessage(String arg0) {
    return 'మీరు $arg0 స్కోరును పేర్చారు!';
  }

  @override
  String get slitherlinkMessage =>
      'అద్భుతం! మీరు లూప్ పజిల్ విజయవంతంగా పూర్తి చేశారు.';

  @override
  String quickMathMessage(String arg0) {
    return 'మీరు $arg0 సమస్యలను పరిష్కరించారు!';
  }

  @override
  String commonDenominatorMessage(String arg0) {
    return 'మీరు $arg0 GCD/LCM సమస్యలను పరిష్కరించారు!';
  }

  @override
  String chainReactionMessage(String arg0, String arg1) {
    return 'మీ తుది స్కోరు $arg0. మీరు $arg1 పదాల గొలుసును నిర్మించారు.';
  }

  @override
  String chainReactionText(String arg0) {
    return '$arg0';
  }

  @override
  String get associativePairsMessage =>
      'అద్భుతం! మీరు విజువల్ లక్షణాలను ఖచ్చితంగా జత చేశారు.';

  @override
  String get associativePairsMessage1 =>
      'తప్పుడు కలయిక! మీ లింక్ మెమరీని మెరుగుపరచుకుని మళ్ళీ ప్రయత్నించండి.';

  @override
  String portmanteauSplitMessage(String arg0) {
    return 'మీరు $arg0 పోర్ట్‌మాంట్యూలను విడదీశారు!';
  }

  @override
  String get magicSquaresText => 'క్లియర్';

  @override
  String alphabetSudokuText(String arg0) {
    return 'లోపం: $arg0';
  }

  @override
  String get pipesMessage => 'మీరు అన్ని పైపులను కలిపి గ్రిడ్ నింపారు.';

  @override
  String get dualMirrorMessage =>
      'మీరు రెండు ఐకాన్లను వాటి లక్ష్యాలకు చేర్చారు!';

  @override
  String binaryCodeMessage(String arg0) {
    return 'అద్భుతమైన వేగవంతమైన డెసిమల్ అనువాదం! తుది స్కోరు: $arg0';
  }

  @override
  String binaryCodeMessage1(String arg0, String arg1) {
    return 'మీరు $arg0 బైనరీ సంఖ్యలను సరిగ్గా మార్చారు. స్కోరు: $arg1';
  }

  @override
  String oddOneOutMessage(String arg0) {
    return 'మీరు 50 విభిన్నమైన వాటిని కనుగొన్నారు! తుది స్కోరు: $arg0';
  }

  @override
  String oddOneOutMessage1(String arg0) {
    return 'మీ స్కోరు: $arg0';
  }

  @override
  String letterBridgeMessage(String arg0) {
    return 'మీరు వారధి అక్షరాన్ని కనుగొన్నారు: $arg0';
  }

  @override
  String get imReady => 'నేను సిద్ధంగా ఉన్నాను';

  @override
  String get soptTitle => 'స్వీయ-ఆర్డర్ చేసిన పాయింటింగ్';

  @override
  String get soptSubtitle =>
      'ప్రతిసారీ వేరే కార్డ్‌ని ట్యాప్ చేయండి. స్థానాలు షఫుల్!';

  @override
  String get soptWinTitle => 'సీక్వెన్స్ మాస్టర్!';

  @override
  String soptGameOverMessage(int score) {
    return 'షఫుల్ చేసిన కార్డ్‌లను విజయవంతంగా ట్రాక్ చేయడం ద్వారా మీరు $score పాయింట్‌లను సాధించారు!';
  }

  @override
  String get soptChooseNovel => 'కొత్త కార్డ్‌ని నొక్కండి';

  @override
  String get soptGreatJob => 'గొప్ప పని!';

  @override
  String get soptAlreadyTapped => 'ఇప్పటికే ట్యాప్ చేయబడింది!';

  @override
  String get soptGrid => 'గ్రిడ్';

  @override
  String get contRecogTitle => 'నిరంతర గుర్తింపు';

  @override
  String get contRecogSubtitle =>
      'మీరు ఈ సెషన్‌లో ఇంతకు ముందు ఈ కార్డ్‌ని చూసారా?';

  @override
  String get contRecogWinTitle => 'గుర్తింపు మేధావి!';

  @override
  String contRecogGameOverMessage(int score) {
    return 'మీరు సరైన గుర్తింపులను $score స్కోర్ చేసారు!';
  }

  @override
  String get contRecogCorrect => 'కరెక్ట్!';

  @override
  String get contRecogWrong => 'తప్పు!';

  @override
  String get contRecogOldOrNew => 'ఇది పాతదా కొత్తదా?';

  @override
  String get contRecogNew => 'కొత్తది';

  @override
  String get contRecogOld => 'పాతది';

  @override
  String get contRecogSeenPool => 'పూల్ చూసింది';

  @override
  String get dnmsTitle => 'సరిపోలని మెమరీ';

  @override
  String get dnmsSubtitle => 'గుర్తుంచుకోబడిన నమూనాలో లేని కార్డ్‌ను నొక్కండి.';

  @override
  String get dnmsWinTitle => 'సరిపోలని నిపుణుడు!';

  @override
  String dnmsGameOverMessage(int score) {
    return 'ఆలస్యమైన నాన్-మ్యాచింగ్‌లో మీరు $score సరైన సమాధానాలను స్కోర్ చేసారు!';
  }

  @override
  String get dnmsChooseNovel => 'కొత్త కార్డ్‌ని నొక్కండి';

  @override
  String get dnmsMemorizeSample => 'ఈ కార్డును గుర్తుంచుకోండి';

  @override
  String get dnmsWaitForIt => 'దాని కోసం వేచి ఉండండి ...';

  @override
  String get dnmsExcellent => 'అద్భుతమైన!';

  @override
  String get dnmsSampleTapped => 'అది నమూనా!';

  @override
  String get dnmsCards => 'కార్డులు';

  @override
  String get symSpanTitle => 'సిమెట్రీ స్పాన్';

  @override
  String get symSpanSubtitle =>
      'నిలువు సమరూపతను గుర్తించేటప్పుడు సెల్ నమూనాలను గుర్తుకు తెచ్చుకోండి.';

  @override
  String get symSpanWinTitle => 'సమరూపత మాస్టారు!';

  @override
  String symSpanGameOverMessage(int score) {
    return 'మీరు లేఅవుట్‌లను రీకాల్ చేయడం మరియు సమరూపతను గుర్తించడం ద్వారా $score పాయింట్‌లను సాధించారు!';
  }

  @override
  String get symSpanMemorizeRed => 'రెడ్ సెల్ స్థానాన్ని గుర్తుంచుకోండి';

  @override
  String get symSpanIsSymmetric => 'నమూనా సుష్టంగా ఉందా?';

  @override
  String get symSpanRecallSequence => 'సరైన క్రమంలో రీకాల్ సీక్వెన్స్';

  @override
  String get symSpanGreatJob => 'గొప్ప పని!';

  @override
  String get symSpanTryAgain => 'మళ్లీ ప్రయత్నించండి!';

  @override
  String get symSpanLength => 'పొడవు';

  @override
  String get readingSpanTitle => 'రీడింగ్ స్పాన్';

  @override
  String get readingSpanSubtitle =>
      'అక్షరాల క్రమాన్ని గుర్తుంచుకునేటప్పుడు వాక్యాలను ధృవీకరించండి.';

  @override
  String get readingSpanWinTitle => 'పఠన నిపుణుడు!';

  @override
  String readingSpanGameOverMessage(int score) {
    return 'రీడింగ్ స్పాన్ మెమరీ ఛాలెంజ్‌లో మీరు $score పాయింట్‌లు సాధించారు!';
  }

  @override
  String get readingSpanTrueFalse => 'ఈ ప్రకటన నిజమా అబద్ధమా?';

  @override
  String get readingSpanMemorizeLetter => 'ఈ లేఖను గుర్తుంచుకోండి';

  @override
  String get readingSpanRecallLetters =>
      'వరుసక్రమంలో అక్షరాలను గుర్తుకు తెచ్చుకోండి';

  @override
  String get readingSpanGreatJob => 'గొప్ప పని!';

  @override
  String get readingSpanTryAgain => 'మళ్లీ ప్రయత్నించండి!';

  @override
  String readingSpanYourSequence(String sequence) {
    return 'మీ క్రమం: $sequence';
  }

  @override
  String get readingSpanLength => 'పొడవు';

  @override
  String get readingSpanSentence1 => 'సూర్యుడు తూర్పున ఉదయిస్తాడు.';

  @override
  String get readingSpanSentence2 => 'మంచు వేడిగా ఉడుకుతోంది.';

  @override
  String get readingSpanSentence3 => 'చేపలు నీటి అడుగున శ్వాస తీసుకోగలవు.';

  @override
  String get readingSpanSentence4 => 'కుక్కలకు రెక్కలు ఉన్నాయి మరియు ఎగరగలవు.';

  @override
  String get readingSpanSentence5 =>
      'నీరు 0 డిగ్రీల సెల్సియస్ వద్ద ఘనీభవిస్తుంది.';

  @override
  String get readingSpanSentence6 => 'పిల్లులు చిన్న కుక్కల్లా మొరుగుతాయి.';

  @override
  String get readingSpanSentence7 => 'వేసవిలో చెట్లకు పచ్చని ఆకులు ఉంటాయి.';

  @override
  String get readingSpanSentence8 => 'వర్షం భూమి నుండి పైకి కురుస్తుంది.';

  @override
  String get readingSpanSentence9 =>
      'ఒక త్రిభుజానికి నాలుగు సమాన భుజాలు ఉంటాయి.';

  @override
  String get readingSpanSentence10 => 'యాపిల్స్ ఒక రకమైన తీపి పండు.';

  @override
  String get readingSpanSentence11 =>
      'చంద్రుడు చెడ్డార్ జున్నుతో తయారు చేయబడింది.';

  @override
  String get readingSpanSentence12 =>
      'ఆటోమొబైల్‌లకు రోల్ చేయడానికి చక్రాలు ఉంటాయి.';

  @override
  String get readingSpanSentence13 => 'అగ్ని గడ్డకట్టే చల్లగా ఉంది.';

  @override
  String get readingSpanSentence14 =>
      'కాగితం ప్రాసెస్ చేయబడిన చెక్కతో తయారు చేయబడింది.';

  @override
  String get readingSpanSentence15 => 'పక్షులకు ఎగరడానికి ఈకలు ఉంటాయి.';

  @override
  String get readingSpanSentence16 => 'అరటిపండ్లు పైన్ చెట్లపై పెరుగుతాయి.';

  @override
  String get readingSpanSentence17 => 'చీమల కంటే ఏనుగు చిన్నది.';

  @override
  String get readingSpanSentence18 =>
      'పుస్తకాలలో టెక్స్ట్ యొక్క ముద్రిత పేజీలు ఉంటాయి.';

  @override
  String get countingSpanTitle => 'కౌంటింగ్ స్పాన్';

  @override
  String get countingSpanSubtitle =>
      'నీలం వృత్తాలను మాత్రమే లెక్కించండి. అప్పుడు గణనల క్రమాన్ని గుర్తుకు తెచ్చుకోండి.';

  @override
  String get countingSpanWinTitle => 'మేధావి లెక్క!';

  @override
  String countingSpanGameOverMessage(int score) {
    return 'మీరు కౌంటింగ్ స్పాన్ మెమరీ ఛాలెంజ్‌లో $score పాయింట్లు సాధించారు!';
  }

  @override
  String get countingSpanCountCircles =>
      'నీలిరంగు సర్కిల్‌లను మాత్రమే లెక్కించండి';

  @override
  String get countingSpanRecallCounts => 'సరైన క్రమంలో రీకాల్ గణనలు';

  @override
  String get countingSpanGreatJob => 'గొప్ప పని!';

  @override
  String get countingSpanTryAgain => 'మళ్లీ ప్రయత్నించండి!';

  @override
  String countingSpanYourSequence(String sequence) {
    return 'మీ క్రమం: $sequence';
  }

  @override
  String get countingSpanLength => 'పొడవు';

  @override
  String get objDispTitle => 'వస్తువు స్థానభ్రంశం';

  @override
  String get objDispSubtitle =>
      'లేఅవుట్‌ను గుర్తుంచుకోండి. స్థానం మార్చే ఒక వస్తువును కనుగొని, నొక్కండి.';

  @override
  String get objDispWinTitle => 'ప్రాదేశిక మేధావి!';

  @override
  String objDispGameOverMessage(int score) {
    return 'మీరు $score స్థానభ్రంశం చెందిన వస్తువులను సరిగ్గా గుర్తించారు!';
  }

  @override
  String get objDispMemorizeAll => 'అన్ని నియామకాలను గుర్తుంచుకోండి';

  @override
  String get objDispWaitingShift => 'లేఅవుట్ మార్పు కోసం వేచి ఉంది...';

  @override
  String get objDispTapMoved => 'తరలించిన వస్తువును నొక్కండి';

  @override
  String get objDispExcellent => 'అద్భుతమైన!';

  @override
  String get objDispWrongObject => 'తప్పు వస్తువు!';

  @override
  String get objDispItems => 'వస్తువులు';

  @override
  String get mandalaTitle => 'మండల రీకాల్';

  @override
  String get mandalaSubtitle =>
      'రంగు కాన్ఫిగరేషన్‌ను గుర్తుంచుకోండి. రంగులు ఎంచుకొని టైల్స్‌కు మళ్లీ పెయింట్ చేయండి.';

  @override
  String get mandalaWinTitle => 'మండల కళాకారిణి!';

  @override
  String mandalaGameOverMessage(int score) {
    return 'మీరు రంగుల రేఖాగణిత లేఅవుట్‌లను పునఃసృష్టించడం ద్వారా $score పాయింట్‌లను సాధించారు!';
  }

  @override
  String get mandalaMemorizeColors => 'టైల్ రంగులను గుర్తుంచుకోండి';

  @override
  String get mandalaPaintCells =>
      'ఒరిజినల్‌కు సరిపోయేలా సెల్‌లను పెయింట్ చేయండి';

  @override
  String get mandalaExcellent => 'అద్భుతమైన!';

  @override
  String get mandalaIncorrectMatch => 'సరికాని మ్యాచ్!';

  @override
  String get mandalaSubmitRepaint => 'తిరిగి పెయింట్ సమర్పించండి';

  @override
  String get mandalaTiles => 'టైల్స్';

  @override
  String get runningSpanTitle => 'రన్నింగ్ స్పాన్';

  @override
  String get runningSpanSubtitle =>
      'అక్షరాలను గమనించండి. అవి ఆగిపోయినప్పుడు, చివరి N అక్షరాలను క్రమంలో ఇన్‌పుట్ చేయండి.';

  @override
  String get runningSpanWinTitle => 'బఫర్ మాస్టర్!';

  @override
  String runningSpanGameOverMessage(int score) {
    return 'మీరు రన్నింగ్ మెమరీ స్పాన్‌లో $score పాయింట్‌లు సాధించారు!';
  }

  @override
  String runningSpanPrepareRecall(int count) {
    return 'చివరి $count అక్షరాలను రీకాల్ చేయడానికి సిద్ధం చేయండి';
  }

  @override
  String get runningSpanWatchCarefully => 'జాగ్రత్తగా గమనించండి...';

  @override
  String runningSpanEnterLast(int count) {
    return 'చివరి $count అక్షరాలను నమోదు చేయండి';
  }

  @override
  String get runningSpanGreatJob => 'గొప్ప పని!';

  @override
  String get runningSpanIncorrectBuffer => 'సరికాని బఫర్!';

  @override
  String runningSpanRecallLast(int count) {
    return 'చివరిగా గుర్తుచేసుకోండి $count';
  }

  @override
  String get runningSpanStopsRandomly => 'స్ట్రీమ్ యాదృచ్ఛికంగా ఆగిపోతుంది!';

  @override
  String runningSpanEntered(String sequence) {
    return 'ప్రవేశించినది: $sequence';
  }

  @override
  String get runningSpanNItems => 'N-అంశాలు';

  @override
  String get spatialCabinetTitle => 'ప్రాదేశిక క్యాబినెట్‌లు';

  @override
  String get spatialCabinetSubtitle =>
      'ఏ క్యాబినెట్ డ్రాయర్‌లో ఏ వస్తువు ఉందో గుర్తుంచుకోండి.';

  @override
  String get spatialCabinetWinTitle => 'క్యాబినెట్ నిపుణుడు!';

  @override
  String spatialCabinetGameOverMessage(int score) {
    return 'మీరు స్పేషియల్ క్యాబినెట్ మెమరీలో $score పాయింట్లు సాధించారు!';
  }

  @override
  String get spatialCabinetMemorize => 'అంశం స్థానాలను గుర్తుంచుకోండి';

  @override
  String spatialCabinetWhereIs(String itemName) {
    return '$itemName ఎక్కడ ఉంది?';
  }

  @override
  String get spatialCabinetCorrect => 'కరెక్ట్!';

  @override
  String get spatialCabinetWrongDrawer => 'తప్పు డ్రాయర్!';

  @override
  String get spatialCabinetItems => 'వస్తువులు';

  @override
  String get cabinetItemKey => 'కీ';

  @override
  String get cabinetItemApple => 'ఆపిల్';

  @override
  String get cabinetItemDiamond => 'డైమండ్';

  @override
  String get cabinetItemBook => 'పుస్తకం';

  @override
  String get cabinetItemUmbrella => 'గొడుగు';

  @override
  String get cabinetItemCoffee => 'కాఫీ';

  @override
  String get cabinetItemLock => 'తాళం వేయండి';

  @override
  String get cabinetItemPet => 'పెంపుడు జంతువు';

  @override
  String get cabinetItemCar => 'కారు';

  @override
  String get gamesTitleLabel => 'ఆటలు';

  @override
  String get yourFavorites => 'మీ ఇష్టమైనవి';

  @override
  String get readyForWorkout => 'మీ రోజువారీ వ్యాయామం కోసం సిద్ధంగా ఉన్నారా?';

  @override
  String get greatStartKeepGoing => 'గొప్ప ప్రారంభం! కొనసాగించండి.';

  @override
  String get onFireToday => 'ఈ రోజు మీరు అద్భుతంగా ఆడుతున్నారు!';

  @override
  String get incredibleSolvingToday => 'ఈ రోజు అద్భుతమైన పరిష్కారాలు!';

  @override
  String get newGameLabel => 'కొత్తది';

  @override
  String get slitherlinkTitle => 'స్లిథర్ లింక్';

  @override
  String get slitherlinkSubtitle =>
      'సంఖ్యల ఆధారంగా పిన్ గ్రిడ్‌ను లూప్ చేయండి.';

  @override
  String get futoshikiTitle => 'ఫుతోషికి';

  @override
  String get futoshikiSubtitle =>
      'గ్రేటర్-దాన్ క్లూస్‌తో గ్రిడ్‌లను పూరించండి.';

  @override
  String get kakuroTitle => 'కాకురో';

  @override
  String get kakuroSubtitle =>
      'సంఖ్యలు మరియు మొత్తాలతో క్రాస్‌వర్డ్‌లను పరిష్కరించండి.';

  @override
  String get inequalityDashTitle => 'అసమానత డ్యాష్';

  @override
  String get inequalityDashSubtitle => 'సమయ ఒత్తిడిలో అసమానతలను పరిష్కరించండి.';

  @override
  String get factorFinderTitle => 'కారణాంక అన్వేషి';

  @override
  String get factorFinderSubtitle =>
      'లక్ష్య సంఖ్యల అన్ని కారణాంకాలను గుర్తించండి.';

  @override
  String get collatzTitle => 'కొలాట్జ్ మార్గం';

  @override
  String get collatzSubtitle => '3N+1 క్రమంలో ప్రయాణించండి.';

  @override
  String get sumPyramidTitle => 'మొత్తాల పిరమిడ్';

  @override
  String get sumPyramidSubtitle =>
      'మొత్తాల గణిత క్లూస్‌తో పిరమిడ్ సెల్‌లను పూరించండి.';

  @override
  String get target10Title => 'టార్గెట్ 10';

  @override
  String get target10Subtitle => 'పది మొత్తం రావడానికి సంఖ్య టైల్స్‌ను కలపండి.';

  @override
  String get fractionMatcherTitle => 'భిన్నాల జతకట్టడం';

  @override
  String get fractionMatcherSubtitle =>
      'సమానమైన భిన్నాలను దృశ్యమానంగా జత చేయండి.';

  @override
  String get dualCodingTitle => 'ద్వంద్వ కోడింగ్';

  @override
  String get dualCodingSubtitle =>
      'అక్షరాలు మరియు చిహ్నాలను ఒకేసారి జత చేయండి.';

  @override
  String get distractorMatrixTitle => 'డిస్ట్రాక్టర్ మ్యాట్రిక్స్';

  @override
  String get distractorMatrixSubtitle =>
      'డిస్ట్రాక్టర్ల మధ్య లక్ష్య ఆకృతులను కనుగొనండి.';

  @override
  String get temporalOrderTitle => 'కాలక్రమం';

  @override
  String get temporalOrderSubtitle =>
      'కాలక్రమానుసార క్రమాన్ని గుర్తుకు తెచ్చుకోండి.';

  @override
  String get associativePairsTitle => 'అనుబంధ జతలు';

  @override
  String get associativePairsSubtitle =>
      'సంబంధిత చిహ్నాలను జత చేయండి మరియు సరిపోల్చండి.';

  @override
  String get blockCount3dTitle => '3D బ్లాక్ లెక్కింపు';

  @override
  String get blockCount3dSubtitle =>
      'త్రిమితీయ ప్రదేశంలో బ్లాక్‌లను లెక్కించండి.';

  @override
  String get rotatingMazeTitle => 'తిరిగే మేజ్';

  @override
  String get rotatingMazeSubtitle =>
      'బంతులను నిష్క్రమణ వైపు నడిపించడానికి మేజ్‌లను తిప్పండి.';

  @override
  String get silhouetteMatchOrthoTitle => 'సిల్హౌట్ మ్యాచ్ (ఆర్థో)';

  @override
  String get silhouetteMatchOrthoSubtitle =>
      '3D వస్తువులను ఆర్థో నీడలతో సరిపోల్చండి.';

  @override
  String get spatialConflictTitle => 'ప్రాదేశిక సంఘర్షణ';

  @override
  String get spatialConflictSubtitle =>
      'టెక్స్ట్ మరియు దిశ మధ్య వ్యత్యాసాలను పరిష్కరించండి.';

  @override
  String get spotlightTrackTitle => 'స్పాట్‌లైట్ ట్రాక్';

  @override
  String get spotlightTrackSubtitle =>
      'కదిలే నీడలలో మెరుస్తున్న వస్తువులను ట్రాక్ చేయండి.';

  @override
  String get d2AttentionTitle => 'd2 ఏకాగ్రత';

  @override
  String get d2AttentionSubtitle =>
      'కఠినమైన ప్రమాణాలతో లక్ష్య చిహ్నాలను ట్యాప్ చేయండి.';

  @override
  String get dualMirrorTitle => 'ద్వంద్వ దర్పణ నావిగేషన్';

  @override
  String get dualMirrorSubtitle => 'ఒకేసారి రెండు మేజ్‌లను నావిగేట్ చేయండి.';

  @override
  String get contextCluesTitle => 'సందర్భోచిత క్లూస్';

  @override
  String get contextCluesSubtitle =>
      'సందర్భోచిత సూచనల నుండి దాగి ఉన్న పదాలను ఊహించండి.';

  @override
  String get digitSpanReverseSubtitle =>
      'సంఖ్య అంకెలను రివర్స్ క్రమంలో గుర్తుకు తెచ్చుకోండి.';

  @override
  String get faceNameAssociationSubtitle =>
      'ప్రదర్శించబడిన వివిధ ముఖాల పేర్లను గుర్తుకు తెచ్చుకోండి.';

  @override
  String get staircaseMemorySubtitle =>
      'భ్లాక్‌లను మెట్ల క్రమంలో గుర్తుంచుకోండి.';

  @override
  String get choiceReactionTimeSubtitle =>
      'క్లూస్‌కు సరిపోయే నిర్దిష్ట బటన్‌లను వేగంగా ట్యాప్ చేయండి.';

  @override
  String get attentionalBlinkSubtitle =>
      'స్ట్రీమ్స్‌లో వేగంగా మెరుస్తున్న లక్ష్యాలను గుర్తించండి.';

  @override
  String get visualStatisticalLearningSubtitle =>
      'ఆకృతుల కాలక్రమానుసార నమూనాలను దృశ్యమానంగా నేర్చుకోండి.';

  @override
  String get sternbergTaskSubtitle =>
      'చిహ్నం మెమరీ సెట్‌లో ఉందో లేదో గుర్తుకు తెచ్చుకోండి.';

  @override
  String get operationSpanSubtitle =>
      'గణితాన్ని పరిష్కరించండి మరియు వర్ణమాల స్ట్రింగ్స్‌ను గుర్తుకు తెచ్చుకోండి.';

  @override
  String get continuousRecognitionTitle => 'నిరంతర గుర్తింపు';

  @override
  String get continuousRecognitionSubtitle =>
      'ప్రదర్శించబడిన కార్డ్ పాతదా లేదా కొత్తదా అని గుర్తించండి.';

  @override
  String get symmetrySpanTitle => 'సమరూపత వ్యవధి';

  @override
  String get symmetrySpanSubtitle =>
      'నిలువు సమరూపత నిర్ణయాల మధ్య సెల్ కోఆర్డినేట్‌లను గుర్తుకు తెచ్చుకోండి.';

  @override
  String get objectDisplacementTitle => 'వస్తువు స్థానభ్రంశం';

  @override
  String get objectDisplacementSubtitle =>
      'స్థానాలను అధ్యయనం చేయండి మరియు కదిలిన వస్తువును ట్యాప్ చేయండి.';

  @override
  String get mandalaRecallTitle => 'మండలా రీకాల్';

  @override
  String get mandalaRecallSubtitle =>
      'రంగు టైల్స్‌ను గుర్తుంచుకోండి మరియు ప్యాలెట్ నుండి మండలాను తిరిగి పెయింట్ చేయండి.';

  @override
  String get runningMemorySpanTitle => 'రన్నింగ్ స్పాన్';

  @override
  String get runningMemorySpanSubtitle =>
      'ప్రవహించే అక్షరాలను పర్యవేక్షించండి మరియు చివరి N వస్తువులను గుర్తుకు తెచ్చుకోండి.';

  @override
  String get spatialCabinetMemoryTitle => 'ప్రాదేశిక క్యాబినెట్లు';

  @override
  String get spatialCabinetMemorySubtitle =>
      'క్యాబినెట్ తలుపుల వెనుక ఉన్న వస్తువులను గుర్తుంచుకోండి మరియు కనుగొనండి.';

  @override
  String get pathRecallSubtitle =>
      'మార్గ ఎంపికలను గుర్తుంచుకోండి మరియు పునరావృతం చేయండి.';

  @override
  String get objectShuffleSubtitle =>
      'లోతైన కప్పుల క్రింద మార్చబడిన వస్తువులను ట్రాక్ చేయండి.';

  @override
  String get groceryListSubtitle =>
      'జాబితాలోని వస్తువులను గుర్తుంచుకోండి మరియు టిక్ చేయండి.';

  @override
  String get quickMathSubtitle =>
      'అంకగణిత ప్రశ్నలను అత్యంత వేగంగా పరిష్కరించండి.';

  @override
  String get mathGuessTitle => 'గణిత అంచనా';

  @override
  String get mathGuessSubtitle => 'దాగి ఉన్న సంఖ్యను 15 అవకాశాలలో ఊహించండి.';

  @override
  String get reflexTapSubtitle =>
      'ఉద్దీపనలను మానవ పరిమితి మేరకు వేగంగా ట్యాప్ చేయండి.';

  @override
  String get pixelMimicSubtitle =>
      'పిక్సెల్ గ్రిడ్‌లపై డిజైన్ నమూనాలను అనుకరించండి.';

  @override
  String get simonSequenceSubtitle =>
      'మెమరీ నుండి ఆకృతుల క్రమాన్ని పునరావృతం చేయండి.';

  @override
  String get slidePuzzleSubtitle =>
      'చదరపు స్లైడింగ్ గ్రిడ్ టైల్స్‌ను మళ్ళీ అమర్చండి.';

  @override
  String get findWordTitle => 'పదాన్ని కనుగొనండి';

  @override
  String get schulteTableSubtitle =>
      'ఒకటి నుండి ఇరవై ఐదు వరకు సంఖ్యలను ట్యాప్ చేయండి.';

  @override
  String get simonCommandTitle => 'సైమన్ కమాండ్';

  @override
  String get simonCommandSubtitle => 'వాయిస్ సూచనలను వేగంగా అమలు చేయండి.';

  @override
  String get binaryCodeTitle => 'బైనరీ వేగం';

  @override
  String get binaryCodeSubtitle => 'బైనరీ కోడ్‌లను డెసిమల్‌లోకి అనువదించండి.';

  @override
  String get moduloClockTitle => 'మోడ్యులో గడియారం';

  @override
  String get moduloClockSubtitle =>
      'గడియారాలను ఉపయోగించి గణిత సమీకరణాలను లెక్కించండి.';

  @override
  String get chimpTestTitle => 'చింపాంజీ పరీక్ష';

  @override
  String get chimpTestSubtitle =>
      'యాదృచ్ఛిక సంఖ్యలను ఆరోహణ క్రమంలో ట్యాప్ చేయండి.';

  @override
  String get relationalMemoryTitle => 'సంబంధిత జ్ఞాపకశక్తి';

  @override
  String get relationalMemorySubtitle =>
      'ఖచ్చితమైన గ్రిడ్ ఐటెమ్ స్థానాలను గుర్తుకు తెచ్చుకోండి.';

  @override
  String get factBinderTitle => 'ఫ్యాక్ట్ బైండర్';

  @override
  String get factBinderSubtitle =>
      'చిహ్నాలను కనెక్ట్ చేయండి మరియు ప్రకటనలను గుర్తుకు తెచ్చుకోండి.';

  @override
  String get sourceMonitoringTitle => 'మూల పర్యవేక్షణ';

  @override
  String get sourceMonitoringSubtitle => 'సందర్భాన్ని గుర్తుంచుకోండి.';

  @override
  String get klotskiTitle => 'క్లోట్స్కీ ఎస్కేప్';

  @override
  String get klotskiSubtitle =>
      'నిష్క్రమణను చేరుకోవడానికి బ్లాక్‌లను స్లైడ్ చేయండి.';

  @override
  String get homophoneHuntSubtitle =>
      'సరైన స్పెల్లింగ్ ఉన్న హోమోఫోన్‌ను ఎంచుకోండి';

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
