// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'పజిల్ గేమ్స్';

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
  String get keepScreenAwake => 'Keep Screen Awake';

  @override
  String get keepScreenAwakeDescription =>
      'Prevent screen from turning off during gameplay';

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
  String get orbitTapTapToHit => 'బంతి గేట్లోకి ప్రవేశించినప్పుడు నొక్కండి';

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
  String get shapeRectangle => 'దీర్ఘచతురస్రం';

  @override
  String get shapeEllipse => 'దీర్ఘవృత్తం';

  @override
  String get shapeTrapezoid => 'ట్రాపెజాయిడ్';

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
    return 'మీరు $arg0లో పట్టికను పూర్తి చేశారు.\nమీ పెరిఫెరల్ విజన్‌ను పెంచుకోవడానికి సాధన చేస్తూ ఉండండి!';
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
    return 'హిట్‌లు: $arg0, మిస్సులు: $arg1\nతప్పుడు అలారాలు: $arg2';
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
    return '$arg0: $arg1\n$arg2';
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
    return 'మీరు కోడ్‌ను ఛేదించారు!\nఆ పదం: $arg0';
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
  String get laserLinkTitle => 'లేజర్ లింక్';

  @override
  String get laserLinkSubtitle =>
      'లేజర్‌లను ప్రతిబింబించేలా అద్దాలను తిప్పండి మరియు అన్ని లక్ష్యాలను శక్తివంతం చేయండి.';

  @override
  String get laserLinkCongrats =>
      'ఖచ్చితమైన ప్రతిబింబం! మీరు మొత్తం గ్రిడ్‌ను విజయవంతంగా శక్తివంతం చేశారు.';

  @override
  String get crossSectionSliceTitle => 'క్రాస్-సెక్షన్ స్లైస్';

  @override
  String get crossSectionSliceSubtitle =>
      'నిర్దిష్ట కోణం నుండి 3D వస్తువు యొక్క సరైన 2D క్రాస్-సెక్షన్‌ను గుర్తించండి.';

  @override
  String get crossSectionSliceCongrats =>
      'అద్భుతమైన 3D విజువలైజేషన్! మీరు ఆ ఆకారం గుండా సరిగ్గా చూశారు.';

  @override
  String get shadowPivotTitle => 'షాడో పివట్';

  @override
  String get shadowPivotCongrats =>
      'డైనమిక్ స్పేషియల్ రీజనింగ్! మీరు కాంతి మరియు నీడపై పట్టు సాధించారు.';

  @override
  String get shadowPivotSubtitle =>
      'విభిన్న అక్షాలపై తిరుగుతున్నప్పుడు 3D వస్తువు ద్వారా పడే నీడను అంచనా వేయండి.';

  @override
  String get interlockPuzzleTitle => 'ఇంటర్‌లాక్ పజిల్';

  @override
  String get interlockPuzzleSubtitle =>
      'సంక్లిష్టమైన ఇంటర్‌లాకింగ్ బ్లాక్‌లను సరైన క్రమంలో విడదీయండి లేదా సమీకరించండి.';

  @override
  String get interlockPuzzleCongrats =>
      'లాజికల్ డికన్స్ట్రక్షన్! మీరు పజిల్‌ను ఖచ్చితంగా విప్పారు.';

  @override
  String get pathIntersectTitle => 'పాత్ ఇంటర్సెక్ట్';

  @override
  String get pathIntersectSubtitle =>
      'ఢీకొనకుండా వాటి లక్ష్యాలను చేరుకోవడానికి ఒకేసారి బహుళ మార్గాలను నావిగేట్ చేయండి.';

  @override
  String get pathIntersectCongrats =>
      'సింక్రొనైజ్డ్ నావిగేషన్! మీరు అన్ని లక్ష్యాలను దోషరహితంగా చేరుకున్నారు.';

  @override
  String get negativeSpaceDetectionTitle => 'నెగటివ్ స్పేస్';

  @override
  String get negativeSpaceDetectionSubtitle =>
      'వస్తువుల మధ్య ఖాళీ స్థలం ద్వారా ఏర్పడిన ఆకారాన్ని గుర్తించండి.';

  @override
  String get negativeSpaceDetectionCongrats =>
      'తీక్షణమైన అవగాహన! అక్కడ లేని వాటిని చూసే కళలో మీరు ప్రావీణ్యం సంపాదించారు.';

  @override
  String get compassMazeTitle => 'దిక్సూచి చిట్టడవి';

  @override
  String get compassMazeSubtitle =>
      'మీ దిక్సూచి విన్యాసం ఆధారంగా కదలిక దిశలు మారే చిట్టడవిని నావిగేట్ చేయండి.';

  @override
  String get compassMazeCongrats =>
      'నిపుణుల నావిగేషన్! మారుతున్న దిశల ద్వారా మీరు నిష్క్రమణను కనుగొన్నారు.';

  @override
  String get complexFoldingNetsTitle => 'ఫోల్డింగ్ నెట్స్';

  @override
  String get complexFoldingNetsSubtitle =>
      'ప్రామాణికం కాని 2D నెట్‌ను మడతపెట్టడం ద్వారా ఏ సంక్లిష్టమైన 3D ఆకృతి ఏర్పడుతుందో నిర్ణయించండి.';

  @override
  String get complexFoldingNetsCongrats =>
      'అధునాతన ఫోల్డింగ్ లాజిక్! మీరు 3D రూపాన్ని విజయవంతంగా ఊహించారు.';

  @override
  String get compassMazeMessage =>
      'దిక్సూచిని ఉపయోగించి చిట్టడవిని నావిగేట్ చేయండి.';

  @override
  String get negativeSpaceDetectionMessage =>
      'అంతరాళంలో దాగి ఉన్న వస్తువును గుర్తించండి.';

  @override
  String get shikakuTitle => 'షికాకు';

  @override
  String get shikakuSubtitle =>
      'సంఖ్యలకు సరిపోలే చతురస్రాలు మరియు దీర్ఘచతురస్రాలుగా గ్రిడ్‌ను విభజించండి.';

  @override
  String get countdownMathTitle => 'కౌంట్‌డౌన్ మఠం';

  @override
  String get countdownMathSubtitle =>
      'మూడు అంకెల లక్ష్యాన్ని లెక్కించడానికి యాదృచ్ఛిక సంఖ్యలను కలపండి.';

  @override
  String get narrativeRecallTitle => 'కథనం రీకాల్';

  @override
  String get narrativeRecallSubtitle =>
      'ఒక కథనాన్ని చదవండి మరియు నిర్దిష్ట పరిమాణాత్మక మరియు వాస్తవ వివరాలను గుర్తుకు తెచ్చుకోండి.';

  @override
  String get shellGameTitle => 'షెల్ గేమ్';

  @override
  String get shellGameSubtitle =>
      'ఒక దాచిన బంతిని షఫుల్ చేసే కప్పుల మార్పిడి స్థలాల వలె ట్రాక్ చేయండి.';

  @override
  String get typoglycemiaDecoderTitle => 'టైపోగ్లైసీమియా డీకోడర్';

  @override
  String get typoglycemiaDecoderSubtitle =>
      'స్క్రాంబుల్ చేసి, గందరగోళ వాక్యాలను వేగంగా చదవండి.';

  @override
  String get shapeShifterTitle => 'షేప్ షిఫ్టర్';

  @override
  String get shapeShifterSubtitle => 'లక్ష్యం ఆకారం-రంగు కలయికను నొక్కండి.';

  @override
  String get gokigenNanameTitle => 'గోకిగెన్ నామే';

  @override
  String get gokigenNanameSubtitle =>
      'లూప్‌లు లేకుండా పాయింట్‌లను కనెక్ట్ చేయడానికి వికర్ణాలను గీయండి.';

  @override
  String get matrixMultiplierTitle => 'మాతృక గుణకం';

  @override
  String get matrixMultiplierSubtitle =>
      'లక్ష్యానికి గుణించడం కోసం అడ్డు వరుస మరియు నిలువు వరుసను ఎంచుకోండి.';

  @override
  String get wordAssociationRecallTitle => 'వర్డ్ అసోసియేషన్';

  @override
  String get wordAssociationRecallSubtitle =>
      'మెమరీ నుండి జత చేసిన పద అనుబంధాలను రీకాల్ చేయండి.';

  @override
  String get gearRotationTitle => 'గేర్ రొటేషన్';

  @override
  String get gearRotationSubtitle =>
      'చివరి గేర్ యొక్క భ్రమణ దిశను అంచనా వేయండి.';

  @override
  String get wordWheelTitle => 'పద చక్రం';

  @override
  String get wordWheelSubtitle =>
      'మధ్యలో అక్షరంతో సహా చక్రంలో అక్షరాలను ఉపయోగించి పదాలను రూపొందించండి.';

  @override
  String get oddEvenFlashTitle => 'బేసి-సరి ఫ్లాష్';

  @override
  String get oddEvenFlashSubtitle =>
      'రంగు నియమంతో సంఖ్య సమానత్వాన్ని త్వరగా సరిపోల్చండి.';

  @override
  String get norinoriTitle => 'నోరినోరి';

  @override
  String get norinoriSubtitle =>
      'ప్రతి గదిలో సరిగ్గా రెండు కనెక్ట్ చేయబడిన సెల్‌లను షేడ్ చేయండి.';

  @override
  String get algebraicBalanceTitle => 'బీజగణిత సంతులనం';

  @override
  String get algebraicBalanceSubtitle =>
      'లక్ష్య మొత్తాన్ని కనుగొనడానికి సమీకరణాలను పరిష్కరించండి.';

  @override
  String get patternSequenceDrawTitle => 'నమూనా రీకాల్';

  @override
  String get patternSequenceDrawSubtitle =>
      'గ్రిడ్‌లో యానిమేటెడ్ పాత్ క్రమాన్ని పునరావృతం చేయండి.';

  @override
  String get tangramTitle => 'తంగ్రామ్ పజిల్';

  @override
  String get tangramSubtitle =>
      'లక్ష్య సిల్హౌట్‌ను పూరించడానికి ఆకారాలను అమర్చండి.';

  @override
  String get semanticAssociationTitle => 'అసోసియేషన్ పదం';

  @override
  String get semanticAssociationSubtitle =>
      'మూడు ఆధారాలను అనుసంధానించే పదాన్ని కనుగొనండి.';

  @override
  String get peripheralFocusTitle => 'పరిధీయ ఫోకస్';

  @override
  String get peripheralFocusSubtitle =>
      'గణితాన్ని పరిష్కరించేటప్పుడు సైడ్ ప్యానెల్‌లను ఫ్లాషింగ్ చేయడానికి ప్రతిస్పందించండి.';

  @override
  String get masyuTitle => 'మస్యు లూప్';

  @override
  String get masyuSubtitle =>
      'Masyu సర్కిల్ నియమాలకు సరిపోలే ఒకే లూప్‌ను గీయండి.';

  @override
  String get mathMazeTitle => 'గణితం మేజ్';

  @override
  String get mathMazeSubtitle =>
      'లక్ష్యం మొత్తానికి మూల్యాంకనం చేసే మార్గాన్ని కనుగొనండి.';

  @override
  String get storyBuilderTitle => 'స్టోరీ బిల్డర్';

  @override
  String get storyBuilderSubtitle =>
      'కథ యొక్క కాలక్రమ క్రమాన్ని పునర్నిర్మించండి.';

  @override
  String get mirrorMazeTitle => 'మిర్రర్ మేజ్';

  @override
  String get mirrorMazeSubtitle =>
      'వికర్ణ అద్దాలను ఉపయోగించి లేజర్ పుంజాన్ని దారి మళ్లించండి.';

  @override
  String get wordGridConnectionTitle => 'పద కనెక్షన్లు';

  @override
  String get wordGridConnectionSubtitle =>
      '16 పదాలను నాలుగు విభాగాలుగా విభజించండి.';

  @override
  String get shapeShifterPeripheralTitle => 'పరిధీయ ఆకారాలు';

  @override
  String get shapeShifterPeripheralSubtitle =>
      'కేంద్ర విలువలను సరిపోల్చేటప్పుడు పరిధీయ ఆకార మార్పులను ట్రాక్ చేయండి.';

  @override
  String get soundWaveMatchTitle => 'సౌండ్ వేవ్ మ్యాచ్';

  @override
  String get soundWaveMatchSubtitle =>
      'దృశ్య తరంగ ఫ్రీక్వెన్సీ పిచ్ మార్పులతో సమలేఖనం అయినప్పుడు నొక్కండి.';

  @override
  String get multiTrackCounterTitle => 'మల్టీ-ట్రాక్ కౌంటర్';

  @override
  String get multiTrackCounterSubtitle =>
      'లక్ష్య గుణకారానికి ఏదైనా కౌంటర్ పెరిగినప్పుడు నొక్కండి.';

  @override
  String get colorWordMatchUpTitle => 'రంగు మ్యాచ్-అప్';

  @override
  String get colorWordMatchUpSubtitle =>
      'మారుతున్న నిబంధనల ఆధారంగా రెండు రంగుల పదాలు సరిపోతాయో లేదో నిర్ణయించండి.';

  @override
  String get signalAndNoiseTitle => 'సిగ్నల్ & నాయిస్';

  @override
  String get signalAndNoiseSubtitle =>
      'స్టాటిక్ నాయిస్‌లో దాగి ఉన్న లక్ష్య ఆల్ఫాన్యూమరిక్ అక్షరాలను గుర్తించండి.';

  @override
  String get focusTunnelTitle => 'ఫోకస్ టన్నెల్';

  @override
  String get focusTunnelSubtitle =>
      'కదిలే సొరంగం గోడలపై కనిపించే సరిపోలే చిహ్నాలను గుర్తించండి.';

  @override
  String get targetPursuerTitle => 'టార్గెట్ వెంబడించేవాడు';

  @override
  String get targetPursuerSubtitle =>
      'బహుళ అతివ్యాప్తి చెందుతున్న సర్కిల్‌లను ట్రాక్ చేయండి మరియు అసలు లక్ష్యాన్ని ఎంచుకోండి.';

  @override
  String get gridGazeTitle => 'గ్రిడ్ చూపులు';

  @override
  String get gridGazeSubtitle =>
      'వేరొక వ్యవధితో ఏ గ్రిడ్ సెల్ ఫ్లాష్ అయిందో గుర్తించండి.';

  @override
  String get doubleTroubleTitle => 'డబుల్ ట్రబుల్';

  @override
  String get doubleTroubleSubtitle =>
      'స్ప్లిట్ స్క్రీన్‌పై ఏకకాలంలో రెండు వేర్వేరు సాధారణ గేమ్‌లను ఆడండి.';

  @override
  String get syncRhythmTitle => 'సమకాలీకరణ రిథమ్';

  @override
  String get syncRhythmSubtitle =>
      'విజువల్ మెట్రోనొమ్ స్వీప్ సింకోపేటెడ్ బీట్‌తో సరిపోలినప్పుడు నొక్కండి.';

  @override
  String get ghostTapTitle => 'ఘోస్ట్ ట్యాప్';

  @override
  String get ghostTapSubtitle =>
      'అదృశ్య పల్స్ గరిష్ట ఎత్తుకు చేరుకున్నప్పుడు నొక్కండి.';

  @override
  String get attentionalRsvpTitle => 'శ్రద్ధగల RSVP';

  @override
  String get attentionalRsvpSubtitle =>
      'రాపిడ్ సీరియల్ లెటర్ ఫ్లాష్‌లో కనిపించే అంకెలను గుర్తించండి.';

  @override
  String get colorMazeNavTitle => 'రంగు మేజ్ నవ్';

  @override
  String get colorMazeNavSubtitle =>
      'డైనమిక్ అనుమతి రంగులతో సరిపోలే మేజ్ టైల్స్‌ను నావిగేట్ చేయండి.';

  @override
  String get dynamicSalienceTitle => 'డైనమిక్ సాలియెన్స్';

  @override
  String get dynamicSalienceSubtitle =>
      'కొద్దిగా భిన్నమైన డైనమిక్స్‌తో కదిలే ఆకారాన్ని కనుగొనండి.';

  @override
  String get chalkAndTalkTitle => 'సుద్ద & మాట్లాడండి';

  @override
  String get chalkAndTalkSubtitle =>
      'విజువల్ డిస్ట్రాక్టర్లను విస్మరిస్తూ ఆడియోలో వినిపించే పదాలను టైప్ చేయండి.';

  @override
  String get blinkDetectorTitle => 'బ్లింక్ డిటెక్టర్';

  @override
  String get blinkDetectorSubtitle =>
      'త్వరితగతిన రెండుసార్లు బ్లింక్ అయ్యే గ్రిడ్ ముఖాన్ని నొక్కండి.';

  @override
  String get frequencyTapTitle => 'ఫ్రీక్వెన్సీ ట్యాప్';

  @override
  String get frequencyTapSubtitle =>
      'టార్గెట్ లైట్ పల్స్ ఫ్రీక్వెన్సీకి సరిపోలే బటన్‌ను నొక్కండి.';

  @override
  String get yajilinTitle => 'Yajilin';

  @override
  String get yajilinSubtitle =>
      'నల్ల కణాలను ఉంచండి మరియు ఒకే లూప్ మ్యాచింగ్ క్లూలను గీయండి.';

  @override
  String get heyawakeTitle => 'Heyawake';

  @override
  String get heyawakeSubtitle =>
      'ప్రక్కనే బ్లాక్ సెల్స్ లేకుండా షేడ్ గ్రిడ్ గదులు.';

  @override
  String get gokigenVariantTitle => 'గోకిజెన్ వేరియంట్';

  @override
  String get gokigenVariantSubtitle =>
      'శీర్ష గణనలను కలిసే లూప్-రహిత వికర్ణాలను గీయండి.';

  @override
  String get sheepAndWolvesTitle => 'గొర్రెలు & తోడేళ్ళు';

  @override
  String get sheepAndWolvesSubtitle =>
      'తోడేళ్ళ నుండి గొర్రెలను వేరుచేసే లూప్ గీయండి.';

  @override
  String get islandNurikabeTitle => 'నూరికాబే ద్వీపం';

  @override
  String get islandNurikabeSubtitle =>
      'సంఖ్యా పరిమాణ పరిమితులకు సరిపోలే ఫారమ్ ద్వీపాలు.';

  @override
  String get shakashakaTitle => 'షకషక రెక్ట్స్';

  @override
  String get shakashakaSubtitle =>
      'దీర్ఘచతురస్రాకార తెల్లటి ప్రాంతాలను రూపొందించడానికి త్రిభుజాకార పలకలను ఉంచండి.';

  @override
  String get litsTetrisTitle => 'LITS టెట్రోమినో';

  @override
  String get litsTetrisSubtitle =>
      'టెట్రోమినోలను ప్రక్కనే ఉన్న నకిలీలు లేని గదులలో ఉంచండి.';

  @override
  String get tapaWallTitle => 'టపా వాల్';

  @override
  String get tapaWallSubtitle =>
      'నిరంతర నలుపు గోడ నమూనాను రూపొందించడానికి షేడ్ కణాలు.';

  @override
  String get triangularBridgesTitle => 'త్రిభుజాకార వంతెనలు';

  @override
  String get triangularBridgesSubtitle =>
      'అవసరాలకు అనుగుణంగా ద్వీపాలను 3 దిశల్లో కనెక్ట్ చేయండి.';

  @override
  String get rippleEffectTitle => 'అలల ప్రభావం';

  @override
  String get rippleEffectSubtitle =>
      'స్పేసింగ్ దూర పరిమితులకు సంబంధించి గదుల్లో సంఖ్యలను పూరించండి.';

  @override
  String get suguruTectonicTitle => 'సుగురు గ్రిడ్';

  @override
  String get suguruTectonicSubtitle =>
      'గది బ్లాక్‌లను 1 నుండి K వరకు సంఖ్యలతో పూరించండి, పొరుగువారు సమానంగా ఉండరు.';

  @override
  String get tennerGridTitle => 'టెన్నర్ గ్రిడ్';

  @override
  String get tennerGridSubtitle =>
      'నిలువు వరుసల మొత్తాలకు సరిపోలే 0-9 అంకెలతో అడ్డు వరుసలను పూరించండి.';

  @override
  String get kakurasuSumsTitle => 'కాకురాసు మొత్తాలు';

  @override
  String get kakurasuSumsSubtitle =>
      'వెయిటెడ్ రో/కోల్ ఇండెక్స్ మొత్తాలను చేరుకోవడానికి సెల్‌లను షేడ్ చేయండి.';

  @override
  String get corralLoopTitle => 'కారల్ లూప్';

  @override
  String get corralLoopSubtitle =>
      'విజిబిలిటీకి సరిపోలే సంఖ్యలను కలుపుతూ ఒకే లూప్‌ను గీయండి.';

  @override
  String get stostoneTitle => 'స్టోస్టోన్ గ్రావిటీ';

  @override
  String get stostoneSubtitle =>
      'దిగువ వరుసలను సంపూర్ణంగా పూరించడానికి క్రిందికి పడిపోయే షేడ్ సెల్‌లు.';

  @override
  String get tripletsLogicTitle => 'త్రిపాది త్రయం';

  @override
  String get tripletsLogicSubtitle => 'గ్రిడ్‌ని మూడు ఆకారాలతో పూరించండి.';

  @override
  String get galaxiesSymTitle => 'గెలాక్సీల సమరూపత';

  @override
  String get galaxiesSymSubtitle =>
      'గ్రిడ్‌ను భ్రమణ సౌష్టవమైన గెలాక్సీ ఆకారాలుగా విభజించండి.';

  @override
  String get matrixMultiplierMatchTitle => 'మ్యాట్రిక్స్ మ్యాచర్';

  @override
  String get matrixMultiplierMatchSubtitle =>
      'లక్ష్య చుక్క ఉత్పత్తిని సరిపోల్చడానికి అడ్డు వరుస మరియు నిలువు వరుస విలువలను గుణించండి.';

  @override
  String get primeFactorTreesTitle => 'ప్రధాన కారకం చెట్లు';

  @override
  String get primeFactorTreesSubtitle =>
      'మిశ్రమ సంఖ్యలను ప్రైమ్ లీఫ్ ఫ్యాక్టర్ జతలుగా విడదీయండి.';

  @override
  String get vektorVectorTitle => 'వెక్టర్ వెక్టర్';

  @override
  String get vektorVectorSubtitle =>
      'వెక్టర్‌లను స్కేల్ చేయడం ద్వారా వాటి మొత్తాన్ని లక్ష్యానికి చేరుస్తుంది.';

  @override
  String get binomialMatchTitle => 'ద్విపద సరిపోలిక';

  @override
  String get binomialMatchSubtitle =>
      'వర్గీకరణ ద్విపద విలువలతో చతురస్రాకార సూత్రాలను సరిపోల్చండి.';

  @override
  String get percentageShoppingTitle => 'శాతం షాపింగ్';

  @override
  String get percentageShoppingSubtitle =>
      'తగ్గింపు శాతాలు మరియు చివరి చెక్అవుట్ మొత్తాలను లెక్కించండి.';

  @override
  String get cryptoArithmeticTitle => 'క్రిప్టో-అరిథ్మెటిక్';

  @override
  String get cryptoArithmeticSubtitle =>
      'అక్షర-అంకెల ప్రత్యామ్నాయం సాంకేతికలిపి గణిత సమస్యలను క్రాక్ చేయండి.';

  @override
  String get fractionalPizzaTitle => 'పాక్షిక పిజ్జా';

  @override
  String get fractionalPizzaSubtitle =>
      'లక్ష్య మొత్తం భిన్నాలతో సరిపోలడానికి పిజ్జా ముక్కలను విభజించండి.';

  @override
  String get numberBondsTitle => 'సంఖ్య బాండ్లు';

  @override
  String get numberBondsSubtitle =>
      'లక్ష్య కనెక్షన్ మొత్తానికి సమానమైన లింక్ నోడ్ విలువలు.';

  @override
  String get gridSumLineTitle => 'గ్రిడ్ సమ్ లైన్';

  @override
  String get gridSumLineSubtitle =>
      'లక్ష్యాన్ని సరిగ్గా అంచనా వేసే మార్గాన్ని గీయండి.';

  @override
  String get binaryScaleBalanceTitle => 'బైనరీ స్కేల్ బ్యాలెన్స్';

  @override
  String get binaryScaleBalanceSubtitle =>
      'పవర్-ఆఫ్-టూ బ్లాక్‌లను ఉపయోగించి దశాంశ బరువును బ్యాలెన్స్ చేయండి.';

  @override
  String get moduloPathTitle => 'మాడ్యులో మార్గం';

  @override
  String get moduloPathSubtitle =>
      'ట్రావర్స్ గ్రిడ్ సెల్‌లు మాడ్యులో మిగిలిన విలువలకు సరిపోతాయి.';

  @override
  String get digitSwapEqTitle => 'అంకెల స్వాప్ సమీకరణాలు';

  @override
  String get digitSwapEqSubtitle =>
      'రెండింటినీ సరిచేయడానికి సమీకరణాల మధ్య ఒకే అంకెలను మార్చుకోండి.';

  @override
  String get areaPerimeterMatchTitle => 'ప్రాంతం & చుట్టుకొలత';

  @override
  String get areaPerimeterMatchSubtitle =>
      'లక్ష్య ప్రాంతం మరియు చుట్టుకొలత విలువలకు సరిపోలే దీర్ఘచతురస్రాలను గీయండి.';

  @override
  String get inequalityBalanceOpsTitle => 'అసమానత సంతులనం';

  @override
  String get inequalityBalanceOpsSubtitle =>
      'సంక్లిష్ట గణిత నిబంధనల మధ్య అసమానత చిహ్నాలను ఉంచండి.';

  @override
  String get graphCoordinatePlotTitle => 'గ్రాఫ్ ప్లాటర్';

  @override
  String get graphCoordinatePlotSubtitle =>
      'ప్లాట్ గ్రిడ్ సరిపోలే సరళ/చతురస్రాకార వక్రతలను సమన్వయపరుస్తుంది.';

  @override
  String get baseConversionRunTitle => 'బేస్ మార్పిడి';

  @override
  String get baseConversionRunSubtitle =>
      'బైనరీ, దశాంశ, హెక్స్ మరియు అష్టాంశాల మధ్య విలువలను మార్చండి.';

  @override
  String get unitConverterProTitle => 'యూనిట్ కన్వర్టర్';

  @override
  String get unitConverterProSubtitle =>
      'సమయ పరిమితులలో త్వరిత యూనిట్ మార్పిడికి సమాధానం ఇవ్వండి.';

  @override
  String get auditoryNBackTitle => 'శ్రవణ N-వెనుక';

  @override
  String get auditoryNBackSubtitle =>
      'వినిపించిన మాట్లాడే అక్షరాలను సరిపోల్చండి N మెమొరీ నుండి వెనుకకు అడుగులు వేయండి.';

  @override
  String get abstractPatternRecallTitle => 'నమూనా లేయరింగ్';

  @override
  String get abstractPatternRecallSubtitle =>
      'మెమరీ స్టడీ నుండి లేయర్డ్ రంగుల ఆకారాలను పునర్నిర్మించండి.';

  @override
  String get roomInspectorTitle => 'రూమ్ ఇన్‌స్పెక్టర్';

  @override
  String get roomInspectorSubtitle =>
      'స్క్రీన్ ఖాళీగా ఉన్నప్పుడు చేసిన ఫర్నిచర్ సవరణలను గుర్తించండి.';

  @override
  String get voiceToFaceMatchTitle => 'వాయిస్-ఫేస్ మ్యాచ్';

  @override
  String get voiceToFaceMatchSubtitle =>
      'మాట్లాడే ఆడియో వాయిస్ క్లిప్‌తో అనుబంధించబడిన సరైన ముఖాన్ని ఎంచుకోండి.';

  @override
  String get spatialGridMemory3DTitle => '3D ప్రాదేశిక మెమరీ';

  @override
  String get spatialGridMemory3DSubtitle =>
      'తిప్పబడిన 3D క్యూబ్ గ్రిడ్ నిర్మాణంలో ఫ్లాష్డ్ బ్లాక్‌లను రీకాల్ చేయండి.';

  @override
  String get sequenceStackTitle => 'సీక్వెన్స్ స్టాక్';

  @override
  String get sequenceStackSubtitle =>
      'ప్లేట్ స్టాక్ జోడింపులు మరియు తొలగింపులను క్రమంలో పునర్నిర్మించండి.';

  @override
  String get semanticCategoryRecallTitle => 'వర్గం రీకాల్';

  @override
  String get semanticCategoryRecallSubtitle =>
      'అభ్యర్థించిన వర్గ లక్ష్యాలకు సరిపోలే అధ్యయన పదాలను గుర్తించండి.';

  @override
  String get gridDisplacementTitle => 'గ్రిడ్ స్థానభ్రంశం';

  @override
  String get gridDisplacementSubtitle =>
      'లేఅవుట్‌ని ఒరిజినల్‌తో పోల్చడం ద్వారా మార్చబడిన చిహ్నాలను గుర్తించండి.';

  @override
  String get soundSequenceMatchTitle => 'సౌండ్ సీక్వెన్స్ మ్యాచ్';

  @override
  String get soundSequenceMatchSubtitle =>
      'వర్చువల్ కీబోర్డ్‌లో ప్లే చేయబడిన రిపీట్ నోట్ సీక్వెన్స్‌లు.';

  @override
  String get cardCountingMemoryTitle => 'కార్డ్ కౌంటర్';

  @override
  String get cardCountingMemorySubtitle =>
      'నిరంతర కార్డ్ డీల్ పరుగులలో ఇప్పటికే డీల్ చేయబడిన కార్డ్‌లను గుర్తించండి.';

  @override
  String get directionsRecallTitle => 'దిశలు రీకాల్';

  @override
  String get directionsRecallSubtitle =>
      'మెమరీ నుండి మార్గ దిశలకు సరిపోలే గ్రిడ్ మ్యాప్‌లను నావిగేట్ చేయండి.';

  @override
  String get eventTimelineMemoryTitle => 'ఈవెంట్ టైమ్‌లైన్';

  @override
  String get eventTimelineMemorySubtitle =>
      'చారిత్రక/కల్పిత ఈవెంట్ కార్డ్‌లను కాలక్రమానుసారంగా అమర్చండి.';

  @override
  String get featureMatrixRecallTitle => 'ఫీచర్ మ్యాట్రిక్స్';

  @override
  String get featureMatrixRecallSubtitle =>
      'సెల్ ఆకారం-రంగు లక్షణాల గురించి ప్రశ్నకు సమాధానం అడుగుతుంది.';

  @override
  String get delayedMatchSampleTitle => 'ఆలస్యమైన మ్యాచ్';

  @override
  String get delayedMatchSampleSubtitle =>
      'గణిత అవాంతరాలను పరిష్కరించిన తర్వాత లక్ష్య చిహ్నాన్ని సరిపోల్చండి.';

  @override
  String get symbolDigitAssocTitle => 'సింబల్-డిజిట్ అసోక్';

  @override
  String get symbolDigitAssocSubtitle =>
      'అంకెల కీలకు సరిపోలే చిహ్న అనువాద షీట్‌లను పరిష్కరించండి.';

  @override
  String get dualTaskMemoryTitle => 'డ్యూయల్-టాస్క్ మెమరీ';

  @override
  String get dualTaskMemorySubtitle =>
      'త్వరిత అంకగణిత పనులను పరిష్కరిస్తున్నప్పుడు వర్డ్ సెట్‌లను గుర్తుంచుకోండి.';

  @override
  String get actionSequenceRecallTitle => 'యాక్షన్ రీకాల్';

  @override
  String get actionSequenceRecallSubtitle =>
      'అక్షర సంజ్ఞ యానిమేషన్ సన్నివేశాలను క్రమంలో పునరావృతం చేయండి.';

  @override
  String get tangramPolygonTitle => 'టాంగ్రామ్ ఫిట్';

  @override
  String get tangramPolygonSubtitle =>
      'సిల్హౌట్ అవుట్‌లైన్‌లను పూరించడానికి బహుభుజి ఆకారాలను అమర్చండి.';

  @override
  String get mazeNav3DTitle => '3D మేజ్ నవ్';

  @override
  String get mazeNav3DSubtitle =>
      'మొదటి వ్యక్తి వీక్షణ నుండి 3D ఐసోమెట్రిక్ చిట్టడవి మార్గాలను నావిగేట్ చేయండి.';

  @override
  String get isometricProjectionTitle => 'ఐసోమెట్రిక్ ప్రొజెక్టర్';

  @override
  String get isometricProjectionSubtitle =>
      '3D బ్లాక్ ఫిగర్‌లను ఆర్థోగ్రాఫిక్ 2D టాప్/ఫ్రంట్ వీక్షణలకు సరిపోల్చండి.';

  @override
  String get polyominoPackingTitle => 'పాలియోమినో ప్యాకింగ్';

  @override
  String get polyominoPackingSubtitle =>
      'యాదృచ్ఛిక పాలియోమినో బ్లాక్ ముక్కలను లక్ష్య ప్రాంతాలలో ప్యాక్ చేయండి.';

  @override
  String get spatialGridRotationTitle => 'ప్రాదేశిక గ్రిడ్ రొటేషన్';

  @override
  String get spatialGridRotationSubtitle =>
      'యాక్సిస్ కోఆర్డినేట్‌ల వెంట తిప్పబడిన 3D బ్లాక్ ఏర్పాట్‌లను సరిపోల్చండి.';

  @override
  String get wireLoopGameTitle => 'వైర్ లూప్';

  @override
  String get wireLoopGameSubtitle =>
      'పరిచయం లేకుండా వైర్ స్ప్లైన్ల వెంట మెటల్ రింగులను లాగండి.';

  @override
  String get origamiUnfoldTitle => 'ఒరిగామి విప్పు';

  @override
  String get origamiUnfoldSubtitle =>
      'మడతపెట్టిన షీట్లను విప్పిన తర్వాత రంధ్రం పంచ్ నమూనాలను గుర్తించండి.';

  @override
  String get ropeTangleSolverTitle => 'రోప్ అన్టాంగ్లర్';

  @override
  String get ropeTangleSolverSubtitle =>
      'జీరో లైన్ క్రాస్‌లతో ప్లానర్ గ్రాఫ్‌లను లేఅవుట్ చేయడానికి నోడ్‌లను లాగండి.';

  @override
  String get gridFitTetrisTitle => 'గ్రిడ్ ఫిట్ సాల్వర్';

  @override
  String get gridFitTetrisSubtitle =>
      'కంటైనర్ సరిహద్దులకు సరిపోయేలా స్థిరమైన క్రమరహిత బ్లాక్‌లను అమర్చండి.';

  @override
  String get vectorGridAlignmentTitle => 'వెక్టర్ అమరిక';

  @override
  String get vectorGridAlignmentSubtitle =>
      'షాడో టెంప్లేట్ లక్ష్యాలను సరిపోల్చడానికి ఆకారాలను స్కేల్ చేయండి మరియు తిప్పండి.';

  @override
  String get blockStackingPhysicsTitle => 'బ్లాక్ స్టాకింగ్';

  @override
  String get blockStackingPhysicsSubtitle =>
      'గురుత్వాకర్షణ బరువును సమతుల్యం చేసే క్రమరహిత బ్లాక్ ప్యానెల్‌లను పేర్చండి.';

  @override
  String get crossSectionMatch3DTitle => '3D క్రాస్ సెక్షన్';

  @override
  String get crossSectionMatch3DSubtitle =>
      '3D ఆకారాల నుండి కత్తిరించిన 2D స్లైస్ జ్యామితిని గుర్తించండి.';

  @override
  String get symmetryPaintTitle => 'సిమెట్రీ పెయింట్';

  @override
  String get symmetryPaintSubtitle =>
      'సమరూప అక్షాలలో ప్రతిబింబించే అద్దం చిత్ర విభాగాలను గీయండి.';

  @override
  String get rollingBlockBloxTitle => 'రోలింగ్ బ్లాక్';

  @override
  String get rollingBlockBloxSubtitle =>
      'టార్గెట్ స్లాట్‌లలో నిలువుగా ల్యాండ్ చేయడానికి బ్లాక్ ముక్కలను రోల్ చేయండి.';

  @override
  String get perspectiveShiftViewTitle => 'పెర్స్పెక్టివ్ షిఫ్ట్';

  @override
  String get perspectiveShiftViewSubtitle =>
      'బ్లాక్ క్లస్టర్‌లు అక్షరాలు/పదాలు చెప్పే వరకు వాటిని తిప్పండి.';

  @override
  String get networkFlowSphericalTitle => 'నెట్‌వర్క్ ఫ్లో';

  @override
  String get networkFlowSphericalSubtitle =>
      'స్థూపాకార కోఆర్డినేట్‌లను చుట్టడంపై గ్రిడ్ ప్రవాహాలను కనెక్ట్ చేయండి.';

  @override
  String get layeredSilhouetteBlendTitle => 'సిల్హౌట్ బ్లెండ్';

  @override
  String get layeredSilhouetteBlendSubtitle =>
      'లక్ష్య అపారదర్శక ఆకృతులను సరిపోల్చడానికి రంగు పొరలను పేర్చండి.';

  @override
  String get wordWheelPangramTitle => 'పద అనగ్రామ్స్';

  @override
  String get wordWheelPangramSubtitle =>
      'చక్రాల నుండి కేంద్ర లక్ష్య అక్షరాలను కలిగి ఉన్న పదాలను రూపొందించండి.';

  @override
  String get letterGridSwapperTitle => 'లేఖ మార్పిడి';

  @override
  String get letterGridSwapperSubtitle =>
      'అడ్డు వరుస మరియు కోల్ పదాలను పూర్తి చేయడానికి ప్రక్కనే ఉన్న అక్షరాల టైల్స్‌ను మార్చుకోండి.';

  @override
  String get synonymMatchTitle => 'పర్యాయపదం మ్యాచ్';

  @override
  String get synonymMatchSubtitle =>
      'పడిపోతున్న పద లక్ష్యాలను పర్యాయపదాలు లేదా వ్యతిరేక పదాలతో సరిపోల్చండి.';

  @override
  String get vowelDropTitle => 'అచ్చు డ్రాప్';

  @override
  String get vowelDropSubtitle =>
      'పదాలను పూర్తి చేసే కోఆర్డినేట్ గ్రిడ్‌లలోకి అచ్చులను వదలండి.';

  @override
  String get letterBalanceScaleTitle => 'వర్డ్ బ్యాలెన్స్ స్కేల్';

  @override
  String get letterBalanceScaleSubtitle =>
      'అక్షరాల విలువలు బ్యాలెన్స్ బరువులను కలిగి ఉన్న పదాలను స్పెల్ చేయండి.';

  @override
  String get wordChainShiritoriTitle => 'పద గొలుసు';

  @override
  String get wordChainShiritoriSubtitle =>
      'మునుపటి అక్షరాల అవుట్‌పుట్‌లతో ప్రారంభమయ్యే లింక్ వర్డ్ లూప్‌లు.';

  @override
  String get affixBuilderTitle => 'అఫిక్స్ బిల్డర్';

  @override
  String get affixBuilderSubtitle =>
      'లక్ష్య పదజాలాన్ని రూపొందించడానికి ఉపసర్గలు/ప్రత్యయాలను కలపండి.';

  @override
  String get decipherCrypticCluesTitle => 'క్రిప్టిక్ డెసిఫర్';

  @override
  String get decipherCrypticCluesSubtitle =>
      'వర్డ్-ప్లే పజిల్‌లను పరిష్కరించండి మరియు స్పెల్లింగ్ చిక్కులను డీక్రిప్ట్ చేయండి.';

  @override
  String get boggleWordSearchTitle => 'Boggle కనెక్ట్';

  @override
  String get boggleWordSearchSubtitle =>
      'దాచిన పదాలను కనుగొనడానికి ప్రక్కనే కనెక్ట్ చేయబడిన మార్గాలను కనుగొనండి.';

  @override
  String get idiomUnscrambleTitle => 'ఇడియమ్ అన్‌స్క్రాంబుల్';

  @override
  String get idiomUnscrambleSubtitle =>
      'ఇడియమ్ అర్థాలను సరిపోల్చడానికి గిలకొట్టిన పద శ్రేణులను అమర్చండి.';

  @override
  String get letterPyramidsTitle => 'లెటర్ పిరమిడ్లు';

  @override
  String get letterPyramidsSubtitle =>
      'ఒక్కో శ్రేణికి ఒకే అనగ్రామ్ అక్షరాలను జోడించి వర్డ్ టవర్‌లను రూపొందించండి.';

  @override
  String get soundAlikeHomophonesTitle => 'హోమోఫోన్ మ్యాచ్‌లు';

  @override
  String get soundAlikeHomophonesSubtitle =>
      'వాక్యాల కోసం సరైన హోమోఫోన్ స్పెల్లింగ్‌లను గుర్తించండి.';

  @override
  String get wordGridSudokuTitle => 'పదం సుడోకు';

  @override
  String get wordGridSudokuSubtitle =>
      'పదాలను ఏర్పరుచుకునే గ్రిడ్ వరుసలలో టెస్సెలేట్ అక్షరాలు.';

  @override
  String get portmanteauFactoryTitle => 'పోర్ట్‌మాంటౌ ఫ్యాక్టరీ';

  @override
  String get portmanteauFactorySubtitle =>
      'సమ్మేళన పదాలను సృష్టించే అర్థ భాగాలను విలీనం చేయండి.';

  @override
  String get codedCrosswordsCodeTitle => 'కోడ్‌వర్డ్‌లు క్రాస్‌వర్డ్';

  @override
  String get codedCrosswordsCodeSubtitle =>
      'నంబర్-టు-లెటర్ కోడ్‌లకు సరిపోలే గ్రిడ్ క్రాస్‌వర్డ్‌లను పరిష్కరించండి.';

  @override
  String get wordSnakeTrailTitle => 'పద పాము';

  @override
  String get wordSnakeTrailSubtitle =>
      'ఇతివృత్త పదాల స్పెల్లింగ్ పాము లాంటి అక్షర ట్రయల్స్‌ను కనుగొనండి.';

  @override
  String get typingRhythmSpeedTitle => 'టైపింగ్ ఫ్లో';

  @override
  String get typingRhythmSpeedSubtitle =>
      'మెట్రోనోమ్ రిథమ్ బీట్‌లకు సరిపోలే పదజాలాలను టైప్ చేయండి.';

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
  String get hideGame => 'దాచు';

  @override
  String get unhideGame => 'దాచవద్దు';

  @override
  String get favoriteGame => 'ఇష్టమైనది';

  @override
  String get unfavoriteGame => 'ఇష్టమైన వాటి నుండి తీసివేయి';

  @override
  String get hiddenGames => 'దాచిన ఆటలు';

  @override
  String showHiddenGames(int count) {
    return 'దాచిన ఆటలను చూపించు ($count)';
  }

  @override
  String get noHiddenGames => 'దాచిన ఆటలు లేవు';

  @override
  String get gameHidden => 'ఆట దాచబడింది';

  @override
  String get undo => 'రద్దు చేయి';

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
  String get btnMatchColor => 'రంగును సరిపోల్చండి';

  @override
  String get btnMatchWord => 'పదాన్ని సరిపోల్చండి';

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
