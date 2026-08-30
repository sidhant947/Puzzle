// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'پزل گیمز';

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
  String get victory => 'فتح!';

  @override
  String get gameWin => 'بہت خوب!';

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
  String get visualStatisticalLearningTitle => 'بصری شماریاتی سیکھنا';

  @override
  String get orbitTapTitle => 'آربٹ ٹیپ';

  @override
  String get orbitTapSubtitle =>
      'جب گیندیں گیٹ کے ساتھ سیدھ میں ہوں تو ٹیپ کریں';

  @override
  String get orbitTapTapToHit => 'جب گیند گیٹ میں داخل ہو تو ٹیپ کریں';

  @override
  String get schulteTableTitle => 'شولٹ ٹیبل';

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
  String get memoryMatrixTitle => 'میموری میٹرکس';

  @override
  String get memoryMatrixSubtitle =>
      'پیٹرن کو یاد کریں اور ٹائلوں پر ٹیپ کریں۔';

  @override
  String get mentalAbacusTitle => 'ذہنی ابیکس';

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
  String get verbalAnalogiesTitle => 'لفظی تمثیلیں';

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
  String get tangleFixTitle => 'الجھن کو سلجھانا';

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
  String get wisconsinCardSortingTitle => 'وسکونسن کارڈ چھانٹنا';

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
  String get mirrorTracingTitle => 'آئینے की ट्रेसिंग';

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
  String get paperFoldingTitle => 'کاغذ موڑنا';

  @override
  String get paperFoldingSubtitle => 'کھولنے پر یہ کیسا لگے گا؟';

  @override
  String get waterSortTitle => 'واٹر سارٹ';

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
  String get silhouetteMatchTitle => 'سایہ کا ملان';

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
  String get shapeRectangle => 'مستطیل';

  @override
  String get shapeEllipse => 'بیضوی';

  @override
  String get shapeTrapezoid => 'ذوزنقہ';

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

  @override
  String get semanticDistanceTitle => 'معنوی فاصلہ';

  @override
  String get semanticDistanceSubtitle =>
      'الفاظ کے درمیان تصوراتی فاصلے کی پیمائش کریں';

  @override
  String get oxymoronHuntTitle => 'متضاد الفاظ کی تلاش';

  @override
  String get oxymoronHuntSubtitle => 'گرڈ میں متضاد الفاظ کے جوڑے بنائیں';

  @override
  String get portmanteauSplitTitle => 'مرکب الفاظ کی تقسیم';

  @override
  String get portmanteauSplitSubtitle => 'مرکب لفظ کے ماخذ الفاظ کی شناخت کریں';

  @override
  String get chainReactionTitle => 'سلسلہ وار ردعمل';

  @override
  String get chainReactionSubtitle =>
      'اوورلیپنگ حروف کا استعمال کرتے ہوئے الفاظ کو جوڑیں';

  @override
  String get rhymeMasterTitle => 'ہم قافیہ ماسٹر';

  @override
  String get rhymeMasterSubtitle => 'ہدف کے ساتھ ہم قافیہ الفاظ کی شناخت کریں';

  @override
  String get definitionDashTitle => 'تعریف کی دوڑ';

  @override
  String get definitionDashSubtitle => 'صحیح لفظ کو اس کی تعریف کے ساتھ ملائیں';

  @override
  String get syllableStackTitle => 'ہجوں کا ڈھیر';

  @override
  String get syllableStackSubtitle => 'مکمل الفاظ بنانے کے لئے ہجوں کو جوڑیں';

  @override
  String get sentenceUnscrambleTitle => 'جملہ درست کریں';

  @override
  String get sentenceUnscrambleSubtitle =>
      'ایک درست جملہ بنانے کے لیے الفاظ کی ترتیب درست کریں';

  @override
  String get grammarSortTitle => 'گرامر کی درجہ بندی';

  @override
  String get grammarSortSubtitle =>
      'الفاظ کو ان کے اجزائے کلام کے لحاظ سے درجہ بندی کریں';

  @override
  String get vowelReconstructTitle => 'حروف علت کی تشکیل نو';

  @override
  String get vowelReconstructSubtitle => 'جملے میں غائب حروف علت بھریں';

  @override
  String get consonantReconstructTitle => 'حروف صحیح کی تشکیل نو';

  @override
  String get consonantReconstructSubtitle => 'جملے میں غائب حروف صحیح بھریں';

  @override
  String get homophoneHuntTitle => 'ہم آواز الفاظ کی تلاش';

  @override
  String get silentLetterSearchTitle => 'خاموش حروف کی تلاش';

  @override
  String get silentLetterSearchSubtitle =>
      'دیے گئے الفاظ میں خاموش حروف کی شناخت کریں';

  @override
  String get palindromeBuilderTitle => 'پیلنڈروم بلڈر';

  @override
  String get palindromeBuilderSubtitle =>
      'کم از کم حروف کا اضافہ کر کے پیلنڈروم بنائیں';

  @override
  String get phoneticGuessTitle => 'صوتی اندازہ';

  @override
  String get phoneticGuessSubtitle => 'اس کے صوتی ہجے سے لفظ کی شناخت کریں';

  @override
  String get spoonerismSolverTitle => 'سپونرزم حل کرنے والا';

  @override
  String get spoonerismSolverSubtitle =>
      'فقرے کے لیے صحیح سپونرزم کی شناخت کریں';

  @override
  String get etymonOddballTitle => 'مختلف ماخذ کا لفظ';

  @override
  String get etymonOddballSubtitle =>
      'وہ لفظ تلاش کریں جس کی جڑ ایک جیسی نہیں ہے';

  @override
  String get etymologyOriginTitle => 'ماخذ کی زبان';

  @override
  String get etymologyOriginSubtitle =>
      'مستعار لفظ کی اصل زبان کا اندازہ لگائیں';

  @override
  String get affixFactoryTitle => 'سابقے اور لاحقے کی فیکٹری';

  @override
  String get affixFactorySubtitle =>
      'سابقے اور لاحقے استعمال کر کے درست الفاظ بنائیں';

  @override
  String get cognateCatchTitle => 'ہم اصل الفاظ کی پہچان';

  @override
  String get cognateCatchSubtitle =>
      'حقیقی ہم اصل اور غلط دوست الفاظ کے درمیان فرق کریں';

  @override
  String get compoundConnectTitle => 'مرکب جوڑ';

  @override
  String get compoundConnectSubtitle =>
      'دو الفاظ کو ملا کر ایک مرکب لفظ بنائیں';

  @override
  String get pangramSprintTitle => 'پینگرام دوڑ';

  @override
  String get pangramSprintSubtitle =>
      'حروف تہجی کے ہر حرف کا استعمال کرتے ہوئے ایک جملہ بنائیں';

  @override
  String get anagramDefinitionTitle => 'ایناگرام کی تعریف';

  @override
  String get anagramDefinitionSubtitle =>
      'اس کی تعریف کی بنیاد پر ایناگرام کو حل کریں';

  @override
  String get letterBridgeTitle => 'حروف کا پل';

  @override
  String get letterBridgeSubtitle =>
      'غائب حرف تلاش کریں جو دو الفاظ کو جوڑتا ہے';

  @override
  String get letterFrequencyScanTitle => 'حروف کی فریکوئنسی کا اسکین';

  @override
  String get letterFrequencyScanSubtitle =>
      'شمار کریں کہ ایک حرف متن میں کتنی بار ظاہر ہوتا ہے';

  @override
  String get oneLetterShiftTitle => 'ایک حرف کی تبدیلی';

  @override
  String get oneLetterShiftSubtitle =>
      'ایک حرف کی تبدیلی کے ساتھ ایک لفظ کو دوسرے میں تبدیل کریں';

  @override
  String vocabularyBuilderMessage(String arg0) {
    return 'بہت خوب! آپ کی ذخیرہ الفاظ متاثر کن ہے۔ اسکور: $arg0';
  }

  @override
  String get symmetryMessage =>
      'آپ نے جراحی کی درستگی کے ساتھ پیٹرن کی بالکل صحیح عکس بندی کی۔';

  @override
  String get temporalOrderMessage =>
      'ناقابل یقین! آپ کی وقتی ترتیب کی یادداشت بہت اعلیٰ ہے۔';

  @override
  String get temporalOrderMessage1 =>
      'غلط ترتیب کی یادداشت۔ مشق انسان کو کامل بناتی ہے!';

  @override
  String get wordSearchMessage =>
      'گہری مشاہدے کے ساتھ تمام الفاظ کامیابی سے مل گئے۔';

  @override
  String colorMatchMessage(String arg0) {
    return 'آپ کی درستگی: $arg0%';
  }

  @override
  String semanticLinkMessage(String arg0) {
    return 'آپ نے $arg0 پوائنٹس حاصل کیے!';
  }

  @override
  String reflexTapMessage(String arg0) {
    return 'آپ نے $arg0 اہداف کو ٹیپ کیا!';
  }

  @override
  String get angleFinderMessage => 'آپ کی ہندسی بصیرت کامل ہے!';

  @override
  String angleFinderMessage1(String arg0) {
    return 'درست جواب $arg0° تھا۔';
  }

  @override
  String angleFinderText(String arg0) {
    return '$arg0°';
  }

  @override
  String visualStatisticalLearningMessage(String arg0) {
    return 'آپ نے $arg0 درست پیٹرن حاصل کیے!';
  }

  @override
  String nonogramText(String arg0) {
    return 'خرابی: $arg0';
  }

  @override
  String mentalCalendarMessage(String arg0) {
    return 'آپ نے 10 میں سے $arg0 درست کیے!';
  }

  @override
  String orbitTapMessage(String arg0) {
    return 'آپ نے کامیابی کے ساتھ $arg0 بار ٹیپ کیا!';
  }

  @override
  String schulteTableMessage(String arg0) {
    return 'آپ نے $arg0 میں ٹیبل مکمل کیا۔\nاپنی محیطی بصارت کو بڑھانے کے لیے مشق جاری رکھیں!';
  }

  @override
  String get schulteTableText => 'ٹیسٹ شروع کریں';

  @override
  String get relationalMemoryMessage =>
      'شاندار مقامی تعلقات کی یادداشت کی درستگی!';

  @override
  String sudokuText(String arg0) {
    return 'خرابی: $arg0';
  }

  @override
  String sdmtMessage(String arg0) {
    return 'آپ نے $arg0 علامتوں کو ملایا! یہ ٹیسٹ آپ کی اسکیننگ کی رفتار اور بصری توجہ کی پیمائش کرتا ہے۔';
  }

  @override
  String get futoshikiMessage =>
      'ناقابل یقین! آپ نے Futoshiki لاطینی مربع حل کر لیا۔';

  @override
  String letterFrequencyScanMessage(String arg0, String arg1) {
    return 'آپ نے \"$arg1\" کی $arg0 موجودگیوں کو صحیح طریقے سے شمار کیا۔';
  }

  @override
  String letterFrequencyScanText(String arg0) {
    return 'غلط۔ گنتی $arg0 تھی۔';
  }

  @override
  String get memoryMatrixMessage =>
      'متاثر کن! آپ کی کام کرنے کی یادداشت تیز ہے۔ روزانہ کا ہدف مکمل!';

  @override
  String get memoryMatrixMessage1 =>
      'توجہ مرکوز کریں اور اپنی یادداشت کا اسکور بہتر بنانے کے لیے دوبارہ کوشش کریں۔';

  @override
  String get contextCluesMessage =>
      'غیر معمولی! آپ کی ذخیرہ الفاظ اور سیاق و سباق کا تجزیہ اعلیٰ درجے کا ہے۔';

  @override
  String get contextCluesMessage1 =>
      'غلط لفظ کا انتخاب کیا گیا! اپنے زبانی سیاق و سباق کے استدلال کی تربیت کریں اور دوبارہ کوشش کریں۔';

  @override
  String oneLetterShiftMessage(String arg0, String arg1) {
    return 'آپ نے صحیح طریقے سے $arg0 کو $arg1 میں تبدیل کیا۔';
  }

  @override
  String get mentalAbacusMessage => 'آپ کا ذہنی حساب کتاب اعلیٰ درجے کا ہے۔';

  @override
  String fractionMatcherMessage(String arg0) {
    return 'آپ نے نمائندگیوں کو ملا کر $arg0 پوائنٹس حاصل کیے!';
  }

  @override
  String get spellingSprintMessage => 'آپ نے تمام 10 الفاظ کے ہجے صحیح کیے!';

  @override
  String spellingSprintMessage1(String arg0) {
    return 'آپ نے $arg0 الفاظ کے ہجے کیے۔';
  }

  @override
  String stopSignalMessage(String arg0) {
    return 'آپ نے $arg0 درست جوابات حاصل کیے! یہ ٹیسٹ کسی منصوبہ بند کارروائی کو روکنے کی آپ کی صلاحیت کو ماپتا ہے۔';
  }

  @override
  String grammarPoliceMessage(String arg0) {
    return 'گیم اوور! آپ نے گرامر کی دنیا میں نظم برقرار رکھا۔ اسکور: $arg0';
  }

  @override
  String consonantReconstructMessage(String arg0) {
    return 'آپ نے $arg0 کا اسکور دوبارہ تشکیل دیا!';
  }

  @override
  String rhymeMasterMessage(String arg0, String arg1) {
    return 'آپ کو $arg1 میں سے $arg0 ہم قافیہ الفاظ ملے!';
  }

  @override
  String vigilanceTaskMessage(String arg0, String arg1, String arg2) {
    return 'نشانہ لگے: $arg0، چوک گئے: $arg1\nغلط الارم: $arg2';
  }

  @override
  String get silhouetteMatchOrthoMessage =>
      'آپ کے پاس بے عیب آرتھوگرافک سیدھ کی مہارت ہے!';

  @override
  String get silhouetteMatchOrthoText => 'سمجھ گیا';

  @override
  String get silhouetteMatchOrthoText1 =>
      'غلط نقطہ نظر پروجیکشن! دوبارہ کوشش کرنے کے لیے ری سیٹ پر ٹیپ کریں۔';

  @override
  String fibonacciMergeMessage(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String factorFinderMessage(String arg0) {
    return 'آپ نے تمام عوامل تلاش کر کے $arg0 پوائنٹس حاصل کیے!';
  }

  @override
  String logicalSyllogismsMessage(String arg0) {
    return 'آپ نے $arg0 منطقی استدلال صحیح طریقے سے حل کیے!';
  }

  @override
  String get rotatingMazeMessage =>
      'آپ نے حرکیاتی گھومتی ہوئی بھول بھلیوں میں کامیابی کے ساتھ راستہ تلاش کیا!';

  @override
  String get rotatingMazeText => 'سمجھ گیا';

  @override
  String get rotatingMazeText1 =>
      '🌀 بھول بھلیاں 90° گھوم گئی! گرڈ منتقل ہو گیا!';

  @override
  String get mathPathMessage =>
      'آپ نے وہ راستہ تلاش کر لیا جو ہدف تک پہنچاتا ہے!';

  @override
  String get bridgesMessage => 'آپ نے تمام جزیروں کو کامیابی کے ساتھ جوڑ دیا!';

  @override
  String compoundConnectMessage(String arg0, String arg1) {
    return 'مرکب لفظ $arg0$arg1 ہے۔';
  }

  @override
  String get pangramSprintMessage =>
      'آپ نے تمام 26 حروف استعمال کرتے ہوئے ایک جملہ بنایا۔';

  @override
  String get mirrorImageMessage => 'آپ نے عکس کی بالکل صحیح شناخت کی۔';

  @override
  String get mirrorImageText => 'آئینہ نما عکس';

  @override
  String reverseStroopMessage(String arg0) {
    return 'آپ نے $arg0 پوائنٹس حاصل کیے! ہدایات پر نظر رکھیں۔';
  }

  @override
  String get verbalAnalogiesMessage =>
      'آپ رشتوں کو سمجھنے کے لیے تیز ذہن رکھتے ہیں۔';

  @override
  String corsiBlocksMessage1(String arg0, String arg1) {
    return 'آپ نے $arg1 تسلسل یاد کیے! آپ کی مکانی یادداشت کی حد $arg0 تک پہنچ گئی۔';
  }

  @override
  String wordLadderMessage(String arg0, String arg1, String arg2) {
    return 'آپ نے $arg0 کو $arg1 سے $arg2 مراحل میں کامیابی کے ساتھ جوڑ دیا۔';
  }

  @override
  String d2AttentionMessage(String arg0) {
    return 'حیرت انگیز انتخابی سکیننگ! حتمی سکور: $arg0۔';
  }

  @override
  String get d2AttentionText => 'کیسے کھیلیں';

  @override
  String get d2AttentionText1 => 'سمجھ آگیا';

  @override
  String get tangleFixMessage => 'تمام لائنیں صاف اور ہموار ہیں۔';

  @override
  String get distractorMatrixMessage =>
      'لاجواب! آپ نے ریاضی کی ذہنی الجھنوں کے باوجود پیٹرن یاد رکھے!';

  @override
  String get distractorMatrixMessage1 =>
      'الجھنوں نے آپ کو ہرا دیا! اپنی ورکنگ میموری کو دوبارہ تربیت دیں۔';

  @override
  String sentenceUnscrambleMessage(String arg0) {
    return 'آپ نے $arg0 کا سکور ترتیب دیا!';
  }

  @override
  String get kakuroMessage =>
      'لاجواب! آپ نے تمام مجموعی حصوں کا بالکل صحیح ملاپ کیا۔';

  @override
  String symbolicFlankerMessage(String arg0, String arg1) {
    return 'آپ نے $arg1 میں سے $arg0 درست کیے!';
  }

  @override
  String stroopTestMessage(String arg0) {
    return 'آپ نے $arg0 درست سکور کیے! سیاہی کے رنگ پر توجہ دیں، لفظ پر نہیں۔';
  }

  @override
  String wisconsinCardSortingMessage(String arg0) {
    return 'آپ نے $arg0 کارڈز کی درست درجہ بندی کی!';
  }

  @override
  String nBackMessage(String arg0) {
    return 'آپ نے $arg0 2-back میچز حاصل کیے! آپ کی ورکنگ میموری ملٹی ٹاسکنگ کے لیے اہم ہے۔';
  }

  @override
  String rhythmMasterMessage(String arg0, String arg1) {
    return 'آپ نے $arg0 بہترین ہٹ اور $arg1 پوائنٹس حاصل کیے!';
  }

  @override
  String groceryListMessage(String arg0, Object score) {
    return 'آپ نے کریانہ کی فہرست میں $arg0 پوائنٹس حاصل کیے!';
  }

  @override
  String get groceryListText => 'میں';

  @override
  String get mirrorTracingMessage =>
      'آپ کے دماغ نے اپنی ہم آہنگی کو کامیابی کے ساتھ دوبارہ ترتیب دیا ہے۔';

  @override
  String moduloClockMessage(String arg0) {
    return 'بہترین ماڈیولر ذہنی ریاضی کی ہم آہنگی! سکور: $arg0';
  }

  @override
  String moduloClockMessage1(String arg0, String arg1, String arg2) {
    return 'آپ نے $arg1 میں سے $arg0 ماڈیولر کلاک حل کیے۔ سکور: $arg2';
  }

  @override
  String get crownMessage =>
      'تمام تاج بہترین منطق کے ساتھ کامیابی سے رکھے گئے۔';

  @override
  String dualCodingMessage(String arg0) {
    return 'شاندار ڈبل ٹاسک کارکردگی! آپ کا ورکنگ میموری سکور: $arg0';
  }

  @override
  String inequalityDashMessage(String arg0) {
    return 'آپ نے عدم مساوات کے ملاپ میں $arg0 پوائنٹس حاصل کیے!';
  }

  @override
  String sourceMonitoringMessage(String arg0, String arg1) {
    return 'آپ نے $arg1 میں سے $arg0 سکور کیے!';
  }

  @override
  String get sourceMonitoringText => 'یاد دہانی شروع کریں';

  @override
  String get memoryPalaceText => 'دستیاب الفاظ';

  @override
  String target10Message(String arg0) {
    return 'آپ نے 10 تک نمبروں کے ملاپ میں $arg0 پوائنٹس حاصل کیے!';
  }

  @override
  String get paperFoldingMessage => 'آپ اپنے ذہن میں پیٹرن دیکھ سکتے ہیں۔';

  @override
  String topologyText(String arg0, String arg1) {
    return '$arg0$arg1 / 10';
  }

  @override
  String get waterSortMessage => 'آپ نے تمام رنگوں کی بالکل صحیح درجہ بندی کی!';

  @override
  String anagramDefinitionMessage(String arg0) {
    return 'لفظ درحقیقت \"$arg0\" تھا۔';
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
    return 'آپ نے $arg0 درست تخمینے لگائے۔';
  }

  @override
  String grammarSortMessage(String arg0) {
    return 'آپ نے $arg0 الفاظ کی درست درجہ بندی کی!';
  }

  @override
  String vowelReconstructMessage(String arg0) {
    return 'آپ نے $arg0 کے سکور کی دوبارہ تشکیل کی!';
  }

  @override
  String spatialConflictMessage(String arg0, String arg1) {
    return 'آپ نے $arg1 غلطیوں کے ساتھ $arg0 کا سکور حاصل کیا!';
  }

  @override
  String get spatialConflictText => 'کیسے کھیلیں';

  @override
  String get spatialConflictText1 => 'سمجھ آگیا';

  @override
  String tracePathMessage(String arg0) {
    return 'آپ کی درستگی $arg0% تھی!';
  }

  @override
  String ruleSwitcherMessage(String arg0, String arg1) {
    return 'آپ نے $arg1 میں سے $arg0 درست کیے!';
  }

  @override
  String collatzMessage(String arg0, String arg1) {
    return 'آپ نے $arg0 اقدامات کیے۔ کم از کم ممکنہ $arg1 تھے۔';
  }

  @override
  String get collatzText => '/ 2';

  @override
  String get collatzText1 => '+ 1';

  @override
  String get collatzText2 => '3n + 1';

  @override
  String divisibilityDashMessage(String arg0) {
    return 'آپ نے $arg0 اعداد حل کیے!';
  }

  @override
  String switchTaskMessage(String arg0) {
    return 'آپ نے $arg0 درست سکور کیے! تیزی سے کام بدلنا ذہنی لچک کی کلید ہے۔';
  }

  @override
  String sequenceSleuthMessage(String arg0) {
    return 'آپ نے $arg0 تسلسل حل کیے!';
  }

  @override
  String changeBlindnessMessage(String arg0) {
    return 'آپ نے $arg0 تبدیلیاں تلاش کیں!';
  }

  @override
  String mentalRotationMessage(String arg0) {
    return 'آپ نے $arg0 شکلوں کو درست طریقے سے گھمایا!';
  }

  @override
  String wordMastermindMessage(String arg0) {
    return 'آپ نے کوڈ میں مہارت حاصل کر لی!\nلفظ تھا: $arg0';
  }

  @override
  String wordMastermindMessage1(String arg0) {
    return 'پوشیدہ لفظ تھا: $arg0';
  }

  @override
  String wordMastermindText(String arg0) {
    return '$arg0';
  }

  @override
  String get simonSequenceMessage => 'آپ نے تمام 10 ٹائلیں یاد کر لیں!';

  @override
  String get simonSequenceMessage1 =>
      'تسلسل میں مہارت حاصل کرنے کے لیے دوبارہ کوشش کریں۔';

  @override
  String oxymoronHuntMessage(String arg0) {
    return 'آپ نے $arg0 تضادات تلاش کیے!';
  }

  @override
  String spotlightTrackMessage(String arg0) {
    return 'حیرت انگیز مکانی ٹریکنگ! آپ نے $arg0 پوائنٹس حاصل کیے۔';
  }

  @override
  String get spotlightTrackText => 'کیسے کھیلیں';

  @override
  String get spotlightTrackText1 => 'سمجھ آگیا';

  @override
  String get spotlightTrackText2 => 'راؤنڈ شروع کریں';

  @override
  String vennNumbersMessage(String arg0) {
    return 'آپ نے $arg0 اعداد کی درجہ بندی کی!';
  }

  @override
  String get vennNumbersText => 'کوئی بھی نہیں';

  @override
  String get vennNumbersText1 => 'دونوں';

  @override
  String get silhouetteMatchMessage =>
      'آپ کا دماغ 3D سے 2D ترجمہ میں بہترین ہے۔';

  @override
  String sumSnakeMessage(String arg0) {
    return 'ہدف $arg0 بہترین درستگی کے ساتھ حاصل کیا گیا!';
  }

  @override
  String get sumSnakeText => 'راستہ صاف کریں';

  @override
  String percentagePeakMessage(String arg0) {
    return 'آپ نے فیصد کے $arg0 مسائل حل کیے!';
  }

  @override
  String trailMakingMessage(String arg0) {
    return 'آپ نے $arg0 ٹریلز مکمل کیں! یہ ٹیسٹ آپ کی بصری تلاش کی رفتار اور ذہنی لچک کی پیمائش کرتا ہے۔';
  }

  @override
  String matrixReasoningMessage(String arg0) {
    return 'آپ نے $arg0 میٹرکس درست طریقے سے مکمل کیے!';
  }

  @override
  String get tentsAndTreesMessage =>
      'آپ نے تمام خیمے کامیابی کے ساتھ لگا دیے ہیں۔';

  @override
  String klotskiMessage(String arg0) {
    return 'شاندار سلائیڈنگ! آپ نے ہیرو بلاک کو $arg0 چالوں میں آزاد کر دیا۔';
  }

  @override
  String sumPyramidMessage(String arg0) {
    return 'آپ نے کامیابی کے ساتھ $arg0 مجموعی اہرام حل کیے!';
  }

  @override
  String simonCommandMessage(String arg0) {
    return 'بہترین انتخابی ردعمل اور توجہ! کل سکور: $arg0';
  }

  @override
  String simonCommandMessage1(String arg0, String arg1) {
    return 'آپ نے $arg0 سکور کیے لیکن وقت پر $arg1 میچز تک نہیں پہنچ سکے۔';
  }

  @override
  String syllableStackMessage(String arg0) {
    return 'آپ نے $arg0 کا سکور اکٹھا کیا!';
  }

  @override
  String get slitherlinkMessage =>
      'زبردست! آپ نے لوپ پزل کامیابی کے ساتھ مکمل کر لیا۔';

  @override
  String quickMathMessage(String arg0) {
    return 'آپ نے $arg0 مسائل حل کیے!';
  }

  @override
  String commonDenominatorMessage(String arg0) {
    return 'آپ نے $arg0 GCD/LCM مسائل حل کیے!';
  }

  @override
  String chainReactionMessage(String arg0, String arg1) {
    return 'آپ کا حتمی سکور $arg0 ہے۔ آپ نے $arg1 الفاظ کی ایک زنجیر بنائی۔';
  }

  @override
  String chainReactionText(String arg0) {
    return '$arg0';
  }

  @override
  String get associativePairsMessage =>
      'شاندار! آپ نے بصری خصوصیات کو بغیر کسی غلطی کے جوڑ دیا۔';

  @override
  String get associativePairsMessage1 =>
      'غلط تعلق! اپنی لنک میموری کو تیز کریں اور دوبارہ کوشش کریں۔';

  @override
  String portmanteauSplitMessage(String arg0) {
    return 'آپ نے $arg0 مخلوط الفاظ کو الگ کیا!';
  }

  @override
  String get magicSquaresText => 'صاف کریں';

  @override
  String alphabetSudokuText(String arg0) {
    return 'غلطی: $arg0';
  }

  @override
  String get pipesMessage => 'آپ نے تمام پائپوں کو جوڑ دیا اور گرڈ بھر دیا۔';

  @override
  String get dualMirrorMessage =>
      'آپ نے دونوں آئیکنز کو ان کے اہداف تک پہنچا دیا!';

  @override
  String binaryCodeMessage(String arg0) {
    return 'شاندار تیز رفتار اعشاریہ ترجمہ! حتمی سکور: $arg0';
  }

  @override
  String binaryCodeMessage1(String arg0, String arg1) {
    return 'آپ نے $arg0 بائنری نمبرز کو درست طریقے سے تبدیل کیا۔ سکور: $arg1';
  }

  @override
  String oddOneOutMessage(String arg0) {
    return 'آپ نے 50 مختلف چیزیں تلاش کیں! حتمی سکور: $arg0';
  }

  @override
  String oddOneOutMessage1(String arg0) {
    return 'آپ کا سکور: $arg0';
  }

  @override
  String letterBridgeMessage(String arg0) {
    return 'آپ کو پل کا حرف مل گیا: $arg0';
  }

  @override
  String get imReady => 'میں تیار ہوں';

  @override
  String get soptTitle => 'خود ترتیب شدہ پوائنٹنگ';

  @override
  String get soptSubtitle =>
      'ہر بار ایک مختلف کارڈ کو تھپتھپائیں۔ پوزیشنیں بدل جاتی ہیں!';

  @override
  String get soptWinTitle => 'ترتیب ماسٹر!';

  @override
  String soptGameOverMessage(int score) {
    return 'آپ نے شفل شدہ کارڈز کو کامیابی سے ٹریک کرکے $score پوائنٹس حاصل کیے!';
  }

  @override
  String get soptChooseNovel => 'ایک نئے کارڈ پر ٹیپ کریں۔';

  @override
  String get soptGreatJob => 'بہت اچھا کام!';

  @override
  String get soptAlreadyTapped => 'پہلے ہی ٹیپ کیا گیا!';

  @override
  String get soptGrid => 'گرڈ';

  @override
  String get contRecogTitle => 'مسلسل پہچان';

  @override
  String get contRecogSubtitle =>
      'کیا آپ نے اس سیشن میں یہ کارڈ پہلے دیکھا ہے؟';

  @override
  String get contRecogWinTitle => 'پہچان جینیئس!';

  @override
  String contRecogGameOverMessage(int score) {
    return 'آپ نے $score درست شناختیں اسکور کیں!';
  }

  @override
  String get contRecogCorrect => 'درست!';

  @override
  String get contRecogWrong => 'غلط!';

  @override
  String get contRecogOldOrNew => 'یہ پرانا ہے یا نیا؟';

  @override
  String get contRecogNew => 'نیا';

  @override
  String get contRecogOld => 'پرانا';

  @override
  String get contRecogSeenPool => 'پول دیکھا';

  @override
  String get dnmsTitle => 'غیر مماثل میموری';

  @override
  String get dnmsSubtitle =>
      'اس کارڈ کو تھپتھپائیں جو حفظ شدہ نمونے میں نہیں تھا۔';

  @override
  String get dnmsWinTitle => 'غیر مماثل ماہر!';

  @override
  String dnmsGameOverMessage(int score) {
    return 'آپ نے تاخیر سے غیر مماثلت میں $score درست جوابات اسکور کیے!';
  }

  @override
  String get dnmsChooseNovel => 'نئے کارڈ کو تھپتھپائیں۔';

  @override
  String get dnmsMemorizeSample => 'اس کارڈ کو یاد رکھیں';

  @override
  String get dnmsWaitForIt => 'اس کا انتظار کرو...';

  @override
  String get dnmsExcellent => 'بہترین!';

  @override
  String get dnmsSampleTapped => 'یہ نمونہ تھا!';

  @override
  String get dnmsCards => 'کارڈز';

  @override
  String get symSpanTitle => 'ہم آہنگی کا دورانیہ';

  @override
  String get symSpanSubtitle =>
      'عمودی توازن کی شناخت کرتے ہوئے سیل پیٹرن کو یاد کریں۔';

  @override
  String get symSpanWinTitle => 'ہم آہنگی ماسٹر!';

  @override
  String symSpanGameOverMessage(int score) {
    return 'آپ نے ترتیب کو یاد کرکے اور ہم آہنگی کی شناخت کرکے $score پوائنٹس حاصل کیے!';
  }

  @override
  String get symSpanMemorizeRed => 'ریڈ سیل لوکیشن کو یاد رکھیں';

  @override
  String get symSpanIsSymmetric => 'کیا پیٹرن سڈول ہے؟';

  @override
  String get symSpanRecallSequence => 'ترتیب کو صحیح ترتیب میں یاد کریں۔';

  @override
  String get symSpanGreatJob => 'بہت اچھا کام!';

  @override
  String get symSpanTryAgain => 'دوبارہ کوشش کریں!';

  @override
  String get symSpanLength => 'لمبائی';

  @override
  String get readingSpanTitle => 'پڑھنے کا دورانیہ';

  @override
  String get readingSpanSubtitle =>
      'حروف کی ترتیب کو یاد رکھتے ہوئے جملوں کی تصدیق کریں۔';

  @override
  String get readingSpanWinTitle => 'پڑھنے کے ماہر!';

  @override
  String readingSpanGameOverMessage(int score) {
    return 'آپ نے ریڈنگ اسپین میموری چیلنج میں $score پوائنٹس حاصل کیے!';
  }

  @override
  String get readingSpanTrueFalse => 'کیا یہ بیان درست ہے یا غلط؟';

  @override
  String get readingSpanMemorizeLetter => 'اس خط کو یاد رکھیں';

  @override
  String get readingSpanRecallLetters => 'خطوط کو ترتیب سے یاد کریں۔';

  @override
  String get readingSpanGreatJob => 'بہت اچھا کام!';

  @override
  String get readingSpanTryAgain => 'دوبارہ کوشش کریں!';

  @override
  String readingSpanYourSequence(String sequence) {
    return 'آپ کی ترتیب: $sequence';
  }

  @override
  String get readingSpanLength => 'لمبائی';

  @override
  String get readingSpanSentence1 => 'سورج مشرق میں طلوع ہوتا ہے۔';

  @override
  String get readingSpanSentence2 => 'برف گرم ابل رہی ہے۔';

  @override
  String get readingSpanSentence3 => 'مچھلی پانی کے اندر سانس لے سکتی ہے۔';

  @override
  String get readingSpanSentence4 => 'کتوں کے پر ہیں اور وہ اڑ سکتے ہیں۔';

  @override
  String get readingSpanSentence5 => 'پانی 0 ڈگری سیلسیس پر جم جاتا ہے۔';

  @override
  String get readingSpanSentence6 => 'بلیاں چھوٹے کتوں کی طرح بھونکتی ہیں۔';

  @override
  String get readingSpanSentence7 =>
      'موسم گرما میں درختوں کے سبز پتے ہوتے ہیں۔';

  @override
  String get readingSpanSentence8 => 'بارش زمین سے اوپر کی طرف گرتی ہے۔';

  @override
  String get readingSpanSentence9 => 'ایک مثلث کے چار برابر اطراف ہوتے ہیں۔';

  @override
  String get readingSpanSentence10 => 'سیب ایک قسم کا میٹھا پھل ہے۔';

  @override
  String get readingSpanSentence11 => 'چاند چیڈر پنیر سے بنا ہے۔';

  @override
  String get readingSpanSentence12 => 'گاڑیوں میں گھومنے کے لیے پہیے ہوتے ہیں۔';

  @override
  String get readingSpanSentence13 => 'آگ ٹھنڈی ہو رہی ہے۔';

  @override
  String get readingSpanSentence14 => 'کاغذ پروسیس شدہ لکڑی سے بنایا جاتا ہے۔';

  @override
  String get readingSpanSentence15 =>
      'پرندوں کے پاس اڑنے میں مدد کے لیے پنکھ ہوتے ہیں۔';

  @override
  String get readingSpanSentence16 => 'کیلے دیودار کے درختوں پر اگتے ہیں۔';

  @override
  String get readingSpanSentence17 => 'ایک ہاتھی چیونٹی سے چھوٹا ہوتا ہے۔';

  @override
  String get readingSpanSentence18 =>
      'کتابوں میں متن کے مطبوعہ صفحات ہوتے ہیں۔';

  @override
  String get countingSpanTitle => 'گنتی کا دورانیہ';

  @override
  String get countingSpanSubtitle =>
      'صرف نیلے حلقوں کو شمار کریں۔ پھر گنتی کی ترتیب کو یاد کریں۔';

  @override
  String get countingSpanWinTitle => 'گنتی گنتی!';

  @override
  String countingSpanGameOverMessage(int score) {
    return 'آپ نے Counting Span میموری چیلنج میں $score پوائنٹس حاصل کیے!';
  }

  @override
  String get countingSpanCountCircles => 'صرف نیلے حلقوں کو شمار کریں۔';

  @override
  String get countingSpanRecallCounts => 'صحیح ترتیب میں شمار کو یاد کریں۔';

  @override
  String get countingSpanGreatJob => 'بہت اچھا کام!';

  @override
  String get countingSpanTryAgain => 'دوبارہ کوشش کریں!';

  @override
  String countingSpanYourSequence(String sequence) {
    return 'آپ کی ترتیب: $sequence';
  }

  @override
  String get countingSpanLength => 'لمبائی';

  @override
  String get objDispTitle => 'آبجیکٹ کی نقل مکانی';

  @override
  String get objDispSubtitle =>
      'ترتیب کو یاد رکھیں۔ ایک ایسی چیز کو تلاش کریں اور ٹیپ کریں جو پوزیشن بدلتی ہے۔';

  @override
  String get objDispWinTitle => 'مقامی جینیئس!';

  @override
  String objDispGameOverMessage(int score) {
    return 'آپ نے صحیح طریقے سے $score بے گھر اشیاء کی نشاندہی کی!';
  }

  @override
  String get objDispMemorizeAll => 'تمام تقرریوں کو یاد رکھیں';

  @override
  String get objDispWaitingShift => 'لے آؤٹ شفٹ کا انتظار کر رہا ہے...';

  @override
  String get objDispTapMoved => 'منتقل ہونے والی چیز کو تھپتھپائیں۔';

  @override
  String get objDispExcellent => 'بہترین!';

  @override
  String get objDispWrongObject => 'غلط اعتراض!';

  @override
  String get objDispItems => 'اشیاء';

  @override
  String get mandalaTitle => 'منڈلا یاد';

  @override
  String get mandalaSubtitle =>
      'رنگ کنفیگریشن کو یاد رکھیں۔ رنگ چنیں اور ٹائلوں کو دوبارہ پینٹ کریں۔';

  @override
  String get mandalaWinTitle => 'منڈلا آرٹسٹ!';

  @override
  String mandalaGameOverMessage(int score) {
    return 'آپ نے رنگین جیومیٹرک لے آؤٹس کو دوبارہ بنا کر $score پوائنٹس حاصل کیے!';
  }

  @override
  String get mandalaMemorizeColors => 'ٹائل کے رنگوں کو یاد رکھیں';

  @override
  String get mandalaPaintCells => 'اصل سے ملنے کے لیے سیلز کو پینٹ کریں۔';

  @override
  String get mandalaExcellent => 'بہترین!';

  @override
  String get mandalaIncorrectMatch => 'غلط میچ!';

  @override
  String get mandalaSubmitRepaint => 'دوبارہ پینٹ جمع کروائیں۔';

  @override
  String get mandalaTiles => 'ٹائلیں';

  @override
  String get runningSpanTitle => 'رننگ اسپین';

  @override
  String get runningSpanSubtitle =>
      'خطوط دیکھیں۔ جب وہ رک جائیں تو آخری N حروف کو ترتیب میں داخل کریں۔';

  @override
  String get runningSpanWinTitle => 'بفر ماسٹر!';

  @override
  String runningSpanGameOverMessage(int score) {
    return 'آپ نے رننگ میموری اسپین میں $score پوائنٹس بنائے!';
  }

  @override
  String runningSpanPrepareRecall(int count) {
    return 'آخری $count خطوط کو یاد کرنے کی تیاری کریں۔';
  }

  @override
  String get runningSpanWatchCarefully => 'غور سے دیکھو...';

  @override
  String runningSpanEnterLast(int count) {
    return 'آخری $count حروف درج کریں۔';
  }

  @override
  String get runningSpanGreatJob => 'بہت اچھا کام!';

  @override
  String get runningSpanIncorrectBuffer => 'غلط بفر!';

  @override
  String runningSpanRecallLast(int count) {
    return 'آخری $count کو یاد کریں';
  }

  @override
  String get runningSpanStopsRandomly => 'ندی بے ترتیب طور پر رک جاتی ہے!';

  @override
  String runningSpanEntered(String sequence) {
    return 'درج کیا گیا: $sequence';
  }

  @override
  String get runningSpanNItems => 'این آئٹمز';

  @override
  String get spatialCabinetTitle => 'مقامی الماریاں';

  @override
  String get spatialCabinetSubtitle =>
      'یاد رکھیں کہ کابینہ کی کون سی دراز میں کون سی چیز شامل ہے۔';

  @override
  String get spatialCabinetWinTitle => 'کابینہ کے ماہر!';

  @override
  String spatialCabinetGameOverMessage(int score) {
    return 'آپ نے اسپیشل کیبنٹ میموری میں $score پوائنٹس بنائے!';
  }

  @override
  String get spatialCabinetMemorize => 'آئٹم کے مقامات کو یاد رکھیں';

  @override
  String spatialCabinetWhereIs(String itemName) {
    return '$itemName کہاں ہے؟';
  }

  @override
  String get spatialCabinetCorrect => 'درست!';

  @override
  String get spatialCabinetWrongDrawer => 'غلط دراز!';

  @override
  String get spatialCabinetItems => 'اشیاء';

  @override
  String get cabinetItemKey => 'چابی';

  @override
  String get cabinetItemApple => 'سیب';

  @override
  String get cabinetItemDiamond => 'ہیرا';

  @override
  String get cabinetItemBook => 'کتاب';

  @override
  String get cabinetItemUmbrella => 'چھتری';

  @override
  String get cabinetItemCoffee => 'کافی';

  @override
  String get cabinetItemLock => 'تالا';

  @override
  String get cabinetItemPet => 'پالتو جانور';

  @override
  String get cabinetItemCar => 'کار';

  @override
  String get gamesTitleLabel => 'گیمز';

  @override
  String get yourFavorites => 'آپ کے پسندیدہ';

  @override
  String get readyForWorkout => 'آپ کے روزانہ ورک آؤٹ کے لئے تیار ہیں؟';

  @override
  String get greatStartKeepGoing => 'زبردست آغاز! جاری رکھیں۔';

  @override
  String get onFireToday => 'آج آپ فارم میں ہیں!';

  @override
  String get incredibleSolvingToday => 'آج ناقابل یقین حل!';

  @override
  String get newGameLabel => 'نیا';

  @override
  String get slitherlinkTitle => 'سلیزر لنکہ';

  @override
  String get slitherlinkSubtitle =>
      'نمبر اشاروں کا استعمال کرتے ہوئے پن گرڈ کو لوپ کریں۔';

  @override
  String get futoshikiTitle => 'فتوشیکی';

  @override
  String get futoshikiSubtitle => 'سے بڑا اشاروں کے ساتھ گرڈ بھریں۔';

  @override
  String get kakuroTitle => 'کاکورو';

  @override
  String get kakuroSubtitle => 'نمبروں اور مجموعوں کے ساتھ کراس ورڈ حل کریں۔';

  @override
  String get inequalityDashTitle => 'عدم مساوات ڈیش';

  @override
  String get inequalityDashSubtitle => 'وقت کے دباؤ میں عدم مساوات کو حل کریں۔';

  @override
  String get factorFinderTitle => 'فیکٹر فائنڈر';

  @override
  String get factorFinderSubtitle => 'ہدف نمبروں کے تمام عوامل کی شناخت کریں۔';

  @override
  String get collatzTitle => 'کولاٹز پاتھ';

  @override
  String get collatzSubtitle => '3N+1 ترتیب میں تشریف لے جائیں۔';

  @override
  String get sumPyramidTitle => 'مجموعہ اہرام';

  @override
  String get sumPyramidSubtitle =>
      'مجموعہ ریاضی کے اشاروں کے ساتھ اہرام کے خلیوں کو بھریں۔';

  @override
  String get target10Title => 'ہدف 10';

  @override
  String get target10Subtitle =>
      'دس مجموعہ حاصل کرنے کے لئے نمبر ٹائلوں کو یکجا کریں۔';

  @override
  String get fractionMatcherTitle => 'کسر میچر';

  @override
  String get fractionMatcherSubtitle => 'مساوی کسروں کو بصری طور پر میچ کریں۔';

  @override
  String get dualCodingTitle => 'دوہری کوڈنگ';

  @override
  String get dualCodingSubtitle => 'حروف اور علامتوں کو بیک وقت میچ کریں۔';

  @override
  String get distractorMatrixTitle => 'ڈسٹریکٹر میٹرکس';

  @override
  String get distractorMatrixSubtitle =>
      'ڈسٹریکٹرز کے درمیان ہدف کی شکلیں تلاش کریں۔';

  @override
  String get temporalOrderTitle => 'وقتی ترتیب';

  @override
  String get temporalOrderSubtitle => 'زمانی ترتیب کو یاد کریں۔';

  @override
  String get associativePairsTitle => 'وابستہ جوڑے';

  @override
  String get associativePairsSubtitle =>
      'متعلقہ علامتوں کو جوڑیں اور میچ کریں۔';

  @override
  String get blockCount3dTitle => '3D بلاک گنتی';

  @override
  String get blockCount3dSubtitle => 'سہ جہتی جگہ میں بلاکس گنیں۔';

  @override
  String get rotatingMazeTitle => 'گھومنے والی بھول بھلیاں';

  @override
  String get rotatingMazeSubtitle =>
      'گیندوں کو باہر نکلنے کی طرف لے جانے کے لئے بھول بھلیوں کو گھمائیں۔';

  @override
  String get silhouetteMatchOrthoTitle => 'سلہیٹ میچ (آرتھو)';

  @override
  String get silhouetteMatchOrthoSubtitle =>
      '3D اشیاء کو آرتھو سائے کے ساتھ میچ کریں۔';

  @override
  String get spatialConflictTitle => 'فضائی تصادم';

  @override
  String get spatialConflictSubtitle => 'متن اور سمت کے تضادات کو حل کریں۔';

  @override
  String get spotlightTrackTitle => 'اسپاٹ لائٹ ٹریک';

  @override
  String get spotlightTrackSubtitle =>
      'متحرک سائے میں ٹمٹماتی ہوئی اشیاء کو ٹریک کریں۔';

  @override
  String get d2AttentionTitle => 'd2 توجہ';

  @override
  String get d2AttentionSubtitle =>
      'سخت معیار کے ساتھ ہدف کی علامتوں کو ٹیپ کریں۔';

  @override
  String get dualMirrorTitle => 'ڈوئل مرر نیویگیشن';

  @override
  String get dualMirrorSubtitle =>
      'ایک ساتھ دو بھول بھلیوں میں تشریف لے جائیں۔';

  @override
  String get contextCluesTitle => 'سیاق و سباق کے اشارے';

  @override
  String get contextCluesSubtitle =>
      'سیاق و سباق کے اشاروں سے چھپے ہوئے الفاظ کا اندازہ لگائیں۔';

  @override
  String get digitSpanReverseSubtitle =>
      'نمبر کے ہندسوں کو الٹی ترتیب میں یاد کریں۔';

  @override
  String get faceNameAssociationSubtitle =>
      'پیش کردہ مختلف چہروں کے نام یاد کریں۔';

  @override
  String get staircaseMemorySubtitle =>
      'بلاکس کو مرحلہ وار ترتیب میں یاد کریں۔';

  @override
  String get choiceReactionTimeSubtitle =>
      'اشاروں سے مماثل مخصوص بٹنوں کو تیزی سے ٹیپ کریں۔';

  @override
  String get attentionalBlinkSubtitle =>
      'اسٹریمز میں ٹمٹماتے تیز اہداف کو پہچانیں۔';

  @override
  String get visualStatisticalLearningSubtitle =>
      'بصری طور پر وقتی شکل کے نمونے سیکھیں۔';

  @override
  String get sternbergTaskSubtitle =>
      'یاد کریں کہ کیا علامت میموری سیٹ میں تھی۔';

  @override
  String get operationSpanSubtitle =>
      'ریاضی حل کریں اور حروف تہجی کی زنجیروں کو یاد کریں۔';

  @override
  String get continuousRecognitionTitle => 'مسلسل پہچان';

  @override
  String get continuousRecognitionSubtitle =>
      'شناخت کریں کہ آیا پیش کردہ کارڈ پرانا ہے یا نیا۔';

  @override
  String get symmetrySpanTitle => 'توازن کی حد';

  @override
  String get symmetrySpanSubtitle =>
      'عمودی توازن کے فیصلوں کے درمیان سیل کوآرڈینیٹس یاد کریں۔';

  @override
  String get objectDisplacementTitle => 'شے کی نقل مکانی';

  @override
  String get objectDisplacementSubtitle =>
      'پوزیشنوں کا مطالعہ کریں اور اس واحد شے کو ٹیپ کریں جو حرکت کرتی ہے۔';

  @override
  String get mandalaRecallTitle => 'منڈالا یاد کرنا';

  @override
  String get mandalaRecallSubtitle =>
      'رنگین ٹائلوں کو یاد کریں اور پیلیٹ سے منڈالا کو دوبارہ پینٹ کریں۔';

  @override
  String get runningMemorySpanTitle => 'رننگ میموری سپین';

  @override
  String get runningMemorySpanSubtitle =>
      'چلنے والے حروف کی نگرانی کریں اور آخری N اشیاء یاد کریں۔';

  @override
  String get spatialCabinetMemoryTitle => 'فضائی الماریاں';

  @override
  String get spatialCabinetMemorySubtitle =>
      'الماری کے دروازوں کے پیچھے اشیاء کو یاد کریں اور ان کی جگہ تلاش کریں۔';

  @override
  String get pathRecallSubtitle => 'راستے کے انتخاب کو یاد کریں اور دہرائیں۔';

  @override
  String get objectShuffleSubtitle =>
      'گہرے کپوں کے نیچے بدلے گئے اشیاء کو ٹریک کریں۔';

  @override
  String get groceryListSubtitle =>
      'فہرست میں موجود اشیاء کو یاد کریں اور چیک آف کریں۔';

  @override
  String get quickMathSubtitle => 'ریاضی کے سوالات کو تیز رفتاری سے حل کریں۔';

  @override
  String get mathGuessTitle => 'ریاضی کا اندازہ';

  @override
  String get mathGuessSubtitle =>
      '15 مواقع کے اندر چھپے ہوئے نمبر کا اندازہ لگائیں۔';

  @override
  String get reflexTapSubtitle => 'محرکات کو جتنا جلدی ممکن ہو ٹیپ کریں۔';

  @override
  String get pixelMimicSubtitle => 'پکسل گرڈز پر ڈیزائن کے نمونوں کی نقل کریں۔';

  @override
  String get simonSequenceSubtitle => 'یادداشت سے شکل کی ترتیب دہرائیں۔';

  @override
  String get slidePuzzleSubtitle =>
      'مربع سلائیڈنگ گرڈ ٹائلوں کو دوبارہ ترتیب دیں۔';

  @override
  String get findWordTitle => 'لفظ تلاش کریں';

  @override
  String get schulteTableSubtitle => 'ایک سے پچیس تک نمبروں کو ٹیپ کریں۔';

  @override
  String get simonCommandTitle => 'سائمن کمانڈ';

  @override
  String get simonCommandSubtitle => 'آواز کی ہدایات پر تیزی سے عمل کریں۔';

  @override
  String get binaryCodeTitle => 'بائنری سپیڈ';

  @override
  String get binaryCodeSubtitle => 'بائنری کوڈز کو اعشاریہ میں ترجمہ کریں۔';

  @override
  String get moduloClockTitle => 'ماڈیولو کلاک';

  @override
  String get moduloClockSubtitle =>
      'گھڑیوں کا استعمال کرتے ہوئے ریاضی کی مساوات کا حساب لگائیں۔';

  @override
  String get chimpTestTitle => 'چنپانزی ٹیسٹ';

  @override
  String get chimpTestSubtitle =>
      'بے ترتیب نمبروں کو بڑھتی ہوئی ترتیب میں ٹیپ کریں۔';

  @override
  String get relationalMemoryTitle => 'رشتہ دار یادداشت';

  @override
  String get relationalMemorySubtitle => 'گرڈ اشیاء کی صحیح پوزیشن یاد کریں۔';

  @override
  String get factBinderTitle => 'فیکٹ بائنڈر';

  @override
  String get factBinderSubtitle => 'علامتوں کو جوڑیں اور بیانات یاد کریں۔';

  @override
  String get sourceMonitoringTitle => 'ماخذ کی نگرانی';

  @override
  String get sourceMonitoringSubtitle => 'سیاق و سباق یاد رکھیں۔';

  @override
  String get klotskiTitle => 'کلوٹسکی فرار';

  @override
  String get klotskiSubtitle =>
      'باہر نکلنے کے راستوں تک پہنچنے کے لئے بلاکس کو سلائیڈ کریں۔';

  @override
  String get homophoneHuntSubtitle =>
      'صحیح ہجے والے ہم آواز لفظ کا انتخاب کریں';

  @override
  String get laserLinkTitle => 'لیزر لنک';

  @override
  String get laserLinkSubtitle =>
      'لیزر کی عکاسی کرنے اور تمام اہداف کو پاور اپ کرنے کے لیے آئینوں کو گھمائیں۔';

  @override
  String get laserLinkCongrats =>
      'درست عکاسی! آپ نے کامیابی کے ساتھ پورے گرڈ کو پاور اپ کر دیا ہے۔';

  @override
  String get crossSectionSliceTitle => 'کراس سیکشن سلائس';

  @override
  String get crossSectionSliceSubtitle =>
      'ایک مخصوص زاویے سے تھری ڈی آبجیکٹ کے درست ٹو ڈی کراس سیکشن کی شناخت کریں۔';

  @override
  String get crossSectionSliceCongrats =>
      'ناقابل یقین تھری ڈی تصور! آپ نے اس شکل کے بالکل پار دیکھا۔';

  @override
  String get shadowPivotTitle => 'شیڈو پیوٹ';

  @override
  String get shadowPivotCongrats =>
      'متحرک مکانی استدلال! آپ نے روشنی اور سائے پر عبور حاصل کر لیا۔';

  @override
  String get shadowPivotSubtitle =>
      'ایک تھری ڈی آبجیکٹ کے مختلف محوروں پر گھومنے کے دوران پڑنے والے سائے کی پیش گوئی کریں۔';

  @override
  String get interlockPuzzleTitle => 'انٹر لاک پہیلی';

  @override
  String get interlockPuzzleSubtitle =>
      'پیچیدہ انٹر لاکنگ بلاکس کو درست ترتیب میں الگ کریں یا جوڑیں۔';

  @override
  String get interlockPuzzleCongrats =>
      'منطقی ڈی کنسٹرکشن! آپ نے پہیلی کو بالکل درست طریقے سے حل کیا ہے۔';

  @override
  String get pathIntersectTitle => 'پاتھ انٹر سیکٹ';

  @override
  String get pathIntersectSubtitle =>
      'بغیر کسی ٹکراؤ کے اپنے متعلقہ اہداف تک پہنچنے کے لیے بیک وقت کئی راستوں پر چلیں۔';

  @override
  String get pathIntersectCongrats =>
      'مطابقت پذیر نیویگیشن! آپ تمام اہداف تک بلا روک ٹوک پہنچ گئے ہیں۔';

  @override
  String get negativeSpaceDetectionTitle => 'منفی جگہ';

  @override
  String get negativeSpaceDetectionSubtitle =>
      'اشیاء کے درمیان خالی جگہ سے بننے والی شکل کی شناخت کریں۔';

  @override
  String get negativeSpaceDetectionCongrats =>
      'تیز فہمی! آپ نے وہ دیکھنے کے فن میں مہارت حاصل کر لی ہے جو وہاں نہیں ہے۔';

  @override
  String get compassMazeTitle => 'کمپاس میز';

  @override
  String get compassMazeSubtitle =>
      'ایسی بھول بھلیوں میں راستہ تلاش کریں جہاں آپ کے کمپاس کی سمت کے مطابق حرکت کی سمتیں بدلتی ہیں۔';

  @override
  String get compassMazeCongrats =>
      'ماہرانہ نیویگیشن! آپ نے بدلتی ہوئی سمتوں کے درمیان سے راستہ تلاش کر لیا ہے۔';

  @override
  String get complexFoldingNetsTitle => 'فولڈنگ نیٹس';

  @override
  String get complexFoldingNetsSubtitle =>
      'یہ طے کریں کہ غیر معیاری ٹو ڈی نیٹ کو فولڈ کرنے سے کون سی پیچیدہ تھری ڈی شکل بنے گی۔';

  @override
  String get complexFoldingNetsCongrats =>
      'اعلی درجے کی فولڈنگ منطق! آپ نے کامیابی کے ساتھ تھری ڈی شکل کا تصور کیا ہے۔';

  @override
  String get compassMazeMessage =>
      'کمپاس کا استعمال کرتے ہوئے بھول بھلیوں میں راستہ تلاش کریں۔';

  @override
  String get negativeSpaceDetectionMessage =>
      'خلا میں چھپی ہوئی چیز کی شناخت کریں۔';

  @override
  String get shikakuTitle => 'شیکاکو';

  @override
  String get shikakuSubtitle =>
      'نمبروں سے مماثل چوکوں اور مستطیلوں میں گرڈ کو تقسیم کریں۔';

  @override
  String get countdownMathTitle => 'الٹی گنتی ریاضی';

  @override
  String get countdownMathSubtitle =>
      'تین ہندسوں کے ہدف کا حساب لگانے کے لیے بے ترتیب نمبروں کو یکجا کریں۔';

  @override
  String get narrativeRecallTitle => 'بیانیہ یاد';

  @override
  String get narrativeRecallSubtitle =>
      'ایک کہانی پڑھیں اور مخصوص مقداری اور حقیقت پر مبنی تفصیلات یاد کریں۔';

  @override
  String get shellGameTitle => 'شیل گیم';

  @override
  String get shellGameSubtitle =>
      'ایک چھپی ہوئی گیند کو بدلتے ہوئے کپوں کی تبدیلی کے مقامات کے طور پر ٹریک کریں۔';

  @override
  String get typoglycemiaDecoderTitle => 'ٹائپوگلیسیمیا ڈیکوڈر';

  @override
  String get typoglycemiaDecoderSubtitle =>
      'بے ترتیبی اور بے ترتیب جملوں کو تیزی سے پڑھیں۔';

  @override
  String get shapeShifterTitle => 'شکل بدلنے والا';

  @override
  String get shapeShifterSubtitle =>
      'ہدف کی شکل اور رنگ کے امتزاج کو تھپتھپائیں۔';

  @override
  String get gokigenNanameTitle => 'گوکیگن نام';

  @override
  String get gokigenNanameSubtitle =>
      'بغیر لوپس کے پوائنٹس کو جوڑنے کے لیے اخترن کھینچیں۔';

  @override
  String get matrixMultiplierTitle => 'میٹرکس ضرب';

  @override
  String get matrixMultiplierSubtitle =>
      'ہدف تک ضرب کرنے کے لیے ایک قطار اور کالم منتخب کریں۔';

  @override
  String get wordAssociationRecallTitle => 'لفظ ایسوسی ایشن';

  @override
  String get wordAssociationRecallSubtitle =>
      'میموری سے جوڑے ہوئے الفاظ کی انجمنوں کو یاد کریں۔';

  @override
  String get gearRotationTitle => 'گیئر کی گردش';

  @override
  String get gearRotationSubtitle =>
      'آخری گیئر کی گردش کی سمت کا اندازہ لگائیں۔';

  @override
  String get wordWheelTitle => 'ورڈ وہیل';

  @override
  String get wordWheelSubtitle =>
      'وہیل پر حروف کا استعمال کرتے ہوئے الفاظ بنائیں، بشمول مرکزی خط۔';

  @override
  String get oddEvenFlashTitle => 'اوڈ ایون فلیش';

  @override
  String get oddEvenFlashSubtitle =>
      'رنگ کے اصول کے ساتھ نمبر برابری کو جلدی سے ملا دیں۔';

  @override
  String get norinoriTitle => 'نورینوری';

  @override
  String get norinoriSubtitle =>
      'ہر کمرے میں بالکل دو جڑے ہوئے خلیوں کو سایہ کریں۔';

  @override
  String get algebraicBalanceTitle => 'الجبری بیلنس';

  @override
  String get algebraicBalanceSubtitle =>
      'ہدف کی رقم تلاش کرنے کے لیے مساوات کو حل کریں۔';

  @override
  String get patternSequenceDrawTitle => 'پیٹرن یاد';

  @override
  String get patternSequenceDrawSubtitle =>
      'گرڈ پر متحرک راستے کی ترتیب کو دہرائیں۔';

  @override
  String get tangramTitle => 'تانگرام پہیلی';

  @override
  String get tangramSubtitle => 'ٹارگٹ سلہیٹ کو بھرنے کے لیے شکلیں ترتیب دیں۔';

  @override
  String get semanticAssociationTitle => 'ایسوسی ایشن لفظ';

  @override
  String get semanticAssociationSubtitle =>
      'تینوں سراگوں کو جوڑنے والا لفظ تلاش کریں۔';

  @override
  String get peripheralFocusTitle => 'پیریفرل فوکس';

  @override
  String get peripheralFocusSubtitle =>
      'ریاضی کو حل کرتے وقت چمکتے ہوئے سائیڈ پینلز پر ردعمل ظاہر کریں۔';

  @override
  String get masyuTitle => 'مسیو لوپ';

  @override
  String get masyuSubtitle => 'مسیو دائرے کے قواعد سے مماثل واحد لوپ کھینچیں۔';

  @override
  String get mathMazeTitle => 'ریاضی کی بھولبلییا';

  @override
  String get mathMazeSubtitle =>
      'ایک ایسے راستے کا پتہ لگائیں جو ہدف کے کل کا اندازہ کرتا ہے۔';

  @override
  String get storyBuilderTitle => 'کہانی بنانے والا';

  @override
  String get storyBuilderSubtitle =>
      'کہانی کی تاریخی ترتیب کو دوبارہ ترتیب دیں۔';

  @override
  String get mirrorMazeTitle => 'آئینہ بھولبلییا';

  @override
  String get mirrorMazeSubtitle =>
      'اخترن آئینے کا استعمال کرتے ہوئے لیزر بیم کو ری ڈائریکٹ کریں۔';

  @override
  String get wordGridConnectionTitle => 'الفاظ کے رابطے';

  @override
  String get wordGridConnectionSubtitle =>
      '16 الفاظ کو چار کے چار زمروں میں گروپ کریں۔';

  @override
  String get shapeShifterPeripheralTitle => 'پردیی شکلیں';

  @override
  String get shapeShifterPeripheralSubtitle =>
      'مرکزی اقدار سے مماثل ہوتے ہوئے پردیی شکل کی تبدیلیوں کو ٹریک کریں۔';

  @override
  String get soundWaveMatchTitle => 'صوتی لہر میچ';

  @override
  String get soundWaveMatchSubtitle =>
      'جب بصری لہر کی فریکوئنسی پچ کی تبدیلیوں کے ساتھ سیدھ میں آجائے تو تھپتھپائیں۔';

  @override
  String get multiTrackCounterTitle => 'ملٹی ٹریک کاؤنٹر';

  @override
  String get multiTrackCounterSubtitle =>
      'جب کوئی بھی کاؤنٹر کسی ہدف کے ضرب میں اضافہ کرتا ہے تو تھپتھپائیں۔';

  @override
  String get colorWordMatchUpTitle => 'رنگین میچ اپ';

  @override
  String get colorWordMatchUpSubtitle =>
      'اس بات کا تعین کریں کہ آیا دو رنگین الفاظ بدلتے ہوئے قواعد کی بنیاد پر ملتے ہیں۔';

  @override
  String get signalAndNoiseTitle => 'سگنل اور شور';

  @override
  String get signalAndNoiseSubtitle =>
      'جامد شور میں چھپے ہوئے ٹارگٹ حروف نمبری حروف کو تلاش کریں۔';

  @override
  String get focusTunnelTitle => 'فوکس ٹنل';

  @override
  String get focusTunnelSubtitle =>
      'چلتی ہوئی سرنگ کی دیواروں پر ظاہر ہونے والی مماثل علامتوں کی شناخت کریں۔';

  @override
  String get targetPursuerTitle => 'ہدف کا تعاقب کرنے والا';

  @override
  String get targetPursuerSubtitle =>
      'متعدد اوورلیپنگ حلقوں کو ٹریک کریں اور اصل ہدف کو منتخب کریں۔';

  @override
  String get gridGazeTitle => 'گرڈ نگاہ';

  @override
  String get gridGazeSubtitle =>
      'شناخت کریں کہ کون سا گرڈ سیل مختلف دورانیے کے ساتھ چمکا۔';

  @override
  String get doubleTroubleTitle => 'ڈبل پریشانی';

  @override
  String get doubleTroubleSubtitle =>
      'اسپلٹ اسکرین پر بیک وقت دو الگ الگ سادہ گیمز کھیلیں۔';

  @override
  String get syncRhythmTitle => 'مطابقت پذیری کی تال';

  @override
  String get syncRhythmSubtitle =>
      'جب بصری میٹرنوم سویپ مطابقت پذیر بیٹ سے میل کھاتا ہے تو تھپتھپائیں۔';

  @override
  String get ghostTapTitle => 'گھوسٹ ٹیپ';

  @override
  String get ghostTapSubtitle =>
      'جب پوشیدہ نبض اپنی زیادہ سے زیادہ اونچائی تک پہنچ جائے تو تھپتھپائیں۔';

  @override
  String get attentionalRsvpTitle => 'دھیان سے آر ایس وی پی';

  @override
  String get attentionalRsvpSubtitle =>
      'تیزی سے سیریل لیٹر فلیش میں ظاہر ہونے والے ہندسوں کی شناخت کریں۔';

  @override
  String get colorMazeNavTitle => 'رنگین بھولبلییا Nav';

  @override
  String get colorMazeNavSubtitle =>
      'متحرک اجازت کے رنگوں سے مماثل بھولبلییا ٹائل پر جائیں۔';

  @override
  String get dynamicSalienceTitle => 'متحرک سالینس';

  @override
  String get dynamicSalienceSubtitle =>
      'قدرے مختلف حرکیات کے ساتھ حرکت پذیر شکل تلاش کریں۔';

  @override
  String get chalkAndTalkTitle => 'چاک اینڈ ٹاک';

  @override
  String get chalkAndTalkSubtitle =>
      'بصری خلفشار کو نظر انداز کرتے ہوئے آڈیو میں سننے والے الفاظ ٹائپ کریں۔';

  @override
  String get blinkDetectorTitle => 'پلک جھپکنے کا پتہ لگانے والا';

  @override
  String get blinkDetectorSubtitle =>
      'اس گرڈ چہرے کو تھپتھپائیں جو تیزی سے یکے بعد دیگرے دو بار جھپکتا ہے۔';

  @override
  String get frequencyTapTitle => 'فریکوئنسی ٹیپ';

  @override
  String get frequencyTapSubtitle =>
      'ٹارگٹ لائٹ پلس فریکوئنسی سے مماثل بٹن کو تھپتھپائیں۔';

  @override
  String get yajilinTitle => 'یاجلین لوپ';

  @override
  String get yajilinSubtitle =>
      'سیاہ خلیات رکھیں اور ایک ہی لوپ سے ملنے والے سراگ کھینچیں۔';

  @override
  String get heyawakeTitle => 'Heyawake گرڈ';

  @override
  String get heyawakeSubtitle => 'ملحقہ سیاہ خلیوں کے بغیر سایہ دار گرڈ کمرے۔';

  @override
  String get gokigenVariantTitle => 'گوکیگن ویرینٹ';

  @override
  String get gokigenVariantSubtitle =>
      'لوپ فری ڈائیگنلز میٹنگ کے عمودی شماروں کو ڈرا کریں۔';

  @override
  String get sheepAndWolvesTitle => 'بھیڑ اور بھیڑیے۔';

  @override
  String get sheepAndWolvesSubtitle =>
      'بھیڑ کو بھیڑیوں سے الگ کرنے والا لوپ کھینچیں۔';

  @override
  String get islandNurikabeTitle => 'جزیرہ نوریکابے';

  @override
  String get islandNurikabeSubtitle =>
      'عددی سائز کی پابندیوں سے مماثل جزیرے بنائیں۔';

  @override
  String get shakashakaTitle => 'شاکاشاکا ریکٹس';

  @override
  String get shakashakaSubtitle =>
      'مستطیل سفید علاقے بنانے کے لیے تکونی ٹائلیں لگائیں۔';

  @override
  String get litsTetrisTitle => 'LITS Tetromino';

  @override
  String get litsTetrisSubtitle =>
      'ٹیٹرومینوز کو ایسے کمروں میں رکھیں جس میں کوئی ملحقہ نقل نہ ہو۔';

  @override
  String get tapaWallTitle => 'تپہ دیوار';

  @override
  String get tapaWallSubtitle =>
      'مسلسل سیاہ دیوار کا نمونہ بنانے کے لیے خلیات کو سایہ کریں۔';

  @override
  String get triangularBridgesTitle => 'سہ رخی پل';

  @override
  String get triangularBridgesSubtitle =>
      'جزائر کو 3 سمتوں میں جوڑیں ضروریات کو پورا کریں۔';

  @override
  String get rippleEffectTitle => 'لہر کا اثر';

  @override
  String get rippleEffectSubtitle =>
      'فاصلہ کی دوری کی پابندیوں کا احترام کرتے ہوئے کمروں میں نمبر بھریں۔';

  @override
  String get suguruTectonicTitle => 'سوگورو گرڈ';

  @override
  String get suguruTectonicSubtitle =>
      'کمرے کے بلاکس کو نمبر 1 سے K کے ساتھ بھریں جس کے برابر پڑوسی نہ ہوں۔';

  @override
  String get tennerGridTitle => 'ٹینر گرڈ';

  @override
  String get tennerGridSubtitle =>
      'قطاروں کو ہندسوں سے بھریں 0-9 مماثل کالم ٹوٹل۔';

  @override
  String get kakurasuSumsTitle => 'کاکوراسو سمس';

  @override
  String get kakurasuSumsSubtitle =>
      'وزنی قطار/کول انڈیکس کی رقم کو پورا کرنے کے لیے سیل کو سایہ کریں۔';

  @override
  String get corralLoopTitle => 'کورل لوپ';

  @override
  String get corralLoopSubtitle =>
      'مرئیت سے مماثل نمبروں کو گھیرے ہوئے ایک واحد لوپ کھینچیں۔';

  @override
  String get stostoneTitle => 'سٹوسٹون کشش ثقل';

  @override
  String get stostoneSubtitle =>
      'شیڈ سیلز جو نیچے کی قطاروں کو مکمل طور پر بھرنے کے لیے نیچے گرتے ہیں۔';

  @override
  String get tripletsLogicTitle => 'تینوں تینوں';

  @override
  String get tripletsLogicSubtitle =>
      'ایک قطار میں تین سے گریز کرتے ہوئے گرڈ کو تین شکلوں سے بھریں۔';

  @override
  String get galaxiesSymTitle => 'Galaxies Symmetry';

  @override
  String get galaxiesSymSubtitle =>
      'گرڈ کو گردشی توازن والی کہکشاں کی شکلوں میں تقسیم کریں۔';

  @override
  String get matrixMultiplierMatchTitle => 'میٹرکس میچر';

  @override
  String get matrixMultiplierMatchSubtitle =>
      'ٹارگٹ ڈاٹ پروڈکٹ سے ملنے کے لیے قطار اور کالم کی قدروں کو ضرب دیں۔';

  @override
  String get primeFactorTreesTitle => 'پرائم فیکٹر درخت';

  @override
  String get primeFactorTreesSubtitle =>
      'مرکب نمبروں کو پرائم لیف فیکٹر کے جوڑوں میں تحلیل کریں۔';

  @override
  String get vektorVectorTitle => 'ویکٹر ویکٹر';

  @override
  String get vektorVectorSubtitle =>
      'ویکٹر کو اسکیل کریں تاکہ ان کی زمین کو ہدف پر بنایا جاسکے۔';

  @override
  String get binomialMatchTitle => 'بائنومیل میچ';

  @override
  String get binomialMatchSubtitle =>
      'فیکٹرڈ binomial اقدار کے ساتھ چوکور فارمولوں کو جوڑیں۔';

  @override
  String get percentageShoppingTitle => 'فی صد خریداری';

  @override
  String get percentageShoppingSubtitle =>
      'ڈسکاؤنٹ فیصد اور حتمی چیک آؤٹ ٹوٹل کا حساب لگائیں۔';

  @override
  String get cryptoArithmeticTitle => 'Crypto-Arithmetic';

  @override
  String get cryptoArithmeticSubtitle =>
      'کریک کریکٹر ڈیجٹ متبادل سائفر ریاضی کے مسائل۔';

  @override
  String get fractionalPizzaTitle => 'فریکشنل پیزا';

  @override
  String get fractionalPizzaSubtitle =>
      'ٹارگٹ سم فریکشنز سے ملنے کے لیے پیزا سلائسز کو تقسیم کریں۔';

  @override
  String get numberBondsTitle => 'نمبر بانڈز';

  @override
  String get numberBondsSubtitle =>
      'ٹارگٹ کنکشن کی رقم کے برابر کرنے کے لیے نوڈ ویلیوز کو لنک کریں۔';

  @override
  String get gridSumLineTitle => 'گرڈ سم لائن';

  @override
  String get gridSumLineSubtitle =>
      'ایک ایسا راستہ بنائیں جس کی قدریں ہدف کے عین مطابق ہوں۔';

  @override
  String get binaryScaleBalanceTitle => 'بائنری اسکیل بیلنس';

  @override
  String get binaryScaleBalanceSubtitle =>
      'پاور آف ٹو بلاکس کا استعمال کرتے ہوئے اعشاریہ وزن کو متوازن کریں۔';

  @override
  String get moduloPathTitle => 'ماڈیولو پاتھ';

  @override
  String get moduloPathSubtitle =>
      'ٹریورس گرڈ سیلز جو ماڈیول کی بقیہ اقدار سے مماثل ہیں۔';

  @override
  String get digitSwapEqTitle => 'ہندسوں کی تبدیلی کی مساوات';

  @override
  String get digitSwapEqSubtitle =>
      'دونوں کو درست کرنے کے لیے مساوات کے درمیان واحد ہندسوں کو تبدیل کریں۔';

  @override
  String get areaPerimeterMatchTitle => 'رقبہ اور دائرہ';

  @override
  String get areaPerimeterMatchSubtitle =>
      'ٹارگٹ ایریا اور فریمیٹر ویلیوز سے مماثل مستطیل کھینچیں۔';

  @override
  String get inequalityBalanceOpsTitle => 'عدم مساوات کا توازن';

  @override
  String get inequalityBalanceOpsSubtitle =>
      'پیچیدہ ریاضی کی اصطلاحات کے درمیان عدم مساوات کی علامتیں رکھیں۔';

  @override
  String get graphCoordinatePlotTitle => 'گراف پلاٹر';

  @override
  String get graphCoordinatePlotSubtitle =>
      'پلاٹ گرڈ کوآرڈینیٹ ملتے جلتے لکیری / چوکور منحنی خطوط۔';

  @override
  String get baseConversionRunTitle => 'بیس کنورژن';

  @override
  String get baseConversionRunSubtitle =>
      'بائنری، اعشاریہ، ہیکس اور آکٹل کے درمیان اقدار کو تبدیل کریں۔';

  @override
  String get unitConverterProTitle => 'یونٹ کنورٹر';

  @override
  String get unitConverterProSubtitle =>
      'وقت کی حدود کے تحت فوری یونٹ تبادلوں کا جواب دیں۔';

  @override
  String get auditoryNBackTitle => 'سمعی این-بیک';

  @override
  String get auditoryNBackSubtitle =>
      'مماثل بولے گئے حروف N یادداشت سے پیچھے ہٹتے ہوئے سنے گئے۔';

  @override
  String get abstractPatternRecallTitle => 'پیٹرن لیئرنگ';

  @override
  String get abstractPatternRecallSubtitle =>
      'میموری اسٹڈی سے پرتوں والی رنگین شکلیں دوبارہ بنائیں۔';

  @override
  String get roomInspectorTitle => 'کمرہ انسپکٹر';

  @override
  String get roomInspectorSubtitle =>
      'اسکرین خالی ہونے کے دوران فرنیچر میں کی گئی تبدیلیوں کی شناخت کریں۔';

  @override
  String get voiceToFaceMatchTitle => 'وائس فیس میچ';

  @override
  String get voiceToFaceMatchSubtitle =>
      'بولے گئے آڈیو وائس کلپ سے وابستہ صحیح چہرہ منتخب کریں۔';

  @override
  String get spatialGridMemory3DTitle => '3D مقامی میموری';

  @override
  String get spatialGridMemory3DSubtitle =>
      'گھمائے ہوئے 3D کیوب گرڈ ڈھانچے میں فلیشڈ بلاکس کو یاد کریں۔';

  @override
  String get sequenceStackTitle => 'تسلسل اسٹیک';

  @override
  String get sequenceStackSubtitle =>
      'ترتیب میں پلیٹ اسٹیک کے اضافے اور ہٹانے کو دوبارہ تشکیل دیں۔';

  @override
  String get semanticCategoryRecallTitle => 'زمرہ یاد';

  @override
  String get semanticCategoryRecallSubtitle =>
      'درخواست کردہ زمرہ کے اہداف سے مماثل مطالعاتی الفاظ کی شناخت کریں۔';

  @override
  String get gridDisplacementTitle => 'گرڈ کی نقل مکانی';

  @override
  String get gridDisplacementSubtitle =>
      'لے آؤٹ کا اصل سے موازنہ کرتے ہوئے شفٹ شدہ آئیکنز کی شناخت کریں۔';

  @override
  String get soundSequenceMatchTitle => 'صوتی ترتیب میچ';

  @override
  String get soundSequenceMatchSubtitle =>
      'ورچوئل کی بورڈ پر چلائے گئے نوٹ کے سلسلے کو دہرائیں۔';

  @override
  String get cardCountingMemoryTitle => 'کارڈ کاؤنٹر';

  @override
  String get cardCountingMemorySubtitle =>
      'کارڈز کی شناخت کریں جو پہلے سے ہی مسلسل کارڈ ڈیل میں نمٹ چکے ہیں۔';

  @override
  String get directionsRecallTitle => 'ہدایات یاد کریں۔';

  @override
  String get directionsRecallSubtitle =>
      'میموری سے راستے کی سمتوں سے مماثل گرڈ نقشوں کو نیویگیٹ کریں۔';

  @override
  String get eventTimelineMemoryTitle => 'ایونٹ کی ٹائم لائن';

  @override
  String get eventTimelineMemorySubtitle =>
      'تاریخی/ خیالی ایونٹ کارڈز کو تاریخ کے مطابق ترتیب دیں۔';

  @override
  String get featureMatrixRecallTitle => 'فیچر میٹرکس';

  @override
  String get featureMatrixRecallSubtitle =>
      'جوابی سوال سیل کی شکل رنگ کی خصوصیات کے بارے میں اشارہ کرتا ہے۔';

  @override
  String get delayedMatchSampleTitle => 'تاخیر سے میچ';

  @override
  String get delayedMatchSampleSubtitle =>
      'ریاضی کے خلفشار کو حل کرنے کے بعد ہدف کی علامت سے میچ کریں۔';

  @override
  String get symbolDigitAssocTitle => 'Symbol-digit Assoc';

  @override
  String get symbolDigitAssocSubtitle =>
      'ہندسوں کی چابیاں سے مماثل علامتی ترجمہ شیٹس کو حل کریں۔';

  @override
  String get dualTaskMemoryTitle => 'ڈوئل ٹاسک میموری';

  @override
  String get dualTaskMemorySubtitle =>
      'فوری ریاضی کے کاموں کو حل کرتے ہوئے الفاظ کے سیٹ کو یاد رکھیں۔';

  @override
  String get actionSequenceRecallTitle => 'ایکشن یاد';

  @override
  String get actionSequenceRecallSubtitle =>
      'کریکٹر اشاروں کی حرکت پذیری کی ترتیب کو ترتیب سے دہرائیں۔';

  @override
  String get tangramPolygonTitle => 'تانگرام فٹ';

  @override
  String get tangramPolygonSubtitle =>
      'سلہیٹ خاکہ کو بھرنے کے لیے کثیرالاضلاع کی شکلیں ترتیب دیں۔';

  @override
  String get mazeNav3DTitle => '3D Maze Nav';

  @override
  String get mazeNav3DSubtitle =>
      'پہلے شخص کے نظارے سے 3D isometric بھولبلییا کے راستوں پر تشریف لے جائیں۔';

  @override
  String get isometricProjectionTitle => 'آئیسومیٹرک پروجیکٹر';

  @override
  String get isometricProjectionSubtitle =>
      '3D بلاک کے اعداد و شمار کو آرتھوگرافک 2D ٹاپ/فرنٹ ویوز سے جوڑیں۔';

  @override
  String get polyominoPackingTitle => 'پولیومینو پیکنگ';

  @override
  String get polyominoPackingSubtitle =>
      'بے ترتیب پولی مینو بلاک کے ٹکڑوں کو ہدف والے علاقوں میں پیک کریں۔';

  @override
  String get spatialGridRotationTitle => 'مقامی گرڈ کی گردش';

  @override
  String get spatialGridRotationSubtitle =>
      '3D بلاک کے انتظامات کو محور کوآرڈینیٹس کے ساتھ گھما کر میچ کریں۔';

  @override
  String get wireLoopGameTitle => 'وائر لوپ';

  @override
  String get wireLoopGameSubtitle =>
      'دھات کی انگوٹھیوں کو بغیر کسی رابطے کے تار کی پٹیوں کے ساتھ گھسیٹیں۔';

  @override
  String get origamiUnfoldTitle => 'اوریگامی انفولڈ';

  @override
  String get origamiUnfoldSubtitle =>
      'تہہ شدہ چادروں کو کھولنے کے بعد سوراخ کے پنچ پیٹرن کی شناخت کریں۔';

  @override
  String get ropeTangleSolverTitle => 'رسی اُنٹینگلر';

  @override
  String get ropeTangleSolverSubtitle =>
      'نوڈس کو زیرو لائن کراس کے ساتھ پلانر گرافس لے آؤٹ کرنے کے لیے گھسیٹیں۔';

  @override
  String get gridFitTetrisTitle => 'گرڈ فٹ سولور';

  @override
  String get gridFitTetrisSubtitle =>
      'کنٹینر کی حدود کو فٹ کرنے کے لیے جامد فاسد بلاکس کا بندوبست کریں۔';

  @override
  String get vectorGridAlignmentTitle => 'ویکٹر الائنمنٹ';

  @override
  String get vectorGridAlignmentSubtitle =>
      'شیڈو ٹیمپلیٹ کے اہداف سے ملنے کے لیے شکلیں پیمانہ اور گھمائیں۔';

  @override
  String get blockStackingPhysicsTitle => 'بلاک اسٹیکنگ';

  @override
  String get blockStackingPhysicsSubtitle =>
      'کشش ثقل کے وزن کو متوازن کرنے والے فاسد بلاک پینلز کو اسٹیک کریں۔';

  @override
  String get crossSectionMatch3DTitle => '3D کراس سیکشن';

  @override
  String get crossSectionMatch3DSubtitle =>
      '3D شکلوں سے کٹے ہوئے 2D سلائس جیومیٹریوں کی شناخت کریں۔';

  @override
  String get symmetryPaintTitle => 'ہم آہنگی پینٹ';

  @override
  String get symmetryPaintSubtitle =>
      'ہم آہنگی کے محور پر عکاسی کرنے والے آئینے کی تصویر کے حصے بنائیں۔';

  @override
  String get rollingBlockBloxTitle => 'رولنگ بلاک';

  @override
  String get rollingBlockBloxSubtitle =>
      'ٹارگٹ سلاٹس میں عمودی طور پر اترنے کے لیے بلاک کے ٹکڑوں کو رول کریں۔';

  @override
  String get perspectiveShiftViewTitle => 'نقطہ نظر کی شفٹ';

  @override
  String get perspectiveShiftViewSubtitle =>
      'بلاک کلسٹرز کو اس وقت تک گھمائیں جب تک کہ وہ حروف / الفاظ کے ہجے نہ کریں۔';

  @override
  String get networkFlowSphericalTitle => 'نیٹ ورک فلو';

  @override
  String get networkFlowSphericalSubtitle =>
      'ریپنگ سلنڈرکل کوآرڈینیٹس پر گرڈ کے بہاؤ کو مربوط کریں۔';

  @override
  String get layeredSilhouetteBlendTitle => 'سلہیٹ بلینڈ';

  @override
  String get layeredSilhouetteBlendSubtitle =>
      'ہدف کی پارباسی شکلوں سے ملنے کے لیے رنگین تہوں کو اسٹیک کریں۔';

  @override
  String get wordWheelPangramTitle => 'لفظ اناگرامس';

  @override
  String get wordWheelPangramSubtitle =>
      'پہیوں سے مرکزی ہدف کے حروف پر مشتمل الفاظ بنائیں۔';

  @override
  String get letterGridSwapperTitle => 'لیٹر سویپر';

  @override
  String get letterGridSwapperSubtitle =>
      'قطار اور کال الفاظ کو مکمل کرنے کے لیے ملحقہ خط کی ٹائلیں تبدیل کریں۔';

  @override
  String get synonymMatchTitle => 'مترادف میچ';

  @override
  String get synonymMatchSubtitle =>
      'گرتے ہوئے الفاظ کے اہداف کو مترادفات یا متضاد الفاظ کے ساتھ جوڑیں۔';

  @override
  String get vowelDropTitle => 'Vowel Drop';

  @override
  String get vowelDropSubtitle =>
      'الفاظ کو مکمل کرنے والے کوآرڈینیٹ گرڈ میں سروں کو چھوڑیں۔';

  @override
  String get letterBalanceScaleTitle => 'ورڈ بیلنس اسکیل';

  @override
  String get letterBalanceScaleSubtitle =>
      'ایسے الفاظ کی ہجے کریں جن کے حرف توازن وزن کی قدر کرتے ہیں۔';

  @override
  String get wordChainShiritoriTitle => 'ورڈ چین';

  @override
  String get wordChainShiritoriSubtitle =>
      'پچھلے حروف کے آؤٹ پٹس سے شروع ہونے والے ورڈ لوپس کو لنک کریں۔';

  @override
  String get affixBuilderTitle => 'ایفکس بلڈر';

  @override
  String get affixBuilderSubtitle =>
      'ٹارگٹ الفاظ کو بنانے کے لیے سابقے/ لاحقے کو یکجا کریں۔';

  @override
  String get decipherCrypticCluesTitle => 'خفیہ ڈیسیفر';

  @override
  String get decipherCrypticCluesSubtitle =>
      'ورڈ پلے پہیلیاں حل کریں اور ہجے کی پہیلیوں کو ڈکرپٹ کریں۔';

  @override
  String get boggleWordSearchTitle => 'بوگل کنیکٹ';

  @override
  String get boggleWordSearchSubtitle =>
      'پوشیدہ الفاظ تلاش کرنے کے لیے ملحقہ جڑے ہوئے راستوں کا سراغ لگائیں۔';

  @override
  String get idiomUnscrambleTitle => 'محاورہ Unscramble';

  @override
  String get idiomUnscrambleSubtitle =>
      'محاورے کے معانی سے مماثل الفاظ کی صفوں کو ترتیب دیں۔';

  @override
  String get letterPyramidsTitle => 'خط اہرام';

  @override
  String get letterPyramidsSubtitle =>
      'ورڈ ٹاورز بنائیں جس میں فی ٹائر واحد ایناگرام حروف شامل ہوں۔';

  @override
  String get soundAlikeHomophonesTitle => 'ہوموفون میچز';

  @override
  String get soundAlikeHomophonesSubtitle =>
      'جملے کے لیے صحیح ہومو فون ہجے کی شناخت کریں۔';

  @override
  String get wordGridSudokuTitle => 'لفظ سوڈوکو';

  @override
  String get wordGridSudokuSubtitle =>
      'گرڈ قطاروں میں ٹیسلیٹ حروف جو الفاظ تشکیل دیتے ہیں۔';

  @override
  String get portmanteauFactoryTitle => 'پورٹ مینٹو فیکٹری';

  @override
  String get portmanteauFactorySubtitle =>
      'مرکب الفاظ بنانے والے سیمنٹک اجزاء کو ضم کریں۔';

  @override
  String get codedCrosswordsCodeTitle => 'کوڈ ورڈز کراس ورڈ';

  @override
  String get codedCrosswordsCodeSubtitle =>
      'نمبر سے حرفی کوڈز کے مماثل گرڈ کراس ورڈز کو حل کریں۔';

  @override
  String get wordSnakeTrailTitle => 'لفظ سانپ';

  @override
  String get wordSnakeTrailSubtitle =>
      'ٹریس سانپ کی طرح حروف ٹریلس موضوعاتی الفاظ کے ہجے.';

  @override
  String get typingRhythmSpeedTitle => 'ٹائپنگ فلو';

  @override
  String get typingRhythmSpeedSubtitle =>
      'میٹرنوم تال کی دھڑکنوں سے مماثل الفاظ کی قسم۔';

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
  String get hideGame => 'چھپائیں';

  @override
  String get unhideGame => 'سامنے لائیں';

  @override
  String get favoriteGame => 'پسندیدہ';

  @override
  String get unfavoriteGame => 'پسندیدہ سے ہٹائیں';

  @override
  String get hiddenGames => 'پوشیدہ کھیل';

  @override
  String showHiddenGames(int count) {
    return 'پوشیدہ کھیل دکھائیں ($count)';
  }

  @override
  String get noHiddenGames => 'کوئی پوشیدہ کھیل نہیں ہے';

  @override
  String get gameHidden => 'کھیل چھپا دیا گیا';

  @override
  String get undo => 'پہلے جیسا کریں';

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
  String get btnMatchColor => 'رنگ ملائیں';

  @override
  String get btnMatchWord => 'لفظ ملائیں';

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
