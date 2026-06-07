// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Puzzle Hub';

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
  String get verbalAnalogiesTitle => 'Analogie-Meister!';

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
  String get tangleFixTitle => 'Entwirrt!';

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
  String get mirrorTracingTitle => 'Perfekt nachgezeichnet!';

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
  String get paperFoldingTitle => 'Perfekt entfaltet!';

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
}
