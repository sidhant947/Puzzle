// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'مركز الألغاز';

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
      'قسم الشبكة إلى بوليومينو بحيث يحتوي كل بوليومينو من الحجم N على الرقم N في جميع خلاياه. لا يمكن أن تكون البوليومينو من نفس الحجم متجاورة بشكل متعامد.';

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
  String get fractionMatchTitle => 'تطابق الكسور';

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
  String get visualStatisticalLearningTitle => 'انتهت اللعبة';

  @override
  String get orbitTapTitle => 'ضغط المدار';

  @override
  String get orbitTapSubtitle => 'اضغط عندما تتماشى الكرات مع البوابة';

  @override
  String get schulteTableTitle => 'تركيز رائع!';

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
  String get memoryMatrixTitle => 'تم الوصول للهدف!';

  @override
  String get memoryMatrixSubtitle => 'احفظ النمط واضغط على المربعات.';

  @override
  String get mentalAbacusTitle => 'بارع في المعداد!';

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
  String get verbalAnalogiesTitle => 'بارع في القياس!';

  @override
  String get verbalAnalogiesSubtitle => 'أكمل العلاقة';

  @override
  String get typingSpeedTitle => 'سرعة الكتابة';

  @override
  String get typingSpeedSubtitle =>
      'اكتب العبارة تماماً كما تظهر بأسرع ما يمكن!';

  @override
  String get wordLadderTitle => 'سلم الكلمات';

  @override
  String get wordLadderSubtitle => 'صل الكلمات بتغيير حرف واحد في كل مرة.';

  @override
  String get tangleFixTitle => 'تم فك الاشتباك!';

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
  String get wisconsinCardSortingTitle => 'انتهت اللعبة';

  @override
  String get wisconsinCardSortingSubtitle =>
      'طابق البطاقة بإحدى البطاقات الأربع أعلاه';

  @override
  String get nBackTitle => 'اختبار N-Back';

  @override
  String get nBackSubtitle =>
      'اضغط على طابق إذا كان الحرف الحالي يطابق المعروض قبل خطوتين.';

  @override
  String get rhythmMasterTitle => 'سيد الإيقاع';

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
  String get mirrorTracingTitle => 'تتبع المرآة!';

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
  String get paperFoldingTitle => 'طي الورق!';

  @override
  String get paperFoldingSubtitle => 'كيف سيبدو شكلها عند بسطها؟';

  @override
  String get waterSortTitle => 'أحسنت!';

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
  String get silhouetteMatchTitle => 'متطابق!';

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
}
