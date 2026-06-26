// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Gry Puzzle';

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
  String get victory => 'Zwycięstwo!';

  @override
  String get gameWin => 'DOBRA ROBOTA!';

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
  String get visualStatisticalLearningTitle => 'Wizualne uczenie statystyczne';

  @override
  String get orbitTapTitle => 'Orbit Tap';

  @override
  String get orbitTapSubtitle => 'Dotknij, gdy kulki zrównają się z bramką';

  @override
  String get schulteTableTitle => 'Tabela Schultego';

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
  String get memoryMatrixTitle => 'Macierz pamięci';

  @override
  String get memoryMatrixSubtitle => 'Zapamiętaj wzór i dotknij kafelków.';

  @override
  String get mentalAbacusTitle => 'Mentalny abakus';

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
  String get verbalAnalogiesTitle => 'Analogie słowne';

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
  String get tangleFixTitle => 'Rozplątywanie';

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
  String get wisconsinCardSortingTitle => 'Test sortowania kart z Wisconsin';

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
  String get mirrorTracingTitle => 'Rysowanie lustrzane';

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
  String get paperFoldingTitle => 'Składanie papieru';

  @override
  String get paperFoldingSubtitle => 'Jak to będzie wyglądać po rozłożeniu?';

  @override
  String get waterSortTitle => 'Sortowanie wody';

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
  String get silhouetteMatchTitle => 'Dopasowanie sylwetki';

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
  String get shapeRectangle => 'PROSTOKĄT';

  @override
  String get shapeEllipse => 'ELIPSA';

  @override
  String get shapeTrapezoid => 'TRAPEZ';

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

  @override
  String get semanticDistanceTitle => 'Dystans semantyczny';

  @override
  String get semanticDistanceSubtitle =>
      'Mierz pojęciową odległość między słowami';

  @override
  String get oxymoronHuntTitle => 'Łowy na oksymorony';

  @override
  String get oxymoronHuntSubtitle => 'Łącz sprzeczne słowa w siatce';

  @override
  String get portmanteauSplitTitle => 'Rozdzielanie zbitek słownych';

  @override
  String get portmanteauSplitSubtitle =>
      'Zidentyfikuj słowa źródłowe zbitki słownej';

  @override
  String get chainReactionTitle => 'Reakcja łańcuchowa';

  @override
  String get chainReactionSubtitle =>
      'Łącz słowa za pomocą nakładających się liter';

  @override
  String get rhymeMasterTitle => 'Mistrz rymów';

  @override
  String get rhymeMasterSubtitle =>
      'Znajdź słowa rymujące się ze słowem docelowym';

  @override
  String get definitionDashTitle => 'Sprint po definicję';

  @override
  String get definitionDashSubtitle =>
      'Dopasuj właściwe słowo do jego definicji';

  @override
  String get syllableStackTitle => 'Stos sylab';

  @override
  String get syllableStackSubtitle => 'Układaj sylaby, aby tworzyć pełne słowa';

  @override
  String get sentenceUnscrambleTitle => 'Uporządkuj zdanie';

  @override
  String get sentenceUnscrambleSubtitle =>
      'Zmień kolejność słów, aby utworzyć poprawne zdanie';

  @override
  String get grammarSortTitle => 'Sortowanie gramatyczne';

  @override
  String get grammarSortSubtitle => 'Kategoryzuj słowa według części mowy';

  @override
  String get vowelReconstructTitle => 'Rekonstrukcja samogłosek';

  @override
  String get vowelReconstructSubtitle =>
      'Uzupełnij brakujące samogłoski w zdaniu';

  @override
  String get consonantReconstructTitle => 'Rekonstrukcja spółgłosek';

  @override
  String get consonantReconstructSubtitle =>
      'Uzupełnij brakujące spółgłoski w zdaniu';

  @override
  String get homophoneHuntTitle => 'Łowy na homofony';

  @override
  String get silentLetterSearchTitle => 'Szukanie niemych liter';

  @override
  String get silentLetterSearchSubtitle =>
      'Zidentyfikuj nieme litery w podanych słowach';

  @override
  String get palindromeBuilderTitle => 'Twórca palindromów';

  @override
  String get palindromeBuilderSubtitle =>
      'Stwórz palindrom, dodając jak najmniej liter';

  @override
  String get phoneticGuessTitle => 'Zgadnij fonetycznie';

  @override
  String get phoneticGuessSubtitle =>
      'Zidentyfikuj słowo na podstawie jego zapisu fonetycznego';

  @override
  String get spoonerismSolverTitle => 'Rozwiązywanie spuneryzmów';

  @override
  String get spoonerismSolverSubtitle =>
      'Zidentyfikuj poprawny spuneryzm dla danej frazy';

  @override
  String get etymonOddballTitle => 'Etymologiczny intruz';

  @override
  String get etymonOddballSubtitle =>
      'Znajdź słowo, które nie ma tego samego rdzenia';

  @override
  String get etymologyOriginTitle => 'Pochodzenie etymologiczne';

  @override
  String get etymologyOriginSubtitle =>
      'Odgadnij język pochodzenia zapożyczenia';

  @override
  String get affixFactoryTitle => 'Fabryka afiksów';

  @override
  String get affixFactorySubtitle =>
      'Twórz poprawne słowa za pomocą przedrostków i przyrostków';

  @override
  String get cognateCatchTitle => 'Wyłapywanie pokrewnych';

  @override
  String get cognateCatchSubtitle =>
      'Rozróżniaj prawdziwe wyrazy pokrewne od fałszywych przyjaciół';

  @override
  String get compoundConnectTitle => 'Łączenie złożeń';

  @override
  String get compoundConnectSubtitle =>
      'Połącz dwa słowa, aby utworzyć słowo złożone';

  @override
  String get pangramSprintTitle => 'Sprint pangramowy';

  @override
  String get pangramSprintSubtitle =>
      'Zbuduj zdanie zawierające każdą literę alfabetu';

  @override
  String get anagramDefinitionTitle => 'Definicja anagramu';

  @override
  String get anagramDefinitionSubtitle =>
      'Rozwiąż anagram na podstawie jego definicji';

  @override
  String get letterBridgeTitle => 'Most literowy';

  @override
  String get letterBridgeSubtitle =>
      'Znajdź brakującą literę łączącą dwa słowa';

  @override
  String get letterFrequencyScanTitle => 'Skanowanie częstotliwości liter';

  @override
  String get letterFrequencyScanSubtitle =>
      'Policz, ile razy dana litera pojawia się w tekście';

  @override
  String get oneLetterShiftTitle => 'Przesunięcie o jedną literę';

  @override
  String get oneLetterShiftSubtitle =>
      'Przekształć jedno słowo w drugie, zmieniając jedną literę';

  @override
  String vocabularyBuilderMessage(String arg0) {
    return 'Świetna robota! Twoje słownictwo jest imponujące. Wynik: $arg0';
  }

  @override
  String get symmetryMessage =>
      'Idealnie odzwierciedliłeś wzór z chirurgiczną precyzją.';

  @override
  String get temporalOrderMessage =>
      'Niesamowite! Twoja pamięć sekwencji czasowych jest bardzo dokładna.';

  @override
  String get temporalOrderMessage1 =>
      'Nieprawidłowa pamięć sekwencji. Trening czyni mistrza!';

  @override
  String get wordSearchMessage =>
      'Wszystkie słowa znalezione dzięki bystrej obserwacji.';

  @override
  String colorMatchMessage(String arg0) {
    return 'Twoja dokładność: $arg0%';
  }

  @override
  String semanticLinkMessage(String arg0) {
    return 'Zdobyłeś $arg0 punktów!';
  }

  @override
  String reflexTapMessage(String arg0) {
    return 'Dotknąłeś $arg0 celów!';
  }

  @override
  String get angleFinderMessage =>
      'Twoja geometryczna intuicja jest doskonała!';

  @override
  String angleFinderMessage1(String arg0) {
    return 'Poprawna odpowiedź to $arg0°';
  }

  @override
  String angleFinderText(String arg0) {
    return '$arg0°';
  }

  @override
  String visualStatisticalLearningMessage(String arg0) {
    return 'Zdobyłeś $arg0 poprawnych wzorów!';
  }

  @override
  String nonogramText(String arg0) {
    return 'Błąd: $arg0';
  }

  @override
  String mentalCalendarMessage(String arg0) {
    return 'Masz $arg0 poprawnych odpowiedzi na 10!';
  }

  @override
  String orbitTapMessage(String arg0) {
    return 'Udało Ci się kliknąć $arg0 razy!';
  }

  @override
  String schulteTableMessage(String arg0) {
    return 'Ukończyłeś tabelę w czasie $arg0.\nĆwicz dalej, aby poszerzyć widzenie peryferyjne!';
  }

  @override
  String get schulteTableText => 'ROZPOCZNIJ TEST';

  @override
  String get relationalMemoryMessage =>
      'Wspaniała dokładność pamięci relacji przestrzennych!';

  @override
  String sudokuText(String arg0) {
    return 'Błąd: $arg0';
  }

  @override
  String sdmtMessage(String arg0) {
    return 'Dopasowałeś $arg0 symboli! Ten test mierzy szybkość skanowania i uwagę wizualną.';
  }

  @override
  String get futoshikiMessage =>
      'Niesamowite! Rozwiązałeś kwadrat łaciński Futoshiki.';

  @override
  String letterFrequencyScanMessage(String arg0, String arg1) {
    return 'Poprawnie policzyłeś $arg0 wystąpień „$arg1”.';
  }

  @override
  String letterFrequencyScanText(String arg0) {
    return 'Niepoprawnie. Liczba wynosiła $arg0.';
  }

  @override
  String get memoryMatrixMessage =>
      'Imponujące! Twoja pamięć operacyjna jest świetna. Cel dzienny osiągnięty!';

  @override
  String get memoryMatrixMessage1 =>
      'Skup się i spróbuj ponownie, aby poprawić wynik pamięci.';

  @override
  String get contextCluesMessage =>
      'Wyjątkowo! Twoje słownictwo i analiza kontekstowa są na najwyższym poziomie.';

  @override
  String get contextCluesMessage1 =>
      'Wybrano błędne słowo! Trenuj rozumowanie w kontekście werbalnym i spróbuj ponownie.';

  @override
  String oneLetterShiftMessage(String arg0, String arg1) {
    return 'Poprawnie zmieniłeś $arg0 na $arg1.';
  }

  @override
  String get mentalAbacusMessage =>
      'Twoja arytmetyka mentalna jest na najwyższym poziomie.';

  @override
  String fractionMatcherMessage(String arg0) {
    return 'Zdobyłeś $arg0 punktów za dopasowanie reprezentacji!';
  }

  @override
  String get spellingSprintMessage =>
      'Wszystkie 10 słów przeliterowanych poprawnie!';

  @override
  String spellingSprintMessage1(String arg0) {
    return 'Przeliterowałeś $arg0 słów.';
  }

  @override
  String stopSignalMessage(String arg0) {
    return 'Osiągnąłeś $arg0 poprawnych odpowiedzi! Ten test mierzy Twoją zdolność do hamowania zaplanowanego działania.';
  }

  @override
  String grammarPoliceMessage(String arg0) {
    return 'Koniec gry! Utrzymałeś porządek w świecie gramatyki. Wynik: $arg0';
  }

  @override
  String consonantReconstructMessage(String arg0) {
    return 'Zrekonstruowałeś wynik $arg0!';
  }

  @override
  String rhymeMasterMessage(String arg0, String arg1) {
    return 'Znaleziono $arg0 z $arg1 rymów!';
  }

  @override
  String vigilanceTaskMessage(String arg0, String arg1, String arg2) {
    return 'Trafienia: $arg0, Pominięcia: $arg1\nFałszywe alarmy: $arg2';
  }

  @override
  String get silhouetteMatchOrthoMessage =>
      'Posiadasz nienaganne umiejętności wyrównywania ortograficznego!';

  @override
  String get silhouetteMatchOrthoText => 'MAM TO';

  @override
  String get silhouetteMatchOrthoText1 =>
      'Nieprawidłowe rzutowanie perspektywiczne! Dotknij Reset, aby spróbować ponownie.';

  @override
  String fibonacciMergeMessage(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String factorFinderMessage(String arg0) {
    return 'Zdobyłeś $arg0 punktów za znalezienie wszystkich dzielników!';
  }

  @override
  String logicalSyllogismsMessage(String arg0) {
    return 'Rozwiązałeś poprawnie $arg0 sylogizmów!';
  }

  @override
  String get rotatingMazeMessage =>
      'Udało Ci się przejść przez kinetyczny obracający się labirynt!';

  @override
  String get rotatingMazeText => 'MAM TO';

  @override
  String get rotatingMazeText1 =>
      '🌀 Labirynt obrócony o 90°! Siatka się przesunęła!';

  @override
  String get mathPathMessage => 'Odnalazłeś ścieżkę, która sumuje się do celu!';

  @override
  String get bridgesMessage => 'Udało Ci się połączyć wszystkie wyspy!';

  @override
  String compoundConnectMessage(String arg0, String arg1) {
    return 'Słowo złożone to $arg0$arg1.';
  }

  @override
  String get pangramSprintMessage =>
      'Zbudowałeś zdanie używając wszystkich 26 liter.';

  @override
  String get mirrorImageMessage => 'Idealnie zidentyfikowałeś odbicie.';

  @override
  String get mirrorImageText => 'OBRAZ LUSTRZANY';

  @override
  String reverseStroopMessage(String arg0) {
    return 'Zdobyłeś $arg0 punktów! Skup się na instrukcjach.';
  }

  @override
  String get verbalAnalogiesMessage =>
      'Masz bystry umysł do dostrzegania relacji.';

  @override
  String corsiBlocksMessage1(String arg0, String arg1) {
    return 'Zapamiętałeś $arg1 sekwencji! Twoja rozpiętość pamięci przestrzennej wyniosła $arg0.';
  }

  @override
  String wordLadderMessage(String arg0, String arg1, String arg2) {
    return 'Udało Ci się połączyć $arg0 z $arg1 w $arg2 krokach.';
  }

  @override
  String d2AttentionMessage(String arg0) {
    return 'Niesamowite skanowanie selektywne! Wynik końcowy: $arg0.';
  }

  @override
  String get d2AttentionText => 'JAK GRAĆ';

  @override
  String get d2AttentionText1 => 'ROZUMIEM';

  @override
  String get tangleFixMessage => 'Wszystkie linie są wyraźne i gładkie.';

  @override
  String get distractorMatrixMessage =>
      'Niesamowite! Zapamiętałeś wzory pomimo dystraktorów matematycznych!';

  @override
  String get distractorMatrixMessage1 =>
      'Dystraktory Cię dopadły! Wyćwicz swoją pamięć operacyjną.';

  @override
  String sentenceUnscrambleMessage(String arg0) {
    return 'Ułożyłeś zdanie z wynikiem $arg0!';
  }

  @override
  String get kakuroMessage =>
      'Niesamowite! Idealnie dopasowałeś wszystkie segmenty sum.';

  @override
  String symbolicFlankerMessage(String arg0, String arg1) {
    return 'Uzyskałeś $arg0 poprawnych odpowiedzi na $arg1!';
  }

  @override
  String stroopTestMessage(String arg0) {
    return 'Zdobyłeś $arg0 poprawnych odpowiedzi! Skup się na kolorze czcionki, a nie na słowie.';
  }

  @override
  String wisconsinCardSortingMessage(String arg0) {
    return 'Poprawnie posortowałeś $arg0 kart!';
  }

  @override
  String nBackMessage(String arg0) {
    return 'Osiągnąłeś $arg0 dopasowań w zadaniu 2-back! Pamięć operacyjna jest kluczowa dla wielozadaniowości.';
  }

  @override
  String rhythmMasterMessage(String arg0, String arg1) {
    return 'Uzyskałeś $arg0 idealnych trafień i $arg1 punktów!';
  }

  @override
  String groceryListMessage(String arg0, Object score) {
    return 'Zdobyłeś $arg0 punktów w Liście Zakupów!';
  }

  @override
  String get groceryListText => 'Ja';

  @override
  String get mirrorTracingMessage =>
      'Twój mózg pomyślnie zreorganizował swoją koordynację.';

  @override
  String moduloClockMessage(String arg0) {
    return 'Doskonała koordynacja umysłowa w matematyce modularnej! Wynik: $arg0';
  }

  @override
  String moduloClockMessage1(String arg0, String arg1, String arg2) {
    return 'Rozwiązałeś $arg0 z $arg1 zadań z zegarem modularnym. Wynik: $arg2';
  }

  @override
  String get crownMessage =>
      'Wszystkie korony umieszczone pomyślnie dzięki doskonałej logice.';

  @override
  String dualCodingMessage(String arg0) {
    return 'Fantastyczne wykonanie podwójnego zadania! Twój wynik pamięci operacyjnej: $arg0';
  }

  @override
  String inequalityDashMessage(String arg0) {
    return 'Zdobyłeś $arg0 punktów w dopasowywaniu nierówności!';
  }

  @override
  String sourceMonitoringMessage(String arg0, String arg1) {
    return 'Zdobyłeś $arg0 z $arg1!';
  }

  @override
  String get sourceMonitoringText => 'ZACZNIJ PRZYPOMINANIE';

  @override
  String get memoryPalaceText => 'DOSTĘPNE SŁOWA';

  @override
  String target10Message(String arg0) {
    return 'Zdobyłeś $arg0 punktów w dopasowywaniu liczb do 10!';
  }

  @override
  String get paperFoldingMessage =>
      'Potrafisz dostrzec wzory w swojej wyobraźni.';

  @override
  String topologyText(String arg0, String arg1) {
    return '$arg0$arg1 / 10';
  }

  @override
  String get waterSortMessage => 'Idealnie posortowałeś wszystkie kolory!';

  @override
  String anagramDefinitionMessage(String arg0) {
    return 'To słowo to rzeczywiście \"$arg0\".';
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
    return 'Dokonałeś $arg0 poprawnych szacunków.';
  }

  @override
  String grammarSortMessage(String arg0) {
    return 'Poprawnie posortowałeś $arg0 słów!';
  }

  @override
  String vowelReconstructMessage(String arg0) {
    return 'Zrekonstruowałeś wynik $arg0!';
  }

  @override
  String spatialConflictMessage(String arg0, String arg1) {
    return 'Osiągnąłeś wynik $arg0 z $arg1 błędami!';
  }

  @override
  String get spatialConflictText => 'JAK GRAĆ';

  @override
  String get spatialConflictText1 => 'ROZUMIEM';

  @override
  String tracePathMessage(String arg0) {
    return 'Twoja dokładność wyniosła $arg0%!';
  }

  @override
  String ruleSwitcherMessage(String arg0, String arg1) {
    return 'Uzyskałeś $arg0 poprawnych odpowiedzi na $arg1!';
  }

  @override
  String collatzMessage(String arg0, String arg1) {
    return 'Wykonałeś $arg0 kroków. Minimalna możliwa liczba to $arg1.';
  }

  @override
  String get collatzText => '/ 2';

  @override
  String get collatzText1 => '+ 1';

  @override
  String get collatzText2 => '3n + 1';

  @override
  String divisibilityDashMessage(String arg0) {
    return 'Rozwiązałeś $arg0 liczb!';
  }

  @override
  String switchTaskMessage(String arg0) {
    return 'Zdobyłeś $arg0 poprawnych odpowiedzi! Szybkie przełączanie jest kluczem do elastyczności umysłowej.';
  }

  @override
  String sequenceSleuthMessage(String arg0) {
    return 'Rozwiązałeś $arg0 sekwencji!';
  }

  @override
  String changeBlindnessMessage(String arg0) {
    return 'Znalazłeś $arg0 zmian!';
  }

  @override
  String mentalRotationMessage(String arg0) {
    return 'Poprawnie obróciłeś $arg0 kształtów!';
  }

  @override
  String wordMastermindMessage(String arg0) {
    return 'Opanowałeś kod!\nSłowo to: $arg0';
  }

  @override
  String wordMastermindMessage1(String arg0) {
    return 'Ukryte słowo to: $arg0';
  }

  @override
  String wordMastermindText(String arg0) {
    return '$arg0';
  }

  @override
  String get simonSequenceMessage => 'Zapamiętałeś wszystkie 10 płytek!';

  @override
  String get simonSequenceMessage1 =>
      'Spróbuj ponownie, aby opanować sekwencję.';

  @override
  String oxymoronHuntMessage(String arg0) {
    return 'Znalazłeś $arg0 oksymoronów!';
  }

  @override
  String spotlightTrackMessage(String arg0) {
    return 'Niesamowite śledzenie przestrzenne! Zdobyłeś $arg0 punktów.';
  }

  @override
  String get spotlightTrackText => 'JAK GRAĆ';

  @override
  String get spotlightTrackText1 => 'ROZUMIEM';

  @override
  String get spotlightTrackText2 => 'ROZPOCZNIJ RUNDĘ';

  @override
  String vennNumbersMessage(String arg0) {
    return 'Skategoryzowałeś $arg0 liczb!';
  }

  @override
  String get vennNumbersText => 'ŻADNE';

  @override
  String get vennNumbersText1 => 'OBA';

  @override
  String get silhouetteMatchMessage =>
      'Twój mózg doskonale radzi sobie z przekształcaniem 3D na 2D.';

  @override
  String sumSnakeMessage(String arg0) {
    return 'Cel $arg0 osiągnięty z doskonałą precyzją!';
  }

  @override
  String get sumSnakeText => 'WYCZYŚĆ ŚCIEŻKĘ';

  @override
  String percentagePeakMessage(String arg0) {
    return 'Rozwiązałeś $arg0 zadań z procentami!';
  }

  @override
  String trailMakingMessage(String arg0) {
    return 'Ukończyłeś $arg0 ścieżek! Ten test mierzy szybkość wyszukiwania wizualnego i elastyczność umysłową.';
  }

  @override
  String matrixReasoningMessage(String arg0) {
    return 'Poprawnie ukończyłeś $arg0 macierzy!';
  }

  @override
  String get tentsAndTreesMessage =>
      'Udało Ci się rozstawić wszystkie namioty.';

  @override
  String klotskiMessage(String arg0) {
    return 'Rewelacyjne przesuwanie! Uwolniłeś blok Bohatera w $arg0 ruchach.';
  }

  @override
  String sumPyramidMessage(String arg0) {
    return 'Pomyślnie rozwiązałeś $arg0 piramid sum!';
  }

  @override
  String simonCommandMessage(String arg0) {
    return 'Doskonała reakcja selektywna i skupienie! Całkowity wynik: $arg0';
  }

  @override
  String simonCommandMessage1(String arg0, String arg1) {
    return 'Zdobyłeś $arg0, ale nie osiągnąłeś $arg1 dopasowań w czasie.';
  }

  @override
  String syllableStackMessage(String arg0) {
    return 'Ułożyłeś wynik $arg0!';
  }

  @override
  String get slitherlinkMessage =>
      'Świetnie! Udało Ci się ukończyć zagadkę pętli.';

  @override
  String quickMathMessage(String arg0) {
    return 'Rozwiązałeś $arg0 zadań!';
  }

  @override
  String commonDenominatorMessage(String arg0) {
    return 'Rozwiązałeś $arg0 zadań z NWD/NWW!';
  }

  @override
  String chainReactionMessage(String arg0, String arg1) {
    return 'Twój końcowy wynik to $arg0. Zbudowałeś łańcuch $arg1 słów.';
  }

  @override
  String chainReactionText(String arg0) {
    return '$arg0';
  }

  @override
  String get associativePairsMessage =>
      'Genialnie! Bezbłędnie powiązałeś cechy wizualne.';

  @override
  String get associativePairsMessage1 =>
      'Błędne powiązanie! Wyostrz swoją pamięć skojarzeniową i spróbuj ponownie.';

  @override
  String portmanteauSplitMessage(String arg0) {
    return 'Rozdzieliłeś $arg0 zbitek wyrazowych!';
  }

  @override
  String get magicSquaresText => 'WYCZYŚĆ';

  @override
  String alphabetSudokuText(String arg0) {
    return 'Błąd: $arg0';
  }

  @override
  String get pipesMessage => 'Połączyłeś wszystkie rury i wypełniłeś siatkę.';

  @override
  String get dualMirrorMessage => 'Doprowadziłeś obie ikony do ich celów!';

  @override
  String binaryCodeMessage(String arg0) {
    return 'Rewelacyjne szybkie tłumaczenie na system dziesiętny! Wynik końcowy: $arg0';
  }

  @override
  String binaryCodeMessage1(String arg0, String arg1) {
    return 'Poprawnie skonwertowałeś $arg0 liczb binarnych. Wynik: $arg1';
  }

  @override
  String oddOneOutMessage(String arg0) {
    return 'Znalazłeś 50 niepasujących elementów! Wynik końcowy: $arg0';
  }

  @override
  String oddOneOutMessage1(String arg0) {
    return 'Twój wynik: $arg0';
  }

  @override
  String letterBridgeMessage(String arg0) {
    return 'Znalazłeś literę mostu: $arg0';
  }

  @override
  String get imReady => 'JESTEM GOTÓW';

  @override
  String get soptTitle => 'Wskazywanie na zamówienie';

  @override
  String get soptSubtitle =>
      'Za każdym razem dotknij innej karty. Pozycje się mieszają!';

  @override
  String get soptWinTitle => 'Mistrz sekwencji!';

  @override
  String soptGameOverMessage(int score) {
    return 'Zdobyłeś $score punktów, pomyślnie śledząc potasowane karty!';
  }

  @override
  String get soptChooseNovel => 'Kliknij nową kartę';

  @override
  String get soptGreatJob => 'Świetna robota!';

  @override
  String get soptAlreadyTapped => 'Już dotknięty!';

  @override
  String get soptGrid => 'Siatka';

  @override
  String get contRecogTitle => 'Ciągłe uznanie';

  @override
  String get contRecogSubtitle =>
      'Czy widziałeś już tę kartę podczas tej sesji?';

  @override
  String get contRecogWinTitle => 'Geniusz uznania!';

  @override
  String contRecogGameOverMessage(int score) {
    return 'Zdobyłeś $score poprawnych rozpoznań!';
  }

  @override
  String get contRecogCorrect => 'Prawidłowy!';

  @override
  String get contRecogWrong => 'Zło!';

  @override
  String get contRecogOldOrNew => 'Czy to jest stare czy nowe?';

  @override
  String get contRecogNew => 'Nowy';

  @override
  String get contRecogOld => 'Stary';

  @override
  String get contRecogSeenPool => 'Widziałem Basen';

  @override
  String get dnmsTitle => 'Niepasująca pamięć';

  @override
  String get dnmsSubtitle =>
      'Stuknij kartę, której nie było w zapamiętanej próbce.';

  @override
  String get dnmsWinTitle => 'Niepasujący ekspert!';

  @override
  String dnmsGameOverMessage(int score) {
    return 'Zdobyłeś $score poprawnych odpowiedzi w opóźnionym braku dopasowania!';
  }

  @override
  String get dnmsChooseNovel => 'Kliknij nową kartę';

  @override
  String get dnmsMemorizeSample => 'Zapamiętaj tę kartę';

  @override
  String get dnmsWaitForIt => 'Poczekaj na to...';

  @override
  String get dnmsExcellent => 'Doskonały!';

  @override
  String get dnmsSampleTapped => 'To była próbka!';

  @override
  String get dnmsCards => 'Karty';

  @override
  String get symSpanTitle => 'Rozpiętość symetrii';

  @override
  String get symSpanSubtitle =>
      'Przypomnij sobie wzory komórek, identyfikując symetrię pionową.';

  @override
  String get symSpanWinTitle => 'Mistrz symetrii!';

  @override
  String symSpanGameOverMessage(int score) {
    return 'Zdobyłeś $score punktów, przypominając sobie układy i identyfikując symetrię!';
  }

  @override
  String get symSpanMemorizeRed => 'Zapamiętaj lokalizację czerwonych krwinek';

  @override
  String get symSpanIsSymmetric => 'Czy wzór jest symetryczny?';

  @override
  String get symSpanRecallSequence =>
      'Przypomnij sobie sekwencję w odpowiedniej kolejności';

  @override
  String get symSpanGreatJob => 'Świetna robota!';

  @override
  String get symSpanTryAgain => 'Spróbuj ponownie!';

  @override
  String get symSpanLength => 'Długość';

  @override
  String get readingSpanTitle => 'Rozpiętość czytania';

  @override
  String get readingSpanSubtitle => 'Sprawdź zdania, zapamiętując ciąg liter.';

  @override
  String get readingSpanWinTitle => 'Ekspert od czytania!';

  @override
  String readingSpanGameOverMessage(int score) {
    return 'Zdobyłeś $score punktów w wyzwaniu dotyczącym pamięci w zakresie czytania!';
  }

  @override
  String get readingSpanTrueFalse =>
      'Czy to stwierdzenie jest prawdziwe czy fałszywe?';

  @override
  String get readingSpanMemorizeLetter => 'Zapamiętaj ten list';

  @override
  String get readingSpanRecallLetters => 'Przypomnij sobie litery po kolei';

  @override
  String get readingSpanGreatJob => 'Świetna robota!';

  @override
  String get readingSpanTryAgain => 'Spróbuj ponownie!';

  @override
  String readingSpanYourSequence(String sequence) {
    return 'Twoja sekwencja: __SEKWENCJA__';
  }

  @override
  String get readingSpanLength => 'Długość';

  @override
  String get readingSpanSentence1 => 'Słońce wschodzi na wschodzie.';

  @override
  String get readingSpanSentence2 => 'Lód jest wrzący.';

  @override
  String get readingSpanSentence3 => 'Ryby mogą oddychać pod wodą.';

  @override
  String get readingSpanSentence4 => 'Psy mają skrzydła i potrafią latać.';

  @override
  String get readingSpanSentence5 =>
      'Woda zamarza w temperaturze 0 stopni Celsjusza.';

  @override
  String get readingSpanSentence6 => 'Koty szczekają jak małe psy.';

  @override
  String get readingSpanSentence7 => 'Latem drzewa mają zielone liście.';

  @override
  String get readingSpanSentence8 => 'Deszcz spada z ziemi w górę.';

  @override
  String get readingSpanSentence9 => 'Trójkąt ma cztery równe boki.';

  @override
  String get readingSpanSentence10 => 'Jabłka to rodzaj słodkich owoców.';

  @override
  String get readingSpanSentence11 => 'Księżyc jest zrobiony z sera cheddar.';

  @override
  String get readingSpanSentence12 => 'Samochody mają koła, którymi się toczą.';

  @override
  String get readingSpanSentence13 => 'Ogień jest przeraźliwie zimny.';

  @override
  String get readingSpanSentence14 =>
      'Papier wytwarzany jest z przetworzonego drewna.';

  @override
  String get readingSpanSentence15 =>
      'Ptaki mają pióra, które pomagają im latać.';

  @override
  String get readingSpanSentence16 => 'Banany rosną na sosnach.';

  @override
  String get readingSpanSentence17 => 'Słoń jest mniejszy od mrówki.';

  @override
  String get readingSpanSentence18 =>
      'Książki zawierają drukowane strony tekstu.';

  @override
  String get countingSpanTitle => 'Liczenie rozpiętości';

  @override
  String get countingSpanSubtitle =>
      'Licz tylko niebieskie kółka. Następnie przypomnij sobie kolejność liczenia.';

  @override
  String get countingSpanWinTitle => 'Licząc geniuszu!';

  @override
  String countingSpanGameOverMessage(int score) {
    return 'Zdobyłeś $score punktów w wyzwaniu pamięciowym Counting Span!';
  }

  @override
  String get countingSpanCountCircles => 'Licz tylko niebieskie kółka';

  @override
  String get countingSpanRecallCounts =>
      'Liczby przywołań we właściwej kolejności';

  @override
  String get countingSpanGreatJob => 'Świetna robota!';

  @override
  String get countingSpanTryAgain => 'Spróbuj ponownie!';

  @override
  String countingSpanYourSequence(String sequence) {
    return 'Twoja sekwencja: __SEKWENCJA__';
  }

  @override
  String get countingSpanLength => 'Długość';

  @override
  String get objDispTitle => 'Przemieszczenie obiektu';

  @override
  String get objDispSubtitle =>
      'Zapamiętaj układ. Znajdź i dotknij obiektu, który zmienia położenie.';

  @override
  String get objDispWinTitle => 'Geniusz przestrzenny!';

  @override
  String objDispGameOverMessage(int score) {
    return 'Prawidłowo zidentyfikowałeś $score przemieszczonych obiektów!';
  }

  @override
  String get objDispMemorizeAll => 'Zapamiętaj wszystkie miejsca docelowe';

  @override
  String get objDispWaitingShift => 'Czekam na zmianę układu...';

  @override
  String get objDispTapMoved => 'Kliknij obiekt, który się poruszył';

  @override
  String get objDispExcellent => 'Doskonały!';

  @override
  String get objDispWrongObject => 'Zły obiekt!';

  @override
  String get objDispItems => 'Rzeczy';

  @override
  String get mandalaTitle => 'Przypomnienie mandali';

  @override
  String get mandalaSubtitle =>
      'Zapamiętaj konfigurację kolorów. Wybierz kolory i odmaluj płytki.';

  @override
  String get mandalaWinTitle => 'Artysta mandali!';

  @override
  String mandalaGameOverMessage(int score) {
    return 'Zdobyłeś $score punktów, odtwarzając kolorowe układy geometryczne!';
  }

  @override
  String get mandalaMemorizeColors => 'Zapamiętaj kolory płytek';

  @override
  String get mandalaPaintCells =>
      'Pomaluj komórki tak, aby pasowały do ​​oryginału';

  @override
  String get mandalaExcellent => 'Doskonały!';

  @override
  String get mandalaIncorrectMatch => 'Nieprawidłowe dopasowanie!';

  @override
  String get mandalaSubmitRepaint => 'Prześlij ponowne malowanie';

  @override
  String get mandalaTiles => 'Płytki';

  @override
  String get runningSpanTitle => 'Rozpiętość działania';

  @override
  String get runningSpanSubtitle =>
      'Obserwuj litery. Kiedy się zatrzymają, wpisz w kolejności N ostatnich liter.';

  @override
  String get runningSpanWinTitle => 'Mistrz buforowania!';

  @override
  String runningSpanGameOverMessage(int score) {
    return 'Zdobyłeś $score punktów w Running Memory Span!';
  }

  @override
  String runningSpanPrepareRecall(int count) {
    return 'Przygotuj się na przypomnienie ostatnich $count liter';
  }

  @override
  String get runningSpanWatchCarefully => 'Oglądaj uważnie...';

  @override
  String runningSpanEnterLast(int count) {
    return 'Wpisz ostatnie $count litery';
  }

  @override
  String get runningSpanGreatJob => 'Świetna robota!';

  @override
  String get runningSpanIncorrectBuffer => 'Nieprawidłowy bufor!';

  @override
  String runningSpanRecallLast(int count) {
    return 'Przypomnij sobie ostatnie $count';
  }

  @override
  String get runningSpanStopsRandomly => 'Strumień zatrzymuje się losowo!';

  @override
  String runningSpanEntered(String sequence) {
    return 'Wprowadzono: __SEKWENCJA__';
  }

  @override
  String get runningSpanNItems => 'N-przedmioty';

  @override
  String get spatialCabinetTitle => 'Szafy przestrzenne';

  @override
  String get spatialCabinetSubtitle =>
      'Zapamiętaj, która szuflada szafki zawiera dany przedmiot.';

  @override
  String get spatialCabinetWinTitle => 'Ekspert Gabinetowy!';

  @override
  String spatialCabinetGameOverMessage(int score) {
    return 'Zdobyłeś $score punktów w pamięci przestrzennej!';
  }

  @override
  String get spatialCabinetMemorize => 'Zapamiętaj lokalizację przedmiotów';

  @override
  String spatialCabinetWhereIs(String itemName) {
    return 'Gdzie jest $itemName ?';
  }

  @override
  String get spatialCabinetCorrect => 'Prawidłowy!';

  @override
  String get spatialCabinetWrongDrawer => 'Zła szuflada!';

  @override
  String get spatialCabinetItems => 'Rzeczy';

  @override
  String get cabinetItemKey => 'Klawisz';

  @override
  String get cabinetItemApple => 'Jabłko';

  @override
  String get cabinetItemDiamond => 'Diament';

  @override
  String get cabinetItemBook => 'Książka';

  @override
  String get cabinetItemUmbrella => 'Parasol';

  @override
  String get cabinetItemCoffee => 'Kawa';

  @override
  String get cabinetItemLock => 'Zamek';

  @override
  String get cabinetItemPet => 'Zwierzak domowy';

  @override
  String get cabinetItemCar => 'Samochód';

  @override
  String get gamesTitleLabel => 'GRY';

  @override
  String get yourFavorites => 'TWOJE ULUBIONE';

  @override
  String get readyForWorkout => 'GOTOWY NA CODZIENNY TRENING?';

  @override
  String get greatStartKeepGoing => 'ŚWIETNY POCZĄTEK! TAK TRZYMAJ.';

  @override
  String get onFireToday => 'DZISIAJ DZIAŁASZ BŁYSKAWICZNIE!';

  @override
  String get incredibleSolvingToday => 'NIESAMOWITE ROZWIĄZYWANIE DZISIAJ!';

  @override
  String get newGameLabel => 'NOWA';

  @override
  String get slitherlinkTitle => 'Slitherlink';

  @override
  String get slitherlinkSubtitle =>
      'OTOCZ SIATKĘ PINÓW, UŻYWAJĄC WSKAZÓWEK LICZBOWYCH.';

  @override
  String get futoshikiTitle => 'Futoshiki';

  @override
  String get futoshikiSubtitle =>
      'WYPEŁNIJ SIATKI, UŻYWAJĄC WSKAZÓWEK WIĘKSZOŚCI.';

  @override
  String get kakuroTitle => 'Kakuro';

  @override
  String get kakuroSubtitle => 'ROZWIĄZUJ KRZYŻÓWKI Z LICZBAMI I SUMAMI.';

  @override
  String get inequalityDashTitle => 'Wyścig Nierówności';

  @override
  String get inequalityDashSubtitle =>
      'ROZWIĄZUJ NIERÓWNOŚCI POD PRESJĄ CZASU.';

  @override
  String get factorFinderTitle => 'Znajdź Czynniki';

  @override
  String get factorFinderSubtitle =>
      'ZIDENTYFIKUJ WSZYSTKIE CZYNNIKI LICZB DOCELOWYCH.';

  @override
  String get collatzTitle => 'Ścieżka Collatza';

  @override
  String get collatzSubtitle => 'NAWIGUJ PRZEZ SEKWENCJĘ 3N+1.';

  @override
  String get sumPyramidTitle => 'Piramide Sum';

  @override
  String get sumPyramidSubtitle =>
      'WYPEŁNIJ KOMÓRKI PIRAMIDY WSKAZÓWKAMI MATEMATYCZNYMI DOTYCZĄCYMI SUM.';

  @override
  String get target10Title => 'Cel 10';

  @override
  String get target10Subtitle =>
      'ŁĄCZ PŁYTKI Z LICZBAMI, ABY OTRZYMAĆ DZIESIĘĆ SUM.';

  @override
  String get fractionMatcherTitle => 'Dopasuj Ułamki';

  @override
  String get fractionMatcherSubtitle => 'DOPASUJ WIZUALNIE RÓWNOWAŻNE UŁAMKI.';

  @override
  String get dualCodingTitle => 'Podwójne Kodowanie';

  @override
  String get dualCodingSubtitle => 'DOPASOWUJ LITERY I SYMBOLE JEDNOCZEŚNIE.';

  @override
  String get distractorMatrixTitle => 'Macierz Rozpraszaczy';

  @override
  String get distractorMatrixSubtitle =>
      'ZNAJDŹ KSZTAŁTY DOCELOWE WŚRÓD ROZPRASZACZY.';

  @override
  String get temporalOrderTitle => 'Porządek Czasowy';

  @override
  String get temporalOrderSubtitle =>
      'PRZYPOMNIJ SOBIE SEKWENCJĘ CHRONOLOGICZNĄ.';

  @override
  String get associativePairsTitle => 'Pary Skojarzone';

  @override
  String get associativePairsSubtitle =>
      'ŁĄCZ I DOPASOWUJ ODPOWIADAJĄCE SOBIE SYMBOLE.';

  @override
  String get blockCount3dTitle => 'Liczenie Bloków 3D';

  @override
  String get blockCount3dSubtitle => 'LICZ BLOKI W PRZESTRZENI TRÓJWYMIAROWEJ.';

  @override
  String get rotatingMazeTitle => 'Obracany Labirynt';

  @override
  String get rotatingMazeSubtitle =>
      'OBRACAJ LABIRYNTY, ABY DOPROWADZIĆ KULKI DO WYJŚCIA.';

  @override
  String get silhouetteMatchOrthoTitle => 'Dopasowanie Sylwetki (Orto)';

  @override
  String get silhouetteMatchOrthoSubtitle =>
      'DOPASUJ OBIEKTY 3D DO CIENI ORTOGONALNYCH.';

  @override
  String get spatialConflictTitle => 'Konflikt Przestrzenny';

  @override
  String get spatialConflictSubtitle =>
      'ROZWIĄZUJ ROZBIEŻNOŚCI MIĘDZY TEKSTEM A KIERUNKIEM.';

  @override
  String get spotlightTrackTitle => 'Śledzenie Reflektora';

  @override
  String get spotlightTrackSubtitle =>
      'ŚLEDŹ MIGAJĄCE ELEMENTY W RUCHOMYCH CIENIACH.';

  @override
  String get d2AttentionTitle => 'Uwaga d2';

  @override
  String get d2AttentionSubtitle =>
      'STUKAJ W SYMBOLE DOCELOWE ZGODNIE ZE ŚCISŁYMI KRYTERIAMI.';

  @override
  String get dualMirrorTitle => 'Nawigacja w Podwójnym Lustrze';

  @override
  String get dualMirrorSubtitle =>
      'PORUSZAJ SIĘ W DWÓCH LABIRYNCIE JEDNOCZEŚNIE.';

  @override
  String get contextCluesTitle => 'Wskazówki Kontekstowe';

  @override
  String get contextCluesSubtitle =>
      'WYWNIOSKUJ UKRYTE SŁOWA NA PODSTAWIE WSKAZÓWEK KONTEKSTOWYCH.';

  @override
  String get digitSpanReverseSubtitle =>
      'PRZYPOMNIJ SOBIE CYFRY LICZB W ODWROTNEJ KOLEJNOŚCI.';

  @override
  String get faceNameAssociationSubtitle =>
      'PRZYPOMNIJ SOBIE IMIONA DLA RÓŻNYCH PREZENTOWANYCH TWARZY.';

  @override
  String get staircaseMemorySubtitle =>
      'ZAPAMIĘTUJ BLOKI W SEKWENCJI SCHODKOWEJ.';

  @override
  String get choiceReactionTimeSubtitle =>
      'SZYBKO STUKAJ W KONKRETNE PRZYCISKI PASUJĄCE DO WSKAZÓWEK.';

  @override
  String get attentionalBlinkSubtitle =>
      'WYŁAPUJ SZYBKIE CELE MIGAJĄCE W STRUMIENIACH.';

  @override
  String get visualStatisticalLearningSubtitle =>
      'UCZ SIĘ WIZUALNIE CZASOWYCH WZORCÓW KSZTAŁTÓW.';

  @override
  String get sternbergTaskSubtitle =>
      'PRZYPOMNIJ SOBIE, CZY SYMBOL ZNAJDOWAŁ SIĘ W ZESTAWIE PAMIĘCIOWYM.';

  @override
  String get operationSpanSubtitle =>
      'ROZWIĄZUJ ZADANIA MATEMATYCZNE I PRZYPOMINAJ SOBIE CIĄGI ALFABETU.';

  @override
  String get continuousRecognitionTitle => 'Ciągłe Rozpoznawanie';

  @override
  String get continuousRecognitionSubtitle =>
      'ZIDENTYFIKUJ, CZY PREZENTOWANA KARTA JEST STARA, CZY NOWA.';

  @override
  String get symmetrySpanTitle => 'Zakres Symetrii';

  @override
  String get symmetrySpanSubtitle =>
      'PRZYPOMNIJ SOBIE WSPÓŁRZĘDNE KOMÓREK W TRAKCIE PODEJMOWANIA DECYZJI O SYMETRII PIONOWEJ.';

  @override
  String get objectDisplacementTitle => 'Przemieszczenie Obiektu';

  @override
  String get objectDisplacementSubtitle =>
      'BADAJ ROZMIESZCZENIE I STUKNIJ W JEDYNY OBIEKT, KTÓRY SIĘ PORUSZYŁ.';

  @override
  String get mandalaRecallTitle => 'Przywołanie Mandali';

  @override
  String get mandalaRecallSubtitle =>
      'ZAPAMIĘTUJ KOLOROWE PŁYTKI I OD MALUJ MANDALE Z PALETY.';

  @override
  String get runningMemorySpanTitle => 'Bieżący Zakres Pamięci';

  @override
  String get runningMemorySpanSubtitle =>
      'MONITORUJ BIEŻĄCE LITERY I PRZYPOMNIJ SOBIE OSTATNIE N ELEMENTÓW.';

  @override
  String get spatialCabinetMemoryTitle => 'Szafki Przestrzenne';

  @override
  String get spatialCabinetMemorySubtitle =>
      'ZAPAMIĘTUJ I LOKALIZUJ ELEMENTY ZA DRZWIAMI SZAFEK.';

  @override
  String get pathRecallSubtitle => 'ZAPAMIĘTUJ I POWTARZAJ WYBORY ŚCIEŻEK.';

  @override
  String get objectShuffleSubtitle =>
      'ŚLEDŹ ELEMENTY POMIESZANE POD GŁĘBOKIMI KUBKAMI.';

  @override
  String get groceryListSubtitle => 'ZAPAMIĘTUJ I ODZNACZAJ ELEMENTY Z LISTY.';

  @override
  String get quickMathSubtitle =>
      'ROZWIĄZUJ PYTANIA ARYTMETYCZNE Z MAKSYMALNĄ PRĘDKOŚCIĄ.';

  @override
  String get mathGuessTitle => 'Zgadnij Matematykę';

  @override
  String get mathGuessSubtitle => 'ZGADNIJ UKRYTĄ LICZBĘ W CIĄGU 15 SZANS.';

  @override
  String get reflexTapSubtitle =>
      'STUKAJ W BODŹCE TAK SZYBKO, JAK TO LUDZKIE MOŻLIWE.';

  @override
  String get pixelMimicSubtitle =>
      'NAŚLADUJ WZORY PROJEKTOWE NA SIATKACH PIKSELI.';

  @override
  String get simonSequenceSubtitle =>
      'POWTARZAJ SEKWENCJE KSZTAŁTÓW Z PAMIĘCI.';

  @override
  String get slidePuzzleSubtitle =>
      'PRZEORGANIZUJ KWADRATOWE PŁYTKI PRZESUWNEJ SIATKI.';

  @override
  String get findWordTitle => 'Znajdź Słowo';

  @override
  String get schulteTableSubtitle =>
      'STUKAJ LICZBY OD JEDNEGO DO DWUDZIESTU PIĘCIU.';

  @override
  String get simonCommandTitle => 'Polecenie Simona';

  @override
  String get simonCommandSubtitle => 'SZYBKO WYKONUJ INSTRUKCJE GŁOSOWE.';

  @override
  String get binaryCodeTitle => 'Prędkość Binarna';

  @override
  String get binaryCodeSubtitle => 'TŁUMACZ KODY BINARNE NA DZIESIĘTNE.';

  @override
  String get moduloClockTitle => 'Zegar Modulo';

  @override
  String get moduloClockSubtitle =>
      'OBLICZAJ RÓWNANIA MATEMATYCZNE, UŻYWAJĄC ZEGARÓW.';

  @override
  String get chimpTestTitle => 'Test Szympansa';

  @override
  String get chimpTestSubtitle => 'STUKAJ LOSOWE LICZBY W KOLEJNOŚCI ROSNĄCEJ.';

  @override
  String get relationalMemoryTitle => 'Pamięć Relacyjna';

  @override
  String get relationalMemorySubtitle =>
      'PRZYPOMNIJ SOBIE DOKŁADNE POŁOŻENIE ELEMENTÓW SIATKI.';

  @override
  String get factBinderTitle => 'Segregator Faktów';

  @override
  String get factBinderSubtitle =>
      'ŁĄCZ SYMBOLE I PRZYPOMINAJ SOBIE STWIERDZENIA.';

  @override
  String get sourceMonitoringTitle => 'Monitorowanie Źródła';

  @override
  String get sourceMonitoringSubtitle => 'PAMIĘTAJ O KONTEKŚCIE.';

  @override
  String get klotskiTitle => 'Ucieczka Klotski';

  @override
  String get klotskiSubtitle => 'PRZESUWAJ BLOKI, ABY DOTRZEĆ DO WYJŚĆ.';

  @override
  String get homophoneHuntSubtitle =>
      'Wybierz poprawnie zapisaną formę homofonu';

  @override
  String get laserLinkTitle => 'Laser Link';

  @override
  String get laserLinkSubtitle =>
      'Obracaj lustra, aby odbijać lasery i zasilać wszystkie cele.';

  @override
  String get laserLinkCongrats =>
      'Precyzyjne odbicie! Udało Ci się zasilić całą siatkę.';

  @override
  String get crossSectionSliceTitle => 'Przekrój poprzeczny';

  @override
  String get crossSectionSliceSubtitle =>
      'Zidentyfikuj poprawny przekrój 2D obiektu 3D pod określonym kątem.';

  @override
  String get crossSectionSliceCongrats =>
      'Niesamowita wizualizacja 3D! Przejrzałeś ten kształt na wylot.';

  @override
  String get shadowPivotTitle => 'Pivot cienia';

  @override
  String get shadowPivotCongrats =>
      'Dynamiczne rozumowanie przestrzenne! Opanowałeś światło i cień.';

  @override
  String get shadowPivotSubtitle =>
      'Przewiduj cień rzucany przez obiekt 3D podczas jego obrotu wokół różnych osi.';

  @override
  String get interlockPuzzleTitle => 'Puzzle blokujące';

  @override
  String get interlockPuzzleSubtitle =>
      'Zdemontuj lub zmontuj złożone bloki blokujące się w odpowiedniej kolejności.';

  @override
  String get interlockPuzzleCongrats =>
      'Logiczna dekonstrukcja! Idealnie rozwiązałeś zagadkę.';

  @override
  String get pathIntersectTitle => 'Przecięcie ścieżek';

  @override
  String get pathIntersectSubtitle =>
      'Nawiguj wieloma ścieżkami jednocześnie, aby dotrzeć do ich celów bez kolizji.';

  @override
  String get pathIntersectCongrats =>
      'Zsynchronizowana nawigacja! Bezbłędnie dotarłeś do wszystkich celów.';

  @override
  String get negativeSpaceDetectionTitle => 'Negatywna przestrzeń';

  @override
  String get negativeSpaceDetectionSubtitle =>
      'Zidentyfikuj kształt utworzony przez pustą przestrzeń między obiektami.';

  @override
  String get negativeSpaceDetectionCongrats =>
      'Bystra percepcja! Opanowałeś sztukę widzenia tego, czego nie ma.';

  @override
  String get compassMazeTitle => 'Labirynt z kompasem';

  @override
  String get compassMazeSubtitle =>
      'Nawiguj w labiryncie, w którym kierunki ruchu zmieniają się w zależności od orientacji kompasu.';

  @override
  String get compassMazeCongrats =>
      'Ekspercka nawigacja! Znaleźliście wyjście pomimo zmieniających się kierunków.';

  @override
  String get complexFoldingNetsTitle => 'Siatki składane';

  @override
  String get complexFoldingNetsSubtitle =>
      'Określ, jaki złożony kształt 3D powstanie po złożeniu niestandardowej siatki 2D.';

  @override
  String get complexFoldingNetsCongrats =>
      'Zaawansowana logika składania! Udało Ci się zwizualizować formę 3D.';

  @override
  String get compassMazeMessage => 'Nawiguj w labiryncie za pomocą kompasu.';

  @override
  String get negativeSpaceDetectionMessage =>
      'Zidentyfikuj ukryty obiekt w przestrzeni.';

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
}
