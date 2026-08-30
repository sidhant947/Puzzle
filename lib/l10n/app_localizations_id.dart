// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Game Teka-Teki';

  @override
  String get home => 'Beranda';

  @override
  String get settings => 'Pengaturan';

  @override
  String get playAgain => 'Main Lagi';

  @override
  String get playNext => 'Main Berikutnya';

  @override
  String get seeCompleted => 'Tinjau';

  @override
  String get finish => 'Selesai';

  @override
  String get congrats => 'Selamat!';

  @override
  String get perfectGradient => 'Gradien Sempurna!';

  @override
  String get wellDone => 'Kerja Bagus!';

  @override
  String get timeUp => 'Waktu Habis!';

  @override
  String get victory => 'Kemenangan!';

  @override
  String get gameWin => 'BAGUS SEKALI!';

  @override
  String get completed => 'Selesai!';

  @override
  String get score => 'Skor';

  @override
  String get timeLeft => 'Waktu';

  @override
  String get trials => 'Percobaan';

  @override
  String get numberRule => 'Aturan Angka';

  @override
  String get colorRule => 'Aturan Warna';

  @override
  String get valid => 'Valid';

  @override
  String get invalid => 'Tidak Valid';

  @override
  String get even => 'Genap';

  @override
  String get odd => 'Ganjil';

  @override
  String get red => 'Merah';

  @override
  String get green => 'Hijau';

  @override
  String get blue => 'Biru';

  @override
  String get yes => 'Ya';

  @override
  String get no => 'Tidak';

  @override
  String get trueLabel => 'Benar';

  @override
  String get falseLabel => 'Salah';

  @override
  String get clear => 'Hapus';

  @override
  String get north => 'Utara';

  @override
  String get south => 'Selatan';

  @override
  String get east => 'Timur';

  @override
  String get west => 'Barat';

  @override
  String get target => 'Target';

  @override
  String get moves => 'Langkah';

  @override
  String get trialMode => 'Mode Percobaan';

  @override
  String get trialModeDescription =>
      'Selesaikan 20 teka-teki untuk selesai, bukan dengan pengatur waktu 60 detik';

  @override
  String get appearance => 'Tampilan';

  @override
  String get language => 'Bahasa';

  @override
  String get gameplay => 'Gameplay';

  @override
  String get supportUs => 'Dukung Kami';

  @override
  String get systemLegal => 'Sistem & Hukum';

  @override
  String get games => 'Game';

  @override
  String get solvedToday => 'Dipecahkan Hari Ini';

  @override
  String get searchGames => 'Cari Game...';

  @override
  String get readyToStart => 'SIAP MEMULAI LATIHAN OTAK ANDA?';

  @override
  String get greatStart => 'AWAL YANG HEBAT! PERTAHANKAN MOMENTUM.';

  @override
  String get onFire => 'LUAR BIASA! OTAK ANDA MENYUKAI INI.';

  @override
  String get incredible => 'HEBAT! ANDA ADALAH MASTER TEKA-TEKI.';

  @override
  String get noGamesMatch => 'TIDAK ADA GAME YANG COCOK DENGAN PENCARIAN ANDA';

  @override
  String get categoryAll => 'SEMUA';

  @override
  String get categoryAttention => 'PERHATIAN';

  @override
  String get categoryLogic => 'LOGIKA';

  @override
  String get categoryMath => 'MATEMATIKA';

  @override
  String get categoryWord => 'KATA';

  @override
  String get categoryMemory => 'MEMORI';

  @override
  String get categorySpatial => 'SPASIAL';

  @override
  String get themeLight => 'TERANG';

  @override
  String get themeDark => 'GELAP';

  @override
  String get themeSystem => 'SISTEM';

  @override
  String get starOnGithub => 'Beri Bintang di GitHub';

  @override
  String get sponsorOnGithub => 'Sponsori di GitHub';

  @override
  String get privacyPolicy => 'Kebijakan Privasi';

  @override
  String get termsOfService => 'Ketentuan Layanan';

  @override
  String get licenses => 'Lisensi';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return 'Anda memiliki $maxTries kesempatan untuk menemukan kata $wordLength huruf yang tersembunyi.';
  }

  @override
  String wordFoundMessage(String word) {
    return 'Kata berhasil ditemukan: $word';
  }

  @override
  String gameOverMessage(String word) {
    return 'Kata yang benar adalah: $word';
  }

  @override
  String get gameOver => 'Permainan Berakhir';

  @override
  String get crosswordTitle => 'Teka-Teki Silang';

  @override
  String get crosswordSubtitle =>
      'Lengkapi kisi dengan kata yang benar berdasarkan petunjuk yang diberikan.';

  @override
  String get wordSearchTitle => 'Cari Kata';

  @override
  String get radicalRootsTitle => 'Akar Radikal';

  @override
  String get radicalRootsSubtitle =>
      'Temukan akar kuadrat atau kubik dari angka yang diberikan. Bulatkan ke bilangan bulat terdekat jika diperlukan.';

  @override
  String get radicalRootsGoalReached => 'Target Tercapai!';

  @override
  String get radicalRootsTimeUp => 'Waktu Habis!';

  @override
  String radicalRootsScoreMessage(int score) {
    return 'Anda menghitung $score akar dengan benar!';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return 'Teruslah berlatih! Anda menghitung $score akar.';
  }

  @override
  String get radicalRootsStart => 'Mulai Menghitung';

  @override
  String get radicalRootsDescription =>
      'Anda memiliki waktu 60 detik untuk memecahkan sebanyak mungkin.';

  @override
  String get radicalRootsBest => 'Terbaik';

  @override
  String get radicalRootsSeconds => '60 DETIK';

  @override
  String get romanArithmeticTitle => 'Aritmetika Romawi';

  @override
  String get romanArithmeticSubtitle =>
      'Selesaikan soal penjumlahan dan pengurangan menggunakan Angka Romawi.';

  @override
  String get romanArithmeticGoalReached => 'Level Centurion!';

  @override
  String get romanArithmeticTimeUp => 'Waktu Habis!';

  @override
  String romanArithmeticScoreMessage(int score) {
    return 'Anda memecahkan $score soal Romawi!';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return 'Veni, Vidi, Vici! Anda memecahkan $score soal.';
  }

  @override
  String get romanArithmeticStart => 'Mulai Quest';

  @override
  String get romanArithmeticDescription =>
      'Konversikan dan selesaikan. Anda memiliki waktu 60 detik.';

  @override
  String get romanArithmeticBest => 'Terbaik';

  @override
  String get romanArithmeticSeconds => '60 DETIK';

  @override
  String get wordSearchSubtitle =>
      'Temukan semua kata tersembunyi di kisi. Seret untuk memilih.';

  @override
  String get missingVowelsTitle => 'Vokal yang Hilang';

  @override
  String get missingVowelsSubtitle =>
      'Identifikasi kata dengan huruf vokal tersembunyi.';

  @override
  String get missingVowelsWin => 'Vokal Dipulihkan!';

  @override
  String get missingVowelsHowToPlay =>
      'Sebuah kata ditampilkan dengan huruf vokal (A, E, I, O, U) tersembunyi. Tebak kata lengkapnya!';

  @override
  String get wordScrambleTitle => 'Acak Kata';

  @override
  String get wordScrambleSubtitle =>
      'Ketuk huruf untuk menyusun kata yang tersembunyi!';

  @override
  String get wordScrambleWin => 'Kata Terpecahkan!';

  @override
  String get sudokuTitle => 'Sudoku';

  @override
  String get sudokuSubtitle =>
      'Lengkapi kisi sehingga setiap baris, kolom, dan kotak 3x3 berisi semua angka dari 1 hingga 9.';

  @override
  String get minesweeperTitle => 'Minesweeper';

  @override
  String get minesweeperSubtitle =>
      'Identifikasi semua ranjau tanpa meledakkannya.';

  @override
  String get minesweeperWin => 'Kemenangan!';

  @override
  String get minesweeperMines => 'RANJAU';

  @override
  String get minesweeperStatus => 'STATUS';

  @override
  String get minesweeperWon => 'MENANG';

  @override
  String get minesweeperBoom => 'BOOM';

  @override
  String get minesweeperPlaying => 'BERMAIN';

  @override
  String get minesweeperReveal => 'UNGKAP';

  @override
  String get minesweeperFlag => 'BENDERA';

  @override
  String get game2048Title => '2048';

  @override
  String get game2048Subtitle =>
      'Geser ke arah mana pun untuk menggabungkan ubin dan mencapai ubin 2048!';

  @override
  String get nonogramTitle => 'Nonogram';

  @override
  String get nonogramSubtitle =>
      'Ungkap gambar tersembunyi menggunakan petunjuk logika.';

  @override
  String get nonogramWin => 'Gambar Terungkap!';

  @override
  String get magnetsTitle => 'MAGNET';

  @override
  String get magnetsSubtitle =>
      'Tempatkan magnet di kisi berdasarkan jumlah kutub.';

  @override
  String get magnetsHowToPlay =>
      'Isi wadah seukuran domino dengan magnet \'+\' dan \'-\' atau biarkan kosong. Petunjuk baris dan kolom menentukan jumlah total setiap kutub di baris tersebut. Kutub yang identik tidak boleh berdekatan secara ortogonal.';

  @override
  String get magnetsWinTitle => 'POLARITAS SEIMBANG!';

  @override
  String get magnetsWinMessage => 'Semua magnet telah diatur dengan sempurna!';

  @override
  String get lighthousesTitle => 'MERCUSUAR';

  @override
  String get lighthousesSubtitle =>
      'Tempatkan kapal berdasarkan petunjuk mercusuar.';

  @override
  String get lighthousesHowToPlay =>
      'Tempatkan kapal 1x1 di kisi. Mercusuar menunjukkan jumlah total kapal yang terlihat secara horizontal dan vertikal. Kapal tidak boleh menyentuh mercusuar atau satu sama lain, bahkan secara diagonal.';

  @override
  String get lighthousesWinTitle => 'LAUT AMAN!';

  @override
  String get lighthousesWinMessage =>
      'Semua mercusuar memandu kapal dengan sempurna!';

  @override
  String get dominosaTitle => 'DOMINOSA';

  @override
  String get dominosaSubtitle =>
      'Temukan semua domino yang tersembunyi di kisi.';

  @override
  String get dominosaHowToPlay =>
      'Susun satu set lengkap domino pada kisi angka sedemikian rupa sehingga setiap pasangan angka yang berdekatan ditutupi oleh tepat satu domino. Setiap pasangan angka hanya ada satu kali dalam set tersebut.';

  @override
  String get dominosaWinTitle => 'MASTER DOMINO!';

  @override
  String get dominosaWinMessage =>
      'Setiap domino telah ditemukan và ditempatkan!';

  @override
  String get skyscrapersTitle => 'PENCERAK LANGIT';

  @override
  String get skyscrapersSubtitle => 'Isi kisi dengan ketinggian bangunan.';

  @override
  String get skyscrapersHowToPlay =>
      'Isi kisi dengan ketinggian (1-N) sedemikian rupa sehingga setiap baris dan kolom berisi setiap ketinggian tepat satu kali. Petunjuk di tepian menunjukkan berapa banyak bangunan yang terlihat dari arah tersebut, dengan bangunan yang lebih tinggi menghalangi yang lebih pendek.';

  @override
  String get skyscrapersWinTitle => 'CAKRAWALA DIPULIHKAN!';

  @override
  String get skyscrapersWinMessage =>
      'Semua bangunan diposisikan dengan sempurna!';

  @override
  String get nurikabeTitle => 'NURIKABE';

  @override
  String get nurikabeSubtitle =>
      'Bentuk laut yang terhubung dan pulau-pulau yang terpisah.';

  @override
  String get nurikabeHowToPlay =>
      'Arsir sel untuk membentuk satu \'laut\' yang terhubung (tidak ada blok 2x2). Sel yang tidak diarsir membentuk \'pulau\', masing-masing berisi tepat satu angka yang mewakili total luasnya.';

  @override
  String get nurikabeWinTitle => 'LAUT MENGALIR!';

  @override
  String get nurikabeWinMessage => 'Pulau-pulau terpisah, laut terhubung!';

  @override
  String get fillominoTitle => 'FILLOMINO';

  @override
  String get fillominoSubtitle =>
      'Bagi kisi menjadi poliomino dengan ukuran yang ditentukan.';

  @override
  String get fillominoHowToPlay =>
      'Bagi kisi menjadi poliomino sedemikian rupa sehingga setiap poliomino berukuran N berisi angka N di semua selnya. Poliomino dengan ukuran yang sama không boleh berdekatan secara ortogonal.';

  @override
  String get fillominoWinTitle => 'KISI TERBAGI!';

  @override
  String get fillominoWinMessage => 'Terpasang sempurna dengan logika!';

  @override
  String get hitoriTitle => 'HITORI';

  @override
  String get hitoriSubtitle =>
      'Arsir angka duplikat di setiap baris dan kolom.';

  @override
  String get hitoriHowToPlay =>
      'Arsir sel sehingga tidak ada angka yang muncul lebih dari satu kali di baris atau kolom mana pun. Sel yang diarsir tidak boleh berdekatan (secara ortogonal), và semua sel yang tidak diarsir harus membentuk satu kelompok yang terhubung.';

  @override
  String get hitoriWinTitle => 'MASTER HITORI!';

  @override
  String get hitoriWinMessage =>
      'Anda telah berhasil menyelesaikan semua duplikat!';

  @override
  String get pathFinderTitle => 'Pencari Jalur';

  @override
  String get pathFinderSubtitle => 'Temukan jalur tersembunyi dari S ke E.';

  @override
  String get pathFinderWin => 'Jalur Dikuasai!';

  @override
  String get howToPlay => 'Cara Bermain';

  @override
  String get gotIt => 'Paham';

  @override
  String get akariTitle => 'Akari';

  @override
  String get akariSubtitle => 'Terangi semua sel putih';

  @override
  String get akariHowToPlay =>
      'Tempatkan bola lampu di sel putih untuk menerangi seluruh kisi. Lampu menerangi baris dan kolomnya hingga menabrak dinding. Dua lampu tidak boleh saling menyinari. Dinding bernomor menunjukkan dengan tepat berapa banyak lampu yang harus ditempatkan di sel yang berdekatan (atas, bawah, kiri, kanan).';

  @override
  String get akariWinTitle => 'TERANG BENDERANG!';

  @override
  String get akariWinMessage => 'Semuanya diterangi dengan sempurna.';

  @override
  String get arithmeticChainTitle => 'Kalkulasi Berantai';

  @override
  String get arithmeticChainSubtitle => 'Hitung total berjalan di kepala Anda';

  @override
  String get arithmeticChainWinTitle => 'LEVEL UP!';

  @override
  String get arithmeticChainWinMessage =>
      'Perhitungan mental Anda sangat tajam!';

  @override
  String get arithmeticChainLoseTitle => 'COBA LAGI';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return 'Jawaban yang benar adalah $answer.';
  }

  @override
  String get arithmeticChainStart => 'MULAI';

  @override
  String get arithmeticChainNext => 'LANJUT';

  @override
  String get attentionalBlinkTitle => 'Kedipan Perhatian';

  @override
  String get attentionalBlinkSubtitleWatch => 'PERHATIKAN ANGKA-ANGKANYA';

  @override
  String get attentionalBlinkSubtitleInput =>
      'MASUKKAN DUA ANGKA YANG ANDA LIHAT';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return 'Anda mencetak $score target!';
  }

  @override
  String get balanceScaleTitle => 'Timbangan';

  @override
  String get balanceScaleSubtitle =>
      'Deduksikan berat item terakhir berdasarkan timbangan.';

  @override
  String get balanceScaleWinTitle => 'SEIMBANG!';

  @override
  String get balanceScaleWinMessage =>
      'Anda berhasil mendeduksi beratnya dengan benar!';

  @override
  String get balanceScaleLoseTitle => 'TIDAK SEIMBANG';

  @override
  String get balanceScaleLoseMessage =>
      'Coba lagi untuk menemukan keseimbangan yang benar.';

  @override
  String get balanceScaleBack => 'KEMBALI';

  @override
  String get balanceScaleSubmit => 'KIRIM';

  @override
  String get binaryPuzzleTitle => 'Teka-Teki Biner';

  @override
  String get binaryPuzzleSubtitle =>
      'Isi dengan 0 dan 1. Maksimal dua digit sama yang bersebelahan. Jumlah 0 dan 1 harus sama di setiap baris dan kolom.';

  @override
  String get binaryPuzzleWinTitle => 'KERJA BAGUS';

  @override
  String get binaryPuzzleWinMessage =>
      'Anda memecahkan teka-teki biner dengan logika sempurna!';

  @override
  String get blockEscapeTitle => 'Escape Balok';

  @override
  String get blockEscapeSubtitle =>
      'Geser balok untuk membersihkan jalur agar balok utama dapat mencapai pintu keluar.';

  @override
  String get blockEscapeWinTitle => 'BERHASIL KELUAR!';

  @override
  String get blockEscapeWinMessage =>
      'Anda berhasil membersihkan jalur untuk balok utama!';

  @override
  String get boxCompletionTitle => 'Penyusunan Kotak';

  @override
  String get boxCompletionSubtitle => 'Kubus mana yang dapat terbentuk?';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return 'Skor Anda $score benar dari $totalTrials!';
  }

  @override
  String get boxCompletionOptions => 'PILIHAN';

  @override
  String get bridgesTitle => 'Jembatan';

  @override
  String get bridgesSubtitle =>
      'Hubungkan pulau-pulau dengan jembatan. Setiap pulau membutuhkan jumlah jembatan tertentu. Jembatan tidak boleh saling bersilangan.';

  @override
  String get bridgesWinTitle => 'TERHUBUNG!';

  @override
  String get bridgesWinMessage => 'Anda berhasil menghubungkan semua pulau!';

  @override
  String get calculationSprintTitle => 'Sprint Berhitung';

  @override
  String get calculationSprintSubtitle =>
      'Selesaikan persamaan sebanyak mungkin dalam 60 detik.';

  @override
  String get calculationSprintGoalReached => 'TARGET TERCAPAI!';

  @override
  String get calculationSprintTimeUp => 'WAKTUNYA HABIS';

  @override
  String calculationSprintScoreMessage(int score) {
    return 'Kecepatan menghitung yang luar biasa! Anda mencetak $score poin.';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return 'Anda mencetak $score poin. Cobalah untuk mengalahkan rekor terbaik Anda!';
  }

  @override
  String get calculationSprintBest => 'TERBAIK';

  @override
  String get calculationSprintSeconds => '60 DETIK';

  @override
  String get calculationSprintDescription =>
      'Selesaikan persamaan dengan cepat.\nJawaban yang salah mengurangi 3 detik!';

  @override
  String get calculationSprintStart => 'MULAI SPRINT';

  @override
  String get categoryFluencyTitle => 'Kefasihan Kategori';

  @override
  String get categoryFluencySubtitle =>
      'Masukkan item yang termasuk dalam kategori';

  @override
  String get categoryFluencyExpert => 'PAKAR KEFASIHAN!';

  @override
  String get categoryFluencyTimeUp => 'WAKTU HABIS!';

  @override
  String get categoryFluencyWinMessage =>
      'Anda memiliki kosakata yang sangat luas!';

  @override
  String categoryFluencyFoundMessage(int count) {
    return 'Anda menemukan $count kata.';
  }

  @override
  String get categoryFluencyCategoryLabel => 'Kategori:';

  @override
  String get categoryFluencyEnterItem => 'Masukkan item...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target kata';
  }

  @override
  String get changeBlindnessTitle => 'Kebutaan Perubahan';

  @override
  String get changeBlindnessSubtitle => 'TEMUKAN ITEM YANG BERUBAH';

  @override
  String changeBlindnessScore(int score) {
    return 'SKOR: $score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return 'Anda menemukan $score perubahan!';
  }

  @override
  String get choiceRtTitle => 'Waktu Reaksi Pilihan';

  @override
  String get choiceRtSubtitle => 'Ketuk kotak aktif secepat mungkin';

  @override
  String choiceRtAvgMessage(String avg) {
    return 'Rata-rata waktu reaksi Anda: ${avg}ms';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return 'Sisa Waktu: $time detik';
  }

  @override
  String choiceRtTaps(int count) {
    return 'Ketukan: $count';
  }

  @override
  String get colorFloodTitle => 'Banjir Warna';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return 'Langkah: $moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => 'BANJIR BERHASIL!';

  @override
  String get colorFloodDryLand => 'DARATAN KERING...';

  @override
  String get colorFloodWinMessage =>
      'Anda membasahi seluruh kisi dengan warna!';

  @override
  String get colorFloodLoseMessage => 'Anda kehabisan langkah. Coba lagi!';

  @override
  String get colorMatchTitle => 'COCOKKAN WARNA';

  @override
  String get colorMatchSubtitle =>
      'Sesuaikan slider untuk mencocokkan warna target semirip mungkin.';

  @override
  String get colorMatchTarget => 'TARGET';

  @override
  String get colorMatchYours => 'MILIK ANDA';

  @override
  String get colorMatchCheck => 'PERIKSA KECOCOKAN';

  @override
  String get colorMatchResult => 'HASIL KECOCOKAN';

  @override
  String colorMatchAccuracy(String accuracy) {
    return 'Akurasi Anda: $accuracy%';
  }

  @override
  String get corsiBlocksTitle => 'Blok Corsi';

  @override
  String get corsiBlocksSubtitle =>
      'Perhatikan blok menyala dan ketuk dalam urutan yang sama.';

  @override
  String get corsiBlocksWinTitle => 'MASTER SPASIAL!';

  @override
  String get corsiBlocksLoseTitle => 'TERSESAT DI LUAR ANGKASA';

  @override
  String corsiBlocksMessage(int score, int span) {
    return 'Anda mengingat $score urutan! Rentang memori spasial Anda mencapai $span.';
  }

  @override
  String get corsiBlocksWatch => 'PERHATIKAN POLANYA';

  @override
  String get corsiBlocksRepeat => 'ULANGI POLANYA';

  @override
  String get corsiBlocksExcellent => 'HEBAT!';

  @override
  String get corsiBlocksSpan => 'RENTANG';

  @override
  String get crownTitle => 'Mahkota';

  @override
  String get crownSubtitle =>
      'Tempatkan satu mahkota di setiap baris, kolom, dan wilayah warna. Mahkota tidak boleh bersebelahan, bahkan secara diagonal.';

  @override
  String get crownCrowned => 'MAHKOTA DITEMPATKAN!';

  @override
  String get crownSuccess =>
      'Semua mahkota berhasil ditempatkan dengan logika sempurna.';

  @override
  String get cryptogramTitle => 'Kriptogram';

  @override
  String get cryptogramSubtitle =>
      'Tetapkan huruf untuk memecahkan kode pesan rahasia! Setiap huruf yang disandikan mewakili huruf asli.';

  @override
  String get cryptogramBroken => 'KODE TERPECAHKAN!';

  @override
  String get cryptogramEncrypted => 'TERENKRIPSI';

  @override
  String get cryptogramSuccess => 'Anda memecahkan kode pesan dengan sempurna.';

  @override
  String get cryptogramTryAgain => 'Coba lagi untuk memecahkan enkripsi.';

  @override
  String get digitSpanReverseTitle => 'Rentang Terbalik';

  @override
  String get digitSpanReverseSubtitleMemorize => 'Hafalkan digitnya';

  @override
  String get digitSpanReverseSubtitleEnter =>
      'Masukkan digit dalam urutan TERBALIK';

  @override
  String get digitSpanReverseWinTitle => 'LEVEL UP!';

  @override
  String get digitSpanReverseWinMessage => 'Memori kerja Anda luar biasa!';

  @override
  String get digitSpanReverseLoseTitle => 'COBA LAGI';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return 'Urutan terbalik yang benar adalah $sequence.';
  }

  @override
  String get dividedAttentionTitle => 'Fokus Terbagi';

  @override
  String get dividedAttentionSubtitle =>
      'Ketuk KIRI untuk BINTANG ⭐ | Ketuk KANAN untuk MERAH 🔴';

  @override
  String get dividedAttentionGameOverTitle => 'FOKUS TERPECAH';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return 'Multitasking itu sulit! Skor Anda adalah $score.';
  }

  @override
  String dividedAttentionScore(int score) {
    return 'SKOR: $score';
  }

  @override
  String get doubleNBackTitle => 'Double N-Back';

  @override
  String doubleNBackSubtitle(int n) {
    return 'Cocokkan stimulus $n langkah sebelumnya';
  }

  @override
  String get doubleNBackGameOverTitle => 'GAME OVER';

  @override
  String doubleNBackGameOverMessage(int score) {
    return 'Anda mencetak $score poin di Double N-Back!';
  }

  @override
  String doubleNBackScore(int score) {
    return 'Skor: $score';
  }

  @override
  String get doubleNBackPositionMatch => 'COCOKKAN POSISI';

  @override
  String get doubleNBackLetterMatch => 'COCOKKAN HURUF';

  @override
  String get faceNameAssociationTitle => 'Wajah & Nama';

  @override
  String get faceNameAssociationSubtitleStudy =>
      'Hafalkan nama untuk setiap wajah';

  @override
  String get faceNameAssociationSubtitleTest => 'Siapa ini?';

  @override
  String get faceNameAssociationPerfect => 'SEMPURNA!';

  @override
  String get faceNameAssociationGameOver => 'GAME OVER';

  @override
  String get faceNameAssociationWinMessage =>
      'Anda memiliki ingatan yang hebat untuk wajah dan nama!';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return 'Anda menjawab $correct benar dari $total.';
  }

  @override
  String get faceNameAssociationStartTest => 'MULAI TES';

  @override
  String get flankerTestWinTitle => 'FOKUS LASER!';

  @override
  String get flankerTestLoseTitle => 'TERALIHKAN';

  @override
  String flankerTestScoreMessage(int score) {
    return 'Anda menjawab $score dengan benar!';
  }

  @override
  String get flankerTestTitle => 'TES FLANKER';

  @override
  String get flankerTestSubtitle =>
      'Tunjukkan arah panah tengah, abaikan panah di sampingnya.';

  @override
  String get flankerTestLeft => 'KIRI';

  @override
  String get flankerTestRight => 'KANAN';

  @override
  String get fractionMatchTitle => 'Pencocokan Pecahan';

  @override
  String get fractionMatchSubtitle => 'Cocokkan gambar dengan pecahannya';

  @override
  String get fractionMatchLoseTitle => 'PECAHAN TIDAK COCOK';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return 'Jawaban yang benar adalah $correctAnswer.';
  }

  @override
  String get goNoGoTitle => 'Go / No-Go';

  @override
  String get goNoGoSubtitle => 'Ketuk untuk Hijau, ABAIKAN Merah!';

  @override
  String get goNoGoLoseTitle => 'REAKSI TERHENTI';

  @override
  String get goNoGoLoseMessage => 'Kontrol hambatan Anda sedang diuji!';

  @override
  String get goNoGoTapAnywhere => 'KETUK DI MANA SAJA UNTUK MULAI';

  @override
  String get groceryListTitle => 'Daftar Belanja';

  @override
  String get groceryListSubtitleMemorize => 'Hafalkan item dan kategorinya';

  @override
  String get groceryListSubtitleTest => 'Kategori mana item ini termasuk?';

  @override
  String get groceryListWinTitle => 'GURU BELANJA!';

  @override
  String get groceryListLoseTitle => 'ADA YANG LUPA?';

  @override
  String groceryListScoreMessage(int score) {
    return 'Anda mencetak $score poin di Daftar Belanja!';
  }

  @override
  String get groceryListReady => 'SAYA SIAP';

  @override
  String get groceryListWhereBelong => 'DI MANA ITEM INI TERMASUK?';

  @override
  String get hueSortTitle => 'Urutkan Warna';

  @override
  String get hueSortSubtitle =>
      'Tukar ubin untuk membuat transisi yang mulus antara warna sudut. Titik menunjukkan ubin tetap.';

  @override
  String get hueSortWinTitle => 'GRADIEN SEMPURNA!';

  @override
  String get hueSortWinMessage =>
      'Anda mengurutkan spektrum warna dengan sempurna!';

  @override
  String hueSortWrongTiles(int count) {
    return 'Ubin di posisi yang salah: $count';
  }

  @override
  String get kenkenTitle => 'KenKen';

  @override
  String get kenkenWinTitle => 'JENIUS!';

  @override
  String get kenkenLoseTitle => 'GAME OVER';

  @override
  String get kenkenWinMessage => 'Anda memecahkan teka-teki KenKen!';

  @override
  String get kenkenLoseMessage => 'Periksa aturan baris/kolom dan kotak.';

  @override
  String kenkenSubtitle(int size) {
    return 'Isi 1-$size tanpa pengulangan di baris/kolom';
  }

  @override
  String get letterCancellationTitle => 'Pembatalan Huruf';

  @override
  String get letterCancellationTitleFull => 'Pembatalan Huruf';

  @override
  String letterCancellationScoreMessage(int score) {
    return 'Anda menemukan $score huruf!';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return 'Temukan semua huruf \"$target\"';
  }

  @override
  String get letterCancellationFound => 'DITEMUKAN';

  @override
  String get letterCancellationTime => 'WAKTU';

  @override
  String get lightsOutTitle => 'Lights Out';

  @override
  String get lightsOutSubtitle =>
      'Ketukan pada ubin akan mengubah ubin tersebut dan ubin yang berdekatan. Matikan semua lampu untuk memecahkannya.';

  @override
  String get lightsOutWinTitle => 'TEKA-TEKI TERPECAHKAN!';

  @override
  String get lightsOutWinMessage => 'Anda berhasil mematikan semua lampu!';

  @override
  String get symmetryTitle => 'Simetri';

  @override
  String get symmetrySubtitle =>
      'Cerminkan pola di sebelah kiri ke kisi kosong di sebelah kanan.';

  @override
  String get semanticLinkTitle => 'Tautan Semantik';

  @override
  String get semanticLinkSubtitle =>
      'Temukan kata yang menghubungkan ketiganya';

  @override
  String get reflexTapTitle => 'Ketuk Refleks';

  @override
  String get visualStatisticalLearningTitle => 'Pembelajaran Visual';

  @override
  String get orbitTapTitle => 'Ketuk Orbit';

  @override
  String get orbitTapSubtitle => 'Ketuk saat bola sejajar dengan celah';

  @override
  String get orbitTapTapToHit => 'Ketuk saat bola memasuki gerbang';

  @override
  String get schulteTableTitle => 'Tabel Schulte';

  @override
  String get multipleObjectTrackingTitle => 'Pelacak Objek';

  @override
  String get multipleObjectTrackingSubtitle =>
      'Perhatikan objek yang disorot. Lacak objek saat bergerak, lalu pilih objek tersebut.';

  @override
  String get sdmtTitle => 'Tes SDMT';

  @override
  String get sdmtSubtitle =>
      'Gunakan kunci di atas untuk menemukan digit dari simbol yang ditampilkan.';

  @override
  String get memoryMatrixTitle => 'Matriks Memori';

  @override
  String get memoryMatrixSubtitle => 'Hafalkan pola dan ketuk ubinnya.';

  @override
  String get mentalAbacusTitle => 'Sempoa Mental';

  @override
  String get mentalAbacusSubtitle => 'Selesaikan menggunakan Soroban';

  @override
  String get spellingSprintTitle => 'Sprint Ejaan';

  @override
  String get spellingSprintSubtitle =>
      'Berlomba dengan waktu untuk mengeja kata sebanyak mungkin.';

  @override
  String get stopSignalTitle => 'Sinyal Berhenti';

  @override
  String get stopSignalSubtitle =>
      'Ketuk arah panah, tetapi BERHENTI segera jika panah berubah menjadi MERAH.';

  @override
  String get staircaseMemoryTitle => 'Memori Tangga';

  @override
  String get vigilanceTaskTitle => 'Tugas Kewaspadaan';

  @override
  String get vigilanceTaskSubtitle =>
      'Ketuk tombol ketika jarum melompati posisi';

  @override
  String get logicalSyllogismsTitle => 'Silogisme Logis';

  @override
  String get logicalSyllogismsSubtitle =>
      'Apakah kesimpulan tersebut valid secara logis?';

  @override
  String get mathPathTitle => 'Jalur Matematika';

  @override
  String get mathPathSubtitle =>
      'Temukan jalur yang menghasilkan jumlah tepat sesuai target.';

  @override
  String get sternbergTaskTitle => 'Tugas Sternberg';

  @override
  String get sternbergTaskMemorize => 'Hafalkan huruf-hurufnya';

  @override
  String get sternbergTaskWasLetterSet =>
      'Apakah huruf ini ada dalam kumpulan?';

  @override
  String sternbergTaskScore(int score) {
    return 'Anda mencetak $score poin di Tugas Sternberg!';
  }

  @override
  String get verbalAnalogiesTitle => 'Analogi Verbal';

  @override
  String get verbalAnalogiesSubtitle => 'Lengkapi hubungan tersebut';

  @override
  String get typingSpeedTitle => 'Kecepatan Mengetik';

  @override
  String get typingSpeedSubtitle =>
      'Ketik frasa persis seperti yang ditampilkan secepat mungkin!';

  @override
  String get wordLadderTitle => 'Tangga Kata';

  @override
  String get wordLadderSubtitle =>
      'Hubungkan kata dengan mengubah satu huruf pada satu waktu.';

  @override
  String get tangleFixTitle => 'Pengurai Kusut';

  @override
  String get tangleFixSubtitle =>
      'Urai garis-garisnya agar tidak ada yang saling bersilangan';

  @override
  String get oddRotationTitle => 'Rotasi Ganjil';

  @override
  String get oddRotationSubtitle =>
      'Salah satu dari ini dicerminkan. Bisakah Anda menemukannya?';

  @override
  String get towerOfLondonTitle => 'Menara London';

  @override
  String get towerOfLondonSubtitle => 'Cocokkan konfigurasi target';

  @override
  String get symbolicFlankerTitle => 'Flanker Simbolik';

  @override
  String get symbolicFlankerSubtitle => 'Fokus pada simbol tengah';

  @override
  String get stroopTestTitle => 'Tes Stroop';

  @override
  String get stroopTestSubtitle =>
      'Identifikasi warna tinta kata yang ditampilkan. Abaikan kata yang sebenarnya tertulis!';

  @override
  String get wisconsinCardSortingTitle => 'Penyortiran Kartu Wisconsin';

  @override
  String get wisconsinCardSortingSubtitle =>
      'COCOKKAN KARTU DENGAN SALAH SATU DARI EMPAT KARTU DI ATAS';

  @override
  String get nBackTitle => 'Tes N-Back';

  @override
  String get nBackSubtitle =>
      'Ketuk COCOK jika huruf saat ini cocok dengan yang ditampilkan 2 langkah sebelumnya.';

  @override
  String get rhythmMasterTitle => 'Master Ritme';

  @override
  String get rhythmMasterSubtitle => 'Ketuk selaras dengan denyut';

  @override
  String get pixelMimicTitle => 'Peniru Piksel';

  @override
  String get targetNumberTitle => 'Target 24';

  @override
  String targetNumberSubtitle(int target) {
    return 'Gunakan keempat angka untuk mencapai $target';
  }

  @override
  String get mirrorTracingTitle => 'Tracer Cermin';

  @override
  String get mirrorTracingSubtitle =>
      'Jiplak bintang! Kontrol dicerminkan secara terbalik.';

  @override
  String get wordSurgeTitle => 'Gelombang Kata';

  @override
  String get wordSurgeSubtitle => 'Sinonim & Antonim';

  @override
  String get perspectiveTakingTitle => 'Pengambilan Perspektif';

  @override
  String get perspectiveTakingTopDownView => 'TAMPILAN ATAS-BAWAH';

  @override
  String get perspectiveTakingChoosePerspective => 'PILIH PERSPEKTIF';

  @override
  String get perspectiveTakingCongrats =>
      'Anda memiliki pandangan tajam untuk hubungan spasial.';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return 'Tampilan mana yang dari arah $targetDirName?';
  }

  @override
  String get paperFoldingTitle => 'Lipatan Kertas';

  @override
  String get paperFoldingSubtitle => 'Seperti apa bentuknya jika dibuka?';

  @override
  String get waterSortTitle => 'Urutkan Air';

  @override
  String get waterSortSubtitle =>
      'Urutkan warna sehingga setiap tabung hanya berisi satu warna.';

  @override
  String get numericalEstimationTitle => 'Estimasi Numerik';

  @override
  String get numericalEstimationSubtitle =>
      'Pilih jawaban terdekat dengan cepat!';

  @override
  String get lockPatternTitle => 'Pola Kunci';

  @override
  String get lockPatternSubtitle =>
      'Temukan pola rahasia. Setiap tebakan memberikan umpan balik tentang posisi dan titik.';

  @override
  String get primeHunterTitle => 'Prime Hunter';

  @override
  String get primeHunterSubtitle =>
      'Geser KIRI untuk PRIMA | Geser KANAN untuk KOMPOSIT';

  @override
  String get tracePathTitle => 'Jiplak Jalur';

  @override
  String get tracePathSubtitle => 'Ikuti jalur target sedekat mungkin';

  @override
  String get ruleSwitcherTitle => 'Pengalih Aturan';

  @override
  String get ruleSwitcherSubtitle => 'Terapkan aturan saat ini';

  @override
  String get choiceReactionTimeTitle => 'Waktu Reaksi Pilihan';

  @override
  String get pathRecallTitle => 'Ingatan Jalur';

  @override
  String get switchTaskTitle => 'Alih Tugas';

  @override
  String get switchTaskSubtitle =>
      'Perhatikan aturannya! Aturan akan beralih antara mencocokkan bentuk dan mencocokkan warna.';

  @override
  String get mentalRotationTitle => 'Rotasi Mental';

  @override
  String get mentalRotationSubtitle =>
      'Apakah bentuk-bentuk ini sama, hanya diputar?';

  @override
  String get missingOperatorTitle => 'Campuran Operator';

  @override
  String get missingOperatorSubtitle =>
      'Isi kekosongan untuk menyelesaikan persamaan';

  @override
  String get wordMastermindTitle => 'Kata Mastermind';

  @override
  String get wordMastermindSubtitle =>
      'Pecahkan kode 4 huruf! Bulls (B) adalah posisi tepat, Cows (C) adalah posisi salah.';

  @override
  String get simonSequenceTitle => 'Urutan Simon';

  @override
  String get symbolLogicTitle => 'Logika Simbol';

  @override
  String get symbolLogicSubtitle =>
      'Selesaikan persamaan visual untuk menemukan nilai setiap simbol. Apa hasil dari persamaan terakhir?';

  @override
  String get silhouetteMatchTitle => 'Pencocokan Siluet';

  @override
  String get silhouetteMatchSubtitle =>
      'Siluet mana yang cocok dengan objek ini?';

  @override
  String get operationSpanTitle => 'Operation Span';

  @override
  String get operationSpanMathPhase => 'Apakah persamaannya benar?';

  @override
  String get operationSpanLetterPhase => 'Ingat hurufnya';

  @override
  String get operationSpanRecallPhase =>
      'Ingat huruf-hurufnya secara berurutan';

  @override
  String get operationSpanRoundComplete => 'Putaran Selesai!';

  @override
  String operationSpanScore(int score) {
    return 'Anda mencetak $score poin di Operation Span!';
  }

  @override
  String get slidePuzzleTitle => 'Slide Puzzle';

  @override
  String get slidePuzzleNewGame => 'GAME BARU';

  @override
  String get slidePuzzleInstructions =>
      'Susun kembali ubin ke dalam urutan numerik dengan menggesernya ke ruang kosong.';

  @override
  String get slidePuzzleTileSlider => 'TILE SLIDER';

  @override
  String get slidePuzzleCongrats => 'Anda telah berhasil menyusun semua ubin.';

  @override
  String get visualSearchTitle => 'Pencarian Visual';

  @override
  String get visualSearchSubtitle => 'Temukan simbol unik di kisi';

  @override
  String get trailMakingTitle => 'Trail Making';

  @override
  String get trailMakingSubtitle =>
      'Hubungkan angka secara berurutan (1 -> 2 -> 3...) secepat mungkin.';

  @override
  String get matrixReasoningTitle => 'Penalaran Matriks';

  @override
  String get matrixReasoningSubtitle => 'Lengkapi pola dalam kisi 3x3';

  @override
  String get tentsAndTreesTitle => 'Tenda & Pohon';

  @override
  String get tentsAndTreesSubtitle =>
      'Tempatkan tenda di sebelah pohon. Angka menunjukkan berapa banyak tenda di setiap baris/kolom. Tenda tidak boleh saling bersentuhan.';

  @override
  String get quickMathTitle => 'Matematika Cepat';

  @override
  String get magicSquaresTitle => 'Kotak Ajaib';

  @override
  String magicSquaresSubtitle(int targetSum) {
    return 'Setiap baris, kolom, dan diagonal harus berjumlah $targetSum';
  }

  @override
  String get objectShuffleTitle => 'Kocok Objek';

  @override
  String get pipesTitle => 'Pipa';

  @override
  String get pipesSubtitle =>
      'Hubungkan titik-titik berwarna sama dengan pipa.';

  @override
  String get oddOneOutTitle => 'Cari yang Berbeda';

  @override
  String get oddOneOutSubtitle => 'Temukan ubin dengan warna yang berbeda.';

  @override
  String get einsteinRiddleTitle => 'TEKA-TEKI EINSTEIN';

  @override
  String get einsteinRiddleSubtitle =>
      'Gunakan petunjuk untuk mendeduksi atribut masing-masing rumah.';

  @override
  String get einsteinRiddleHowToPlay =>
      'Masing-masing rumah memiliki atribut unik (warna, kebangsaan, hewan peliharaan, dll.). Gunakan petunjuk yang disediakan untuk mengisi kisi dan menemukan solusi lengkap.';

  @override
  String get einsteinRiddleColor => 'Warna';

  @override
  String get einsteinRiddleNationality => 'Kebangsaan';

  @override
  String get einsteinRiddleDrink => 'Minuman';

  @override
  String get einsteinRiddlePet => 'Hewan Peliharaan';

  @override
  String get einsteinRiddleSmoke => 'Rokok';

  @override
  String get einsteinRiddleHouse => 'Rumah';

  @override
  String get mirrorImageTitle => 'Gambar Cermin';

  @override
  String get mirrorImageSubtitle => 'Identifikasi refleksi cermin yang benar.';

  @override
  String get mirrorImageHowToPlay =>
      'Lihatlah bentuk dan pilih refleksi cermin yang benar dari opsi yang disediakan.';

  @override
  String get mentalMappingTitle => 'Pemetaan Mental';

  @override
  String get mentalMappingSubtitle =>
      'Ikuti petunjuk arah dan temukan tujuannya.';

  @override
  String get mentalMappingHowToPlay =>
      'Anda akan diperlihatkan urutan petunjuk arah (Utara, Selatan, Timur, Barat). Ikuti langkah-langkah ini secara mental mulai dari pusat kisi dan pilih tujuan akhir.';

  @override
  String get memoryPalaceTitle => 'Istana Memori';

  @override
  String get memoryPalaceSubtitle =>
      'Ingat kata mana yang berada di lokasi mana.';

  @override
  String get memoryPalaceHowToPlay =>
      'Sekumpulan kata akan muncul di berbagai lokasi pada kisi. Hafalkan posisi mereka. Kemudian, Anda akan diminta untuk menempatkan kata-kata tersebut kembali ke lokasi asalnya.';

  @override
  String get countingSheepTitle => 'Menghitung Domba';

  @override
  String get countingSheepSubtitle => 'Berapa banyak domba yang Anda lihat?';

  @override
  String get countingSheepHowToPlay =>
      'Domba akan berlari melintasi layar dengan cepat. Hitung domba saat mereka lewat dan masukkan jumlah totalnya di akhir.';

  @override
  String get faceTraitAssociationTitle => 'Wajah & Sifat';

  @override
  String get faceTraitAssociationSubtitle =>
      'Hafalkan sifat-sifat untuk setiap wajah';

  @override
  String get faceTraitAssociationHowToPlay =>
      'Anda akan diperlihatkan beberapa wajah, masing-masing dengan nama, pekerjaan, dan hobi. Hafalkan asosiasi ini. Nanti, Anda akan diminta untuk mengingat sifat spesifik dari masing-masing wajah.';

  @override
  String get mentalCalendarTitle => 'Kalender Mental';

  @override
  String get mentalCalendarSubtitle => 'Hitung hari dalam seminggu';

  @override
  String get mentalCalendarHowToPlay =>
      'Tanggal acak akan ditampilkan. Gunakan perhitungan mental (atau algoritma Doomsday) untuk menentukan hari apa dalam seminggu tanggal tersebut jatuh.';

  @override
  String get vocabularyBuilderTitle => 'Vocabulary Builder';

  @override
  String get vocabularyBuilderSubtitle =>
      'Cocokkan sinonim dan antonim di bawah tekanan waktu.';

  @override
  String get vocabularyBuilderHowToPlay =>
      'Anda akan diperlihatkan kata target dan hubungan (Sinonim atau Antonim). Pilih kata yang benar dari opsi yang cocok dengan hubungan tersebut. Cepatlah, waktu terus berjalan!';

  @override
  String get correct => 'BENAR';

  @override
  String get incorrect => 'SALAH';

  @override
  String get grammarPoliceTitle => 'Polisi Tata Bahasa';

  @override
  String get grammarPoliceSubtitle =>
      'Identifikasi apakah kalimat tersebut benar secara tata bahasa atau mengandung kesalahan.';

  @override
  String get grammarPoliceHowToPlay =>
      'Sebuah kalimat akan muncul di tengah layar. Tentukan apakah kalimat tersebut benar secara tata bahasa atau mengandung kesalahan. Ketuk \'BENAR\' jika baik-baik saja, atau \'SALAH\' jika Anda menemukan kesalahan. Jangan sampai kehilangan semua nyawa Anda!';

  @override
  String get reverseStroopTitle => 'Reverse Stroop';

  @override
  String get reverseStroopSubtitle =>
      'Variasi tes Stroop di mana fokusnya dialihkan.';

  @override
  String get reverseStroopHowToPlay =>
      'Perhatikan instruksinya! Jika tertulis \'TEKS\', cocokkan arti kata tersebut. Jika tertulis \'WARNA\', cocokkan warna tinta. Aturan akan sering beralih untuk menguji fokus Anda.';

  @override
  String get game2048Instruction =>
      'GESER KE ARAH MANA PUN UNTUK MENGGABUNGKAN';

  @override
  String get fibonacciMergeTitle => 'Penggabungan Fibonacci';

  @override
  String get fibonacciMergeSubtitle =>
      'Gabungkan angka-angka Fibonacci yang berurutan (1, 1, 2, 3, 5, 8, 13...).';

  @override
  String get sequenceSleuthTitle => 'Sequence Sleuth';

  @override
  String get sequenceSleuthSubtitle =>
      'Temukan angka yang hilang dalam urutan matematika.';

  @override
  String get divisibilityDashTitle => 'Divisibility Dash';

  @override
  String get divisibilityDashSubtitle =>
      'Ketuk semua pembagi satu digit (2-9) untuk angka yang diberikan.';

  @override
  String get percentagePeakTitle => 'Persentase Puncak';

  @override
  String get percentagePeakSubtitle =>
      'Selesaikan perhitungan persentase mental dengan cepat.';

  @override
  String get vennNumbersTitle => 'Angka Venn';

  @override
  String get vennNumbersSubtitle =>
      'Kategorikan angka-angka ke dalam wilayah diagram Venn yang benar.';

  @override
  String get commonDenominatorTitle => 'Penyebut Umum';

  @override
  String get commonDenominatorSubtitle =>
      'Temukan Faktor Persekutuan Terbesar atau Kelipatan Persekutuan Terkecil.';

  @override
  String get angleFinderTitle => 'Pencari Sudut';

  @override
  String get angleFinderSubtitle =>
      'Hitung sudut yang hilang dalam masalah geometri.';

  @override
  String get sumSnakeTitle => 'Sum Snake';

  @override
  String get sumSnakeSubtitle =>
      'Hubungkan angka-angka yang berdekatan untuk mencapai jumlah target.';

  @override
  String get baseShiftTitle => 'BLITZ PERGESERAN BASIS';

  @override
  String get baseShiftSubtitle => 'Selesaikan dalam desimal';

  @override
  String get baseShiftDescription =>
      'Selesaikan persamaan dan ketik jawaban dalam desimal (Basis 10).';

  @override
  String get baseShiftEquation => 'PERSAMAAN';

  @override
  String get baseShiftHint => 'Masukkan hasil desimal...';

  @override
  String get baseShiftCorrect => 'Benar!';

  @override
  String get baseShiftIncorrect => 'Salah!';

  @override
  String get baseShiftSubmit => 'KIRIM';

  @override
  String get baseShiftQuickGuide => 'Panduan Cepat:';

  @override
  String get baseShiftBinary => 'Biner (bin): Basis 2 (0, 1)';

  @override
  String get baseShiftHex => 'Heksadesimal (0x): Basis 16 (0-9, A-F)';

  @override
  String get baseShiftDecimal => 'Desimal (dec): Basis 10 (0-9)';

  @override
  String get baseShiftWinTitle => 'PENYIHIR MATEMATIKA!';

  @override
  String get baseShiftWinMessage =>
      'Anda berhasil memecahkan 5 persamaan pergeseran basis!';

  @override
  String get blockCount3DTitle => 'Hitung Balok 3D';

  @override
  String get blockCount3DSubtitle =>
      'SERET UNTUK MEROTASI • HITUNG BALOK YANG TERSEMBUNYI';

  @override
  String get blockCount3DHowMany => 'BERAPA BANYAK BALOK?';

  @override
  String get blockCount3DSubmitGuess => 'KIRIM TEBAKAN';

  @override
  String get blockCount3DNotQuite =>
      'Kurang tepat! Coba rotasikan untuk menghitung kembali.';

  @override
  String get blockCount3DExcellent => 'LUAR BIASA';

  @override
  String blockCount3DWinMessage(int count) {
    return 'Anda berhasil mengidentifikasi semua $count balok!';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '1. Seret jari Anda melintasi viewport 3D untuk merotasi tumpukan balok.\n\n2. Hitung semua balok dalam tumpukan.\n\n3. Ingat: sebuah balok yang menggantung di udara harus memiliki balok penopang struktural di bawahnya (balok tersembunyi!).\n\n4. Ketik jawaban Anda di kolom input dan ketuk \"KIRIM TEBAKAN\" untuk memeriksa.';

  @override
  String get alphabetSudokuTitle => 'SUDOKU ABJAD';

  @override
  String get alphabetSudokuSubtitle =>
      'Lengkapi kisi sehingga setiap baris, kolom, dan kotak berisi huruf A-I.';

  @override
  String get alphabetSudokuWinTitle => 'SUDOKU TERPECAHKAN!';

  @override
  String get alphabetSudokuWinMessage =>
      'Brilian! Anda menguasai huruf-huruf tersebut.';

  @override
  String get classicMazeTitle => 'Labirin Klasik';

  @override
  String get classicMazeSubtitle =>
      'JELAJAHI & PECAHKAN • LABIRIN BARU SETIAP PERMAINAN';

  @override
  String get classicMazeWinTitle => 'LABIRIN DISELESAIKAN';

  @override
  String classicMazeWinMessage(int count) {
    return 'Navigasi yang luar biasa! Anda menyelesaikan labirin dalam $count langkah.';
  }

  @override
  String get classicMazeMoves => 'LANGKAH: ';

  @override
  String get classicMazeHowToPlayDescription =>
      '1. Pandu kelereng kuning bercahaya (pemain) ke portal hijau (keluar) di kanan bawah.\n\n2. Gunakan gesekan di mana saja pada labirin, tombol panah keyboard fisik, atau tombol bantalan panah di bagian bawah untuk bergerak.\n\n3. Jejak ungu menunjukkan jalur yang telah Anda jelajahi. Telusuri kembali jejak Anda untuk menghapusnya secara dinamis!\n\n4. Beralih kesulitan dari bilah tindakan atas untuk menantang diri Anda dengan labirin yang lebih besar!';

  @override
  String get conjunctionSearchTitle => 'Conjunction Search';

  @override
  String get conjunctionSearchSubtitle => 'Fokus Perhatian & Konjungsi Fitur';

  @override
  String get conjunctionSearchWinTitle => 'VICTORY';

  @override
  String get conjunctionSearchWinMessage =>
      'Anda telah menemukan semua target dengan fokus perhatian yang sempurna!';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      'Kombinasi bentuk dan warna target tertentu akan ditampilkan dalam instruksi. Temukan dan ketuk di kisi padat secepat mungkin. Bentuk pengalih memiliki warna atau bentuk yang sama, jadi perhatikan baik-baik!';

  @override
  String get conjunctionSearchRound => 'PUTARAN: ';

  @override
  String get conjunctionSearchScore => 'SKOR: ';

  @override
  String get conjunctionSearchFind => 'TEMUKAN: ';

  @override
  String get shapeCircle => 'LINGKARAN';

  @override
  String get shapeSquare => 'PERSEGI';

  @override
  String get shapeTriangle => 'SEGITIGA';

  @override
  String get shapeStar => 'BINTANG';

  @override
  String get shapeRectangle => 'PERSEGI PANJANG';

  @override
  String get shapeEllipse => 'ELIPS';

  @override
  String get shapeTrapezoid => 'TRAPESIUM';

  @override
  String get colorRedLabel => 'MERAH';

  @override
  String get colorBlueLabel => 'BIRU';

  @override
  String get colorGreenLabel => 'HIJAU';

  @override
  String get colorAmberLabel => 'AMBER';

  @override
  String get cubeNetFoldTitle => 'Cube Net Fold';

  @override
  String get cubeNetFoldSubtitle => 'PILIH OPSI KUBUS 3D YANG COCOK';

  @override
  String get cubeNetFoldWinTitle => 'BENAR';

  @override
  String get cubeNetFoldWinMessage =>
      'Anda memiliki logika pelipatan spasial 3D yang sempurna!';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '1. Lihatlah jaring 2D terbuka di bagian atas.\n\n2. Lipat jaring tersebut secara mental menjadi kubus 3D.\n\n3. Pilih opsi di bawah yang mewakili perspektif 3D yang valid dari kubus yang dilipat tersebut.\n\n4. Hati-hati: sisi yang berlawanan di jaring tidak boleh bersebelahan di 3D, dan urutan sisi yang bersebelahan harus cocok!';

  @override
  String get cubeNetFoldUnfoldedNet => 'NET 2D TERBUKA';

  @override
  String get cubeNetFoldWhichMatches => 'KUBUS MANA YANG COCOK?';

  @override
  String get cubeNetFoldIncorrect =>
      'Logika pelipatan salah! Ketuk Reset atau ubah pilihan Anda.';

  @override
  String get cubeNetFoldSubmitChoice => 'KIRIM PILIHAN';

  @override
  String get cubeNetFoldFailed => 'GAGAL (KETUK RESET)';

  @override
  String get faceTraitAssociationMemorize => 'HAFALKAN KE-4 ORANG INI';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return 'ORANG KE $current DARI $total';
  }

  @override
  String get faceTraitAssociationWhatOccupation => 'APA PEKERJAAN MEREKA?';

  @override
  String get faceTraitAssociationWhatHobby => 'APA HOBI MEREKA?';

  @override
  String get faceTraitAssociationWinTitle => 'MASTER MEMORI!';

  @override
  String get faceTraitAssociationLoseTitle => 'GAME OVER';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return 'Anda menjawab $correct benar dari $total.';
  }

  @override
  String get topologyTitle => 'TOPOLOGI';

  @override
  String get topologySubtitle =>
      'Apakah bentuk-bentuk ini setara secara topologi? (Dapatkah salah satu diubah bentuknya menjadi yang lain tanpa memotong atau mengelem?)';

  @override
  String get topologyWinTitle => 'GEOMETRY GENIUS!';

  @override
  String get topologyWinMessage =>
      'Anda berhasil mengidentifikasi 10 pasangan topologi dengan benar!';

  @override
  String get topologyScore => 'SKOR: ';

  @override
  String get semanticDistanceTitle => 'Jarak Semantik';

  @override
  String get semanticDistanceSubtitle => 'Ukur jarak konseptual antar kata';

  @override
  String get oxymoronHuntTitle => 'Cari Oksimoron';

  @override
  String get oxymoronHuntSubtitle =>
      'Pasangkan kata-kata yang kontradiktif di dalam kisi';

  @override
  String get portmanteauSplitTitle => 'Pemisah Portmanteau';

  @override
  String get portmanteauSplitSubtitle =>
      'Identifikasi kata asal dari sebuah portmanteau';

  @override
  String get chainReactionTitle => 'Reaksi Berantai';

  @override
  String get chainReactionSubtitle =>
      'Hubungkan kata-kata menggunakan huruf yang tumpang tindih';

  @override
  String get rhymeMasterTitle => 'Ahli Rima';

  @override
  String get rhymeMasterSubtitle =>
      'Identifikasi kata-kata yang berima dengan target';

  @override
  String get definitionDashTitle => 'Sprint Definisi';

  @override
  String get definitionDashSubtitle =>
      'Cocokkan kata yang benar dengan definisinya';

  @override
  String get syllableStackTitle => 'Susun Suku Kata';

  @override
  String get syllableStackSubtitle =>
      'Susun suku kata untuk membentuk kata yang utuh';

  @override
  String get sentenceUnscrambleTitle => 'Susun Kalimat';

  @override
  String get sentenceUnscrambleSubtitle =>
      'Urutkan ulang kata-kata untuk membentuk kalimat yang valid';

  @override
  String get grammarSortTitle => 'Sortir Tata Bahasa';

  @override
  String get grammarSortSubtitle =>
      'Kategorikan kata-kata berdasarkan kelas katanya';

  @override
  String get vowelReconstructTitle => 'Rekonstruksi Vokal';

  @override
  String get vowelReconstructSubtitle =>
      'Isi huruf vokal yang hilang dalam kalimat';

  @override
  String get consonantReconstructTitle => 'Rekonstruksi Konsonan';

  @override
  String get consonantReconstructSubtitle =>
      'Isi huruf konsonan yang hilang dalam kalimat';

  @override
  String get homophoneHuntTitle => 'Cari Homofon';

  @override
  String get silentLetterSearchTitle => 'Cari Huruf Senyap';

  @override
  String get silentLetterSearchSubtitle =>
      'Identifikasi huruf senyap dalam kata-kata yang diberikan';

  @override
  String get palindromeBuilderTitle => 'Pembuat Palindrom';

  @override
  String get palindromeBuilderSubtitle =>
      'Buat palindrom dengan menambahkan huruf sesedikit mungkin';

  @override
  String get phoneticGuessTitle => 'Tebakan Fonetik';

  @override
  String get phoneticGuessSubtitle => 'Identifikasi kata dari ejaan fonetiknya';

  @override
  String get spoonerismSolverTitle => 'Penyelesai Spoonerisme';

  @override
  String get spoonerismSolverSubtitle =>
      'Identifikasi spoonerisme yang benar untuk frasa tersebut';

  @override
  String get etymonOddballTitle => 'Akar Kata Berbeda';

  @override
  String get etymonOddballSubtitle =>
      'Temukan kata yang tidak memiliki akar kata yang sama';

  @override
  String get etymologyOriginTitle => 'Asal-usul Etimologi';

  @override
  String get etymologyOriginSubtitle =>
      'Tebak bahasa asal dari kata serapan tersebut';

  @override
  String get affixFactoryTitle => 'Pabrik Imbuhan';

  @override
  String get affixFactorySubtitle =>
      'Buat kata-kata yang valid menggunakan awalan dan akhiran';

  @override
  String get cognateCatchTitle => 'Cari Kognat';

  @override
  String get cognateCatchSubtitle =>
      'Bedakan antara kognat sejati dan teman palsu';

  @override
  String get compoundConnectTitle => 'Gabungan Kata Majemuk';

  @override
  String get compoundConnectSubtitle =>
      'Gabungkan dua kata untuk membentuk kata majemuk';

  @override
  String get pangramSprintTitle => 'Sprint Pangram';

  @override
  String get pangramSprintSubtitle =>
      'Bangun kalimat menggunakan setiap huruf dalam alfabet';

  @override
  String get anagramDefinitionTitle => 'Anagram Definisi';

  @override
  String get anagramDefinitionSubtitle =>
      'Selesaikan anagram berdasarkan definisinya';

  @override
  String get letterBridgeTitle => 'Jembatan Huruf';

  @override
  String get letterBridgeSubtitle =>
      'Temukan huruf yang hilang yang menghubungkan dua kata';

  @override
  String get letterFrequencyScanTitle => 'Scan Frekuensi Huruf';

  @override
  String get letterFrequencyScanSubtitle =>
      'Hitung berapa kali sebuah huruf muncul dalam teks';

  @override
  String get oneLetterShiftTitle => 'Geser Satu Huruf';

  @override
  String get oneLetterShiftSubtitle =>
      'Ubah satu kata menjadi kata lain dengan perubahan satu huruf';

  @override
  String vocabularyBuilderMessage(String arg0) {
    return 'Kerja bagus! Kosakata Anda mengesankan. Skor: $arg0';
  }

  @override
  String get symmetryMessage =>
      'Anda mencerminkan pola dengan sempurna dengan presisi bedah.';

  @override
  String get temporalOrderMessage =>
      'Luar biasa! Memori urutan temporal Anda sangat akurat.';

  @override
  String get temporalOrderMessage1 =>
      'Memori urutan salah. Berlatih membuat sempurna!';

  @override
  String get wordSearchMessage =>
      'Semua kata berhasil ditemukan dengan pengamatan yang tajam.';

  @override
  String colorMatchMessage(String arg0) {
    return 'Akurasi Anda: $arg0%';
  }

  @override
  String semanticLinkMessage(String arg0) {
    return 'Anda mencetak $arg0 poin!';
  }

  @override
  String reflexTapMessage(String arg0) {
    return 'Anda mengetuk $arg0 target!';
  }

  @override
  String get angleFinderMessage => 'Intuisi geometris Anda sempurna!';

  @override
  String angleFinderMessage1(String arg0) {
    return 'Jawaban yang benar adalah $arg0°';
  }

  @override
  String angleFinderText(String arg0) {
    return '$arg0°';
  }

  @override
  String visualStatisticalLearningMessage(String arg0) {
    return 'Anda mencetak $arg0 pola yang benar!';
  }

  @override
  String nonogramText(String arg0) {
    return 'Kesalahan: $arg0';
  }

  @override
  String mentalCalendarMessage(String arg0) {
    return 'Anda benar $arg0 dari 10!';
  }

  @override
  String orbitTapMessage(String arg0) {
    return 'Anda berhasil mengetuk $arg0 kali!';
  }

  @override
  String schulteTableMessage(String arg0) {
    return 'Anda menyelesaikan tabel dalam $arg0.\nTeruslah berlatih untuk memperluas penglihatan tepi Anda!';
  }

  @override
  String get schulteTableText => 'MULAI TES';

  @override
  String get relationalMemoryMessage =>
      'Akurasi memori relasional spasial yang luar biasa!';

  @override
  String sudokuText(String arg0) {
    return 'Kesalahan: $arg0';
  }

  @override
  String sdmtMessage(String arg0) {
    return 'Anda mencocokkan $arg0 simbol! Tes ini mengukur kecepatan pemindaian dan perhatian visual Anda.';
  }

  @override
  String get futoshikiMessage =>
      'Luar biasa! Anda menyelesaikan Persegi Latin Futoshiki.';

  @override
  String letterFrequencyScanMessage(String arg0, String arg1) {
    return 'Anda menghitung dengan benar $arg0 kemunculan \"$arg1\".';
  }

  @override
  String letterFrequencyScanText(String arg0) {
    return 'Salah. Hitungannya adalah $arg0.';
  }

  @override
  String get memoryMatrixMessage =>
      'Mengesankan! Memori kerja Anda tajam. Target harian selesai!';

  @override
  String get memoryMatrixMessage1 =>
      'Fokus dan coba lagi untuk meningkatkan skor memori Anda.';

  @override
  String get contextCluesMessage =>
      'Luar biasa! Kosakata dan analisis kontekstual Anda sangat hebat.';

  @override
  String get contextCluesMessage1 =>
      'Kata yang salah dipilih! Latih penalaran konteks verbal Anda dan coba lagi.';

  @override
  String oneLetterShiftMessage(String arg0, String arg1) {
    return 'Anda menggeser $arg0 ke $arg1 dengan benar.';
  }

  @override
  String get mentalAbacusMessage =>
      'Aritmatika mental Anda berada di level atas.';

  @override
  String fractionMatcherMessage(String arg0) {
    return 'Anda mencetak $arg0 poin dalam mencocokkan representasi!';
  }

  @override
  String get spellingSprintMessage => 'Anda mengeja ke-10 kata dengan benar!';

  @override
  String spellingSprintMessage1(String arg0) {
    return 'Anda mengeja $arg0 kata.';
  }

  @override
  String stopSignalMessage(String arg0) {
    return 'Anda mencapai $arg0 respons yang benar! Tes ini mengukur kemampuan Anda untuk menahan tindakan yang direncanakan.';
  }

  @override
  String grammarPoliceMessage(String arg0) {
    return 'Permainan Berakhir! Anda menjaga keteraturan dalam dunia tata bahasa. Skor: $arg0';
  }

  @override
  String consonantReconstructMessage(String arg0) {
    return 'Anda merekonstruksi skor sebesar $arg0!';
  }

  @override
  String rhymeMasterMessage(String arg0, String arg1) {
    return 'Anda menemukan $arg0 dari $arg1 rima!';
  }

  @override
  String vigilanceTaskMessage(String arg0, String arg1, String arg2) {
    return 'Tepat: $arg0, Meleset: $arg1\nAlarm Palsu: $arg2';
  }

  @override
  String get silhouetteMatchOrthoMessage =>
      'Anda memiliki keterampilan penyelarasan ortografis yang tanpa cela!';

  @override
  String get silhouetteMatchOrthoText => 'MENGERTI';

  @override
  String get silhouetteMatchOrthoText1 =>
      'Proyeksi perspektif salah! Ketuk Atur Ulang untuk mencoba lagi.';

  @override
  String fibonacciMergeMessage(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String factorFinderMessage(String arg0) {
    return 'Anda mencetak $arg0 poin dengan menemukan semua faktor!';
  }

  @override
  String logicalSyllogismsMessage(String arg0) {
    return 'Anda menyelesaikan $arg0 silogisme dengan benar!';
  }

  @override
  String get rotatingMazeMessage =>
      'Anda berhasil menavigasi labirin berputar kinetik!';

  @override
  String get rotatingMazeText => 'MENGERTI';

  @override
  String get rotatingMazeText1 => '🌀 Labirin diputar 90°! Kisi bergeser!';

  @override
  String get mathPathMessage =>
      'Anda menemukan jalur yang jumlahnya mencapai target!';

  @override
  String get bridgesMessage => 'Anda berhasil menghubungkan semua pulau!';

  @override
  String compoundConnectMessage(String arg0, String arg1) {
    return 'Kata majemuknya adalah $arg0$arg1.';
  }

  @override
  String get pangramSprintMessage =>
      'Anda menyusun kalimat menggunakan semua 26 huruf.';

  @override
  String get mirrorImageMessage =>
      'Anda mengidentifikasi pantulan dengan sempurna.';

  @override
  String get mirrorImageText => 'GAMBAR PANTULAN';

  @override
  String reverseStroopMessage(String arg0) {
    return 'Anda mencetak $arg0 poin! Perhatikan instruksinya.';
  }

  @override
  String get verbalAnalogiesMessage =>
      'Anda memiliki pikiran yang tajam untuk sebuah hubungan.';

  @override
  String corsiBlocksMessage1(String arg0, String arg1) {
    return 'Anda mengingat $arg1 urutan! Rentang memori spasial Anda mencapai $arg0.';
  }

  @override
  String wordLadderMessage(String arg0, String arg1, String arg2) {
    return 'Anda berhasil menghubungkan $arg0 ke $arg1 dalam $arg2 langkah.';
  }

  @override
  String d2AttentionMessage(String arg0) {
    return 'Pemindaian selektif yang luar biasa! Skor akhir: $arg0.';
  }

  @override
  String get d2AttentionText => 'CARA BERMAIN';

  @override
  String get d2AttentionText1 => 'MENGERTI';

  @override
  String get tangleFixMessage => 'Semua garis terurai dan halus.';

  @override
  String get distractorMatrixMessage =>
      'Luar biasa! Anda mengingat pola meskipun ada pengecoh matematika kognitif!';

  @override
  String get distractorMatrixMessage1 =>
      'Pengecoh mengecoh Anda! Latih kembali memori kerja Anda.';

  @override
  String sentenceUnscrambleMessage(String arg0) {
    return 'Anda mencetak skor $arg0 dari menyusun kalimat!';
  }

  @override
  String get kakuroMessage =>
      'Luar biasa! Anda mencocokkan semua segmen jumlah dengan sempurna.';

  @override
  String symbolicFlankerMessage(String arg0, String arg1) {
    return 'Anda menjawab $arg0 benar dari $arg1!';
  }

  @override
  String stroopTestMessage(String arg0) {
    return 'Anda mencetak $arg0 dengan benar! Fokus pada warna tinta, bukan pada kata.';
  }

  @override
  String wisconsinCardSortingMessage(String arg0) {
    return 'Anda menyortir $arg0 kartu dengan benar!';
  }

  @override
  String nBackMessage(String arg0) {
    return 'Anda mencapai $arg0 kecocokan 2-back! Memori kerja Anda penting untuk multitasking.';
  }

  @override
  String rhythmMasterMessage(String arg0, String arg1) {
    return 'Anda mendapatkan $arg0 pukulan sempurna dan $arg1 poin!';
  }

  @override
  String groceryListMessage(String arg0, Object score) {
    return 'Anda mencetak $arg0 poin di Daftar Belanja!';
  }

  @override
  String get groceryListText => 'I\\';

  @override
  String get mirrorTracingMessage =>
      'Otak Anda berhasil mengatur ulang koordinasinya.';

  @override
  String moduloClockMessage(String arg0) {
    return 'Koordinasi matematika mental modular yang sangat baik! Skor: $arg0';
  }

  @override
  String moduloClockMessage1(String arg0, String arg1, String arg2) {
    return 'Anda menyelesaikan $arg0 dari $arg1 solusi jam modular. Skor: $arg2';
  }

  @override
  String get crownMessage =>
      'Semua mahkota berhasil ditempatkan dengan logika yang sempurna.';

  @override
  String dualCodingMessage(String arg0) {
    return 'Performa tugas ganda yang fantastis! Skor memori kerja Anda: $arg0';
  }

  @override
  String inequalityDashMessage(String arg0) {
    return 'Anda mencetak $arg0 poin dengan mencocokkan pertidaksamaan!';
  }

  @override
  String sourceMonitoringMessage(String arg0, String arg1) {
    return 'Anda mencetak $arg0 dari $arg1!';
  }

  @override
  String get sourceMonitoringText => 'MULAI MENGINGAT';

  @override
  String get memoryPalaceText => 'KATA YANG TERSEDIA';

  @override
  String target10Message(String arg0) {
    return 'Anda mencetak $arg0 poin dengan mencocokkan angka ke 10!';
  }

  @override
  String get paperFoldingMessage =>
      'Anda dapat melihat pola di dalam pikiran Anda.';

  @override
  String topologyText(String arg0, String arg1) {
    return '$arg0$arg1 / 10';
  }

  @override
  String get waterSortMessage => 'Anda menyortir semua warna dengan sempurna!';

  @override
  String anagramDefinitionMessage(String arg0) {
    return 'Katanya memang benar \"$arg0\".';
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
    return 'Anda membuat $arg0 estimasi yang benar.';
  }

  @override
  String grammarSortMessage(String arg0) {
    return 'Anda menyortir $arg0 kata dengan benar!';
  }

  @override
  String vowelReconstructMessage(String arg0) {
    return 'Anda merekonstruksi skor sebesar $arg0!';
  }

  @override
  String spatialConflictMessage(String arg0, String arg1) {
    return 'Anda mencapai skor $arg0 dengan $arg1 kesalahan!';
  }

  @override
  String get spatialConflictText => 'CARA BERMAIN';

  @override
  String get spatialConflictText1 => 'MENGERTI';

  @override
  String tracePathMessage(String arg0) {
    return 'Akurasi Anda adalah $arg0%!';
  }

  @override
  String ruleSwitcherMessage(String arg0, String arg1) {
    return 'Anda menjawab $arg0 benar dari $arg1!';
  }

  @override
  String collatzMessage(String arg0, String arg1) {
    return 'Anda mengambil $arg0 langkah. Kemungkinan minimum adalah $arg1.';
  }

  @override
  String get collatzText => '/ 2';

  @override
  String get collatzText1 => '+ 1';

  @override
  String get collatzText2 => '3n + 1';

  @override
  String divisibilityDashMessage(String arg0) {
    return 'Anda memecahkan $arg0 angka!';
  }

  @override
  String switchTaskMessage(String arg0) {
    return 'Anda mencetak $arg0 dengan benar! Peralihan cepat adalah kunci fleksibilitas mental.';
  }

  @override
  String sequenceSleuthMessage(String arg0) {
    return 'Anda memecahkan $arg0 urutan!';
  }

  @override
  String changeBlindnessMessage(String arg0) {
    return 'Anda menemukan $arg0 perubahan!';
  }

  @override
  String mentalRotationMessage(String arg0) {
    return 'Anda memutar $arg0 bentuk dengan benar!';
  }

  @override
  String wordMastermindMessage(String arg0) {
    return 'Anda menguasai kodenya!\nKatanya adalah: $arg0';
  }

  @override
  String wordMastermindMessage1(String arg0) {
    return 'Kata tersembunyinya adalah: $arg0';
  }

  @override
  String wordMastermindText(String arg0) {
    return '$arg0';
  }

  @override
  String get simonSequenceMessage => 'Anda mengingat semua 10 ubin!';

  @override
  String get simonSequenceMessage1 => 'Coba lagi untuk menguasai urutannya.';

  @override
  String oxymoronHuntMessage(String arg0) {
    return 'Anda menemukan $arg0 oksimoron!';
  }

  @override
  String spotlightTrackMessage(String arg0) {
    return 'Pelacakan spasial yang luar biasa! Anda mencetak $arg0 poin.';
  }

  @override
  String get spotlightTrackText => 'CARA BERMAIN';

  @override
  String get spotlightTrackText1 => 'MENGERTI';

  @override
  String get spotlightTrackText2 => 'MULAI RONDE';

  @override
  String vennNumbersMessage(String arg0) {
    return 'Anda mengkategorikan $arg0 angka!';
  }

  @override
  String get vennNumbersText => 'TIDAK KEDUANYA';

  @override
  String get vennNumbersText1 => 'KEDUANYA';

  @override
  String get silhouetteMatchMessage =>
      'Otak Anda sangat baik dalam terjemahan 3D ke 2D.';

  @override
  String sumSnakeMessage(String arg0) {
    return 'Target $arg0 tercapai dengan presisi sempurna!';
  }

  @override
  String get sumSnakeText => 'BERSIHKAN JALUR';

  @override
  String percentagePeakMessage(String arg0) {
    return 'Anda memecahkan $arg0 masalah persentase!';
  }

  @override
  String trailMakingMessage(String arg0) {
    return 'Anda menyelesaikan $arg0 jejak! Tes ini mengukur kecepatan pencarian visual dan fleksibilitas mental Anda.';
  }

  @override
  String matrixReasoningMessage(String arg0) {
    return 'Anda menyelesaikan $arg0 matriks dengan benar!';
  }

  @override
  String get tentsAndTreesMessage => 'Anda berhasil menempatkan semua tenda.';

  @override
  String klotskiMessage(String arg0) {
    return 'Pergeseran yang sensasional! Anda membebaskan blok Hero dalam $arg0 langkah.';
  }

  @override
  String sumPyramidMessage(String arg0) {
    return 'Anda memecahkan $arg0 piramida jumlah dengan sukses!';
  }

  @override
  String simonCommandMessage(String arg0) {
    return 'Respons dan fokus selektif yang sangat baik! Total Skor: $arg0';
  }

  @override
  String simonCommandMessage1(String arg0, String arg1) {
    return 'Anda mencetak $arg0 tetapi tidak mencapai $arg1 kecocokan tepat waktu.';
  }

  @override
  String syllableStackMessage(String arg0) {
    return 'Anda mengumpulkan skor sebesar $arg0!';
  }

  @override
  String get slitherlinkMessage =>
      'Luar biasa! Anda berhasil menyelesaikan teka-teki loop.';

  @override
  String quickMathMessage(String arg0) {
    return 'Anda memecahkan $arg0 masalah!';
  }

  @override
  String commonDenominatorMessage(String arg0) {
    return 'Anda memecahkan $arg0 masalah FPB/KPK!';
  }

  @override
  String chainReactionMessage(String arg0, String arg1) {
    return 'Skor akhir Anda adalah $arg0. Anda membangun rantai $arg1 kata.';
  }

  @override
  String chainReactionText(String arg0) {
    return '$arg0';
  }

  @override
  String get associativePairsMessage =>
      'Brilian! Anda mengaitkan ciri visual dengan sempurna.';

  @override
  String get associativePairsMessage1 =>
      'Asosiasi salah! Pertajam memori tautan Anda dan coba lagi.';

  @override
  String portmanteauSplitMessage(String arg0) {
    return 'Anda membelah $arg0 kata lakur!';
  }

  @override
  String get magicSquaresText => 'BERSIHKAN';

  @override
  String alphabetSudokuText(String arg0) {
    return 'Kesalahan: $arg0';
  }

  @override
  String get pipesMessage => 'Anda menghubungkan semua pipa dan mengisi grid.';

  @override
  String get dualMirrorMessage => 'Anda menavigasi kedua ikon ke targetnya!';

  @override
  String binaryCodeMessage(String arg0) {
    return 'Terjemahan desimal cepat yang sensasional! Skor Akhir: $arg0';
  }

  @override
  String binaryCodeMessage1(String arg0, String arg1) {
    return 'Anda dengan benar mengonversi $arg0 angka biner. Skor: $arg1';
  }

  @override
  String oddOneOutMessage(String arg0) {
    return 'Anda menemukan 50 yang berbeda! Skor akhir: $arg0';
  }

  @override
  String oddOneOutMessage1(String arg0) {
    return 'Skor Anda: $arg0';
  }

  @override
  String letterBridgeMessage(String arg0) {
    return 'Anda menemukan huruf jembatan: $arg0';
  }

  @override
  String get imReady => 'SAYA SIAP';

  @override
  String get soptTitle => 'Penunjukan Pesanan Sendiri';

  @override
  String get soptSubtitle =>
      'Ketuk kartu yang berbeda setiap kali. Posisinya acak!';

  @override
  String get soptWinTitle => 'Urutan Master!';

  @override
  String soptGameOverMessage(int score) {
    return 'Anda mencetak $score poin dengan berhasil melacak kartu yang dikocok!';
  }

  @override
  String get soptChooseNovel => 'Ketuk kartu baru';

  @override
  String get soptGreatJob => 'Kerja bagus!';

  @override
  String get soptAlreadyTapped => 'Sudah disadap!';

  @override
  String get soptGrid => 'jaringan';

  @override
  String get contRecogTitle => 'Pengakuan Berkelanjutan';

  @override
  String get contRecogSubtitle =>
      'Pernahkah Anda melihat kartu ini sebelumnya di sesi ini?';

  @override
  String get contRecogWinTitle => 'Pengakuan Jenius!';

  @override
  String contRecogGameOverMessage(int score) {
    return 'Anda mendapat $score pengakuan yang benar!';
  }

  @override
  String get contRecogCorrect => 'Benar!';

  @override
  String get contRecogWrong => 'Salah!';

  @override
  String get contRecogOldOrNew => 'Apakah ini lama atau baru?';

  @override
  String get contRecogNew => 'Baru';

  @override
  String get contRecogOld => 'Tua';

  @override
  String get contRecogSeenPool => 'Terlihat Kolam Renang';

  @override
  String get dnmsTitle => 'Memori Tidak Cocok';

  @override
  String get dnmsSubtitle =>
      'Ketuk kartu yang tidak ada dalam sampel yang diingat.';

  @override
  String get dnmsWinTitle => 'Pakar yang Tidak Cocok!';

  @override
  String dnmsGameOverMessage(int score) {
    return 'Anda mendapat skor $score jawaban yang benar pada Non-Matching Tertunda!';
  }

  @override
  String get dnmsChooseNovel => 'Ketuk kartu baru';

  @override
  String get dnmsMemorizeSample => 'Hafalkan kartu ini';

  @override
  String get dnmsWaitForIt => 'Tunggu itu...';

  @override
  String get dnmsExcellent => 'Bagus sekali!';

  @override
  String get dnmsSampleTapped => 'Itu adalah contohnya!';

  @override
  String get dnmsCards => 'Kartu-kartu';

  @override
  String get symSpanTitle => 'Rentang Simetri';

  @override
  String get symSpanSubtitle =>
      'Ingat pola sel sambil mengidentifikasi simetri vertikal.';

  @override
  String get symSpanWinTitle => 'Master Simetri!';

  @override
  String symSpanGameOverMessage(int score) {
    return 'Anda mencetak $score poin dengan mengingat tata letak dan mengidentifikasi simetri!';
  }

  @override
  String get symSpanMemorizeRed => 'Hafalkan lokasi sel darah merah';

  @override
  String get symSpanIsSymmetric => 'Apakah polanya simetris?';

  @override
  String get symSpanRecallSequence => 'Ingat urutan dalam urutan yang benar';

  @override
  String get symSpanGreatJob => 'Kerja bagus!';

  @override
  String get symSpanTryAgain => 'Coba lagi!';

  @override
  String get symSpanLength => 'Panjang';

  @override
  String get readingSpanTitle => 'Rentang Membaca';

  @override
  String get readingSpanSubtitle =>
      'Verifikasi kalimat sambil mengingat urutan huruf.';

  @override
  String get readingSpanWinTitle => 'Ahli Membaca!';

  @override
  String readingSpanGameOverMessage(int score) {
    return 'Anda mencetak $score poin dalam tantangan memori Reading Span!';
  }

  @override
  String get readingSpanTrueFalse => 'Apakah pernyataan ini benar atau salah?';

  @override
  String get readingSpanMemorizeLetter => 'Hafalkan surat ini';

  @override
  String get readingSpanRecallLetters =>
      'Mengingat kembali huruf-huruf secara berurutan';

  @override
  String get readingSpanGreatJob => 'Kerja bagus!';

  @override
  String get readingSpanTryAgain => 'Coba lagi!';

  @override
  String readingSpanYourSequence(String sequence) {
    return 'Urutan Anda: $sequence';
  }

  @override
  String get readingSpanLength => 'Panjang';

  @override
  String get readingSpanSentence1 => 'Matahari terbit di timur.';

  @override
  String get readingSpanSentence2 => 'Es mendidih panas.';

  @override
  String get readingSpanSentence3 => 'Ikan bisa bernapas di bawah air.';

  @override
  String get readingSpanSentence4 => 'Anjing mempunyai sayap dan bisa terbang.';

  @override
  String get readingSpanSentence5 => 'Air membeku pada suhu 0 derajat Celsius.';

  @override
  String get readingSpanSentence6 =>
      'Kucing menggonggong seperti anjing kecil.';

  @override
  String get readingSpanSentence7 =>
      'Pepohonan memiliki daun hijau di musim panas.';

  @override
  String get readingSpanSentence8 =>
      'Hujan turun ke atas dari permukaan tanah.';

  @override
  String get readingSpanSentence9 =>
      'Sebuah segitiga mempunyai empat sisi yang sama panjang.';

  @override
  String get readingSpanSentence10 =>
      'Apel merupakan salah satu jenis buah yang manis.';

  @override
  String get readingSpanSentence11 => 'Bulan terbuat dari keju cheddar.';

  @override
  String get readingSpanSentence12 => 'Mobil mempunyai roda untuk berputar.';

  @override
  String get readingSpanSentence13 => 'Api sangat dingin.';

  @override
  String get readingSpanSentence14 => 'Kertas terbuat dari kayu olahan.';

  @override
  String get readingSpanSentence15 =>
      'Burung mempunyai bulu untuk membantunya terbang.';

  @override
  String get readingSpanSentence16 => 'Pisang tumbuh di pohon pinus.';

  @override
  String get readingSpanSentence17 => 'Gajah lebih kecil dari semut.';

  @override
  String get readingSpanSentence18 => 'Buku berisi halaman teks yang dicetak.';

  @override
  String get countingSpanTitle => 'Menghitung Rentang';

  @override
  String get countingSpanSubtitle =>
      'Hitung lingkaran biru saja. Kemudian ingat kembali urutan penghitungannya.';

  @override
  String get countingSpanWinTitle => 'Menghitung Jenius!';

  @override
  String countingSpanGameOverMessage(int score) {
    return 'Anda mencetak $score poin dalam tantangan memori Counting Span!';
  }

  @override
  String get countingSpanCountCircles => 'Hitung hanya lingkaran biru';

  @override
  String get countingSpanRecallCounts =>
      'Penarikan kembali dihitung dalam urutan yang benar';

  @override
  String get countingSpanGreatJob => 'Kerja bagus!';

  @override
  String get countingSpanTryAgain => 'Coba lagi!';

  @override
  String countingSpanYourSequence(String sequence) {
    return 'Urutan Anda: $sequence';
  }

  @override
  String get countingSpanLength => 'Panjang';

  @override
  String get objDispTitle => 'Perpindahan Benda';

  @override
  String get objDispSubtitle =>
      'Hafalkan tata letak. Temukan dan ketuk satu objek yang berpindah posisi.';

  @override
  String get objDispWinTitle => 'Jenius Spasial!';

  @override
  String objDispGameOverMessage(int score) {
    return 'Anda mengidentifikasi $score objek yang dipindahkan dengan benar!';
  }

  @override
  String get objDispMemorizeAll => 'Hafalkan semua penempatan';

  @override
  String get objDispWaitingShift => 'Menunggu perubahan tata letak...';

  @override
  String get objDispTapMoved => 'Ketuk objek yang dipindahkan';

  @override
  String get objDispExcellent => 'Bagus sekali!';

  @override
  String get objDispWrongObject => 'Objek yang salah!';

  @override
  String get objDispItems => 'Barang';

  @override
  String get mandalaTitle => 'Penarikan Mandala';

  @override
  String get mandalaSubtitle =>
      'Hafalkan konfigurasi warna. Pilih warna dan cat ulang ubinnya.';

  @override
  String get mandalaWinTitle => 'Artis Mandala!';

  @override
  String mandalaGameOverMessage(int score) {
    return 'Anda mencetak $score poin dengan membuat ulang tata letak geometris berwarna!';
  }

  @override
  String get mandalaMemorizeColors => 'Hafalkan warna ubin';

  @override
  String get mandalaPaintCells => 'Warnai sel agar sesuai dengan aslinya';

  @override
  String get mandalaExcellent => 'Bagus sekali!';

  @override
  String get mandalaIncorrectMatch => 'Pertandingan yang salah!';

  @override
  String get mandalaSubmitRepaint => 'Kirim Pengecatan Ulang';

  @override
  String get mandalaTiles => 'Ubin';

  @override
  String get runningSpanTitle => 'Rentang Berjalan';

  @override
  String get runningSpanSubtitle =>
      'Perhatikan huruf-hurufnya. Jika berhenti, masukkan N huruf terakhir secara berurutan.';

  @override
  String get runningSpanWinTitle => 'Tuan Penyangga!';

  @override
  String runningSpanGameOverMessage(int score) {
    return 'Anda mencetak $score poin dalam Running Memory Span!';
  }

  @override
  String runningSpanPrepareRecall(int count) {
    return 'Bersiaplah untuk mengingat $count huruf terakhir';
  }

  @override
  String get runningSpanWatchCarefully => 'Perhatikan baik-baik...';

  @override
  String runningSpanEnterLast(int count) {
    return 'Masukkan $count huruf terakhir';
  }

  @override
  String get runningSpanGreatJob => 'Kerja bagus!';

  @override
  String get runningSpanIncorrectBuffer => 'Penyangga salah!';

  @override
  String runningSpanRecallLast(int count) {
    return 'Ingat $count terakhir';
  }

  @override
  String get runningSpanStopsRandomly => 'Alirannya berhenti secara acak!';

  @override
  String runningSpanEntered(String sequence) {
    return 'Dimasukkan: $sequence';
  }

  @override
  String get runningSpanNItems => 'N-Item';

  @override
  String get spatialCabinetTitle => 'Lemari Tata Ruang';

  @override
  String get spatialCabinetSubtitle =>
      'Hafalkan laci lemari mana yang berisi benda apa.';

  @override
  String get spatialCabinetWinTitle => 'Pakar Kabinet!';

  @override
  String spatialCabinetGameOverMessage(int score) {
    return 'Anda mencetak $score poin dalam Memori Kabinet Spasial!';
  }

  @override
  String get spatialCabinetMemorize => 'Hafalkan lokasi item';

  @override
  String spatialCabinetWhereIs(String itemName) {
    return 'Dimana __NAMAITEM__ ?';
  }

  @override
  String get spatialCabinetCorrect => 'Benar!';

  @override
  String get spatialCabinetWrongDrawer => 'Laci yang salah!';

  @override
  String get spatialCabinetItems => 'Barang';

  @override
  String get cabinetItemKey => 'Kunci';

  @override
  String get cabinetItemApple => 'Apel';

  @override
  String get cabinetItemDiamond => 'Berlian';

  @override
  String get cabinetItemBook => 'Buku';

  @override
  String get cabinetItemUmbrella => 'Payung';

  @override
  String get cabinetItemCoffee => 'Kopi';

  @override
  String get cabinetItemLock => 'Kunci';

  @override
  String get cabinetItemPet => 'Peliharaan';

  @override
  String get cabinetItemCar => 'Mobil';

  @override
  String get gamesTitleLabel => 'PERMAINAN';

  @override
  String get yourFavorites => 'FAVORIT ANDA';

  @override
  String get readyForWorkout => 'SIAP UNTUK LATIHAN HARIAN ANDA?';

  @override
  String get greatStartKeepGoing => 'AWAL YANG BAGUS! TERUSKAN.';

  @override
  String get onFireToday => 'ANDA SANGAT BERSEMANGAT HARI INI!';

  @override
  String get incredibleSolvingToday => 'PENYELESAIAN LUAR BIASA HARI INI!';

  @override
  String get newGameLabel => 'BARU';

  @override
  String get slitherlinkTitle => 'Slitherlink';

  @override
  String get slitherlinkSubtitle =>
      'LINGKARI GRID PIN MENGGUNAKAN PETUNJUK ANGKA.';

  @override
  String get futoshikiTitle => 'Futoshiki';

  @override
  String get futoshikiSubtitle => 'ISI GRID DENGAN PETUNJUK LEBIH BESAR DARI.';

  @override
  String get kakuroTitle => 'Kakuro';

  @override
  String get kakuroSubtitle =>
      'SELESAIKAN TEKA-TEKI SILANG DENGAN ANGKA DAN JUMLAH.';

  @override
  String get inequalityDashTitle => 'Inequality Dash';

  @override
  String get inequalityDashSubtitle =>
      'SELESAIKAN PERTIDAKSAMAAN DI BAWAH TEKANAN WAKTU.';

  @override
  String get factorFinderTitle => 'Pencari Faktor';

  @override
  String get factorFinderSubtitle =>
      'IDENTIFIKASI SEMUA FAKTOR DARI ANGKA TARGET.';

  @override
  String get collatzTitle => 'Jalur Collatz';

  @override
  String get collatzSubtitle => 'NAVIGASI URUTAN 3N+1.';

  @override
  String get sumPyramidTitle => 'Piramida Jumlah';

  @override
  String get sumPyramidSubtitle =>
      'ISI SEL PIRAMIDA DENGAN PETUNJUK MATEMATIKA JUMLAH.';

  @override
  String get target10Title => 'Target 10';

  @override
  String get target10Subtitle =>
      'GABUNGKAN UBIN ANGKA UNTUK MENDAPATKAN JUMLAH SEPULUH.';

  @override
  String get fractionMatcherTitle => 'Pencocok Pecahan';

  @override
  String get fractionMatcherSubtitle =>
      'COCOKKAN PECAHAN YANG SETARA SECARA VISUAL.';

  @override
  String get dualCodingTitle => 'Pengkodean Ganda';

  @override
  String get dualCodingSubtitle =>
      'COCOKKAN HURUF DAN SIMBOL SECARA BERSAMAAN.';

  @override
  String get distractorMatrixTitle => 'Matriks Distraktor';

  @override
  String get distractorMatrixSubtitle =>
      'TEMUKAN BENTUK TARGET DI ANTARA DISTRAKTOR.';

  @override
  String get temporalOrderTitle => 'Urutan Temporal';

  @override
  String get temporalOrderSubtitle => 'INGAT URUTAN KRONOLOGIS.';

  @override
  String get associativePairsTitle => 'Pasangan Asosiatif';

  @override
  String get associativePairsSubtitle =>
      'PASANGKAN DAN COCOKKAN SIMBOL YANG SESUAI.';

  @override
  String get blockCount3dTitle => 'Hitung Blok 3D';

  @override
  String get blockCount3dSubtitle => 'HITUNG BLOK DALAM RUANG TIGA DIMENSI.';

  @override
  String get rotatingMazeTitle => 'Labirin Berputar';

  @override
  String get rotatingMazeSubtitle =>
      'PUTAR LABIRIN UNTUK MEMANDU BOLA KE PINTU KELUAR.';

  @override
  String get silhouetteMatchOrthoTitle => 'Pencocokan Siluet (Ortho)';

  @override
  String get silhouetteMatchOrthoSubtitle =>
      'COCOKKAN OBJEK 3D DENGAN BAYANGAN ORTHO.';

  @override
  String get spatialConflictTitle => 'Konflik Spasial';

  @override
  String get spatialConflictSubtitle =>
      'SELESAIKAN DISKREPANSI ANTARA TEKS DAN ARAH.';

  @override
  String get spotlightTrackTitle => 'Jalur Sorotan';

  @override
  String get spotlightTrackSubtitle =>
      'LACAK ITEM YANG BERKEDIP DALAM BAYANGAN YANG BERGERAK.';

  @override
  String get d2AttentionTitle => 'Perhatian d2';

  @override
  String get d2AttentionSubtitle =>
      'KETUK SIMBOL TARGET DENGAN KRITERIA KETAT.';

  @override
  String get dualMirrorTitle => 'Navigasi Cermin Ganda';

  @override
  String get dualMirrorSubtitle => 'NAVIGASI DUA LABIRIN SEKALIGUS.';

  @override
  String get contextCluesTitle => 'Petunjuk Konteks';

  @override
  String get contextCluesSubtitle =>
      'SIMPULKAN KATA YANG TERSEMBUNYI DARI PETUNJUK KONTEKS.';

  @override
  String get digitSpanReverseSubtitle =>
      'INGAT DIGIT ANGKA DALAM URUTAN TERBALIK.';

  @override
  String get faceNameAssociationSubtitle =>
      'INGAT NAMA UNTUK BERBAGAI WAJAH YANG DISAJIKAN.';

  @override
  String get staircaseMemorySubtitle =>
      'HAFALKAN BLOK DALAM URUTAN BERTINGKAT.';

  @override
  String get choiceReactionTimeSubtitle =>
      'KETUK TOMBOL TERTENTU YANG SESUAI DENGAN PETUNJUK DENGAN CEPAT.';

  @override
  String get attentionalBlinkSubtitle =>
      'TEMUKAN TARGET CEPAT YANG BERKEDIP DALAM ALIRAN.';

  @override
  String get visualStatisticalLearningSubtitle =>
      'PELAJARI POLA BENTUK TEMPORAL SECARA VISUAL.';

  @override
  String get sternbergTaskSubtitle =>
      'INGAT APAKAH SIMBOL ADA DALAM SET MEMORI.';

  @override
  String get operationSpanSubtitle =>
      'SELESAIKAN MATEMATIKA DAN INGAT STRING ALFABET.';

  @override
  String get continuousRecognitionTitle => 'Pengenalan Berkelanjutan';

  @override
  String get continuousRecognitionSubtitle =>
      'IDENTIFIKASI APAKAH KARTU YANG DISAJIKAN LAMA ATAU BARU.';

  @override
  String get symmetrySpanTitle => 'Rentang Simetri';

  @override
  String get symmetrySpanSubtitle =>
      'INGAT KOORDINAT SEL DI ANTARA KEPUTUSAN SIMETRI VERTIKAL.';

  @override
  String get objectDisplacementTitle => 'Perpindahan Objek';

  @override
  String get objectDisplacementSubtitle =>
      'PELAJARI PENEMPATAN DAN KETUK SATU OBJEK YANG BERPINDAH.';

  @override
  String get mandalaRecallTitle => 'Mengingat Mandala';

  @override
  String get mandalaRecallSubtitle =>
      'HAFALKAN UBIN WARNA DAN CAT ULANG MANDALA DARI PALET.';

  @override
  String get runningMemorySpanTitle => 'Rentang Memori Berjalan';

  @override
  String get runningMemorySpanSubtitle =>
      'PANTAU HURUF YANG BERJALAN DAN INGAT N ITEM TERAKHIR.';

  @override
  String get spatialCabinetMemoryTitle => 'Kabinet Spasial';

  @override
  String get spatialCabinetMemorySubtitle =>
      'HAFALKAN DAN TEMUKAN ITEM DI BALIK PINTU KABINET.';

  @override
  String get pathRecallSubtitle => 'HAFALKAN DAN ULANGI PILIHAN JALUR.';

  @override
  String get objectShuffleSubtitle =>
      'LACAK ITEM YANG DIACAK DI BAWAH CANGKIR DALAM.';

  @override
  String get groceryListSubtitle => 'HAFALKAN DAN CENTANG ITEM DALAM DAFTAR.';

  @override
  String get quickMathSubtitle =>
      'SELESAIKAN PERTANYAAN ARITMATIKA DENGAN KECEPATAN TINGGI.';

  @override
  String get mathGuessTitle => 'Tebak Matematika';

  @override
  String get mathGuessSubtitle =>
      'TEBAK ANGKA YANG TERSEMBUNYI DALAM 15 KESEMPATAN.';

  @override
  String get reflexTapSubtitle => 'KETUK STIMULUS SECEPAT MUNGKIN.';

  @override
  String get pixelMimicSubtitle => 'TIRU POLA DESAIN PADA GRID PIXEL.';

  @override
  String get simonSequenceSubtitle => 'ULANGI URUTAN BENTUK DARI MEMORI.';

  @override
  String get slidePuzzleSubtitle => 'SUSUN ULANG UBIN GRID GESER PERSEGI.';

  @override
  String get findWordTitle => 'Cari Kata';

  @override
  String get schulteTableSubtitle =>
      'KETUK ANGKA DARI SATU SAMPAI DUA PULUH LIMA.';

  @override
  String get simonCommandTitle => 'Simon Command';

  @override
  String get simonCommandSubtitle => 'LAKUKAN INSTRUKSI SUARA DENGAN CEPAT.';

  @override
  String get binaryCodeTitle => 'Kecepatan Biner';

  @override
  String get binaryCodeSubtitle => 'TERJEMAHKAN KODE BINER MENJADI DESIMAL.';

  @override
  String get moduloClockTitle => 'Jam Modulo';

  @override
  String get moduloClockSubtitle =>
      'HITUNG PERSAMAAN MATEMATIKA MENGGUNAKAN JAM.';

  @override
  String get chimpTestTitle => 'Tes Simpanse';

  @override
  String get chimpTestSubtitle => 'KETUK ANGKA ACAK DALAM URUTAN MENAIK.';

  @override
  String get relationalMemoryTitle => 'Memori Relasional';

  @override
  String get relationalMemorySubtitle => 'INGAT POSISI ITEM GRID YANG TEPAT.';

  @override
  String get factBinderTitle => 'Pengikat Fakta';

  @override
  String get factBinderSubtitle => 'HUBUNGKAN SIMBOL AND INGAT PERNYATAAN.';

  @override
  String get sourceMonitoringTitle => 'Pemantauan Sumber';

  @override
  String get sourceMonitoringSubtitle => 'INGAT KONTEKSNYA.';

  @override
  String get klotskiTitle => 'Pelarian Klotski';

  @override
  String get klotskiSubtitle => 'GESER BLOK UNTUK MENCAPAI PINTU KELUAR.';

  @override
  String get homophoneHuntSubtitle => 'Pilih homofon dengan ejaan yang benar';

  @override
  String get laserLinkTitle => 'Tautan Laser';

  @override
  String get laserLinkSubtitle =>
      'Putar cermin untuk memantulkan laser dan menyalakan semua target.';

  @override
  String get laserLinkCongrats =>
      'Refleksi presisi! Anda telah berhasil menyalakan seluruh kisi.';

  @override
  String get crossSectionSliceTitle => 'Irisan Penampang';

  @override
  String get crossSectionSliceSubtitle =>
      'Identifikasi penampang 2D yang benar dari objek 3D dari sudut tertentu.';

  @override
  String get crossSectionSliceCongrats =>
      'Visualisasi 3D yang luar biasa! Anda melihat menembus bentuk itu.';

  @override
  String get shadowPivotTitle => 'Pivot Bayangan';

  @override
  String get shadowPivotCongrats =>
      'Penalaran spasial dinamis! Anda menguasai cahaya dan bayangan.';

  @override
  String get shadowPivotSubtitle =>
      'Prediksi bayangan yang dilemparkan oleh objek 3D saat berputar pada sumbu yang berbeda.';

  @override
  String get interlockPuzzleTitle => 'Teka-teki Saling Mengunci';

  @override
  String get interlockPuzzleSubtitle =>
      'Bongkar atau pasang balok-balok yang saling mengunci dalam urutan yang benar.';

  @override
  String get interlockPuzzleCongrats =>
      'Dekonstruksi logis! Anda telah mengurai teka-teki dengan sempurna.';

  @override
  String get pathIntersectTitle => 'Persimpangan Jalur';

  @override
  String get pathIntersectSubtitle =>
      'Navigasi beberapa jalur secara bersamaan untuk mencapai target masing-masing tanpa tabrakan.';

  @override
  String get pathIntersectCongrats =>
      'Navigasi tersinkronisasi! Anda telah mencapai semua target tanpa cela.';

  @override
  String get negativeSpaceDetectionTitle => 'Ruang Negatif';

  @override
  String get negativeSpaceDetectionSubtitle =>
      'Identifikasi bentuk yang dibentuk oleh ruang kosong di antara objek.';

  @override
  String get negativeSpaceDetectionCongrats =>
      'Persepsi tajam! Anda telah menguasai seni melihat apa yang tidak ada di sana.';

  @override
  String get compassMazeTitle => 'Labirin Kompas';

  @override
  String get compassMazeSubtitle =>
      'Navigasi labirin di mana arah gerakan berubah berdasarkan orientasi kompas Anda.';

  @override
  String get compassMazeCongrats =>
      'Navigasi ahli! Anda telah menemukan jalan keluar melalui arah yang berubah-ubah.';

  @override
  String get complexFoldingNetsTitle => 'Jaring Lipat';

  @override
  String get complexFoldingNetsSubtitle =>
      'Tentukan bentuk 3D kompleks mana yang akan terbentuk dengan melipat jaring 2D non-standar.';

  @override
  String get complexFoldingNetsCongrats =>
      'Logika lipat tingkat lanjut! Anda telah berhasil memvisualisasikan bentuk 3D.';

  @override
  String get compassMazeMessage => 'Navigasi labirin menggunakan kompas.';

  @override
  String get negativeSpaceDetectionMessage =>
      'Identifikasi objek tersembunyi di ruang tersebut.';

  @override
  String get shikakuTitle => 'Shikaku';

  @override
  String get shikakuSubtitle =>
      'BAGIKAN GRID MENJADI KOTAK DAN PERSEGI PANJANG SESUAI DENGAN ANGKANYA.';

  @override
  String get countdownMathTitle => 'Matematika Hitung Mundur';

  @override
  String get countdownMathSubtitle =>
      'GABUNGKAN ANGKA ACAK UNTUK MENGHITUNG TARGET TIGA DIGIT.';

  @override
  String get narrativeRecallTitle => 'Penarikan Narasi';

  @override
  String get narrativeRecallSubtitle =>
      'BACA CERITA DAN INGAT DETAIL KUANTITATIF DAN Faktual KHUSUS.';

  @override
  String get shellGameTitle => 'Permainan Kerang';

  @override
  String get shellGameSubtitle =>
      'LACAK BOLA TERSEMBUNYI SEBAGAI TEMPAT TUKAR CUPS SHUFFLING.';

  @override
  String get typoglycemiaDecoderTitle => 'Dekoder Tipoglikemia';

  @override
  String get typoglycemiaDecoderSubtitle =>
      'UNSCRAMBLE DAN BACA KALIMAT JUMBLED DENGAN CEPAT.';

  @override
  String get shapeShifterTitle => 'Pengubah Bentuk';

  @override
  String get shapeShifterSubtitle => 'Ketuk kombinasi bentuk-warna target.';

  @override
  String get gokigenNanameTitle => 'Nama Gokigen';

  @override
  String get gokigenNanameSubtitle =>
      'Gambarlah diagonal untuk menghubungkan titik-titik tanpa loop.';

  @override
  String get matrixMultiplierTitle => 'Pengganda Matriks';

  @override
  String get matrixMultiplierSubtitle =>
      'Pilih baris dan kolom untuk dikalikan dengan target.';

  @override
  String get wordAssociationRecallTitle => 'Asosiasi Kata';

  @override
  String get wordAssociationRecallSubtitle =>
      'Ingat asosiasi kata berpasangan dari memori.';

  @override
  String get gearRotationTitle => 'Rotasi Gigi';

  @override
  String get gearRotationSubtitle => 'Memprediksi arah putaran gigi terakhir.';

  @override
  String get wordWheelTitle => 'Roda Kata';

  @override
  String get wordWheelSubtitle =>
      'Buatlah kata-kata dengan menggunakan huruf-huruf yang ada pada roda, termasuk huruf tengahnya.';

  @override
  String get oddEvenFlashTitle => 'Kilatan Ganjil Genap';

  @override
  String get oddEvenFlashSubtitle =>
      'Cocokkan paritas angka dengan aturan warna dengan cepat.';

  @override
  String get norinoriTitle => 'Norinori';

  @override
  String get norinoriSubtitle =>
      'Bayangkan tepat dua sel yang terhubung di setiap ruangan.';

  @override
  String get algebraicBalanceTitle => 'Keseimbangan Aljabar';

  @override
  String get algebraicBalanceSubtitle =>
      'Selesaikan persamaan untuk menemukan jumlah target.';

  @override
  String get patternSequenceDrawTitle => 'Penarikan Pola';

  @override
  String get patternSequenceDrawSubtitle =>
      'Ulangi urutan jalur animasi pada grid.';

  @override
  String get tangramTitle => 'Teka-teki Tangram';

  @override
  String get tangramSubtitle => 'Susun bentuk untuk mengisi siluet target.';

  @override
  String get semanticAssociationTitle => 'Kata Asosiasi';

  @override
  String get semanticAssociationSubtitle =>
      'Temukan kata yang menghubungkan ketiga petunjuk tersebut.';

  @override
  String get peripheralFocusTitle => 'Fokus Periferal';

  @override
  String get peripheralFocusSubtitle =>
      'Bereaksi terhadap flashing panel samping saat menyelesaikan matematika.';

  @override
  String get masyuTitle => 'Lingkaran Masyu';

  @override
  String get masyuSubtitle =>
      'Gambarlah satu lingkaran yang cocok dengan aturan lingkaran Masyu.';

  @override
  String get mathMazeTitle => 'Labirin Matematika';

  @override
  String get mathMazeSubtitle =>
      'Telusuri jalur yang mengevaluasi total target.';

  @override
  String get storyBuilderTitle => 'Pembuat Cerita';

  @override
  String get storyBuilderSubtitle => 'Rekonstruksi urutan kronologis cerita.';

  @override
  String get mirrorMazeTitle => 'Labirin Cermin';

  @override
  String get mirrorMazeSubtitle =>
      'Arahkan ulang sinar laser menggunakan cermin diagonal.';

  @override
  String get wordGridConnectionTitle => 'Koneksi Kata';

  @override
  String get wordGridConnectionSubtitle =>
      'Kelompokkan 16 kata menjadi empat kategori empat.';

  @override
  String get shapeShifterPeripheralTitle => 'Bentuk Periferal';

  @override
  String get shapeShifterPeripheralSubtitle =>
      'Lacak perubahan bentuk periferal sambil mencocokkan nilai pusat.';

  @override
  String get soundWaveMatchTitle => 'Pertandingan Gelombang Suara';

  @override
  String get soundWaveMatchSubtitle =>
      'Ketuk ketika frekuensi gelombang visual sejajar dengan perubahan nada.';

  @override
  String get multiTrackCounterTitle => 'Penghitung Multi-Trek';

  @override
  String get multiTrackCounterSubtitle =>
      'Ketuk ketika penghitung bertambah ke pengganda target.';

  @override
  String get colorWordMatchUpTitle => 'Pencocokan Warna';

  @override
  String get colorWordMatchUpSubtitle =>
      'Tentukan apakah dua kata berwarna cocok berdasarkan perubahan aturan.';

  @override
  String get signalAndNoiseTitle => 'Sinyal & Kebisingan';

  @override
  String get signalAndNoiseSubtitle =>
      'Temukan karakter alfanumerik target yang tersembunyi dalam kebisingan statis.';

  @override
  String get focusTunnelTitle => 'Terowongan Fokus';

  @override
  String get focusTunnelSubtitle =>
      'Identifikasi simbol yang cocok yang muncul di dinding terowongan yang bergerak.';

  @override
  String get targetPursuerTitle => 'Pengejar Sasaran';

  @override
  String get targetPursuerSubtitle =>
      'Lacak beberapa lingkaran yang tumpang tindih dan pilih target awal.';

  @override
  String get gridGazeTitle => 'Pandangan Grid';

  @override
  String get gridGazeSubtitle =>
      'Identifikasi sel kisi mana yang di-flash dengan durasi berbeda.';

  @override
  String get doubleTroubleTitle => 'Masalah Ganda';

  @override
  String get doubleTroubleSubtitle =>
      'Mainkan dua game sederhana terpisah secara bersamaan di layar terpisah.';

  @override
  String get syncRhythmTitle => 'Sinkronkan Irama';

  @override
  String get syncRhythmSubtitle =>
      'Ketuk saat sapuan metronom visual cocok dengan irama yang disinkronkan.';

  @override
  String get ghostTapTitle => 'Ketuk Hantu';

  @override
  String get ghostTapSubtitle =>
      'Ketuk saat denyut tak kasat mata mencapai ketinggian maksimumnya.';

  @override
  String get attentionalRsvpTitle => 'RSVP yang penuh perhatian';

  @override
  String get attentionalRsvpSubtitle =>
      'Identifikasi digit yang muncul dalam kilatan huruf serial cepat.';

  @override
  String get colorMazeNavTitle => 'Navigasi Labirin Warna';

  @override
  String get colorMazeNavSubtitle =>
      'Navigasi ubin labirin yang cocok dengan warna izin dinamis.';

  @override
  String get dynamicSalienceTitle => 'Arti-penting Dinamis';

  @override
  String get dynamicSalienceSubtitle =>
      'Temukan bentuk yang bergerak dengan dinamika yang sedikit berbeda.';

  @override
  String get chalkAndTalkTitle => 'Kapur & Bicara';

  @override
  String get chalkAndTalkSubtitle =>
      'Ketikkan kata-kata yang terdengar dalam audio sambil mengabaikan gangguan visual.';

  @override
  String get blinkDetectorTitle => 'Detektor Kedip';

  @override
  String get blinkDetectorSubtitle =>
      'Ketuk tampilan kisi yang berkedip dua kali secara berurutan.';

  @override
  String get frequencyTapTitle => 'Ketuk Frekuensi';

  @override
  String get frequencyTapSubtitle =>
      'Ketuk tombol yang cocok dengan frekuensi pulsa cahaya target.';

  @override
  String get yajilinTitle => 'Lingkaran Yajilin';

  @override
  String get yajilinSubtitle =>
      'Tempatkan sel hitam dan gambar satu lingkaran petunjuk yang cocok.';

  @override
  String get heyawakeTitle => 'Kotak Heawake';

  @override
  String get heyawakeSubtitle =>
      'Ruang kisi peneduh tanpa sel hitam yang berdekatan.';

  @override
  String get gokigenVariantTitle => 'Varian Gokigen';

  @override
  String get gokigenVariantSubtitle =>
      'Gambarkan diagonal bebas lingkaran yang memenuhi jumlah titik sudut.';

  @override
  String get sheepAndWolvesTitle => 'Domba & Serigala';

  @override
  String get sheepAndWolvesSubtitle =>
      'Gambarlah lingkaran yang memisahkan domba dari serigala.';

  @override
  String get islandNurikabeTitle => 'Pulau Nurikabe';

  @override
  String get islandNurikabeSubtitle =>
      'Bentuklah pulau-pulau yang sesuai dengan batasan ukuran numerik.';

  @override
  String get shakashakaTitle => 'Rek Shakashaka';

  @override
  String get shakashakaSubtitle =>
      'Tempatkan ubin berbentuk segitiga untuk membentuk area putih persegi panjang.';

  @override
  String get litsTetrisTitle => 'LITS Tetromino';

  @override
  String get litsTetrisSubtitle =>
      'Tempatkan tetromino di ruangan yang tidak ada duplikatnya.';

  @override
  String get tapaWallTitle => 'Tembok Tapa';

  @override
  String get tapaWallSubtitle =>
      'Warnai sel untuk membentuk pola dinding hitam yang berkesinambungan.';

  @override
  String get triangularBridgesTitle => 'Jembatan Segitiga';

  @override
  String get triangularBridgesSubtitle =>
      'Hubungkan pulau-pulau dalam 3 arah yang memenuhi persyaratan.';

  @override
  String get rippleEffectTitle => 'Efek Riak';

  @override
  String get rippleEffectSubtitle =>
      'Isikan angka pada ruangan dengan memperhatikan batasan jarak jarak.';

  @override
  String get suguruTectonicTitle => 'Kotak Suguru';

  @override
  String get suguruTectonicSubtitle =>
      'Isi blok ruangan dengan angka 1 sampai K tanpa tetangga yang sama.';

  @override
  String get tennerGridTitle => 'Kotak Sepuluh';

  @override
  String get tennerGridSubtitle =>
      'Isi baris dengan angka 0-9 total kolom yang cocok.';

  @override
  String get kakurasuSumsTitle => 'Jumlah Kakurasu';

  @override
  String get kakurasuSumsSubtitle =>
      'Buat bayangan sel untuk memenuhi jumlah indeks baris/kolom tertimbang.';

  @override
  String get corralLoopTitle => 'Lingkaran Kandang';

  @override
  String get corralLoopSubtitle =>
      'Gambarlah satu lingkaran yang menyertakan angka-angka yang cocok dengan visibilitas.';

  @override
  String get stostoneTitle => 'Gravitasi Stostone';

  @override
  String get stostoneSubtitle =>
      'Sel bayangan yang turun ke bawah untuk mengisi baris bawah dengan sempurna.';

  @override
  String get tripletsLogicTitle => 'Trio kembar tiga';

  @override
  String get tripletsLogicSubtitle =>
      'Isi grid dengan tiga bentuk, hindari tiga berturut-turut.';

  @override
  String get galaxiesSymTitle => 'Simetri Galaksi';

  @override
  String get galaxiesSymSubtitle =>
      'Bagilah grid menjadi bentuk galaksi simetris rotasi.';

  @override
  String get matrixMultiplierMatchTitle => 'Pencocokan Matriks';

  @override
  String get matrixMultiplierMatchSubtitle =>
      'Kalikan nilai baris dan kolom agar sesuai dengan perkalian titik target.';

  @override
  String get primeFactorTreesTitle => 'Pohon Faktor Prima';

  @override
  String get primeFactorTreesSubtitle =>
      'Uraikan bilangan komposit menjadi pasangan faktor daun prima.';

  @override
  String get vektorVectorTitle => 'Vektor Vektor';

  @override
  String get vektorVectorSubtitle =>
      'Skalakan vektor agar jumlahnya sesuai dengan target.';

  @override
  String get binomialMatchTitle => 'Pertandingan Binomial';

  @override
  String get binomialMatchSubtitle =>
      'Cocokkan rumus kuadrat dengan nilai binomial yang difaktorkan.';

  @override
  String get percentageShoppingTitle => 'Persentase Belanja';

  @override
  String get percentageShoppingSubtitle =>
      'Hitung persentase diskon dan total pembayaran akhir.';

  @override
  String get cryptoArithmeticTitle => 'Kripto-Aritmatika';

  @override
  String get cryptoArithmeticSubtitle =>
      'Memecahkan soal matematika sandi substitusi karakter-digit.';

  @override
  String get fractionalPizzaTitle => 'Pizza pecahan';

  @override
  String get fractionalPizzaSubtitle =>
      'Partisi irisan pizza agar sesuai dengan jumlah pecahan target.';

  @override
  String get numberBondsTitle => 'Obligasi Nomor';

  @override
  String get numberBondsSubtitle =>
      'Tautkan nilai node agar sama dengan jumlah koneksi target.';

  @override
  String get gridSumLineTitle => 'Garis Jumlah Grid';

  @override
  String get gridSumLineSubtitle =>
      'Gambarlah jalur yang nilainya bernilai tepat terhadap target.';

  @override
  String get binaryScaleBalanceTitle => 'Saldo Skala Biner';

  @override
  String get binaryScaleBalanceSubtitle =>
      'Seimbangkan bobot desimal menggunakan blok pangkat dua.';

  @override
  String get moduloPathTitle => 'Jalur Modulo';

  @override
  String get moduloPathSubtitle =>
      'Lintasi sel kisi yang cocok dengan nilai sisa modulo.';

  @override
  String get digitSwapEqTitle => 'Persamaan Tukar Digit';

  @override
  String get digitSwapEqSubtitle =>
      'Tukar satu digit antar persamaan untuk memperbaiki keduanya.';

  @override
  String get areaPerimeterMatchTitle => 'Luas & Keliling';

  @override
  String get areaPerimeterMatchSubtitle =>
      'Gambarlah persegi panjang yang cocok dengan luas target dan nilai keliling.';

  @override
  String get inequalityBalanceOpsTitle => 'Keseimbangan Ketimpangan';

  @override
  String get inequalityBalanceOpsSubtitle =>
      'Tempatkan simbol pertidaksamaan di antara suku-suku matematika yang kompleks.';

  @override
  String get graphCoordinatePlotTitle => 'Plotter Grafik';

  @override
  String get graphCoordinatePlotSubtitle =>
      'Plot koordinat grid yang cocok dengan kurva linier/kuadrat.';

  @override
  String get baseConversionRunTitle => 'Konversi Basis';

  @override
  String get baseConversionRunSubtitle =>
      'Konversi nilai antara biner, desimal, hex, dan oktal.';

  @override
  String get unitConverterProTitle => 'Pengonversi Satuan';

  @override
  String get unitConverterProSubtitle =>
      'Jawab konversi unit cepat dalam batas waktu.';

  @override
  String get auditoryNBackTitle => 'Auditori N-Kembali';

  @override
  String get auditoryNBackSubtitle =>
      'Cocokkan huruf lisan yang didengar N langkah mundur dari ingatan.';

  @override
  String get abstractPatternRecallTitle => 'Pelapisan Pola';

  @override
  String get abstractPatternRecallSubtitle =>
      'Rekonstruksi bentuk warna-warni berlapis dari studi memori.';

  @override
  String get roomInspectorTitle => 'Inspektur Kamar';

  @override
  String get roomInspectorSubtitle =>
      'Identifikasi modifikasi furnitur yang dilakukan saat layar kosong.';

  @override
  String get voiceToFaceMatchTitle => 'Pencocokan Suara-Wajah';

  @override
  String get voiceToFaceMatchSubtitle =>
      'Pilih wajah yang benar terkait dengan klip suara audio yang diucapkan.';

  @override
  String get spatialGridMemory3DTitle => 'Memori Spasial 3D';

  @override
  String get spatialGridMemory3DSubtitle =>
      'Ingat kembali balok-balok yang berkedip dalam struktur kisi kubus 3D yang diputar.';

  @override
  String get sequenceStackTitle => 'Tumpukan Urutan';

  @override
  String get sequenceStackSubtitle =>
      'Rekonstruksi penambahan dan pengurangan tumpukan pelat secara berurutan.';

  @override
  String get semanticCategoryRecallTitle => 'Penarikan Kategori';

  @override
  String get semanticCategoryRecallSubtitle =>
      'Identifikasi kata-kata studi yang cocok dengan target kategori yang diminta.';

  @override
  String get gridDisplacementTitle => 'Perpindahan Jaringan';

  @override
  String get gridDisplacementSubtitle =>
      'Identifikasi ikon yang bergeser dengan membandingkan tata letak dengan aslinya.';

  @override
  String get soundSequenceMatchTitle => 'Pencocokan Urutan Suara';

  @override
  String get soundSequenceMatchSubtitle =>
      'Ulangi urutan nada yang dimainkan pada keyboard virtual.';

  @override
  String get cardCountingMemoryTitle => 'Penghitung Kartu';

  @override
  String get cardCountingMemorySubtitle =>
      'Identifikasi kartu yang sudah dibagikan dalam transaksi kartu berkelanjutan.';

  @override
  String get directionsRecallTitle => 'Ingat Petunjuk';

  @override
  String get directionsRecallSubtitle =>
      'Navigasikan peta grid yang cocok dengan arah jalur dari memori.';

  @override
  String get eventTimelineMemoryTitle => 'Garis Waktu Acara';

  @override
  String get eventTimelineMemorySubtitle =>
      'Susun kartu peristiwa sejarah/fiksi secara kronologis.';

  @override
  String get featureMatrixRecallTitle => 'Matriks Fitur';

  @override
  String get featureMatrixRecallSubtitle =>
      'Jawab pertanyaan pertanyaan tentang atribut bentuk-warna sel.';

  @override
  String get delayedMatchSampleTitle => 'Pertandingan Tertunda';

  @override
  String get delayedMatchSampleSubtitle =>
      'Cocokkan simbol target setelah menyelesaikan pengecoh matematika.';

  @override
  String get symbolDigitAssocTitle => 'Asosiasi Simbol-Digit';

  @override
  String get symbolDigitAssocSubtitle =>
      'Memecahkan lembar terjemahan simbol yang cocok dengan kunci angka.';

  @override
  String get dualTaskMemoryTitle => 'Memori Tugas Ganda';

  @override
  String get dualTaskMemorySubtitle =>
      'Hafalkan kumpulan kata sambil menyelesaikan tugas aritmatika cepat.';

  @override
  String get actionSequenceRecallTitle => 'Penarikan Tindakan';

  @override
  String get actionSequenceRecallSubtitle =>
      'Ulangi urutan animasi gerakan karakter secara berurutan.';

  @override
  String get tangramPolygonTitle => 'Tangram Cocok';

  @override
  String get tangramPolygonSubtitle =>
      'Susun bentuk poligon untuk mengisi garis siluet.';

  @override
  String get mazeNav3DTitle => 'Navigasi Labirin 3D';

  @override
  String get mazeNav3DSubtitle =>
      'Menavigasi rute labirin isometrik 3D dari tampilan orang pertama.';

  @override
  String get isometricProjectionTitle => 'Proyektor Isometrik';

  @override
  String get isometricProjectionSubtitle =>
      'Cocokkan figur blok 3D dengan tampilan atas/depan 2D ortografis.';

  @override
  String get polyominoPackingTitle => 'Pengepakan Poliomino';

  @override
  String get polyominoPackingSubtitle =>
      'Kemas potongan blok poliomino acak ke dalam area target.';

  @override
  String get spatialGridRotationTitle => 'Rotasi Grid Spasial';

  @override
  String get spatialGridRotationSubtitle =>
      'Cocokkan susunan blok 3D yang diputar sepanjang koordinat sumbu.';

  @override
  String get wireLoopGameTitle => 'Lingkaran Kawat';

  @override
  String get wireLoopGameSubtitle =>
      'Tarik cincin logam di sepanjang spline kawat tanpa kontak.';

  @override
  String get origamiUnfoldTitle => 'Origami Terungkap';

  @override
  String get origamiUnfoldSubtitle =>
      'Identifikasi pola pelubang kertas setelah membuka lipatan lembaran.';

  @override
  String get ropeTangleSolverTitle => 'Pengurai Tali';

  @override
  String get ropeTangleSolverSubtitle =>
      'Seret node ke tata letak grafik planar dengan garis nol bersilangan.';

  @override
  String get gridFitTetrisTitle => 'Pemecah Kesesuaian Grid';

  @override
  String get gridFitTetrisSubtitle =>
      'Susun balok statis tidak beraturan agar sesuai dengan batas wadah.';

  @override
  String get vectorGridAlignmentTitle => 'Penyelarasan Vektor';

  @override
  String get vectorGridAlignmentSubtitle =>
      'Skalakan dan putar bentuk agar sesuai dengan target templat bayangan.';

  @override
  String get blockStackingPhysicsTitle => 'Penumpukan Blok';

  @override
  String get blockStackingPhysicsSubtitle =>
      'Tumpuk panel blok tidak beraturan yang menyeimbangkan berat gravitasi.';

  @override
  String get crossSectionMatch3DTitle => 'Penampang 3D';

  @override
  String get crossSectionMatch3DSubtitle =>
      'Identifikasi geometri irisan 2D yang dipotong dari bentuk 3D.';

  @override
  String get symmetryPaintTitle => 'Cat Simetri';

  @override
  String get symmetryPaintSubtitle =>
      'Gambarlah segmen bayangan cermin yang memantulkan sumbu simetri.';

  @override
  String get rollingBlockBloxTitle => 'Blok Bergulir';

  @override
  String get rollingBlockBloxSubtitle =>
      'Gulung potongan balok untuk mendarat secara vertikal di slot target.';

  @override
  String get perspectiveShiftViewTitle => 'Pergeseran Perspektif';

  @override
  String get perspectiveShiftViewSubtitle =>
      'Putar cluster blok hingga mengeja huruf/kata.';

  @override
  String get networkFlowSphericalTitle => 'Aliran Jaringan';

  @override
  String get networkFlowSphericalSubtitle =>
      'Hubungkan aliran grid pada pembungkus koordinat silinder.';

  @override
  String get layeredSilhouetteBlendTitle => 'Campuran Siluet';

  @override
  String get layeredSilhouetteBlendSubtitle =>
      'Tumpuk lapisan berwarna agar sesuai dengan bentuk target yang tembus cahaya.';

  @override
  String get wordWheelPangramTitle => 'Anagram Kata';

  @override
  String get wordWheelPangramSubtitle =>
      'Buatlah kata-kata yang mengandung huruf sasaran pusat dari roda.';

  @override
  String get letterGridSwapperTitle => 'Penukar Surat';

  @override
  String get letterGridSwapperSubtitle =>
      'Tukar ubin huruf yang berdekatan untuk melengkapi kata baris dan kolom.';

  @override
  String get synonymMatchTitle => 'Pertandingan Sinonim';

  @override
  String get synonymMatchSubtitle =>
      'Cocokkan target kata yang jatuh dengan sinonim atau antonim.';

  @override
  String get vowelDropTitle => 'Penurunan Vokal';

  @override
  String get vowelDropSubtitle =>
      'Masukkan huruf vokal ke dalam kotak koordinat yang melengkapi kata-kata.';

  @override
  String get letterBalanceScaleTitle => 'Skala Keseimbangan Kata';

  @override
  String get letterBalanceScaleSubtitle =>
      'Eja kata-kata yang nilai hurufnya menyeimbangkan bobot.';

  @override
  String get wordChainShiritoriTitle => 'Rantai Kata';

  @override
  String get wordChainShiritoriSubtitle =>
      'Tautkan perulangan kata yang dimulai dengan keluaran huruf sebelumnya.';

  @override
  String get affixBuilderTitle => 'Pembuat Imbuhan';

  @override
  String get affixBuilderSubtitle =>
      'Gabungkan awalan/akhiran untuk membangun kosakata target.';

  @override
  String get decipherCrypticCluesTitle => 'Penguraian Kriptik';

  @override
  String get decipherCrypticCluesSubtitle =>
      'Pecahkan teka-teki permainan kata dan dekripsi teka-teki ejaan.';

  @override
  String get boggleWordSearchTitle => 'Sambungan Bingung';

  @override
  String get boggleWordSearchSubtitle =>
      'Telusuri jalur terhubung yang berdekatan untuk menemukan kata-kata tersembunyi.';

  @override
  String get idiomUnscrambleTitle => 'Penguraian Idiom';

  @override
  String get idiomUnscrambleSubtitle =>
      'Susun susunan kata yang diacak agar sesuai dengan makna idiom.';

  @override
  String get letterPyramidsTitle => 'Piramida Surat';

  @override
  String get letterPyramidsSubtitle =>
      'Bangun menara kata dengan menambahkan satu huruf anagram per tingkat.';

  @override
  String get soundAlikeHomophonesTitle => 'Kecocokan Homofon';

  @override
  String get soundAlikeHomophonesSubtitle =>
      'Identifikasi ejaan homofon yang benar untuk kalimat.';

  @override
  String get wordGridSudokuTitle => 'Kata Sudoku';

  @override
  String get wordGridSudokuSubtitle =>
      'Tesselate huruf dalam baris grid membentuk kata-kata.';

  @override
  String get portmanteauFactoryTitle => 'Pabrik Portmanteau';

  @override
  String get portmanteauFactorySubtitle =>
      'Gabungkan komponen semantik untuk menghasilkan kata majemuk.';

  @override
  String get codedCrosswordsCodeTitle => 'Teka Teki Silang Kata Sandi';

  @override
  String get codedCrosswordsCodeSubtitle =>
      'Memecahkan teka-teki silang grid yang cocok dengan kode angka-ke-huruf.';

  @override
  String get wordSnakeTrailTitle => 'Kata Ular';

  @override
  String get wordSnakeTrailSubtitle =>
      'Telusuri jejak huruf seperti ular yang mengeja kata-kata tematik.';

  @override
  String get typingRhythmSpeedTitle => 'Aliran Pengetikan';

  @override
  String get typingRhythmSpeedSubtitle =>
      'Ketikkan kosakata yang cocok dengan irama ritme metronom.';

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
  String get hideGame => 'Sembunyikan';

  @override
  String get unhideGame => 'Tampilkan';

  @override
  String get favoriteGame => 'Favorit';

  @override
  String get unfavoriteGame => 'Hapus Favorit';

  @override
  String get hiddenGames => 'GAME TERSEMBUNYI';

  @override
  String showHiddenGames(int count) {
    return 'Tampilkan Game Tersembunyi ($count)';
  }

  @override
  String get noHiddenGames => 'Tidak ada game tersembunyi';

  @override
  String get gameHidden => 'Game disembunyikan';

  @override
  String get undo => 'Urungkan';

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
  String get btnMatchColor => 'COCOKKAN WARNA';

  @override
  String get btnMatchWord => 'COCOKKAN KATA';

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
