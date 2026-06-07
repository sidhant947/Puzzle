// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'پزل حب';

  @override
  String get home => 'ہوم';

  @override
  String get settings => 'سیٹنگز';

  @override
  String get playAgain => 'دوبارہ کھیلیں';

  @override
  String get playNext => 'اگلا کھیلیں';

  @override
  String get seeCompleted => 'جائزہ';

  @override
  String get finish => 'ختم کریں';

  @override
  String get congrats => 'مبارک ہو';

  @override
  String get perfectGradient => 'بہترین گریڈینٹ!';

  @override
  String get wellDone => 'بہت اچھے';

  @override
  String get timeUp => 'وقت ختم!';

  @override
  String get completed => 'مکمل ہو گیا!';

  @override
  String get score => 'اسکور';

  @override
  String get timeLeft => 'وقت';

  @override
  String get trials => 'کوششیں';

  @override
  String get numberRule => 'نمبر کا اصول';

  @override
  String get colorRule => 'رنگ کا اصول';

  @override
  String get valid => 'درست';

  @override
  String get invalid => 'غلط';

  @override
  String get even => 'جفت';

  @override
  String get odd => 'طاق';

  @override
  String get red => 'سرخ';

  @override
  String get green => 'سبز';

  @override
  String get blue => 'نیلا';

  @override
  String get yes => 'جی ہاں';

  @override
  String get no => 'نہیں';

  @override
  String get trueLabel => 'سچ';

  @override
  String get falseLabel => 'جھوٹ';

  @override
  String get clear => 'صاف کریں';

  @override
  String get north => 'شمال';

  @override
  String get south => 'جنوب';

  @override
  String get east => 'مشرق';

  @override
  String get west => 'مغرب';

  @override
  String get target => 'ہدف';

  @override
  String get moves => 'چالیں';

  @override
  String get trialMode => 'ٹرائل موڈ';

  @override
  String get trialModeDescription =>
      '60 سیکنڈ ٹائمر کے بجائے 20 حل کرکے ختم کریں';

  @override
  String get appearance => 'ظاہری شکل';

  @override
  String get language => 'زبان';

  @override
  String get gameplay => 'گیم پلے';

  @override
  String get supportUs => 'ہماری مدد کریں';

  @override
  String get systemLegal => 'سسٹم اور قانونی';

  @override
  String get games => 'گیمز';

  @override
  String get solvedToday => 'آج حل کیے گئے';

  @override
  String get searchGames => 'گیمز تلاش کریں...';

  @override
  String get readyToStart => 'اپنے دماغی ورزش شروع کرنے کے لیے تیار ہیں؟';

  @override
  String get greatStart => 'بہترین آغاز! اس رفتار کو برقرار رکھیں۔';

  @override
  String get onFire => 'بہت خوب! آپ کا دماغ اسے پسند کر رہا ہے۔';

  @override
  String get incredible => 'ناقابل یقین! آپ پزل کے ماہر ہیں۔';

  @override
  String get noGamesMatch => 'آپ کی تلاش کے مطابق کوئی گیم نہیں ملی';

  @override
  String get categoryAll => 'تمام';

  @override
  String get categoryAttention => 'توجہ';

  @override
  String get categoryLogic => 'منطق';

  @override
  String get categoryMath => 'ریاضی';

  @override
  String get categoryWord => 'الفاظ';

  @override
  String get categoryMemory => 'یادداشت';

  @override
  String get categorySpatial => 'مکانی';

  @override
  String get themeLight => 'روشن';

  @override
  String get themeDark => 'تاریک';

  @override
  String get themeSystem => 'سسٹم';

  @override
  String get starOnGithub => 'GitHub پر اسٹار دیں';

  @override
  String get sponsorOnGithub => 'GitHub پر اسپانسر کریں';

  @override
  String get privacyPolicy => 'رازداری کی پالیسی';

  @override
  String get termsOfService => 'سروس کی شرائط';

  @override
  String get licenses => 'لائسنس';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return 'آپ کے پاس چھپے ہوئے $wordLength حروف والے لفظ کو تلاش کرنے کے لیے $maxTries کوششیں ہیں۔';
  }

  @override
  String wordFoundMessage(String word) {
    return 'لفظ کامیابی سے مل گیا: $word';
  }

  @override
  String gameOverMessage(String word) {
    return 'لفظ یہ تھا: $word';
  }

  @override
  String get gameOver => 'گیم ختم';

  @override
  String get crosswordTitle => 'کراس ورڈ';

  @override
  String get crosswordSubtitle =>
      'فراہم کردہ اشاروں کی بنیاد پر گرڈ کو صحیح الفاظ کے ساتھ مکمل کریں۔';

  @override
  String get wordSearchTitle => 'لفظوں کی تلاش';

  @override
  String get radicalRootsTitle => 'ریڈیکل روٹس';

  @override
  String get radicalRootsSubtitle =>
      'دیے گئے نمبر کا مربع یا مکعب جڑ تلاش کریں۔ اگر ضروری ہو تو قریب ترین عدد تک راؤنڈ کریں۔';

  @override
  String get radicalRootsGoalReached => 'ہدف مکمل!';

  @override
  String get radicalRootsTimeUp => 'وقت ختم!';

  @override
  String radicalRootsScoreMessage(int score) {
    return 'آپ نے $score جڑیں صحیح طریقے سے حساب کیں!';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return 'مشق جاری رکھیں! آپ نے $score جڑیں حساب کیں۔';
  }

  @override
  String get radicalRootsStart => 'حساب شروع کریں';

  @override
  String get radicalRootsDescription =>
      'آپ کے پاس زیادہ سے زیادہ حل کرنے کے لیے 60 سیکنڈ ہیں۔';

  @override
  String get radicalRootsBest => 'بہترین';

  @override
  String get radicalRootsSeconds => '60 سیکنڈ';

  @override
  String get romanArithmeticTitle => 'رومی ریاضی';

  @override
  String get romanArithmeticSubtitle =>
      'رومی اعداد کا استعمال کرتے ہوئے جمع اور تفریق کے مسائل حل کریں۔';

  @override
  String get romanArithmeticGoalReached => 'سینچورین لیول!';

  @override
  String get romanArithmeticTimeUp => 'وقت ختم!';

  @override
  String romanArithmeticScoreMessage(int score) {
    return 'آپ نے $score رومی مسائل حل کیے!';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return 'وینی، ویڈی، ویچی! آپ نے $score مسائل حل کیے۔';
  }

  @override
  String get romanArithmeticStart => 'مہم شروع کریں';

  @override
  String get romanArithmeticDescription =>
      'تبدیل کریں اور حل کریں۔ آپ کے پاس 60 سیکنڈ ہیں۔';

  @override
  String get romanArithmeticBest => 'بہترین';

  @override
  String get romanArithmeticSeconds => '60 سیکنڈ';

  @override
  String get wordSearchSubtitle =>
      'گرڈ میں تمام چھپے ہوئے الفاظ تلاش کریں۔ منتخب کرنے کے لیے گھسیٹیں۔';

  @override
  String get missingVowelsTitle => 'غائب حروف علت';

  @override
  String get missingVowelsSubtitle =>
      'اس لفظ کی شناخت کریں جس کے حروف علت چھپے ہوئے ہیں۔';

  @override
  String get missingVowelsWin => 'حروف علت بحال ہو گئے!';

  @override
  String get missingVowelsHowToPlay =>
      'ایک لفظ اس کے حروف علت (A, E, I, O, U) چھپے ہوئے دکھایا جاتا ہے۔ مکمل لفظ کا اندازہ لگائیں!';

  @override
  String get wordScrambleTitle => 'لفظوں کا الٹ پلٹ';

  @override
  String get wordScrambleSubtitle =>
      'چھپے ہوئے لفظ کو سلجھانے کے لیے حروف پر ٹیپ کریں!';

  @override
  String get wordScrambleWin => 'لفظ سلجھ گیا!';

  @override
  String get sudokuTitle => 'سوڈوکو';

  @override
  String get sudokuSubtitle =>
      'گرڈ کو مکمل کریں تاکہ ہر قطار، کالم اور 3x3 باکس میں 1 سے 9 تک کے تمام ہندسے ہوں۔';

  @override
  String get minesweeperTitle => 'مائن سویپر';

  @override
  String get minesweeperSubtitle =>
      'دھماکہ کیے بغیر تمام بارودی سرنگوں کی شناخت کریں۔';

  @override
  String get minesweeperWin => 'فتح!';

  @override
  String get minesweeperMines => 'سرنگیں';

  @override
  String get minesweeperStatus => 'حالت';

  @override
  String get minesweeperWon => 'جیت گئے';

  @override
  String get minesweeperBoom => 'دھماکہ';

  @override
  String get minesweeperPlaying => 'کھیل جاری ہے';

  @override
  String get minesweeperReveal => 'ظاہر کریں';

  @override
  String get minesweeperFlag => 'جھنڈا';

  @override
  String get game2048Title => '2048';

  @override
  String get game2048Subtitle =>
      'ٹائلوں کو ضم کرنے اور 2048 ٹائل تک پہنچنے کے لیے کسی بھی سمت سوائپ کریں!';

  @override
  String get nonogramTitle => 'نونگرام';

  @override
  String get nonogramSubtitle =>
      'منطق کے اشاروں کا استعمال کرتے ہوئے چھپی ہوئی تصویر ظاہر کریں۔';

  @override
  String get nonogramWin => 'تصویر ظاہر ہو گئی!';

  @override
  String get magnetsTitle => 'میگنےٹس';

  @override
  String get magnetsSubtitle =>
      'پول کی گنتی کی بنیاد پر گرڈ میں میگنےٹس رکھیں۔';

  @override
  String get magnetsHowToPlay =>
      'ڈومینو سائز کے کنٹینرز کو \'+\' اور \'-\' میگنےٹس سے بھریں یا انہیں خالی چھوڑ دیں۔ قطار اور کالم کے اشارے اس لائن میں ہر پول کی کل تعداد بتاتے ہیں۔ ایک جیسے پول عمودی یا افقی طور پر ایک دوسرے کے ساتھ نہیں ہو سکتے۔';

  @override
  String get magnetsWinTitle => 'قطبیت متوازن!';

  @override
  String get magnetsWinMessage =>
      'تمام میگنےٹس مکمل طور پر ترتیب دیئے گئے ہیں!';

  @override
  String get lighthousesTitle => 'لائٹ ہاؤسز';

  @override
  String get lighthousesSubtitle =>
      'لائٹ ہاؤس کے اشاروں کی بنیاد پر بحری جہاز رکھیں۔';

  @override
  String get lighthousesHowToPlay =>
      'گرڈ میں 1x1 سائز کے بحری جہاز رکھیں۔ لائٹ ہاؤسز افقی اور عمودی طور پر نظر آنے والے جہازوں کی کل تعداد کی نشاندہی کرتے ہیں۔ بحری جہاز لائٹ ہاؤسز یا ایک دوسرے کو نہیں چھو سکتے، یہاں تک کہ ترچھی شکل میں بھی نہیں۔';

  @override
  String get lighthousesWinTitle => 'سمندر محفوظ!';

  @override
  String get lighthousesWinMessage =>
      'تمام لائٹ ہاؤسز جہازوں کی مکمل رہنمائی کر رہے ہیں!';

  @override
  String get dominosaTitle => 'ڈومینوسا';

  @override
  String get dominosaSubtitle => 'گرڈ میں تمام چھپے ہوئے ڈومینوز تلاش کریں۔';

  @override
  String get dominosaHowToPlay =>
      'نمبروں کے گرڈ پر ڈومینوز کا ایک مکمل سیٹ اس طرح ترتیب دیں کہ ملحقہ نمبروں کا ہر جوڑا بالکل ایک ڈومینو سے ڈھکا ہوا ہو۔ نمبروں کا ہر جوڑا سیٹ میں صرف ایک بار ہوتا ہے۔';

  @override
  String get dominosaWinTitle => 'ڈومینو ماسٹر!';

  @override
  String get dominosaWinMessage => 'ہر ڈومینو مل گیا ہے اور رکھ دیا گیا ہے!';

  @override
  String get skyscrapersTitle => 'سکائی سکریپرز';

  @override
  String get skyscrapersSubtitle => 'گرڈ کو عمارتوں کی بلندیوں سے بھریں۔';

  @override
  String get skyscrapersHowToPlay =>
      'گرڈ کو بلندیوں (1-N) سے بھریں تاکہ ہر قطار اور کالم میں ہر بلندی بالکل ایک بار ہو۔ کناروں پر موجود اشارے بتاتے ہیں کہ اس سمت سے کتنی عمارتیں نظر آ رہی ہیں، اونچی عمارتیں چھوٹی عمارتوں کو چھپا لیتی ہیں۔';

  @override
  String get skyscrapersWinTitle => 'اسکائی لائن بحال!';

  @override
  String get skyscrapersWinMessage =>
      'تمام عمارتیں مکمل طور پر اپنی جگہ پر ہیں!';

  @override
  String get nurikabeTitle => 'نوریکابے';

  @override
  String get nurikabeSubtitle => 'ایک جڑا ہوا سمندر اور الگ الگ جزیرے بنائیں۔';

  @override
  String get nurikabeHowToPlay =>
      'ایک واحد جڑے ہوئے \'سمندر\' (کوئی 2x2 بلاکس نہیں) بنانے کے لیے سیلز کو شیڈ کریں۔ بغیر شیڈ والے سیلز \'جزیرے\' بناتے ہیں، جن میں سے ہر ایک میں بالکل ایک نمبر ہوتا ہے جو اس کے کل رقبے کی نمائندگی کرتا ہے۔';

  @override
  String get nurikabeWinTitle => 'سمندر بہہ رہا ہے!';

  @override
  String get nurikabeWinMessage => 'جزیرے الگ ہو گئے، سمندر جڑ گیا!';

  @override
  String get fillominoTitle => 'فیلو مینو';

  @override
  String get fillominoSubtitle =>
      'گرڈ کو مخصوص سائز کے پولی مینو میں تقسیم کریں۔';

  @override
  String get fillominoHowToPlay =>
      'گرڈ کو پولی مینو میں تقسیم کریں تاکہ سائز N کا ہر پولی مینو اپنے تمام سیلز میں نمبر N رکھے۔ ایک ہی سائز کے پولی مینو عمودی یا افقی طور پر ایک دوسرے کے ساتھ نہیں ہو سکتے۔';

  @override
  String get fillominoWinTitle => 'گرڈ تقسیم ہو گیا!';

  @override
  String get fillominoWinMessage => 'منطق کے ساتھ مکمل طور پر ٹائل کیا گیا!';

  @override
  String get hitoriTitle => 'ہٹوری';

  @override
  String get hitoriSubtitle =>
      'ہر قطار اور کالم میں ڈپلیکیٹ نمبروں کو شیڈ کریں۔';

  @override
  String get hitoriHowToPlay =>
      'سیلز کو شیڈ کریں تاکہ کوئی بھی نمبر کسی بھی قطار یا کالم میں ایک سے زیادہ بار نہ آئے۔ شیڈ شدہ سیلز ایک دوسرے کے ساتھ (عمودی یا افقی طور پر) نہیں ہو سکتے، اور تمام بغیر شیڈ والے سیلز کو ایک واحد جڑا ہوا گروپ بنانا چاہیے۔';

  @override
  String get hitoriWinTitle => 'ہٹوری ماسٹر!';

  @override
  String get hitoriWinMessage =>
      'آپ نے کامیابی سے تمام ڈپلیکیٹس کو حل کر لیا ہے!';

  @override
  String get pathFinderTitle => 'راستہ تلاش کرنے والا';

  @override
  String get pathFinderSubtitle => 'S سے E تک چھپا ہوا راستہ تلاش کریں۔';

  @override
  String get pathFinderWin => 'راستہ مل گیا!';

  @override
  String get howToPlay => 'کیسے کھیلیں';

  @override
  String get gotIt => 'سمجھ گیا';

  @override
  String get akariTitle => 'اکاری';

  @override
  String get akariSubtitle => 'تمام سفید خلیوں کو روشن کریں';

  @override
  String get akariHowToPlay =>
      'پورے گرڈ کو روشن کرنے کے لیے سفید خلیوں میں لائٹ بلب رکھیں۔ بلب اپنی قطار اور کالم کو اس وقت تک روشن کرتے ہیں جب تک کہ وہ دیوار سے نہ ٹکرا جائیں۔ دو بلب ایک دوسرے پر روشنی نہیں ڈال سکتے۔ نمبر والی دیواریں بتاتی ہیں کہ ملحقہ خلیوں (اوپر، نیچے، بائیں، دائیں) میں بالکل کتنے بلب رکھے جانے چاہئیں۔';

  @override
  String get akariWinTitle => 'روشنیاں جل اٹھیں!';

  @override
  String get akariWinMessage => 'سب کچھ بہترین طریقے سے روشن ہے۔';

  @override
  String get arithmeticChainTitle => 'چین کیلکولیٹر';

  @override
  String get arithmeticChainSubtitle => 'ذہن میں چلنے والے کل کا حساب لگائیں';

  @override
  String get arithmeticChainWinTitle => 'لیول اپ!';

  @override
  String get arithmeticChainWinMessage => 'آپ کا ذہنی حساب تیز ہے!';

  @override
  String get arithmeticChainLoseTitle => 'دوبارہ کوشش کریں';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return 'صحیح جواب $answer تھا۔';
  }

  @override
  String get arithmeticChainStart => 'شروع کریں';

  @override
  String get arithmeticChainNext => 'اگلا';

  @override
  String get attentionalBlinkTitle => 'توجہ کا جھپکنا';

  @override
  String get attentionalBlinkSubtitleWatch => 'نمبروں پر نظر رکھیں';

  @override
  String get attentionalBlinkSubtitleInput =>
      'وہ دو نمبر درج کریں جو آپ نے دیکھے';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return 'آپ نے $score اہداف حاصل کیے!';
  }

  @override
  String get balanceScaleTitle => 'ترازو';

  @override
  String get balanceScaleSubtitle =>
      'ترازو کی بنیاد پر آخری چیز کے وزن کا اندازہ لگائیں۔';

  @override
  String get balanceScaleWinTitle => 'متوازن!';

  @override
  String get balanceScaleWinMessage => 'آپ نے صحیح وزن کا اندازہ لگایا!';

  @override
  String get balanceScaleLoseTitle => 'غیر متوازن';

  @override
  String get balanceScaleLoseMessage =>
      'صحیح توازن تلاش کرنے کے لیے دوبارہ کوشش کریں۔';

  @override
  String get balanceScaleBack => 'واپس';

  @override
  String get balanceScaleSubmit => 'جمع کریں';

  @override
  String get binaryPuzzleTitle => 'بائنری پزل';

  @override
  String get binaryPuzzleSubtitle =>
      '0 اور 1 سے بھریں۔ زیادہ سے زیادہ ایک جیسے دو ہندسے ساتھ ہو سکتے ہیں۔ ہر قطار اور کالم میں 0 اور 1 کی تعداد برابر ہونی چاہیے۔';

  @override
  String get binaryPuzzleWinTitle => 'بہت اچھے';

  @override
  String get binaryPuzzleWinMessage =>
      'آپ نے بہترین منطق کے ساتھ بائنری پزل حل کیا!';

  @override
  String get blockEscapeTitle => 'بلاک فرار';

  @override
  String get blockEscapeSubtitle =>
      'بنیادی بلاک کے باہر نکلنے کا راستہ صاف کرنے کے لیے بلاکس کو سلائیڈ کریں۔';

  @override
  String get blockEscapeWinTitle => 'فرار!';

  @override
  String get blockEscapeWinMessage =>
      'آپ نے بنیادی بلاک کے لیے راستہ کامیابی سے صاف کر لیا!';

  @override
  String get boxCompletionTitle => 'باکس کی تکمیل';

  @override
  String get boxCompletionSubtitle => 'کون سا مکعب بن سکتا ہے؟';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return 'آپ نے $totalTrials میں سے $score صحیح کیے!';
  }

  @override
  String get boxCompletionOptions => 'آپشنز';

  @override
  String get bridgesTitle => 'پل';

  @override
  String get bridgesSubtitle =>
      'جزیروں کو پلوں سے جوڑیں۔ ہر جزیرے کو پلوں کی ایک خاص تعداد کی ضرورت ہوتی ہے۔ پل ایک دوسرے کو کراس نہیں کر سکتے۔';

  @override
  String get bridgesWinTitle => 'منسلک!';

  @override
  String get bridgesWinMessage => 'آپ نے تمام جزیروں کو کامیابی سے جوڑ دیا!';

  @override
  String get calculationSprintTitle => 'حساب کی دوڑ';

  @override
  String get calculationSprintSubtitle =>
      '60 سیکنڈ میں جتنی ہو سکے مساواتیں حل کریں۔';

  @override
  String get calculationSprintGoalReached => 'ہدف حاصل کر لیا!';

  @override
  String get calculationSprintTimeUp => 'وقت ختم ہو گیا';

  @override
  String calculationSprintScoreMessage(int score) {
    return 'بہترین حساب کی رفتار! آپ نے $score پوائنٹس حاصل کیے۔';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return 'آپ نے $score پوائنٹس حاصل کیے۔ اپنے بہترین اسکور کو توڑنے کی کوشش کریں!';
  }

  @override
  String get calculationSprintBest => 'بہترین';

  @override
  String get calculationSprintSeconds => '60 سیکنڈ';

  @override
  String get calculationSprintDescription =>
      'تیزی سے مساواتیں حل کریں۔\nغلط جواب پر 3 سیکنڈ کاٹ دیے جائیں گے!';

  @override
  String get calculationSprintStart => 'دوڑ شروع کریں';

  @override
  String get categoryFluencyTitle => 'زمرہ روانی';

  @override
  String get categoryFluencySubtitle =>
      'زمرے سے تعلق رکھنے والی چیزیں درج کریں';

  @override
  String get categoryFluencyExpert => 'روانی کے ماہر!';

  @override
  String get categoryFluencyTimeUp => 'وقت ختم!';

  @override
  String get categoryFluencyWinMessage => 'آپ کا ذخیرہ الفاظ وسیع ہے!';

  @override
  String categoryFluencyFoundMessage(int count) {
    return 'آپ نے $count الفاظ تلاش کیے۔';
  }

  @override
  String get categoryFluencyCategoryLabel => 'زمرہ:';

  @override
  String get categoryFluencyEnterItem => 'کوئی چیز درج کریں...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target الفاظ';
  }

  @override
  String get changeBlindnessTitle => 'تبدیلی سے لاعلمی';

  @override
  String get changeBlindnessSubtitle => 'تبدیل ہونے والی چیز کو پہچانیں';

  @override
  String changeBlindnessScore(int score) {
    return 'اسکور: $score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return 'آپ نے $score تبدیلیاں تلاش کیں!';
  }

  @override
  String get choiceRtTitle => 'انتخاب کا ردعمل';

  @override
  String get choiceRtSubtitle => 'فعال مربع پر جتنی جلدی ہو سکے ٹیپ کریں';

  @override
  String choiceRtAvgMessage(String avg) {
    return 'آپ کا اوسط ردعمل وقت: ${avg}ms';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return 'باقی وقت: ${time}s';
  }

  @override
  String choiceRtTaps(int count) {
    return 'ٹیپس: $count';
  }

  @override
  String get colorFloodTitle => 'رنگوں کا سیلاب';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return 'چالیں: $moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => 'سیلاب کامیاب!';

  @override
  String get colorFloodDryLand => 'خشک زمین...';

  @override
  String get colorFloodWinMessage => 'آپ نے پورے گرڈ کو رنگ سے بھر دیا!';

  @override
  String get colorFloodLoseMessage =>
      'آپ کی چالیں ختم ہو گئیں۔ دوبارہ کوشش کریں!';

  @override
  String get colorMatchTitle => 'رنگوں کا مقابلہ';

  @override
  String get colorMatchSubtitle =>
      'ٹارگٹ رنگ سے جتنا ممکن ہو سکے قریب میچ کرنے کے لیے سلائیڈرز کو ایڈجسٹ کریں۔';

  @override
  String get colorMatchTarget => 'ہدف';

  @override
  String get colorMatchYours => 'آپ کا';

  @override
  String get colorMatchCheck => 'میچ چیک کریں';

  @override
  String get colorMatchResult => 'میچ کا نتیجہ';

  @override
  String colorMatchAccuracy(String accuracy) {
    return 'آپ کی درستگی: $accuracy%';
  }

  @override
  String get corsiBlocksTitle => 'کورسی بلاکس';

  @override
  String get corsiBlocksSubtitle =>
      'بلاکس کو روشن ہوتے دیکھیں اور انہیں اسی ترتیب میں ٹیپ کریں۔';

  @override
  String get corsiBlocksWinTitle => 'مکانی ماہر!';

  @override
  String get corsiBlocksLoseTitle => 'خلا میں گم';

  @override
  String corsiBlocksMessage(int score, int span) {
    return 'آپ نے $score ترتیبیں یاد کیں! آپ کی مکانی یادداشت کی حد $span تک پہنچ گئی۔';
  }

  @override
  String get corsiBlocksWatch => 'پیٹرن دیکھیں';

  @override
  String get corsiBlocksRepeat => 'پیٹرن دہرائیں';

  @override
  String get corsiBlocksExcellent => 'بہترین!';

  @override
  String get corsiBlocksSpan => 'حد';

  @override
  String get crownTitle => 'تاج';

  @override
  String get crownSubtitle =>
      'ہر قطار، کالم اور رنگ کے علاقے میں ایک تاج رکھیں۔ تاج ایک دوسرے کے ساتھ نہیں ہو سکتے، یہاں تک کہ ترچھی طور پر بھی۔';

  @override
  String get crownCrowned => 'تاج رکھ دیا گیا!';

  @override
  String get crownSuccess =>
      'تمام تاج بہترین منطق کے ساتھ کامیابی سے رکھ دیے گئے۔';

  @override
  String get cryptogramTitle => 'کرپٹوگرام';

  @override
  String get cryptogramSubtitle =>
      'خفیہ پیغام کو ڈی کوڈ کرنے کے لیے حروف تفویض کریں! ہر انکوڈ شدہ حرف ایک اصل حرف کی نمائندگی کرتا ہے۔';

  @override
  String get cryptogramBroken => 'کوڈ ٹوٹ گیا!';

  @override
  String get cryptogramEncrypted => 'انکرپٹڈ';

  @override
  String get cryptogramSuccess => 'آپ نے پیغام کو بہترین طریقے سے ڈی کوڈ کیا۔';

  @override
  String get cryptogramTryAgain => 'انکرپشن توڑنے کے لیے دوبارہ کوشش کریں۔';

  @override
  String get digitSpanReverseTitle => 'الٹا سپن';

  @override
  String get digitSpanReverseSubtitleMemorize => 'ہندسوں کو یاد کریں';

  @override
  String get digitSpanReverseSubtitleEnter =>
      'ہندسوں کو الٹی ترتیب میں درج کریں';

  @override
  String get digitSpanReverseWinTitle => 'لیول اپ!';

  @override
  String get digitSpanReverseWinMessage =>
      'آپ کی کام کرنے والی یادداشت متاثر کن ہے!';

  @override
  String get digitSpanReverseLoseTitle => 'دوبارہ کوشش کریں';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return 'صحیح الٹی ترتیب $sequence تھی۔';
  }

  @override
  String get dividedAttentionTitle => 'تقسیم شدہ توجہ';

  @override
  String get dividedAttentionSubtitle =>
      'ستارے ⭐ کے لیے بائیں ٹیپ کریں | سرخ 🔴 کے لیے دائیں ٹیپ کریں';

  @override
  String get dividedAttentionGameOverTitle => 'توجہ ٹوٹ گئی';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return 'ملٹی ٹاسکنگ مشکل ہے! آپ کا اسکور $score تھا۔';
  }

  @override
  String dividedAttentionScore(int score) {
    return 'اسکور: $score';
  }

  @override
  String get doubleNBackTitle => 'ڈبل N-Back';

  @override
  String doubleNBackSubtitle(int n) {
    return 'محرکات کو $n قدم پیچھے میچ کریں';
  }

  @override
  String get doubleNBackGameOverTitle => 'گیم ختم';

  @override
  String doubleNBackGameOverMessage(int score) {
    return 'آپ نے ڈبل N-Back میں $score پوائنٹس حاصل کیے!';
  }

  @override
  String doubleNBackScore(int score) {
    return 'اسکور: $score';
  }

  @override
  String get doubleNBackPositionMatch => 'پوزیشن میچ';

  @override
  String get doubleNBackLetterMatch => 'حرف میچ';

  @override
  String get faceNameAssociationTitle => 'چہرہ اور نام';

  @override
  String get faceNameAssociationSubtitleStudy => 'ہر چہرے کے لیے نام یاد کریں';

  @override
  String get faceNameAssociationSubtitleTest => 'یہ کون ہے؟';

  @override
  String get faceNameAssociationPerfect => 'بہترین!';

  @override
  String get faceNameAssociationGameOver => 'گیم ختم';

  @override
  String get faceNameAssociationWinMessage =>
      'آپ کے پاس چہروں اور ناموں کو یاد رکھنے کی بہترین یادداشت ہے!';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return 'آپ نے $total میں سے $correct صحیح کیے۔';
  }

  @override
  String get faceNameAssociationStartTest => 'ٹیسٹ شروع کریں';

  @override
  String get flankerTestWinTitle => 'لیزر فوکس!';

  @override
  String get flankerTestLoseTitle => 'توجہ ہٹ گئی';

  @override
  String flankerTestScoreMessage(int score) {
    return 'آپ نے $score صحیح اسکور کیے!';
  }

  @override
  String get flankerTestTitle => 'فلینکر ٹیسٹ';

  @override
  String get flankerTestSubtitle =>
      'درمیان والے تیر کی سمت بتائیں، بغلی تیروں کو نظر انداز کرتے ہوئے۔';

  @override
  String get flankerTestLeft => 'بائیں';

  @override
  String get flankerTestRight => 'دائیں';

  @override
  String get fractionMatchTitle => 'کسر میچ';

  @override
  String get fractionMatchSubtitle => 'تصویر کو اس کی کسر سے میچ کریں';

  @override
  String get fractionMatchLoseTitle => 'کسر کا غلط میچ';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return 'صحیح جواب $correctAnswer تھا۔';
  }

  @override
  String get goNoGoTitle => 'جاؤ / نہ جاؤ';

  @override
  String get goNoGoSubtitle => 'سبز کے لیے ٹیپ کریں، سرخ کو نظر انداز کریں!';

  @override
  String get goNoGoLoseTitle => 'ردعمل رک گیا';

  @override
  String get goNoGoLoseMessage =>
      'آپ کے روک تھام کے کنٹرول کا تجربہ کیا جا رہا ہے!';

  @override
  String get goNoGoTapAnywhere => 'جانے کے لیے کہیں بھی ٹیپ کریں';

  @override
  String get groceryListTitle => 'سودا سلف کی فہرست';

  @override
  String get groceryListSubtitleMemorize => 'چیزوں اور ان کے زمروں کو یاد کریں';

  @override
  String get groceryListSubtitleTest => 'یہ چیز کس زمرے سے تعلق رکھتی تھی؟';

  @override
  String get groceryListWinTitle => 'گراسری گرو!';

  @override
  String get groceryListLoseTitle => 'کچھ بھول گئے؟';

  @override
  String groceryListScoreMessage(int score) {
    return 'آپ نے گراسری لسٹ میں $score پوائنٹس حاصل کیے!';
  }

  @override
  String get groceryListReady => 'میں تیار ہوں';

  @override
  String get groceryListWhereBelong => 'یہ کہاں سے تعلق رکھتا ہے؟';

  @override
  String get hueSortTitle => 'رنگوں کی ترتیب';

  @override
  String get hueSortSubtitle =>
      'کونے کے رنگوں کے درمیان ہموار منتقلی بنانے کے لیے ٹائلوں کو تبدیل کریں۔ نقطے فکسڈ ٹائلوں کی نشاندہی کرتے ہیں۔';

  @override
  String get hueSortWinTitle => 'بہترین گریڈینٹ!';

  @override
  String get hueSortWinMessage =>
      'آپ نے رنگوں کے طیف کو بہترین طریقے سے ترتیب دیا!';

  @override
  String hueSortWrongTiles(int count) {
    return 'غلط پوزیشن پر ٹائلیں: $count';
  }

  @override
  String get kenkenTitle => 'کین کین';

  @override
  String get kenkenWinTitle => 'ذہین!';

  @override
  String get kenkenLoseTitle => 'گیم ختم';

  @override
  String get kenkenWinMessage => 'آپ نے کین کین پزل حل کر لیا!';

  @override
  String get kenkenLoseMessage => 'قطار/کالم اور کیج کے اصول چیک کریں۔';

  @override
  String kenkenSubtitle(int size) {
    return 'قطاروں/کالموں میں دہرائے بغیر 1-$size بھریں';
  }

  @override
  String get letterCancellationTitle => 'حرف منسوخی';

  @override
  String get letterCancellationTitleFull => 'حروف کی منسوخی';

  @override
  String letterCancellationScoreMessage(int score) {
    return 'آپ کو $score حروف ملے!';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return 'تمام \"$target\" حروف تلاش کریں';
  }

  @override
  String get letterCancellationFound => 'مل گئے';

  @override
  String get letterCancellationTime => 'وقت';

  @override
  String get lightsOutTitle => 'لائٹس آؤٹ';

  @override
  String get lightsOutSubtitle =>
      'ٹائل کو ٹیپ کرنے سے وہ اور اس کے ملحقہ پڑوسی ٹوگل ہو جاتے ہیں۔ حل کرنے کے لیے تمام لائٹس بند کریں۔';

  @override
  String get lightsOutWinTitle => 'پزل حل ہو گیا!';

  @override
  String get lightsOutWinMessage => 'آپ نے کامیابی سے تمام لائٹس بند کر دیں!';

  @override
  String get symmetryTitle => 'توازن';

  @override
  String get symmetrySubtitle =>
      'بائیں طرف کے پیٹرن کو دائیں طرف کے خالی گرڈ پر عکس دیں۔';

  @override
  String get semanticLinkTitle => 'سیمنٹک لنک';

  @override
  String get semanticLinkSubtitle => 'وہ لفظ تلاش کریں جو تینوں کو جوڑتا ہو';

  @override
  String get reflexTapTitle => 'ریفلیکس ٹیپ';

  @override
  String get visualStatisticalLearningTitle => 'گیم ختم';

  @override
  String get orbitTapTitle => 'آربٹ ٹیپ';

  @override
  String get orbitTapSubtitle =>
      'جب گیندیں گیٹ کے ساتھ سیدھ میں ہوں تو ٹیپ کریں';

  @override
  String get schulteTableTitle => 'بہترین فوکس!';

  @override
  String get multipleObjectTrackingTitle => 'آبجیکٹ ٹریکر';

  @override
  String get multipleObjectTrackingSubtitle =>
      'نمایاں کردہ چیزوں کو دیکھیں۔ حرکت کرتے وقت ان کا پیچھا کریں، پھر انہیں منتخب کریں۔';

  @override
  String get sdmtTitle => 'Sdmt ٹیسٹ';

  @override
  String get sdmtSubtitle =>
      'دکھائے گئے نشان کے لیے ہندسہ تلاش کرنے کے لیے اوپر دی گئی کلید کا استعمال کریں۔';

  @override
  String get memoryMatrixTitle => 'ہدف مکمل!';

  @override
  String get memoryMatrixSubtitle =>
      'پیٹرن کو یاد کریں اور ٹائلوں پر ٹیپ کریں۔';

  @override
  String get mentalAbacusTitle => 'ایبیکس ماسٹر!';

  @override
  String get mentalAbacusSubtitle => 'سوروبان کا استعمال کرتے ہوئے حل کریں';

  @override
  String get spellingSprintTitle => 'املا کی دوڑ';

  @override
  String get spellingSprintSubtitle =>
      'گھڑی کے خلاف دوڑیں اور جتنے ہو سکے الفاظ کے املا لکھیں۔';

  @override
  String get stopSignalTitle => 'اسٹاپ سگنل';

  @override
  String get stopSignalSubtitle =>
      'تیر کی سمت ٹیپ کریں، لیکن اگر تیر سرخ ہو جائے تو فوراً رک جائیں۔';

  @override
  String get staircaseMemoryTitle => 'سیڑھی یادداشت';

  @override
  String get vigilanceTaskTitle => 'چوکسی کا کام';

  @override
  String get vigilanceTaskSubtitle =>
      'جب سوئی ایک پوزیشن چھوڑ دے تو بٹن ٹیپ کریں';

  @override
  String get logicalSyllogismsTitle => 'منطقی قیاس';

  @override
  String get logicalSyllogismsSubtitle => 'کیا نتیجہ منطقی طور پر درست ہے؟';

  @override
  String get mathPathTitle => 'ریاضی کا راستہ';

  @override
  String get mathPathSubtitle =>
      'ایسا راستہ تلاش کریں جو بالکل ٹارگٹ مجموعہ کے برابر ہو۔';

  @override
  String get sternbergTaskTitle => 'سٹرنبرگ ٹاسک';

  @override
  String get sternbergTaskMemorize => 'حروف کو یاد کریں';

  @override
  String get sternbergTaskWasLetterSet => 'کیا یہ حرف سیٹ میں تھا؟';

  @override
  String sternbergTaskScore(int score) {
    return 'آپ نے سٹرنبرگ ٹاسک میں $score پوائنٹس حاصل کیے!';
  }

  @override
  String get verbalAnalogiesTitle => 'تمثیل کے ماہر!';

  @override
  String get verbalAnalogiesSubtitle => 'تعلق کو مکمل کریں';

  @override
  String get typingSpeedTitle => 'ٹائپنگ کی رفتار';

  @override
  String get typingSpeedSubtitle =>
      'دکھایا گیا جملہ بالکل ویسا ہی جتنی جلدی ہو سکے ٹائپ کریں!';

  @override
  String get wordLadderTitle => 'لفظوں کی سیڑھی';

  @override
  String get wordLadderSubtitle =>
      'ایک وقت میں ایک حرف تبدیل کر کے الفاظ کو جوڑیں۔';

  @override
  String get tangleFixTitle => 'سلجھ گیا!';

  @override
  String get tangleFixSubtitle =>
      'لائنوں کو سلجھائیں تاکہ کوئی ایک دوسرے کو نہ کاٹے';

  @override
  String get oddRotationTitle => 'عجیب گردش';

  @override
  String get oddRotationSubtitle =>
      'ان میں سے ایک کا عکس دکھایا گیا ہے۔ کیا آپ اسے تلاش کر سکتے ہیں؟';

  @override
  String get towerOfLondonTitle => 'ٹاور آف لندن';

  @override
  String get towerOfLondonSubtitle => 'ٹارگٹ کنفیگریشن سے میچ کریں';

  @override
  String get symbolicFlankerTitle => 'علامتی فلینکر';

  @override
  String get symbolicFlankerSubtitle => 'درمیان والی علامت پر توجہ دیں';

  @override
  String get stroopTestTitle => 'اسٹروپ ٹیسٹ';

  @override
  String get stroopTestSubtitle =>
      'دکھائے گئے لفظ کی سیاہی کا رنگ پہچانیں۔ لفظ اصل میں کیا کہتا ہے اسے نظر انداز کریں!';

  @override
  String get wisconsinCardSortingTitle => 'گیم ختم';

  @override
  String get wisconsinCardSortingSubtitle =>
      'کارڈ کو اوپر والے چاروں میں سے ایک سے میچ کریں';

  @override
  String get nBackTitle => 'N-Back ٹیسٹ';

  @override
  String get nBackSubtitle =>
      'اگر موجودہ حرف 2 قدم پہلے دکھائے گئے حرف سے میچ کرتا ہے تو MATCH پر ٹیپ کریں۔';

  @override
  String get rhythmMasterTitle => 'ردھم ماسٹر';

  @override
  String get rhythmMasterSubtitle => 'نبض کے ساتھ ہم آہنگی میں ٹیپ کریں';

  @override
  String get pixelMimicTitle => 'پکسل میمک';

  @override
  String get targetNumberTitle => 'ٹارگٹ 24';

  @override
  String targetNumberSubtitle(int target) {
    return '$target تک پہنچنے کے لیے تمام 4 نمبر استعمال کریں';
  }

  @override
  String get mirrorTracingTitle => 'بہترین ٹریسنگ!';

  @override
  String get mirrorTracingSubtitle =>
      'ستارے کو ٹریس کریں! کنٹرولز عکس میں ہیں۔';

  @override
  String get wordSurgeTitle => 'لفظوں کی لہر';

  @override
  String get wordSurgeSubtitle => 'مترادفات اور متضاد الفاظ';

  @override
  String get perspectiveTakingTitle => 'نقطہ نظر اپنانا';

  @override
  String get perspectiveTakingTopDownView => 'اوپر سے نیچے کا منظر';

  @override
  String get perspectiveTakingChoosePerspective => 'نقطہ نظر کا انتخاب کریں';

  @override
  String get perspectiveTakingCongrats => 'آپ کی مکانی تعلقات پر گہری نظر ہے۔';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return 'کون سا منظر $targetDirName سے ہے؟';
  }

  @override
  String get paperFoldingTitle => 'کھلی ہوئی کمال!';

  @override
  String get paperFoldingSubtitle => 'کھولنے پر یہ کیسا لگے گا؟';

  @override
  String get waterSortTitle => 'بہت اچھے!';

  @override
  String get waterSortSubtitle =>
      'رنگوں کو ترتیب دیں تاکہ ہر ٹیوب میں صرف ایک رنگ ہو۔';

  @override
  String get numericalEstimationTitle => 'عددی تخمینہ';

  @override
  String get numericalEstimationSubtitle => 'قریبی جواب کا انتخاب جلدی کریں!';

  @override
  String get lockPatternTitle => 'لاک پیٹرن';

  @override
  String get lockPatternSubtitle =>
      'خفیہ پیٹرن تلاش کریں۔ ہر اندازہ پوزیشن اور نقطوں پر فیڈ بیک دیتا ہے۔';

  @override
  String get primeHunterTitle => 'پرائم ہنٹر';

  @override
  String get primeHunterSubtitle =>
      'مفرد اعداد کے لیے بائیں سوائپ کریں | مرکب اعداد کے لیے دائیں سوائپ کریں';

  @override
  String get tracePathTitle => 'راستہ ٹریس کریں';

  @override
  String get tracePathSubtitle =>
      'ٹارگٹ راستے پر جتنا ممکن ہو سکے قریب سے چلیں';

  @override
  String get ruleSwitcherTitle => 'اصول بدلنے والا';

  @override
  String get ruleSwitcherSubtitle => 'موجودہ اصول لاگو کریں';

  @override
  String get choiceReactionTimeTitle => 'انتخاب کا ردعمل وقت';

  @override
  String get pathRecallTitle => 'راستہ یاد کریں';

  @override
  String get switchTaskTitle => 'ٹاسک سوئچ کریں';

  @override
  String get switchTaskSubtitle =>
      'اصول پر توجہ دیں! یہ شکل میچ کرنے اور رنگ میچ کرنے کے درمیان بدلے گا۔';

  @override
  String get mentalRotationTitle => 'ذہنی گردش';

  @override
  String get mentalRotationSubtitle =>
      'کیا یہ شکلیں ایک جیسی ہیں، بس گھومی ہوئی ہیں؟';

  @override
  String get missingOperatorTitle => 'آپریٹر مکس';

  @override
  String get missingOperatorSubtitle =>
      'مساوات مکمل کرنے کے لیے خالی جگہیں بھریں';

  @override
  String get wordMastermindTitle => 'ورڈ ماسٹر مائنڈ';

  @override
  String get wordMastermindSubtitle =>
      '4 حروف کا کوڈ کریک کریں! بلز (B) صحیح جگہ ہیں، کاؤز (C) غلط جگہ ہیں۔';

  @override
  String get simonSequenceTitle => 'ترتیب';

  @override
  String get symbolLogicTitle => 'علامتی منطق';

  @override
  String get symbolLogicSubtitle =>
      'ہر علامت کی قیمت معلوم کرنے کے لیے بصری مساوات حل کریں۔ آخری مساوات کا نتیجہ کیا ہے؟';

  @override
  String get silhouetteMatchTitle => 'میچ ہو گیا!';

  @override
  String get silhouetteMatchSubtitle => 'کون سا عکس اس چیز سے میچ کرتا ہے؟';

  @override
  String get operationSpanTitle => 'آپریشن سپین';

  @override
  String get operationSpanMathPhase => 'کیا مساوات درست ہے؟';

  @override
  String get operationSpanLetterPhase => 'حرف یاد رکھیں';

  @override
  String get operationSpanRecallPhase => 'حروف کو ترتیب سے یاد کریں';

  @override
  String get operationSpanRoundComplete => 'راؤنڈ مکمل!';

  @override
  String operationSpanScore(int score) {
    return 'آپ نے آپریشن سپین میں $score پوائنٹس حاصل کیے!';
  }

  @override
  String get slidePuzzleTitle => 'سلائیڈ پزل';

  @override
  String get slidePuzzleNewGame => 'نیا گیم';

  @override
  String get slidePuzzleInstructions =>
      'ٹائلوں کو خالی جگہ میں سلائیڈ کر کے عددی ترتیب میں ترتیب دیں۔';

  @override
  String get slidePuzzleTileSlider => 'ٹائل سلائیڈر';

  @override
  String get slidePuzzleCongrats =>
      'آپ نے کامیابی سے تمام ٹائلیں ترتیب دے دیں۔';

  @override
  String get visualSearchTitle => 'بصری تلاش';

  @override
  String get visualSearchSubtitle => 'گرڈ میں منفرد علامت تلاش کریں';

  @override
  String get trailMakingTitle => 'ٹریل بنانا';

  @override
  String get trailMakingSubtitle =>
      'نمبروں کو ترتیب سے (1 -> 2 -> 3...) جتنی جلدی ہو سکے جوڑیں۔';

  @override
  String get matrixReasoningTitle => 'میٹرکس استدلال';

  @override
  String get matrixReasoningSubtitle => '3x3 گرڈ میں پیٹرن کو مکمل کریں';

  @override
  String get tentsAndTreesTitle => 'خیمے اور درخت';

  @override
  String get tentsAndTreesSubtitle =>
      'درختوں کے پاس خیمے لگائیں۔ نمبر بتاتے ہیں کہ ہر قطار/کالم میں کتنے خیمے ہیں۔ خیمے ایک دوسرے کو چھو نہیں سکتے۔';

  @override
  String get quickMathTitle => 'تیز ریاضی';

  @override
  String get magicSquaresTitle => 'جادوئی مربع';

  @override
  String magicSquaresSubtitle(int targetSum) {
    return 'ہر قطار، کالم اور ترچھی لکیر کا مجموعہ $targetSum ہونا چاہیے';
  }

  @override
  String get objectShuffleTitle => 'چیزوں کا الٹ پلٹ';

  @override
  String get pipesTitle => 'پائپ';

  @override
  String get pipesSubtitle => 'میچنگ رنگین نقطوں کو پائپوں سے جوڑیں۔';

  @override
  String get oddOneOutTitle => 'مختلف تلاش کریں';

  @override
  String get oddOneOutSubtitle => 'مختلف رنگ والی ٹائل تلاش کریں۔';

  @override
  String get einsteinRiddleTitle => 'آئن اسٹائن پہیلی';

  @override
  String get einsteinRiddleSubtitle =>
      'ہر گھر کی خصوصیات معلوم کرنے کے لیے اشاروں کا استعمال کریں۔';

  @override
  String get einsteinRiddleHowToPlay =>
      'ہر گھر کی منفرد خصوصیات ہیں (رنگ، قومیت، پالتو جانور وغیرہ)۔ گرڈ بھرنے اور مکمل حل تلاش کرنے کے لیے فراہم کردہ اشاروں کا استعمال کریں۔';

  @override
  String get einsteinRiddleColor => 'رنگ';

  @override
  String get einsteinRiddleNationality => 'قومیت';

  @override
  String get einsteinRiddleDrink => 'مشروب';

  @override
  String get einsteinRiddlePet => 'پالتو جانور';

  @override
  String get einsteinRiddleSmoke => 'سگریٹ نوشی';

  @override
  String get einsteinRiddleHouse => 'گھر';

  @override
  String get mirrorImageTitle => 'آئینے کا عکس';

  @override
  String get mirrorImageSubtitle => 'صحیح آئینے کے عکس کی شناخت کریں۔';

  @override
  String get mirrorImageHowToPlay =>
      'شکل کو دیکھیں اور فراہم کردہ اختیارات میں سے اس کا صحیح آئینے کا عکس منتخب کریں۔';

  @override
  String get mentalMappingTitle => 'ذہنی نقشہ سازی';

  @override
  String get mentalMappingSubtitle => 'ہدایات پر عمل کریں اور منزل تلاش کریں۔';

  @override
  String get mentalMappingHowToPlay =>
      'آپ کو ہدایات کی ایک ترتیب دکھائی جائے گی (شمال، جنوب، مشرق، مغرب)۔ گرڈ کے مرکز سے شروع ہو کر ذہنی طور پر ان اقدامات پر عمل کریں اور آخری منزل کا انتخاب کریں۔';

  @override
  String get memoryPalaceTitle => 'یادداشت کا محل';

  @override
  String get memoryPalaceSubtitle => 'یاد رکھیں کہ کون سا لفظ کس جگہ پر تھا۔';

  @override
  String get memoryPalaceHowToPlay =>
      'گرڈ پر مختلف مقامات پر الفاظ کا ایک سیٹ ظاہر ہوگا۔ ان کی پوزیشن یاد کریں۔ پھر، آپ سے الفاظ کو ان کی اصل جگہوں پر واپس رکھنے کو کہا جائے گا۔';

  @override
  String get countingSheepTitle => 'بھیڑیں گننا';

  @override
  String get countingSheepSubtitle => 'آپ نے کتنی بھیڑیں دیکھیں؟';

  @override
  String get countingSheepHowToPlay =>
      'بھیڑیں اسکرین پر تیزی سے دوڑیں گی۔ ان کے گزرتے وقت انہیں گنیں اور آخر میں کل تعداد درج کریں۔';

  @override
  String get faceTraitAssociationTitle => 'چہرہ اور خصوصیت';

  @override
  String get faceTraitAssociationSubtitle => 'ہر چہرے کے لیے خصوصیات یاد کریں';

  @override
  String get faceTraitAssociationHowToPlay =>
      'آپ کو کئی چہرے دکھائے جائیں گے، ہر ایک کے ساتھ نام، پیشہ اور مشغلہ ہوگا۔ ان تعلقات کو یاد رکھیں۔ بعد میں، آپ سے ہر چہرے کے لیے مخصوص خصوصیات یاد کرنے کو کہا جائے گا۔';

  @override
  String get mentalCalendarTitle => 'ذہنی کیلنڈر';

  @override
  String get mentalCalendarSubtitle => 'ہفتے کا دن معلوم کریں';

  @override
  String get mentalCalendarHowToPlay =>
      'ایک بے ترتیب تاریخ دکھائی جائے گی۔ ہفتے کا کون سا دن ہے یہ معلوم کرنے کے لیے ذہنی حساب (یا ڈومس ڈے الگورتھم) استعمال کریں۔';

  @override
  String get vocabularyBuilderTitle => 'ذخیرہ الفاظ بنانے والا';

  @override
  String get vocabularyBuilderSubtitle =>
      'وقت کے دباؤ میں مترادفات اور متضاد الفاظ میچ کریں۔';

  @override
  String get vocabularyBuilderHowToPlay =>
      'آپ کو ایک ٹارگٹ لفظ اور ایک تعلق (مترادف یا متضاد) دکھایا جائے گا۔ اختیارات میں سے وہ صحیح لفظ منتخب کریں جو تعلق سے میچ کرتا ہو۔ جلدی کریں، وقت گزر رہا ہے!';

  @override
  String get correct => 'درست';

  @override
  String get incorrect => 'غلط';

  @override
  String get grammarPoliceTitle => 'گرامر پولیس';

  @override
  String get grammarPoliceSubtitle =>
      'شناخت کریں کہ آیا جملہ گرامر کے لحاظ سے درست ہے یا اس میں غلطیاں ہیں۔';

  @override
  String get grammarPoliceHowToPlay =>
      'اسکرین کے بیچ میں ایک جملہ ظاہر ہوگا۔ فیصلہ کریں کہ کیا یہ گرامر کے لحاظ سے درست ہے یا اس میں کوئی غلطی ہے۔ اگر یہ ٹھیک ہے تو \'درست\' پر ٹیپ کریں، یا اگر آپ کو کوئی غلطی نظر آتی ہے تو \'غلط\' پر ٹیپ کریں. اپنی تمام زندگیوں کو نہ کھوئیں!';

  @override
  String get reverseStroopTitle => 'ریورس اسٹروپ';

  @override
  String get reverseStroopSubtitle =>
      'اسٹروپ ٹیسٹ کی ایک قسم جہاں توجہ تبدیل کر دی جاتی ہے۔';

  @override
  String get reverseStroopHowToPlay =>
      'ہدایت پر توجہ دیں! اگر یہ \'TEXT\' کہتا ہے، تو لفظ کے معنی میچ کریں۔ اگر یہ \'COLOR\' کہتا ہے، تو سیاہی کا رنگ میچ کریں۔ آپ کی توجہ آزمانے کے لیے اصول کثرت سے بدلیں گے۔';

  @override
  String get game2048Instruction => 'ضم کرنے کے لیے کسی بھی سمت سوائپ کریں';

  @override
  String get fibonacciMergeTitle => 'فبونیکی مرج';

  @override
  String get fibonacciMergeSubtitle =>
      'مسلسل فبونیکی اعداد (1, 1, 2, 3, 5, 8, 13...) کو ضم کریں۔';

  @override
  String get sequenceSleuthTitle => 'سلسلہ جاسوس';

  @override
  String get sequenceSleuthSubtitle =>
      'ریاضی کے سلسلے میں غائب نمبر تلاش کریں۔';

  @override
  String get divisibilityDashTitle => 'تقسیم پذیری کی دوڑ';

  @override
  String get divisibilityDashSubtitle =>
      'دیے گئے نمبر کے تمام ایک ہندسے والے تقسیم کنندگان (2-9) کو ٹیپ کریں۔';

  @override
  String get percentagePeakTitle => 'فیصد کی چوٹی';

  @override
  String get percentagePeakSubtitle => 'ذہنی فیصد کے حسابات جلدی حل کریں۔';

  @override
  String get vennNumbersTitle => 'وین نمبرز';

  @override
  String get vennNumbersSubtitle =>
      'نمبروں کو وین ڈایاگرام کے صحیح حصوں میں تقسیم کریں۔';

  @override
  String get commonDenominatorTitle => 'مشترک مخرج';

  @override
  String get commonDenominatorSubtitle =>
      'عادِ اعظم یا ذواضعافِ اقل تلاش کریں۔';

  @override
  String get angleFinderTitle => 'زاویہ تلاش کرنے والا';

  @override
  String get angleFinderSubtitle =>
      'جیومیٹری کے مسئلے میں غائب زاویہ معلوم کریں۔';

  @override
  String get sumSnakeTitle => 'مجموعہ سانپ';

  @override
  String get sumSnakeSubtitle =>
      'ٹارگٹ مجموعہ تک پہنچنے کے لیے ملحقہ نمبروں کو جوڑیں۔';

  @override
  String get baseShiftTitle => 'بیس شفٹ بلٹز';

  @override
  String get baseShiftSubtitle => 'اعشاری نظام میں حل کریں';

  @override
  String get baseShiftDescription =>
      'مساوات حل کریں اور جواب اعشاری نظام (Base 10) میں ٹائپ کریں۔';

  @override
  String get baseShiftEquation => 'مساوات';

  @override
  String get baseShiftHint => 'اعشاری نتیجہ درج کریں...';

  @override
  String get baseShiftCorrect => 'درست!';

  @override
  String get baseShiftIncorrect => 'غلط!';

  @override
  String get baseShiftSubmit => 'جمع کریں';

  @override
  String get baseShiftQuickGuide => 'فوری گائیڈ:';

  @override
  String get baseShiftBinary => 'بائنری (bin): بیس 2 (0, 1)';

  @override
  String get baseShiftHex => 'ہیکسا ڈیسیمل (0x): بیس 16 (0-9, A-F)';

  @override
  String get baseShiftDecimal => 'اعشاری (dec): بیس 10 (0-9)';

  @override
  String get baseShiftWinTitle => 'ریاضی کے جادوگر!';

  @override
  String get baseShiftWinMessage => 'آپ نے 5 بیس شفٹ مساواتیں صحیح حل کیں!';

  @override
  String get blockCount3DTitle => 'بلاک کاؤنٹ 3D';

  @override
  String get blockCount3DSubtitle =>
      'گھمانے کے لیے گھسیٹیں • چھپے ہوئے بلاکس گنیں';

  @override
  String get blockCount3DHowMany => 'کتنے بلاکس ہیں؟';

  @override
  String get blockCount3DSubmitGuess => 'اندازہ جمع کریں';

  @override
  String get blockCount3DNotQuite => 'بالکل نہیں! دوبارہ گننے کے لیے گھمائیں۔';

  @override
  String get blockCount3DExcellent => 'بہترین';

  @override
  String blockCount3DWinMessage(int count) {
    return 'آپ نے تمام $count بلاکس کی صحیح شناخت کی!';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '1. بلاک اسٹیک کو گھمانے کے لیے 3D ویو پورٹ پر انگلی گھسیٹیں۔\n\n2. اسٹیک میں موجود تمام بلاکس گنیں۔\n\n3. یاد رکھیں: ہوا میں موجود بلاک کے نیچے سپورٹ بلاکس ہونے چاہئیں (چھپے ہوئے بلاکس!)۔\n\n4. ان پٹ فیلڈ میں اپنا جواب ٹائپ کریں اور چیک کرنے کے لیے \"اندازہ جمع کریں\" پر ٹیپ کریں۔';

  @override
  String get alphabetSudokuTitle => 'حروف تہجی کا سوڈوکو';

  @override
  String get alphabetSudokuSubtitle =>
      'گرڈ کو بھریں تاکہ ہر قطار، کالم اور باکس میں A-I تک حروف ہوں۔';

  @override
  String get alphabetSudokuWinTitle => 'سوڈوکو حل ہو گیا!';

  @override
  String get alphabetSudokuWinMessage =>
      'شاندار! آپ نے حروف پر مہارت حاصل کر لی۔';

  @override
  String get classicMazeTitle => 'کلاسک بھول بھلیاں';

  @override
  String get classicMazeSubtitle =>
      'تلاش کریں اور حل کریں • ہر گیم میں نئی بھول بھلیاں';

  @override
  String get classicMazeWinTitle => 'بھول بھلیاں صاف ہو گئیں';

  @override
  String classicMazeWinMessage(int count) {
    return 'بہترین نیویگیشن! آپ نے $count چالوں میں بھول بھلیاں حل کر لیں۔';
  }

  @override
  String get classicMazeMoves => 'چالیں: ';

  @override
  String get classicMazeHowToPlayDescription =>
      '1. چمکتے ہوئے پیلے ماربل (کھلاڑی) کو نیچے دائیں طرف سبز پورٹل (باہر نکلنے کا راستہ) تک لے جائیں۔\n\n2. حرکت کرنے کے لیے بھول بھلیوں پر سوائپ، فزیکل کی بورڈ کے تیروں، یا نیچے دیے گئے تیر والے بٹنوں کا استعمال کریں۔\n\n3. جامنی رنگ کا نشان وہ راستہ دکھاتا ہے جو آپ نے تلاش کیا ہے۔ اپنے تلاش کردہ راستے پر واپس جا کر اسے مٹا دیں!\n\n4. بڑی بھول بھلیوں کے ساتھ خود کو چیلنج کرنے کے لیے اوپر والے ایکشن بار سے مشکل کی سطح تبدیل کریں!';

  @override
  String get conjunctionSearchTitle => 'کنجنکشن تلاش';

  @override
  String get conjunctionSearchSubtitle => 'توجہ کا مرکز اور خصوصیت کا ملاپ';

  @override
  String get conjunctionSearchWinTitle => 'فتح';

  @override
  String get conjunctionSearchWinMessage =>
      'آپ نے بہترین توجہ کے ساتھ تمام اہداف تلاش کر لیے!';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      'ہدایات میں ایک خاص ٹارگٹ شکل اور رنگ کا مجموعہ دکھایا جائے گا۔ اسے گھنے گرڈ میں جتنی جلدی ہو سکے تلاش کریں اور ٹیپ کریں۔ دیگر شکلیں یا تو ایک جیسا رنگ رکھتی ہیں یا شکل، اس لیے غور سے دیکھیں!';

  @override
  String get conjunctionSearchRound => 'راؤنڈ: ';

  @override
  String get conjunctionSearchScore => 'اسکور: ';

  @override
  String get conjunctionSearchFind => 'تلاش کریں: ';

  @override
  String get shapeCircle => 'دائرہ';

  @override
  String get shapeSquare => 'مربع';

  @override
  String get shapeTriangle => 'تکون';

  @override
  String get shapeStar => 'ستارہ';

  @override
  String get colorRedLabel => 'سرخ';

  @override
  String get colorBlueLabel => 'نیلا';

  @override
  String get colorGreenLabel => 'سبز';

  @override
  String get colorAmberLabel => 'عنبر';

  @override
  String get cubeNetFoldTitle => 'کیوب نیٹ فولڈ';

  @override
  String get cubeNetFoldSubtitle => 'میچنگ 3D کیوب آپشن منتخب کریں';

  @override
  String get cubeNetFoldWinTitle => 'درست';

  @override
  String get cubeNetFoldWinMessage => 'آپ کی 3D مکانی فولڈنگ منطق بہترین ہے!';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '1. اوپر کھلے ہوئے 2D نیٹ کو دیکھیں۔\n\n2. ذہنی طور پر نیٹ کو 3D مکعب میں فولڈ کریں۔\n\n3. نیچے دیئے گئے آپشن میں سے وہ منتخب کریں جو اس فولڈ شدہ مکعب کے درست 3D تناظر کی نمائندگی کرتا ہو۔\n\n4. ہوشیار رہیں: نیٹ میں آمنے سامنے والے رخ 3D میں ملحقہ نہیں ہو سکتے، اور ملحقہ رخوں کی ترتیب میچ ہونی چاہیے!';

  @override
  String get cubeNetFoldUnfoldedNet => 'کھلا ہوا 2D نیٹ';

  @override
  String get cubeNetFoldWhichMatches => 'کون سا مکعب میچ کرتا ہے؟';

  @override
  String get cubeNetFoldIncorrect =>
      'غلط فولڈنگ منطق! Reset پر ٹیپ کریں یا اپنا انتخاب بدلیں۔';

  @override
  String get cubeNetFoldSubmitChoice => 'انتخاب جمع کریں';

  @override
  String get cubeNetFoldFailed => 'ناکام (RESET ٹیپ کریں)';

  @override
  String get faceTraitAssociationMemorize => 'تمام 4 لوگوں کو یاد کریں';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return 'شخص $current از $total';
  }

  @override
  String get faceTraitAssociationWhatOccupation => 'ان کا پیشہ کیا ہے؟';

  @override
  String get faceTraitAssociationWhatHobby => 'ان کا مشغلہ کیا ہے؟';

  @override
  String get faceTraitAssociationWinTitle => 'میموری ماسٹر!';

  @override
  String get faceTraitAssociationLoseTitle => 'گیم ختم';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return 'آپ نے $total میں سے $correct صحیح کیے۔';
  }

  @override
  String get topologyTitle => 'ٹوپولوجی';

  @override
  String get topologySubtitle =>
      'کیا یہ شکلیں ٹوپولوجیکل طور پر برابر ہیں؟ (کیا ایک کو کاٹے یا جوڑے بغیر دوسرے میں بدلا جا سکتا ہے؟)';

  @override
  String get topologyWinTitle => 'جیومیٹری کے ماہر!';

  @override
  String get topologyWinMessage =>
      'آپ نے 10 ٹوپولوجیکل جوڑوں کی صحیح شناخت کی!';

  @override
  String get topologyScore => 'اسکور: ';
}
