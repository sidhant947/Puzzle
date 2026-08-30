// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'بازی‌های پازل';

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
  String get victory => 'پیروزی!';

  @override
  String get gameWin => 'آفرین!';

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
  String get visualStatisticalLearningTitle => 'یادگیری آماری بصری';

  @override
  String get orbitTapTitle => 'ضربه مداری';

  @override
  String get orbitTapSubtitle => 'وقتی توپ‌ها با دروازه تراز شدند ضربه بزنید';

  @override
  String get orbitTapTapToHit => 'وقتی توپ وارد دروازه شد ضربه بزنید';

  @override
  String get schulteTableTitle => 'جدول شولت';

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
  String get memoryMatrixTitle => 'ماتریس حافظه';

  @override
  String get memoryMatrixSubtitle => 'الگو را حفظ کرده و روی کاشی‌ها بزنید.';

  @override
  String get mentalAbacusTitle => 'چرتکه ذهنی';

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
  String get verbalAnalogiesTitle => 'شباهت‌های کلامی';

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
  String get tangleFixTitle => 'رفع گره';

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
  String get wisconsinCardSortingTitle => 'طبقه‌بندی کارت ويسكانسين';

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
  String get mirrorTracingTitle => 'ترسیم آینه‌ای';

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
  String get paperFoldingTitle => 'کاغذ و تا';

  @override
  String get paperFoldingSubtitle => 'وقتی باز شود چگونه به نظر می‌رسد؟';

  @override
  String get waterSortTitle => 'مرتب‌سازی آب';

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
  String get silhouetteMatchTitle => 'تطابق سایه';

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
  String get shapeRectangle => 'مستطیل';

  @override
  String get shapeEllipse => 'بیضی';

  @override
  String get shapeTrapezoid => 'ذوزنقه';

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

  @override
  String get semanticDistanceTitle => 'فاصله معنایی';

  @override
  String get semanticDistanceSubtitle => 'سنجش فاصله مفهومی بین کلمات';

  @override
  String get oxymoronHuntTitle => 'شکار متناقض‌نما';

  @override
  String get oxymoronHuntSubtitle => 'جفت کردن کلمات متضاد در جدول';

  @override
  String get portmanteauSplitTitle => 'تجزیه واژه‌های آمیخته';

  @override
  String get portmanteauSplitSubtitle => 'شناسایی کلمات سازنده یک واژه مرکب';

  @override
  String get chainReactionTitle => 'واکنش زنجیره‌ای';

  @override
  String get chainReactionSubtitle => 'اتصال کلمات با استفاده از حروف مشترک';

  @override
  String get rhymeMasterTitle => 'استاد قافیه';

  @override
  String get rhymeMasterSubtitle =>
      'شناسایی کلماتی که با کلمه هدف هم‌قافیه هستند';

  @override
  String get definitionDashTitle => 'جورچین تعاریف';

  @override
  String get definitionDashSubtitle => 'تطبیق کلمه صحیح با تعریف آن';

  @override
  String get syllableStackTitle => 'چیدمان هجاها';

  @override
  String get syllableStackSubtitle => 'چیدن هجاها برای ساخت کلمات کامل';

  @override
  String get sentenceUnscrambleTitle => 'مرتب‌سازی جمله';

  @override
  String get sentenceUnscrambleSubtitle =>
      'مرتب کردن کلمات برای ساخت یک جمله صحیح';

  @override
  String get grammarSortTitle => 'دسته‌بندی دستوری';

  @override
  String get grammarSortSubtitle => 'دسته‌بندی کلمات بر اساس نقش دستوری آن‌ها';

  @override
  String get vowelReconstructTitle => 'بازسازی حروف صدادار';

  @override
  String get vowelReconstructSubtitle => 'پر کردن حروف صدادار حذف شده در جمله';

  @override
  String get consonantReconstructTitle => 'بازسازی حروف بی‌صدا';

  @override
  String get consonantReconstructSubtitle =>
      'پر کردن حروف بی‌صدای حذف شده در جمله';

  @override
  String get homophoneHuntTitle => 'شکار واژگان هم‌آوا';

  @override
  String get silentLetterSearchTitle => 'جستجوی حروف ناخوانا';

  @override
  String get silentLetterSearchSubtitle =>
      'شناسایی حروف ناخوانا در کلمات داده شده';

  @override
  String get palindromeBuilderTitle => 'سازنده پالیندروم';

  @override
  String get palindromeBuilderSubtitle =>
      'ساخت یک پالیندروم با اضافه کردن کمترین حروف';

  @override
  String get phoneticGuessTitle => 'حدس آوایی';

  @override
  String get phoneticGuessSubtitle => 'شناسایی کلمه از روی املای آوایی آن';

  @override
  String get spoonerismSolverTitle => 'حل‌کننده اسپنریسم';

  @override
  String get spoonerismSolverSubtitle => 'شناسایی اسپنریسم صحیح برای عبارت';

  @override
  String get etymonOddballTitle => 'ریشه ناهماهنگ';

  @override
  String get etymonOddballSubtitle => 'یافتن کلمه‌ای که ریشه مشترک ندارد';

  @override
  String get etymologyOriginTitle => 'منشا واژه‌شناسی';

  @override
  String get etymologyOriginSubtitle => 'حدس زدن زبان مبدأ کلمه دخیل';

  @override
  String get affixFactoryTitle => 'کارخانه وندها';

  @override
  String get affixFactorySubtitle =>
      'ساخت کلمات معتبر با استفاده از پیشوندها و پسوندها';

  @override
  String get cognateCatchTitle => 'شکار کلمات هم‌ریشه';

  @override
  String get cognateCatchSubtitle =>
      'تشخیص بین کلمات واقعاً هم‌ریشه و کلمات مشابه کاذب';

  @override
  String get compoundConnectTitle => 'اتصال کلمات مرکب';

  @override
  String get compoundConnectSubtitle => 'ترکیب دو کلمه برای ساخت یک کلمه مرکب';

  @override
  String get pangramSprintTitle => 'دوی پانگرام';

  @override
  String get pangramSprintSubtitle =>
      'ساخت جمله‌ای که شامل تمام حروف الفبا باشد';

  @override
  String get anagramDefinitionTitle => 'تعریف آنارام';

  @override
  String get anagramDefinitionSubtitle => 'حل آنارام بر اساس تعریف آن';

  @override
  String get letterBridgeTitle => 'پل حروفی';

  @override
  String get letterBridgeSubtitle =>
      'یافتن حرف گم‌شده‌ای که دو کلمه را به هم وصل می‌کند';

  @override
  String get letterFrequencyScanTitle => 'اسکن تکرار حروف';

  @override
  String get letterFrequencyScanSubtitle => 'شمارش دفعات تکرار یک حرف در متن';

  @override
  String get oneLetterShiftTitle => 'تغییر تک‌حرفی';

  @override
  String get oneLetterShiftSubtitle =>
      'تبدیل یک کلمه به کلمه دیگر با تغییر یک حرف';

  @override
  String vocabularyBuilderMessage(String arg0) {
    return 'آفرین! دایره لغات شما تحسین‌برانگیز است. امتیاز: $arg0';
  }

  @override
  String get symmetryMessage =>
      'شما الگو را با دقت جراحی به طور کامل قرینه کردید.';

  @override
  String get temporalOrderMessage =>
      'فوق‌العاده است! حافظه توالی زمانی شما بسیار دقیق است.';

  @override
  String get temporalOrderMessage1 =>
      'حافظه توالی نادرست. تمرین باعث پیشرفت می‌شود!';

  @override
  String get wordSearchMessage => 'تمام کلمات با دقت و مشاهده قوی پیدا شدند.';

  @override
  String colorMatchMessage(String arg0) {
    return 'دقت شما: $arg0٪';
  }

  @override
  String semanticLinkMessage(String arg0) {
    return 'شما $arg0 امتیاز کسب کردید!';
  }

  @override
  String reflexTapMessage(String arg0) {
    return 'شما روی $arg0 هدف ضربه زدید!';
  }

  @override
  String get angleFinderMessage => 'درک هندسی شما عالی است!';

  @override
  String angleFinderMessage1(String arg0) {
    return 'پاسخ صحیح $arg0 درجه بود';
  }

  @override
  String angleFinderText(String arg0) {
    return '$arg0 درجه';
  }

  @override
  String visualStatisticalLearningMessage(String arg0) {
    return 'شما $arg0 الگوی صحیح را تشخیص دادید!';
  }

  @override
  String nonogramText(String arg0) {
    return 'خطا: $arg0';
  }

  @override
  String mentalCalendarMessage(String arg0) {
    return 'شما $arg0 مورد از ۱۰ مورد را درست جواب دادید!';
  }

  @override
  String orbitTapMessage(String arg0) {
    return 'شما با موفقیت $arg0 بار ضربه زدید!';
  }

  @override
  String schulteTableMessage(String arg0) {
    return 'شما جدول را در $arg0 تمام کردید.\nبه تمرین ادامه دهید تا دید محیطی خود را تقویت کنید!';
  }

  @override
  String get schulteTableText => 'شروع تست';

  @override
  String get relationalMemoryMessage =>
      'دقت حافظه رابطه‌ای فضایی شما عالی است!';

  @override
  String sudokuText(String arg0) {
    return 'خطا: $arg0';
  }

  @override
  String sdmtMessage(String arg0) {
    return 'شما $arg0 نماد را مطابقت دادید! این تست سرعت اسکن و توجه بصری شما را می‌سنجد.';
  }

  @override
  String get futoshikiMessage =>
      'فوق‌العاده است! شما مربع لاتین فوتوشیکی را حل کردید.';

  @override
  String letterFrequencyScanMessage(String arg0, String arg1) {
    return 'شما به درستی $arg0 بار تکرار «$arg1» را شمردید.';
  }

  @override
  String letterFrequencyScanText(String arg0) {
    return 'نادرست. تعداد $arg0 بود.';
  }

  @override
  String get memoryMatrixMessage =>
      'تحسین‌برانگیز است! حافظه فعال شما تیز است. هدف روزانه انجام شد!';

  @override
  String get memoryMatrixMessage1 =>
      'تمرکز کنید و دوباره تلاش کنید تا امتیاز حافظه خود را بهبود ببخشید.';

  @override
  String get contextCluesMessage =>
      'استثنایی! دایره لغات و تحلیل متنی شما درجه یک است.';

  @override
  String get contextCluesMessage1 =>
      'کلمه اشتباه انتخاب شد! استدلال متنی کلامی خود را تمرین دهید و دوباره تلاش کنید.';

  @override
  String oneLetterShiftMessage(String arg0, String arg1) {
    return 'شما به درستی $arg0 را به $arg1 تغییر دادید.';
  }

  @override
  String get mentalAbacusMessage => 'محاسبات ذهنی شما در سطح عالی است.';

  @override
  String fractionMatcherMessage(String arg0) {
    return 'شما با تطبیق نمایش‌ها $arg0 امتیاز کسب کردید!';
  }

  @override
  String get spellingSprintMessage => 'شما هر ۱۰ کلمه را درست هجی کردید!';

  @override
  String spellingSprintMessage1(String arg0) {
    return 'شما $arg0 کلمه را درست هجی کردید.';
  }

  @override
  String stopSignalMessage(String arg0) {
    return 'شما $arg0 پاسخ صحیح ثبت کردید! این تست توانایی شما را در مهار یک عمل برنامه‌ریزی شده می‌سنجد.';
  }

  @override
  String grammarPoliceMessage(String arg0) {
    return 'بازی تمام شد! شما نظم را در دنیای دستور زبان حفظ کردید. امتیاز: $arg0';
  }

  @override
  String consonantReconstructMessage(String arg0) {
    return 'شما امتیاز $arg0 را در بازسازی کسب کردید!';
  }

  @override
  String rhymeMasterMessage(String arg0, String arg1) {
    return 'شما $arg0 قافیه از $arg1 قافیه را پیدا کردید!';
  }

  @override
  String vigilanceTaskMessage(String arg0, String arg1, String arg2) {
    return 'موفقیت‌ها: $arg0، خطاها: $arg1\nهشدارهای کاذب: $arg2';
  }

  @override
  String get silhouetteMatchOrthoMessage =>
      'شما مهارت‌های تراز ارتوگرافیک بی‌نقصی دارید!';

  @override
  String get silhouetteMatchOrthoText => 'متوجه شدم';

  @override
  String get silhouetteMatchOrthoText1 =>
      'تصویرسازی پرسپکتیو نادرست! برای تلاش مجدد روی بازنشانی ضربه بزنید.';

  @override
  String fibonacciMergeMessage(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String factorFinderMessage(String arg0) {
    return 'شما با پیدا کردن تمام عوامل $arg0 امتیاز کسب کردید!';
  }

  @override
  String logicalSyllogismsMessage(String arg0) {
    return 'شما $arg0 قیاس منطقی را به درستی حل کردید!';
  }

  @override
  String get rotatingMazeMessage =>
      'شما با موفقیت در هزارتوی چرخشی متحرک حرکت کردید!';

  @override
  String get rotatingMazeText => 'متوجه شدم';

  @override
  String get rotatingMazeText1 => '🌀 هزارتو ۹۰ درجه چرخید! جدول جابجا شد!';

  @override
  String get mathPathMessage =>
      'شما مسیری را پیدا کردید که مجموع آن به هدف می‌رسد!';

  @override
  String get bridgesMessage =>
      'شما با موفقیت تمام جزیره‌ها را به هم متصل کردید!';

  @override
  String compoundConnectMessage(String arg0, String arg1) {
    return 'کلمه مرکب $arg0$arg1 است.';
  }

  @override
  String get pangramSprintMessage =>
      'شما جمله‌ای با استفاده از تمام 26 حرف ساختید.';

  @override
  String get mirrorImageMessage => 'شما بازتاب را به درستی تشخیص دادید.';

  @override
  String get mirrorImageText => 'تصویر آینه‌ای';

  @override
  String reverseStroopMessage(String arg0) {
    return 'شما $arg0 امتیاز کسب کردید! چشمانتان را به دستورالعمل‌ها بدوزید.';
  }

  @override
  String get verbalAnalogiesMessage => 'شما ذهن تیزی در تشخیص روابط دارید.';

  @override
  String corsiBlocksMessage1(String arg0, String arg1) {
    return 'شما $arg1 توالی را به یاد آوردید! دامنه حافظه فضایی شما به $arg0 رسید.';
  }

  @override
  String wordLadderMessage(String arg0, String arg1, String arg2) {
    return 'شما با موفقیت $arg0 را به $arg1 در $arg2 مرحله متصل کردید.';
  }

  @override
  String d2AttentionMessage(String arg0) {
    return 'اسکن انتخابی باورنکردنی! امتیاز نهایی: $arg0.';
  }

  @override
  String get d2AttentionText => 'نحوه بازی';

  @override
  String get d2AttentionText1 => 'فهمیدم';

  @override
  String get tangleFixMessage => 'تمام خطوط واضح و روان هستند.';

  @override
  String get distractorMatrixMessage =>
      'باورنکردنی! شما علی‌رغم حواس‌پرت‌کن‌های ریاضی شناختی، الگوها را به یاد آوردید!';

  @override
  String get distractorMatrixMessage1 =>
      'حواس‌پرت‌کن‌ها شما را شکست دادند! حافظه فعال خود را دوباره آموزش دهید.';

  @override
  String sentenceUnscrambleMessage(String arg0) {
    return 'شما با مرتب‌سازی جملات امتیاز $arg0 را کسب کردید!';
  }

  @override
  String get kakuroMessage =>
      'باورنکردنی! شما تمام بخش‌های مجموع را به طور کامل مطابقت دادید.';

  @override
  String symbolicFlankerMessage(String arg0, String arg1) {
    return 'شما $arg0 مورد صحیح از $arg1 مورد داشتید!';
  }

  @override
  String stroopTestMessage(String arg0) {
    return 'شما $arg0 مورد را به درستی پاسخ دادید! روی رنگ جوهر تمرکز کنید، نه کلمه.';
  }

  @override
  String wisconsinCardSortingMessage(String arg0) {
    return 'شما $arg0 کارت را به درستی دسته‌بندی کردید!';
  }

  @override
  String nBackMessage(String arg0) {
    return 'شما $arg0 مورد مطابقت 2-back به دست آوردید! حافظه فعال شما برای انجام همزمان چند کار حیاتی است.';
  }

  @override
  String rhythmMasterMessage(String arg0, String arg1) {
    return 'شما $arg0 ضربه عالی و $arg1 امتیاز کسب کردید!';
  }

  @override
  String groceryListMessage(String arg0, Object score) {
    return 'شما $arg0 امتیاز در لیست خرید کسب کردید!';
  }

  @override
  String get groceryListText => 'من';

  @override
  String get mirrorTracingMessage =>
      'مغز شما با موفقیت هماهنگی خود را بازسازی کرد.';

  @override
  String moduloClockMessage(String arg0) {
    return 'هماهنگی عالی در محاسبات ذهنی پیمانه‌ای! امتیاز: $arg0';
  }

  @override
  String moduloClockMessage1(String arg0, String arg1, String arg2) {
    return 'شما $arg0 از $arg1 راه حل ساعت پیمانه‌ای را مدیریت کردید. امتیاز: $arg2';
  }

  @override
  String get crownMessage => 'تمام تاج‌ها با منطق عالی با موفقیت قرار گرفتند.';

  @override
  String dualCodingMessage(String arg0) {
    return 'عملکرد فوق‌العاده در انجام دو کار همزمان! امتیاز حافظه فعال شما: $arg0';
  }

  @override
  String inequalityDashMessage(String arg0) {
    return 'شما $arg0 امتیاز در مطابقت نابرابری‌ها کسب کردید!';
  }

  @override
  String sourceMonitoringMessage(String arg0, String arg1) {
    return 'شما $arg0 از $arg1 امتیاز کسب کردید!';
  }

  @override
  String get sourceMonitoringText => 'شروع یادآوری';

  @override
  String get memoryPalaceText => 'کلمات موجود';

  @override
  String target10Message(String arg0) {
    return 'شما $arg0 امتیاز در مطابقت اعداد با 10 کسب کردید!';
  }

  @override
  String get paperFoldingMessage =>
      'شما می‌توانید الگوها را در ذهن خود ببینید.';

  @override
  String topologyText(String arg0, String arg1) {
    return '$arg0$arg1 / 10';
  }

  @override
  String get waterSortMessage =>
      'شما تمام رنگ‌ها را به طور کامل دسته‌بندی کردید!';

  @override
  String anagramDefinitionMessage(String arg0) {
    return 'کلمه واقعاً \"$arg0\" بود.';
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
    return 'شما $arg0 تخمین صحیح زدید.';
  }

  @override
  String grammarSortMessage(String arg0) {
    return 'شما $arg0 کلمه را به درستی دسته‌بندی کردید!';
  }

  @override
  String vowelReconstructMessage(String arg0) {
    return 'شما امتیاز $arg0 را بازسازی کردید!';
  }

  @override
  String spatialConflictMessage(String arg0, String arg1) {
    return 'شما امتیاز $arg0 را با $arg1 خطا به دست آوردید!';
  }

  @override
  String get spatialConflictText => 'نحوه بازی';

  @override
  String get spatialConflictText1 => 'فهمیدم';

  @override
  String tracePathMessage(String arg0) {
    return 'دقت شما $arg0٪ بود!';
  }

  @override
  String ruleSwitcherMessage(String arg0, String arg1) {
    return 'شما $arg0 مورد صحیح از $arg1 مورد داشتید!';
  }

  @override
  String collatzMessage(String arg0, String arg1) {
    return 'شما $arg0 مرحله انجام دادید. حداقل ممکن $arg1 بود.';
  }

  @override
  String get collatzText => '/ 2';

  @override
  String get collatzText1 => '+ 1';

  @override
  String get collatzText2 => '3n + 1';

  @override
  String divisibilityDashMessage(String arg0) {
    return 'شما $arg0 عدد را حل کردید!';
  }

  @override
  String switchTaskMessage(String arg0) {
    return 'شما $arg0 مورد را به درستی پاسخ دادید! تعویض سریع کلید انعطاف‌پذیری ذهنی است.';
  }

  @override
  String sequenceSleuthMessage(String arg0) {
    return 'شما $arg0 توالی را حل کردید!';
  }

  @override
  String changeBlindnessMessage(String arg0) {
    return 'شما $arg0 تغییر را پیدا کردید!';
  }

  @override
  String mentalRotationMessage(String arg0) {
    return 'شما $arg0 شکل را به درستی چرخاندید!';
  }

  @override
  String wordMastermindMessage(String arg0) {
    return 'شما بر کد مسلط شدید!\nکلمه این بود: $arg0';
  }

  @override
  String wordMastermindMessage1(String arg0) {
    return 'کلمه مخفی این بود: $arg0';
  }

  @override
  String wordMastermindText(String arg0) {
    return '$arg0';
  }

  @override
  String get simonSequenceMessage => 'شما تمام 10 کاشی را حفظ کردید!';

  @override
  String get simonSequenceMessage1 =>
      'دوباره امتحان کنید تا بر توالی مسلط شوید.';

  @override
  String oxymoronHuntMessage(String arg0) {
    return 'شما $arg0 متناقض‌نما پیدا کردید!';
  }

  @override
  String spotlightTrackMessage(String arg0) {
    return 'ردیابی فضایی باورنکردنی! شما $arg0 امتیاز کسب کردید.';
  }

  @override
  String get spotlightTrackText => 'نحوه بازی';

  @override
  String get spotlightTrackText1 => 'فهمیدم';

  @override
  String get spotlightTrackText2 => 'شروع مرحله';

  @override
  String vennNumbersMessage(String arg0) {
    return 'شما $arg0 عدد را دسته‌بندی کردید!';
  }

  @override
  String get vennNumbersText => 'هیچ‌کدام';

  @override
  String get vennNumbersText1 => 'هر دو';

  @override
  String get silhouetteMatchMessage =>
      'مغز شما در تبدیل سه‌بعدی به دوبعدی عالی است.';

  @override
  String sumSnakeMessage(String arg0) {
    return 'هدف $arg0 با دقت کامل حاصل شد!';
  }

  @override
  String get sumSnakeText => 'پاک کردن مسیر';

  @override
  String percentagePeakMessage(String arg0) {
    return 'شما $arg0 مسئله درصد را حل کردید!';
  }

  @override
  String trailMakingMessage(String arg0) {
    return 'شما $arg0 مسیر را کامل کردید! این تست سرعت جستجوی بصری و انعطاف‌پذیری ذهنی شما را می‌سنجد.';
  }

  @override
  String matrixReasoningMessage(String arg0) {
    return 'شما $arg0 ماتریس را به درستی کامل کردید!';
  }

  @override
  String get tentsAndTreesMessage => 'شما با موفقیت تمام چادرها را قرار دادید.';

  @override
  String klotskiMessage(String arg0) {
    return 'لغزش فوق‌العاده! شما بلوک قهرمان را در $arg0 حرکت آزاد کردید.';
  }

  @override
  String sumPyramidMessage(String arg0) {
    return 'شما $arg0 هرم مجموع را با موفقیت حل کردید!';
  }

  @override
  String simonCommandMessage(String arg0) {
    return 'پاسخ انتخابی و تمرکز عالی! امتیاز کل: $arg0';
  }

  @override
  String simonCommandMessage1(String arg0, String arg1) {
    return 'شما $arg0 امتیاز کسب کردید اما به $arg1 مطابقت در زمان معین نرسیدید.';
  }

  @override
  String syllableStackMessage(String arg0) {
    return 'شما امتیاز $arg0 را روی هم جمع کردید!';
  }

  @override
  String get slitherlinkMessage =>
      'عالی بود! شما با موفقیت پازل حلقه را کامل کردید.';

  @override
  String quickMathMessage(String arg0) {
    return 'شما $arg0 مسئله را حل کردید!';
  }

  @override
  String commonDenominatorMessage(String arg0) {
    return 'شما $arg0 مسئله ب.م.م/ک.م.م را حل کردید!';
  }

  @override
  String chainReactionMessage(String arg0, String arg1) {
    return 'امتیاز نهایی شما $arg0 است. شما زنجیره‌ای از $arg1 کلمه ساختید.';
  }

  @override
  String chainReactionText(String arg0) {
    return '$arg0';
  }

  @override
  String get associativePairsMessage =>
      'درخشان! شما ویژگی‌های بصری را بدون نقص به هم مرتبط کردید.';

  @override
  String get associativePairsMessage1 =>
      'ارتباط اشتباه! حافظه پیوندی خود را تقویت کرده و دوباره امتحان کنید.';

  @override
  String portmanteauSplitMessage(String arg0) {
    return 'شما $arg0 کلمه آمیزه را جدا کردید!';
  }

  @override
  String get magicSquaresText => 'پاک کردن';

  @override
  String alphabetSudokuText(String arg0) {
    return 'خطا: $arg0';
  }

  @override
  String get pipesMessage =>
      'شما تمام لوله‌ها را متصل کرده و جدول را پر کردید.';

  @override
  String get dualMirrorMessage => 'شما هر دو آیکون را به اهدافشان هدایت کردید!';

  @override
  String binaryCodeMessage(String arg0) {
    return 'ترجمه دهدهی سریع فوق‌العاده! امتیاز نهایی: $arg0';
  }

  @override
  String binaryCodeMessage1(String arg0, String arg1) {
    return 'شما $arg0 عدد دودویی را به درستی تبدیل کردید. امتیاز: $arg1';
  }

  @override
  String oddOneOutMessage(String arg0) {
    return 'شما 50 مورد متفاوت را پیدا کردید! امتیاز نهایی: $arg0';
  }

  @override
  String oddOneOutMessage1(String arg0) {
    return 'امتیاز شما: $arg0';
  }

  @override
  String letterBridgeMessage(String arg0) {
    return 'شما حرف رابط را پیدا کردید: $arg0';
  }

  @override
  String get imReady => 'من آماده‌ام';

  @override
  String get soptTitle => 'اشاره به خود سفارشی';

  @override
  String get soptSubtitle =>
      'هر بار روی کارت دیگری ضربه بزنید. موقعیت ها به هم می ریزند!';

  @override
  String get soptWinTitle => 'استاد سکانس!';

  @override
  String soptGameOverMessage(int score) {
    return 'شما $score امتیاز را با ردیابی موفق کارت های به هم ریخته به دست آوردید!';
  }

  @override
  String get soptChooseNovel => 'روی کارت جدید ضربه بزنید';

  @override
  String get soptGreatJob => 'کار عالی!';

  @override
  String get soptAlreadyTapped => 'قبلاً شنود شده است!';

  @override
  String get soptGrid => 'شبکه';

  @override
  String get contRecogTitle => 'شناسایی مداوم';

  @override
  String get contRecogSubtitle => 'آیا قبلاً این کارت را در این جلسه دیده اید؟';

  @override
  String get contRecogWinTitle => 'نابغه شناخت!';

  @override
  String contRecogGameOverMessage(int score) {
    return 'شما $score تشخیص درست را به ثمر رساندید!';
  }

  @override
  String get contRecogCorrect => 'درسته!';

  @override
  String get contRecogWrong => 'اشتباه!';

  @override
  String get contRecogOldOrNew => 'این قدیمیه یا جدید؟';

  @override
  String get contRecogNew => 'جدید';

  @override
  String get contRecogOld => 'قدیمی';

  @override
  String get contRecogSeenPool => 'استخر دیده می شود';

  @override
  String get dnmsTitle => 'حافظه غیر منطبق';

  @override
  String get dnmsSubtitle => 'روی کارتی که در نمونه حفظ شده نیست ضربه بزنید.';

  @override
  String get dnmsWinTitle => 'کارشناس غیر همسان!';

  @override
  String dnmsGameOverMessage(int score) {
    return 'شما $score پاسخ صحیح را در عدم تطابق با تأخیر به ثمر رساندید!';
  }

  @override
  String get dnmsChooseNovel => 'روی کارت جدید ضربه بزنید';

  @override
  String get dnmsMemorizeSample => 'این کارت را حفظ کنید';

  @override
  String get dnmsWaitForIt => 'منتظرش باش...';

  @override
  String get dnmsExcellent => 'عالی!';

  @override
  String get dnmsSampleTapped => 'نمونه اش همین بود!';

  @override
  String get dnmsCards => 'کارت ها';

  @override
  String get symSpanTitle => 'دهانه تقارن';

  @override
  String get symSpanSubtitle =>
      'الگوهای سلولی را با شناسایی تقارن عمودی به یاد بیاورید.';

  @override
  String get symSpanWinTitle => 'استاد تقارن!';

  @override
  String symSpanGameOverMessage(int score) {
    return 'شما با یادآوری طرح‌بندی‌ها و شناسایی تقارن $score امتیاز کسب کردید!';
  }

  @override
  String get symSpanMemorizeRed => 'مکان گلبول قرمز را به خاطر بسپارید';

  @override
  String get symSpanIsSymmetric => 'آیا الگوی متقارن است؟';

  @override
  String get symSpanRecallSequence => 'دنباله را به ترتیب صحیح به یاد بیاورید';

  @override
  String get symSpanGreatJob => 'کار عالی!';

  @override
  String get symSpanTryAgain => 'دوباره امتحان کنید!';

  @override
  String get symSpanLength => 'طول';

  @override
  String get readingSpanTitle => 'بازه خواندن';

  @override
  String get readingSpanSubtitle =>
      'هنگام به خاطر سپردن دنباله ای از حروف، جملات را تأیید کنید.';

  @override
  String get readingSpanWinTitle => 'کارشناس خواندن!';

  @override
  String readingSpanGameOverMessage(int score) {
    return 'شما $score امتیاز در چالش حافظه Reading Span کسب کردید!';
  }

  @override
  String get readingSpanTrueFalse => 'آیا این گفته درست است یا نادرست؟';

  @override
  String get readingSpanMemorizeLetter => 'این نامه را حفظ کنید';

  @override
  String get readingSpanRecallLetters => 'حروف را به ترتیب به یاد بیاورید';

  @override
  String get readingSpanGreatJob => 'کار عالی!';

  @override
  String get readingSpanTryAgain => 'دوباره امتحان کنید!';

  @override
  String readingSpanYourSequence(String sequence) {
    return 'دنباله شما: $sequence';
  }

  @override
  String get readingSpanLength => 'طول';

  @override
  String get readingSpanSentence1 => 'خورشید از مشرق طلوع می کند.';

  @override
  String get readingSpanSentence2 => 'یخ داغ در حال جوشیدن است.';

  @override
  String get readingSpanSentence3 => 'ماهی ها می توانند زیر آب نفس بکشند.';

  @override
  String get readingSpanSentence4 => 'سگ ها بال دارند و می توانند پرواز کنند.';

  @override
  String get readingSpanSentence5 => 'آب در دمای 0 درجه سانتیگراد یخ می زند.';

  @override
  String get readingSpanSentence6 => 'گربه ها مانند سگ های کوچک پارس می کنند.';

  @override
  String get readingSpanSentence7 =>
      'درختان در تابستان دارای برگهای سبز هستند.';

  @override
  String get readingSpanSentence8 => 'باران از زمین به سمت بالا می بارد.';

  @override
  String get readingSpanSentence9 => 'یک مثلث دارای چهار ضلع مساوی است.';

  @override
  String get readingSpanSentence10 => 'سیب نوعی میوه شیرین است.';

  @override
  String get readingSpanSentence11 => 'ماه از پنیر چدار ساخته شده است.';

  @override
  String get readingSpanSentence12 =>
      'خودروها دارای چرخ هایی برای چرخاندن هستند.';

  @override
  String get readingSpanSentence13 => 'آتش به شدت سرد است.';

  @override
  String get readingSpanSentence14 => 'کاغذ از چوب فرآوری شده ساخته شده است.';

  @override
  String get readingSpanSentence15 => 'پرندگان برای کمک به پرواز، پر دارند.';

  @override
  String get readingSpanSentence16 => 'موز روی درختان کاج رشد می کند.';

  @override
  String get readingSpanSentence17 => 'فیل از مورچه کوچکتر است.';

  @override
  String get readingSpanSentence18 => 'کتاب ها حاوی صفحات چاپ شده متن هستند.';

  @override
  String get countingSpanTitle => 'فاصله شمارش';

  @override
  String get countingSpanSubtitle =>
      'فقط دایره های آبی را بشمارید. سپس ترتیب شمارش ها را به خاطر بیاورید.';

  @override
  String get countingSpanWinTitle => 'نابغه شمارش!';

  @override
  String countingSpanGameOverMessage(int score) {
    return 'شما $score امتیاز را در چالش حافظه شمارش به دست آوردید!';
  }

  @override
  String get countingSpanCountCircles => 'فقط دایره های آبی را بشمارید';

  @override
  String get countingSpanRecallCounts => 'شمارش فراخوان به ترتیب صحیح';

  @override
  String get countingSpanGreatJob => 'کار عالی!';

  @override
  String get countingSpanTryAgain => 'دوباره امتحان کنید!';

  @override
  String countingSpanYourSequence(String sequence) {
    return 'دنباله شما: $sequence';
  }

  @override
  String get countingSpanLength => 'طول';

  @override
  String get objDispTitle => 'جابجایی شی';

  @override
  String get objDispSubtitle =>
      'طرح بندی را به خاطر بسپارید. شیئی را که موقعیت را تغییر می دهد پیدا کنید و روی آن ضربه بزنید.';

  @override
  String get objDispWinTitle => 'نابغه فضایی!';

  @override
  String objDispGameOverMessage(int score) {
    return 'شما $score اشیاء جابجا شده را به درستی شناسایی کردید!';
  }

  @override
  String get objDispMemorizeAll => 'همه مکان ها را به خاطر بسپارید';

  @override
  String get objDispWaitingShift => 'در انتظار تغییر چیدمان...';

  @override
  String get objDispTapMoved => 'روی جسمی که حرکت کرد ضربه بزنید';

  @override
  String get objDispExcellent => 'عالی!';

  @override
  String get objDispWrongObject => 'شی اشتباه!';

  @override
  String get objDispItems => 'موارد';

  @override
  String get mandalaTitle => 'یادآوری ماندالا';

  @override
  String get mandalaSubtitle =>
      'پیکربندی رنگ را به خاطر بسپارید. رنگ ها را انتخاب کنید و کاشی ها را دوباره رنگ کنید.';

  @override
  String get mandalaWinTitle => 'هنرمند ماندالا!';

  @override
  String mandalaGameOverMessage(int score) {
    return 'شما با بازسازی طرح‌بندی‌های هندسی رنگی $score امتیاز کسب کردید!';
  }

  @override
  String get mandalaMemorizeColors => 'رنگ های کاشی را به خاطر بسپارید';

  @override
  String get mandalaPaintCells => 'سلول ها را برای مطابقت با اصلی رنگ کنید';

  @override
  String get mandalaExcellent => 'عالی!';

  @override
  String get mandalaIncorrectMatch => 'تطابق نادرست!';

  @override
  String get mandalaSubmitRepaint => 'ارسال مجدد رنگ';

  @override
  String get mandalaTiles => 'کاشی';

  @override
  String get runningSpanTitle => 'در حال اجرا';

  @override
  String get runningSpanSubtitle =>
      'مراقب نامه ها باشید وقتی متوقف شدند، آخرین N حرف را به ترتیب وارد کنید.';

  @override
  String get runningSpanWinTitle => 'استاد بافر!';

  @override
  String runningSpanGameOverMessage(int score) {
    return 'شما $score امتیاز در Running Memory Span کسب کردید!';
  }

  @override
  String runningSpanPrepareRecall(int count) {
    return 'برای یادآوری آخرین حروف $count آماده شوید';
  }

  @override
  String get runningSpanWatchCarefully => 'با دقت تماشا کن...';

  @override
  String runningSpanEnterLast(int count) {
    return 'آخرین حروف $count را وارد کنید';
  }

  @override
  String get runningSpanGreatJob => 'کار عالی!';

  @override
  String get runningSpanIncorrectBuffer => 'بافر نادرست!';

  @override
  String runningSpanRecallLast(int count) {
    return 'یادآوری آخرین $count';
  }

  @override
  String get runningSpanStopsRandomly => 'جریان به طور تصادفی متوقف می شود!';

  @override
  String runningSpanEntered(String sequence) {
    return 'وارد شده: $sequence';
  }

  @override
  String get runningSpanNItems => 'N-اقلام';

  @override
  String get spatialCabinetTitle => 'کابینت های فضایی';

  @override
  String get spatialCabinetSubtitle =>
      'به خاطر بسپارید که کدام کشوی کابینت حاوی کدام شی است.';

  @override
  String get spatialCabinetWinTitle => 'کارشناس کابینه!';

  @override
  String spatialCabinetGameOverMessage(int score) {
    return 'شما $score امتیاز در حافظه کابینت فضایی کسب کردید!';
  }

  @override
  String get spatialCabinetMemorize => 'مکان اقلام را به خاطر بسپارید';

  @override
  String spatialCabinetWhereIs(String itemName) {
    return '$itemName کجاست؟';
  }

  @override
  String get spatialCabinetCorrect => 'درسته!';

  @override
  String get spatialCabinetWrongDrawer => 'کشو اشتباه!';

  @override
  String get spatialCabinetItems => 'موارد';

  @override
  String get cabinetItemKey => 'کلید';

  @override
  String get cabinetItemApple => 'اپل';

  @override
  String get cabinetItemDiamond => 'الماس';

  @override
  String get cabinetItemBook => 'کتاب';

  @override
  String get cabinetItemUmbrella => 'چتر';

  @override
  String get cabinetItemCoffee => 'قهوه';

  @override
  String get cabinetItemLock => 'قفل کنید';

  @override
  String get cabinetItemPet => 'حیوان خانگی';

  @override
  String get cabinetItemCar => 'ماشین';

  @override
  String get gamesTitleLabel => 'بازی‌ها';

  @override
  String get yourFavorites => 'علاقه‌مندی‌های شما';

  @override
  String get readyForWorkout => 'برای تمرین روزانه خود آماده‌اید؟';

  @override
  String get greatStartKeepGoing => 'شروع عالی! ادامه دهید.';

  @override
  String get onFireToday => 'امروز فوق‌العاده هستید!';

  @override
  String get incredibleSolvingToday => 'حل مسائل باورنکردنی امروز!';

  @override
  String get newGameLabel => 'جدید';

  @override
  String get slitherlinkTitle => 'اسلایدرلینک';

  @override
  String get slitherlinkSubtitle =>
      'با استفاده از راهنماهای عددی، شبکه پین را دور بزنید.';

  @override
  String get futoshikiTitle => 'فوتوشیکی';

  @override
  String get futoshikiSubtitle => 'شبکه‌ها را با راهنماهای بزرگتر از پر کنید.';

  @override
  String get kakuroTitle => 'کاکورو';

  @override
  String get kakuroSubtitle =>
      'جدول کلمات متقاطع را با اعداد و جمع‌ها حل کنید.';

  @override
  String get inequalityDashTitle => 'سرعت نابرابری';

  @override
  String get inequalityDashSubtitle => 'نابرابری‌ها را تحت فشار زمان حل کنید.';

  @override
  String get factorFinderTitle => 'عامل‌یاب';

  @override
  String get factorFinderSubtitle => 'همه عوامل اعداد هدف را شناسایی کنید.';

  @override
  String get collatzTitle => 'مسیر کلاتز';

  @override
  String get collatzSubtitle => 'در دنباله 3N+1 حرکت کنید.';

  @override
  String get sumPyramidTitle => 'هرم جمع';

  @override
  String get sumPyramidSubtitle =>
      'سلول‌های هرم را با راهنماهای ریاضی جمع پر کنید.';

  @override
  String get target10Title => 'هدف ۱۰';

  @override
  String get target10Subtitle =>
      'کاشی‌های اعداد را برای رسیدن به جمع ده ترکیب کنید.';

  @override
  String get fractionMatcherTitle => 'تطبیق‌دهنده کسر';

  @override
  String get fractionMatcherSubtitle =>
      'کسرهای معادل را به صورت بصری تطبیق دهید.';

  @override
  String get dualCodingTitle => 'کدگذاری دوگانه';

  @override
  String get dualCodingSubtitle => 'حروف و نمادها را به طور همزمان تطبیق دهید.';

  @override
  String get distractorMatrixTitle => 'ماتریس حواس‌پرت‌کن';

  @override
  String get distractorMatrixSubtitle =>
      'شکل‌های هدف را در میان حواس‌پرت‌کن‌ها پیدا کنید.';

  @override
  String get temporalOrderTitle => 'ترتیب زمانی';

  @override
  String get temporalOrderSubtitle => 'ترتیب زمانی را به یاد آورید.';

  @override
  String get associativePairsTitle => 'جفت‌های انجمنی';

  @override
  String get associativePairsSubtitle => 'نمادهای مربوطه را جفت و تطبیق دهید.';

  @override
  String get blockCount3dTitle => 'شمارش بلوک سه بعدی';

  @override
  String get blockCount3dSubtitle => 'بلوک‌ها را در فضای سه بعدی بشمارید.';

  @override
  String get rotatingMazeTitle => 'ماز چرخان';

  @override
  String get rotatingMazeSubtitle =>
      'مازها را بچرخانید تا توپ‌ها را به سمت خروجی هدایت کنید.';

  @override
  String get silhouetteMatchOrthoTitle => 'تطبیق سایه (ارتو)';

  @override
  String get silhouetteMatchOrthoSubtitle =>
      'اشیاء سه بعدی را با سایه‌های ارتو تطبیق دهید.';

  @override
  String get spatialConflictTitle => 'تضاد فضایی';

  @override
  String get spatialConflictSubtitle => 'اختلافات بین متن و جهت را حل کنید.';

  @override
  String get spotlightTrackTitle => 'ردیابی نورافکن';

  @override
  String get spotlightTrackSubtitle =>
      'موارد چشمک‌زن را در سایه‌های متحرک ردیابی کنید.';

  @override
  String get d2AttentionTitle => 'توجه d2';

  @override
  String get d2AttentionSubtitle =>
      'نمادهای هدف را با معیارهای سخت‌گیرانه لمس کنید.';

  @override
  String get dualMirrorTitle => 'ناوبری آینه دوگانه';

  @override
  String get dualMirrorSubtitle => 'دو ماز را به طور همزمان هدایت کنید.';

  @override
  String get contextCluesTitle => 'نشانه‌های متنی';

  @override
  String get contextCluesSubtitle =>
      'کلمات پنهان را از نشانه‌های متنی حدس بزنید.';

  @override
  String get digitSpanReverseSubtitle =>
      'ارقام اعداد را به ترتیب معکوس به یاد آورید.';

  @override
  String get faceNameAssociationSubtitle =>
      'نام‌های چهره‌های مختلف ارائه شده را به یاد آورید.';

  @override
  String get staircaseMemorySubtitle => 'بلوک‌ها را در دنباله پله‌ای حفظ کنید.';

  @override
  String get choiceReactionTimeSubtitle =>
      'دکمه‌های خاص را با توجه به نشانه‌ها سریع لمس کنید.';

  @override
  String get attentionalBlinkSubtitle =>
      'اهداف سریع را که در جریان‌ها چشمک می‌زنند شناسایی کنید.';

  @override
  String get visualStatisticalLearningSubtitle =>
      'الگوهای شکل زمانی را به صورت بصری یاد بگیرید.';

  @override
  String get sternbergTaskSubtitle =>
      'به یاد آورید که آیا نماد در مجموعه حافظه بود یا خیر.';

  @override
  String get operationSpanSubtitle =>
      'ریاضی حل کنید و رشته‌های الفبا را به یاد آورید.';

  @override
  String get continuousRecognitionTitle => 'تشخیص مداوم';

  @override
  String get continuousRecognitionSubtitle =>
      'تشخیص دهید که آیا کارت ارائه شده قدیمی است یا جدید.';

  @override
  String get symmetrySpanTitle => 'گستره تقارن';

  @override
  String get symmetrySpanSubtitle =>
      'مختصات سلول را در میان تصمیمات تقارن عمودی به یاد آورید.';

  @override
  String get objectDisplacementTitle => 'جابجایی اشیاء';

  @override
  String get objectDisplacementSubtitle =>
      'مکان‌ها را بررسی کنید و تنها شیئی را که حرکت کرده لمس کنید.';

  @override
  String get mandalaRecallTitle => 'یادآوری ماندالا';

  @override
  String get mandalaRecallSubtitle =>
      'کاشی‌های رنگی را حفظ کنید و ماندالاها را از پالت دوباره رنگ کنید.';

  @override
  String get runningMemorySpanTitle => 'گستره حافظه جاری';

  @override
  String get runningMemorySpanSubtitle =>
      'حروف جاری را نظارت کنید و N مورد آخر را به یاد آورید.';

  @override
  String get spatialCabinetMemoryTitle => 'کابینت‌های فضایی';

  @override
  String get spatialCabinetMemorySubtitle =>
      'مکان اشیاء پشت درهای کابینت را حفظ و پیدا کنید.';

  @override
  String get pathRecallSubtitle => 'انتخاب‌های مسیر را حفظ و تکرار کنید.';

  @override
  String get objectShuffleSubtitle =>
      'اشیاء مخلوط شده در زیر فنجان‌های عمیق را ردیابی کنید.';

  @override
  String get groceryListSubtitle =>
      'موارد موجود در لیست را حفظ و علامت‌گذاری کنید.';

  @override
  String get quickMathSubtitle => 'سوالات ریاضی را با بیشترین سرعت حل کنید.';

  @override
  String get mathGuessTitle => 'حدس ریاضی';

  @override
  String get mathGuessSubtitle => 'عدد پنهان را در ۱۵ فرصت حدس بزنید.';

  @override
  String get reflexTapSubtitle => 'محرک‌ها را با بیشترین سرعت ممکن لمس کنید.';

  @override
  String get pixelMimicSubtitle =>
      'الگوهای طراحی را روی شبکه‌های پیکسلی تقلید کنید.';

  @override
  String get simonSequenceSubtitle => 'دنباله‌های شکل را از حافظه تکرار کنید.';

  @override
  String get slidePuzzleSubtitle =>
      'کاشی‌های شبکه کشویی مربعی را دوباره مرتب کنید.';

  @override
  String get findWordTitle => 'پیدا کردن کلمه';

  @override
  String get schulteTableSubtitle => 'اعداد یک تا بیست و پنج را لمس کنید.';

  @override
  String get simonCommandTitle => 'فرمان سایمون';

  @override
  String get simonCommandSubtitle =>
      'دستورالعمل‌های صوتی را به سرعت اجرا کنید.';

  @override
  String get binaryCodeTitle => 'سرعت باینری';

  @override
  String get binaryCodeSubtitle => 'کدهای باینری را به اعشار ترجمه کنید.';

  @override
  String get moduloClockTitle => 'ساعت مدولو';

  @override
  String get moduloClockSubtitle =>
      'معادلات ریاضی را با استفاده از ساعت‌ها محاسبه کنید.';

  @override
  String get chimpTestTitle => 'تست شامپانزه';

  @override
  String get chimpTestSubtitle => 'اعداد تصادفی را به ترتیب صعودی لمس کنید.';

  @override
  String get relationalMemoryTitle => 'حافظه رابطه‌ای';

  @override
  String get relationalMemorySubtitle =>
      'مکان دقیق موارد شبکه را به یاد آورید.';

  @override
  String get factBinderTitle => 'پیوند دهنده حقایق';

  @override
  String get factBinderSubtitle =>
      'نمادها را متصل کنید و جملات را به یاد آورید.';

  @override
  String get sourceMonitoringTitle => 'نظارت بر منبع';

  @override
  String get sourceMonitoringSubtitle => 'متن را به یاد آورید.';

  @override
  String get klotskiTitle => 'فرار کلوتسکی';

  @override
  String get klotskiSubtitle => 'بلوک‌ها را برای رسیدن به خروجی‌ها حرکت دهید.';

  @override
  String get homophoneHuntSubtitle => 'انتخاب واژه هم‌آوا با املای درست';

  @override
  String get laserLinkTitle => 'لینک لیزر';

  @override
  String get laserLinkSubtitle =>
      'آینه‌ها را بچرخانید تا لیزرها را منعکس کرده و تمام اهداف را روشن کنید.';

  @override
  String get laserLinkCongrats =>
      'انعکاس دقیق! شما با موفقیت کل شبکه را برق‌رسانی کردید.';

  @override
  String get crossSectionSliceTitle => 'برش مقطع';

  @override
  String get crossSectionSliceSubtitle =>
      'مقطع دوبعدی صحیح یک شیء سه‌بعدی را از یک زاویه خاص شناسایی کنید.';

  @override
  String get crossSectionSliceCongrats =>
      'تجسم سه‌بعدی باورنکردنی! شما درست از میان آن شکل دیدید.';

  @override
  String get shadowPivotTitle => 'محور سایه';

  @override
  String get shadowPivotCongrats =>
      'استدلال فضایی پویا! شما بر نور و سایه مسلط شدید.';

  @override
  String get shadowPivotSubtitle =>
      'سایه ایجاد شده توسط یک شیء سه‌بعدی را هنگام چرخش در محورهای مختلف پیش‌بینی کنید.';

  @override
  String get interlockPuzzleTitle => 'پازل در هم تنیده';

  @override
  String get interlockPuzzleSubtitle =>
      'بلوک‌های در هم تنیده پیچیده را با ترتیب صحیح باز یا بسته کنید.';

  @override
  String get interlockPuzzleCongrats =>
      'ساختارشکنی منطقی! شما پازل را به شکلی عالی از هم باز کردید.';

  @override
  String get pathIntersectTitle => 'تقاطع مسیر';

  @override
  String get pathIntersectSubtitle =>
      'چندین مسیر را به طور همزمان ناوبری کنید تا بدون برخورد به اهداف مربوطه برسید.';

  @override
  String get pathIntersectCongrats =>
      'ناوبری همگام‌سازی شده! شما بدون نقص به تمام اهداف رسیدید.';

  @override
  String get negativeSpaceDetectionTitle => 'فضای منفی';

  @override
  String get negativeSpaceDetectionSubtitle =>
      'شکلی که توسط فضای خالی بین اشیاء ایجاد می‌شود را شناسایی کنید.';

  @override
  String get negativeSpaceDetectionCongrats =>
      'ادراک تیز! شما در هنر دیدن آنچه وجود ندارد استاد شده‌اید.';

  @override
  String get compassMazeTitle => 'هزارتوی قطب‌نما';

  @override
  String get compassMazeSubtitle =>
      'در هزارتویی ناوبری کنید که در آن جهت‌های حرکت بر اساس جهت‌گیری قطب‌نمای شما تغییر می‌کند.';

  @override
  String get compassMazeCongrats =>
      'ناوبری خبره! شما راه خروج را از طریق جهت‌های متغیر پیدا کردید.';

  @override
  String get complexFoldingNetsTitle => 'شبکه‌های تاشو';

  @override
  String get complexFoldingNetsSubtitle =>
      'تعیین کنید که با تا کردن یک شبکه دوبعدی غیر استاندارد، کدام شکل سه‌بعدی پیچیده تشکیل می‌شود.';

  @override
  String get complexFoldingNetsCongrats =>
      'منطق تاشوی پیشرفته! شما با موفقیت شکل سه‌بعدی را تجسم کردید.';

  @override
  String get compassMazeMessage =>
      'با استفاده از قطب‌نما در هزارتو ناوبری کنید.';

  @override
  String get negativeSpaceDetectionMessage =>
      'شیء پنهان در فضا را شناسایی کنید.';

  @override
  String get shikakuTitle => 'شیکاکو';

  @override
  String get shikakuSubtitle =>
      'شبکه را به مربع و مستطیل متناسب با اعداد تقسیم کنید.';

  @override
  String get countdownMathTitle => 'شمارش معکوس ریاضی';

  @override
  String get countdownMathSubtitle =>
      'اعداد تصادفی را برای محاسبه هدف سه رقمی ترکیب کنید.';

  @override
  String get narrativeRecallTitle => 'یادآوری روایت';

  @override
  String get narrativeRecallSubtitle =>
      'یک داستان را بخوانید و جزئیات کمی و واقعی را به خاطر بیاورید.';

  @override
  String get shellGameTitle => 'بازی شل';

  @override
  String get shellGameSubtitle =>
      'به عنوان جابجایی فنجان های درهم و برهم، یک توپ پنهان را دنبال کنید.';

  @override
  String get typoglycemiaDecoderTitle => 'رسیور تایپوگلیسمی';

  @override
  String get typoglycemiaDecoderSubtitle =>
      'جملات درهم ریخته را سریع باز کنید و بخوانید.';

  @override
  String get shapeShifterTitle => 'تغییر شکل';

  @override
  String get shapeShifterSubtitle => 'روی ترکیب شکل و رنگ مورد نظر ضربه بزنید.';

  @override
  String get gokigenNanameTitle => 'گوکیگن نام';

  @override
  String get gokigenNanameSubtitle => 'برای اتصال نقاط بدون حلقه مورب بکشید.';

  @override
  String get matrixMultiplierTitle => 'ضرب کننده ماتریس';

  @override
  String get matrixMultiplierSubtitle =>
      'یک سطر و ستون را برای ضرب در هدف انتخاب کنید.';

  @override
  String get wordAssociationRecallTitle => 'انجمن کلمه';

  @override
  String get wordAssociationRecallSubtitle =>
      'تداعی کلمات جفت شده را از حافظه به یاد بیاورید.';

  @override
  String get gearRotationTitle => 'چرخش دنده';

  @override
  String get gearRotationSubtitle => 'جهت چرخش آخرین دنده را پیش بینی کنید.';

  @override
  String get wordWheelTitle => 'چرخ کلمه';

  @override
  String get wordWheelSubtitle =>
      'با استفاده از حروف روی چرخ، از جمله حرف مرکزی، کلمات بسازید.';

  @override
  String get oddEvenFlashTitle => 'فلش زوج و فرد';

  @override
  String get oddEvenFlashSubtitle =>
      'به سرعت برابری اعداد را با قانون رنگ مطابقت دهید.';

  @override
  String get norinoriTitle => 'نورینوری';

  @override
  String get norinoriSubtitle =>
      'دقیقاً دو سلول متصل را در هر اتاق سایه بزنید.';

  @override
  String get algebraicBalanceTitle => 'تعادل جبری';

  @override
  String get algebraicBalanceSubtitle =>
      'معادلات را حل کنید تا مجموع هدف را پیدا کنید.';

  @override
  String get patternSequenceDrawTitle => 'یادآوری الگو';

  @override
  String get patternSequenceDrawSubtitle =>
      'دنباله مسیر متحرک را روی شبکه تکرار کنید.';

  @override
  String get tangramTitle => 'پازل تنگرام';

  @override
  String get tangramSubtitle => 'شکل ها را مرتب کنید تا شبح هدف را پر کند.';

  @override
  String get semanticAssociationTitle => 'کلمه انجمن';

  @override
  String get semanticAssociationSubtitle =>
      'کلمه ای را پیدا کنید که هر سه سرنخ را به هم متصل می کند.';

  @override
  String get peripheralFocusTitle => 'فوکوس محیطی';

  @override
  String get peripheralFocusSubtitle =>
      'در حین حل ریاضی به صفحه های کناری چشمک زن واکنش نشان دهید.';

  @override
  String get masyuTitle => 'حلقه ماسیو';

  @override
  String get masyuSubtitle => 'یک حلقه منطبق با قوانین دایره Masyu رسم کنید.';

  @override
  String get mathMazeTitle => 'ماز ریاضی';

  @override
  String get mathMazeSubtitle =>
      'مسیری را ردیابی کنید که به کل هدف ارزیابی می شود.';

  @override
  String get storyBuilderTitle => 'داستان ساز';

  @override
  String get storyBuilderSubtitle => 'توالی زمانی داستان را بازسازی کنید.';

  @override
  String get mirrorMazeTitle => 'پیچ و خم آینه';

  @override
  String get mirrorMazeSubtitle =>
      'یک پرتو لیزر را با استفاده از آینه های مورب هدایت کنید.';

  @override
  String get wordGridConnectionTitle => 'اتصالات کلمه';

  @override
  String get wordGridConnectionSubtitle =>
      '16 کلمه را به چهار دسته چهار تایی گروه بندی کنید.';

  @override
  String get shapeShifterPeripheralTitle => 'اشکال محیطی';

  @override
  String get shapeShifterPeripheralSubtitle =>
      'ردیابی شکل محیطی با تطبیق مقادیر مرکزی تغییر می کند.';

  @override
  String get soundWaveMatchTitle => 'تطابق موج صدا';

  @override
  String get soundWaveMatchSubtitle =>
      'هنگامی که فرکانس موج بصری با تغییرات زیر و بم همسو می شود، ضربه بزنید.';

  @override
  String get multiTrackCounterTitle => 'شمارنده چند مسیر';

  @override
  String get multiTrackCounterSubtitle =>
      'وقتی شمارنده به ضریب هدف افزایش می یابد، ضربه بزنید.';

  @override
  String get colorWordMatchUpTitle => 'تطابق رنگ';

  @override
  String get colorWordMatchUpSubtitle =>
      'تعیین کنید که آیا دو کلمه رنگی بر اساس تغییر قوانین مطابقت دارند یا خیر.';

  @override
  String get signalAndNoiseTitle => 'سیگنال و نویز';

  @override
  String get signalAndNoiseSubtitle =>
      'کاراکترهای الفبایی عددی مورد نظر را که در نویز استاتیک پنهان شده اند، پیدا کنید.';

  @override
  String get focusTunnelTitle => 'تونل فوکوس';

  @override
  String get focusTunnelSubtitle =>
      'نمادهای منطبق بر روی دیوارهای متحرک تونل را شناسایی کنید.';

  @override
  String get targetPursuerTitle => 'تعقیب کننده هدف';

  @override
  String get targetPursuerSubtitle =>
      'چندین دایره با هم تداخل دارند را دنبال کنید و هدف اصلی را انتخاب کنید.';

  @override
  String get gridGazeTitle => 'نگاه شبکه ای';

  @override
  String get gridGazeSubtitle =>
      'مشخص کنید کدام سلول شبکه با مدت زمان متفاوت فلش شده است.';

  @override
  String get doubleTroubleTitle => 'دردسر مضاعف';

  @override
  String get doubleTroubleSubtitle =>
      'دو بازی ساده مجزا را به طور همزمان در صفحه تقسیم شده بازی کنید.';

  @override
  String get syncRhythmTitle => 'ریتم همگام سازی';

  @override
  String get syncRhythmSubtitle =>
      'هنگامی که جاروب مترونوم بصری با ضرب سنکوپ شده مطابقت دارد، ضربه بزنید.';

  @override
  String get ghostTapTitle => 'روح ضربه بزنید';

  @override
  String get ghostTapSubtitle =>
      'هنگامی که پالس نامرئی به حداکثر ارتفاع خود رسید ضربه بزنید.';

  @override
  String get attentionalRsvpTitle => 'RSVP توجه';

  @override
  String get attentionalRsvpSubtitle =>
      'اعدادی که در فلش حروف سریال سریع ظاهر می شوند را شناسایی کنید.';

  @override
  String get colorMazeNavTitle => 'رنگ ماز ناو';

  @override
  String get colorMazeNavSubtitle =>
      'در کاشی‌های پیچ و خم مطابق با رنگ‌های مجوز پویا پیمایش کنید.';

  @override
  String get dynamicSalienceTitle => 'برجستگی پویا';

  @override
  String get dynamicSalienceSubtitle =>
      'شکلی را پیدا کنید که با پویایی کمی متفاوت حرکت می کند.';

  @override
  String get chalkAndTalkTitle => 'گچ و صحبت';

  @override
  String get chalkAndTalkSubtitle =>
      'کلماتی را که در صدا شنیده می شود تایپ کنید و حواس پرتی های بصری را نادیده بگیرید.';

  @override
  String get blinkDetectorTitle => 'آشکارساز چشمک زدن';

  @override
  String get blinkDetectorSubtitle =>
      'روی صفحه شبکه ای که دو بار پشت سر هم چشمک می زند ضربه بزنید.';

  @override
  String get frequencyTapTitle => 'فرکانس ضربه بزنید';

  @override
  String get frequencyTapSubtitle =>
      'روی دکمه مطابق با فرکانس پالس نور هدف ضربه بزنید.';

  @override
  String get yajilinTitle => 'حلقه یاجیلین';

  @override
  String get yajilinSubtitle =>
      'سلول های سیاه را قرار دهید و سرنخ های منطبق با حلقه را بکشید.';

  @override
  String get heyawakeTitle => 'شبکه Heyawake';

  @override
  String get heyawakeSubtitle =>
      'اتاق های شبکه ای بدون سلول های سیاه مجاور را سایه بزنید.';

  @override
  String get gokigenVariantTitle => 'نوع گوکیگن';

  @override
  String get gokigenVariantSubtitle =>
      'قطرهای بدون حلقه را با شمارش رئوس رسم کنید.';

  @override
  String get sheepAndWolvesTitle => 'گوسفند و گرگ';

  @override
  String get sheepAndWolvesSubtitle =>
      'حلقه ای بکشید که گوسفند را از گرگ جدا می کند.';

  @override
  String get islandNurikabeTitle => 'جزیره نوریکابه';

  @override
  String get islandNurikabeSubtitle =>
      'تشکیل جزایر مطابق با محدودیت های اندازه عددی.';

  @override
  String get shakashakaTitle => 'Shakashaka Rects';

  @override
  String get shakashakaSubtitle =>
      'کاشی های مثلثی را قرار دهید تا مناطق سفید مستطیلی شکل بگیرد.';

  @override
  String get litsTetrisTitle => 'LITS تترومینو';

  @override
  String get litsTetrisSubtitle =>
      'تترومینوها را در اتاق‌هایی بدون تکرار مجاور قرار دهید.';

  @override
  String get tapaWallTitle => 'دیوار تاپا';

  @override
  String get tapaWallSubtitle =>
      'سلول ها را سایه بزنید تا یک الگوی دیوار مشکی پیوسته تشکیل شود.';

  @override
  String get triangularBridgesTitle => 'پل های مثلثی';

  @override
  String get triangularBridgesSubtitle =>
      'جزایر را در 3 جهت وصل کنید که الزامات را برآورده می کنند.';

  @override
  String get rippleEffectTitle => 'افکت ریپل';

  @override
  String get rippleEffectSubtitle =>
      'اعداد را در اتاق ها با رعایت فاصله فاصله پر کنید.';

  @override
  String get suguruTectonicTitle => 'سوگورو گرید';

  @override
  String get suguruTectonicSubtitle =>
      'بلوک های اتاق را با اعداد 1 تا K بدون هیچ همسایه ای پر کنید.';

  @override
  String get tennerGridTitle => 'تنر گرید';

  @override
  String get tennerGridSubtitle =>
      'سطرها را با ارقام 0-9 پر کنید که با مجموع ستون‌ها مطابقت دارند.';

  @override
  String get kakurasuSumsTitle => 'مجموع کاکوراسو';

  @override
  String get kakurasuSumsSubtitle =>
      'سلول‌ها را برای برآورده کردن مجموع شاخص‌های وزنی سطر/سرب سایه بزنید.';

  @override
  String get corralLoopTitle => 'حلقه کورال';

  @override
  String get corralLoopSubtitle =>
      'یک حلقه منفرد بکشید که اعداد منطبق با دید را در بر می گیرد.';

  @override
  String get stostoneTitle => 'جاذبه سنگ استون';

  @override
  String get stostoneSubtitle =>
      'سلول‌هایی را که پایین می‌آیند تا ردیف‌های پایینی کاملاً پر شوند، سایه بزنید.';

  @override
  String get tripletsLogicTitle => 'سه گانه سه گانه';

  @override
  String get tripletsLogicSubtitle =>
      'شبکه را با سه شکل پر کنید و از سه در یک ردیف اجتناب کنید.';

  @override
  String get galaxiesSymTitle => 'تقارن کهکشان ها';

  @override
  String get galaxiesSymSubtitle =>
      'شبکه را به شکل های کهکشانی متقارن چرخشی تقسیم کنید.';

  @override
  String get matrixMultiplierMatchTitle => 'تطبیق ماتریس';

  @override
  String get matrixMultiplierMatchSubtitle =>
      'مقادیر سطر و ستون را برای مطابقت با محصول نقطه هدف ضرب کنید.';

  @override
  String get primeFactorTreesTitle => 'درختان فاکتور اصلی';

  @override
  String get primeFactorTreesSubtitle =>
      'اعداد مرکب را به جفت های عامل برگ اول تجزیه کنید.';

  @override
  String get vektorVectorTitle => 'وکتور وکتور';

  @override
  String get vektorVectorSubtitle =>
      'بردارها را مقیاس کنید تا مجموع آنها روی هدف قرار گیرد.';

  @override
  String get binomialMatchTitle => 'تطبیق دو جمله ای';

  @override
  String get binomialMatchSubtitle =>
      'فرمول های درجه دوم را با مقادیر دو جمله ای فاکتور گرفته شده مطابقت دهید.';

  @override
  String get percentageShoppingTitle => 'درصد خرید';

  @override
  String get percentageShoppingSubtitle =>
      'درصد تخفیف و مجموع پرداخت نهایی را محاسبه کنید.';

  @override
  String get cryptoArithmeticTitle => 'رمزنگاری - حسابی';

  @override
  String get cryptoArithmeticSubtitle =>
      'کرک مسائل ریاضی رمز جایگزینی کاراکتر رقم.';

  @override
  String get fractionalPizzaTitle => 'پیتزا کسری';

  @override
  String get fractionalPizzaSubtitle =>
      'برش های پیتزا را برای مطابقت با کسرهای جمع هدف تقسیم کنید.';

  @override
  String get numberBondsTitle => 'اوراق قرضه شماره';

  @override
  String get numberBondsSubtitle =>
      'مقادیر گره را برای برابری با مجموع اتصال هدف پیوند دهید.';

  @override
  String get gridSumLineTitle => 'خط جمع شبکه';

  @override
  String get gridSumLineSubtitle =>
      'مسیری را ترسیم کنید که مقادیر آن دقیقاً با هدف ارزیابی می شود.';

  @override
  String get binaryScaleBalanceTitle => 'تعادل مقیاس باینری';

  @override
  String get binaryScaleBalanceSubtitle =>
      'وزن اعشاری را با استفاده از بلوک های توان دو متوازن کنید.';

  @override
  String get moduloPathTitle => 'مسیر مدولو';

  @override
  String get moduloPathSubtitle =>
      'پیمایش سلول های شبکه ای که با مقادیر باقیمانده مدول مطابقت دارند.';

  @override
  String get digitSwapEqTitle => 'معادلات مبادله رقمی';

  @override
  String get digitSwapEqSubtitle =>
      'برای تصحیح هر دو، تک رقمی را بین معادلات عوض کنید.';

  @override
  String get areaPerimeterMatchTitle => 'مساحت و محیط';

  @override
  String get areaPerimeterMatchSubtitle =>
      'مستطیل هایی را با مساحت و محیط هدف ترسیم کنید.';

  @override
  String get inequalityBalanceOpsTitle => 'تعادل نابرابری';

  @override
  String get inequalityBalanceOpsSubtitle =>
      'نمادهای نابرابری را بین اصطلاحات پیچیده ریاضی قرار دهید.';

  @override
  String get graphCoordinatePlotTitle => 'گراف پلاتر';

  @override
  String get graphCoordinatePlotSubtitle =>
      'مختصات شبکه نمودار منحنی های خطی / درجه دوم مطابقت دارند.';

  @override
  String get baseConversionRunTitle => 'تبدیل پایه';

  @override
  String get baseConversionRunSubtitle =>
      'تبدیل مقادیر بین باینری، اعشاری، هگزا و اکتال.';

  @override
  String get unitConverterProTitle => 'مبدل واحد';

  @override
  String get unitConverterProSubtitle =>
      'به تبدیل سریع واحد تحت محدودیت زمانی پاسخ دهید.';

  @override
  String get auditoryNBackTitle => 'شنوایی N-Back';

  @override
  String get auditoryNBackSubtitle => 'حروف گفتاری شنیده شده را مطابقت دهید.';

  @override
  String get abstractPatternRecallTitle => 'لایه بندی الگو';

  @override
  String get abstractPatternRecallSubtitle =>
      'بازسازی اشکال رنگارنگ لایه ای از مطالعه حافظه.';

  @override
  String get roomInspectorTitle => 'بازرس اتاق';

  @override
  String get roomInspectorSubtitle =>
      'اصلاحات مبلمان را که در زمانی که صفحه نمایش خالی بود، انجام دهید.';

  @override
  String get voiceToFaceMatchTitle => 'تطبیق صدا و چهره';

  @override
  String get voiceToFaceMatchSubtitle =>
      'چهره صحیح مرتبط با کلیپ صوتی صوتی را انتخاب کنید.';

  @override
  String get spatialGridMemory3DTitle => 'حافظه فضایی سه بعدی';

  @override
  String get spatialGridMemory3DSubtitle =>
      'بلوک‌های فلش‌شده را در ساختار شبکه‌ای مکعبی سه‌بعدی چرخانده شده به یاد بیاورید.';

  @override
  String get sequenceStackTitle => 'پشته دنباله';

  @override
  String get sequenceStackSubtitle =>
      'اضافه کردن و حذف پشته صفحات را به ترتیب بازسازی کنید.';

  @override
  String get semanticCategoryRecallTitle => 'فراخوان دسته';

  @override
  String get semanticCategoryRecallSubtitle =>
      'کلمات مطالعه مطابق با اهداف دسته بندی درخواستی را شناسایی کنید.';

  @override
  String get gridDisplacementTitle => 'جابجایی شبکه';

  @override
  String get gridDisplacementSubtitle =>
      'نمادهای جابجا شده را در مقایسه طرح بندی با اصلی شناسایی کنید.';

  @override
  String get soundSequenceMatchTitle => 'مسابقه سکانس صدا';

  @override
  String get soundSequenceMatchSubtitle =>
      'سکانس های نت را تکرار کنید که روی صفحه کلید مجازی پخش می شوند.';

  @override
  String get cardCountingMemoryTitle => 'شمارنده کارت';

  @override
  String get cardCountingMemorySubtitle =>
      'کارت‌هایی را که قبلاً در معاملات مداوم کارت پرداخت شده‌اند، شناسایی کنید.';

  @override
  String get directionsRecallTitle => 'دستورالعمل ها را به یاد بیاورید';

  @override
  String get directionsRecallSubtitle =>
      'نقشه‌های شبکه‌ای را که جهت‌های مسیر را از حافظه مطابقت دارند، پیمایش کنید.';

  @override
  String get eventTimelineMemoryTitle => 'جدول زمانی رویداد';

  @override
  String get eventTimelineMemorySubtitle =>
      'کارت های رویداد تاریخی/تخیلی را به ترتیب زمانی مرتب کنید.';

  @override
  String get featureMatrixRecallTitle => 'ماتریس ویژگی';

  @override
  String get featureMatrixRecallSubtitle =>
      'به درخواست های پرس و جو در مورد ویژگی های شکل-رنگ سلول پاسخ دهید.';

  @override
  String get delayedMatchSampleTitle => 'مسابقه با تاخیر';

  @override
  String get delayedMatchSampleSubtitle =>
      'پس از حل عوامل حواس پرتی ریاضی، نماد هدف را مطابقت دهید.';

  @override
  String get symbolDigitAssocTitle => 'Symbol-Digit Assoc';

  @override
  String get symbolDigitAssocSubtitle =>
      'برگه های ترجمه نماد مطابق با کلیدهای رقمی را حل کنید.';

  @override
  String get dualTaskMemoryTitle => 'حافظه دو کاره';

  @override
  String get dualTaskMemorySubtitle =>
      'هنگام حل تکالیف سریع حسابی، مجموعه کلمات را به خاطر بسپارید.';

  @override
  String get actionSequenceRecallTitle => 'فراخوان اقدام';

  @override
  String get actionSequenceRecallSubtitle =>
      'دنباله های انیمیشن ژست کاراکترها را به ترتیب تکرار کنید.';

  @override
  String get tangramPolygonTitle => 'تنگرام فیت';

  @override
  String get tangramPolygonSubtitle =>
      'اشکال چند ضلعی را برای پر کردن خطوط شبح ترتیب دهید.';

  @override
  String get mazeNav3DTitle => '3D Maze Nav';

  @override
  String get mazeNav3DSubtitle =>
      'مسیرهای پیچ و خم ایزومتریک سه بعدی را از نمای اول شخص پیمایش کنید.';

  @override
  String get isometricProjectionTitle => 'پروژکتور ایزومتریک';

  @override
  String get isometricProjectionSubtitle =>
      'شکل‌های بلوک سه‌بعدی را با نماهای دوبعدی بالا/جلو مطابقت دهید.';

  @override
  String get polyominoPackingTitle => 'بسته بندی پلیومینو';

  @override
  String get polyominoPackingSubtitle =>
      'قطعات بلوک پلیومینو تصادفی را در مناطق هدف بسته بندی کنید.';

  @override
  String get spatialGridRotationTitle => 'چرخش شبکه فضایی';

  @override
  String get spatialGridRotationSubtitle =>
      'ترتیبات بلوک سه بعدی را که در امتداد مختصات محور چرخانده شده اند مطابقت دهید.';

  @override
  String get wireLoopGameTitle => 'حلقه سیم';

  @override
  String get wireLoopGameSubtitle =>
      'حلقه های فلزی را بدون تماس در امتداد خطوط سیم بکشید.';

  @override
  String get origamiUnfoldTitle => 'اوریگامی باز می شود';

  @override
  String get origamiUnfoldSubtitle =>
      'پس از باز کردن ورق های تا شده، الگوهای سوراخ سوراخ را شناسایی کنید.';

  @override
  String get ropeTangleSolverTitle => 'طناب باز کن';

  @override
  String get ropeTangleSolverSubtitle =>
      'گره ها را برای چیدمان نمودارهای مسطح با خطوط صفر بکشید.';

  @override
  String get gridFitTetrisTitle => 'حلگر گرید فیت';

  @override
  String get gridFitTetrisSubtitle =>
      'بلوک های استاتیک نامنظم را طوری بچینید که در محدوده کانتینر قرار گیرند.';

  @override
  String get vectorGridAlignmentTitle => 'تراز برداری';

  @override
  String get vectorGridAlignmentSubtitle =>
      'مقیاس و چرخش اشکال برای مطابقت با اهداف الگوی سایه.';

  @override
  String get blockStackingPhysicsTitle => 'انباشته شدن بلوک';

  @override
  String get blockStackingPhysicsSubtitle =>
      'پانل های بلوک نامنظم را روی هم قرار دهید که وزن گرانش را متعادل می کند.';

  @override
  String get crossSectionMatch3DTitle => 'مقطع سه بعدی';

  @override
  String get crossSectionMatch3DSubtitle =>
      'هندسه های برش دوبعدی برش خورده از اشکال سه بعدی را شناسایی کنید.';

  @override
  String get symmetryPaintTitle => 'رنگ متقارن';

  @override
  String get symmetryPaintSubtitle =>
      'بخش های تصویر آینه ای را ترسیم کنید که در محورهای تقارن منعکس می شوند.';

  @override
  String get rollingBlockBloxTitle => 'بلوک نورد';

  @override
  String get rollingBlockBloxSubtitle =>
      'قطعات بلوک را بچرخانید تا به صورت عمودی در شکاف های هدف فرود آیند.';

  @override
  String get perspectiveShiftViewTitle => 'تغییر دیدگاه';

  @override
  String get perspectiveShiftViewSubtitle =>
      'خوشه های بلوک را تا زمانی که حروف/کلمات را املا کنند بچرخانید.';

  @override
  String get networkFlowSphericalTitle => 'جریان شبکه';

  @override
  String get networkFlowSphericalSubtitle =>
      'جریان‌های شبکه را روی مختصات استوانه‌ای پیچیده وصل کنید.';

  @override
  String get layeredSilhouetteBlendTitle => 'ترکیب سیلوئت';

  @override
  String get layeredSilhouetteBlendSubtitle =>
      'لایه های رنگی را روی هم قرار دهید تا با اشکال شفاف هدف مطابقت داشته باشد.';

  @override
  String get wordWheelPangramTitle => 'آناگرام های کلمه';

  @override
  String get wordWheelPangramSubtitle =>
      'کلمات حاوی حروف هدف مرکزی را از چرخ بسازید.';

  @override
  String get letterGridSwapperTitle => 'مبادله نامه';

  @override
  String get letterGridSwapperSubtitle =>
      'کاشی های حروف مجاور را برای تکمیل کلمات سطر و سرفصل عوض کنید.';

  @override
  String get synonymMatchTitle => 'مطابقت مترادف';

  @override
  String get synonymMatchSubtitle =>
      'اهداف کلمه در حال سقوط را با مترادف یا متضاد مطابقت دهید.';

  @override
  String get vowelDropTitle => 'افت واکه';

  @override
  String get vowelDropSubtitle =>
      'برای تکمیل کلمات، حروف صدادار را در شبکه های مختصات رها کنید.';

  @override
  String get letterBalanceScaleTitle => 'مقیاس تعادل کلمه';

  @override
  String get letterBalanceScaleSubtitle =>
      'املای کلماتی که حرف آنها ارزش تعادل را دارد.';

  @override
  String get wordChainShiritoriTitle => 'زنجیره کلمات';

  @override
  String get wordChainShiritoriSubtitle =>
      'حلقه های کلمه را که با خروجی حروف قبلی شروع می شود پیوند دهید.';

  @override
  String get affixBuilderTitle => 'Affix Builder';

  @override
  String get affixBuilderSubtitle =>
      'برای ساختن واژگان هدف، پیشوندها/پسوندها را ترکیب کنید.';

  @override
  String get decipherCrypticCluesTitle => 'رمزگشای رمزی';

  @override
  String get decipherCrypticCluesSubtitle =>
      'حل پازل های بازی با کلمات و رمزگشایی معماهای املایی.';

  @override
  String get boggleWordSearchTitle => 'Boggle Connect';

  @override
  String get boggleWordSearchSubtitle =>
      'مسیرهای متصل مجاور را برای یافتن کلمات پنهان ردیابی کنید.';

  @override
  String get idiomUnscrambleTitle => 'اصطلاح Unscramble';

  @override
  String get idiomUnscrambleSubtitle =>
      'آرایه های کلمات درهم را برای مطابقت با معانی اصطلاحی مرتب کنید.';

  @override
  String get letterPyramidsTitle => 'اهرام حروف';

  @override
  String get letterPyramidsSubtitle =>
      'برج‌های کلمه بسازید که حروف آنگرام را در هر ردیف اضافه کنید.';

  @override
  String get soundAlikeHomophonesTitle => 'مسابقات هوموفون';

  @override
  String get soundAlikeHomophonesSubtitle =>
      'املای درست همآفون جملات را مشخص کنید.';

  @override
  String get wordGridSudokuTitle => 'کلمه سودوکو';

  @override
  String get wordGridSudokuSubtitle =>
      'حروف تکه تکه در ردیف های شبکه ای که کلمات را تشکیل می دهند.';

  @override
  String get portmanteauFactoryTitle => 'کارخانه پورتمانتو';

  @override
  String get portmanteauFactorySubtitle =>
      'ادغام اجزای معنایی ایجاد کلمات مرکب.';

  @override
  String get codedCrosswordsCodeTitle => 'کلمات متقاطع کلمات رمزی';

  @override
  String get codedCrosswordsCodeSubtitle =>
      'حل جدول کلمات متقاطع با کدهای عدد به حرف.';

  @override
  String get wordSnakeTrailTitle => 'کلمه مار';

  @override
  String get wordSnakeTrailSubtitle =>
      'ردیابی حروف مار مانند با املای کلمات موضوعی.';

  @override
  String get typingRhythmSpeedTitle => 'تایپ کردن Flow';

  @override
  String get typingRhythmSpeedSubtitle =>
      'تایپ واژگان مطابق با ضربان ریتم مترونوم.';

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
  String get hideGame => 'پنهان کردن';

  @override
  String get unhideGame => 'آشکار کردن';

  @override
  String get favoriteGame => 'علاقه‌مندی';

  @override
  String get unfavoriteGame => 'حذف از علاقه‌مندی‌ها';

  @override
  String get hiddenGames => 'بازی‌های پنهان';

  @override
  String showHiddenGames(int count) {
    return 'نمایش بازی‌های پنهان ($count)';
  }

  @override
  String get noHiddenGames => 'هیچ بازی پنهانی وجود ندارد';

  @override
  String get gameHidden => 'بازی پنهان شد';

  @override
  String get undo => 'واگرد';

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
  String get btnMatchColor => 'تطبیق رنگ';

  @override
  String get btnMatchWord => 'تطبیق کلمه';

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
