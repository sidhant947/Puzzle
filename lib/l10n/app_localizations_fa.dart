// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'مرکز پازل';

  @override
  String get home => 'خانه';

  @override
  String get settings => 'تنظیمات';

  @override
  String get playAgain => 'بازی مجدد';

  @override
  String get playNext => 'بازی بعدی';

  @override
  String get seeCompleted => 'مرور';

  @override
  String get finish => 'پایان';

  @override
  String get congrats => 'تبریک';

  @override
  String get perfectGradient => 'گرادیان عالی!';

  @override
  String get wellDone => 'آفرین';

  @override
  String get timeUp => 'زمان تمام شد!';

  @override
  String get completed => 'کامل شد!';

  @override
  String get score => 'امتیاز';

  @override
  String get timeLeft => 'زمان';

  @override
  String get trials => 'تلاش‌ها';

  @override
  String get numberRule => 'قانون عدد';

  @override
  String get colorRule => 'قانون رنگ';

  @override
  String get valid => 'معتبر';

  @override
  String get invalid => 'نامعتبر';

  @override
  String get even => 'زوج';

  @override
  String get odd => 'فرد';

  @override
  String get red => 'قرمز';

  @override
  String get green => 'سبز';

  @override
  String get blue => 'آبی';

  @override
  String get yes => 'بله';

  @override
  String get no => 'خیر';

  @override
  String get trueLabel => 'درست';

  @override
  String get falseLabel => 'نادرست';

  @override
  String get clear => 'پاک کردن';

  @override
  String get north => 'شمال';

  @override
  String get south => 'جنوب';

  @override
  String get east => 'شرق';

  @override
  String get west => 'غرب';

  @override
  String get target => 'هدف';

  @override
  String get moves => 'حرکات';

  @override
  String get trialMode => 'حالت تمرینی';

  @override
  String get trialModeDescription =>
      'حل ۲۰ مورد برای پایان به جای تایمر ۶۰ ثانیه‌ای';

  @override
  String get appearance => 'ظاهر';

  @override
  String get language => 'زبان';

  @override
  String get gameplay => 'گیم‌پلی';

  @override
  String get supportUs => 'حمایت از ما';

  @override
  String get systemLegal => 'سیستم و قوانین';

  @override
  String get games => 'بازی‌ها';

  @override
  String get solvedToday => 'امروز حل شد';

  @override
  String get searchGames => 'جستجوی بازی‌ها...';

  @override
  String get readyToStart => 'آماده شروع ورزش مغزی خود هستید؟';

  @override
  String get greatStart => 'شروع عالی! این روند را حفظ کنید.';

  @override
  String get onFire => 'فوق‌العاده! مغز شما این را دوست دارد.';

  @override
  String get incredible => 'باورنکردنی! شما استاد پازل هستید.';

  @override
  String get noGamesMatch => 'هیچ بازی با جستجوی شما مطابقت ندارد';

  @override
  String get categoryAll => 'همه';

  @override
  String get categoryAttention => 'تمرکز';

  @override
  String get categoryLogic => 'منطق';

  @override
  String get categoryMath => 'ریاضی';

  @override
  String get categoryWord => 'کلمات';

  @override
  String get categoryMemory => 'حافظه';

  @override
  String get categorySpatial => 'فضایی';

  @override
  String get themeLight => 'روشن';

  @override
  String get themeDark => 'تاریک';

  @override
  String get themeSystem => 'سیستم';

  @override
  String get starOnGithub => 'ستاره دادن در گیت‌هاب';

  @override
  String get sponsorOnGithub => 'اسپانسر شدن در گیت‌هاب';

  @override
  String get privacyPolicy => 'سیاست حریم خصوصی';

  @override
  String get termsOfService => 'شرایط خدمات';

  @override
  String get licenses => 'مجوزها';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return 'شما $maxTries فرصت دارید تا کلمه مخفی $wordLength حرفی را پیدا کنید.';
  }

  @override
  String wordFoundMessage(String word) {
    return 'کلمه با موفقیت پیدا شد: $word';
  }

  @override
  String gameOverMessage(String word) {
    return 'کلمه این بود: $word';
  }

  @override
  String get gameOver => 'پایان بازی';

  @override
  String get crosswordTitle => 'جدول کلمات';

  @override
  String get crosswordSubtitle =>
      'جدول را بر اساس راهنماهای ارائه شده با کلمات صحیح پر کنید.';

  @override
  String get wordSearchTitle => 'جستجوی کلمات';

  @override
  String get radicalRootsTitle => 'ریشه‌های رادیکالی';

  @override
  String get radicalRootsSubtitle =>
      'جذر یا ریشه سوم عدد داده شده را پیدا کنید. در صورت نیاز به نزدیک‌ترین عدد صحیح گرد کنید.';

  @override
  String get radicalRootsGoalReached => 'هدف محقق شد!';

  @override
  String get radicalRootsTimeUp => 'زمان تمام شد!';

  @override
  String radicalRootsScoreMessage(int score) {
    return 'شما $score ریشه را به درستی محاسبه کردید!';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return 'تمرین کنید! شما $score ریشه را محاسبه کردید.';
  }

  @override
  String get radicalRootsStart => 'شروع محاسبه';

  @override
  String get radicalRootsDescription =>
      'شما ۶۰ ثانیه فرصت دارید تا هر تعداد که می‌توانید حل کنید.';

  @override
  String get radicalRootsBest => 'بهترین';

  @override
  String get radicalRootsSeconds => '۶۰ ثانیه';

  @override
  String get romanArithmeticTitle => 'ریاضیات رومی';

  @override
  String get romanArithmeticSubtitle =>
      'مسائل جمع و تفریق را با استفاده از اعداد رومی حل کنید.';

  @override
  String get romanArithmeticGoalReached => 'سطح سِنتوریون!';

  @override
  String get romanArithmeticTimeUp => 'زمان تمام شد!';

  @override
  String romanArithmeticScoreMessage(int score) {
    return 'شما $score مسئله رومی را حل کردید!';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return 'آمدی، دیدی، پیروز شدی! شما $score مسئله را حل کردید.';
  }

  @override
  String get romanArithmeticStart => 'شروع ماموریت';

  @override
  String get romanArithmeticDescription =>
      'تبدیل و حل کنید. ۶۰ ثانیه فرصت دارید.';

  @override
  String get romanArithmeticBest => 'بهترین';

  @override
  String get romanArithmeticSeconds => '۶۰ ثانیه';

  @override
  String get wordSearchSubtitle =>
      'همه کلمات مخفی را در جدول پیدا کنید. برای انتخاب بکشید.';

  @override
  String get missingVowelsTitle => 'حروف صدادار گمشده';

  @override
  String get missingVowelsSubtitle =>
      'کلمه را با حروف صدادار مخفی شناسایی کنید.';

  @override
  String get missingVowelsWin => 'حروف صدادار بازیابی شدند!';

  @override
  String get missingVowelsHowToPlay =>
      'یک کلمه با حروف صدادار (A, E, I, O, U) مخفی نشان داده می‌شود. کلمه کامل را حدس بزنید!';

  @override
  String get wordScrambleTitle => 'کلمات درهم';

  @override
  String get wordScrambleSubtitle =>
      'روی حروف بزنید تا کلمه مخفی را مرتب کنید!';

  @override
  String get wordScrambleWin => 'کلمه رمزگشایی شد!';

  @override
  String get sudokuTitle => 'سودوکو';

  @override
  String get sudokuSubtitle =>
      'جدول را طوری پر کنید که هر سطر، ستون و مربع ۳x۳ شامل تمام اعداد ۱ تا ۹ باشد.';

  @override
  String get minesweeperTitle => 'مین‌روب';

  @override
  String get minesweeperSubtitle =>
      'همه مین‌ها را بدون منفجر کردنشان شناسایی کنید.';

  @override
  String get minesweeperWin => 'پیروزی!';

  @override
  String get minesweeperMines => 'مین‌ها';

  @override
  String get minesweeperStatus => 'وضعیت';

  @override
  String get minesweeperWon => 'برنده';

  @override
  String get minesweeperBoom => 'انفجار';

  @override
  String get minesweeperPlaying => 'در حال بازی';

  @override
  String get minesweeperReveal => 'نمایان کردن';

  @override
  String get minesweeperFlag => 'پرچم';

  @override
  String get game2048Title => '۲۰۴۸';

  @override
  String get game2048Subtitle =>
      'به هر جهتی بکشید تا کاشی‌ها را ادغام کنید و به کاشی ۲۰۴۸ برسید!';

  @override
  String get nonogramTitle => 'نونوگرام';

  @override
  String get nonogramSubtitle =>
      'تصویر مخفی را با استفاده از سرنخ‌های منطقی نمایان کنید.';

  @override
  String get nonogramWin => 'تصویر نمایان شد!';

  @override
  String get magnetsTitle => 'آهنرباها';

  @override
  String get magnetsSubtitle =>
      'آهنرباها را بر اساس تعداد قطب‌ها در جدول قرار دهید.';

  @override
  String get magnetsHowToPlay =>
      'ظروف به اندازه دومینو را با آهنرباهای \'+\' و \'-\' پر کنید یا آن‌ها را خالی بگذارید. سرنخ‌های سطر و ستون، تعداد کل هر قطب را در آن خط مشخص می‌کنند. قطب‌های یکسان نمی‌توانند به صورت متعامد مجاور باشند.';

  @override
  String get magnetsWinTitle => 'قطبیت متعادل شد!';

  @override
  String get magnetsWinMessage => 'همه آهنرباها به خوبی چیده شده‌اند!';

  @override
  String get lighthousesTitle => 'فانوس‌های دریایی';

  @override
  String get lighthousesSubtitle =>
      'کشتی‌ها را بر اساس سرنخ‌های فانوس دریایی قرار دهید.';

  @override
  String get lighthousesHowToPlay =>
      'کشتی‌های ۱x۱ را در جدول قرار دهید. فانوس‌های دریایی تعداد کل کشتی‌های قابل مشاهده به صورت افقی و عمودی را نشان می‌دهند. کشتی‌ها نباید با فانوس‌های دریایی یا یکدیگر تماس داشته باشند، حتی به صورت مورب.';

  @override
  String get lighthousesWinTitle => 'دریا امن است!';

  @override
  String get lighthousesWinMessage =>
      'همه فانوس‌های دریایی کشتی‌ها را به خوبی هدایت می‌کنند!';

  @override
  String get dominosaTitle => 'دومینوسا';

  @override
  String get dominosaSubtitle => 'همه دومینوهای پنهان را در جدول پیدا کنید.';

  @override
  String get dominosaHowToPlay =>
      'یک مجموعه کامل از دومینوها را روی جدولی از اعداد طوری بچینید که هر جفت عدد مجاور دقیقاً با یک دومینو پوشانده شود. هر جفت عدد فقط یک بار در مجموعه وجود دارد.';

  @override
  String get dominosaWinTitle => 'استاد دومینو!';

  @override
  String get dominosaWinMessage => 'هر دومینو پیدا و جایگذاری شده است!';

  @override
  String get skyscrapersTitle => 'آسمان‌خراش‌ها';

  @override
  String get skyscrapersSubtitle => 'جدول را با ارتفاع ساختمان‌ها پر کنید.';

  @override
  String get skyscrapersHowToPlay =>
      'جدول را با ارتفاع‌های (1-N) پر کنید طوری که هر سطر و ستون دقیقاً یک بار شامل هر ارتفاع باشد. سرنخ‌های لبه‌ها نشان می‌دهند که چه تعداد ساختمان از آن جهت قابل مشاهده است، ساختمان‌های بلندتر مانع دیده شدن ساختمان‌های کوتاه‌تر می‌شوند.';

  @override
  String get skyscrapersWinTitle => 'خط افق بازسازی شد!';

  @override
  String get skyscrapersWinMessage =>
      'همه ساختمان‌ها در موقعیت عالی قرار دارند!';

  @override
  String get nurikabeTitle => 'نوریکابه';

  @override
  String get nurikabeSubtitle => 'یک دریای متصل و جزایر جداگانه تشکیل دهید.';

  @override
  String get nurikabeHowToPlay =>
      'خانه‌ها را سایه بزنید تا یک «دریای» متصل واحد تشکیل شود (بدون بلوک‌های ۲x۲). خانه‌های سایه نزده «جزایر» را تشکیل می‌دهند که هر کدام دقیقاً شامل یک عدد است که نشان‌دهنده مساحت کل آن است.';

  @override
  String get nurikabeWinTitle => 'دریا جاری است!';

  @override
  String get nurikabeWinMessage => 'جزایر جدا شدند، دریا متصل شد!';

  @override
  String get fillominoTitle => 'فیلومینو';

  @override
  String get fillominoSubtitle =>
      'جدول را به پلی‌امینوهایی با اندازه‌های مشخص تقسیم کنید.';

  @override
  String get fillominoHowToPlay =>
      'جدول را به پلی‌امینوهایی تقسیم کنید طوری که هر پلی‌امینو به اندازه N، شامل عدد N در تمام خانه‌هایش باشد. پلی‌امینوهای هم‌اندازه نمی‌توانند به صورت متعامد مجاور باشند.';

  @override
  String get fillominoWinTitle => 'جدول تقسیم شد!';

  @override
  String get fillominoWinMessage => 'با منطق عالی چیده شد!';

  @override
  String get hitoriTitle => 'هیتوری';

  @override
  String get hitoriSubtitle => 'اعداد تکراری را در هر سطر و ستون سایه بزنید.';

  @override
  String get hitoriHowToPlay =>
      'خانه‌ها را طوری سایه بزنید که هیچ عددی بیش از یک بار در هیچ سطر یا ستونی ظاهر نشود. خانه‌های سایه‌دار نمی‌توانند مجاور باشند (به صورت متعامد) و تمام خانه‌های سایه نزده باید یک گروه متصل واحد را تشکیل دهند.';

  @override
  String get hitoriWinTitle => 'استاد هیتوری!';

  @override
  String get hitoriWinMessage => 'شما با موفقیت تمام تکرارها را حل کردید!';

  @override
  String get pathFinderTitle => 'مسیر یاب';

  @override
  String get pathFinderSubtitle => 'مسیر مخفی از S تا E را پیدا کنید.';

  @override
  String get pathFinderWin => 'مسیر فتح شد!';

  @override
  String get howToPlay => 'روش بازی';

  @override
  String get gotIt => 'فهمیدم';

  @override
  String get akariTitle => 'آکاری';

  @override
  String get akariSubtitle => 'همه خانه‌های سفید را روشن کنید';

  @override
  String get akariHowToPlay =>
      'لامپ‌ها را در خانه‌های سفید قرار دهید تا کل جدول روشن شود. لامپ‌ها سطر و ستون خود را تا رسیدن به دیوار روشن می‌کنند. هیچ دو لامپی نباید به هم بتابند. دیوارهای شماره‌دار نشان می‌دهند که دقیقاً چند لامپ باید در خانه‌های مجاور (بالا، پایین، چپ، راست) قرار گیرد.';

  @override
  String get akariWinTitle => 'روشن شد!';

  @override
  String get akariWinMessage => 'همه چیز به خوبی روشن شده است.';

  @override
  String get arithmeticChainTitle => 'محاسبه زنجیره‌ای';

  @override
  String get arithmeticChainSubtitle => 'مجموع جاری را در ذهن خود محاسبه کنید';

  @override
  String get arithmeticChainWinTitle => 'ارتقای سطح!';

  @override
  String get arithmeticChainWinMessage => 'محاسبات ذهنی شما تیز است!';

  @override
  String get arithmeticChainLoseTitle => 'تلاش مجدد';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return 'پاسخ صحیح $answer بود.';
  }

  @override
  String get arithmeticChainStart => 'شروع';

  @override
  String get arithmeticChainNext => 'بعدی';

  @override
  String get attentionalBlinkTitle => 'پلک‌زدن توجهی';

  @override
  String get attentionalBlinkSubtitleWatch => 'مراقب اعداد باشید';

  @override
  String get attentionalBlinkSubtitleInput => 'دو عددی که دیدید را وارد کنید';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return 'شما $score هدف را کسب کردید!';
  }

  @override
  String get balanceScaleTitle => 'ترازوی تعادل';

  @override
  String get balanceScaleSubtitle =>
      'وزن آخرین مورد را بر اساس ترازوها استنتاج کنید.';

  @override
  String get balanceScaleWinTitle => 'متعادل!';

  @override
  String get balanceScaleWinMessage => 'شما وزن را به درستی استنتاج کردید!';

  @override
  String get balanceScaleLoseTitle => 'نامتعادل';

  @override
  String get balanceScaleLoseMessage =>
      'دوباره امتحان کنید تا تعادل صحیح را پیدا کنید.';

  @override
  String get balanceScaleBack => 'بازگشت';

  @override
  String get balanceScaleSubmit => 'ارسال';

  @override
  String get binaryPuzzleTitle => 'پازل باینری';

  @override
  String get binaryPuzzleSubtitle =>
      'با 0 و 1 پر کنید. حداکثر دو رقم یکسان مجاور هم. تعداد مساوی 0 و 1 در هر سطر و ستون.';

  @override
  String get binaryPuzzleWinTitle => 'آفرین';

  @override
  String get binaryPuzzleWinMessage =>
      'شما پازل باینری را با منطق عالی حل کردید!';

  @override
  String get blockEscapeTitle => 'فرار بلوک';

  @override
  String get blockEscapeSubtitle =>
      'بلوک‌ها را بلغزانید تا مسیری برای رسیدن بلوک اصلی به خروجی باز شود.';

  @override
  String get blockEscapeWinTitle => 'فرار!';

  @override
  String get blockEscapeWinMessage =>
      'شما با موفقیت مسیر را برای بلوک اصلی باز کردید!';

  @override
  String get boxCompletionTitle => 'تکمیل جعبه';

  @override
  String get boxCompletionSubtitle => 'کدام مکعب را می‌توان ساخت؟';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return 'شما $score پاسخ صحیح از $totalTrials تلاش داشتید!';
  }

  @override
  String get boxCompletionOptions => 'گزینه‌ها';

  @override
  String get bridgesTitle => 'پل‌ها';

  @override
  String get bridgesSubtitle =>
      'جزایر را با پل‌ها وصل کنید. هر جزیره به تعداد مشخصی پل نیاز دارد. پل‌ها نباید از روی هم عبور کنند.';

  @override
  String get bridgesWinTitle => 'متصل شد!';

  @override
  String get bridgesWinMessage => 'شما با موفقیت همه جزایر را وصل کردید!';

  @override
  String get calculationSprintTitle => 'سرعت محاسبات';

  @override
  String get calculationSprintSubtitle =>
      'تا حد امکان در ۶۰ ثانیه معادله حل کنید.';

  @override
  String get calculationSprintGoalReached => 'هدف محقق شد!';

  @override
  String get calculationSprintTimeUp => 'زمان تمام شد';

  @override
  String calculationSprintScoreMessage(int score) {
    return 'سرعت محاسبات عالی! شما $score امتیاز کسب کردید.';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return 'شما $score امتیاز کسب کردید. سعی کنید رکورد خود را بزنید!';
  }

  @override
  String get calculationSprintBest => 'بهترین';

  @override
  String get calculationSprintSeconds => '۶۰ ثانیه';

  @override
  String get calculationSprintDescription =>
      'معادلات را سریع حل کنید.\nپاسخ‌های اشتباه ۳ ثانیه کسر می‌کنند!';

  @override
  String get calculationSprintStart => 'شروع مسابقه';

  @override
  String get categoryFluencyTitle => 'روانی دسته‌بندی';

  @override
  String get categoryFluencySubtitle => 'موارد متعلق به دسته را وارد کنید';

  @override
  String get categoryFluencyExpert => 'استاد روانی کلمات!';

  @override
  String get categoryFluencyTimeUp => 'زمان تمام شد!';

  @override
  String get categoryFluencyWinMessage => 'شما دایره لغات وسیعی دارید!';

  @override
  String categoryFluencyFoundMessage(int count) {
    return 'شما $count کلمه پیدا کردید.';
  }

  @override
  String get categoryFluencyCategoryLabel => 'دسته:';

  @override
  String get categoryFluencyEnterItem => 'موردی وارد کنید...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target کلمه';
  }

  @override
  String get changeBlindnessTitle => 'کوری تغییر';

  @override
  String get changeBlindnessSubtitle => 'مورد در حال تغییر را پیدا کنید';

  @override
  String changeBlindnessScore(int score) {
    return 'امتیاز: $score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return 'شما $score تغییر پیدا کردید!';
  }

  @override
  String get choiceRtTitle => 'زمان واکنش انتخابی';

  @override
  String get choiceRtSubtitle => 'روی مربع فعال با بیشترین سرعت ممکن بزنید';

  @override
  String choiceRtAvgMessage(String avg) {
    return 'میانگین زمان واکنش شما: $avg میلی‌ثانیه';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return 'زمان باقی‌مانده: $time ثانیه';
  }

  @override
  String choiceRtTaps(int count) {
    return 'ضربه ها: $count';
  }

  @override
  String get colorFloodTitle => 'سیل رنگ';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return 'حرکات: $moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => 'سیل موفقیت‌آمیز!';

  @override
  String get colorFloodDryLand => 'زمین خشک...';

  @override
  String get colorFloodWinMessage => 'شما کل جدول را با رنگ اشباع کردید!';

  @override
  String get colorFloodLoseMessage => 'حرکات شما تمام شد. دوباره امتحان کنید!';

  @override
  String get colorMatchTitle => 'تطبیق رنگ';

  @override
  String get colorMatchSubtitle =>
      'لغزنده‌ها را تنظیم کنید تا با رنگ هدف تا حد امکان مطابقت داشته باشد.';

  @override
  String get colorMatchTarget => 'هدف';

  @override
  String get colorMatchYours => 'مال شما';

  @override
  String get colorMatchCheck => 'بررسی تطبیق';

  @override
  String get colorMatchResult => 'نتیجه تطبیق';

  @override
  String colorMatchAccuracy(String accuracy) {
    return 'دقت شما: $accuracy%';
  }

  @override
  String get corsiBlocksTitle => 'بلوک‌های کورسی';

  @override
  String get corsiBlocksSubtitle =>
      'روشن شدن بلوک‌ها را تماشا کنید و با همان ترتیب روی آن‌ها بزنید.';

  @override
  String get corsiBlocksWinTitle => 'استاد فضایی!';

  @override
  String get corsiBlocksLoseTitle => 'گم‌شده در فضا';

  @override
  String corsiBlocksMessage(int score, int span) {
    return 'شما $score توالی را به خاطر آوردید! دامنه حافظه فضایی شما به $span رسید.';
  }

  @override
  String get corsiBlocksWatch => 'الگو را تماشا کنید';

  @override
  String get corsiBlocksRepeat => 'الگو را تکرار کنید';

  @override
  String get corsiBlocksExcellent => 'عالی!';

  @override
  String get corsiBlocksSpan => 'دامنه';

  @override
  String get crownTitle => 'تاج';

  @override
  String get crownSubtitle =>
      'در هر سطر، ستون و ناحیه رنگی یک تاج قرار دهید. تاج‌ها نباید مجاور هم باشند، حتی به صورت مورب.';

  @override
  String get crownCrowned => 'تاج‌گذاری شد!';

  @override
  String get crownSuccess =>
      'همه تاج‌ها با موفقیت و با منطق عالی قرار داده شدند.';

  @override
  String get cryptogramTitle => 'کریپتوگرام';

  @override
  String get cryptogramSubtitle =>
      'حروف را برای رمزگشایی پیام مخفی اختصاص دهید! هر حرف رمزگذاری شده نشان‌دهنده یک حرف واقعی است.';

  @override
  String get cryptogramBroken => 'کد شکسته شد!';

  @override
  String get cryptogramEncrypted => 'رمزگذاری شده';

  @override
  String get cryptogramSuccess => 'شما پیام را به طور کامل رمزگشایی کردید.';

  @override
  String get cryptogramTryAgain => 'دوباره برای شکستن رمزگذاری امتحان کنید.';

  @override
  String get digitSpanReverseTitle => 'دامنه معکوس';

  @override
  String get digitSpanReverseSubtitleMemorize => 'ارقام را حفظ کنید';

  @override
  String get digitSpanReverseSubtitleEnter =>
      'ارقام را به ترتیب معکوس وارد کنید';

  @override
  String get digitSpanReverseWinTitle => 'ارتقای سطح!';

  @override
  String get digitSpanReverseWinMessage => 'حافظه کاری شما تحسین‌برانگیز است!';

  @override
  String get digitSpanReverseLoseTitle => 'تلاش مجدد';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return 'توالی معکوس صحیح $sequence بود.';
  }

  @override
  String get dividedAttentionTitle => 'توجه تقسیم‌شده';

  @override
  String get dividedAttentionSubtitle => 'چپ برای ستاره ⭐ | راست برای قرمز 🔴';

  @override
  String get dividedAttentionGameOverTitle => 'تمرکز از دست رفت';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return 'انجام چند کار همزمان سخت است! امتیاز شما $score بود.';
  }

  @override
  String dividedAttentionScore(int score) {
    return 'امتیاز: $score';
  }

  @override
  String get doubleNBackTitle => 'ان-بک دوگانه';

  @override
  String doubleNBackSubtitle(int n) {
    return 'محرک‌ها را با $n مرحله قبل مطابقت دهید';
  }

  @override
  String get doubleNBackGameOverTitle => 'پایان بازی';

  @override
  String doubleNBackGameOverMessage(int score) {
    return 'شما $score امتیاز در ان-بک دوگانه کسب کردید!';
  }

  @override
  String doubleNBackScore(int score) {
    return 'امتیاز: $score';
  }

  @override
  String get doubleNBackPositionMatch => 'تطبیق موقعیت';

  @override
  String get doubleNBackLetterMatch => 'تطبیق حرف';

  @override
  String get faceNameAssociationTitle => 'چهره-نام';

  @override
  String get faceNameAssociationSubtitleStudy => 'نام هر چهره را حفظ کنید';

  @override
  String get faceNameAssociationSubtitleTest => 'این کیست؟';

  @override
  String get faceNameAssociationPerfect => 'عالی!';

  @override
  String get faceNameAssociationGameOver => 'پایان بازی';

  @override
  String get faceNameAssociationWinMessage =>
      'شما حافظه خوبی برای چهره‌ها و نام‌ها دارید!';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return 'شما $correct از $total مورد را درست زدید.';
  }

  @override
  String get faceNameAssociationStartTest => 'شروع آزمون';

  @override
  String get flankerTestWinTitle => 'تمرکز لیزری!';

  @override
  String get flankerTestLoseTitle => 'حواس‌پرتی';

  @override
  String flankerTestScoreMessage(int score) {
    return 'شما $score مورد را به درستی زدید!';
  }

  @override
  String get flankerTestTitle => 'آزمون فلنکر';

  @override
  String get flankerTestSubtitle =>
      'جهت فلش مرکزی را نشان دهید، فلش‌های کناری را نادیده بگیرید.';

  @override
  String get flankerTestLeft => 'چپ';

  @override
  String get flankerTestRight => 'راست';

  @override
  String get fractionMatchTitle => 'تطبیق کسر';

  @override
  String get fractionMatchSubtitle => 'تصویر را با کسر آن مطابقت دهید';

  @override
  String get fractionMatchLoseTitle => 'عدم تطبیق کسر';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return 'پاسخ صحیح $correctAnswer بود.';
  }

  @override
  String get goNoGoTitle => 'برو / نرو';

  @override
  String get goNoGoSubtitle => 'برای سبز بزنید، قرمز را نادیده بگیرید!';

  @override
  String get goNoGoLoseTitle => 'واکنش متوقف شد';

  @override
  String get goNoGoLoseMessage => 'کنترل بازدارندگی شما در حال آزمایش است!';

  @override
  String get goNoGoTapAnywhere => 'برای شروع هر جایی را لمس کنید';

  @override
  String get groceryListTitle => 'لیست خرید';

  @override
  String get groceryListSubtitleMemorize =>
      'موارد و دسته‌بندی آن‌ها را حفظ کنید';

  @override
  String get groceryListSubtitleTest => 'این مورد متعلق به کدام دسته بود؟';

  @override
  String get groceryListWinTitle => 'استاد خرید!';

  @override
  String get groceryListLoseTitle => 'چیزی فراموش شده؟';

  @override
  String groceryListScoreMessage(int score) {
    return 'شما $score امتیاز در لیست خرید کسب کردید!';
  }

  @override
  String get groceryListReady => 'آماده‌ام';

  @override
  String get groceryListWhereBelong => 'این متعلق به کجاست؟';

  @override
  String get hueSortTitle => 'مرتب‌سازی رنگ';

  @override
  String get hueSortSubtitle =>
      'کاشی‌ها را جابجا کنید تا انتقالی نرم بین رنگ‌های گوشه ایجاد شود. نقاط نشان‌دهنده کاشی‌های ثابت هستند.';

  @override
  String get hueSortWinTitle => 'گرادیان عالی!';

  @override
  String get hueSortWinMessage => 'شما طیف رنگی را به طور کامل مرتب کردید!';

  @override
  String hueSortWrongTiles(int count) {
    return 'کاشی‌ها در موقعیت اشتباه: $count';
  }

  @override
  String get kenkenTitle => 'کن‌کن';

  @override
  String get kenkenWinTitle => 'نابغه!';

  @override
  String get kenkenLoseTitle => 'پایان بازی';

  @override
  String get kenkenWinMessage => 'شما پازل کن‌کن را حل کردید!';

  @override
  String get kenkenLoseMessage => 'قوانین سطر/ستون و قفس را بررسی کنید.';

  @override
  String kenkenSubtitle(int size) {
    return 'اعداد ۱ تا $size را بدون تکرار در سطر/ستون پر کنید';
  }

  @override
  String get letterCancellationTitle => 'حذف حروف';

  @override
  String get letterCancellationTitleFull => 'آزمون حذف حروف';

  @override
  String letterCancellationScoreMessage(int score) {
    return 'شما $score حرف پیدا کردید!';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return 'همه حروف \"$target\" را پیدا کنید';
  }

  @override
  String get letterCancellationFound => 'پیدا شد';

  @override
  String get letterCancellationTime => 'زمان';

  @override
  String get lightsOutTitle => 'خاموشی چراغ‌ها';

  @override
  String get lightsOutSubtitle =>
      'زدن روی یک کاشی، آن و همسایگان مجاورش را تغییر می‌دهد. برای حل، همه چراغ‌ها را خاموش کنید.';

  @override
  String get lightsOutWinTitle => 'پازل حل شد!';

  @override
  String get lightsOutWinMessage => 'شما با موفقیت همه چراغ‌ها را خاموش کردید!';

  @override
  String get symmetryTitle => 'تقارن';

  @override
  String get symmetrySubtitle =>
      'الگوی سمت چپ را روی جدول خالی سمت راست قرینه کنید.';

  @override
  String get semanticLinkTitle => 'پیوند معنایی';

  @override
  String get semanticLinkSubtitle =>
      'کلمه‌ای را پیدا کنید که هر سه را به هم وصل می‌کند';

  @override
  String get reflexTapTitle => 'ضربه واکنشی';

  @override
  String get visualStatisticalLearningTitle => 'پایان بازی';

  @override
  String get orbitTapTitle => 'ضربه مداری';

  @override
  String get orbitTapSubtitle => 'وقتی توپ‌ها با دروازه تراز شدند ضربه بزنید';

  @override
  String get schulteTableTitle => 'تمرکز عالی!';

  @override
  String get multipleObjectTrackingTitle => 'ردیاب اشیاء';

  @override
  String get multipleObjectTrackingSubtitle =>
      'اشیاء برجسته شده را تماشا کنید. آن‌ها را در حین حرکت دنبال کنید، سپس انتخابشان کنید.';

  @override
  String get sdmtTitle => 'آزمون Sdmt';

  @override
  String get sdmtSubtitle =>
      'از کلید بالا برای پیدا کردن رقم مربوط به نماد نشان داده شده استفاده کنید.';

  @override
  String get memoryMatrixTitle => 'هدف محقق شد!';

  @override
  String get memoryMatrixSubtitle => 'الگو را حفظ کرده و روی کاشی‌ها بزنید.';

  @override
  String get mentalAbacusTitle => 'استاد چرتکه!';

  @override
  String get mentalAbacusSubtitle => 'با استفاده از سوروبان حل کنید';

  @override
  String get spellingSprintTitle => 'سرعت هجی';

  @override
  String get spellingSprintSubtitle =>
      'با زمان رقابت کنید تا هر تعداد کلمه که می‌توانید هجی کنید.';

  @override
  String get stopSignalTitle => 'سیگنال توقف';

  @override
  String get stopSignalSubtitle =>
      'به جهت فلش ضربه بزنید، اما اگر فلش قرمز شد فوراً متوقف شوید.';

  @override
  String get staircaseMemoryTitle => 'حافظه پلکانی';

  @override
  String get vigilanceTaskTitle => 'تست هوشیاری';

  @override
  String get vigilanceTaskSubtitle =>
      'وقتی عقربه از یک موقعیت پرش کرد، دکمه را بزنید';

  @override
  String get logicalSyllogismsTitle => 'قیاس‌های منطقی';

  @override
  String get logicalSyllogismsSubtitle =>
      'آیا نتیجه‌گیری از نظر منطقی معتبر است؟';

  @override
  String get mathPathTitle => 'مسیر ریاضی';

  @override
  String get mathPathSubtitle =>
      'مسیری را پیدا کنید که دقیقاً با مجموع هدف برابر باشد.';

  @override
  String get sternbergTaskTitle => 'تست استرنبرگ';

  @override
  String get sternbergTaskMemorize => 'حروف را حفظ کنید';

  @override
  String get sternbergTaskWasLetterSet => 'آیا این حرف در مجموعه بود؟';

  @override
  String sternbergTaskScore(int score) {
    return 'شما $score امتیاز در تست استرنبرگ کسب کردید!';
  }

  @override
  String get verbalAnalogiesTitle => 'استاد شباهت!';

  @override
  String get verbalAnalogiesSubtitle => 'رابطه را کامل کنید';

  @override
  String get typingSpeedTitle => 'سرعت تایپ';

  @override
  String get typingSpeedSubtitle =>
      'عبارت را دقیقاً همان‌طور که نشان داده شده با بیشترین سرعت ممکن تایپ کنید!';

  @override
  String get wordLadderTitle => 'نردبان کلمات';

  @override
  String get wordLadderSubtitle =>
      'کلمات را با تغییر یک حرف در هر مرحله به هم وصل کنید.';

  @override
  String get tangleFixTitle => 'رفع گره!';

  @override
  String get tangleFixSubtitle =>
      'خطوط را طوری باز کنید که هیچ‌کدام با هم تلاقی نداشته باشند';

  @override
  String get oddRotationTitle => 'چرخش متفاوت';

  @override
  String get oddRotationSubtitle =>
      'یکی از این‌ها قرینه شده است. می‌توانید آن را پیدا کنید؟';

  @override
  String get towerOfLondonTitle => 'برج لندن';

  @override
  String get towerOfLondonSubtitle => 'با پیکربندی هدف مطابقت دهید';

  @override
  String get symbolicFlankerTitle => 'فلنکر نمادین';

  @override
  String get symbolicFlankerSubtitle => 'روی نماد مرکزی تمرکز کنید';

  @override
  String get stroopTestTitle => 'تست استروپ';

  @override
  String get stroopTestSubtitle =>
      'رنگ جوهر کلمه نشان داده شده را شناسایی کنید. معنای واقعی کلمه را نادیده بگیرید!';

  @override
  String get wisconsinCardSortingTitle => 'پایان بازی';

  @override
  String get wisconsinCardSortingSubtitle =>
      'کارت را با یکی از چهار کارت بالا مطابقت دهید';

  @override
  String get nBackTitle => 'تست ان-بک';

  @override
  String get nBackSubtitle =>
      'اگر حرف فعلی با حرفی که ۲ مرحله قبل نشان داده شده مطابقت دارد، روی MATCH بزنید.';

  @override
  String get rhythmMasterTitle => 'استاد ریتم';

  @override
  String get rhythmMasterSubtitle => 'هماهنگ با ضربان ضربه بزنید';

  @override
  String get pixelMimicTitle => 'تقلید پیکسلی';

  @override
  String get targetNumberTitle => 'هدف ۲۴';

  @override
  String targetNumberSubtitle(int target) {
    return 'از هر ۴ عدد برای رسیدن به $target استفاده کنید';
  }

  @override
  String get mirrorTracingTitle => 'ترسیم عالی!';

  @override
  String get mirrorTracingSubtitle =>
      'ستاره را ترسیم کنید! کنترل‌ها معکوس هستند.';

  @override
  String get wordSurgeTitle => 'موج کلمات';

  @override
  String get wordSurgeSubtitle => 'مترادف‌ها و متضادها';

  @override
  String get perspectiveTakingTitle => 'دیدگاه‌گیری';

  @override
  String get perspectiveTakingTopDownView => 'نمای بالا به پایین';

  @override
  String get perspectiveTakingChoosePerspective => 'دیدگاه را انتخاب کنید';

  @override
  String get perspectiveTakingCongrats =>
      'شما دید دقیقی برای روابط فضایی دارید.';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return 'کدام نما از جهت $targetDirName است؟';
  }

  @override
  String get paperFoldingTitle => 'کمال تاشده!';

  @override
  String get paperFoldingSubtitle => 'وقتی باز شود چگونه به نظر می‌رسد؟';

  @override
  String get waterSortTitle => 'آفرین!';

  @override
  String get waterSortSubtitle =>
      'رنگ‌ها را طوری مرتب کنید که هر لوله فقط شامل یک رنگ باشد.';

  @override
  String get numericalEstimationTitle => 'تخمین عددی';

  @override
  String get numericalEstimationSubtitle =>
      'نزدیک‌ترین پاسخ را سریع انتخاب کنید!';

  @override
  String get lockPatternTitle => 'الگوی قفل';

  @override
  String get lockPatternSubtitle =>
      'الگوی مخفی را پیدا کنید. هر حدس بازخوردی درباره موقعیت و نقاط می‌دهد.';

  @override
  String get primeHunterTitle => 'شکارچی اعداد اول';

  @override
  String get primeHunterSubtitle => 'چپ برای اول | راست برای مرکب';

  @override
  String get tracePathTitle => 'ترسیم مسیر';

  @override
  String get tracePathSubtitle => 'مسیر هدف را تا حد امکان دقیق دنبال کنید';

  @override
  String get ruleSwitcherTitle => 'تعویض‌گر قانون';

  @override
  String get ruleSwitcherSubtitle => 'قانون فعلی را اعمال کنید';

  @override
  String get choiceReactionTimeTitle => 'زمان واکنش انتخابی';

  @override
  String get pathRecallTitle => 'یادآوری مسیر';

  @override
  String get switchTaskTitle => 'تعویض کار';

  @override
  String get switchTaskSubtitle =>
      'به قانون توجه کنید! بین تطبیق شکل و تطبیق رنگ جابجا می‌شود.';

  @override
  String get mentalRotationTitle => 'چرخش ذهنی';

  @override
  String get mentalRotationSubtitle =>
      'آیا این اشکال یکسان هستند و فقط چرخیده‌اند؟';

  @override
  String get missingOperatorTitle => 'ترکیب عملگرها';

  @override
  String get missingOperatorSubtitle =>
      'جاهای خالی را برای تکمیل معادله پر کنید';

  @override
  String get wordMastermindTitle => 'استاد کلمات';

  @override
  String get wordMastermindSubtitle =>
      'کد ۴ حرفی را بشکنید! گاوها (B) جای درست، گوساله‌ها (C) جای اشتباه هستند.';

  @override
  String get simonSequenceTitle => 'توالی';

  @override
  String get symbolLogicTitle => 'منطق نمادها';

  @override
  String get symbolLogicSubtitle =>
      'معادلات تصویری را برای یافتن مقدار هر نماد حل کنید. نتیجه آخرین معادله چیست؟';

  @override
  String get silhouetteMatchTitle => 'منطبق شد!';

  @override
  String get silhouetteMatchSubtitle => 'کدام سایه با این شیء مطابقت دارد؟';

  @override
  String get operationSpanTitle => 'دامنه عملیات';

  @override
  String get operationSpanMathPhase => 'آیا معادله درست است؟';

  @override
  String get operationSpanLetterPhase => 'حرف را به خاطر بسپارید';

  @override
  String get operationSpanRecallPhase => 'حروف را به ترتیب یادآوری کنید';

  @override
  String get operationSpanRoundComplete => 'دور کامل شد!';

  @override
  String operationSpanScore(int score) {
    return 'شما $score امتیاز در دامنه عملیات کسب کردید!';
  }

  @override
  String get slidePuzzleTitle => 'پازل کشویی';

  @override
  String get slidePuzzleNewGame => 'بازی جدید';

  @override
  String get slidePuzzleInstructions =>
      'کاشی‌ها را با لغزاندن به فضای خالی به ترتیب عددی مرتب کنید.';

  @override
  String get slidePuzzleTileSlider => 'لغزنده کاشی';

  @override
  String get slidePuzzleCongrats => 'شما با موفقیت همه کاشی‌ها را مرتب کردید.';

  @override
  String get visualSearchTitle => 'جستجوی بصری';

  @override
  String get visualSearchSubtitle => 'نماد منحصر به فرد را در جدول پیدا کنید';

  @override
  String get trailMakingTitle => 'مسیرسازی';

  @override
  String get trailMakingSubtitle =>
      'اعداد را به ترتیب (۱ -> ۲ -> ۳...) با بیشترین سرعت ممکن وصل کنید.';

  @override
  String get matrixReasoningTitle => 'استدلال ماتریسی';

  @override
  String get matrixReasoningSubtitle => 'الگو را در جدول ۳x۳ کامل کنید';

  @override
  String get tentsAndTreesTitle => 'چادرها و درختان';

  @override
  String get tentsAndTreesSubtitle =>
      'چادرها را کنار درختان قرار دهید. اعداد نشان می‌دهند که در هر سطر/ستون چند چادر وجود دارد. چادرها نباید با هم تماس داشته باشند.';

  @override
  String get quickMathTitle => 'ریاضی سریع';

  @override
  String get magicSquaresTitle => 'مربع جادویی';

  @override
  String magicSquaresSubtitle(int targetSum) {
    return 'هر سطر، ستون و قطر باید مجموع $targetSum را داشته باشد';
  }

  @override
  String get objectShuffleTitle => 'جابجایی اشیاء';

  @override
  String get pipesTitle => 'لوله‌ها';

  @override
  String get pipesSubtitle => 'نقاط رنگی مشابه را با لوله‌ها وصل کنید.';

  @override
  String get oddOneOutTitle => 'مورد متفاوت';

  @override
  String get oddOneOutSubtitle => 'کاشی با رنگ متفاوت را پیدا کنید.';

  @override
  String get einsteinRiddleTitle => 'معمای اینشتین';

  @override
  String get einsteinRiddleSubtitle =>
      'از سرنخ‌ها برای استنتاج ویژگی‌های هر خانه استفاده کنید.';

  @override
  String get einsteinRiddleHowToPlay =>
      'هر خانه ویژگی‌های منحصر به فردی دارد (رنگ، ملیت، حیوان خانگی و غیره). از سرنخ‌های ارائه شده برای پر کردن جدول و یافتن راه حل کامل استفاده کنید.';

  @override
  String get einsteinRiddleColor => 'رنگ';

  @override
  String get einsteinRiddleNationality => 'ملیت';

  @override
  String get einsteinRiddleDrink => 'نوشیدنی';

  @override
  String get einsteinRiddlePet => 'حیوان خانگی';

  @override
  String get einsteinRiddleSmoke => 'دخیانیات';

  @override
  String get einsteinRiddleHouse => 'خانه';

  @override
  String get mirrorImageTitle => 'تصویر آینه‌ای';

  @override
  String get mirrorImageSubtitle => 'انعکاس آینه‌ای صحیح را شناسایی کنید.';

  @override
  String get mirrorImageHowToPlay =>
      'به شکل نگاه کنید و انعکاس آینه‌ای صحیح آن را از گزینه‌های ارائه شده انتخاب کنید.';

  @override
  String get mentalMappingTitle => 'نقشه‌برداری ذهنی';

  @override
  String get mentalMappingSubtitle =>
      'جهت‌ها را دنبال کنید و مقصد را پیدا کنید.';

  @override
  String get mentalMappingHowToPlay =>
      'توالی از جهت‌ها (شمال، جنوب، شرق، غرب) به شما نشان داده می‌شود. این مراحل را از مرکز جدول در ذهن دنبال کنید و مقصد نهایی را انتخاب کنید.';

  @override
  String get memoryPalaceTitle => 'کاخ حافظه';

  @override
  String get memoryPalaceSubtitle =>
      'به خاطر بسپارید کدام کلمه در کدام مکان بود.';

  @override
  String get memoryPalaceHowToPlay =>
      'مجموعه‌ای از کلمات در مکان‌های مختلف جدول ظاهر می‌شوند. موقعیت آن‌ها را حفظ کنید. سپس از شما خواسته می‌شود کلمات را در مکان‌های اصلی خود قرار دهید.';

  @override
  String get countingSheepTitle => 'شمارش گوسفندان';

  @override
  String get countingSheepSubtitle => 'چند گوسفند دیدید؟';

  @override
  String get countingSheepHowToPlay =>
      'گوسفندان به سرعت از صفحه عبور می‌کنند. هنگام عبور آن‌ها را بشمارید و تعداد کل را در پایان وارد کنید.';

  @override
  String get faceTraitAssociationTitle => 'چهره-ویژگی';

  @override
  String get faceTraitAssociationSubtitle => 'ویژگی‌های هر چهره را حفظ کنید';

  @override
  String get faceTraitAssociationHowToPlay =>
      'چند چهره به شما نشان داده می‌شود که هر کدام دارای نام، شغل و سرگرمی هستند. این تداعی‌ها را حفظ کنید. بعداً از شما خواسته می‌شود ویژگی‌های خاص هر چهره را به یاد آورید.';

  @override
  String get mentalCalendarTitle => 'تقویم ذهنی';

  @override
  String get mentalCalendarSubtitle => 'روز هفته را محاسبه کنید';

  @override
  String get mentalCalendarHowToPlay =>
      'یک تاریخ تصادفی نشان داده می‌شود. از محاسبات ذهنی (یا الگوریتم روز قیامت) برای تعیین اینکه آن تاریخ در چه روزی از هفته است استفاده کنید.';

  @override
  String get vocabularyBuilderTitle => 'واژه‌ساز';

  @override
  String get vocabularyBuilderSubtitle =>
      'مترادف‌ها و متضادها را تحت فشار زمان مطابقت دهید.';

  @override
  String get vocabularyBuilderHowToPlay =>
      'یک کلمه هدف و یک رابطه (مترادف یا متضاد) به شما نشان داده می‌شود. کلمه صحیح را از گزینه‌ها انتخاب کنید. سریع باشید، زمان در حال گذر است!';

  @override
  String get correct => 'درست';

  @override
  String get incorrect => 'نادرست';

  @override
  String get grammarPoliceTitle => 'پلیس دستور زبان';

  @override
  String get grammarPoliceSubtitle =>
      'تشخیص دهید که آیا جمله از نظر دستوری صحیح است یا دارای خطا است.';

  @override
  String get grammarPoliceHowToPlay =>
      'یک جمله در وسط صفحه ظاهر می‌شود. تصمیم بگیرید که آیا از نظر دستوری صحیح است یا دارای خطا است. اگر درست است روی «درست» و اگر اشتباهی مشاهده کردید روی «نادرست» ضربه بزنید. تمام جان‌های خود را از دست ندهید!';

  @override
  String get reverseStroopTitle => 'استروپ معکوس';

  @override
  String get reverseStroopSubtitle =>
      'تغییری در تست استروپ که در آن تمرکز جابجا می‌شود.';

  @override
  String get reverseStroopHowToPlay =>
      'به دستورالعمل توجه کنید! اگر \'TEXT\' گفت، معنای کلمه را مطابقت دهید. اگر \'COLOR\' گفت، رنگ جوهر را مطابقت دهید. قوانین برای آزمایش تمرکز شما به طور مکرر تغییر می‌کنند.';

  @override
  String get game2048Instruction => 'برای ادغام به هر جهتی بکشید';

  @override
  String get fibonacciMergeTitle => 'ادغام فیبوناچی';

  @override
  String get fibonacciMergeSubtitle =>
      'اعداد متوالی فیبوناچی (۱، ۱، ۲، ۳، ۵، ۸، ۱۳...) را ادغام کنید.';

  @override
  String get sequenceSleuthTitle => 'کارآگاه توالی';

  @override
  String get sequenceSleuthSubtitle => 'عدد مفقود را در توالی ریاضی پیدا کنید.';

  @override
  String get divisibilityDashTitle => 'سرعت بخش‌پذیری';

  @override
  String get divisibilityDashSubtitle =>
      'همه مقسوم‌علیه‌های تک‌رقمی (۲-۹) را برای عدد داده شده لمس کنید.';

  @override
  String get percentagePeakTitle => 'اوج درصد';

  @override
  String get percentagePeakSubtitle => 'محاسبات ذهنی درصد را سریع حل کنید.';

  @override
  String get vennNumbersTitle => 'اعداد ون';

  @override
  String get vennNumbersSubtitle =>
      'اعداد را در نواحی صحیح نمودار ون دسته‌بندی کنید.';

  @override
  String get commonDenominatorTitle => 'مخرج مشترک';

  @override
  String get commonDenominatorSubtitle =>
      'بزرگترین مقسوم‌علیه مشترک یا کوچکترین مضرب مشترک را پیدا کنید.';

  @override
  String get angleFinderTitle => 'زاویه‌یاب';

  @override
  String get angleFinderSubtitle =>
      'زاویه مفقود را در مسئله هندسی محاسبه کنید.';

  @override
  String get sumSnakeTitle => 'مار مجموع';

  @override
  String get sumSnakeSubtitle =>
      'اعداد مجاور را برای رسیدن به مجموع هدف وصل کنید.';

  @override
  String get baseShiftTitle => 'تغییر مبنا';

  @override
  String get baseShiftSubtitle => 'در مبنای ۱۰ حل کنید';

  @override
  String get baseShiftDescription =>
      'معادله را حل کرده و پاسخ را در مبنای ۱۰ تایپ کنید.';

  @override
  String get baseShiftEquation => 'معادله';

  @override
  String get baseShiftHint => 'نتیجه اعشاری را وارد کنید...';

  @override
  String get baseShiftCorrect => 'درست!';

  @override
  String get baseShiftIncorrect => 'نادرست!';

  @override
  String get baseShiftSubmit => 'ارسال';

  @override
  String get baseShiftQuickGuide => 'راهنمای سریع:';

  @override
  String get baseShiftBinary => 'باینری (bin): مبنای ۲ (0, 1)';

  @override
  String get baseShiftHex => 'هگزادسیمال (0x): مبنای ۱۶ (0-9, A-F)';

  @override
  String get baseShiftDecimal => 'اعشاری (dec): مبنای ۱۰ (0-9)';

  @override
  String get baseShiftWinTitle => 'جادوگر ریاضی!';

  @override
  String get baseShiftWinMessage =>
      'شما ۵ معادله تغییر مبنا را به درستی حل کردید!';

  @override
  String get blockCount3DTitle => 'شمارش بلوک سه‌بعدی';

  @override
  String get blockCount3DSubtitle =>
      'برای چرخش بکشید • بلوک‌های مخفی را بشمارید';

  @override
  String get blockCount3DHowMany => 'چند بلوک؟';

  @override
  String get blockCount3DSubmitGuess => 'ارسال حدس';

  @override
  String get blockCount3DNotQuite => 'نه کاملاً! برای شمارش دوباره بچرخانید.';

  @override
  String get blockCount3DExcellent => 'عالی';

  @override
  String blockCount3DWinMessage(int count) {
    return 'شما همه $count بلوک را به درستی شناسایی کردید!';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '۱. انگشت خود را روی نمای سه‌بعدی بکشید تا دسته بلوک‌ها بچرخد.\n\n۲. همه بلوک‌های موجود در دسته را بشمارید.\n\n۳. به یاد داشته باشید: بلوکی که در هواست باید بلوک‌های تکیه‌گاه در زیر خود داشته باشد (بلوک‌های مخفی!).\n\n۴. پاسخ خود را در کادر ورودی تایپ کرده و برای بررسی روی \"ارسال حدس\" بزنید.';

  @override
  String get alphabetSudokuTitle => 'سودوکوی الفبا';

  @override
  String get alphabetSudokuSubtitle =>
      'جدول را طوری پر کنید که هر سطر، ستون و مربع شامل حروف A تا I باشد.';

  @override
  String get alphabetSudokuWinTitle => 'سودوکو حل شد!';

  @override
  String get alphabetSudokuWinMessage => 'درخشان! شما بر حروف مسلط شدید.';

  @override
  String get classicMazeTitle => 'ماز کلاسیک';

  @override
  String get classicMazeSubtitle => 'کاوش و حل • یک ماز جدید در هر بازی';

  @override
  String get classicMazeWinTitle => 'ماز فتح شد';

  @override
  String classicMazeWinMessage(int count) {
    return 'مسیریابی فوق‌العاده! شما ماز را در $count حرکت حل کردید.';
  }

  @override
  String get classicMazeMoves => 'حرکات: ';

  @override
  String get classicMazeHowToPlayDescription =>
      '۱. گوی زرد درخشان (بازیکن) را به پورتال سبز (خروجی) در پایین سمت راست هدایت کنید.\n\n۲. برای حرکت، روی ماز بکشید، از کلیدهای جهت‌دار کیبورد یا دکمه‌های جهت‌دار پایین استفاده کنید.\n\n۳. رد بنفش مسیری را که کاوش کرده‌اید نشان می‌دهد. برای پاک کردن دینامیک مسیر، به عقب برگردید!\n\n۴. از نوار ابزار بالا درجه سختی را تغییر دهید تا خود را با مازهای بزرگتر به چالش بکشید!';

  @override
  String get conjunctionSearchTitle => 'جستجوی ترکیبی';

  @override
  String get conjunctionSearchSubtitle => 'تمرکز توجه و ترکیب ویژگی‌ها';

  @override
  String get conjunctionSearchWinTitle => 'پیروزی';

  @override
  String get conjunctionSearchWinMessage =>
      'شما همه اهداف را با تمرکز توجه عالی پیدا کردید!';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      'یک ترکیب خاص از شکل و رنگ هدف در دستورالعمل نشان داده می‌شود. آن را در جدول شلوغ در سریع‌ترین زمان ممکن پیدا کرده و لمس کنید. اشکال مزاحم یا در رنگ یا در شکل مشترک هستند، پس دقت کنید!';

  @override
  String get conjunctionSearchRound => 'دور: ';

  @override
  String get conjunctionSearchScore => 'امتیاز: ';

  @override
  String get conjunctionSearchFind => 'پیدا کنید: ';

  @override
  String get shapeCircle => 'دایره';

  @override
  String get shapeSquare => 'مربع';

  @override
  String get shapeTriangle => 'مثلث';

  @override
  String get shapeStar => 'ستاره';

  @override
  String get colorRedLabel => 'قرمز';

  @override
  String get colorBlueLabel => 'آبی';

  @override
  String get colorGreenLabel => 'سبز';

  @override
  String get colorAmberLabel => 'کهربایی';

  @override
  String get cubeNetFoldTitle => 'تا کردن شبکه مکعب';

  @override
  String get cubeNetFoldSubtitle => 'گزینه مکعب سه‌بعدی مطابق را انتخاب کنید';

  @override
  String get cubeNetFoldWinTitle => 'درست';

  @override
  String get cubeNetFoldWinMessage =>
      'شما منطق تاشوی فضایی سه‌بعدی عالی دارید!';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '۱. به شبکه دوبعدی باز شده در بالا نگاه کنید.\n\n۲. در ذهن شبکه را به یک مکعب سه‌بعدی تا کنید.\n\n۳. گزینه‌ای را در پایین انتخاب کنید که یک نمای سه‌بعدی معتبر از آن مکعب تاشده را نشان می‌دهد.\n\n۴. مراقب باشید: وجه‌های مقابل در شبکه نمی‌توانند در حالت سه‌بعدی مجاور هم باشند!';

  @override
  String get cubeNetFoldUnfoldedNet => 'شبکه ۲بعدی باز شده';

  @override
  String get cubeNetFoldWhichMatches => 'کدام مکعب مطابقت دارد؟';

  @override
  String get cubeNetFoldIncorrect =>
      'منطق تاشوی اشتباه! ریست را بزنید یا انتخاب خود را تغییر دهید.';

  @override
  String get cubeNetFoldSubmitChoice => 'ارسال انتخاب';

  @override
  String get cubeNetFoldFailed => 'شکست خورد (ریست را بزنید)';

  @override
  String get faceTraitAssociationMemorize => 'هر ۴ نفر را حفظ کنید';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return 'شخص $current از $total';
  }

  @override
  String get faceTraitAssociationWhatOccupation => 'شغل آن‌ها چیست؟';

  @override
  String get faceTraitAssociationWhatHobby => 'سرگرمی آن‌ها چیست؟';

  @override
  String get faceTraitAssociationWinTitle => 'استاد حافظه!';

  @override
  String get faceTraitAssociationLoseTitle => 'پایان بازی';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return 'شما $correct از $total مورد را درست زدید.';
  }

  @override
  String get topologyTitle => 'توپولوژی';

  @override
  String get topologySubtitle =>
      'آیا این اشکال از نظر توپولوژیکی معادل هستند؟ (آیا می‌توان یکی را بدون بریدن یا چسباندن به دیگری تغییر شکل داد؟)';

  @override
  String get topologyWinTitle => 'نابغه هندسه!';

  @override
  String get topologyWinMessage =>
      'شما ۱۰ جفت توپولوژیکی را به درستی شناسایی کردید!';

  @override
  String get topologyScore => 'امتیاز: ';
}
