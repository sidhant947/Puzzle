// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Puzzle Hub';

  @override
  String get home => 'Home';

  @override
  String get settings => 'Impostazioni';

  @override
  String get playAgain => 'Gioca ancora';

  @override
  String get seeCompleted => 'Vedi completato';

  @override
  String get finish => 'Fine';

  @override
  String get congrats => 'Congratulazioni';

  @override
  String get perfectGradient => 'Gradiente perfetto!';

  @override
  String get wellDone => 'Ben fatto';

  @override
  String get timeUp => 'Tempo scaduto!';

  @override
  String get completed => 'Completato!';

  @override
  String get score => 'Punteggio';

  @override
  String get timeLeft => 'Tempo';

  @override
  String get trials => 'Prove';

  @override
  String get numberRule => 'Regola del numero';

  @override
  String get colorRule => 'Regola del colore';

  @override
  String get valid => 'Valido';

  @override
  String get invalid => 'Non valido';

  @override
  String get even => 'Pari';

  @override
  String get odd => 'Dispari';

  @override
  String get red => 'Rosso';

  @override
  String get green => 'Verde';

  @override
  String get blue => 'Blu';

  @override
  String get yes => 'Sì';

  @override
  String get no => 'No';

  @override
  String get trueLabel => 'Vero';

  @override
  String get falseLabel => 'Falso';

  @override
  String get clear => 'Cancella';

  @override
  String get north => 'Nord';

  @override
  String get south => 'Sud';

  @override
  String get east => 'Est';

  @override
  String get west => 'Ovest';

  @override
  String get target => 'Obiettivo';

  @override
  String get moves => 'Mosse';

  @override
  String get trialMode => 'Modalità Prova';

  @override
  String get trialModeDescription =>
      'Risolvi 20 per finire invece del timer da 60s';

  @override
  String get appearance => 'Aspetto';

  @override
  String get language => 'Lingua';

  @override
  String get gameplay => 'Gameplay';

  @override
  String get supportUs => 'Supportaci';

  @override
  String get systemLegal => 'Sistema e Note Legali';

  @override
  String get games => 'Giochi';

  @override
  String get solvedToday => 'Risolti oggi';

  @override
  String get searchGames => 'Cerca giochi...';

  @override
  String get readyToStart => 'PRONTO A INIZIARE IL TUO ALLENAMENTO CEREBRALE?';

  @override
  String get greatStart => 'GRANDE INIZIO! CONTINUA COSÌ.';

  @override
  String get onFire => 'SEI UN FUOCO! IL TUO CERVELLO ADORA TUTTO QUESTO.';

  @override
  String get incredible => 'INCREDIBILE! SEI UN MAESTRO DEI PUZZLE.';

  @override
  String get noGamesMatch => 'NESSUN GIOCO CORRISPONDE ALLA TUA RICERCA';

  @override
  String get categoryAll => 'TUTTI';

  @override
  String get categoryAttention => 'ATTENZIONE';

  @override
  String get categoryLogic => 'LOGICA';

  @override
  String get categoryMath => 'MATEMATICA';

  @override
  String get categoryWord => 'PAROLE';

  @override
  String get categoryMemory => 'MEMORIA';

  @override
  String get categorySpatial => 'SPAZIALE';

  @override
  String get themeLight => 'CHIARO';

  @override
  String get themeDark => 'SCURO';

  @override
  String get themeSystem => 'SISTEMA';

  @override
  String get starOnGithub => 'Stella su GitHub';

  @override
  String get sponsorOnGithub => 'Sponsor su GitHub';

  @override
  String get privacyPolicy => 'Informativa sulla Privacy';

  @override
  String get termsOfService => 'Termini di Servizio';

  @override
  String get licenses => 'Licenze';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return 'Hai $maxTries tentativi per trovare la parola nascosta di $wordLength lettere.';
  }

  @override
  String wordFoundMessage(String word) {
    return 'Parola trovata con successo: $word';
  }

  @override
  String gameOverMessage(String word) {
    return 'La parola era: $word';
  }

  @override
  String get gameOver => 'Fine Giochi';

  @override
  String get crosswordTitle => 'Parole Crociate';

  @override
  String get crosswordSubtitle =>
      'Completa la griglia con le parole corrette basandoti sugli indizi forniti.';

  @override
  String get wordSearchTitle => 'Ricerca Parole';

  @override
  String get radicalRootsTitle => 'Radical Roots';

  @override
  String get radicalRootsSubtitle =>
      'Find the square or cube root of the given number. Round to the nearest integer if necessary.';

  @override
  String get radicalRootsGoalReached => 'Goal Reached!';

  @override
  String get radicalRootsTimeUp => 'Time\'s Up!';

  @override
  String radicalRootsScoreMessage(int score) {
    return 'You calculated $score roots correctly!';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return 'Keep practicing! You calculated $score roots.';
  }

  @override
  String get radicalRootsStart => 'Start Calculating';

  @override
  String get radicalRootsDescription =>
      'You have 60 seconds to solve as many as you can.';

  @override
  String get radicalRootsBest => 'Best';

  @override
  String get radicalRootsSeconds => '60 SECONDS';

  @override
  String get romanArithmeticTitle => 'Roman Arithmetic';

  @override
  String get romanArithmeticSubtitle =>
      'Solve addition and subtraction problems using Roman Numerals.';

  @override
  String get romanArithmeticGoalReached => 'Centurion Level!';

  @override
  String get romanArithmeticTimeUp => 'Time\'s Up!';

  @override
  String romanArithmeticScoreMessage(int score) {
    return 'You solved $score Roman problems!';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return 'Veni, Vidi, Vici! You solved $score problems.';
  }

  @override
  String get romanArithmeticStart => 'Begin Quest';

  @override
  String get romanArithmeticDescription =>
      'Convert and solve. You have 60 seconds.';

  @override
  String get romanArithmeticBest => 'Best';

  @override
  String get romanArithmeticSeconds => '60 SECONDS';

  @override
  String get wordSearchSubtitle =>
      'Trova tutte le parole nascoste nella griglia. Trascina per selezionare.';

  @override
  String get missingVowelsTitle => 'Vocali Mancanti';

  @override
  String get missingVowelsSubtitle =>
      'Identifica la parola con le sue vocali nascoste.';

  @override
  String get missingVowelsWin => 'Vocali Ripristinate!';

  @override
  String get missingVowelsHowToPlay =>
      'Una parola viene mostrata con le sue vocali (A, E, I, O, U) nascoste. Indovina la parola completa!';

  @override
  String get wordScrambleTitle => 'Parola Mescolata';

  @override
  String get wordScrambleSubtitle =>
      'Tocca le lettere per riordinare la parola nascosta!';

  @override
  String get wordScrambleWin => 'Parola Svelata!';

  @override
  String get sudokuTitle => 'Sudoku';

  @override
  String get sudokuSubtitle =>
      'Completa la griglia in modo che ogni riga, colonna e riquadro 3x3 contenga tutte le cifre da 1 a 9.';

  @override
  String get minesweeperTitle => 'Campo Minato';

  @override
  String get minesweeperSubtitle => 'Identifica tutte le mine senza attivarle.';

  @override
  String get minesweeperWin => 'Vittoria!';

  @override
  String get minesweeperMines => 'MINE';

  @override
  String get minesweeperStatus => 'STATO';

  @override
  String get minesweeperWon => 'VINTO';

  @override
  String get minesweeperBoom => 'BOOM';

  @override
  String get minesweeperPlaying => 'IN GIOCO';

  @override
  String get minesweeperReveal => 'RIVELA';

  @override
  String get minesweeperFlag => 'BANDIERA';

  @override
  String get game2048Title => '2048';

  @override
  String get game2048Subtitle =>
      'Scorri in qualsiasi direzione per unire le tessere e raggiungere la tessera 2048!';

  @override
  String get nonogramTitle => 'Nonogram';

  @override
  String get nonogramSubtitle =>
      'Rivela l\'immagine nascosta usando indizi logici.';

  @override
  String get nonogramWin => 'Immagine Rivelata!';

  @override
  String get pathFinderTitle => 'Cercatore di Percorsi';

  @override
  String get pathFinderSubtitle => 'Trova il percorso nascosto da S a E.';

  @override
  String get pathFinderWin => 'Percorso Padroneggiato!';

  @override
  String get howToPlay => 'Come giocare';

  @override
  String get gotIt => 'Capito';

  @override
  String get akariTitle => 'Akari';

  @override
  String get akariSubtitle => 'Illumina tutte le celle bianche';

  @override
  String get akariHowToPlay =>
      'Posiziona le lampadine nelle celle bianche per illuminare l\'intera griglia. Le lampadine illuminano la loro riga e colonna finché non colpiscono un muro. Due lampadine non possono illuminarsi a vicenda. I muri numerati mostrano esattamente quante lampadine devono essere posizionate nelle celle adiacenti (su, giù, sinistra, destra).';

  @override
  String get akariWinTitle => 'LUCI ACCESE!';

  @override
  String get akariWinMessage => 'Tutto è perfettamente illuminato.';

  @override
  String get arithmeticChainTitle => 'Catena Aritmetica';

  @override
  String get arithmeticChainSubtitle => 'Calcola il totale parziale a mente';

  @override
  String get arithmeticChainWinTitle => 'LIVELLO SUPERATO!';

  @override
  String get arithmeticChainWinMessage =>
      'Il tuo calcolo mentale è formidabile!';

  @override
  String get arithmeticChainLoseTitle => 'RIPROVA';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return 'La risposta corretta era $answer.';
  }

  @override
  String get arithmeticChainStart => 'INIZIA';

  @override
  String get arithmeticChainNext => 'AVANTI';

  @override
  String get attentionalBlinkTitle => 'Blink Attentivo';

  @override
  String get attentionalBlinkSubtitleWatch => 'OSSERVA I NUMERI';

  @override
  String get attentionalBlinkSubtitleInput =>
      'INSERISCI I DUE NUMERI CHE HAI VISTO';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return 'Hai totalizzato $score obiettivi!';
  }

  @override
  String get balanceScaleTitle => 'BILANCIA';

  @override
  String get balanceScaleSubtitle =>
      'Deduci il peso dell\'ultimo oggetto in base alle bilance.';

  @override
  String get balanceScaleWinTitle => 'BILANCIATO!';

  @override
  String get balanceScaleWinMessage => 'Hai dedotto correttamente il peso!';

  @override
  String get balanceScaleLoseTitle => 'SBILANCIATO';

  @override
  String get balanceScaleLoseMessage =>
      'Riprova a trovare il giusto equilibrio.';

  @override
  String get balanceScaleBack => 'INDIETRO';

  @override
  String get balanceScaleSubmit => 'INVIA';

  @override
  String get binaryPuzzleTitle => 'PUZZLE BINARIO';

  @override
  String get binaryPuzzleSubtitle =>
      'Riempi con 0 e 1. Massimo due cifre uguali adiacenti. Numero uguale di 0 e 1 in ogni riga e colonna.';

  @override
  String get binaryPuzzleWinTitle => 'BEN FATTO';

  @override
  String get binaryPuzzleWinMessage =>
      'Hai risolto il puzzle binario con una logica perfetta!';

  @override
  String get blockEscapeTitle => 'FUGA DI BLOCCHI';

  @override
  String get blockEscapeSubtitle =>
      'Fai scorrere i blocchi per liberare un percorso affinché il blocco principale raggiunga l\'uscita.';

  @override
  String get blockEscapeWinTitle => 'FUGA!';

  @override
  String get blockEscapeWinMessage =>
      'Hai liberato con successo il percorso per il blocco principale!';

  @override
  String get boxCompletionTitle => 'Completamento Scatola';

  @override
  String get boxCompletionSubtitle => 'Quale cubo può essere formato?';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return 'Hai risposto correttamente a $score su $totalTrials!';
  }

  @override
  String get boxCompletionOptions => 'OPZIONI';

  @override
  String get bridgesTitle => 'PONTI';

  @override
  String get bridgesSubtitle =>
      'Collega le isole con i ponti. Ogni isola ha bisogno di un numero specifico di ponti. I ponti non possono incrociarsi.';

  @override
  String get bridgesWinTitle => 'COLLEGATO!';

  @override
  String get bridgesWinMessage => 'Hai collegato con successo tutte le isole!';

  @override
  String get calculationSprintTitle => 'SPRINT DI CALCOLO';

  @override
  String get calculationSprintSubtitle =>
      'Risolvi quante più equazioni possibile in 60 secondi.';

  @override
  String get calculationSprintGoalReached => 'OBIETTIVO RAGGIUNTO!';

  @override
  String get calculationSprintTimeUp => 'TEMPO SCADUTO';

  @override
  String calculationSprintScoreMessage(int score) {
    return 'Eccellente velocità di calcolo! Hai totalizzato $score punti.';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return 'Hai totalizzato $score punti. Prova a superare il tuo record!';
  }

  @override
  String get calculationSprintBest => 'MIGLIORE';

  @override
  String get calculationSprintSeconds => '60 SECONDI';

  @override
  String get calculationSprintDescription =>
      'Risolvi le equazioni velocemente.\nLe risposte sbagliate deducono 3 secondi!';

  @override
  String get calculationSprintStart => 'INIZIA SPRINT';

  @override
  String get categoryFluencyTitle => 'Fluenza di Categoria';

  @override
  String get categoryFluencySubtitle =>
      'Inserisci elementi appartenenti alla categoria';

  @override
  String get categoryFluencyExpert => 'ESPERTO DI FLUENZA!';

  @override
  String get categoryFluencyTimeUp => 'TEMPO SCADUTO!';

  @override
  String get categoryFluencyWinMessage => 'Hai un vasto vocabolario!';

  @override
  String categoryFluencyFoundMessage(int count) {
    return 'Hai trovato $count parole.';
  }

  @override
  String get categoryFluencyCategoryLabel => 'Categoria:';

  @override
  String get categoryFluencyEnterItem => 'Inserisci un elemento...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target parole';
  }

  @override
  String get changeBlindnessTitle => 'Cecità al Cambiamento';

  @override
  String get changeBlindnessSubtitle => 'INDIVIDUA L\'ELEMENTO CHE CAMBIA';

  @override
  String changeBlindnessScore(int score) {
    return 'PUNTEGGIO: $score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return 'Hai trovato $score cambiamenti!';
  }

  @override
  String get choiceRtTitle => 'Scelta RT';

  @override
  String get choiceRtSubtitle =>
      'Tocca il quadrato attivo il più velocemente possibile';

  @override
  String choiceRtAvgMessage(String avg) {
    return 'Il tuo tempo di reazione medio: ${avg}ms';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return 'Tempo rimanente: ${time}s';
  }

  @override
  String choiceRtTaps(int count) {
    return 'Tocchi: $count';
  }

  @override
  String get colorFloodTitle => 'Inondazione di Colore';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return 'Mosse: $moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => 'INONDAZIONE RIUSCITA!';

  @override
  String get colorFloodDryLand => 'TERRA SECCA...';

  @override
  String get colorFloodWinMessage =>
      'Hai saturato l\'intera griglia di colore!';

  @override
  String get colorFloodLoseMessage => 'Hai esaurito le mosse. Riprova!';

  @override
  String get colorMatchTitle => 'CORRISPONDENZA COLORE';

  @override
  String get colorMatchSubtitle =>
      'Regola i cursori per abbinare il colore target il più fedelmente possibile.';

  @override
  String get colorMatchTarget => 'OBIETTIVO';

  @override
  String get colorMatchYours => 'TUO';

  @override
  String get colorMatchCheck => 'CONTROLLA CORRISPONDENZA';

  @override
  String get colorMatchResult => 'RISULTATO CORRISPONDENZA';

  @override
  String colorMatchAccuracy(String accuracy) {
    return 'La tua precisione: $accuracy%';
  }

  @override
  String get corsiBlocksTitle => 'CORSI BLOCKS';

  @override
  String get corsiBlocksSubtitle =>
      'Guarda i blocchi che si illuminano e toccali nello stesso ordine.';

  @override
  String get corsiBlocksWinTitle => 'MAESTRO SPAZIALE!';

  @override
  String get corsiBlocksLoseTitle => 'PERSO NELLO SPAZIO';

  @override
  String corsiBlocksMessage(int score, int span) {
    return 'Hai ricordato $score sequenze! La tua estensione di memoria spaziale ha raggiunto $span.';
  }

  @override
  String get corsiBlocksWatch => 'OSSERVA IL MODELLO';

  @override
  String get corsiBlocksRepeat => 'RIPETI IL MODELLO';

  @override
  String get corsiBlocksExcellent => 'ECCELLENTE!';

  @override
  String get corsiBlocksSpan => 'ESTENSIONE';

  @override
  String get crownTitle => 'CORONA';

  @override
  String get crownSubtitle =>
      'Posiziona una corona in ogni riga, colonna e regione di colore. Le corone non possono essere adiacenti, nemmeno in diagonale.';

  @override
  String get crownCrowned => 'INCORONATO!';

  @override
  String get crownSuccess =>
      'Tutte le corone posizionate con successo con una logica perfetta.';

  @override
  String get cryptogramTitle => 'CRITTOGRAMMA';

  @override
  String get cryptogramSubtitle =>
      'Assegna le lettere per decodificare il messaggio segreto! Ogni lettera codificata rappresenta una lettera reale.';

  @override
  String get cryptogramBroken => 'CODICE VIOLATO!';

  @override
  String get cryptogramEncrypted => 'CRITTOGRAFATO';

  @override
  String get cryptogramSuccess =>
      'Hai decodificato il messaggio perfettamente.';

  @override
  String get cryptogramTryAgain => 'Riprova a violare la crittografia.';

  @override
  String get digitSpanReverseTitle => 'Estensione Inversa';

  @override
  String get digitSpanReverseSubtitleMemorize => 'Memorizza le cifre';

  @override
  String get digitSpanReverseSubtitleEnter =>
      'Inserisci le cifre in ordine INVERSO';

  @override
  String get digitSpanReverseWinTitle => 'LIVELLO SUPERATO!';

  @override
  String get digitSpanReverseWinMessage =>
      'La tua memoria di lavoro è impressionante!';

  @override
  String get digitSpanReverseLoseTitle => 'RIPROVA';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return 'La sequenza inversa corretta era $sequence.';
  }

  @override
  String get dividedAttentionTitle => 'Attenzione Divisa';

  @override
  String get dividedAttentionSubtitle =>
      'Tocca a SINISTRA per STELLA ⭐ | Tocca a DESTRA per ROSSO 🔴';

  @override
  String get dividedAttentionGameOverTitle => 'FOCUS INTERROTTO';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return 'Il multitasking è difficile! Il tuo punteggio è stato $score.';
  }

  @override
  String dividedAttentionScore(int score) {
    return 'PUNTEGGIO: $score';
  }

  @override
  String get doubleNBackTitle => 'Double N-Back';

  @override
  String doubleNBackSubtitle(int n) {
    return 'Abbina gli stimoli $n passi indietro';
  }

  @override
  String get doubleNBackGameOverTitle => 'FINE GIOCHI';

  @override
  String doubleNBackGameOverMessage(int score) {
    return 'Hai totalizzato $score punti in Double N-Back!';
  }

  @override
  String doubleNBackScore(int score) {
    return 'Punteggio: $score';
  }

  @override
  String get doubleNBackPositionMatch => 'CORRISPONDENZA POSIZIONE';

  @override
  String get doubleNBackLetterMatch => 'CORRISPONDENZA LETTERA';

  @override
  String get faceNameAssociationTitle => 'Viso-Nome';

  @override
  String get faceNameAssociationSubtitleStudy =>
      'Memorizza il nome per ogni viso';

  @override
  String get faceNameAssociationSubtitleTest => 'Chi è questo?';

  @override
  String get faceNameAssociationPerfect => 'PERFETTO!';

  @override
  String get faceNameAssociationGameOver => 'FINE GIOCHI';

  @override
  String get faceNameAssociationWinMessage =>
      'Hai un\'ottima memoria per visi e nomi!';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return 'Hai indovinato $correct su $total.';
  }

  @override
  String get faceNameAssociationStartTest => 'INIZIA TEST';

  @override
  String get flankerTestWinTitle => 'FOCUS LASER!';

  @override
  String get flankerTestLoseTitle => 'DISTRATTO';

  @override
  String flankerTestScoreMessage(int score) {
    return 'Hai risposto correttamente a $score!';
  }

  @override
  String get flankerTestTitle => 'TEST DI FLANKER';

  @override
  String get flankerTestSubtitle =>
      'Indica la direzione della freccia centrale, ignorando le frecce laterali.';

  @override
  String get flankerTestLeft => 'SINISTRA';

  @override
  String get flankerTestRight => 'DESTRA';

  @override
  String get fractionMatchTitle => 'Corrispondenza Frazioni';

  @override
  String get fractionMatchSubtitle => 'Abbina l\'immagine alla sua frazione';

  @override
  String get fractionMatchLoseTitle => 'DISCORDANZA FRAZIONI';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return 'La risposta corretta era $correctAnswer.';
  }

  @override
  String get goNoGoTitle => 'Go / No-Go';

  @override
  String get goNoGoSubtitle => 'Tocca per il Verde, IGNORA il Rosso!';

  @override
  String get goNoGoLoseTitle => 'REAZIONE INTERROTTA';

  @override
  String get goNoGoLoseMessage =>
      'Il tuo controllo inibitorio viene messo alla prova!';

  @override
  String get goNoGoTapAnywhere => 'TOCCA OVUNQUE PER INIZIARE';

  @override
  String get groceryListTitle => 'Lista della Spesa';

  @override
  String get groceryListSubtitleMemorize =>
      'Memorizza gli articoli e le loro categorie';

  @override
  String get groceryListSubtitleTest =>
      'A quale categoria apparteneva questo articolo?';

  @override
  String get groceryListWinTitle => 'GURU DELLA SPESA!';

  @override
  String get groceryListLoseTitle => 'DIMENTICATO QUALCOSA?';

  @override
  String groceryListScoreMessage(int score) {
    return 'Hai totalizzato $score punti in Lista della Spesa!';
  }

  @override
  String get groceryListReady => 'SONO PRONTO';

  @override
  String get groceryListWhereBelong => 'DOVE APPARTIENE QUESTO?';

  @override
  String get hueSortTitle => 'ORDINE TONALITÀ';

  @override
  String get hueSortSubtitle =>
      'Scambia le tessere per creare una transizione fluida tra i colori degli angoli. I punti indicano le tessere fisse.';

  @override
  String get hueSortWinTitle => 'GRADIENTE PERFETTO!';

  @override
  String get hueSortWinMessage =>
      'Hai ordinato perfettamente lo spettro dei colori!';

  @override
  String hueSortWrongTiles(int count) {
    return 'Tiles in wrong position: $count';
  }

  @override
  String get kenkenTitle => 'KenKen';

  @override
  String get kenkenWinTitle => 'GENIO!';

  @override
  String get kenkenLoseTitle => 'FINE GIOCHI';

  @override
  String get kenkenWinMessage => 'Hai risolto il puzzle KenKen!';

  @override
  String get kenkenLoseMessage =>
      'Controlla le regole di riga/colonna e gabbia.';

  @override
  String kenkenSubtitle(int size) {
    return 'Riempi 1-$size senza ripetizioni in righe/colonne';
  }

  @override
  String get letterCancellationTitle => 'Cancella Lettera';

  @override
  String get letterCancellationTitleFull => 'Cancellazione Lettera';

  @override
  String letterCancellationScoreMessage(int score) {
    return 'Hai trovato $score lettere!';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return 'Trova tutte le lettere \"$target\"';
  }

  @override
  String get letterCancellationFound => 'TROVATE';

  @override
  String get letterCancellationTime => 'TEMPO';

  @override
  String get lightsOutTitle => 'LUCI SPENTE';

  @override
  String get lightsOutSubtitle =>
      'Toccando una tessera si commuta essa stessa e i suoi vicini adiacenti. Spegni tutte le luci per risolvere.';

  @override
  String get lightsOutWinTitle => 'PUZZLE RISOLTO!';

  @override
  String get lightsOutWinMessage => 'Hai spento con successo tutte le luci!';

  @override
  String get symmetryTitle => 'Simmetria';

  @override
  String get symmetrySubtitle =>
      'Rispecchia il modello a sinistra sulla griglia vuota a destra.';

  @override
  String get semanticLinkTitle => 'Collegamento Semantico';

  @override
  String get semanticLinkSubtitle => 'Trova la parola che collega tutte e tre';

  @override
  String get reflexTapTitle => 'Tocco di Riflesso';

  @override
  String get visualStatisticalLearningTitle =>
      'Apprendimento Statistico Visivo';

  @override
  String get orbitTapTitle => 'Tocco Orbitale';

  @override
  String get orbitTapSubtitle =>
      'Tocca quando le palline si allineano con il varco';

  @override
  String get schulteTableTitle => 'Tabella di Schulte';

  @override
  String get multipleObjectTrackingTitle => 'Tracciamento Oggetti';

  @override
  String get multipleObjectTrackingSubtitle =>
      'Osserva gli oggetti evidenziati. Tracciali mentre si muovono, quindi selezionali.';

  @override
  String get sdmtTitle => 'Test SDMT';

  @override
  String get sdmtSubtitle =>
      'Usa la legenda sopra per trovare la cifra per il simbolo mostrato.';

  @override
  String get memoryMatrixTitle => 'Matrice di Memoria';

  @override
  String get memoryMatrixSubtitle => 'Memorizza il modello e tocca le tessere.';

  @override
  String get mentalAbacusTitle => 'Abaco Mentale';

  @override
  String get mentalAbacusSubtitle => 'Risolvi usando il Soroban';

  @override
  String get spellingSprintTitle => 'Sprint di Ortografia';

  @override
  String get spellingSprintSubtitle =>
      'Corri contro il tempo per comporre quante più parole possibile.';

  @override
  String get stopSignalTitle => 'Segnale di Stop';

  @override
  String get stopSignalSubtitle =>
      'Tocca la direzione della freccia, ma FERMATI immediatamente se la freccia diventa ROSSA.';

  @override
  String get staircaseMemoryTitle => 'Memoria a Scala';

  @override
  String get vigilanceTaskTitle => 'Compito di Vigilanza';

  @override
  String get vigilanceTaskSubtitle =>
      'Tocca il pulsante quando la lancetta salta una posizione';

  @override
  String get logicalSyllogismsTitle => 'Sillogismi Logici';

  @override
  String get logicalSyllogismsSubtitle =>
      'La conclusione è logicamente valida?';

  @override
  String get mathPathTitle => 'Percorso Matematico';

  @override
  String get mathPathSubtitle =>
      'Trova un percorso che sommi esattamente il totale target.';

  @override
  String get sternbergTaskTitle => 'Compito di Sternberg';

  @override
  String get sternbergTaskMemorize => 'Memorizza le lettere';

  @override
  String get sternbergTaskWasLetterSet => 'Questa lettera era nell\'insieme?';

  @override
  String sternbergTaskScore(int score) {
    return 'Hai totalizzato $score punti nel Compito di Sternberg!';
  }

  @override
  String get verbalAnalogiesTitle => 'Maestro di Analogie!';

  @override
  String get verbalAnalogiesSubtitle => 'Completa la relazione';

  @override
  String get typingSpeedTitle => 'Velocità di Scrittura';

  @override
  String get typingSpeedSubtitle =>
      'Digita la frase esattamente come mostrata il più velocemente possibile!';

  @override
  String get wordLadderTitle => 'Scala di Parole';

  @override
  String get wordLadderSubtitle =>
      'Collega le parole cambiando una lettera alla volta.';

  @override
  String get tangleFixTitle => 'Groviglio Risolto!';

  @override
  String get tangleFixSubtitle =>
      'Districa le linee in modo che nessuna si intersechi';

  @override
  String get oddRotationTitle => 'Rotazione Anomala';

  @override
  String get oddRotationSubtitle =>
      'Una di queste è specchiata. Riesci a trovarla?';

  @override
  String get towerOfLondonTitle => 'Torre di Londra';

  @override
  String get towerOfLondonSubtitle => 'Abbina la configurazione target';

  @override
  String get symbolicFlankerTitle => 'Flanker Simbolico';

  @override
  String get symbolicFlankerSubtitle => 'Concentrati sul simbolo centrale';

  @override
  String get stroopTestTitle => 'Test di Stroop';

  @override
  String get stroopTestSubtitle =>
      'Identifica il colore dell\'inchiostro della parola mostrata. Ignora ciò che la parola dice realmente!';

  @override
  String get wisconsinCardSortingTitle => 'Ordinamento Carte Wisconsin';

  @override
  String get wisconsinCardSortingSubtitle =>
      'ABBINA LA CARTA A UNA DELLE QUATTRO SOPRA';

  @override
  String get nBackTitle => 'Test N-Back';

  @override
  String get nBackSubtitle =>
      'Tocca CORRISPONDENZA se la lettera corrente corrisponde a quella mostrata 2 passaggi fa.';

  @override
  String get rhythmMasterTitle => 'Maestro del Ritmo';

  @override
  String get rhythmMasterSubtitle => 'Tocca in sincronia con l\'impulso';

  @override
  String get pixelMimicTitle => 'Mimica Pixel';

  @override
  String get targetNumberTitle => 'Obiettivo 24';

  @override
  String targetNumberSubtitle(int target) {
    return 'Usa tutti i 4 numeri per raggiungere $target';
  }

  @override
  String get mirrorTracingTitle => 'Tracciamento Specchiato';

  @override
  String get mirrorTracingSubtitle =>
      'Traccia la stella! I controlli sono SPECCHIATI.';

  @override
  String get wordSurgeTitle => 'Ondata di Parole';

  @override
  String get wordSurgeSubtitle => 'Sinonimi e Contrari';

  @override
  String get perspectiveTakingTitle => 'Presa di Prospettiva';

  @override
  String get perspectiveTakingTopDownView => 'VISTA DALL\'ALTO';

  @override
  String get perspectiveTakingChoosePerspective => 'SCEGLI LA PROSPETTIVA';

  @override
  String get perspectiveTakingCongrats =>
      'Hai un occhio acuto per le relazioni spaziali.';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return 'Quale vista è da $targetDirName?';
  }

  @override
  String get paperFoldingTitle => 'Piegatura Carta';

  @override
  String get paperFoldingSubtitle => 'Come apparirà quando aperta?';

  @override
  String get waterSortTitle => 'Ordinamento Acqua';

  @override
  String get waterSortSubtitle =>
      'Ordina i colori in modo che ogni tubo contenga un solo colore.';

  @override
  String get numericalEstimationTitle => 'Stima Numerica';

  @override
  String get numericalEstimationSubtitle =>
      'Scegli la risposta più vicina velocemente!';

  @override
  String get lockPatternTitle => 'Sequenza di Sblocco';

  @override
  String get lockPatternSubtitle =>
      'Trova la sequenza segreta. Ogni tentativo fornisce feedback su posizione e punti.';

  @override
  String get primeHunterTitle => 'Cacciatore di Primi';

  @override
  String get primeHunterSubtitle =>
      'Scorri a SINISTRA per PRIMO | Scorri a DESTRA per COMPOSTO';

  @override
  String get tracePathTitle => 'Traccia Percorso';

  @override
  String get tracePathSubtitle =>
      'Segui il percorso target il più fedelmente possibile';

  @override
  String get ruleSwitcherTitle => 'Cambio Regola';

  @override
  String get ruleSwitcherSubtitle => 'Applica la regola corrente';

  @override
  String get choiceReactionTimeTitle => 'Tempo di Reazione alla Scelta';

  @override
  String get pathRecallTitle => 'Richiamo Percorso';

  @override
  String get switchTaskTitle => 'Compito di Scambio';

  @override
  String get switchTaskSubtitle =>
      'Presta attenzione alla regola! Passerà dall\'abbinare la forma all\'abbinare il colore.';

  @override
  String get mentalRotationTitle => 'Rotazione Mentale';

  @override
  String get mentalRotationSubtitle =>
      'Queste forme sono uguali, solo ruotate?';

  @override
  String get missingOperatorTitle => 'Mix Operatori';

  @override
  String get missingOperatorSubtitle =>
      'Riempi gli spazi vuoti per completare l\'equazione';

  @override
  String get wordMastermindTitle => 'Mastermind di Parole';

  @override
  String get wordMastermindSubtitle =>
      'Viola il codice di 4 lettere! Bulls (B) sono posti perfetti, Cows (C) sono posti sbagliati.';

  @override
  String get simonSequenceTitle => 'Sequenza Simon';

  @override
  String get symbolLogicTitle => 'Logica dei Simboli';

  @override
  String get symbolLogicSubtitle =>
      'Risolvi le equazioni visive per trovare il valore di ogni simbolo. Qual è il risultato dell\'ultima equazione?';

  @override
  String get silhouetteMatchTitle => 'Silhouette Corrispondente';

  @override
  String get silhouetteMatchSubtitle =>
      'Quale silhouette corrisponde a questo oggetto?';

  @override
  String get operationSpanTitle => 'Operation Span';

  @override
  String get operationSpanMathPhase => 'L\'equazione è corretta?';

  @override
  String get operationSpanLetterPhase => 'Ricorda la lettera';

  @override
  String get operationSpanRecallPhase => 'Richiama le lettere in ordine';

  @override
  String get operationSpanRoundComplete => 'Round Completato!';

  @override
  String operationSpanScore(int score) {
    return 'Hai totalizzato $score punti in Operation Span!';
  }

  @override
  String get slidePuzzleTitle => 'Puzzle Scorrevole';

  @override
  String get slidePuzzleNewGame => 'NUOVO GIOCO';

  @override
  String get slidePuzzleInstructions =>
      'Riordina le tessere in ordine numerico facendole scorrere nello spazio vuoto.';

  @override
  String get slidePuzzleTileSlider => 'SCORRITORE TESSERE';

  @override
  String get slidePuzzleCongrats =>
      'Hai ordinato con successo tutte le tessere.';

  @override
  String get visualSearchTitle => 'Ricerca Visiva';

  @override
  String get visualSearchSubtitle => 'Trova il simbolo unico nella griglia';

  @override
  String get trailMakingTitle => 'Trail Making';

  @override
  String get trailMakingSubtitle =>
      'Collega i numeri in ordine (1 -> 2 -> 3...) il più velocemente possibile.';

  @override
  String get matrixReasoningTitle => 'Ragionamento a Matrice';

  @override
  String get matrixReasoningSubtitle => 'Completa il modello nella griglia 3x3';

  @override
  String get tentsAndTreesTitle => 'Tende e Alberi';

  @override
  String get tentsAndTreesSubtitle =>
      'Posiziona le tende accanto agli alberi. I numeri indicano quante tende ci sono in ogni riga/colonna. Le tende non possono toccarsi tra loro.';

  @override
  String get quickMathTitle => 'Matematica Rapida';

  @override
  String get magicSquaresTitle => 'Quadrato Magico';

  @override
  String magicSquaresSubtitle(int targetSum) {
    return 'Ogni riga, colonna e diagonale deve sommare a $targetSum';
  }

  @override
  String get objectShuffleTitle => 'Mescolamento Oggetti';

  @override
  String get pipesTitle => 'Tubi';

  @override
  String get pipesSubtitle => 'Collega i punti dello stesso colore con i tubi.';

  @override
  String get oddOneOutTitle => 'L\'Intruso';

  @override
  String get oddOneOutSubtitle => 'Trova la tessera con un colore diverso.';

  @override
  String get einsteinRiddleTitle => 'INDOVINELLO DI EINSTEIN';

  @override
  String get einsteinRiddleSubtitle =>
      'Usa gli indizi per dedurre gli attributi di ogni casa.';

  @override
  String get einsteinRiddleHowToPlay =>
      'Ogni casa ha attributi unici (colore, nazionalità, animale, ecc.). Usa gli indizi forniti per riempire la griglia e trovare la soluzione completa.';

  @override
  String get mirrorImageTitle => 'Immagine Speculare';

  @override
  String get mirrorImageSubtitle =>
      'Identifica la corretta riflessione speculare.';

  @override
  String get mirrorImageHowToPlay =>
      'Guarda la forma e scegli la sua corretta riflessione speculare tra le opzioni fornite.';

  @override
  String get mentalMappingTitle => 'Mappatura Mentale';

  @override
  String get mentalMappingSubtitle =>
      'Segui le direzioni e trova la destinazione.';

  @override
  String get mentalMappingHowToPlay =>
      'Ti verrà mostrata una sequenza di direzioni (Nord, Sud, Est, Ovest). Segui mentalmente questi passaggi partendo dal centro della griglia e seleziona la destinazione finale.';

  @override
  String get memoryPalaceTitle => 'Palazzo della Memoria';

  @override
  String get memoryPalaceSubtitle =>
      'Ricorda quale parola era in quale posizione.';

  @override
  String get memoryPalaceHowToPlay =>
      'Un insieme di parole apparirà in diverse posizioni su una griglia. Memorizza le loro posizioni. Successivamente, ti verrà chiesto di ricollocare le parole nelle loro posizioni originali.';

  @override
  String get countingSheepTitle => 'Contare le Pecore';

  @override
  String get countingSheepSubtitle => 'Quante pecore hai visto?';

  @override
  String get countingSheepHowToPlay =>
      'Le pecore correranno velocemente sullo schermo. Contale mentre passano e inserisci il numero totale alla fine.';

  @override
  String get faceTraitAssociationTitle => 'Viso-Tratto';

  @override
  String get faceTraitAssociationSubtitle => 'Memorizza i tratti per ogni viso';

  @override
  String get faceTraitAssociationHowToPlay =>
      'Ti verranno mostrati diversi visi, ognuno con un nome, una professione e un hobby. Memorizza queste associazioni. Più tardi, ti verrà chiesto di richiamare i tratti specifici per ogni viso.';

  @override
  String get mentalCalendarTitle => 'Calendario Mentale';

  @override
  String get mentalCalendarSubtitle => 'Calcola il giorno della settimana';

  @override
  String get mentalCalendarHowToPlay =>
      'Verrà mostrata una data casuale. Usa il calcolo mentale (o l\'algoritmo del Doomsday) per determinare in quale giorno della settimana cade.';

  @override
  String get vocabularyBuilderTitle => 'Costruttore di Vocabolario';

  @override
  String get vocabularyBuilderSubtitle =>
      'Abbina sinonimi e contrari sotto pressione temporale.';

  @override
  String get vocabularyBuilderHowToPlay =>
      'Ti verrà mostrata una parola target e una relazione (Sinonimo o Contrario). Scegli la parola corretta tra le opzioni che corrisponde alla relazione. Sii veloce, il tempo scorre!';

  @override
  String get grammarPoliceTitle => 'Polizia della Grammatica';

  @override
  String get grammarPoliceSubtitle =>
      'Identifica e correggi gli errori in un testo a scorrimento.';

  @override
  String get grammarPoliceHowToPlay =>
      'Le frasi scorreranno sullo schermo. Alcune contengono errori (ortografia, grammatica o punteggiatura). Tocca le frasi che contengono errori per \'correggerle\'. Non lasciare passare troppi errori!';

  @override
  String get reverseStroopTitle => 'Stroop Inverso';

  @override
  String get reverseStroopSubtitle =>
      'Una variante del test di Stroop in cui il focus è scambiato.';

  @override
  String get reverseStroopHowToPlay =>
      'Presta attenzione alle istruzioni! Se dice \'TESTO\', abbina il significato della parola. Se dice \'COLORE\', abbina il colore dell\'inchiostro. Le regole cambieranno frequentemente per testare la tua concentrazione.';

  @override
  String get game2048Instruction => 'SCORRI IN QUALSIASI DIREZIONE PER UNIRE';

  @override
  String get fibonacciMergeTitle => 'Fibonacci Merge';

  @override
  String get fibonacciMergeSubtitle =>
      'Merge consecutive Fibonacci numbers (1, 1, 2, 3, 5, 8, 13...).';

  @override
  String get sequenceSleuthTitle => 'Sequence Sleuth';

  @override
  String get sequenceSleuthSubtitle =>
      'Find the missing number in the mathematical sequence.';

  @override
  String get divisibilityDashTitle => 'Divisibility Dash';

  @override
  String get divisibilityDashSubtitle =>
      'Tap all single-digit divisors (2-9) for the given number.';

  @override
  String get percentagePeakTitle => 'Percentage Peak';

  @override
  String get percentagePeakSubtitle =>
      'Solve mental percentage calculations quickly.';

  @override
  String get vennNumbersTitle => 'Venn Numbers';

  @override
  String get vennNumbersSubtitle =>
      'Categorize numbers into the correct Venn diagram regions.';

  @override
  String get commonDenominatorTitle => 'Common Denominator';

  @override
  String get commonDenominatorSubtitle =>
      'Find the Greatest Common Divisor or Least Common Multiple.';

  @override
  String get angleFinderTitle => 'Angle Finder';

  @override
  String get angleFinderSubtitle =>
      'Calculate the missing angle in the geometric problem.';

  @override
  String get sumSnakeTitle => 'Sum Snake';

  @override
  String get sumSnakeSubtitle =>
      'Connect adjacent numbers to reach the target sum.';
}
