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
  String get keepScreenAwake => 'Bildschirm anlassen';

  @override
  String get keepScreenAwakeDescription =>
      'Verhindert das Ausschalten des Bildschirms beim Spielen';

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
  String get changeBlindnessTitle => 'Veränderungsblindheit';

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
  String get orbitTapTapToHit => 'Tippe, wenn ein Ball das Tor betritt';

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
  String get wordSurgeTitle => 'Wortwelle';

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
      'TEILEN SIE DAS RASTER IN QUADRATE UND RECHTECKE, DIE DEN ZAHLEN ENTSPRECHEN.';

  @override
  String get countdownMathTitle => 'Countdown-Mathe';

  @override
  String get countdownMathSubtitle =>
      'KOMBINIEREN SIE ZUFÄLLIGE ZAHLEN, UM DAS DREISTELLIGE ZIEL ZU BERECHNEN.';

  @override
  String get narrativeRecallTitle => 'Narrativer Rückruf';

  @override
  String get narrativeRecallSubtitle =>
      'LESEN SIE EINE GESCHICHTE UND ERINNERN SIE SICH AN SPEZIFISCHE QUANTITATIVE UND SACHLICHE DETAILS.';

  @override
  String get shellGameTitle => 'Muschelspiel';

  @override
  String get shellGameSubtitle =>
      'Verfolgen Sie einen versteckten Ball, während die mischenden Becher die Plätze wechseln.';

  @override
  String get typoglycemiaDecoderTitle => 'Typoglykämie-Decoder';

  @override
  String get typoglycemiaDecoderSubtitle =>
      'Entschlüsseln und lesen Sie verworrene Sätze schnell.';

  @override
  String get shapeShifterTitle => 'Gestaltwandler';

  @override
  String get shapeShifterSubtitle =>
      'Tippen Sie auf die gewünschte Form-Farb-Kombination.';

  @override
  String get gokigenNanameTitle => 'Gokigen Naname';

  @override
  String get gokigenNanameSubtitle =>
      'Zeichnen Sie Diagonalen, um Punkte ohne Schleifen zu verbinden.';

  @override
  String get matrixMultiplierTitle => 'Matrixmultiplikator';

  @override
  String get matrixMultiplierSubtitle =>
      'Wählen Sie eine Zeile und Spalte aus, um sie mit dem Ziel zu multiplizieren.';

  @override
  String get wordAssociationRecallTitle => 'Wortassoziation';

  @override
  String get wordAssociationRecallSubtitle =>
      'Rufen Sie gepaarte Wortassoziationen aus dem Gedächtnis auf.';

  @override
  String get gearRotationTitle => 'Zahnraddrehung';

  @override
  String get gearRotationSubtitle =>
      'Sagen Sie die Drehrichtung des letzten Gangs voraus.';

  @override
  String get wordWheelTitle => 'Wortrad';

  @override
  String get wordWheelSubtitle =>
      'Bilden Sie Wörter mithilfe der Buchstaben auf dem Rad, einschließlich des Buchstabens in der Mitte.';

  @override
  String get oddEvenFlashTitle => 'Ungerade-gerade-Flash';

  @override
  String get oddEvenFlashSubtitle =>
      'Passen Sie die Zahlenparität schnell an die Farbregel an.';

  @override
  String get norinoriTitle => 'Norinori';

  @override
  String get norinoriSubtitle =>
      'Beschatten Sie in jedem Raum genau zwei zusammenhängende Zellen.';

  @override
  String get algebraicBalanceTitle => 'Algebraisches Gleichgewicht';

  @override
  String get algebraicBalanceSubtitle =>
      'Lösen Sie die Gleichungen, um die Zielsumme zu finden.';

  @override
  String get patternSequenceDrawTitle => 'Musterrückruf';

  @override
  String get patternSequenceDrawSubtitle =>
      'Wiederholen Sie die animierte Pfadsequenz im Raster.';

  @override
  String get tangramTitle => 'Tangram-Puzzle';

  @override
  String get tangramSubtitle =>
      'Ordnen Sie die Formen so an, dass sie die Zielsilhouette ausfüllen.';

  @override
  String get semanticAssociationTitle => 'Assoziationswort';

  @override
  String get semanticAssociationSubtitle =>
      'Finden Sie das Wort, das alle drei Hinweise verbindet.';

  @override
  String get peripheralFocusTitle => 'Peripherer Fokus';

  @override
  String get peripheralFocusSubtitle =>
      'Reagieren Sie auf blinkende Seitenwände, während Sie Mathe lösen.';

  @override
  String get masyuTitle => 'Masyu-Schleife';

  @override
  String get masyuSubtitle =>
      'Zeichnen Sie eine einzelne Schleife, die den Masyu-Kreisregeln entspricht.';

  @override
  String get mathMazeTitle => 'Mathe-Labyrinth';

  @override
  String get mathMazeSubtitle =>
      'Verfolgen Sie einen Pfad, der zur Zielsumme führt.';

  @override
  String get storyBuilderTitle => 'Story Builder';

  @override
  String get storyBuilderSubtitle =>
      'Rekonstruieren Sie den chronologischen Ablauf der Geschichte.';

  @override
  String get mirrorMazeTitle => 'Spiegellabyrinth';

  @override
  String get mirrorMazeSubtitle =>
      'Leiten Sie einen Laserstrahl mithilfe von Diagonalspiegeln um.';

  @override
  String get wordGridConnectionTitle => 'Wortverbindungen';

  @override
  String get wordGridConnectionSubtitle =>
      'Gruppieren Sie 16 Wörter in vier Viererkategorien.';

  @override
  String get shapeShifterPeripheralTitle => 'Peripherieformen';

  @override
  String get shapeShifterPeripheralSubtitle =>
      'Verfolgen Sie Änderungen der Umfangsform und passen Sie gleichzeitig zentrale Werte an.';

  @override
  String get soundWaveMatchTitle => 'Schallwellen-Match';

  @override
  String get soundWaveMatchSubtitle =>
      'Tippen Sie, wenn die visuelle Wellenfrequenz mit Tonhöhenänderungen übereinstimmt.';

  @override
  String get multiTrackCounterTitle => 'Mehrspurzähler';

  @override
  String get multiTrackCounterSubtitle =>
      'Tippen Sie, wenn ein Zähler einen Zielmultiplikator erreicht.';

  @override
  String get colorWordMatchUpTitle => 'Farbabstimmung';

  @override
  String get colorWordMatchUpSubtitle =>
      'Bestimmen Sie anhand sich ändernder Regeln, ob zwei farbige Wörter übereinstimmen.';

  @override
  String get signalAndNoiseTitle => 'Signal & Rauschen';

  @override
  String get signalAndNoiseSubtitle =>
      'Finden Sie alphanumerische Zielzeichen, die im statischen Rauschen verborgen sind.';

  @override
  String get focusTunnelTitle => 'Fokustunnel';

  @override
  String get focusTunnelSubtitle =>
      'Identifizieren Sie passende Symbole, die auf sich bewegenden Tunnelwänden erscheinen.';

  @override
  String get targetPursuerTitle => 'Zielverfolger';

  @override
  String get targetPursuerSubtitle =>
      'Verfolgen Sie mehrere überlappende Kreise und wählen Sie das ursprüngliche Ziel aus.';

  @override
  String get gridGazeTitle => 'Gitterblick';

  @override
  String get gridGazeSubtitle =>
      'Identifizieren Sie, welche Gitterzelle mit einer anderen Dauer blinkte.';

  @override
  String get doubleTroubleTitle => 'Doppelter Ärger';

  @override
  String get doubleTroubleSubtitle =>
      'Spielen Sie zwei separate einfache Spiele gleichzeitig auf dem geteilten Bildschirm.';

  @override
  String get syncRhythmTitle => 'Rhythmus synchronisieren';

  @override
  String get syncRhythmSubtitle =>
      'Tippen Sie, wenn der visuelle Metronom-Sweep mit dem synkopierten Takt übereinstimmt.';

  @override
  String get ghostTapTitle => 'Geistertipp';

  @override
  String get ghostTapSubtitle =>
      'Tippen Sie, wenn der unsichtbare Puls seine maximale Höhe erreicht.';

  @override
  String get attentionalRsvpTitle => 'Achtung RSVP';

  @override
  String get attentionalRsvpSubtitle =>
      'Identifizieren Sie Ziffern, die im schnellen Blinken von Serienbuchstaben erscheinen.';

  @override
  String get colorMazeNavTitle => 'Farblabyrinth-Navigation';

  @override
  String get colorMazeNavSubtitle =>
      'Navigieren Sie durch Labyrinthkacheln, die den dynamischen Berechtigungsfarben entsprechen.';

  @override
  String get dynamicSalienceTitle => 'Dynamische Salienz';

  @override
  String get dynamicSalienceSubtitle =>
      'Finden Sie die Form, die sich mit einer leicht unterschiedlichen Dynamik bewegt.';

  @override
  String get chalkAndTalkTitle => 'Kreide & Reden';

  @override
  String get chalkAndTalkSubtitle =>
      'Geben Sie im Audio gehörte Wörter ein und ignorieren Sie dabei visuelle Ablenkungen.';

  @override
  String get blinkDetectorTitle => 'Blinkdetektor';

  @override
  String get blinkDetectorSubtitle =>
      'Tippen Sie auf die Gitterfläche, die zweimal schnell hintereinander blinkt.';

  @override
  String get frequencyTapTitle => 'Frequenztippen';

  @override
  String get frequencyTapSubtitle =>
      'Tippen Sie auf die Schaltfläche, die der Ziellichtimpulsfrequenz entspricht.';

  @override
  String get yajilinTitle => 'Yajilin';

  @override
  String get yajilinSubtitle =>
      'Platzieren Sie schwarze Felder und zeichnen Sie eine einzelne Schleife mit passenden Hinweisen.';

  @override
  String get heyawakeTitle => 'Heyawake';

  @override
  String get heyawakeSubtitle =>
      'Schattieren Sie Rasterräume ohne angrenzende schwarze Zellen.';

  @override
  String get gokigenVariantTitle => 'Gokigen-Variante';

  @override
  String get gokigenVariantSubtitle =>
      'Zeichnen Sie schleifenfreie Diagonalen mit Scheitelpunktzahlen.';

  @override
  String get sheepAndWolvesTitle => 'Schafe und Wölfe';

  @override
  String get sheepAndWolvesSubtitle =>
      'Zeichnen Sie eine Schleife, die Schafe von Wölfen trennt.';

  @override
  String get islandNurikabeTitle => 'Insel Nurikabe';

  @override
  String get islandNurikabeSubtitle =>
      'Bilden Sie Inseln, die den numerischen Größenbeschränkungen entsprechen.';

  @override
  String get shakashakaTitle => 'Shakashaka Rects';

  @override
  String get shakashakaSubtitle =>
      'Platzieren Sie dreieckige Fliesen so, dass rechteckige weiße Flächen entstehen.';

  @override
  String get litsTetrisTitle => 'LITS Tetromino';

  @override
  String get litsTetrisSubtitle =>
      'Platzieren Sie Tetrominos in Räumen ohne angrenzende Duplikate.';

  @override
  String get tapaWallTitle => 'Tapa-Wand';

  @override
  String get tapaWallSubtitle =>
      'Schattieren Sie die Zellen, um ein durchgehendes schwarzes Wandmuster zu bilden.';

  @override
  String get triangularBridgesTitle => 'Dreieckige Brücken';

  @override
  String get triangularBridgesSubtitle =>
      'Verbinden Sie Inseln entsprechend den Anforderungen in drei Richtungen.';

  @override
  String get rippleEffectTitle => 'Welleneffekt';

  @override
  String get rippleEffectSubtitle =>
      'Füllen Sie die Räume unter Berücksichtigung der Abstandsbeschränkungen aus.';

  @override
  String get suguruTectonicTitle => 'Suguru-Gitter';

  @override
  String get suguruTectonicSubtitle =>
      'Füllen Sie Raumblöcke mit den Nummern 1 bis K, ohne dass die Nachbarn gleich sind.';

  @override
  String get tennerGridTitle => 'Tenner-Gitter';

  @override
  String get tennerGridSubtitle =>
      'Füllen Sie die Zeilen mit den Ziffern 0–9, die mit den Spaltensummen übereinstimmen.';

  @override
  String get kakurasuSumsTitle => 'Kakurasu-Summen';

  @override
  String get kakurasuSumsSubtitle =>
      'Schattieren Sie Zellen, um gewichtete Zeilen-/Spaltenindexsummen zu erreichen.';

  @override
  String get corralLoopTitle => 'Corral-Schleife';

  @override
  String get corralLoopSubtitle =>
      'Zeichnen Sie eine einzelne Schleife mit Zahlen, die der Sichtbarkeit entsprechen.';

  @override
  String get stostoneTitle => 'Stostone-Schwerkraft';

  @override
  String get stostoneSubtitle =>
      'Schattieren Sie herunterfallende Zellen, um die unteren Reihen perfekt auszufüllen.';

  @override
  String get tripletsLogicTitle => 'Triolen Trio';

  @override
  String get tripletsLogicSubtitle =>
      'Füllen Sie das Raster mit drei Formen und vermeiden Sie drei Formen hintereinander.';

  @override
  String get galaxiesSymTitle => 'Galaxiensymmetrie';

  @override
  String get galaxiesSymSubtitle =>
      'Teilen Sie das Gitter in rotationssymmetrische Galaxienformen.';

  @override
  String get matrixMultiplierMatchTitle => 'Matrix-Matcher';

  @override
  String get matrixMultiplierMatchSubtitle =>
      'Multiplizieren Sie die Zeilen- und Spaltenwerte, um sie an das Skalarprodukt des Ziels anzupassen.';

  @override
  String get primeFactorTreesTitle => 'Primfaktorbäume';

  @override
  String get primeFactorTreesSubtitle =>
      'Zerlegen Sie zusammengesetzte Zahlen in Primblattfaktorpaare.';

  @override
  String get vektorVectorTitle => 'Vektor Vektor';

  @override
  String get vektorVectorSubtitle =>
      'Skalieren Sie Vektoren, damit ihre Summe das Ziel erreicht.';

  @override
  String get binomialMatchTitle => 'Binomialübereinstimmung';

  @override
  String get binomialMatchSubtitle =>
      'Ordnen Sie quadratische Formeln faktorisierten Binomialwerten zu.';

  @override
  String get percentageShoppingTitle => 'Prozentualer Einkauf';

  @override
  String get percentageShoppingSubtitle =>
      'Berechnen Sie Rabattprozentsätze und endgültige Bezahlsummen.';

  @override
  String get cryptoArithmeticTitle => 'Krypto-Arithmetik';

  @override
  String get cryptoArithmeticSubtitle =>
      'Lösen Sie mathematische Probleme mit der Zeichen-Ziffern-Ersetzungsverschlüsselung.';

  @override
  String get fractionalPizzaTitle => 'Teilpizza';

  @override
  String get fractionalPizzaSubtitle =>
      'Pizzastücke so aufteilen, dass sie den Zielsummenbrüchen entsprechen.';

  @override
  String get numberBondsTitle => 'Anzahl Anleihen';

  @override
  String get numberBondsSubtitle =>
      'Knotenwerte verknüpfen, um einer Zielverbindungssumme zu entsprechen.';

  @override
  String get gridSumLineTitle => 'Gittersummenlinie';

  @override
  String get gridSumLineSubtitle =>
      'Zeichnen Sie einen Pfad, dessen Werte genau dem Ziel entsprechen.';

  @override
  String get binaryScaleBalanceTitle => 'Binäre Waage';

  @override
  String get binaryScaleBalanceSubtitle =>
      'Dezimalgewichtung mithilfe von Zweierpotenzblöcken ausgleichen.';

  @override
  String get moduloPathTitle => 'Modulo-Pfad';

  @override
  String get moduloPathSubtitle =>
      'Durchqueren Sie Gitterzellen, die mit Modulo-Restwerten übereinstimmen.';

  @override
  String get digitSwapEqTitle => 'Zifferntauschgleichungen';

  @override
  String get digitSwapEqSubtitle =>
      'Tauschen Sie einzelne Ziffern zwischen Gleichungen aus, um beide zu korrigieren.';

  @override
  String get areaPerimeterMatchTitle => 'Fläche und Umfang';

  @override
  String get areaPerimeterMatchSubtitle =>
      'Zeichnen Sie Rechtecke, die den Zielflächen- und Umfangswerten entsprechen.';

  @override
  String get inequalityBalanceOpsTitle => 'Ungleichheitsbilanz';

  @override
  String get inequalityBalanceOpsSubtitle =>
      'Platzieren Sie Ungleichheitssymbole zwischen komplexen mathematischen Begriffen.';

  @override
  String get graphCoordinatePlotTitle => 'Diagrammplotter';

  @override
  String get graphCoordinatePlotSubtitle =>
      'Zeichnen Sie Gitterkoordinaten passend zu linearen/quadratischen Kurven.';

  @override
  String get baseConversionRunTitle => 'Basiskonvertierung';

  @override
  String get baseConversionRunSubtitle =>
      'Konvertieren Sie Werte zwischen binär, dezimal, hexadezimal und oktal.';

  @override
  String get unitConverterProTitle => 'Einheitenumrechner';

  @override
  String get unitConverterProSubtitle =>
      'Beantworten Sie schnelle Einheitenumrechnungen unter Zeitvorgaben.';

  @override
  String get auditoryNBackTitle => 'Auditiver N-Back';

  @override
  String get auditoryNBackSubtitle =>
      'Passen Sie die gesprochenen Buchstaben an, hören Sie N und treten Sie aus der Erinnerung zurück.';

  @override
  String get abstractPatternRecallTitle => 'Musterschichtung';

  @override
  String get abstractPatternRecallSubtitle =>
      'Rekonstruieren Sie geschichtete bunte Formen aus dem Gedächtnisstudium.';

  @override
  String get roomInspectorTitle => 'Rauminspektor';

  @override
  String get roomInspectorSubtitle =>
      'Identifizieren Sie Möbelmodifikationen, die bei leerem Bildschirm vorgenommen wurden.';

  @override
  String get voiceToFaceMatchTitle => 'Voice-Face-Match';

  @override
  String get voiceToFaceMatchSubtitle =>
      'Wählen Sie das richtige Gesicht aus, das dem gesprochenen Audio-Sprachclip zugeordnet ist.';

  @override
  String get spatialGridMemory3DTitle => '3D-räumliches Gedächtnis';

  @override
  String get spatialGridMemory3DSubtitle =>
      'Erinnern Sie sich an geblitzte Blöcke in einer gedrehten 3D-Würfelgitterstruktur.';

  @override
  String get sequenceStackTitle => 'Sequenzstapel';

  @override
  String get sequenceStackSubtitle =>
      'Rekonstruieren Sie das Hinzufügen und Entfernen von Plattenstapeln in der richtigen Reihenfolge.';

  @override
  String get semanticCategoryRecallTitle => 'Kategorierückruf';

  @override
  String get semanticCategoryRecallSubtitle =>
      'Identifizieren Sie Lernwörter, die den gewünschten Kategoriezielen entsprechen.';

  @override
  String get gridDisplacementTitle => 'Gitterverschiebung';

  @override
  String get gridDisplacementSubtitle =>
      'Identifizieren Sie verschobene Symbole im Vergleich zum Original.';

  @override
  String get soundSequenceMatchTitle => 'Klangsequenz-Übereinstimmung';

  @override
  String get soundSequenceMatchSubtitle =>
      'Wiederholen Sie Notensequenzen, die auf einer virtuellen Tastatur gespielt werden.';

  @override
  String get cardCountingMemoryTitle => 'Kartenzähler';

  @override
  String get cardCountingMemorySubtitle =>
      'Identifizieren Sie Karten, die bereits in fortlaufenden Kartenausteilungsläufen ausgeteilt wurden.';

  @override
  String get directionsRecallTitle => 'Wegbeschreibung zurückrufen';

  @override
  String get directionsRecallSubtitle =>
      'Navigieren Sie durch Rasterkarten, die den Pfadanweisungen aus dem Speicher entsprechen.';

  @override
  String get eventTimelineMemoryTitle => 'Ereigniszeitleiste';

  @override
  String get eventTimelineMemorySubtitle =>
      'Ordnen Sie historische/fiktionale Ereigniskarten chronologisch an.';

  @override
  String get featureMatrixRecallTitle => 'Funktionsmatrix';

  @override
  String get featureMatrixRecallSubtitle =>
      'Beantworten Sie Fragen zu Form- und Farbattributen von Zellen.';

  @override
  String get delayedMatchSampleTitle => 'Verzögertes Spiel';

  @override
  String get delayedMatchSampleSubtitle =>
      'Ordnen Sie das Zielsymbol zu, nachdem Sie mathematische Ablenker gelöst haben.';

  @override
  String get symbolDigitAssocTitle => 'Symbol-Ziffern-Zuordnung';

  @override
  String get symbolDigitAssocSubtitle =>
      'Lösen Sie Symbolübersetzungsblätter, die mit Ziffernschlüsseln übereinstimmen.';

  @override
  String get dualTaskMemoryTitle => 'Dual-Task-Speicher';

  @override
  String get dualTaskMemorySubtitle =>
      'Merken Sie sich Wortsätze und lösen Sie schnelle Rechenaufgaben.';

  @override
  String get actionSequenceRecallTitle => 'Aktionsrückruf';

  @override
  String get actionSequenceRecallSubtitle =>
      'Wiederholen Sie die Zeichengesten-Animationssequenzen der Reihe nach.';

  @override
  String get tangramPolygonTitle => 'Tangram-Fit';

  @override
  String get tangramPolygonSubtitle =>
      'Ordnen Sie Polygonformen an, um Silhouettenumrisse zu füllen.';

  @override
  String get mazeNav3DTitle => '3D-Labyrinth-Navigation';

  @override
  String get mazeNav3DSubtitle =>
      'Navigieren Sie durch isometrische 3D-Labyrinthrouten aus der Ego-Perspektive.';

  @override
  String get isometricProjectionTitle => 'Isometrischer Projektor';

  @override
  String get isometricProjectionSubtitle =>
      'Ordnen Sie 3D-Blockfiguren orthografischen 2D-Draufsicht-/Vorderansichten zu.';

  @override
  String get polyominoPackingTitle => 'Polyomino-Verpackung';

  @override
  String get polyominoPackingSubtitle =>
      'Packen Sie zufällige Polyomino-Blockstücke in Zielbereiche.';

  @override
  String get spatialGridRotationTitle => 'Räumliche Gitterrotation';

  @override
  String get spatialGridRotationSubtitle =>
      'Passen Sie 3D-Blockanordnungen an, die entlang der Achsenkoordinaten gedreht sind.';

  @override
  String get wireLoopGameTitle => 'Drahtschleife';

  @override
  String get wireLoopGameSubtitle =>
      'Ziehen Sie Metallringe berührungslos entlang der Drahtsplines.';

  @override
  String get origamiUnfoldTitle => 'Origami-Entfaltung';

  @override
  String get origamiUnfoldSubtitle =>
      'Identifizieren Sie Lochmuster nach dem Auffalten gefalteter Blätter.';

  @override
  String get ropeTangleSolverTitle => 'Seilentwirrer';

  @override
  String get ropeTangleSolverSubtitle =>
      'Ziehen Sie Knoten, um planare Diagramme mit Nulllinienkreuzen zu gestalten.';

  @override
  String get gridFitTetrisTitle => 'Rasteranpassungslöser';

  @override
  String get gridFitTetrisSubtitle =>
      'Ordnen Sie statische, unregelmäßige Blöcke so an, dass sie zu den Containergrenzen passen.';

  @override
  String get vectorGridAlignmentTitle => 'Vektorausrichtung';

  @override
  String get vectorGridAlignmentSubtitle =>
      'Skalieren und drehen Sie Formen, um sie an die Ziele der Schattenvorlage anzupassen.';

  @override
  String get blockStackingPhysicsTitle => 'Blockstapelung';

  @override
  String get blockStackingPhysicsSubtitle =>
      'Stapeln Sie unregelmäßige Blockplatten, um das Schwerkraftgewicht auszugleichen.';

  @override
  String get crossSectionMatch3DTitle => '3D-Querschnitt';

  @override
  String get crossSectionMatch3DSubtitle =>
      'Identifizieren Sie aus 3D-Formen geschnittene 2D-Schnittgeometrien.';

  @override
  String get symmetryPaintTitle => 'Symmetriefarbe';

  @override
  String get symmetryPaintSubtitle =>
      'Zeichnen Sie spiegelbildliche Segmente, die sich über Symmetrieachsen spiegeln.';

  @override
  String get rollingBlockBloxTitle => 'Rollender Block';

  @override
  String get rollingBlockBloxSubtitle =>
      'Rollen Sie Blockstücke, um vertikal in den Zielschlitzen zu landen.';

  @override
  String get perspectiveShiftViewTitle => 'Perspektivwechsel';

  @override
  String get perspectiveShiftViewSubtitle =>
      'Drehen Sie Blockcluster, bis sie Buchstaben/Wörter buchstabieren.';

  @override
  String get networkFlowSphericalTitle => 'Netzwerkfluss';

  @override
  String get networkFlowSphericalSubtitle =>
      'Verbinden Sie Gitterströme über umhüllende Zylinderkoordinaten.';

  @override
  String get layeredSilhouetteBlendTitle => 'Silhouette-Mischung';

  @override
  String get layeredSilhouetteBlendSubtitle =>
      'Stapeln Sie farbige Schichten, um sie an die durchscheinenden Zielformen anzupassen.';

  @override
  String get wordWheelPangramTitle => 'Wortanagramme';

  @override
  String get wordWheelPangramSubtitle =>
      'Konstruieren Sie Wörter mit zentralen Zielbuchstaben aus Rädern.';

  @override
  String get letterGridSwapperTitle => 'Brieftauscher';

  @override
  String get letterGridSwapperSubtitle =>
      'Tauschen Sie benachbarte Buchstabenkacheln aus, um Zeilen- und Spaltenwörter zu vervollständigen.';

  @override
  String get synonymMatchTitle => 'Synonymübereinstimmung';

  @override
  String get synonymMatchSubtitle =>
      'Ordnen Sie fallende Wortziele Synonymen oder Antonymen zu.';

  @override
  String get vowelDropTitle => 'Vokalabfall';

  @override
  String get vowelDropSubtitle =>
      'Platzieren Sie Vokale in Koordinatengittern, um Wörter zu vervollständigen.';

  @override
  String get letterBalanceScaleTitle => 'Wortbalance-Skala';

  @override
  String get letterBalanceScaleSubtitle =>
      'Buchstabieren Sie Wörter, deren Buchstabenwerte die Gewichte ausgleichen.';

  @override
  String get wordChainShiritoriTitle => 'Wortkette';

  @override
  String get wordChainShiritoriSubtitle =>
      'Wortschleifen verknüpfen, beginnend mit vorangehenden Buchstabenausgaben.';

  @override
  String get affixBuilderTitle => 'Affix Builder';

  @override
  String get affixBuilderSubtitle =>
      'Kombinieren Sie Präfixe/Suffixe, um Zielvokabulare zu erstellen.';

  @override
  String get decipherCrypticCluesTitle => 'Kryptische Entschlüsselung';

  @override
  String get decipherCrypticCluesSubtitle =>
      'Lösen Sie Worträtsel und entschlüsseln Sie Rechtschreibrätsel.';

  @override
  String get boggleWordSearchTitle => 'Boggle Connect';

  @override
  String get boggleWordSearchSubtitle =>
      'Verfolgen Sie benachbarte, verbundene Pfade, um versteckte Wörter zu finden.';

  @override
  String get idiomUnscrambleTitle => 'Idiom entschlüsseln';

  @override
  String get idiomUnscrambleSubtitle =>
      'Ordnen Sie die Arrays der verschlüsselten Wörter so an, dass sie den Bedeutungen der Redewendungen entsprechen.';

  @override
  String get letterPyramidsTitle => 'Buchstabenpyramiden';

  @override
  String get letterPyramidsSubtitle =>
      'Bauen Sie Worttürme und fügen Sie pro Etage einzelne Anagrammbuchstaben hinzu.';

  @override
  String get soundAlikeHomophonesTitle => 'Homophone Übereinstimmungen';

  @override
  String get soundAlikeHomophonesSubtitle =>
      'Identifizieren Sie die korrekte homophone Schreibweise für Sätze.';

  @override
  String get wordGridSudokuTitle => 'Wort-Sudoku';

  @override
  String get wordGridSudokuSubtitle =>
      'Tesselieren Sie Buchstaben in Rasterreihen und bilden Sie Wörter.';

  @override
  String get portmanteauFactoryTitle => 'Portmanteau-Fabrik';

  @override
  String get portmanteauFactorySubtitle =>
      'Semantische Komponenten zusammenführen und so zusammengesetzte Wörter erzeugen.';

  @override
  String get codedCrosswordsCodeTitle => 'Codewörter-Kreuzworträtsel';

  @override
  String get codedCrosswordsCodeSubtitle =>
      'Lösen Sie Gitterkreuzworträtsel mit Zahlen-Buchstaben-Codes.';

  @override
  String get wordSnakeTrailTitle => 'Wortschlange';

  @override
  String get wordSnakeTrailSubtitle =>
      'Verfolgen Sie schlangenartige Buchstabenspuren, die thematische Wörter buchstabieren.';

  @override
  String get typingRhythmSpeedTitle => 'Tippfluss';

  @override
  String get typingRhythmSpeedSubtitle =>
      'Geben Sie Vokabeln ein, die zu den Rhythmusschlägen des Metronoms passen.';

  @override
  String get errorSomethingWrong => 'Etwas ist schiefgelaufen';

  @override
  String get errorUnexpected => 'Ein unerwarteter Fehler ist aufgetreten';

  @override
  String get errorTryAgain => 'Erneut versuchen';

  @override
  String get leaveReview => 'Bewertung abgeben';

  @override
  String get reportError => 'Fehler melden';

  @override
  String get statsTitle => 'Statistiken';

  @override
  String get statsAchievements => 'Erfolge';

  @override
  String get statsWeeklyActivity => 'Wöchentliche Aktivität';

  @override
  String statsDayStreak(int days) {
    return '$days Tage in Folge';
  }

  @override
  String get statsTotalXp => 'Gesamt-XP';

  @override
  String get statsSolved => 'Gelöst';

  @override
  String statsLevel(int level) {
    return 'Level $level';
  }

  @override
  String get statsMaintainStreak => 'Halte deine Serie aufrecht!';

  @override
  String statsPercentToLevel(int percent, int level) {
    return '$percent% bis Level $level';
  }

  @override
  String get statsCognitiveProfile => 'Kognitives Profil';

  @override
  String get statsLocked => 'Gesperrt';

  @override
  String get achievementSeeker => 'Sucher';

  @override
  String get achievementSeekerDesc => 'Verdiene 100 XP';

  @override
  String get achievementApprentice => 'Lehrling';

  @override
  String get achievementApprenticeDesc => 'Verdiene 1.000 XP';

  @override
  String get achievementStrategist => 'Stratege';

  @override
  String get achievementStrategistDesc => 'Verdiene 5.000 XP';

  @override
  String get achievementElite => 'Elite';

  @override
  String get achievementEliteDesc => 'Verdiene 10.000 XP';

  @override
  String get achievementVeteran => 'Veteran';

  @override
  String get achievementVeteranDesc => 'Verdiene 25.000 XP';

  @override
  String get achievementMaster => 'Meister';

  @override
  String get achievementMasterDesc => 'Verdiene 50.000 XP';

  @override
  String get achievementGrandmaster => 'Großmeister';

  @override
  String get achievementGrandmasterDesc => 'Verdiene 100.000 XP';

  @override
  String get achievementLegend => 'Legende';

  @override
  String get achievementLegendDesc => 'Verdiene 250.000 XP';

  @override
  String get achievementMythic => 'Mythisch';

  @override
  String get achievementMythicDesc => 'Verdiene 500.000 XP';

  @override
  String get achievementEternal => 'Ewig';

  @override
  String get achievementEternalDesc => 'Verdiene 1.000.000 XP';

  @override
  String get winFoundIt => 'Gefunden!';

  @override
  String get winExcellentTracking =>
      'Hervorragende Verfolgungsgeschwindigkeit!';

  @override
  String get loseMissedIt => 'Verpasst!';

  @override
  String get loseKeepEyes => 'Behalte das Ziel im Auge.';

  @override
  String get winDecodedCorrectly => 'Korrekt entschlüsselt!';

  @override
  String get winDecodedMessage =>
      'Dein Gehirn hat den Buchstabensalat erfolgreich gelesen!';

  @override
  String get loseTryAgainDecryption =>
      'Versuche erneut, die Verschlüsselung zu knacken.';

  @override
  String get winTargetReached => 'Ziel erreicht!';

  @override
  String get winExcellentCalculations => 'Hervorragende Berechnungen!';

  @override
  String get winCodeBroken => 'Code geknackt!';

  @override
  String get winDecodedPerfectly =>
      'Du hast die Nachricht perfekt entschlüsselt.';

  @override
  String get loseEncrypted => 'Verschlüsselt';

  @override
  String get winAmazing => 'Erstaunlich!';

  @override
  String get winReachedTarget => 'Du hast die Zielzahl erreicht!';

  @override
  String get loseTryAgainSolution =>
      'Versuche es erneut, um die Lösung zu finden.';

  @override
  String get winExcellent => 'Ausgezeichnet!';

  @override
  String get winLevelUp => 'Stufenaufstieg!';

  @override
  String get winPerfect => 'Perfekt!';

  @override
  String get winFloodSuccess => 'Flutung erfolgreich!';

  @override
  String get loseDryLand => 'Trockenes Land...';

  @override
  String get winRoundComplete => 'Runde abgeschlossen';

  @override
  String get winStayVigilant => 'Bleibe wachsam!';

  @override
  String get loseKeepWatch => 'Pass gut auf!';

  @override
  String get winFocusMaster => 'Fokus-Meister!';

  @override
  String get loseConcentrationBroken => 'Konzentration unterbrochen';

  @override
  String get winSpeedDemon => 'Geschwindigkeits-Teufel!';

  @override
  String get loseSlowSteady => 'Langsam & Stetig';

  @override
  String get loseTimeExpired => 'Zeit abgelaufen';

  @override
  String get winSharpEyes => 'Scharfe Augen!';

  @override
  String get loseLostTrack => 'Faden verloren';

  @override
  String get winOrbitMaster => 'Orbit-Meister!';

  @override
  String get loseOutOfSync => 'Nicht synchron';

  @override
  String get winSharpReflexes => 'Scharfe Reflexe!';

  @override
  String get loseOutOfTime => 'Zeit abgelaufen';

  @override
  String get winSurgeComplete => 'Welle abgeschlossen!';

  @override
  String get loseTimeExpiredExcl => 'Zeit abgelaufen!';

  @override
  String get winMathGenius => 'Mathe-Genie!';

  @override
  String get loseTimeUp => 'Zeit um';

  @override
  String get winPlanningMaster => 'Planungs-Meister!';

  @override
  String get loseOutOfMoves => 'Keine Züge mehr';

  @override
  String get winTotalControl => 'Volle Kontrolle!';

  @override
  String get loseInhibitionFail => 'Hemmungs-Fehlschlag';

  @override
  String get winMimicMaster => 'Nachahmungs-Meister!';

  @override
  String get losePatternMismatch => 'Muster stimmt nicht überein';

  @override
  String get winMemoryMaster => 'Gedächtnis-Meister!';

  @override
  String get loseFadingEcho => 'Verblassendes Echo';

  @override
  String get winNeuroMaster => 'Neuro-Meister!';

  @override
  String get loseBrainFog => 'Gehirnnebel';

  @override
  String get winBrainWizard => 'Denksport-Zauberer!';

  @override
  String get winSpatialMaster => 'Räuml.-Meister!';

  @override
  String get loseLostInSpace => 'Im All verloren';

  @override
  String get winSequenceMaster => 'Sequenz-Meister!';

  @override
  String get winCountingGenius => 'Zähl-Genie!';

  @override
  String get winNonMatchingExpert => 'Nicht-passend-Experte!';

  @override
  String get winSymmetryMaster => 'Symmetrie-Meister!';

  @override
  String get winCabinetExpert => 'Schrank-Experte!';

  @override
  String get winSpatialGenius => 'Räumliches Genie!';

  @override
  String get winReadingExpert => 'Lese-Experte!';

  @override
  String get winRecognitionGenius => 'Erkennungs-Genie!';

  @override
  String get winMandalaArtist => 'Mandala-Künstler!';

  @override
  String get winTrackerPro => 'Tracker-Profi!';

  @override
  String get loseLostTrail => 'Spur verloren';

  @override
  String get winLogicMaster => 'Logik-Meister!';

  @override
  String get loseWrongAnswer => 'Falsche Antwort';

  @override
  String get winPathfinder => 'Wegbereiter!';

  @override
  String get loseLostYourWay => 'Vom Weg abgekommen';

  @override
  String get winMentalGymnast => 'Mentaler Akrobat!';

  @override
  String get loseWiresCrossed => 'Falsch verbunden';

  @override
  String get winCorrect => 'Richtig!';

  @override
  String get loseWrong => 'Falsch';

  @override
  String get winRhythmGod => 'Rhythmus-Gott!';

  @override
  String get loseOffBeat => 'Taktlos';

  @override
  String get winSteadyHands => 'Ruhige Hände!';

  @override
  String get loseShakyLine => 'Zittrige Linie';

  @override
  String get winEquationSolved => 'Gleichung gelöst!';

  @override
  String get winMasterHunter => 'Meister-Jäger!';

  @override
  String get loseHuntEnded => 'Jagd beendet';

  @override
  String get winFluencyExpert => 'Flüssigkeits-Experte!';

  @override
  String get loseTimeUpExcl => 'Zeit um!';

  @override
  String get winSharpEye => 'Scharfes Auge!';

  @override
  String get loseMismatched => 'Passt nicht zusammen';

  @override
  String get winFibonacciMaster => 'Fibonacci-Meister!';

  @override
  String get winMathWizard => 'Mathe-Magier!';

  @override
  String get winPercentagePro => 'Prozent-Profi!';

  @override
  String get winSleuthMaster => 'Spürnasen-Meister!';

  @override
  String get winDivisibilityWhiz => 'Teilbarkeits-As!';

  @override
  String get winVennMaster => 'Venn-Meister!';

  @override
  String get winChimpTestAced => 'Schimpansen-Test gemeistert';

  @override
  String get loseTestFailed => 'Test fehlgeschlagen';

  @override
  String get winChimpMessage =>
      'Sensationelle Arbeitsgedächtnisspanne! Du erreichst das kognitive Erinnerungsniveau von Schimpansen.';

  @override
  String get loseChimpMessage =>
      'Du hast alle Leben verloren. Trainiere weiter, um deine Gedächtnisgitter-Kapazität zu erhöhen!';

  @override
  String get winPerfectRecall => 'Perfekte Erinnerung!';

  @override
  String get winRememberedAll =>
      'Du hast dich an alle Details korrekt erinnert!';

  @override
  String get loseSomeDetailsWrong =>
      'Einige Details wurden falsch in Erinnerung behalten.';

  @override
  String get winShikakuSolved =>
      'Du hast das Shikaku-Rätsel erfolgreich gelöst.';

  @override
  String get snackbarIncorrectSum => 'Falsche Summe! Versuche eine andere.';

  @override
  String get snackbarCorrectMatch => 'Richtige Übereinstimmung!';

  @override
  String get snackbarWrongMatch =>
      'Falsche Übereinstimmung! Studiere eine neue Form.';

  @override
  String get snackbarAlignedPerfectly =>
      'Perfekt ausgerichtet! Nächstes Ziel...';

  @override
  String get snackbarNotAligned =>
      'Noch nicht ausgerichtet! Passe Rotation, Skalierung oder Positionen weiter an.';

  @override
  String snackbarWordMustContainCentral(String letter) {
    return 'Das Wort muss den mittleren Buchstaben \"$letter\" enthalten!';
  }

  @override
  String get snackbarWordAlreadyFound => 'Wort bereits gefunden!';

  @override
  String get snackbarNotAValidWord => 'Kein gültiges Wort!';

  @override
  String get snackbarIncorrectLookClose =>
      'Falsches Lesen. Schau dir die Wörter genau an!';

  @override
  String snackbarIncorrectCorrectAnswer(String answer) {
    return 'Falsch! Die richtige Antwort war $answer';
  }

  @override
  String get hideGame => 'Ausblenden';

  @override
  String get unhideGame => 'Einblenden';

  @override
  String get favoriteGame => 'Favorit';

  @override
  String get unfavoriteGame => 'Aus Favoriten entfernen';

  @override
  String get hiddenGames => 'AUSGEBLENDETE SPIELE';

  @override
  String showHiddenGames(int count) {
    return 'Ausgeblendete Spiele anzeigen ($count)';
  }

  @override
  String get noHiddenGames => 'Keine ausgeblendeten Spiele';

  @override
  String get gameHidden => 'Spiel ausgeblendet';

  @override
  String get undo => 'Rückgängig';

  @override
  String get snackbarCorrect => 'Richtig!';

  @override
  String get snackbarIncorrectTryNew =>
      'Falsche Erinnerung! Versuche ein neues Gitter.';

  @override
  String get snackbarAllCorrect => 'Alle Zuordnungen korrekt!';

  @override
  String get snackbarIncorrectStudyAgain =>
      'Falsche Übersetzungen! Studiere den Zuordnungsschlüssel erneut.';

  @override
  String get snackbarIncorrectArithmetic =>
      'Falsche Arithmetik! Versuche es noch einmal.';

  @override
  String get snackbarCorrectRecall => 'Korrekt erinnert!';

  @override
  String get snackbarWrongRecall =>
      'Falsche Erinnerungsauswahl! Versuche einen neuen Satz.';

  @override
  String get snackbarPieceDoesNotFit => 'Das Teil passt dort nicht hin!';

  @override
  String snackbarInvalidStep(int mod, int modulus, int remainder) {
    return 'Ungültiger Schritt! $mod mod $modulus ist nicht $remainder.';
  }

  @override
  String snackbarIncorrectGroup(int tries) {
    return 'Falsche Gruppe! Noch $tries Versuche übrig.';
  }

  @override
  String get snackbarIncorrectSwapped =>
      'Falsch! Vertauschte Elemente sind grün markiert.';

  @override
  String snackbarIncorrectDestination(int x, int y) {
    return 'Falsch! Das endgültige Ziel war ($x, $y).';
  }

  @override
  String snackbarIncorrectCorrectCount(String suit, int count) {
    return 'Falsch! Die richtige Anzahl für $suit war $count.';
  }

  @override
  String get snackbarIncorrectSequence =>
      'Falsche Sequenz! Schau noch einmal genau hin.';

  @override
  String get snackbarSequenceMatched =>
      'Sequenz stimmt überein! Länge wird erhöht...';

  @override
  String get snackbarIncorrectAnswer =>
      'Falsche Antwort! Versuche es noch einmal.';

  @override
  String snackbarIncorrectCorrectValue(String value) {
    return 'Falsch! Der richtige Wert war $value';
  }

  @override
  String snackbarIncorrectSlices(int selected, String required) {
    return 'Falsch! Du hast $selected Stücke ausgewählt, brauchst aber $required.';
  }

  @override
  String get snackbarReachedEndNoMatch =>
      'Ende erreicht, aber die Summe stimmt nicht mit dem Ziel überein!';

  @override
  String get snackbarCorrectOrder => 'Korrekte chronologische Reihenfolge!';

  @override
  String get snackbarIncorrectOrder =>
      'Falsche Reihenfolge! Studiere sie erneut.';

  @override
  String snackbarIncorrectMissingValue(String value) {
    return 'Falsch! Der fehlende Wert war $value';
  }

  @override
  String snackbarIncorrectLetterDigit(String letter, int digit) {
    return 'Falsch! $letter = $digit';
  }

  @override
  String snackbarIncorrectCorrectPoint(int x, int y) {
    return 'Falsch! Der richtige Punkt war ($x, $y).';
  }

  @override
  String get snackbarReachedExit =>
      'Ausgang erreicht! Nächstes Labyrinth wird generiert...';

  @override
  String get snackbarCannotMoveBlocked =>
      'Kann nicht vorwärts gehen: Durch Wand blockiert!';

  @override
  String snackbarIncorrectCorrectStack(String stack) {
    return 'Falsch! Der richtige finale Stapel war: $stack';
  }

  @override
  String get snackbarIncorrectStudyStory =>
      'Falsche Sequenz! Studiere die Geschichte erneut.';

  @override
  String snackbarScaleNotBalanced(int current, int target) {
    return 'Waage ist nicht im Gleichgewicht! Aktuelles Gewicht ist $current, Ziel ist $target.';
  }

  @override
  String get snackbarWordMatchedTracing =>
      'Wort stimmt überein! Nächstes Wort wird nachgezeichnet...';

  @override
  String get snackbarIncorrectTraceFromStart =>
      'Falsche Sequenz! Versuche, vom Startfeld aus nachzuzeichnen.';

  @override
  String snackbarIncorrectCorrectForm(String form) {
    return 'Falsch! Die faktorisierte Form ist $form';
  }

  @override
  String snackbarIncorrectInequality(
      String left, int leftVal, String correct, String right, int rightVal) {
    return 'Falsch! $left ($leftVal) $correct $right ($rightVal)';
  }

  @override
  String snackbarIncorrectBaseConversion(String answer) {
    return 'Falsch! Die richtige Antwort war $answer';
  }

  @override
  String get snackbarIncorrectStudyPairs =>
      'Falsch! Lass uns die Paare noch einmal studieren.';

  @override
  String get snackbarAlignedCorrectly =>
      'Ausgerichtet und korrekt identifiziert!';

  @override
  String get snackbarIncorrectPerspective =>
      'Falsche Perspektivwinkel-Rotation! Versuche sie zuerst auszurichten.';

  @override
  String get btnShuffleCups => 'Becher mischen';

  @override
  String get btnSubmitGroup => 'Gruppe abschicken';

  @override
  String get btnYes => 'Ja';

  @override
  String get btnNo => 'Nein';

  @override
  String get btnGotIt => 'Verstanden';

  @override
  String get btnSubmit => 'Abschicken';

  @override
  String get btnShowHint => 'Hinweis anzeigen';

  @override
  String get btnSubmitAlignment => 'Ausrichtung abschicken';

  @override
  String get btnSubmitLocation => 'Ort abschicken';

  @override
  String get btnStartDealing => 'Austeilen beginnen';

  @override
  String get btnImReady => 'Ich bin bereit';

  @override
  String get btnStartGame => 'Spiel starten';

  @override
  String get btnSubmitStack => 'Stapel abschicken';

  @override
  String get btnImReadyToAnswer => 'Ich bin bereit zu antworten';

  @override
  String get btnNoMatch => 'Keine Übereinstimmung';

  @override
  String get btnMatch => 'Übereinstimmung';

  @override
  String get btnMatchColor => 'FARBE ABGLEICHEN';

  @override
  String get btnMatchWord => 'WORT ABGLEICHEN';

  @override
  String get btnGuess => 'Tippen';

  @override
  String get btnPlayNow => 'Jetzt spielen';

  @override
  String get btnClear => 'Löschen';

  @override
  String get phaseWatchCarefully => 'Schau genau hin...';

  @override
  String get phaseTapCupWithBall => 'Tippe auf den Becher mit dem Ball!';

  @override
  String get phaseTrackTheBall => 'Verfolge den Ball';

  @override
  String get phaseFindTheBall => 'Finde den Ball unter dem gelben Becher!';

  @override
  String get phaseBallUnderCup =>
      'Der Ball ist unter dem markierten Becher. Merk ihn dir!';

  @override
  String get phaseWrongCup =>
      'Falscher Becher! Der Ball war unter dem markierten Becher.';

  @override
  String get phaseDecodeTheSentence => 'Entschlüssele den Satz';

  @override
  String get phaseFindTheTarget => 'Finde das Ziel';

  @override
  String get phaseTargetNumber => 'Zielnummer';

  @override
  String get phaseSelectNumberToBegin => 'Wähle eine Zahl zum Beginnen';

  @override
  String get phaseMemorizeDetails => 'Merke dir die Details';

  @override
  String get phaseReadAndMemorize => 'Details lesen und merken:';

  @override
  String get phaseSolveTheGrid => 'Löse das Gitter';

  @override
  String get phaseDirectionsList => 'Wegbeschreibung:';

  @override
  String get phaseYourStack => 'Dein Stapel';

  @override
  String get phaseEmpty => 'Leer';

  @override
  String get phaseTapToAdd => 'Tippen zum Hinzufügen';

  @override
  String get phaseCalculationLabel => 'Berechnung:';

  @override
  String phaseTimeLeft(int time) {
    return 'Zeit: ${time}s';
  }

  @override
  String get phaseRemember2Back => 'Erinnere dich 2 Schritte zurück';

  @override
  String get phaseMatch => 'Zuordnen';

  @override
  String get hintTypeRhymingWord => 'Gib ein Reimwort ein...';

  @override
  String get hintStartTyping => 'Beginne zu tippen...';

  @override
  String get hintTypeHeardWord => 'Gib das gehörte Wort ein';

  @override
  String get hintTypeGuess => 'Gib deinen Tipp ein...';

  @override
  String get hintTypeAnswerHere => 'Antwort hier eingeben';

  @override
  String get hintEnterNextWord => 'Gib das nächste Wort ein...';

  @override
  String get howToPlayTitle => 'Spielanleitung';

  @override
  String get howToPlayStep1 =>
      '1. Eine geheime Zahl zwischen 1 und 10.000 wird gewählt.';

  @override
  String get howToPlayStep2 =>
      '2. Gib deinen Tipp über das Tastenfeld ein und schicke ihn ab.';

  @override
  String get howToPlayStep3 =>
      '3. Wenn er falsch ist, erhältst du eine Rückmeldung, ob das Geheimnis höher oder niedriger ist.';

  @override
  String get howToPlayStep4 =>
      '4. Du hast genau 15 Versuche, um die geheime Zahl zu finden.';

  @override
  String get noGuessesYet => 'Noch keine Tipps abgegeben';

  @override
  String get chancesLeft => 'Verbleibende Chancen';

  @override
  String get guessesMade => 'Getätigte Tipps';

  @override
  String get feedbackFindNumber => 'Finde die Zahl zwischen 1 und 10.000!';

  @override
  String get feedbackEnterNumber => 'Gib eine Zahl zwischen 1 und 10.000 ein!';

  @override
  String feedbackCorrectExcl(int number) {
    return 'Richtig! Die Zahl war $number.';
  }

  @override
  String get feedbackCorrectEmoji => 'Richtig!';

  @override
  String get feedbackTooLow => 'Zu niedrig';

  @override
  String get feedbackTooHigh => 'Zu hoch';

  @override
  String feedbackGameOver(int number) {
    return 'Spiel vorbei! Die Zahl war $number.';
  }

  @override
  String feedbackGuessResult(int guess, String result) {
    return '$guess ist $result!';
  }

  @override
  String feedbackWinMessage(int number, int guesses) {
    return 'Richtig! Du hast $number mit $guesses verbleibenden Versuchen gefunden!';
  }

  @override
  String feedbackLoseMessage(int number) {
    return 'Keine Versuche mehr übrig! Die Zahl war $number.';
  }

  @override
  String get statTime => 'Zeit';

  @override
  String get statScore => 'Punktzahl';

  @override
  String get statGrid => 'Gitter';

  @override
  String get statMatches => 'Treffer';

  @override
  String get statLives => 'Leben';

  @override
  String get statBeats => 'Schläge';

  @override
  String get statPerfect => 'Perfekt';

  @override
  String get statSeenPool => 'Gesehene Pool';

  @override
  String get statCards => 'Karten';

  @override
  String get statSpan => 'Spanne';

  @override
  String get statLength => 'Länge';

  @override
  String get statItems => 'Elemente';

  @override
  String get statProgress => 'Fortschritt';

  @override
  String get statTrials => 'Versuche';

  @override
  String get statTrails => 'Pfade';

  @override
  String get statMoves => 'Züge';

  @override
  String get statFocalSearch => 'Fokussierte Suche bei Oszillationen';

  @override
  String get phaseMemorizeSequence => 'Merke dir die Reihenfolge der Sequenz';

  @override
  String get phaseDetermineOrder =>
      'Bestimme, welches Element zuerst/zuletzt kam';

  @override
  String get phaseCorrectOrder => 'Richtige Reihenfolge!';

  @override
  String get phaseWrongTimeline => 'Falsche Zeitlinie!';

  @override
  String get phaseWatchPattern => 'Beobachte das Muster';

  @override
  String get phaseRepeatPattern => 'Wiederhole das Muster';

  @override
  String get phaseExcellent => 'Ausgezeichnet!';

  @override
  String get phaseTryAgain => 'Versuche es noch einmal!';

  @override
  String get phaseChooseWordFit => 'Wähle das passende Wort';

  @override
  String get phaseExcellentContextual =>
      'Hervorragende kontextuelle Übereinstimmung!';

  @override
  String get phaseIncorrectMatch => 'Falsche Übereinstimmung';

  @override
  String get phaseMemorizePattern => 'Merke dir das Muster';

  @override
  String get phaseSelectTiles => 'Wähle die Kacheln aus';

  @override
  String get phaseWrongTile => 'Falsche Kachel';

  @override
  String get phaseMemorizeRedCell => 'Merke dir die Position der roten Zelle';

  @override
  String get phaseIsSymmetrical => 'Ist das Muster symmetrisch?';

  @override
  String get phaseRecallSequence =>
      'Rufe die Sequenz in der richtigen Reihenfolge ab';

  @override
  String get phaseGreatJob => 'Großartige Arbeit!';

  @override
  String get phaseChooseNovelCard => 'Wähle eine neue Karte';

  @override
  String get phaseAlreadyTapped => 'Bereits angetippt!';

  @override
  String get phaseCountBlueCircles => 'Zähle nur die blauen Kreise';

  @override
  String get phaseRecallCountsOrder =>
      'Rufe die Anzahl in der richtigen Reihenfolge ab';

  @override
  String get phaseChooseNovel => 'Wähle die neue Karte';

  @override
  String get phaseMemorizeCard => 'Merke dir diese Karte';

  @override
  String get phaseWaitForIt => 'Warte darauf...';

  @override
  String get phaseThatWasSample => 'Das war das Beispiel!';

  @override
  String get phaseSolveDistractor => 'Löse die Ablenkungsfrage!';

  @override
  String get phaseSelectMemorized => 'Wähle die gemerkt Zellen aus';

  @override
  String get phasePerfectRecall => 'Perfekte Erinnerung!';

  @override
  String get phaseWrongExcl => 'Falsch!';

  @override
  String get phaseMemorizePlacements => 'Merke dir alle Platzierungen';

  @override
  String get phaseWaitingForShift => 'Warte auf Layout-Verschiebung...';

  @override
  String get phaseTapMovedObject => 'Tippe auf das Objekt, das sich bewegt hat';

  @override
  String get phaseWrongObject => 'Falsches Objekt!';

  @override
  String get phaseStudyColorShape => 'Studiere die Farb-Form-Verbindungen';

  @override
  String get phaseTapMatchingTrait => 'Tippe auf das passende Merkmal';

  @override
  String get phaseGreatRecall => 'Tolle Erinnerung!';

  @override
  String get phaseWrongLink => 'Falsche Verknüpfung!';

  @override
  String get phaseTrueOrFalse => 'Ist diese Aussage wahr oder falsch?';

  @override
  String get phaseMemorizeLetter => 'Merke dir diesen Buchstaben';

  @override
  String get phaseRecallLettersSequence =>
      'Rufe die Buchstaben der Reihe nach ab';

  @override
  String get phaseMemorizeTileColors => 'Merke dir die Kachelfarben';

  @override
  String get phasePaintCells => 'Färbe die Zellen passend zum Original ein';

  @override
  String get phaseIncorrectMatchExcl => 'Falsche Übereinstimmung!';

  @override
  String get phaseKeepYourEyes => 'Behalte es im Auge!';

  @override
  String get phaseWhereIsTarget => 'Wo ist das Zielobjekt?';

  @override
  String get phaseTrackStar => 'Stern verfolgen';

  @override
  String get dialogIncorrectSequenceStudy =>
      'Falsche Sequenz! Studiere die Geschichte erneut.';

  @override
  String get dialogStoryReconstruct =>
      'Rekonstruiere die Geschichte, indem du Sätze der Reihe nach antippst';

  @override
  String get dialogMemorizeOrder =>
      'Merke dir die chronologische Reihenfolge der Ereignisse';

  @override
  String get dialogMemorizeWordPairs => 'Merke dir diese Wortpaare';

  @override
  String get dialogWhichWordPaired =>
      'Welches Wort war mit dem Zielwort gepaart?';

  @override
  String get dialogWatchSequence => 'Beobachte den Sequenzpfad';

  @override
  String get dialogRepeatPath => 'Wiederhole die Pfadsequenz';

  @override
  String get dialogShapeShifterTap =>
      'Tippe auf Formen, die zum aktiven Ziel passen';

  @override
  String get dialogFocusTunnelTap =>
      'Tippe NUR DANN auf ankommende Formen, wenn sie dem Symbol von vor 2 Schritten entsprechen (2-Back).';

  @override
  String get dialogSequenceStackBuild =>
      'Verfolge Stapeloperationen im Kopf und baue den finalen Stapel von unten nach oben nach.';

  @override
  String get dialogFactorTreeComplete =>
      'Vervollständige den Faktoreibaum, indem du auf Knoten tippst und Faktoren abgleichst!';

  @override
  String get dialogBinaryScaleBalance =>
      'Bringe die Waage ins Gleichgewicht, indem du Zweierpotenzen (Binärgewichte) auswählst, die zusammen das Ziel ergeben.';

  @override
  String get dialogMatrixMultiplierSelect =>
      'Wähle eine Zeile und eine Spalte aus, die multipliziert das Ziel ergeben';

  @override
  String get dialogOddEvenFlashTap =>
      'Tippe auf die Karte, wenn die aktive Regel erfüllt ist';

  @override
  String get dialogBaseConversionConvert =>
      'Konvertiere den Wert von der Quellbasis zur Zielbasis.';

  @override
  String get dialogGhostTapSync =>
      'Synchronisiere dich mit dem Rhythmus und tippe, wenn der unsichtbare Puls seine Höchstgröße erreicht.';

  @override
  String get dialogFrequencyTapIdentify =>
      'Identifiziere, welches pulsierende Licht der angeforderten Ziel Frequenz entspricht.';

  @override
  String get dialogLetterGridSwap =>
      'Tausche benachbarte Buchstaben aus, um die Zielwörter in den Zeilen zu bilden.';

  @override
  String get dialogGraphCoordinatePlot =>
      'Trage die Koordinaten im kartesischen Koordinatensystem ein, welche die Gleichung erfüllen.';

  @override
  String get dialogDigitSwapEquation =>
      'Tausche eine Ziffer aus der oberen Gleichung mit einer aus der unteren Gleichung aus, damit beide stimmen.';

  @override
  String get dialogAreaPerimeterAdjust =>
      'Passe die Rechteckabmessungen an, um Ziel-Fläche und Ziel-Umfang zu erreichen.';

  @override
  String get dialogCrackCipher =>
      'Knacke Mathe-Aufgaben mit Zeichen-Ziffer-Ersetzungs-Chiffren.';

  @override
  String get dialogPeripheralFocus =>
      'Löse Mathe-Gleichungen in der Mitte und tippe auf Seitenpaneele, wenn sie aufleuchten';

  @override
  String get dialogGokigenSatisfy =>
      'Erfülle Scheitelpunkthinweise und vermeide geschlossene Schleifen';

  @override
  String get dialogPercentageCalculate =>
      'Berechne Rabattprozente und Endbeträge an der Kasse.';

  @override
  String get dialogBinomialMatch =>
      'Vergleiche quadratische Formeln mit faktorisierten Binomialwerten.';

  @override
  String get dialogNumberBondsCalculate =>
      'Berechne den fehlenden Wert in der Zahlen-Hierarchie.';

  @override
  String get correctLowercase => 'richtig';

  @override
  String get incorrectLowercase => 'falsch';

  @override
  String get notAValidWord => 'Kein gültiges Wort';

  @override
  String get enterNumberRange => 'GIB EINE ZAHL ZWISCHEN 1 UND 10.000 EIN!';

  @override
  String get correctExclEmoji => 'Richtig!';

  @override
  String get wrongExcl => 'Falsch!';

  @override
  String get kurodokoTitle => 'Kurodoko';

  @override
  String get kurodokoSubtitle =>
      'Platziere schwarze Zellen so, dass Zahlen die genaue Anzahl weißer Zellen sehen.';

  @override
  String get kurodokoWinTitle => 'SCHWARZ GEFÜLLT GELÖST!';

  @override
  String get kurodokoWinMessage =>
      'Du hast die Sichtpfade gemeistert und alle schwarzen Zellen isoliert!';

  @override
  String get subitizingRushTitle => 'Mengen-Blitz';

  @override
  String get subitizingRushSubtitle =>
      'Erkenne sofort die Anzahl aufgeiltreter Punkte ohne zu zählen.';

  @override
  String get subitizingRushWinTitle => 'BLITZSCHNELLE SICHT!';

  @override
  String get subitizingRushWinMessage =>
      'Deine sofortige visuelle Mengeneinschätzung ist herausragend!';

  @override
  String get tapaTitle => 'Tapa';

  @override
  String get tapaSubtitle =>
      'Schattiere Zellen, um eine zusammenhängende Wand ohne 2x2-Blöcke zu bilden.';

  @override
  String get tapaWinTitle => 'TAPA-WAND VOLLENDET!';

  @override
  String get tapaWinMessage =>
      'Alle nummerierten Zellenbeschränkungen perfekt erfüllt!';

  @override
  String get exponentTowerTitle => 'Potenzturm';

  @override
  String get exponentTowerSubtitle =>
      'Ordne dynamische Potenzausdrücke von klein nach groß.';

  @override
  String get exponentTowerWinTitle => 'TURM GESTAPELT!';

  @override
  String get exponentTowerWinMessage =>
      'Alle Potenzgrößen mit perfekter Präzision berechnet!';

  @override
  String get posnerSpatialCueingTitle => 'Räumlicher Hinweis';

  @override
  String get posnerSpatialCueingSubtitle =>
      'Reagiere schnell auf gerichtete Zielerscheinungen nach räumlichen Hinweisen.';

  @override
  String get posnerSpatialCueingWinTitle => 'AUFMERKSAME SICHT!';

  @override
  String get posnerSpatialCueingWinMessage =>
      'Schnelle visuelle Ausrichtung und Reizerkennung aufgezeichnet!';

  @override
  String get gearTrainDirectionTitle => 'Geteiltes Getriebe';

  @override
  String get gearTrainDirectionSubtitle =>
      'Leite die Rotationsrichtung des Zielzahnrads im mechanischen Zug ab.';

  @override
  String get gearTrainDirectionWinTitle => 'MECHANISMUS GELÖST!';

  @override
  String get gearTrainDirectionWinMessage =>
      'Kinematische Zahnrad-Drehungsübertragungen präzise nachverfolgt!';

  @override
  String get continuousPairedAssociateTitle => 'Paar-Assoziation';

  @override
  String get continuousPairedAssociateSubtitle =>
      'Merke dir Symbolpaare und rufe den passenden Partner ab.';

  @override
  String get continuousPairedAssociateWinTitle => 'PAARE VERKNÜPFT!';

  @override
  String get continuousPairedAssociateWinMessage =>
      'Starke assoziative Gedächtnisbahnen aufgebaut!';

  @override
  String get heyawakeWinTitle => 'RÄUME AUSGEGLICHEN!';

  @override
  String get heyawakeWinMessage =>
      'Alle Raumteilungsregeln und weißen Pfadverbindungen erfüllt!';

  @override
  String get setTheoryVennTitle => 'Venn-Mengen';

  @override
  String get setTheoryVennSubtitle =>
      'Wähle die entsprechenden Bereiche des Venn-Diagramms für die Mengenformel aus.';

  @override
  String get setTheoryVennWinTitle => 'MENGENLOGIK-MEISTER!';

  @override
  String get setTheoryVennWinMessage =>
      'Alle Mengenoperationen, Vereinigungen und Schnitte fehlerfrei hergeleitet!';

  @override
  String get navonHierarchicalTitle => 'Navon Global';

  @override
  String get navonHierarchicalSubtitle =>
      'Identifiziere entweder den großen globalen Buchstaben oder kleine lokale Buchstaben gemäß Anweisungsregeln.';

  @override
  String get navonHierarchicalWinTitle => 'FOKUS GESCHÄRFT!';

  @override
  String get navonHierarchicalWinMessage =>
      'Hervorragende selektive Aufmerksamkeit und global-lokale Wahrnehmung!';

  @override
  String get masyuWinTitle => 'MASYU-SCHLEIFE GELÖST!';

  @override
  String get masyuWinMessage =>
      'Alle Perlenbiege- und geraden Durchgangsregeln strikt erfüllt!';

  @override
  String get primeGapHuntTitle => 'Primzahl-Lücke';

  @override
  String get primeGapHuntSubtitle =>
      'Berechne den arithmetischen Abstand zwischen aufeinanderfolgenden Primzahlen.';

  @override
  String get primeGapHuntWinTitle => 'LÜCKE BERECHNET!';

  @override
  String get primeGapHuntWinMessage =>
      'Beherrschung der Primzahlverteilung und mentalen Subtraktion gezeigt!';

  @override
  String get yajilinWinTitle => 'YAJILIN GELÖST!';

  @override
  String get yajilinWinMessage =>
      'Alle Pfeilhinweis-Strahlungen und orthogonalen Trennungen schwarzer Zellen erfüllt!';

  @override
  String get algebraicInequalitySolverTitle => 'Ungleichung';

  @override
  String get algebraicInequalitySolverSubtitle =>
      'Löse lineare algebraische Ungleichungen mit einer Variablen schnell.';

  @override
  String get algebraicInequalitySolverWinTitle => 'ALGEBRA-EXPERTE!';

  @override
  String get algebraicInequalitySolverWinMessage =>
      'Schnelle Ungleichungsreduktion und algebraisches Gleichgewicht erreicht!';

  @override
  String get attentionalBlinkProbeTitle => 'Aufmerksamkeits-Blink';

  @override
  String get attentionalBlinkProbeSubtitle =>
      'Erkenne zweite Zielreize, die schnell nach den Primärzielen präsentiert werden.';

  @override
  String get attentionalBlinkProbeWinTitle => 'ZEITLICHER FOKUS!';

  @override
  String get attentionalBlinkProbeWinMessage =>
      'Außergewöhnliche zeitliche visuelle Verarbeitung über das Blink-Refraktärfenster hinweg!';

  @override
  String get modularClockArithmeticTitle => 'Uhren-Modulo';

  @override
  String get modularClockArithmeticSubtitle =>
      'Berechne zyklische Uhrzeit-Arithmetik unter Modulo-12-Algebra.';

  @override
  String get modularClockArithmeticWinTitle => 'UHRWERK-PRÄZISION!';

  @override
  String get modularClockArithmeticWinMessage =>
      'Alle modularen Stundenverschiebungen mit Leichtigkeit berechnet!';

  @override
  String get temporalOrderJudgmentTitle => 'Zeitliche Reihenfolge';

  @override
  String get temporalOrderJudgmentSubtitle =>
      'Unterscheide, welcher von zwei millisekundengenau getrennten Reizkreisen zuerst aufblinkte.';

  @override
  String get temporalOrderJudgmentWinTitle => 'ULTRA-SCHNELLE WAHRNEHMUNG!';

  @override
  String get temporalOrderJudgmentWinMessage =>
      'Hochauflösende zeitliche Unterscheidung demonstriert!';

  @override
  String get polyominoTilingTitle => 'Polyomino';

  @override
  String get polyominoTilingSubtitle =>
      'Drehe und setze Tetromino-geometrische Formen zusammen, um das Gitter lückenlos zu füllen.';

  @override
  String get polyominoTilingWinTitle => 'GITTER GEFLIEST!';

  @override
  String get polyominoTilingWinMessage =>
      'Nahtlose geometrische räumliche Anordnung abgeschlossen!';

  @override
  String get pythagoreanTripleBuilderTitle => 'Pythagoras';

  @override
  String get pythagoreanTripleBuilderSubtitle =>
      'Finde den fehlenden Hypotenusen- oder Kathetenwert in ganzzahligen pythagoreischen Dreiecken.';

  @override
  String get pythagoreanTripleBuilderWinTitle => 'GEOMETRIE-MEISTER!';

  @override
  String get pythagoreanTripleBuilderWinMessage =>
      'Alle rechtwinkligen ganzzahligen Dreiertupel schnell gelöst!';

  @override
  String get visualSearchConjunctionTitle => 'Konjunktionssuche';

  @override
  String get visualSearchConjunctionSubtitle =>
      'Finde schnell Zielformen, die mehrere Merkmalsdimensionen (Farbe und Form) kombinieren.';

  @override
  String get visualSearchConjunctionWinTitle => 'KONJUNKTIONS-FOKUS!';

  @override
  String get visualSearchConjunctionWinMessage =>
      'Makellose parallele und serielle Visuelle Suche mit mehreren Merkmalen!';

  @override
  String get wireframe3DRotationTitle => 'Drahtmodell 3D';

  @override
  String get wireframe3DRotationSubtitle =>
      'Identifiziere das korrekt rotierte geometrische 3D-Drahtmodell nach einer Winkeltransformation.';

  @override
  String get wireframe3DRotationWinTitle => '3D-ROTATIONS-MEISTER!';

  @override
  String get wireframe3DRotationWinMessage =>
      'Präzise mentale 3D-Rotation und räumliche Orientierung demonstriert!';

  @override
  String get wordPairAssociateMemoryTitle => 'Wortpaare';

  @override
  String get wordPairAssociateMemorySubtitle =>
      'Merke dir assoziierte Wortverbindungen und wähle den Partner aus, der mit dem Stichwort gepaart ist.';

  @override
  String get wordPairAssociateMemoryWinTitle => 'ASSOZIATIONS-MEISTER!';

  @override
  String get wordPairAssociateMemoryWinMessage =>
      'Starke episodische assoziative Gedächtnisleistung erreicht!';

  @override
  String get binaryMatrixRankTitle => 'Matrix-Rang';

  @override
  String get binaryMatrixRankSubtitle =>
      'Bestimme den linearen algebraischen Rang der binären 3x3-Matrix über dem Galois-Körper GF(2).';

  @override
  String get binaryMatrixRankWinTitle => 'RANG BERECHNET!';

  @override
  String get binaryMatrixRankWinMessage =>
      'Exakte lineare Unabhängigkeit und Matrix-Rang ermittelt!';

  @override
  String get visualCrowdingAcuityTitle => 'Visuelles Gedränge';

  @override
  String get visualCrowdingAcuitySubtitle =>
      'Identifiziere die Öffnungsrichtung des mittleren Landolt-Rings inmitten von Störobjekten.';

  @override
  String get visualCrowdingAcuityWinTitle => 'SCHARFE WAHRNEHMUNG!';

  @override
  String get visualCrowdingAcuityWinMessage =>
      'Hervorragende foveale räumliche Auflösung unter Bedingungen visueller Gedrängtheit!';

  @override
  String get probeDigitSpanTitle => 'Ziffern-Sonde';

  @override
  String get probeDigitSpanSubtitle =>
      'Beobachte eine schnelle serielle Zahlenfolge und rufe das Element ab, das auf die Sondenziffer folgt.';

  @override
  String get probeDigitSpanWinTitle => 'SERIEN-SONDEN-MEISTER!';

  @override
  String get probeDigitSpanWinMessage =>
      'Makelloser Kurzzeit-Serienpositions-Gedächtnisabruf!';

  @override
  String get abReversalOddballTitle => 'A-B-Umkehr';

  @override
  String get abReversalOddballSubtitle =>
      'Reagiere auf Zielreize und wechsle bei Regelumkehr dynamisch die Reaktionskriterien.';

  @override
  String get abReversalOddballWinTitle => 'FLEXIBILITÄTS-MEISTER!';

  @override
  String get abReversalOddballWinMessage =>
      'Außergewöhnliche kognitive Umschaltung und perzeptuelle Flexibilität demonstriert!';

  @override
  String get conundrumAnagramTitle => 'Anagramm-Rätsel';

  @override
  String get conundrumAnagramSubtitle =>
      'Entschlüssele alle 9 Buchstaben, um das versteckte vollständige Wörterbuchwort zu finden.';

  @override
  String get conundrumAnagramWinTitle => 'RÄTSEL GEKNACKT!';

  @override
  String get conundrumAnagramWinMessage =>
      'Alle 9-Buchstaben-Anagramm-Rätsel erfolgreich entschlüsselt!';

  @override
  String get vectorDotProductTitle => 'Skalarprodukt';

  @override
  String get vectorDotProductSubtitle =>
      'Berechne das algebraische innere Produkt u • v = (u_x * v_x) + (u_y * v_y).';

  @override
  String get vectorDotProductWinTitle => 'INNERES PRODUKT BERECHNET!';

  @override
  String get vectorDotProductWinMessage =>
      'Exakte geometrische und algebraische Vektorprojektionen erreicht!';

  @override
  String get stroopNumberSizeTitle => 'Größen-Stroop';

  @override
  String get stroopNumberSizeSubtitle =>
      'Vergleiche entweder die numerische Größe oder die physische Schriftgröße unter Stroop-Interferenz.';

  @override
  String get stroopNumberSizeWinTitle => 'INHIBITIONS-EXPERTE!';

  @override
  String get stroopNumberSizeWinMessage =>
      'Makellose perzeptuelle Konfliktlösung beim größenkongruenten Stroop-Effekt!';

  @override
  String get wordLadderStepTitle => 'Wortkette';

  @override
  String get wordLadderStepSubtitle =>
      'Vervollständige die Ein-Buchstaben-Transformationssequenz zwischen Quell- und Zielwörtern.';

  @override
  String get wordLadderStepWinTitle => 'LEITER ERKLOMMEN!';

  @override
  String get wordLadderStepWinMessage =>
      'Alle Ein-Buchstaben-Schritt-Transformationen abgeschlossen!';

  @override
  String get corsiBackwardSpanTitle => 'Corsi Rückwärts';

  @override
  String get corsiBackwardSpanSubtitle =>
      'Beobachte ein sequenzielles räumliches Block-Tippmuster und gib es in exakter umgekehrter Reihenfolge wieder.';

  @override
  String get corsiBackwardSpanWinTitle => 'RÜCKWÄRTS-SPANNE-PROFI!';

  @override
  String get corsiBackwardSpanWinMessage =>
      'Außergewöhnliche visuell-räumliche Arbeitsgedächtnismanipulation und umgekehrte Sequenzierung!';
}
