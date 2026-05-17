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
      'تظهر كلمة مع إخفاء حروف العلة الخاصة بها (A, E, I, O, U). خمن الكلمة الكاملة!';

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
  String get grammarPoliceTitle => 'شرطة القواعد';

  @override
  String get grammarPoliceSubtitle => 'حدد وصحح الأخطاء في جدار نصي متحرك.';

  @override
  String get grammarPoliceHowToPlay =>
      'ستتحرك الجمل للأعلى على الشاشة. يحتوي بعضها على أخطاء (تهجئة، قواعد، أو علامات ترقيم). اضغط على الجمل التي تحتوي على أخطاء لـ \'تصحيحها\'. لا تدع الكثير من الأخطاء تمر!';

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
}
