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
}
