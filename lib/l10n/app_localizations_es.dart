// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Juegos de Puzzle';

  @override
  String get home => 'Inicio';

  @override
  String get settings => 'Ajustes';

  @override
  String get playAgain => 'Jugar de nuevo';

  @override
  String get playNext => 'Jugar Siguiente';

  @override
  String get seeCompleted => 'Revisar puzzle';

  @override
  String get finish => 'Finalizar';

  @override
  String get congrats => '¡Felicidades!';

  @override
  String get perfectGradient => '¡Gradiente perfecto!';

  @override
  String get wellDone => 'Bien hecho';

  @override
  String get timeUp => '¡Se acabó el tiempo!';

  @override
  String get victory => '¡Victoria!';

  @override
  String get gameWin => '¡BIEN HECHO!';

  @override
  String get completed => '¡Completado!';

  @override
  String get score => 'Puntuación';

  @override
  String get timeLeft => 'Tiempo';

  @override
  String get trials => 'Intentos';

  @override
  String get numberRule => 'Regla numérica';

  @override
  String get colorRule => 'Regla de color';

  @override
  String get valid => 'Válido';

  @override
  String get invalid => 'Inválido';

  @override
  String get even => 'Par';

  @override
  String get odd => 'Impar';

  @override
  String get red => 'Rojo';

  @override
  String get green => 'Verde';

  @override
  String get blue => 'Azul';

  @override
  String get yes => 'Sí';

  @override
  String get no => 'No';

  @override
  String get trueLabel => 'Verdadero';

  @override
  String get falseLabel => 'Falso';

  @override
  String get clear => 'Limpiar';

  @override
  String get north => 'Norte';

  @override
  String get south => 'Sur';

  @override
  String get east => 'Este';

  @override
  String get west => 'Oeste';

  @override
  String get target => 'Objetivo';

  @override
  String get moves => 'Movimientos';

  @override
  String get trialMode => 'Modo de prueba';

  @override
  String get trialModeDescription =>
      'Resuelve 20 para terminar en lugar del temporizador de 60s';

  @override
  String get keepScreenAwake => 'Keep Screen Awake';

  @override
  String get keepScreenAwakeDescription =>
      'Prevent screen from turning off during gameplay';

  @override
  String get appearance => 'Apariencia';

  @override
  String get language => 'Idioma';

  @override
  String get gameplay => 'Jugabilidad';

  @override
  String get supportUs => 'Apóyanos';

  @override
  String get systemLegal => 'Sistema y legal';

  @override
  String get games => 'Juegos';

  @override
  String get solvedToday => 'Resueltos hoy';

  @override
  String get searchGames => 'Buscar juegos...';

  @override
  String get readyToStart => '¿LISTO PARA TU ENTRENAMIENTO CEREBRAL?';

  @override
  String get greatStart => '¡BUEN COMIENZO! MANTÉN EL IMPULSO.';

  @override
  String get onFire => '¡EN RACHA! A TU CEREBRO LE ENCANTA ESTO.';

  @override
  String get incredible => '¡INCREÍBLE! ERES UN MAESTRO DE LOS PUZZLES.';

  @override
  String get noGamesMatch => 'NINGÚN JUEGO COINCIDE CON TU BÚSQUEDA';

  @override
  String get categoryAll => 'TODOS';

  @override
  String get categoryAttention => 'ATENCIÓN';

  @override
  String get categoryLogic => 'LÓGICA';

  @override
  String get categoryMath => 'MATEMÁTICAS';

  @override
  String get categoryWord => 'PALABRAS';

  @override
  String get categoryMemory => 'MEMORIA';

  @override
  String get categorySpatial => 'ESPACIAL';

  @override
  String get themeLight => 'CLARO';

  @override
  String get themeDark => 'OSCURO';

  @override
  String get themeSystem => 'SISTEMA';

  @override
  String get starOnGithub => 'Danos una estrella en GitHub';

  @override
  String get sponsorOnGithub => 'Patrocina en GitHub';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get termsOfService => 'Términos de servicio';

  @override
  String get licenses => 'Licencias';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return 'Tienes $maxTries intentos para encontrar la palabra oculta de $wordLength letras.';
  }

  @override
  String wordFoundMessage(String word) {
    return 'Palabra encontrada con éxito: $word';
  }

  @override
  String gameOverMessage(String word) {
    return 'La palabra era: $word';
  }

  @override
  String get gameOver => 'Fin del juego';

  @override
  String get crosswordTitle => 'Crucigrama';

  @override
  String get crosswordSubtitle =>
      'Completa la cuadrícula con las palabras correctas según las pistas proporcionadas.';

  @override
  String get wordSearchTitle => 'Sopa de letras';

  @override
  String get radicalRootsTitle => 'Raíces Radicales';

  @override
  String get radicalRootsSubtitle =>
      'Encuentra la raíz cuadrada o cúbica del número dado. Redondea al entero más cercano si es necesario.';

  @override
  String get radicalRootsGoalReached => '¡Objetivo alcanzado!';

  @override
  String get radicalRootsTimeUp => '¡Tiempo agotado!';

  @override
  String radicalRootsScoreMessage(int score) {
    return '¡Calculaste $score raíces correctamente!';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return '¡Sigue practicando! Calculaste $score raíces.';
  }

  @override
  String get radicalRootsStart => 'Empezar a calcular';

  @override
  String get radicalRootsDescription =>
      'Tienes 60 segundos para resolver tantos como puedas.';

  @override
  String get radicalRootsBest => 'Mejor';

  @override
  String get radicalRootsSeconds => '60 SEGUNDOS';

  @override
  String get romanArithmeticTitle => 'Aritmética Romana';

  @override
  String get romanArithmeticSubtitle =>
      'Resuelve problemas de suma y resta usando números romanos.';

  @override
  String get romanArithmeticGoalReached => '¡Nivel Centurión!';

  @override
  String get romanArithmeticTimeUp => '¡Tiempo agotado!';

  @override
  String romanArithmeticScoreMessage(int score) {
    return '¡Resolviste $score problemas romanos!';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return '¡Veni, Vidi, Vici! Resolviste $score problemas.';
  }

  @override
  String get romanArithmeticStart => 'Comenzar búsqueda';

  @override
  String get romanArithmeticDescription =>
      'Convierte y resuelve. Tienes 60 segundos.';

  @override
  String get romanArithmeticBest => 'Mejor';

  @override
  String get romanArithmeticSeconds => '60 SEGUNDOS';

  @override
  String get wordSearchSubtitle =>
      'Encuentra todas las palabras ocultas en la cuadrícula. Arrastra para seleccionar.';

  @override
  String get missingVowelsTitle => 'Vocales faltantes';

  @override
  String get missingVowelsSubtitle =>
      'Identifica la palabra con sus vocales ocultas.';

  @override
  String get missingVowelsWin => '¡Vocales restauradas!';

  @override
  String get missingVowelsHowToPlay =>
      'Se muestra una palabra con sus vocales (A, E, I, O, U) ocultas. ¡Adivina la palabra completa!';

  @override
  String get wordScrambleTitle => 'Palabra revuelta';

  @override
  String get wordScrambleSubtitle =>
      '¡Toca las letras para descifrar la palabra oculta!';

  @override
  String get wordScrambleWin => '¡Palabra descifrada!';

  @override
  String get sudokuTitle => 'Sudoku';

  @override
  String get sudokuSubtitle =>
      'Completa la cuadrícula para que cada fila, columna y cuadro de 3x3 contenga todos los dígitos del 1 al 9.';

  @override
  String get minesweeperTitle => 'Buscaminas';

  @override
  String get minesweeperSubtitle =>
      'Identifica todas las minas sin activarlas.';

  @override
  String get minesweeperWin => '¡Victoria!';

  @override
  String get minesweeperMines => 'MINAS';

  @override
  String get minesweeperStatus => 'ESTADO';

  @override
  String get minesweeperWon => 'GANASTE';

  @override
  String get minesweeperBoom => 'BOOM';

  @override
  String get minesweeperPlaying => 'JUGANDO';

  @override
  String get minesweeperReveal => 'REVELAR';

  @override
  String get minesweeperFlag => 'BANDERA';

  @override
  String get game2048Title => '2048';

  @override
  String get game2048Subtitle =>
      '¡Desliza en cualquier dirección para combinar las fichas y llegar a la ficha 2048!';

  @override
  String get nonogramTitle => 'Nonograma';

  @override
  String get nonogramSubtitle =>
      'Revela la imagen oculta usando pistas lógicas.';

  @override
  String get nonogramWin => '¡Imagen revelada!';

  @override
  String get magnetsTitle => 'IMANES';

  @override
  String get magnetsSubtitle =>
      'Coloca imanes en la cuadrícula según los recuentos de polos.';

  @override
  String get magnetsHowToPlay =>
      'Llena contenedores del tamaño de un dominó con imanes \"+\" y \"-\" o déjalos en blanco. Las pistas de filas y columnas especifican el número total de cada polo en esa línea. Los polos idénticos no pueden estar adyacentes ortogonalmente.';

  @override
  String get magnetsWinTitle => '¡POLARIDAD EQUILIBRADA!';

  @override
  String get magnetsWinMessage =>
      '¡Todos los imanes están perfectamente dispuestos!';

  @override
  String get lighthousesTitle => 'FAROS';

  @override
  String get lighthousesSubtitle => 'Coloca barcos basados en pistas de faros.';

  @override
  String get lighthousesHowToPlay =>
      'Coloca barcos de 1x1 en la cuadrícula. Los faros indican el número total de barcos visibles horizontal y verticalmente. Los barcos no pueden tocar los faros ni entre sí, ni siquiera en diagonal.';

  @override
  String get lighthousesWinTitle => '¡MAR SEGURO!';

  @override
  String get lighthousesWinMessage =>
      '¡Todos los faros están guiando los barcos perfectamente!';

  @override
  String get dominosaTitle => 'DOMINOSA';

  @override
  String get dominosaSubtitle =>
      'Encuentra todos los dominós ocultos en la cuadrícula.';

  @override
  String get dominosaHowToPlay =>
      'Organiza un juego completo de dominós en una cuadrícula de números de modo que cada par de números adyacentes esté cubierto por exactamente un dominó. Cada par de números existe solo una vez en el conjunto.';

  @override
  String get dominosaWinTitle => '¡MAESTRO DEL DOMINÓ!';

  @override
  String get dominosaWinMessage =>
      '¡Se han encontrado y colocado todos los dominós!';

  @override
  String get skyscrapersTitle => 'RASCACIELOS';

  @override
  String get skyscrapersSubtitle =>
      'Llena la cuadrícula con alturas de edificios.';

  @override
  String get skyscrapersHowToPlay =>
      'Llena la cuadrícula con alturas (1-N) de modo que cada fila y columna contenga cada altura exactamente una vez. Las pistas en los bordes indican cuántos edificios son visibles desde esa dirección, con los edificios más altos bloqueando a los más bajos.';

  @override
  String get skyscrapersWinTitle => '¡HORIZONTE RESTAURADO!';

  @override
  String get skyscrapersWinMessage =>
      '¡Todos los edificios están perfectamente posicionados!';

  @override
  String get nurikabeTitle => 'NURIKABE';

  @override
  String get nurikabeSubtitle => 'Forma un mar conectado e islas separadas.';

  @override
  String get nurikabeHowToPlay =>
      'Sombrea celdas para formar un único \"mar\" conectado (sin bloques de 2x2). Las celdas sin sombrear forman \"islas\", cada una con exactamente un número que representa su área total.';

  @override
  String get nurikabeWinTitle => '¡MAR FLUYENDO!';

  @override
  String get nurikabeWinMessage => '¡Islas separadas, mar conectado!';

  @override
  String get fillominoTitle => 'FILLOMINO';

  @override
  String get fillominoSubtitle =>
      'Divide la cuadrícula en poliominós de los tamaños especificados.';

  @override
  String get fillominoHowToPlay =>
      'Divide la cuadrícula en poliominós de modo que cada poliominó de tamaño N contenga el número N en todas sus celdas. Los poliominós del mismo tamaño no pueden estar adyacentes ortogonalmente.';

  @override
  String get fillominoWinTitle => '¡CUADRÍCULA DIVIDIDA!';

  @override
  String get fillominoWinMessage => '¡Perfectamente embaldosado con lógica!';

  @override
  String get hitoriTitle => 'HITORI';

  @override
  String get hitoriSubtitle =>
      'Sombrea los números duplicados en cada fila y columna.';

  @override
  String get hitoriHowToPlay =>
      'Sombrea celdas para que ningún número aparezca más de una vez en cualquier fila o columna. Las celdas sombreadas no pueden estar adyacentes (ortogonalmente), y todas las celdas sin sombrear deben formar un único grupo conectado.';

  @override
  String get hitoriWinTitle => '¡MAESTRO DE HITORI!';

  @override
  String get hitoriWinMessage =>
      '¡Has resuelto con éxito todos los duplicados!';

  @override
  String get pathFinderTitle => 'Buscador de caminos';

  @override
  String get pathFinderSubtitle => 'Encuentra el camino oculto de S a E.';

  @override
  String get pathFinderWin => '¡Camino dominado!';

  @override
  String get howToPlay => 'Cómo jugar';

  @override
  String get gotIt => 'Entendido';

  @override
  String get akariTitle => 'Akari';

  @override
  String get akariSubtitle => 'Ilumina todas las celdas blancas';

  @override
  String get akariHowToPlay =>
      'Coloca bombillas en las celdas blancas para iluminar toda la cuadrícula. Las bombillas iluminan su fila y columna hasta que golpean una pared. No pueden brillar dos bombillas una sobre la otra. Las paredes numeradas muestran exactamente cuántas bombillas deben colocarse en las celdas adyacentes (arriba, abajo, izquierda, derecha).';

  @override
  String get akariWinTitle => '¡LUCES ENCENDIDAS!';

  @override
  String get akariWinMessage => 'Todo está perfectamente iluminado.';

  @override
  String get arithmeticChainTitle => 'Cálculo en cadena';

  @override
  String get arithmeticChainSubtitle =>
      'Calcula el total acumulado en tu cabeza';

  @override
  String get arithmeticChainWinTitle => '¡NIVEL COMPLETADO!';

  @override
  String get arithmeticChainWinMessage => '¡Tu cálculo mental es agudo!';

  @override
  String get arithmeticChainLoseTitle => 'INTÉNTALO DE NUEVO';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return 'La respuesta correcta era $answer.';
  }

  @override
  String get arithmeticChainStart => 'EMPEZAR';

  @override
  String get arithmeticChainNext => 'SIGUIENTE';

  @override
  String get attentionalBlinkTitle => 'Parpadeo atencional';

  @override
  String get attentionalBlinkSubtitleWatch => 'OBSERVA LOS NÚMEROS';

  @override
  String get attentionalBlinkSubtitleInput =>
      'INTRODUCE LOS DOS NÚMEROS QUE VISTE';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return '¡Acertaste $score objetivos!';
  }

  @override
  String get balanceScaleTitle => 'BALANZA';

  @override
  String get balanceScaleSubtitle =>
      'Deduce el peso del último objeto basándote en las balanzas.';

  @override
  String get balanceScaleWinTitle => '¡EQUILIBRADO!';

  @override
  String get balanceScaleWinMessage => '¡Dedujiste correctamente el peso!';

  @override
  String get balanceScaleLoseTitle => 'DESEQUILIBRADO';

  @override
  String get balanceScaleLoseMessage =>
      'Inténtalo de nuevo para encontrar el equilibrio correcto.';

  @override
  String get balanceScaleBack => 'ATRÁS';

  @override
  String get balanceScaleSubmit => 'ENVIAR';

  @override
  String get binaryPuzzleTitle => 'PUZZLE BINARIO';

  @override
  String get binaryPuzzleSubtitle =>
      'Rellena con 0 y 1. Máximo dos dígitos iguales adyacentes. Igual número de 0s y 1s en cada fila y columna.';

  @override
  String get binaryPuzzleWinTitle => 'BIEN HECHO';

  @override
  String get binaryPuzzleWinMessage =>
      '¡Resolviste el puzzle binario con una lógica perfecta!';

  @override
  String get blockEscapeTitle => 'ESCAPE DE BLOQUES';

  @override
  String get blockEscapeSubtitle =>
      'Desliza los bloques para despejar el camino y que el bloque principal llegue a la salida.';

  @override
  String get blockEscapeWinTitle => '¡ESCAPASTE!';

  @override
  String get blockEscapeWinMessage =>
      '¡Lograste despejar el camino para el bloque principal!';

  @override
  String get boxCompletionTitle => 'Cubo plegado';

  @override
  String get boxCompletionSubtitle => '¿Qué cubo se puede formar?';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return '¡Acertaste $score de $totalTrials!';
  }

  @override
  String get boxCompletionOptions => 'OPCIONES';

  @override
  String get bridgesTitle => 'PUENTES';

  @override
  String get bridgesSubtitle =>
      'Conecta las islas con puentes. Cada isla necesita un número específico de puentes. Los puentes no pueden cruzarse.';

  @override
  String get bridgesWinTitle => '¡CONECTADO!';

  @override
  String get bridgesWinMessage => '¡Lograste conectar todas las islas!';

  @override
  String get calculationSprintTitle => 'SPRINT DE CÁLCULO';

  @override
  String get calculationSprintSubtitle =>
      'Resuelve tantas ecuaciones como puedas en 60 segundos.';

  @override
  String get calculationSprintGoalReached => '¡OBJETIVO ALCANZADO!';

  @override
  String get calculationSprintTimeUp => 'SE ACABÓ EL TIEMPO';

  @override
  String calculationSprintScoreMessage(int score) {
    return '¡Excelente velocidad de cálculo! Has conseguido $score puntos.';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return 'Has conseguido $score puntos. ¡Intenta superar tu mejor marca!';
  }

  @override
  String get calculationSprintBest => 'MEJOR';

  @override
  String get calculationSprintSeconds => '60 SEGUNDOS';

  @override
  String get calculationSprintDescription =>
      'Resuelve ecuaciones rápido.\n¡Las respuestas incorrectas restan 3 segundos!';

  @override
  String get calculationSprintStart => 'EMPEZAR SPRINT';

  @override
  String get categoryFluencyTitle => 'Fluidez categórica';

  @override
  String get categoryFluencySubtitle =>
      'Introduce elementos que pertenezcan a la categoría';

  @override
  String get categoryFluencyExpert => '¡EXPERTO EN FLUIDEZ!';

  @override
  String get categoryFluencyTimeUp => '¡TIEMPO AGOTADO!';

  @override
  String get categoryFluencyWinMessage => '¡Tienes un vocabulario inmenso!';

  @override
  String categoryFluencyFoundMessage(int count) {
    return 'Encontraste $count palabras.';
  }

  @override
  String get categoryFluencyCategoryLabel => 'Categoría:';

  @override
  String get categoryFluencyEnterItem => 'Introduce un elemento...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target palabras';
  }

  @override
  String get changeBlindnessTitle => 'Ceguera al cambio';

  @override
  String get changeBlindnessSubtitle => 'ENCUENTRA EL OBJETO QUE CAMBIA';

  @override
  String changeBlindnessScore(int score) {
    return 'PUNTUACIÓN: $score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return '¡Encontraste $score cambios!';
  }

  @override
  String get choiceRtTitle => 'Tiempo de reacción';

  @override
  String get choiceRtSubtitle =>
      'Toca el cuadrado activo tan rápido como puedas';

  @override
  String choiceRtAvgMessage(String avg) {
    return 'Tu tiempo medio de reacción: ${avg}ms';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return 'Tiempo restante: ${time}s';
  }

  @override
  String choiceRtTaps(int count) {
    return 'Toques: $count';
  }

  @override
  String get colorFloodTitle => 'Inundación de color';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return 'Movimientos: $moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => '¡ÉXITO EN LA INUNDACIÓN!';

  @override
  String get colorFloodDryLand => 'TIERRA SECA...';

  @override
  String get colorFloodWinMessage => '¡Saturaste toda la cuadrícula con color!';

  @override
  String get colorFloodLoseMessage =>
      'Te has quedado sin movimientos. ¡Inténtalo de nuevo!';

  @override
  String get colorMatchTitle => 'COMBINACIÓN DE COLORES';

  @override
  String get colorMatchSubtitle =>
      'Ajusta los deslizadores para que coincidan lo más posible con el color objetivo.';

  @override
  String get colorMatchTarget => 'OBJETIVO';

  @override
  String get colorMatchYours => 'EL TUYO';

  @override
  String get colorMatchCheck => 'COMPROBAR';

  @override
  String get colorMatchResult => 'RESULTADO';

  @override
  String colorMatchAccuracy(String accuracy) {
    return 'Tu precisión: $accuracy%';
  }

  @override
  String get corsiBlocksTitle => 'BLOQUES DE CORSI';

  @override
  String get corsiBlocksSubtitle =>
      'Observa cómo se iluminan los bloques y tócalos en el mismo orden.';

  @override
  String get corsiBlocksWinTitle => '¡MAESTRO ESPACIAL!';

  @override
  String get corsiBlocksLoseTitle => 'PERDIDO EN EL ESPACIO';

  @override
  String corsiBlocksMessage(int score, int span) {
    return '¡Recordaste $score secuencias! Tu capacidad de memoria espacial alcanzó $span.';
  }

  @override
  String get corsiBlocksWatch => 'OBSERVA EL PATRÓN';

  @override
  String get corsiBlocksRepeat => 'REPITE EL PATRÓN';

  @override
  String get corsiBlocksExcellent => '¡EXCELENTE!';

  @override
  String get corsiBlocksSpan => 'CAPACIDAD';

  @override
  String get crownTitle => 'CORONA';

  @override
  String get crownSubtitle =>
      'Coloca una corona en cada fila, columna y región de color. Las coronas no pueden estar adyacentes, ni siquiera en diagonal.';

  @override
  String get crownCrowned => '¡CORONADO!';

  @override
  String get crownSuccess =>
      'Todas las coronas colocadas con éxito y una lógica perfecta.';

  @override
  String get cryptogramTitle => 'CRIPTOGRAMA';

  @override
  String get cryptogramSubtitle =>
      '¡Asigna letras para descodificar el mensaje secreto! Cada letra codificada representa una letra real.';

  @override
  String get cryptogramBroken => '¡CÓDIGO DESCIFRADO!';

  @override
  String get cryptogramEncrypted => 'ENCRIPTADO';

  @override
  String get cryptogramSuccess => 'Has descodificado el mensaje perfectamente.';

  @override
  String get cryptogramTryAgain => 'Inténtalo de nuevo para romper el cifrado.';

  @override
  String get digitSpanReverseTitle => 'Memoria inversa';

  @override
  String get digitSpanReverseSubtitleMemorize => 'Memoriza los dígitos';

  @override
  String get digitSpanReverseSubtitleEnter =>
      'Introduce los dígitos en orden INVERSO';

  @override
  String get digitSpanReverseWinTitle => '¡NIVEL SUPERADO!';

  @override
  String get digitSpanReverseWinMessage =>
      '¡Tu memoria de trabajo es impresionante!';

  @override
  String get digitSpanReverseLoseTitle => 'INTÉNTALO DE NUEVO';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return 'La secuencia inversa correcta era $sequence.';
  }

  @override
  String get dividedAttentionTitle => 'Atención dividida';

  @override
  String get dividedAttentionSubtitle =>
      'Toca IZQUIERDA para ESTRELLA ⭐ | Toca DERECHA para ROJO 🔴';

  @override
  String get dividedAttentionGameOverTitle => 'CONCENTRACIÓN PERDIDA';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return '¡La multitarea es difícil! Tu puntuación fue $score.';
  }

  @override
  String dividedAttentionScore(int score) {
    return 'PUNTUACIÓN: $score';
  }

  @override
  String get doubleNBackTitle => 'Doble N-Back';

  @override
  String doubleNBackSubtitle(int n) {
    return 'Coincide los estímulos de $n pasos atrás';
  }

  @override
  String get doubleNBackGameOverTitle => 'FIN DEL JUEGO';

  @override
  String doubleNBackGameOverMessage(int score) {
    return '¡Has conseguido $score puntos en Doble N-Back!';
  }

  @override
  String doubleNBackScore(int score) {
    return 'Puntuación: $score';
  }

  @override
  String get doubleNBackPositionMatch => 'COINCIDENCIA DE POSICIÓN';

  @override
  String get doubleNBackLetterMatch => 'COINCIDENCIA DE LETRA';

  @override
  String get faceNameAssociationTitle => 'Cara-Nombre';

  @override
  String get faceNameAssociationSubtitleStudy =>
      'Memoriza el nombre de cada cara';

  @override
  String get faceNameAssociationSubtitleTest => '¿Quién es esta persona?';

  @override
  String get faceNameAssociationPerfect => '¡PERFECTO!';

  @override
  String get faceNameAssociationGameOver => 'FIN DEL JUEGO';

  @override
  String get faceNameAssociationWinMessage =>
      '¡Tienes una gran memoria para las caras y los nombres!';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return 'Acertaste $correct de $total.';
  }

  @override
  String get faceNameAssociationStartTest => 'EMPEZAR TEST';

  @override
  String get flankerTestWinTitle => '¡CONCENTRACIÓN LÁSER!';

  @override
  String get flankerTestLoseTitle => 'DISTRAÍDO';

  @override
  String flankerTestScoreMessage(int score) {
    return '¡Has acertado $score correctamente!';
  }

  @override
  String get flankerTestTitle => 'TEST DE FLANCOS';

  @override
  String get flankerTestSubtitle =>
      'Indica la dirección de la flecha central, ignorando las flechas laterales.';

  @override
  String get flankerTestLeft => 'IZQUIERDA';

  @override
  String get flankerTestRight => 'DERECHA';

  @override
  String get fractionMatchTitle => 'Emparejar fracciones';

  @override
  String get fractionMatchSubtitle => 'Empareja la imagen con su fracción';

  @override
  String get fractionMatchLoseTitle => 'FRACCIÓN INCORRECTA';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return 'La respuesta correcta era $correctAnswer.';
  }

  @override
  String get goNoGoTitle => 'Go / No-Go';

  @override
  String get goNoGoSubtitle => '¡Toca para Verde, IGNORA el Rojo!';

  @override
  String get goNoGoLoseTitle => 'REACCIÓN DETENIDA';

  @override
  String get goNoGoLoseMessage =>
      '¡Tu control inhibitorio está siendo puesto a prueba!';

  @override
  String get goNoGoTapAnywhere => 'TOCA EN CUALQUIER LUGAR PARA CONTINUAR';

  @override
  String get groceryListTitle => 'Lista de la compra';

  @override
  String get groceryListSubtitleMemorize =>
      'Memoriza los objetos y sus categorías';

  @override
  String get groceryListSubtitleTest =>
      '¿A qué categoría pertenecía este objeto?';

  @override
  String get groceryListWinTitle => '¡GURÚ DE LA COMPRA!';

  @override
  String get groceryListLoseTitle => '¿OLVIDASTE ALGO?';

  @override
  String groceryListScoreMessage(int score) {
    return '¡Has conseguido $score puntos en Lista de la Compra!';
  }

  @override
  String get groceryListReady => 'ESTOY LISTO';

  @override
  String get groceryListWhereBelong => '¿DÓNDE PERTENECE ESTO?';

  @override
  String get hueSortTitle => 'ORDENAR MATICES';

  @override
  String get hueSortSubtitle =>
      'Intercambia las fichas para crear una transición suave entre los colores de las esquinas. Los puntos indican fichas fijas.';

  @override
  String get hueSortWinTitle => '¡GRADIENTE PERFECTO!';

  @override
  String get hueSortWinMessage =>
      '¡Has ordenado perfectamente el espectro de colores!';

  @override
  String hueSortWrongTiles(int count) {
    return 'Azulejos en la posición incorrecta: $count';
  }

  @override
  String get kenkenTitle => 'KenKen';

  @override
  String get kenkenWinTitle => '¡GENIO!';

  @override
  String get kenkenLoseTitle => 'FIN DEL JUEGO';

  @override
  String get kenkenWinMessage => '¡Has resuelto el puzzle KenKen!';

  @override
  String get kenkenLoseMessage =>
      'Comprueba las reglas de fila/columna y de las celdas.';

  @override
  String kenkenSubtitle(int size) {
    return 'Rellena del 1 al $size sin repetir en filas o columnas';
  }

  @override
  String get letterCancellationTitle => 'Cancelación de letras';

  @override
  String get letterCancellationTitleFull => 'Cancelación de letras';

  @override
  String letterCancellationScoreMessage(int score) {
    return '¡Encontraste $score letras!';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return 'Encuentra todas las letras \"$target\"';
  }

  @override
  String get letterCancellationFound => 'ENCONTRADO';

  @override
  String get letterCancellationTime => 'TIEMPO';

  @override
  String get lightsOutTitle => 'LUCES FUERA';

  @override
  String get lightsOutSubtitle =>
      'Tocar una ficha la cambia a ella y a sus vecinas. Apaga todas las luces para resolverlo.';

  @override
  String get lightsOutWinTitle => '¡PUZZLE RESUELTO!';

  @override
  String get lightsOutWinMessage =>
      '¡Lograste apagar todas las luces con éxito!';

  @override
  String get symmetryTitle => 'Simetría';

  @override
  String get symmetrySubtitle =>
      'Refleja el patrón de la izquierda en la cuadrícula vacía de la derecha.';

  @override
  String get semanticLinkTitle => 'Enlace semántico';

  @override
  String get semanticLinkSubtitle =>
      'Encuentra la palabra que conecta las tres';

  @override
  String get reflexTapTitle => 'Toque de reflejos';

  @override
  String get visualStatisticalLearningTitle => 'Aprendizaje visual';

  @override
  String get orbitTapTitle => 'Toque en órbita';

  @override
  String get orbitTapSubtitle =>
      'Toca cuando las bolas se alineen con la puerta';

  @override
  String get orbitTapTapToHit => 'Toca cuando una bola entre en la puerta';

  @override
  String get schulteTableTitle => 'Tabla de Schulte';

  @override
  String get multipleObjectTrackingTitle => 'Rastreador de objetos';

  @override
  String get multipleObjectTrackingSubtitle =>
      'Observa los objetos resaltados. Síguelos mientras se mueven y luego selecciónalos.';

  @override
  String get sdmtTitle => 'Test SDMT';

  @override
  String get sdmtSubtitle =>
      'Usa la clave de arriba para encontrar el dígito del símbolo mostrado.';

  @override
  String get memoryMatrixTitle => 'Matriz de memoria';

  @override
  String get memoryMatrixSubtitle => 'Memoriza el patrón y toca las fichas.';

  @override
  String get mentalAbacusTitle => 'Ábaco mental';

  @override
  String get mentalAbacusSubtitle => 'Resuelve usando el Soroban';

  @override
  String get spellingSprintTitle => 'Sprint de ortografía';

  @override
  String get spellingSprintSubtitle =>
      'Corre contra el reloj para deletrear tantas palabras como puedas.';

  @override
  String get stopSignalTitle => 'Señal de pare';

  @override
  String get stopSignalSubtitle =>
      'Toca la dirección de la flecha, pero para inmediatamente si la flecha se pone ROJA.';

  @override
  String get staircaseMemoryTitle => 'Memoria en escalera';

  @override
  String get vigilanceTaskTitle => 'Tarea de vigilancia';

  @override
  String get vigilanceTaskSubtitle =>
      'Toca el botón cuando la manecilla se salte una posición';

  @override
  String get logicalSyllogismsTitle => 'Silogismos lógicos';

  @override
  String get logicalSyllogismsSubtitle =>
      '¿Es la conclusión lógicamente válida?';

  @override
  String get mathPathTitle => 'Camino matemático';

  @override
  String get mathPathSubtitle =>
      'Encuentra un camino que sume exactamente la cantidad objetivo.';

  @override
  String get sternbergTaskTitle => 'Tarea de Sternberg';

  @override
  String get sternbergTaskMemorize => 'Memoriza las letras';

  @override
  String get sternbergTaskWasLetterSet => '¿Estaba esta letra en el conjunto?';

  @override
  String sternbergTaskScore(int score) {
    return '¡Has conseguido $score puntos en la Tarea de Sternberg!';
  }

  @override
  String get verbalAnalogiesTitle => 'Analogías verbales';

  @override
  String get verbalAnalogiesSubtitle => 'Completa la relación';

  @override
  String get typingSpeedTitle => 'Velocidad de mecanografía';

  @override
  String get typingSpeedSubtitle =>
      '¡Escribe la frase exactamente como se muestra tan rápido como puedas!';

  @override
  String get wordLadderTitle => 'Escalera de palabras';

  @override
  String get wordLadderSubtitle =>
      'Conecta las palabras cambiando una letra a la vez.';

  @override
  String get tangleFixTitle => 'Desenredar';

  @override
  String get tangleFixSubtitle =>
      'Desenreda las líneas para que ninguna se cruce';

  @override
  String get oddRotationTitle => 'Rotación diferente';

  @override
  String get oddRotationSubtitle =>
      'Una de estas está reflejada. ¿Puedes encontrarla?';

  @override
  String get towerOfLondonTitle => 'Torre de Londres';

  @override
  String get towerOfLondonSubtitle => 'Coincide con la configuración objetivo';

  @override
  String get symbolicFlankerTitle => 'Flanco simbólico';

  @override
  String get symbolicFlankerSubtitle => 'Concéntrate en el símbolo central';

  @override
  String get stroopTestTitle => 'Test de Stroop';

  @override
  String get stroopTestSubtitle =>
      'Identifica el color de la tinta de la palabra mostrada. ¡Ignora lo que dice la palabra!';

  @override
  String get wisconsinCardSortingTitle =>
      'Clasificación de cartas de Wisconsin';

  @override
  String get wisconsinCardSortingSubtitle =>
      'EMPAREJA LA CARTA CON UNA DE LAS CUATRO DE ARRIBA';

  @override
  String get nBackTitle => 'Test N-Back';

  @override
  String get nBackSubtitle =>
      'Toca COINCIDENCIA si la letra actual coincide con la mostrada hace 2 pasos.';

  @override
  String get rhythmMasterTitle => 'Maestro del ritmo';

  @override
  String get rhythmMasterSubtitle => 'Toca en sincronía con el pulso';

  @override
  String get pixelMimicTitle => 'Mímica de píxeles';

  @override
  String get targetNumberTitle => 'Objetivo 24';

  @override
  String targetNumberSubtitle(int target) {
    return 'Usa los 4 números para llegar a $target';
  }

  @override
  String get mirrorTracingTitle => 'Trazado en espejo';

  @override
  String get mirrorTracingSubtitle =>
      '¡Traza la estrella! Los controles están REFLEJADOS.';

  @override
  String get wordSurgeTitle => 'Oleada de palabras';

  @override
  String get wordSurgeSubtitle => 'Sinónimos y Antónimos';

  @override
  String get perspectiveTakingTitle => 'Toma de perspectiva';

  @override
  String get perspectiveTakingTopDownView => 'VISTA SUPERIOR';

  @override
  String get perspectiveTakingChoosePerspective => 'ELIGE LA PERSPECTIVA';

  @override
  String get perspectiveTakingCongrats =>
      'Tienes una gran agudeza visual para las relaciones espaciales.';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return '¿Qué vista corresponde al $targetDirName?';
  }

  @override
  String get paperFoldingTitle => 'Plegado de papel';

  @override
  String get paperFoldingSubtitle => '¿Cómo se verá al desplegarlo?';

  @override
  String get waterSortTitle => 'Ordenar agua';

  @override
  String get waterSortSubtitle =>
      'Ordena los colores para que cada tubo contenga solo un color.';

  @override
  String get numericalEstimationTitle => 'Estimación numérica';

  @override
  String get numericalEstimationSubtitle =>
      '¡Elige la respuesta más cercana rápido!';

  @override
  String get lockPatternTitle => 'Patrón de bloqueo';

  @override
  String get lockPatternSubtitle =>
      'Encuentra el patrón secreto. Cada intento da pistas sobre la posición y los puntos.';

  @override
  String get primeHunterTitle => 'Cazador de primos';

  @override
  String get primeHunterSubtitle =>
      'Desliza a la IZQUIERDA para PRIMO | Desliza a la DERECHA para COMPUESTO';

  @override
  String get tracePathTitle => 'Trazar camino';

  @override
  String get tracePathSubtitle =>
      'Sigue el camino objetivo lo más fielmente posible';

  @override
  String get ruleSwitcherTitle => 'Cambiador de reglas';

  @override
  String get ruleSwitcherSubtitle => 'Aplica la regla actual';

  @override
  String get choiceReactionTimeTitle => 'Tiempo de reacción de elección';

  @override
  String get pathRecallTitle => 'Recuerdo de camino';

  @override
  String get switchTaskTitle => 'Cambio de tarea';

  @override
  String get switchTaskSubtitle =>
      '¡Presta atención a la regla! Cambiará entre coincidir con la forma y coincidir con el color.';

  @override
  String get mentalRotationTitle => 'Rotación mental';

  @override
  String get mentalRotationSubtitle =>
      '¿Son estas formas iguales, solo que rotadas?';

  @override
  String get missingOperatorTitle => 'Mezcla de operadores';

  @override
  String get missingOperatorSubtitle =>
      'Rellena los espacios para completar la ecuación';

  @override
  String get wordMastermindTitle => 'Palabra Mastermind';

  @override
  String get wordMastermindSubtitle =>
      '¡Descifra el código de 4 letras! Toros (B) son posiciones perfectas, Vacas (C) son posiciones incorrectas.';

  @override
  String get simonSequenceTitle => 'Secuencia de Simon';

  @override
  String get symbolLogicTitle => 'Lógica de símbolos';

  @override
  String get symbolLogicSubtitle =>
      'Resuelve las ecuaciones visuales para encontrar el valor de cada símbolo. ¿Cuál es el resultado de la última ecuación?';

  @override
  String get silhouetteMatchTitle => 'Emparejar silueta';

  @override
  String get silhouetteMatchSubtitle =>
      '¿Qué silueta coincide con este objeto?';

  @override
  String get operationSpanTitle => 'Memoria de operaciones';

  @override
  String get operationSpanMathPhase => '¿Es correcta la ecuación?';

  @override
  String get operationSpanLetterPhase => 'Recuerda la letra';

  @override
  String get operationSpanRecallPhase => 'Recuerda las letras en orden';

  @override
  String get operationSpanRoundComplete => '¡Ronda completada!';

  @override
  String operationSpanScore(int score) {
    return '¡Has conseguido $score puntos en Memoria de operaciones!';
  }

  @override
  String get slidePuzzleTitle => 'Puzzle deslizante';

  @override
  String get slidePuzzleNewGame => 'NUEVO JUEGO';

  @override
  String get slidePuzzleInstructions =>
      'Reorganiza las fichas en orden numérico deslizándolas hacia el espacio vacío.';

  @override
  String get slidePuzzleTileSlider => 'DESLIZADOR DE FICHAS';

  @override
  String get slidePuzzleCongrats =>
      'Has ordenado correctamente todas las fichas.';

  @override
  String get visualSearchTitle => 'Búsqueda visual';

  @override
  String get visualSearchSubtitle =>
      'Encuentra el símbolo único en la cuadrícula';

  @override
  String get trailMakingTitle => 'Trazado de senderos';

  @override
  String get trailMakingSubtitle =>
      'Conecta los números en orden (1 -> 2 -> 3...) tan rápido como puedas.';

  @override
  String get matrixReasoningTitle => 'Razonamiento de matrices';

  @override
  String get matrixReasoningSubtitle =>
      'Completa el patrón en la cuadrícula de 3x3';

  @override
  String get tentsAndTreesTitle => 'Tiendas y Árboles';

  @override
  String get tentsAndTreesSubtitle =>
      'Coloca tiendas junto a los árboles. Los números indican cuántas tiendas hay en cada fila/columna. Las tiendas no pueden tocarse entre sí.';

  @override
  String get quickMathTitle => 'Matemáticas rápidas';

  @override
  String get magicSquaresTitle => 'Cuadro mágico';

  @override
  String magicSquaresSubtitle(int targetSum) {
    return 'Cada fila, columna y diagonal debe sumar $targetSum';
  }

  @override
  String get objectShuffleTitle => 'Barajado de objetos';

  @override
  String get pipesTitle => 'Tuberías';

  @override
  String get pipesSubtitle =>
      'Conecta los puntos del mismo color con tuberías.';

  @override
  String get oddOneOutTitle => 'El intruso';

  @override
  String get oddOneOutSubtitle => 'Encuentra la ficha con un color diferente.';

  @override
  String get einsteinRiddleTitle => 'ACERTIJO DE EINSTEIN';

  @override
  String get einsteinRiddleSubtitle =>
      'Usa las pistas para deducir los atributos de cada casa.';

  @override
  String get einsteinRiddleHowToPlay =>
      'Cada casa tiene atributos únicos (color, nacionalidad, mascota, etc.). Usa las pistas proporcionadas para rellenar la cuadrícula y encontrar la solución completa.';

  @override
  String get einsteinRiddleColor => 'Color';

  @override
  String get einsteinRiddleNationality => 'Nacionalidad';

  @override
  String get einsteinRiddleDrink => 'Bebida';

  @override
  String get einsteinRiddlePet => 'Mascota';

  @override
  String get einsteinRiddleSmoke => 'Tabaco';

  @override
  String get einsteinRiddleHouse => 'Casa';

  @override
  String get mirrorImageTitle => 'Imagen en espejo';

  @override
  String get mirrorImageSubtitle =>
      'Identifica el reflejo correcto en el espejo.';

  @override
  String get mirrorImageHowToPlay =>
      'Mira la forma y elige su reflejo correcto en el espejo de entre las opciones proporcionadas.';

  @override
  String get mentalMappingTitle => 'Mapeo mental';

  @override
  String get mentalMappingSubtitle =>
      'Sigue las direcciones y encuentra el destino.';

  @override
  String get mentalMappingHowToPlay =>
      'Se te mostrará una secuencia de direcciones (Norte, Sur, Este, Oeste). Sigue mentalmente estos pasos empezando desde el centro de la cuadrícula y selecciona el destino final.';

  @override
  String get memoryPalaceTitle => 'Palacio de la memoria';

  @override
  String get memoryPalaceSubtitle =>
      'Recuerda qué palabra estaba en cada lugar.';

  @override
  String get memoryPalaceHowToPlay =>
      'Un conjunto de palabras aparecerá en diferentes lugares de una cuadrícula. Memoriza sus posiciones. Luego, se te pedirá que vuelvas a colocar las palabras en sus posiciones originales.';

  @override
  String get countingSheepTitle => 'Contando ovejas';

  @override
  String get countingSheepSubtitle => '¿Cuántas ovejas viste?';

  @override
  String get countingSheepHowToPlay =>
      'Las ovejas correrán por la pantalla rápidamente. Cuéntalas al pasar e introduce el número total al final.';

  @override
  String get faceTraitAssociationTitle => 'Cara-Rasgo';

  @override
  String get faceTraitAssociationSubtitle => 'Memoriza los rasgos de cada cara';

  @override
  String get faceTraitAssociationHowToPlay =>
      'Se te mostrarán varias caras, cada una con un nombre, ocupación y afición. Memoriza estas asociaciones. Más tarde, se te pedirá que recuerdes los rasgos específicos de cada cara.';

  @override
  String get mentalCalendarTitle => 'Calendario mental';

  @override
  String get mentalCalendarSubtitle => 'Calcula el día de la semana';

  @override
  String get mentalCalendarHowToPlay =>
      'Se mostrará una fecha al azar. Usa el cálculo mental (o el algoritmo del Juicio Final) para determinar en qué día de la semana cae.';

  @override
  String get vocabularyBuilderTitle => 'Constructor de vocabulario';

  @override
  String get vocabularyBuilderSubtitle =>
      'Empareja sinónimos y antónimos bajo presión de tiempo.';

  @override
  String get vocabularyBuilderHowToPlay =>
      'Se te mostrará una palabra objetivo y una relación (Sinónimo o Antónimo). Elige la palabra correcta de las opciones que coincida con la relación. ¡Rápido, el tiempo vuela!';

  @override
  String get correct => 'CORRECTO';

  @override
  String get incorrect => 'INCORRECTO';

  @override
  String get grammarPoliceTitle => 'Policía gramatical';

  @override
  String get grammarPoliceSubtitle =>
      'Identifica si la oración es gramaticalmente correcta o contiene errores.';

  @override
  String get grammarPoliceHowToPlay =>
      'Aparecerá una oración en el centro de la pantalla. Decide si es gramaticalmente correcta o si contiene un error. Pulsa \"CORRECTO\" si está bien, o \"INCORRECTO\" si detectas un error. ¡No pierdas todas tus vidas!';

  @override
  String get reverseStroopTitle => 'Stroop inverso';

  @override
  String get reverseStroopSubtitle =>
      'Una variación del test de Stroop donde el enfoque cambia.';

  @override
  String get reverseStroopHowToPlay =>
      '¡Presta atención a las instrucciones! Si dice \"TEXTO\", coincide con el significado de la palabra. Si dice \"COLOR\", coincide con el color de la tinta. Las reglas cambiarán frecuentemente para poner a prueba tu concentración.';

  @override
  String get game2048Instruction =>
      'DESLIZA EN CUALQUIER DIRECCIÓN PARA COMBINAR';

  @override
  String get fibonacciMergeTitle => 'Fusión de Fibonacci';

  @override
  String get fibonacciMergeSubtitle =>
      'Combina números de Fibonacci consecutivos (1, 1, 2, 3, 5, 8, 13...).';

  @override
  String get sequenceSleuthTitle => 'Detective de secuencias';

  @override
  String get sequenceSleuthSubtitle =>
      'Encuentra el número que falta en la secuencia matemática.';

  @override
  String get divisibilityDashTitle => 'Carrera de divisibilidad';

  @override
  String get divisibilityDashSubtitle =>
      'Toca todos los divisores de un solo dígito (2-9) para el número dado.';

  @override
  String get percentagePeakTitle => 'Cima del porcentaje';

  @override
  String get percentagePeakSubtitle =>
      'Resuelve cálculos mentales de porcentajes rápidamente.';

  @override
  String get vennNumbersTitle => 'Números de Venn';

  @override
  String get vennNumbersSubtitle =>
      'Categoriza los números en las regiones correctas del diagrama de Venn.';

  @override
  String get commonDenominatorTitle => 'Denominador común';

  @override
  String get commonDenominatorSubtitle =>
      'Encuentra el Máximo Común Divisor o el Mínimo Común Múltiplo.';

  @override
  String get angleFinderTitle => 'Buscador de ángulos';

  @override
  String get angleFinderSubtitle =>
      'Calcula el ángulo faltante en el problema geométrico.';

  @override
  String get sumSnakeTitle => 'Serpiente de sumas';

  @override
  String get sumSnakeSubtitle =>
      'Conecta números adyacentes para alcanzar la suma objetivo.';

  @override
  String get baseShiftTitle => 'CAMBIO DE BASE';

  @override
  String get baseShiftSubtitle => 'Resolver en decimal';

  @override
  String get baseShiftDescription =>
      'Resuelve la ecuación y escribe la respuesta en decimal (Base 10).';

  @override
  String get baseShiftEquation => 'ECUACIÓN';

  @override
  String get baseShiftHint => 'Introduce resultado decimal...';

  @override
  String get baseShiftCorrect => '¡Correcto!';

  @override
  String get baseShiftIncorrect => '¡Incorrecto!';

  @override
  String get baseShiftSubmit => 'ENVIAR';

  @override
  String get baseShiftQuickGuide => 'Guía rápida:';

  @override
  String get baseShiftBinary => 'Binario (bin): Base 2 (0, 1)';

  @override
  String get baseShiftHex => 'Hexadecimal (0x): Base 16 (0-9, A-F)';

  @override
  String get baseShiftDecimal => 'Decimal (dec): Base 10 (0-9)';

  @override
  String get baseShiftWinTitle => '¡MAGO DE LAS MATEMÁTICAS!';

  @override
  String get baseShiftWinMessage =>
      '¡Has resuelto correctamente 5 ecuaciones de cambio de base!';

  @override
  String get blockCount3DTitle => 'Recuento de bloques 3D';

  @override
  String get blockCount3DSubtitle =>
      'ARRASTRA PARA ROTAR • CUENTA LOS BLOQUES OCULTOS';

  @override
  String get blockCount3DHowMany => '¿CUÁNTOS BLOQUES?';

  @override
  String get blockCount3DSubmitGuess => 'ENVIAR RESPUESTA';

  @override
  String get blockCount3DNotQuite =>
      '¡Casi! Intenta rotar para contar de nuevo.';

  @override
  String get blockCount3DExcellent => 'EXCELENTE';

  @override
  String blockCount3DWinMessage(int count) {
    return '¡Has identificado correctamente todos los $count bloques!';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '1. Arrastra el dedo por la vista 3D para rotar la pila de bloques.\n\n2. Cuenta todos los bloques de la pila.\n\n3. Recuerda: un bloque en el aire debe tener bloques de soporte estructural debajo (¡bloques ocultos!).\n\n4. Escribe tu respuesta y toca \"ENVIAR RESPUESTA\" para comprobarlo.';

  @override
  String get alphabetSudokuTitle => 'SUDOKU ALFABÉTICO';

  @override
  String get alphabetSudokuSubtitle =>
      'Rellena la cuadrícula para que cada fila, columna y cuadro contenga las letras A-I.';

  @override
  String get alphabetSudokuWinTitle => '¡SUDOKU RESUELTO!';

  @override
  String get alphabetSudokuWinMessage => '¡Brillante! Has dominado las letras.';

  @override
  String get classicMazeTitle => 'Laberinto clásico';

  @override
  String get classicMazeSubtitle =>
      'EXPLORA Y RESUELVE • UN LABERINTO NUEVO CADA VEZ';

  @override
  String get classicMazeWinTitle => 'LABERINTO COMPLETADO';

  @override
  String classicMazeWinMessage(int count) {
    return '¡Navegación increíble! Has resuelto el laberinto en $count movimientos.';
  }

  @override
  String get classicMazeMoves => 'MOVIMIENTOS: ';

  @override
  String get classicMazeHowToPlayDescription =>
      '1. Guía la canica amarilla brillante (jugador) hasta el portal verde (salida) en la parte inferior derecha.\n\n2. Desliza en cualquier lugar del laberinto, usa las flechas del teclado o los botones de dirección para moverte.\n\n3. El rastro morado muestra el camino explorado. ¡Vuelve sobre tus pasos para borrarlo dinámicamente!\n\n4. Cambia la dificultad para desafiarte con laberintos más grandes.';

  @override
  String get conjunctionSearchTitle => 'Búsqueda de conjunciones';

  @override
  String get conjunctionSearchSubtitle =>
      'Enfoque atencional y conjunción de características';

  @override
  String get conjunctionSearchWinTitle => 'VICTORIA';

  @override
  String get conjunctionSearchWinMessage =>
      '¡Has encontrado todos los objetivos con un enfoque atencional perfecto!';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      'Se mostrará una combinación específica de forma y color en las instrucciones. Encuéntrala y tócala en la cuadrícula lo más rápido posible. Las formas distractoras comparten color o forma, ¡así que mira de cerca!';

  @override
  String get conjunctionSearchRound => 'RONDA: ';

  @override
  String get conjunctionSearchScore => 'PUNTUACIÓN: ';

  @override
  String get conjunctionSearchFind => 'BUSCA: ';

  @override
  String get shapeCircle => 'CÍRCULO';

  @override
  String get shapeSquare => 'CUADRADO';

  @override
  String get shapeTriangle => 'TRIÁNGULO';

  @override
  String get shapeStar => 'ESTRELLA';

  @override
  String get shapeRectangle => 'RECTÁNGULO';

  @override
  String get shapeEllipse => 'ELIPSE';

  @override
  String get shapeTrapezoid => 'TRAPECIO';

  @override
  String get colorRedLabel => 'ROJO';

  @override
  String get colorBlueLabel => 'AZUL';

  @override
  String get colorGreenLabel => 'VERDE';

  @override
  String get colorAmberLabel => 'ÁMBAR';

  @override
  String get cubeNetFoldTitle => 'Plegado de cubos';

  @override
  String get cubeNetFoldSubtitle =>
      'SELECCIONA LA OPCIÓN DE CUBO 3D QUE COINCIDA';

  @override
  String get cubeNetFoldWinTitle => 'CORRECTO';

  @override
  String get cubeNetFoldWinMessage =>
      '¡Tienes una lógica de plegado espacial 3D perfecta!';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '1. Mira la red 2D desplegada en la parte superior.\n\n2. Pliega mentalmente la red para formar un cubo 3D.\n\n3. Elige la opción que represente una perspectiva 3D válida de ese cubo plegado.\n\n4. Cuidado: las caras opuestas en la red no pueden ser adyacentes en 3D, y el orden de las caras adyacentes debe coincidir.';

  @override
  String get cubeNetFoldUnfoldedNet => 'RED 2D DESPLEGADA';

  @override
  String get cubeNetFoldWhichMatches => '¿QUÉ CUBO COINCIDE?';

  @override
  String get cubeNetFoldIncorrect =>
      '¡Lógica de plegado incorrecta! Toca Reiniciar o cambia tu elección.';

  @override
  String get cubeNetFoldSubmitChoice => 'ENVIAR ELECCIÓN';

  @override
  String get cubeNetFoldFailed => 'FALLÓ (TOCA REINICIAR)';

  @override
  String get faceTraitAssociationMemorize => 'MEMORIZA A LAS 4 PERSONAS';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return 'PERSONA $current DE $total';
  }

  @override
  String get faceTraitAssociationWhatOccupation => '¿CUÁL ES SU PROFESIÓN?';

  @override
  String get faceTraitAssociationWhatHobby => '¿CUÁL ES SU AFICIÓN?';

  @override
  String get faceTraitAssociationWinTitle => '¡MAESTRO DE LA MEMORIA!';

  @override
  String get faceTraitAssociationLoseTitle => 'FIN DEL JUEGO';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return 'Acertaste $correct de $total.';
  }

  @override
  String get topologyTitle => 'TOPOLOGÍA';

  @override
  String get topologySubtitle =>
      '¿Son estas formas topológicamente equivalentes? (¿Se puede deformar una en la otra sin cortar ni pegar?)';

  @override
  String get topologyWinTitle => '¡GENIO DE LA GEOMETRÍA!';

  @override
  String get topologyWinMessage =>
      '¡Has identificado correctamente 10 pares topológicos!';

  @override
  String get topologyScore => 'PUNTUACIÓN: ';

  @override
  String get semanticDistanceTitle => 'Distancia semántica';

  @override
  String get semanticDistanceSubtitle =>
      'Mide la distancia conceptual entre palabras';

  @override
  String get oxymoronHuntTitle => 'Caza de oxímoron';

  @override
  String get oxymoronHuntSubtitle =>
      'Empareja palabras contradictorias en la cuadrícula';

  @override
  String get portmanteauSplitTitle => 'División de acrónimos';

  @override
  String get portmanteauSplitSubtitle =>
      'Identifica las palabras origen de un acrónimo';

  @override
  String get chainReactionTitle => 'Reacción en cadena';

  @override
  String get chainReactionSubtitle =>
      'Conecta palabras usando letras superpuestas';

  @override
  String get rhymeMasterTitle => 'Maestro de las rimas';

  @override
  String get rhymeMasterSubtitle =>
      'Identifica palabras que riman con el objetivo';

  @override
  String get definitionDashTitle => 'Carrera de definiciones';

  @override
  String get definitionDashSubtitle =>
      'Empareja la palabra correcta con su definición';

  @override
  String get syllableStackTitle => 'Pila de sílabas';

  @override
  String get syllableStackSubtitle =>
      'Apila sílabas para formar palabras completas';

  @override
  String get sentenceUnscrambleTitle => 'Descifrar frases';

  @override
  String get sentenceUnscrambleSubtitle =>
      'Reordena las palabras para formar una frase válida';

  @override
  String get grammarSortTitle => 'Clasificación gramatical';

  @override
  String get grammarSortSubtitle =>
      'Clasifica las palabras por su categoría gramatical';

  @override
  String get vowelReconstructTitle => 'Reconstrucción de vocales';

  @override
  String get vowelReconstructSubtitle =>
      'Rellena las vocales que faltan en la frase';

  @override
  String get consonantReconstructTitle => 'Reconstrucción de consonantes';

  @override
  String get consonantReconstructSubtitle =>
      'Rellena las consonantes que faltan en la frase';

  @override
  String get homophoneHuntTitle => 'Caza de homófonos';

  @override
  String get silentLetterSearchTitle => 'Búsqueda de letras mudas';

  @override
  String get silentLetterSearchSubtitle =>
      'Identifica las letras mudas en las palabras dadas';

  @override
  String get palindromeBuilderTitle => 'Constructor de palíndromos';

  @override
  String get palindromeBuilderSubtitle =>
      'Crea un palíndromo añadiendo las mínimas letras posibles';

  @override
  String get phoneticGuessTitle => 'Adivinanza fonética';

  @override
  String get phoneticGuessSubtitle =>
      'Identifica la palabra a partir de su escritura fonética';

  @override
  String get spoonerismSolverTitle => 'Solucionador de retruécanos';

  @override
  String get spoonerismSolverSubtitle =>
      'Identifica el retruécano correcto para la frase';

  @override
  String get etymonOddballTitle => 'Intruso etimológico';

  @override
  String get etymonOddballSubtitle =>
      'Encuentra la palabra que no comparte la misma raíz';

  @override
  String get etymologyOriginTitle => 'Origen etimológico';

  @override
  String get etymologyOriginSubtitle =>
      'Adivina el idioma de origen del préstamo';

  @override
  String get affixFactoryTitle => 'Fábrica de afijos';

  @override
  String get affixFactorySubtitle =>
      'Crea palabras válidas usando prefijos y sufijos';

  @override
  String get cognateCatchTitle => 'Captura de cognados';

  @override
  String get cognateCatchSubtitle =>
      'Distingue entre cognados verdaderos y falsos amigos';

  @override
  String get compoundConnectTitle => 'Conexión compuesta';

  @override
  String get compoundConnectSubtitle =>
      'Combina dos palabras para formar una palabra compuesta';

  @override
  String get pangramSprintTitle => 'Sprint de pangramas';

  @override
  String get pangramSprintSubtitle =>
      'Construye una frase usando todas las letras del abecedario';

  @override
  String get anagramDefinitionTitle => 'Definición de anagrama';

  @override
  String get anagramDefinitionSubtitle =>
      'Resuelve el anagrama basado en su definición';

  @override
  String get letterBridgeTitle => 'Puente de letras';

  @override
  String get letterBridgeSubtitle =>
      'Encuentra la letra que falta que une dos palabras';

  @override
  String get letterFrequencyScanTitle => 'Escaneo de frecuencia de letras';

  @override
  String get letterFrequencyScanSubtitle =>
      'Cuenta cuántas veces aparece una letra en el texto';

  @override
  String get oneLetterShiftTitle => 'Cambio de una letra';

  @override
  String get oneLetterShiftSubtitle =>
      'Transforma una palabra en otra con el cambio de una letra';

  @override
  String vocabularyBuilderMessage(String arg0) {
    return '¡Buen trabajo! Tu vocabulario es impresionante. Puntuación: $arg0';
  }

  @override
  String get symmetryMessage =>
      'Has reflejado el patrón perfectamente con precisión quirúrgica.';

  @override
  String get temporalOrderMessage =>
      '¡Increíble! Tu memoria de secuencia temporal es de alta fidelidad.';

  @override
  String get temporalOrderMessage1 =>
      'Memoria de secuencia incorrecta. ¡La práctica hace al maestro!';

  @override
  String get wordSearchMessage =>
      'Todas las palabras encontradas con éxito con una observación aguda.';

  @override
  String colorMatchMessage(String arg0) {
    return 'Tu precisión: $arg0%';
  }

  @override
  String semanticLinkMessage(String arg0) {
    return '¡Has conseguido $arg0 puntos!';
  }

  @override
  String reflexTapMessage(String arg0) {
    return '¡Has tocado $arg0 objetivos!';
  }

  @override
  String get angleFinderMessage => '¡Tu intuición geométrica es perfecta!';

  @override
  String angleFinderMessage1(String arg0) {
    return 'La respuesta correcta era $arg0°';
  }

  @override
  String angleFinderText(String arg0) {
    return '$arg0°';
  }

  @override
  String visualStatisticalLearningMessage(String arg0) {
    return '¡Has logrado $arg0 patrones correctos!';
  }

  @override
  String nonogramText(String arg0) {
    return 'Error: $arg0';
  }

  @override
  String mentalCalendarMessage(String arg0) {
    return '¡Acertaste $arg0 de 10!';
  }

  @override
  String orbitTapMessage(String arg0) {
    return '¡Has tocado con éxito $arg0 veces!';
  }

  @override
  String schulteTableMessage(String arg0) {
    return '¡Completaste la tabla en $arg0!\n¡Sigue practicando para ampliar tu visión periférica!';
  }

  @override
  String get schulteTableText => 'EMPEZAR TEST';

  @override
  String get relationalMemoryMessage =>
      '¡Fabulosa precisión de memoria relacional espacial!';

  @override
  String sudokuText(String arg0) {
    return 'Error: $arg0';
  }

  @override
  String sdmtMessage(String arg0) {
    return '¡Has emparejado $arg0 símbolos! Este test mide tu velocidad de escaneo y atención visual.';
  }

  @override
  String get futoshikiMessage =>
      '¡Increíble! Has resuelto el cuadrado latino Futoshiki.';

  @override
  String letterFrequencyScanMessage(String arg0, String arg1) {
    return 'Has contado correctamente $arg0 apariciones de \"$arg1\".';
  }

  @override
  String letterFrequencyScanText(String arg0) {
    return 'Incorrecto. El recuento fue $arg0.';
  }

  @override
  String get memoryMatrixMessage =>
      '¡Impresionante! Tu memoria de trabajo es aguda. ¡Objetivo diario completado!';

  @override
  String get memoryMatrixMessage1 =>
      'Concéntrate e inténtalo de nuevo para mejorar tu puntuación de memoria.';

  @override
  String get contextCluesMessage =>
      '¡Excepcional! Tu vocabulario y análisis contextual son de primer nivel.';

  @override
  String get contextCluesMessage1 =>
      '¡Palabra incorrecta seleccionada! Entrena tu razonamiento de contexto verbal e inténtalo de nuevo.';

  @override
  String oneLetterShiftMessage(String arg0, String arg1) {
    return 'Has cambiado correctamente $arg0 a $arg1.';
  }

  @override
  String get mentalAbacusMessage => 'Tu aritmética mental es de primer nivel.';

  @override
  String fractionMatcherMessage(String arg0) {
    return '¡Has conseguido $arg0 puntos emparejando representaciones!';
  }

  @override
  String get spellingSprintMessage =>
      '¡Has escrito correctamente las 10 palabras!';

  @override
  String spellingSprintMessage1(String arg0) {
    return 'Has escrito $arg0 palabras.';
  }

  @override
  String stopSignalMessage(String arg0) {
    return '¡Has logrado $arg0 respuestas correctas! Este test mide tu capacidad para inhibir una acción planeada.';
  }

  @override
  String grammarPoliceMessage(String arg0) {
    return '¡Fin del juego! Mantuviste el orden en el mundo de la gramática. Puntuación: $arg0';
  }

  @override
  String consonantReconstructMessage(String arg0) {
    return '¡Has reconstruido una puntuación de $arg0!';
  }

  @override
  String rhymeMasterMessage(String arg0, String arg1) {
    return '¡Has encontrado $arg0 de $arg1 rimas!';
  }

  @override
  String vigilanceTaskMessage(String arg0, String arg1, String arg2) {
    return 'Aciertos: $arg0, Fallos: $arg1\nFalsas alarmas: $arg2';
  }

  @override
  String get silhouetteMatchOrthoMessage =>
      '¡Tienes unas habilidades de alineación ortográfica impecables!';

  @override
  String get silhouetteMatchOrthoText => 'ENTENDIDO';

  @override
  String get silhouetteMatchOrthoText1 =>
      '¡Proyección de perspectiva incorrecta! Toca Reiniciar para volver a intentarlo.';

  @override
  String fibonacciMergeMessage(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String factorFinderMessage(String arg0) {
    return '¡Has conseguido $arg0 puntos encontrando todos los factores!';
  }

  @override
  String logicalSyllogismsMessage(String arg0) {
    return '¡Has resuelto $arg0 silogismos correctamente!';
  }

  @override
  String get rotatingMazeMessage =>
      '¡Has navegado con éxito por el laberinto rotativo cinético!';

  @override
  String get rotatingMazeText => 'ENTENDIDO';

  @override
  String get rotatingMazeText1 =>
      '🌀 ¡Laberinto rotado 90°! ¡Cuadrícula desplazada!';

  @override
  String get mathPathMessage =>
      '¡Has encontrado el camino que suma el objetivo!';

  @override
  String get bridgesMessage => '¡Has conectado correctamente todas las islas!';

  @override
  String compoundConnectMessage(String arg0, String arg1) {
    return 'La palabra compuesta es $arg0$arg1.';
  }

  @override
  String get pangramSprintMessage =>
      'Has construido una frase usando las 26 letras.';

  @override
  String get mirrorImageMessage => 'Has identificado perfectamente el reflejo.';

  @override
  String get mirrorImageText => 'IMAGEN EN ESPEJO';

  @override
  String reverseStroopMessage(String arg0) {
    return '¡Has conseguido $arg0 puntos! No pierdas de vista las instrucciones.';
  }

  @override
  String get verbalAnalogiesMessage =>
      'Tienes una mente aguda para las relaciones.';

  @override
  String corsiBlocksMessage1(String arg0, String arg1) {
    return '¡Recordaste $arg1 secuencias! Tu capacidad de memoria espacial alcanzó $arg0.';
  }

  @override
  String wordLadderMessage(String arg0, String arg1, String arg2) {
    return 'Has conectado con éxito $arg0 con $arg1 en $arg2 pasos.';
  }

  @override
  String d2AttentionMessage(String arg0) {
    return '¡Increíble escaneo selectivo! Puntuación final: $arg0.';
  }

  @override
  String get d2AttentionText => 'CÓMO JUGAR';

  @override
  String get d2AttentionText1 => 'ENTENDIDO';

  @override
  String get tangleFixMessage => 'Todas las líneas están despejadas y suaves.';

  @override
  String get distractorMatrixMessage =>
      '¡Increíble! ¡Recordaste patrones a pesar de los distractores matemáticos cognitivos!';

  @override
  String get distractorMatrixMessage1 =>
      '¡Los distractores te atraparon! Vuelve a entrenar tu memoria de trabajo.';

  @override
  String sentenceUnscrambleMessage(String arg0) {
    return '¡Has descifrado una puntuación de $arg0!';
  }

  @override
  String get kakuroMessage =>
      '¡Increíble! Has emparejado todos los segmentos de suma perfectamente.';

  @override
  String symbolicFlankerMessage(String arg0, String arg1) {
    return '¡Acertaste $arg0 de $arg1!';
  }

  @override
  String stroopTestMessage(String arg0) {
    return '¡Has acertado $arg0 correctamente! Concéntrate en el color de la tinta, no en la palabra.';
  }

  @override
  String wisconsinCardSortingMessage(String arg0) {
    return '¡Has clasificado correctamente $arg0 cartas!';
  }

  @override
  String nBackMessage(String arg0) {
    return '¡Lograste $arg0 coincidencias de 2-back! Tu memoria de trabajo es vital para la multitarea.';
  }

  @override
  String rhythmMasterMessage(String arg0, String arg1) {
    return '¡Has conseguido $arg0 golpes perfectos y $arg1 puntos!';
  }

  @override
  String groceryListMessage(String arg0, Object score) {
    return '¡Has conseguido $arg0 puntos en Lista de la compra!';
  }

  @override
  String get groceryListText => 'ESTOY';

  @override
  String get mirrorTracingMessage =>
      'Tu cerebro ha reconfigurado con éxito su coordinación.';

  @override
  String moduloClockMessage(String arg0) {
    return '¡Excelente coordinación matemática mental modular! Puntuación: $arg0';
  }

  @override
  String moduloClockMessage1(String arg0, String arg1, String arg2) {
    return 'Lograste $arg0 de $arg1 soluciones de reloj modular. Puntuación: $arg2';
  }

  @override
  String get crownMessage =>
      'Todas las coronas colocadas con éxito con lógica perfecta.';

  @override
  String dualCodingMessage(String arg0) {
    return '¡Fantástico rendimiento en doble tarea! Tu puntuación de memoria de trabajo: $arg0';
  }

  @override
  String inequalityDashMessage(String arg0) {
    return '¡Has conseguido $arg0 puntos emparejando desigualdades!';
  }

  @override
  String sourceMonitoringMessage(String arg0, String arg1) {
    return '¡Acertaste $arg0 de $arg1!';
  }

  @override
  String get sourceMonitoringText => 'EMPEZAR RECUERDO';

  @override
  String get memoryPalaceText => 'PALABRAS DISPONIBLES';

  @override
  String target10Message(String arg0) {
    return '¡Has conseguido $arg0 puntos emparejando números que suman 10!';
  }

  @override
  String get paperFoldingMessage => 'Puedes ver los patrones en tu mente.';

  @override
  String topologyText(String arg0, String arg1) {
    return '$arg0$arg1 / 10';
  }

  @override
  String get waterSortMessage =>
      '¡Has ordenado todos los colores perfectamente!';

  @override
  String anagramDefinitionMessage(String arg0) {
    return 'La palabra era, de hecho, \"$arg0\".';
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
    return 'Has hecho $arg0 estimaciones correctas.';
  }

  @override
  String grammarSortMessage(String arg0) {
    return '¡Has clasificado $arg0 palabras correctamente!';
  }

  @override
  String vowelReconstructMessage(String arg0) {
    return '¡Has reconstruido una puntuación de $arg0!';
  }

  @override
  String spatialConflictMessage(String arg0, String arg1) {
    return '¡Has logrado una puntuación de $arg0 con $arg1 errores!';
  }

  @override
  String get spatialConflictText => 'CÓMO JUGAR';

  @override
  String get spatialConflictText1 => 'ENTENDIDO';

  @override
  String tracePathMessage(String arg0) {
    return '¡Tu precisión fue del $arg0%!';
  }

  @override
  String ruleSwitcherMessage(String arg0, String arg1) {
    return '¡Acertaste $arg0 de $arg1!';
  }

  @override
  String collatzMessage(String arg0, String arg1) {
    return 'Te tomó $arg0 pasos. El mínimo posible era $arg1.';
  }

  @override
  String get collatzText => '/ 2';

  @override
  String get collatzText1 => '+ 1';

  @override
  String get collatzText2 => '3n + 1';

  @override
  String divisibilityDashMessage(String arg0) {
    return '¡Has resuelto $arg0 números!';
  }

  @override
  String switchTaskMessage(String arg0) {
    return '¡Has acertado $arg0 correctamente! El cambio rápido es clave para la flexibilidad mental.';
  }

  @override
  String sequenceSleuthMessage(String arg0) {
    return '¡Has resuelto $arg0 secuencias!';
  }

  @override
  String changeBlindnessMessage(String arg0) {
    return '¡Has encontrado $arg0 cambios!';
  }

  @override
  String mentalRotationMessage(String arg0) {
    return '¡Has rotado $arg0 formas correctamente!';
  }

  @override
  String wordMastermindMessage(String arg0) {
    return '¡Dominaste el código!\nLa palabra era: $arg0';
  }

  @override
  String wordMastermindMessage1(String arg0) {
    return 'La palabra oculta era: $arg0';
  }

  @override
  String wordMastermindText(String arg0) {
    return '$arg0';
  }

  @override
  String get simonSequenceMessage => '¡Has memorizado las 10 fichas!';

  @override
  String get simonSequenceMessage1 =>
      'Inténtalo de nuevo para dominar la secuencia.';

  @override
  String oxymoronHuntMessage(String arg0) {
    return '¡Has encontrado $arg0 oxímoron!';
  }

  @override
  String spotlightTrackMessage(String arg0) {
    return '¡Seguimiento espacial increíble! Has conseguido $arg0 puntos.';
  }

  @override
  String get spotlightTrackText => 'CÓMO JUGAR';

  @override
  String get spotlightTrackText1 => 'ENTENDIDO';

  @override
  String get spotlightTrackText2 => 'EMPEZAR RONDA';

  @override
  String vennNumbersMessage(String arg0) {
    return '¡Has clasificado $arg0 números!';
  }

  @override
  String get vennNumbersText => 'NINGUNO';

  @override
  String get vennNumbersText1 => 'AMBOS';

  @override
  String get silhouetteMatchMessage =>
      'Tu cerebro es excelente en la traducción de 3D a 2D.';

  @override
  String sumSnakeMessage(String arg0) {
    return '¡Objetivo $arg0 alcanzado con una precisión perfecta!';
  }

  @override
  String get sumSnakeText => 'BORRAR CAMINO';

  @override
  String percentagePeakMessage(String arg0) {
    return '¡Has resuelto $arg0 problemas de porcentajes!';
  }

  @override
  String trailMakingMessage(String arg0) {
    return '¡Has completado $arg0 senderos! Este test mide tu velocidad de búsqueda visual y flexibilidad mental.';
  }

  @override
  String matrixReasoningMessage(String arg0) {
    return '¡Has completado $arg0 matrices correctamente!';
  }

  @override
  String get tentsAndTreesMessage =>
      'Has colocado correctamente todas las tiendas.';

  @override
  String klotskiMessage(String arg0) {
    return '¡Deslizamiento sensacional! Has liberado el bloque Héroe en $arg0 movimientos.';
  }

  @override
  String sumPyramidMessage(String arg0) {
    return '¡Has resuelto $arg0 pirámides de suma con éxito!';
  }

  @override
  String simonCommandMessage(String arg0) {
    return '¡Excelente respuesta selectiva y concentración! Puntuación total: $arg0';
  }

  @override
  String simonCommandMessage1(String arg0, String arg1) {
    return 'Has conseguido $arg0 pero no llegaste a $arg1 coincidencias a tiempo.';
  }

  @override
  String syllableStackMessage(String arg0) {
    return '¡Has acumulado una puntuación de $arg0!';
  }

  @override
  String get slitherlinkMessage =>
      '¡Impresionante! Has completado con éxito el puzzle de bucles.';

  @override
  String quickMathMessage(String arg0) {
    return '¡Has resuelto $arg0 problemas!';
  }

  @override
  String commonDenominatorMessage(String arg0) {
    return '¡Has resuelto $arg0 problemas de MCD/MCM!';
  }

  @override
  String chainReactionMessage(String arg0, String arg1) {
    return 'Tu puntuación final es $arg0. Has construido una cadena de $arg1 palabras.';
  }

  @override
  String chainReactionText(String arg0) {
    return '$arg0';
  }

  @override
  String get associativePairsMessage =>
      '¡Brillante! Has asociado los rasgos visuales sin fallos.';

  @override
  String get associativePairsMessage1 =>
      '¡Asociación incorrecta! Agudiza tu memoria de enlaces e inténtalo de nuevo.';

  @override
  String portmanteauSplitMessage(String arg0) {
    return '¡Has dividido $arg0 acrónimos!';
  }

  @override
  String get magicSquaresText => 'LIMPIAR';

  @override
  String alphabetSudokuText(String arg0) {
    return 'Error: $arg0';
  }

  @override
  String get pipesMessage =>
      'Has conectado todas las tuberías y llenado la cuadrícula.';

  @override
  String get dualMirrorMessage =>
      '¡Has navegado ambos iconos hacia sus objetivos!';

  @override
  String binaryCodeMessage(String arg0) {
    return '¡Sensacional traducción decimal rápida! Puntuación final: $arg0';
  }

  @override
  String binaryCodeMessage1(String arg0, String arg1) {
    return 'Has convertido correctamente $arg0 números binarios. Puntuación: $arg1';
  }

  @override
  String oddOneOutMessage(String arg0) {
    return '¡Has encontrado 50 intrusos! Puntuación final: $arg0';
  }

  @override
  String oddOneOutMessage1(String arg0) {
    return 'Tu puntuación: $arg0';
  }

  @override
  String letterBridgeMessage(String arg0) {
    return 'Has encontrado la letra puente: $arg0';
  }

  @override
  String get imReady => 'ESTOY LISTO';

  @override
  String get soptTitle => 'Señalamiento autoordenado';

  @override
  String get soptSubtitle =>
      'Toca una tarjeta diferente cada vez. ¡Las posiciones se barajan!';

  @override
  String get soptWinTitle => '¡Maestro de secuencia!';

  @override
  String soptGameOverMessage(int score) {
    return '¡Obtuviste $score puntos al rastrear exitosamente las cartas barajadas!';
  }

  @override
  String get soptChooseNovel => 'Toca una nueva tarjeta';

  @override
  String get soptGreatJob => '¡Buen trabajo!';

  @override
  String get soptAlreadyTapped => '¡Ya tocado!';

  @override
  String get soptGrid => 'Red';

  @override
  String get contRecogTitle => 'Reconocimiento continuo';

  @override
  String get contRecogSubtitle =>
      '¿Has visto esta tarjeta antes en esta sesión?';

  @override
  String get contRecogWinTitle => '¡Genio del reconocimiento!';

  @override
  String contRecogGameOverMessage(int score) {
    return '¡Obtuviste $score reconocimientos correctos!';
  }

  @override
  String get contRecogCorrect => '¡Correcto!';

  @override
  String get contRecogWrong => '¡Equivocado!';

  @override
  String get contRecogOldOrNew => '¿Es esto viejo o nuevo?';

  @override
  String get contRecogNew => 'Nuevo';

  @override
  String get contRecogOld => 'Viejo';

  @override
  String get contRecogSeenPool => 'piscina vista';

  @override
  String get dnmsTitle => 'Memoria no coincidente';

  @override
  String get dnmsSubtitle =>
      'Toque la tarjeta que no estaba en la muestra memorizada.';

  @override
  String get dnmsWinTitle => '¡Experto no coincidente!';

  @override
  String dnmsGameOverMessage(int score) {
    return '¡Obtuviste __PUNTUACIÓN__ respuestas correctas en No coincidencia retrasada!';
  }

  @override
  String get dnmsChooseNovel => 'Toca la nueva tarjeta';

  @override
  String get dnmsMemorizeSample => 'Memoriza esta tarjeta';

  @override
  String get dnmsWaitForIt => 'Espéralo...';

  @override
  String get dnmsExcellent => '¡Excelente!';

  @override
  String get dnmsSampleTapped => '¡Esa fue la muestra!';

  @override
  String get dnmsCards => 'Tarjetas';

  @override
  String get symSpanTitle => 'Lapso de simetría';

  @override
  String get symSpanSubtitle =>
      'Recuerde patrones celulares mientras identifica la simetría vertical.';

  @override
  String get symSpanWinTitle => '¡Maestro de la simetría!';

  @override
  String symSpanGameOverMessage(int score) {
    return '¡Obtuviste $score puntos al recordar diseños e identificar la simetría!';
  }

  @override
  String get symSpanMemorizeRed =>
      'Memorizar la ubicación de los glóbulos rojos';

  @override
  String get symSpanIsSymmetric => '¿El patrón es simétrico?';

  @override
  String get symSpanRecallSequence =>
      'Recuperar la secuencia en el orden correcto';

  @override
  String get symSpanGreatJob => '¡Buen trabajo!';

  @override
  String get symSpanTryAgain => '¡Intentar otra vez!';

  @override
  String get symSpanLength => 'Longitud';

  @override
  String get readingSpanTitle => 'Lapso de lectura';

  @override
  String get readingSpanSubtitle =>
      'Verificar oraciones mientras recuerda una secuencia de letras.';

  @override
  String get readingSpanWinTitle => '¡Experto en lectura!';

  @override
  String readingSpanGameOverMessage(int score) {
    return '¡Obtuviste $score puntos en el desafío de memoria Reading Span!';
  }

  @override
  String get readingSpanTrueFalse => '¿Es esta afirmación verdadera o falsa?';

  @override
  String get readingSpanMemorizeLetter => 'Memoriza esta carta';

  @override
  String get readingSpanRecallLetters => 'Recordar letras en secuencia';

  @override
  String get readingSpanGreatJob => '¡Buen trabajo!';

  @override
  String get readingSpanTryAgain => '¡Intentar otra vez!';

  @override
  String readingSpanYourSequence(String sequence) {
    return 'Tu secuencia: $sequence';
  }

  @override
  String get readingSpanLength => 'Longitud';

  @override
  String get readingSpanSentence1 => 'El sol sale por el este.';

  @override
  String get readingSpanSentence2 => 'El hielo está hirviendo.';

  @override
  String get readingSpanSentence3 => 'Los peces pueden respirar bajo el agua.';

  @override
  String get readingSpanSentence4 => 'Los perros tienen alas y pueden volar.';

  @override
  String get readingSpanSentence5 =>
      'El agua se congela a 0 grados centígrados.';

  @override
  String get readingSpanSentence6 => 'Los gatos ladran como perros pequeños.';

  @override
  String get readingSpanSentence7 =>
      'Los árboles tienen hojas verdes en verano.';

  @override
  String get readingSpanSentence8 =>
      'La lluvia cae hacia arriba desde el suelo.';

  @override
  String get readingSpanSentence9 => 'Un triángulo tiene cuatro lados iguales.';

  @override
  String get readingSpanSentence10 =>
      'Las manzanas son un tipo de fruta dulce.';

  @override
  String get readingSpanSentence11 => 'La luna está hecha de queso cheddar.';

  @override
  String get readingSpanSentence12 =>
      'Los automóviles tienen ruedas para rodar.';

  @override
  String get readingSpanSentence13 => 'El fuego está helado.';

  @override
  String get readingSpanSentence14 =>
      'El papel se fabrica a partir de madera procesada.';

  @override
  String get readingSpanSentence15 =>
      'Los pájaros tienen plumas que les ayudan a volar.';

  @override
  String get readingSpanSentence16 => 'Los plátanos crecen en los pinos.';

  @override
  String get readingSpanSentence17 =>
      'Un elefante es más pequeño que una hormiga.';

  @override
  String get readingSpanSentence18 =>
      'Los libros contienen páginas de texto impresas.';

  @override
  String get countingSpanTitle => 'Lapso de conteo';

  @override
  String get countingSpanSubtitle =>
      'Cuente únicamente los círculos azules. Luego recuerda la secuencia de conteos.';

  @override
  String get countingSpanWinTitle => '¡Contando genio!';

  @override
  String countingSpanGameOverMessage(int score) {
    return '¡Obtuviste $score puntos en el desafío de memoria Counting Span!';
  }

  @override
  String get countingSpanCountCircles => 'Cuente solo círculos azules';

  @override
  String get countingSpanRecallCounts =>
      'Recordar los conteos en el orden correcto';

  @override
  String get countingSpanGreatJob => '¡Buen trabajo!';

  @override
  String get countingSpanTryAgain => '¡Intentar otra vez!';

  @override
  String countingSpanYourSequence(String sequence) {
    return 'Tu secuencia: $sequence';
  }

  @override
  String get countingSpanLength => 'Longitud';

  @override
  String get objDispTitle => 'Desplazamiento de objetos';

  @override
  String get objDispSubtitle =>
      'Memoriza el diseño. Encuentra y toca el único objeto que cambia de posición.';

  @override
  String get objDispWinTitle => '¡Genio espacial!';

  @override
  String objDispGameOverMessage(int score) {
    return '¡Identificaste correctamente $score objetos desplazados!';
  }

  @override
  String get objDispMemorizeAll => 'Memoriza todas las ubicaciones';

  @override
  String get objDispWaitingShift => 'Esperando cambio de diseño...';

  @override
  String get objDispTapMoved => 'Toca el objeto que se movió.';

  @override
  String get objDispExcellent => '¡Excelente!';

  @override
  String get objDispWrongObject => '¡Objeto equivocado!';

  @override
  String get objDispItems => 'Elementos';

  @override
  String get mandalaTitle => 'Recuerdo de mandala';

  @override
  String get mandalaSubtitle =>
      'Memoriza la configuración de color. Elige colores y vuelve a pintar los azulejos.';

  @override
  String get mandalaWinTitle => '¡Artista de mandalas!';

  @override
  String mandalaGameOverMessage(int score) {
    return '¡Obtuviste $score puntos al recrear diseños geométricos de colores!';
  }

  @override
  String get mandalaMemorizeColors => 'Memoriza los colores de los azulejos';

  @override
  String get mandalaPaintCells =>
      'Pintar celdas para que coincidan con el original.';

  @override
  String get mandalaExcellent => '¡Excelente!';

  @override
  String get mandalaIncorrectMatch => 'Coincidencia incorrecta!';

  @override
  String get mandalaSubmitRepaint => 'Enviar Repintar';

  @override
  String get mandalaTiles => 'Azulejos';

  @override
  String get runningSpanTitle => 'Lapso de carrera';

  @override
  String get runningSpanSubtitle =>
      'Mira las letras. Cuando se detengan, ingrese las últimas N letras en orden.';

  @override
  String get runningSpanWinTitle => '¡Maestro del amortiguador!';

  @override
  String runningSpanGameOverMessage(int score) {
    return '¡Obtuviste $score puntos en Running Memory Span!';
  }

  @override
  String runningSpanPrepareRecall(int count) {
    return 'Prepárese para recordar las últimas $count letras';
  }

  @override
  String get runningSpanWatchCarefully => 'Observa con atención...';

  @override
  String runningSpanEnterLast(int count) {
    return 'Ingrese las últimas $count letras';
  }

  @override
  String get runningSpanGreatJob => '¡Buen trabajo!';

  @override
  String get runningSpanIncorrectBuffer => '¡Búfer incorrecto!';

  @override
  String runningSpanRecallLast(int count) {
    return 'Recuperar el último $count';
  }

  @override
  String get runningSpanStopsRandomly =>
      '¡La transmisión se detiene aleatoriamente!';

  @override
  String runningSpanEntered(String sequence) {
    return 'Ingresado: __SECUENCIA__';
  }

  @override
  String get runningSpanNItems => 'N-artículos';

  @override
  String get spatialCabinetTitle => 'Gabinetes espaciales';

  @override
  String get spatialCabinetSubtitle =>
      'Memoriza qué cajón del armario contiene qué objeto.';

  @override
  String get spatialCabinetWinTitle => '¡Experto en gabinete!';

  @override
  String spatialCabinetGameOverMessage(int score) {
    return '¡Obtuviste $score puntos en Memoria del gabinete espacial!';
  }

  @override
  String get spatialCabinetMemorize => 'Memorizar ubicaciones de elementos';

  @override
  String spatialCabinetWhereIs(String itemName) {
    return '¿Dónde está el $itemName ?';
  }

  @override
  String get spatialCabinetCorrect => '¡Correcto!';

  @override
  String get spatialCabinetWrongDrawer => '¡Cajón equivocado!';

  @override
  String get spatialCabinetItems => 'Elementos';

  @override
  String get cabinetItemKey => 'Llave';

  @override
  String get cabinetItemApple => 'Manzana';

  @override
  String get cabinetItemDiamond => 'Diamante';

  @override
  String get cabinetItemBook => 'Libro';

  @override
  String get cabinetItemUmbrella => 'Paraguas';

  @override
  String get cabinetItemCoffee => 'Café';

  @override
  String get cabinetItemLock => 'Cerrar';

  @override
  String get cabinetItemPet => 'Mascota';

  @override
  String get cabinetItemCar => 'Auto';

  @override
  String get gamesTitleLabel => 'JUEGOS';

  @override
  String get yourFavorites => 'TUS FAVORITOS';

  @override
  String get readyForWorkout => '¿LISTO PARA TU ENTRENAMIENTO DIARIO?';

  @override
  String get greatStartKeepGoing => '¡BUEN COMIENZO! SIGUE ASÍ.';

  @override
  String get onFireToday => '¡ESTÁS A TOPE HOY!';

  @override
  String get incredibleSolvingToday => '¡SOLUCIONES INCREÍBLES HOY!';

  @override
  String get newGameLabel => 'NUEVO';

  @override
  String get slitherlinkTitle => 'Slitherlink';

  @override
  String get slitherlinkSubtitle =>
      'RODEA LA CUADRÍCULA DE PINES USANDO PISTAS NUMÉRICAS.';

  @override
  String get futoshikiTitle => 'Futoshiki';

  @override
  String get futoshikiSubtitle =>
      'RELLENA CUADRÍCULAS CON PISTAS DE MAYOR QUE.';

  @override
  String get kakuroTitle => 'Kakuro';

  @override
  String get kakuroSubtitle => 'RESUELVE CRUCIGRAMAS CON NÚMEROS Y SUMAS.';

  @override
  String get inequalityDashTitle => 'Carrera de Desigualdades';

  @override
  String get inequalityDashSubtitle =>
      'RESUELVE DESIGUALDADES BAJO PRESIÓN DE TIEMPO.';

  @override
  String get factorFinderTitle => 'Buscador de Factores';

  @override
  String get factorFinderSubtitle =>
      'IDENTIFICA TODOS LOS FACTORES DE LOS NÚMEROS OBJETIVO.';

  @override
  String get collatzTitle => 'Ruta de Collatz';

  @override
  String get collatzSubtitle => 'NAVEGA POR LA SECUENCIA 3N+1.';

  @override
  String get sumPyramidTitle => 'Pirámide de Sumas';

  @override
  String get sumPyramidSubtitle =>
      'RELLENA LAS CELDAS DE LA PIRÁMIDE CON PISTAS MATEMÁTICAS DE SUMA.';

  @override
  String get target10Title => 'Objetivo 10';

  @override
  String get target10Subtitle =>
      'COMBINA FICHAS NUMÉRICAS PARA OBTENER SUMAS DE DIEZ.';

  @override
  String get fractionMatcherTitle => 'Emparejador de Fracciones';

  @override
  String get fractionMatcherSubtitle =>
      'EMPAREJA FRACCIONES EQUIVALENTES VISUALMENTE.';

  @override
  String get dualCodingTitle => 'Codificación Dual';

  @override
  String get dualCodingSubtitle =>
      'EMPAREJA LETRAS Y SÍMBOLOS SIMULTÁNEAMENTE.';

  @override
  String get distractorMatrixTitle => 'Matriz de Distractores';

  @override
  String get distractorMatrixSubtitle =>
      'ENCUENTRA FORMAS OBJETIVO ENTRE DISTRACTORES.';

  @override
  String get temporalOrderTitle => 'Orden Temporal';

  @override
  String get temporalOrderSubtitle => 'RECUERDA LA SECUENCIA CRONOLÓGICA.';

  @override
  String get associativePairsTitle => 'Pares Asociativos';

  @override
  String get associativePairsSubtitle =>
      'EMPAREJA Y UNE LOS SÍMBOLOS CORRESPONDIENTES.';

  @override
  String get blockCount3dTitle => 'Conteo de Bloques 3D';

  @override
  String get blockCount3dSubtitle =>
      'CUENTA BLOQUES EN UN ESPACIO TRIDIMENSIONAL.';

  @override
  String get rotatingMazeTitle => 'Laberinto Giratorio';

  @override
  String get rotatingMazeSubtitle =>
      'GIRA LABERINTOS PARA GUIAR LAS BOLAS HACIA LA SALIDA.';

  @override
  String get silhouetteMatchOrthoTitle => 'Coincidencia de Siluetas (Orto)';

  @override
  String get silhouetteMatchOrthoSubtitle =>
      'EMPAREJA OBJETOS 3D CON SOMBRAS ORTOGONALES.';

  @override
  String get spatialConflictTitle => 'Conflicto Espacial';

  @override
  String get spatialConflictSubtitle =>
      'RESUELVE DISCREPANCIAS ENTRE TEXTO Y DIRECCIÓN.';

  @override
  String get spotlightTrackTitle => 'Seguimiento de Foco';

  @override
  String get spotlightTrackSubtitle =>
      'RASTREA ELEMENTOS PARPADEANTES EN SOMBRAS EN MOVIMIENTO.';

  @override
  String get d2AttentionTitle => 'Atención d2';

  @override
  String get d2AttentionSubtitle =>
      'TOCA LOS SÍMBOLOS OBJETIVO CON CRITERIOS ESTRICTOS.';

  @override
  String get dualMirrorTitle => 'Navegación de Espejo Dual';

  @override
  String get dualMirrorSubtitle => 'NAVEGA POR DOS LABERINTOS A LA VEZ.';

  @override
  String get contextCluesTitle => 'Pistas de Contexto';

  @override
  String get contextCluesSubtitle =>
      'INFIERE PALABRAS OCULTAS A PARTIR DE PISTAS CONTEXTUALES.';

  @override
  String get digitSpanReverseSubtitle =>
      'RECUERDA DÍGITOS NUMÉRICOS EN ORDEN INVERSO.';

  @override
  String get faceNameAssociationSubtitle =>
      'RECUERDA NOMBRES DE DIVERSOS ROSTROS PRESENTADOS.';

  @override
  String get staircaseMemorySubtitle =>
      'MEMORIZA BLOQUES EN UNA SECUENCIA ESCALONADA.';

  @override
  String get choiceReactionTimeSubtitle =>
      'TOCA RÁPIDAMENTE LOS BOTONES ESPECÍFICOS SEGÚN LAS PISTAS.';

  @override
  String get attentionalBlinkSubtitle =>
      'DETECTA OBJETIVOS RÁPIDOS QUE PARPADEAN EN FLUJOS.';

  @override
  String get visualStatisticalLearningSubtitle =>
      'APRENDE PATRONES DE FORMAS TEMPORALES VISUALMENTE.';

  @override
  String get sternbergTaskSubtitle =>
      'RECUERDA SI EL SÍMBOLO ESTABA EN EL CONJUNTO DE MEMORIA.';

  @override
  String get operationSpanSubtitle =>
      'RESUELVE MATEMÁTICAS Y RECUERDA CADENAS ALFABÉTICAS.';

  @override
  String get continuousRecognitionTitle => 'Reconocimiento Continuo';

  @override
  String get continuousRecognitionSubtitle =>
      'IDENTIFICA SI LA TARJETA PRESENTADA ES VIEJA O NUEVA.';

  @override
  String get symmetrySpanTitle => 'Amplitud de Simetría';

  @override
  String get symmetrySpanSubtitle =>
      'RECUERDA COORDENADAS DE CELDAS ENTRE DECISIONES DE SIMETRÍA VERTICAL.';

  @override
  String get objectDisplacementTitle => 'Desplazamiento de Objetos';

  @override
  String get objectDisplacementSubtitle =>
      'ESTUDIA LAS POSICIONES Y TOCA EL ÚNICO OBJETO QUE SE MOVIÓ.';

  @override
  String get mandalaRecallTitle => 'Memoria de Mandala';

  @override
  String get mandalaRecallSubtitle =>
      'MEMORIZA FICHAS DE COLORES Y REPINTA MANDALAS DESDE LA PALETA.';

  @override
  String get runningMemorySpanTitle => 'Amplitud de Memoria Corriente';

  @override
  String get runningMemorySpanSubtitle =>
      'MONITOREA LETRAS CORRIENTES Y RECUERDA LOS ÚLTIMOS N ELEMENTOS.';

  @override
  String get spatialCabinetMemoryTitle => 'Gabinetes Espaciales';

  @override
  String get spatialCabinetMemorySubtitle =>
      'MEMORIZA Y LOCALIZA OBJETOS DETRÁS DE LAS PUERTAS DE LOS GABINETES.';

  @override
  String get pathRecallSubtitle => 'MEMORIZA Y REPITE SELECCIONES DE RUTAS.';

  @override
  String get objectShuffleSubtitle =>
      'RASTREA OBJETOS MEZCLADOS BAJO COPAS PROFUNDAS.';

  @override
  String get groceryListSubtitle =>
      'MEMORIZA Y MARCA LOS ARTÍCULOS DE LA LISTA.';

  @override
  String get quickMathSubtitle =>
      'RESUELVE PREGUNTAS DE ARITMÉTICA A MÁXIMA VELOCIDAD.';

  @override
  String get mathGuessTitle => 'Adivina Matemático';

  @override
  String get mathGuessSubtitle =>
      'ADIVINA EL NÚMERO OCULTO EN 15 OPORTUNIDADES.';

  @override
  String get reflexTapSubtitle =>
      'TOCA LOS ESTÍMULOS TAN RÁPIDO COMO SEA HUMANAMENTE POSIBLE.';

  @override
  String get pixelMimicSubtitle =>
      'IMITA PATRONES DE DISEÑO EN CUADRÍCULAS DE PÍXELES.';

  @override
  String get simonSequenceSubtitle => 'REPITE SECUENCIAS DE FORMAS DE MEMORIA.';

  @override
  String get slidePuzzleSubtitle =>
      'REORDENA LAS FICHAS DE LA CUADRÍCULA DESLIZANTE.';

  @override
  String get findWordTitle => 'Buscar Palabra';

  @override
  String get schulteTableSubtitle => 'TOCA LOS NÚMEROS DEL UNO AL VEINTICINCO.';

  @override
  String get simonCommandTitle => 'Comando de Simon';

  @override
  String get simonCommandSubtitle =>
      'REALIZA INSTRUCCIONES DE VOZ RÁPIDAMENTE.';

  @override
  String get binaryCodeTitle => 'Velocidad Binaria';

  @override
  String get binaryCodeSubtitle => 'TRADUCE CÓDIGOS BINARIOS A DECIMALES.';

  @override
  String get moduloClockTitle => 'Reloj Módulo';

  @override
  String get moduloClockSubtitle =>
      'CALCULA ECUACIONES MATEMÁTICAS USANDO RELOJES.';

  @override
  String get chimpTestTitle => 'Prueba del Chimpancé';

  @override
  String get chimpTestSubtitle =>
      'TOCA NÚMEROS ALEATORIOS EN ORDEN ASCENDENTE.';

  @override
  String get relationalMemoryTitle => 'Memoria Relacional';

  @override
  String get relationalMemorySubtitle =>
      'RECUERDA LAS POSICIONES EXACTAS DE LOS ELEMENTOS EN LA CUADRÍCULA.';

  @override
  String get factBinderTitle => 'Vinculador de Datos';

  @override
  String get factBinderSubtitle => 'CONECTA SÍMBOLOS Y RECUERDA AFIRMACIONES.';

  @override
  String get sourceMonitoringTitle => 'Monitoreo de Fuentes';

  @override
  String get sourceMonitoringSubtitle => 'RECUERDA EL CONTEXTO.';

  @override
  String get klotskiTitle => 'Escape de Klotski';

  @override
  String get klotskiSubtitle => 'DESLIZA BLOQUES PARA LLEGAR A LAS SALIDAS.';

  @override
  String get homophoneHuntSubtitle => 'Elige el homófono escrito correctamente';

  @override
  String get laserLinkTitle => 'Enlace láser';

  @override
  String get laserLinkSubtitle =>
      'Gira los espejos para reflejar los láseres y activar todos los objetivos.';

  @override
  String get laserLinkCongrats =>
      '¡Reflexión de precisión! Has alimentado con éxito toda la red.';

  @override
  String get crossSectionSliceTitle => 'Corte de sección transversal';

  @override
  String get crossSectionSliceSubtitle =>
      'Identifica la sección transversal 2D correcta de un objeto 3D desde un ángulo específico.';

  @override
  String get crossSectionSliceCongrats =>
      '¡Increíble visualización 3D! Viste a través de esa forma.';

  @override
  String get shadowPivotTitle => 'Pivote de sombra';

  @override
  String get shadowPivotCongrats =>
      '¡Razonamiento espacial dinámico! Dominaste la luz y la sombra.';

  @override
  String get shadowPivotSubtitle =>
      'Predice la sombra proyectada por un objeto 3D mientras gira en diferentes ejes.';

  @override
  String get interlockPuzzleTitle => 'Rompecabezas de entrelazado';

  @override
  String get interlockPuzzleSubtitle =>
      'Desmonta o monta bloques entrelazados complejos en la secuencia correcta.';

  @override
  String get interlockPuzzleCongrats =>
      '¡Deconstrucción lógica! Has descifrado el rompecabezas a la perfección.';

  @override
  String get pathIntersectTitle => 'Intersección de rutas';

  @override
  String get pathIntersectSubtitle =>
      'Navega por múltiples rutas simultáneamente para llegar a sus respectivos objetivos sin colisiones.';

  @override
  String get pathIntersectCongrats =>
      '¡Navegación sincronizada! Has llegado a todos los objetivos sin errores.';

  @override
  String get negativeSpaceDetectionTitle => 'Espacio negativo';

  @override
  String get negativeSpaceDetectionSubtitle =>
      'Identifica la forma formada por el espacio vacío entre los objetos.';

  @override
  String get negativeSpaceDetectionCongrats =>
      '¡Percepción agudizada! Has dominado el arte de ver lo que no está allí.';

  @override
  String get compassMazeTitle => 'Laberinto de brújula';

  @override
  String get compassMazeSubtitle =>
      'Navega por un laberinto donde las direcciones de movimiento cambian según la orientación de tu brújula.';

  @override
  String get compassMazeCongrats =>
      '¡Navegación experta! Has encontrado la salida a través de las direcciones cambiantes.';

  @override
  String get complexFoldingNetsTitle => 'Redes de plegado';

  @override
  String get complexFoldingNetsSubtitle =>
      'Determina qué forma 3D compleja se formará al plegar una red 2D no estándar.';

  @override
  String get complexFoldingNetsCongrats =>
      '¡Lógica de plegado avanzada! Has visualizado con éxito la forma 3D.';

  @override
  String get compassMazeMessage => 'Navega por el laberinto usando la brújula.';

  @override
  String get negativeSpaceDetectionMessage =>
      'Identifica el objeto oculto en el espacio.';

  @override
  String get shikakuTitle => 'shikaku';

  @override
  String get shikakuSubtitle =>
      'DIVIDE LA CUADRÍCULA EN CUADRADOS Y RECTÁNGULOS QUE COINCIDRAN CON LOS NÚMEROS.';

  @override
  String get countdownMathTitle => 'Matemáticas de cuenta regresiva';

  @override
  String get countdownMathSubtitle =>
      'COMBINE NÚMEROS ALEATORIOS PARA CALCULAR EL OBJETIVO DE TRES DÍGITOS.';

  @override
  String get narrativeRecallTitle => 'Recuerdo narrativo';

  @override
  String get narrativeRecallSubtitle =>
      'LEA UNA HISTORIA Y RECUERDE DETALLES CUANTITATIVOS Y HECHOS ESPECÍFICOS.';

  @override
  String get shellGameTitle => 'Juego de conchas';

  @override
  String get shellGameSubtitle =>
      'SEGUIMIENTO DE UNA BOLA OCULTA MIENTRAS LAS COPAS QUE SE BARAJAN INTERCAMBIAN DE LUGAR.';

  @override
  String get typoglycemiaDecoderTitle => 'Decodificador de tipoglucemia';

  @override
  String get typoglycemiaDecoderSubtitle =>
      'ORDENAR Y LEER ORACIONES CONJUNTAS RÁPIDAMENTE.';

  @override
  String get shapeShifterTitle => 'Cambiador de forma';

  @override
  String get shapeShifterSubtitle =>
      'Toque la combinación de forma y color de destino.';

  @override
  String get gokigenNanameTitle => 'Naname Gokigen';

  @override
  String get gokigenNanameSubtitle =>
      'Dibuja diagonales para conectar puntos sin bucles.';

  @override
  String get matrixMultiplierTitle => 'Multiplicador de matriz';

  @override
  String get matrixMultiplierSubtitle =>
      'Seleccione una fila y una columna para multiplicar hasta el objetivo.';

  @override
  String get wordAssociationRecallTitle => 'Asociación de palabras';

  @override
  String get wordAssociationRecallSubtitle =>
      'Recordar de memoria asociaciones de palabras emparejadas.';

  @override
  String get gearRotationTitle => 'Rotación de engranajes';

  @override
  String get gearRotationSubtitle =>
      'Predice la dirección de rotación de la última marcha.';

  @override
  String get wordWheelTitle => 'Rueda de palabras';

  @override
  String get wordWheelSubtitle =>
      'Forma palabras usando letras en la rueda, incluida la letra central.';

  @override
  String get oddEvenFlashTitle => 'Flash par-impar';

  @override
  String get oddEvenFlashSubtitle =>
      'Haga coincidir rápidamente la paridad numérica con la regla de color.';

  @override
  String get norinoriTitle => 'norinori';

  @override
  String get norinoriSubtitle =>
      'Sombrea exactamente dos celdas conectadas en cada habitación.';

  @override
  String get algebraicBalanceTitle => 'Equilibrio algebraico';

  @override
  String get algebraicBalanceSubtitle =>
      'Resuelve las ecuaciones para encontrar la suma objetivo.';

  @override
  String get patternSequenceDrawTitle => 'Recuperación de patrones';

  @override
  String get patternSequenceDrawSubtitle =>
      'Repita la secuencia de ruta animada en la cuadrícula.';

  @override
  String get tangramTitle => 'Rompecabezas Tangram';

  @override
  String get tangramSubtitle =>
      'Organiza las formas para llenar la silueta objetivo.';

  @override
  String get semanticAssociationTitle => 'Palabra de asociación';

  @override
  String get semanticAssociationSubtitle =>
      'Encuentra la palabra que conecta las tres pistas.';

  @override
  String get peripheralFocusTitle => 'Enfoque periférico';

  @override
  String get peripheralFocusSubtitle =>
      'Reacciona a los paneles laterales parpadeantes mientras resuelves matemáticas.';

  @override
  String get masyuTitle => 'Bucle Masyu';

  @override
  String get masyuSubtitle =>
      'Dibuja un bucle único que coincida con las reglas del círculo de Masyu.';

  @override
  String get mathMazeTitle => 'Laberinto matemático';

  @override
  String get mathMazeSubtitle =>
      'Trace una ruta que se evalúe hasta el total objetivo.';

  @override
  String get storyBuilderTitle => 'Constructor de historias';

  @override
  String get storyBuilderSubtitle =>
      'Reconstruir la secuencia cronológica de la historia.';

  @override
  String get mirrorMazeTitle => 'Laberinto de espejos';

  @override
  String get mirrorMazeSubtitle =>
      'Redirigir un rayo láser utilizando espejos diagonales.';

  @override
  String get wordGridConnectionTitle => 'Conexiones de palabras';

  @override
  String get wordGridConnectionSubtitle =>
      'Agrupa 16 palabras en cuatro categorías de cuatro.';

  @override
  String get shapeShifterPeripheralTitle => 'Formas periféricas';

  @override
  String get shapeShifterPeripheralSubtitle =>
      'Realice un seguimiento de los cambios de forma periférica mientras hace coincidir los valores centrales.';

  @override
  String get soundWaveMatchTitle => 'Coincidencia de ondas sonoras';

  @override
  String get soundWaveMatchSubtitle =>
      'Toque cuando la frecuencia de la onda visual se alinee con los cambios de tono.';

  @override
  String get multiTrackCounterTitle => 'Contador multipista';

  @override
  String get multiTrackCounterSubtitle =>
      'Toque cuando cualquier contador aumente hasta un multiplicador objetivo.';

  @override
  String get colorWordMatchUpTitle => 'Combinación de colores';

  @override
  String get colorWordMatchUpSubtitle =>
      'Determina si dos palabras de colores coinciden según las reglas cambiantes.';

  @override
  String get signalAndNoiseTitle => 'Señal y ruido';

  @override
  String get signalAndNoiseSubtitle =>
      'Localice los caracteres alfanuméricos de destino ocultos en ruido estático.';

  @override
  String get focusTunnelTitle => 'Túnel de enfoque';

  @override
  String get focusTunnelSubtitle =>
      'Identifique los símbolos coincidentes que aparecen en las paredes del túnel en movimiento.';

  @override
  String get targetPursuerTitle => 'Perseguidor objetivo';

  @override
  String get targetPursuerSubtitle =>
      'Realice un seguimiento de varios círculos superpuestos y seleccione el objetivo original.';

  @override
  String get gridGazeTitle => 'Mirada de cuadrícula';

  @override
  String get gridGazeSubtitle =>
      'Identifique qué celda de la cuadrícula parpadeó con una duración diferente.';

  @override
  String get doubleTroubleTitle => 'Doble problema';

  @override
  String get doubleTroubleSubtitle =>
      'Juega dos juegos simples separados simultáneamente en pantalla dividida.';

  @override
  String get syncRhythmTitle => 'Ritmo de sincronización';

  @override
  String get syncRhythmSubtitle =>
      'Toque cuando el barrido visual del metrónomo coincida con el ritmo sincopado.';

  @override
  String get ghostTapTitle => 'Grifo fantasma';

  @override
  String get ghostTapSubtitle =>
      'Toque cuando el pulso invisible alcance su altura máxima.';

  @override
  String get attentionalRsvpTitle => 'Confirmar asistencia atentamente';

  @override
  String get attentionalRsvpSubtitle =>
      'Identifique los dígitos que aparecen en un rápido parpadeo de letras en serie.';

  @override
  String get colorMazeNavTitle => 'Laberinto de colores de navegación';

  @override
  String get colorMazeNavSubtitle =>
      'Navega por mosaicos de laberintos que coincidan con los colores de permisos dinámicos.';

  @override
  String get dynamicSalienceTitle => 'Prominencia dinámica';

  @override
  String get dynamicSalienceSubtitle =>
      'Encuentra la forma que se mueve con una dinámica ligeramente diferente.';

  @override
  String get chalkAndTalkTitle => 'Tiza y conversación';

  @override
  String get chalkAndTalkSubtitle =>
      'Escriba las palabras que escuche en audio ignorando los distractores visuales.';

  @override
  String get blinkDetectorTitle => 'Detector de parpadeo';

  @override
  String get blinkDetectorSubtitle =>
      'Toque la cara de la cuadrícula que parpadea dos veces en rápida sucesión.';

  @override
  String get frequencyTapTitle => 'Grifo de frecuencia';

  @override
  String get frequencyTapSubtitle =>
      'Toque el botón que coincida con la frecuencia del pulso de luz objetivo.';

  @override
  String get yajilinTitle => 'Yajilin';

  @override
  String get yajilinSubtitle =>
      'Coloque celdas negras y dibuje un solo bucle que combine pistas.';

  @override
  String get heyawakeTitle => 'Heyawake';

  @override
  String get heyawakeSubtitle =>
      'Salas de rejilla de sombra sin celdas negras adyacentes.';

  @override
  String get gokigenVariantTitle => 'Variante Gokigen';

  @override
  String get gokigenVariantSubtitle =>
      'Dibuja diagonales sin bucles que cumplan con el número de vértices.';

  @override
  String get sheepAndWolvesTitle => 'Ovejas y lobos';

  @override
  String get sheepAndWolvesSubtitle =>
      'Dibuja un bucle que separe las ovejas de los lobos.';

  @override
  String get islandNurikabeTitle => 'Isla Nurikabe';

  @override
  String get islandNurikabeSubtitle =>
      'Forme islas que coincidan con restricciones de tamaño numérico.';

  @override
  String get shakashakaTitle => 'Rectas Shakashaka';

  @override
  String get shakashakaSubtitle =>
      'Coloque baldosas triangulares para formar áreas blancas rectangulares.';

  @override
  String get litsTetrisTitle => 'LITS Tetromino';

  @override
  String get litsTetrisSubtitle =>
      'Coloque los tetrominós en habitaciones sin duplicados adyacentes.';

  @override
  String get tapaWallTitle => 'Muro de Tapas';

  @override
  String get tapaWallSubtitle =>
      'Sombree las celdas para formar un patrón de pared negro continuo.';

  @override
  String get triangularBridgesTitle => 'Puentes triangulares';

  @override
  String get triangularBridgesSubtitle =>
      'Conecte islas en 3 direcciones cumpliendo con los requisitos.';

  @override
  String get rippleEffectTitle => 'Efecto dominó';

  @override
  String get rippleEffectSubtitle =>
      'Complete los números en las habitaciones respetando las restricciones de distancia de espaciado.';

  @override
  String get suguruTectonicTitle => 'Cuadrícula Suguru';

  @override
  String get suguruTectonicSubtitle =>
      'Llene bloques de habitaciones con números del 1 al K sin vecinos iguales.';

  @override
  String get tennerGridTitle => 'Cuadrícula diez';

  @override
  String get tennerGridSubtitle =>
      'Complete las filas con dígitos del 0 al 9 que coincidan con los totales de las columnas.';

  @override
  String get kakurasuSumsTitle => 'Sumas de Kakurasu';

  @override
  String get kakurasuSumsSubtitle =>
      'Sombree las celdas para cumplir con las sumas ponderadas del índice de fila/columna.';

  @override
  String get corralLoopTitle => 'Bucle de corral';

  @override
  String get corralLoopSubtitle =>
      'Dibuja un bucle único que incluya números que coincidan con la visibilidad.';

  @override
  String get stostoneTitle => 'Gravedad de piedra estomacal';

  @override
  String get stostoneSubtitle =>
      'Sombrea las celdas que se despliegan para llenar perfectamente las filas inferiores.';

  @override
  String get tripletsLogicTitle => 'Trío de trillizos';

  @override
  String get tripletsLogicSubtitle =>
      'Rellena la cuadrícula con tres formas evitando tres en fila.';

  @override
  String get galaxiesSymTitle => 'Simetría de galaxias';

  @override
  String get galaxiesSymSubtitle =>
      'Divida la cuadrícula en formas de galaxias rotacionalmente simétricas.';

  @override
  String get matrixMultiplierMatchTitle => 'Comparador de matrices';

  @override
  String get matrixMultiplierMatchSubtitle =>
      'Multiplique los valores de filas y columnas para que coincidan con el producto escalar objetivo.';

  @override
  String get primeFactorTreesTitle => 'Árboles de factores primos';

  @override
  String get primeFactorTreesSubtitle =>
      'Descomponer números compuestos en pares de factores de hojas primos.';

  @override
  String get vektorVectorTitle => 'Vector Vector';

  @override
  String get vektorVectorSubtitle =>
      'Escale los vectores para que su suma aterrice en el objetivo.';

  @override
  String get binomialMatchTitle => 'Coincidencia binomial';

  @override
  String get binomialMatchSubtitle =>
      'Relaciona fórmulas cuadráticas con valores binomiales factorizados.';

  @override
  String get percentageShoppingTitle => 'Porcentaje de compras';

  @override
  String get percentageShoppingSubtitle =>
      'Calcule porcentajes de descuento y totales de pago final.';

  @override
  String get cryptoArithmeticTitle => 'Criptoaritmética';

  @override
  String get cryptoArithmeticSubtitle =>
      'Resuelva problemas matemáticos de cifrado de sustitución de caracteres y dígitos.';

  @override
  String get fractionalPizzaTitle => 'Pizza fraccionada';

  @override
  String get fractionalPizzaSubtitle =>
      'Divida porciones de pizza para que coincidan con las fracciones de suma objetivo.';

  @override
  String get numberBondsTitle => 'Bonos numéricos';

  @override
  String get numberBondsSubtitle =>
      'Vincula los valores de los nodos para igualar una suma de conexión objetivo.';

  @override
  String get gridSumLineTitle => 'Línea de suma de cuadrícula';

  @override
  String get gridSumLineSubtitle =>
      'Dibuja una ruta cuyos valores se evalúen exactamente con el objetivo.';

  @override
  String get binaryScaleBalanceTitle => 'Balanza de escala binaria';

  @override
  String get binaryScaleBalanceSubtitle =>
      'Equilibra el peso decimal usando bloques de potencia de dos.';

  @override
  String get moduloPathTitle => 'Ruta del módulo';

  @override
  String get moduloPathSubtitle =>
      'Recorra las celdas de la cuadrícula que coincidan con los valores restantes del módulo.';

  @override
  String get digitSwapEqTitle => 'Ecuaciones de intercambio de dígitos';

  @override
  String get digitSwapEqSubtitle =>
      'Intercambia dígitos únicos entre ecuaciones para corregir ambas.';

  @override
  String get areaPerimeterMatchTitle => 'Área y perímetro';

  @override
  String get areaPerimeterMatchSubtitle =>
      'Dibuja rectángulos que coincidan con los valores del área objetivo y del perímetro.';

  @override
  String get inequalityBalanceOpsTitle => 'Equilibrio de desigualdad';

  @override
  String get inequalityBalanceOpsSubtitle =>
      'Coloca símbolos de desigualdad entre términos matemáticos complejos.';

  @override
  String get graphCoordinatePlotTitle => 'Trazador gráfico';

  @override
  String get graphCoordinatePlotSubtitle =>
      'Trazar coordenadas de cuadrícula que coincidan con curvas lineales/cuadráticas.';

  @override
  String get baseConversionRunTitle => 'Conversión básica';

  @override
  String get baseConversionRunSubtitle =>
      'Convierte valores entre binario, decimal, hexadecimal y octal.';

  @override
  String get unitConverterProTitle => 'Convertidor de unidades';

  @override
  String get unitConverterProSubtitle =>
      'Responda conversiones rápidas de unidades dentro de límites de tiempo.';

  @override
  String get auditoryNBackTitle => 'N-Back auditivo';

  @override
  String get auditoryNBackSubtitle =>
      'Coincidencia de letras habladas escuchadas N pasos atrás de la memoria.';

  @override
  String get abstractPatternRecallTitle => 'Capas de patrón';

  @override
  String get abstractPatternRecallSubtitle =>
      'Reconstruya formas coloridas en capas a partir del estudio de la memoria.';

  @override
  String get roomInspectorTitle => 'inspector de habitaciones';

  @override
  String get roomInspectorSubtitle =>
      'Identifique las modificaciones de muebles realizadas mientras la pantalla estaba en blanco.';

  @override
  String get voiceToFaceMatchTitle => 'Coincidencia voz-cara';

  @override
  String get voiceToFaceMatchSubtitle =>
      'Seleccione la cara correcta asociada con el clip de voz de audio hablado.';

  @override
  String get spatialGridMemory3DTitle => 'Memoria espacial 3D';

  @override
  String get spatialGridMemory3DSubtitle =>
      'Recuerde los bloques flasheados en una estructura de cuadrícula de cubo 3D rotada.';

  @override
  String get sequenceStackTitle => 'Pila de secuencia';

  @override
  String get sequenceStackSubtitle =>
      'Reconstruya las adiciones y eliminaciones de la pila de placas en orden.';

  @override
  String get semanticCategoryRecallTitle => 'Recuperación de categoría';

  @override
  String get semanticCategoryRecallSubtitle =>
      'Identifique palabras de estudio que coincidan con los objetivos de la categoría solicitada.';

  @override
  String get gridDisplacementTitle => 'Desplazamiento de la rejilla';

  @override
  String get gridDisplacementSubtitle =>
      'Identifique íconos desplazados comparando el diseño con el original.';

  @override
  String get soundSequenceMatchTitle => 'Coincidencia de secuencia de sonido';

  @override
  String get soundSequenceMatchSubtitle =>
      'Repita secuencias de notas tocadas en un teclado virtual.';

  @override
  String get cardCountingMemoryTitle => 'Contador de cartas';

  @override
  String get cardCountingMemorySubtitle =>
      'Identifique las cartas ya repartidas en ejecuciones continuas de reparto de cartas.';

  @override
  String get directionsRecallTitle => 'Instrucciones para recordar';

  @override
  String get directionsRecallSubtitle =>
      'Navegue por mapas de cuadrícula que coincidan con las direcciones de ruta de la memoria.';

  @override
  String get eventTimelineMemoryTitle => 'Cronología del evento';

  @override
  String get eventTimelineMemorySubtitle =>
      'Organice las tarjetas de eventos históricos/ficticios cronológicamente.';

  @override
  String get featureMatrixRecallTitle => 'Matriz de características';

  @override
  String get featureMatrixRecallSubtitle =>
      'Responda consultas sobre atributos de forma y color de celda.';

  @override
  String get delayedMatchSampleTitle => 'Partido retrasado';

  @override
  String get delayedMatchSampleSubtitle =>
      'Haga coincidir el símbolo del objetivo después de resolver los distractores matemáticos.';

  @override
  String get symbolDigitAssocTitle => 'Asociación símbolo-dígito';

  @override
  String get symbolDigitAssocSubtitle =>
      'Resuelva hojas de traducción de símbolos que coincidan con claves de dígitos.';

  @override
  String get dualTaskMemoryTitle => 'Memoria de doble tarea';

  @override
  String get dualTaskMemorySubtitle =>
      'Memorice conjuntos de palabras mientras resuelve tareas aritméticas rápidas.';

  @override
  String get actionSequenceRecallTitle => 'Recuerdo de acción';

  @override
  String get actionSequenceRecallSubtitle =>
      'Repita las secuencias de animación de gestos de personajes en orden.';

  @override
  String get tangramPolygonTitle => 'Ajuste Tangram';

  @override
  String get tangramPolygonSubtitle =>
      'Organice formas poligonales para rellenar los contornos de la silueta.';

  @override
  String get mazeNav3DTitle => 'Navegación en laberinto 3D';

  @override
  String get mazeNav3DSubtitle =>
      'Navega por rutas de laberintos isométricos en 3D desde la vista en primera persona.';

  @override
  String get isometricProjectionTitle => 'Proyector isométrico';

  @override
  String get isometricProjectionSubtitle =>
      'Haga coincidir figuras de bloques 3D con vistas ortográficas superiores/frontales 2D.';

  @override
  String get polyominoPackingTitle => 'Embalaje de poliomino';

  @override
  String get polyominoPackingSubtitle =>
      'Empaque piezas aleatorias de bloques de poliominó en las áreas objetivo.';

  @override
  String get spatialGridRotationTitle => 'Rotación de cuadrícula espacial';

  @override
  String get spatialGridRotationSubtitle =>
      'Haga coincidir disposiciones de bloques 3D girados a lo largo de las coordenadas del eje.';

  @override
  String get wireLoopGameTitle => 'Bucle de alambre';

  @override
  String get wireLoopGameSubtitle =>
      'Arrastre anillos de metal a lo largo de las estrías de alambre sin contacto.';

  @override
  String get origamiUnfoldTitle => 'Origami desplegado';

  @override
  String get origamiUnfoldSubtitle =>
      'Identifique patrones de perforación después de desplegar hojas plegadas.';

  @override
  String get ropeTangleSolverTitle => 'Desenredador de cuerdas';

  @override
  String get ropeTangleSolverSubtitle =>
      'Arrastre nodos para diseñar gráficos planos con cruces de líneas cero.';

  @override
  String get gridFitTetrisTitle => 'Solucionador de ajuste de cuadrícula';

  @override
  String get gridFitTetrisSubtitle =>
      'Organice bloques estáticos irregulares para que se ajusten a los límites del contenedor.';

  @override
  String get vectorGridAlignmentTitle => 'Alineación vectorial';

  @override
  String get vectorGridAlignmentSubtitle =>
      'Escale y rote formas para que coincidan con los objetivos de la plantilla de sombra.';

  @override
  String get blockStackingPhysicsTitle => 'Apilamiento de bloques';

  @override
  String get blockStackingPhysicsSubtitle =>
      'Apile paneles de bloques irregulares equilibrando el peso de la gravedad.';

  @override
  String get crossSectionMatch3DTitle => 'Sección transversal 3D';

  @override
  String get crossSectionMatch3DSubtitle =>
      'Identifique geometrías de corte 2D cortadas a partir de formas 3D.';

  @override
  String get symmetryPaintTitle => 'Pintura de simetría';

  @override
  String get symmetryPaintSubtitle =>
      'Dibuja segmentos de imágenes especulares que se reflejen a través de ejes de simetría.';

  @override
  String get rollingBlockBloxTitle => 'Bloque rodante';

  @override
  String get rollingBlockBloxSubtitle =>
      'Haga rodar las piezas del bloque para aterrizar verticalmente en las ranuras objetivo.';

  @override
  String get perspectiveShiftViewTitle => 'Cambio de perspectiva';

  @override
  String get perspectiveShiftViewSubtitle =>
      'Gire los grupos de bloques hasta que deletreen letras o palabras.';

  @override
  String get networkFlowSphericalTitle => 'Flujo de red';

  @override
  String get networkFlowSphericalSubtitle =>
      'Conecte los flujos de cuadrícula en coordenadas cilíndricas envolventes.';

  @override
  String get layeredSilhouetteBlendTitle => 'Mezcla de silueta';

  @override
  String get layeredSilhouetteBlendSubtitle =>
      'Apila capas de colores para que coincidan con las formas translúcidas objetivo.';

  @override
  String get wordWheelPangramTitle => 'Anagramas de palabras';

  @override
  String get wordWheelPangramSubtitle =>
      'Construya palabras que contengan letras objetivo centrales a partir de ruedas.';

  @override
  String get letterGridSwapperTitle => 'Intercambiador de letras';

  @override
  String get letterGridSwapperSubtitle =>
      'Intercambie fichas de letras adyacentes para completar palabras de fila y columna.';

  @override
  String get synonymMatchTitle => 'Coincidencia de sinónimos';

  @override
  String get synonymMatchSubtitle =>
      'Haga coincidir los objetivos de palabras que caen con sinónimos o antónimos.';

  @override
  String get vowelDropTitle => 'Caída de vocales';

  @override
  String get vowelDropSubtitle =>
      'Coloque las vocales en cuadrículas de coordenadas para completar palabras.';

  @override
  String get letterBalanceScaleTitle => 'Escala de equilibrio de palabras';

  @override
  String get letterBalanceScaleSubtitle =>
      'Deletrea palabras cuyos valores de letras equilibran los pesos.';

  @override
  String get wordChainShiritoriTitle => 'Cadena de palabras';

  @override
  String get wordChainShiritoriSubtitle =>
      'Vincula bucles de palabras que comienzan con las letras anteriores.';

  @override
  String get affixBuilderTitle => 'Constructor de afijos';

  @override
  String get affixBuilderSubtitle =>
      'Combine prefijos/sufijos para construir vocabularios de destino.';

  @override
  String get decipherCrypticCluesTitle => 'Descifrador críptico';

  @override
  String get decipherCrypticCluesSubtitle =>
      'Resuelve acertijos de juegos de palabras y descifra acertijos de ortografía.';

  @override
  String get boggleWordSearchTitle => 'Conectar';

  @override
  String get boggleWordSearchSubtitle =>
      'Traza caminos conectados adyacentes para encontrar palabras ocultas.';

  @override
  String get idiomUnscrambleTitle => 'Descifrar modismos';

  @override
  String get idiomUnscrambleSubtitle =>
      'Organice conjuntos de palabras codificadas para que coincidan con los significados de los modismos.';

  @override
  String get letterPyramidsTitle => 'Pirámides de letras';

  @override
  String get letterPyramidsSubtitle =>
      'Construya torres de palabras agregando letras de anagramas individuales por nivel.';

  @override
  String get soundAlikeHomophonesTitle => 'Coincidencias homófonas';

  @override
  String get soundAlikeHomophonesSubtitle =>
      'Identificar la ortografía homófona correcta de oraciones.';

  @override
  String get wordGridSudokuTitle => 'Sudoku de palabras';

  @override
  String get wordGridSudokuSubtitle =>
      'Letras teseladas en filas de cuadrícula que forman palabras.';

  @override
  String get portmanteauFactoryTitle => 'Fábrica de maletas';

  @override
  String get portmanteauFactorySubtitle =>
      'Fusionar componentes semánticos creando palabras compuestas.';

  @override
  String get codedCrosswordsCodeTitle => 'Crucigrama de palabras clave';

  @override
  String get codedCrosswordsCodeSubtitle =>
      'Resuelva crucigramas de cuadrícula que combinen códigos de números y letras.';

  @override
  String get wordSnakeTrailTitle => 'Serpiente de palabra';

  @override
  String get wordSnakeTrailSubtitle =>
      'Traza rastros de letras en forma de serpiente que deletrean palabras temáticas.';

  @override
  String get typingRhythmSpeedTitle => 'Flujo de escritura';

  @override
  String get typingRhythmSpeedSubtitle =>
      'Escriba vocabularios que coincidan con los ritmos del metrónomo.';

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
  String get hideGame => 'Ocultar';

  @override
  String get unhideGame => 'Mostrar';

  @override
  String get favoriteGame => 'Favorito';

  @override
  String get unfavoriteGame => 'Quitar favorito';

  @override
  String get hiddenGames => 'JUEGOS OCULTOS';

  @override
  String showHiddenGames(int count) {
    return 'Mostrar juegos ocultos ($count)';
  }

  @override
  String get noHiddenGames => 'Sin juegos ocultos';

  @override
  String get gameHidden => 'Juego oculto';

  @override
  String get undo => 'Deshacer';

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
  String get btnMatchColor => 'COINCIDIR COLOR';

  @override
  String get btnMatchWord => 'COINCIDIR PALABRA';

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

  @override
  String get kurodokoTitle => 'Kurodoko';

  @override
  String get kurodokoSubtitle =>
      'Place black cells so numbers see the exact count of white cells.';

  @override
  String get kurodokoWinTitle => 'WHERE IS BLACK SOLVED!';

  @override
  String get kurodokoWinMessage =>
      'You mastered the visibility paths and isolated all black cells!';

  @override
  String get subitizingRushTitle => 'Subitize Rush';

  @override
  String get subitizingRushSubtitle =>
      'Instantly identify the quantity of flashed dots without counting.';

  @override
  String get subitizingRushWinTitle => 'RAPID VISION!';

  @override
  String get subitizingRushWinMessage =>
      'Your instant visual numerosity estimation is outstanding!';

  @override
  String get tapaTitle => 'Tapa';

  @override
  String get tapaSubtitle =>
      'Shade cells to form a continuous wall without 2x2 blocks.';

  @override
  String get tapaWinTitle => 'TAPA WALL COMPLETED!';

  @override
  String get tapaWinMessage =>
      'All numbered cell constraints perfectly satisfied!';

  @override
  String get exponentTowerTitle => 'Exponent Tower';

  @override
  String get exponentTowerSubtitle =>
      'Order dynamic power expressions from smallest to largest.';

  @override
  String get exponentTowerWinTitle => 'TOWER STACKED!';

  @override
  String get exponentTowerWinMessage =>
      'All power magnitudes calculated with perfect precision!';

  @override
  String get posnerSpatialCueingTitle => 'Spatial Cue';

  @override
  String get posnerSpatialCueingSubtitle =>
      'React swiftly to directional target appearances following spatial cues.';

  @override
  String get posnerSpatialCueingWinTitle => 'ALERT VISION!';

  @override
  String get posnerSpatialCueingWinMessage =>
      'Fast visual orienting and stimulus detection recorded!';

  @override
  String get gearTrainDirectionTitle => 'Gear Train';

  @override
  String get gearTrainDirectionSubtitle =>
      'Deduce the rotation direction of the target gear in the mechanical train.';

  @override
  String get gearTrainDirectionWinTitle => 'MECHANISM SOLVED!';

  @override
  String get gearTrainDirectionWinMessage =>
      'Kinematic gear rotational transmissions accurately traced!';

  @override
  String get continuousPairedAssociateTitle => 'Pair Associate';

  @override
  String get continuousPairedAssociateSubtitle =>
      'Memorize symbol pairs and recall the matching partner.';

  @override
  String get continuousPairedAssociateWinTitle => 'PAIRS LINKED!';

  @override
  String get continuousPairedAssociateWinMessage =>
      'Strong associative memory pathways established!';

  @override
  String get heyawakeWinTitle => 'ROOMS BALANCED!';

  @override
  String get heyawakeWinMessage =>
      'All room division rules and white path connections satisfied!';

  @override
  String get setTheoryVennTitle => 'Venn Sets';

  @override
  String get setTheoryVennSubtitle =>
      'Select the corresponding regions of the Venn diagram for the set formula.';

  @override
  String get setTheoryVennWinTitle => 'SET LOGIC MASTER!';

  @override
  String get setTheoryVennWinMessage =>
      'All set operations, unions, and intersections deduced flawlessly!';

  @override
  String get navonHierarchicalTitle => 'Navon Global';

  @override
  String get navonHierarchicalSubtitle =>
      'Identify either the large global letter or small local letters under prompt rules.';

  @override
  String get navonHierarchicalWinTitle => 'FOCUS SHARPENED!';

  @override
  String get navonHierarchicalWinMessage =>
      'Outstanding selective attention and global-local perception!';

  @override
  String get masyuWinTitle => 'MASYU LOOP SOLVED!';

  @override
  String get masyuWinMessage =>
      'All pearl turning and straight passage rules strictly satisfied!';

  @override
  String get primeGapHuntTitle => 'Prime Gap';

  @override
  String get primeGapHuntSubtitle =>
      'Calculate the arithmetic difference between consecutive prime numbers.';

  @override
  String get primeGapHuntWinTitle => 'GAP CALCULATED!';

  @override
  String get primeGapHuntWinMessage =>
      'Mastery of prime distribution and mental subtraction displayed!';

  @override
  String get yajilinWinTitle => 'YAJILIN SOLVED!';

  @override
  String get yajilinWinMessage =>
      'All arrow clue raycasts and orthogonal black cell separations satisfied!';

  @override
  String get algebraicInequalitySolverTitle => 'Inequality';

  @override
  String get algebraicInequalitySolverSubtitle =>
      'Solve linear single-variable algebraic inequalities swiftly.';

  @override
  String get algebraicInequalitySolverWinTitle => 'ALGEBRA EXPERT!';

  @override
  String get algebraicInequalitySolverWinMessage =>
      'Fast inequality reduction and algebraic balance achieved!';

  @override
  String get attentionalBlinkProbeTitle => 'Blink Probe';

  @override
  String get attentionalBlinkProbeSubtitle =>
      'Detect second target stimuli presented rapidly after primary targets.';

  @override
  String get attentionalBlinkProbeWinTitle => 'TEMPORAL FOCUS!';

  @override
  String get attentionalBlinkProbeWinMessage =>
      'Exceptional temporal visual processing across the blink refractory window!';

  @override
  String get modularClockArithmeticTitle => 'Clock Modulo';

  @override
  String get modularClockArithmeticSubtitle =>
      'Calculate cyclical clock time arithmetic under modulo 12 algebra.';

  @override
  String get modularClockArithmeticWinTitle => 'CLOCKWORK PRECISION!';

  @override
  String get modularClockArithmeticWinMessage =>
      'All modular hour shifts calculated with ease!';

  @override
  String get temporalOrderJudgmentTitle => 'Time Order';

  @override
  String get temporalOrderJudgmentSubtitle =>
      'Discriminate which of two millisecond-separated stimulus circles flashed first.';

  @override
  String get temporalOrderJudgmentWinTitle => 'ULTRA-FAST PERCEPTION!';

  @override
  String get temporalOrderJudgmentWinMessage =>
      'High-resolution temporal distinction demonstrated!';

  @override
  String get polyominoTilingTitle => 'Polyomino';

  @override
  String get polyominoTilingSubtitle =>
      'Rotate and assemble tetromino geometric shapes to tile the grid without gaps.';

  @override
  String get polyominoTilingWinTitle => 'GRID TILED!';

  @override
  String get polyominoTilingWinMessage =>
      'Seamless geometric spatial arrangement completed!';

  @override
  String get pythagoreanTripleBuilderTitle => 'Pythagoras';

  @override
  String get pythagoreanTripleBuilderSubtitle =>
      'Find the missing hypotenuse or leg value in integer Pythagorean triangles.';

  @override
  String get pythagoreanTripleBuilderWinTitle => 'GEOMETRY MASTER!';

  @override
  String get pythagoreanTripleBuilderWinMessage =>
      'All right-triangle integer triples rapidly solved!';

  @override
  String get visualSearchConjunctionTitle => 'Conj. Search';

  @override
  String get visualSearchConjunctionSubtitle =>
      'Quickly locate target shapes combining multiple feature dimensions (color and form).';

  @override
  String get visualSearchConjunctionWinTitle => 'CONJUNCTION FOCUS!';

  @override
  String get visualSearchConjunctionWinMessage =>
      'Flawless multi-feature parallel and serial visual search!';

  @override
  String get wireframe3DRotationTitle => 'Wireframe 3D';

  @override
  String get wireframe3DRotationSubtitle =>
      'Identify the correctly rotated 3D geometric wireframe following angular transformation.';

  @override
  String get wireframe3DRotationWinTitle => '3D ROTATION MASTER!';

  @override
  String get wireframe3DRotationWinMessage =>
      'Precise 3D mental rotation and spatial orientation demonstrated!';

  @override
  String get wordPairAssociateMemoryTitle => 'Word Pairs';

  @override
  String get wordPairAssociateMemorySubtitle =>
      'Memorize associated word connections and select the target paired with the cue.';

  @override
  String get wordPairAssociateMemoryWinTitle => 'ASSOCIATION MASTER!';

  @override
  String get wordPairAssociateMemoryWinMessage =>
      'Strong episodic associative memory retention achieved!';

  @override
  String get binaryMatrixRankTitle => 'Matrix Rank';

  @override
  String get binaryMatrixRankSubtitle =>
      'Determine the linear algebraic rank of the 3x3 binary matrix over Galois field GF(2).';

  @override
  String get binaryMatrixRankWinTitle => 'RANK COMPUTED!';

  @override
  String get binaryMatrixRankWinMessage =>
      'Exact linear independence and matrix rank determined!';

  @override
  String get visualCrowdingAcuityTitle => 'Visual Crowd';

  @override
  String get visualCrowdingAcuitySubtitle =>
      'Identify the opening direction of the center Landolt ring amid flanking distractors.';

  @override
  String get visualCrowdingAcuityWinTitle => 'SHARP PERCEPTION!';

  @override
  String get visualCrowdingAcuityWinMessage =>
      'Excellent foveal spatial resolution under visual crowding conditions!';

  @override
  String get probeDigitSpanTitle => 'Digit Probe';

  @override
  String get probeDigitSpanSubtitle =>
      'Observe a fast serial sequence of numbers and recall the item following the probe digit.';

  @override
  String get probeDigitSpanWinTitle => 'SERIAL PROBE MASTER!';

  @override
  String get probeDigitSpanWinMessage =>
      'Flawless short-term serial position memory retrieval!';

  @override
  String get abReversalOddballTitle => 'A-B Reversal';

  @override
  String get abReversalOddballSubtitle =>
      'Respond to target stimuli and dynamically switch response criteria upon rule reversal.';

  @override
  String get abReversalOddballWinTitle => 'FLEXIBILITY MASTER!';

  @override
  String get abReversalOddballWinMessage =>
      'Exceptional cognitive switching and perceptual flexibility demonstrated!';

  @override
  String get conundrumAnagramTitle => 'Conundrum';

  @override
  String get conundrumAnagramSubtitle =>
      'Unscramble all 9 letters to discover the hidden full dictionary word.';

  @override
  String get conundrumAnagramWinTitle => 'CONUNDRUM CRACKED!';

  @override
  String get conundrumAnagramWinMessage =>
      'All 9-letter anagram conundrums successfully unscrambled!';

  @override
  String get vectorDotProductTitle => 'Dot Product';

  @override
  String get vectorDotProductSubtitle =>
      'Calculate the algebraic inner product u • v = (u_x * v_x) + (u_y * v_y).';

  @override
  String get vectorDotProductWinTitle => 'INNER PRODUCT COMPUTED!';

  @override
  String get vectorDotProductWinMessage =>
      'Exact geometric and algebraic vector projections achieved!';

  @override
  String get stroopNumberSizeTitle => 'Size Stroop';

  @override
  String get stroopNumberSizeSubtitle =>
      'Compare either numerical magnitude or physical font size under Stroop interference.';

  @override
  String get stroopNumberSizeWinTitle => 'INHIBITION EXPERT!';

  @override
  String get stroopNumberSizeWinMessage =>
      'Flawless perceptual conflict resolution under size-congruity Stroop!';

  @override
  String get wordLadderStepTitle => 'Word Ladder';

  @override
  String get wordLadderStepSubtitle =>
      'Complete the single-letter transformation sequence between source and destination words.';

  @override
  String get wordLadderStepWinTitle => 'LADDER CLIMBED!';

  @override
  String get wordLadderStepWinMessage =>
      'All single-letter step transformations completed!';

  @override
  String get corsiBackwardSpanTitle => 'Corsi Backward';

  @override
  String get corsiBackwardSpanSubtitle =>
      'Observe a sequential spatial block tapping pattern and reproduce it in exact reverse order.';

  @override
  String get corsiBackwardSpanWinTitle => 'BACKWARD SPAN PRO!';

  @override
  String get corsiBackwardSpanWinMessage =>
      'Exceptional visuospatial working memory manipulation and reverse sequencing!';
}
