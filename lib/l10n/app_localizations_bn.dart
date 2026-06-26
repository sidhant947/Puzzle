// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'পাজল গেম';

  @override
  String get home => 'হোম';

  @override
  String get settings => 'সেটিংস';

  @override
  String get playAgain => 'আবার খেলুন';

  @override
  String get playNext => 'পরবর্তী খেলুন';

  @override
  String get seeCompleted => 'পর্যালোচনা';

  @override
  String get finish => 'শেষ';

  @override
  String get congrats => 'অভিনন্দন';

  @override
  String get perfectGradient => 'নিখুঁত গ্রেডিয়েন্ট!';

  @override
  String get wellDone => 'সাবাস';

  @override
  String get timeUp => 'সময় শেষ!';

  @override
  String get victory => 'জয়!';

  @override
  String get gameWin => 'সাবাশ!';

  @override
  String get completed => 'সম্পন্ন!';

  @override
  String get score => 'স্কোর';

  @override
  String get timeLeft => 'সময়';

  @override
  String get trials => 'ট্রায়াল';

  @override
  String get numberRule => 'সংখ্যার নিয়ম';

  @override
  String get colorRule => 'রঙের নিয়ম';

  @override
  String get valid => 'বৈধ';

  @override
  String get invalid => 'অবৈধ';

  @override
  String get even => 'জোড়';

  @override
  String get odd => 'বিজোড়';

  @override
  String get red => 'লাল';

  @override
  String get green => 'সবুজ';

  @override
  String get blue => 'নীল';

  @override
  String get yes => 'হ্যাঁ';

  @override
  String get no => 'না';

  @override
  String get trueLabel => 'সত্য';

  @override
  String get falseLabel => 'মিথ্যা';

  @override
  String get clear => 'পরিষ্কার';

  @override
  String get north => 'উত্তর';

  @override
  String get south => 'দক্ষিণ';

  @override
  String get east => 'পূর্ব';

  @override
  String get west => 'পশ্চিম';

  @override
  String get target => 'লক্ষ্য';

  @override
  String get moves => 'চাল';

  @override
  String get trialMode => 'ট্রায়াল মোড';

  @override
  String get trialModeDescription =>
      '৬০ সেকেন্ডের টাইমারের পরিবর্তে ২০টি সমাধান করে শেষ করুন';

  @override
  String get appearance => 'চেহারা';

  @override
  String get language => 'ভাষা';

  @override
  String get gameplay => 'গেমপ্লে';

  @override
  String get supportUs => 'আমাদের সমর্থন করুন';

  @override
  String get systemLegal => 'সিস্টেম ও আইনি';

  @override
  String get games => 'গেম';

  @override
  String get solvedToday => 'আজ সমাধান করা হয়েছে';

  @override
  String get searchGames => 'গেম খুঁজুন...';

  @override
  String get readyToStart => 'আপনার মস্তিষ্কের ওয়ার্কআউট শুরু করতে প্রস্তুত?';

  @override
  String get greatStart => 'দুর্দান্ত শুরু! এই গতি বজায় রাখুন।';

  @override
  String get onFire => 'দারুণ খেলছেন! আপনার মস্তিষ্ক এটি পছন্দ করছে।';

  @override
  String get incredible => 'অবিশ্বাস্য! আপনি একজন পাজল মাস্টার।';

  @override
  String get noGamesMatch => 'আপনার অনুসন্ধানের সাথে কোনো গেম মিলছে না';

  @override
  String get categoryAll => 'সব';

  @override
  String get categoryAttention => 'মনোযোগ';

  @override
  String get categoryLogic => 'যুক্তি';

  @override
  String get categoryMath => 'গণিত';

  @override
  String get categoryWord => 'শব্দ';

  @override
  String get categoryMemory => 'স্মৃতি';

  @override
  String get categorySpatial => 'স্থানিক';

  @override
  String get themeLight => 'হালকা';

  @override
  String get themeDark => 'গাঢ়';

  @override
  String get themeSystem => 'সিস্টেম';

  @override
  String get starOnGithub => 'GitHub-এ স্টার দিন';

  @override
  String get sponsorOnGithub => 'GitHub-এ স্পনসর করুন';

  @override
  String get privacyPolicy => 'গোপনীয়তা নীতি';

  @override
  String get termsOfService => 'পরিষেবার শর্তাবলী';

  @override
  String get licenses => 'লাইসেন্স';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return 'লুকানো $wordLength-অক্ষরের শব্দটি খুঁজে পেতে আপনার $maxTriesটি চেষ্টা আছে।';
  }

  @override
  String wordFoundMessage(String word) {
    return 'শব্দটি সফলভাবে পাওয়া গেছে: $word';
  }

  @override
  String gameOverMessage(String word) {
    return 'শব্দটি ছিল: $word';
  }

  @override
  String get gameOver => 'গেম ওভার';

  @override
  String get crosswordTitle => 'ক্রসওয়ার্ড';

  @override
  String get crosswordSubtitle =>
      'প্রদত্ত সূত্রের ভিত্তিতে সঠিক শব্দ দিয়ে গ্রিডটি পূরণ করুন।';

  @override
  String get wordSearchTitle => 'শব্দ অনুসন্ধান';

  @override
  String get radicalRootsTitle => 'র‍্যাডিকাল রুটস';

  @override
  String get radicalRootsSubtitle =>
      'প্রদত্ত সংখ্যার বর্গমূল বা ঘনমূল খুঁজুন। প্রয়োজনে নিকটতম পূর্ণসংখ্যায় রাউন্ড করুন।';

  @override
  String get radicalRootsGoalReached => 'লক্ষ্য অর্জিত!';

  @override
  String get radicalRootsTimeUp => 'সময় শেষ!';

  @override
  String radicalRootsScoreMessage(int score) {
    return 'আপনি $scoreটি মূল সঠিকভাবে গণনা করেছেন!';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return 'অনুশীলন চালিয়ে যান! আপনি $scoreটি মূল গণনা করেছেন।';
  }

  @override
  String get radicalRootsStart => 'গণনা শুরু করুন';

  @override
  String get radicalRootsDescription =>
      'আপনার কাছে যতটা সম্ভব সমাধান করার জন্য ৬০ সেকেন্ড সময় আছে।';

  @override
  String get radicalRootsBest => 'সেরা';

  @override
  String get radicalRootsSeconds => '৬০ সেকেন্ড';

  @override
  String get romanArithmeticTitle => 'রোমান পাটিগণিত';

  @override
  String get romanArithmeticSubtitle =>
      'রোমান সংখ্যা ব্যবহার করে যোগ এবং বিয়োগ সমস্যার সমাধান করুন।';

  @override
  String get romanArithmeticGoalReached => 'সেন্টুরিয়ন স্তর!';

  @override
  String get romanArithmeticTimeUp => 'সময় শেষ!';

  @override
  String romanArithmeticScoreMessage(int score) {
    return 'আপনি $scoreটি রোমান সমস্যার সমাধান করেছেন!';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return 'ভেনি, ভিডি, ভিচি! আপনি $scoreটি সমস্যার সমাধান করেছেন।';
  }

  @override
  String get romanArithmeticStart => 'অন্বেষণ শুরু করুন';

  @override
  String get romanArithmeticDescription =>
      'রূপান্তর এবং সমাধান করুন। আপনার কাছে ৬০ সেকেন্ড আছে।';

  @override
  String get romanArithmeticBest => 'সেরা';

  @override
  String get romanArithmeticSeconds => '৬০ সেকেন্ড';

  @override
  String get wordSearchSubtitle =>
      'গ্রিডে সমস্ত লুকানো শব্দ খুঁজুন। নির্বাচন করতে ড্র্যাগ করুন।';

  @override
  String get missingVowelsTitle => 'অনুপস্থিত স্বরবর্ণ';

  @override
  String get missingVowelsSubtitle => 'স্বরবর্ণ লুকানো শব্দটি শনাক্ত করুন।';

  @override
  String get missingVowelsWin => 'স্বরবর্ণ পুনরুদ্ধার করা হয়েছে!';

  @override
  String get missingVowelsHowToPlay =>
      'একটি শব্দ তার স্বরবর্ণ (A, E, I, O, U) লুকানো অবস্থায় দেখানো হয়। সম্পূর্ণ শব্দটি অনুমান করুন!';

  @override
  String get wordScrambleTitle => 'শব্দ স্ক্র্যাম্বল';

  @override
  String get wordScrambleSubtitle =>
      'লুকানো শব্দটি উন্মোচন করতে অক্ষরগুলো ট্যাপ করুন!';

  @override
  String get wordScrambleWin => 'শব্দ উন্মোচিত!';

  @override
  String get sudokuTitle => 'সুডোকু';

  @override
  String get sudokuSubtitle =>
      'গ্রিডটি এমনভাবে পূরণ করুন যাতে প্রতিটি সারি, কলাম এবং ৩x৩ বক্সে ১ থেকে ৯ পর্যন্ত সমস্ত সংখ্যা থাকে।';

  @override
  String get minesweeperTitle => 'মাইনসুইপার';

  @override
  String get minesweeperSubtitle =>
      'বিস্ফোরণ না ঘটিয়ে সমস্ত মাইন শনাক্ত করুন।';

  @override
  String get minesweeperWin => 'বিজয়!';

  @override
  String get minesweeperMines => 'মাইন';

  @override
  String get minesweeperStatus => 'অবস্থা';

  @override
  String get minesweeperWon => 'জিতেছেন';

  @override
  String get minesweeperBoom => 'বিস্ফোরণ';

  @override
  String get minesweeperPlaying => 'খেলছেন';

  @override
  String get minesweeperReveal => 'প্রকাশ করুন';

  @override
  String get minesweeperFlag => 'পতাকা';

  @override
  String get game2048Title => '২০৪৮';

  @override
  String get game2048Subtitle =>
      'টাইলস একত্রিত করতে এবং ২০৪৮ টাইলে পৌঁছাতে যে কোনও দিকে সোয়াইপ করুন!';

  @override
  String get nonogramTitle => 'ননোগ্রাম';

  @override
  String get nonogramSubtitle =>
      'যুক্তি ব্যবহার করে লুকানো চিত্রটি প্রকাশ করুন।';

  @override
  String get nonogramWin => 'চিত্র প্রকাশিত!';

  @override
  String get magnetsTitle => 'ম্যাগনেটস';

  @override
  String get magnetsSubtitle =>
      'মেরু গণনার উপর ভিত্তি করে গ্রিডে ম্যাগনেট রাখুন।';

  @override
  String get magnetsHowToPlay =>
      'ডমিনো-আকারের কন্টেইনারগুলি \'+\' এবং \'-\' ম্যাগনেট দিয়ে পূরণ করুন অথবা খালি রাখুন। সারি এবং কলামের সূত্রগুলি সেই লাইনে প্রতিটি মেরুর মোট সংখ্যা নির্দিষ্ট করে। অভিন্ন মেরুগুলি লম্বভাবে সংলগ্ন হতে পারে না।';

  @override
  String get magnetsWinTitle => 'পোলারিটি ব্যালেন্সড!';

  @override
  String get magnetsWinMessage => 'সব ম্যাগনেট নিখুঁতভাবে সাজানো হয়েছে!';

  @override
  String get lighthousesTitle => 'লাইটহাউস';

  @override
  String get lighthousesSubtitle =>
      'লাইটহাউস সূত্রের উপর ভিত্তি করে জাহাজ রাখুন।';

  @override
  String get lighthousesHowToPlay =>
      'গ্রিডে ১x১ জাহাজ রাখুন। লাইটহাউসগুলি অনুভূমিকভাবে এবং উল্লম্বভাবে দৃশ্যমান জাহাজের মোট সংখ্যা নির্দেশ করে। জাহাজগুলি লাইটহাউস বা একে অপরকে স্পর্শ করতে পারবে না, এমনকি তির্যকভাবেও না।';

  @override
  String get lighthousesWinTitle => 'নিরাপদ সমুদ্র!';

  @override
  String get lighthousesWinMessage =>
      'সব লাইটহাউস জাহাজগুলোকে নিখুঁতভাবে পথ দেখাচ্ছে!';

  @override
  String get dominosaTitle => 'ডমিনোসা';

  @override
  String get dominosaSubtitle => 'গ্রিডে লুকানো সব ডমিনো খুঁজে বের করুন।';

  @override
  String get dominosaHowToPlay =>
      'সংখ্যার গ্রিডে ডমিনোর একটি সম্পূর্ণ সেট এমনভাবে সাজান যাতে প্রতিটি সংলগ্ন সংখ্যার জোড়া ঠিক একটি ডমিনো দ্বারা আচ্ছাদিত হয়। প্রতিটি সংখ্যার জোড়া সেটে কেবল একবার থাকে।';

  @override
  String get dominosaWinTitle => 'ডমিনো মাস্টার!';

  @override
  String get dominosaWinMessage =>
      'প্রতিটি ডমিনো খুঁজে পাওয়া গেছে এবং স্থাপন করা হয়েছে!';

  @override
  String get skyscrapersTitle => 'স্কাইস্ক্র্যাপারস';

  @override
  String get skyscrapersSubtitle => 'গ্রিডটি ভবনের উচ্চতা দিয়ে পূরণ করুন।';

  @override
  String get skyscrapersHowToPlay =>
      'গ্রিডটি উচ্চতা (1-N) দিয়ে পূরণ করুন যাতে প্রতিটি সারি এবং কলামে প্রতিটি উচ্চতা ঠিক একবার থাকে। ধারের সূত্রগুলি নির্দেশ করে যে সেই দিক থেকে কয়টি ভবন দৃশ্যমান, যেখানে উঁচু ভবনগুলি ছোট ভবনগুলিকে আড়াল করে।';

  @override
  String get skyscrapersWinTitle => 'স্কাইলাইন পুনরুদ্ধার!';

  @override
  String get skyscrapersWinMessage => 'সব ভবন নিখুঁতভাবে অবস্থিত!';

  @override
  String get nurikabeTitle => 'নুরিকেব';

  @override
  String get nurikabeSubtitle =>
      'একটি সংযুক্ত সমুদ্র এবং পৃথক দ্বীপ তৈরি করুন।';

  @override
  String get nurikabeHowToPlay =>
      'একটি একক সংযুক্ত \'সমুদ্র\' (কোনো ২x২ ব্লক নেই) তৈরি করতে সেলগুলি শেড করুন। শেডহীন সেলগুলি \'দ্বীপ\' গঠন করে, যার প্রতিটিতে ঠিক একটি সংখ্যা থাকে যা তার মোট ক্ষেত্রফলকে উপস্থাপন করে।';

  @override
  String get nurikabeWinTitle => 'সমুদ্র প্রবাহিত!';

  @override
  String get nurikabeWinMessage => 'দ্বীপগুলো আলাদা, সমুদ্র সংযুক্ত!';

  @override
  String get fillominoTitle => 'ফিলোমিনো';

  @override
  String get fillominoSubtitle =>
      'গ্রিডটিকে নির্দিষ্ট আকারের পলিওমিনোতে ভাগ করুন।';

  @override
  String get fillominoHowToPlay =>
      'গ্রিডটিকে পলিওমিনোতে ভাগ করুন যাতে আকার N-এর প্রতিটি পলিওমিনো তার সমস্ত সেলে সংখ্যা N ধারণ করে। একই আকারের পলিওমিনো লম্বভাবে সংলগ্ন হতে পারে না।';

  @override
  String get fillominoWinTitle => 'গ্রিড বিভক্ত!';

  @override
  String get fillominoWinMessage => 'যুক্তির সাথে নিখুঁতভাবে সাজানো!';

  @override
  String get hitoriTitle => 'হিতোরি';

  @override
  String get hitoriSubtitle =>
      'প্রতিটি সারি এবং কলামে ডুপ্লিকেট সংখ্যাগুলি শেড করুন।';

  @override
  String get hitoriHowToPlay =>
      'সেলগুলি শেড করুন যাতে কোনো সারি বা কলামে কোনো সংখ্যা একাধিকবার না আসে। শেড করা সেলগুলি সংলগ্ন (লম্বভাবে) হতে পারে না এবং সমস্ত শেডহীন সেলকে একটি একক সংযুক্ত দল গঠন করতে হবে।';

  @override
  String get hitoriWinTitle => 'হিতোরি মাস্টার!';

  @override
  String get hitoriWinMessage => 'আপনি সফলভাবে সব ডুপ্লিকেট সমাধান করেছেন!';

  @override
  String get pathFinderTitle => 'পাথ ফাইন্ডার';

  @override
  String get pathFinderSubtitle => 'S থেকে E পর্যন্ত লুকানো পথটি খুঁজুন।';

  @override
  String get pathFinderWin => 'পথ আয়ত্ত করা হয়েছে!';

  @override
  String get howToPlay => 'কিভাবে খেলবেন';

  @override
  String get gotIt => 'বুঝেছি';

  @override
  String get akariTitle => 'আকারি';

  @override
  String get akariSubtitle => 'সমস্ত সাদা ঘর আলোকিত করুন';

  @override
  String get akariHowToPlay =>
      'পুরো গ্রিড আলোকিত করতে সাদা ঘরগুলোতে লাইটবাল্ব রাখুন। বাল্বগুলো তাদের সারি এবং কলাম আলোকিত করে যতক্ষণ না তারা দেয়ালে আঘাত করে। দুটি বাল্ব একে অপরের ওপর আলো ফেলতে পারে না। সংখ্যাযুক্ত দেয়ালগুলো দেখায় যে সংলগ্ন ঘরগুলোতে (উপরে, নিচে, বামে, ডানে) ঠিক কতগুলো বাল্ব রাখতে হবে।';

  @override
  String get akariWinTitle => 'আলো জ্বলে উঠেছে!';

  @override
  String get akariWinMessage => 'সবকিছু নিখুঁতভাবে আলোকিত।';

  @override
  String get arithmeticChainTitle => 'চেইন ক্যালক';

  @override
  String get arithmeticChainSubtitle => 'আপনার মাথায় চলমান মোট গণনা করুন';

  @override
  String get arithmeticChainWinTitle => 'লেভেল আপ!';

  @override
  String get arithmeticChainWinMessage => 'আপনার মানসিক গণনা তীক্ষ্ণ!';

  @override
  String get arithmeticChainLoseTitle => 'আবার চেষ্টা করুন';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return 'সঠিক উত্তর ছিল $answer।';
  }

  @override
  String get arithmeticChainStart => 'শুরু';

  @override
  String get arithmeticChainNext => 'পরবর্তী';

  @override
  String get attentionalBlinkTitle => 'অ্যাটেনশনাল ব্লিঙ্ক';

  @override
  String get attentionalBlinkSubtitleWatch => 'সংখ্যাগুলোর দিকে নজর দিন';

  @override
  String get attentionalBlinkSubtitleInput =>
      'আপনি যে দুটি সংখ্যা দেখেছেন তা লিখুন';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return 'আপনি $scoreটি লক্ষ্য স্কোর করেছেন!';
  }

  @override
  String get balanceScaleTitle => 'ব্যালেন্স স্কেল';

  @override
  String get balanceScaleSubtitle =>
      'স্কেলের ভিত্তিতে শেষ আইটেমটির ওজন অনুমান করুন।';

  @override
  String get balanceScaleWinTitle => 'ভারসাম্যপূর্ণ!';

  @override
  String get balanceScaleWinMessage => 'আপনি সঠিকভাবে ওজন অনুমান করেছেন!';

  @override
  String get balanceScaleLoseTitle => 'অভারসাম্য';

  @override
  String get balanceScaleLoseMessage =>
      'সঠিক ভারসাম্য খুঁজে পেতে আবার চেষ্টা করুন।';

  @override
  String get balanceScaleBack => 'পিছনে';

  @override
  String get balanceScaleSubmit => 'জমা দিন';

  @override
  String get binaryPuzzleTitle => 'বাইনারি পাজল';

  @override
  String get binaryPuzzleSubtitle =>
      '০ এবং ১ দিয়ে পূরণ করুন। পাশাপাশি একই অংকের সর্বোচ্চ দুটি থাকতে পারে। প্রতিটি সারি এবং কলামে সমান সংখ্যক ০ এবং ১ থাকতে হবে।';

  @override
  String get binaryPuzzleWinTitle => 'সাবাস';

  @override
  String get binaryPuzzleWinMessage =>
      'আপনি নিখুঁত যুক্তির সাথে বাইনারি পাজলটি সমাধান করেছেন!';

  @override
  String get blockEscapeTitle => 'ব্লক এস্কেপ';

  @override
  String get blockEscapeSubtitle =>
      'মূল ব্লকের বাইরে বেরোনোর পথ তৈরি করতে ব্লকগুলো স্লাইড করুন।';

  @override
  String get blockEscapeWinTitle => 'পালানো!';

  @override
  String get blockEscapeWinMessage =>
      'আপনি সফলভাবে মূল ব্লকের পথ পরিষ্কার করেছেন!';

  @override
  String get boxCompletionTitle => 'বক্স সমাপ্তি';

  @override
  String get boxCompletionSubtitle => 'কোন ঘনকটি তৈরি করা যেতে পারে?';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return 'আপনি $totalTrialsটির মধ্যে $scoreটি সঠিক করেছেন!';
  }

  @override
  String get boxCompletionOptions => 'বিকল্প';

  @override
  String get bridgesTitle => 'ব্রিজেস';

  @override
  String get bridgesSubtitle =>
      'সেতু দিয়ে দ্বীপগুলো সংযুক্ত করুন। প্রতিটি দ্বীপের নির্দিষ্ট সংখ্যক সেতু প্রয়োজন। সেতুগুলো একে অপরকে অতিক্রম করতে পারবে না।';

  @override
  String get bridgesWinTitle => 'সংযুক্ত!';

  @override
  String get bridgesWinMessage => 'আপনি সফলভাবে সমস্ত দ্বীপ সংযুক্ত করেছেন!';

  @override
  String get calculationSprintTitle => 'ক্যালকুলেশন স্প্রিন্ট';

  @override
  String get calculationSprintSubtitle =>
      '৬০ সেকেন্ডে যতগুলো সম্ভব সমীকরণ সমাধান করুন।';

  @override
  String get calculationSprintGoalReached => 'লক্ষ্য অর্জিত!';

  @override
  String get calculationSprintTimeUp => 'সময় শেষ';

  @override
  String calculationSprintScoreMessage(int score) {
    return 'চমৎকার গণনার গতি! আপনি $score পয়েন্ট পেয়েছেন।';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return 'আপনি $score পয়েন্ট পেয়েছেন। আপনার সেরাকে ছাড়িয়ে যাওয়ার চেষ্টা করুন!';
  }

  @override
  String get calculationSprintBest => 'সেরা';

  @override
  String get calculationSprintSeconds => '৬০ সেকেন্ড';

  @override
  String get calculationSprintDescription =>
      'দ্রুত সমীকরণ সমাধান করুন।\nভুল উত্তরের জন্য ৩ সেকেন্ড কাটা হবে!';

  @override
  String get calculationSprintStart => 'স্প্রিন্ট শুরু করুন';

  @override
  String get categoryFluencyTitle => 'বিভাগ সাবলীলতা';

  @override
  String get categoryFluencySubtitle => 'বিভাগের অন্তর্ভুক্ত আইটেমগুলো লিখুন';

  @override
  String get categoryFluencyExpert => 'সাবলীলতা বিশেষজ্ঞ!';

  @override
  String get categoryFluencyTimeUp => 'সময় শেষ!';

  @override
  String get categoryFluencyWinMessage => 'আপনার শব্দভাণ্ডার বিশাল!';

  @override
  String categoryFluencyFoundMessage(int count) {
    return 'আপনি $countটি শব্দ পেয়েছেন।';
  }

  @override
  String get categoryFluencyCategoryLabel => 'বিভাগ:';

  @override
  String get categoryFluencyEnterItem => 'একটি আইটেম লিখুন...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target শব্দ';
  }

  @override
  String get changeBlindnessTitle => 'পরিবর্তন অন্ধত্ব';

  @override
  String get changeBlindnessSubtitle => 'পরিবর্তিত আইটেমটি খুঁজে বের করুন';

  @override
  String changeBlindnessScore(int score) {
    return 'স্কোর: $score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return 'আপনি $scoreটি পরিবর্তন খুঁজে পেয়েছেন!';
  }

  @override
  String get choiceRtTitle => 'চয়েস আরটি';

  @override
  String get choiceRtSubtitle => 'সক্রিয় বর্গে যত দ্রুত সম্ভব ট্যাপ করুন';

  @override
  String choiceRtAvgMessage(String avg) {
    return 'আপনার গড় প্রতিক্রিয়া সময়: ${avg}ms';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return 'অবশিষ্ট সময়: ${time}s';
  }

  @override
  String choiceRtTaps(int count) {
    return 'ট্যাপ: $count';
  }

  @override
  String get colorFloodTitle => 'কালার ফ্লাড';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return 'চাল: $moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => 'ফ্লাড সফল!';

  @override
  String get colorFloodDryLand => 'শুকনো জমি...';

  @override
  String get colorFloodWinMessage => 'আপনি রঙ দিয়ে পুরো গ্রিডটি পূর্ণ করেছেন!';

  @override
  String get colorFloodLoseMessage =>
      'আপনার চাল শেষ হয়ে গেছে। আবার চেষ্টা করুন!';

  @override
  String get colorMatchTitle => 'কালার ম্যাচ';

  @override
  String get colorMatchSubtitle =>
      'লক্ষ্য রঙের সাথে যতটা সম্ভব মেলাতে স্লাইডারগুলো সামঞ্জস্য করুন।';

  @override
  String get colorMatchTarget => 'লক্ষ্য';

  @override
  String get colorMatchYours => 'আপনার';

  @override
  String get colorMatchCheck => 'মিল পরীক্ষা করুন';

  @override
  String get colorMatchResult => 'মিলের ফলাফল';

  @override
  String colorMatchAccuracy(String accuracy) {
    return 'আপনার নির্ভুলতা: $accuracy%';
  }

  @override
  String get corsiBlocksTitle => 'করসি ব্লকস';

  @override
  String get corsiBlocksSubtitle =>
      'ব্লকগুলো জ্বলে ওঠার দিকে নজর দিন এবং একই ক্রমে সেগুলো ট্যাপ করুন।';

  @override
  String get corsiBlocksWinTitle => 'স্থানিক মাস্টার!';

  @override
  String get corsiBlocksLoseTitle => 'স্থানে হারিয়েছেন';

  @override
  String corsiBlocksMessage(int score, int span) {
    return 'আপনি $scoreটি অনুক্রম মনে রেখেছেন! আপনার স্থানিক মেমরি স্প্যান $span-এ পৌঁছেছে।';
  }

  @override
  String get corsiBlocksWatch => 'প্যাটার্নটি দেখুন';

  @override
  String get corsiBlocksRepeat => 'প্যাটার্নটি পুনরাবৃত্তি করুন';

  @override
  String get corsiBlocksExcellent => 'চমৎকার!';

  @override
  String get corsiBlocksSpan => 'স্প্যান';

  @override
  String get crownTitle => 'ক্রাউন';

  @override
  String get crownSubtitle =>
      'প্রতিটি সারি, কলাম এবং রঙের অঞ্চলে একটি মুকুট রাখুন। মুকুটগুলো সংলগ্ন হতে পারবে না, এমনকি তির্যকভাবেও নয়।';

  @override
  String get crownCrowned => 'মুকুট পরানো হয়েছে!';

  @override
  String get crownSuccess =>
      'নিখুঁত যুক্তির সাথে সমস্ত মুকুট সফলভাবে স্থাপন করা হয়েছে।';

  @override
  String get cryptogramTitle => 'ক্রিপ্টোগ্রাম';

  @override
  String get cryptogramSubtitle =>
      'গোপন বার্তাটি ডিকোড করতে অক্ষর বরাদ্দ করুন! প্রতিটি এনকোড করা অক্ষর একটি আসল অক্ষরের প্রতিনিধিত্ব করে।';

  @override
  String get cryptogramBroken => 'কোড ভেঙেছে!';

  @override
  String get cryptogramEncrypted => 'এনক্রিপ্ট করা';

  @override
  String get cryptogramSuccess => 'আপনি বার্তাটি নিখুঁতভাবে ডিকোড করেছেন।';

  @override
  String get cryptogramTryAgain => 'এনক্রিপশন ভাঙতে আবার চেষ্টা করুন।';

  @override
  String get digitSpanReverseTitle => 'রিভার্স স্প্যান';

  @override
  String get digitSpanReverseSubtitleMemorize => 'অংকগুলো মুখস্থ করুন';

  @override
  String get digitSpanReverseSubtitleEnter => 'উল্টো ক্রমে অংকগুলো লিখুন';

  @override
  String get digitSpanReverseWinTitle => 'লেভেল আপ!';

  @override
  String get digitSpanReverseWinMessage => 'আপনার ওয়ার্কিং মেমরি চিত্তাকর্ষক!';

  @override
  String get digitSpanReverseLoseTitle => 'আবার চেষ্টা করুন';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return 'সঠিক উল্টো অনুক্রম ছিল $sequence।';
  }

  @override
  String get dividedAttentionTitle => 'বিভক্ত মনোযোগ';

  @override
  String get dividedAttentionSubtitle =>
      'তারার ⭐ জন্য বাম দিকে ট্যাপ করুন | লালের 🔴 জন্য ডান দিকে ট্যাপ করুন';

  @override
  String get dividedAttentionGameOverTitle => 'মনোযোগ বিচ্ছিন্ন';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return 'মাল্টিটাস্কিং কঠিন! আপনার স্কোর ছিল $score।';
  }

  @override
  String dividedAttentionScore(int score) {
    return 'স্কোর: $score';
  }

  @override
  String get doubleNBackTitle => 'ডাবল এন-ব্যাক';

  @override
  String doubleNBackSubtitle(int n) {
    return '$n ধাপ আগের উদ্দীপনার সাথে মেলান';
  }

  @override
  String get doubleNBackGameOverTitle => 'গেম ওভার';

  @override
  String doubleNBackGameOverMessage(int score) {
    return 'আপনি ডাবল এন-ব্যাকে $score পয়েন্ট পেয়েছেন!';
  }

  @override
  String doubleNBackScore(int score) {
    return 'স্কোর: $score';
  }

  @override
  String get doubleNBackPositionMatch => 'অবস্থান মিল';

  @override
  String get doubleNBackLetterMatch => 'অক্ষর মিল';

  @override
  String get faceNameAssociationTitle => 'ফেস-নেম';

  @override
  String get faceNameAssociationSubtitleStudy =>
      'প্রতিটি মুখের জন্য নাম মুখস্থ করুন';

  @override
  String get faceNameAssociationSubtitleTest => 'ইনি কে?';

  @override
  String get faceNameAssociationPerfect => 'নিখুঁত!';

  @override
  String get faceNameAssociationGameOver => 'গেম ওভার';

  @override
  String get faceNameAssociationWinMessage =>
      'মুখ এবং নাম মনে রাখার জন্য আপনার দারুণ মেমরি আছে!';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return 'আপনি $totalটির মধ্যে $correctটি সঠিক করেছেন।';
  }

  @override
  String get faceNameAssociationStartTest => 'পরীক্ষা শুরু করুন';

  @override
  String get flankerTestWinTitle => 'লেজার ফোকাস!';

  @override
  String get flankerTestLoseTitle => 'মনোযোগ বিচ্যুত';

  @override
  String flankerTestScoreMessage(int score) {
    return 'আপনি $scoreটি সঠিকভাবে স্কোর করেছেন!';
  }

  @override
  String get flankerTestTitle => 'ফ্ল্যাঙ্কার টেস্ট';

  @override
  String get flankerTestSubtitle =>
      'পার্শ্ববর্তী তীরগুলো উপেক্ষা করে মাঝখানের তীরের দিক নির্দেশ করুন।';

  @override
  String get flankerTestLeft => 'বাম';

  @override
  String get flankerTestRight => 'ডান';

  @override
  String get fractionMatchTitle => 'ভগ্নাংশ মিল';

  @override
  String get fractionMatchSubtitle => 'ভিজ্যুয়ালটির সাথে তার ভগ্নাংশ মেলান';

  @override
  String get fractionMatchLoseTitle => 'ভগ্নাংশ অমিল';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return 'সঠিক উত্তর ছিল $correctAnswer।';
  }

  @override
  String get goNoGoTitle => 'গো / নো-গো';

  @override
  String get goNoGoSubtitle => 'সবুজের জন্য ট্যাপ করুন, লাল উপেক্ষা করুন!';

  @override
  String get goNoGoLoseTitle => 'প্রতিক্রিয়া বন্ধ';

  @override
  String get goNoGoLoseMessage => 'আপনার ইনহিবিটরি কন্ট্রোল পরীক্ষা করা হচ্ছে!';

  @override
  String get goNoGoTapAnywhere => 'শুরু করতে যে কোনও জায়গায় ট্যাপ করুন';

  @override
  String get groceryListTitle => 'মুদির তালিকা';

  @override
  String get groceryListSubtitleMemorize =>
      'আইটেম এবং তাদের বিভাগগুলো মুখস্থ করুন';

  @override
  String get groceryListSubtitleTest => 'এই আইটেমটি কোন বিভাগের ছিল?';

  @override
  String get groceryListWinTitle => 'গ্রোসারি গুরু!';

  @override
  String get groceryListLoseTitle => 'কিছু ভুলে গেছেন?';

  @override
  String groceryListScoreMessage(int score) {
    return 'আপনি গ্রোসারি লিস্টে $score পয়েন্ট পেয়েছেন!';
  }

  @override
  String get groceryListReady => 'আমি প্রস্তুত';

  @override
  String get groceryListWhereBelong => 'এটি কোথায় অন্তর্গত?';

  @override
  String get hueSortTitle => 'হিউ সর্ট';

  @override
  String get hueSortSubtitle =>
      'কোণার রঙগুলোর মধ্যে একটি মসৃণ রূপান্তর তৈরি করতে টাইলস অদলবদল করুন। বিন্দুগুলো স্থির টাইল নির্দেশ করে।';

  @override
  String get hueSortWinTitle => 'নিখুঁত গ্রেডিয়েন্ট!';

  @override
  String get hueSortWinMessage =>
      'আপনি কালার স্পেকট্রামটি নিখুঁতভাবে সাজিয়েছেন!';

  @override
  String hueSortWrongTiles(int count) {
    return 'ভুল অবস্থানে থাকা টাইলস: $count';
  }

  @override
  String get kenkenTitle => 'কেনকেন';

  @override
  String get kenkenWinTitle => 'প্রতিভাবান!';

  @override
  String get kenkenLoseTitle => 'গেম ওভার';

  @override
  String get kenkenWinMessage => 'আপনি কেনকেন পাজলটি সমাধান করেছেন!';

  @override
  String get kenkenLoseMessage =>
      'সারি/কলাম এবং খাঁচার নিয়মগুলো পরীক্ষা করুন।';

  @override
  String kenkenSubtitle(int size) {
    return 'সারি/কলামে পুনরাবৃত্তি না করে ১-$size পূরণ করুন';
  }

  @override
  String get letterCancellationTitle => 'অক্ষর বাতিল';

  @override
  String get letterCancellationTitleFull => 'অক্ষর বাতিলকরণ';

  @override
  String letterCancellationScoreMessage(int score) {
    return 'আপনি $scoreটি অক্ষর খুঁজে পেয়েছেন!';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return 'সমস্ত \"$target\" অক্ষর খুঁজুন';
  }

  @override
  String get letterCancellationFound => 'পাওয়া গেছে';

  @override
  String get letterCancellationTime => 'সময়';

  @override
  String get lightsOutTitle => 'লাইটস আউট';

  @override
  String get lightsOutSubtitle =>
      'একটি টাইল ট্যাপ করলে সেটি এবং তার সংলগ্ন টাইলগুলো টগল হয়। সমাধান করতে সমস্ত আলো নিভিয়ে দিন।';

  @override
  String get lightsOutWinTitle => 'পাজল সমাধান!';

  @override
  String get lightsOutWinMessage => 'আপনি সফলভাবে সমস্ত আলো নিভিয়ে দিয়েছেন!';

  @override
  String get symmetryTitle => 'প্রতিসাম্য';

  @override
  String get symmetrySubtitle =>
      'বামের প্যাটার্নটি ডানের খালি গ্রিডে মিরর করুন।';

  @override
  String get semanticLinkTitle => 'সেম্যান্টিক লিঙ্ক';

  @override
  String get semanticLinkSubtitle => 'তিনটিকেই সংযুক্ত করে এমন শব্দটি খুঁজুন';

  @override
  String get reflexTapTitle => 'রিফ্লেক্স ট্যাপ';

  @override
  String get visualStatisticalLearningTitle =>
      'ভিজ্যুয়াল স্ট্যাটিস্টিক্যাল লার্নিং';

  @override
  String get orbitTapTitle => 'অরবিট ট্যাপ';

  @override
  String get orbitTapSubtitle => 'বলগুলো গেটের সাথে সারিবদ্ধ হলে ট্যাপ করুন';

  @override
  String get schulteTableTitle => 'শুল্ট টেবিল';

  @override
  String get multipleObjectTrackingTitle => 'অবজেক্ট ট্র্যাকার';

  @override
  String get multipleObjectTrackingSubtitle =>
      'হাইলাইট করা বস্তুগুলোর দিকে নজর দিন। সেগুলো নড়াচড়া করার সময় ট্র্যাক করুন, তারপর সেগুলো নির্বাচন করুন।';

  @override
  String get sdmtTitle => 'এসডিএমটি টেস্ট';

  @override
  String get sdmtSubtitle =>
      'দেখানো প্রতীকের জন্য অংকটি খুঁজে পেতে ওপরের কী-টি ব্যবহার করুন।';

  @override
  String get memoryMatrixTitle => 'মেমরি ম্যাট্রিক্স';

  @override
  String get memoryMatrixSubtitle =>
      'প্যাটার্নটি মুখস্থ করুন এবং টাইলগুলো ট্যাপ করুন।';

  @override
  String get mentalAbacusTitle => 'মেন্টাল অ্যাবাকাস';

  @override
  String get mentalAbacusSubtitle => 'সোরোবান ব্যবহার করে সমাধান করুন';

  @override
  String get spellingSprintTitle => 'স্পেলিং স্প্রিন্ট';

  @override
  String get spellingSprintSubtitle =>
      'ঘড়ির কাঁটার সাথে পাল্লা দিয়ে যতগুলো সম্ভব শব্দের বানান করুন।';

  @override
  String get stopSignalTitle => 'স্টপ সিগন্যাল';

  @override
  String get stopSignalSubtitle =>
      'তীরের দিকে ট্যাপ করুন, কিন্তু তীর লাল হয়ে গেলে সাথে সাথে থামুন।';

  @override
  String get staircaseMemoryTitle => 'স্টেয়ারকেস মেমরি';

  @override
  String get vigilanceTaskTitle => 'ভিজিল্যান্স টাস্ক';

  @override
  String get vigilanceTaskSubtitle =>
      'কাঁটা যখন একটি অবস্থান এড়িয়ে যায় তখন বোতামটি ট্যাপ করুন';

  @override
  String get logicalSyllogismsTitle => 'লজিক্যাল সিলোজিজম';

  @override
  String get logicalSyllogismsSubtitle => 'উপসংহারটি কি যৌক্তিকভাবে বৈধ?';

  @override
  String get mathPathTitle => 'ম্যাথ পাথ';

  @override
  String get mathPathSubtitle =>
      'একটি পথ খুঁজুন যা ঠিক টার্গেট যোগফলের সমান হয়।';

  @override
  String get sternbergTaskTitle => 'স্টার্নবার্গ টাস্ক';

  @override
  String get sternbergTaskMemorize => 'অক্ষরগুলো মুখস্থ করুন';

  @override
  String get sternbergTaskWasLetterSet => 'এই অক্ষরটি কি সেটে ছিল?';

  @override
  String sternbergTaskScore(int score) {
    return 'আপনি স্টার্নবার্গ টাস্কে $score পয়েন্ট পেয়েছেন!';
  }

  @override
  String get verbalAnalogiesTitle => 'মৌখিক উপমা';

  @override
  String get verbalAnalogiesSubtitle => 'সম্পর্কটি পূরণ করুন';

  @override
  String get typingSpeedTitle => 'টাইপিং স্পিড';

  @override
  String get typingSpeedSubtitle =>
      'দেখানো বাক্যাংশটি যত দ্রুত সম্ভব হুবহু টাইপ করুন!';

  @override
  String get wordLadderTitle => 'শব্দ মই';

  @override
  String get wordLadderSubtitle =>
      'একবারে একটি অক্ষর পরিবর্তন করে শব্দগুলো সংযুক্ত করুন।';

  @override
  String get tangleFixTitle => 'জট সমাধান';

  @override
  String get tangleFixSubtitle =>
      'লাইনগুলো এমনভাবে জটমুক্ত করুন যাতে কোনোটি একে অপরকে ছেদ না করে';

  @override
  String get oddRotationTitle => 'অড রোটেশন';

  @override
  String get oddRotationSubtitle =>
      'এগুলোর মধ্যে একটি মিরর করা আছে। আপনি কি এটি খুঁজে পেতে পারেন?';

  @override
  String get towerOfLondonTitle => 'টাওয়ার অফ লন্ডন';

  @override
  String get towerOfLondonSubtitle => 'টার্গেট কনফিগারেশনের সাথে মেলান';

  @override
  String get symbolicFlankerTitle => 'সিম্বলিক ফ্ল্যাঙ্কার';

  @override
  String get symbolicFlankerSubtitle => 'মাঝখানের চিহ্নের দিকে মনোযোগ দিন';

  @override
  String get stroopTestTitle => 'স্ট্রুপ টেস্ট';

  @override
  String get stroopTestSubtitle =>
      'দেখানো শব্দের কালির রঙ শনাক্ত করুন। শব্দটি আসলে কী বলছে তা উপেক্ষা করুন!';

  @override
  String get wisconsinCardSortingTitle => 'উইসকনসিন কার্ড সর্ট';

  @override
  String get wisconsinCardSortingSubtitle =>
      'কার্ডটিকে ওপরের চারটির মধ্যে একটির সাথে মেলান';

  @override
  String get nBackTitle => 'এন-ব্যাক টেস্ট';

  @override
  String get nBackSubtitle =>
      'যদি বর্তমান অক্ষরটি ২ ধাপ আগে দেখানো অক্ষরের সাথে মিলে যায় তবে ম্যাচ ট্যাপ করুন।';

  @override
  String get rhythmMasterTitle => 'রিদম মাস্টার';

  @override
  String get rhythmMasterSubtitle => 'স্পন্দনের সাথে তাল মিলিয়ে ট্যাপ করুন';

  @override
  String get pixelMimicTitle => 'পিক্সেল মিমিক';

  @override
  String get targetNumberTitle => 'টার্গেট ২৪';

  @override
  String targetNumberSubtitle(int target) {
    return '$target-এ পৌঁছাতে ৪টি সংখ্যাই ব্যবহার করুন';
  }

  @override
  String get mirrorTracingTitle => 'মিরর ট্রেসিং';

  @override
  String get mirrorTracingSubtitle =>
      'তারাটি ট্রেস করুন! নিয়ন্ত্রণগুলো মিরর করা আছে।';

  @override
  String get wordSurgeTitle => 'শব্দ সার্জ';

  @override
  String get wordSurgeSubtitle => 'সমার্থক ও বিপরীতার্থক শব্দ';

  @override
  String get perspectiveTakingTitle => 'দৃষ্টিকোণ গ্রহণ';

  @override
  String get perspectiveTakingTopDownView => 'টপ-ডাউন ভিউ';

  @override
  String get perspectiveTakingChoosePerspective => 'দৃষ্টিকোণ চয়ন করুন';

  @override
  String get perspectiveTakingCongrats =>
      'স্থানিক সম্পর্কের জন্য আপনার তীক্ষ্ণ দৃষ্টি আছে।';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return '$targetDirName থেকে কোনটি দেখা যাচ্ছে?';
  }

  @override
  String get paperFoldingTitle => 'কাगज ভাঁজ করা';

  @override
  String get paperFoldingSubtitle => 'উন্মোচন করলে এটি দেখতে কেমন হবে?';

  @override
  String get waterSortTitle => 'ওয়াটার সর্ট';

  @override
  String get waterSortSubtitle =>
      'রঙগুলো এমনভাবে সাজান যাতে প্রতিটি টিউবে কেবল একটি রঙ থাকে।';

  @override
  String get numericalEstimationTitle => 'নিউমেরিক্যাল এস্টিমেশন';

  @override
  String get numericalEstimationSubtitle => 'দ্রুত নিকটতম উত্তরটি বেছে নিন!';

  @override
  String get lockPatternTitle => 'লক প্যাটার্ন';

  @override
  String get lockPatternSubtitle =>
      'গোপন প্যাটার্নটি খুঁজুন। প্রতিটি অনুমান অবস্থান এবং বিন্দুর প্রতিক্রিয়া দেয়।';

  @override
  String get primeHunterTitle => 'প্রাইম হান্টার';

  @override
  String get primeHunterSubtitle =>
      'মৌলিক সংখ্যার জন্য বামে সোয়াইপ করুন | যৌগিক সংখ্যার জন্য ডানে সোয়াইপ করুন';

  @override
  String get tracePathTitle => 'ট্রেস পাথ';

  @override
  String get tracePathSubtitle =>
      'টার্গেট পথটি যতটা সম্ভব কাছ থেকে অনুসরণ করুন';

  @override
  String get ruleSwitcherTitle => 'রুল সুইচার';

  @override
  String get ruleSwitcherSubtitle => 'বর্তমান নিয়ম প্রয়োগ করুন';

  @override
  String get choiceReactionTimeTitle => 'চয়েস রিয়্যাকশন টাইম';

  @override
  String get pathRecallTitle => 'পাথ রিকল';

  @override
  String get switchTaskTitle => 'সুইচ টাস্ক';

  @override
  String get switchTaskSubtitle =>
      'নিয়মের দিকে মনোযোগ দিন! এটি আকৃতি মেলানো এবং রঙ মেলানোর মধ্যে পরিবর্তন হবে।';

  @override
  String get mentalRotationTitle => 'মানসিক ঘূর্ণন';

  @override
  String get mentalRotationSubtitle => 'এই আকৃতিগুলো কি একই, কেবল ঘোরানো?';

  @override
  String get missingOperatorTitle => 'অপারেটর মিক্স';

  @override
  String get missingOperatorSubtitle =>
      'সমীকরণটি সম্পন্ন করতে শূন্যস্থান পূরণ করুন';

  @override
  String get wordMastermindTitle => 'শব্দ মাস্টারমাইন্ড';

  @override
  String get wordMastermindSubtitle =>
      '৪-অক্ষরের কোডটি ক্র্যাক করুন! বুলস (B) হলো নিখুঁত অবস্থান, কাউস (C) হলো ভুল অবস্থান।';

  @override
  String get simonSequenceTitle => 'সিকোয়েন্স';

  @override
  String get symbolLogicTitle => 'চিহ্ন যুক্তি';

  @override
  String get symbolLogicSubtitle =>
      'প্রতিটি চিহ্নের মান খুঁজে বের করতে ভিজ্যুয়াল সমীকরণগুলো সমাধান করুন। শেষ সমীকরণের ফলাফল কী?';

  @override
  String get silhouetteMatchTitle => 'সিলুয়েট ম্যাচ';

  @override
  String get silhouetteMatchSubtitle => 'কোন সিলুয়েটটি এই বস্তুর সাথে মেলে?';

  @override
  String get operationSpanTitle => 'অপারেশন স্প্যান';

  @override
  String get operationSpanMathPhase => 'সমীকরণটি কি সঠিক?';

  @override
  String get operationSpanLetterPhase => 'অক্ষরটি মনে রাখুন';

  @override
  String get operationSpanRecallPhase => 'অক্ষরগুলো ক্রমানুসারে মনে করুন';

  @override
  String get operationSpanRoundComplete => 'রাউন্ড সম্পন্ন!';

  @override
  String operationSpanScore(int score) {
    return 'আপনি অপারেশন স্প্যানে $score পয়েন্ট পেয়েছেন!';
  }

  @override
  String get slidePuzzleTitle => 'স্লাইড পাজল';

  @override
  String get slidePuzzleNewGame => 'নতুন গেম';

  @override
  String get slidePuzzleInstructions =>
      'টাইলগুলো খালি জায়গায় স্লাইড করে সংখ্যা অনুযায়ী সাজান।';

  @override
  String get slidePuzzleTileSlider => 'টাইল স্লাইডার';

  @override
  String get slidePuzzleCongrats => 'আপনি সফলভাবে সমস্ত টাইল সাজিয়েছেন।';

  @override
  String get visualSearchTitle => 'ভিজ্যুয়াল সার্চ';

  @override
  String get visualSearchSubtitle => 'গ্রিডে অনন্য প্রতীকটি খুঁজুন';

  @override
  String get trailMakingTitle => 'ট্রেইল মেকিং';

  @override
  String get trailMakingSubtitle =>
      'যত দ্রুত সম্ভব সংখ্যাগুলো ক্রমানুসারে (১ -> ২ -> ৩...) সংযুক্ত করুন।';

  @override
  String get matrixReasoningTitle => 'ম্যাট্রিক্স রিজনিং';

  @override
  String get matrixReasoningSubtitle => '৩x৩ গ্রিডে প্যাটার্নটি সম্পূর্ণ করুন';

  @override
  String get tentsAndTreesTitle => 'টেন্ট ও ট্রি';

  @override
  String get tentsAndTreesSubtitle =>
      'গাছের পাশে তাবু রাখুন। সংখ্যাগুলো প্রতিটি সারি/কলামে কয়টি তাবু আছে তা নির্দেশ করে। তাবুগুলো একে অপরকে স্পর্শ করতে পারবে না।';

  @override
  String get quickMathTitle => 'কুইক ম্যাথ';

  @override
  String get magicSquaresTitle => 'ম্যাজিক স্কয়ার';

  @override
  String magicSquaresSubtitle(int targetSum) {
    return 'প্রতিটি সারি, কলাম এবং তির্যক রেখার যোগফল $targetSum হতে হবে';
  }

  @override
  String get objectShuffleTitle => 'অবজেক্ট শাফেল';

  @override
  String get pipesTitle => 'পাইপস';

  @override
  String get pipesSubtitle =>
      'মিলে যাওয়া রঙের বিন্দুগুলো পাইপ দিয়ে সংযুক্ত করুন।';

  @override
  String get oddOneOutTitle => 'অড ওয়ান আউট';

  @override
  String get oddOneOutSubtitle => 'আলাদা রঙের টাইলটি খুঁজুন।';

  @override
  String get einsteinRiddleTitle => 'আইনস্টাইন রিডল';

  @override
  String get einsteinRiddleSubtitle =>
      'প্রতিটি বাড়ির বৈশিষ্ট্য অনুমান করতে সূত্রগুলো ব্যবহার করুন।';

  @override
  String get einsteinRiddleHowToPlay =>
      'প্রতিটি বাড়ির অনন্য বৈশিষ্ট্য রয়েছে (রঙ, জাতীয়তা, পোষা প্রাণী ইত্যাদি)। গ্রিডটি পূরণ করতে এবং সম্পূর্ণ সমাধান খুঁজে পেতে প্রদত্ত সূত্রগুলো ব্যবহার করুন।';

  @override
  String get einsteinRiddleColor => 'রঙ';

  @override
  String get einsteinRiddleNationality => 'জাতীয়তা';

  @override
  String get einsteinRiddleDrink => 'পানীয়';

  @override
  String get einsteinRiddlePet => 'পোষা প্রাণী';

  @override
  String get einsteinRiddleSmoke => 'ধূমপান';

  @override
  String get einsteinRiddleHouse => 'বাড়ি';

  @override
  String get mirrorImageTitle => 'আয়নার প্রতিচ্ছবি';

  @override
  String get mirrorImageSubtitle => 'সঠিক আয়নার প্রতিচ্ছবি শনাক্ত করুন।';

  @override
  String get mirrorImageHowToPlay =>
      'আকৃতিটি দেখুন এবং প্রদত্ত বিকল্পগুলো থেকে সঠিক আয়নার প্রতিচ্ছবি বেছে নিন।';

  @override
  String get mentalMappingTitle => 'মানসিক ম্যাপিং';

  @override
  String get mentalMappingSubtitle =>
      'নির্দেশনাগুলো অনুসরণ করুন এবং গন্তব্য খুঁজুন।';

  @override
  String get mentalMappingHowToPlay =>
      'আপনাকে নির্দেশনার একটি অনুক্রম দেখানো হবে (উত্তর, দক্ষিণ, পূর্ব, পশ্চিম)। গ্রিডের কেন্দ্র থেকে শুরু করে মানসিকভাবে এই ধাপগুলো অনুসরণ করুন এবং চূড়ান্ত গন্তব্য নির্বাচন করুন।';

  @override
  String get memoryPalaceTitle => 'স্মৃতি প্রাসাদ';

  @override
  String get memoryPalaceSubtitle => 'কোন স্থানে কোন শব্দ ছিল তা মনে রাখুন।';

  @override
  String get memoryPalaceHowToPlay =>
      'একটি গ্রিডে বিভিন্ন স্থানে কিছু শব্দ উপস্থিত হবে। তাদের অবস্থান মুখস্থ করুন। তারপর, আপনাকে শব্দগুলোকে তাদের আসল অবস্থানে ফিরিয়ে দিতে বলা হবে।';

  @override
  String get countingSheepTitle => 'ভেড়া গণনা';

  @override
  String get countingSheepSubtitle => 'আপনি কয়টি ভেড়া দেখেছেন?';

  @override
  String get countingSheepHowToPlay =>
      'ভেড়া দ্রুত স্ক্রিনের ওপর দিয়ে চলে যাবে। তারা যাওয়ার সময় তাদের গণনা করুন এবং শেষে মোট সংখ্যা লিখুন।';

  @override
  String get faceTraitAssociationTitle => 'ফেস-ট্রেট';

  @override
  String get faceTraitAssociationSubtitle =>
      'প্রতিটি মুখের জন্য বৈশিষ্ট্যগুলো মুখস্থ করুন';

  @override
  String get faceTraitAssociationHowToPlay =>
      'আপনাকে বেশ কয়েকটি মুখ দেখানো হবে, যার প্রতিটি নাম, পেশা এবং শখের সাথে থাকবে। এই অ্যাসোসিয়েশনগুলো মুখস্থ করুন। পরে, আপনাকে প্রতিটি মুখের জন্য নির্দিষ্ট বৈশিষ্ট্যগুলো মনে করতে বলা হবে।';

  @override
  String get mentalCalendarTitle => 'মানসিক ক্যালেন্ডার';

  @override
  String get mentalCalendarSubtitle => 'সপ্তাহের দিনটি গণনা করুন';

  @override
  String get mentalCalendarHowToPlay =>
      'একটি এলোমেলো তারিখ দেখানো হবে। সপ্তাহের কোন দিনে এটি পড়ে তা নির্ধারণ করতে মানসিক গণনা (বা ডুমসডে অ্যালগরিদম) ব্যবহার করুন।';

  @override
  String get vocabularyBuilderTitle => 'শব্দভাণ্ডার নির্মাতা';

  @override
  String get vocabularyBuilderSubtitle =>
      'সময়ের চাপে সমার্থক এবং বিপরীতার্থক শব্দ মেলান।';

  @override
  String get vocabularyBuilderHowToPlay =>
      'আপনাকে একটি টার্গেট শব্দ এবং একটি সম্পর্ক (সমার্থক বা বিপরীতার্থক) দেখানো হবে। বিকল্পগুলো থেকে সঠিক শব্দটি চয়ন করুন যা সম্পর্কের সাথে মেলে। দ্রুত করুন, সময় চলে যাচ্ছে!';

  @override
  String get correct => 'সঠিক';

  @override
  String get incorrect => 'ভুল';

  @override
  String get grammarPoliceTitle => 'ব্যাকরণ পুলিশ';

  @override
  String get grammarPoliceSubtitle =>
      'বাক্যটি ব্যাকরণগতভাবে সঠিক নাকি ভুল আছে তা সনাক্ত করুন।';

  @override
  String get grammarPoliceHowToPlay =>
      'পর্দার মাঝখানে একটি বাক্য উপস্থিত হবে। এটি ব্যাকরণগতভাবে সঠিক নাকি এতে কোনো ভুল আছে তা স্থির করুন। যদি এটি ঠিক থাকে তবে \'সঠিক\' ট্যাপ করুন, অথবা যদি আপনি কোনো ভুল দেখেন তবে \'ভুল\' ট্যাপ করুন। আপনার সমস্ত জীবন হারাবেন না!';

  @override
  String get reverseStroopTitle => 'রিভার্স স্ট্রুপ';

  @override
  String get reverseStroopSubtitle =>
      'স্ট্রুপ টেস্টের একটি বৈচিত্র্য যেখানে ফোকাস পরিবর্তন করা হয়।';

  @override
  String get reverseStroopHowToPlay =>
      'নির্দেশনার দিকে মনোযোগ দিন! যদি এটি \'TEXT\' বলে, শব্দের অর্থ মেলান। যদি এটি \'COLOR\' বলে, কালির রঙ মেলান। আপনার ফোকাস পরীক্ষা করার জন্য নিয়মগুলো ঘন ঘন পরিবর্তিত হবে।';

  @override
  String get game2048Instruction => 'একত্রিত করতে যে কোনও দিকে সোয়াইপ করুন';

  @override
  String get fibonacciMergeTitle => 'ফিবোনাচি মার্জ';

  @override
  String get fibonacciMergeSubtitle =>
      'পরপর ফিবোনাচি সংখ্যাগুলো (১, ১, ২, ৩, ৫, ৮, ১৩...) একত্রিত করুন।';

  @override
  String get sequenceSleuthTitle => 'সিকোয়েন্স স্লিউথ';

  @override
  String get sequenceSleuthSubtitle =>
      'গাণিতিক অনুক্রমের অনুপস্থিত সংখ্যাটি খুঁজুন।';

  @override
  String get divisibilityDashTitle => 'ডিভিবিলিটি ড্যাশ';

  @override
  String get divisibilityDashSubtitle =>
      'প্রদত্ত সংখ্যার জন্য সমস্ত এক-অংকের বিভাজক (২-৯) ট্যাপ করুন।';

  @override
  String get percentagePeakTitle => 'পার্সেন্টেজ পিক';

  @override
  String get percentagePeakSubtitle => 'দ্রুত মানসিক শতাংশ গণনা সমাধান করুন।';

  @override
  String get vennNumbersTitle => 'ভেন নাম্বারস';

  @override
  String get vennNumbersSubtitle =>
      'সঠিক ভেন ডায়াগ্রাম অঞ্চলে সংখ্যাগুলো বিভাগ করুন।';

  @override
  String get commonDenominatorTitle => 'সাধারণ হর';

  @override
  String get commonDenominatorSubtitle =>
      'গরিষ্ঠ সাধারণ গুণনীয়ক বা লঘিষ্ঠ সাধারণ গুণিতক খুঁজুন।';

  @override
  String get angleFinderTitle => 'অ্যাঙ্গেল ফাইন্ডার';

  @override
  String get angleFinderSubtitle =>
      'জ্যামিতিক সমস্যার অনুপস্থিত কোণটি গণনা করুন।';

  @override
  String get sumSnakeTitle => 'সাম স্নেক';

  @override
  String get sumSnakeSubtitle =>
      'টার্গেট যোগফলে পৌঁছাতে সংলগ্ন সংখ্যাগুলো সংযুক্ত করুন।';

  @override
  String get baseShiftTitle => 'বেস শিফট ব্লিটজ';

  @override
  String get baseShiftSubtitle => 'দশমিকে সমাধান করুন';

  @override
  String get baseShiftDescription =>
      'সমীকরণটি সমাধান করুন এবং উত্তরটি দশমিকে (বেস ১০) টাইপ করুন।';

  @override
  String get baseShiftEquation => 'সমীকরণ';

  @override
  String get baseShiftHint => 'দশমিক ফলাফল লিখুন...';

  @override
  String get baseShiftCorrect => 'সঠিক!';

  @override
  String get baseShiftIncorrect => 'ভুল!';

  @override
  String get baseShiftSubmit => 'জমা দিন';

  @override
  String get baseShiftQuickGuide => 'দ্রুত গাইড:';

  @override
  String get baseShiftBinary => 'বাইনারি (bin): বেস ২ (০, ১)';

  @override
  String get baseShiftHex => 'হেক্সাডেসিমেল (0x): বেস ১৬ (০-৯, A-F)';

  @override
  String get baseShiftDecimal => 'দশমিক (dec): বেস ১০ (০-৯)';

  @override
  String get baseShiftWinTitle => 'গণিত জাদুকর!';

  @override
  String get baseShiftWinMessage =>
      'আপনি ৫টি বেস-শিফট সমীকরণ সঠিকভাবে সমাধান করেছেন!';

  @override
  String get blockCount3DTitle => 'ব্লক কাউন্ট থ্রিডি';

  @override
  String get blockCount3DSubtitle =>
      'ঘোরাতে ড্র্যাগ করুন • লুকানো ব্লক গণনা করুন';

  @override
  String get blockCount3DHowMany => 'কয়টি ব্লক?';

  @override
  String get blockCount3DSubmitGuess => 'অনুমান জমা দিন';

  @override
  String get blockCount3DNotQuite => 'একেবারে সঠিক নয়! আবার গণনা করতে ঘোরান।';

  @override
  String get blockCount3DExcellent => 'চমৎকার';

  @override
  String blockCount3DWinMessage(int count) {
    return 'আপনি সঠিকভাবে সমস্ত $countটি ব্লক শনাক্ত করেছেন!';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '১. ব্লকের স্তূপ ঘোরাতে থ্রিডি ভিউপোর্টের ওপর দিয়ে আপনার আঙুল ড্র্যাগ করুন।\n\n২. স্তূপের সমস্ত ব্লক গণনা করুন।\n\n৩. মনে রাখবেন: বাতাসে থাকা একটি ব্লকের নিচে অবশ্যই কাঠামোগত সাপোর্ট ব্লক থাকতে হবে (লুকানো ব্লক!)।\n\n৪. ইনপুট ফিল্ডে আপনার উত্তর টাইপ করুন এবং পরীক্ষা করতে \"অনুমান জমা দিন\" ট্যাপ করুন।';

  @override
  String get alphabetSudokuTitle => 'বর্ণমালা সুডোকু';

  @override
  String get alphabetSudokuSubtitle =>
      'গ্রিডটি এমনভাবে পূরণ করুন যাতে প্রতিটি সারি, কলাম এবং বক্সে A-I অক্ষর থাকে।';

  @override
  String get alphabetSudokuWinTitle => 'সুডোকু সমাধান!';

  @override
  String get alphabetSudokuWinMessage =>
      'দারুণ! আপনি অক্ষরগুলোতে দক্ষ হয়ে উঠেছেন।';

  @override
  String get classicMazeTitle => 'ক্লাসিক মেজ';

  @override
  String get classicMazeSubtitle =>
      'অন্বেষণ ও সমাধান • প্রতিটি গেমে একটি নতুন গোলকধাঁধা';

  @override
  String get classicMazeWinTitle => 'গোলকধাঁধা পরিষ্কার';

  @override
  String classicMazeWinMessage(int count) {
    return 'অবিশ্বাস্য নেভিগেশন! আপনি $countটি চালে গোলকধাঁধাটি সমাধান করেছেন।';
  }

  @override
  String get classicMazeMoves => 'চাল: ';

  @override
  String get classicMazeHowToPlayDescription =>
      '১. গ্লোয়িং হলুদ মার্বেলটি (প্লেয়ার) নিচের ডানের সবুজ পোর্টালে (প্রস্থান) নিয়ে যান।\n\n২. সরাতে গোলকধাঁধার ওপর যে কোনও জায়গায় সোয়াইপ, ফিজিক্যাল কিবোর্ড অ্যারো কী বা নিচের অ্যারো প্যাড বোতাম ব্যবহার করুন।\n\n৩. বেগুনি ট্রেইলটি আপনার অন্বেষণ করা পথ দেখায়। আপনার অন্বেষণ করা পথে ফিরে এসে এটি ডায়নামিকভাবে মুছে ফেলুন!\n\n৪. বড় গোলকধাঁধার সাথে নিজেকে চ্যালেঞ্জ করতে ওপরের অ্যাকশন বার থেকে অসুবিধা পরিবর্তন করুন!';

  @override
  String get conjunctionSearchTitle => 'কনজাংশন সার্চ';

  @override
  String get conjunctionSearchSubtitle => 'মনোযোগ এবং বৈশিষ্ট্য সংযোগ';

  @override
  String get conjunctionSearchWinTitle => 'বিজয়';

  @override
  String get conjunctionSearchWinMessage =>
      'আপনি নিখুঁত মনোযোগের সাথে সমস্ত লক্ষ্য খুঁজে পেয়েছেন!';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      'একটি নির্দিষ্ট টার্গেট আকৃতি এবং রঙের সংমিশ্রণ নির্দেশনায় দেখানো হবে। ঘন গ্রিডে এটি যত দ্রুত সম্ভব খুঁজে বের করুন এবং ট্যাপ করুন। বিভ্রান্তিকর আকৃতিগুলো হয় একই রঙ বা আকৃতি শেয়ার করে, তাই সাবধানে দেখুন!';

  @override
  String get conjunctionSearchRound => 'রাউন্ড: ';

  @override
  String get conjunctionSearchScore => 'স্কোর: ';

  @override
  String get conjunctionSearchFind => 'খুঁজুন: ';

  @override
  String get shapeCircle => 'বৃত্ত';

  @override
  String get shapeSquare => 'বর্গক্ষেত্র';

  @override
  String get shapeTriangle => 'ত্রিভুজ';

  @override
  String get shapeStar => 'তারা';

  @override
  String get shapeRectangle => 'আয়তক্ষেত্র';

  @override
  String get shapeEllipse => 'উপবৃত্ত';

  @override
  String get shapeTrapezoid => 'ট্র্যাপিজয়েড';

  @override
  String get colorRedLabel => 'লাল';

  @override
  String get colorBlueLabel => 'নীল';

  @override
  String get colorGreenLabel => 'সবুজ';

  @override
  String get colorAmberLabel => 'অ্যাম্বার';

  @override
  String get cubeNetFoldTitle => 'কিউব নেট ফোল্ড';

  @override
  String get cubeNetFoldSubtitle =>
      'মিলে যাওয়া থ্রিডি কিউব বিকল্পটি চয়ন করুন';

  @override
  String get cubeNetFoldWinTitle => 'সঠিক';

  @override
  String get cubeNetFoldWinMessage =>
      'আপনার নিখুঁত থ্রিডি স্পেশাল ফোল্ডিং লজিক আছে!';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '১. ওপরে উন্মোচিত টুডি নেটটি দেখুন।\n\n২. মানসিকভাবে নেটটিকে একটি থ্রিডি ঘনকে ভাঁজ করুন।\n\n৩. নিচের বিকল্পটি চয়ন করুন যা সেই ভাঁজ করা ঘনকের একটি বৈধ থ্রিডি ভিউ প্রতিনিধিত্ব করে।\n\n৪. সতর্ক থাকুন: নেটের বিপরীত তলগুলো থ্রিডিতে সংলগ্ন হতে পারে না এবং সংলগ্ন তলগুলোর ক্রম অবশ্যই মিলতে হবে!';

  @override
  String get cubeNetFoldUnfoldedNet => 'উন্মোচিত টুডি নেট';

  @override
  String get cubeNetFoldWhichMatches => 'কোন ঘনকটি মেলে?';

  @override
  String get cubeNetFoldIncorrect =>
      'ভুল ফোল্ড লজিক! রিসেট ট্যাপ করুন বা আপনার পছন্দ পরিবর্তন করুন।';

  @override
  String get cubeNetFoldSubmitChoice => 'পছন্দ জমা দিন';

  @override
  String get cubeNetFoldFailed => 'ব্যর্থ (রিসেট ট্যাপ করুন)';

  @override
  String get faceTraitAssociationMemorize => '৪ জনকেই মুখস্থ করুন';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return '$total জনের মধ্যে $current নম্বর ব্যক্তি';
  }

  @override
  String get faceTraitAssociationWhatOccupation => 'তাদের পেশা কী?';

  @override
  String get faceTraitAssociationWhatHobby => 'তাদের শখ কী?';

  @override
  String get faceTraitAssociationWinTitle => 'মেমরি মাস্টার!';

  @override
  String get faceTraitAssociationLoseTitle => 'গেম ওভার';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return 'আপনি $totalটির মধ্যে $correctটি সঠিক করেছেন।';
  }

  @override
  String get topologyTitle => 'টপোলজি';

  @override
  String get topologySubtitle =>
      'এই আকৃতিগুলো কি টপোলজিক্যালভাবে সমতুল্য? (কাটা বা আঠা লাগানো ছাড়াই একটিকে অন্যটিতে বিকৃত করা যায় কি?)';

  @override
  String get topologyWinTitle => 'জ্যামিতি প্রতিভা!';

  @override
  String get topologyWinMessage =>
      'আপনি সঠিকভাবে ১০টি টপোলজিক্যাল জোড়া শনাক্ত করেছেন!';

  @override
  String get topologyScore => 'স্কোর: ';

  @override
  String get semanticDistanceTitle => 'শব্দার্থিক দূরত্ব';

  @override
  String get semanticDistanceSubtitle =>
      'শব্দগুলোর মধ্যে ধারণাগত দূরত্ব পরিমাপ করুন';

  @override
  String get oxymoronHuntTitle => 'বৈপরীত্যের সন্ধান';

  @override
  String get oxymoronHuntSubtitle =>
      'গ্রিডে থাকা বিপরীতমুখী শব্দগুলোর জোড়া তৈরি করুন';

  @override
  String get portmanteauSplitTitle => 'মিশ্র শব্দ বিভাজন';

  @override
  String get portmanteauSplitSubtitle =>
      'একটি মিশ্র শব্দের উৎস শব্দগুলো শনাক্ত করুন';

  @override
  String get chainReactionTitle => 'শৃঙ্খল বিক্রিয়া';

  @override
  String get chainReactionSubtitle =>
      'অক্ষরের মিল ব্যবহার করে শব্দগুলো যুক্ত করুন';

  @override
  String get rhymeMasterTitle => 'ছন্দের জাদুকর';

  @override
  String get rhymeMasterSubtitle =>
      'লক্ষ্য শব্দের সাথে ছন্দ মেলে এমন শব্দগুলো শনাক্ত করুন';

  @override
  String get definitionDashTitle => 'সংজ্ঞার দৌড়';

  @override
  String get definitionDashSubtitle => 'সঠিক শব্দটিকে তার সংজ্ঞার সাথে মেলান';

  @override
  String get syllableStackTitle => 'অক্ষর স্তুপ';

  @override
  String get syllableStackSubtitle =>
      'পূর্ণ শব্দ গঠন করতে অক্ষরগুলো স্তূপ করুন';

  @override
  String get sentenceUnscrambleTitle => 'বাক্য বিন্যাস';

  @override
  String get sentenceUnscrambleSubtitle =>
      'একটি বৈধ বাক্য গঠন করতে শব্দগুলো সাজান';

  @override
  String get grammarSortTitle => 'ব্যাকরণ বিন্যাস';

  @override
  String get grammarSortSubtitle =>
      'শব্দগুলোকে তাদের পদ অনুযায়ী শ্রেণীবদ্ধ করুন';

  @override
  String get vowelReconstructTitle => 'স্বরবর্ণ পুনর্গঠন';

  @override
  String get vowelReconstructSubtitle =>
      'বাক্যে অনুপস্থিত স্বরবর্ণগুলো পূরণ করুন';

  @override
  String get consonantReconstructTitle => 'ব্যঞ্জনবর্ণ পুনর্গঠন';

  @override
  String get consonantReconstructSubtitle =>
      'বাক্যে অনুপস্থিত ব্যঞ্জনবর্ণগুলো পূরণ করুন';

  @override
  String get homophoneHuntTitle => 'সমোচ্চারিত শব্দের সন্ধান';

  @override
  String get silentLetterSearchTitle => 'উহ্য অক্ষর অনুসন্ধান';

  @override
  String get silentLetterSearchSubtitle =>
      'প্রদত্ত শব্দগুলোতে উহ্য অক্ষরগুলো শনাক্ত করুন';

  @override
  String get palindromeBuilderTitle => 'প্যালিনড্রোম নির্মাতা';

  @override
  String get palindromeBuilderSubtitle =>
      'ন্যূনতম অক্ষর যোগ করে একটি প্যালিনড্রোম তৈরি করুন';

  @override
  String get phoneticGuessTitle => 'ধ্বনিভিত্তিক অনুমান';

  @override
  String get phoneticGuessSubtitle =>
      'এর ধ্বনিগত বানান থেকে শব্দটি শনাক্ত করুন';

  @override
  String get spoonerismSolverTitle => 'স্পুনারিজম সমাধানকারী';

  @override
  String get spoonerismSolverSubtitle =>
      'বাক্যাংশটির জন্য সঠিক স্পুনারিজম শনাক্ত করুন';

  @override
  String get etymonOddballTitle => 'উৎসভিন্ন শব্দ';

  @override
  String get etymonOddballSubtitle =>
      'একই উৎস থেকে আসেনি এমন শব্দটি খুঁজে বের করুন';

  @override
  String get etymologyOriginTitle => 'শব্দতত্ত্বের উৎস';

  @override
  String get etymologyOriginSubtitle => 'বিদেশি শব্দটির উৎস ভাষা অনুমান করুন';

  @override
  String get affixFactoryTitle => 'উপসর্গ-অনুসর্গ কারখানা';

  @override
  String get affixFactorySubtitle =>
      'উপসর্গ এবং অনুসর্গ ব্যবহার করে বৈধ শব্দ তৈরি করুন';

  @override
  String get cognateCatchTitle => 'সহজাত শব্দ শনাক্তকরণ';

  @override
  String get cognateCatchSubtitle =>
      'প্রকৃত সহজাত শব্দ এবং বিভ্রান্তিকর শব্দগুলোর মধ্যে পার্থক্য করুন';

  @override
  String get compoundConnectTitle => 'যৌগিক সংযোগ';

  @override
  String get compoundConnectSubtitle =>
      'একটি যৌগিক শব্দ গঠন করতে দুটি শব্দকে যুক্ত করুন';

  @override
  String get pangramSprintTitle => 'প্যানগ্রাম স্প্রিন্ট';

  @override
  String get pangramSprintSubtitle =>
      'বর্ণমালার প্রতিটি অক্ষর ব্যবহার করে একটি বাক্য গঠন করুন';

  @override
  String get anagramDefinitionTitle => 'অ্যানাগ্রাম সংজ্ঞা';

  @override
  String get anagramDefinitionSubtitle =>
      'সংজ্ঞার ভিত্তিতে অ্যানাগ্রামটি সমাধান করুন';

  @override
  String get letterBridgeTitle => 'অক্ষর সেতু';

  @override
  String get letterBridgeSubtitle =>
      'দুটি শব্দকে যুক্ত করে এমন অনুপস্থিত অক্ষরটি খুঁজে বের করুন';

  @override
  String get letterFrequencyScanTitle => 'অক্ষরের পুনরাবৃত্তি স্ক্যান';

  @override
  String get letterFrequencyScanSubtitle =>
      'লেখায় একটি অক্ষর কতবার আছে তা গণনা করুন';

  @override
  String get oneLetterShiftTitle => 'এক-অক্ষর পরিবর্তন';

  @override
  String get oneLetterShiftSubtitle =>
      'একটি অক্ষর পরিবর্তন করে একটি শব্দকে অন্য শব্দে রূপান্তর করুন';

  @override
  String vocabularyBuilderMessage(String arg0) {
    return 'চমৎকার কাজ! আপনার শব্দভাণ্ডার সত্যিই চিত্তাকর্ষক। স্কোর: $arg0';
  }

  @override
  String get symmetryMessage =>
      'আপনি অত্যন্ত নিখুঁতভাবে প্যাটার্নটি মিরর করেছেন।';

  @override
  String get temporalOrderMessage =>
      'অবিশ্বাস্য! আপনার পর্যায়ক্রমিক স্মৃতিশক্তি খুব ভালো।';

  @override
  String get temporalOrderMessage1 =>
      'পর্যায়ক্রমিক স্মৃতি ভুল হয়েছে। অনুশীলনই সাফল্যের চাবিকাঠি!';

  @override
  String get wordSearchMessage =>
      'তীব্র পর্যবেক্ষণের মাধ্যমে সব শব্দ সফলভাবে পাওয়া গেছে।';

  @override
  String colorMatchMessage(String arg0) {
    return 'আপনার নির্ভুলতা: $arg0%';
  }

  @override
  String semanticLinkMessage(String arg0) {
    return 'আপনি $arg0 পয়েন্ট পেয়েছেন!';
  }

  @override
  String reflexTapMessage(String arg0) {
    return 'আপনি $arg0টি টার্গেটে ট্যাপ করেছেন!';
  }

  @override
  String get angleFinderMessage => 'আপনার জ্যামিতিক অন্তর্দৃষ্টি চমৎকার!';

  @override
  String angleFinderMessage1(String arg0) {
    return 'সঠিক উত্তর ছিল $arg0°';
  }

  @override
  String angleFinderText(String arg0) {
    return '$arg0°';
  }

  @override
  String visualStatisticalLearningMessage(String arg0) {
    return 'আপনি $arg0টি সঠিক প্যাটার্ন স্কোর করেছেন!';
  }

  @override
  String nonogramText(String arg0) {
    return 'ত্রুটি: $arg0';
  }

  @override
  String mentalCalendarMessage(String arg0) {
    return 'আপনি ১০টির মধ্যে $arg0টি সঠিক করেছেন!';
  }

  @override
  String orbitTapMessage(String arg0) {
    return 'আপনি সফলভাবে $arg0 বার ট্যাপ করেছেন!';
  }

  @override
  String schulteTableMessage(String arg0) {
    return 'আপনি $arg0 সময়ে টেবিলটি সম্পন্ন করেছেন। আপনার দৃষ্টিসীমা বৃদ্ধির জন্য অনুশীলন চালিয়ে যান!';
  }

  @override
  String get schulteTableText => 'টেস্ট শুরু করুন';

  @override
  String get relationalMemoryMessage =>
      'চমৎকার স্থানিক সম্পর্কীয় স্মৃতি নির্ভুলতা!';

  @override
  String sudokuText(String arg0) {
    return 'ত্রুটি: $arg0';
  }

  @override
  String sdmtMessage(String arg0) {
    return 'আপনি $arg0টি প্রতীক মিলিয়েছেন! এই টেস্টটি আপনার স্ক্যানিং গতি এবং চাক্ষুষ মনোযোগ পরিমাপ করে।';
  }

  @override
  String get futoshikiMessage =>
      'অবিশ্বাস্য! আপনি ফুতোশিকি ল্যাটিন স্কয়ার সমাধান করেছেন।';

  @override
  String letterFrequencyScanMessage(String arg0, String arg1) {
    return 'আপনি \"$arg1\" অক্ষরটির $arg0টি উপস্থিতি সঠিকভাবে গণনা করেছেন।';
  }

  @override
  String letterFrequencyScanText(String arg0) {
    return 'ভুল হয়েছে। গণনা ছিল $arg0।';
  }

  @override
  String get memoryMatrixMessage =>
      'চিত্তাকর্ষক! আপনার কাজের স্মৃতি খুব তীক্ষ্ণ। দৈনিক লক্ষ্য সম্পন্ন!';

  @override
  String get memoryMatrixMessage1 =>
      'আপনার স্মৃতির স্কোর উন্নত করতে মনোযোগ দিন এবং আবার চেষ্টা করুন।';

  @override
  String get contextCluesMessage =>
      'ব্যতিক্রমী! আপনার শব্দভাণ্ডার এবং প্রাসঙ্গিক বিশ্লেষণ শীর্ষ স্তরের।';

  @override
  String get contextCluesMessage1 =>
      'ভুল শব্দ নির্বাচন করা হয়েছে! আপনার মৌখিক প্রাসঙ্গিক যুক্তি উন্নত করুন এবং আবার চেষ্টা করুন।';

  @override
  String oneLetterShiftMessage(String arg0, String arg1) {
    return 'আপনি সফলভাবে $arg0 থেকে $arg1-এ পরিবর্তন করেছেন।';
  }

  @override
  String get mentalAbacusMessage => 'আপনার মানসিক পাটিগণিত শীর্ষ মানের।';

  @override
  String fractionMatcherMessage(String arg0) {
    return 'আপনি রিপ্রেজেন্টেশন মিলিয়ে $arg0 পয়েন্ট পেয়েছেন!';
  }

  @override
  String get spellingSprintMessage => 'আপনি ১০টি শব্দেরই বানান সঠিক করেছেন!';

  @override
  String spellingSprintMessage1(String arg0) {
    return 'আপনি $arg0টি শব্দের বানান সঠিক করেছেন।';
  }

  @override
  String stopSignalMessage(String arg0) {
    return 'আপনি $arg0টি সঠিক প্রতিক্রিয়া দিয়েছেন! এই টেস্টটি আপনার কোনো পরিকল্পিত কাজ থামানোর ক্ষমতা পরিমাপ করে।';
  }

  @override
  String grammarPoliceMessage(String arg0) {
    return 'খেলা শেষ! আপনি ব্যাকরণের জগতে শৃঙ্খলা বজায় রেখেছেন। স্কোর: $arg0';
  }

  @override
  String consonantReconstructMessage(String arg0) {
    return 'আপনি $arg0 স্কোর পুনর্গঠন করেছেন!';
  }

  @override
  String rhymeMasterMessage(String arg0, String arg1) {
    return 'আপনি $arg1টির মধ্যে $arg0টি ছন্দ খুঁজে পেয়েছেন!';
  }

  @override
  String vigilanceTaskMessage(String arg0, String arg1, String arg2) {
    return 'সঠিক: $arg0, ভুল: $arg1\nমিথ্যা সতর্কতা: $arg2';
  }

  @override
  String get silhouetteMatchOrthoMessage =>
      'আপনার নির্ভুল অর্থোগ্রাফিক অ্যালাইনমেন্ট দক্ষতা আছে!';

  @override
  String get silhouetteMatchOrthoText => 'বুঝেছি';

  @override
  String get silhouetteMatchOrthoText1 =>
      'ভুল দৃষ্টিভঙ্গি প্রক্ষেপণ! আবার চেষ্টা করতে রিসেটে ট্যাপ করুন।';

  @override
  String fibonacciMergeMessage(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String factorFinderMessage(String arg0) {
    return 'আপনি সব উৎপাদক খুঁজে $arg0 পয়েন্ট পেয়েছেন!';
  }

  @override
  String logicalSyllogismsMessage(String arg0) {
    return 'আপনি $arg0টি ন্যায়ানুমান সঠিকভাবে সমাধান করেছেন!';
  }

  @override
  String get rotatingMazeMessage =>
      'আপনি সফলভাবে ঘূর্ণায়মান গোলকধাঁধায় নেভিগেট করেছেন!';

  @override
  String get rotatingMazeText => 'বুঝেছি';

  @override
  String get rotatingMazeText1 => '🌀 গোলকধাঁধা ৯০° ঘুরেছে! গ্রিড সরে গেছে!';

  @override
  String get mathPathMessage =>
      'আপনি লক্ষ্য সংখ্যায় পৌঁছানোর পথটি খুঁজে পেয়েছেন!';

  @override
  String get bridgesMessage => 'আপনি সফলভাবে সব দ্বীপ যুক্ত করেছেন!';

  @override
  String compoundConnectMessage(String arg0, String arg1) {
    return 'যৌগিক শব্দটি হলো $arg0$arg1।';
  }

  @override
  String get pangramSprintMessage =>
      'আপনি ২৬টি অক্ষরই ব্যবহার করে একটি বাক্য গঠন করেছেন।';

  @override
  String get mirrorImageMessage => 'আপনি নিখুঁতভাবে প্রতিফলনটি শনাক্ত করেছেন।';

  @override
  String get mirrorImageText => 'মিরর ইমেজ';

  @override
  String reverseStroopMessage(String arg0) {
    return 'আপনি $arg0 পয়েন্ট পেয়েছেন! নির্দেশনার দিকে নজর রাখুন।';
  }

  @override
  String get verbalAnalogiesMessage =>
      'সম্পর্ক বোঝার ক্ষেত্রে আপনার তীক্ষ্ণ বুদ্ধি আছে।';

  @override
  String corsiBlocksMessage1(String arg0, String arg1) {
    return 'আপনি $arg1টি ক্রম মনে রেখেছেন! আপনার স্থানিক স্মৃতির সীমা $arg0 এ পৌঁছেছে।';
  }

  @override
  String wordLadderMessage(String arg0, String arg1, String arg2) {
    return 'আপনি সফলভাবে $arg2 ধাপে $arg0-কে $arg1-এর সাথে যুক্ত করেছেন।';
  }

  @override
  String d2AttentionMessage(String arg0) {
    return 'অবিশ্বাস্য নির্বাচনী স্ক্যানিং! চূড়ান্ত স্কোর: $arg0।';
  }

  @override
  String get d2AttentionText => 'কীভাবে খেলবেন';

  @override
  String get d2AttentionText1 => 'বুঝেছি';

  @override
  String get tangleFixMessage => 'সব রেখা পরিষ্কার এবং মসৃণ।';

  @override
  String get distractorMatrixMessage =>
      'অবিশ্বাস্য! গাণিতিক বিভ্রান্তি থাকা সত্ত্বেও আপনি প্যাটার্নগুলো মনে রেখেছেন!';

  @override
  String get distractorMatrixMessage1 =>
      'বিভ্রান্তিগুলো আপনাকে হারিয়ে দিয়েছে! আপনার স্মৃতিশক্তি আবার ঝালিয়ে নিন।';

  @override
  String sentenceUnscrambleMessage(String arg0) {
    return 'আপনি $arg0 স্কোরের একটি বাক্য বিন্যাস করেছেন!';
  }

  @override
  String get kakuroMessage => 'অবিশ্বাস্য! আপনি সব যোগফল সঠিকভাবে মিলিয়েছেন।';

  @override
  String symbolicFlankerMessage(String arg0, String arg1) {
    return 'আপনি $arg1টির মধ্যে $arg0টি সঠিক করেছেন!';
  }

  @override
  String stroopTestMessage(String arg0) {
    return 'আপনি $arg0টি সঠিক স্কোর করেছেন! শব্দের দিকে নয়, কালির রঙের দিকে মনোযোগ দিন।';
  }

  @override
  String wisconsinCardSortingMessage(String arg0) {
    return 'আপনি সঠিকভাবে $arg0টি কার্ড শ্রেণীবদ্ধ করেছেন!';
  }

  @override
  String nBackMessage(String arg0) {
    return 'আপনি $arg0টি ২-ব্যাক মিল পেয়েছেন! মাল্টিটাস্কিংয়ের জন্য আপনার কাজের স্মৃতি গুরুত্বপূর্ণ।';
  }

  @override
  String rhythmMasterMessage(String arg0, String arg1) {
    return 'আপনি $arg0টি নিখুঁত হিট এবং $arg1 পয়েন্ট পেয়েছেন!';
  }

  @override
  String groceryListMessage(String arg0, Object score) {
    return 'আপনি মুদির তালিকায় $arg0 পয়েন্ট পেয়েছেন!';
  }

  @override
  String get groceryListText => 'আমি';

  @override
  String get mirrorTracingMessage =>
      'আপনার মস্তিষ্ক সফলভাবে তার সমন্বয় ক্ষমতা পুনর্গঠন করেছে।';

  @override
  String moduloClockMessage(String arg0) {
    return 'চমৎকার মডুলার মানসিক গণিত সমন্বয়! স্কোর: $arg0';
  }

  @override
  String moduloClockMessage1(String arg0, String arg1, String arg2) {
    return 'আপনি $arg1টির মধ্যে $arg0টি মডুলার ক্লক সমাধান করেছেন। স্কোর: $arg2';
  }

  @override
  String get crownMessage =>
      'সব মুকুট সঠিক যুক্তির সাথে সফলভাবে স্থাপন করা হয়েছে।';

  @override
  String dualCodingMessage(String arg0) {
    return 'চমৎকার ডুয়াল-টাস্ক পারফরম্যান্স! আপনার কাজের স্মৃতির স্কোর: $arg0';
  }

  @override
  String inequalityDashMessage(String arg0) {
    return 'আপনি অসমতা মিলিয়ে $arg0 পয়েন্ট পেয়েছেন!';
  }

  @override
  String sourceMonitoringMessage(String arg0, String arg1) {
    return 'আপনি $arg1টির মধ্যে $arg0 স্কোর করেছেন!';
  }

  @override
  String get sourceMonitoringText => 'স্মরণ শুরু করুন';

  @override
  String get memoryPalaceText => 'উপলব্ধ শব্দ';

  @override
  String target10Message(String arg0) {
    return 'আপনি ১০-এর সাথে সংখ্যা মিলিয়ে $arg0 পয়েন্ট পেয়েছেন!';
  }

  @override
  String get paperFoldingMessage =>
      'আপনি আপনার মনে প্যাটার্নগুলো দেখতে পাচ্ছেন।';

  @override
  String topologyText(String arg0, String arg1) {
    return '$arg0$arg1 / ১০';
  }

  @override
  String get waterSortMessage => 'আপনি সব রং নিখুঁতভাবে সাজিয়েছেন!';

  @override
  String anagramDefinitionMessage(String arg0) {
    return 'শব্দটি সত্যিই ছিল \"$arg0\"।';
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
    return 'আপনি $arg0টি সঠিক অনুমান করেছেন।';
  }

  @override
  String grammarSortMessage(String arg0) {
    return 'আপনি $arg0টি শব্দ সঠিকভাবে সাজিয়েছেন!';
  }

  @override
  String vowelReconstructMessage(String arg0) {
    return 'আপনি $arg0 স্কোর পুনর্গঠন করেছেন!';
  }

  @override
  String spatialConflictMessage(String arg0, String arg1) {
    return 'আপনি $arg1টি ত্রুটি সহ $arg0 স্কোর করেছেন!';
  }

  @override
  String get spatialConflictText => 'কীভাবে খেলবেন';

  @override
  String get spatialConflictText1 => 'বুঝেছি';

  @override
  String tracePathMessage(String arg0) {
    return 'আপনার নির্ভুলতা ছিল $arg0%!';
  }

  @override
  String ruleSwitcherMessage(String arg0, String arg1) {
    return 'আপনি $arg1টির মধ্যে $arg0টি সঠিক স্কোর করেছেন!';
  }

  @override
  String collatzMessage(String arg0, String arg1) {
    return 'আপনি $arg0টি ধাপ নিয়েছেন। সর্বনিম্ন সম্ভব ছিল $arg1।';
  }

  @override
  String get collatzText => '/ ২';

  @override
  String get collatzText1 => '+ ১';

  @override
  String get collatzText2 => '3n + 1';

  @override
  String divisibilityDashMessage(String arg0) {
    return 'আপনি $arg0টি সংখ্যা সমাধান করেছেন!';
  }

  @override
  String switchTaskMessage(String arg0) {
    return 'আপনি $arg0টি সঠিক স্কোর করেছেন! মানসিক নমনীয়তার জন্য দ্রুত সুইচ করা জরুরি।';
  }

  @override
  String sequenceSleuthMessage(String arg0) {
    return 'আপনি $arg0টি ক্রম সমাধান করেছেন!';
  }

  @override
  String changeBlindnessMessage(String arg0) {
    return 'আপনি $arg0টি পরিবর্তন খুঁজে পেয়েছেন!';
  }

  @override
  String mentalRotationMessage(String arg0) {
    return 'আপনি $arg0টি আকার সঠিকভাবে ঘুরিয়েছেন!';
  }

  @override
  String wordMastermindMessage(String arg0) {
    return 'আপনি কোডটি আয়ত্ত করেছেন!\nশব্দটি ছিল: $arg0';
  }

  @override
  String wordMastermindMessage1(String arg0) {
    return 'লুকানো শব্দটি ছিল: $arg0';
  }

  @override
  String wordMastermindText(String arg0) {
    return '$arg0';
  }

  @override
  String get simonSequenceMessage => 'আপনি সব ১০টি টাইল মনে রেখেছেন!';

  @override
  String get simonSequenceMessage1 =>
      'ক্রমে দক্ষতা অর্জনের জন্য আবার চেষ্টা করুন।';

  @override
  String oxymoronHuntMessage(String arg0) {
    return 'আপনি $arg0টি বৈপরীত্য খুঁজে পেয়েছেন!';
  }

  @override
  String spotlightTrackMessage(String arg0) {
    return 'অবিশ্বাস্য স্থানিক ট্র্যাকিং! আপনি $arg0 পয়েন্ট পেয়েছেন।';
  }

  @override
  String get spotlightTrackText => 'কীভাবে খেলবেন';

  @override
  String get spotlightTrackText1 => 'বুঝেছি';

  @override
  String get spotlightTrackText2 => 'রাউন্ড শুরু করুন';

  @override
  String vennNumbersMessage(String arg0) {
    return 'আপনি $arg0টি সংখ্যা শ্রেণীবদ্ধ করেছেন!';
  }

  @override
  String get vennNumbersText => 'কোনোটিই নয়';

  @override
  String get vennNumbersText1 => 'উভয়ই';

  @override
  String get silhouetteMatchMessage =>
      'আপনার মস্তিষ্ক ৩ডি থেকে ২ডি অনুবাদে চমৎকার।';

  @override
  String sumSnakeMessage(String arg0) {
    return 'টার্গেট $arg0 নিখুঁতভাবে অর্জিত হয়েছে!';
  }

  @override
  String get sumSnakeText => 'পথ পরিষ্কার করুন';

  @override
  String percentagePeakMessage(String arg0) {
    return 'আপনি $arg0টি শতাংশের সমস্যা সমাধান করেছেন!';
  }

  @override
  String trailMakingMessage(String arg0) {
    return 'আপনি $arg0টি ট্রেইল সম্পন্ন করেছেন! এই টেস্টটি আপনার চাক্ষুষ অনুসন্ধানের গতি এবং মানসিক নমনীয়তা পরিমাপ করে।';
  }

  @override
  String matrixReasoningMessage(String arg0) {
    return 'আপনি $arg0টি ম্যাট্রিক্স সঠিকভাবে সম্পন্ন করেছেন!';
  }

  @override
  String get tentsAndTreesMessage => 'আপনি সফলভাবে সব তাবু স্থাপন করেছেন।';

  @override
  String klotskiMessage(String arg0) {
    return 'অসাধারণ স্লাইডিং! আপনি $arg0 চালের মধ্যে হিরো ব্লকটি মুক্ত করেছেন।';
  }

  @override
  String sumPyramidMessage(String arg0) {
    return 'আপনি সফলভাবে $arg0টি যোগফল পিরামিড সমাধান করেছেন!';
  }

  @override
  String simonCommandMessage(String arg0) {
    return 'চমৎকার নির্বাচনী প্রতিক্রিয়া এবং মনোযোগ! মোট স্কোর: $arg0';
  }

  @override
  String simonCommandMessage1(String arg0, String arg1) {
    return 'আপনি $arg0 স্কোর করেছেন কিন্তু নির্দিষ্ট সময়ে $arg1টি মিল করতে পারেননি।';
  }

  @override
  String syllableStackMessage(String arg0) {
    return 'আপনি $arg0 স্কোরের অক্ষর স্তূপ করেছেন!';
  }

  @override
  String get slitherlinkMessage =>
      'দারুণ! আপনি সফলভাবে লুপ পহেলা সম্পন্ন করেছেন।';

  @override
  String quickMathMessage(String arg0) {
    return 'আপনি $arg0টি সমস্যা সমাধান করেছেন!';
  }

  @override
  String commonDenominatorMessage(String arg0) {
    return 'আপনি $arg0টি গসাগু/লসাগু সমস্যা সমাধান করেছেন!';
  }

  @override
  String chainReactionMessage(String arg0, String arg1) {
    return 'আপনার চূড়ান্ত স্কোর $arg0। আপনি $arg1টি শব্দের একটি শৃঙ্খল তৈরি করেছেন।';
  }

  @override
  String chainReactionText(String arg0) {
    return '$arg0';
  }

  @override
  String get associativePairsMessage =>
      'চমৎকার! আপনি চাক্ষুষ বৈশিষ্ট্যগুলো নিখুঁতভাবে যুক্ত করেছেন।';

  @override
  String get associativePairsMessage1 =>
      'ভুল সংযোগ! আপনার স্মৃতিশক্তি ঝালিয়ে নিন এবং আবার চেষ্টা করুন।';

  @override
  String portmanteauSplitMessage(String arg0) {
    return 'আপনি $arg0টি মিশ্র শব্দ বিভাজন করেছেন!';
  }

  @override
  String get magicSquaresText => 'পরিষ্কার করুন';

  @override
  String alphabetSudokuText(String arg0) {
    return 'ত্রুটি: $arg0';
  }

  @override
  String get pipesMessage =>
      'আপনি সব পাইপ যুক্ত করেছেন এবং গ্রিড পূর্ণ করেছেন।';

  @override
  String get dualMirrorMessage =>
      'আপনি উভয় আইকনকে তাদের লক্ষ্যে পৌঁছে দিয়েছেন!';

  @override
  String binaryCodeMessage(String arg0) {
    return 'অসাধারণ দ্রুত ডেসিমেল রূপান্তর! চূড়ান্ত স্কোর: $arg0';
  }

  @override
  String binaryCodeMessage1(String arg0, String arg1) {
    return 'আপনি সঠিকভাবে $arg0টি বাইনারি সংখ্যা রূপান্তর করেছেন। স্কোর: $arg1';
  }

  @override
  String oddOneOutMessage(String arg0) {
    return 'আপনি ৫০টি ভিন্ন শব্দ খুঁজে পেয়েছেন! চূড়ান্ত স্কোর: $arg0';
  }

  @override
  String oddOneOutMessage1(String arg0) {
    return 'আপনার স্কোর: $arg0';
  }

  @override
  String letterBridgeMessage(String arg0) {
    return 'আপনি সেতু অক্ষরটি খুঁজে পেয়েছেন: $arg0';
  }

  @override
  String get imReady => 'আমি প্রস্তুত';

  @override
  String get soptTitle => 'স্ব-অর্ডারড পয়েন্টিং';

  @override
  String get soptSubtitle => 'প্রতিবার আলাদা কার্ডে ট্যাপ করুন। পদ পরিবর্তন!';

  @override
  String get soptWinTitle => 'সিকোয়েন্স মাস্টার!';

  @override
  String soptGameOverMessage(int score) {
    return 'আপনি সফলভাবে এলোমেলো কার্ড ট্র্যাক করে $score পয়েন্ট স্কোর করেছেন!';
  }

  @override
  String get soptChooseNovel => 'একটি নতুন কার্ড আলতো চাপুন';

  @override
  String get soptGreatJob => 'দারুণ কাজ!';

  @override
  String get soptAlreadyTapped => 'ইতিমধ্যে ট্যাপ!';

  @override
  String get soptGrid => 'গ্রিড';

  @override
  String get contRecogTitle => 'ক্রমাগত স্বীকৃতি';

  @override
  String get contRecogSubtitle => 'আপনি কি এই সেশনে আগে এই কার্ড দেখেছেন?';

  @override
  String get contRecogWinTitle => 'স্বীকৃতি জিনিয়াস!';

  @override
  String contRecogGameOverMessage(int score) {
    return 'আপনি $score সঠিক স্বীকৃতি স্কোর করেছেন!';
  }

  @override
  String get contRecogCorrect => 'সঠিক!';

  @override
  String get contRecogWrong => 'ভুল!';

  @override
  String get contRecogOldOrNew => 'এটা কি পুরাতন নাকি নতুন?';

  @override
  String get contRecogNew => 'নতুন';

  @override
  String get contRecogOld => 'পুরাতন';

  @override
  String get contRecogSeenPool => 'পুল দেখা গেছে';

  @override
  String get dnmsTitle => 'নন-ম্যাচিং মেমরি';

  @override
  String get dnmsSubtitle => 'যে কার্ডটি মুখস্থ নমুনায় ছিল না তা আলতো চাপুন।';

  @override
  String get dnmsWinTitle => 'অ-ম্যাচিং বিশেষজ্ঞ!';

  @override
  String dnmsGameOverMessage(int score) {
    return 'আপনি বিলম্বিত নন-ম্যাচিং-এ $score সঠিক উত্তর স্কোর করেছেন!';
  }

  @override
  String get dnmsChooseNovel => 'নতুন কার্ডে ট্যাপ করুন';

  @override
  String get dnmsMemorizeSample => 'এই কার্ড মুখস্থ';

  @override
  String get dnmsWaitForIt => 'এর জন্য অপেক্ষা করুন...';

  @override
  String get dnmsExcellent => 'চমৎকার!';

  @override
  String get dnmsSampleTapped => 'যে নমুনা ছিল!';

  @override
  String get dnmsCards => 'কার্ড';

  @override
  String get symSpanTitle => 'প্রতিসাম্য স্প্যান';

  @override
  String get symSpanSubtitle =>
      'উল্লম্ব প্রতিসাম্য সনাক্ত করার সময় কোষের নিদর্শনগুলি স্মরণ করুন।';

  @override
  String get symSpanWinTitle => 'সিমেট্রি মাস্টার!';

  @override
  String symSpanGameOverMessage(int score) {
    return 'আপনি লেআউটগুলি স্মরণ করে এবং প্রতিসাম্য সনাক্ত করে $score পয়েন্ট অর্জন করেছেন!';
  }

  @override
  String get symSpanMemorizeRed => 'লাল কোষের অবস্থান মনে রাখুন';

  @override
  String get symSpanIsSymmetric => 'প্যাটার্ন কি প্রতিসম?';

  @override
  String get symSpanRecallSequence => 'সঠিক ক্রমে অনুক্রম স্মরণ করুন';

  @override
  String get symSpanGreatJob => 'দারুণ কাজ!';

  @override
  String get symSpanTryAgain => 'আবার চেষ্টা করুন!';

  @override
  String get symSpanLength => 'দৈর্ঘ্য';

  @override
  String get readingSpanTitle => 'রিডিং স্প্যান';

  @override
  String get readingSpanSubtitle =>
      'বর্ণের ক্রম মনে রাখার সময় বাক্য যাচাই করুন।';

  @override
  String get readingSpanWinTitle => 'রিডিং এক্সপার্ট!';

  @override
  String readingSpanGameOverMessage(int score) {
    return 'রিডিং স্প্যান মেমরি চ্যালেঞ্জে আপনি $score পয়েন্ট স্কোর করেছেন!';
  }

  @override
  String get readingSpanTrueFalse => 'এই বিবৃতি সত্য না মিথ্যা?';

  @override
  String get readingSpanMemorizeLetter => 'এই চিঠি মুখস্থ';

  @override
  String get readingSpanRecallLetters => 'ক্রমানুসারে চিঠিগুলি স্মরণ করুন';

  @override
  String get readingSpanGreatJob => 'দারুণ কাজ!';

  @override
  String get readingSpanTryAgain => 'আবার চেষ্টা করুন!';

  @override
  String readingSpanYourSequence(String sequence) {
    return 'আপনার ক্রম: $sequence';
  }

  @override
  String get readingSpanLength => 'দৈর্ঘ্য';

  @override
  String get readingSpanSentence1 => 'সূর্য পূর্ব দিকে উদিত হয়।';

  @override
  String get readingSpanSentence2 => 'বরফ গরম হয়ে ফুটছে।';

  @override
  String get readingSpanSentence3 => 'মাছ পানির নিচে শ্বাস নিতে পারে।';

  @override
  String get readingSpanSentence4 => 'কুকুরের ডানা আছে এবং উড়তে পারে।';

  @override
  String get readingSpanSentence5 => '0 ডিগ্রি সেলসিয়াসে জল জমে যায়।';

  @override
  String get readingSpanSentence6 => 'বিড়াল ছোট কুকুরের মত ঘেউ ঘেউ করে।';

  @override
  String get readingSpanSentence7 => 'গ্রীষ্মকালে গাছে সবুজ পাতা থাকে।';

  @override
  String get readingSpanSentence8 => 'মাটি থেকে ওপরের দিকে বৃষ্টি পড়ছে।';

  @override
  String get readingSpanSentence9 => 'একটি ত্রিভুজের চারটি সমান বাহু রয়েছে।';

  @override
  String get readingSpanSentence10 => 'আপেল এক ধরনের মিষ্টি ফল।';

  @override
  String get readingSpanSentence11 => 'চাঁদ চেডার পনির দিয়ে তৈরি।';

  @override
  String get readingSpanSentence12 => 'অটোমোবাইল রোল করার জন্য চাকা আছে.';

  @override
  String get readingSpanSentence13 => 'আগুন জমে ঠাণ্ডা।';

  @override
  String get readingSpanSentence14 =>
      'কাগজ প্রক্রিয়াজাত কাঠ থেকে তৈরি করা হয়।';

  @override
  String get readingSpanSentence15 =>
      'পাখিদের উড়তে সাহায্য করার জন্য পালক থাকে।';

  @override
  String get readingSpanSentence16 => 'পাইন গাছে কলা জন্মে।';

  @override
  String get readingSpanSentence17 => 'একটি হাতি একটি পিঁপড়ার চেয়ে ছোট।';

  @override
  String get readingSpanSentence18 => 'বইগুলোতে লেখার ছাপা পাতা থাকে।';

  @override
  String get countingSpanTitle => 'স্প্যান গণনা';

  @override
  String get countingSpanSubtitle =>
      'শুধুমাত্র নীল বৃত্ত গণনা. তারপর গণনার ক্রম স্মরণ করুন।';

  @override
  String get countingSpanWinTitle => 'কাউন্টিং জিনিয়াস!';

  @override
  String countingSpanGameOverMessage(int score) {
    return 'আপনি কাউন্টিং স্প্যান মেমরি চ্যালেঞ্জে $score পয়েন্ট স্কোর করেছেন!';
  }

  @override
  String get countingSpanCountCircles => 'শুধুমাত্র নীল বৃত্ত গণনা';

  @override
  String get countingSpanRecallCounts => 'সঠিক ক্রমে গণনা প্রত্যাহার করুন';

  @override
  String get countingSpanGreatJob => 'দারুণ কাজ!';

  @override
  String get countingSpanTryAgain => 'আবার চেষ্টা করুন!';

  @override
  String countingSpanYourSequence(String sequence) {
    return 'আপনার ক্রম: $sequence';
  }

  @override
  String get countingSpanLength => 'দৈর্ঘ্য';

  @override
  String get objDispTitle => 'বস্তুর স্থানচ্যুতি';

  @override
  String get objDispSubtitle =>
      'লেআউট মনে রাখুন। অবস্থান পরিবর্তন করে এমন একটি বস্তু খুঁজুন এবং আলতো চাপুন।';

  @override
  String get objDispWinTitle => 'স্থানিক প্রতিভা!';

  @override
  String objDispGameOverMessage(int score) {
    return 'আপনি সঠিকভাবে $score স্থানচ্যুত বস্তু সনাক্ত করেছেন!';
  }

  @override
  String get objDispMemorizeAll => 'সব স্থাপনা মুখস্থ';

  @override
  String get objDispWaitingShift => 'লেআউট শিফটের জন্য অপেক্ষা করা হচ্ছে...';

  @override
  String get objDispTapMoved => 'সরানো বস্তুটি আলতো চাপুন';

  @override
  String get objDispExcellent => 'চমৎকার!';

  @override
  String get objDispWrongObject => 'ভুল বস্তু!';

  @override
  String get objDispItems => 'আইটেম';

  @override
  String get mandalaTitle => 'Mandala রিকল';

  @override
  String get mandalaSubtitle =>
      'রঙ কনফিগারেশন মুখস্থ. রং বাছাই এবং টাইলস পুনরায় রং.';

  @override
  String get mandalaWinTitle => 'মন্ডলা শিল্পী!';

  @override
  String mandalaGameOverMessage(int score) {
    return 'আপনি রঙিন জ্যামিতিক বিন্যাস পুনরায় তৈরি করে $score পয়েন্ট অর্জন করেছেন!';
  }

  @override
  String get mandalaMemorizeColors => 'টাইল রং মনে রাখুন';

  @override
  String get mandalaPaintCells => 'আসল মেলে ঘর পেইন্ট করুন';

  @override
  String get mandalaExcellent => 'চমৎকার!';

  @override
  String get mandalaIncorrectMatch => 'ভুল মিল!';

  @override
  String get mandalaSubmitRepaint => 'পুনরায় রং জমা দিন';

  @override
  String get mandalaTiles => 'টাইলস';

  @override
  String get runningSpanTitle => 'চলমান স্প্যান';

  @override
  String get runningSpanSubtitle =>
      'চিঠিগুলো দেখুন। যখন তারা থামবে, শেষ এন অক্ষরগুলি ক্রমানুসারে ইনপুট করুন।';

  @override
  String get runningSpanWinTitle => 'বাফার মাস্টার!';

  @override
  String runningSpanGameOverMessage(int score) {
    return 'আপনি রানিং মেমরি স্প্যানে $score পয়েন্ট স্কোর করেছেন!';
  }

  @override
  String runningSpanPrepareRecall(int count) {
    return 'শেষ $count অক্ষর স্মরণ করার জন্য প্রস্তুত হন';
  }

  @override
  String get runningSpanWatchCarefully => 'সাবধানে দেখুন...';

  @override
  String runningSpanEnterLast(int count) {
    return 'শেষ $count অক্ষর লিখুন';
  }

  @override
  String get runningSpanGreatJob => 'দারুণ কাজ!';

  @override
  String get runningSpanIncorrectBuffer => 'ভুল বাফার!';

  @override
  String runningSpanRecallLast(int count) {
    return 'শেষ $count স্মরণ করুন';
  }

  @override
  String get runningSpanStopsRandomly => 'স্রোত এলোমেলোভাবে থেমে যায়!';

  @override
  String runningSpanEntered(String sequence) {
    return 'প্রবেশ করান: $sequence';
  }

  @override
  String get runningSpanNItems => 'এন-আইটেম';

  @override
  String get spatialCabinetTitle => 'স্থানিক ক্যাবিনেট';

  @override
  String get spatialCabinetSubtitle =>
      'ক্যাবিনেটের ড্রয়ারে কোন বস্তুটি রয়েছে তা মুখস্থ করুন।';

  @override
  String get spatialCabinetWinTitle => 'কেবিনেট এক্সপার্ট!';

  @override
  String spatialCabinetGameOverMessage(int score) {
    return 'আপনি স্থানিক ক্যাবিনেট মেমরিতে $score পয়েন্ট স্কোর করেছেন!';
  }

  @override
  String get spatialCabinetMemorize => 'আইটেম অবস্থানগুলি মনে রাখবেন';

  @override
  String spatialCabinetWhereIs(String itemName) {
    return '$itemName টি কোথায়?';
  }

  @override
  String get spatialCabinetCorrect => 'সঠিক!';

  @override
  String get spatialCabinetWrongDrawer => 'ভুল ড্রয়ার!';

  @override
  String get spatialCabinetItems => 'আইটেম';

  @override
  String get cabinetItemKey => 'চাবি';

  @override
  String get cabinetItemApple => 'আপেল';

  @override
  String get cabinetItemDiamond => 'হীরা';

  @override
  String get cabinetItemBook => 'বই';

  @override
  String get cabinetItemUmbrella => 'ছাতা';

  @override
  String get cabinetItemCoffee => 'কফি';

  @override
  String get cabinetItemLock => 'তালা';

  @override
  String get cabinetItemPet => 'পোষা প্রাণী';

  @override
  String get cabinetItemCar => 'গাড়ি';

  @override
  String get gamesTitleLabel => 'গেমস';

  @override
  String get yourFavorites => 'আপনার প্রিয়';

  @override
  String get readyForWorkout => 'আপনার দৈনন্দিন ওয়ার্কআউটের জন্য প্রস্তুত?';

  @override
  String get greatStartKeepGoing => 'দারুণ শুরু! চালিয়ে যান।';

  @override
  String get onFireToday => 'আপনি আজ ফর্মে আছেন!';

  @override
  String get incredibleSolvingToday => 'আজ অবিশ্বাস্য সমাধান!';

  @override
  String get newGameLabel => 'নতুন';

  @override
  String get slitherlinkTitle => 'স্লিদারলিঙ্ক';

  @override
  String get slitherlinkSubtitle =>
      'সংখ্যার ক্লু ব্যবহার করে পিন গ্রিড লুপ করুন।';

  @override
  String get futoshikiTitle => 'ফুটোশিকি';

  @override
  String get futoshikiSubtitle => 'গ্রেটার-দ্যান ক্লু দিয়ে গ্রিড পূরণ করুন।';

  @override
  String get kakuroTitle => 'কাকুরু';

  @override
  String get kakuroSubtitle =>
      'সংখ্যা এবং যোগফল দিয়ে ক্রসওয়ার্ড সমাধান করুন।';

  @override
  String get inequalityDashTitle => 'অসমতা ড্যাশ';

  @override
  String get inequalityDashSubtitle => 'সময়ের চাপে অসমতা সমাধান করুন।';

  @override
  String get factorFinderTitle => 'ফ্যাক্টর ফাইন্ডার';

  @override
  String get factorFinderSubtitle =>
      'টার্গেট সংখ্যার সমস্ত ফ্যাক্টর চিহ্নিত করুন।';

  @override
  String get collatzTitle => 'কোলাটজ পথ';

  @override
  String get collatzSubtitle => '৩এন+১ সিকোয়েন্স নেভিগেট করুন।';

  @override
  String get sumPyramidTitle => 'যোগফল পিরামিড';

  @override
  String get sumPyramidSubtitle =>
      'যোগফল গণিত ক্লু দিয়ে পিরামিড সেল পূরণ করুন।';

  @override
  String get target10Title => 'টার্গেট ১০';

  @override
  String get target10Subtitle => 'দশটি যোগফল পেতে সংখ্যার টাইলস একত্রিত করুন।';

  @override
  String get fractionMatcherTitle => 'ভগ্নাংশ ম্যাচার';

  @override
  String get fractionMatcherSubtitle => 'দৃশ্যত সমতুল্য ভগ্নাংশ মিলান।';

  @override
  String get dualCodingTitle => 'দ্বৈত কোডিং';

  @override
  String get dualCodingSubtitle => 'একই সাথে অক্ষর এবং চিহ্ন মিলান।';

  @override
  String get distractorMatrixTitle => 'ডিস্ট্রাক্টর ম্যাট্রিক্স';

  @override
  String get distractorMatrixSubtitle =>
      'বিক্ষোভকারীর মধ্যে টার্গেট আকার খুঁজুন।';

  @override
  String get temporalOrderTitle => 'কালানুক্রমিক বিন্যাস';

  @override
  String get temporalOrderSubtitle => 'কালানুক্রমিক ক্রম মনে করুন।';

  @override
  String get associativePairsTitle => 'সহযোগী জোড়া';

  @override
  String get associativePairsSubtitle => 'সংশ্লিষ্ট চিহ্নগুলি জোড়া এবং মিলান।';

  @override
  String get blockCount3dTitle => '৩ডি ব্লক গণনা';

  @override
  String get blockCount3dSubtitle => 'ত্রিমাত্রিক স্থানে ব্লক গণনা করুন।';

  @override
  String get rotatingMazeTitle => 'ঘূর্ণায়মান গোলকধাঁধা';

  @override
  String get rotatingMazeSubtitle =>
      'বলগুলিকে প্রস্থান পথে নিয়ে যেতে গোলকধাঁধা ঘোরান।';

  @override
  String get silhouetteMatchOrthoTitle => 'সিলুয়েট ম্যাচ (অর্থো)';

  @override
  String get silhouetteMatchOrthoSubtitle =>
      'অর্থো ছায়ার সাথে ৩ডি অবজেক্ট মিলান।';

  @override
  String get spatialConflictTitle => 'স্থানিক দ্বন্দ্ব';

  @override
  String get spatialConflictSubtitle =>
      'টেক্সট এবং দিকনির্দেশক অসঙ্গতি সমাধান করুন।';

  @override
  String get spotlightTrackTitle => 'স্পটলাইট ট্র্যাক';

  @override
  String get spotlightTrackSubtitle =>
      'চলন্ত ছায়ায় জ্বলজ্বল করা আইটেমগুলি ট্র্যাক করুন।';

  @override
  String get d2AttentionTitle => 'd2 মনোযোগ';

  @override
  String get d2AttentionSubtitle =>
      'কঠোর মানদণ্ডের সাথে টার্গেট চিহ্নগুলি আলতো চাপুন।';

  @override
  String get dualMirrorTitle => 'দ্বৈত-মিরর নেভিগেশন';

  @override
  String get dualMirrorSubtitle => 'একসাথে দুটি গোলকধাঁধা নেভিগেট করুন।';

  @override
  String get contextCluesTitle => 'প্রাসঙ্গিক ক্লু';

  @override
  String get contextCluesSubtitle =>
      'প্রাসঙ্গিক ইঙ্গিত থেকে লুকানো শব্দ অনুমান করুন।';

  @override
  String get digitSpanReverseSubtitle => 'বিপরীত ক্রমে সংখ্যাগুলি মনে করুন।';

  @override
  String get faceNameAssociationSubtitle =>
      'উপস্থাপিত বিভিন্ন মুখমন্ডলের নাম মনে করুন।';

  @override
  String get staircaseMemorySubtitle => 'ধাপে ধাপে ব্লকের ক্রম মুখস্থ করুন।';

  @override
  String get choiceReactionTimeSubtitle =>
      'দ্রুত ক্লুগুলির সাথে মিল রেখে নির্দিষ্ট বোতাম টিপুন।';

  @override
  String get attentionalBlinkSubtitle =>
      'স্ট্রীমে দ্রুত টার্গেট ফ্ল্যাশিং স্পার্ক করুন।';

  @override
  String get visualStatisticalLearningSubtitle =>
      'দৃশ্যত টেম্পোরাল শেপ প্যাটার্ন শিখুন।';

  @override
  String get sternbergTaskSubtitle =>
      'চিহ্নটি মেমরি সেটে ছিল কিনা তা মনে করুন।';

  @override
  String get operationSpanSubtitle =>
      'গণিত সমাধান করুন এবং বর্ণমালার স্ট্রিং মনে করুন।';

  @override
  String get continuousRecognitionTitle => 'নিরবচ্ছিন্ন স্বীকৃতি';

  @override
  String get continuousRecognitionSubtitle =>
      'উপস্থাপিত কার্ডটি পুরানো না নতুন তা চিহ্নিত করুন।';

  @override
  String get symmetrySpanTitle => 'প্রতিসাম্য স্প্যান';

  @override
  String get symmetrySpanSubtitle =>
      'উল্লম্ব প্রতিসাম্য সিদ্ধান্তের মধ্যে সেল স্থানাঙ্ক মনে করুন।';

  @override
  String get objectDisplacementTitle => 'বস্তু বিচ্যুতি';

  @override
  String get objectDisplacementSubtitle =>
      'অবস্থানগুলি অধ্যয়ন করুন এবং সরানো একটি মাত্র বস্তুটি আলতো চাপুন।';

  @override
  String get mandalaRecallTitle => 'মন্ডলা রিকল';

  @override
  String get mandalaRecallSubtitle =>
      'রঙের টাইলস মুখস্থ করুন এবং প্যালেট থেকে মন্ডলা পুনরায় রং করুন।';

  @override
  String get runningMemorySpanTitle => 'রানিং স্প্যান';

  @override
  String get runningMemorySpanSubtitle =>
      'চলমান অক্ষরগুলি পর্যবেক্ষণ করুন এবং শেষ N আইটেমগুলি মনে করুন।';

  @override
  String get spatialCabinetMemoryTitle => 'স্থানিক ক্যাবিনেট';

  @override
  String get spatialCabinetMemorySubtitle =>
      'ক্যাবিনেটের দরজার পিছনে আইটেমগুলি মুখস্থ করুন এবং সন্ধান করুন।';

  @override
  String get pathRecallSubtitle =>
      'পাথওয়ে নির্বাচন মুখস্থ করুন এবং পুনরাবৃত্তি করুন।';

  @override
  String get objectShuffleSubtitle =>
      'গভীর কাপের নিচে এলোমেলো আইটেম ট্র্যাক করুন।';

  @override
  String get groceryListSubtitle =>
      'তালিকায় থাকা আইটেমগুলি মুখস্থ করুন এবং চেক অফ করুন।';

  @override
  String get quickMathSubtitle => 'দ্রুত গতিতে গাণিতিক প্রশ্নের সমাধান করুন।';

  @override
  String get mathGuessTitle => 'গণিত অনুমান';

  @override
  String get mathGuessSubtitle =>
      '১৫টি সুযোগের মধ্যে লুকানো সংখ্যাটি অনুমান করুন।';

  @override
  String get reflexTapSubtitle =>
      'মানুষের পক্ষে যতটা সম্ভব দ্রুত উদ্দীপকগুলিকে ট্যাপ করুন।';

  @override
  String get pixelMimicSubtitle =>
      'পিক্সেল গ্রিডে ডিজাইনের প্যাটার্ন অনুকরণ করুন।';

  @override
  String get simonSequenceSubtitle =>
      'স্মৃতি থেকে আকারের ক্রম পুনরাবৃত্তি করুন।';

  @override
  String get slidePuzzleSubtitle =>
      'বর্গাকার স্লাইডিং গ্রিড টাইলস পুনর্বিন্যাস করুন।';

  @override
  String get findWordTitle => 'শব্দ খুঁজুন';

  @override
  String get schulteTableSubtitle => 'এক থেকে পঁচিশ পর্যন্ত সংখ্যা ট্যাপ করুন।';

  @override
  String get simonCommandTitle => 'সাইমন কমান্ড';

  @override
  String get simonCommandSubtitle => 'দ্রুত ভয়েস নির্দেশাবলী সম্পাদন করুন।';

  @override
  String get binaryCodeTitle => 'বাইনারি গতি';

  @override
  String get binaryCodeSubtitle => 'বাইনারি কোডগুলিকে দশমিকে রূপান্তর করুন।';

  @override
  String get moduloClockTitle => 'মডুলো ক্লক';

  @override
  String get moduloClockSubtitle =>
      'ঘড়ি ব্যবহার করে গাণিতিক সমীকরণ গণনা করুন।';

  @override
  String get chimpTestTitle => 'শিম্পাঞ্জি পরীক্ষা';

  @override
  String get chimpTestSubtitle => 'আরোহী ক্রমে এলোমেলো সংখ্যা ট্যাপ করুন।';

  @override
  String get relationalMemoryTitle => 'সম্পর্কীয় স্মৃতি';

  @override
  String get relationalMemorySubtitle => 'সঠিক গ্রিড আইটেম অবস্থান মনে করুন।';

  @override
  String get factBinderTitle => 'ফ্যাক্ট বাইন্ডার';

  @override
  String get factBinderSubtitle =>
      'চিহ্নগুলি সংযুক্ত করুন এবং বিবৃতিগুলি মনে করুন।';

  @override
  String get sourceMonitoringTitle => 'উৎস পর্যবেক্ষণ';

  @override
  String get sourceMonitoringSubtitle => 'প্রসঙ্গটি মনে রাখুন।';

  @override
  String get klotskiTitle => 'ক্লোটস্কি এস্কেপ';

  @override
  String get klotskiSubtitle =>
      'প্রস্থান পথে পৌঁছানোর জন্য ব্লকগুলি স্লাইড করুন।';

  @override
  String get homophoneHuntSubtitle => 'সঠিক বানানের সমোচ্চারিত শব্দটি বেছে নিন';

  @override
  String get laserLinkTitle => 'লেজার লিঙ্ক';

  @override
  String get laserLinkSubtitle =>
      'লেজার প্রতিফলিত করতে এবং সমস্ত লক্ষ্যকে শক্তিশালী করতে আয়না ঘোরান।';

  @override
  String get laserLinkCongrats =>
      'নির্ভুল প্রতিফলন! আপনি সফলভাবে পুরো গ্রিডটি চালিত করেছেন।';

  @override
  String get crossSectionSliceTitle => 'ক্রস-সেকশন স্লাইস';

  @override
  String get crossSectionSliceSubtitle =>
      'একটি নির্দিষ্ট কোণ থেকে একটি 3D বস্তুর সঠিক 2D ক্রস-সেকশন সনাক্ত করুন।';

  @override
  String get crossSectionSliceCongrats =>
      'অবিশ্বাস্য 3D ভিজ্যুয়ালাইজেশন! আপনি সেই আকৃতির মধ্য দিয়ে ঠিক দেখতে পেয়েছেন।';

  @override
  String get shadowPivotTitle => 'শ্যাডো পিভট';

  @override
  String get shadowPivotCongrats =>
      'গতিশীল স্থানিক যুক্তি! আপনি আলো এবং ছায়ায় দক্ষতা অর্জন করেছেন।';

  @override
  String get shadowPivotSubtitle =>
      'একটি 3D বস্তু বিভিন্ন অক্ষে ঘোরার সাথে साथ তার ছায়া কেমন হবে তা অনুমান করুন।';

  @override
  String get interlockPuzzleTitle => 'ইন্টারলক ধাঁধা';

  @override
  String get interlockPuzzleSubtitle =>
      'সঠিক ক্রমানুসারে জটিল ইন্টারলকিং ব্লকগুলি বিচ্ছিন্ন বা একত্রিত করুন।';

  @override
  String get interlockPuzzleCongrats =>
      'যৌক্তিক ডিকনস্ট্রাকশন! আপনি ধাঁধাটি নিখুঁতভাবে সমাধান করেছেন।';

  @override
  String get pathIntersectTitle => 'পাথ ইন্টারসেক্ট';

  @override
  String get pathIntersectSubtitle =>
      'সংঘর্ষ ছাড়াই তাদের নিজ নিজ লক্ষ্যে পৌঁছানোর জন্য একসাথে একাধিক পথে নেভিগেট করুন।';

  @override
  String get pathIntersectCongrats =>
      'সুসংগত নেভিগেশন! আপনি ত্রুটিহীনভাবে সমস্ত লক্ষ্যে পৌঁছেছেন।';

  @override
  String get negativeSpaceDetectionTitle => 'নেতিবাচক স্থান';

  @override
  String get negativeSpaceDetectionSubtitle =>
      'বস্তুর মধ্যবর্তী খালি স্থান দ্বারা গঠিত আকৃতিটি সনাক্ত করুন।';

  @override
  String get negativeSpaceDetectionCongrats =>
      'তীক্ষ্ণ উপলব্ধি! আপনি যা নেই তা দেখার শিল্পে দক্ষতা অর্জন করেছেন।';

  @override
  String get compassMazeTitle => 'কম্পাস গোলকধাঁধা';

  @override
  String get compassMazeSubtitle =>
      'এমন একটি গোলকধাঁধায় নেভিগেট করুন যেখানে আপনার কম্পাসের ওরিয়েন্টেশনের উপর ভিত্তি করে চলাচলের দিক পরিবর্তন হয়।';

  @override
  String get compassMazeCongrats =>
      'দক্ষ নেভিগেশন! আপনি পরিবর্তনশীল দিকনির্দেশের মাধ্যমে প্রস্থান খুঁজে পেয়েছেন।';

  @override
  String get complexFoldingNetsTitle => 'ফোল্ডিং নেটস';

  @override
  String get complexFoldingNetsSubtitle =>
      'একটি নন-স্ট্যান্ডার্ড 2D নেট ফোল্ড করে কোন জটিল 3D আকৃতি তৈরি হবে তা নির্ধারণ করুন।';

  @override
  String get complexFoldingNetsCongrats =>
      'উন্নত ফোল্ডিং লজিক! আপনি সফলভাবে 3D ফর্মটি কল্পনা করেছেন।';

  @override
  String get compassMazeMessage =>
      'কম্পাস ব্যবহার করে গোলকধাঁধায় নেভিগেট করুন।';

  @override
  String get negativeSpaceDetectionMessage =>
      'স্পেসের মধ্যে লুকানো বস্তুটি সনাক্ত করুন।';

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

  @override
  String get shapeShifterPeripheralTitle => 'Peripheral Shapes';

  @override
  String get shapeShifterPeripheralSubtitle =>
      'Track peripheral shape changes while matching central values.';

  @override
  String get soundWaveMatchTitle => 'Sound Wave Match';

  @override
  String get soundWaveMatchSubtitle =>
      'Tap when the visual wave frequency aligns with pitch changes.';

  @override
  String get multiTrackCounterTitle => 'Multi-Track Counter';

  @override
  String get multiTrackCounterSubtitle =>
      'Tap when any counter increments to a target multiplier.';

  @override
  String get colorWordMatchUpTitle => 'Color Match-Up';

  @override
  String get colorWordMatchUpSubtitle =>
      'Determine if two colored words match based on changing rules.';

  @override
  String get signalAndNoiseTitle => 'Signal & Noise';

  @override
  String get signalAndNoiseSubtitle =>
      'Locate target alphanumeric characters hidden in static noise.';

  @override
  String get focusTunnelTitle => 'Focus Tunnel';

  @override
  String get focusTunnelSubtitle =>
      'Identify matching symbols appearing on moving tunnel walls.';

  @override
  String get targetPursuerTitle => 'Target Pursuer';

  @override
  String get targetPursuerSubtitle =>
      'Track multiple overlapping circles and select the original target.';

  @override
  String get gridGazeTitle => 'Grid Gaze';

  @override
  String get gridGazeSubtitle =>
      'Identify which grid cell flashed with a different duration.';

  @override
  String get doubleTroubleTitle => 'Double Trouble';

  @override
  String get doubleTroubleSubtitle =>
      'Play two separate simple games simultaneously on split-screen.';

  @override
  String get syncRhythmTitle => 'Sync Rhythm';

  @override
  String get syncRhythmSubtitle =>
      'Tap when visual metronome sweep matches syncopated beat.';

  @override
  String get ghostTapTitle => 'Ghost Tap';

  @override
  String get ghostTapSubtitle =>
      'Tap when the invisible pulse reaches its maximum height.';

  @override
  String get attentionalRsvpTitle => 'Attentional RSVP';

  @override
  String get attentionalRsvpSubtitle =>
      'Identify digits appearing in rapid serial letter flash.';

  @override
  String get colorMazeNavTitle => 'Color Maze Nav';

  @override
  String get colorMazeNavSubtitle =>
      'Navigate maze tiles matching dynamic permission colors.';

  @override
  String get dynamicSalienceTitle => 'Dynamic Salience';

  @override
  String get dynamicSalienceSubtitle =>
      'Find the shape moving with slightly different dynamics.';

  @override
  String get chalkAndTalkTitle => 'Chalk & Talk';

  @override
  String get chalkAndTalkSubtitle =>
      'Type words heard in audio while ignoring visual distractors.';

  @override
  String get blinkDetectorTitle => 'Blink Detector';

  @override
  String get blinkDetectorSubtitle =>
      'Tap the grid face that blinks twice in rapid succession.';

  @override
  String get frequencyTapTitle => 'Frequency Tap';

  @override
  String get frequencyTapSubtitle =>
      'Tap the button matching the target light pulse frequency.';

  @override
  String get yajilinTitle => 'Yajilin Loop';

  @override
  String get yajilinSubtitle =>
      'Place black cells and draw a single loop matching clues.';

  @override
  String get heyawakeTitle => 'Heyawake Grid';

  @override
  String get heyawakeSubtitle =>
      'Shade grid rooms without adjacent black cells.';

  @override
  String get gokigenVariantTitle => 'Gokigen Variant';

  @override
  String get gokigenVariantSubtitle =>
      'Draw loop-free diagonals meeting vertex counts.';

  @override
  String get sheepAndWolvesTitle => 'Sheep & Wolves';

  @override
  String get sheepAndWolvesSubtitle =>
      'Draw a loop separating sheep from wolves.';

  @override
  String get islandNurikabeTitle => 'Island Nurikabe';

  @override
  String get islandNurikabeSubtitle =>
      'Form islands matching numerical size constraints.';

  @override
  String get shakashakaTitle => 'Shakashaka Rects';

  @override
  String get shakashakaSubtitle =>
      'Place triangular tiles to form rectangular white areas.';

  @override
  String get litsTetrisTitle => 'LITS Tetromino';

  @override
  String get litsTetrisSubtitle =>
      'Place tetrominoes in rooms with no adjacent duplicates.';

  @override
  String get tapaWallTitle => 'Tapa Wall';

  @override
  String get tapaWallSubtitle =>
      'Shade cells to form a continuous black wall pattern.';

  @override
  String get triangularBridgesTitle => 'Triangular Bridges';

  @override
  String get triangularBridgesSubtitle =>
      'Connect islands in 3 directions meeting requirements.';

  @override
  String get rippleEffectTitle => 'Ripple Effect';

  @override
  String get rippleEffectSubtitle =>
      'Fill numbers in rooms respecting spacing distance constraints.';

  @override
  String get suguruTectonicTitle => 'Suguru Grid';

  @override
  String get suguruTectonicSubtitle =>
      'Fill room blocks with numbers 1 to K with no neighbors equal.';

  @override
  String get tennerGridTitle => 'Tenner Grid';

  @override
  String get tennerGridSubtitle =>
      'Fill rows with digits 0-9 matching column totals.';

  @override
  String get kakurasuSumsTitle => 'Kakurasu Sums';

  @override
  String get kakurasuSumsSubtitle =>
      'Shade cells to meet weighted row/col index sums.';

  @override
  String get corralLoopTitle => 'Corral Loop';

  @override
  String get corralLoopSubtitle =>
      'Draw a single loop enclosing numbers matching visibility.';

  @override
  String get stostoneTitle => 'Stostone Gravity';

  @override
  String get stostoneSubtitle =>
      'Shade cells that drop down to fill bottom rows perfectly.';

  @override
  String get tripletsLogicTitle => 'Triplets Trio';

  @override
  String get tripletsLogicSubtitle =>
      'Fill grid with three shapes avoiding three-in-a-row.';

  @override
  String get galaxiesSymTitle => 'Galaxies Symmetry';

  @override
  String get galaxiesSymSubtitle =>
      'Divide grid into rotationally symmetric galaxy shapes.';

  @override
  String get matrixMultiplierMatchTitle => 'Matrix Matcher';

  @override
  String get matrixMultiplierMatchSubtitle =>
      'Multiply row and column values to match target dot product.';

  @override
  String get primeFactorTreesTitle => 'Prime Factor Trees';

  @override
  String get primeFactorTreesSubtitle =>
      'Decompose composite numbers into prime leaf factor pairs.';

  @override
  String get vektorVectorTitle => 'Vector Vector';

  @override
  String get vektorVectorSubtitle =>
      'Scale vectors to make their sum land on the target.';

  @override
  String get binomialMatchTitle => 'Binomial Match';

  @override
  String get binomialMatchSubtitle =>
      'Match quadratic formulas with factored binomial values.';

  @override
  String get percentageShoppingTitle => 'Percentage Shopping';

  @override
  String get percentageShoppingSubtitle =>
      'Calculate discount percentages and final checkout totals.';

  @override
  String get cryptoArithmeticTitle => 'Crypto-Arithmetic';

  @override
  String get cryptoArithmeticSubtitle =>
      'Crack character-digit substitution cipher math problems.';

  @override
  String get fractionalPizzaTitle => 'Fractional Pizza';

  @override
  String get fractionalPizzaSubtitle =>
      'Partition pizza slices to match target sum fractions.';

  @override
  String get numberBondsTitle => 'Number Bonds';

  @override
  String get numberBondsSubtitle =>
      'Link node values to equal a target connection sum.';

  @override
  String get gridSumLineTitle => 'Grid Sum Line';

  @override
  String get gridSumLineSubtitle =>
      'Draw a path whose values evaluate exactly to the target.';

  @override
  String get binaryScaleBalanceTitle => 'Binary Scale Balance';

  @override
  String get binaryScaleBalanceSubtitle =>
      'Balance decimal weight using power-of-two blocks.';

  @override
  String get moduloPathTitle => 'Modulo Path';

  @override
  String get moduloPathSubtitle =>
      'Traverse grid cells matching modulo remainder values.';

  @override
  String get digitSwapEqTitle => 'Digit Swap Equations';

  @override
  String get digitSwapEqSubtitle =>
      'Swap single digits between equations to correct both.';

  @override
  String get areaPerimeterMatchTitle => 'Area & Perimeter';

  @override
  String get areaPerimeterMatchSubtitle =>
      'Draw rectangles matching target area and perimeter values.';

  @override
  String get inequalityBalanceOpsTitle => 'Inequality Balance';

  @override
  String get inequalityBalanceOpsSubtitle =>
      'Place inequality symbols between complex math terms.';

  @override
  String get graphCoordinatePlotTitle => 'Graph Plotter';

  @override
  String get graphCoordinatePlotSubtitle =>
      'Plot grid coordinates matching linear/quadratic curves.';

  @override
  String get baseConversionRunTitle => 'Base Conversion';

  @override
  String get baseConversionRunSubtitle =>
      'Convert values between binary, decimal, hex, and octal.';

  @override
  String get unitConverterProTitle => 'Unit Converter';

  @override
  String get unitConverterProSubtitle =>
      'Answer quick unit conversions under time limits.';

  @override
  String get auditoryNBackTitle => 'Auditory N-Back';

  @override
  String get auditoryNBackSubtitle =>
      'Match spoken letters heard N steps back from memory.';

  @override
  String get abstractPatternRecallTitle => 'Pattern Layering';

  @override
  String get abstractPatternRecallSubtitle =>
      'Reconstruct layered colorful shapes from memory study.';

  @override
  String get roomInspectorTitle => 'Room Inspector';

  @override
  String get roomInspectorSubtitle =>
      'Identify furniture modifications made while screen was blank.';

  @override
  String get voiceToFaceMatchTitle => 'Voice-Face Match';

  @override
  String get voiceToFaceMatchSubtitle =>
      'Select correct face associated with spoken audio voice clip.';

  @override
  String get spatialGridMemory3DTitle => '3D Spatial Memory';

  @override
  String get spatialGridMemory3DSubtitle =>
      'Recall flashed blocks in a rotated 3D cube grid structure.';

  @override
  String get sequenceStackTitle => 'Sequence Stack';

  @override
  String get sequenceStackSubtitle =>
      'Reconstruct plate stack additions and removals in order.';

  @override
  String get semanticCategoryRecallTitle => 'Category Recall';

  @override
  String get semanticCategoryRecallSubtitle =>
      'Identify study words matching requested category targets.';

  @override
  String get gridDisplacementTitle => 'Grid Displacement';

  @override
  String get gridDisplacementSubtitle =>
      'Identify shifted icons comparing layout to original.';

  @override
  String get soundSequenceMatchTitle => 'Sound Sequence Match';

  @override
  String get soundSequenceMatchSubtitle =>
      'Repeat note sequences played on a virtual keyboard.';

  @override
  String get cardCountingMemoryTitle => 'Card Counter';

  @override
  String get cardCountingMemorySubtitle =>
      'Identify cards already dealt in continuous card deal runs.';

  @override
  String get directionsRecallTitle => 'Directions Recall';

  @override
  String get directionsRecallSubtitle =>
      'Navigate grid maps matching path directions from memory.';

  @override
  String get eventTimelineMemoryTitle => 'Event Timeline';

  @override
  String get eventTimelineMemorySubtitle =>
      'Arrange historical/fictional event cards chronologically.';

  @override
  String get featureMatrixRecallTitle => 'Feature Matrix';

  @override
  String get featureMatrixRecallSubtitle =>
      'Answer query prompts about cell shape-color attributes.';

  @override
  String get delayedMatchSampleTitle => 'Delayed Match';

  @override
  String get delayedMatchSampleSubtitle =>
      'Match target symbol after solving math distractors.';

  @override
  String get symbolDigitAssocTitle => 'Symbol-Digit Assoc';

  @override
  String get symbolDigitAssocSubtitle =>
      'Solve symbol translation sheets matching digit keys.';

  @override
  String get dualTaskMemoryTitle => 'Dual-Task Memory';

  @override
  String get dualTaskMemorySubtitle =>
      'Memorize word sets while resolving quick arithmetic tasks.';

  @override
  String get actionSequenceRecallTitle => 'Action Recall';

  @override
  String get actionSequenceRecallSubtitle =>
      'Repeat character gesture animation sequences in order.';

  @override
  String get tangramPolygonTitle => 'Tangram Fit';

  @override
  String get tangramPolygonSubtitle =>
      'Arrange polygon shapes to fill silhouette outlines.';

  @override
  String get mazeNav3DTitle => '3D Maze Nav';

  @override
  String get mazeNav3DSubtitle =>
      'Navigate 3D isometric maze routes from first-person view.';

  @override
  String get isometricProjectionTitle => 'Isometric Projector';

  @override
  String get isometricProjectionSubtitle =>
      'Match 3D block figures to orthographic 2D top/front views.';

  @override
  String get polyominoPackingTitle => 'Polyomino Packing';

  @override
  String get polyominoPackingSubtitle =>
      'Pack random polyomino block pieces into target areas.';

  @override
  String get spatialGridRotationTitle => 'Spatial Grid Rotation';

  @override
  String get spatialGridRotationSubtitle =>
      'Match 3D block arrangements rotated along axis coordinates.';

  @override
  String get wireLoopGameTitle => 'Wire Loop';

  @override
  String get wireLoopGameSubtitle =>
      'Drag metal rings along wire splines without contact.';

  @override
  String get origamiUnfoldTitle => 'Origami Unfold';

  @override
  String get origamiUnfoldSubtitle =>
      'Identify hole punch patterns after unfolding folded sheets.';

  @override
  String get ropeTangleSolverTitle => 'Rope Untangler';

  @override
  String get ropeTangleSolverSubtitle =>
      'Drag nodes to layout planar graphs with zero line crosses.';

  @override
  String get gridFitTetrisTitle => 'Grid Fit Solver';

  @override
  String get gridFitTetrisSubtitle =>
      'Arrange static irregular blocks to fit container bounds.';

  @override
  String get vectorGridAlignmentTitle => 'Vector Alignment';

  @override
  String get vectorGridAlignmentSubtitle =>
      'Scale and rotate shapes to match shadow template targets.';

  @override
  String get blockStackingPhysicsTitle => 'Block Stacking';

  @override
  String get blockStackingPhysicsSubtitle =>
      'Stack irregular block panels balancing gravity weight.';

  @override
  String get crossSectionMatch3DTitle => '3D Cross Section';

  @override
  String get crossSectionMatch3DSubtitle =>
      'Identify 2D slice geometries cut from 3D shapes.';

  @override
  String get symmetryPaintTitle => 'Symmetry Paint';

  @override
  String get symmetryPaintSubtitle =>
      'Draw mirror image segments reflecting across symmetry axes.';

  @override
  String get rollingBlockBloxTitle => 'Rolling Block';

  @override
  String get rollingBlockBloxSubtitle =>
      'Roll block pieces to land vertically in target slots.';

  @override
  String get perspectiveShiftViewTitle => 'Perspective Shift';

  @override
  String get perspectiveShiftViewSubtitle =>
      'Rotate block clusters until they spell letters/words.';

  @override
  String get networkFlowSphericalTitle => 'Network Flow';

  @override
  String get networkFlowSphericalSubtitle =>
      'Connect grid flows on wrapping cylindrical coordinates.';

  @override
  String get layeredSilhouetteBlendTitle => 'Silhouette Blend';

  @override
  String get layeredSilhouetteBlendSubtitle =>
      'Stack colored layers to match target translucent shapes.';

  @override
  String get wordWheelPangramTitle => 'Word Anagrams';

  @override
  String get wordWheelPangramSubtitle =>
      'Construct words containing central target letters from wheels.';

  @override
  String get letterGridSwapperTitle => 'Letter Swapper';

  @override
  String get letterGridSwapperSubtitle =>
      'Swap adjacent letter tiles to complete row and col words.';

  @override
  String get synonymMatchTitle => 'Synonym Match';

  @override
  String get synonymMatchSubtitle =>
      'Match falling word targets with synonyms or antonyms.';

  @override
  String get vowelDropTitle => 'Vowel Drop';

  @override
  String get vowelDropSubtitle =>
      'Drop vowels into coordinate grids completing words.';

  @override
  String get letterBalanceScaleTitle => 'Word Balance Scale';

  @override
  String get letterBalanceScaleSubtitle =>
      'Spell words whose letter values balance weights.';

  @override
  String get wordChainShiritoriTitle => 'Word Chain';

  @override
  String get wordChainShiritoriSubtitle =>
      'Link word loops starting with preceding letter outputs.';

  @override
  String get affixBuilderTitle => 'Affix Builder';

  @override
  String get affixBuilderSubtitle =>
      'Combine prefixes/suffixes to construct target vocabularies.';

  @override
  String get decipherCrypticCluesTitle => 'Cryptic Decipher';

  @override
  String get decipherCrypticCluesSubtitle =>
      'Solve word-play puzzles and decrypt spelling riddles.';

  @override
  String get boggleWordSearchTitle => 'Boggle Connect';

  @override
  String get boggleWordSearchSubtitle =>
      'Trace adjacent connected paths to find hidden words.';

  @override
  String get idiomUnscrambleTitle => 'Idiom Unscramble';

  @override
  String get idiomUnscrambleSubtitle =>
      'Arrange scrambled word arrays to match idiom meanings.';

  @override
  String get letterPyramidsTitle => 'Letter Pyramids';

  @override
  String get letterPyramidsSubtitle =>
      'Build word towers adding single anagram letters per tier.';

  @override
  String get soundAlikeHomophonesTitle => 'Homophone Matches';

  @override
  String get soundAlikeHomophonesSubtitle =>
      'Identify correct homophone spellings for sentences.';

  @override
  String get wordGridSudokuTitle => 'Word Sudoku';

  @override
  String get wordGridSudokuSubtitle =>
      'Tesselate letters in grid rows forming words.';

  @override
  String get portmanteauFactoryTitle => 'Portmanteau Factory';

  @override
  String get portmanteauFactorySubtitle =>
      'Merge semantic components creating compound words.';

  @override
  String get codedCrosswordsCodeTitle => 'Codewords Crossword';

  @override
  String get codedCrosswordsCodeSubtitle =>
      'Solve grid crosswords matching number-to-letter codes.';

  @override
  String get wordSnakeTrailTitle => 'Word Snake';

  @override
  String get wordSnakeTrailSubtitle =>
      'Trace snake-like letter trails spelling thematic words.';

  @override
  String get typingRhythmSpeedTitle => 'Typing Flow';

  @override
  String get typingRhythmSpeedSubtitle =>
      'Type vocabularies matching metronome rhythm beats.';

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
