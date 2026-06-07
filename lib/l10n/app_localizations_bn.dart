// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'পাজল হাব';

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
  String get visualStatisticalLearningTitle => 'গেম ওভার';

  @override
  String get orbitTapTitle => 'অরবিট ট্যাপ';

  @override
  String get orbitTapSubtitle => 'বলগুলো গেটের সাথে সারিবদ্ধ হলে ট্যাপ করুন';

  @override
  String get schulteTableTitle => 'দুর্দান্ত ফোকাস!';

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
  String get memoryMatrixTitle => 'লক্ষ্য অর্জিত!';

  @override
  String get memoryMatrixSubtitle =>
      'প্যাটার্নটি মুখস্থ করুন এবং টাইলগুলো ট্যাপ করুন।';

  @override
  String get mentalAbacusTitle => 'অ্যাবাকাস মাস্টার!';

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
  String get verbalAnalogiesTitle => 'অ্যানালজি মাস্টার!';

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
  String get tangleFixTitle => 'জটমুক্ত!';

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
  String get wisconsinCardSortingTitle => 'গেম ওভার';

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
  String get mirrorTracingTitle => 'নিখুঁত ট্রেসিং!';

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
  String get paperFoldingTitle => 'উন্মোচিত নিখুঁততা!';

  @override
  String get paperFoldingSubtitle => 'উন্মোচন করলে এটি দেখতে কেমন হবে?';

  @override
  String get waterSortTitle => 'সাবাস!';

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
  String get silhouetteMatchTitle => 'মিলেছে!';

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
}
