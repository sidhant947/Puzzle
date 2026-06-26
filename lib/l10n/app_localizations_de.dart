// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Puzzle-Spiele';

  @override
  String get home => 'Start';

  @override
  String get settings => 'Einstellungen';

  @override
  String get playAgain => 'Nochmal spielen';

  @override
  String get playNext => 'Nächstes Spiel';

  @override
  String get seeCompleted => 'Puzzle ansehen';

  @override
  String get finish => 'Beenden';

  @override
  String get congrats => 'Glückwunsch';

  @override
  String get perfectGradient => 'Perfekter Verlauf!';

  @override
  String get wellDone => 'Gut gemacht';

  @override
  String get timeUp => 'Zeit abgelaufen!';

  @override
  String get victory => 'Sieg!';

  @override
  String get gameWin => 'GUT GEMACHT!';

  @override
  String get completed => 'Abgeschlossen!';

  @override
  String get score => 'Punktzahl';

  @override
  String get timeLeft => 'Zeit';

  @override
  String get trials => 'Versuche';

  @override
  String get numberRule => 'Zahlenregel';

  @override
  String get colorRule => 'Farbregel';

  @override
  String get valid => 'Gültig';

  @override
  String get invalid => 'Ungültig';

  @override
  String get even => 'Gerade';

  @override
  String get odd => 'Ungerade';

  @override
  String get red => 'Rot';

  @override
  String get green => 'Grün';

  @override
  String get blue => 'Blau';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nein';

  @override
  String get trueLabel => 'Wahr';

  @override
  String get falseLabel => 'Falsch';

  @override
  String get clear => 'Löschen';

  @override
  String get north => 'Norden';

  @override
  String get south => 'Süden';

  @override
  String get east => 'Osten';

  @override
  String get west => 'Westen';

  @override
  String get target => 'Ziel';

  @override
  String get moves => 'Züge';

  @override
  String get trialMode => 'Versuchsmodus';

  @override
  String get trialModeDescription => 'Löse 20 zum Beenden statt 60s Timer';

  @override
  String get appearance => 'Erscheinungsbild';

  @override
  String get language => 'Sprache';

  @override
  String get gameplay => 'Gameplay';

  @override
  String get supportUs => 'Unterstütze uns';

  @override
  String get systemLegal => 'System & Rechtliches';

  @override
  String get games => 'Spiele';

  @override
  String get solvedToday => 'Heute gelöst';

  @override
  String get searchGames => 'Spiele suchen...';

  @override
  String get readyToStart => 'BEREIT FÜR DEIN GEHIRNTRAINING?';

  @override
  String get greatStart => 'GUTER START! BLEIB DRAN.';

  @override
  String get onFire => 'LÄUFT BEI DIR! DEIN GEHIRN LIEBT DAS.';

  @override
  String get incredible => 'UNGLAUBLICH! DU BIST EIN PUZZLE-MEISTER.';

  @override
  String get noGamesMatch => 'KEINE SPIELE ENTSPRECHEN DEINER SUCHE';

  @override
  String get categoryAll => 'ALLE';

  @override
  String get categoryAttention => 'AUFMERKSAMKEIT';

  @override
  String get categoryLogic => 'LOGIK';

  @override
  String get categoryMath => 'MATHE';

  @override
  String get categoryWord => 'WORT';

  @override
  String get categoryMemory => 'GEDÄCHTNIS';

  @override
  String get categorySpatial => 'RÄUMLICH';

  @override
  String get themeLight => 'HELL';

  @override
  String get themeDark => 'DUNKEL';

  @override
  String get themeSystem => 'SYSTEM';

  @override
  String get starOnGithub => 'Auf GitHub bewerten';

  @override
  String get sponsorOnGithub => 'Auf GitHub sponsern';

  @override
  String get privacyPolicy => 'Datenschutzerklärung';

  @override
  String get termsOfService => 'Nutzungsbedingungen';

  @override
  String get licenses => 'Lizenzen';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return 'Du hast $maxTries Versuche, das versteckte Wort mit $wordLength Buchstaben zu finden.';
  }

  @override
  String wordFoundMessage(String word) {
    return 'Wort erfolgreich gefunden: $word';
  }

  @override
  String gameOverMessage(String word) {
    return 'Das Wort war: $word';
  }

  @override
  String get gameOver => 'Spiel vorbei';

  @override
  String get crosswordTitle => 'Kreuzworträtsel';

  @override
  String get crosswordSubtitle =>
      'Vervollständige das Gitter mit den richtigen Wörtern basierend auf den Hinweisen.';

  @override
  String get wordSearchTitle => 'Wortsuche';

  @override
  String get radicalRootsTitle => 'Radikale Wurzeln';

  @override
  String get radicalRootsSubtitle =>
      'Finde die Quadrat- oder Kubikwurzel der gegebenen Zahl. Runde falls nötig auf die nächste ganze Zahl.';

  @override
  String get radicalRootsGoalReached => 'Ziel erreicht!';

  @override
  String get radicalRootsTimeUp => 'Zeit abgelaufen!';

  @override
  String radicalRootsScoreMessage(int score) {
    return 'Du hast $score Wurzeln korrekt berechnet!';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return 'Übe weiter! Du hast $score Wurzeln berechnet.';
  }

  @override
  String get radicalRootsStart => 'Berechnung starten';

  @override
  String get radicalRootsDescription =>
      'Du hast 60 Sekunden Zeit, um so viele wie möglich zu lösen.';

  @override
  String get radicalRootsBest => 'Bestleistung';

  @override
  String get radicalRootsSeconds => '60 SEKUNDEN';

  @override
  String get romanArithmeticTitle => 'Römisches Rechnen';

  @override
  String get romanArithmeticSubtitle =>
      'Löse Additions- and Subtraktionsaufgaben mit römischen Zahlen.';

  @override
  String get romanArithmeticGoalReached => 'Zenturio-Level!';

  @override
  String get romanArithmeticTimeUp => 'Zeit abgelaufen!';

  @override
  String romanArithmeticScoreMessage(int score) {
    return 'Du hast $score römische Aufgaben gelöst!';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return 'Veni, Vidi, Vici! Du hast $score Aufgaben gelöst.';
  }

  @override
  String get romanArithmeticStart => 'Quest beginnen';

  @override
  String get romanArithmeticDescription =>
      'Umwandeln und lösen. Du hast 60 Sekunden.';

  @override
  String get romanArithmeticBest => 'Bestleistung';

  @override
  String get romanArithmeticSeconds => '60 SEKUNDEN';

  @override
  String get wordSearchSubtitle =>
      'Finde alle versteckten Wörter im Gitter. Ziehen zum Auswählen.';

  @override
  String get missingVowelsTitle => 'Fehlende Vokale';

  @override
  String get missingVowelsSubtitle =>
      'Erkenne das Wort, dessen Vokale versteckt sind.';

  @override
  String get missingVowelsWin => 'Vokale wiederhergestellt!';

  @override
  String get missingVowelsHowToPlay =>
      'Ein Wort wird ohne Vokale (A, E, I, O, U) angezeigt. Errate das ganze Wort!';

  @override
  String get wordScrambleTitle => 'Wortsalat';

  @override
  String get wordScrambleSubtitle =>
      'Tippe auf die Buchstaben, um das versteckte Wort zu entwirren!';

  @override
  String get wordScrambleWin => 'Wort entwirrt!';

  @override
  String get sudokuTitle => 'Sudoku';

  @override
  String get sudokuSubtitle =>
      'Vervollständige das Gitter, sodass jede Zeile, Spalte und jeder 3x3-Block alle Ziffern von 1 bis 9 enthält.';

  @override
  String get minesweeperTitle => 'Minesweeper';

  @override
  String get minesweeperSubtitle =>
      'Identifiziere alle Minen, ohne sie auszulösen.';

  @override
  String get minesweeperWin => 'Sieg!';

  @override
  String get minesweeperMines => 'MINEN';

  @override
  String get minesweeperStatus => 'STATUS';

  @override
  String get minesweeperWon => 'GEWONNEN';

  @override
  String get minesweeperBoom => 'BOOM';

  @override
  String get minesweeperPlaying => 'LÄUFT';

  @override
  String get minesweeperReveal => 'AUFDECKEN';

  @override
  String get minesweeperFlag => 'FLAGGE';

  @override
  String get game2048Title => '2048';

  @override
  String get game2048Subtitle =>
      'Wische in eine beliebige Richtung, um Kacheln zu verschmelzen und die 2048-Kachel zu erreichen!';

  @override
  String get nonogramTitle => 'Nonogramm';

  @override
  String get nonogramSubtitle =>
      'Enthülle das versteckte Bild mithilfe von Logik-Hinweisen.';

  @override
  String get nonogramWin => 'Bild enthüllt!';

  @override
  String get magnetsTitle => 'MAGNETE';

  @override
  String get magnetsSubtitle =>
      'Platziere Magnete im Raster basierend auf den Polzahlen.';

  @override
  String get magnetsHowToPlay =>
      'Fülle dominogroße Behälter mit „+“- und „-“-Magneten oder lasse sie leer. Zeilen- und Spaltenhinweise geben die Gesamtzahl jedes Pols in dieser Linie an. Identische Pole dürfen orthogonal nicht benachbart sein.';

  @override
  String get magnetsWinTitle => 'POLARITÄT AUSGEGLICHEN!';

  @override
  String get magnetsWinMessage => 'Alle Magnete sind perfekt angeordnet!';

  @override
  String get lighthousesTitle => 'LEUCHTTÜRME';

  @override
  String get lighthousesSubtitle =>
      'Platziere Schiffe basierend auf Leuchtturm-Hinweisen.';

  @override
  String get lighthousesHowToPlay =>
      'Platziere 1x1-Schiffe im Raster. Leuchttürme geben die Gesamtzahl der horizontal und vertikal sichtbaren Schiffe an. Schiffe dürfen weder Leuchttürme noch einander berühren, auch nicht diagonal.';

  @override
  String get lighthousesWinTitle => 'SEE SICHER!';

  @override
  String get lighthousesWinMessage =>
      'Alle Leuchttürme leiten die Schiffe perfekt!';

  @override
  String get dominosaTitle => 'DOMINOSA';

  @override
  String get dominosaSubtitle =>
      'Finde alle versteckten Dominosteine im Raster.';

  @override
  String get dominosaHowToPlay =>
      'Ordne einen kompletten Satz Dominosteine auf einem Zahlenraster so an, dass jedes Paar benachbarter Zahlen von genau einem Dominostein bedeckt wird. Jedes Zahlenpaar existiert nur einmal im Satz.';

  @override
  String get dominosaWinTitle => 'DOMINO-MEISTER!';

  @override
  String get dominosaWinMessage =>
      'Jeder Dominostein wurde gefunden und platziert!';

  @override
  String get skyscrapersTitle => 'WOLKENKRATZER';

  @override
  String get skyscrapersSubtitle => 'Fülle das Raster mit Gebäudehöhen.';

  @override
  String get skyscrapersHowToPlay =>
      'Fülle das Raster mit Höhen (1-N), sodass jede Zeile und Spalte jede Höhe genau einmal enthält. Hinweise an den Rändern geben an, wie viele Gebäude aus dieser Richtung sichtbar sind, wobei höhere Gebäude kürzere blockieren.';

  @override
  String get skyscrapersWinTitle => 'SKYLINE WIEDERHERGESTELLT!';

  @override
  String get skyscrapersWinMessage => 'Alle Gebäude sind perfekt positioniert!';

  @override
  String get nurikabeTitle => 'NURIKABE';

  @override
  String get nurikabeSubtitle =>
      'Bilde ein zusammenhängendes Meer und trenne Inseln.';

  @override
  String get nurikabeHowToPlay =>
      'Schattiere Zellen, um ein einzelnes zusammenhängendes „Meer“ zu bilden (keine 2x2-Blöcke). Unschattierte Zellen bilden „Inseln“, die jeweils genau eine Zahl enthalten, die ihre Gesamtfläche darstellt.';

  @override
  String get nurikabeWinTitle => 'MEER FLIESST!';

  @override
  String get nurikabeWinMessage => 'Inseln getrennt, Meer verbunden!';

  @override
  String get fillominoTitle => 'FILLOMINO';

  @override
  String get fillominoSubtitle =>
      'Unterteile das Raster in Polyominos der angegebenen Größen.';

  @override
  String get fillominoHowToPlay =>
      'Unterteile das Raster in Polyominos, sodass jedes Polyomino der Größe N die Zahl N in all seinen Zellen enthält. Polyominos der gleichen Größe dürfen orthogonal nicht benachbart sein.';

  @override
  String get fillominoWinTitle => 'RASTER UNTERTEILT!';

  @override
  String get fillominoWinMessage => 'Perfekt mit Logik gekachelt!';

  @override
  String get hitoriTitle => 'HITORI';

  @override
  String get hitoriSubtitle =>
      'Schattiere doppelte Zahlen in jeder Zeile und Spalte.';

  @override
  String get hitoriHowToPlay =>
      'Schattiere Zellen, sodass keine Zahl mehr als einmal in einer Zeile oder Spalte vorkommt. Schattierte Zellen dürfen nicht benachbart sein (orthogonal), und alle unschattierten Zellen müssen eine einzige zusammenhängende Gruppe bilden.';

  @override
  String get hitoriWinTitle => 'HITORI-MEISTER!';

  @override
  String get hitoriWinMessage =>
      'Du hast alle Duplikate erfolgreich aufgelöst!';

  @override
  String get pathFinderTitle => 'Pfadfinder';

  @override
  String get pathFinderSubtitle => 'Finde den versteckten Pfad von S nach E.';

  @override
  String get pathFinderWin => 'Pfad gemeistert!';

  @override
  String get howToPlay => 'Spielanleitung';

  @override
  String get gotIt => 'Verstanden';

  @override
  String get akariTitle => 'Akari';

  @override
  String get akariSubtitle => 'Beleuchte alle weißen Felder';

  @override
  String get akariHowToPlay =>
      'Platziere Glühbirnen in weißen Feldern, um das gesamte Gitter zu beleuchten. Birnen beleuchten ihre Zeile und Spalte, bis sie auf eine Wand stoßen. Zwei Birnen dürfen sich nicht gegenseitig anleuchten. Nummerierte Wände zeigen genau an, wie viele Birnen in angrenzenden Feldern platziert werden müssen.';

  @override
  String get akariWinTitle => 'LICHT AN!';

  @override
  String get akariWinMessage => 'Alles ist perfekt beleuchtet.';

  @override
  String get arithmeticChainTitle => 'Kettenrechnen';

  @override
  String get arithmeticChainSubtitle => 'Berechne die laufende Summe im Kopf';

  @override
  String get arithmeticChainWinTitle => 'LEVEL UP!';

  @override
  String get arithmeticChainWinMessage => 'Dein Kopfrechnen ist scharf!';

  @override
  String get arithmeticChainLoseTitle => 'VERSUCH\'S NOCHMAL';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return 'Die richtige Antwort war $answer.';
  }

  @override
  String get arithmeticChainStart => 'START';

  @override
  String get arithmeticChainNext => 'WEITER';

  @override
  String get attentionalBlinkTitle => 'Attentional Blink';

  @override
  String get attentionalBlinkSubtitleWatch => 'ACHTE AUF DIE ZAHLEN';

  @override
  String get attentionalBlinkSubtitleInput =>
      'GIB DIE BEIDEN ZAHLEN EIN, DIE DU GESEHEN HAST';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return 'Du hast $score Ziele erreicht!';
  }

  @override
  String get balanceScaleTitle => 'BALANZA WAAGE';

  @override
  String get balanceScaleSubtitle =>
      'Erschließe das Gewicht des letzten Gegenstands basierend auf den Waagen.';

  @override
  String get balanceScaleWinTitle => 'AUSGEGLICHEN!';

  @override
  String get balanceScaleWinMessage =>
      'Du hast das Gewicht richtig erschlossen!';

  @override
  String get balanceScaleLoseTitle => 'UNGLEICHGEWICHT';

  @override
  String get balanceScaleLoseMessage =>
      'Versuch\'s nochmal, um das richtige Gleichgewicht zu finden.';

  @override
  String get balanceScaleBack => 'ZURÜCK';

  @override
  String get balanceScaleSubmit => 'ABSENDEN';

  @override
  String get binaryPuzzleTitle => 'BINÄR-PUZZLE';

  @override
  String get binaryPuzzleSubtitle =>
      'Fülle mit 0 und 1. Maximal zwei gleiche Ziffern nebeneinander. Gleiche Anzahl an 0en und 1en in jeder Zeile und Spalte.';

  @override
  String get binaryPuzzleWinTitle => 'GUT GEMACHT';

  @override
  String get binaryPuzzleWinMessage =>
      'Du hast das Binär-Puzzle mit perfekter Logik gelöst!';

  @override
  String get blockEscapeTitle => 'BLOCK ESCAPE';

  @override
  String get blockEscapeSubtitle =>
      'Verschiebe die Blöcke, um dem Hauptblock den Weg zum Ausgang frei zu machen.';

  @override
  String get blockEscapeWinTitle => 'ENTKOMMEN!';

  @override
  String get blockEscapeWinMessage =>
      'Du hast den Weg für den Hauptblock erfolgreich frei gemacht!';

  @override
  String get boxCompletionTitle => 'Würfel-Vervollständigung';

  @override
  String get boxCompletionSubtitle => 'Welcher Würfel kann gebildet werden?';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return 'Du hast $score von $totalTrials richtig!';
  }

  @override
  String get boxCompletionOptions => 'OPTIONEN';

  @override
  String get bridgesTitle => 'BRÜCKEN';

  @override
  String get bridgesSubtitle =>
      'Verbinde Inseln mit Brücken. Jede Insel benötigt eine bestimmte Anzahl an Brücken. Brücken dürfen sich nicht kreuzen.';

  @override
  String get bridgesWinTitle => 'VERBUNDEN!';

  @override
  String get bridgesWinMessage => 'Du hast alle Inseln erfolgreich verbunden!';

  @override
  String get calculationSprintTitle => 'RECHEN-SPRINT';

  @override
  String get calculationSprintSubtitle =>
      'Löse so viele Gleichungen wie möglich in 60 Sekunden.';

  @override
  String get calculationSprintGoalReached => 'ZIEL ERREICHT!';

  @override
  String get calculationSprintTimeUp => 'ZEIT ABGELAUFEN';

  @override
  String calculationSprintScoreMessage(int score) {
    return 'Hervorragende Rechengeschwindigkeit! Du hast $score Punkte erzielt.';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return 'Du hast $score Punkte erzielt. Versuch, deine Bestleistung zu schlagen!';
  }

  @override
  String get calculationSprintBest => 'BESTLEISTUNG';

  @override
  String get calculationSprintSeconds => '60 SEKUNDEN';

  @override
  String get calculationSprintDescription =>
      'Löse Gleichungen schnell.\nFalsche Antworten ziehen 3 Sekunden ab!';

  @override
  String get calculationSprintStart => 'SPRINT STARTEN';

  @override
  String get categoryFluencyTitle => 'Kategorie-Flüssigkeit';

  @override
  String get categoryFluencySubtitle =>
      'Gib Begriffe ein, die zur Kategorie gehören';

  @override
  String get categoryFluencyExpert => 'FLÜSSIGKEITS-EXPERTE!';

  @override
  String get categoryFluencyTimeUp => 'ZEIT ABGELAUFEN!';

  @override
  String get categoryFluencyWinMessage => 'Du hast einen riesigen Wortschatz!';

  @override
  String categoryFluencyFoundMessage(int count) {
    return 'Du hast $count Wörter gefunden.';
  }

  @override
  String get categoryFluencyCategoryLabel => 'Kategorie:';

  @override
  String get categoryFluencyEnterItem => 'Begriff eingeben...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target Wörter';
  }

  @override
  String get changeBlindnessTitle => 'Change Blindness';

  @override
  String get changeBlindnessSubtitle =>
      'FINDE DEN SICH VERÄNDERNDEN GEGENSTAND';

  @override
  String changeBlindnessScore(int score) {
    return 'PUNKTE: $score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return 'Du hast $score Veränderungen gefunden!';
  }

  @override
  String get choiceRtTitle => 'Wahl-Reaktionszeit';

  @override
  String get choiceRtSubtitle =>
      'Tippe so schnell wie möglich auf das aktive Quadrat';

  @override
  String choiceRtAvgMessage(String avg) {
    return 'Deine durchschnittliche Reaktionszeit: ${avg}ms';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return 'Verbleibende Zeit: ${time}s';
  }

  @override
  String choiceRtTaps(int count) {
    return 'Tipps: $count';
  }

  @override
  String get colorFloodTitle => 'Farbflut';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return 'Züge: $moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => 'FLUT ERFOLGREICH!';

  @override
  String get colorFloodDryLand => 'TROCKENES LAND...';

  @override
  String get colorFloodWinMessage =>
      'Du hast das ganze Gitter mit Farbe gefüllt!';

  @override
  String get colorFloodLoseMessage =>
      'Keine Züge mehr übrig. Versuch\'s nochmal!';

  @override
  String get colorMatchTitle => 'FARBABGLEICH';

  @override
  String get colorMatchSubtitle =>
      'Passe die Schieberegler an, um die Zielfarbe so genau wie möglich zu treffen.';

  @override
  String get colorMatchTarget => 'ZIEL';

  @override
  String get colorMatchYours => 'DEINE FARBE';

  @override
  String get colorMatchCheck => 'PRÜFEN';

  @override
  String get colorMatchResult => 'ERGEBNIS';

  @override
  String colorMatchAccuracy(String accuracy) {
    return 'Deine Genauigkeit: $accuracy%';
  }

  @override
  String get corsiBlocksTitle => 'CORSI-BLÖCKE';

  @override
  String get corsiBlocksSubtitle =>
      'Beobachte die aufleuchtenden Blöcke und tippe sie in der gleichen Reihenfolge an.';

  @override
  String get corsiBlocksWinTitle => 'RÄUMLICHER MEISTER!';

  @override
  String get corsiBlocksLoseTitle => 'VERLOREN IM RAUM';

  @override
  String corsiBlocksMessage(int score, int span) {
    return 'Du hast dir $score Sequenzen gemerkt! Deine räumliche Gedächisspanne erreichte $span.';
  }

  @override
  String get corsiBlocksWatch => 'MUSTER BEOBACHTEN';

  @override
  String get corsiBlocksRepeat => 'MUSTER WIEDERHOLEN';

  @override
  String get corsiBlocksExcellent => 'EXZELLENT!';

  @override
  String get corsiBlocksSpan => 'SPANNE';

  @override
  String get crownTitle => 'KRONE';

  @override
  String get crownSubtitle =>
      'Platziere eine Krone in jeder Zeile, Spalte und Farbregion. Kronen dürfen nicht benachbart sein, auch nicht diagonal.';

  @override
  String get crownCrowned => 'GEKRÖNT!';

  @override
  String get crownSuccess =>
      'Alle Kronen wurden erfolgreich mit perfekter Logik platziert.';

  @override
  String get cryptogramTitle => 'KRYPTOGRAMM';

  @override
  String get cryptogramSubtitle =>
      'Ordne Buchstaben zu, um die geheime Nachricht zu entschlüsseln! Jeder kodierte Buchstabe steht für einen echten Buchstaben.';

  @override
  String get cryptogramBroken => 'CODE GEKNACKT!';

  @override
  String get cryptogramEncrypted => 'VERSCHLÜSSELT';

  @override
  String get cryptogramSuccess =>
      'Du hast die Nachricht perfekt entschlüsselt.';

  @override
  String get cryptogramTryAgain =>
      'Versuch\'s nochmal, um die Verschlüsselung zu knacken.';

  @override
  String get digitSpanReverseTitle => 'Umgekehrte Spanne';

  @override
  String get digitSpanReverseSubtitleMemorize => 'Merke dir die Ziffern';

  @override
  String get digitSpanReverseSubtitleEnter =>
      'Gib die Ziffern in UMGEKEHRTER Reihenfolge ein';

  @override
  String get digitSpanReverseWinTitle => 'LEVEL UP!';

  @override
  String get digitSpanReverseWinMessage =>
      'Dein Arbeitsgedächtnis ist beeindruckend!';

  @override
  String get digitSpanReverseLoseTitle => 'VERSUCH\'S NOCHMAL';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return 'Die richtige umgekehrte Sequenz war $sequence.';
  }

  @override
  String get dividedAttentionTitle => 'Geteilte Aufmerksamkeit';

  @override
  String get dividedAttentionSubtitle =>
      'Tippe LINKS für STERN ⭐ | Tippe RECHTS für ROT 🔴';

  @override
  String get dividedAttentionGameOverTitle => 'FOKUS VERLOREN';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return 'Multitasking ist schwer! Deine Punktzahl war $score.';
  }

  @override
  String dividedAttentionScore(int score) {
    return 'PUNKTE: $score';
  }

  @override
  String get doubleNBackTitle => 'Double N-Back';

  @override
  String doubleNBackSubtitle(int n) {
    return 'Vergleiche Reize $n Schritte zurück';
  }

  @override
  String get doubleNBackGameOverTitle => 'SPIEL VORBEI';

  @override
  String doubleNBackGameOverMessage(int score) {
    return 'Du hast $score Punkte in Double N-Back erreicht!';
  }

  @override
  String doubleNBackScore(int score) {
    return 'Punkte: $score';
  }

  @override
  String get doubleNBackPositionMatch => 'POSITIONSTREFFER';

  @override
  String get doubleNBackLetterMatch => 'BUCHSTABENTREFFER';

  @override
  String get faceNameAssociationTitle => 'Gesicht-Name';

  @override
  String get faceNameAssociationSubtitleStudy =>
      'Merke dir den Namen zu jedem Gesicht';

  @override
  String get faceNameAssociationSubtitleTest => 'Wer ist das?';

  @override
  String get faceNameAssociationPerfect => 'PERFEKT!';

  @override
  String get faceNameAssociationGameOver => 'SPIEL VORBEI';

  @override
  String get faceNameAssociationWinMessage =>
      'Du hast ein tolles Gedächtnis für Gesichter und Namen!';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return 'Du hast $correct von $total richtig.';
  }

  @override
  String get faceNameAssociationStartTest => 'TEST STARTEN';

  @override
  String get flankerTestWinTitle => 'LASERFOKUS!';

  @override
  String get flankerTestLoseTitle => 'ABGELENKT';

  @override
  String flankerTestScoreMessage(int score) {
    return 'Du hast $score korrekt beantwortet!';
  }

  @override
  String get flankerTestTitle => 'FLANKER-TEST';

  @override
  String get flankerTestSubtitle =>
      'Gib die Richtung des mittleren Pfeils an und ignoriere die flankierenden Pfeile.';

  @override
  String get flankerTestLeft => 'LINKS';

  @override
  String get flankerTestRight => 'RECHTS';

  @override
  String get fractionMatchTitle => 'Bruchteile zuordnen';

  @override
  String get fractionMatchSubtitle => 'Ordne das Bild dem richtigen Bruch zu';

  @override
  String get fractionMatchLoseTitle => 'FALSCHE ZUORDNUNG';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return 'Die richtige Antwort war $correctAnswer.';
  }

  @override
  String get goNoGoTitle => 'Go / No-Go';

  @override
  String get goNoGoSubtitle => 'Tippe bei Grün, IGNORIERE Rot!';

  @override
  String get goNoGoLoseTitle => 'REAKTION GESTOPPT';

  @override
  String get goNoGoLoseMessage => 'Deine Hemmungskontrolle wird getestet!';

  @override
  String get goNoGoTapAnywhere => 'ZUM WEITERMACHEN ÜBERALL TIPPEN';

  @override
  String get groceryListTitle => 'Einkaufsliste';

  @override
  String get groceryListSubtitleMemorize =>
      'Merke dir die Artikel und ihre Kategorien';

  @override
  String get groceryListSubtitleTest =>
      'Zu welcher Kategorie gehörte dieser Artikel?';

  @override
  String get groceryListWinTitle => 'EINKAUFS-GURU!';

  @override
  String get groceryListLoseTitle => 'ETWAS VERGESSEN?';

  @override
  String groceryListScoreMessage(int score) {
    return 'Du hast $score Punkte in Einkaufsliste erreicht!';
  }

  @override
  String get groceryListReady => 'ICH BIN BEREIT';

  @override
  String get groceryListWhereBelong => 'WOHIN GEHÖRT DAS?';

  @override
  String get hueSortTitle => 'FARBTON-SORTIERUNG';

  @override
  String get hueSortSubtitle =>
      'Tausche Kacheln, um einen fließenden Übergang zwischen den Eckfarben zu schaffen. Punkte markieren feste Kacheln.';

  @override
  String get hueSortWinTitle => 'PERFEKTER VERLAUF!';

  @override
  String get hueSortWinMessage => 'Du hast das Farbspektrum perfekt sortiert!';

  @override
  String hueSortWrongTiles(int count) {
    return 'Kacheln an der falschen Position: $count';
  }

  @override
  String get kenkenTitle => 'KenKen';

  @override
  String get kenkenWinTitle => 'GENIE!';

  @override
  String get kenkenLoseTitle => 'SPIEL VORBEI';

  @override
  String get kenkenWinMessage => 'Du hast das KenKen-Rätsel gelöst!';

  @override
  String get kenkenLoseMessage => 'Prüfe die Zeilen-/Spalten- und Käfigregeln.';

  @override
  String kenkenSubtitle(int size) {
    return 'Fülle 1-$size ohne Wiederholung in Zeilen/Spalten';
  }

  @override
  String get letterCancellationTitle => 'Buchstaben-Streichung';

  @override
  String get letterCancellationTitleFull => 'Buchstaben-Streichungstests';

  @override
  String letterCancellationScoreMessage(int score) {
    return 'Du hast $score Buchstaben gefunden!';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return 'Finde alle „$target“-Buchstaben';
  }

  @override
  String get letterCancellationFound => 'GEFUNDEN';

  @override
  String get letterCancellationTime => 'ZEIT';

  @override
  String get lightsOutTitle => 'LIGHTS OUT';

  @override
  String get lightsOutSubtitle =>
      'Das Tippen auf eine Kachel schaltet sie und ihre Nachbarn um. Schalte alle Lichter aus.';

  @override
  String get lightsOutWinTitle => 'RÄTSEL GELÖST!';

  @override
  String get lightsOutWinMessage =>
      'Du hast alle Lichter erfolgreich ausgeschaltet!';

  @override
  String get symmetryTitle => 'Symmetrie';

  @override
  String get symmetrySubtitle =>
      'Spiegle das Muster von links auf das leere Gitter rechts.';

  @override
  String get semanticLinkTitle => 'Semantischer Link';

  @override
  String get semanticLinkSubtitle => 'Finde das Wort, das alle drei verbindet';

  @override
  String get reflexTapTitle => 'Reflex-Tipp';

  @override
  String get visualStatisticalLearningTitle => 'Visuelles Lernen';

  @override
  String get orbitTapTitle => 'Orbit-Tipp';

  @override
  String get orbitTapSubtitle =>
      'Tippe, wenn die Bälle am Tor ausgerichtet sind';

  @override
  String get schulteTableTitle => 'Schulte-Tabelle';

  @override
  String get multipleObjectTrackingTitle => 'Objekt-Tracker';

  @override
  String get multipleObjectTrackingSubtitle =>
      'Beobachte die markierten Objekte. Verfolge sie, während sie sich bewegen, und wähle sie dann aus.';

  @override
  String get sdmtTitle => 'SDMT-Test';

  @override
  String get sdmtSubtitle =>
      'Nutze den obigen Schlüssel, um die Ziffer für das gezeigte Symbol zu finden.';

  @override
  String get memoryMatrixTitle => 'Gedächtnis-Matrix';

  @override
  String get memoryMatrixSubtitle =>
      'Merke dir das Muster und tippe die Kacheln an.';

  @override
  String get mentalAbacusTitle => 'Mentaler Abakus';

  @override
  String get mentalAbacusSubtitle => 'Löse mithilfe des Soroban';

  @override
  String get spellingSprintTitle => 'Rechtschreib-Sprint';

  @override
  String get spellingSprintSubtitle =>
      'Wetteifere gegen die Uhr, um so viele Wörter wie möglich zu buchstabieren.';

  @override
  String get stopSignalTitle => 'Stoppsignal';

  @override
  String get stopSignalSubtitle =>
      'Tippe die Pfeilrichtung, aber STOPPE sofort, wenn der Pfeil ROT wird.';

  @override
  String get staircaseMemoryTitle => 'Treppen-Gedächtnis';

  @override
  String get vigilanceTaskTitle => 'Vigilanz-Aufgabe';

  @override
  String get vigilanceTaskSubtitle =>
      'Tippe auf den Knopf, wenn der Zeiger eine Position überspringt';

  @override
  String get logicalSyllogismsTitle => 'Logische Syllogismen';

  @override
  String get logicalSyllogismsSubtitle =>
      'Ist die Schlussfolgerung logisch gültig?';

  @override
  String get mathPathTitle => 'Mathe-Pfad';

  @override
  String get mathPathSubtitle =>
      'Finde einen Pfad, der genau die Zielsumme ergibt.';

  @override
  String get sternbergTaskTitle => 'Sternberg-Aufgabe';

  @override
  String get sternbergTaskMemorize => 'Merke dir die Buchstaben';

  @override
  String get sternbergTaskWasLetterSet => 'War dieser Buchstabe in der Menge?';

  @override
  String sternbergTaskScore(int score) {
    return 'Du hast $score Punkte in der Sternberg-Aufgabe erreicht!';
  }

  @override
  String get verbalAnalogiesTitle => 'Verbale Analogien';

  @override
  String get verbalAnalogiesSubtitle => 'Vervollständige die Beziehung';

  @override
  String get typingSpeedTitle => 'Tippgeschwindigkeit';

  @override
  String get typingSpeedSubtitle =>
      'Tippe den Satz so schnell wie möglich exakt wie gezeigt!';

  @override
  String get wordLadderTitle => 'Wortleiter';

  @override
  String get wordLadderSubtitle =>
      'Verbinde die Wörter, indem du immer nur einen Buchstaben änderst.';

  @override
  String get tangleFixTitle => 'Gewirr auflösen';

  @override
  String get tangleFixSubtitle =>
      'Entwirre die Linien, sodass sich keine überschneiden';

  @override
  String get oddRotationTitle => 'Abweichende Rotation';

  @override
  String get oddRotationSubtitle =>
      'Eines davon ist gespiegelt. Kannst du es finden?';

  @override
  String get towerOfLondonTitle => 'Turm von London';

  @override
  String get towerOfLondonSubtitle => 'Gleiche die Zielkonfiguration ab';

  @override
  String get symbolicFlankerTitle => 'Symbolischer Flanker';

  @override
  String get symbolicFlankerSubtitle =>
      'Konzentriere dich auf das mittlere Symbol';

  @override
  String get stroopTestTitle => 'Stroop-Test';

  @override
  String get stroopTestSubtitle =>
      'Nenne die Schriftfarbe des Wortes. Ignoriere, was das Wort eigentlich bedeutet!';

  @override
  String get wisconsinCardSortingTitle => 'Wisconsin-Kartensortierung';

  @override
  String get wisconsinCardSortingSubtitle =>
      'ORDNE DIE KARTE EINER DER VIER OBIGEN ZU';

  @override
  String get nBackTitle => 'N-Back Test';

  @override
  String get nBackSubtitle =>
      'Tippe TREFFER, wenn der aktuelle Buchstabe mit dem von vor 2 Schritten übereinstimmt.';

  @override
  String get rhythmMasterTitle => 'Rhythmus-Meister';

  @override
  String get rhythmMasterSubtitle => 'Tippe synchron zum Takt';

  @override
  String get pixelMimicTitle => 'Pixel Mimik';

  @override
  String get targetNumberTitle => 'Ziel 24';

  @override
  String targetNumberSubtitle(int target) {
    return 'Nutze alle 4 Zahlen, um $target zu erreichen';
  }

  @override
  String get mirrorTracingTitle => 'Spiegelzeichnen';

  @override
  String get mirrorTracingSubtitle =>
      'Zeichne den Stern nach! Die Steuerung ist GESPIEGELT.';

  @override
  String get wordSurgeTitle => 'Word Surge';

  @override
  String get wordSurgeSubtitle => 'Synonyme & Antonyme';

  @override
  String get perspectiveTakingTitle => 'Perspektivwechsel';

  @override
  String get perspectiveTakingTopDownView => 'DRAUFSICHT';

  @override
  String get perspectiveTakingChoosePerspective => 'WÄHLE DIE PERSPEKTIVE';

  @override
  String get perspectiveTakingCongrats =>
      'Du hast ein scharfes Auge für räumliche Beziehungen.';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return 'Welche Ansicht ist aus Richtung $targetDirName?';
  }

  @override
  String get paperFoldingTitle => 'Papierfalten';

  @override
  String get paperFoldingSubtitle => 'Wie wird es entfaltet aussehen?';

  @override
  String get waterSortTitle => 'Water Sort';

  @override
  String get waterSortSubtitle =>
      'Sortiere die Farben, sodass jedes Reagenzglas nur eine Farbe enthält.';

  @override
  String get numericalEstimationTitle => 'Numerische Schätzung';

  @override
  String get numericalEstimationSubtitle =>
      'Wähle schnell die nächste Antwort!';

  @override
  String get lockPatternTitle => 'Sperrmuster';

  @override
  String get lockPatternSubtitle =>
      'Finde das geheime Muster. Jeder Versuch gibt Feedback zu Position und Punkten.';

  @override
  String get primeHunterTitle => 'Primzahlen-Jäger';

  @override
  String get primeHunterSubtitle =>
      'Wische LINKS für PRIMZAHL | RECHTS für ZUSAMMENGESETZT';

  @override
  String get tracePathTitle => 'Pfad nachfahren';

  @override
  String get tracePathSubtitle => 'Folge dem Zielpfad so genau wie möglich';

  @override
  String get ruleSwitcherTitle => 'Regel-Umschalter';

  @override
  String get ruleSwitcherSubtitle => 'Wende die aktuelle Regel an';

  @override
  String get choiceReactionTimeTitle => 'Wahl-Reaktionszeit';

  @override
  String get pathRecallTitle => 'Pfad-Erinnerung';

  @override
  String get switchTaskTitle => 'Switch Task';

  @override
  String get switchTaskSubtitle =>
      'Achte auf die Regel! Sie wechselt zwischen Form- und Farbübereinstimmung.';

  @override
  String get mentalRotationTitle => 'Mentale Rotation';

  @override
  String get mentalRotationSubtitle => 'Sind diese Formen gleich, nur gedreht?';

  @override
  String get missingOperatorTitle => 'Operator-Mix';

  @override
  String get missingOperatorSubtitle =>
      'Fülle die Lücken, um die Gleichung zu vervollständigen';

  @override
  String get wordMastermindTitle => 'Wort-Mastermind';

  @override
  String get wordMastermindSubtitle =>
      'Knacke den 4-Buchstaben-Code! Bulls (B) sind richtige Positionen, Cows (C) sind falsche Positionen.';

  @override
  String get simonSequenceTitle => 'Sequenz';

  @override
  String get symbolLogicTitle => 'Symbol-Logik';

  @override
  String get symbolLogicSubtitle =>
      'Löse die visuellen Gleichungen, um den Wert jedes Symbols zu finden. Was ist das Ergebnis?';

  @override
  String get silhouetteMatchTitle => 'Silhouetten-Treffer';

  @override
  String get silhouetteMatchSubtitle =>
      'Welche Silhouette passt zu diesem Objekt?';

  @override
  String get operationSpanTitle => 'Operation Span';

  @override
  String get operationSpanMathPhase => 'Ist die Gleichung korrekt?';

  @override
  String get operationSpanLetterPhase => 'Merke dir den Buchstaben';

  @override
  String get operationSpanRecallPhase =>
      'Erinnere dich an die Buchstaben in der richtigen Reihenfolge';

  @override
  String get operationSpanRoundComplete => 'Runde abgeschlossen!';

  @override
  String operationSpanScore(int score) {
    return 'Du hast $score Punkte in Operation Span erreicht!';
  }

  @override
  String get slidePuzzleTitle => 'Schiebepuzzle';

  @override
  String get slidePuzzleNewGame => 'NEUES SPIEL';

  @override
  String get slidePuzzleInstructions =>
      'Ordne die Kacheln numerisch, indem du sie in das leere Feld schiebst.';

  @override
  String get slidePuzzleTileSlider => 'KACHEL-SCHIEBER';

  @override
  String get slidePuzzleCongrats =>
      'Du hast alle Kacheln erfolgreich geordnet.';

  @override
  String get visualSearchTitle => 'Visuelle Suche';

  @override
  String get visualSearchSubtitle => 'Finde das einzigartige Symbol im Gitter';

  @override
  String get trailMakingTitle => 'Trail Making';

  @override
  String get trailMakingSubtitle =>
      'Verbinde die Zahlen in der richtigen Reihenfolge (1 -> 2 -> 3...) so schnell wie möglich.';

  @override
  String get matrixReasoningTitle => 'Matrix-Schlussfolgern';

  @override
  String get matrixReasoningSubtitle =>
      'Vervollständige das Muster im 3x3-Gitter';

  @override
  String get tentsAndTreesTitle => 'Zelte & Bäume';

  @override
  String get tentsAndTreesSubtitle =>
      'Platziere Zelte neben Bäumen. Zahlen geben an, wie viele Zelte in jeder Zeile/Spalte sind. Zelte dürfen sich nicht berühren.';

  @override
  String get quickMathTitle => 'Schnellrechnen';

  @override
  String get magicSquaresTitle => 'Magisches Quadrat';

  @override
  String magicSquaresSubtitle(int targetSum) {
    return 'Jede Zeile, Spalte und Diagonale muss die Summe $targetSum ergeben';
  }

  @override
  String get objectShuffleTitle => 'Objekt-Shuffle';

  @override
  String get pipesTitle => 'Rohre';

  @override
  String get pipesSubtitle => 'Verbinde gleichfarbige Punkte mit Rohren.';

  @override
  String get oddOneOutTitle => 'Was passt nicht?';

  @override
  String get oddOneOutSubtitle => 'Finde die Kachel mit einer anderen Farbe.';

  @override
  String get einsteinRiddleTitle => 'EINSTEIN-RÄTSEL';

  @override
  String get einsteinRiddleSubtitle =>
      'Nutze die Hinweise, um die Merkmale jedes Hauses zu erschließen.';

  @override
  String get einsteinRiddleHowToPlay =>
      'Jedes Haus hat einzigartige Merkmale (Farbe, Nationalität, Haustier usw.). Nutze die Hinweise, um das Gitter auszufüllen und die Lösung zu finden.';

  @override
  String get einsteinRiddleColor => 'Farbe';

  @override
  String get einsteinRiddleNationality => 'Nationalität';

  @override
  String get einsteinRiddleDrink => 'Getränk';

  @override
  String get einsteinRiddlePet => 'Haustier';

  @override
  String get einsteinRiddleSmoke => 'Rauchen';

  @override
  String get einsteinRiddleHouse => 'Haus';

  @override
  String get mirrorImageTitle => 'Spiegelbild';

  @override
  String get mirrorImageSubtitle => 'Erkenne die richtige Spiegelung.';

  @override
  String get mirrorImageHowToPlay =>
      'Betrachte die Form und wähle aus den Optionen die richtige Spiegelung aus.';

  @override
  String get mentalMappingTitle => 'Mentale Kartierung';

  @override
  String get mentalMappingSubtitle =>
      'Folge den Richtungen und finde das Ziel.';

  @override
  String get mentalMappingHowToPlay =>
      'Dir wird eine Abfolge von Richtungen gezeigt (Norden, Süden, Osten, Westen). Folge diesen Schritten im Kopf ausgehend von der Mitte und wähle das Ziel.';

  @override
  String get memoryPalaceTitle => 'Gedächtnispalast';

  @override
  String get memoryPalaceSubtitle =>
      'Merke dir, welches Wort an welchem ort war.';

  @override
  String get memoryPalaceHowToPlay =>
      'Wörter erscheinen an verschiedenen Orten im Gitter. Merke dir ihre Positionen und platziere sie später wieder dort.';

  @override
  String get countingSheepTitle => 'Schäfchen zählen';

  @override
  String get countingSheepSubtitle => 'Wie viele Schafe hast du gesehen?';

  @override
  String get countingSheepHowToPlay =>
      'Schafe laufen schnell über den Bildschirm. Zähle sie und gib am Ende die Gesamtzahl ein.';

  @override
  String get faceTraitAssociationTitle => 'Gesicht-Merkmal';

  @override
  String get faceTraitAssociationSubtitle =>
      'Merke dir Merkmale zu jedem Gesicht';

  @override
  String get faceTraitAssociationHowToPlay =>
      'Dir werden Gesichter mit Name, Beruf und Hobby gezeigt. Merke dir diese und ordne sie später wieder zu.';

  @override
  String get mentalCalendarTitle => 'Mentaler Kalender';

  @override
  String get mentalCalendarSubtitle => 'Berechne den Wochentag';

  @override
  String get mentalCalendarHowToPlay =>
      'Ein zufälliges Datum wird angezeigt. Berechne im Kopf, auf welchen Wochentag es fällt.';

  @override
  String get vocabularyBuilderTitle => 'Vokabeltrainer';

  @override
  String get vocabularyBuilderSubtitle =>
      'Ordne Synonyme und Antonyme unter Zeitdruck zu.';

  @override
  String get vocabularyBuilderHowToPlay =>
      'Ein Wort und eine Beziehung (Synonym oder Antonym) werden gezeigt. Wähle schnell das passende Wort.';

  @override
  String get correct => 'RICHTIG';

  @override
  String get incorrect => 'FALSCH';

  @override
  String get grammarPoliceTitle => 'Grammatik-Polizei';

  @override
  String get grammarPoliceSubtitle =>
      'Bestimmen Sie, ob der Satz grammatikalisch korrekt ist oder Fehler enthält.';

  @override
  String get grammarPoliceHowToPlay =>
      'Ein Satz erscheint in der Mitte des Bildschirms. Entscheiden Sie, ob er grammatikalisch korrekt ist oder einen Fehler enthält. Tippen Sie auf \'RICHTIG\', wenn er in Ordnung ist, oder auf \'FALSCH\', wenn Sie einen Fehler entdecken. Verlieren Sie nicht alle Ihre Leben!';

  @override
  String get reverseStroopTitle => 'Reverse Stroop';

  @override
  String get reverseStroopSubtitle =>
      'Eine variante des Stroop-Tests mit vertauschtem Fokus.';

  @override
  String get reverseStroopHowToPlay =>
      'Achte auf die Anweisung! Bei \'TEXT\' achte auf die Bedeutung, bei \'FARBE\' auf die Schriftfarbe.';

  @override
  String get game2048Instruction => 'WISCHEN ZUM VERSCHMELZEN';

  @override
  String get fibonacciMergeTitle => 'Fibonacci-Merge';

  @override
  String get fibonacciMergeSubtitle =>
      'Verschmelze aufeinanderfolgende Fibonacci-Zahlen (1, 1, 2, 3, 5, 8, 13...).';

  @override
  String get sequenceSleuthTitle => 'Sequenz-Detektiv';

  @override
  String get sequenceSleuthSubtitle =>
      'Finde die fehlende Zahl in der mathematischen Sequenz.';

  @override
  String get divisibilityDashTitle => 'Teilbarkeits-Sprint';

  @override
  String get divisibilityDashSubtitle =>
      'Tippe alle einstelligen Teiler (2-9) der gegebenen Zahl an.';

  @override
  String get percentagePeakTitle => 'Prozent-Gipfel';

  @override
  String get percentagePeakSubtitle =>
      'Löse Kopfrechenaufgaben zu Prozentsätzen schnell.';

  @override
  String get vennNumbersTitle => 'Venn-Zahlen';

  @override
  String get vennNumbersSubtitle =>
      'Ordne Zahlen in die richtigen Regionen des Venn-Diagramms ein.';

  @override
  String get commonDenominatorTitle => 'Gemeinsamer Nenner';

  @override
  String get commonDenominatorSubtitle =>
      'Finde den größten gemeinsamen Teiler oder das kleinste gemeinsame Vielfache.';

  @override
  String get angleFinderTitle => 'Winkelsucher';

  @override
  String get angleFinderSubtitle =>
      'Berechne den fehlenden Winkel im geometrischen Problem.';

  @override
  String get sumSnakeTitle => 'Summen-Schlange';

  @override
  String get sumSnakeSubtitle =>
      'Verbinde benachbarte Zahlen, um die Zielsumme zu erreichen.';

  @override
  String get baseShiftTitle => 'BASIS-WECHSEL BLITZ';

  @override
  String get baseShiftSubtitle => 'Löse in Dezimal';

  @override
  String get baseShiftDescription =>
      'Löse die Gleichung und gib die Antwort im Dezimalsystem (Basis 10) ein.';

  @override
  String get baseShiftEquation => 'GLEICHUNG';

  @override
  String get baseShiftHint => 'Dezimalergebnis eingeben...';

  @override
  String get baseShiftCorrect => 'Richtig!';

  @override
  String get baseShiftIncorrect => 'Falsch!';

  @override
  String get baseShiftSubmit => 'ABSENDEN';

  @override
  String get baseShiftQuickGuide => 'Kurzanleitung:';

  @override
  String get baseShiftBinary => 'Binär (bin): Basis 2 (0, 1)';

  @override
  String get baseShiftHex => 'Hexadezimal (0x): Basis 16 (0-9, A-F)';

  @override
  String get baseShiftDecimal => 'Dezimal (dec): Basis 10 (0-9)';

  @override
  String get baseShiftWinTitle => 'MATHE-MAGIER!';

  @override
  String get baseShiftWinMessage =>
      'Du hast 5 Basis-Wechsel-Gleichungen korrekt gelöst!';

  @override
  String get blockCount3DTitle => 'Block-Zählen 3D';

  @override
  String get blockCount3DSubtitle =>
      'ZIEHEN ZUM DREHEN • ZÄHLE VERSTECKTE BLÖCKE';

  @override
  String get blockCount3DHowMany => 'WIE VIELE BLÖCKE?';

  @override
  String get blockCount3DSubmitGuess => 'ANTWORT ABSENDEN';

  @override
  String get blockCount3DNotQuite =>
      'Nicht ganz! Versuche es durch Drehen erneut.';

  @override
  String get blockCount3DExcellent => 'EXZELLENT';

  @override
  String blockCount3DWinMessage(int count) {
    return 'Du hast alle $count Blöcke korrekt identifiziert!';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '1. Ziehe deinen Finger über das 3D-Sichtfeld, um den Blockstapel zu drehen.\n\n2. Zähle alle Blöcke im Stapel.\n\n3. Denke daran: Ein Block in der Luft muss strukturelle Stützblöcke darunter haben (versteckte Blöcke!).\n\n4. Gib deine Antwort ein und tippe auf „ANTWORT ABSENDEN“.';

  @override
  String get alphabetSudokuTitle => 'ALPHABET-SUDOKU';

  @override
  String get alphabetSudokuSubtitle =>
      'Fülle das Gitter, sodass jede Zeile, Spalte und jeder Block die Buchstaben A-I enthält.';

  @override
  String get alphabetSudokuWinTitle => 'SUDOKU GELÖST!';

  @override
  String get alphabetSudokuWinMessage =>
      'Brillant! Du hast die Buchstaben gemeistert.';

  @override
  String get classicMazeTitle => 'Klassisches Labyrinth';

  @override
  String get classicMazeSubtitle =>
      'ERKUNDEN & LÖSEN • EIN NEUES LABYRINTHE PRO SPIEL';

  @override
  String get classicMazeWinTitle => 'LABYRINTHE GEKLÄRT';

  @override
  String classicMazeWinMessage(int count) {
    return 'Unglaubliche Navigation! Du hast das Labyrinth in $count Zügen gelöst.';
  }

  @override
  String get classicMazeMoves => 'ZÜGE: ';

  @override
  String get classicMazeHowToPlayDescription =>
      '1. Führe die leuchtend gelbe Murmel (Spieler) zum grünen Portal (Ausgang) unten rechts.\n\n2. Wische irgendwo im Labyrinth, nutze die Pfeiltasten der Tastatur oder die Tasten unten.\n\n3. Die lila Spur zeigt den erkundeten Pfad. Gehe zurück, um die Spur dynamisch zu löschen!\n\n4. Ändere die Schwierigkeit, um dich mit größeren Labyrinthen herauszufordern.';

  @override
  String get conjunctionSearchTitle => 'Konjunktions-Suche';

  @override
  String get conjunctionSearchSubtitle =>
      'Aufmerksamkeitsfokus & Merkmalskonjunktion';

  @override
  String get conjunctionSearchWinTitle => 'SIEG';

  @override
  String get conjunctionSearchWinMessage =>
      'Du hast alle Ziele mit perfektem Fokus gefunden!';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      'Eine bestimmte Kombination aus Form und Farbe wird angezeigt. Finde und tippe sie so schnell wie möglich an. Distraktoren teilen entweder Farbe oder Form!';

  @override
  String get conjunctionSearchRound => 'RUNDE: ';

  @override
  String get conjunctionSearchScore => 'PUNKTE: ';

  @override
  String get conjunctionSearchFind => 'FINDE: ';

  @override
  String get shapeCircle => 'KREIS';

  @override
  String get shapeSquare => 'QUADRAT';

  @override
  String get shapeTriangle => 'DREIECK';

  @override
  String get shapeStar => 'STERN';

  @override
  String get shapeRectangle => 'RECHTECK';

  @override
  String get shapeEllipse => 'ELLIPSE';

  @override
  String get shapeTrapezoid => 'TRAPEZ';

  @override
  String get colorRedLabel => 'ROT';

  @override
  String get colorBlueLabel => 'BLAU';

  @override
  String get colorGreenLabel => 'GRÜN';

  @override
  String get colorAmberLabel => 'BERNSTEIN';

  @override
  String get cubeNetFoldTitle => 'Würfelnetz-Falten';

  @override
  String get cubeNetFoldSubtitle => 'WÄHLE DIE PASSENDE 3D-WÜRFELOPTION';

  @override
  String get cubeNetFoldWinTitle => 'RICHTIG';

  @override
  String get cubeNetFoldWinMessage => 'Du hast eine perfekte 3D-Faltlogik!';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '1. Betrachte das ungefaltete 2D-Netz oben.\n\n2. Falte das Netz im Kopf zu einem 3D-Würfel.\n\n3. Wähle die Option unten, die eine gültige 3D-Perspektive dieses gefalteten Würfels darstellt.\n\n4. Vorsicht: Gegenüberliegende Flächen im Netz können in 3D nicht benachbart sein!';

  @override
  String get cubeNetFoldUnfoldedNet => 'UNGEFALTETES 2D-NETZ';

  @override
  String get cubeNetFoldWhichMatches => 'WELCHER WÜRFEL PASST?';

  @override
  String get cubeNetFoldIncorrect =>
      'Falsche Faltlogik! Tippe auf Reset oder ändere deine Wahl.';

  @override
  String get cubeNetFoldSubmitChoice => 'WAHL ABSENDEN';

  @override
  String get cubeNetFoldFailed => 'FEHLGESCHLAGEN (TIPP RESET)';

  @override
  String get faceTraitAssociationMemorize => 'MERKE DIR ALLE 4 PERSONEN';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return 'PERSON $current VON $total';
  }

  @override
  String get faceTraitAssociationWhatOccupation => 'WAS IST IHR BERUF?';

  @override
  String get faceTraitAssociationWhatHobby => 'WAS IST IHR HOBBY?';

  @override
  String get faceTraitAssociationWinTitle => 'GEDÄCHTNIS-MEISTER!';

  @override
  String get faceTraitAssociationLoseTitle => 'SPIEL VORBEI';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return 'Du hast $correct von $total richtig.';
  }

  @override
  String get topologyTitle => 'TOPOLOGIE';

  @override
  String get topologySubtitle =>
      'Sind diese Formen topologisch äquivalent? (Kann eine ohne Schneiden oder Kleben in die andere verformt werden?)';

  @override
  String get topologyWinTitle => 'GEOMETRIE-GENIE!';

  @override
  String get topologyWinMessage =>
      'Du hast 10 topologische Paare korrekt identifiziert!';

  @override
  String get topologyScore => 'PUNKTE: ';

  @override
  String get semanticDistanceTitle => 'Semantische Distanz';

  @override
  String get semanticDistanceSubtitle =>
      'Messen Sie die konzeptionelle Distanz zwischen Wörtern';

  @override
  String get oxymoronHuntTitle => 'Oxymoron-Jagd';

  @override
  String get oxymoronHuntSubtitle =>
      'Paaren Sie widersprüchliche Wörter im Gitter';

  @override
  String get portmanteauSplitTitle => 'Kofferwort-Trennung';

  @override
  String get portmanteauSplitSubtitle =>
      'Identifizieren Sie die Quellwörter eines Kofferworts';

  @override
  String get chainReactionTitle => 'Kettenreaktion';

  @override
  String get chainReactionSubtitle =>
      'Verbinden Sie Wörter mit überlappenden Buchstaben';

  @override
  String get rhymeMasterTitle => 'Reim-Meister';

  @override
  String get rhymeMasterSubtitle =>
      'Identifizieren Sie Wörter, die sich auf das Zielwort reimen';

  @override
  String get definitionDashTitle => 'Definitionssprint';

  @override
  String get definitionDashSubtitle =>
      'Ordnen Sie das richtige Wort seiner Definition zu';

  @override
  String get syllableStackTitle => 'Silbenstapel';

  @override
  String get syllableStackSubtitle =>
      'Stapeln Sie Silben, um vollständige Wörter zu bilden';

  @override
  String get sentenceUnscrambleTitle => 'Satz-Entwirrung';

  @override
  String get sentenceUnscrambleSubtitle =>
      'Bringen Sie Wörter in die richtige Reihenfolge, um einen gültigen Satz zu bilden';

  @override
  String get grammarSortTitle => 'Grammatik-Sortierung';

  @override
  String get grammarSortSubtitle =>
      'Kategorisieren Sie Wörter nach ihrer Wortart';

  @override
  String get vowelReconstructTitle => 'Vokal-Rekonstruktion';

  @override
  String get vowelReconstructSubtitle =>
      'Füllen Sie die fehlenden Vokale im Satz aus';

  @override
  String get consonantReconstructTitle => 'Konsonanten-Rekonstruktion';

  @override
  String get consonantReconstructSubtitle =>
      'Füllen Sie die fehlenden Konsonanten im Satz aus';

  @override
  String get homophoneHuntTitle => 'Homophon-Jagd';

  @override
  String get silentLetterSearchTitle => 'Suche nach stummen Buchstaben';

  @override
  String get silentLetterSearchSubtitle =>
      'Identifizieren Sie stumme Buchstaben in den angegebenen Wörtern';

  @override
  String get palindromeBuilderTitle => 'Palindrom-Ersteller';

  @override
  String get palindromeBuilderSubtitle =>
      'Erstellen Sie ein Palindrom durch Hinzufügen minimaler Buchstaben';

  @override
  String get phoneticGuessTitle => 'Phonetisches Rätsel';

  @override
  String get phoneticGuessSubtitle =>
      'Identifizieren Sie das Wort anhand seiner phonetischen Schreibweise';

  @override
  String get spoonerismSolverTitle => 'Schüttelreim-Löser';

  @override
  String get spoonerismSolverSubtitle =>
      'Identifizieren Sie den richtigen Schüttelreim für den Ausdruck';

  @override
  String get etymonOddballTitle => 'Etymologischer Außenseiter';

  @override
  String get etymonOddballSubtitle =>
      'Finden Sie das Wort, das nicht denselben Stamm hat';

  @override
  String get etymologyOriginTitle => 'Etymologischer Ursprung';

  @override
  String get etymologyOriginSubtitle =>
      'Erraten Sie die Ursprungssprache des Lehnworts';

  @override
  String get affixFactoryTitle => 'Affix-Fabrik';

  @override
  String get affixFactorySubtitle =>
      'Erstellen Sie gültige Wörter mit Präfixen und Suffixen';

  @override
  String get cognateCatchTitle => 'Kognaten-Fang';

  @override
  String get cognateCatchSubtitle =>
      'Unterscheiden Sie zwischen echten Kognaten und falschen Freunden';

  @override
  String get compoundConnectTitle => 'Zusammensetzung';

  @override
  String get compoundConnectSubtitle =>
      'Kombinieren Sie zwei Wörter zu einem zusammengesetzten Wort';

  @override
  String get pangramSprintTitle => 'Pangramm-Sprint';

  @override
  String get pangramSprintSubtitle =>
      'Bilden Sie einen Satz mit jedem Buchstaben des Alphabets';

  @override
  String get anagramDefinitionTitle => 'Anagramm-Definition';

  @override
  String get anagramDefinitionSubtitle =>
      'Lösen Sie das Anagramm basierend auf seiner Definition';

  @override
  String get letterBridgeTitle => 'Buchstabenbrücke';

  @override
  String get letterBridgeSubtitle =>
      'Finden Sie den fehlenden Buchstaben, der zwei Wörter verbindet';

  @override
  String get letterFrequencyScanTitle => 'Buchstabenfrequenz-Scan';

  @override
  String get letterFrequencyScanSubtitle =>
      'Zählen Sie, wie oft ein Buchstabe im Text vorkommt';

  @override
  String get oneLetterShiftTitle => 'Ein-Buchstaben-Verschiebung';

  @override
  String get oneLetterShiftSubtitle =>
      'Transformieren Sie ein Wort in ein anderes durch Ändern eines Buchstabens';

  @override
  String vocabularyBuilderMessage(String arg0) {
    return 'Gute Arbeit! Ihr Wortschatz ist beeindruckend. Punktzahl: $arg0';
  }

  @override
  String get symmetryMessage =>
      'Sie haben das Muster mit chirurgischer Präzision perfekt gespiegelt.';

  @override
  String get temporalOrderMessage =>
      'Unglaublich! Ihr zeitliches Sequenzgedächtnis ist hochpräzise.';

  @override
  String get temporalOrderMessage1 =>
      'Falsches Sequenzgedächtnis. Übung macht den Meister!';

  @override
  String get wordSearchMessage =>
      'Alle Wörter wurden mit scharfer Beobachtungsgabe erfolgreich gefunden.';

  @override
  String colorMatchMessage(String arg0) {
    return 'Ihre Genauigkeit: $arg0%';
  }

  @override
  String semanticLinkMessage(String arg0) {
    return 'Sie haben $arg0 Punkte erzielt!';
  }

  @override
  String reflexTapMessage(String arg0) {
    return 'Sie haben $arg0 Ziele getroffen!';
  }

  @override
  String get angleFinderMessage => 'Ihre geometrische Intuition ist perfekt!';

  @override
  String angleFinderMessage1(String arg0) {
    return 'Die richtige Antwort war $arg0°';
  }

  @override
  String angleFinderText(String arg0) {
    return '$arg0°';
  }

  @override
  String visualStatisticalLearningMessage(String arg0) {
    return 'Sie haben $arg0 korrekte Muster erzielt!';
  }

  @override
  String nonogramText(String arg0) {
    return 'Fehler: $arg0';
  }

  @override
  String mentalCalendarMessage(String arg0) {
    return 'Sie haben $arg0 von 10 richtig beantwortet!';
  }

  @override
  String orbitTapMessage(String arg0) {
    return 'Sie haben erfolgreich $arg0 Mal getippt!';
  }

  @override
  String schulteTableMessage(String arg0) {
    return 'Sie haben die Tabelle in $arg0 abgeschlossen.\nÜben Sie weiter, um Ihr peripheres Sehen zu erweitern!';
  }

  @override
  String get schulteTableText => 'TEST STARTEN';

  @override
  String get relationalMemoryMessage =>
      'Fabelhafte Genauigkeit des räumlichen Beziehungsgedächtnisses!';

  @override
  String sudokuText(String arg0) {
    return 'Fehler: $arg0';
  }

  @override
  String sdmtMessage(String arg0) {
    return 'Sie haben $arg0 Symbole zugeordnet! Dieser Test misst Ihre Scangeschwindigkeit und visuelle Aufmerksamkeit.';
  }

  @override
  String get futoshikiMessage =>
      'Unglaublich! Sie haben das Futoshiki-Lateinquadrat gelöst.';

  @override
  String letterFrequencyScanMessage(String arg0, String arg1) {
    return 'Sie haben $arg0 Vorkommen von \"$arg1\" korrekt gezählt.';
  }

  @override
  String letterFrequencyScanText(String arg0) {
    return 'Falsch. Die Anzahl war $arg0.';
  }

  @override
  String get memoryMatrixMessage =>
      'Beeindruckend! Ihr Arbeitsgedächtnis ist scharf. Tagesziel erreicht!';

  @override
  String get memoryMatrixMessage1 =>
      'Konzentrieren Sie sich und versuchen Sie es erneut, um Ihren Gedächtnis-Score zu verbessern.';

  @override
  String get contextCluesMessage =>
      'Außergewöhnlich! Ihr Wortschatz und Ihre Kontextanalyse sind erstklassig.';

  @override
  String get contextCluesMessage1 =>
      'Falsches Wort gewählt! Trainieren Sie Ihr sprachliches Kontextverständnis und versuchen Sie es erneut.';

  @override
  String oneLetterShiftMessage(String arg0, String arg1) {
    return 'Sie haben $arg0 korrekt in $arg1 verschoben.';
  }

  @override
  String get mentalAbacusMessage => 'Ihre Kopfrechenkunst ist erstklassig.';

  @override
  String fractionMatcherMessage(String arg0) {
    return 'Sie haben $arg0 Punkte erzielt, indem Sie Darstellungen zugeordnet haben!';
  }

  @override
  String get spellingSprintMessage =>
      'Sie haben alle 10 Wörter korrekt buchstabiert!';

  @override
  String spellingSprintMessage1(String arg0) {
    return 'Sie haben $arg0 Wörter buchstabiert.';
  }

  @override
  String stopSignalMessage(String arg0) {
    return 'Sie haben $arg0 korrekte Antworten erzielt! Dieser Test misst Ihre Fähigkeit, eine geplante Aktion zu hemmen.';
  }

  @override
  String grammarPoliceMessage(String arg0) {
    return 'Spiel vorbei! Sie haben die Ordnung in der Welt der Grammatik aufrechterhalten. Punktzahl: $arg0';
  }

  @override
  String consonantReconstructMessage(String arg0) {
    return 'Sie haben eine Punktzahl von $arg0 rekonstruiert!';
  }

  @override
  String rhymeMasterMessage(String arg0, String arg1) {
    return 'Sie haben $arg0 von $arg1 Reimen gefunden!';
  }

  @override
  String vigilanceTaskMessage(String arg0, String arg1, String arg2) {
    return 'Treffer: $arg0, Fehler: $arg1\nFehlalarme: $arg2';
  }

  @override
  String get silhouetteMatchOrthoMessage =>
      'Sie haben makellose Fähigkeiten zur orthografischen Ausrichtung!';

  @override
  String get silhouetteMatchOrthoText => 'VERSTANDEN';

  @override
  String get silhouetteMatchOrthoText1 =>
      'Falsche Perspektivprojektion! Tippen Sie auf Reset, um es erneut zu versuchen.';

  @override
  String fibonacciMergeMessage(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String factorFinderMessage(String arg0) {
    return 'Sie haben $arg0 Punkte erzielt, indem Sie alle Faktoren gefunden haben!';
  }

  @override
  String logicalSyllogismsMessage(String arg0) {
    return 'Sie haben $arg0 Syllogismen korrekt gelöst!';
  }

  @override
  String get rotatingMazeMessage =>
      'Sie haben das kinetisch rotierende Labyrinth erfolgreich navigiert!';

  @override
  String get rotatingMazeText => 'VERSTANDEN';

  @override
  String get rotatingMazeText1 =>
      '🌀 Labyrinth um 90° gedreht! Gitter verschoben!';

  @override
  String get mathPathMessage =>
      'Sie haben den Pfad gefunden, der die Zielsumme ergibt!';

  @override
  String get bridgesMessage => 'Sie haben alle Inseln erfolgreich verbunden!';

  @override
  String compoundConnectMessage(String arg0, String arg1) {
    return 'Das zusammengesetzte Wort ist $arg0$arg1.';
  }

  @override
  String get pangramSprintMessage =>
      'Sie haben einen Satz mit allen 26 Buchstaben gebildet.';

  @override
  String get mirrorImageMessage =>
      'Sie haben die Spiegelung perfekt identifiziert.';

  @override
  String get mirrorImageText => 'SPIEGELBILD';

  @override
  String reverseStroopMessage(String arg0) {
    return 'Sie haben $arg0 Punkte erzielt! Behalten Sie die Anweisungen im Auge.';
  }

  @override
  String get verbalAnalogiesMessage =>
      'Sie haben einen scharfen Verstand für Beziehungen.';

  @override
  String corsiBlocksMessage1(String arg0, String arg1) {
    return 'Sie haben sich an $arg1 Sequenzen erinnert! Ihre räumliche Gedächtnisspanne erreichte $arg0.';
  }

  @override
  String wordLadderMessage(String arg0, String arg1, String arg2) {
    return 'Sie haben $arg0 in $arg2 Schritten erfolgreich mit $arg1 verbunden.';
  }

  @override
  String d2AttentionMessage(String arg0) {
    return 'Unglaubliches selektives Scannen! Endpunktzahl: $arg0.';
  }

  @override
  String get d2AttentionText => 'WIE MAN SPIELT';

  @override
  String get d2AttentionText1 => 'VERSTANDEN';

  @override
  String get tangleFixMessage => 'Alle Linien sind klar und glatt.';

  @override
  String get distractorMatrixMessage =>
      'Unglaublich! Sie haben sich trotz kognitiver Mathe-Distraktoren an Muster erinnert!';

  @override
  String get distractorMatrixMessage1 =>
      'Die Distraktoren haben Sie erwischt! Trainieren Sie Ihr Arbeitsgedächtnis erneut.';

  @override
  String sentenceUnscrambleMessage(String arg0) {
    return 'Sie haben eine Punktzahl von $arg0 entschlüsselt!';
  }

  @override
  String get kakuroMessage =>
      'Unglaublich! Sie haben alle Summenabschnitte perfekt zugeordnet.';

  @override
  String symbolicFlankerMessage(String arg0, String arg1) {
    return 'Sie haben $arg0 von $arg1 richtig beantwortet!';
  }

  @override
  String stroopTestMessage(String arg0) {
    return 'Sie haben $arg0 richtig gelöst! Konzentrieren Sie sich auf die Farbe der Tinte, nicht auf das Wort.';
  }

  @override
  String wisconsinCardSortingMessage(String arg0) {
    return 'Sie haben $arg0 Karten korrekt sortiert!';
  }

  @override
  String nBackMessage(String arg0) {
    return 'Sie haben $arg0 2-Back-Übereinstimmungen erzielt! Ihr Arbeitsgedächtnis ist lebenswichtig für Multitasking.';
  }

  @override
  String rhythmMasterMessage(String arg0, String arg1) {
    return 'Sie haben $arg0 perfekte Treffer und $arg1 Punkte erzielt!';
  }

  @override
  String groceryListMessage(String arg0, Object score) {
    return 'Sie haben $arg0 Punkte in der Einkaufsliste erzielt!';
  }

  @override
  String get groceryListText => 'BEREIT';

  @override
  String get mirrorTracingMessage =>
      'Ihr Gehirn hat seine Koordination erfolgreich neu verschaltet.';

  @override
  String moduloClockMessage(String arg0) {
    return 'Exzellente modulare Kopfrechen-Koordination! Punktzahl: $arg0';
  }

  @override
  String moduloClockMessage1(String arg0, String arg1, String arg2) {
    return 'Sie haben $arg0 von $arg1 modularen Uhrenlösungen geschafft. Punktzahl: $arg2';
  }

  @override
  String get crownMessage =>
      'Alle Kronen wurden erfolgreich mit perfekter Logik platziert.';

  @override
  String dualCodingMessage(String arg0) {
    return 'Fantastische Dual-Task-Leistung! Ihr Arbeitsgedächtnis-Score: $arg0';
  }

  @override
  String inequalityDashMessage(String arg0) {
    return 'Sie haben $arg0 Punkte beim Zuordnen von Ungleichungen erzielt!';
  }

  @override
  String sourceMonitoringMessage(String arg0, String arg1) {
    return 'Sie haben $arg0 von $arg1 richtig beantwortet!';
  }

  @override
  String get sourceMonitoringText => 'RÜCKRUF STARTEN';

  @override
  String get memoryPalaceText => 'VERFÜGBARE WÖRTER';

  @override
  String target10Message(String arg0) {
    return 'Sie haben $arg0 Punkte erzielt, indem Sie Zahlen zu 10 zugeordnet haben!';
  }

  @override
  String get paperFoldingMessage =>
      'Sie können die Muster in Ihrem Geist sehen.';

  @override
  String topologyText(String arg0, String arg1) {
    return '$arg0$arg1 / 10';
  }

  @override
  String get waterSortMessage => 'Sie haben alle Farben perfekt sortiert!';

  @override
  String anagramDefinitionMessage(String arg0) {
    return 'Das Wort war tatsächlich \"$arg0\".';
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
    return 'Sie haben $arg0 korrekte Schätzungen vorgenommen.';
  }

  @override
  String grammarSortMessage(String arg0) {
    return 'Sie haben $arg0 Wörter korrekt sortiert!';
  }

  @override
  String vowelReconstructMessage(String arg0) {
    return 'Sie haben eine Punktzahl von $arg0 rekonstruiert!';
  }

  @override
  String spatialConflictMessage(String arg0, String arg1) {
    return 'Sie haben eine Punktzahl von $arg0 mit $arg1 Fehlern erreicht!';
  }

  @override
  String get spatialConflictText => 'WIE MAN SPIELT';

  @override
  String get spatialConflictText1 => 'VERSTANDEN';

  @override
  String tracePathMessage(String arg0) {
    return 'Ihre Genauigkeit betrug $arg0%!';
  }

  @override
  String ruleSwitcherMessage(String arg0, String arg1) {
    return 'Sie haben $arg0 von $arg1 richtig gelöst!';
  }

  @override
  String collatzMessage(String arg0, String arg1) {
    return 'Sie haben $arg0 Schritte benötigt. Das Minimum war $arg1.';
  }

  @override
  String get collatzText => '/ 2';

  @override
  String get collatzText1 => '+ 1';

  @override
  String get collatzText2 => '3n + 1';

  @override
  String divisibilityDashMessage(String arg0) {
    return 'Sie haben $arg0 Zahlen gelöst!';
  }

  @override
  String switchTaskMessage(String arg0) {
    return 'Sie haben $arg0 richtig gelöst! Schnelles Umschalten ist der Schlüssel zur mentalen Flexibilität.';
  }

  @override
  String sequenceSleuthMessage(String arg0) {
    return 'Sie haben $arg0 Sequenzen gelöst!';
  }

  @override
  String changeBlindnessMessage(String arg0) {
    return 'Sie haben $arg0 Änderungen gefunden!';
  }

  @override
  String mentalRotationMessage(String arg0) {
    return 'Sie haben $arg0 Formen korrekt gedreht!';
  }

  @override
  String wordMastermindMessage(String arg0) {
    return 'Sie haben den Code gemeistert!\nDas Wort war: $arg0';
  }

  @override
  String wordMastermindMessage1(String arg0) {
    return 'Das versteckte Wort war: $arg0';
  }

  @override
  String wordMastermindText(String arg0) {
    return '$arg0';
  }

  @override
  String get simonSequenceMessage => 'Sie haben sich alle 10 Kacheln gemerkt!';

  @override
  String get simonSequenceMessage1 =>
      'Versuchen Sie es erneut, um die Sequenz zu meistern.';

  @override
  String oxymoronHuntMessage(String arg0) {
    return 'Sie haben $arg0 Oxymora gefunden!';
  }

  @override
  String spotlightTrackMessage(String arg0) {
    return 'Unglaubliches räumliches Tracking! Sie haben $arg0 Punkte erzielt.';
  }

  @override
  String get spotlightTrackText => 'WIE MAN SPIELT';

  @override
  String get spotlightTrackText1 => 'VERSTANDEN';

  @override
  String get spotlightTrackText2 => 'RUNDE STARTEN';

  @override
  String vennNumbersMessage(String arg0) {
    return 'Sie haben $arg0 Zahlen kategorisiert!';
  }

  @override
  String get vennNumbersText => 'KEINES';

  @override
  String get vennNumbersText1 => 'BEIDE';

  @override
  String get silhouetteMatchMessage =>
      'Ihr Gehirn ist hervorragend in der 3D-zu-2D-Übersetzung.';

  @override
  String sumSnakeMessage(String arg0) {
    return 'Ziel $arg0 mit perfekter Präzision erreicht!';
  }

  @override
  String get sumSnakeText => 'PFAD LÖSCHEN';

  @override
  String percentagePeakMessage(String arg0) {
    return 'Sie haben $arg0 Prozentaufgaben gelöst!';
  }

  @override
  String trailMakingMessage(String arg0) {
    return 'Sie haben $arg0 Pfade abgeschlossen! Dieser Test misst Ihre visuelle Suchgeschwindigkeit und mentale Flexibilität.';
  }

  @override
  String matrixReasoningMessage(String arg0) {
    return 'Sie haben $arg0 Matrizen korrekt ausgefüllt!';
  }

  @override
  String get tentsAndTreesMessage =>
      'Sie haben alle Zelte erfolgreich platziert.';

  @override
  String klotskiMessage(String arg0) {
    return 'Sensationelles Schieben! Sie haben den Hero-Block in $arg0 Zügen befreit.';
  }

  @override
  String sumPyramidMessage(String arg0) {
    return 'Sie haben $arg0 Summenpyramiden erfolgreich gelöst!';
  }

  @override
  String simonCommandMessage(String arg0) {
    return 'Exzellente selektive Reaktion und Fokus! Gesamtpunktzahl: $arg0';
  }

  @override
  String simonCommandMessage1(String arg0, String arg1) {
    return 'Sie haben $arg0 erzielt, aber $arg1 Übereinstimmungen nicht rechtzeitig erreicht.';
  }

  @override
  String syllableStackMessage(String arg0) {
    return 'Sie haben eine Punktzahl von $arg0 gesammelt!';
  }

  @override
  String get slitherlinkMessage =>
      'Klasse! Sie haben das Schleifenrätsel erfolgreich gelöst.';

  @override
  String quickMathMessage(String arg0) {
    return 'Sie haben $arg0 Aufgaben gelöst!';
  }

  @override
  String commonDenominatorMessage(String arg0) {
    return 'Sie haben $arg0 GGT/KGV-Aufgaben gelöst!';
  }

  @override
  String chainReactionMessage(String arg0, String arg1) {
    return 'Ihre Endpunktzahl ist $arg0. Sie haben eine Kette von $arg1 Wörtern gebildet.';
  }

  @override
  String chainReactionText(String arg0) {
    return '$arg0';
  }

  @override
  String get associativePairsMessage =>
      'Brillant! Sie haben visuelle Merkmale fehlerfrei zugeordnet.';

  @override
  String get associativePairsMessage1 =>
      'Falsche Zuordnung! Schärfen Sie Ihr Verknüpfungsgedächtnis und versuchen Sie es erneut.';

  @override
  String portmanteauSplitMessage(String arg0) {
    return 'Sie haben $arg0 Kofferwörter getrennt!';
  }

  @override
  String get magicSquaresText => 'LÖSCHEN';

  @override
  String alphabetSudokuText(String arg0) {
    return 'Fehler: $arg0';
  }

  @override
  String get pipesMessage =>
      'Sie haben alle Rohre verbunden und das Gitter gefüllt.';

  @override
  String get dualMirrorMessage =>
      'Sie haben beide Symbole zu ihren Zielen navigiert!';

  @override
  String binaryCodeMessage(String arg0) {
    return 'Sensationelle schnelle Dezimalübersetzung! Endpunktzahl: $arg0';
  }

  @override
  String binaryCodeMessage1(String arg0, String arg1) {
    return 'Sie haben $arg0 Binärzahlen korrekt umgewandelt. Punktzahl: $arg1';
  }

  @override
  String oddOneOutMessage(String arg0) {
    return 'Sie haben 50 Außenseiter gefunden! Endpunktzahl: $arg0';
  }

  @override
  String oddOneOutMessage1(String arg0) {
    return 'Ihre Punktzahl: $arg0';
  }

  @override
  String letterBridgeMessage(String arg0) {
    return 'Sie haben den Brückenbuchstaben gefunden: $arg0';
  }

  @override
  String get imReady => 'ICH BIN BEREIT';

  @override
  String get soptTitle => 'Selbstgeordnetes Zeigen';

  @override
  String get soptSubtitle =>
      'Tippen Sie jedes Mal auf eine andere Karte. Die Positionen werden neu gemischt!';

  @override
  String get soptWinTitle => 'Sequenzmeister!';

  @override
  String soptGameOverMessage(int score) {
    return 'Sie haben $score Punkte erzielt, indem Sie die gemischten Karten erfolgreich verfolgt haben!';
  }

  @override
  String get soptChooseNovel => 'Tippen Sie auf eine neue Karte';

  @override
  String get soptGreatJob => 'Tolle Arbeit!';

  @override
  String get soptAlreadyTapped => 'Bereits getippt!';

  @override
  String get soptGrid => 'Netz';

  @override
  String get contRecogTitle => 'Kontinuierliche Anerkennung';

  @override
  String get contRecogSubtitle =>
      'Haben Sie diese Karte schon einmal in dieser Sitzung gesehen?';

  @override
  String get contRecogWinTitle => 'Anerkennungsgenie!';

  @override
  String contRecogGameOverMessage(int score) {
    return 'Sie haben $score richtige Anerkennungen erzielt!';
  }

  @override
  String get contRecogCorrect => 'Richtig!';

  @override
  String get contRecogWrong => 'Falsch!';

  @override
  String get contRecogOldOrNew => 'Ist das alt oder neu?';

  @override
  String get contRecogNew => 'Neu';

  @override
  String get contRecogOld => 'Alt';

  @override
  String get contRecogSeenPool => 'Pool gesehen';

  @override
  String get dnmsTitle => 'Nicht passender Speicher';

  @override
  String get dnmsSubtitle =>
      'Tippen Sie auf die Karte, die nicht in der gespeicherten Probe enthalten war.';

  @override
  String get dnmsWinTitle => 'Nicht passender Experte!';

  @override
  String dnmsGameOverMessage(int score) {
    return 'Sie haben in der Kategorie „Verzögerte Nichtübereinstimmung“ $score richtige Antworten erzielt!';
  }

  @override
  String get dnmsChooseNovel => 'Tippen Sie auf die neue Karte';

  @override
  String get dnmsMemorizeSample => 'Merken Sie sich diese Karte';

  @override
  String get dnmsWaitForIt => 'Warte darauf...';

  @override
  String get dnmsExcellent => 'Exzellent!';

  @override
  String get dnmsSampleTapped => 'Das war die Probe!';

  @override
  String get dnmsCards => 'Karten';

  @override
  String get symSpanTitle => 'Symmetriespanne';

  @override
  String get symSpanSubtitle =>
      'Erinnern Sie sich an Zellmuster und identifizieren Sie gleichzeitig die vertikale Symmetrie.';

  @override
  String get symSpanWinTitle => 'Meister der Symmetrie!';

  @override
  String symSpanGameOverMessage(int score) {
    return 'Sie haben $score -Punkte erzielt, indem Sie sich an Layouts erinnert und Symmetrien erkannt haben!';
  }

  @override
  String get symSpanMemorizeRed =>
      'Merken Sie sich die Position der roten Blutkörperchen';

  @override
  String get symSpanIsSymmetric => 'Ist das Muster symmetrisch?';

  @override
  String get symSpanRecallSequence =>
      'Rufen Sie die Reihenfolge in der richtigen Reihenfolge auf';

  @override
  String get symSpanGreatJob => 'Tolle Arbeit!';

  @override
  String get symSpanTryAgain => 'Versuchen Sie es erneut!';

  @override
  String get symSpanLength => 'Länge';

  @override
  String get readingSpanTitle => 'Lesespanne';

  @override
  String get readingSpanSubtitle =>
      'Überprüfen Sie Sätze, während Sie sich eine Buchstabenfolge merken.';

  @override
  String get readingSpanWinTitle => 'Leseexperte!';

  @override
  String readingSpanGameOverMessage(int score) {
    return 'Du hast $score Punkte bei der Lesespannen-Gedächtnis-Challenge erreicht!';
  }

  @override
  String get readingSpanTrueFalse => 'Ist diese Aussage wahr oder falsch?';

  @override
  String get readingSpanMemorizeLetter => 'Merken Sie sich diesen Brief';

  @override
  String get readingSpanRecallLetters =>
      'Erinnern Sie sich an die Buchstaben der Reihe nach';

  @override
  String get readingSpanGreatJob => 'Tolle Arbeit!';

  @override
  String get readingSpanTryAgain => 'Versuchen Sie es erneut!';

  @override
  String readingSpanYourSequence(String sequence) {
    return 'Ihre Sequenz: $sequence';
  }

  @override
  String get readingSpanLength => 'Länge';

  @override
  String get readingSpanSentence1 => 'Die Sonne geht im Osten auf.';

  @override
  String get readingSpanSentence2 => 'Eis ist kochend heiß.';

  @override
  String get readingSpanSentence3 => 'Fische können unter Wasser atmen.';

  @override
  String get readingSpanSentence4 => 'Hunde haben Flügel und können fliegen.';

  @override
  String get readingSpanSentence5 => 'Wasser gefriert bei 0 Grad Celsius.';

  @override
  String get readingSpanSentence6 => 'Katzen bellen wie kleine Hunde.';

  @override
  String get readingSpanSentence7 => 'Bäume haben im Sommer grüne Blätter.';

  @override
  String get readingSpanSentence8 => 'Regen fällt vom Boden nach oben.';

  @override
  String get readingSpanSentence9 => 'Ein Dreieck hat vier gleiche Seiten.';

  @override
  String get readingSpanSentence10 => 'Äpfel gehören zu den süßen Früchten.';

  @override
  String get readingSpanSentence11 => 'Der Mond besteht aus Cheddar-Käse.';

  @override
  String get readingSpanSentence12 => 'Autos haben Räder zum Rollen.';

  @override
  String get readingSpanSentence13 => 'Feuer ist eiskalt.';

  @override
  String get readingSpanSentence14 =>
      'Papier wird aus verarbeitetem Holz hergestellt.';

  @override
  String get readingSpanSentence15 =>
      'Vögel haben Federn, die ihnen beim Fliegen helfen.';

  @override
  String get readingSpanSentence16 => 'Bananen wachsen auf Kiefern.';

  @override
  String get readingSpanSentence17 =>
      'Ein Elefant ist kleiner als eine Ameise.';

  @override
  String get readingSpanSentence18 => 'Bücher enthalten gedruckte Textseiten.';

  @override
  String get countingSpanTitle => 'Zählspanne';

  @override
  String get countingSpanSubtitle =>
      'Zählen Sie nur blaue Kreise. Erinnern Sie sich dann an die Zählfolge.';

  @override
  String get countingSpanWinTitle => 'Zählgenie!';

  @override
  String countingSpanGameOverMessage(int score) {
    return 'Sie haben bei der Counting Span-Gedächtnis-Challenge $score -Punkte erzielt!';
  }

  @override
  String get countingSpanCountCircles => 'Zählen Sie nur blaue Kreise';

  @override
  String get countingSpanRecallCounts =>
      'Der Rückruf zählt in der richtigen Reihenfolge';

  @override
  String get countingSpanGreatJob => 'Tolle Arbeit!';

  @override
  String get countingSpanTryAgain => 'Versuchen Sie es erneut!';

  @override
  String countingSpanYourSequence(String sequence) {
    return 'Ihre Sequenz: $sequence';
  }

  @override
  String get countingSpanLength => 'Länge';

  @override
  String get objDispTitle => 'Objektverschiebung';

  @override
  String get objDispSubtitle =>
      'Layout auswendig lernen. Suchen Sie das eine Objekt, das seine Position ändert, und tippen Sie darauf.';

  @override
  String get objDispWinTitle => 'Räumliches Genie!';

  @override
  String objDispGameOverMessage(int score) {
    return 'Sie haben $score verschobene Objekte richtig identifiziert!';
  }

  @override
  String get objDispMemorizeAll => 'Merken Sie sich alle Platzierungen';

  @override
  String get objDispWaitingShift => 'Warten auf Layout-Änderung...';

  @override
  String get objDispTapMoved =>
      'Tippen Sie auf das Objekt, das sich bewegt hat';

  @override
  String get objDispExcellent => 'Exzellent!';

  @override
  String get objDispWrongObject => 'Falsches Objekt!';

  @override
  String get objDispItems => 'Artikel';

  @override
  String get mandalaTitle => 'Mandala-Rückruf';

  @override
  String get mandalaSubtitle =>
      'Farbkonfiguration merken. Wählen Sie Farben und streichen Sie die Fliesen neu.';

  @override
  String get mandalaWinTitle => 'Mandala-Künstler!';

  @override
  String mandalaGameOverMessage(int score) {
    return 'Sie haben $score -Punkte erzielt, indem Sie farbige geometrische Layouts nachgebildet haben!';
  }

  @override
  String get mandalaMemorizeColors => 'Merken Sie sich die Fliesenfarben';

  @override
  String get mandalaPaintCells =>
      'Bemalen Sie die Zellen entsprechend dem Original';

  @override
  String get mandalaExcellent => 'Exzellent!';

  @override
  String get mandalaIncorrectMatch => 'Falsche Übereinstimmung!';

  @override
  String get mandalaSubmitRepaint => 'Repaint einreichen';

  @override
  String get mandalaTiles => 'Fliesen';

  @override
  String get runningSpanTitle => 'Laufspanne';

  @override
  String get runningSpanSubtitle =>
      'Achten Sie auf die Buchstaben. Wenn sie aufhören, geben Sie die letzten N Buchstaben der Reihe nach ein.';

  @override
  String get runningSpanWinTitle => 'Puffermeister!';

  @override
  String runningSpanGameOverMessage(int score) {
    return 'Du hast in „Running Memory Span“ $score Punkte erzielt!';
  }

  @override
  String runningSpanPrepareRecall(int count) {
    return 'Bereiten Sie sich darauf vor, die letzten $count Briefe abzurufen';
  }

  @override
  String get runningSpanWatchCarefully => 'Schauen Sie genau hin...';

  @override
  String runningSpanEnterLast(int count) {
    return 'Geben Sie die letzten $count Buchstaben ein';
  }

  @override
  String get runningSpanGreatJob => 'Tolle Arbeit!';

  @override
  String get runningSpanIncorrectBuffer => 'Falscher Puffer!';

  @override
  String runningSpanRecallLast(int count) {
    return 'Letzte $count zurückrufen';
  }

  @override
  String get runningSpanStopsRandomly => 'Der Stream stoppt zufällig!';

  @override
  String runningSpanEntered(String sequence) {
    return 'Eingegeben: $sequence';
  }

  @override
  String get runningSpanNItems => 'N-Artikel';

  @override
  String get spatialCabinetTitle => 'Raumschränke';

  @override
  String get spatialCabinetSubtitle =>
      'Merken Sie sich, welche Schrankschublade welches Objekt enthält.';

  @override
  String get spatialCabinetWinTitle => 'Kabinettsexperte!';

  @override
  String spatialCabinetGameOverMessage(int score) {
    return 'Sie haben im Spatial Cabinet Memory $score -Punkte erzielt!';
  }

  @override
  String get spatialCabinetMemorize =>
      'Merken Sie sich die Standorte der Gegenstände';

  @override
  String spatialCabinetWhereIs(String itemName) {
    return 'Wo ist der $itemName ?';
  }

  @override
  String get spatialCabinetCorrect => 'Richtig!';

  @override
  String get spatialCabinetWrongDrawer => 'Falsche Schublade!';

  @override
  String get spatialCabinetItems => 'Artikel';

  @override
  String get cabinetItemKey => 'Schlüssel';

  @override
  String get cabinetItemApple => 'Apfel';

  @override
  String get cabinetItemDiamond => 'Diamant';

  @override
  String get cabinetItemBook => 'Buch';

  @override
  String get cabinetItemUmbrella => 'Regenschirm';

  @override
  String get cabinetItemCoffee => 'Kaffee';

  @override
  String get cabinetItemLock => 'Sperren';

  @override
  String get cabinetItemPet => 'Haustier';

  @override
  String get cabinetItemCar => 'Auto';

  @override
  String get gamesTitleLabel => 'SPIELE';

  @override
  String get yourFavorites => 'DEINE FAVORITEN';

  @override
  String get readyForWorkout => 'BEREIT FÜR DEIN TÄGLICHES WORKOUT?';

  @override
  String get greatStartKeepGoing => 'GUTER START! MACH WEITER SO.';

  @override
  String get onFireToday => 'DU BIST HEUTE GUT DRAUF!';

  @override
  String get incredibleSolvingToday => 'UNGLAUBLICHE LÖSUNGEN HEUTE!';

  @override
  String get newGameLabel => 'NEU';

  @override
  String get slitherlinkTitle => 'Slitherlink';

  @override
  String get slitherlinkSubtitle =>
      'UMKREISE DAS STIFTGITTER MIT ZAHLENHINWEISEN.';

  @override
  String get futoshikiTitle => 'Futoshiki';

  @override
  String get futoshikiSubtitle => 'FÜLLE GITTER MIT GRÖSSER-ALS-HINWEISEN.';

  @override
  String get kakuroTitle => 'Kakuro';

  @override
  String get kakuroSubtitle => 'LÖSE KREUZWORTRÄTSEL MIT ZAHLEN UND SUMMEN.';

  @override
  String get inequalityDashTitle => 'Ungleichheits-Sprint';

  @override
  String get inequalityDashSubtitle => 'LÖSE UNGLEICHUNGEN UNTER ZEITDRUCK.';

  @override
  String get factorFinderTitle => 'Faktoren-Finder';

  @override
  String get factorFinderSubtitle =>
      'IDENTIFIZIERE ALLE FAKTOREN VON ZIELZAHLEN.';

  @override
  String get collatzTitle => 'Collatz-Pfad';

  @override
  String get collatzSubtitle => 'NAVIGIERE DURCH DIE 3N+1 SEQUENZ.';

  @override
  String get sumPyramidTitle => 'Summenpyramide';

  @override
  String get sumPyramidSubtitle => 'FÜLLE PYRAMIDENZELLEN MIT SUMMENHINWEISEN.';

  @override
  String get target10Title => 'Ziel 10';

  @override
  String get target10Subtitle =>
      'KOMBINIERE ZAHLENKACHELN, UM SUMMEN VON ZEHN ZU ERHALTEN.';

  @override
  String get fractionMatcherTitle => 'Bruche-Zuordner';

  @override
  String get fractionMatcherSubtitle => 'ORDNE ÄQUIVALENTE BRÜCHE VISUELL ZU.';

  @override
  String get dualCodingTitle => 'Duale Kodierung';

  @override
  String get dualCodingSubtitle =>
      'ORDNE BUCHSTABEN UND SYMBOLE GLEICHZEITIG ZU.';

  @override
  String get distractorMatrixTitle => 'Distraktoren-Matrix';

  @override
  String get distractorMatrixSubtitle => 'FINDE ZIELFORMEN UNTER DISTRAKTOREN.';

  @override
  String get temporalOrderTitle => 'Zeitliche Abfolge';

  @override
  String get temporalOrderSubtitle =>
      'ERINNERE DICH AN DIE CHRONOLOGISCHE REIHENFOLGE.';

  @override
  String get associativePairsTitle => 'Assoziative Paare';

  @override
  String get associativePairsSubtitle =>
      'PAARE UND ORDNE ENTSPRECHENDE SYMBOLE ZU.';

  @override
  String get blockCount3dTitle => '3D-Blockzählung';

  @override
  String get blockCount3dSubtitle => 'ZÄHLE BLÖCKE IM DREIDIMENSIONALEN RAUM.';

  @override
  String get rotatingMazeTitle => 'Rotierendes Labyrinth';

  @override
  String get rotatingMazeSubtitle =>
      'ROTIERE LABYRINTHE, UM BÄLLE ZUM AUSGANG ZU FÜHREN.';

  @override
  String get silhouetteMatchOrthoTitle => 'Silhouetten-Abgleich (Ortho)';

  @override
  String get silhouetteMatchOrthoSubtitle =>
      'GLEICHE 3D-OBJEKTE WITH ORTHO-SCHATTEN AB.';

  @override
  String get spatialConflictTitle => 'Räumlicher Konflikt';

  @override
  String get spatialConflictSubtitle =>
      'LÖSE DISKREPANZEN ZWISCHEN TEXT UND RICHTUNG.';

  @override
  String get spotlightTrackTitle => 'Spotlight-Track';

  @override
  String get spotlightTrackSubtitle =>
      'VERFOLGE BLINKENDE ELEMENTE IN BEWEGTEN SCHATTEN.';

  @override
  String get d2AttentionTitle => 'd2-Aufmerksamkeit';

  @override
  String get d2AttentionSubtitle =>
      'TIPPE ZIELSYMBOLE NACH STRENGEN KRITERIEN AN.';

  @override
  String get dualMirrorTitle => 'Dual-Spiegel-Navigation';

  @override
  String get dualMirrorSubtitle =>
      'NAVIGIERE GLEICHZEITIG DURCH ZWEI LABYRINTHE.';

  @override
  String get contextCluesTitle => 'Kontexthinweise';

  @override
  String get contextCluesSubtitle =>
      'ERSCHLIESSE VERSTECKTE WÖRTER AUS KONTEXTHINWEISEN.';

  @override
  String get digitSpanReverseSubtitle =>
      'RUFE ZAHLENFOLGEN IN UMGEKEHRTER REIHENFOLGE AB.';

  @override
  String get faceNameAssociationSubtitle =>
      'ERINNERE DICH AN NAMEN FÜR VERSCHIEDENE GESICHTER.';

  @override
  String get staircaseMemorySubtitle =>
      'MERKE DIR BLÖCKE IN SCHRITTWEISER ABFOLGE.';

  @override
  String get choiceReactionTimeSubtitle =>
      'TIPPE SCHNELL AUF PASSENDE SCHALTFLÄCHEN.';

  @override
  String get attentionalBlinkSubtitle =>
      'ERFASSE SCHNELLE ZIELE IN BLINKENDEN STRÖMEN.';

  @override
  String get visualStatisticalLearningSubtitle =>
      'LERNE ZEITLICHE FORMMUSTER VISUELL.';

  @override
  String get sternbergTaskSubtitle =>
      'ERINNERE DICH, OB DAS SYMBOL IM GEDÄCHTNISSET WAR.';

  @override
  String get operationSpanSubtitle =>
      'LÖSE MATHE UND ERINNERE DICH AN BUCHSTABENFOLGEN.';

  @override
  String get continuousRecognitionTitle => 'Kontinuierliche Wiedererkennung';

  @override
  String get continuousRecognitionSubtitle =>
      'IDENTIFIZIERE, OB DIE KARTE ALT ODER NEU IST.';

  @override
  String get symmetrySpanTitle => 'Symmetrie-Spanne';

  @override
  String get symmetrySpanSubtitle =>
      'RUFE ZELLKOORDINATEN BEI SYMMETRIEENTSCHEIDUNGEN AB.';

  @override
  String get objectDisplacementTitle => 'Objektverschiebung';

  @override
  String get objectDisplacementSubtitle =>
      'STUDIERE PLATZIERUNGEN UND TIPPE DAS BEWEGTE OBJEKT AN.';

  @override
  String get mandalaRecallTitle => 'Mandala-Erinnerung';

  @override
  String get mandalaRecallSubtitle =>
      'MERKE DIR FARBKACHELN UND MAL MANDALAS NACH.';

  @override
  String get runningMemorySpanTitle => 'Laufende Merkspanne';

  @override
  String get runningMemorySpanSubtitle =>
      'ÜBERWACHE BUCHSTABEN UND RUFE DIE LETZTEN N ITEMS AB.';

  @override
  String get spatialCabinetMemoryTitle => 'Räumliche Schränke';

  @override
  String get spatialCabinetMemorySubtitle =>
      'MERKE DIR GEGENSTÄNDE HINTER SCHRANKTÜREN.';

  @override
  String get pathRecallSubtitle =>
      'MERKE DIR PFADAUSWAHLEN UND WIEDERHOLE SIE.';

  @override
  String get objectShuffleSubtitle => 'VERFOLGE GEGENSTÄNDE UNTER BECHERN.';

  @override
  String get groceryListSubtitle => 'MERKE DIR ARTIKEL AUF DER EINKAUFSLISTE.';

  @override
  String get quickMathSubtitle =>
      'LÖSE RECHENAUFGABEN IN HÖCHSTGESCHWINDIGKEIT.';

  @override
  String get mathGuessTitle => 'Mathe-Raten';

  @override
  String get mathGuessSubtitle => 'ERRATE DIE ZAHL INNERHALB VON 15 VERSUCHEN.';

  @override
  String get reflexTapSubtitle => 'TIPPE SO SCHNELL WIE MÖGLICH AUF REIZE.';

  @override
  String get pixelMimicSubtitle => 'AHME DESIGNMUSTER AUF PIXELGITTERN NACH.';

  @override
  String get simonSequenceSubtitle =>
      'WIEDERHOLE FORMFOLGEN AUS DEM GEDÄCHTNIS.';

  @override
  String get slidePuzzleSubtitle => 'ORDNE SCHIEBEPUZZLE-KACHELN NEU AN.';

  @override
  String get findWordTitle => 'Wort finden';

  @override
  String get schulteTableSubtitle =>
      'TIPPE ZAHLEN VON EINS BIS FÜNFUNDZWANZIG AN.';

  @override
  String get simonCommandTitle => 'Simon-Befehl';

  @override
  String get simonCommandSubtitle => 'FÜHRE SPRACHANWEISUNGEN SCHNELL AUS.';

  @override
  String get binaryCodeTitle => 'Binär-Tempo';

  @override
  String get binaryCodeSubtitle => 'ÜBERSETZE BINÄRCODES IN DEZIMALZAHLEN.';

  @override
  String get moduloClockTitle => 'Modulo-Uhr';

  @override
  String get moduloClockSubtitle => 'BERECHNE MATHEAUFGABEN MIT UHREN.';

  @override
  String get chimpTestTitle => 'Schimpansen-Test';

  @override
  String get chimpTestSubtitle =>
      'TIPPE ZUFÄLLIGE ZAHLEN IN AUFSTEIGENDER REIHENFOLGE AN.';

  @override
  String get relationalMemoryTitle => 'Relationales Gedächtnis';

  @override
  String get relationalMemorySubtitle =>
      'ERINNERE DICH AN EXAKTE GITTERPOSITIONEN.';

  @override
  String get factBinderTitle => 'Fakten-Binder';

  @override
  String get factBinderSubtitle => 'VERKNÜPFE SYMBOLE UND RUFE AUSSAGEN AB.';

  @override
  String get sourceMonitoringTitle => 'Quellenüberwachung';

  @override
  String get sourceMonitoringSubtitle => 'ERINNERE DICH AN DEN KONTEXT.';

  @override
  String get klotskiTitle => 'Klotski-Flucht';

  @override
  String get klotskiSubtitle =>
      'VERSCHIEBE BLÖCKE, UM DEN AUSGANG ZU ERREICHEN.';

  @override
  String get homophoneHuntSubtitle =>
      'Wählen Sie das korrekt geschriebene Homophon';

  @override
  String get laserLinkTitle => 'Laser-Link';

  @override
  String get laserLinkSubtitle =>
      'Drehe Spiegel, um Laser zu reflektieren und alle Ziele zu aktivieren.';

  @override
  String get laserLinkCongrats =>
      'Präzisionsreflexion! Du hast das gesamte Gitter erfolgreich mit Strom versorgt.';

  @override
  String get crossSectionSliceTitle => 'Querschnitts-Schnitt';

  @override
  String get crossSectionSliceSubtitle =>
      'Identifiziere den richtigen 2D-Querschnitt eines 3D-Objekts aus einem bestimmten Winkel.';

  @override
  String get crossSectionSliceCongrats =>
      'Unglaubliche 3D-Visualisierung! Du hast direkt durch diese Form gesehen.';

  @override
  String get shadowPivotTitle => 'Schatten-Drehpunkt';

  @override
  String get shadowPivotCongrats =>
      'Dynamisches räumliches Vorstellungsvermögen! Du hast Licht und Schatten gemeistert.';

  @override
  String get shadowPivotSubtitle =>
      'Sagt den Schatten voraus, den ein 3D-Objekt wirft, wenn es sich um verschiedene Achsen dreht.';

  @override
  String get interlockPuzzleTitle => 'Interlock-Rätsel';

  @override
  String get interlockPuzzleSubtitle =>
      'Zerlege oder setze komplexe ineinandergreifende Blöcke in der richtigen Reihenfolge zusammen.';

  @override
  String get interlockPuzzleCongrats =>
      'Logische Dekonstruktion! Du hast das Rätsel perfekt gelöst.';

  @override
  String get pathIntersectTitle => 'Pfadschnittpunkt';

  @override
  String get pathIntersectSubtitle =>
      'Navigiere gleichzeitig auf mehreren Pfaden, um ihre jeweiligen Ziele ohne Kollision zu erreichen.';

  @override
  String get pathIntersectCongrats =>
      'Synchronisierte Navigation! Du hast alle Ziele fehlerfrei erreicht.';

  @override
  String get negativeSpaceDetectionTitle => 'Negativraum';

  @override
  String get negativeSpaceDetectionSubtitle =>
      'Identifiziere die Form, die durch den Leerraum zwischen Objekten entsteht.';

  @override
  String get negativeSpaceDetectionCongrats =>
      'Scharfe Wahrnehmung! Du hast die Kunst gemeistert, zu sehen, was nicht da ist.';

  @override
  String get compassMazeTitle => 'Kompass-Labyrinth';

  @override
  String get compassMazeSubtitle =>
      'Navigiere durch ein Labyrinth, in dem sich die Bewegungsrichtungen je nach Kompassausrichtung ändern.';

  @override
  String get compassMazeCongrats =>
      'Experten-Navigation! Du hast den Ausgang durch die wechselnden Richtungen gefunden.';

  @override
  String get complexFoldingNetsTitle => 'Faltnetze';

  @override
  String get complexFoldingNetsSubtitle =>
      'Bestimme, welche komplexe 3D-Form durch das Falten eines nicht standardmäßigen 2D-Netzes entsteht.';

  @override
  String get complexFoldingNetsCongrats =>
      'Fortgeschrittene Faltlogik! Du hast die 3D-Form erfolgreich visualisiert.';

  @override
  String get compassMazeMessage =>
      'Navigiere mit dem Kompass durch das Labyrinth.';

  @override
  String get negativeSpaceDetectionMessage =>
      'Identifiziere das verborgene Objekt im Raum.';

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
