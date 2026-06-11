// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Puzzle Hub';

  @override
  String get home => 'Ana Sayfa';

  @override
  String get settings => 'Ayarlar';

  @override
  String get playAgain => 'Tekrar Oyna';

  @override
  String get playNext => 'Sonrakini Oyna';

  @override
  String get seeCompleted => 'İncele';

  @override
  String get finish => 'Bitir';

  @override
  String get congrats => 'Tebrikler';

  @override
  String get perfectGradient => 'Mükemmel Gradyan!';

  @override
  String get wellDone => 'Aferin';

  @override
  String get timeUp => 'Süre Doldu!';

  @override
  String get victory => 'Zafer!';

  @override
  String get gameWin => 'AFERİN!';

  @override
  String get completed => 'Tamamlandı!';

  @override
  String get score => 'Puan';

  @override
  String get timeLeft => 'Süre';

  @override
  String get trials => 'Denemeler';

  @override
  String get numberRule => 'Sayı Kuralı';

  @override
  String get colorRule => 'Renk Kuralı';

  @override
  String get valid => 'Geçerli';

  @override
  String get invalid => 'Geçersiz';

  @override
  String get even => 'Çift';

  @override
  String get odd => 'Tek';

  @override
  String get red => 'Kırmızı';

  @override
  String get green => 'Yeşil';

  @override
  String get blue => 'Mavi';

  @override
  String get yes => 'Evet';

  @override
  String get no => 'Hayır';

  @override
  String get trueLabel => 'Doğru';

  @override
  String get falseLabel => 'Yanlış';

  @override
  String get clear => 'Temizle';

  @override
  String get north => 'Kuzey';

  @override
  String get south => 'Güney';

  @override
  String get east => 'Doğu';

  @override
  String get west => 'Batı';

  @override
  String get target => 'Hedef';

  @override
  String get moves => 'Hamleler';

  @override
  String get trialMode => 'Deneme Modu';

  @override
  String get trialModeDescription =>
      '60 saniyelik zamanlayıcı yerine 20 tanesini çözerek bitir';

  @override
  String get appearance => 'Görünüm';

  @override
  String get language => 'Dil';

  @override
  String get gameplay => 'Oynanış';

  @override
  String get supportUs => 'Bizi Destekleyin';

  @override
  String get systemLegal => 'Sistem ve Yasal';

  @override
  String get games => 'Oyunlar';

  @override
  String get solvedToday => 'Bugün Çözülen';

  @override
  String get searchGames => 'Oyun Ara...';

  @override
  String get readyToStart => 'BEYİN EGZERSİZİNE BAŞLAMAYA HAZIR MISIN?';

  @override
  String get greatStart => 'HARİKA BAŞLANGIÇ! BU MOMENTUMU KORU.';

  @override
  String get onFire => 'HARİKASIN! BEYNİN BUNA BAYILIYOR.';

  @override
  String get incredible => 'İNANILMAZ! SEN BİR BULMACA USTASISIN.';

  @override
  String get noGamesMatch => 'ARAMANIZA UYGUN OYUN BULUNAMADI';

  @override
  String get categoryAll => 'HEPSİ';

  @override
  String get categoryAttention => 'DİKKAT';

  @override
  String get categoryLogic => 'MANTIK';

  @override
  String get categoryMath => 'MATEMATİK';

  @override
  String get categoryWord => 'KELİME';

  @override
  String get categoryMemory => 'HAFIZA';

  @override
  String get categorySpatial => 'UZAYSAL';

  @override
  String get themeLight => 'AÇIK';

  @override
  String get themeDark => 'KOYU';

  @override
  String get themeSystem => 'SİSTEM';

  @override
  String get starOnGithub => 'GitHub\'da Yıldızla';

  @override
  String get sponsorOnGithub => 'GitHub\'da Sponsor Ol';

  @override
  String get privacyPolicy => 'Gizlilik Politikası';

  @override
  String get termsOfService => 'Hizmet Şartları';

  @override
  String get licenses => 'Lisanslar';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return 'Gizli $wordLength harfli kelimeyi bulmak için $maxTries deneme hakkın var.';
  }

  @override
  String wordFoundMessage(String word) {
    return 'Kelime başarıyla bulundu: $word';
  }

  @override
  String gameOverMessage(String word) {
    return 'Kelime şuydu: $word';
  }

  @override
  String get gameOver => 'Oyun Bitti';

  @override
  String get crosswordTitle => 'Kare Bulmaca';

  @override
  String get crosswordSubtitle =>
      'Verilen ipuçlarına göre ızgarayı doğru kelimelerle tamamla.';

  @override
  String get wordSearchTitle => 'Kelime Avı';

  @override
  String get radicalRootsTitle => 'Kök Bulucu';

  @override
  String get radicalRootsSubtitle =>
      'Verilen sayının karekökünü veya küp kökünü bul. Gerekirse en yakın tam sayıya yuvarla.';

  @override
  String get radicalRootsGoalReached => 'Hedefe Ulaşıldı!';

  @override
  String get radicalRootsTimeUp => 'Süre Doldu!';

  @override
  String radicalRootsScoreMessage(int score) {
    return '$score kökü doğru hesapladın!';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return 'Pratik yapmaya devam et! $score kök hesapladın.';
  }

  @override
  String get radicalRootsStart => 'Hesaplamaya Başla';

  @override
  String get radicalRootsDescription =>
      'Mümkün olduğunca çok çözmek için 60 saniyen var.';

  @override
  String get radicalRootsBest => 'En İyi';

  @override
  String get radicalRootsSeconds => '60 SANİYE';

  @override
  String get romanArithmeticTitle => 'Roma Aritmetiği';

  @override
  String get romanArithmeticSubtitle =>
      'Roma Rakamlarını kullanarak toplama ve çıkarma problemlerini çöz.';

  @override
  String get romanArithmeticGoalReached => 'Centurion Seviyesi!';

  @override
  String get romanArithmeticTimeUp => 'Süre Doldu!';

  @override
  String romanArithmeticScoreMessage(int score) {
    return '$score Roma problemi çözdün!';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return 'Veni, Vidi, Vici! $score problem çözdün.';
  }

  @override
  String get romanArithmeticStart => 'Görevi Başlat';

  @override
  String get romanArithmeticDescription => 'Dönüştür ve çöz. 60 saniyen var.';

  @override
  String get romanArithmeticBest => 'En İyi';

  @override
  String get romanArithmeticSeconds => '60 SANİYE';

  @override
  String get wordSearchSubtitle =>
      'Izgaradaki tüm gizli kelimeleri bul. Seçmek için sürükle.';

  @override
  String get missingVowelsTitle => 'Eksik Ünlüler';

  @override
  String get missingVowelsSubtitle => 'Ünlüleri gizlenmiş kelimeyi tanımla.';

  @override
  String get missingVowelsWin => 'Ünlüler Geri Geldi!';

  @override
  String get missingVowelsHowToPlay =>
      'Ünlü harfleri (A, E, I, O, U) gizlenmiş bir kelime gösterilir. Kelimenin tamamını tahmin et!';

  @override
  String get wordScrambleTitle => 'Kelime Karıştırma';

  @override
  String get wordScrambleSubtitle =>
      'Gizli kelimeyi çözmek için harflere dokun!';

  @override
  String get wordScrambleWin => 'Kelime Çözüldü!';

  @override
  String get sudokuTitle => 'Sudoku';

  @override
  String get sudokuSubtitle =>
      'Her satır, sütun ve 3x3\'lük kutu 1\'den 9\'a kadar tüm rakamları içerecek şekilde ızgarayı tamamla.';

  @override
  String get minesweeperTitle => 'Mayın Tarlası';

  @override
  String get minesweeperSubtitle => 'Tüm mayınları patlatmadan tanımla.';

  @override
  String get minesweeperWin => 'Zafer!';

  @override
  String get minesweeperMines => 'MAYINLAR';

  @override
  String get minesweeperStatus => 'DURUM';

  @override
  String get minesweeperWon => 'KAZANDIN';

  @override
  String get minesweeperBoom => 'GÜM';

  @override
  String get minesweeperPlaying => 'OYUN DEVAM EDİYOR';

  @override
  String get minesweeperReveal => 'AÇ';

  @override
  String get minesweeperFlag => 'BAYRAK';

  @override
  String get game2048Title => '2048';

  @override
  String get game2048Subtitle =>
      'Karoları birleştirmek ve 2048 karosuna ulaşmak için herhangi bir yöne kaydır!';

  @override
  String get nonogramTitle => 'Nonogram';

  @override
  String get nonogramSubtitle =>
      'Mantık ipuçlarını kullanarak gizli resmi ortaya çıkar.';

  @override
  String get nonogramWin => 'Resim Ortaya Çıktı!';

  @override
  String get magnetsTitle => 'MIKNATISLAR';

  @override
  String get magnetsSubtitle =>
      'Mıknatısları kutup sayılarına göre ızgaraya yerleştirin.';

  @override
  String get magnetsHowToPlay =>
      'Domino boyutundaki kapları \'+\' ve \'-\' mıknatıslarla doldurun veya boş bırakın. Satır ve sütun ipuçları, o hattaki her kutbun toplam sayısını belirtir. Özdeş kutuplar dikey veya yatay olarak bitişik olamaz.';

  @override
  String get magnetsWinTitle => 'POLARİTE DENGELENDİ!';

  @override
  String get magnetsWinMessage =>
      'Tüm mıknatıslar mükemmel bir şekilde düzenlendi!';

  @override
  String get lighthousesTitle => 'DENİZ FENERLERİ';

  @override
  String get lighthousesSubtitle =>
      'Deniz feneri ipuçlarına göre gemileri yerleştirin.';

  @override
  String get lighthousesHowToPlay =>
      'Izgaraya 1x1 gemiler yerleştirin. Deniz fenerleri, yatay ve dikey olarak görülebilen toplam gemi sayısını gösterir. Gemiler deniz fenerlerine veya birbirlerine çapraz olarak bile dokunamazlar.';

  @override
  String get lighthousesWinTitle => 'DENİZ GÜVENDE!';

  @override
  String get lighthousesWinMessage =>
      'Tüm deniz fenerleri gemilere mükemmel bir şekilde rehberlik ediyor!';

  @override
  String get dominosaTitle => 'DOMINOSA';

  @override
  String get dominosaSubtitle => 'Izgaradaki tüm gizli dominoları bulun.';

  @override
  String get dominosaHowToPlay =>
      'Komşu sayıların her bir çiftinin tam olarak bir domino ile kaplanacağı şekilde, sayıların olduğu bir ızgaraya tam bir domino seti yerleştirin. Her sayı çifti sette yalnızca bir kez bulunur.';

  @override
  String get dominosaWinTitle => 'DOMİNO USTASI!';

  @override
  String get dominosaWinMessage => 'Her domino bulundu ve yerleştirildi!';

  @override
  String get skyscrapersTitle => 'GÖKDELENLER';

  @override
  String get skyscrapersSubtitle => 'Izgarayı bina yükseklikleriyle doldurun.';

  @override
  String get skyscrapersHowToPlay =>
      'Izgarayı yüksekliklerle (1-N) doldurun; her satır ve sütun her yüksekliği tam olarak bir kez içermelidir. Kenarlardaki ipuçları, o yönden kaç binanın görülebildiğini gösterir; daha uzun binalar daha kısa olanları engeller.';

  @override
  String get skyscrapersWinTitle => 'SİLUET RESTORE EDİLDİ!';

  @override
  String get skyscrapersWinMessage =>
      'Tüm binalar mükemmel bir şekilde konumlandırıldı!';

  @override
  String get nurikabeTitle => 'NURIKABE';

  @override
  String get nurikabeSubtitle =>
      'Bağlantılı bir deniz ve ayrı adalar oluşturun.';

  @override
  String get nurikabeHowToPlay =>
      'Tek bir bağlantılı \'deniz\' oluşturmak için hücreleri gölgeleyin (2x2 blok olmamalıdır). Gölgelenmemiş hücreler, هر biri toplam alanını temsil eden tam olarak bir sayı içeren \'adalar\' oluşturur.';

  @override
  String get nurikabeWinTitle => 'DENİZ AKIYOR!';

  @override
  String get nurikabeWinMessage => 'Adalar ayrıldı, deniz bağlandı!';

  @override
  String get fillominoTitle => 'FILLOMINO';

  @override
  String get fillominoSubtitle =>
      'Izgarayı belirtilen boyutlardaki poliominolara bölün.';

  @override
  String get fillominoHowToPlay =>
      'Izgarayı poliominolara bölün; N boyutundaki her poliomino, tüm hücrelerinde N sayısını içermelidir. Aynı boyuttaki poliominolar dikey veya yatay olarak bitişik olamaz.';

  @override
  String get fillominoWinTitle => 'IZGARA BÖLÜNDÜ!';

  @override
  String get fillominoWinMessage => 'Mantıkla mükemmel bir şekilde döşendi!';

  @override
  String get hitoriTitle => 'HITORI';

  @override
  String get hitoriSubtitle =>
      'Her satır ve sütundaki yinelenen sayıları gölgeleyin.';

  @override
  String get hitoriHowToPlay =>
      'Hücreleri gölgeleyin; böylece herhangi bir satır veya sütunda hiçbir sayı birden fazla görünmez. Gölgelenmiş hücreler dikey veya yatay olarak bitişik olamaz ve tüm gölgelenmemiş hücreler tek bir bağlantılı grup oluşturmalıdır.';

  @override
  String get hitoriWinTitle => 'HITORI USTASI!';

  @override
  String get hitoriWinMessage => 'Tüm yinelenenleri başarıyla çözdünüz!';

  @override
  String get pathFinderTitle => 'Yol Bulucu';

  @override
  String get pathFinderSubtitle => 'S\'den E\'ye gizli yolu bul.';

  @override
  String get pathFinderWin => 'Yol Tamamlandı!';

  @override
  String get howToPlay => 'Nasıl Oynanır';

  @override
  String get gotIt => 'Anladım';

  @override
  String get akariTitle => 'Akari';

  @override
  String get akariSubtitle => 'Tüm beyaz hücreleri aydınlat';

  @override
  String get akariHowToPlay =>
      'Tüm ızgarayı aydınlatmak için beyaz hücrelere ampuller yerleştir. Ampuller, bir duvara çarpana kadar satır ve sütunlarını aydınlatır. İki ampul birbirine ışık tutamaz. Numaralı duvarlar, komşu hücrelere (yukarı, aşağı, sol, sağ) tam olarak kaç ampul yerleştirilmesi gerektiğini gösterir.';

  @override
  String get akariWinTitle => 'IŞIKLAR YANDI!';

  @override
  String get akariWinMessage => 'Her şey mükemmel bir şekilde aydınlatıldı.';

  @override
  String get arithmeticChainTitle => 'Zincir Hesap';

  @override
  String get arithmeticChainSubtitle => 'Zihninden toplamı hesapla';

  @override
  String get arithmeticChainWinTitle => 'SEVİYE ATLA!';

  @override
  String get arithmeticChainWinMessage => 'Zihinsel hesaplaman çok keskin!';

  @override
  String get arithmeticChainLoseTitle => 'TEKRAR DENE';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return 'Doğru cevap $answer idi.';
  }

  @override
  String get arithmeticChainStart => 'BAŞLAT';

  @override
  String get arithmeticChainNext => 'SONRAKİ';

  @override
  String get attentionalBlinkTitle => 'Dikkat Göz Kırpması';

  @override
  String get attentionalBlinkSubtitleWatch => 'SAYILARI TAKİP ET';

  @override
  String get attentionalBlinkSubtitleInput => 'GÖRDÜĞÜN İKİ SAYIYI GİR';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return '$score hedef vurdun!';
  }

  @override
  String get balanceScaleTitle => 'TERAZİ';

  @override
  String get balanceScaleSubtitle =>
      'Terazilere bakarak son öğenin ağırlığını çıkar.';

  @override
  String get balanceScaleWinTitle => 'DENGELENDİ!';

  @override
  String get balanceScaleWinMessage => 'Ağırlığı doğru tahmin ettin!';

  @override
  String get balanceScaleLoseTitle => 'DENGESİZ';

  @override
  String get balanceScaleLoseMessage =>
      'Doğru dengeyi bulmak için tekrar dene.';

  @override
  String get balanceScaleBack => 'GERİ';

  @override
  String get balanceScaleSubmit => 'GÖNDER';

  @override
  String get binaryPuzzleTitle => 'BİNARY BULMACA';

  @override
  String get binaryPuzzleSubtitle =>
      '0 ve 1 ile doldur. En fazla iki aynı rakam yan yana gelebilir. Her satır ve sütunda eşit sayıda 0 ve 1 olmalıdır.';

  @override
  String get binaryPuzzleWinTitle => 'AFERİN';

  @override
  String get binaryPuzzleWinMessage =>
      'Binary bulmacayı mükemmel mantıkla çözdün!';

  @override
  String get blockEscapeTitle => 'BLOKTAN KAÇIŞ';

  @override
  String get blockEscapeSubtitle =>
      'Birincil bloğun çıkışa ulaşması için yolu temizlemek amacıyla blokları kaydır.';

  @override
  String get blockEscapeWinTitle => 'KAÇIŞ!';

  @override
  String get blockEscapeWinMessage =>
      'Birincil blok için yolu başarıyla temizledin!';

  @override
  String get boxCompletionTitle => 'Kutu Tamamlama';

  @override
  String get boxCompletionSubtitle => 'Hangi küp oluşturulabilir?';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return '$totalTrials denemede $score doğru yaptın!';
  }

  @override
  String get boxCompletionOptions => 'SEÇENEKLER';

  @override
  String get bridgesTitle => 'KÖPRÜLER';

  @override
  String get bridgesSubtitle =>
      'Adaları köprülerle bağla. Her adanın belirli sayıda köprüye ihtiyacı vardır. Köprüler kesişemez.';

  @override
  String get bridgesWinTitle => 'BAĞLANDI!';

  @override
  String get bridgesWinMessage => 'Tüm adaları başarıyla bağladın!';

  @override
  String get calculationSprintTitle => 'HESAP SÜRATİ';

  @override
  String get calculationSprintSubtitle =>
      '60 saniyede mümkün olduğunca çok denklem çöz.';

  @override
  String get calculationSprintGoalReached => 'HEDEFE ULAŞILDI!';

  @override
  String get calculationSprintTimeUp => 'SÜRE DOLDU';

  @override
  String calculationSprintScoreMessage(int score) {
    return 'Mükemmel hesaplama hızı! $score puan aldın.';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return '$score puan aldın. En iyini geçmeye çalış!';
  }

  @override
  String get calculationSprintBest => 'EN İYİ';

  @override
  String get calculationSprintSeconds => '60 SANİYE';

  @override
  String get calculationSprintDescription =>
      'Denklemleri hızlıca çöz.\nYanlış cevaplar 3 saniye düşürür!';

  @override
  String get calculationSprintStart => 'SÜRAT BAŞLAT';

  @override
  String get categoryFluencyTitle => 'Kategori Akıcılığı';

  @override
  String get categoryFluencySubtitle => 'Kategoriye ait öğeleri gir';

  @override
  String get categoryFluencyExpert => 'AKICILIK UZMANI!';

  @override
  String get categoryFluencyTimeUp => 'SÜRE DOLDU!';

  @override
  String get categoryFluencyWinMessage => 'Geniş bir kelime dağarcığın var!';

  @override
  String categoryFluencyFoundMessage(int count) {
    return '$count kelime buldun.';
  }

  @override
  String get categoryFluencyCategoryLabel => 'Kategori:';

  @override
  String get categoryFluencyEnterItem => 'Bir öğe gir...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target kelime';
  }

  @override
  String get changeBlindnessTitle => 'Değişim Körlüğü';

  @override
  String get changeBlindnessSubtitle => 'DEĞİŞEN ÖĞEYİ BUL';

  @override
  String changeBlindnessScore(int score) {
    return 'PUAN: $score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return '$score değişim buldun!';
  }

  @override
  String get choiceRtTitle => 'Seçmeli Tepki Süresi';

  @override
  String get choiceRtSubtitle => 'Aktif kareye mümkün olduğunca hızlı dokun';

  @override
  String choiceRtAvgMessage(String avg) {
    return 'Ortalama tepki süren: ${avg}ms';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return 'Kalan Süre: ${time}s';
  }

  @override
  String choiceRtTaps(int count) {
    return 'Dokunuşlar: $count';
  }

  @override
  String get colorFloodTitle => 'Renk Sel';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return 'Hamleler: $moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => 'SEL BAŞARILI!';

  @override
  String get colorFloodDryLand => 'KURU TOPRAK...';

  @override
  String get colorFloodWinMessage => 'Tüm ızgarayı renge doyurdun!';

  @override
  String get colorFloodLoseMessage => 'Hamlen bitti. Tekrar dene!';

  @override
  String get colorMatchTitle => 'RENK EŞLEŞTİRME';

  @override
  String get colorMatchSubtitle =>
      'Hedef renge mümkün olduğunca yakın eşleşmek için sürgüleri ayarla.';

  @override
  String get colorMatchTarget => 'HEDEF';

  @override
  String get colorMatchYours => 'SENİN';

  @override
  String get colorMatchCheck => 'EŞLEŞMEYİ KONTROL ET';

  @override
  String get colorMatchResult => 'EŞLEŞME SONUCU';

  @override
  String colorMatchAccuracy(String accuracy) {
    return 'Doğruluğun: %$accuracy';
  }

  @override
  String get corsiBlocksTitle => 'CORSI BLOKLARI';

  @override
  String get corsiBlocksSubtitle =>
      'Blokların yanışını izle ve aynı sırayla dokun.';

  @override
  String get corsiBlocksWinTitle => 'UZAYSAL USTA!';

  @override
  String get corsiBlocksLoseTitle => 'UZAYDA KAYBOLDU';

  @override
  String corsiBlocksMessage(int score, int span) {
    return '$score dizi hatırladın! Uzaysal hafıza kapasiten $span seviyesine ulaştı.';
  }

  @override
  String get corsiBlocksWatch => 'DESENİ İZLE';

  @override
  String get corsiBlocksRepeat => 'DESENİ TEKRARLA';

  @override
  String get corsiBlocksExcellent => 'MÜKEMMEL!';

  @override
  String get corsiBlocksSpan => 'KAPASİTE';

  @override
  String get crownTitle => 'TAÇ';

  @override
  String get crownSubtitle =>
      'Her satır, sütun ve renk bölgesine bir taç yerleştir. Taçlar çapraz olarak bile bitişik olamaz.';

  @override
  String get crownCrowned => 'TAÇLANDIRILDI!';

  @override
  String get crownSuccess =>
      'Tüm taçlar mükemmel mantıkla başarıyla yerleştirildi.';

  @override
  String get cryptogramTitle => 'KRİPTOGRAM';

  @override
  String get cryptogramSubtitle =>
      'Gizli mesajı çözmek için harfler ata! Her kodlanmış harf gerçek bir harfi temsil eder.';

  @override
  String get cryptogramBroken => 'KOD ÇÖZÜLDÜ!';

  @override
  String get cryptogramEncrypted => 'ŞİFRELİ';

  @override
  String get cryptogramSuccess => 'Mesajı mükemmel bir şekilde çözdün.';

  @override
  String get cryptogramTryAgain => 'Şifreyi kırmak için tekrar dene.';

  @override
  String get digitSpanReverseTitle => 'Ters Sayı Dizisi';

  @override
  String get digitSpanReverseSubtitleMemorize => 'Rakamları ezberle';

  @override
  String get digitSpanReverseSubtitleEnter => 'Rakamları TERS sırayla gir';

  @override
  String get digitSpanReverseWinTitle => 'SEVİYE ATLA!';

  @override
  String get digitSpanReverseWinMessage => 'Çalışma hafızan etkileyici!';

  @override
  String get digitSpanReverseLoseTitle => 'TEKRAR DENE';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return 'Doğru ters dizi $sequence idi.';
  }

  @override
  String get dividedAttentionTitle => 'Bölünmüş Dikkat';

  @override
  String get dividedAttentionSubtitle =>
      'YILDIZ ⭐ için SOLA dokun | KIRMIZI 🔴 için SAĞA dokun';

  @override
  String get dividedAttentionGameOverTitle => 'ODAK BOZULDU';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return 'Çoklu görev zordur! Puanın $score idi.';
  }

  @override
  String dividedAttentionScore(int score) {
    return 'PUAN: $score';
  }

  @override
  String get doubleNBackTitle => 'Çift N-Geri';

  @override
  String doubleNBackSubtitle(int n) {
    return 'Uyaranları $n adım geriyle eşleştir';
  }

  @override
  String get doubleNBackGameOverTitle => 'OYUN BİTTİ';

  @override
  String doubleNBackGameOverMessage(int score) {
    return 'Çift N-Geri oyununda $score puan aldın!';
  }

  @override
  String doubleNBackScore(int score) {
    return 'Puan: $score';
  }

  @override
  String get doubleNBackPositionMatch => 'KONUM EŞLEŞTİRME';

  @override
  String get doubleNBackLetterMatch => 'HARF EŞLEŞTİRME';

  @override
  String get faceNameAssociationTitle => 'Yüz-İsim';

  @override
  String get faceNameAssociationSubtitleStudy => 'Her yüz için ismi ezberle';

  @override
  String get faceNameAssociationSubtitleTest => 'Bu kim?';

  @override
  String get faceNameAssociationPerfect => 'MÜKEMMEL!';

  @override
  String get faceNameAssociationGameOver => 'OYUN BİTTİ';

  @override
  String get faceNameAssociationWinMessage =>
      'Yüzler ve isimler için harika bir hafızan var!';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return '$total üzerinden $correct doğru yaptın.';
  }

  @override
  String get faceNameAssociationStartTest => 'TESTİ BAŞLAT';

  @override
  String get flankerTestWinTitle => 'LAZER ODAK!';

  @override
  String get flankerTestLoseTitle => 'DİKKAT DAĞILDI';

  @override
  String flankerTestScoreMessage(int score) {
    return '$score doğru yaptın!';
  }

  @override
  String get flankerTestTitle => 'FLANKER TESTİ';

  @override
  String get flankerTestSubtitle =>
      'Yandaki okları görmezden gelerek merkezdeki okun yönünü belirt.';

  @override
  String get flankerTestLeft => 'SOL';

  @override
  String get flankerTestRight => 'SAĞ';

  @override
  String get fractionMatchTitle => 'Kesir Eşleştirme';

  @override
  String get fractionMatchSubtitle => 'Görseli kesriyle eşleştir';

  @override
  String get fractionMatchLoseTitle => 'KESİR UYUMSUZLUĞU';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return 'Doğru cevap $correctAnswer idi.';
  }

  @override
  String get goNoGoTitle => 'Git / Gitme';

  @override
  String get goNoGoSubtitle => 'Yeşil için dokun, Kırmızıyı GEÇ!';

  @override
  String get goNoGoLoseTitle => 'TEPKİ DURDURULDU';

  @override
  String get goNoGoLoseMessage => 'Engelleyici kontrolün test ediliyor!';

  @override
  String get goNoGoTapAnywhere => 'BAŞLAMAK İÇİN HERHANGİ BİR YERE DOKUN';

  @override
  String get groceryListTitle => 'Alışveriş Listesi';

  @override
  String get groceryListSubtitleMemorize => 'Öğeleri ve kategorilerini ezberle';

  @override
  String get groceryListSubtitleTest => 'Bu öğe hangi kategoriye aitti?';

  @override
  String get groceryListWinTitle => 'ALIŞVERİŞ GURUSU!';

  @override
  String get groceryListLoseTitle => 'BİR ŞEY Mİ UNUTTUN?';

  @override
  String groceryListScoreMessage(int score) {
    return 'Alışveriş Listesi oyununda $score puan aldın!';
  }

  @override
  String get groceryListReady => 'HAZIRIM';

  @override
  String get groceryListWhereBelong => 'BU NEREYE AİT?';

  @override
  String get hueSortTitle => 'TON SIRALAMA';

  @override
  String get hueSortSubtitle =>
      'Köşe renkleri arasında pürüzsüz bir geçiş oluşturmak için karoları değiştir. Noktalar sabit karoları gösterir.';

  @override
  String get hueSortWinTitle => 'MÜKEMMEL GRADYAN!';

  @override
  String get hueSortWinMessage =>
      'Renk spektrumunu mükemmel bir şekilde sıraladın!';

  @override
  String hueSortWrongTiles(int count) {
    return 'Yanlış konumdaki karolar: $count';
  }

  @override
  String get kenkenTitle => 'KenKen';

  @override
  String get kenkenWinTitle => 'DAHİ!';

  @override
  String get kenkenLoseTitle => 'OYUN BİTTİ';

  @override
  String get kenkenWinMessage => 'KenKen bulmacasını çözdün!';

  @override
  String get kenkenLoseMessage =>
      'Satır/sütun ve kafes kurallarını kontrol et.';

  @override
  String kenkenSubtitle(int size) {
    return 'Satır/sütunlarda tekrarlamadan 1-$size arasını doldur';
  }

  @override
  String get letterCancellationTitle => 'Harf İptal';

  @override
  String get letterCancellationTitleFull => 'Harf İptali';

  @override
  String letterCancellationScoreMessage(int score) {
    return '$score harf buldun!';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return 'Tüm \"$target\" harflerini bul';
  }

  @override
  String get letterCancellationFound => 'BULUNDU';

  @override
  String get letterCancellationTime => 'SÜRE';

  @override
  String get lightsOutTitle => 'IŞIKLARI KAPAT';

  @override
  String get lightsOutSubtitle =>
      'Bir karoya dokunmak onu ve komşularını değiştirir. Çözmek için tüm ışıkları kapat.';

  @override
  String get lightsOutWinTitle => 'BULMACA ÇÖZÜLDÜ!';

  @override
  String get lightsOutWinMessage => 'Tüm ışıkları başarıyla kapattın!';

  @override
  String get symmetryTitle => 'Simetri';

  @override
  String get symmetrySubtitle => 'Soldaki deseni sağdaki boş ızgaraya yansıt.';

  @override
  String get semanticLinkTitle => 'Anlamsal Bağ';

  @override
  String get semanticLinkSubtitle => 'Üçünü de birbirine bağlayan kelimeyi bul';

  @override
  String get reflexTapTitle => 'Refleks Dokunuşu';

  @override
  String get visualStatisticalLearningTitle => 'Oyun Bitti';

  @override
  String get orbitTapTitle => 'Yörünge Dokunuşu';

  @override
  String get orbitTapSubtitle => 'Toplar kapıyla hizalandığında dokun';

  @override
  String get schulteTableTitle => 'Harika Odak!';

  @override
  String get multipleObjectTrackingTitle => 'Nesne Takipçisi';

  @override
  String get multipleObjectTrackingSubtitle =>
      'Vurgulanan nesneleri izle. Hareket ederken onları takip et, sonra onları seç.';

  @override
  String get sdmtTitle => 'Sdmt Testi';

  @override
  String get sdmtSubtitle =>
      'Gösterilen sembolün rakamını bulmak için yukarıdaki anahtarı kullan.';

  @override
  String get memoryMatrixTitle => 'Hedefe Ulaşıldı!';

  @override
  String get memoryMatrixSubtitle => 'Deseni ezberle ve karolara dokun.';

  @override
  String get mentalAbacusTitle => 'Abaküs Ustası!';

  @override
  String get mentalAbacusSubtitle => 'Soroban kullanarak çöz';

  @override
  String get spellingSprintTitle => 'Yazım Sürati';

  @override
  String get spellingSprintSubtitle =>
      'Zamana karşı yarışarak mümkün olduğunca çok kelimeyi doğru yaz.';

  @override
  String get stopSignalTitle => 'Dur Sinyali';

  @override
  String get stopSignalSubtitle =>
      'Ok yönüne dokun, ancak ok KIRMIZIYA dönerse hemen DUR.';

  @override
  String get staircaseMemoryTitle => 'Merdiven Hafızası';

  @override
  String get vigilanceTaskTitle => 'Uyanıklık Görevi';

  @override
  String get vigilanceTaskSubtitle =>
      'Yelkovan bir pozisyon atladığında düğmeye dokun';

  @override
  String get logicalSyllogismsTitle => 'Mantıksal Kıyaslar';

  @override
  String get logicalSyllogismsSubtitle => 'Sonuç mantıksal olarak geçerli mi?';

  @override
  String get mathPathTitle => 'Matematik Yolu';

  @override
  String get mathPathSubtitle => 'Tam olarak hedef toplama ulaşan bir yol bul.';

  @override
  String get sternbergTaskTitle => 'Sternberg Görevi';

  @override
  String get sternbergTaskMemorize => 'Harfleri ezberle';

  @override
  String get sternbergTaskWasLetterSet => 'Bu harf kümede var mıydı?';

  @override
  String sternbergTaskScore(int score) {
    return 'Sternberg Görevi oyununda $score puan aldın!';
  }

  @override
  String get verbalAnalogiesTitle => 'Analoji Ustası!';

  @override
  String get verbalAnalogiesSubtitle => 'İlişkiyi tamamla';

  @override
  String get typingSpeedTitle => 'Yazma Hızı';

  @override
  String get typingSpeedSubtitle =>
      'Gösterilen ifadeyi mümkün olduğunca hızlı ve hatasız yaz!';

  @override
  String get wordLadderTitle => 'Kelime Merdiveni';

  @override
  String get wordLadderSubtitle =>
      'Harfleri birer birer değiştirerek kelimeleri birbirine bağla.';

  @override
  String get tangleFixTitle => 'Çözüldü!';

  @override
  String get tangleFixSubtitle => 'Çizgileri hiçbiri kesişmeyecek şekilde çöz';

  @override
  String get oddRotationTitle => 'Tuhaf Döndürme';

  @override
  String get oddRotationSubtitle =>
      'Bunlardan biri yansıtılmış. Bulabilir misin?';

  @override
  String get towerOfLondonTitle => 'Londra Kulesi';

  @override
  String get towerOfLondonSubtitle => 'Hedef yapılandırmayla eşleştir';

  @override
  String get symbolicFlankerTitle => 'Sembolik Flanker';

  @override
  String get symbolicFlankerSubtitle => 'Merkez sembole odaklan';

  @override
  String get stroopTestTitle => 'Stroop Testi';

  @override
  String get stroopTestSubtitle =>
      'Gösterilen kelimenin mürekkep rengini tanımla. Kelimenin gerçekte ne dediğini görmezden gel!';

  @override
  String get wisconsinCardSortingTitle => 'Oyun Bitti';

  @override
  String get wisconsinCardSortingSubtitle =>
      'KARTI YUKARIDAKİ DÖRT KARTTAN BİRİYLE EŞLEŞTİR';

  @override
  String get nBackTitle => 'N-Geri Testi';

  @override
  String get nBackSubtitle =>
      'Mevcut harf 2 adım öncekiyle eşleşiyorsa EŞLEŞTİR\'e dokun.';

  @override
  String get rhythmMasterTitle => 'Ritim Ustası';

  @override
  String get rhythmMasterSubtitle => 'Nabızla senkronize olarak dokun';

  @override
  String get pixelMimicTitle => 'Piksel Taklit';

  @override
  String get targetNumberTitle => 'Hedef 24';

  @override
  String targetNumberSubtitle(int target) {
    return '$target sayısına ulaşmak için 4 sayıyı da kullan';
  }

  @override
  String get mirrorTracingTitle => 'Mükemmel Çizim!';

  @override
  String get mirrorTracingSubtitle => 'Yıldızı çiz! Kontroller YANSITILMIŞTIR.';

  @override
  String get wordSurgeTitle => 'Kelime Dalgası';

  @override
  String get wordSurgeSubtitle => 'Eş Anlamlılar ve Zıt Anlamlılar';

  @override
  String get perspectiveTakingTitle => 'Bakış Açısı Alma';

  @override
  String get perspectiveTakingTopDownView => 'ÜSTTEN GÖRÜNÜM';

  @override
  String get perspectiveTakingChoosePerspective => 'BAKIŞ AÇISINI SEÇ';

  @override
  String get perspectiveTakingCongrats =>
      'Uzaysal ilişkiler için keskin bir gözün var.';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return 'Hangi görünüm $targetDirName yönündendir?';
  }

  @override
  String get paperFoldingTitle => 'Katlanmış Mükemmellik!';

  @override
  String get paperFoldingSubtitle => 'Açıldığında nasıl görünecek?';

  @override
  String get waterSortTitle => 'Aferin!';

  @override
  String get waterSortSubtitle =>
      'Renkleri her tüp tek bir renk içerecek şekilde sırala.';

  @override
  String get numericalEstimationTitle => 'Sayısal Tahmin';

  @override
  String get numericalEstimationSubtitle => 'En yakın cevabı hızlıca seç!';

  @override
  String get lockPatternTitle => 'Kilit Deseni';

  @override
  String get lockPatternSubtitle =>
      'Gizli deseni bul. Her tahmin konum ve noktalar hakkında geri bildirim verir.';

  @override
  String get primeHunterTitle => 'Asal Avcısı';

  @override
  String get primeHunterSubtitle =>
      'ASAL için SOLA kaydır | BİLEŞİK için SAĞA kaydır';

  @override
  String get tracePathTitle => 'Yolu Takip Et';

  @override
  String get tracePathSubtitle =>
      'Hedef yolu mümkün olduğunca yakından takip et';

  @override
  String get ruleSwitcherTitle => 'Kural Değiştirici';

  @override
  String get ruleSwitcherSubtitle => 'Mevcut kuralı uygula';

  @override
  String get choiceReactionTimeTitle => 'Seçmeli Tepki Süresi';

  @override
  String get pathRecallTitle => 'Yol Hatırlama';

  @override
  String get switchTaskTitle => 'Görev Değiştirme';

  @override
  String get switchTaskSubtitle =>
      'Kurala dikkat et! Şekil eşleştirme ve renk eşleştirme arasında değişecek.';

  @override
  String get mentalRotationTitle => 'Zihinsel Döndürme';

  @override
  String get mentalRotationSubtitle =>
      'Bu şekiller sadece döndürülmüş aynı şekiller mi?';

  @override
  String get missingOperatorTitle => 'Operatör Karışımı';

  @override
  String get missingOperatorSubtitle =>
      'Denklemi tamamlamak için boşlukları doldur';

  @override
  String get wordMastermindTitle => 'Kelime Mastermind';

  @override
  String get wordMastermindSubtitle =>
      '4 harfli kodu kır! Boğalar (B) tam yerinde, İnekler (C) yanlış yerdedir.';

  @override
  String get simonSequenceTitle => 'Dizi';

  @override
  String get symbolLogicTitle => 'Sembol Mantığı';

  @override
  String get symbolLogicSubtitle =>
      'Her sembolün değerini bulmak için görsel denklemleri çöz. Son denklemin sonucu nedir?';

  @override
  String get silhouetteMatchTitle => 'Eşleşti!';

  @override
  String get silhouetteMatchSubtitle => 'Hangi silüet bu nesneyle eşleşiyor?';

  @override
  String get operationSpanTitle => 'İşlem Kapasitesi';

  @override
  String get operationSpanMathPhase => 'Denklem doğru mu?';

  @override
  String get operationSpanLetterPhase => 'Harfi hatırla';

  @override
  String get operationSpanRecallPhase => 'Harfleri sırayla hatırla';

  @override
  String get operationSpanRoundComplete => 'Tur Tamamlandı!';

  @override
  String operationSpanScore(int score) {
    return 'İşlem Kapasitesi oyununda $score puan aldın!';
  }

  @override
  String get slidePuzzleTitle => 'Kaydırmalı Bulmaca';

  @override
  String get slidePuzzleNewGame => 'YENİ OYUN';

  @override
  String get slidePuzzleInstructions =>
      'Karoları boş alana kaydırarak sayısal sıraya göre düzenle.';

  @override
  String get slidePuzzleTileSlider => 'KARO KAYDIRICI';

  @override
  String get slidePuzzleCongrats => 'Tüm karoları başarıyla sıraladın.';

  @override
  String get visualSearchTitle => 'Görsel Arama';

  @override
  String get visualSearchSubtitle => 'Izgaradaki benzersiz sembolü bul';

  @override
  String get trailMakingTitle => 'İz Sürme';

  @override
  String get trailMakingSubtitle =>
      'Sayıları mümkün olduğunca hızlı bir şekilde sırayla (1 -> 2 -> 3...) bağla.';

  @override
  String get matrixReasoningTitle => 'Matris Muhakemesi';

  @override
  String get matrixReasoningSubtitle => '3x3\'lük ızgaradaki deseni tamamla';

  @override
  String get tentsAndTreesTitle => 'Çadırlar ve Ağaçlar';

  @override
  String get tentsAndTreesSubtitle =>
      'Ağaçların yanına çadırlar yerleştir. Sayılar her satır/sütunda kaç çadır olduğunu gösterir. Çadırlar birbirine değemez.';

  @override
  String get quickMathTitle => 'Hızlı Matematik';

  @override
  String get magicSquaresTitle => 'Sihirli Kare';

  @override
  String magicSquaresSubtitle(int targetSum) {
    return 'Her satır, sütun ve köşegenin toplamı $targetSum olmalıdır';
  }

  @override
  String get objectShuffleTitle => 'Nesne Karıştırma';

  @override
  String get pipesTitle => 'Borular';

  @override
  String get pipesSubtitle => 'Eşleşen renkli noktaları borularla bağla.';

  @override
  String get oddOneOutTitle => 'Farklı Olanı Bul';

  @override
  String get oddOneOutSubtitle => 'Farklı renkteki karoyu bul.';

  @override
  String get einsteinRiddleTitle => 'EINSTEIN BİLMECESİ';

  @override
  String get einsteinRiddleSubtitle =>
      'Her evin özelliklerini çıkarmak için ipuçlarını kullan.';

  @override
  String get einsteinRiddleHowToPlay =>
      'Her evin kendine özgü özellikleri (renk, uyruk, evcil hayvan vb.) vardır. Izgarayı doldurmak ve tam çözümü bulmak için verilen ipuçlarını kullan.';

  @override
  String get einsteinRiddleColor => 'Renk';

  @override
  String get einsteinRiddleNationality => 'Uyruk';

  @override
  String get einsteinRiddleDrink => 'İçecek';

  @override
  String get einsteinRiddlePet => 'Evcil Hayvan';

  @override
  String get einsteinRiddleSmoke => 'Tütün';

  @override
  String get einsteinRiddleHouse => 'Ev';

  @override
  String get mirrorImageTitle => 'Ayna Görüntüsü';

  @override
  String get mirrorImageSubtitle => 'Doğru ayna yansımasını tanımla.';

  @override
  String get mirrorImageHowToPlay =>
      'Şekle bak ve sunulan seçenekler arasından doğru ayna yansımasını seç.';

  @override
  String get mentalMappingTitle => 'Zihinsel Haritalama';

  @override
  String get mentalMappingSubtitle => 'Yönergeleri takip et ve hedefi bul.';

  @override
  String get mentalMappingHowToPlay =>
      'Sana bir dizi yön gösterilecek (Kuzey, Güney, Doğu, Batı). Izgaranın merkezinden başlayarak bu adımları zihinsel olarak takip et ve son hedefi seç.';

  @override
  String get memoryPalaceTitle => 'Hafıza Sarayı';

  @override
  String get memoryPalaceSubtitle =>
      'Hangi kelimenin hangi konumda olduğunu hatırla.';

  @override
  String get memoryPalaceHowToPlay =>
      'Bir ızgaradaki farklı konumlarda bir dizi kelime görünecek. Konumlarını ezberle. Ardından, kelimeleri orijinal konumlarına geri yerleştirmen istenecek.';

  @override
  String get countingSheepTitle => 'Koyun Sayma';

  @override
  String get countingSheepSubtitle => 'Kaç koyun gördün?';

  @override
  String get countingSheepHowToPlay =>
      'Koyunlar ekrandan hızla geçecek. Geçerken onları say ve sonunda toplam sayıyı gir.';

  @override
  String get faceTraitAssociationTitle => 'Yüz-Özellik';

  @override
  String get faceTraitAssociationSubtitle => 'Her yüz için özellikleri ezberle';

  @override
  String get faceTraitAssociationHowToPlay =>
      'Sana isim, meslek ve hobi ile birlikte birkaç yüz gösterilecek. Bu ilişkilendirmeleri ezberle. Daha sonra her yüz için belirli özellikleri hatırlaman istenecek.';

  @override
  String get mentalCalendarTitle => 'Zihinsel Takvim';

  @override
  String get mentalCalendarSubtitle => 'Haftanın gününü hesapla';

  @override
  String get mentalCalendarHowToPlay =>
      'Rastgele bir tarih gösterilecek. Haftanın hangi gününe denk geldiğini belirlemek için zihinsel hesaplama (veya Kıyamet Günü algoritması) kullan.';

  @override
  String get vocabularyBuilderTitle => 'Kelime Dağarcığı Geliştirici';

  @override
  String get vocabularyBuilderSubtitle =>
      'Zaman baskısı altında eş anlamlı ve zıt anlamlıları eşleştir.';

  @override
  String get vocabularyBuilderHowToPlay =>
      'Sana bir hedef kelime ve bir ilişki (Eş Anlamlı veya Zıt Anlamlı) gösterilecek. Seçenekler arasından ilişkiyle eşleşen doğru kelimeyi seç. Hızlı ol, zaman daralıyor!';

  @override
  String get correct => 'DOĞRU';

  @override
  String get incorrect => 'YANLIŞ';

  @override
  String get grammarPoliceTitle => 'Dilbilgisi Polisi';

  @override
  String get grammarPoliceSubtitle =>
      'Cümlenin dilbilgisi açısından doğru mu yoksa hatalı mı olduğunu belirleyin.';

  @override
  String get grammarPoliceHowToPlay =>
      'Ekranın ortasında bir cümle belirecektir. Dilbilgisi açısından doğru mu yoksa hata mı içerdiğine karar verin. Sorun yoksa \'DOĞRU\'ya, hata fark ederseniz \'YANLIŞ\'a dokunun. Tüm canlarınızı kaybetmeyin!';

  @override
  String get reverseStroopTitle => 'Ters Stroop';

  @override
  String get reverseStroopSubtitle =>
      'Odağın değiştirildiği bir Stroop testi varyasyonu.';

  @override
  String get reverseStroopHowToPlay =>
      'Talimata dikkat et! Eğer \'METİN\' diyorsa kelimenin anlamını eşleştir. Eğer \'RENK\' diyorsa mürekkep rengini eşleştir. Odaklanmanı test etmek için kurallar sık sık değişecektir.';

  @override
  String get game2048Instruction =>
      'BİRLEŞTİRMEK İÇİN HERHANGİ BİR YÖNE KAYDIR';

  @override
  String get fibonacciMergeTitle => 'Fibonacci Birleştirme';

  @override
  String get fibonacciMergeSubtitle =>
      'Ardışık Fibonacci sayılarını (1, 1, 2, 3, 5, 8, 13...) birleştir.';

  @override
  String get sequenceSleuthTitle => 'Dizi Dedektifi';

  @override
  String get sequenceSleuthSubtitle =>
      'Matematiksel dizideki eksik sayıyı bul.';

  @override
  String get divisibilityDashTitle => 'Bölünebilme Sürati';

  @override
  String get divisibilityDashSubtitle =>
      'Verilen sayı için tüm tek basamaklı bölenlere (2-9) dokun.';

  @override
  String get percentagePeakTitle => 'Yüzde Zirvesi';

  @override
  String get percentagePeakSubtitle =>
      'Zihinsel yüzde hesaplamalarını hızlıca çöz.';

  @override
  String get vennNumbersTitle => 'Venn Sayıları';

  @override
  String get vennNumbersSubtitle =>
      'Sayıları doğru Venn şeması bölgelerine ayır.';

  @override
  String get commonDenominatorTitle => 'Ortak Payda';

  @override
  String get commonDenominatorSubtitle =>
      'En Büyük Ortak Böleni veya En Küçük Ortak Katı bul.';

  @override
  String get angleFinderTitle => 'Açı Bulucu';

  @override
  String get angleFinderSubtitle =>
      'Geometrik problemdeki eksik açıyı hesapla.';

  @override
  String get sumSnakeTitle => 'Toplam Yılanı';

  @override
  String get sumSnakeSubtitle =>
      'Hedef toplama ulaşmak için bitişik sayıları bağla.';

  @override
  String get baseShiftTitle => 'TABAN DEĞİŞTİRME';

  @override
  String get baseShiftSubtitle => 'Ondalık olarak çöz';

  @override
  String get baseShiftDescription =>
      'Denklemi çöz ve cevabı ondalık (Taban 10) olarak yaz.';

  @override
  String get baseShiftEquation => 'DENKLEM';

  @override
  String get baseShiftHint => 'Ondalık sonucu gir...';

  @override
  String get baseShiftCorrect => 'Doğru!';

  @override
  String get baseShiftIncorrect => 'Yanlış!';

  @override
  String get baseShiftSubmit => 'GÖNDER';

  @override
  String get baseShiftQuickGuide => 'Hızlı Rehber:';

  @override
  String get baseShiftBinary => 'İkilik (bin): Taban 2 (0, 1)';

  @override
  String get baseShiftHex => 'On altılık (0x): Taban 16 (0-9, A-F)';

  @override
  String get baseShiftDecimal => 'Ondalık (dec): Taban 10 (0-9)';

  @override
  String get baseShiftWinTitle => 'MATEMATİK SİHİRBAZI!';

  @override
  String get baseShiftWinMessage =>
      '5 taban değiştirme denklemini doğru çözdün!';

  @override
  String get blockCount3DTitle => '3D Blok Sayma';

  @override
  String get blockCount3DSubtitle =>
      'DÖNDÜRMEK İÇİN SÜRÜKLE • GİZLİ BLOKLARI SAY';

  @override
  String get blockCount3DHowMany => 'KAÇ BLOK VAR?';

  @override
  String get blockCount3DSubmitGuess => 'TAHMİNİ GÖNDER';

  @override
  String get blockCount3DNotQuite =>
      'Pek değil! Tekrar saymak için döndürmeyi dene.';

  @override
  String get blockCount3DExcellent => 'MÜKEMMEL';

  @override
  String blockCount3DWinMessage(int count) {
    return 'Tüm $count bloğu doğru tanımladın!';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '1. Blok yığınını döndürmek için parmağını 3D görünüm üzerinde sürükle.\n\n2. Yığındaki tüm blokları say.\n\n3. Unutma: Havada duran bir bloğun altında destek blokları olmalıdır (gizli bloklar!).\n\n4. Cevabını giriş alanına yaz ve kontrol etmek için \"TAHMİNİ GÖNDER\"e dokun.';

  @override
  String get alphabetSudokuTitle => 'ALFABE SUDOKU';

  @override
  String get alphabetSudokuSubtitle =>
      'Her satır, sütun ve kutu A-I harflerini içerecek şekilde ızgarayı doldur.';

  @override
  String get alphabetSudokuWinTitle => 'SUDOKU ÇÖZÜLDÜ!';

  @override
  String get alphabetSudokuWinMessage => 'Harika! Harflerde ustalaştın.';

  @override
  String get classicMazeTitle => 'Klasik Labirent';

  @override
  String get classicMazeSubtitle =>
      'KEŞFET VE ÇÖZ • HER OYUNDA YENİ BİR LABİRENT';

  @override
  String get classicMazeWinTitle => 'LABİRENT TAMAMLANDI';

  @override
  String classicMazeWinMessage(int count) {
    return 'İnanılmaz navigasyon! Labirenti $count hamlede çözdün.';
  }

  @override
  String get classicMazeMoves => 'HAMLE: ';

  @override
  String get classicMazeHowToPlayDescription =>
      '1. Parlayan sarı bilyeyi (oyuncu) sağ alttaki yeşil portala (çıkış) ulaştır.\n\n2. Hareket etmek için labirent üzerinde kaydırma yap, fiziksel klavye ok tuşlarını veya alttaki ok takımı düğmelerini kullan.\n\n3. Mor iz, keşfettiğin yolu gösterir. İzinin üzerinden geri giderek onu dinamik olarak sil!';

  @override
  String get conjunctionSearchTitle => 'Birleşik Arama';

  @override
  String get conjunctionSearchSubtitle => 'Dikkat Odağı ve Özellik Birleşimi';

  @override
  String get conjunctionSearchWinTitle => 'ZAFER';

  @override
  String get conjunctionSearchWinMessage =>
      'Mükemmel dikkat odağı ile tüm hedefleri buldun!';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      'Talimatlarda belirli bir hedef şekil ve renk kombinasyonu gösterilecek. Onu yoğun ızgarada mümkün olduğunca hızlı bul ve dokun. Çeldirici şekiller ya aynı rengi ya da aynı şekli paylaşır, bu yüzden dikkatli bak!';

  @override
  String get conjunctionSearchRound => 'TUR: ';

  @override
  String get conjunctionSearchScore => 'PUAN: ';

  @override
  String get conjunctionSearchFind => 'BUL: ';

  @override
  String get shapeCircle => 'DAİRE';

  @override
  String get shapeSquare => 'KARE';

  @override
  String get shapeTriangle => 'ÜÇGEN';

  @override
  String get shapeStar => 'YILDIZ';

  @override
  String get colorRedLabel => 'KIRMIZI';

  @override
  String get colorBlueLabel => 'MAVİ';

  @override
  String get colorGreenLabel => 'YEŞİL';

  @override
  String get colorAmberLabel => 'KEHRİBAR';

  @override
  String get cubeNetFoldTitle => 'Küp Açınımı Katlama';

  @override
  String get cubeNetFoldSubtitle => 'UYGUN 3D KÜP SEÇENEĞİNİ BELİRLE';

  @override
  String get cubeNetFoldWinTitle => 'DOĞRU';

  @override
  String get cubeNetFoldWinMessage =>
      'Mükemmel 3D uzaysal katlama mantığın var!';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '1. Üstteki açılmış 2D ağa bak.\n\n2. Ağı zihninde 3D bir küp şeklinde katla.\n\n3. Aşağıdaki seçeneklerden, o katlanmış küpün geçerli bir 3D perspektifini temsil edeni seç.\n\n4. Dikkatli ol: Ağdaki zıt yüzler 3D\'de bitişik olamaz ve bitişik yüzlerin sırası eşleşmelidir!';

  @override
  String get cubeNetFoldUnfoldedNet => 'AÇILMIŞ 2D AĞ';

  @override
  String get cubeNetFoldWhichMatches => 'HANGİ KÜP EŞLEŞİYOR?';

  @override
  String get cubeNetFoldIncorrect =>
      'Yanlış katlama mantığı! Sıfırla\'ya dokun veya seçimini değiştir.';

  @override
  String get cubeNetFoldSubmitChoice => 'SEÇİMİ GÖNDER';

  @override
  String get cubeNetFoldFailed => 'BAŞARISIZ (SIFIRLA\'YA DOKUN)';

  @override
  String get faceTraitAssociationMemorize => '4 KİŞİYİ DE EZBERLE';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return '$total KİŞİDEN $current.';
  }

  @override
  String get faceTraitAssociationWhatOccupation => 'MESLEKLERİ NEDİR?';

  @override
  String get faceTraitAssociationWhatHobby => 'HOBİLERİ NEDİR?';

  @override
  String get faceTraitAssociationWinTitle => 'HAFIZA USTASI!';

  @override
  String get faceTraitAssociationLoseTitle => 'OYUN BİTTİ';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return '$total üzerinden $correct doğru yaptın.';
  }

  @override
  String get topologyTitle => 'TOPOLOJİ';

  @override
  String get topologySubtitle =>
      'Bu şekiller topolojik olarak eşdeğer mi? (Biri kesilmeden veya yapıştırılmadan diğerine dönüştürülebilir mi?)';

  @override
  String get topologyWinTitle => 'GEOMETRİ DAHİSİ!';

  @override
  String get topologyWinMessage => '10 topolojik çifti doğru tanımladın!';

  @override
  String get topologyScore => 'PUAN: ';

  @override
  String get semanticDistanceTitle => 'Anlamsal Mesafe';

  @override
  String get semanticDistanceSubtitle =>
      'Kelimeler arasındaki kavramsal mesafeyi ölçün';

  @override
  String get oxymoronHuntTitle => 'Oksimoron Avı';

  @override
  String get oxymoronHuntSubtitle =>
      'Izgaradaki çelişkili kelimeleri eşleştirin';

  @override
  String get portmanteauSplitTitle => 'Birleşik Kelime Ayrımı';

  @override
  String get portmanteauSplitSubtitle =>
      'Birleşik bir kelimenin köken kelimelerini belirleyin';

  @override
  String get chainReactionTitle => 'Zincirleme Reaksiyon';

  @override
  String get chainReactionSubtitle =>
      'Örtüşen harfleri kullanarak kelimeleri bağlayın';

  @override
  String get rhymeMasterTitle => 'Kafiye Ustası';

  @override
  String get rhymeMasterSubtitle =>
      'Hedefle kafiyeli olan kelimeleri belirleyin';

  @override
  String get definitionDashTitle => 'Tanım Koşusu';

  @override
  String get definitionDashSubtitle => 'Doğru kelimeyi tanımıyla eşleştirin';

  @override
  String get syllableStackTitle => 'Hece Yığını';

  @override
  String get syllableStackSubtitle =>
      'Tam kelimeler oluşturmak için heceleri istifleyin';

  @override
  String get sentenceUnscrambleTitle => 'Cümle Çözme';

  @override
  String get sentenceUnscrambleSubtitle =>
      'Geçerli bir cümle oluşturmak için kelimeleri yeniden sıralayın';

  @override
  String get grammarSortTitle => 'Dilbilgisi Sınıflandırması';

  @override
  String get grammarSortSubtitle =>
      'Kelimeleri kelime türlerine göre kategorize edin';

  @override
  String get vowelReconstructTitle => 'Ünlü Harf İnşası';

  @override
  String get vowelReconstructSubtitle =>
      'Cümledeki eksik ünlü harfleri doldurun';

  @override
  String get consonantReconstructTitle => 'Ünsüz Harf İnşası';

  @override
  String get consonantReconstructSubtitle =>
      'Cümledeki eksik ünsüz harfleri doldurun';

  @override
  String get homophoneHuntTitle => 'Eşsesli Avı';

  @override
  String get homophone_huntSubtitle => 'Doğru yazılmış eşsesliyi seçin';

  @override
  String get silentLetterSearchTitle => 'Sessiz Harf Araması';

  @override
  String get silentLetterSearchSubtitle =>
      'Verilen kelimelerdeki sessiz harfleri belirleyin';

  @override
  String get palindromeBuilderTitle => 'Palindrom Oluşturucu';

  @override
  String get palindromeBuilderSubtitle =>
      'En az harf ekleyerek bir palindrom oluşturun';

  @override
  String get phoneticGuessTitle => 'Fonetik Tahmin';

  @override
  String get phoneticGuessSubtitle =>
      'Kelimeyi fonetik yazılışından belirleyin';

  @override
  String get spoonerismSolverTitle => 'Spoonerism Çözücü';

  @override
  String get spoonerismSolverSubtitle =>
      'İfade için doğru spoonerism i belirleyin';

  @override
  String get etymonOddballTitle => 'Etimolojik Aykırı';

  @override
  String get etymonOddballSubtitle => 'Aynı kökü paylaşmayan kelimeyi bulun';

  @override
  String get etymologyOriginTitle => 'Etimolojik Köken';

  @override
  String get etymologyOriginSubtitle =>
      'Ödünç kelimenin köken dilini tahmin edin';

  @override
  String get affixFactoryTitle => 'Ek Fabrikası';

  @override
  String get affixFactorySubtitle =>
      'Önekler ve sonekler kullanarak geçerli kelimeler oluşturun';

  @override
  String get cognateCatchTitle => 'Akraba Kelime Yakalama';

  @override
  String get cognateCatchSubtitle =>
      'Gerçek akraba kelimeler ile sahte dostları ayırt edin';

  @override
  String get compoundConnectTitle => 'Bileşik Bağlantı';

  @override
  String get compoundConnectSubtitle =>
      'Bileşik bir kelime oluşturmak için iki kelimeyi birleştirin';

  @override
  String get pangramSprintTitle => 'Pangram Koşusu';

  @override
  String get pangramSprintSubtitle =>
      'Alfabenin her harfini kullanarak bir cümle kurun';

  @override
  String get anagramDefinitionTitle => 'Anagram Tanımı';

  @override
  String get anagramDefinitionSubtitle => 'Tanımına göre anagramı çözün';

  @override
  String get letterBridgeTitle => 'Harf Köprüsü';

  @override
  String get letterBridgeSubtitle =>
      'İki kelimeyi birbirine bağlayan eksik harfi bulun';

  @override
  String get letterFrequencyScanTitle => 'Harf Frekansı Taraması';

  @override
  String get letterFrequencyScanSubtitle =>
      'Metinde bir harfin kaç kez geçtiğini sayın';

  @override
  String get oneLetterShiftTitle => 'Tek Harf Değişimi';

  @override
  String get oneLetterShiftSubtitle =>
      'Bir kelimeyi tek bir harf değişikliğiyle başka bir kelimeye dönüştürün';

  @override
  String vocabularyBuilderMessage(String arg0) {
    return 'Harika iş! Kelime dağarcığınız etkileyici. Puan: $arg0';
  }

  @override
  String get symmetryMessage =>
      'Deseni cerrahi bir hassasiyetle mükemmel bir şekilde yansıttınız.';

  @override
  String get temporalOrderMessage =>
      'İnanılmaz! Zaman dizisi hafızanız yüksek sadakatte.';

  @override
  String get temporalOrderMessage1 =>
      'Hatalı dizi hafızası. Pratik yapmak mükemmelleştirir!';

  @override
  String get wordSearchMessage =>
      'Tüm kelimeler keskin bir gözlemle başarıyla bulundu.';

  @override
  String colorMatchMessage(String arg0) {
    return 'Doğruluğunuz: $arg0%';
  }

  @override
  String semanticLinkMessage(String arg0) {
    return '$arg0 puan kazandınız!';
  }

  @override
  String reflexTapMessage(String arg0) {
    return '$arg0 hedefe dokundunuz!';
  }

  @override
  String get angleFinderMessage => 'Geometrik sezginiz mükemmel!';

  @override
  String angleFinderMessage1(String arg0) {
    return 'Doğru cevap $arg0° idi';
  }

  @override
  String angleFinderText(String arg0) {
    return '$arg0°';
  }

  @override
  String visualStatisticalLearningMessage(String arg0) {
    return '$arg0 doğru desen puanladınız!';
  }

  @override
  String nonogramText(String arg0) {
    return 'Hata: $arg0';
  }

  @override
  String mentalCalendarMessage(String arg0) {
    return '10 üzerinden $arg0 doğru yaptınız!';
  }

  @override
  String orbitTapMessage(String arg0) {
    return 'Başarıyla $arg0 kez dokundunuz!';
  }

  @override
  String schulteTableMessage(String arg0) {
    return 'Tabloyu $arg0 sürede tamamladınız. Periferik görüşünüzü genişletmek için pratik yapmaya devam edin!';
  }

  @override
  String get schulteTableText => 'TESTİ BAŞLAT';

  @override
  String get relationalMemoryMessage =>
      'Harika mekansal ilişkisel bellek doğruluğu!';

  @override
  String sudokuText(String arg0) {
    return 'Hata: $arg0';
  }

  @override
  String sdmtMessage(String arg0) {
    return '$arg0 sembolü eşleştirdiniz! Bu test tarama hızınızı ve görsel dikkatinizi ölçer.';
  }

  @override
  String get futoshikiMessage =>
      'İnanılmaz! Futoshiki Latin Karesini çözdünüz.';

  @override
  String letterFrequencyScanMessage(String arg0, String arg1) {
    return '\"$arg1\" harfinin $arg0 kez geçtiğini doğru saydınız.';
  }

  @override
  String letterFrequencyScanText(String arg0) {
    return 'Yanlış. Sayı $arg0 idi.';
  }

  @override
  String get memoryMatrixMessage =>
      'Etkileyici! Çalışma belleğiniz keskin. Günlük hedef tamamlandı!';

  @override
  String get memoryMatrixMessage1 =>
      'Hafıza puanınızı artırmak için odaklanın ve tekrar deneyin.';

  @override
  String get contextCluesMessage =>
      'Olağanüstü! Kelime dağarcığınız ve bağlamsal analiziniz birinci sınıf.';

  @override
  String get contextCluesMessage1 =>
      'Yanlış kelime seçildi! Sözel bağlam muhakemenizi eğitin ve tekrar deneyin.';

  @override
  String oneLetterShiftMessage(String arg0, String arg1) {
    return '$arg0 kelimesini başarıyla $arg1 kelimesine dönüştürdünüz.';
  }

  @override
  String get mentalAbacusMessage => 'Zihinsel aritmetiğiniz üst düzey.';

  @override
  String fractionMatcherMessage(String arg0) {
    return 'Temsilleri eşleştirerek $arg0 puan kazandınız!';
  }

  @override
  String get spellingSprintMessage => 'Tüm 10 kelimeyi doğru hecelediniz!';

  @override
  String spellingSprintMessage1(String arg0) {
    return '$arg0 kelimeyi doğru hecelediniz.';
  }

  @override
  String stopSignalMessage(String arg0) {
    return '$arg0 doğru tepki verdiniz! Bu test planlanmış bir eylemi durdurma yeteneğinizi ölçer.';
  }

  @override
  String grammarPoliceMessage(String arg0) {
    return 'Oyun Bitti! Dilbilgisi dünyasında düzeni sağladınız. Puan: $arg0';
  }

  @override
  String consonantReconstructMessage(String arg0) {
    return '$arg0 puanlık bir yeniden inşa yaptınız!';
  }

  @override
  String rhymeMasterMessage(String arg0, String arg1) {
    return '$arg1 kafiyeden $arg0 tanesini buldunuz!';
  }

  @override
  String vigilanceTaskMessage(String arg0, String arg1, String arg2) {
    return 'İsabetler: $arg0, Kaçırmalar: $arg1\nYanlış Alarmlar: $arg2';
  }

  @override
  String get silhouetteMatchOrthoMessage =>
      'Kusursuz ortografik hizalama becerileriniz var!';

  @override
  String get silhouetteMatchOrthoText => 'ANLADIM';

  @override
  String get silhouetteMatchOrthoText1 =>
      'Yanlış perspektif projeksiyonu! Tekrar denemek için Sıfırla ya dokunun.';

  @override
  String fibonacciMergeMessage(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String factorFinderMessage(String arg0) {
    return 'Tüm çarpanları bularak $arg0 puan kazandınız!';
  }

  @override
  String logicalSyllogismsMessage(String arg0) {
    return '$arg0 kıyası doğru çözdünüz!';
  }

  @override
  String get rotatingMazeMessage =>
      'Kinetik dönen labirentte başarıyla gezindiniz!';

  @override
  String get rotatingMazeText => 'ANLADIM';

  @override
  String get rotatingMazeText1 => '🌀 Labirent 90° döndü! Izgara kaydı!';

  @override
  String get mathPathMessage => 'Hedef toplama ulaşan yolu buldunuz!';

  @override
  String get bridgesMessage => 'Tüm adaları başarıyla bağladınız!';

  @override
  String compoundConnectMessage(String arg0, String arg1) {
    return 'Bileşik kelime: $arg0$arg1.';
  }

  @override
  String get pangramSprintMessage =>
      '26 harfin hepsini kullanarak bir cümle kurdunuz.';

  @override
  String get mirrorImageMessage =>
      'Yansımayı mükemmel bir şekilde belirlediniz.';

  @override
  String get mirrorImageText => 'AYNA GÖRÜNTÜSÜ';

  @override
  String reverseStroopMessage(String arg0) {
    return '$arg0 puan kazandınız! Gözünüz talimatlarda olsun.';
  }

  @override
  String get verbalAnalogiesMessage =>
      'İlişkiler konusunda keskin bir zihniniz var.';

  @override
  String corsiBlocksMessage1(String arg0, String arg1) {
    return '$arg1 dizi hatırladınız! Mekansal bellek kapasiteniz $arg0 ulaştı.';
  }

  @override
  String wordLadderMessage(String arg0, String arg1, String arg2) {
    return '$arg0 kelimesini $arg1 kelimesine $arg2 adımda başarıyla bağladınız.';
  }

  @override
  String d2AttentionMessage(String arg0) {
    return 'İnanılmaz seçici tarama! Final puanı: $arg0.';
  }

  @override
  String get d2AttentionText => 'NASIL OYNANIR';

  @override
  String get d2AttentionText1 => 'ANLADIM';

  @override
  String get tangleFixMessage => 'Tüm çizgiler açık ve pürüzsüz.';

  @override
  String get distractorMatrixMessage =>
      'İnanılmaz! Bilişsel matematiksel çeldiricilere rağmen desenleri hatırladınız!';

  @override
  String get distractorMatrixMessage1 =>
      'Çeldiriciler sizi yakaladı! Çalışma belleğinizi yeniden eğitin.';

  @override
  String sentenceUnscrambleMessage(String arg0) {
    return '$arg0 puanlık bir cümle çözdünüz!';
  }

  @override
  String get kakuroMessage =>
      'İnanılmaz! Tüm toplam segmentlerini mükemmel bir şekilde eşleştirdiniz.';

  @override
  String symbolicFlankerMessage(String arg0, String arg1) {
    return '$arg1 üzerinden $arg0 doğru yaptınız!';
  }

  @override
  String stroopTestMessage(String arg0) {
    return '$arg0 doğru yaptınız! Kelimeye değil, mürekkebin rengine odaklanın.';
  }

  @override
  String wisconsinCardSortingMessage(String arg0) {
    return '$arg0 kartı doğru şekilde sınıflandırdınız!';
  }

  @override
  String nBackMessage(String arg0) {
    return '$arg0 adet 2-back eşleşmesi sağladınız! Çalışma belleğiniz çoklu görev için hayati önem taşır.';
  }

  @override
  String rhythmMasterMessage(String arg0, String arg1) {
    return '$arg0 mükemmel vuruş ve $arg1 puan kazandınız!';
  }

  @override
  String groceryListMessage(String arg0, Object score) {
    return 'Market Listesinde $arg0 puan kazandınız!';
  }

  @override
  String get groceryListText => 'HAZIRIM';

  @override
  String get mirrorTracingMessage =>
      'Beyniniz koordinasyonunu başarıyla yeniden yapılandırdı.';

  @override
  String moduloClockMessage(String arg0) {
    return 'Mükemmel modüler zihinsel matematik koordinasyonu! Puan: $arg0';
  }

  @override
  String moduloClockMessage1(String arg0, String arg1, String arg2) {
    return '$arg1 modüler saat çözümünden $arg0 tanesini başardınız. Puan: $arg2';
  }

  @override
  String get crownMessage =>
      'Tüm taçlar mükemmel mantıkla başarıyla yerleştirildi.';

  @override
  String dualCodingMessage(String arg0) {
    return 'Harika çift görev performansı! Çalışma belleği puanınız: $arg0';
  }

  @override
  String inequalityDashMessage(String arg0) {
    return 'Eşitsizlikleri eşleştirerek $arg0 puan kazandınız!';
  }

  @override
  String sourceMonitoringMessage(String arg0, String arg1) {
    return '$arg1 üzerinden $arg0 puan kazandınız!';
  }

  @override
  String get sourceMonitoringText => 'HATIRLAMAYI BAŞLAT';

  @override
  String get memoryPalaceText => 'MEVCUT KELİMELER';

  @override
  String target10Message(String arg0) {
    return 'Sayıları 10 a eşleyerek $arg0 puan kazandınız!';
  }

  @override
  String get paperFoldingMessage => 'Zihninizdeki desenleri görebiliyorsunuz.';

  @override
  String topologyText(String arg0, String arg1) {
    return '$arg0$arg1 / 10';
  }

  @override
  String get waterSortMessage => 'Tüm renkleri mükemmel bir şekilde ayırdınız!';

  @override
  String anagramDefinitionMessage(String arg0) {
    return 'Kelime gerçekten de \"$arg0\" idi.';
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
    return '$arg0 doğru tahmin yaptınız.';
  }

  @override
  String grammarSortMessage(String arg0) {
    return '$arg0 kelimeyi doğru sınıflandırdınız!';
  }

  @override
  String vowelReconstructMessage(String arg0) {
    return '$arg0 puanlık bir ünlü harf inşası yaptınız!';
  }

  @override
  String spatialConflictMessage(String arg0, String arg1) {
    return '$arg1 hata ile $arg0 puan kazandınız!';
  }

  @override
  String get spatialConflictText => 'NASIL OYNANIR';

  @override
  String get spatialConflictText1 => 'ANLADIM';

  @override
  String tracePathMessage(String arg0) {
    return 'Doğruluğunuz %$arg0 idi!';
  }

  @override
  String ruleSwitcherMessage(String arg0, String arg1) {
    return '$arg1 üzerinden $arg0 doğru yaptınız!';
  }

  @override
  String collatzMessage(String arg0, String arg1) {
    return '$arg0 adım attınız. Mümkün olan en az adım $arg1 idi.';
  }

  @override
  String get collatzText => '/ 2';

  @override
  String get collatzText1 => '+ 1';

  @override
  String get collatzText2 => '3n + 1';

  @override
  String divisibilityDashMessage(String arg0) {
    return '$arg0 sayıyı çözdünüz!';
  }

  @override
  String switchTaskMessage(String arg0) {
    return '$arg0 doğru yaptınız! Hızlı geçiş, zihinsel esnekliğin anahtarıdır.';
  }

  @override
  String sequenceSleuthMessage(String arg0) {
    return '$arg0 dizi çözdünüz!';
  }

  @override
  String changeBlindnessMessage(String arg0) {
    return '$arg0 değişiklik buldunuz!';
  }

  @override
  String mentalRotationMessage(String arg0) {
    return '$arg0 şekli doğru döndürdünüz!';
  }

  @override
  String wordMastermindMessage(String arg0) {
    return 'Kodu çözdünüz!\nKelime şuydu: $arg0';
  }

  @override
  String wordMastermindMessage1(String arg0) {
    return 'Gizli kelime şuydu: $arg0';
  }

  @override
  String wordMastermindText(String arg0) {
    return '$arg0';
  }

  @override
  String get simonSequenceMessage => 'Tüm 10 parçayı ezberlediniz!';

  @override
  String get simonSequenceMessage1 => 'Dizide ustalaşmak için tekrar deneyin.';

  @override
  String oxymoronHuntMessage(String arg0) {
    return '$arg0 oksimoron buldunuz!';
  }

  @override
  String spotlightTrackMessage(String arg0) {
    return 'İnanılmaz mekansal takip! $arg0 puan kazandınız.';
  }

  @override
  String get spotlightTrackText => 'NASIL OYNANIR';

  @override
  String get spotlightTrackText1 => 'ANLADIM';

  @override
  String get spotlightTrackText2 => 'TURU BAŞLAT';

  @override
  String vennNumbersMessage(String arg0) {
    return '$arg0 sayıyı kategorize ettiniz!';
  }

  @override
  String get vennNumbersText => 'HİÇBİRİ';

  @override
  String get vennNumbersText1 => 'HER İKİSİ';

  @override
  String get silhouetteMatchMessage =>
      'Beyniniz 3D den 2D ye çeviri konusunda mükemmel.';

  @override
  String sumSnakeMessage(String arg0) {
    return '$arg0 hedefine mükemmel bir hassasiyetle ulaşıldı!';
  }

  @override
  String get sumSnakeText => 'YOLU TEMİZLE';

  @override
  String percentagePeakMessage(String arg0) {
    return '$arg0 yüzde problemi çözdünüz!';
  }

  @override
  String trailMakingMessage(String arg0) {
    return '$arg0 izi tamamladınız! Bu test görsel arama hızınızı ve zihinsel esnekliğinizi ölçer.';
  }

  @override
  String matrixReasoningMessage(String arg0) {
    return '$arg0 matrisi doğru tamamladınız!';
  }

  @override
  String get tentsAndTreesMessage => 'Tüm çadırları başarıyla yerleştirdiniz.';

  @override
  String klotskiMessage(String arg0) {
    return 'Harika kaydırma! Kahraman bloğu $arg0 hamlede serbest bıraktınız.';
  }

  @override
  String sumPyramidMessage(String arg0) {
    return '$arg0 toplam piramidini başarıyla çözdünüz!';
  }

  @override
  String simonCommandMessage(String arg0) {
    return 'Mükemmel seçici tepki ve odaklanma! Toplam Puan: $arg0';
  }

  @override
  String simonCommandMessage1(String arg0, String arg1) {
    return '$arg0 puan aldınız ancak zamanında $arg1 eşleşmeye ulaşamadınız.';
  }

  @override
  String syllableStackMessage(String arg0) {
    return '$arg0 puanlık bir hece yığını yaptınız!';
  }

  @override
  String get slitherlinkMessage =>
      'Harika! Döngü bulmacasını başarıyla tamamladınız.';

  @override
  String quickMathMessage(String arg0) {
    return '$arg0 problem çözdünüz!';
  }

  @override
  String commonDenominatorMessage(String arg0) {
    return '$arg0 EBOB/EKOK problemi çözdünüz!';
  }

  @override
  String chainReactionMessage(String arg0, String arg1) {
    return 'Final puanınız $arg0. $arg1 kelimelik bir zincir kurdunuz.';
  }

  @override
  String chainReactionText(String arg0) {
    return '$arg0';
  }

  @override
  String get associativePairsMessage =>
      'Harika! Görsel özellikleri kusursuz bir şekilde ilişkilendirdiniz.';

  @override
  String get associativePairsMessage1 =>
      'Yanlış ilişkilendirme! Bağlantı hafızanızı keskinleştirin ve tekrar deneyin.';

  @override
  String portmanteauSplitMessage(String arg0) {
    return '$arg0 birleşik kelimeyi ayırdınız!';
  }

  @override
  String get magicSquaresText => 'TEMİZLE';

  @override
  String alphabetSudokuText(String arg0) {
    return 'Hata: $arg0';
  }

  @override
  String get pipesMessage => 'Tüm boruları bağladınız ve ızgarayı doldurdunuz.';

  @override
  String get dualMirrorMessage =>
      'Her iki simgeyi de hedeflerine ulaştırdınız!';

  @override
  String binaryCodeMessage(String arg0) {
    return 'Harika hızlı ondalık çeviri! Final Puanı: $arg0';
  }

  @override
  String binaryCodeMessage1(String arg0, String arg1) {
    return '$arg0 ikili sayıyı doğru çevirdiniz. Puan: $arg1';
  }

  @override
  String oddOneOutMessage(String arg0) {
    return '50 aykırı olanı buldunuz! Final puanı: $arg0';
  }

  @override
  String oddOneOutMessage1(String arg0) {
    return 'Puanınız: $arg0';
  }

  @override
  String letterBridgeMessage(String arg0) {
    return 'Köprü harfini buldunuz: $arg0';
  }

  @override
  String get imReady => 'HAZIRIM';

  @override
  String get soptTitle => 'Kendi Kendine Sıralanan İşaretleme';

  @override
  String get soptSubtitle =>
      'Her seferinde farklı bir karta dokunun. Pozisyonlar değişiyor!';

  @override
  String get soptWinTitle => 'Sıra Ustası!';

  @override
  String soptGameOverMessage(int score) {
    return 'Karıştırılan kartları başarıyla takip ederek $score puan kazandınız!';
  }

  @override
  String get soptChooseNovel => 'Yeni bir karta dokunun';

  @override
  String get soptGreatJob => 'Harika iş!';

  @override
  String get soptAlreadyTapped => 'Zaten dokunuldu!';

  @override
  String get soptGrid => 'Izgara';

  @override
  String get contRecogTitle => 'Sürekli Tanıma';

  @override
  String get contRecogSubtitle => 'Bu kartı daha önce bu oturumda gördünüz mü?';

  @override
  String get contRecogWinTitle => 'Tanıma Dahisi!';

  @override
  String contRecogGameOverMessage(int score) {
    return '$score doğru tanıma yaptınız!';
  }

  @override
  String get contRecogCorrect => 'Doğru!';

  @override
  String get contRecogWrong => 'Yanlış!';

  @override
  String get contRecogOldOrNew => 'Bu eski mi yeni mi?';

  @override
  String get contRecogNew => 'Yeni';

  @override
  String get contRecogOld => 'Eskimiş';

  @override
  String get contRecogSeenPool => 'Görülmüş Havuz';

  @override
  String get dnmsTitle => 'Eşleşmeyen Bellek';

  @override
  String get dnmsSubtitle => 'Ezberlenen örnekte olmayan karta dokunun.';

  @override
  String get dnmsWinTitle => 'Eşleşmeyen Uzman!';

  @override
  String dnmsGameOverMessage(int score) {
    return 'Gecikmeli Eşleşmeyen bölümünde $score doğru yanıt aldınız!';
  }

  @override
  String get dnmsChooseNovel => 'Yeni karta dokunun';

  @override
  String get dnmsMemorizeSample => 'Bu kartı ezberleyin';

  @override
  String get dnmsWaitForIt => 'Bekle...';

  @override
  String get dnmsExcellent => 'Harika!';

  @override
  String get dnmsSampleTapped => 'Örnek buydu!';

  @override
  String get dnmsCards => 'Kartlar';

  @override
  String get symSpanTitle => 'Simetri Açıklığı';

  @override
  String get symSpanSubtitle =>
      'Dikey simetriyi tanımlarken hücre desenlerini hatırlayın.';

  @override
  String get symSpanWinTitle => 'Simetri Ustası!';

  @override
  String symSpanGameOverMessage(int score) {
    return 'Düzenleri hatırlayarak ve simetriyi tanımlayarak $score puan kazandınız!';
  }

  @override
  String get symSpanMemorizeRed => 'Kırmızı hücre konumunu ezberle';

  @override
  String get symSpanIsSymmetric => 'Desen simetrik mi?';

  @override
  String get symSpanRecallSequence => 'Sırayı doğru sırayla hatırlayın';

  @override
  String get symSpanGreatJob => 'Harika iş!';

  @override
  String get symSpanTryAgain => 'Tekrar deneyin!';

  @override
  String get symSpanLength => 'Uzunluk';

  @override
  String get readingSpanTitle => 'Okuma Aralığı';

  @override
  String get readingSpanSubtitle =>
      'Bir harf dizisini hatırlayarak cümleleri doğrulayın.';

  @override
  String get readingSpanWinTitle => 'Okuma Uzmanı!';

  @override
  String readingSpanGameOverMessage(int score) {
    return 'Okuma Alanı hafıza mücadelesinde $score puan kazandınız!';
  }

  @override
  String get readingSpanTrueFalse => 'Bu ifade doğru mu, yanlış mı?';

  @override
  String get readingSpanMemorizeLetter => 'Bu mektubu ezberleyin';

  @override
  String get readingSpanRecallLetters => 'Harfleri sırayla hatırlama';

  @override
  String get readingSpanGreatJob => 'Harika iş!';

  @override
  String get readingSpanTryAgain => 'Tekrar deneyin!';

  @override
  String readingSpanYourSequence(String sequence) {
    return 'Sıranız: $sequence';
  }

  @override
  String get readingSpanLength => 'Uzunluk';

  @override
  String get readingSpanSentence1 => 'Güneş doğudan doğar.';

  @override
  String get readingSpanSentence2 => 'Buz sıcak kaynıyor.';

  @override
  String get readingSpanSentence3 => 'Balıklar su altında nefes alabilir.';

  @override
  String get readingSpanSentence4 =>
      'Köpeklerin kanatları vardır ve uçabilirler.';

  @override
  String get readingSpanSentence5 => 'Su 0 santigrat derecede donar.';

  @override
  String get readingSpanSentence6 => 'Kediler küçük köpekler gibi havlarlar.';

  @override
  String get readingSpanSentence7 =>
      'Ağaçlar yaz aylarında yeşil yapraklara sahiptir.';

  @override
  String get readingSpanSentence8 => 'Yağmur yerden yukarıya doğru yağar.';

  @override
  String get readingSpanSentence9 => 'Bir üçgenin dört eşit kenarı vardır.';

  @override
  String get readingSpanSentence10 => 'Elma tatlı bir meyve türüdür.';

  @override
  String get readingSpanSentence11 => 'Ay kaşar peynirinden yapılır.';

  @override
  String get readingSpanSentence12 =>
      'Otomobillerin yuvarlanacak tekerlekleri vardır.';

  @override
  String get readingSpanSentence13 => 'Ateş donuyor.';

  @override
  String get readingSpanSentence14 => 'Kağıt işlenmiş ağaçtan yapılır.';

  @override
  String get readingSpanSentence15 =>
      'Kuşların uçmalarına yardımcı olan tüyleri vardır.';

  @override
  String get readingSpanSentence16 => 'Muz çam ağaçlarında yetişir.';

  @override
  String get readingSpanSentence17 => 'Fil, karıncadan daha küçüktür.';

  @override
  String get readingSpanSentence18 => 'Kitaplar basılı metin sayfaları içerir.';

  @override
  String get countingSpanTitle => 'Sayma Aralığı';

  @override
  String get countingSpanSubtitle =>
      'Yalnızca mavi daireleri sayın. Daha sonra sayım sırasını hatırlayın.';

  @override
  String get countingSpanWinTitle => 'Sayma Dahi!';

  @override
  String countingSpanGameOverMessage(int score) {
    return 'Sayma Açıklığı hafıza mücadelesinde $score puan kazandınız!';
  }

  @override
  String get countingSpanCountCircles => 'Yalnızca mavi daireleri say';

  @override
  String get countingSpanRecallCounts => 'Sayımları doğru sırayla geri çağırma';

  @override
  String get countingSpanGreatJob => 'Harika iş!';

  @override
  String get countingSpanTryAgain => 'Tekrar deneyin!';

  @override
  String countingSpanYourSequence(String sequence) {
    return 'Sıranız: $sequence';
  }

  @override
  String get countingSpanLength => 'Uzunluk';

  @override
  String get objDispTitle => 'Nesne Yer Değiştirme';

  @override
  String get objDispSubtitle =>
      'Düzeni ezberleyin. Konumu değiştiren tek nesneyi bulun ve dokunun.';

  @override
  String get objDispWinTitle => 'Uzay Dahisi!';

  @override
  String objDispGameOverMessage(int score) {
    return '$score yeri değiştirilmiş nesneyi doğru bir şekilde tanımladınız!';
  }

  @override
  String get objDispMemorizeAll => 'Tüm yerleşimleri ezberle';

  @override
  String get objDispWaitingShift => 'Düzen değişikliği bekleniyor...';

  @override
  String get objDispTapMoved => 'Taşınan nesneye dokunun';

  @override
  String get objDispExcellent => 'Harika!';

  @override
  String get objDispWrongObject => 'Yanlış nesne!';

  @override
  String get objDispItems => 'Öğeler';

  @override
  String get mandalaTitle => 'Mandala Hatırlama';

  @override
  String get mandalaSubtitle =>
      'Renk yapılandırmasını ezberleyin. Renkleri seçin ve döşemeleri yeniden boyayın.';

  @override
  String get mandalaWinTitle => 'Mandala Sanatçısı!';

  @override
  String mandalaGameOverMessage(int score) {
    return 'Renkli geometrik düzenleri yeniden oluşturarak $score puan kazandınız!';
  }

  @override
  String get mandalaMemorizeColors => 'Döşeme renklerini ezberleyin';

  @override
  String get mandalaPaintCells => 'Hücreleri orijinale uyacak şekilde boyayın';

  @override
  String get mandalaExcellent => 'Harika!';

  @override
  String get mandalaIncorrectMatch => 'Yanlış eşleşme!';

  @override
  String get mandalaSubmitRepaint => 'Yeniden Boyamayı Gönder';

  @override
  String get mandalaTiles => 'Fayans';

  @override
  String get runningSpanTitle => 'Koşu Aralığı';

  @override
  String get runningSpanSubtitle =>
      'Harflere dikkat edin. Durduklarında son N harfini sırayla girin.';

  @override
  String get runningSpanWinTitle => 'Tampon Ustası!';

  @override
  String runningSpanGameOverMessage(int score) {
    return 'Koşu Hafıza Alanında $score puan kazandınız!';
  }

  @override
  String runningSpanPrepareRecall(int count) {
    return 'Son $count harfi hatırlamaya hazırlanın';
  }

  @override
  String get runningSpanWatchCarefully => 'Dikkatlice izleyin...';

  @override
  String runningSpanEnterLast(int count) {
    return 'Son $count harfi girin';
  }

  @override
  String get runningSpanGreatJob => 'Harika iş!';

  @override
  String get runningSpanIncorrectBuffer => 'Yanlış tampon!';

  @override
  String runningSpanRecallLast(int count) {
    return 'Sonuncuyu hatırla $count';
  }

  @override
  String get runningSpanStopsRandomly => 'Akış rastgele duruyor!';

  @override
  String runningSpanEntered(String sequence) {
    return 'Girildi: $sequence';
  }

  @override
  String get runningSpanNItems => 'N-Öğeler';

  @override
  String get spatialCabinetTitle => 'Mekansal Dolaplar';

  @override
  String get spatialCabinetSubtitle =>
      'Hangi dolap çekmecesinin hangi nesneyi içerdiğini ezberleyin.';

  @override
  String get spatialCabinetWinTitle => 'Kabine Uzmanı!';

  @override
  String spatialCabinetGameOverMessage(int score) {
    return 'Uzamsal Dolap Hafızasında $score puan kazandınız!';
  }

  @override
  String get spatialCabinetMemorize => 'Öğe konumlarını ezberleyin';

  @override
  String spatialCabinetWhereIs(String itemName) {
    return '$itemName nerede?';
  }

  @override
  String get spatialCabinetCorrect => 'Doğru!';

  @override
  String get spatialCabinetWrongDrawer => 'Yanlış çekmece!';

  @override
  String get spatialCabinetItems => 'Öğeler';

  @override
  String get cabinetItemKey => 'Anahtar';

  @override
  String get cabinetItemApple => 'Elma';

  @override
  String get cabinetItemDiamond => 'Elmas';

  @override
  String get cabinetItemBook => 'Kitap';

  @override
  String get cabinetItemUmbrella => 'Şemsiye';

  @override
  String get cabinetItemCoffee => 'Kahve';

  @override
  String get cabinetItemLock => 'Kilit';

  @override
  String get cabinetItemPet => 'Evcil Hayvan';

  @override
  String get cabinetItemCar => 'Araba';

  @override
  String get gamesTitleLabel => 'OYUNLAR';

  @override
  String get yourFavorites => 'FAVORİLERİNİZ';

  @override
  String get readyForWorkout => 'GÜNLÜK ANTRENMANINIZ İÇİN HAZIR MISINIZ?';

  @override
  String get greatStartKeepGoing => 'HARİKA BAŞLANGIÇ! DEVAM EDİN.';

  @override
  String get onFireToday => 'BUGÜN FORMUNUZDASINIZ!';

  @override
  String get incredibleSolvingToday => 'BUGÜN İNANILMAZ ÇÖZÜMLER!';

  @override
  String get newGameLabel => 'YENİ';

  @override
  String get slitherlinkTitle => 'Slitherlink';

  @override
  String get slitherlinkSubtitle =>
      'SAYI İPUÇLARINI KULLANARAK NOKTA IZGARASINI ÇEMBERE ALIN.';

  @override
  String get futoshikiTitle => 'Futoshiki';

  @override
  String get futoshikiSubtitle => 'IZGARALARI BÜYÜKTÜR İPUÇLARIYLA DOLDURUN.';

  @override
  String get kakuroTitle => 'Kakuro';

  @override
  String get kakuroSubtitle => 'BULMACALARI SAYILAR VE TOPLAMLARLA ÇÖZÜN.';

  @override
  String get inequalityDashTitle => 'Eşitsizlik Koşusu';

  @override
  String get inequalityDashSubtitle =>
      'ZAMAN BASKISI ALTINDA EŞİTSİZLİKLERİ ÇÖZÜN.';

  @override
  String get factorFinderTitle => 'Çarpan Bulucu';

  @override
  String get factorFinderSubtitle =>
      'HEDEF SAYILARIN TÜM ÇARPANLARINI BELİRLEYİN.';

  @override
  String get collatzTitle => 'Collatz Yolu';

  @override
  String get collatzSubtitle => '3N+1 DİZİSİNDE GEZİNİN.';

  @override
  String get sumPyramidTitle => 'Toplam Piramidi';

  @override
  String get sumPyramidSubtitle =>
      'PİRAMİT HÜCRELERİNİ TOPLAMA MATEMATİK İPUÇLARIYLA DOLDURUN.';

  @override
  String get target10Title => 'Hedef 10';

  @override
  String get target10Subtitle =>
      'ON TOPLAMINA ULAŞMAK İÇİN SAYI KAROLARINI BİRLEŞTİRİN.';

  @override
  String get fractionMatcherTitle => 'Kesir Eşleştirici';

  @override
  String get fractionMatcherSubtitle =>
      'DENK KESİRLERİ GÖRSEL OLARAK EŞLEŞTİRİN.';

  @override
  String get dualCodingTitle => 'İkili Kodlama';

  @override
  String get dualCodingSubtitle =>
      'HARFLERİ VE SEMBOLLERİ AYNI ANDA EŞLEŞTİRİN.';

  @override
  String get distractorMatrixTitle => 'Çeldirici Matrisi';

  @override
  String get distractorMatrixSubtitle =>
      'ÇELDİRİCİLER ARASINDA HEDEF ŞEKİLLERİ BULUN.';

  @override
  String get temporalOrderTitle => 'Zaman Düzeni';

  @override
  String get temporalOrderSubtitle => 'KRONOLOJİK DİZİYİ HATIRLAYIN.';

  @override
  String get associativePairsTitle => 'Çağrışımsal Çiftler';

  @override
  String get associativePairsSubtitle =>
      'İLGİLİ SEMBOLLERİ EŞLEŞTİRİN VE BAĞLAYIN.';

  @override
  String get blockCount3dTitle => '3D Blok Sayma';

  @override
  String get blockCount3dSubtitle => 'ÜÇ BOYUTLU ALANDAKİ BLOKLARI SAYIN.';

  @override
  String get rotatingMazeTitle => 'Dönen Labirent';

  @override
  String get rotatingMazeSubtitle =>
      'TOPLARI ÇIKIŞA YÖNLENDİRMEK İÇİN LABİRENTLERİ DÖNDÜRÜN.';

  @override
  String get silhouetteMatchOrthoTitle => 'Siluet Eşleştirme (Orto)';

  @override
  String get silhouetteMatchOrthoSubtitle =>
      '3D NESNELERİ ORTO GÖLGELERLE EŞLEŞTİRİN.';

  @override
  String get spatialConflictTitle => 'Uzamsal Çatışma';

  @override
  String get spatialConflictSubtitle =>
      'METİN VE YÖN ARASINDAKİ ÇELİŞKİLERİ ÇÖZÜN.';

  @override
  String get spotlightTrackTitle => 'Spotlight Takibi';

  @override
  String get spotlightTrackSubtitle =>
      'HAREKETLİ GÖLGELERDEKİ YANIP SÖNEN ÖGELERİ TAKİP EDİN.';

  @override
  String get d2AttentionTitle => 'd2 Dikkat';

  @override
  String get d2AttentionSubtitle => 'HEDEF SEMBOLLERİ KATI KRİTERLERLE SEÇİN.';

  @override
  String get dualMirrorTitle => 'Çift Aynalı Navigasyon';

  @override
  String get dualMirrorSubtitle => 'AYNI ANDA İKİ LABİRENTTE GEZİNİN.';

  @override
  String get contextCluesTitle => 'Bağlam İpuçları';

  @override
  String get contextCluesSubtitle =>
      'BAĞLAM İPUÇLARINDAN GİZLİ KELİMELERİ ÇIKARIN.';

  @override
  String get digitSpanReverseSubtitle => 'SAYILARI TERS SIRADA HATIRLAYIN.';

  @override
  String get faceNameAssociationSubtitle =>
      'SUNULAN ÇEŞİTLİ YÜZLERİN İSİMLERİNİ HATIRLAYIN.';

  @override
  String get staircaseMemorySubtitle =>
      'BLOKLARI BASAMAKLI BİR SIRAYLA EZBERLEYİN.';

  @override
  String get choiceReactionTimeSubtitle =>
      'İPUÇLARIYLA EŞLEŞEN BELİRLİ DÜĞMELERE HIZLICA BASIN.';

  @override
  String get attentionalBlinkSubtitle =>
      'AKIŞLARDA HIZLICA YANIP SÖNEN HEDEFLERİ YAKALAYIN.';

  @override
  String get visualStatisticalLearningSubtitle =>
      'ZAMANSAL ŞEKİL KALIPLARINI GÖRSEL OLARAK ÖĞRENİN.';

  @override
  String get sternbergTaskSubtitle =>
      'SEMBOLÜN BELLEK SETİNDE OLUP OLMADIĞINI HATIRLAYIN.';

  @override
  String get operationSpanSubtitle =>
      'MATEMATİK ÇÖZÜN VE ALFABE DİZİLERİNİ HATIRLAYIN.';

  @override
  String get continuousRecognitionTitle => 'Sürekli Tanıma';

  @override
  String get continuousRecognitionSubtitle =>
      'SUNULAN KARTIN ESKİ Mİ YENİ Mİ OLDUĞUNU BELİRLEYİN.';

  @override
  String get symmetrySpanTitle => 'Simetri Aralığı';

  @override
  String get symmetrySpanSubtitle =>
      'DİKEY SİMETRİ KARARLARI ARASINDA HÜCRE KOORDİNATLARINI HATIRLAYIN.';

  @override
  String get objectDisplacementTitle => 'Nesne Yer Değiştirme';

  @override
  String get objectDisplacementSubtitle =>
      'YERLEŞİMLERİ İNCELEYİN VE HAREKET EDEN TEK NESNEYE DOKUNUN.';

  @override
  String get mandalaRecallTitle => 'Mandala Hatırlama';

  @override
  String get mandalaRecallSubtitle =>
      'RENK KAROLARINI EZBERLEYİN VE MANDALALARI PALETTEN YENİDEN BOYAYIN.';

  @override
  String get runningMemorySpanTitle => 'Çalışan Bellek Aralığı';

  @override
  String get runningMemorySpanSubtitle =>
      'AKAN HARFLERİ İZLEYİN VE SON N ÖGEYİ HATIRLAYIN.';

  @override
  String get spatialCabinetMemoryTitle => 'Uzamsal Dolaplar';

  @override
  String get spatialCabinetMemorySubtitle =>
      'DOLAP KAPAKLARININ ARKASINDAKİ ÖGELERİ EZBERLEYİN VE BULUN.';

  @override
  String get pathRecallSubtitle => 'YOL SEÇİMLERİNİ EZBERLEYİN VE TEKRARLAYIN.';

  @override
  String get objectShuffleSubtitle =>
      'DERİN BARDAKLARIN ALTINDA KARIŞTIRILAN ÖGELERİ TAKİP EDİN.';

  @override
  String get groceryListSubtitle =>
      'LİSTEDEKİ ÖGELERİ EZBERLEYİN VE İŞARETLEYİN.';

  @override
  String get quickMathSubtitle => 'ARİTMETİK SORULARINI EN YÜKSEK HIZDA ÇÖZÜN.';

  @override
  String get mathGuessTitle => 'Matematik Tahmini';

  @override
  String get mathGuessSubtitle => 'GİZLİ SAYIYI 15 HAK İÇİNDE TAHMİN EDİN.';

  @override
  String get reflexTapSubtitle =>
      'UYARANLARA İNSANIN YAPABİLECEĞİ EN HIZLI ŞEKİLDE DOKUNUN.';

  @override
  String get pixelMimicSubtitle =>
      'PİKSEL IZGARALARI ÜZERİNDEKİ TASARIM KALIPLARINI TAKLİT EDİN.';

  @override
  String get simonSequenceSubtitle => 'ŞEKİL DİZİLERİNİ BELLEKTEN TEKRARLAYIN.';

  @override
  String get slidePuzzleSubtitle =>
      'KARE KAYDIRMA IZGARA KAROLARINI YENİDEN DÜZENLEYİN.';

  @override
  String get findWordTitle => 'Kelime Bul';

  @override
  String get schulteTableSubtitle =>
      'BİRDEN YİRMİ BEŞE KADAR SAYILARA DOKUNUN.';

  @override
  String get simonCommandTitle => 'Simon Komutu';

  @override
  String get simonCommandSubtitle =>
      'SESLİ TALİMATLARI HIZLICA YERİNE GETİRİN.';

  @override
  String get binaryCodeTitle => 'İkili Hız';

  @override
  String get binaryCodeSubtitle => 'İKİLİ KODLARI ONDALIK SAYILARA DÖNÜŞTÜRÜN.';

  @override
  String get moduloClockTitle => 'Modülo Saat';

  @override
  String get moduloClockSubtitle =>
      'SAATLERİ KULLANARAK MATEMATİK DENKLEMLERİNİ HESAPLAYIN.';

  @override
  String get chimpTestTitle => 'Şempanze Testi';

  @override
  String get chimpTestSubtitle => 'RASTGELE SAYILARA ARTAN SIRADA DOKUNUN.';

  @override
  String get relationalMemoryTitle => 'İlişkisel Bellek';

  @override
  String get relationalMemorySubtitle =>
      'TAM IZGARA ÖGESİ KONUMLARINI HATIRLAYIN.';

  @override
  String get factBinderTitle => 'Gerçek Bağlayıcı';

  @override
  String get factBinderSubtitle =>
      'SEMBOLLERİ BAĞLAYIN VE İFADELERİ HATIRLAYIN.';

  @override
  String get sourceMonitoringTitle => 'Kaynak İzleme';

  @override
  String get sourceMonitoringSubtitle => 'BAĞLAMI HATIRLAYIN.';

  @override
  String get klotskiTitle => 'Klotski Kaçışı';

  @override
  String get klotskiSubtitle => 'ÇIKIŞLARA ULAŞMAK İÇİN BLOKLARI KAYDIRIN.';

  @override
  String get homophoneHuntSubtitle => 'DOĞRU YAZIMI SEÇİN.';
}
