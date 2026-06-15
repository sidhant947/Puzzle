// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Puzzle Hub';

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
  String get shapeRectangle => 'RECTANGLE';

  @override
  String get shapeEllipse => 'ELLIPSE';

  @override
  String get shapeTrapezoid => 'TRAPEZOID';

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
  String get laserLinkTitle => 'Laser Link';

  @override
  String get laserLinkSubtitle =>
      'Rotate mirrors to reflect lasers and power up all the targets.';

  @override
  String get laserLinkCongrats =>
      'Precision reflection! You\'ve successfully powered the entire grid.';

  @override
  String get crossSectionSliceTitle => 'Cross-Section Slice';

  @override
  String get crossSectionSliceSubtitle =>
      'Identify the correct 2D cross-section of a 3D object from a specific angle.';

  @override
  String get crossSectionSliceCongrats =>
      'Incredible 3D visualization! You saw right through that shape.';

  @override
  String get shadowPivotTitle => 'Shadow Pivot';

  @override
  String get shadowPivotCongrats =>
      'Dynamic spatial reasoning! You mastered the light and shadow.';

  @override
  String get shadowPivotSubtitle =>
      'Predict the shadow cast by a 3D object as it rotates on different axes.';

  @override
  String get interlockPuzzleTitle => 'Interlock Puzzle';

  @override
  String get interlockPuzzleSubtitle =>
      'Disassemble or assemble complex interlocking blocks in the correct sequence.';

  @override
  String get interlockPuzzleCongrats =>
      'Logical deconstruction! You\'ve unraveled the puzzle perfectly.';

  @override
  String get pathIntersectTitle => 'Path Intersect';

  @override
  String get pathIntersectSubtitle =>
      'Navigate multiple paths simultaneously to reach their respective targets without collision.';

  @override
  String get pathIntersectCongrats =>
      'Synchronized navigation! You\'ve reached all targets flawlessly.';

  @override
  String get negativeSpaceDetectionTitle => 'Negative Space';

  @override
  String get negativeSpaceDetectionSubtitle =>
      'Identify the shape formed by the empty space between objects.';

  @override
  String get negativeSpaceDetectionCongrats =>
      'Keen perception! You\'ve mastered the art of seeing what\'s not there.';

  @override
  String get compassMazeTitle => 'Compass Maze';

  @override
  String get compassMazeSubtitle =>
      'Navigate a maze where movement directions change based on your compass orientation.';

  @override
  String get compassMazeCongrats =>
      'Expert navigation! You\'ve found the exit through the shifting directions.';

  @override
  String get complexFoldingNetsTitle => 'Folding Nets';

  @override
  String get complexFoldingNetsSubtitle =>
      'Determine which complex 3D shape will be formed by folding a non-standard 2D net.';

  @override
  String get complexFoldingNetsCongrats =>
      'Advanced folding logic! You\'ve successfully visualized the 3D form.';

  @override
  String get compassMazeMessage => 'Navigate the maze using the compass.';

  @override
  String get negativeSpaceDetectionMessage =>
      'Identify the hidden object in the space.';
}
