// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Puzzle Hub';

  @override
  String get home => 'Inicio';

  @override
  String get settings => 'Ajustes';

  @override
  String get playAgain => 'Jugar de nuevo';

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
    return 'Tiles in wrong position: $count';
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
  String get grammarPoliceTitle => 'Policía gramatical';

  @override
  String get grammarPoliceSubtitle =>
      'Identifica y corrige errores en un muro de texto que se desplaza.';

  @override
  String get grammarPoliceHowToPlay =>
      'Las frases se desplazarán hacia arriba por la pantalla. Algunas contienen errores (ortografía, gramática o puntuación). Toca las frases que contengan errores para \'corregirlas\'. ¡No dejes pasar demasiados errores!';

  @override
  String get reverseStroopTitle => 'Stroop inverso';

  @override
  String get reverseStroopSubtitle =>
      'Una variación del test de Stroop donde el enfoque cambia.';

  @override
  String get reverseStroopHowToPlay =>
      '¡Presta atención a las instrucciones! Si dice \'TEXTO\', coincide con el significado de la palabra. Si dice \'COLOR\', coincide con el color de la tinta. Las reglas cambiarán frecuentemente para poner a prueba tu concentración.';

  @override
  String get game2048Instruction =>
      'DESLIZA EN CUALQUIER DIRECCIÓN PARA COMBINAR';
}
