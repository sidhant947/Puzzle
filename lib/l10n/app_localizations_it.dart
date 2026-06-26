// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Giochi di Puzzle';

  @override
  String get home => 'Home';

  @override
  String get settings => 'Impostazioni';

  @override
  String get playAgain => 'Gioca ancora';

  @override
  String get playNext => 'Gioca Successivo';

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
  String get victory => 'Vittoria!';

  @override
  String get gameWin => 'BEN FATTO!';

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
  String get radicalRootsTitle => 'Radici Radicali';

  @override
  String get radicalRootsSubtitle =>
      'Trova la radice quadrata o cubica del numero dato. Arrotonda all\'intero più vicino se necessario.';

  @override
  String get radicalRootsGoalReached => 'Obiettivo raggiunto!';

  @override
  String get radicalRootsTimeUp => 'Tempo scaduto!';

  @override
  String radicalRootsScoreMessage(int score) {
    return 'Hai calcolato correttamente $score radici!';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return 'Continua a esercitarti! Hai calcolato $score radici.';
  }

  @override
  String get radicalRootsStart => 'Inizia a calcolare';

  @override
  String get radicalRootsDescription =>
      'Hai 60 secondi per risolverne il più possibile.';

  @override
  String get radicalRootsBest => 'Migliore';

  @override
  String get radicalRootsSeconds => '60 SECONDI';

  @override
  String get romanArithmeticTitle => 'Aritmetica Romana';

  @override
  String get romanArithmeticSubtitle =>
      'Risolvi problemi di addizione e sottrazione usando i numeri romani.';

  @override
  String get romanArithmeticGoalReached => 'Livello Centurione!';

  @override
  String get romanArithmeticTimeUp => 'Tempo scaduto!';

  @override
  String romanArithmeticScoreMessage(int score) {
    return 'Hai risolto $score problemi romani!';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return 'Veni, Vidi, Vici! Hai risolto $score problemi.';
  }

  @override
  String get romanArithmeticStart => 'Inizia la missione';

  @override
  String get romanArithmeticDescription =>
      'Converti e risolvi. Hai 60 secondi.';

  @override
  String get romanArithmeticBest => 'Migliore';

  @override
  String get romanArithmeticSeconds => '60 SECONDI';

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
  String get magnetsTitle => 'MAGNETI';

  @override
  String get magnetsSubtitle =>
      'Posiziona i magneti nella griglia in base al conteggio dei poli.';

  @override
  String get magnetsHowToPlay =>
      'Riempi contenitori delle dimensioni di un domino con magneti \'+\' e \'-\' o lasciali vuoti. Gli indizi di riga e colonna specificano il numero totale di ciascun polo in quella linea. Poli identici non possono essere adiacenti ortogonalmente.';

  @override
  String get magnetsWinTitle => 'POLARITÀ BILANCIATA!';

  @override
  String get magnetsWinMessage =>
      'Tutti i magneti sono disposti perfettamente!';

  @override
  String get lighthousesTitle => 'FARI';

  @override
  String get lighthousesSubtitle =>
      'Posiziona le navi in base agli indizi dei fari.';

  @override
  String get lighthousesHowToPlay =>
      'Posiziona navi 1x1 nella griglia. I fari indicano il numero totale di navi visibili orizzontalmente e verticalmente. Le navi non possono toccare i fari né toccarsi tra loro, nemmeno in diagonale.';

  @override
  String get lighthousesWinTitle => 'MARE SICURO!';

  @override
  String get lighthousesWinMessage =>
      'Tutti i fari guidano le navi perfettamente!';

  @override
  String get dominosaTitle => 'DOMINOSA';

  @override
  String get dominosaSubtitle => 'Trova tutti i domino nascosti nella griglia.';

  @override
  String get dominosaHowToPlay =>
      'Disponi un set completo di domino su una griglia di numeri in modo che ogni coppia di numeri adiacenti sia coperta da esattamente un domino. Ogni coppia di numeri esiste solo una volta nel set.';

  @override
  String get dominosaWinTitle => 'MAESTRO DEL DOMINO!';

  @override
  String get dominosaWinMessage => 'Ogni domino è stato trovato e posizionato!';

  @override
  String get skyscrapersTitle => 'GRATTACIELI';

  @override
  String get skyscrapersSubtitle =>
      'Riempi la griglia con le altezze degli edifici.';

  @override
  String get skyscrapersHowToPlay =>
      'Riempi la griglia con altezze (1-N) in modo che ogni riga e colonna contenga ogni altezza esattamente una volta. Gli indizi sui bordi indicano quanti edifici sono visibili da quella direzione, con gli edifici più alti che bloccano quelli più bassi.';

  @override
  String get skyscrapersWinTitle => 'SKYLINE RIPRISTINATO!';

  @override
  String get skyscrapersWinMessage =>
      'Tutti gli edifici sono posizionati perfettamente!';

  @override
  String get nurikabeTitle => 'NURIKABE';

  @override
  String get nurikabeSubtitle => 'Forma un mare collegato e separa le isole.';

  @override
  String get nurikabeHowToPlay =>
      'Ombreggia le celle per formare un unico \"mare\" collegato (nessun blocco 2x2). Le celle non ombreggiate formano \"isole\", ognuna contenente esattamente un numero che rappresenta la sua area totale.';

  @override
  String get nurikabeWinTitle => 'MARE FLUIDO!';

  @override
  String get nurikabeWinMessage => 'Isole separate, mare collegato!';

  @override
  String get fillominoTitle => 'FILLOMINO';

  @override
  String get fillominoSubtitle =>
      'Dividi la griglia in polimini delle dimensioni specificate.';

  @override
  String get fillominoHowToPlay =>
      'Dividi la griglia in polimini in modo che ogni polimino di dimensione N contenga il numero N in tutte le sue celle. Polimini della stessa dimensione non possono essere adiacenti ortogonalmente.';

  @override
  String get fillominoWinTitle => 'GRIGLIA DIVISA!';

  @override
  String get fillominoWinMessage => 'Perfettamente piastrellato con logica!';

  @override
  String get hitoriTitle => 'HITORI';

  @override
  String get hitoriSubtitle =>
      'Ombreggia i numeri duplicati in ogni riga e colonna.';

  @override
  String get hitoriHowToPlay =>
      'Ombreggia le celle in modo che nessun numero appaia più di una volta in ogni riga o colonna. Le celle ombreggiate non possono essere adiacenti (ortogonalmente) e tutte le celle non ombreggiate devono formare un unico gruppo collegato.';

  @override
  String get hitoriWinTitle => 'MAESTRO HITORI!';

  @override
  String get hitoriWinMessage => 'Hai risolto con successo tutti i duplicati!';

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
    return 'Piastrelle in posizione errata: $count';
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
  String get logicalSyllogismsTitle => 'Syllogismi Logici';

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
  String get verbalAnalogiesTitle => 'Analogie verbali';

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
  String get tangleFixTitle => 'Districa grovigli';

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
  String get einsteinRiddleColor => 'Colore';

  @override
  String get einsteinRiddleNationality => 'Nazionalità';

  @override
  String get einsteinRiddleDrink => 'Bevanda';

  @override
  String get einsteinRiddlePet => 'Animale domestico';

  @override
  String get einsteinRiddleSmoke => 'Fumo';

  @override
  String get einsteinRiddleHouse => 'Casa';

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
      'Ti verrà mostrata una sequenza di direzioni (Nord, Sud, Est, Ouest). Segui mentalmente questi passaggi partendo dal centro della griglia e seleziona la destinazione finale.';

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
  String get correct => 'CORRETTO';

  @override
  String get incorrect => 'ERRATO';

  @override
  String get grammarPoliceTitle => 'Polizia della Grammatica';

  @override
  String get grammarPoliceSubtitle =>
      'Identifica se la frase è grammaticalmente corretta o contiene errori.';

  @override
  String get grammarPoliceHowToPlay =>
      'Una frase apparirà al centro dello schermo. Decidi se è grammaticalmente corretta o se contiene un errore. Tocca \'CORRETTO\' se va bene, o \'ERRATO\' se noti un errore. Non perdere tutte le tue vite!';

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
      'Unisci numeri di Fibonacci consecutivi (1, 1, 2, 3, 5, 8, 13...).';

  @override
  String get sequenceSleuthTitle => 'Investigatore di Sequenze';

  @override
  String get sequenceSleuthSubtitle =>
      'Trova il numero mancante nella sequenza matematica.';

  @override
  String get divisibilityDashTitle => 'Corsa alla Divisibilità';

  @override
  String get divisibilityDashSubtitle =>
      'Tocca tutti i divisori a cifra singola (2-9) per il numero dato.';

  @override
  String get percentagePeakTitle => 'Vetta della Percentuale';

  @override
  String get percentagePeakSubtitle =>
      'Risolvi rapidamente calcoli mentali di percentuali.';

  @override
  String get vennNumbersTitle => 'Numeri di Venn';

  @override
  String get vennNumbersSubtitle =>
      'Categorizza i numeri nelle corrette regioni del diagramme di Venn.';

  @override
  String get commonDenominatorTitle => 'Denominatore Comune';

  @override
  String get commonDenominatorSubtitle =>
      'Trova il Massimo Comune Divisore o il Minimo Comune Multiplo.';

  @override
  String get angleFinderTitle => 'Trova Angoli';

  @override
  String get angleFinderSubtitle =>
      'Calcola l\'angolo mancante nel problema geometrico.';

  @override
  String get sumSnakeTitle => 'Serpente di Somme';

  @override
  String get sumSnakeSubtitle =>
      'Collega numeri adiacenti per raggiungere la somma target.';

  @override
  String get baseShiftTitle => 'BLITZ DI CAMBIO BASE';

  @override
  String get baseShiftSubtitle => 'Risolvi in decimale';

  @override
  String get baseShiftDescription =>
      'Risolvi l\'equazione e scrivi la risposta in decimale (Base 10).';

  @override
  String get baseShiftEquation => 'EQUAZIONE';

  @override
  String get baseShiftHint => 'Inserisci risultato decimale...';

  @override
  String get baseShiftCorrect => 'Corretto!';

  @override
  String get baseShiftIncorrect => 'Errato!';

  @override
  String get baseShiftSubmit => 'INVIA';

  @override
  String get baseShiftQuickGuide => 'Guida Rapida:';

  @override
  String get baseShiftBinary => 'Binario (bin): Base 2 (0, 1)';

  @override
  String get baseShiftHex => 'Esadecimale (0x): Base 16 (0-9, A-F)';

  @override
  String get baseShiftDecimal => 'Decimale (dec): Base 10 (0-9)';

  @override
  String get baseShiftWinTitle => 'MAGO DELLA MATEMATICA!';

  @override
  String get baseShiftWinMessage =>
      'Hai risolto correttamente 5 equazioni di cambio base!';

  @override
  String get blockCount3DTitle => 'Conteggio Blocchi 3D';

  @override
  String get blockCount3DSubtitle =>
      'TRASCINA PER RUOTARE • CONTA I BLOCCHI NASCOSTI';

  @override
  String get blockCount3DHowMany => 'QUANTI BLOCCHI?';

  @override
  String get blockCount3DSubmitGuess => 'INVIA RISPOSTA';

  @override
  String get blockCount3DNotQuite =>
      'Non proprio! Prova a ruotare per contare di nuovo.';

  @override
  String get blockCount3DExcellent => 'ECCELLENTE';

  @override
  String blockCount3DWinMessage(int count) {
    return 'Hai identificato correttamente tutti i $count blocchi!';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '1. Trascina il dito sulla visuale 3D per ruotare la pila di blocchi.\n\n2. Conta tutti i blocchi nella pila.\n\n3. Ricorda: un blocco in aria deve avere blocchi di supporto strutturale sotto di esso (blocchi nascosti!).\n\n4. Digita la tua risposta e tocca \"INVIA RISPOSTA\" per controllare.';

  @override
  String get alphabetSudokuTitle => 'SUDOKU ALFABETICO';

  @override
  String get alphabetSudokuSubtitle =>
      'Riempi la griglia in modo che ogni riga, colonna e riquadro contenga le lettere A-I.';

  @override
  String get alphabetSudokuWinTitle => 'SUDOKU RISOLTO!';

  @override
  String get alphabetSudokuWinMessage =>
      'Brillante! Hai padroneggiato le lettere.';

  @override
  String get classicMazeTitle => 'Labirinto Classico';

  @override
  String get classicMazeSubtitle =>
      'ESPLORA E RISOLVI • UN NUOVO LABIRINTO OGNI PARTITA';

  @override
  String get classicMazeWinTitle => 'LABIRINTO COMPLETATO';

  @override
  String classicMazeWinMessage(int count) {
    return 'Navigazione incredibile! Hai risolto il labirinto in $count mosse.';
  }

  @override
  String get classicMazeMoves => 'MOSSE: ';

  @override
  String get classicMazeHowToPlayDescription =>
      '1. Guida la biglia gialla luminosa (giocatore) verso il portale verde (uscita) in basso a destra.\n\n2. Scorri ovunque, usa le frecce della tastiera o i pulsanti a freccia per muoverti.\n\n3. La scia viola mostra il percorso esplorato. Torna sui tuoi passi per cancellarla!\n\n4. Cambia difficoltà per sfidare te stesso con labirinti più grandi.';

  @override
  String get conjunctionSearchTitle => 'Ricerca di Congiunzioni';

  @override
  String get conjunctionSearchSubtitle =>
      'Focus Attentivo e Congiunzione di Caratteristiche';

  @override
  String get conjunctionSearchWinTitle => 'VITTORIA';

  @override
  String get conjunctionSearchWinMessage =>
      'Hai trovato tutti i target con un focus attentivo perfetto!';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      'Una specifica combinazione di forma e colore verrà mostrata. Trovala e toccala nella griglia il più velocemente possibile. I distrattori condividono colore o forma!';

  @override
  String get conjunctionSearchRound => 'ROUND: ';

  @override
  String get conjunctionSearchScore => 'PUNTEGGIO: ';

  @override
  String get conjunctionSearchFind => 'TROVA: ';

  @override
  String get shapeCircle => 'CERCHIO';

  @override
  String get shapeSquare => 'QUADRATO';

  @override
  String get shapeTriangle => 'TRIANGOLO';

  @override
  String get shapeStar => 'STELLA';

  @override
  String get shapeRectangle => 'RETTANGOLO';

  @override
  String get shapeEllipse => 'ELLISSE';

  @override
  String get shapeTrapezoid => 'TRAPEZIO';

  @override
  String get colorRedLabel => 'ROSSO';

  @override
  String get colorBlueLabel => 'BLU';

  @override
  String get colorGreenLabel => 'VERDE';

  @override
  String get colorAmberLabel => 'AMBRA';

  @override
  String get cubeNetFoldTitle => 'Piegatura Rete Cubo';

  @override
  String get cubeNetFoldSubtitle =>
      'SELEZIONA L\'OPZIONE CUBO 3D CORRISPONDENTE';

  @override
  String get cubeNetFoldWinTitle => 'CORRETTO';

  @override
  String get cubeNetFoldWinMessage =>
      'Hai una perfetta logica di piegatura spaziale 3D!';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '1. Guarda la rete 2D aperta in alto.\n\n2. Piega mentalmente la rete in un cubo 3D.\n\n3. Scegli l\'opzione che rappresenta una prospettiva 3D valida di quel cubo.\n\n4. Attenzione: le facce opposte nella rete non possono essere adiacenti in 3D, e l\'ordine delle facce adiacenti deve corrispondere.';

  @override
  String get cubeNetFoldUnfoldedNet => 'RETE 2D APERTA';

  @override
  String get cubeNetFoldWhichMatches => 'QUALE CUBO CORRISPONDE?';

  @override
  String get cubeNetFoldIncorrect =>
      'Logica di piegatura errata! Tocca Reset o cambia scelta.';

  @override
  String get cubeNetFoldSubmitChoice => 'INVIA SCELTA';

  @override
  String get cubeNetFoldFailed => 'FALLITO (TOCCA RESET)';

  @override
  String get faceTraitAssociationMemorize => 'MEMORIZZA TUTTE E 4 LE PERSONE';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return 'PERSONA $current DI $total';
  }

  @override
  String get faceTraitAssociationWhatOccupation =>
      'QUAL È LA LORO OCCUPAZIONE?';

  @override
  String get faceTraitAssociationWhatHobby => 'QUAL È IL LORO HOBBY?';

  @override
  String get faceTraitAssociationWinTitle => 'MAESTRO DELLA MEMORIA!';

  @override
  String get faceTraitAssociationLoseTitle => 'FINE GIOCHI';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return 'Hai indovinato $correct su $total.';
  }

  @override
  String get topologyTitle => 'TOPOLOGIA';

  @override
  String get topologySubtitle =>
      'Queste forme sono topologicamente equivalenti? (È possibile deformarne una nell\'altra senza tagliare o incollare?)';

  @override
  String get topologyWinTitle => 'GENIO DELLA GEOMETRIA!';

  @override
  String get topologyWinMessage =>
      'Hai identificato correttamente 10 coppie topologiche!';

  @override
  String get topologyScore => 'PUNTEGGIO: ';

  @override
  String get semanticDistanceTitle => 'Distanza semantica';

  @override
  String get semanticDistanceSubtitle =>
      'Misura la distanza concettuale tra le parole';

  @override
  String get oxymoronHuntTitle => 'Caccia agli ossimori';

  @override
  String get oxymoronHuntSubtitle =>
      'Abbina parole contraddittorie nella griglia';

  @override
  String get portmanteauSplitTitle => 'Divisione parola macedonia';

  @override
  String get portmanteauSplitSubtitle =>
      'Identifica le parole sorgente di una parola macedonia';

  @override
  String get chainReactionTitle => 'Reazione a catena';

  @override
  String get chainReactionSubtitle =>
      'Collega le parole usando lettere sovrapposte';

  @override
  String get rhymeMasterTitle => 'Maestro delle rime';

  @override
  String get rhymeMasterSubtitle =>
      'Identifica le parole che fanno rima con il bersaglio';

  @override
  String get definitionDashTitle => 'Scatto di definizioni';

  @override
  String get definitionDashSubtitle =>
      'Abbina la parola corretta alla sua definizione';

  @override
  String get syllableStackTitle => 'Pila di sillabe';

  @override
  String get syllableStackSubtitle =>
      'Impila le sillabe per formare parole complete';

  @override
  String get sentenceUnscrambleTitle => 'Frase rimescolata';

  @override
  String get sentenceUnscrambleSubtitle =>
      'Riordina le parole per formare una frase valida';

  @override
  String get grammarSortTitle => 'Ordinamento grammaticale';

  @override
  String get grammarSortSubtitle =>
      'Categorizza le parole in base alla loro parte del discorso';

  @override
  String get vowelReconstructTitle => 'Ricostruzione vocali';

  @override
  String get vowelReconstructSubtitle =>
      'Inserisci le vocali mancanti nella frase';

  @override
  String get consonantReconstructTitle => 'Ricostruzione consonanti';

  @override
  String get consonantReconstructSubtitle =>
      'Inserisci le consonanti mancanti nella frase';

  @override
  String get homophoneHuntTitle => 'Caccia agli omofoni';

  @override
  String get silentLetterSearchTitle => 'Ricerca lettere mute';

  @override
  String get silentLetterSearchSubtitle =>
      'Identifica le lettere mute nelle parole date';

  @override
  String get palindromeBuilderTitle => 'Costruttore di palindromi';

  @override
  String get palindromeBuilderSubtitle =>
      'Crea un palindromo aggiungendo il minimo numero di lettere';

  @override
  String get phoneticGuessTitle => 'Indovinello fonetico';

  @override
  String get phoneticGuessSubtitle =>
      'Identifica la parola dalla sua grafia fonetica';

  @override
  String get spoonerismSolverTitle => 'Risolutore di spoonerismi';

  @override
  String get spoonerismSolverSubtitle =>
      'Identifica il spoonerismo corretto per la frase';

  @override
  String get etymonOddballTitle => 'Intruso etimologico';

  @override
  String get etymonOddballSubtitle =>
      'Trova la parola che non condivide la stessa radice';

  @override
  String get etymologyOriginTitle => 'Origine etimologica';

  @override
  String get etymologyOriginSubtitle =>
      'Indovina la lingua di origine del prestito';

  @override
  String get affixFactoryTitle => 'Fabbrica di affissi';

  @override
  String get affixFactorySubtitle =>
      'Crea parole valide usando prefissi e suffissi';

  @override
  String get cognateCatchTitle => 'Cattura cognati';

  @override
  String get cognateCatchSubtitle => 'Distingui tra veri cognati e falsi amici';

  @override
  String get compoundConnectTitle => 'Connessione composta';

  @override
  String get compoundConnectSubtitle =>
      'Combina due parole per formare una parola composta';

  @override
  String get pangramSprintTitle => 'Sprint di pangrammi';

  @override
  String get pangramSprintSubtitle =>
      'Costruisci una frase usando ogni lettera dell\'alfabeto';

  @override
  String get anagramDefinitionTitle => 'Definizione di anagramma';

  @override
  String get anagramDefinitionSubtitle =>
      'Risolvi l\'anagramma in base alla sua definizione';

  @override
  String get letterBridgeTitle => 'Ponte di lettere';

  @override
  String get letterBridgeSubtitle =>
      'Trova la lettera mancante che unisce due parole';

  @override
  String get letterFrequencyScanTitle => 'Scansione frequenza lettere';

  @override
  String get letterFrequencyScanSubtitle =>
      'Conta quante volte una lettera appare nel testo';

  @override
  String get oneLetterShiftTitle => 'Spostamento di una lettera';

  @override
  String get oneLetterShiftSubtitle =>
      'Trasforma una parola in un\'altra con il cambio di una sola lettera';

  @override
  String vocabularyBuilderMessage(String arg0) {
    return 'Ottimo lavoro! Il tuo vocabolario è impressionante. Punteggio: $arg0';
  }

  @override
  String get symmetryMessage =>
      'Hai specchiato perfettamente il motivo con precisione chirurgica.';

  @override
  String get temporalOrderMessage =>
      'Incredibile! La tua memoria di sequenza temporale è ad alta fedeltà.';

  @override
  String get temporalOrderMessage1 =>
      'Memoria di sequenza errata. La pratica rende perfetti!';

  @override
  String get wordSearchMessage =>
      'Tutte le parole trovate con successo con acuta osservazione.';

  @override
  String colorMatchMessage(String arg0) {
    return 'La tua precisione: $arg0%';
  }

  @override
  String semanticLinkMessage(String arg0) {
    return 'Hai segnato $arg0 punti!';
  }

  @override
  String reflexTapMessage(String arg0) {
    return 'Hai toccato $arg0 bersagli!';
  }

  @override
  String get angleFinderMessage => 'La tua intuizione geometrica è perfetta!';

  @override
  String angleFinderMessage1(String arg0) {
    return 'La risposta corretta era $arg0°';
  }

  @override
  String angleFinderText(String arg0) {
    return '$arg0°';
  }

  @override
  String visualStatisticalLearningMessage(String arg0) {
    return 'Hai segnato $arg0 schemi corretti!';
  }

  @override
  String nonogramText(String arg0) {
    return 'Errore: $arg0';
  }

  @override
  String mentalCalendarMessage(String arg0) {
    return 'Hai indovinato $arg0 su 10!';
  }

  @override
  String orbitTapMessage(String arg0) {
    return 'Hai toccato con successo $arg0 volte!';
  }

  @override
  String schulteTableMessage(String arg0) {
    return 'Hai completato la tabella in $arg0.\nContinua ad allenarti per espandere la tua visione periferica!';
  }

  @override
  String get schulteTableText => 'INIZIA TEST';

  @override
  String get relationalMemoryMessage =>
      'Favolosa precisione della memoria relazionale spaziale!';

  @override
  String sudokuText(String arg0) {
    return 'Errore: $arg0';
  }

  @override
  String sdmtMessage(String arg0) {
    return 'Hai abbinato $arg0 simboli! Questo test misura la tua velocità di scansione e l\'attenzione visiva.';
  }

  @override
  String get futoshikiMessage =>
      'Incredibile! Hai risolto il quadrato latino Futoshiki.';

  @override
  String letterFrequencyScanMessage(String arg0, String arg1) {
    return 'Hai contato correttamente $arg0 occorrenze di \"$arg1\".';
  }

  @override
  String letterFrequencyScanText(String arg0) {
    return 'Errato. Il conteggio era $arg0.';
  }

  @override
  String get memoryMatrixMessage =>
      'Impressionante! La tua memoria di lavoro è acuta. Obiettivo giornaliero completato!';

  @override
  String get memoryMatrixMessage1 =>
      'Concentrati e riprova per migliorare il tuo punteggio di memoria.';

  @override
  String get contextCluesMessage =>
      'Eccezionale! Il tuo vocabolario e la tua analisi contestuale sono di alto livello.';

  @override
  String get contextCluesMessage1 =>
      'Parola errata selezionata! Allena il tuo ragionamento contestuale verbale e riprova.';

  @override
  String oneLetterShiftMessage(String arg0, String arg1) {
    return 'Hai spostato correttamente $arg0 in $arg1.';
  }

  @override
  String get mentalAbacusMessage => 'Il tuo calcolo mentale è di alto livello.';

  @override
  String fractionMatcherMessage(String arg0) {
    return 'Hai segnato $arg0 punti abbinando le rappresentazioni!';
  }

  @override
  String get spellingSprintMessage =>
      'Hai scritto correttamente tutte le 10 parole!';

  @override
  String spellingSprintMessage1(String arg0) {
    return 'Hai scritto $arg0 parole.';
  }

  @override
  String stopSignalMessage(String arg0) {
    return 'Hai ottenuto $arg0 risposte corrette! Questo test misura la tua capacità di inibire un\'azione pianificata.';
  }

  @override
  String grammarPoliceMessage(String arg0) {
    return 'Game Over! Hai mantenuto l\'ordine nel mondo della grammatica. Punteggio: $arg0';
  }

  @override
  String consonantReconstructMessage(String arg0) {
    return 'Hai ricostruito un punteggio di $arg0!';
  }

  @override
  String rhymeMasterMessage(String arg0, String arg1) {
    return 'Hai trovato $arg0 rime su $arg1!';
  }

  @override
  String vigilanceTaskMessage(String arg0, String arg1, String arg2) {
    return 'Successi: $arg0, Errori: $arg1\nFalsi allarmi: $arg2';
  }

  @override
  String get silhouetteMatchOrthoMessage =>
      'Hai abilità di allineamento ortografico impeccabili!';

  @override
  String get silhouetteMatchOrthoText => 'CAPITO';

  @override
  String get silhouetteMatchOrthoText1 =>
      'Proiezione prospettica errata! Tocca Reset per riprovare.';

  @override
  String fibonacciMergeMessage(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String factorFinderMessage(String arg0) {
    return 'Hai segnato $arg0 punti trovando tutti i fattori!';
  }

  @override
  String logicalSyllogismsMessage(String arg0) {
    return 'Hai risolto correttamente $arg0 sillogismi!';
  }

  @override
  String get rotatingMazeMessage =>
      'Hai navigato con successo nel labirinto rotante cinetico!';

  @override
  String get rotatingMazeText => 'CAPITO';

  @override
  String get rotatingMazeText1 =>
      '🌀 Labirinto ruotato di 90°! Griglia spostata!';

  @override
  String get mathPathMessage =>
      'Hai trovato il percorso che somma al bersaglio!';

  @override
  String get bridgesMessage => 'Hai collegato con successo tutte le isole!';

  @override
  String compoundConnectMessage(String arg0, String arg1) {
    return 'La parola composta è $arg0$arg1.';
  }

  @override
  String get pangramSprintMessage =>
      'Hai costruito una frase usando tutte le 26 lettere.';

  @override
  String get mirrorImageMessage =>
      'Hai identificato perfettamente il riflesso.';

  @override
  String get mirrorImageText => 'IMMAGINE SPECULARE';

  @override
  String reverseStroopMessage(String arg0) {
    return 'Hai segnato $arg0 punti! Tieni d\'occhio le istruzioni.';
  }

  @override
  String get verbalAnalogiesMessage => 'Hai una mente acuta per le relazioni.';

  @override
  String corsiBlocksMessage1(String arg0, String arg1) {
    return 'Hai ricordato $arg1 sequenze! La tua capacità di memoria spaziale ha raggiunto $arg0.';
  }

  @override
  String wordLadderMessage(String arg0, String arg1, String arg2) {
    return 'Hai collegato con successo $arg0 a $arg1 in $arg2 passaggi.';
  }

  @override
  String d2AttentionMessage(String arg0) {
    return 'Scansione selettiva incredibile! Punteggio finale: $arg0.';
  }

  @override
  String get d2AttentionText => 'COME GIOCARE';

  @override
  String get d2AttentionText1 => 'CAPITO';

  @override
  String get tangleFixMessage => 'Tutte le linee sono chiare e lisce.';

  @override
  String get distractorMatrixMessage =>
      'Incredibile! Hai ricordato gli schemi nonostante i distrattori matematici cognitivi!';

  @override
  String get distractorMatrixMessage1 =>
      'I distrattori ti hanno preso! Riallena la tua memoria di lavoro.';

  @override
  String sentenceUnscrambleMessage(String arg0) {
    return 'Hai decifrato un punteggio di $arg0!';
  }

  @override
  String get kakuroMessage =>
      'Incredibile! Hai abbinato perfettamente tutti i segmenti di somma.';

  @override
  String symbolicFlankerMessage(String arg0, String arg1) {
    return 'Hai indovinato $arg0 su $arg1!';
  }

  @override
  String stroopTestMessage(String arg0) {
    return 'Hai indovinato $arg0 correttamente! Concentrati sul colore dell\'inchiostro, non sulla parola.';
  }

  @override
  String wisconsinCardSortingMessage(String arg0) {
    return 'Hai ordinato correttamente $arg0 carte!';
  }

  @override
  String nBackMessage(String arg0) {
    return 'Hai ottenuto $arg0 corrispondenze 2-back! La tua memoria di lavoro è vitale per il multitasking.';
  }

  @override
  String rhythmMasterMessage(String arg0, String arg1) {
    return 'Hai ottenuto $arg0 colpi perfetti e $arg1 punti!';
  }

  @override
  String groceryListMessage(String arg0, Object score) {
    return 'Hai segnato $arg0 punti in Lista della spesa!';
  }

  @override
  String get groceryListText => 'SONO PRONTO';

  @override
  String get mirrorTracingMessage =>
      'Il tuo cervello ha ricollegato con successo la sua coordinazione.';

  @override
  String moduloClockMessage(String arg0) {
    return 'Eccellente coordinazione matematica mentale modulare! Punteggio: $arg0';
  }

  @override
  String moduloClockMessage1(String arg0, String arg1, String arg2) {
    return 'Hai gestito $arg0 su $arg1 soluzioni di orologio modulare. Punteggio: $arg2';
  }

  @override
  String get crownMessage =>
      'Tutte le corone sono state posizionate con successo con una logica perfetta.';

  @override
  String dualCodingMessage(String arg0) {
    return 'Fantastica prestazione in doppio compito! Il tuo punteggio di memoria di lavoro: $arg0';
  }

  @override
  String inequalityDashMessage(String arg0) {
    return 'Hai segnato $arg0 punti abbinando le disuguaglianze!';
  }

  @override
  String sourceMonitoringMessage(String arg0, String arg1) {
    return 'Hai indovinato $arg0 su $arg1!';
  }

  @override
  String get sourceMonitoringText => 'INIZIA RICORDO';

  @override
  String get memoryPalaceText => 'PAROLE DISPONIBILI';

  @override
  String target10Message(String arg0) {
    return 'Hai segnato $arg0 punti abbinando i numeri a 10!';
  }

  @override
  String get paperFoldingMessage => 'Puoi vedere gli schemi nella tua mente.';

  @override
  String topologyText(String arg0, String arg1) {
    return '$arg0$arg1 / 10';
  }

  @override
  String get waterSortMessage => 'Hai ordinato tutti i colori perfettamente!';

  @override
  String anagramDefinitionMessage(String arg0) {
    return 'La parola era infatti \"$arg0\".';
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
    return 'Hai fatto $arg0 stime corrette.';
  }

  @override
  String grammarSortMessage(String arg0) {
    return 'Hai ordinato $arg0 parole correttamente!';
  }

  @override
  String vowelReconstructMessage(String arg0) {
    return 'Hai ricostruito un punteggio di $arg0!';
  }

  @override
  String spatialConflictMessage(String arg0, String arg1) {
    return 'Hai ottenuto un punteggio di $arg0 con $arg1 errori!';
  }

  @override
  String get spatialConflictText => 'COME GIOCARE';

  @override
  String get spatialConflictText1 => 'CAPITO';

  @override
  String tracePathMessage(String arg0) {
    return 'La tua precisione è stata del $arg0%!';
  }

  @override
  String ruleSwitcherMessage(String arg0, String arg1) {
    return 'Hai indovinato $arg0 su $arg1!';
  }

  @override
  String collatzMessage(String arg0, String arg1) {
    return 'Hai impiegato $arg0 passaggi. Il minimo possibile era $arg1.';
  }

  @override
  String get collatzText => '/ 2';

  @override
  String get collatzText1 => '+ 1';

  @override
  String get collatzText2 => '3n + 1';

  @override
  String divisibilityDashMessage(String arg0) {
    return 'Hai risolto $arg0 numeri!';
  }

  @override
  String switchTaskMessage(String arg0) {
    return 'Hai indovinato $arg0 correttamente! Il cambio rapido è la chiave per la flessibilità mentale.';
  }

  @override
  String sequenceSleuthMessage(String arg0) {
    return 'Hai risolto $arg0 sequenze!';
  }

  @override
  String changeBlindnessMessage(String arg0) {
    return 'Hai trovato $arg0 cambiamenti!';
  }

  @override
  String mentalRotationMessage(String arg0) {
    return 'Hai ruotato correttamente $arg0 forme!';
  }

  @override
  String wordMastermindMessage(String arg0) {
    return 'Hai dominato il codice!\nLa parola era: $arg0';
  }

  @override
  String wordMastermindMessage1(String arg0) {
    return 'La parola nascosta era: $arg0';
  }

  @override
  String wordMastermindText(String arg0) {
    return '$arg0';
  }

  @override
  String get simonSequenceMessage => 'Hai memorizzato tutte le 10 tessere!';

  @override
  String get simonSequenceMessage1 => 'Riprova per padroneggiare la sequenza.';

  @override
  String oxymoronHuntMessage(String arg0) {
    return 'Hai trovato $arg0 ossimori!';
  }

  @override
  String spotlightTrackMessage(String arg0) {
    return 'Incredibile tracciamento spaziale! Hai segnato $arg0 punti.';
  }

  @override
  String get spotlightTrackText => 'COME GIOCARE';

  @override
  String get spotlightTrackText1 => 'CAPITO';

  @override
  String get spotlightTrackText2 => 'INIZIA ROUND';

  @override
  String vennNumbersMessage(String arg0) {
    return 'Hai categorizzato $arg0 numeri!';
  }

  @override
  String get vennNumbersText => 'NESSUNO DEI DUE';

  @override
  String get vennNumbersText1 => 'ENTRAMBI';

  @override
  String get silhouetteMatchMessage =>
      'Il tuo cervello è eccellente nella traduzione da 3D a 2D.';

  @override
  String sumSnakeMessage(String arg0) {
    return 'Bersaglio $arg0 raggiunto con perfetta precisione!';
  }

  @override
  String get sumSnakeText => 'CANCELLA PERCORSO';

  @override
  String percentagePeakMessage(String arg0) {
    return 'Hai risolto $arg0 problemi di percentuale!';
  }

  @override
  String trailMakingMessage(String arg0) {
    return 'Hai completato $arg0 percorsi! Questo test misura la tua velocità di ricerca visiva e la flessibilità mentale.';
  }

  @override
  String matrixReasoningMessage(String arg0) {
    return 'Hai completato correttamente $arg0 matrici!';
  }

  @override
  String get tentsAndTreesMessage =>
      'Hai posizionato con successo tutte le tende.';

  @override
  String klotskiMessage(String arg0) {
    return 'Scorrimento sensazionale! Hai liberato il blocco Eroe in $arg0 mosse.';
  }

  @override
  String sumPyramidMessage(String arg0) {
    return 'Hai risolto con successo $arg0 piramidi di somme!';
  }

  @override
  String simonCommandMessage(String arg0) {
    return 'Eccellente risposta selettiva e concentrazione! Punteggio totale: $arg0';
  }

  @override
  String simonCommandMessage1(String arg0, String arg1) {
    return 'Hai segnato $arg0 ma non hai raggiunto $arg1 corrispondenze in tempo.';
  }

  @override
  String syllableStackMessage(String arg0) {
    return 'Hai accumulato un punteggio di $arg0!';
  }

  @override
  String get slitherlinkMessage =>
      'Fantastico! Hai completato con successo il puzzle ad anello.';

  @override
  String quickMathMessage(String arg0) {
    return 'Hai risolto $arg0 problemi!';
  }

  @override
  String commonDenominatorMessage(String arg0) {
    return 'Hai risolto $arg0 problemi di MCD/mcm!';
  }

  @override
  String chainReactionMessage(String arg0, String arg1) {
    return 'Il tuo punteggio finale è $arg0. Hai costruito una catena di $arg1 parole.';
  }

  @override
  String chainReactionText(String arg0) {
    return '$arg0';
  }

  @override
  String get associativePairsMessage =>
      'Brillante! Hai associato i tratti visivi senza errori.';

  @override
  String get associativePairsMessage1 =>
      'Associazione errata! Affina la tua memoria di collegamento e riprova.';

  @override
  String portmanteauSplitMessage(String arg0) {
    return 'Hai diviso $arg0 parole macedonia!';
  }

  @override
  String get magicSquaresText => 'CANCELLA';

  @override
  String alphabetSudokuText(String arg0) {
    return 'Errore: $arg0';
  }

  @override
  String get pipesMessage =>
      'Hai collegato tutti i tubi e riempito la griglia.';

  @override
  String get dualMirrorMessage =>
      'Hai guidato entrambe le icone verso i loro obiettivi!';

  @override
  String binaryCodeMessage(String arg0) {
    return 'Sensazionale traduzione decimale rapida! Punteggio finale: $arg0';
  }

  @override
  String binaryCodeMessage1(String arg0, String arg1) {
    return 'Hai convertito correttamente $arg0 numeri binari. Punteggio: $arg1';
  }

  @override
  String oddOneOutMessage(String arg0) {
    return 'Hai trovato 50 intrusi! Punteggio finale: $arg0';
  }

  @override
  String oddOneOutMessage1(String arg0) {
    return 'Il tuo punteggio: $arg0';
  }

  @override
  String letterBridgeMessage(String arg0) {
    return 'Hai trovato la lettera ponte: $arg0';
  }

  @override
  String get imReady => 'SONO PRONTO';

  @override
  String get soptTitle => 'Puntamento autoordinato';

  @override
  String get soptSubtitle =>
      'Tocca ogni volta una carta diversa. Le posizioni si mescolano!';

  @override
  String get soptWinTitle => 'Maestro della sequenza!';

  @override
  String soptGameOverMessage(int score) {
    return 'Hai ottenuto $score punti monitorando con successo le carte mescolate!';
  }

  @override
  String get soptChooseNovel => 'Tocca una nuova carta';

  @override
  String get soptGreatJob => 'Ottimo lavoro!';

  @override
  String get soptAlreadyTapped => 'Già sfruttato!';

  @override
  String get soptGrid => 'Griglia';

  @override
  String get contRecogTitle => 'Riconoscimento continuo';

  @override
  String get contRecogSubtitle =>
      'Hai già visto questa carta in questa sessione?';

  @override
  String get contRecogWinTitle => 'Genio del riconoscimento!';

  @override
  String contRecogGameOverMessage(int score) {
    return 'Hai ottenuto $score riconoscimenti corretti!';
  }

  @override
  String get contRecogCorrect => 'Corretto!';

  @override
  String get contRecogWrong => 'Sbagliato!';

  @override
  String get contRecogOldOrNew => 'È vecchio o nuovo?';

  @override
  String get contRecogNew => 'Nuovo';

  @override
  String get contRecogOld => 'Vecchio';

  @override
  String get contRecogSeenPool => 'Visto Piscina';

  @override
  String get dnmsTitle => 'Memoria non corrispondente';

  @override
  String get dnmsSubtitle =>
      'Tocca la carta che non era nel campione memorizzato.';

  @override
  String get dnmsWinTitle => 'Esperto non corrispondente!';

  @override
  String dnmsGameOverMessage(int score) {
    return 'Hai ottenuto $score risposte corrette in Ritardata Non Corrispondenza!';
  }

  @override
  String get dnmsChooseNovel => 'Tocca la nuova carta';

  @override
  String get dnmsMemorizeSample => 'Memorizza questa carta';

  @override
  String get dnmsWaitForIt => 'Aspettalo...';

  @override
  String get dnmsExcellent => 'Eccellente!';

  @override
  String get dnmsSampleTapped => 'Quello era il campione!';

  @override
  String get dnmsCards => 'Carte';

  @override
  String get symSpanTitle => 'Arco di simmetria';

  @override
  String get symSpanSubtitle =>
      'Richiama i modelli cellulari identificando la simmetria verticale.';

  @override
  String get symSpanWinTitle => 'Maestro della simmetria!';

  @override
  String symSpanGameOverMessage(int score) {
    return 'Hai ottenuto $score punti ricordando i layout e identificando la simmetria!';
  }

  @override
  String get symSpanMemorizeRed => 'Memorizza la posizione dei globuli rossi';

  @override
  String get symSpanIsSymmetric => 'Il modello è simmetrico?';

  @override
  String get symSpanRecallSequence =>
      'Richiamare la sequenza nell\'ordine corretto';

  @override
  String get symSpanGreatJob => 'Ottimo lavoro!';

  @override
  String get symSpanTryAgain => 'Riprova!';

  @override
  String get symSpanLength => 'Lunghezza';

  @override
  String get readingSpanTitle => 'Durata della lettura';

  @override
  String get readingSpanSubtitle =>
      'Verifica le frasi ricordando una sequenza di lettere.';

  @override
  String get readingSpanWinTitle => 'Esperto di lettura!';

  @override
  String readingSpanGameOverMessage(int score) {
    return 'Hai ottenuto $score punti nella sfida di memoria Reading Span!';
  }

  @override
  String get readingSpanTrueFalse => 'Questa affermazione è vera o falsa?';

  @override
  String get readingSpanMemorizeLetter => 'Memorizza questa lettera';

  @override
  String get readingSpanRecallLetters => 'Richiama le lettere in sequenza';

  @override
  String get readingSpanGreatJob => 'Ottimo lavoro!';

  @override
  String get readingSpanTryAgain => 'Riprova!';

  @override
  String readingSpanYourSequence(String sequence) {
    return 'La tua sequenza: $sequence';
  }

  @override
  String get readingSpanLength => 'Lunghezza';

  @override
  String get readingSpanSentence1 => 'Il sole sorge a est.';

  @override
  String get readingSpanSentence2 => 'Il ghiaccio è bollente.';

  @override
  String get readingSpanSentence3 => 'I pesci possono respirare sott\'acqua.';

  @override
  String get readingSpanSentence4 => 'I cani hanno le ali e possono volare.';

  @override
  String get readingSpanSentence5 => 'L\'acqua congela a 0 gradi Celsius.';

  @override
  String get readingSpanSentence6 =>
      'I gatti abbaiano come cani di piccola taglia.';

  @override
  String get readingSpanSentence7 => 'Gli alberi hanno foglie verdi in estate.';

  @override
  String get readingSpanSentence8 => 'La pioggia cade verso l\'alto da terra.';

  @override
  String get readingSpanSentence9 => 'Un triangolo ha quattro lati uguali.';

  @override
  String get readingSpanSentence10 => 'Le mele sono un tipo di frutto dolce.';

  @override
  String get readingSpanSentence11 => 'La luna è fatta di formaggio cheddar.';

  @override
  String get readingSpanSentence12 =>
      'Le automobili hanno le ruote che girano.';

  @override
  String get readingSpanSentence13 => 'Il fuoco è gelido.';

  @override
  String get readingSpanSentence14 =>
      'La carta è realizzata con legno lavorato.';

  @override
  String get readingSpanSentence15 =>
      'Gli uccelli hanno le piume che li aiutano a volare.';

  @override
  String get readingSpanSentence16 => 'Le banane crescono sui pini.';

  @override
  String get readingSpanSentence17 =>
      'Un elefante è più piccolo di una formica.';

  @override
  String get readingSpanSentence18 =>
      'I libri contengono pagine di testo stampate.';

  @override
  String get countingSpanTitle => 'Durata del conteggio';

  @override
  String get countingSpanSubtitle =>
      'Conta solo i cerchi blu. Quindi richiamare la sequenza dei conteggi.';

  @override
  String get countingSpanWinTitle => 'Contare il genio!';

  @override
  String countingSpanGameOverMessage(int score) {
    return 'Hai ottenuto $score punti nella sfida di memoria Counting Span!';
  }

  @override
  String get countingSpanCountCircles => 'Conta solo i cerchi blu';

  @override
  String get countingSpanRecallCounts =>
      'Richiamare i conteggi nell\'ordine corretto';

  @override
  String get countingSpanGreatJob => 'Ottimo lavoro!';

  @override
  String get countingSpanTryAgain => 'Riprova!';

  @override
  String countingSpanYourSequence(String sequence) {
    return 'La tua sequenza: $sequence';
  }

  @override
  String get countingSpanLength => 'Lunghezza';

  @override
  String get objDispTitle => 'Spostamento degli oggetti';

  @override
  String get objDispSubtitle =>
      'Memorizza la disposizione. Trova e tocca l\'unico oggetto che cambia posizione.';

  @override
  String get objDispWinTitle => 'Genio spaziale!';

  @override
  String objDispGameOverMessage(int score) {
    return 'Hai identificato correttamente $score oggetti spostati!';
  }

  @override
  String get objDispMemorizeAll => 'Memorizza tutti i posizionamenti';

  @override
  String get objDispWaitingShift => 'In attesa del cambio di layout...';

  @override
  String get objDispTapMoved => 'Tocca l\'oggetto che si è spostato';

  @override
  String get objDispExcellent => 'Eccellente!';

  @override
  String get objDispWrongObject => 'Oggetto sbagliato!';

  @override
  String get objDispItems => 'Elementi';

  @override
  String get mandalaTitle => 'Richiamo del Mandala';

  @override
  String get mandalaSubtitle =>
      'Memorizza la configurazione del colore. Scegli i colori e ridipingi le piastrelle.';

  @override
  String get mandalaWinTitle => 'Artista dei mandala!';

  @override
  String mandalaGameOverMessage(int score) {
    return 'Hai ottenuto $score punti ricreando layout geometrici colorati!';
  }

  @override
  String get mandalaMemorizeColors => 'Memorizza i colori delle piastrelle';

  @override
  String get mandalaPaintCells =>
      'Dipingi le celle in modo che corrispondano all\'originale';

  @override
  String get mandalaExcellent => 'Eccellente!';

  @override
  String get mandalaIncorrectMatch => 'Corrispondenza errata!';

  @override
  String get mandalaSubmitRepaint => 'Invia ridipingere';

  @override
  String get mandalaTiles => 'Piastrelle';

  @override
  String get runningSpanTitle => 'Durata della corsa';

  @override
  String get runningSpanSubtitle =>
      'Guarda le lettere. Quando si fermano, inserisci le ultime N lettere in ordine.';

  @override
  String get runningSpanWinTitle => 'Maestro Buffer!';

  @override
  String runningSpanGameOverMessage(int score) {
    return 'Hai segnato $score punti in Running Memory Span!';
  }

  @override
  String runningSpanPrepareRecall(int count) {
    return 'Preparati a ricordare le ultime $count lettere';
  }

  @override
  String get runningSpanWatchCarefully => 'Osserva attentamente...';

  @override
  String runningSpanEnterLast(int count) {
    return 'Inserisci le ultime $count lettere';
  }

  @override
  String get runningSpanGreatJob => 'Ottimo lavoro!';

  @override
  String get runningSpanIncorrectBuffer => 'Buffer errato!';

  @override
  String runningSpanRecallLast(int count) {
    return 'Richiama gli ultimi $count';
  }

  @override
  String get runningSpanStopsRandomly =>
      'Lo streaming si interrompe in modo casuale!';

  @override
  String runningSpanEntered(String sequence) {
    return 'Inserito: __SEQUENZA__';
  }

  @override
  String get runningSpanNItems => 'N-Articoli';

  @override
  String get spatialCabinetTitle => 'Armadi spaziali';

  @override
  String get spatialCabinetSubtitle =>
      'Memorizza quale cassetto dell\'armadio contiene quale oggetto.';

  @override
  String get spatialCabinetWinTitle => 'Esperto di gabinetto!';

  @override
  String spatialCabinetGameOverMessage(int score) {
    return 'Hai ottenuto $score punti nella Memoria del Gabinetto Spaziale!';
  }

  @override
  String get spatialCabinetMemorize => 'Memorizza le posizioni degli oggetti';

  @override
  String spatialCabinetWhereIs(String itemName) {
    return 'Dov\'è $itemName ?';
  }

  @override
  String get spatialCabinetCorrect => 'Corretto!';

  @override
  String get spatialCabinetWrongDrawer => 'Cassetto sbagliato!';

  @override
  String get spatialCabinetItems => 'Elementi';

  @override
  String get cabinetItemKey => 'Chiave';

  @override
  String get cabinetItemApple => 'Mela';

  @override
  String get cabinetItemDiamond => 'Diamante';

  @override
  String get cabinetItemBook => 'Libro';

  @override
  String get cabinetItemUmbrella => 'Ombrello';

  @override
  String get cabinetItemCoffee => 'Caffè';

  @override
  String get cabinetItemLock => 'Serratura';

  @override
  String get cabinetItemPet => 'Animale domestico';

  @override
  String get cabinetItemCar => 'Auto';

  @override
  String get gamesTitleLabel => 'GIOCHI';

  @override
  String get yourFavorites => 'I TUOI PREFERITI';

  @override
  String get readyForWorkout => 'PRONTO PER IL TUO ALLENAMENTO QUOTIDIANO?';

  @override
  String get greatStartKeepGoing => 'OTTIMO INIZIO! CONTINUA COSÌ.';

  @override
  String get onFireToday => 'SEI IN FORMA OGGI!';

  @override
  String get incredibleSolvingToday => 'RISOLUZIONI INCREDIBILI OGGI!';

  @override
  String get newGameLabel => 'NUOVO';

  @override
  String get slitherlinkTitle => 'Slitherlink';

  @override
  String get slitherlinkSubtitle =>
      'CIRCONDA LA GRIGLIA DI PIN USANDO GLI INDIZI NUMERICI.';

  @override
  String get futoshikiTitle => 'Futoshiki';

  @override
  String get futoshikiSubtitle =>
      'RIEMPI LE GRIGLIE CON GLI INDIZI MAGGIORE DI.';

  @override
  String get kakuroTitle => 'Kakuro';

  @override
  String get kakuroSubtitle => 'RISOLVI CRUCIVERBA CON NUMERI E SOMME.';

  @override
  String get inequalityDashTitle => 'Corsa alle Disuguaglianze';

  @override
  String get inequalityDashSubtitle =>
      'RISOLVI LE DISUGUAGLIANZE SOTTO PRESSIONE TEMPORALE.';

  @override
  String get factorFinderTitle => 'Cacciatore di Fattori';

  @override
  String get factorFinderSubtitle =>
      'IDENTIFICA TUTTI I FATTORI DEI NUMERI TARGET.';

  @override
  String get collatzTitle => 'Percorso di Collatz';

  @override
  String get collatzSubtitle => 'NAVIGA NELLA SEQUENZA 3N+1.';

  @override
  String get sumPyramidTitle => 'Piramide di Somme';

  @override
  String get sumPyramidSubtitle =>
      'RIEMPI LE CELLE DELLA PIRAMIDE CON INDIZI MATEMATICI DI SOMMA.';

  @override
  String get target10Title => 'Target 10';

  @override
  String get target10Subtitle =>
      'COMBINA LE TESSERE NUMERICHE PER OTTENERE SOMME DI DIECI.';

  @override
  String get fractionMatcherTitle => 'Abbinatore di Frazioni';

  @override
  String get fractionMatcherSubtitle =>
      'ABBINA LE FRAZIONI EQUIVALENTI VISUALMENTE.';

  @override
  String get dualCodingTitle => 'Doppia Codifica';

  @override
  String get dualCodingSubtitle =>
      'ABBINA LETTERE E SIMBOLI CONTEMPORANEAMENTE.';

  @override
  String get distractorMatrixTitle => 'Matrice di Distrattori';

  @override
  String get distractorMatrixSubtitle =>
      'TROVA LE FORME TARGET TRA I DISTRATTORI.';

  @override
  String get temporalOrderTitle => 'Ordine Temporale';

  @override
  String get temporalOrderSubtitle => 'RICORDA LA SEQUENZA CRONOLOGICA.';

  @override
  String get associativePairsTitle => 'Coppie Associative';

  @override
  String get associativePairsSubtitle =>
      'ACCOPPIA E ABBINA I SIMBOLI CORRISPONDENTI.';

  @override
  String get blockCount3dTitle => 'Conteggio Blocchi 3D';

  @override
  String get blockCount3dSubtitle =>
      'CONTA I BLOCCHI NELLO SPAZIO TRIDIMENSIONALE.';

  @override
  String get rotatingMazeTitle => 'Labirinto Rotante';

  @override
  String get rotatingMazeSubtitle =>
      'RUOTA I LABIRINTI PER GUIDARE LE PALLE VERSO L\'USCITA.';

  @override
  String get silhouetteMatchOrthoTitle => 'Abbinamento Silhouette (Orto)';

  @override
  String get silhouetteMatchOrthoSubtitle =>
      'ABBINA OGGETTI 3D CON OMBRE ORTOGONALI.';

  @override
  String get spatialConflictTitle => 'Conflitto Spaziale';

  @override
  String get spatialConflictSubtitle =>
      'RISOLVI LE DISCREPANZE TRA TESTO E DIREZIONE.';

  @override
  String get spotlightTrackTitle => 'Traccia Riflettore';

  @override
  String get spotlightTrackSubtitle =>
      'TRACCIA GLI ELEMENTI LAMPEGGIANTI NELLE OMBRE IN MOVIMENTO.';

  @override
  String get d2AttentionTitle => 'Attenzione d2';

  @override
  String get d2AttentionSubtitle =>
      'TOCCA I SIMBOLI TARGET CON CRITERI RIGIDI.';

  @override
  String get dualMirrorTitle => 'Navigazione a Doppio Specchio';

  @override
  String get dualMirrorSubtitle =>
      'NAVIGA IN DUE LABIRINTI CONTEMPORANEAMENTE.';

  @override
  String get contextCluesTitle => 'Indizi di Contesto';

  @override
  String get contextCluesSubtitle =>
      'DEDUCI LE PAROLE NASCOSTE DAGLI INDIZI CONTESTUALI.';

  @override
  String get digitSpanReverseSubtitle =>
      'RICORDA LE CIFRE NUMERICHE IN ORDINE INVERSO.';

  @override
  String get faceNameAssociationSubtitle =>
      'RICORDA I NOMI PER DIVERSI VOLTI PRESENTATI.';

  @override
  String get staircaseMemorySubtitle =>
      'MEMORIZZA I BLOCCHI IN UNA SEQUENZA A GRADINI.';

  @override
  String get choiceReactionTimeSubtitle =>
      'TOCCA RAPIDAMENTE I PULSANTI SPECIFICI CORRISPONDENTI AGLI INDIZI.';

  @override
  String get attentionalBlinkSubtitle =>
      'INDIVIDUA I TARGET RAPIDI CHE LAMPEGGIANO NEI FLUSSI.';

  @override
  String get visualStatisticalLearningSubtitle =>
      'APPRENDI I MODELLI DI FORME TEMPORALI VISIVAMENTE.';

  @override
  String get sternbergTaskSubtitle =>
      'RICORDA SE IL SIMBOLO ERA NELL\'INSIEME DI MEMORIA.';

  @override
  String get operationSpanSubtitle =>
      'RISOLVI I CALCOLI E RICORDA LE STRINGHE ALFABETICHE.';

  @override
  String get continuousRecognitionTitle => 'Riconoscimento Continuo';

  @override
  String get continuousRecognitionSubtitle =>
      'IDENTIFICA SE LA CARTA PRESENTATA È VECCHIA O NUOVA.';

  @override
  String get symmetrySpanTitle => 'Ampiezza di Simmetria';

  @override
  String get symmetrySpanSubtitle =>
      'RICORDA LE COORDINATE DELLE CELLE TRA LE DECISIONI DI SIMMETRIA VERTICALE.';

  @override
  String get objectDisplacementTitle => 'Spostamento di Oggetti';

  @override
  String get objectDisplacementSubtitle =>
      'STUDIA I POSIZIONAMENTI E TOCCA L\'UNICO OGGETTO CHE SI È SPOSTATO.';

  @override
  String get mandalaRecallTitle => 'Memoria di Mandala';

  @override
  String get mandalaRecallSubtitle =>
      'MEMORIZZA LE TESSERE COLORATE E RIDIPINGI I MANDALA DALLA TAVOLOZZA.';

  @override
  String get runningMemorySpanTitle => 'Ampiezza di Memoria Corrente';

  @override
  String get runningMemorySpanSubtitle =>
      'MONITORA LE LETTERE CORRENTI E RICORDA GLI ULTIMI N ELEMENTI.';

  @override
  String get spatialCabinetMemoryTitle => 'Armadi Spaziali';

  @override
  String get spatialCabinetMemorySubtitle =>
      'MEMORIZZA E LOCALIZZA GLI OGGETTI DIETRO LE ANTE DEGLI ARMADI.';

  @override
  String get pathRecallSubtitle =>
      'MEMORIZZA E RIPETI LE SELEZIONI DEI PERCORSI.';

  @override
  String get objectShuffleSubtitle =>
      'TRACCIA GLI ELEMENTI MESCOLATI SOTTO TAZZE PROFONDE.';

  @override
  String get groceryListSubtitle =>
      'MEMORIZZA E SPUNTA GLI ELEMENTI SULLA LISTA.';

  @override
  String get quickMathSubtitle =>
      'RISOLVI DOMANDE DI ARITMETICA ALLA MASSIMA VELOCITÀ.';

  @override
  String get mathGuessTitle => 'Indovina la Matematica';

  @override
  String get mathGuessSubtitle =>
      'INDOVINA IL NUMERO NASCOSTO IN 15 TENTATIVI.';

  @override
  String get reflexTapSubtitle =>
      'TOCCA GLI STIMOLI IL PIÙ VELOCEMENTE POSSIBILE.';

  @override
  String get pixelMimicSubtitle =>
      'IMITA I MODELLI DI DESIGN SULLE GRIGLIE DI PIXEL.';

  @override
  String get simonSequenceSubtitle =>
      'RIPETI LE SEQUENZE DI FORME DALLA MEMORIA.';

  @override
  String get slidePuzzleSubtitle =>
      'RIORDINA LE TESSERE DELLA GRIGLIA SCORREVOLE QUADRATA.';

  @override
  String get findWordTitle => 'Trova la Parola';

  @override
  String get schulteTableSubtitle => 'TOCCA I NUMERI DA UNO A VENTICINQUE.';

  @override
  String get simonCommandTitle => 'Comando di Simon';

  @override
  String get simonCommandSubtitle => 'ESEGUI RAPIDAMENTE LE ISTRUZIONI VOCALI.';

  @override
  String get binaryCodeTitle => 'Velocità Binaria';

  @override
  String get binaryCodeSubtitle => 'TRADUCI I CODICI BINARI IN DECIMALE.';

  @override
  String get moduloClockTitle => 'Orologio Modulo';

  @override
  String get moduloClockSubtitle =>
      'CALCOLA EQUAZIONI MATEMATICHE USANDO GLI OROLOGI.';

  @override
  String get chimpTestTitle => 'Test dello Scimpanzé';

  @override
  String get chimpTestSubtitle => 'TOCCA NUMERI CASUALI IN ORDINE CRESCENTE.';

  @override
  String get relationalMemoryTitle => 'Memoria Relazionale';

  @override
  String get relationalMemorySubtitle =>
      'RICORDA LE POSIZIONI ESATTE DEGLI ELEMENTI NELLA GRIGLIA.';

  @override
  String get factBinderTitle => 'Raccoglitore di Fatti';

  @override
  String get factBinderSubtitle =>
      'CONNETTI I SIMBOLI E RICORDA LE AFFERMAZIONI.';

  @override
  String get sourceMonitoringTitle => 'Monitoraggio della Fonte';

  @override
  String get sourceMonitoringSubtitle => 'RICORDA IL CONTEXT.';

  @override
  String get klotskiTitle => 'Fuga Klotski';

  @override
  String get klotskiSubtitle =>
      'FÀ SCORRERE I BLOCCHI PER RAGGIUNGERE LE USCITE.';

  @override
  String get homophoneHuntSubtitle => 'Scegli l\'omofono scritto correttamente';

  @override
  String get laserLinkTitle => 'Collegamento laser';

  @override
  String get laserLinkSubtitle =>
      'Ruota gli specchi per riflettere i laser e alimentare tutti i bersagli.';

  @override
  String get laserLinkCongrats =>
      'Riflessione di precisione! Hai alimentato con successo l\'intera rete.';

  @override
  String get crossSectionSliceTitle => 'Fetta trasversale';

  @override
  String get crossSectionSliceSubtitle =>
      'Identifica la corretta sezione trasversale 2D di un oggetto 3D da un\'angolazione specifica.';

  @override
  String get crossSectionSliceCongrats =>
      'Incredibile visualizzazione 3D! Hai visto proprio attraverso quella forma.';

  @override
  String get shadowPivotTitle => 'Pivote dell\'ombra';

  @override
  String get shadowPivotCongrats =>
      'Ragionamento spaziale dinamico! Hai padroneggiato luce e ombra.';

  @override
  String get shadowPivotSubtitle =>
      'Prevedi l\'ombra proiettata da un oggetto 3D mentre ruota su diversi assi.';

  @override
  String get interlockPuzzleTitle => 'Puzzle a incastro';

  @override
  String get interlockPuzzleSubtitle =>
      'Smonta o assembla complessi blocchi ad incastro nella corretta sequenza.';

  @override
  String get interlockPuzzleCongrats =>
      'Decostruzione logica! Hai svelato il puzzle perfettamente.';

  @override
  String get pathIntersectTitle => 'Intersezione di percorsi';

  @override
  String get pathIntersectSubtitle =>
      'Percorri più percorsi contemporaneamente per raggiungere i rispettivi obiettivi senza collisioni.';

  @override
  String get pathIntersectCongrats =>
      'Navigazione sincronizzata! Hai raggiunto tutti i bersagli in modo impeccabile.';

  @override
  String get negativeSpaceDetectionTitle => 'Spazio negativo';

  @override
  String get negativeSpaceDetectionSubtitle =>
      'Identifica la forma formata dallo spazio vuoto tra gli oggetti.';

  @override
  String get negativeSpaceDetectionCongrats =>
      'Percezione acuta! Hai imparato l\'arte di vedere ciò che non c\'è.';

  @override
  String get compassMazeTitle => 'Labirinto con bussola';

  @override
  String get compassMazeSubtitle =>
      'Naviga in un labirinto dove le direzioni di movimento cambiano in base all\'orientamento della tua bussola.';

  @override
  String get compassMazeCongrats =>
      'Navigazione esperta! Hai trovato l\'uscita attraverso le direzioni mutevoli.';

  @override
  String get complexFoldingNetsTitle => 'Reti di piegatura';

  @override
  String get complexFoldingNetsSubtitle =>
      'Determina quale complessa forma 3D si formerà piegando una rete 2D non standard.';

  @override
  String get complexFoldingNetsCongrats =>
      'Logica di piegatura avanzata! Hai visualizzato con successo la forma 3D.';

  @override
  String get compassMazeMessage => 'Naviga nel labirinto usando la bussola.';

  @override
  String get negativeSpaceDetectionMessage =>
      'Identifica l\'oggetto nascosto nello spazio.';

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
}
