// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'ألعاب الألغاز';

  @override
  String get home => 'الرئيسية';

  @override
  String get settings => 'الإعدادات';

  @override
  String get playAgain => 'العب ثانية';

  @override
  String get playNext => 'العب التالي';

  @override
  String get seeCompleted => 'مراجعة اللغز';

  @override
  String get finish => 'إنهاء';

  @override
  String get congrats => 'تهانينا';

  @override
  String get perfectGradient => 'تدرج مثالي!';

  @override
  String get wellDone => 'أحسنت';

  @override
  String get timeUp => 'انتهى الوقت!';

  @override
  String get victory => 'النصر!';

  @override
  String get gameWin => 'أحسنت!';

  @override
  String get completed => 'اكتمل!';

  @override
  String get score => 'النتيجة';

  @override
  String get timeLeft => 'الوقت';

  @override
  String get trials => 'المحاولات';

  @override
  String get numberRule => 'قاعدة الأرقام';

  @override
  String get colorRule => 'قاعدة الألوان';

  @override
  String get valid => 'صحيح';

  @override
  String get invalid => 'غير صحيح';

  @override
  String get even => 'زوجي';

  @override
  String get odd => 'فردي';

  @override
  String get red => 'أحمر';

  @override
  String get green => 'أخضر';

  @override
  String get blue => 'أزرق';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';

  @override
  String get trueLabel => 'صواب';

  @override
  String get falseLabel => 'خطأ';

  @override
  String get clear => 'مسح';

  @override
  String get north => 'شمال';

  @override
  String get south => 'جنوب';

  @override
  String get east => 'شرق';

  @override
  String get west => 'غرب';

  @override
  String get target => 'الهدف';

  @override
  String get moves => 'الحركات';

  @override
  String get trialMode => 'وضع التجربة';

  @override
  String get trialModeDescription =>
      'حل 20 لغزاً للإنهاء بدلاً من مؤقت الـ 60 ثانية';

  @override
  String get appearance => 'المظهر';

  @override
  String get language => 'اللغة';

  @override
  String get gameplay => 'أسلوب اللعب';

  @override
  String get supportUs => 'ادعمنا';

  @override
  String get systemLegal => 'النظام والقانون';

  @override
  String get games => 'الألعاب';

  @override
  String get solvedToday => 'تم حلها اليوم';

  @override
  String get searchGames => 'ابحث عن الألعاب...';

  @override
  String get readyToStart => 'هل أنت مستعد لبدء تمرين عقلك؟';

  @override
  String get greatStart => 'بداية رائعة! استمر في التقدم.';

  @override
  String get onFire => 'مذهل! عقلك يستمتع بهذا.';

  @override
  String get incredible => 'رائع! أنت بارع في الألغاز.';

  @override
  String get noGamesMatch => 'لا توجد ألعاب تطابق بحثك';

  @override
  String get categoryAll => 'الكل';

  @override
  String get categoryAttention => 'الانتباه';

  @override
  String get categoryLogic => 'المنطق';

  @override
  String get categoryMath => 'الرياضيات';

  @override
  String get categoryWord => 'الكلمات';

  @override
  String get categoryMemory => 'الذاكرة';

  @override
  String get categorySpatial => 'المكانية';

  @override
  String get themeLight => 'فاتح';

  @override
  String get themeDark => 'داكن';

  @override
  String get themeSystem => 'النظام';

  @override
  String get starOnGithub => 'نجمة على GitHub';

  @override
  String get sponsorOnGithub => 'رعاية على GitHub';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get termsOfService => 'شروط الخدمة';

  @override
  String get licenses => 'التراخيص';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return 'لديك $maxTries محاولات للعثور على الكلمة المخفية المكونة من $wordLength أحرف.';
  }

  @override
  String wordFoundMessage(String word) {
    return 'تم العثور على الكلمة بنجاح: $word';
  }

  @override
  String gameOverMessage(String word) {
    return 'الكلمة كانت: $word';
  }

  @override
  String get gameOver => 'انتهت اللعبة';

  @override
  String get crosswordTitle => 'كلمات متقاطعة';

  @override
  String get crosswordSubtitle =>
      'أكمل الشبكة بالكلمات الصحيحة بناءً على التلميحات المقدمة.';

  @override
  String get wordSearchTitle => 'البحث عن الكلمات';

  @override
  String get radicalRootsTitle => 'الجذور الراديكالية';

  @override
  String get radicalRootsSubtitle =>
      'أوجد الجذر التربيعي أو التكعيبي للرقم المعطى. قرب إلى أقرب عدد صحيح إذا لزم الأمر.';

  @override
  String get radicalRootsGoalReached => 'تم الوصول إلى الهدف!';

  @override
  String get radicalRootsTimeUp => 'انتهى الوقت!';

  @override
  String radicalRootsScoreMessage(int score) {
    return 'لقد قمت بحساب $score من الجذور بشكل صحيح!';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return 'استمر في التدريب! لقد حسبت $score من الجذور.';
  }

  @override
  String get radicalRootsStart => 'ابدأ الحساب';

  @override
  String get radicalRootsDescription => 'لديك 60 ثانية لحل أكبر عدد ممكن.';

  @override
  String get radicalRootsBest => 'الأفضل';

  @override
  String get radicalRootsSeconds => '60 ثانية';

  @override
  String get romanArithmeticTitle => 'الحساب الروماني';

  @override
  String get romanArithmeticSubtitle =>
      'حل مسائل الجمع والطرح باستخدام الأرقام الرومانية.';

  @override
  String get romanArithmeticGoalReached => 'مستوى القائد الروماني!';

  @override
  String get romanArithmeticTimeUp => 'انتهى الوقت!';

  @override
  String romanArithmeticScoreMessage(int score) {
    return 'لقد حللت $score من المسائل الرومانية!';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return 'أتيت، رأيت، انتصرت! لقد حللت $score من المسائل.';
  }

  @override
  String get romanArithmeticStart => 'ابدأ المهمة';

  @override
  String get romanArithmeticDescription => 'حول وحل. لديك 60 ثانية.';

  @override
  String get romanArithmeticBest => 'الأفضل';

  @override
  String get romanArithmeticSeconds => '60 ثانية';

  @override
  String get wordSearchSubtitle =>
      'ابحث عن جميع الكلمات المخفية في الشبكة. اسحب للاختيار.';

  @override
  String get missingVowelsTitle => 'حروف العلة المفقودة';

  @override
  String get missingVowelsSubtitle =>
      'حدد الكلمة مع إخفاء حروف العلة الخاصة بها.';

  @override
  String get missingVowelsWin => 'تم استعادة حروف العلة!';

  @override
  String get missingVowelsHowToPlay =>
      'تظهر كلمة مع إخفاء حروف العلة الخاصة بها (A, E, I, O, U) تخمن الكلمة الكاملة!';

  @override
  String get wordScrambleTitle => 'بعثرة الكلمات';

  @override
  String get wordScrambleSubtitle =>
      'اضغط على الحروف لفك بعثرة الكلمة المخفية!';

  @override
  String get wordScrambleWin => 'تم فك رموز الكلمة!';

  @override
  String get sudokuTitle => 'سودوكو';

  @override
  String get sudokuSubtitle =>
      'أكمل الشبكة بحيث يحتوي كل صف وعمود ومربع 3x3 على جميع الأرقام من 1 إلى 9.';

  @override
  String get minesweeperTitle => 'كنس الألغام';

  @override
  String get minesweeperSubtitle => 'حدد جميع الألغام دون تفجيرها.';

  @override
  String get minesweeperWin => 'النصر!';

  @override
  String get minesweeperMines => 'ألغام';

  @override
  String get minesweeperStatus => 'الحالة';

  @override
  String get minesweeperWon => 'فوز';

  @override
  String get minesweeperBoom => 'انفجار';

  @override
  String get minesweeperPlaying => 'جاري اللعب';

  @override
  String get minesweeperReveal => 'كشف';

  @override
  String get minesweeperFlag => 'علم';

  @override
  String get game2048Title => '2048';

  @override
  String get game2048Subtitle =>
      'اسحب في أي اتجاه لدمج المربعات والوصول إلى المربع 2048!';

  @override
  String get nonogramTitle => 'نونوجرام';

  @override
  String get nonogramSubtitle => 'اكشف الصورة المخفية باستخدام أدلة المنطق.';

  @override
  String get nonogramWin => 'تم كشف الصورة!';

  @override
  String get magnetsTitle => 'مغناطيسات';

  @override
  String get magnetsSubtitle =>
      'ضع المغناطيسات في الشبكة بناءً على عدد الأقطاب.';

  @override
  String get magnetsHowToPlay =>
      'املأ الحاويات بحجم الدومينو بمغناطيسات \'+\' و \'-\' أو اتركها فارغة. تحدد أدلة الصفوف والأعمدة العدد الإجمالي لكل قطب في ذلك الخط. لا يمكن أن تكون الأقطاب المتماثلة متجاورة بشكل متعامد.';

  @override
  String get magnetsWinTitle => 'توازن القطبية!';

  @override
  String get magnetsWinMessage => 'تم ترتيب جميع المغناطيسات بشكل مثالي!';

  @override
  String get lighthousesTitle => 'منارات';

  @override
  String get lighthousesSubtitle => 'ضع السفن بناءً على أدلة المنارات.';

  @override
  String get lighthousesHowToPlay =>
      'ضع سفنًا بحجم 1x1 في الشبكة. تشير المنارات إلى العدد الإجمالي للسفن المرئية أفقيًا ورأسيًا. لا يمكن للسفن أن تلمس المنارات أو بعضها البعض، حتى قطريًا.';

  @override
  String get lighthousesWinTitle => 'البحر آمن!';

  @override
  String get lighthousesWinMessage => 'جميع المنارات توجه السفن بشكل مثالي!';

  @override
  String get dominosaTitle => 'دومينوسا';

  @override
  String get dominosaSubtitle => 'ابحث عن جميع قطع الدومينو المخفية في الشبكة.';

  @override
  String get dominosaHowToPlay =>
      'رتب مجموعة كاملة من قطع الدومينو على شبكة من الأرقام بحيث يتم تغطية كل زوج من الأرقام المتجاورة بقطعة دومينو واحدة بالضبط. يوجد كل زوج من الأرقام مرة واحدة فقط في المجموعة.';

  @override
  String get dominosaWinTitle => 'سيد الدومينو!';

  @override
  String get dominosaWinMessage => 'تم العثور على كل قطعة دومينو ووضعها!';

  @override
  String get skyscrapersTitle => 'ناطحات سحاب';

  @override
  String get skyscrapersSubtitle => 'املأ الشبكة بارتفاعات المباني.';

  @override
  String get skyscrapersHowToPlay =>
      'املأ الشبكة بارتفاعات (1-N) بحيث يحتوي كل صف وعمود على كل ارتفاع مرة واحدة بالضبط. تشير الأدلة الموجودة على الحواف إلى عدد المباني المرئية من ذلك الاتجاه، حيث تحجب المباني الأطول المباني الأقصر.';

  @override
  String get skyscrapersWinTitle => 'استعادة الأفق!';

  @override
  String get skyscrapersWinMessage => 'جميع المباني في وضع مثالي!';

  @override
  String get nurikabeTitle => 'نوريكابي';

  @override
  String get nurikabeSubtitle => 'شكل بحرًا متصلاً وجزرًا منفصلة.';

  @override
  String get nurikabeHowToPlay =>
      'ظلل الخلايا لتشكيل \"بحر\" واحد متصل (لا توجد كتل 2x2). تشكل الخلايا غير المظللة \"جزرًا\"، تحتوي كل منها على رقم واحد بالضبط يمثل مساحتها الإجمالية.';

  @override
  String get nurikabeWinTitle => 'البحر يتدفق!';

  @override
  String get nurikabeWinMessage => 'الجزر منفصلة، البحر متصل!';

  @override
  String get fillominoTitle => 'فيلومينو';

  @override
  String get fillominoSubtitle => 'قسم الشبكة إلى بوليومينو بالأحجام المحددة.';

  @override
  String get fillominoHowToPlay =>
      'قسم الشبكة إلى بوليومينو بحيث يحتوي كل بوليومينو من الحجم N على الرقم N في جميع خلاياه. لا يمكن أن تكون بوليومينو من نفس الحجم متجاورة بشكل متعامد.';

  @override
  String get fillominoWinTitle => 'تم تقسيم الشبكة!';

  @override
  String get fillominoWinMessage => 'تم التبليط بشكل مثالي بالمنطق!';

  @override
  String get hitoriTitle => 'هيتوري';

  @override
  String get hitoriSubtitle => 'ظلل الأرقام المكررة في كل صف وعمود.';

  @override
  String get hitoriHowToPlay =>
      'ظلل الخلايا بحيث لا يظهر أي رقم أكثر من مرة في أي صف أو عمود. لا يمكن أن تكون الخلايا المظللة متجاورة (متعامدة)، ويجب أن تشكل جميع الخلايا غير المظللة مجموعة واحدة متصلة.';

  @override
  String get hitoriWinTitle => 'سيد هيتوري!';

  @override
  String get hitoriWinMessage => 'لقد نجحت في حل جميع التكرارات!';

  @override
  String get pathFinderTitle => 'مكتشف المسار';

  @override
  String get pathFinderSubtitle => 'ابحث عن المسار المخفي من S إلى E.';

  @override
  String get pathFinderWin => 'تم إتقان المسار!';

  @override
  String get howToPlay => 'كيفية اللعب';

  @override
  String get gotIt => 'فهمت';

  @override
  String get akariTitle => 'أكاري';

  @override
  String get akariSubtitle => 'أضئ جميع الخلايا البيضاء';

  @override
  String get akariHowToPlay =>
      'ضع المصابيح في الخلايا البيضاء لإضاءة الشبكة بالكامل. تضيء المصابيح صفها وعمودها حتى تصطدم بجدار. لا يمكن لمصباحين أن يضيئا على بعضهما البعض. توضح الجدران المرقمة عدد المصابيح التي يجب وضعها في الخلايا المجاورة.';

  @override
  String get akariWinTitle => 'تمت الإضاءة!';

  @override
  String get akariWinMessage => 'كل شيء مضاء بشكل مثالي.';

  @override
  String get arithmeticChainTitle => 'سلسلة الحساب';

  @override
  String get arithmeticChainSubtitle => 'احسب المجموع الجاري في رأسك';

  @override
  String get arithmeticChainWinTitle => 'ارتقاء في المستوى!';

  @override
  String get arithmeticChainWinMessage => 'حساباتك الذهنية حادة!';

  @override
  String get arithmeticChainLoseTitle => 'حاول ثانية';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return 'الإجابة الصحيحة كانت $answer.';
  }

  @override
  String get arithmeticChainStart => 'ابدأ';

  @override
  String get arithmeticChainNext => 'التالي';

  @override
  String get attentionalBlinkTitle => 'ومضة الانتباه';

  @override
  String get attentionalBlinkSubtitleWatch => 'راقب الأرقام';

  @override
  String get attentionalBlinkSubtitleInput => 'أدخل الرقمين اللذين رأيتهما';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return 'لقد سجلت $score من الأهداف!';
  }

  @override
  String get balanceScaleTitle => 'ميزان ذو كفتين';

  @override
  String get balanceScaleSubtitle =>
      'استنتج وزن العنصر الأخير بناءً على الموازين.';

  @override
  String get balanceScaleWinTitle => 'متوازن!';

  @override
  String get balanceScaleWinMessage => 'لقد استنتجت الوزن بشكل صحيح!';

  @override
  String get balanceScaleLoseTitle => 'غير متوازن';

  @override
  String get balanceScaleLoseMessage =>
      'حاول مرة أخرى للعثور على التوازن الصحيح.';

  @override
  String get balanceScaleBack => 'رجوع';

  @override
  String get balanceScaleSubmit => 'إرسال';

  @override
  String get binaryPuzzleTitle => 'لغز ثنائي';

  @override
  String get binaryPuzzleSubtitle =>
      'املأ بـ 0 و 1. لا يتجاور أكثر من رقمين متماثلين. أرقام 0 و 1 متساوية في كل صف وعمود.';

  @override
  String get binaryPuzzleWinTitle => 'أحسنت';

  @override
  String get binaryPuzzleWinMessage => 'لقد حللت اللغز الثنائي بمنطق مثالي!';

  @override
  String get blockEscapeTitle => 'هروب الكتلة';

  @override
  String get blockEscapeSubtitle =>
      'حرك الكتل لإخلاء مسار للكتلة الأساسية للوصول إلى المخرج.';

  @override
  String get blockEscapeWinTitle => 'هروب!';

  @override
  String get blockEscapeWinMessage =>
      'لقد نجحت في إخلاء المسار للكتلة الأساسية!';

  @override
  String get boxCompletionTitle => 'إكمال الصندوق';

  @override
  String get boxCompletionSubtitle => 'أي مكعب يمكن تشكيله؟';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return 'لقد سجلت $score إجابات صحيحة من أصل $totalTrials!';
  }

  @override
  String get boxCompletionOptions => 'الخيارات';

  @override
  String get bridgesTitle => 'الجسور';

  @override
  String get bridgesSubtitle =>
      'صل الجزر بالجسور. تحتاج كل جزيرة إلى عدد معين من الجسور. لا يمكن للجسور أن تتقاطع.';

  @override
  String get bridgesWinTitle => 'متصل!';

  @override
  String get bridgesWinMessage => 'لقد نجحت في توصيل جميع الجزر!';

  @override
  String get calculationSprintTitle => 'سباق الحساب';

  @override
  String get calculationSprintSubtitle =>
      'حل أكبر عدد ممكن من المعادلات في 60 ثانية.';

  @override
  String get calculationSprintGoalReached => 'تم الوصول للهدف!';

  @override
  String get calculationSprintTimeUp => 'انتهى الوقت';

  @override
  String calculationSprintScoreMessage(int score) {
    return 'سرعة حساب ممتازة! لقد سجلت $score نقطة.';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return 'لقد سجلت $score نقطة. حاول تحطيم رقمك القياسي!';
  }

  @override
  String get calculationSprintBest => 'الأفضل';

  @override
  String get calculationSprintSeconds => '60 ثانية';

  @override
  String get calculationSprintDescription =>
      'حل المعادلات بسرعة.\nالإجابات الخاطئة تخصم 3 ثوانٍ!';

  @override
  String get calculationSprintStart => 'ابدأ السباق';

  @override
  String get categoryFluencyTitle => 'طلاقة الفئات';

  @override
  String get categoryFluencySubtitle => 'أدخل عناصر تنتمي إلى الفئة';

  @override
  String get categoryFluencyExpert => 'خبير طلاقة!';

  @override
  String get categoryFluencyTimeUp => 'انتهى الوقت!';

  @override
  String get categoryFluencyWinMessage => 'لديك حصيلة لغوية واسعة!';

  @override
  String categoryFluencyFoundMessage(int count) {
    return 'لقد وجدت $count كلمات.';
  }

  @override
  String get categoryFluencyCategoryLabel => 'الفئة:';

  @override
  String get categoryFluencyEnterItem => 'أدخل عنصراً...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target كلمات';
  }

  @override
  String get changeBlindnessTitle => 'عمى التغيير';

  @override
  String get changeBlindnessSubtitle => 'اكتشف العنصر المتغير';

  @override
  String changeBlindnessScore(int score) {
    return 'النتيجة: $score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return 'لقد وجدت $score تغييرات!';
  }

  @override
  String get choiceRtTitle => 'زمن رد الفعل المختار';

  @override
  String get choiceRtSubtitle => 'اضغط على المربع النشط بأسرع ما يمكن';

  @override
  String choiceRtAvgMessage(String avg) {
    return 'متوسط زمن رد فعلك: $avg مللي ثانية';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return 'الوقت المتبقي: $time ثانية';
  }

  @override
  String choiceRtTaps(int count) {
    return 'الضغطات: $count';
  }

  @override
  String get colorFloodTitle => 'فيضان الألوان';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return 'الحركات: $moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => 'نجاح الفيضان!';

  @override
  String get colorFloodDryLand => 'أرض جافة...';

  @override
  String get colorFloodWinMessage => 'لقد ملأت الشبكة بالكامل بالألوان!';

  @override
  String get colorFloodLoseMessage => 'لقد نفدت حركاتك. حاول ثانية!';

  @override
  String get colorMatchTitle => 'تطابق الألوان';

  @override
  String get colorMatchSubtitle =>
      'اضبط المنزلقات لمطابقة اللون المستهدف قدر الإمكان.';

  @override
  String get colorMatchTarget => 'الهدف';

  @override
  String get colorMatchYours => 'لونك';

  @override
  String get colorMatchCheck => 'تحقق من التطابق';

  @override
  String get colorMatchResult => 'نتيجة التطابق';

  @override
  String colorMatchAccuracy(String accuracy) {
    return 'دقتك: $accuracy%';
  }

  @override
  String get corsiBlocksTitle => 'مكعبات كورسي';

  @override
  String get corsiBlocksSubtitle =>
      'راقب المربعات وهي تضيء واضغط عليها بنفس الترتيب.';

  @override
  String get corsiBlocksWinTitle => 'بارع في المكانية!';

  @override
  String get corsiBlocksLoseTitle => 'ضياع في المكان';

  @override
  String corsiBlocksMessage(int score, int span) {
    return 'لقد تذكرت $score تسلسلات! وصل نطاق ذاكرتك المكانية إلى $span.';
  }

  @override
  String get corsiBlocksWatch => 'راقب النمط';

  @override
  String get corsiBlocksRepeat => 'كرر النمط';

  @override
  String get corsiBlocksExcellent => 'ممتاز!';

  @override
  String get corsiBlocksSpan => 'النطاق';

  @override
  String get crownTitle => 'التاج';

  @override
  String get crownSubtitle =>
      'ضع تاجاً واحداً في كل صف وعمود ومنطقة لونية. لا يمكن أن تتجاور التيجان، حتى قطرياً.';

  @override
  String get crownCrowned => 'تم التتويج!';

  @override
  String get crownSuccess => 'تم وضع جميع التيجان بنجاح وبمنطق مثالي.';

  @override
  String get cryptogramTitle => 'كريبتوجرام';

  @override
  String get cryptogramSubtitle =>
      'قم بتعيين الحروف لفك شفرة الرسالة السرية! كل حرف مشفر يمثل حرفاً حقيقياً.';

  @override
  String get cryptogramBroken => 'تم كسر الشفرة!';

  @override
  String get cryptogramEncrypted => 'مشفر';

  @override
  String get cryptogramSuccess => 'لقد فككت شفرة الرسالة تماماً.';

  @override
  String get cryptogramTryAgain => 'حاول مرة أخرى لكسر التشفير.';

  @override
  String get digitSpanReverseTitle => 'نطاق الأرقام العكسي';

  @override
  String get digitSpanReverseSubtitleMemorize => 'احفظ الأرقام';

  @override
  String get digitSpanReverseSubtitleEnter => 'أدخل الأرقام بترتيب عكسي';

  @override
  String get digitSpanReverseWinTitle => 'ارتقاء في المستوى!';

  @override
  String get digitSpanReverseWinMessage => 'ذاكرتك العاملة مذهلة!';

  @override
  String get digitSpanReverseLoseTitle => 'حاول ثانية';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return 'التسلسل العكسي الصحيح كان $sequence.';
  }

  @override
  String get dividedAttentionTitle => 'الانتباه المنقسم';

  @override
  String get dividedAttentionSubtitle =>
      'اضغط يساراً للنجمة ⭐ | اضغط يميناً للأحمر 🔴';

  @override
  String get dividedAttentionGameOverTitle => 'تشتت التركيز';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return 'تعدد المهام صعب! كانت نتيجتك $score.';
  }

  @override
  String dividedAttentionScore(int score) {
    return 'النتيجة: $score';
  }

  @override
  String get doubleNBackTitle => 'Double N-Back';

  @override
  String doubleNBackSubtitle(int n) {
    return 'طابق المثيرات $n خطوات للوراء';
  }

  @override
  String get doubleNBackGameOverTitle => 'انتهت اللعبة';

  @override
  String doubleNBackGameOverMessage(int score) {
    return 'لقد سجلت $score نقطة في Double N-Back!';
  }

  @override
  String doubleNBackScore(int score) {
    return 'النتيجة: $score';
  }

  @override
  String get doubleNBackPositionMatch => 'تطابق الموقع';

  @override
  String get doubleNBackLetterMatch => 'تطابق الحرف';

  @override
  String get faceNameAssociationTitle => 'ربط الوجه بالاسم';

  @override
  String get faceNameAssociationSubtitleStudy => 'احفظ الاسم لكل وجه';

  @override
  String get faceNameAssociationSubtitleTest => 'من هذا؟';

  @override
  String get faceNameAssociationPerfect => 'مثالي!';

  @override
  String get faceNameAssociationGameOver => 'انتهت اللعبة';

  @override
  String get faceNameAssociationWinMessage =>
      'لديك ذاكرة رائعة للوجوه والأسماء!';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return 'لقد أجبت بشكل صحيح على $correct من أصل $total.';
  }

  @override
  String get faceNameAssociationStartTest => 'ابدأ الاختبار';

  @override
  String get flankerTestWinTitle => 'تركيز ليزر!';

  @override
  String get flankerTestLoseTitle => 'مشتت الذهن';

  @override
  String flankerTestScoreMessage(int score) {
    return 'لقد أجبت بشكل صحيح $score مرة!';
  }

  @override
  String get flankerTestTitle => 'اختبار فلانكر';

  @override
  String get flankerTestSubtitle =>
      'أشر إلى اتجاه السهم المركزي، متجاهلاً الأسهم الجانبية.';

  @override
  String get flankerTestLeft => 'يسار';

  @override
  String get flankerTestRight => 'يمين';

  @override
  String get fractionMatchTitle => 'طابق الكسور';

  @override
  String get fractionMatchSubtitle => 'طابق الشكل المرئي بكسره';

  @override
  String get fractionMatchLoseTitle => 'عدم تطابق الكسر';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return 'الإجابة الصحيحة كانت $correctAnswer.';
  }

  @override
  String get goNoGoTitle => 'Go / No-Go';

  @override
  String get goNoGoSubtitle => 'اضغط للأخضر، تجاهل الأحمر!';

  @override
  String get goNoGoLoseTitle => 'توقف رد الفعل';

  @override
  String get goNoGoLoseMessage => 'يتم اختبار قدرتك على التحكم في الانفعالات!';

  @override
  String get goNoGoTapAnywhere => 'اضغط في أي مكان للبدء';

  @override
  String get groceryListTitle => 'قائمة البقالة';

  @override
  String get groceryListSubtitleMemorize => 'احفظ العناصر وفئاتها';

  @override
  String get groceryListSubtitleTest => 'إلى أي فئة ينتمي هذا العنصر؟';

  @override
  String get groceryListWinTitle => 'خبير البقالة!';

  @override
  String get groceryListLoseTitle => 'هل نسيت شيئاً؟';

  @override
  String groceryListScoreMessage(int score) {
    return 'لقد سجلت $score نقطة في قائمة البقالة!';
  }

  @override
  String get groceryListReady => 'أنا مستعد';

  @override
  String get groceryListWhereBelong => 'أين ينتمي هذا؟';

  @override
  String get hueSortTitle => 'فرز الألوان';

  @override
  String get hueSortSubtitle =>
      'قم بتبديل المربعات لإنشاء انتقال سلس بين ألوان الزوايا. تشير النقاط إلى المربعات الثابتة.';

  @override
  String get hueSortWinTitle => 'تدرج مثالي!';

  @override
  String get hueSortWinMessage => 'لقد فرزت طيف الألوان بشكل مثالي!';

  @override
  String hueSortWrongTiles(int count) {
    return 'المربعات في المكان الخطأ: $count';
  }

  @override
  String get kenkenTitle => 'كين كين';

  @override
  String get kenkenWinTitle => 'عبقري!';

  @override
  String get kenkenLoseTitle => 'انتهت اللعبة';

  @override
  String get kenkenWinMessage => 'لقد حللت لغز كين كين!';

  @override
  String get kenkenLoseMessage => 'تحقق من قواعد الصفوف/الأعمدة والقفص.';

  @override
  String kenkenSubtitle(int size) {
    return 'املأ من 1 إلى $size دون تكرار في الصفوف/الأعمدة';
  }

  @override
  String get letterCancellationTitle => 'إلغاء الحروف';

  @override
  String get letterCancellationTitleFull => 'إلغاء الحروف';

  @override
  String letterCancellationScoreMessage(int score) {
    return 'لقد وجدت $score حرفاً!';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return 'ابحث عن كل الحروف \"$target\"';
  }

  @override
  String get letterCancellationFound => 'تم العثور';

  @override
  String get letterCancellationTime => 'الوقت';

  @override
  String get lightsOutTitle => 'إطفاء الأنوار';

  @override
  String get lightsOutSubtitle =>
      'الضغط على مربع يبدله هو وجيرانه المجاورين. أطفئ كل الأنوار للحل.';

  @override
  String get lightsOutWinTitle => 'تم حل اللغز!';

  @override
  String get lightsOutWinMessage => 'لقد نجحت في إطفاء جميع الأنوار!';

  @override
  String get symmetryTitle => 'التماثل';

  @override
  String get symmetrySubtitle =>
      'اعكس النمط الموجود على اليسار على الشبكة الفارغة على اليمين.';

  @override
  String get semanticLinkTitle => 'الارتباط الدلالي';

  @override
  String get semanticLinkSubtitle => 'ابحث عن الكلمة التي تربط الثلاثة جميعاً';

  @override
  String get reflexTapTitle => 'الضغط السريع';

  @override
  String get visualStatisticalLearningTitle => 'التعلم الإحصائي البصري';

  @override
  String get orbitTapTitle => 'ضغط المدار';

  @override
  String get orbitTapSubtitle => 'اضغط عندما تتماشى الكرات مع البوابة';

  @override
  String get orbitTapTapToHit => 'انقر عندما تدخل الكرة البوابة';

  @override
  String get schulteTableTitle => 'جدول شولت';

  @override
  String get multipleObjectTrackingTitle => 'تتبع الأشياء';

  @override
  String get multipleObjectTrackingSubtitle =>
      'راقب الأشياء المحددة. تتبعها أثناء تحركها، ثم اخترها.';

  @override
  String get sdmtTitle => 'اختبار Sdmt';

  @override
  String get sdmtSubtitle =>
      'استخدم المفتاح أعلاه للعثور على الرقم للرمز المعروض.';

  @override
  String get memoryMatrixTitle => 'مصفوفة الذاكرة';

  @override
  String get memoryMatrixSubtitle => 'احفظ النمط واضغط على المربعات.';

  @override
  String get mentalAbacusTitle => 'المعداد الذهني';

  @override
  String get mentalAbacusSubtitle => 'حل باستخدام السوروبان';

  @override
  String get spellingSprintTitle => 'سباق التهجئة';

  @override
  String get spellingSprintSubtitle =>
      'سابق الزمن لتهجئة أكبر عدد ممكن من الكلمات.';

  @override
  String get stopSignalTitle => 'إشارة التوقف';

  @override
  String get stopSignalSubtitle =>
      'اضغط على اتجاه السهم، لكن توقف فوراً إذا تحول السهم للأحمر.';

  @override
  String get staircaseMemoryTitle => 'ذاكرة السلم';

  @override
  String get vigilanceTaskTitle => 'مهمة اليقظة';

  @override
  String get vigilanceTaskSubtitle => 'اضغط على الزر عندما يتخطى العقرب موضعاً';

  @override
  String get logicalSyllogismsTitle => 'القياس المنطقي';

  @override
  String get logicalSyllogismsSubtitle => 'هل الاستنتاج صالح منطقياً؟';

  @override
  String get mathPathTitle => 'مسار الرياضيات';

  @override
  String get mathPathSubtitle =>
      'ابحث عن مسار يصل مجموعه بالضبط إلى المجموع المستهدف.';

  @override
  String get sternbergTaskTitle => 'مهمة ستيرنبرغ';

  @override
  String get sternbergTaskMemorize => 'احفظ الحروف';

  @override
  String get sternbergTaskWasLetterSet => 'هل كان هذا الحرف في المجموعة؟';

  @override
  String sternbergTaskScore(int score) {
    return 'لقد سجلت $score نقطة في مهمة ستيرنبرغ!';
  }

  @override
  String get verbalAnalogiesTitle => 'التناظرات اللفظية';

  @override
  String get verbalAnalogiesSubtitle => 'أكمل العلاقة';

  @override
  String get typingSpeedTitle => 'سرعة الكتابة';

  @override
  String get typingSpeedSubtitle =>
      'اكتب العبارة تماماً كما تظهر بأرسع ما يمكن!';

  @override
  String get wordLadderTitle => 'سلم الكلمات';

  @override
  String get wordLadderSubtitle => 'صل الكلمات بتغيير حرف واحد في كل مرة.';

  @override
  String get tangleFixTitle => 'حل التشابك';

  @override
  String get tangleFixSubtitle => 'فك اشتباك الخطوط بحيث لا يتقاطع أي منها';

  @override
  String get oddRotationTitle => 'دوران غريب';

  @override
  String get oddRotationSubtitle => 'أحد هذه الصور معكوس. هل يمكنك إيجاده؟';

  @override
  String get towerOfLondonTitle => 'برج لندن';

  @override
  String get towerOfLondonSubtitle => 'طابق التكوين المستهدف';

  @override
  String get symbolicFlankerTitle => 'فلانكر رمزي';

  @override
  String get symbolicFlankerSubtitle => 'ركز على الرمز المركزي';

  @override
  String get stroopTestTitle => 'اختبار ستروب';

  @override
  String get stroopTestSubtitle =>
      'حدد لون حبر الكلمة المعروضة. تجاهل ما تعنيه الكلمة فعلياً!';

  @override
  String get wisconsinCardSortingTitle => 'فرز بطاقات ويسكونسن';

  @override
  String get wisconsinCardSortingSubtitle =>
      'طابق البطاقة بإحدى البطاقات الأربع أعلاه';

  @override
  String get nBackTitle => 'اختبار N-Back';

  @override
  String get nBackSubtitle =>
      'اضغط على طابق إذا كان الحرف الحالي يطابق المعروض قبل خطوتين.';

  @override
  String get rhythmMasterTitle => ' سيد الإيقاع';

  @override
  String get rhythmMasterSubtitle => 'اضغط بالتزامن مع النبض';

  @override
  String get pixelMimicTitle => 'تقليد البكسل';

  @override
  String get targetNumberTitle => 'الهدف 24';

  @override
  String targetNumberSubtitle(int target) {
    return 'استخدم جميع الأرقام الأربعة للوصول إلى $target';
  }

  @override
  String get mirrorTracingTitle => 'التتبع بالمرآة';

  @override
  String get mirrorTracingSubtitle => 'تتبع النجمة! أدوات التحكم معكوسة.';

  @override
  String get wordSurgeTitle => 'طفرة الكلمات';

  @override
  String get wordSurgeSubtitle => 'المرادفات والمتضادات';

  @override
  String get perspectiveTakingTitle => 'أخذ المنظور';

  @override
  String get perspectiveTakingTopDownView => 'عرض من الأعلى لأسفل';

  @override
  String get perspectiveTakingChoosePerspective => 'اختر المنظور';

  @override
  String get perspectiveTakingCongrats => 'لديك عين ثاقبة للعلاقات المكانية.';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return 'أي عرض هو من $targetDirName؟';
  }

  @override
  String get paperFoldingTitle => 'طي الورق';

  @override
  String get paperFoldingSubtitle => 'كيف سيبدو شكلها عند بسطها؟';

  @override
  String get waterSortTitle => 'فرز الماء';

  @override
  String get waterSortSubtitle =>
      'فرز الألوان بحيث يحتوي كل أنبوب على لون واحد فقط.';

  @override
  String get numericalEstimationTitle => 'تقدير عددي';

  @override
  String get numericalEstimationSubtitle => 'اختر أقرب إجابة بسرعة!';

  @override
  String get lockPatternTitle => 'نمط القفل';

  @override
  String get lockPatternSubtitle =>
      'ابحث عن النمط السري. كل تخمين يعطي تعليقات على الموقع والنقاط.';

  @override
  String get primeHunterTitle => 'صائد الأولي';

  @override
  String get primeHunterSubtitle => 'اسحب يساراً للأولي | اسحب يميناً للمركب';

  @override
  String get tracePathTitle => 'تتبع المسار';

  @override
  String get tracePathSubtitle =>
      'اتبع المسار المستهدف بأكبر قدر ممكن من الدقة';

  @override
  String get ruleSwitcherTitle => 'مبدل القواعد';

  @override
  String get ruleSwitcherSubtitle => 'طبق القاعدة الحالية';

  @override
  String get choiceReactionTimeTitle => 'زمن رد الفعل';

  @override
  String get pathRecallTitle => 'استذكار المسار';

  @override
  String get switchTaskTitle => 'مهمة التبديل';

  @override
  String get switchTaskSubtitle =>
      'انتبه للقاعدة! ستتبدل بين مطابقة الشكل ومطابقة اللون.';

  @override
  String get mentalRotationTitle => 'الدوران الذهني';

  @override
  String get mentalRotationSubtitle => 'هل هذه الأشكال متماثلة، فقط مدورة؟';

  @override
  String get missingOperatorTitle => 'مزيج العوامل';

  @override
  String get missingOperatorSubtitle => 'املأ الفراغات لإكمال المعادلة';

  @override
  String get wordMastermindTitle => 'العقل المدبر للكلمات';

  @override
  String get wordMastermindSubtitle =>
      'فك شفرة الأربعة أحرف! الثيران (B) مواقع مثالية، الأبقار (C) مواقع خاطئة.';

  @override
  String get simonSequenceTitle => 'تسلسل';

  @override
  String get symbolLogicTitle => 'منطق الرموز';

  @override
  String get symbolLogicSubtitle =>
      'حل المعادلات البصرية لإيجاد قيمة كل رمز. ما هي نتيجة المعادلة الأخيرة؟';

  @override
  String get silhouetteMatchTitle => 'تطابق الصورة الظلية';

  @override
  String get silhouetteMatchSubtitle => 'أي صورة ظلية تطابق هذا الشيء؟';

  @override
  String get operationSpanTitle => 'نطاق العمليات';

  @override
  String get operationSpanMathPhase => 'هل المعادلة صحيحة؟';

  @override
  String get operationSpanLetterPhase => 'تذكر الحرف';

  @override
  String get operationSpanRecallPhase => 'استرجع الحروف بالترتيب';

  @override
  String get operationSpanRoundComplete => 'اكتملت الجولة!';

  @override
  String operationSpanScore(int score) {
    return 'لقد سجلت $score نقطة في نطاق العمليات!';
  }

  @override
  String get slidePuzzleTitle => 'لغز الانزلاق';

  @override
  String get slidePuzzleNewGame => 'لعبة جديدة';

  @override
  String get slidePuzzleInstructions =>
      'أعد ترتيب المربعات بترتيب عددي عن طريق سحبها إلى المساحة الفارغة.';

  @override
  String get slidePuzzleTileSlider => 'منزلق المربعات';

  @override
  String get slidePuzzleCongrats => 'لقد نجحت في ترتيب جميع المربعات.';

  @override
  String get visualSearchTitle => 'البحث البصري';

  @override
  String get visualSearchSubtitle => 'ابحث عن الرمز الفريد في الشبكة';

  @override
  String get trailMakingTitle => 'صنع المسار';

  @override
  String get trailMakingSubtitle =>
      'صل الأرقام بالترتيب (1 -> 2 -> 3...) بأسرع ما يمكن.';

  @override
  String get matrixReasoningTitle => 'الاستدلال المصفوفي';

  @override
  String get matrixReasoningSubtitle => 'أكمل النمط في شبكة 3x3';

  @override
  String get tentsAndTreesTitle => 'الخيام والأشجار';

  @override
  String get tentsAndTreesSubtitle =>
      'ضع الخيام بجانب الأشجار. تشير الأرقام إلى عدد الخيام في كل صف/عمود. لا يمكن للخيام أن تتلامس.';

  @override
  String get quickMathTitle => 'الرياضيات السريعة';

  @override
  String get magicSquaresTitle => 'مربع سحري';

  @override
  String magicSquaresSubtitle(int targetSum) {
    return 'يجب أن يكون مجموع كل صف وعمود وقطر $targetSum';
  }

  @override
  String get objectShuffleTitle => 'خلط الأشياء';

  @override
  String get pipesTitle => 'الأنابيب';

  @override
  String get pipesSubtitle => 'صل النقاط الملونة المتطابقة بالأنابيب.';

  @override
  String get oddOneOutTitle => 'العنصر الغريب';

  @override
  String get oddOneOutSubtitle => 'ابحث عن المربع ذو اللون المختلف.';

  @override
  String get einsteinRiddleTitle => 'لغز أينشتاين';

  @override
  String get einsteinRiddleSubtitle =>
      'استخدم التلميحات لاستنتاج سمات كل منزل.';

  @override
  String get einsteinRiddleHowToPlay =>
      'لكل منزل سمات فريدة (لون، جنسية، حيوان أليف، إلخ). استخدم التلميحات المقدمة لملء الشبكة والعثور على الحل الكامل.';

  @override
  String get einsteinRiddleColor => 'اللون';

  @override
  String get einsteinRiddleNationality => 'الجنسية';

  @override
  String get einsteinRiddleDrink => 'المشروب';

  @override
  String get einsteinRiddlePet => 'الحيوان الأليف';

  @override
  String get einsteinRiddleSmoke => 'التدخين';

  @override
  String get einsteinRiddleHouse => 'المنزل';

  @override
  String get mirrorImageTitle => 'صورة المرآة';

  @override
  String get mirrorImageSubtitle => 'حدد انعكاس المرآة الصحيح.';

  @override
  String get mirrorImageHowToPlay =>
      'انظر إلى الشكل واختر انعكاس المرآة الصحيح له من الخيارات المقدمة.';

  @override
  String get mentalMappingTitle => 'الخرائط الذهنية';

  @override
  String get mentalMappingSubtitle => 'اتبع الاتجاهات وابحث عن الوجهة.';

  @override
  String get mentalMappingHowToPlay =>
      'ستظهر لك سلسلة من الاتجاهات (شمال، جنوب، شرق، غرب). اتبع هذه الخطوات ذهنياً بدءاً من مركز الشبكة واختر الوجهة النهائية.';

  @override
  String get memoryPalaceTitle => 'قصر الذاكرة';

  @override
  String get memoryPalaceSubtitle => 'تذكر أي كلمة كانت في أي موقع.';

  @override
  String get memoryPalaceHowToPlay =>
      'ستظهر مجموعة من الكلمات في مواقع مختلفة على الشبكة. احفظ مواقعها. بعد ذلك، سيُطلب منك وضع الكلمات مرة أخرى في مواقعها الأصلية.';

  @override
  String get countingSheepTitle => 'عد الأغنام';

  @override
  String get countingSheepSubtitle => 'كم عدد الأغنام التي رأيتها؟';

  @override
  String get countingSheepHowToPlay =>
      'ستركض الأغنام عبر الشاشة بسرعة. عدها أثناء مرورها وأدخل العدد الإجمالي في النهاية.';

  @override
  String get faceTraitAssociationTitle => 'ربط الوجه بالسمة';

  @override
  String get faceTraitAssociationSubtitle => 'احفظ السمات لكل وجه';

  @override
  String get faceTraitAssociationHowToPlay =>
      'ستظهر لك عدة وجوه، لكل منها اسم ومهنة وهواية. احفظ هذه الروابط. لاحقاً، سيُطلب منك استرجاع السمات المحددة لكل وجه.';

  @override
  String get mentalCalendarTitle => 'التقويم الذهني';

  @override
  String get mentalCalendarSubtitle => 'احسب اليوم من الأسبوع';

  @override
  String get mentalCalendarHowToPlay =>
      'سيظهر تاريخ عشوائي. استخدم الحساب الذهني (أو خوارزمية يوم القيامة) لتحديد اليوم من الأسبوع الذي يوافق هذا التاريخ.';

  @override
  String get vocabularyBuilderTitle => 'بناء المفردات';

  @override
  String get vocabularyBuilderSubtitle =>
      'طابق المرادفات والمتضادات تحت ضغط الوقت.';

  @override
  String get vocabularyBuilderHowToPlay =>
      'ستظهر لك كلمة مستهدفة وعلاقة (مرادف أو متضاد). اختر الكلمة الصحيحة من الخيارات التي تطابق العلاقة. كن سريعاً، الوقت يمر!';

  @override
  String get correct => 'صحيح';

  @override
  String get incorrect => 'غير صحيح';

  @override
  String get grammarPoliceTitle => 'شرطة القواعد';

  @override
  String get grammarPoliceSubtitle =>
      'حدد ما إذا كانت الجملة صحيحة لغوياً أم تحتوي على أخطاء.';

  @override
  String get grammarPoliceHowToPlay =>
      'ستظهر جملة في منتصف الشاشة. قرر ما إذا كانت صحيحة لغوياً أم تحتوي على خطأ. اضغط على \'صحيح\' إذا كانت جيدة، أو \'غير صحيح\' إذا لاحظت خطأً. لا تفقد كل أرواحك!';

  @override
  String get reverseStroopTitle => 'ستروب المعكوس';

  @override
  String get reverseStroopSubtitle =>
      'نسخة من اختبار ستروب حيث يتم تبديل التركيز.';

  @override
  String get reverseStroopHowToPlay =>
      'انتبه للتعليمات! إذا كُتب \'نص\'، طابق معنى الكلمة. إذا كُتب \'لون\'، طابق لون الحبر. ستتبدل القواعد بشكل متكرر لاختبار تركيزك.';

  @override
  String get game2048Instruction => 'اسحب في أي اتجاه للدمج';

  @override
  String get fibonacciMergeTitle => 'دمج فيبوناتشي';

  @override
  String get fibonacciMergeSubtitle =>
      'ادمج أرقام فيبوناتشي المتتالية (1، 1، 2، 3، 5، 8، 13...).';

  @override
  String get sequenceSleuthTitle => 'مخبر التسلسل';

  @override
  String get sequenceSleuthSubtitle =>
      'ابحث عن الرقم المفقود في التسلسل الرياضي.';

  @override
  String get divisibilityDashTitle => 'سباق القابلية للقسمة';

  @override
  String get divisibilityDashSubtitle =>
      'اضغط على جميع القواسم المكونة من رقم واحد (2-9) للرقم المعطى.';

  @override
  String get percentagePeakTitle => 'قمة النسبة المئوية';

  @override
  String get percentagePeakSubtitle =>
      'حل حسابات النسبة المئوية الذهنية بسرعة.';

  @override
  String get vennNumbersTitle => 'أرقام فين';

  @override
  String get vennNumbersSubtitle => 'صنف الأرقام في مناطق مخطط فين الصحيحة.';

  @override
  String get commonDenominatorTitle => 'القاسم المشترك';

  @override
  String get commonDenominatorSubtitle =>
      'أوجد القاسم المشترك الأكبر أو المضاعف المشترك الأصغر.';

  @override
  String get angleFinderTitle => 'مكتشف الزوايا';

  @override
  String get angleFinderSubtitle =>
      'احسب الزاوية المفقودة في المسألة الهندسية.';

  @override
  String get sumSnakeTitle => 'ثعبان المجموع';

  @override
  String get sumSnakeSubtitle =>
      'صل الأرقام المتجاورة للوصول إلى المجموع المستهدف.';

  @override
  String get baseShiftTitle => 'هجوم تحويل القواعد';

  @override
  String get baseShiftSubtitle => 'حل بالعشري';

  @override
  String get baseShiftDescription =>
      'حل المعادلة واكتب الإجابة بالنظام العشري (القاعدة 10).';

  @override
  String get baseShiftEquation => 'المعادلة';

  @override
  String get baseShiftHint => 'أدخل النتيجة العشرية...';

  @override
  String get baseShiftCorrect => 'صحيح!';

  @override
  String get baseShiftIncorrect => 'خطأ!';

  @override
  String get baseShiftSubmit => 'إرسال';

  @override
  String get baseShiftQuickGuide => 'دليل سريع:';

  @override
  String get baseShiftBinary => 'ثنائي (bin): قاعدة 2 (0, 1)';

  @override
  String get baseShiftHex => 'ستة عشري (0x): قاعدة 16 (0-9, A-F)';

  @override
  String get baseShiftDecimal => 'عشري (dec): قاعدة 10 (0-9)';

  @override
  String get baseShiftWinTitle => 'ساحر الرياضيات!';

  @override
  String get baseShiftWinMessage => 'لقد حللت 5 معادلات تحويل قواعد بشكل صحيح!';

  @override
  String get blockCount3DTitle => 'عد المكعبات ثلاثي الأبعاد';

  @override
  String get blockCount3DSubtitle => 'اسحب للتدوير • عد المكعبات المخفية';

  @override
  String get blockCount3DHowMany => 'كم عدد المكعبات؟';

  @override
  String get blockCount3DSubmitGuess => 'إرسال التخمين';

  @override
  String get blockCount3DNotQuite => 'ليس تماماً! حاول التدوير للعد مرة أخرى.';

  @override
  String get blockCount3DExcellent => 'ممتاز';

  @override
  String blockCount3DWinMessage(int count) {
    return 'لقد حددت جميع المكعبات الـ $count بشكل صحيح!';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '1. اسحب إصبعك عبر شاشة العرض ثلاثية الأبعاد لتدوير كومة المكعبات.\n\n2. عد جميع المكعبات في الكومة.\n\n3. تذكر: يجب أن يحتوي المكعب الموجود في الهواء على مكعبات دعم هيكلي تحته (مكعبات مخفية!).\n\n4. اكتب إجابتك واضغط على \"إرسال التخمين\" للتحقق.';

  @override
  String get alphabetSudokuTitle => 'سودوكو الأبجدية';

  @override
  String get alphabetSudokuSubtitle =>
      'املأ الشبكة بحيث يحتوي كل صف وعمود ومربع على الحروف A-I.';

  @override
  String get alphabetSudokuWinTitle => 'تم حل السودوكو!';

  @override
  String get alphabetSudokuWinMessage => 'عبقري! لقد أتقنت الحروف.';

  @override
  String get classicMazeTitle => 'المتاهة الكلاسيكية';

  @override
  String get classicMazeSubtitle => 'استكشف وحل • متاهة جديدة في كل لعبة';

  @override
  String get classicMazeWinTitle => 'تم اجتياز المتاهة';

  @override
  String classicMazeWinMessage(int count) {
    return 'ملاحة مذهلة! لقد حللت المتاهة في $count حركات.';
  }

  @override
  String get classicMazeMoves => 'الحركات: ';

  @override
  String get classicMazeHowToPlayDescription =>
      '1. وجه الكرة الصفراء المتوهجة (اللاعب) إلى البوابة الخضراء (المخرج) في أسفل اليمين.\n\n2. اسحب في أي مكان، أو استخدم مفاتيح الأسهم، أو أزرار لوحة الأسهم للتحرك.\n\n3. يظهر المسار الأرجواني المسار الذي استكشفته. عد إلى مسارك لمسحه ديناميكياً!\n\n4. بدّل الصعوبات لتحدي نفسك بمتاهات أكبر.';

  @override
  String get conjunctionSearchTitle => 'البحث المجمع';

  @override
  String get conjunctionSearchSubtitle => 'التركيز الانتباهي ودمج الميزات';

  @override
  String get conjunctionSearchWinTitle => 'نصر';

  @override
  String get conjunctionSearchWinMessage =>
      'لقد وجدت جميع الأهداف بتركيز انتباهي مثالي!';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      'سيظهر مزيج محدد من الشكل واللون في التعليمات. ابحث عنه واضغط عليه في الشبكة بأسرع ما يمكن. تشارك الأشكال المشتتة إما في اللون أو الشكل، لذا انظر بتمعن!';

  @override
  String get conjunctionSearchRound => 'الجولة: ';

  @override
  String get conjunctionSearchScore => 'النتيجة: ';

  @override
  String get conjunctionSearchFind => 'ابحث عن: ';

  @override
  String get shapeCircle => 'دائرة';

  @override
  String get shapeSquare => 'مربع';

  @override
  String get shapeTriangle => 'مثلث';

  @override
  String get shapeStar => 'نجمة';

  @override
  String get shapeRectangle => 'مستطيل';

  @override
  String get shapeEllipse => 'بيضاوي';

  @override
  String get shapeTrapezoid => 'شبه منحرف';

  @override
  String get colorRedLabel => 'أحمر';

  @override
  String get colorBlueLabel => 'أزرق';

  @override
  String get colorGreenLabel => 'أخضر';

  @override
  String get colorAmberLabel => 'كهرماني';

  @override
  String get cubeNetFoldTitle => 'طي شبكة المكعب';

  @override
  String get cubeNetFoldSubtitle => 'اختر خيار المكعب ثلاثي الأبعاد المطابق';

  @override
  String get cubeNetFoldWinTitle => 'صحيح';

  @override
  String get cubeNetFoldWinMessage => 'لديك منطق طي مكاني ثلاثي الأبعاد مثالي!';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '1. انظر إلى الشبكة ثنائية الأبعاد المبسوطة في الأعلى.\n\n2. اطوِ الشبكة ذهنياً لتكوين مكعب ثلاثي الأبعاد.\n\n3. اختر الخيار أدناه الذي يمثل منظوراً صحيحاً ثلاثي الأبعاد لهذا المكعب المطوي.\n\n4. احذر: الوجوه المتقابلة في الشبكة لا يمكن أن تكون متجاورة في الأبعاد الثلاثة.';

  @override
  String get cubeNetFoldUnfoldedNet => 'شبكة ثنائية الأبعاد مبسوطة';

  @override
  String get cubeNetFoldWhichMatches => 'أي مكعب يطابق؟';

  @override
  String get cubeNetFoldIncorrect =>
      'منطق طي غير صحيح! اضغط على إعادة التعيين أو غير اختيارك.';

  @override
  String get cubeNetFoldSubmitChoice => 'إرسال الاختيار';

  @override
  String get cubeNetFoldFailed => 'فشل (اضغط على إعادة التعيين)';

  @override
  String get faceTraitAssociationMemorize => 'احفظ جميع الأشخاص الأربعة';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return 'الشخص $current من $total';
  }

  @override
  String get faceTraitAssociationWhatOccupation => 'ما هي مهنتهم؟';

  @override
  String get faceTraitAssociationWhatHobby => 'ما هي هوايتهم؟';

  @override
  String get faceTraitAssociationWinTitle => 'سيد الذاكرة!';

  @override
  String get faceTraitAssociationLoseTitle => 'انتهت اللعبة';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return 'لقد أجبت بشكل صحيح على $correct من أصل $total.';
  }

  @override
  String get topologyTitle => 'الطوبولوجيا';

  @override
  String get topologySubtitle =>
      'هل هذه الأشكال متكافئة طوبولوجياً؟ (هل يمكن تشكيل أحدها من الآخر دون قطع أو لصق؟)';

  @override
  String get topologyWinTitle => 'عبقري الهندسة!';

  @override
  String get topologyWinMessage => 'لقد حددت 10 أزواج طوبولوجية بشكل صحيح!';

  @override
  String get topologyScore => 'النتيجة: ';

  @override
  String get semanticDistanceTitle => 'المسافة الدلالية';

  @override
  String get semanticDistanceSubtitle => 'قياس المسافة المفاهيمية بين الكلمات';

  @override
  String get oxymoronHuntTitle => 'صيد التناقض';

  @override
  String get oxymoronHuntSubtitle => 'طابق الكلمات المتناقضة في الشبكة';

  @override
  String get portmanteauSplitTitle => 'تقسيم الكلمات المنحوتة';

  @override
  String get portmanteauSplitSubtitle => 'تحديد الكلمات المصدر للكلمة المنحوتة';

  @override
  String get chainReactionTitle => 'تفاعل متسلسل';

  @override
  String get chainReactionSubtitle => 'ربط الكلمات باستخدام الحروف المتداخلة';

  @override
  String get rhymeMasterTitle => 'سيد القافية';

  @override
  String get rhymeMasterSubtitle => 'تحديد الكلمات التي لها نفس قافية الهدف';

  @override
  String get definitionDashTitle => 'سباق التعاريف';

  @override
  String get definitionDashSubtitle => 'طابق الكلمة الصحيحة بتعريفها';

  @override
  String get syllableStackTitle => 'رص المقاطع';

  @override
  String get syllableStackSubtitle => 'رص المقاطع لتكوين كلمات كاملة';

  @override
  String get sentenceUnscrambleTitle => 'فك بعثرة الجمل';

  @override
  String get sentenceUnscrambleSubtitle =>
      'إعادة ترتيب الكلمات لتكوين جملة صحيحة';

  @override
  String get grammarSortTitle => 'تصنيف القواعد';

  @override
  String get grammarSortSubtitle => 'تصنيف الكلمات حسب أقسام الكلام';

  @override
  String get vowelReconstructTitle => 'إعادة بناء حروف العلة';

  @override
  String get vowelReconstructSubtitle => 'ملء حروف العلة المفقودة في الجملة';

  @override
  String get consonantReconstructTitle => 'إعادة بناء الحروف الساكنة';

  @override
  String get consonantReconstructSubtitle =>
      'ملء الحروف الساكنة المفقودة في الجملة';

  @override
  String get homophoneHuntTitle => 'صيد الكلمات المتجانسة';

  @override
  String get silentLetterSearchTitle => 'البحث عن الحروف الصامتة';

  @override
  String get silentLetterSearchSubtitle =>
      'تحديد الحروف الصامتة في الكلمات المعطاة';

  @override
  String get palindromeBuilderTitle => 'بناء الكلمات المتناظرة';

  @override
  String get palindromeBuilderSubtitle =>
      'إنشاء كلمة متناظرة بإضافة أقل عدد من الحروف';

  @override
  String get phoneticGuessTitle => 'التخمين الصوتي';

  @override
  String get phoneticGuessSubtitle => 'تحديد الكلمة من هجائها الصوتي';

  @override
  String get spoonerismSolverTitle => 'حل التبادل الصوتي';

  @override
  String get spoonerismSolverSubtitle => 'تحديد التبادل الصوتي الصحيح للعبارة';

  @override
  String get etymonOddballTitle => 'غريب الأطوار اللغوي';

  @override
  String get etymonOddballSubtitle =>
      'ابحث عن الكلمة التي لا تشترك في نفس الأصل';

  @override
  String get etymologyOriginTitle => 'أصل الكلمة';

  @override
  String get etymologyOriginSubtitle => 'تخمين اللغة الأصلية للكلمة المستعارة';

  @override
  String get affixFactoryTitle => 'مصنع الزوائد';

  @override
  String get affixFactorySubtitle =>
      'إنشاء كلمات صحيحة باستخدام البادئات واللواحق';

  @override
  String get cognateCatchTitle => 'صيد الكلمات المشتركة';

  @override
  String get cognateCatchSubtitle =>
      'التمييز بين الكلمات المشتركة الحقيقية والمزيفة';

  @override
  String get compoundConnectTitle => 'ربط الكلمات المركبة';

  @override
  String get compoundConnectSubtitle => 'دمج كلمتين لتكوين كلمة مركبة';

  @override
  String get pangramSprintTitle => 'سباق البانجرام';

  @override
  String get pangramSprintSubtitle =>
      'بناء جملة باستخدام كل حرف من حروف الأبجدية';

  @override
  String get anagramDefinitionTitle => 'تعريف الأناجرام';

  @override
  String get anagramDefinitionSubtitle => 'حل الأناجرام بناءً على تعريفه';

  @override
  String get letterBridgeTitle => 'جسر الحروف';

  @override
  String get letterBridgeSubtitle =>
      'ابحث عن الحرف المفقود الذي يربط بين كلمتين';

  @override
  String get letterFrequencyScanTitle => 'مسح تردد الحروف';

  @override
  String get letterFrequencyScanSubtitle => 'عد عدد مرات ظهور حرف في النص';

  @override
  String get oneLetterShiftTitle => 'إزاحة حرف واحد';

  @override
  String get oneLetterShiftSubtitle => 'تحويل كلمة إلى أخرى بتغيير حرف واحد';

  @override
  String vocabularyBuilderMessage(String arg0) {
    return 'عمل رائع! حصيلتك اللغوية مثيرة للإعجاب. النتيجة: $arg0';
  }

  @override
  String get symmetryMessage => 'لقد عكست النمط تماماً بدقة جراحية.';

  @override
  String get temporalOrderMessage => 'مذهل! ذاكرتك للتسلسل الزمني عالية الدقة.';

  @override
  String get temporalOrderMessage1 =>
      'ذاكرة التسلسل غير صحيحة. التدريب يؤدي للكمال!';

  @override
  String get wordSearchMessage =>
      'تم العثور على جميع الكلمات بنجاح بملاحظة دقيقة.';

  @override
  String colorMatchMessage(String arg0) {
    return 'دقتك: $arg0%';
  }

  @override
  String semanticLinkMessage(String arg0) {
    return 'لقد سجلت $arg0 نقطة!';
  }

  @override
  String reflexTapMessage(String arg0) {
    return 'لقد ضغطت على $arg0 من الأهداف!';
  }

  @override
  String get angleFinderMessage => 'حدسك الهندسي مثالي!';

  @override
  String angleFinderMessage1(String arg0) {
    return 'الإجابة الصحيحة كانت $arg0°';
  }

  @override
  String angleFinderText(String arg0) {
    return '$arg0°';
  }

  @override
  String visualStatisticalLearningMessage(String arg0) {
    return 'لقد سجلت $arg0 من الأنماط الصحيحة!';
  }

  @override
  String nonogramText(String arg0) {
    return 'خطأ: $arg0';
  }

  @override
  String mentalCalendarMessage(String arg0) {
    return 'لقد أجبت بشكل صحيح على $arg0 من أصل 10!';
  }

  @override
  String orbitTapMessage(String arg0) {
    return 'لقد نجحت في الضغط $arg0 مرة!';
  }

  @override
  String schulteTableMessage(String arg0) {
    return 'لقد أكملت الجدول في $arg0.\nاستمر في التدريب لتوسيع رؤيتك المحيطية!';
  }

  @override
  String get schulteTableText => 'ابدأ الاختبار';

  @override
  String get relationalMemoryMessage => 'دقة ذاكرة علاقات مكانية رائعة!';

  @override
  String sudokuText(String arg0) {
    return 'خطأ: $arg0';
  }

  @override
  String sdmtMessage(String arg0) {
    return 'لقد طابقت $arg0 من الرموز! هذا الاختبار يقيس سرعة المسح والانتباه البصري.';
  }

  @override
  String get futoshikiMessage => 'مذهل! لقد حللت مربع فوتوشيكي اللاتيني.';

  @override
  String letterFrequencyScanMessage(String arg0, String arg1) {
    return 'لقد عددت بشكل صحيح $arg0 مرات ظهور لـ \"$arg1\".';
  }

  @override
  String letterFrequencyScanText(String arg0) {
    return 'غير صحيح. كان العدد $arg0.';
  }

  @override
  String get memoryMatrixMessage =>
      'مثير للإعجاب! ذاكرتك العاملة حادة. اكتمل الهدف اليومي!';

  @override
  String get memoryMatrixMessage1 => 'ركز وحاول مرة أخرى لتحسين نتيجة ذاكرتك.';

  @override
  String get contextCluesMessage =>
      'استثنائي! مفرداتك وتحليلك السياقي في القمة.';

  @override
  String get contextCluesMessage1 =>
      'تم اختيار الكلمة الخاطئة! درب تفكيرك السياقي اللفظي وحاول ثانية.';

  @override
  String oneLetterShiftMessage(String arg0, String arg1) {
    return 'لقد أزحت $arg0 إلى $arg1 بشكل صحيح.';
  }

  @override
  String get mentalAbacusMessage => 'حسابك الذهني من المستوى الأول.';

  @override
  String fractionMatcherMessage(String arg0) {
    return 'لقد سجلت $arg0 نقطة في مطابقة التمثيلات!';
  }

  @override
  String get spellingSprintMessage => 'لقد هجأت جميع الكلمات العشر بشكل صحيح!';

  @override
  String spellingSprintMessage1(String arg0) {
    return 'لقد هجأت $arg0 كلمات.';
  }

  @override
  String stopSignalMessage(String arg0) {
    return 'لقد حققت $arg0 استجابة صحيحة! هذا الاختبار يقيس قدرتك على كبح فعل مخطط له.';
  }

  @override
  String grammarPoliceMessage(String arg0) {
    return 'انتهت اللعبة! لقد حافظت على النظام في عالم القواعد. النتيجة: $arg0';
  }

  @override
  String consonantReconstructMessage(String arg0) {
    return 'لقد أعدت بناء نتيجة $arg0!';
  }

  @override
  String rhymeMasterMessage(String arg0, String arg1) {
    return 'لقد وجدت $arg0 من أصل $arg1 قوافي!';
  }

  @override
  String vigilanceTaskMessage(String arg0, String arg1, String arg2) {
    return 'إصابات: $arg0، إخفاقات: $arg1\nإنذارات كاذبة: $arg2';
  }

  @override
  String get silhouetteMatchOrthoMessage => 'لديك مهارات محاذاة إملاء مثالية!';

  @override
  String get silhouetteMatchOrthoText => 'فهمت';

  @override
  String get silhouetteMatchOrthoText1 =>
      'إسقاط منظور غير صحيح! اضغط على إعادة التعيين للمحاولة مرة أخرى.';

  @override
  String fibonacciMergeMessage(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String factorFinderMessage(String arg0) {
    return 'لقد سجلت $arg0 نقطة من خلال إيجاد جميع العوامل!';
  }

  @override
  String logicalSyllogismsMessage(String arg0) {
    return 'لقد حللت $arg0 من القياسات المنطقية بشكل صحيح!';
  }

  @override
  String get rotatingMazeMessage => 'لقد نجحت في عبور المتاهة الدوارة الحركية!';

  @override
  String get rotatingMazeText => 'فهمت';

  @override
  String get rotatingMazeText1 => '🌀 دارت المتاهة 90 درجة! انزاحت الشبكة!';

  @override
  String get mathPathMessage => 'لقد وجدت المسار الذي يصل إلى الهدف!';

  @override
  String get bridgesMessage => 'لقد نجحت في توصيل جميع الجزر!';

  @override
  String compoundConnectMessage(String arg0, String arg1) {
    return 'الكلمة المركبة هي $arg0$arg1.';
  }

  @override
  String get pangramSprintMessage =>
      'لقد بنيت جملة باستخدام جميع الحروف الـ 26.';

  @override
  String get mirrorImageMessage => 'لقد حددت الانعكاس بشكل مثالي.';

  @override
  String get mirrorImageText => 'صورة مرآة';

  @override
  String reverseStroopMessage(String arg0) {
    return 'لقد سجلت $arg0 نقطة! راقب التعليمات جيداً.';
  }

  @override
  String get verbalAnalogiesMessage => 'لديك عقل حاد للعلاقات.';

  @override
  String corsiBlocksMessage1(String arg0, String arg1) {
    return 'لقد تذكرت $arg1 تسلسلات! وصل نطاق ذاكرتك المكانية إلى $arg0.';
  }

  @override
  String wordLadderMessage(String arg0, String arg1, String arg2) {
    return 'لقد نجحت في توصيل $arg0 بـ $arg1 في $arg2 خطوات.';
  }

  @override
  String d2AttentionMessage(String arg0) {
    return 'مسح انتقائي مذهل! النتيجة النهائية: $arg0.';
  }

  @override
  String get d2AttentionText => 'كيفية اللعب';

  @override
  String get d2AttentionText1 => 'فهمت';

  @override
  String get tangleFixMessage => 'جميع الخطوط واضحة وسلسة.';

  @override
  String get distractorMatrixMessage =>
      'مذهل! لقد تذكرت الأنماط على الرغم من المشتتات الرياضية المعرفية!';

  @override
  String get distractorMatrixMessage1 =>
      'لقد نالت منك المشتتات! أعد تدريب ذاكرتك العاملة.';

  @override
  String sentenceUnscrambleMessage(String arg0) {
    return 'لقد فككت بعثرة نتيجة $arg0!';
  }

  @override
  String get kakuroMessage => 'مذهل! لقد طابقت جميع قطع المجموع بشكل مثالي.';

  @override
  String symbolicFlankerMessage(String arg0, String arg1) {
    return 'لقد أجبت بشكل صحيح على $arg0 من أصل $arg1!';
  }

  @override
  String stroopTestMessage(String arg0) {
    return 'لقد سجلت $arg0 إجابات صحيحة! ركز على لون الحبر، وليس الكلمة.';
  }

  @override
  String wisconsinCardSortingMessage(String arg0) {
    return 'لقد صنفت $arg0 بطاقة بشكل صحيح!';
  }

  @override
  String nBackMessage(String arg0) {
    return 'لقد حققت $arg0 من مطابقات 2-back! ذاكرتك العاملة حيوية لتعدد المهام.';
  }

  @override
  String rhythmMasterMessage(String arg0, String arg1) {
    return 'لقد حققت $arg0 ضربة مثالية و $arg1 نقطة!';
  }

  @override
  String groceryListMessage(String arg0, Object score) {
    return 'لقد سجلت $score نقطة في قائمة البقالة!';
  }

  @override
  String get groceryListText => 'أنا مستعد';

  @override
  String get mirrorTracingMessage => 'لقد نجح دماغك في إعادة توصيل تنسيقه.';

  @override
  String moduloClockMessage(String arg0) {
    return 'تنسيق رياضي ذهني ممتاز! النتيجة: $arg0';
  }

  @override
  String moduloClockMessage1(String arg0, String arg1, String arg2) {
    return 'لقد تمكنت من حل $arg0 من أصل $arg1 من حلول الساعة المعيارية. النتيجة: $arg2';
  }

  @override
  String get crownMessage => 'تم وضع جميع التيجان بنجاح وبمنطق مثالي.';

  @override
  String dualCodingMessage(String arg0) {
    return 'أداء رائع للمهام المزدوجة! نتيجة ذاكرتك العاملة: $arg0';
  }

  @override
  String inequalityDashMessage(String arg0) {
    return 'لقد سجلت $arg0 نقطة في مطابقة المتباينات!';
  }

  @override
  String sourceMonitoringMessage(String arg0, String arg1) {
    return 'لقد سجلت $arg0 من أصل $arg1!';
  }

  @override
  String get sourceMonitoringText => 'بدء الاستذكار';

  @override
  String get memoryPalaceText => 'الكلمات المتاحة';

  @override
  String target10Message(String arg0) {
    return 'لقد سجلت $arg0 نقطة في مطابقة الأرقام للوصول إلى 10!';
  }

  @override
  String get paperFoldingMessage => 'يمكنك رؤية الأنماط في عقلك.';

  @override
  String topologyText(String arg0, String arg1) {
    return '$arg0$arg1 / 10';
  }

  @override
  String get waterSortMessage => 'لقد فرزت جميع الألوان بشكل مثالي!';

  @override
  String anagramDefinitionMessage(String arg0) {
    return 'كانت الكلمة بالفعل \"$arg0\".';
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
    return 'لقد قمت بإجراء $arg0 تقديرات صحيحة.';
  }

  @override
  String grammarSortMessage(String arg0) {
    return 'لقد صنفت $arg0 كلمات بشكل صحيح!';
  }

  @override
  String vowelReconstructMessage(String arg0) {
    return 'لقد أعدت بناء نتيجة $arg0!';
  }

  @override
  String spatialConflictMessage(String arg0, String arg1) {
    return 'لقد حققت نتيجة $arg0 مع $arg1 أخطاء!';
  }

  @override
  String get spatialConflictText => 'كيفية اللعب';

  @override
  String get spatialConflictText1 => 'فهمت';

  @override
  String tracePathMessage(String arg0) {
    return 'كانت دفتك $arg0%!';
  }

  @override
  String ruleSwitcherMessage(String arg0, String arg1) {
    return 'لقد سجلت $arg0 إجابات صحيحة من أصل $arg1!';
  }

  @override
  String collatzMessage(String arg0, String arg1) {
    return 'لقد استغرقت $arg0 خطوات. كان الحد الأدنى الممكن هو $arg1.';
  }

  @override
  String get collatzText => '/ 2';

  @override
  String get collatzText1 => '+ 1';

  @override
  String get collatzText2 => '3n + 1';

  @override
  String divisibilityDashMessage(String arg0) {
    return 'لقد حللت $arg0 أرقام!';
  }

  @override
  String switchTaskMessage(String arg0) {
    return 'لقد سجلت $arg0 إجابات صحيحة! التبديل السريع هو مفتاح المرونة الذهنية.';
  }

  @override
  String sequenceSleuthMessage(String arg0) {
    return 'لقد حللت $arg0 من التسلسلات!';
  }

  @override
  String changeBlindnessMessage(String arg0) {
    return 'لقد وجدت $arg0 تغييرات!';
  }

  @override
  String mentalRotationMessage(String arg0) {
    return 'لقد دورت $arg0 أشكال بشكل صحيح!';
  }

  @override
  String wordMastermindMessage(String arg0) {
    return 'لقد أتقنت الكود!\nالكلمة كانت: $arg0';
  }

  @override
  String wordMastermindMessage1(String arg0) {
    return 'الكلمة المخفية كانت: $arg0';
  }

  @override
  String wordMastermindText(String arg0) {
    return '$arg0';
  }

  @override
  String get simonSequenceMessage => 'لقد حفظت كل المربعات العشرة!';

  @override
  String get simonSequenceMessage1 => 'حاول ثانية لإتقان التسلسل.';

  @override
  String oxymoronHuntMessage(String arg0) {
    return 'لقد وجدت $arg0 من التناقضات!';
  }

  @override
  String spotlightTrackMessage(String arg0) {
    return 'تتبع مكاني مذهل! لقد سجلت $arg0 نقطة.';
  }

  @override
  String get spotlightTrackText => 'كيفية اللعب';

  @override
  String get spotlightTrackText1 => 'فهمت';

  @override
  String get spotlightTrackText2 => 'بدء الجولة';

  @override
  String vennNumbersMessage(String arg0) {
    return 'لقد صنفت $arg0 أرقام!';
  }

  @override
  String get vennNumbersText => 'لا شيء منهما';

  @override
  String get vennNumbersText1 => 'كلاهما';

  @override
  String get silhouetteMatchMessage =>
      'دماغك ممتاز في الترجمة من ثلاثي الأبعاد إلى ثنائي الأبعاد.';

  @override
  String sumSnakeMessage(String arg0) {
    return 'تم الوصول إلى الهدف $arg0 بدقة مثالية!';
  }

  @override
  String get sumSnakeText => 'مسح المسار';

  @override
  String percentagePeakMessage(String arg0) {
    return 'لقد حللت $arg0 من مسائل النسب المئوية!';
  }

  @override
  String trailMakingMessage(String arg0) {
    return 'لقد أكملت $arg0 من المسارات! هذا الاختبار يقيس سرعة البحث البصري والمرونة الذهنية.';
  }

  @override
  String matrixReasoningMessage(String arg0) {
    return 'لقد أكملت $arg0 من المصفوفات بشكل صحيح!';
  }

  @override
  String get tentsAndTreesMessage => 'لقد نجحت في وضع جميع الخيام.';

  @override
  String klotskiMessage(String arg0) {
    return 'انزلاق رائع! لقد حررت كتلة البطل في $arg0 حركات.';
  }

  @override
  String sumPyramidMessage(String arg0) {
    return 'لقد حللت $arg0 من أهرامات المجموع بنجاح!';
  }

  @override
  String simonCommandMessage(String arg0) {
    return 'استجابة انتقائية وتركيز ممتازان! النتيجة الإجمالية: $arg0';
  }

  @override
  String simonCommandMessage1(String arg0, String arg1) {
    return 'لقد سجلت $arg0 ولكنك لم تصل إلى $arg1 تطابق في الوقت المناسب.';
  }

  @override
  String syllableStackMessage(String arg0) {
    return 'لقد رصصت نتيجة $arg0!';
  }

  @override
  String get slitherlinkMessage => 'رائع! لقد أكملت لغز الحلقة بنجاح.';

  @override
  String quickMathMessage(String arg0) {
    return 'لقد حللت $arg0 من المسائل!';
  }

  @override
  String commonDenominatorMessage(String arg0) {
    return 'لقد حللت $arg0 من مسائل GCD/LCM!';
  }

  @override
  String chainReactionMessage(String arg0, String arg1) {
    return 'نتيجتك النهائية هي $arg0. لقد بنيت سلسلة من $arg1 كلمات.';
  }

  @override
  String chainReactionText(String arg0) {
    return '$arg0';
  }

  @override
  String get associativePairsMessage => 'رائع! لقد ربطت السمات البصرية ببراعة.';

  @override
  String get associativePairsMessage1 =>
      'ارتباط خاطئ! شحذ ذاكرة الروابط وحاول ثانية.';

  @override
  String portmanteauSplitMessage(String arg0) {
    return 'لقد قسمت $arg0 من الكلمات المنحوتة!';
  }

  @override
  String get magicSquaresText => 'مسح';

  @override
  String alphabetSudokuText(String arg0) {
    return 'خطأ: $arg0';
  }

  @override
  String get pipesMessage => 'لقد وصلت جميع الأنابيب وملأت الشبكة.';

  @override
  String get dualMirrorMessage => 'لقد وجهت كلا الأيقونتين إلى أهدافهما!';

  @override
  String binaryCodeMessage(String arg0) {
    return 'ترجمة عشرية سريعة مذهلة! النتيجة النهائية: $arg0';
  }

  @override
  String binaryCodeMessage1(String arg0, String arg1) {
    return 'لقد حولت $arg0 أرقام ثنائية بشكل صحيح. النتيجة: $arg1';
  }

  @override
  String oddOneOutMessage(String arg0) {
    return 'لقد وجدت 50 عنصراً غريباً! النتيجة النهائية: $arg0';
  }

  @override
  String oddOneOutMessage1(String arg0) {
    return 'نتيجتك: $arg0';
  }

  @override
  String letterBridgeMessage(String arg0) {
    return 'لقد وجدت الحرف الجسر: $arg0';
  }

  @override
  String get imReady => 'أنا مستعد';

  @override
  String get soptTitle => 'التأشير الذاتي';

  @override
  String get soptSubtitle => 'اضغط على بطاقة مختلفة في كل مرة. تتضارب المواقف!';

  @override
  String get soptWinTitle => 'سيد التسلسل!';

  @override
  String soptGameOverMessage(int score) {
    return 'لقد سجلت $score نقطة من خلال تتبع البطاقات التي تم خلطها بنجاح!';
  }

  @override
  String get soptChooseNovel => 'اضغط على بطاقة جديدة';

  @override
  String get soptGreatJob => 'عمل عظيم!';

  @override
  String get soptAlreadyTapped => 'استغلالها بالفعل!';

  @override
  String get soptGrid => 'شبكة';

  @override
  String get contRecogTitle => 'الاعتراف المستمر';

  @override
  String get contRecogSubtitle => 'هل رأيت هذه البطاقة من قبل في هذه الجلسة؟';

  @override
  String get contRecogWinTitle => 'عبقرية الاعتراف!';

  @override
  String contRecogGameOverMessage(int score) {
    return 'لقد سجلت $score تقديرًا صحيحًا!';
  }

  @override
  String get contRecogCorrect => 'صحيح!';

  @override
  String get contRecogWrong => 'خطأ!';

  @override
  String get contRecogOldOrNew => 'هل هذا قديم أم جديد؟';

  @override
  String get contRecogNew => 'جديد';

  @override
  String get contRecogOld => 'قديم';

  @override
  String get contRecogSeenPool => 'بركة المشاهدة';

  @override
  String get dnmsTitle => 'الذاكرة غير المطابقة';

  @override
  String get dnmsSubtitle => 'اضغط على البطاقة التي لم تكن في العينة المحفوظة.';

  @override
  String get dnmsWinTitle => 'خبير غير مطابق!';

  @override
  String dnmsGameOverMessage(int score) {
    return 'لقد حصلت على $score إجابات صحيحة في عدم المطابقة المتأخرة!';
  }

  @override
  String get dnmsChooseNovel => 'اضغط على البطاقة الجديدة';

  @override
  String get dnmsMemorizeSample => 'احفظ هذه البطاقة';

  @override
  String get dnmsWaitForIt => 'انتظرها...';

  @override
  String get dnmsExcellent => 'ممتاز!';

  @override
  String get dnmsSampleTapped => 'وكانت تلك العينة!';

  @override
  String get dnmsCards => 'بطاقات';

  @override
  String get symSpanTitle => 'مدى التماثل';

  @override
  String get symSpanSubtitle =>
      'استدعاء أنماط الخلايا أثناء تحديد التماثل الرأسي.';

  @override
  String get symSpanWinTitle => 'سيد التماثل!';

  @override
  String symSpanGameOverMessage(int score) {
    return 'لقد سجلت $score نقطة من خلال تذكر المخططات وتحديد التماثل!';
  }

  @override
  String get symSpanMemorizeRed => 'حفظ موقع الخلية الحمراء';

  @override
  String get symSpanIsSymmetric => 'هل النمط متماثل؟';

  @override
  String get symSpanRecallSequence => 'أذكر التسلسل بالترتيب الصحيح';

  @override
  String get symSpanGreatJob => 'عمل عظيم!';

  @override
  String get symSpanTryAgain => 'حاول ثانية!';

  @override
  String get symSpanLength => 'طول';

  @override
  String get readingSpanTitle => 'نطاق القراءة';

  @override
  String get readingSpanSubtitle =>
      'التحقق من الجمل أثناء تذكر سلسلة من الحروف.';

  @override
  String get readingSpanWinTitle => 'خبير القراءة!';

  @override
  String readingSpanGameOverMessage(int score) {
    return 'لقد سجلت $score نقطة في تحدي الذاكرة Reading Span!';
  }

  @override
  String get readingSpanTrueFalse => 'هل هذا البيان صحيح أم خطأ؟';

  @override
  String get readingSpanMemorizeLetter => 'احفظ هذه الرسالة';

  @override
  String get readingSpanRecallLetters => 'أذكر الحروف بالتسلسل';

  @override
  String get readingSpanGreatJob => 'عمل عظيم!';

  @override
  String get readingSpanTryAgain => 'حاول ثانية!';

  @override
  String readingSpanYourSequence(String sequence) {
    return 'التسلسل الخاص بك: $sequence';
  }

  @override
  String get readingSpanLength => 'طول';

  @override
  String get readingSpanSentence1 => 'تشرق الشمس في الشرق.';

  @override
  String get readingSpanSentence2 => 'الجليد يغلي ساخنًا.';

  @override
  String get readingSpanSentence3 => 'يمكن للأسماك أن تتنفس تحت الماء.';

  @override
  String get readingSpanSentence4 => 'الكلاب لها أجنحة وتستطيع الطيران.';

  @override
  String get readingSpanSentence5 => 'يتجمد الماء عند 0 درجة مئوية.';

  @override
  String get readingSpanSentence6 => 'تنبح القطط مثل الكلاب الصغيرة.';

  @override
  String get readingSpanSentence7 => 'الأشجار لها أوراق خضراء في الصيف.';

  @override
  String get readingSpanSentence8 => 'يسقط المطر إلى أعلى من الأرض.';

  @override
  String get readingSpanSentence9 => 'المثلث له أربعة أضلاع متساوية.';

  @override
  String get readingSpanSentence10 => 'التفاح هو نوع من الفاكهة الحلوة.';

  @override
  String get readingSpanSentence11 => 'القمر مصنوع من جبنة الشيدر.';

  @override
  String get readingSpanSentence12 => 'السيارات لديها عجلات للتدحرج.';

  @override
  String get readingSpanSentence13 => 'النار شديدة البرودة.';

  @override
  String get readingSpanSentence14 => 'الورق مصنوع من الخشب المعالج.';

  @override
  String get readingSpanSentence15 => 'الطيور لديها ريش يساعدها على الطيران.';

  @override
  String get readingSpanSentence16 => 'ينمو الموز على أشجار الصنوبر.';

  @override
  String get readingSpanSentence17 => 'الفيل أصغر من النملة.';

  @override
  String get readingSpanSentence18 => 'تحتوي الكتب على صفحات مطبوعة من النص.';

  @override
  String get countingSpanTitle => 'نطاق العد';

  @override
  String get countingSpanSubtitle =>
      'عد الدوائر الزرقاء فقط. ثم تذكر تسلسل التهم.';

  @override
  String get countingSpanWinTitle => 'عد عبقرية!';

  @override
  String countingSpanGameOverMessage(int score) {
    return 'لقد سجلت $score نقطة في تحدي الذاكرة Counting Span!';
  }

  @override
  String get countingSpanCountCircles => 'عد الدوائر الزرقاء فقط';

  @override
  String get countingSpanRecallCounts => 'أذكر التهم بالترتيب الصحيح';

  @override
  String get countingSpanGreatJob => 'عمل عظيم!';

  @override
  String get countingSpanTryAgain => 'حاول ثانية!';

  @override
  String countingSpanYourSequence(String sequence) {
    return 'التسلسل الخاص بك: $sequence';
  }

  @override
  String get countingSpanLength => 'طول';

  @override
  String get objDispTitle => 'إزاحة الكائن';

  @override
  String get objDispSubtitle =>
      'حفظ التخطيط. ابحث عن الكائن الوحيد الذي يغير موضعه وانقر عليه.';

  @override
  String get objDispWinTitle => 'العبقرية المكانية!';

  @override
  String objDispGameOverMessage(int score) {
    return 'لقد حددت بشكل صحيح $score كائنات نازحة!';
  }

  @override
  String get objDispMemorizeAll => 'حفظ جميع المواضع';

  @override
  String get objDispWaitingShift => 'في انتظار تغيير التخطيط...';

  @override
  String get objDispTapMoved => 'اضغط على الكائن الذي تم نقله';

  @override
  String get objDispExcellent => 'ممتاز!';

  @override
  String get objDispWrongObject => 'كائن خاطئ!';

  @override
  String get objDispItems => 'أغراض';

  @override
  String get mandalaTitle => 'ماندالا أذكر';

  @override
  String get mandalaSubtitle =>
      'حفظ تكوين اللون. اختيار الألوان وإعادة طلاء البلاط.';

  @override
  String get mandalaWinTitle => 'فنان ماندالا!';

  @override
  String mandalaGameOverMessage(int score) {
    return 'لقد سجلت $score نقطة من خلال إعادة إنشاء تخطيطات هندسية ملونة!';
  }

  @override
  String get mandalaMemorizeColors => 'حفظ ألوان البلاط';

  @override
  String get mandalaPaintCells => 'طلاء الخلايا لتتناسب مع الأصل';

  @override
  String get mandalaExcellent => 'ممتاز!';

  @override
  String get mandalaIncorrectMatch => 'مباراة غير صحيحة!';

  @override
  String get mandalaSubmitRepaint => 'إرسال إعادة رسم';

  @override
  String get mandalaTiles => 'البلاط';

  @override
  String get runningSpanTitle => 'تشغيل المدى';

  @override
  String get runningSpanSubtitle =>
      'مشاهدة الحروف. عندما يتوقفون، أدخل آخر أحرف N بالترتيب.';

  @override
  String get runningSpanWinTitle => 'سيد العازلة!';

  @override
  String runningSpanGameOverMessage(int score) {
    return 'لقد سجلت $score نقطة في Running Memory Span!';
  }

  @override
  String runningSpanPrepareRecall(int count) {
    return 'الاستعداد لاستدعاء آخر $count حرف';
  }

  @override
  String get runningSpanWatchCarefully => 'انتبه جيدا...';

  @override
  String runningSpanEnterLast(int count) {
    return 'أدخل آخر $count حرف';
  }

  @override
  String get runningSpanGreatJob => 'عمل عظيم!';

  @override
  String get runningSpanIncorrectBuffer => 'المخزن المؤقت غير صحيح!';

  @override
  String runningSpanRecallLast(int count) {
    return 'أذكر الأخير $count';
  }

  @override
  String get runningSpanStopsRandomly => 'يتوقف الدفق بشكل عشوائي!';

  @override
  String runningSpanEntered(String sequence) {
    return 'تم الإدخال: $sequence';
  }

  @override
  String get runningSpanNItems => 'عناصر N';

  @override
  String get spatialCabinetTitle => 'الخزانات المكانية';

  @override
  String get spatialCabinetSubtitle =>
      'احفظ درج الخزانة الذي يحتوي على أي كائن.';

  @override
  String get spatialCabinetWinTitle => 'خبير مجلس الوزراء!';

  @override
  String spatialCabinetGameOverMessage(int score) {
    return 'لقد سجلت $score نقطة في ذاكرة الخزانة المكانية!';
  }

  @override
  String get spatialCabinetMemorize => 'حفظ مواقع العناصر';

  @override
  String spatialCabinetWhereIs(String itemName) {
    return 'أين $itemName ؟';
  }

  @override
  String get spatialCabinetCorrect => 'صحيح!';

  @override
  String get spatialCabinetWrongDrawer => 'درج خاطئ!';

  @override
  String get spatialCabinetItems => 'أغراض';

  @override
  String get cabinetItemKey => 'مفتاح';

  @override
  String get cabinetItemApple => 'تفاحة';

  @override
  String get cabinetItemDiamond => 'الماس';

  @override
  String get cabinetItemBook => 'كتاب';

  @override
  String get cabinetItemUmbrella => 'مظلة';

  @override
  String get cabinetItemCoffee => 'قهوة';

  @override
  String get cabinetItemLock => 'قفل';

  @override
  String get cabinetItemPet => 'حيوان أليف';

  @override
  String get cabinetItemCar => 'سيارة';

  @override
  String get gamesTitleLabel => 'الألعاب';

  @override
  String get yourFavorites => 'مفضلاتك';

  @override
  String get readyForWorkout => 'هل أنت مستعد لتمرينك اليومي؟';

  @override
  String get greatStartKeepGoing => 'بداية رائعة! استمر في التقدم.';

  @override
  String get onFireToday => 'أنت متألق اليوم!';

  @override
  String get incredibleSolvingToday => 'حلول مذهلة اليوم!';

  @override
  String get newGameLabel => 'جديد';

  @override
  String get slitherlinkTitle => 'سليذرلينك';

  @override
  String get slitherlinkSubtitle =>
      'قم بتطويق شبكة المسامير باستخدام أدلة الأرقام.';

  @override
  String get futoshikiTitle => 'فوتوشيكي';

  @override
  String get futoshikiSubtitle => 'املأ الشبكات باستخدام أدلة أكبر من.';

  @override
  String get kakuroTitle => 'كاكورو';

  @override
  String get kakuroSubtitle => 'حل الكلمات المتقاطعة بالأرقام والمجاميع.';

  @override
  String get inequalityDashTitle => 'سباق المتباينات';

  @override
  String get inequalityDashSubtitle => 'حل المتباينات تحت ضغط الوقت.';

  @override
  String get factorFinderTitle => 'مكتشف العوامل';

  @override
  String get factorFinderSubtitle => 'حدد جميع عوامل الأرقام المستهدفة.';

  @override
  String get collatzTitle => 'مسار كولاتز';

  @override
  String get collatzSubtitle => 'تنقل في تسلسل 3N+1.';

  @override
  String get sumPyramidTitle => 'هرم المجموع';

  @override
  String get sumPyramidSubtitle => 'املأ خلايا الهرم بأدلة حساب المجموع.';

  @override
  String get target10Title => 'الهدف 10';

  @override
  String get target10Subtitle =>
      'اجمع بين مربعات الأرقام للحصول على عشرة مجاميع.';

  @override
  String get fractionMatcherTitle => 'مطابق الكسور';

  @override
  String get fractionMatcherSubtitle => 'طابق الكسور المتكافئة بصرياً.';

  @override
  String get dualCodingTitle => 'التشفير المزدوج';

  @override
  String get dualCodingSubtitle => 'طابق الحروف والرموز في آن واحد.';

  @override
  String get distractorMatrixTitle => 'مصفوفة المشتتات';

  @override
  String get distractorMatrixSubtitle =>
      'ابحث عن الأشكال المستهدفة وسط المشتتات.';

  @override
  String get temporalOrderTitle => 'الترتيب الزمني';

  @override
  String get temporalOrderSubtitle => 'تذكر التسلسل الزمني.';

  @override
  String get associativePairsTitle => 'الأزواج المترابطة';

  @override
  String get associativePairsSubtitle => 'زاوج وطابق الرموز المتناظرة.';

  @override
  String get blockCount3dTitle => 'عد الكتل ثلاثي الأبعاد';

  @override
  String get blockCount3dSubtitle => 'عد الكتل في فضاء ثلاثي الأبعاد.';

  @override
  String get rotatingMazeTitle => 'المتاهة الدوارة';

  @override
  String get rotatingMazeSubtitle => 'دور المتاهات لتوجيه الكرات إلى المخرج.';

  @override
  String get silhouetteMatchOrthoTitle => 'مطابقة الصورة الظلية (متعامد)';

  @override
  String get silhouetteMatchOrthoSubtitle =>
      'طابق الأجسام ثلاثية الأبعاد مع الظلال المتعامدة.';

  @override
  String get spatialConflictTitle => 'الصراع المكاني';

  @override
  String get spatialConflictSubtitle => 'حل التناقضات بين النص والاتجاه.';

  @override
  String get spotlightTrackTitle => 'تتبع الضوء';

  @override
  String get spotlightTrackSubtitle =>
      'تتبع العناصر الوامضة في الظلال المتحركة.';

  @override
  String get d2AttentionTitle => 'انتباه d2';

  @override
  String get d2AttentionSubtitle => 'اضغط على الرموز المستهدفة بمعايير صارمة.';

  @override
  String get dualMirrorTitle => 'ملاحة المرآة المزدوجة';

  @override
  String get dualMirrorSubtitle => 'تنقل في متاهتين في وقت واحد.';

  @override
  String get contextCluesTitle => 'أدلة السياق';

  @override
  String get contextCluesSubtitle =>
      'استنتج الكلمات المخفية من تلميحات السياق.';

  @override
  String get digitSpanReverseSubtitle => 'تذكر أرقام الأعداد بترتيب عكسي.';

  @override
  String get faceNameAssociationSubtitle =>
      'تذكر أسماء الوجوه المتنوعة المعروضة.';

  @override
  String get staircaseMemorySubtitle => 'احفظ الكتل في تسلسل تدريجي.';

  @override
  String get choiceReactionTimeSubtitle =>
      'اضغط على أزرار محددة تطابق الإشارات بسرعة.';

  @override
  String get attentionalBlinkSubtitle => 'أشعل أهدافاً سريعة تومض في تدفقات.';

  @override
  String get visualStatisticalLearningSubtitle =>
      'تعلم أنماط الأشكال الزمنية بصرياً.';

  @override
  String get sternbergTaskSubtitle =>
      'تذكر ما إذا كان الرمز موجوداً في مجموعة الذاكرة.';

  @override
  String get operationSpanSubtitle => 'حل الرياضيات وتذكر سلاسل الأبجدية.';

  @override
  String get continuousRecognitionTitle => 'الاعتراف المستمر';

  @override
  String get continuousRecognitionSubtitle =>
      'حدد ما إذا كانت البطاقة المعروضة قديمة أم جديدة.';

  @override
  String get symmetrySpanTitle => 'نطاق التماثل';

  @override
  String get symmetrySpanSubtitle =>
      'تذكر إحداثيات الخلايا وسط قرارات التماثل الرأسي.';

  @override
  String get objectDisplacementTitle => 'إزاحة الأشياء';

  @override
  String get objectDisplacementSubtitle =>
      'ادرس المواقع واضغط على الشيء الوحيد الذي تحرك.';

  @override
  String get mandalaRecallTitle => 'استذكار الماندالا';

  @override
  String get mandalaRecallSubtitle =>
      'احفظ مربعات الألوان وأعد طلاء الماندالا من اللوحة.';

  @override
  String get runningMemorySpanTitle => 'نطاق الذاكرة الجارية';

  @override
  String get runningMemorySpanSubtitle =>
      'راقب الحروف الجارية وتذكر آخر N من العناصر.';

  @override
  String get spatialCabinetMemoryTitle => 'الخزانات المكانية';

  @override
  String get spatialCabinetMemorySubtitle =>
      'احفظ وحدد مواقع العناصر خلف أبواب الخزانات.';

  @override
  String get pathRecallSubtitle => 'احفظ وكرر اختيارات المسار.';

  @override
  String get objectShuffleSubtitle => 'تتبع العناصر المخلوطة تحت أكواب عميقة.';

  @override
  String get groceryListSubtitle => 'احفظ وتحقق من العناصر في القائمة.';

  @override
  String get quickMathSubtitle => 'حل أسئلة الحساب بأقصى سرعة.';

  @override
  String get mathGuessTitle => 'تخمين الرياضيات';

  @override
  String get mathGuessSubtitle => 'خمن الرقم المخفي في غضون 15 فرصة.';

  @override
  String get reflexTapSubtitle => 'اضغط على المثيرات بأسرع ما يمكن بشرياً.';

  @override
  String get pixelMimicSubtitle => 'حاكي أنماط التصميم على شبكات البكسل.';

  @override
  String get simonSequenceSubtitle => 'كرر تسلسلات الأشكال من الذاكرة.';

  @override
  String get slidePuzzleSubtitle => 'أعد ترتيب مربعات شبكة الانزلاق.';

  @override
  String get findWordTitle => 'ابحث عن الكلمة';

  @override
  String get schulteTableSubtitle =>
      'اضغط على الأرقام من واحد إلى خمسة وعشرين.';

  @override
  String get simonCommandTitle => 'أمر سايمون';

  @override
  String get simonCommandSubtitle => 'نفذ التعليمات الصوتية بسرعة.';

  @override
  String get binaryCodeTitle => 'السرعة الثنائية';

  @override
  String get binaryCodeSubtitle => 'ترجم الأكواد الثنائية إلى عشرية.';

  @override
  String get moduloClockTitle => 'ساعة القياس';

  @override
  String get moduloClockSubtitle => 'احسب المعادلات الرياضية باستخدام الساعات.';

  @override
  String get chimpTestTitle => 'اختبار الشمبانزي';

  @override
  String get chimpTestSubtitle => 'اضغط على الأرقام العشوائية بترتيب تصاعدي.';

  @override
  String get relationalMemoryTitle => 'الذاكرة العلاقية';

  @override
  String get relationalMemorySubtitle => 'تذكر مواقع عناصر الشبكة بالضبط.';

  @override
  String get factBinderTitle => 'رابط الحقائق';

  @override
  String get factBinderSubtitle => 'ربط الرموز وتذكر العبارات.';

  @override
  String get sourceMonitoringTitle => 'مراقبة المصدر';

  @override
  String get sourceMonitoringSubtitle => 'تذكر السياق.';

  @override
  String get klotskiTitle => 'هروب كلوتسكي';

  @override
  String get klotskiSubtitle => 'حرك الكتل للوصول إلى المخارج.';

  @override
  String get homophoneHuntSubtitle =>
      'اختر الكلمة المتجانسة المكتوبة بشكل صحيح';

  @override
  String get laserLinkTitle => 'رابط الليزر';

  @override
  String get laserLinkSubtitle =>
      'قم بتدوير المرايا لتعكس الليزر وتشغيل جميع الأهداف.';

  @override
  String get laserLinkCongrats =>
      'انعكاس دقيق! لقد نجحت في تشغيل الشبكة بالكامل.';

  @override
  String get crossSectionSliceTitle => 'شريحة المقطع العرضي';

  @override
  String get crossSectionSliceSubtitle =>
      'حدد المقطع العرضي ثنائي الأبعاد الصحيح لجسم ثلاثي الأبعاد من زاوية محددة.';

  @override
  String get crossSectionSliceCongrats =>
      'تصور ثلاثي الأبعاد مذهل! لقد رأيت بوضوح من خلال هذا الشكل.';

  @override
  String get shadowPivotTitle => 'محور الظل';

  @override
  String get shadowPivotCongrats =>
      'تفكير مكاني ديناميكي! لقد أتقنت الضوء والظل.';

  @override
  String get shadowPivotSubtitle =>
      'توقع الظل الذي يلقيه جسم ثلاثي الأبعاد أثناء دورانه على محاور مختلفة.';

  @override
  String get interlockPuzzleTitle => 'لغز التشابك';

  @override
  String get interlockPuzzleSubtitle =>
      'قم بتفكيك أو تجميع الكتل المتشابكة المعقدة بالتسلسل الصحيح.';

  @override
  String get interlockPuzzleCongrats =>
      'تفكيك منطقي! لقد حللت اللغز بشكل مثالي.';

  @override
  String get pathIntersectTitle => 'تقاطع المسار';

  @override
  String get pathIntersectSubtitle =>
      'انتقل عبر مسارات متعددة في وقت واحد للوصول إلى أهدافهم الخاصة دون تصادم.';

  @override
  String get pathIntersectCongrats =>
      'ملاحة متزامنة! لقد وصلت إلى جميع الأهداف بلا أخطاء.';

  @override
  String get negativeSpaceDetectionTitle => 'المساحة السلبية';

  @override
  String get negativeSpaceDetectionSubtitle =>
      'حدد الشكل الذي تشكله المساحة الفارغة بين الأشياء.';

  @override
  String get negativeSpaceDetectionCongrats =>
      'إدراك حاد! لقد أتقنت فن رؤية ما هو غير موجود.';

  @override
  String get compassMazeTitle => 'متاهة البوصلة';

  @override
  String get compassMazeSubtitle =>
      'انتقل عبر متاهة حيث تتغير اتجاهات الحركة بناءً على اتجاه بوصلتك.';

  @override
  String get compassMazeCongrats =>
      'ملاحة خبيرة! لقد وجدت المخرج من خلال الاتجاهات المتغيرة.';

  @override
  String get complexFoldingNetsTitle => 'شبكات الطي';

  @override
  String get complexFoldingNetsSubtitle =>
      'حدد الشكل ثلاثي الأبعاد المعقد الذي سيتشكل عن طريق طي شبكة ثنائية الأبعاد غير قياسية.';

  @override
  String get complexFoldingNetsCongrats =>
      'منطق طي متقدم! لقد نجحت في تصور الشكل ثلاثي الأبعاد.';

  @override
  String get compassMazeMessage => 'انتقل عبر المتاهة باستخدام البوصلة.';

  @override
  String get negativeSpaceDetectionMessage => 'حدد الشيء المخفي في الفضاء.';

  @override
  String get shikakuTitle => 'شيكاكو';

  @override
  String get shikakuSubtitle =>
      'قسّم الشبكة إلى مربعات ومستطيلات تطابق الأرقام.';

  @override
  String get countdownMathTitle => 'الرياضيات العد التنازلي';

  @override
  String get countdownMathSubtitle =>
      'اجمع أرقامًا عشوائية لحساب الهدف المكون من ثلاثة أرقام.';

  @override
  String get narrativeRecallTitle => 'أذكر السرد';

  @override
  String get narrativeRecallSubtitle =>
      'اقرأ القصة وتذكر التفاصيل الكمية والواقعية المحددة.';

  @override
  String get shellGameTitle => 'لعبة شل';

  @override
  String get shellGameSubtitle =>
      'تتبع الكرة المخفية بينما تتبادل الأكواب أماكنها.';

  @override
  String get typoglycemiaDecoderTitle => 'فك ترميز سكر الدم';

  @override
  String get typoglycemiaDecoderSubtitle =>
      'حل الرموز وقراءة الجمل المختلطة بسرعة.';

  @override
  String get shapeShifterTitle => 'شيفتر الشكل';

  @override
  String get shapeShifterSubtitle => 'اضغط على تركيبة اللون والشكل المستهدفة.';

  @override
  String get gokigenNanameTitle => 'جوكيجن نانام';

  @override
  String get gokigenNanameSubtitle => 'ارسم الأقطار لتوصيل النقاط بدون حلقات.';

  @override
  String get matrixMultiplierTitle => 'مضاعف المصفوفة';

  @override
  String get matrixMultiplierSubtitle => 'حدد صفًا وعمودًا للضرب في الهدف.';

  @override
  String get wordAssociationRecallTitle => 'جمعية الكلمة';

  @override
  String get wordAssociationRecallSubtitle =>
      'استدعاء اقترانات الكلمات المقترنة من الذاكرة.';

  @override
  String get gearRotationTitle => 'دوران العتاد';

  @override
  String get gearRotationSubtitle => 'توقع اتجاه دوران الترس الأخير.';

  @override
  String get wordWheelTitle => 'عجلة الكلمات';

  @override
  String get wordWheelSubtitle =>
      'اصنع كلمات باستخدام الحروف الموجودة على العجلة، بما في ذلك الحرف المركزي.';

  @override
  String get oddEvenFlashTitle => 'فلاش فردي وزوجي';

  @override
  String get oddEvenFlashSubtitle =>
      'قم بمطابقة تكافؤ الأرقام بسرعة مع قاعدة اللون.';

  @override
  String get norinoriTitle => 'نورينوري';

  @override
  String get norinoriSubtitle => 'قم بتظليل خليتين متصلتين بالضبط في كل غرفة.';

  @override
  String get algebraicBalanceTitle => 'التوازن الجبري';

  @override
  String get algebraicBalanceSubtitle =>
      'حل المعادلات للعثور على المبلغ المستهدف.';

  @override
  String get patternSequenceDrawTitle => 'استدعاء النمط';

  @override
  String get patternSequenceDrawSubtitle =>
      'كرر تسلسل المسار المتحرك على الشبكة.';

  @override
  String get tangramTitle => 'لغز تنغرم';

  @override
  String get tangramSubtitle => 'ترتيب الأشكال لملء الصورة الظلية المستهدفة.';

  @override
  String get semanticAssociationTitle => 'كلمة الجمعية';

  @override
  String get semanticAssociationSubtitle =>
      'ابحث عن الكلمة التي تربط القرائن الثلاثة.';

  @override
  String get peripheralFocusTitle => 'التركيز المحيطي';

  @override
  String get peripheralFocusSubtitle =>
      'تفاعل مع اللوحات الجانبية الوامضة أثناء حل الرياضيات.';

  @override
  String get masyuTitle => 'حلقة ماسيو';

  @override
  String get masyuSubtitle => 'ارسم حلقة واحدة تطابق قواعد دائرة Masyu.';

  @override
  String get mathMazeTitle => 'متاهة الرياضيات';

  @override
  String get mathMazeSubtitle =>
      'تتبع المسار الذي يتم تقييمه إلى الإجمالي المستهدف.';

  @override
  String get storyBuilderTitle => 'منشئ القصة';

  @override
  String get storyBuilderSubtitle => 'إعادة بناء التسلسل الزمني للقصة.';

  @override
  String get mirrorMazeTitle => 'متاهة المرآة';

  @override
  String get mirrorMazeSubtitle =>
      'إعادة توجيه شعاع الليزر باستخدام المرايا القطرية.';

  @override
  String get wordGridConnectionTitle => 'اتصالات الكلمات';

  @override
  String get wordGridConnectionSubtitle =>
      'مجموعة 16 كلمة في أربع فئات من أربع.';

  @override
  String get shapeShifterPeripheralTitle => 'الأشكال المحيطية';

  @override
  String get shapeShifterPeripheralSubtitle =>
      'تتبع تغييرات الشكل المحيطي مع مطابقة القيم المركزية.';

  @override
  String get soundWaveMatchTitle => 'مباراة الموجة الصوتية';

  @override
  String get soundWaveMatchSubtitle =>
      'انقر عندما يتماشى تردد الموجة المرئية مع تغيرات درجة الصوت.';

  @override
  String get multiTrackCounterTitle => 'عداد متعدد المسارات';

  @override
  String get multiTrackCounterSubtitle =>
      'اضغط عندما يزيد أي عداد إلى مضاعف الهدف.';

  @override
  String get colorWordMatchUpTitle => 'مطابقة الألوان';

  @override
  String get colorWordMatchUpSubtitle =>
      'تحديد ما إذا كانت كلمتان ملونتان متطابقتان بناءً على القواعد المتغيرة.';

  @override
  String get signalAndNoiseTitle => 'الإشارة والضوضاء';

  @override
  String get signalAndNoiseSubtitle =>
      'حدد موقع الأحرف الأبجدية الرقمية المستهدفة المخفية في الضوضاء الثابتة.';

  @override
  String get focusTunnelTitle => 'نفق التركيز';

  @override
  String get focusTunnelSubtitle =>
      'تحديد الرموز المطابقة التي تظهر على جدران النفق المتحركة.';

  @override
  String get targetPursuerTitle => 'المطارد الهدف';

  @override
  String get targetPursuerSubtitle =>
      'تتبع عدة دوائر متداخلة وحدد الهدف الأصلي.';

  @override
  String get gridGazeTitle => 'نظرة الشبكة';

  @override
  String get gridGazeSubtitle => 'حدد خلية الشبكة التي تومض بمدة مختلفة.';

  @override
  String get doubleTroubleTitle => 'مشكلة مزدوجة';

  @override
  String get doubleTroubleSubtitle =>
      'العب لعبتين بسيطتين منفصلتين في وقت واحد على شاشة مقسمة.';

  @override
  String get syncRhythmTitle => 'إيقاع المزامنة';

  @override
  String get syncRhythmSubtitle =>
      'انقر عندما يتطابق مسح بندول الإيقاع المرئي مع الإيقاع المتزامن.';

  @override
  String get ghostTapTitle => 'شبح الحنفية';

  @override
  String get ghostTapSubtitle =>
      'انقر عندما تصل النبضة غير المرئية إلى أقصى ارتفاع لها.';

  @override
  String get attentionalRsvpTitle => 'الرد على الدعوة متعمد';

  @override
  String get attentionalRsvpSubtitle =>
      'التعرف على الأرقام التي تظهر في وميض الحروف التسلسلية السريعة.';

  @override
  String get colorMazeNavTitle => 'لون المتاهة التنقل';

  @override
  String get colorMazeNavSubtitle =>
      'انتقل إلى مربعات المتاهة المطابقة لألوان الأذونات الديناميكية.';

  @override
  String get dynamicSalienceTitle => 'البروز الديناميكي';

  @override
  String get dynamicSalienceSubtitle =>
      'ابحث عن الشكل الذي يتحرك بديناميكيات مختلفة قليلاً.';

  @override
  String get chalkAndTalkTitle => 'الطباشير والتحدث';

  @override
  String get chalkAndTalkSubtitle =>
      'اكتب الكلمات المسموعة صوتيًا مع تجاهل المشتتات البصرية.';

  @override
  String get blinkDetectorTitle => 'كاشف وميض';

  @override
  String get blinkDetectorSubtitle =>
      'اضغط على وجه الشبكة الذي يومض مرتين في تتابع سريع.';

  @override
  String get frequencyTapTitle => 'اضغط على التردد';

  @override
  String get frequencyTapSubtitle =>
      'اضغط على الزر المطابق لتردد نبضة الضوء المستهدفة.';

  @override
  String get yajilinTitle => 'حلقة ياجيلين';

  @override
  String get yajilinSubtitle =>
      'ضع الخلايا السوداء وارسم حلقة واحدة مطابقة للقرائن.';

  @override
  String get heyawakeTitle => 'شبكة هياواكي';

  @override
  String get heyawakeSubtitle => 'غرف شبكية الظل بدون خلايا سوداء مجاورة.';

  @override
  String get gokigenVariantTitle => 'البديل جوكيجن';

  @override
  String get gokigenVariantSubtitle =>
      'ارسم أقطارًا خالية من الحلقات تلبي أعداد القمم.';

  @override
  String get sheepAndWolvesTitle => 'الأغنام والذئاب';

  @override
  String get sheepAndWolvesSubtitle => 'ارسم حلقة تفصل الأغنام عن الذئاب.';

  @override
  String get islandNurikabeTitle => 'جزيرة نوريكابي';

  @override
  String get islandNurikabeSubtitle => 'جزر النموذج مطابقة لقيود الحجم العددي.';

  @override
  String get shakashakaTitle => 'شكاشاكا ريكتس';

  @override
  String get shakashakaSubtitle =>
      'ضع البلاط الثلاثي لتشكيل مناطق بيضاء مستطيلة.';

  @override
  String get litsTetrisTitle => 'ليتس تيترومينو';

  @override
  String get litsTetrisSubtitle =>
      'ضع tetrominoes في غرف لا تحتوي على نسخ مجاورة.';

  @override
  String get tapaWallTitle => 'جدار تابا';

  @override
  String get tapaWallSubtitle => 'خلايا الظل لتشكيل نمط جدار أسود مستمر.';

  @override
  String get triangularBridgesTitle => 'الجسور الثلاثية';

  @override
  String get triangularBridgesSubtitle =>
      'ربط الجزر في 3 اتجاهات لتلبية المتطلبات.';

  @override
  String get rippleEffectTitle => 'تأثير تموج';

  @override
  String get rippleEffectSubtitle =>
      'ملء الأرقام في الغرف مع احترام قيود المسافة.';

  @override
  String get suguruTectonicTitle => 'شبكة سوجورو';

  @override
  String get suguruTectonicSubtitle =>
      'املأ كتل الغرفة بالأرقام من 1 إلى K مع عدم وجود جيران متساوين.';

  @override
  String get tennerGridTitle => 'شبكة تينر';

  @override
  String get tennerGridSubtitle =>
      'املأ الصفوف بالأرقام من 0 إلى 9 التي تطابق إجماليات الأعمدة.';

  @override
  String get kakurasuSumsTitle => 'مبالغ كاكوراسو';

  @override
  String get kakurasuSumsSubtitle =>
      'تظليل الخلايا لتتوافق مع مجموع فهرس الصفوف/الأعمدة المرجحة.';

  @override
  String get corralLoopTitle => 'حلقة كورال';

  @override
  String get corralLoopSubtitle =>
      'ارسم حلقة واحدة تحتوي على أرقام مطابقة للرؤية.';

  @override
  String get stostoneTitle => 'الجاذبية ستستون';

  @override
  String get stostoneSubtitle =>
      'قم بتظليل الخلايا المنسدلة لملء الصفوف السفلية بشكل مثالي.';

  @override
  String get tripletsLogicTitle => 'الثلاثي الثلاثي';

  @override
  String get tripletsLogicSubtitle =>
      'املأ الشبكة بثلاثة أشكال مع تجنب وجود ثلاثة أشكال في صف واحد.';

  @override
  String get galaxiesSymTitle => 'تماثل المجرات';

  @override
  String get galaxiesSymSubtitle =>
      'قسّم الشبكة إلى أشكال مجرات متناظرة دورانيًا.';

  @override
  String get matrixMultiplierMatchTitle => 'مصفوفة المطابق';

  @override
  String get matrixMultiplierMatchSubtitle =>
      'اضرب قيم الصفوف والأعمدة لمطابقة المنتج النقطي المستهدف.';

  @override
  String get primeFactorTreesTitle => 'أشجار العامل الرئيسي';

  @override
  String get primeFactorTreesSubtitle =>
      'قم بتحليل الأرقام المركبة إلى أزواج عامل الأوراق الأولية.';

  @override
  String get vektorVectorTitle => 'ناقل المتجهات';

  @override
  String get vektorVectorSubtitle =>
      'مقياس المتجهات لجعل مجموعها يهبط على الهدف.';

  @override
  String get binomialMatchTitle => 'مباراة ذات الحدين';

  @override
  String get binomialMatchSubtitle =>
      'مطابقة الصيغ التربيعية مع القيم ذات الحدين.';

  @override
  String get percentageShoppingTitle => 'التسوق بنسبة مئوية';

  @override
  String get percentageShoppingSubtitle =>
      'حساب نسب الخصم وإجماليات الخروج النهائي.';

  @override
  String get cryptoArithmeticTitle => 'التشفير الحسابي';

  @override
  String get cryptoArithmeticSubtitle =>
      'حل مشاكل الرياضيات الخاصة باستبدال الأحرف والأرقام.';

  @override
  String get fractionalPizzaTitle => 'بيتزا جزئية';

  @override
  String get fractionalPizzaSubtitle =>
      'قم بتقسيم شرائح البيتزا لتتناسب مع كسور المبلغ المستهدف.';

  @override
  String get numberBondsTitle => 'سندات العدد';

  @override
  String get numberBondsSubtitle =>
      'قيم عقدة الارتباط تساوي مجموع الاتصال المستهدف.';

  @override
  String get gridSumLineTitle => 'خط مجموع الشبكة';

  @override
  String get gridSumLineSubtitle => 'ارسم مسارًا يتم تقييم قيمه تمامًا للهدف.';

  @override
  String get binaryScaleBalanceTitle => 'ميزان النطاق الثنائي';

  @override
  String get binaryScaleBalanceSubtitle =>
      'موازنة الوزن العشري باستخدام قوة كتلتين.';

  @override
  String get moduloPathTitle => 'مسار مودولو';

  @override
  String get moduloPathSubtitle =>
      'اجتياز خلايا الشبكة التي تطابق قيم باقي الوحدات.';

  @override
  String get digitSwapEqTitle => 'معادلات مبادلة الأرقام';

  @override
  String get digitSwapEqSubtitle =>
      'قم بتبديل الأرقام الفردية بين المعادلات لتصحيح كليهما.';

  @override
  String get areaPerimeterMatchTitle => 'المساحة والمحيط';

  @override
  String get areaPerimeterMatchSubtitle =>
      'ارسم مستطيلات تطابق المنطقة المستهدفة وقيم المحيط.';

  @override
  String get inequalityBalanceOpsTitle => 'توازن عدم المساواة';

  @override
  String get inequalityBalanceOpsSubtitle =>
      'ضع رموز عدم المساواة بين المصطلحات الرياضية المعقدة.';

  @override
  String get graphCoordinatePlotTitle => 'راسمة الرسم البياني';

  @override
  String get graphCoordinatePlotSubtitle =>
      'إحداثيات شبكة الأرض مطابقة للمنحنيات الخطية/التربيعية.';

  @override
  String get baseConversionRunTitle => 'تحويل القاعدة';

  @override
  String get baseConversionRunSubtitle =>
      'تحويل القيم بين الثنائي والعشري والست عشري والثماني.';

  @override
  String get unitConverterProTitle => 'محول الوحدات';

  @override
  String get unitConverterProSubtitle =>
      'الإجابة على تحويلات الوحدات السريعة ضمن الحدود الزمنية.';

  @override
  String get auditoryNBackTitle => 'السمعي N-العودة';

  @override
  String get auditoryNBackSubtitle =>
      'تطابق الحروف المنطوقة المسموعة N خطوات للوراء من الذاكرة.';

  @override
  String get abstractPatternRecallTitle => 'طبقات النمط';

  @override
  String get abstractPatternRecallSubtitle =>
      'إعادة بناء الأشكال الملونة ذات الطبقات من دراسة الذاكرة.';

  @override
  String get roomInspectorTitle => 'مفتش الغرفة';

  @override
  String get roomInspectorSubtitle =>
      'تحديد تعديلات الأثاث التي تم إجراؤها عندما كانت الشاشة فارغة.';

  @override
  String get voiceToFaceMatchTitle => 'مطابقة الصوت والوجه';

  @override
  String get voiceToFaceMatchSubtitle =>
      'حدد الوجه الصحيح المرتبط بالمقطع الصوتي المنطوق.';

  @override
  String get spatialGridMemory3DTitle => 'الذاكرة المكانية ثلاثية الأبعاد';

  @override
  String get spatialGridMemory3DSubtitle =>
      'استدعاء الكتل الوامضة في بنية شبكة مكعبة ثلاثية الأبعاد تم تدويرها.';

  @override
  String get sequenceStackTitle => 'مكدس التسلسل';

  @override
  String get sequenceStackSubtitle =>
      'إعادة بناء إضافات وإزالة مكدس اللوحة بالترتيب.';

  @override
  String get semanticCategoryRecallTitle => 'تذكر الفئة';

  @override
  String get semanticCategoryRecallSubtitle =>
      'تحديد كلمات الدراسة المطابقة لأهداف الفئة المطلوبة.';

  @override
  String get gridDisplacementTitle => 'إزاحة الشبكة';

  @override
  String get gridDisplacementSubtitle =>
      'تحديد الرموز المتغيرة التي تقارن التخطيط بالأصل.';

  @override
  String get soundSequenceMatchTitle => 'مطابقة تسلسل الصوت';

  @override
  String get soundSequenceMatchSubtitle =>
      'كرر تسلسل النوتة الموسيقية التي يتم تشغيلها على لوحة المفاتيح الافتراضية.';

  @override
  String get cardCountingMemoryTitle => 'عداد البطاقة';

  @override
  String get cardCountingMemorySubtitle =>
      'تحديد البطاقات التي تم التعامل معها بالفعل في عمليات التعامل المستمرة مع البطاقات.';

  @override
  String get directionsRecallTitle => 'أذكر الاتجاهات';

  @override
  String get directionsRecallSubtitle =>
      'التنقل في خرائط الشبكة المطابقة لاتجاهات المسار من الذاكرة.';

  @override
  String get eventTimelineMemoryTitle => 'الجدول الزمني للحدث';

  @override
  String get eventTimelineMemorySubtitle =>
      'ترتيب بطاقات الأحداث التاريخية/الخيالية ترتيبًا زمنيًا.';

  @override
  String get featureMatrixRecallTitle => 'مصفوفة الميزة';

  @override
  String get featureMatrixRecallSubtitle =>
      'الإجابة على مطالبات الاستعلام حول سمات لون شكل الخلية.';

  @override
  String get delayedMatchSampleTitle => 'مباراة مؤجلة';

  @override
  String get delayedMatchSampleSubtitle =>
      'قم بمطابقة رمز الهدف بعد حل مشتتات الرياضيات.';

  @override
  String get symbolDigitAssocTitle => 'مساعد الرمز والرقم';

  @override
  String get symbolDigitAssocSubtitle =>
      'حل أوراق ترجمة الرموز المطابقة لمفاتيح الأرقام.';

  @override
  String get dualTaskMemoryTitle => 'ذاكرة مزدوجة المهام';

  @override
  String get dualTaskMemorySubtitle =>
      'حفظ مجموعات الكلمات أثناء حل المهام الحسابية السريعة.';

  @override
  String get actionSequenceRecallTitle => 'استدعاء العمل';

  @override
  String get actionSequenceRecallSubtitle =>
      'كرر تسلسل الرسوم المتحركة لإيماءات الشخصية بالترتيب.';

  @override
  String get tangramPolygonTitle => 'تنغرم فيت';

  @override
  String get tangramPolygonSubtitle =>
      'ترتيب الأشكال المضلعة لملء الخطوط العريضة للصورة الظلية.';

  @override
  String get mazeNav3DTitle => '3D متاهة التنقل';

  @override
  String get mazeNav3DSubtitle =>
      'انتقل عبر مسارات المتاهة ثلاثية الأبعاد من منظور الشخص الأول.';

  @override
  String get isometricProjectionTitle => 'جهاز عرض متساوي القياس';

  @override
  String get isometricProjectionSubtitle =>
      'قم بمطابقة الأشكال ثلاثية الأبعاد مع طرق العرض العلوية/الأمامية ثنائية الأبعاد.';

  @override
  String get polyominoPackingTitle => 'تعبئة البوليومينو';

  @override
  String get polyominoPackingSubtitle =>
      'قم بتعبئة قطع كتل البوليومينو العشوائية في المناطق المستهدفة.';

  @override
  String get spatialGridRotationTitle => 'دوران الشبكة المكانية';

  @override
  String get spatialGridRotationSubtitle =>
      'مطابقة ترتيبات الكتل ثلاثية الأبعاد التي تم تدويرها على طول إحداثيات المحور.';

  @override
  String get wireLoopGameTitle => 'حلقة الأسلاك';

  @override
  String get wireLoopGameSubtitle =>
      'اسحب الحلقات المعدنية على طول خطوط الأسلاك دون اتصال.';

  @override
  String get origamiUnfoldTitle => 'اوريغامي تتكشف';

  @override
  String get origamiUnfoldSubtitle =>
      'حدد أنماط الثقب بعد فرد الأوراق المطوية.';

  @override
  String get ropeTangleSolverTitle => 'مفك الحبل';

  @override
  String get ropeTangleSolverSubtitle =>
      'اسحب العقد لتخطيط الرسوم البيانية المستوية مع تقاطعات الأسطر الصفرية.';

  @override
  String get gridFitTetrisTitle => 'الشبكة صالح حلالا';

  @override
  String get gridFitTetrisSubtitle =>
      'ترتيب الكتل الثابتة غير المنتظمة لتناسب حدود الحاوية.';

  @override
  String get vectorGridAlignmentTitle => 'محاذاة المتجهات';

  @override
  String get vectorGridAlignmentSubtitle =>
      'قم بقياس الأشكال وتدويرها لتتناسب مع أهداف قالب الظل.';

  @override
  String get blockStackingPhysicsTitle => 'كتلة التراص';

  @override
  String get blockStackingPhysicsSubtitle =>
      'تكديس ألواح الكتل غير المنتظمة لموازنة وزن الجاذبية.';

  @override
  String get crossSectionMatch3DTitle => 'مقطع عرضي ثلاثي الأبعاد';

  @override
  String get crossSectionMatch3DSubtitle =>
      'التعرف على الأشكال الهندسية ثنائية الأبعاد المقطوعة من الأشكال ثلاثية الأبعاد.';

  @override
  String get symmetryPaintTitle => 'طلاء التماثل';

  @override
  String get symmetryPaintSubtitle =>
      'ارسم أجزاء الصورة المعكوسة المنعكسة عبر محاور التماثل.';

  @override
  String get rollingBlockBloxTitle => 'كتلة المتداول';

  @override
  String get rollingBlockBloxSubtitle =>
      'قم بلف قطع الكتل للهبوط عموديًا في الفتحات المستهدفة.';

  @override
  String get perspectiveShiftViewTitle => 'تحول المنظور';

  @override
  String get perspectiveShiftViewSubtitle =>
      'قم بتدوير مجموعات الكتل حتى تتهجى الحروف/الكلمات.';

  @override
  String get networkFlowSphericalTitle => 'تدفق الشبكة';

  @override
  String get networkFlowSphericalSubtitle =>
      'ربط تدفقات الشبكة على التفاف الإحداثيات الأسطوانية.';

  @override
  String get layeredSilhouetteBlendTitle => 'مزيج صورة ظلية';

  @override
  String get layeredSilhouetteBlendSubtitle =>
      'قم بتكديس الطبقات الملونة لتتناسب مع الأشكال الشفافة المستهدفة.';

  @override
  String get wordWheelPangramTitle => 'الجناس الناقص كلمة';

  @override
  String get wordWheelPangramSubtitle =>
      'بناء الكلمات التي تحتوي على حروف مستهدفة مركزية من العجلات.';

  @override
  String get letterGridSwapperTitle => 'مبادلة الحروف';

  @override
  String get letterGridSwapperSubtitle =>
      'قم بتبديل مربعات الحروف المجاورة لإكمال الكلمات في الصفوف والأعمدة.';

  @override
  String get synonymMatchTitle => 'مطابقة المرادفات';

  @override
  String get synonymMatchSubtitle =>
      'قم بمطابقة أهداف الكلمات المتساقطة مع المرادفات أو المتضادات.';

  @override
  String get vowelDropTitle => 'إسقاط حرف العلة';

  @override
  String get vowelDropSubtitle =>
      'قم بإسقاط حروف العلة في شبكات الإحداثيات لاستكمال الكلمات.';

  @override
  String get letterBalanceScaleTitle => 'مقياس توازن الكلمات';

  @override
  String get letterBalanceScaleSubtitle =>
      'تهجئة الكلمات التي توازن قيم حروفها الأوزان.';

  @override
  String get wordChainShiritoriTitle => 'سلسلة الكلمات';

  @override
  String get wordChainShiritoriSubtitle =>
      'ربط حلقات الكلمات بدءًا من مخرجات الأحرف السابقة.';

  @override
  String get affixBuilderTitle => 'منشئ اللافتة';

  @override
  String get affixBuilderSubtitle =>
      'الجمع بين البادئات/اللاحقات لبناء المفردات المستهدفة.';

  @override
  String get decipherCrypticCluesTitle => 'فك التشفير';

  @override
  String get decipherCrypticCluesSubtitle =>
      'حل ألغاز التلاعب بالكلمات وفك تشفير الألغاز الإملائية.';

  @override
  String get boggleWordSearchTitle => 'تحير الاتصال';

  @override
  String get boggleWordSearchSubtitle =>
      'تتبع المسارات المتصلة المجاورة للعثور على الكلمات المخفية.';

  @override
  String get idiomUnscrambleTitle => 'المصطلح حل الرموز';

  @override
  String get idiomUnscrambleSubtitle =>
      'ترتيب صفائف الكلمات المخفوقة لتتناسب مع معاني المصطلحات.';

  @override
  String get letterPyramidsTitle => 'أهرامات الحروف';

  @override
  String get letterPyramidsSubtitle =>
      'قم ببناء أبراج الكلمات بإضافة أحرف الجناس الناقص لكل طبقة.';

  @override
  String get soundAlikeHomophonesTitle => 'مباريات الهوموفون';

  @override
  String get soundAlikeHomophonesSubtitle =>
      'التعرف على التهجئة المتجانسة الصحيحة للجمل.';

  @override
  String get wordGridSudokuTitle => 'كلمة سودوكو';

  @override
  String get wordGridSudokuSubtitle =>
      'الحروف الفسيفسائية في صفوف الشبكة تشكل الكلمات.';

  @override
  String get portmanteauFactoryTitle => 'مصنع بورتمانتو';

  @override
  String get portmanteauFactorySubtitle =>
      'دمج المكونات الدلالية لإنشاء كلمات مركبة.';

  @override
  String get codedCrosswordsCodeTitle => 'الكلمات المتقاطعة';

  @override
  String get codedCrosswordsCodeSubtitle =>
      'حل الكلمات المتقاطعة على الشبكة التي تطابق الرموز من رقم إلى حرف.';

  @override
  String get wordSnakeTrailTitle => 'ثعبان الكلمة';

  @override
  String get wordSnakeTrailSubtitle =>
      'تتبع مسارات الحروف الشبيهة بالثعبان لتهجئة الكلمات الموضوعية.';

  @override
  String get typingRhythmSpeedTitle => 'تدفق الكتابة';

  @override
  String get typingRhythmSpeedSubtitle =>
      'اكتب مفردات تتوافق مع إيقاعات إيقاع المسرع.';

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
  String get hideGame => 'إخفاء';

  @override
  String get unhideGame => 'إلغاء الإخفاء';

  @override
  String get favoriteGame => 'المفضلة';

  @override
  String get unfavoriteGame => 'إزالة من المفضلة';

  @override
  String get hiddenGames => 'الألعاب المخفية';

  @override
  String showHiddenGames(int count) {
    return 'إظهار الألعاب المخفية ($count)';
  }

  @override
  String get noHiddenGames => 'لا توجد ألعاب مخفية';

  @override
  String get gameHidden => 'تم إخفاء اللعبة';

  @override
  String get undo => 'تراجع';

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
  String get btnMatchColor => 'طابق اللون';

  @override
  String get btnMatchWord => 'طابق الكلمة';

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
}
