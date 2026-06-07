// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Puzzle Hub';

  @override
  String get home => 'Główna';

  @override
  String get settings => 'Ustawienia';

  @override
  String get playAgain => 'Graj ponownie';

  @override
  String get playNext => 'Graj dalej';

  @override
  String get seeCompleted => 'Przegląd';

  @override
  String get finish => 'Zakończ';

  @override
  String get congrats => 'Gratulacje';

  @override
  String get perfectGradient => 'Idealny gradient!';

  @override
  String get wellDone => 'Dobra robota';

  @override
  String get timeUp => 'Czas minął!';

  @override
  String get completed => 'Ukończono!';

  @override
  String get score => 'Wynik';

  @override
  String get timeLeft => 'Czas';

  @override
  String get trials => 'Próby';

  @override
  String get numberRule => 'Zasada liczb';

  @override
  String get colorRule => 'Zasada kolorów';

  @override
  String get valid => 'Prawidłowe';

  @override
  String get invalid => 'Nieprawidłowe';

  @override
  String get even => 'Parzyste';

  @override
  String get odd => 'Nieparzyste';

  @override
  String get red => 'Czerwony';

  @override
  String get green => 'Zielony';

  @override
  String get blue => 'Niebieski';

  @override
  String get yes => 'Tak';

  @override
  String get no => 'Nie';

  @override
  String get trueLabel => 'Prawda';

  @override
  String get falseLabel => 'Fałsz';

  @override
  String get clear => 'Wyczyść';

  @override
  String get north => 'Północ';

  @override
  String get south => 'Południe';

  @override
  String get east => 'Wschód';

  @override
  String get west => 'Zachód';

  @override
  String get target => 'Cel';

  @override
  String get moves => 'Ruchy';

  @override
  String get trialMode => 'Tryb prób';

  @override
  String get trialModeDescription =>
      'Rozwiąż 20, aby zakończyć, zamiast timera 60s';

  @override
  String get appearance => 'Wygląd';

  @override
  String get language => 'Język';

  @override
  String get gameplay => 'Rozgrywka';

  @override
  String get supportUs => 'Wesprzyj nas';

  @override
  String get systemLegal => 'System i prawo';

  @override
  String get games => 'Gry';

  @override
  String get solvedToday => 'Rozwiązane dzisiaj';

  @override
  String get searchGames => 'Szukaj gier...';

  @override
  String get readyToStart => 'GOTOWY NA TRENING MÓZGU?';

  @override
  String get greatStart => 'ŚWIETNY POCZĄTEK! TRZYMAJ TAK DALEJ.';

  @override
  String get onFire => 'REWELACJA! TWÓJ MÓZG TO UWIELBIA.';

  @override
  String get incredible => 'NIESAMOWITE! JESTEŚ MISTRZEM ZAGADEK.';

  @override
  String get noGamesMatch => 'BRAK GIER PASUJĄCYCH DO WYSZUKIWANIA';

  @override
  String get categoryAll => 'WSZYSTKIE';

  @override
  String get categoryAttention => 'UWAGA';

  @override
  String get categoryLogic => 'LOGIKA';

  @override
  String get categoryMath => 'MATEMATYKA';

  @override
  String get categoryWord => 'SŁOWA';

  @override
  String get categoryMemory => 'PAMIĘĆ';

  @override
  String get categorySpatial => 'PRZESTRZENNE';

  @override
  String get themeLight => 'JASNY';

  @override
  String get themeDark => 'CIEMNY';

  @override
  String get themeSystem => 'SYSTEMOWY';

  @override
  String get starOnGithub => 'Oznacz gwiazdką na GitHubie';

  @override
  String get sponsorOnGithub => 'Sponsoruj na GitHubie';

  @override
  String get privacyPolicy => 'Polityka prywatności';

  @override
  String get termsOfService => 'Regulamin';

  @override
  String get licenses => 'Licencje';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return 'Masz $maxTries prób, aby znaleźć ukryte słowo o długości $wordLength liter.';
  }

  @override
  String wordFoundMessage(String word) {
    return 'Słowo znalezione pomyślnie: $word';
  }

  @override
  String gameOverMessage(String word) {
    return 'Słowem było: $word';
  }

  @override
  String get gameOver => 'Koniec gry';

  @override
  String get crosswordTitle => 'Krzyżówka';

  @override
  String get crosswordSubtitle =>
      'Uzupełnij siatkę poprawnymi słowami na podstawie podanych wskazówek.';

  @override
  String get wordSearchTitle => 'Wyszukiwanie słów';

  @override
  String get radicalRootsTitle => 'Radykalne pierwiastki';

  @override
  String get radicalRootsSubtitle =>
      'Znajdź pierwiastek kwadratowy lub sześcienny z podanej liczby. W razie potrzeby zaokrąglij do najbliższej liczby całkowitej.';

  @override
  String get radicalRootsGoalReached => 'Cel osiągnięty!';

  @override
  String get radicalRootsTimeUp => 'Czas minął!';

  @override
  String radicalRootsScoreMessage(int score) {
    return 'Obliczyłeś poprawnie $score pierwiastków!';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return 'Ćwicz dalej! Obliczyłeś $score pierwiastków.';
  }

  @override
  String get radicalRootsStart => 'Zacznij obliczać';

  @override
  String get radicalRootsDescription =>
      'Masz 60 sekund, aby rozwiązać jak najwięcej.';

  @override
  String get radicalRootsBest => 'Najlepszy';

  @override
  String get radicalRootsSeconds => '60 SEKUND';

  @override
  String get romanArithmeticTitle => 'Arytmetyka rzymska';

  @override
  String get romanArithmeticSubtitle =>
      'Rozwiązuj zadania z dodawaniem i odejmowaniem przy użyciu cyfr rzymskich.';

  @override
  String get romanArithmeticGoalReached => 'Poziom Centuriona!';

  @override
  String get romanArithmeticTimeUp => 'Czas minął!';

  @override
  String romanArithmeticScoreMessage(int score) {
    return 'Rozwiązałeś $score rzymskich zadań!';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return 'Veni, Vidi, Vici! Rozwiązałeś $score zadań.';
  }

  @override
  String get romanArithmeticStart => 'Rozpocznij misję';

  @override
  String get romanArithmeticDescription =>
      'Konwertuj i rozwiązuj. Masz 60 sekund.';

  @override
  String get romanArithmeticBest => 'Najlepszy';

  @override
  String get romanArithmeticSeconds => '60 SEKUND';

  @override
  String get wordSearchSubtitle =>
      'Znajdź wszystkie ukryte słowa w siatce. Przeciągnij, aby zaznaczyć.';

  @override
  String get missingVowelsTitle => 'Brakujące samogłoski';

  @override
  String get missingVowelsSubtitle =>
      'Zidentyfikuj słowo z ukrytymi samogłoskami.';

  @override
  String get missingVowelsWin => 'Samogłoski przywrócone!';

  @override
  String get missingVowelsHowToPlay =>
      'Słowo jest pokazane z ukrytymi samogłoskami (A, E, I, O, U). Odgadnij całe słowo!';

  @override
  String get wordScrambleTitle => 'Pomieszane słowa';

  @override
  String get wordScrambleSubtitle =>
      'Dotknij liter, aby rozszyfrować ukryte słowo!';

  @override
  String get wordScrambleWin => 'Słowo rozszyfrowane!';

  @override
  String get sudokuTitle => 'Sudoku';

  @override
  String get sudokuSubtitle =>
      'Uzupełnij siatkę tak, aby każdy wiersz, kolumna i kwadrat 3x3 zawierały wszystkie cyfry od 1 do 9.';

  @override
  String get minesweeperTitle => 'Saper';

  @override
  String get minesweeperSubtitle =>
      'Zidentyfikuj wszystkie miny bez ich detonowania.';

  @override
  String get minesweeperWin => 'Zwycięstwo!';

  @override
  String get minesweeperMines => 'MINY';

  @override
  String get minesweeperStatus => 'STATUS';

  @override
  String get minesweeperWon => 'WYGRANA';

  @override
  String get minesweeperBoom => 'BUM';

  @override
  String get minesweeperPlaying => 'W GRZE';

  @override
  String get minesweeperReveal => 'ODKRYJ';

  @override
  String get minesweeperFlag => 'FLAGA';

  @override
  String get game2048Title => '2048';

  @override
  String get game2048Subtitle =>
      'Przesuwaj w dowolnym kierunku, aby łączyć kafelki i dotrzeć do kafelka 2048!';

  @override
  String get nonogramTitle => 'Nonogram';

  @override
  String get nonogramSubtitle =>
      'Odkryj ukryty obrazek za pomocą logicznych wskazówek.';

  @override
  String get nonogramWin => 'Obrazek odkryty!';

  @override
  String get magnetsTitle => 'MAGNESY';

  @override
  String get magnetsSubtitle =>
      'Umieść magnesy w siatce na podstawie liczby biegunów.';

  @override
  String get magnetsHowToPlay =>
      'Wypełnij pojemniki wielkości domina magnesami „+” i „-” lub pozostaw je puste. Wskazówki w wierszach i kolumnach określają całkowitą liczbę każdego bieguna w danej linii. Identyczne bieguny nie mogą sąsiadować ze sobą prostopadle.';

  @override
  String get magnetsWinTitle => 'POLARYZACJA ZRÓWNOWAŻONA!';

  @override
  String get magnetsWinMessage => 'Wszystkie magnesy są idealnie ułożone!';

  @override
  String get lighthousesTitle => 'LATARNIE MORSKIE';

  @override
  String get lighthousesSubtitle =>
      'Rozmieść statki na podstawie wskazówek z latarń.';

  @override
  String get lighthousesHowToPlay =>
      'Umieść statki 1x1 w siatce. Latarnie wskazują całkowitą liczbę statków widocznych w poziomie i pionie. Statki nie mogą dotykać latarń ani siebie nawzajem, nawet po przekątnej.';

  @override
  String get lighthousesWinTitle => 'MORZE BEZPIECZNE!';

  @override
  String get lighthousesWinMessage =>
      'Wszystkie latarnie idealnie prowadzą statki!';

  @override
  String get dominosaTitle => 'DOMINOSA';

  @override
  String get dominosaSubtitle =>
      'Znajdź wszystkie ukryte kostki domina w siatce.';

  @override
  String get dominosaHowToPlay =>
      'Ułóż kompletny zestaw kostek domina na siatce liczb tak, aby każda para sąsiednich liczb była zakryta dokładnie jedną kostką. Każda para liczb występuje w zestawie tylko raz.';

  @override
  String get dominosaWinTitle => 'MISTRZ DOMINA!';

  @override
  String get dominosaWinMessage =>
      'Każda kostka domina została znaleziona i umieszczona!';

  @override
  String get skyscrapersTitle => 'WIEŻOWCE';

  @override
  String get skyscrapersSubtitle => 'Wypełnij siatkę wysokościami budynków.';

  @override
  String get skyscrapersHowToPlay =>
      'Wypełnij siatkę wysokościami (1-N) tak, aby każdy wiersz i kolumna zawierały każdą wysokość dokładnie raz. Wskazówki na krawędziach informują, ile budynków jest widocznych z danego kierunku, przy czym wyższe budynki zasłaniają niższe.';

  @override
  String get skyscrapersWinTitle => 'PANORAMA PRZYWRÓCONA!';

  @override
  String get skyscrapersWinMessage =>
      'Wszystkie budynki są idealnie rozmieszczone!';

  @override
  String get nurikabeTitle => 'NURIKABE';

  @override
  String get nurikabeSubtitle => 'Stwórz połączone morze i oddzielne wyspy.';

  @override
  String get nurikabeHowToPlay =>
      'Zamaluj komórki, aby utworzyć jedno połączone „morze” (bez bloków 2x2). Niezamalowane komórki tworzą „wyspy”, z których każda zawiera dokładnie jedną liczbę reprezentującą jej całkowitą powierzchnię.';

  @override
  String get nurikabeWinTitle => 'MORZE PŁYNIE!';

  @override
  String get nurikabeWinMessage => 'Wyspy oddzielone, morze połączone!';

  @override
  String get fillominoTitle => 'FILLOMINO';

  @override
  String get fillominoSubtitle =>
      'Podziel siatkę na poliamina o określonych rozmiarach.';

  @override
  String get fillominoHowToPlay =>
      'Podziel siatkę na poliamina tak, aby każde poliamino o rozmiarze N zawierało liczbę N we wszystkich swoich komórkach. Poliamina o tym samym rozmiarze nie mogą sąsiadować ze sobą prostopadle.';

  @override
  String get fillominoWinTitle => 'SIATKA PODZIELONA!';

  @override
  String get fillominoWinMessage => 'Idealnie ułożone kafelki dzięki logice!';

  @override
  String get hitoriTitle => 'HITORI';

  @override
  String get hitoriSubtitle =>
      'Zamaluj powtarzające się liczby w każdym wierszu i kolumnie.';

  @override
  String get hitoriHowToPlay =>
      'Zamaluj komórki tak, aby żadna liczba nie pojawiła się więcej niż raz w żadnym wierszu ani kolumnie. Zamalowane komórki nie mogą ze sobą sąsiadować (prostopadle), a wszystkie niezamalowane komórki muszą tworzyć jedną połączoną grupę.';

  @override
  String get hitoriWinTitle => 'MISTRZ HITORI!';

  @override
  String get hitoriWinMessage =>
      'Udało Ci się pomyślnie usunąć wszystkie duplikaty!';

  @override
  String get pathFinderTitle => 'Poszukiwacz ścieżki';

  @override
  String get pathFinderSubtitle => 'Znajdź ukrytą ścieżkę od S do E.';

  @override
  String get pathFinderWin => 'Ścieżka opanowana!';

  @override
  String get howToPlay => 'Jak grać';

  @override
  String get gotIt => 'Rozumiem';

  @override
  String get akariTitle => 'Akari';

  @override
  String get akariSubtitle => 'Oświetl wszystkie białe pola';

  @override
  String get akariHowToPlay =>
      'Umieść żarówki w białych polach, aby oświetlić całą siatkę. Żarówki oświetlają swój wiersz i kolumnę, dopóki nie napotkają ściany. Żadne dwie żarówki nie mogą się nawzajem oświetlać. Ponumerowane ściany pokazują dokładnie, ile żarówek musi zostać umieszczonych w sąsiednich polach (góra, dół, lewo, prawo).';

  @override
  String get akariWinTitle => 'ŚWIATŁA ZAPALONE!';

  @override
  String get akariWinMessage => 'Wszystko jest idealnie oświetlone.';

  @override
  String get arithmeticChainTitle => 'Łańcuch arytmetyczny';

  @override
  String get arithmeticChainSubtitle => 'Obliczaj sumę bieżącą w pamięci';

  @override
  String get arithmeticChainWinTitle => 'POZIOM W GÓRĘ!';

  @override
  String get arithmeticChainWinMessage =>
      'Twoje obliczenia w pamięci są błyskawiczne!';

  @override
  String get arithmeticChainLoseTitle => 'SPRÓBUJ PONOWNIE';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return 'Poprawna odpowiedź to $answer.';
  }

  @override
  String get arithmeticChainStart => 'START';

  @override
  String get arithmeticChainNext => 'DALEJ';

  @override
  String get attentionalBlinkTitle => 'Mrugnięcie uwagowe';

  @override
  String get attentionalBlinkSubtitleWatch => 'UWAŻAJ NA LICZBY';

  @override
  String get attentionalBlinkSubtitleInput =>
      'WPROWADŹ DWIE LICZBY, KTÓRE WIDZIAŁEŚ';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return 'Zdobyłeś $score celów!';
  }

  @override
  String get balanceScaleTitle => 'WAGA SZALKOWA';

  @override
  String get balanceScaleSubtitle =>
      'Wnioskuj o wadze ostatniego przedmiotu na podstawie wag.';

  @override
  String get balanceScaleWinTitle => 'W RÓWNOWADZE!';

  @override
  String get balanceScaleWinMessage => 'Poprawnie wywnioskowałeś wagę!';

  @override
  String get balanceScaleLoseTitle => 'BRAK RÓWNOWAGI';

  @override
  String get balanceScaleLoseMessage =>
      'Spróbuj ponownie znaleźć właściwą równowagę.';

  @override
  String get balanceScaleBack => 'WSTECZ';

  @override
  String get balanceScaleSubmit => 'WYŚLIJ';

  @override
  String get binaryPuzzleTitle => 'ŁAMIGŁÓWKA BINARNA';

  @override
  String get binaryPuzzleSubtitle =>
      'Wypełnij 0 i 1. Maksymalnie dwie te same cyfry obok siebie. Równa liczba 0 i 1 w każdym wierszu i kolumnie.';

  @override
  String get binaryPuzzleWinTitle => 'DOBRA ROBOTA';

  @override
  String get binaryPuzzleWinMessage =>
      'Rozwiązałeś łamigłówkę binarną z doskonałą logiką!';

  @override
  String get blockEscapeTitle => 'UCIECZKA BLOKU';

  @override
  String get blockEscapeSubtitle =>
      'Przesuwaj bloki, aby oczyścić ścieżkę dla głównego bloku do wyjścia.';

  @override
  String get blockEscapeWinTitle => 'UCIECZKA!';

  @override
  String get blockEscapeWinMessage =>
      'Pomyślnie oczyściłeś ścieżkę dla głównego bloku!';

  @override
  String get boxCompletionTitle => 'Dopełnianie pudełka';

  @override
  String get boxCompletionSubtitle => 'Który sześcian można utworzyć?';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return 'Zdobyłeś $score poprawnych na $totalTrials!';
  }

  @override
  String get boxCompletionOptions => 'OPCJE';

  @override
  String get bridgesTitle => 'MOSTY';

  @override
  String get bridgesSubtitle =>
      'Połącz wyspy mostami. Każda wyspa potrzebuje określonej liczby mostów. Mosty nie mogą się przecinać.';

  @override
  String get bridgesWinTitle => 'POŁĄCZONO!';

  @override
  String get bridgesWinMessage => 'Pomyślnie połączyłeś wszystkie wyspy!';

  @override
  String get calculationSprintTitle => 'SPRINT OBLICZENIOWY';

  @override
  String get calculationSprintSubtitle =>
      'Rozwiąż jak najwięcej równań w 60 sekund.';

  @override
  String get calculationSprintGoalReached => 'CEL OSIĄGNIĘTY!';

  @override
  String get calculationSprintTimeUp => 'CZAS MINĄŁ';

  @override
  String calculationSprintScoreMessage(int score) {
    return 'Doskonała prędkość obliczeń! Zdobyłeś $score punktów.';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return 'Zdobyłeś $score punktów. Spróbuj pobić swój rekord!';
  }

  @override
  String get calculationSprintBest => 'REKORD';

  @override
  String get calculationSprintSeconds => '60 SEKUND';

  @override
  String get calculationSprintDescription =>
      'Rozwiązuj równania szybko.\nBłędne odpowiedzi odejmują 3 sekundy!';

  @override
  String get calculationSprintStart => 'ZACZNIJ SPRINT';

  @override
  String get categoryFluencyTitle => 'Płynność kategoryczna';

  @override
  String get categoryFluencySubtitle =>
      'Wprowadź elementy należące do kategorii';

  @override
  String get categoryFluencyExpert => 'EKSPERT PŁYNNOŚCI!';

  @override
  String get categoryFluencyTimeUp => 'CZAS MINĄŁ!';

  @override
  String get categoryFluencyWinMessage => 'Masz bogate słownictwo!';

  @override
  String categoryFluencyFoundMessage(int count) {
    return 'Znaleziono $count słów.';
  }

  @override
  String get categoryFluencyCategoryLabel => 'Kategoria:';

  @override
  String get categoryFluencyEnterItem => 'Wprowadź element...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target słów';
  }

  @override
  String get changeBlindnessTitle => 'Ślepota na zmiany';

  @override
  String get changeBlindnessSubtitle => 'ZNAJDŹ ZMIENIAJĄCY SIĘ ELEMENT';

  @override
  String changeBlindnessScore(int score) {
    return 'WYNIK: $score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return 'Znaleziono $score zmian!';
  }

  @override
  String get choiceRtTitle => 'Czas reakcji z wyborem';

  @override
  String get choiceRtSubtitle =>
      'Dotknij aktywnego kwadratu tak szybko, jak potrafisz';

  @override
  String choiceRtAvgMessage(String avg) {
    return 'Twój średni czas reakcji: ${avg}ms';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return 'Pozostały czas: ${time}s';
  }

  @override
  String choiceRtTaps(int count) {
    return 'Dotknięcia: $count';
  }

  @override
  String get colorFloodTitle => 'Zalewanie kolorem';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return 'Ruchy: $moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => 'SUKCES ZALEWANIA!';

  @override
  String get colorFloodDryLand => 'SUCHY LĄD...';

  @override
  String get colorFloodWinMessage => 'Nasyciłeś całą siatkę kolorem!';

  @override
  String get colorFloodLoseMessage => 'Zabrakło ci ruchów. Spróbuj ponownie!';

  @override
  String get colorMatchTitle => 'DOPASOWANIE KOLORU';

  @override
  String get colorMatchSubtitle =>
      'Ustaw suwaki, aby jak najdokładniej dopasować kolor do celu.';

  @override
  String get colorMatchTarget => 'CEL';

  @override
  String get colorMatchYours => 'TWÓJ';

  @override
  String get colorMatchCheck => 'SPRAWDŹ DOPASOWANIE';

  @override
  String get colorMatchResult => 'WYNIK DOPASOWANIA';

  @override
  String colorMatchAccuracy(String accuracy) {
    return 'Twoja dokładność: $accuracy%';
  }

  @override
  String get corsiBlocksTitle => 'BLOKI CORSYEGO';

  @override
  String get corsiBlocksSubtitle =>
      'Obserwuj ulatujące bloki i dotykaj ich w tej samej kolejności.';

  @override
  String get corsiBlocksWinTitle => 'MISTRZ PRZESTRZENI!';

  @override
  String get corsiBlocksLoseTitle => 'ZAGUBIONY W PRZESTRZENI';

  @override
  String corsiBlocksMessage(int score, int span) {
    return 'Zapamiętałeś $score sekwencji! Twoja rozpiętość pamięci przestrzennej osiągnęła $span.';
  }

  @override
  String get corsiBlocksWatch => 'OBSERWUJ WZÓR';

  @override
  String get corsiBlocksRepeat => 'POWTÓRZ WZÓR';

  @override
  String get corsiBlocksExcellent => 'DOSKONALE!';

  @override
  String get corsiBlocksSpan => 'ROZPIĘTOŚĆ';

  @override
  String get crownTitle => 'KORONA';

  @override
  String get crownSubtitle =>
      'Umieść jedną koronę w każdym wierszu, kolumnie i regionie koloru. Korony nie mogą sąsiadować, nawet po przekątnej.';

  @override
  String get crownCrowned => 'UKORONOWANO!';

  @override
  String get crownSuccess =>
      'Wszystkie korony umieszczone pomyślnie z doskonałą logiką.';

  @override
  String get cryptogramTitle => 'KRYPTOGRAM';

  @override
  String get cryptogramSubtitle =>
      'Przypisz litery, aby odszyfrować tajną wiadomość! Każda zakodowana litera reprezentuje prawdziwą literę.';

  @override
  String get cryptogramBroken => 'KOD ZŁAMANY!';

  @override
  String get cryptogramEncrypted => 'ZAKODOWANE';

  @override
  String get cryptogramSuccess => 'Doskonale odszyfrowałeś wiadomość.';

  @override
  String get cryptogramTryAgain => 'Spróbuj ponownie złamać szyfr.';

  @override
  String get digitSpanReverseTitle => 'Odwrócona rozpiętość';

  @override
  String get digitSpanReverseSubtitleMemorize => 'Zapamiętaj cyfry';

  @override
  String get digitSpanReverseSubtitleEnter =>
      'Wprowadź cyfry w ODWRÓCONEJ kolejności';

  @override
  String get digitSpanReverseWinTitle => 'POZIOM W GÓRĘ!';

  @override
  String get digitSpanReverseWinMessage =>
      'Twoja pamięć robocza jest imponująca!';

  @override
  String get digitSpanReverseLoseTitle => 'SPRÓBUJ PONOWNIE';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return 'Poprawna odwrócona sekwencja to $sequence.';
  }

  @override
  String get dividedAttentionTitle => 'Podzielność uwagi';

  @override
  String get dividedAttentionSubtitle =>
      'Dotknij LEWO dla GWIAZDY ⭐ | Dotknij PRAWO dla CZERWONEGO 🔴';

  @override
  String get dividedAttentionGameOverTitle => 'SKUPIENIE PRZERWANE';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return 'Wielozadaniowość jest trudna! Twój wynik to $score.';
  }

  @override
  String dividedAttentionScore(int score) {
    return 'WYNIK: $score';
  }

  @override
  String get doubleNBackTitle => 'Podwójne N-Wstecz';

  @override
  String doubleNBackSubtitle(int n) {
    return 'Dopasuj bodźce o $n kroków wstecz';
  }

  @override
  String get doubleNBackGameOverTitle => 'KONIEC GRY';

  @override
  String doubleNBackGameOverMessage(int score) {
    return 'Zdobyłeś $score punktów w Podwójnym N-Wstecz!';
  }

  @override
  String doubleNBackScore(int score) {
    return 'Wynik: $score';
  }

  @override
  String get doubleNBackPositionMatch => 'DOPASOWANIE POZYCJI';

  @override
  String get doubleNBackLetterMatch => 'DOPASOWANIE LITERY';

  @override
  String get faceNameAssociationTitle => 'Twarz-Imię';

  @override
  String get faceNameAssociationSubtitleStudy =>
      'Zapamiętaj imię dla każdej twarzy';

  @override
  String get faceNameAssociationSubtitleTest => 'Kto to jest?';

  @override
  String get faceNameAssociationPerfect => 'IDEALNIE!';

  @override
  String get faceNameAssociationGameOver => 'KONIEC GRY';

  @override
  String get faceNameAssociationWinMessage =>
      'Masz świetną pamięć do twarzy i imion!';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return 'Uzyskałeś $correct poprawnych na $total.';
  }

  @override
  String get faceNameAssociationStartTest => 'ROZPOCZNIJ TEST';

  @override
  String get flankerTestWinTitle => 'LASEROWE SKUPIENIE!';

  @override
  String get flankerTestLoseTitle => 'ROZPROSZONY';

  @override
  String flankerTestScoreMessage(int score) {
    return 'Zdobyłeś $score poprawnych!';
  }

  @override
  String get flankerTestTitle => 'TEST FLANKERÓW';

  @override
  String get flankerTestSubtitle =>
      'Wskaż kierunek środkowej strzałki, ignorując strzałki boczne.';

  @override
  String get flankerTestLeft => 'LEWO';

  @override
  String get flankerTestRight => 'PRAWO';

  @override
  String get fractionMatchTitle => 'Dopasowanie ułamków';

  @override
  String get fractionMatchSubtitle => 'Dopasuj obrazek do jego ułamka';

  @override
  String get fractionMatchLoseTitle => 'BŁĄD DOPASOWANIA';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return 'Poprawna odpowiedź to $correctAnswer.';
  }

  @override
  String get goNoGoTitle => 'Go / No-Go';

  @override
  String get goNoGoSubtitle => 'Dotknij dla zielonego, IGNORUJ czerwone!';

  @override
  String get goNoGoLoseTitle => 'REAKCJA ZATRZYMANA';

  @override
  String get goNoGoLoseMessage => 'Twoja kontrola hamowania jest testowana!';

  @override
  String get goNoGoTapAnywhere => 'DOTKNIJ GDZIEKOLWIEK, ABY KONTYNUOWAĆ';

  @override
  String get groceryListTitle => 'Lista zakupów';

  @override
  String get groceryListSubtitleMemorize =>
      'Zapamiętaj produkty i ich kategorie';

  @override
  String get groceryListSubtitleTest =>
      'Do której kategorii należał ten produkt?';

  @override
  String get groceryListWinTitle => 'GURU ZAKUPÓW!';

  @override
  String get groceryListLoseTitle => 'O czymś zapomniałeś?';

  @override
  String groceryListScoreMessage(int score) {
    return 'Zdobyłeś $score punktów w Liście zakupów!';
  }

  @override
  String get groceryListReady => 'JESTEM GOTOWY';

  @override
  String get groceryListWhereBelong => 'GDZIE TO NALEŻY?';

  @override
  String get hueSortTitle => 'SORTOWANIE BARW';

  @override
  String get hueSortSubtitle =>
      'Zamień kafelki, aby stworzyć płynne przejście między kolorami narożnymi. Kropki wskazują stałe kafelki.';

  @override
  String get hueSortWinTitle => 'IDEALNY GRADIENT!';

  @override
  String get hueSortWinMessage => 'Idealnie posortowałeś spektrum kolorów!';

  @override
  String hueSortWrongTiles(int count) {
    return 'Kafelki w złej pozycji: $count';
  }

  @override
  String get kenkenTitle => 'KenKen';

  @override
  String get kenkenWinTitle => 'GENIUSZ!';

  @override
  String get kenkenLoseTitle => 'KONIEC GRY';

  @override
  String get kenkenWinMessage => 'Rozwiązałeś łamigłówkę KenKen!';

  @override
  String get kenkenLoseMessage => 'Sprawdź zasady wiersza/kolumny i klatki.';

  @override
  String kenkenSubtitle(int size) {
    return 'Wypełnij 1-$size bez powtórzeń w wierszach/kolumnach';
  }

  @override
  String get letterCancellationTitle => 'Anulowanie liter';

  @override
  String get letterCancellationTitleFull => 'Test anulowania liter';

  @override
  String letterCancellationScoreMessage(int score) {
    return 'Znaleziono $score liter!';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return 'Znajdź wszystkie litery \"$target\"';
  }

  @override
  String get letterCancellationFound => 'ZNALEZIONO';

  @override
  String get letterCancellationTime => 'CZAS';

  @override
  String get lightsOutTitle => 'ZGAŚ ŚWIATŁA';

  @override
  String get lightsOutSubtitle =>
      'Dotknięcie kafelka przełącza go i jego sąsiadów. Zgaś wszystkie światła, aby rozwiązać.';

  @override
  String get lightsOutWinTitle => 'ŁAMIGŁÓWKA ROZWIĄZANA!';

  @override
  String get lightsOutWinMessage => 'Pomyślnie zgasiłeś wszystkie światła!';

  @override
  String get symmetryTitle => 'Symetria';

  @override
  String get symmetrySubtitle =>
      'Odzwierciedl wzór z lewej strony na pustej siatce po prawej.';

  @override
  String get semanticLinkTitle => 'Powiązanie semantyczne';

  @override
  String get semanticLinkSubtitle => 'Znajdź słowo łączące wszystkie trzy';

  @override
  String get reflexTapTitle => 'Refleks';

  @override
  String get visualStatisticalLearningTitle => 'Koniec gry';

  @override
  String get orbitTapTitle => 'Orbit Tap';

  @override
  String get orbitTapSubtitle => 'Dotknij, gdy kulki zrównają się z bramką';

  @override
  String get schulteTableTitle => 'Świetne skupienie!';

  @override
  String get multipleObjectTrackingTitle => 'Śledzenie obiektów';

  @override
  String get multipleObjectTrackingSubtitle =>
      'Obserwuj podświetlone obiekty. Śledź je podczas ruchu, a następnie je wybierz.';

  @override
  String get sdmtTitle => 'Test SDMT';

  @override
  String get sdmtSubtitle =>
      'Użyj powyższego klucza, aby znaleźć cyfrę dla pokazanego symbolu.';

  @override
  String get memoryMatrixTitle => 'Cel osiągnięty!';

  @override
  String get memoryMatrixSubtitle => 'Zapamiętaj wzór i dotknij kafelków.';

  @override
  String get mentalAbacusTitle => 'Mistrz abakusa!';

  @override
  String get mentalAbacusSubtitle => 'Rozwiąż używając sorobanu';

  @override
  String get spellingSprintTitle => 'Sprint ortograficzny';

  @override
  String get spellingSprintSubtitle =>
      'Ścigaj się z czasem, aby przeliterować jak najwięcej słów.';

  @override
  String get stopSignalTitle => 'Sygnał stopu';

  @override
  String get stopSignalSubtitle =>
      'Dotknij kierunku strzałki, ale ZATRZYMAJ SIĘ natychmiast, jeśli strzałka zmieni kolor na CZERWONY.';

  @override
  String get staircaseMemoryTitle => 'Pamięć schodkowa';

  @override
  String get vigilanceTaskTitle => 'Zadanie czujności';

  @override
  String get vigilanceTaskSubtitle =>
      'Dotknij przycisku, gdy wskazówka pominie pozycję';

  @override
  String get logicalSyllogismsTitle => 'Sylogizmy logiczne';

  @override
  String get logicalSyllogismsSubtitle =>
      'Czy wniosek jest logicznie poprawny?';

  @override
  String get mathPathTitle => 'Matematyczna ścieżka';

  @override
  String get mathPathSubtitle =>
      'Znajdź ścieżkę, która sumuje się dokładnie do docelowej kwoty.';

  @override
  String get sternbergTaskTitle => 'Zadanie Sternberga';

  @override
  String get sternbergTaskMemorize => 'Zapamiętaj litery';

  @override
  String get sternbergTaskWasLetterSet => 'Czy ta litera była w zestawie?';

  @override
  String sternbergTaskScore(int score) {
    return 'Zdobyłeś $score punktów w Zadaniu Sternberga!';
  }

  @override
  String get verbalAnalogiesTitle => 'Mistrz analogii!';

  @override
  String get verbalAnalogiesSubtitle => 'Uzupełnij relację';

  @override
  String get typingSpeedTitle => 'Prędkość pisania';

  @override
  String get typingSpeedSubtitle =>
      'Wpisz frazę dokładnie tak, jak pokazano, tak szybko, jak potrafisz!';

  @override
  String get wordLadderTitle => 'Drabina słowna';

  @override
  String get wordLadderSubtitle =>
      'Połącz słowa, zmieniając jedną literę naraz.';

  @override
  String get tangleFixTitle => 'Rozplątane!';

  @override
  String get tangleFixSubtitle =>
      'Rozplącz linie tak, aby żadna się nie przecinała';

  @override
  String get oddRotationTitle => 'Dziwna rotacja';

  @override
  String get oddRotationSubtitle =>
      'Jeden z nich jest lustrzanym odbiciem. Czy potrafisz go znaleźć?';

  @override
  String get towerOfLondonTitle => 'Wieża Londyńska';

  @override
  String get towerOfLondonSubtitle => 'Dopasuj do konfiguracji docelowej';

  @override
  String get symbolicFlankerTitle => 'Symboliczny flanker';

  @override
  String get symbolicFlankerSubtitle => 'Skup się na środkowym symbolu';

  @override
  String get stroopTestTitle => 'Test Stroopa';

  @override
  String get stroopTestSubtitle =>
      'Zidentyfikuj kolor atramentu pokazanego słowa. Ignoruj to, co słowo faktycznie mówi!';

  @override
  String get wisconsinCardSortingTitle => 'Koniec gry';

  @override
  String get wisconsinCardSortingSubtitle =>
      'DOPASUJ KARTĘ DO JEDNEJ Z CZTERECH POWYŻEJ';

  @override
  String get nBackTitle => 'Test N-Wstecz';

  @override
  String get nBackSubtitle =>
      'Dotknij DOPASOWANIE, jeśli bieżąca litera zgadza się z tą pokazaną 2 kroki temu.';

  @override
  String get rhythmMasterTitle => 'Mistrz rytmu';

  @override
  String get rhythmMasterSubtitle => 'Dotykaj synchronicznie z pulsem';

  @override
  String get pixelMimicTitle => 'Pikselowy mimik';

  @override
  String get targetNumberTitle => 'Cel 24';

  @override
  String targetNumberSubtitle(int target) {
    return 'Użyj wszystkich 4 liczb, aby uzyskać $target';
  }

  @override
  String get mirrorTracingTitle => 'Idealnie odrysowane!';

  @override
  String get mirrorTracingSubtitle =>
      'Odrysuj gwiazdę! Sterowanie jest ODWROTNE.';

  @override
  String get wordSurgeTitle => 'Fala słów';

  @override
  String get wordSurgeSubtitle => 'Synonimy i antonimy';

  @override
  String get perspectiveTakingTitle => 'Przyjmowanie perspektywy';

  @override
  String get perspectiveTakingTopDownView => 'WIDOK Z GÓRY';

  @override
  String get perspectiveTakingChoosePerspective => 'WYBIERZ PERSPEKTYWĘ';

  @override
  String get perspectiveTakingCongrats =>
      'Masz bystre oko do relacji przestrzennych.';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return 'Który widok jest z kierunku $targetDirName?';
  }

  @override
  String get paperFoldingTitle => 'Rozłożona perfekcja!';

  @override
  String get paperFoldingSubtitle => 'Jak to będzie wyglądać po rozłożeniu?';

  @override
  String get waterSortTitle => 'Dobra robota!';

  @override
  String get waterSortSubtitle =>
      'Posortuj kolory tak, aby każda próbówka zawierała tylko jeden kolor.';

  @override
  String get numericalEstimationTitle => 'Szacowanie liczbowe';

  @override
  String get numericalEstimationSubtitle =>
      'Wybierz najbliższą odpowiedź szybko!';

  @override
  String get lockPatternTitle => 'Wzór blokady';

  @override
  String get lockPatternSubtitle =>
      'Znajdź tajny wzór. Każde zgadywanie daje informację zwrotną o pozycji i kropkach.';

  @override
  String get primeHunterTitle => 'Łowca liczb pierwszych';

  @override
  String get primeHunterSubtitle =>
      'Przesuń w LEWO dla PIERWSZEJ | Przesuń w PRAWO dla ZŁOŻONEJ';

  @override
  String get tracePathTitle => 'Śledź ścieżkę';

  @override
  String get tracePathSubtitle =>
      'Podążaj za docelową ścieżką jak najdokładniej';

  @override
  String get ruleSwitcherTitle => 'Przełącznik zasad';

  @override
  String get ruleSwitcherSubtitle => 'Zastosuj aktualną zasadę';

  @override
  String get choiceReactionTimeTitle => 'Czas reakcji';

  @override
  String get pathRecallTitle => 'Zapamiętywanie ścieżki';

  @override
  String get switchTaskTitle => 'Przełączanie zadań';

  @override
  String get switchTaskSubtitle =>
      'Zwracaj uwagę na zasadę! Będzie się przełączać między dopasowywaniem kształtu a dopasowywaniem koloru.';

  @override
  String get mentalRotationTitle => 'Rotacja mentalna';

  @override
  String get mentalRotationSubtitle =>
      'Czy te kształty są takie same, tylko obrócone?';

  @override
  String get missingOperatorTitle => 'Miksuj operatory';

  @override
  String get missingOperatorSubtitle => 'Wypełnij luki, aby ukończyć równanie';

  @override
  String get wordMastermindTitle => 'Mistrz słów';

  @override
  String get wordMastermindSubtitle =>
      'Złam 4-literowy kod! Bulls (B) to idealne miejsca, Cows (C) to złe miejsca.';

  @override
  String get simonSequenceTitle => 'Sekwencja';

  @override
  String get symbolLogicTitle => 'Logika symboli';

  @override
  String get symbolLogicSubtitle =>
      'Rozwiąż wizualne równania, aby znaleźć wartość każdego symbolu. Jaki jest wynik ostatniego równania?';

  @override
  String get silhouetteMatchTitle => 'Dopasowano!';

  @override
  String get silhouetteMatchSubtitle =>
      'Która sylwetka pasuje do tego obiektu?';

  @override
  String get operationSpanTitle => 'Rozpiętość operacyjna';

  @override
  String get operationSpanMathPhase => 'Czy równanie jest poprawne?';

  @override
  String get operationSpanLetterPhase => 'Zapamiętaj literę';

  @override
  String get operationSpanRecallPhase => 'Przypomnij sobie litery w kolejności';

  @override
  String get operationSpanRoundComplete => 'Runda zakończona!';

  @override
  String operationSpanScore(int score) {
    return 'Zdobyłeś $score punktów w Rozpiętości operacyjnej!';
  }

  @override
  String get slidePuzzleTitle => 'Układanka przesuwana';

  @override
  String get slidePuzzleNewGame => 'NOWA GRA';

  @override
  String get slidePuzzleInstructions =>
      'Ułóż kafelki w kolejności numerycznej, przesuwając je w puste miejsce.';

  @override
  String get slidePuzzleTileSlider => 'SUWAK KAFELKÓW';

  @override
  String get slidePuzzleCongrats => 'Pomyślnie ułożyłeś wszystkie kafelki.';

  @override
  String get visualSearchTitle => 'Wyszukiwanie wizualne';

  @override
  String get visualSearchSubtitle => 'Znajdź unikalny symbol w siatce';

  @override
  String get trailMakingTitle => 'Tworzenie szlaku';

  @override
  String get trailMakingSubtitle =>
      'Połącz liczby w kolejności (1 -> 2 -> 3...) tak szybko, jak potrafisz.';

  @override
  String get matrixReasoningTitle => 'Rozumowanie matrycowe';

  @override
  String get matrixReasoningSubtitle => 'Uzupełnij wzór w siatce 3x3';

  @override
  String get tentsAndTreesTitle => 'Namioty i drzewa';

  @override
  String get tentsAndTreesSubtitle =>
      'Umieść namioty obok drzew. Liczby wskazują, ile namiotów znajduje się w każdym wierszu/kolumnie. Namioty nie mogą się dotykać.';

  @override
  String get quickMathTitle => 'Szybka matematyka';

  @override
  String get magicSquaresTitle => 'Magiczny kwadrat';

  @override
  String magicSquaresSubtitle(int targetSum) {
    return 'Każdy wiersz, kolumna i przekątna muszą sumować się do $targetSum';
  }

  @override
  String get objectShuffleTitle => 'Tasowanie obiektów';

  @override
  String get pipesTitle => 'Rury';

  @override
  String get pipesSubtitle => 'Połącz pasujące kolorowe kropki rurami.';

  @override
  String get oddOneOutTitle => 'Znajdź intruza';

  @override
  String get oddOneOutSubtitle => 'Znajdź kafelek o innym kolorze.';

  @override
  String get einsteinRiddleTitle => 'ZAGADKA EINSTEINA';

  @override
  String get einsteinRiddleSubtitle =>
      'Użyj wskazówek, aby wywnioskować atrybuty każdego domu.';

  @override
  String get einsteinRiddleHowToPlay =>
      'Każdy dom ma unikalne atrybuty (kolor, narodowość, zwierzę itp.). Użyj podanych wskazówek, aby wypełnić siatkę i znaleźć pełne rozwiązanie.';

  @override
  String get einsteinRiddleColor => 'Kolor';

  @override
  String get einsteinRiddleNationality => 'Narodowość';

  @override
  String get einsteinRiddleDrink => 'Napój';

  @override
  String get einsteinRiddlePet => 'Zwierzę';

  @override
  String get einsteinRiddleSmoke => 'Palenie';

  @override
  String get einsteinRiddleHouse => 'Dom';

  @override
  String get mirrorImageTitle => 'Odbicie lustrzane';

  @override
  String get mirrorImageSubtitle => 'Zidentyfikuj poprawne odbicie lustrzane.';

  @override
  String get mirrorImageHowToPlay =>
      'Spójrz na kształt i wybierz jego poprawne odbicie lustrzane z podanych opcji.';

  @override
  String get mentalMappingTitle => 'Mapowanie mentalne';

  @override
  String get mentalMappingSubtitle => 'Podążaj za wskazówkami i znajdź cel.';

  @override
  String get mentalMappingHowToPlay =>
      'Zostanie ci pokazana sekwencja kierunków (Północ, Południe, Wschód, Zachód). Podążaj za tymi krokami w myśli, zaczynając od środka siatki, i wybierz cel końcowy.';

  @override
  String get memoryPalaceTitle => 'Pałac pamięci';

  @override
  String get memoryPalaceSubtitle =>
      'Zapamiętaj, które słowo było w którym miejscu.';

  @override
  String get memoryPalaceHowToPlay =>
      'Zestaw słów pojawi się w różnych miejscach na siatce. Zapamiętaj ich pozycje. Następnie zostaniesz poproszony o umieszczenie słów z powrotem w ich oryginalnych lokalizacjach.';

  @override
  String get countingSheepTitle => 'Liczenie owiec';

  @override
  String get countingSheepSubtitle => 'Ile owiec widziałeś?';

  @override
  String get countingSheepHowToPlay =>
      'Owce będą szybko przebiegać przez ekran. Policz je, gdy przechodzą, i wprowadź całkowitą liczbę na końcu.';

  @override
  String get faceTraitAssociationTitle => 'Twarz-Cechy';

  @override
  String get faceTraitAssociationSubtitle =>
      'Zapamiętaj cechy dla każdej twarzy';

  @override
  String get faceTraitAssociationHowToPlay =>
      'Zostanie ci pokazanych kilka twarzy, każda z imieniem, zawodem i hobby. Zapamiętaj te skojarzenia. Później zostaniesz poproszony o przypomnienie sobie konkretnych cech dla każdej twarzy.';

  @override
  String get mentalCalendarTitle => 'Kalendarz mentalny';

  @override
  String get mentalCalendarSubtitle => 'Oblicz dzień tygodnia';

  @override
  String get mentalCalendarHowToPlay =>
      'Zostanie wyświetlona losowa data. Użyj obliczeń w pamięci (lub algorytmu Doomsday), aby określić, w jaki dzień tygodnia ona przypada.';

  @override
  String get vocabularyBuilderTitle => 'Budowniczy słownictwa';

  @override
  String get vocabularyBuilderSubtitle =>
      'Dopasuj synonimy i antonimy pod presją czasu.';

  @override
  String get vocabularyBuilderHowToPlay =>
      'Zostanie ci pokazane słowo docelowe i relacja (synonim lub antonim). Wybierz poprawne słowo z opcji pasujących do relacji. Bądź szybki, czas ucieka!';

  @override
  String get correct => 'POPRAWNE';

  @override
  String get incorrect => 'BŁĘDNE';

  @override
  String get grammarPoliceTitle => 'Policja gramatyczna';

  @override
  String get grammarPoliceSubtitle =>
      'Określ, czy zdanie jest poprawne pod względem gramatycznym, czy zawiera błędy.';

  @override
  String get grammarPoliceHowToPlay =>
      'Na środku ekranu pojawi się zdanie. Zdecyduj, czy jest ono poprawne gramatycznie, czy zawiera błąd. Dotknij \'POPRAWNE\', jeśli wszystko jest w porządku, lub \'BŁĘDNE\', jeśli zauważysz błąd. Nie trać wszystkich żyć!';

  @override
  String get reverseStroopTitle => 'Odwrócony Stroop';

  @override
  String get reverseStroopSubtitle =>
      'Wariacja testu Stroopa, w której skupienie zostaje przełączone.';

  @override
  String get reverseStroopHowToPlay =>
      'Zwracaj uwagę na instrukcję! Jeśli mówi \'TEKST\', dopasuj znaczenie słowa. Jeśli mówi \'KOLOR\', dopasuj kolor atramentu. Zasady będą się często zmieniać, aby przetestować twoje skupienie.';

  @override
  String get game2048Instruction => 'PRZESUŃ W DOWOLNYM KIERUNKU, ABY POŁĄCZYĆ';

  @override
  String get fibonacciMergeTitle => 'Łączenie Fibonacciego';

  @override
  String get fibonacciMergeSubtitle =>
      'Łącz kolejne liczby Fibonacciego (1, 1, 2, 3, 5, 8, 13...).';

  @override
  String get sequenceSleuthTitle => 'Detektyw sekwencji';

  @override
  String get sequenceSleuthSubtitle =>
      'Znajdź brakującą liczbę w sekwencji matematycznej.';

  @override
  String get divisibilityDashTitle => 'Sprint podzielności';

  @override
  String get divisibilityDashSubtitle =>
      'Dotknij wszystkich jednocyfrowych dzielników (2-9) dla podanej liczby.';

  @override
  String get percentagePeakTitle => 'Szczyt procentowy';

  @override
  String get percentagePeakSubtitle =>
      'Rozwiązuj szybko obliczenia procentowe w pamięci.';

  @override
  String get vennNumbersTitle => 'Liczby Venna';

  @override
  String get vennNumbersSubtitle =>
      'Skategoryzuj liczby w odpowiednich obszarach diagramu Venna.';

  @override
  String get commonDenominatorTitle => 'Wspólny mianownik';

  @override
  String get commonDenominatorSubtitle =>
      'Znajdź największy wspólny dzielnik lub najmniejszą wspólną wielokrotność.';

  @override
  String get angleFinderTitle => 'Poszukiwacz kątów';

  @override
  String get angleFinderSubtitle =>
      'Oblicz brakujący kąt w zadaniu geometrycznym.';

  @override
  String get sumSnakeTitle => 'Wąż sumujący';

  @override
  String get sumSnakeSubtitle =>
      'Połącz sąsiednie liczby, aby uzyskać sumę docelową.';

  @override
  String get baseShiftTitle => 'SHIFT BAZY';

  @override
  String get baseShiftSubtitle => 'Rozwiąż w systemie dziesiętnym';

  @override
  String get baseShiftDescription =>
      'Rozwiąż równanie i wpisz odpowiedź w systemie dziesiętnym (Baza 10).';

  @override
  String get baseShiftEquation => 'RÓWNANIE';

  @override
  String get baseShiftHint => 'Wprowadź wynik dziesiętny...';

  @override
  String get baseShiftCorrect => 'Poprawnie!';

  @override
  String get baseShiftIncorrect => 'Niepoprawnie!';

  @override
  String get baseShiftSubmit => 'WYŚLIJ';

  @override
  String get baseShiftQuickGuide => 'Szybki przewodnik:';

  @override
  String get baseShiftBinary => 'Binarny (bin): Baza 2 (0, 1)';

  @override
  String get baseShiftHex => 'Szesnastkowy (0x): Baza 16 (0-9, A-F)';

  @override
  String get baseShiftDecimal => 'Dziesiętny (dec): Baza 10 (0-9)';

  @override
  String get baseShiftWinTitle => 'CZARODZIEJ MATEMATYKI!';

  @override
  String get baseShiftWinMessage =>
      'Poprawnie rozwiązałeś 5 równań ze zmianą bazy!';

  @override
  String get blockCount3DTitle => 'Liczenie bloków 3D';

  @override
  String get blockCount3DSubtitle =>
      'PRZECIĄGNIJ, ABY OBRÓCIĆ • POLICZ UKRYTE BLOKI';

  @override
  String get blockCount3DHowMany => 'ILE BLOKÓW?';

  @override
  String get blockCount3DSubmitGuess => 'WYŚLIJ WYNIK';

  @override
  String get blockCount3DNotQuite =>
      'Niezupełnie! Spróbuj obrócić, aby policzyć ponownie.';

  @override
  String get blockCount3DExcellent => 'DOSKONALE';

  @override
  String blockCount3DWinMessage(int count) {
    return 'Poprawnie zidentyfikowałeś wszystkie $count bloki!';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '1. Przeciągnij palcem po rzutni 3D, aby obrócić stos bloków.\n\n2. Policz wszystkie bloki w stosie.\n\n3. Pamiętaj: blok w powietrzu musi mieć bloki konstrukcyjne pod spodem (ukryte bloki!).\n\n4. Wpisz swoją odpowiedź w polu wejściowym i dotknij \"WYŚLIJ WYNIK\", aby sprawdzić.';

  @override
  String get alphabetSudokuTitle => 'SUDOKU ALFABETYCZNE';

  @override
  String get alphabetSudokuSubtitle =>
      'Wypełnij siatkę tak, aby każdy wiersz, kolumna i kwadrat zawierały litery A-I.';

  @override
  String get alphabetSudokuWinTitle => 'SUDOKU ROZWIĄZANE!';

  @override
  String get alphabetSudokuWinMessage => 'Genialnie! Opanowałeś litery.';

  @override
  String get classicMazeTitle => 'Klasyczny labirynt';

  @override
  String get classicMazeSubtitle =>
      'EKSPLORUJ I ROZWIĄZUJ • NOWY LABIRYNT W KAŻDEJ GRZE';

  @override
  String get classicMazeWinTitle => 'LABIRYNT POKONANY';

  @override
  String classicMazeWinMessage(int count) {
    return 'Niesamowita nawigacja! Rozwiązałeś labirynt w $count ruchach.';
  }

  @override
  String get classicMazeMoves => 'RUCHY: ';

  @override
  String get classicMazeHowToPlayDescription =>
      '1. Poprowadź świecącą żółtą kulkę (gracza) do zielonego portalu (wyjścia) w prawym dolnym rogu.\n\n2. Użyj przesunięć palcem po labiryncie, klawiszy strzałek na klawiaturze fizycznej lub przycisków strzałek na dole, aby się poruszać.\n\n3. Fioletowy ślad pokazuje ścieżkę, którą zbadałeś. Cofnij się po swoim śladzie, aby go dynamicznie wymazać!';

  @override
  String get conjunctionSearchTitle => 'Wyszukiwanie koniunkcyjne';

  @override
  String get conjunctionSearchSubtitle => 'Skupienie uwagi i koniunkcja cech';

  @override
  String get conjunctionSearchWinTitle => 'ZWYCIĘSTWO';

  @override
  String get conjunctionSearchWinMessage =>
      'Znaleźłeś wszystkie cele z doskonałym skupieniem uwagi!';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      'W instrukcjach zostanie pokazana konkretna kombinacja kształtu i koloru celu. Znajdź ją i dotknij w gęstej siatce tak szybko, jak to możliwe. Kształty rozpraszające mają ten sam kolor lub kształt, więc patrz uważnie!';

  @override
  String get conjunctionSearchRound => 'RUNDA: ';

  @override
  String get conjunctionSearchScore => 'WYNIK: ';

  @override
  String get conjunctionSearchFind => 'ZNAJDŹ: ';

  @override
  String get shapeCircle => 'KOŁO';

  @override
  String get shapeSquare => 'KWADRAT';

  @override
  String get shapeTriangle => 'TRÓJKĄT';

  @override
  String get shapeStar => 'GWIAZDA';

  @override
  String get colorRedLabel => 'CZERWONY';

  @override
  String get colorBlueLabel => 'NIEBIESKI';

  @override
  String get colorGreenLabel => 'ZIELONY';

  @override
  String get colorAmberLabel => 'BURSZTYNOWY';

  @override
  String get cubeNetFoldTitle => 'Składanie siatki sześcianu';

  @override
  String get cubeNetFoldSubtitle => 'WYBIERZ PASUJĄCĄ OPCJĘ SZEŚCIANU 3D';

  @override
  String get cubeNetFoldWinTitle => 'POPRAWNIE';

  @override
  String get cubeNetFoldWinMessage =>
      'Masz doskonałą logikę składania przestrzennego 3D!';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '1. Spójrz na rozłożoną siatkę 2D na górze.\n\n2. Złóż w myśli siatkę w sześcian 3D.\n\n3. Wybierz poniższą opcję, która reprezentuje prawidłową perspektywę 3D tego złożonego sześcianu.\n\n4. Bądź ostrożny: przeciwległe ściany w siatce nie mogą sąsiadować w 3D, a kolejność sąsiednich ścian musi się zgadzać!';

  @override
  String get cubeNetFoldUnfoldedNet => 'ROZŁOŻONA SIATKA 2D';

  @override
  String get cubeNetFoldWhichMatches => 'KTÓRY SZEŚCIAN PASUJE?';

  @override
  String get cubeNetFoldIncorrect =>
      'Błędna logika składania! Dotknij Resetuj lub zmień swój wybór.';

  @override
  String get cubeNetFoldSubmitChoice => 'WYŚLIJ WYBÓR';

  @override
  String get cubeNetFoldFailed => 'NIEPOWODZENIE (DOTKNIJ RESETUJ)';

  @override
  String get faceTraitAssociationMemorize => 'ZAPAMIĘTAJ WSZYSTKIE 4 OSOBY';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return 'OSOBA $current Z $total';
  }

  @override
  String get faceTraitAssociationWhatOccupation => 'JAKI JEST ICH ZAWÓD?';

  @override
  String get faceTraitAssociationWhatHobby => 'JAKIE JEST ICH HOBBY?';

  @override
  String get faceTraitAssociationWinTitle => 'MISTRZ PAMIĘCI!';

  @override
  String get faceTraitAssociationLoseTitle => 'KONIEC GRY';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return 'Uzyskałeś $correct poprawnych na $total.';
  }

  @override
  String get topologyTitle => 'TOPOLOGIA';

  @override
  String get topologySubtitle =>
      'Czy te kształty są topologicznie równoważne? (Czy jeden można przekształcić w drugi bez przecinania lub sklejania?)';

  @override
  String get topologyWinTitle => 'GENIUSZ GEOMETRII!';

  @override
  String get topologyWinMessage =>
      'Poprawnie zidentyfikowałeś 10 par topologicznych!';

  @override
  String get topologyScore => 'WYNIK: ';
}
