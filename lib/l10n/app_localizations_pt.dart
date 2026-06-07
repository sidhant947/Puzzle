// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Puzzle Hub';

  @override
  String get home => 'Início';

  @override
  String get settings => 'Configurações';

  @override
  String get playAgain => 'Jogar novamente';

  @override
  String get playNext => 'Jogar Próximo';

  @override
  String get seeCompleted => 'Revisar Puzzle';

  @override
  String get finish => 'Finalizar';

  @override
  String get congrats => 'Parabéns';

  @override
  String get perfectGradient => 'Gradiente Perfeito!';

  @override
  String get wellDone => 'Bem feito';

  @override
  String get timeUp => 'Tempo esgotado!';

  @override
  String get completed => 'Concluído!';

  @override
  String get score => 'Pontuação';

  @override
  String get timeLeft => 'Tempo';

  @override
  String get trials => 'Tentativas';

  @override
  String get numberRule => 'Regra Numérica';

  @override
  String get colorRule => 'Regra de Cores';

  @override
  String get valid => 'Válido';

  @override
  String get invalid => 'Inválido';

  @override
  String get even => 'Par';

  @override
  String get odd => 'Ímpar';

  @override
  String get red => 'Vermelho';

  @override
  String get green => 'Verde';

  @override
  String get blue => 'Azul';

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Não';

  @override
  String get trueLabel => 'Verdadeiro';

  @override
  String get falseLabel => 'Falso';

  @override
  String get clear => 'Limpar';

  @override
  String get north => 'Norte';

  @override
  String get south => 'Sul';

  @override
  String get east => 'Leste';

  @override
  String get west => 'Oeste';

  @override
  String get target => 'Alvo';

  @override
  String get moves => 'Movimentos';

  @override
  String get trialMode => 'Modo de Tentativa';

  @override
  String get trialModeDescription =>
      'Resolva 20 para terminar em vez do cronômetro de 60s';

  @override
  String get appearance => 'Aparência';

  @override
  String get language => 'Idioma';

  @override
  String get gameplay => 'Jogabilidade';

  @override
  String get supportUs => 'Apoie-nos';

  @override
  String get systemLegal => 'Sistema e Jurídico';

  @override
  String get games => 'Jogos';

  @override
  String get solvedToday => 'Resolvidos Hoje';

  @override
  String get searchGames => 'Buscar jogos...';

  @override
  String get readyToStart => 'PRONTO PARA O SEU TREINO CEREBRAL?';

  @override
  String get greatStart => 'BOM COMEÇO! MANTENHA O RITMO.';

  @override
  String get onFire => 'PEGANDO FOGO! SEU CÉREBRO ESTÁ ADORANDO.';

  @override
  String get incredible => 'INCRÍVEL! VOCÊ É UM MESTRE DOS PUZZLES.';

  @override
  String get noGamesMatch => 'NENHUM JOGO CORRESPONDE À SUA BUSCA';

  @override
  String get categoryAll => 'TODOS';

  @override
  String get categoryAttention => 'ATENÇÃO';

  @override
  String get categoryLogic => 'LÓGICA';

  @override
  String get categoryMath => 'MATEMÁTICA';

  @override
  String get categoryWord => 'PALAVRAS';

  @override
  String get categoryMemory => 'MEMÓRIA';

  @override
  String get categorySpatial => 'ESPACIAL';

  @override
  String get themeLight => 'CLARO';

  @override
  String get themeDark => 'ESCURO';

  @override
  String get themeSystem => 'SISTEMA';

  @override
  String get starOnGithub => 'Dar estrela no GitHub';

  @override
  String get sponsorOnGithub => 'Patrocinar no GitHub';

  @override
  String get privacyPolicy => 'Política de Privacidade';

  @override
  String get termsOfService => 'Termos de Serviço';

  @override
  String get licenses => 'Licenças';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return 'Você tem $maxTries tentativas para encontrar a palavra oculta de $wordLength letras.';
  }

  @override
  String wordFoundMessage(String word) {
    return 'Palavra encontrada com sucesso: $word';
  }

  @override
  String gameOverMessage(String word) {
    return 'A palavra era: $word';
  }

  @override
  String get gameOver => 'Fim de Jogo';

  @override
  String get crosswordTitle => 'Palavras Cruzadas';

  @override
  String get crosswordSubtitle =>
      'Complete a grade com as palavras corretas baseadas nas dicas.';

  @override
  String get wordSearchTitle => 'Caça-Palavras';

  @override
  String get radicalRootsTitle => 'Raízes Radicais';

  @override
  String get radicalRootsSubtitle =>
      'Encontre a raiz quadrada ou cúbica do número dado. Arredonde para o inteiro mais próximo se necessário.';

  @override
  String get radicalRootsGoalReached => 'Objetivo Atingido!';

  @override
  String get radicalRootsTimeUp => 'Tempo Esgotado!';

  @override
  String radicalRootsScoreMessage(int score) {
    return 'Você calculou $score raízes corretamente!';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return 'Continue praticando! Você calculou $score raízes.';
  }

  @override
  String get radicalRootsStart => 'Começar a Calcular';

  @override
  String get radicalRootsDescription =>
      'Você tem 60 segundos para resolver o máximo que puder.';

  @override
  String get radicalRootsBest => 'Melhor';

  @override
  String get radicalRootsSeconds => '60 SEGUNDOS';

  @override
  String get romanArithmeticTitle => 'Aritmética Romana';

  @override
  String get romanArithmeticSubtitle =>
      'Resolva problemas de adição e subtração usando números romanos.';

  @override
  String get romanArithmeticGoalReached => 'Nível Centurião!';

  @override
  String get romanArithmeticTimeUp => 'Tempo Esgotado!';

  @override
  String romanArithmeticScoreMessage(int score) {
    return 'Você resolveu $score problemas romanos!';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return 'Veni, Vidi, Vici! Você resolveu $score problemas.';
  }

  @override
  String get romanArithmeticStart => 'Começar Missão';

  @override
  String get romanArithmeticDescription =>
      'Converta e resolva. Você tem 60 segundos.';

  @override
  String get romanArithmeticBest => 'Melhor';

  @override
  String get romanArithmeticSeconds => '60 SEGUNDOS';

  @override
  String get wordSearchSubtitle =>
      'Encontre todas as palavras ocultas na grade. Arraste para selecionar.';

  @override
  String get missingVowelsTitle => 'Vogais Faltantes';

  @override
  String get missingVowelsSubtitle =>
      'Identifique a palavra com as vogais ocultas.';

  @override
  String get missingVowelsWin => 'Vogais Restauradas!';

  @override
  String get missingVowelsHowToPlay =>
      'Uma palavra é exibida com suas vogais (A, E, I, O, U) ocultas. Adivinhe a palavra completa!';

  @override
  String get wordScrambleTitle => 'Palavra Embaralhada';

  @override
  String get wordScrambleSubtitle =>
      'Toque nas letras para desembaraçar a palavra oculta!';

  @override
  String get wordScrambleWin => 'Palavra Revelada!';

  @override
  String get sudokuTitle => 'Sudoku';

  @override
  String get sudokuSubtitle =>
      'Complete a grade para que cada linha, coluna e bloco 3x3 contenha todos os dígitos de 1 a 9.';

  @override
  String get minesweeperTitle => 'Campo Minado';

  @override
  String get minesweeperSubtitle => 'Identifique todas as minas sem ativá-las.';

  @override
  String get minesweeperWin => 'Vitória!';

  @override
  String get minesweeperMines => 'MINAS';

  @override
  String get minesweeperStatus => 'STATUS';

  @override
  String get minesweeperWon => 'VENCEU';

  @override
  String get minesweeperBoom => 'BOOM';

  @override
  String get minesweeperPlaying => 'JOGANDO';

  @override
  String get minesweeperReveal => 'REVELAR';

  @override
  String get minesweeperFlag => 'BANDEIRA';

  @override
  String get game2048Title => '2048';

  @override
  String get game2048Subtitle =>
      'Deslize em qualquer direção para fundir os blocos e chegar ao bloco 2048!';

  @override
  String get nonogramTitle => 'Nonograma';

  @override
  String get nonogramSubtitle =>
      'Revele a imagem oculta usando pistas lógicas.';

  @override
  String get nonogramWin => 'Imagem Revelada!';

  @override
  String get magnetsTitle => 'ÍMÃS';

  @override
  String get magnetsSubtitle =>
      'Coloque ímãs na grade com base na contagem de polos.';

  @override
  String get magnetsHowToPlay =>
      'Preencha recipientes do tamanho de um dominó com ímãs \'+\' e \'-\' ou deixe-os em branco. As pistas de linha e coluna especificam o número total de cada polo naquela linha. Polos idênticos não podem ser adjacentes ortogonalmente.';

  @override
  String get magnetsWinTitle => 'POLARIDADE EQUILIBRADA!';

  @override
  String get magnetsWinMessage =>
      'Todos os ímãs estão perfeitamente organizados!';

  @override
  String get lighthousesTitle => 'FARÓIS';

  @override
  String get lighthousesSubtitle =>
      'Posicione navios com base nas pistas dos faróis.';

  @override
  String get lighthousesHowToPlay =>
      'Coloque navios 1x1 na grade. Os faróis indicam o número total de navios visíveis horizontal e verticalmente. Os navios não podem tocar nos faróis nem uns nos outros, nem mesmo diagonalmente.';

  @override
  String get lighthousesWinTitle => 'MAR SEGURO!';

  @override
  String get lighthousesWinMessage =>
      'Todos os faróis estão guiando os navios perfeitamente!';

  @override
  String get dominosaTitle => 'DOMINOSA';

  @override
  String get dominosaSubtitle =>
      'Encontre todos os dominós escondidos na grade.';

  @override
  String get dominosaHowToPlay =>
      'Organize um conjunto completo de dominós em uma grade de números de modo que cada par de números adjacentes seja coberto por exatamente um dominó. Cada par de números existe apenas uma vez no conjunto.';

  @override
  String get dominosaWinTitle => 'MESTRE DO DOMINÓ!';

  @override
  String get dominosaWinMessage =>
      'Todos os dominós foram encontrados e colocados!';

  @override
  String get skyscrapersTitle => 'ARRANHA-CÉUS';

  @override
  String get skyscrapersSubtitle =>
      'Preencha a grade with as alturas dos edifícios.';

  @override
  String get skyscrapersHowToPlay =>
      'Preencha a grade com alturas (1-N) de modo que cada linha e coluna contenha cada altura exatamente uma vez. Pistas nas bordas indicam quantos edifícios são visíveis daquela direção, com edifícios mais altos bloqueando os mais baixos.';

  @override
  String get skyscrapersWinTitle => 'SKYLINE RESTAURADO!';

  @override
  String get skyscrapersWinMessage =>
      'Todos os edifícios estão perfeitamente posicionados!';

  @override
  String get nurikabeTitle => 'NURIKABE';

  @override
  String get nurikabeSubtitle => 'Forme um mar conectado e separe as ilhas.';

  @override
  String get nurikabeHowToPlay =>
      'Sombreie as células para formar um único \'mar\' conectado (sem blocos 2x2). Células não sombreadas formam \'ilhas\', cada uma contendo exatamente un número que representa sua área total.';

  @override
  String get nurikabeWinTitle => 'MAR FLUINDO!';

  @override
  String get nurikabeWinMessage => 'Ilhas separadas, mar conectado!';

  @override
  String get fillominoTitle => 'FILLOMINO';

  @override
  String get fillominoSubtitle =>
      'Divida a grade em poliominós dos tamanhos especificados.';

  @override
  String get fillominoHowToPlay =>
      'Divida a grade em poliominós de modo que cada poliominó de tamanho N contenha o número N em todas as suas células. Poliominós do mesmo tamanho não podem ser adjacentes ortogonalmente.';

  @override
  String get fillominoWinTitle => 'GRADE DIVIDIDA!';

  @override
  String get fillominoWinMessage => 'Perfeitamente ladrilhado com lógica!';

  @override
  String get hitoriTitle => 'HITORI';

  @override
  String get hitoriSubtitle =>
      'Sombreie os números duplicados em cada linha e coluna.';

  @override
  String get hitoriHowToPlay =>
      'Sombreie as células para que nenhum número apareça mais de uma vez em qualquer linha ou coluna. Células sombreadas não podem ser adjacentes (ortogonalmente), e todas as células não sombreadas devem formar um único grupo conectado.';

  @override
  String get hitoriWinTitle => 'MESTRE HITORI!';

  @override
  String get hitoriWinMessage =>
      'Você resolveu com sucesso todos os duplicados!';

  @override
  String get pathFinderTitle => 'Buscador de Caminho';

  @override
  String get pathFinderSubtitle => 'Encontre o caminho oculto de S a E.';

  @override
  String get pathFinderWin => 'Caminho Dominado!';

  @override
  String get howToPlay => 'Como Jogar';

  @override
  String get gotIt => 'Entendi';

  @override
  String get akariTitle => 'Akari';

  @override
  String get akariSubtitle => 'Ilumine todas as células brancas';

  @override
  String get akariHowToPlay =>
      'Coloque lâmpadas nas células brancas para iluminar toda a grade. As lâmpadas iluminam sua linha e coluna até atingirem uma parede. Duas lâmpadas não podem iluminar uma à outra. Paredes numeradas mostram exatamente quantas lâmpadas devem ser colocadas em células adjacentes.';

  @override
  String get akariWinTitle => 'LUZES ACESAS!';

  @override
  String get akariWinMessage => 'Tudo está perfeitamente iluminado.';

  @override
  String get arithmeticChainTitle => 'Cálculo em Cadeia';

  @override
  String get arithmeticChainSubtitle => 'Calcule o total acumulado na cabeça';

  @override
  String get arithmeticChainWinTitle => 'NÍVEL CONCLUÍDO!';

  @override
  String get arithmeticChainWinMessage => 'Seu cálculo mental está afiado!';

  @override
  String get arithmeticChainLoseTitle => 'TENTE NOVAMENTE';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return 'A resposta correta era $answer.';
  }

  @override
  String get arithmeticChainStart => 'INICIAR';

  @override
  String get arithmeticChainNext => 'PRÓXIMO';

  @override
  String get attentionalBlinkTitle => 'Piscada Atencional';

  @override
  String get attentionalBlinkSubtitleWatch => 'OBSERVE OS NÚMEROS';

  @override
  String get attentionalBlinkSubtitleInput =>
      'INSIRA OS DOIS NÚMEROS QUE VOCÊ VIU';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return 'Você acertou $score alvos!';
  }

  @override
  String get balanceScaleTitle => 'BALANÇA';

  @override
  String get balanceScaleSubtitle =>
      'Deduzi o peso do último item com base nas balanças.';

  @override
  String get balanceScaleWinTitle => 'EQUILIBRADO!';

  @override
  String get balanceScaleWinMessage => 'Você deduziu o peso corretamente!';

  @override
  String get balanceScaleLoseTitle => 'DESEQUILIBRADO';

  @override
  String get balanceScaleLoseMessage =>
      'Tente novamente para encontrar o equilíbrio correto.';

  @override
  String get balanceScaleBack => 'VOLTAR';

  @override
  String get balanceScaleSubmit => 'ENVIAR';

  @override
  String get binaryPuzzleTitle => 'PUZZLE BINÁRIO';

  @override
  String get binaryPuzzleSubtitle =>
      'Preencha com 0 e 1. No máximo dois dígitos iguais adjacentes. Quantidade igual de 0s e 1s em cada linha e coluna.';

  @override
  String get binaryPuzzleWinTitle => 'BEM FEITO';

  @override
  String get binaryPuzzleWinMessage =>
      'Você resolveu o puzzle binário com lógica perfeita!';

  @override
  String get blockEscapeTitle => 'BLOCK ESCAPE';

  @override
  String get blockEscapeSubtitle =>
      'Deslize os blocos para abrir caminho para o bloco principal chegar à saída.';

  @override
  String get blockEscapeWinTitle => 'ESCAPE!';

  @override
  String get blockEscapeWinMessage =>
      'Você conseguiu abrir o caminho para o bloco principal!';

  @override
  String get boxCompletionTitle => 'Conclusão de Cubo';

  @override
  String get boxCompletionSubtitle => 'Qual cubo pode ser formado?';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return 'Você acertou $score de $totalTrials!';
  }

  @override
  String get boxCompletionOptions => 'OPÇÕES';

  @override
  String get bridgesTitle => 'PONTES';

  @override
  String get bridgesSubtitle =>
      'Conecte as ilhas com pontes. Cada ilha precisa de um número específico de pontes. Pontes não podem se cruzar.';

  @override
  String get bridgesWinTitle => 'CONECTADO!';

  @override
  String get bridgesWinMessage => 'Você conectou todas as ilhas com sucesso!';

  @override
  String get calculationSprintTitle => 'SPRINT DE CÁLCULO';

  @override
  String get calculationSprintSubtitle =>
      'Resolva o máximo de equações possível em 60 segundos.';

  @override
  String get calculationSprintGoalReached => 'OBJETIVO ATINGIDO!';

  @override
  String get calculationSprintTimeUp => 'TEMPO ESGOTADO';

  @override
  String calculationSprintScoreMessage(int score) {
    return 'Excelente velocidade de cálculo! Você marcou $score pontos.';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return 'Você marcou $score pontos. Tente bater seu recorde!';
  }

  @override
  String get calculationSprintBest => 'MELHOR';

  @override
  String get calculationSprintSeconds => '60 SEGUNDOS';

  @override
  String get calculationSprintDescription =>
      'Resolva equações rapidamente.\nRespostas erradas deduzem 3 segundos!';

  @override
  String get calculationSprintStart => 'INICIAR SPRINT';

  @override
  String get categoryFluencyTitle => 'Fluidez por Categoria';

  @override
  String get categoryFluencySubtitle =>
      'Insira itens que pertencem à categoria';

  @override
  String get categoryFluencyExpert => 'ESPECIALISTA EM FLUIDEZ!';

  @override
  String get categoryFluencyTimeUp => 'TEMPO ESGOTADO!';

  @override
  String get categoryFluencyWinMessage => 'Você tem um vocabulário vasto!';

  @override
  String categoryFluencyFoundMessage(int count) {
    return 'Você encontrou $count palavras.';
  }

  @override
  String get categoryFluencyCategoryLabel => 'Categoria:';

  @override
  String get categoryFluencyEnterItem => 'Insira um item...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target palavras';
  }

  @override
  String get changeBlindnessTitle => 'Cegueira de Mudança';

  @override
  String get changeBlindnessSubtitle => 'ENCONTRE O ITEM QUE MUDA';

  @override
  String changeBlindnessScore(int score) {
    return 'PONTOS: $score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return 'Você encontrou $score mudanças!';
  }

  @override
  String get choiceRtTitle => 'TR de Escolha';

  @override
  String get choiceRtSubtitle =>
      'Toque no quadrado ativo o mais rápido que puder';

  @override
  String choiceRtAvgMessage(String avg) {
    return 'Seu tempo de reação médio: ${avg}ms';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return 'Tempo Restante: ${time}s';
  }

  @override
  String choiceRtTaps(int count) {
    return 'Toques: $count';
  }

  @override
  String get colorFloodTitle => 'Inundação de Cores';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return 'Movimentos: $moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => 'INUNDAÇÃO CONCLUÍDA!';

  @override
  String get colorFloodDryLand => 'TERRA SECA...';

  @override
  String get colorFloodWinMessage => 'Você saturou toda a grade com cores!';

  @override
  String get colorFloodLoseMessage =>
      'Acabaram seus movimentos. Tente novamente!';

  @override
  String get colorMatchTitle => 'COMBINAÇÃO DE CORES';

  @override
  String get colorMatchSubtitle =>
      'Ajuste os controles para corresponder à cor alvo o mais fielmente possível.';

  @override
  String get colorMatchTarget => 'ALVO';

  @override
  String get colorMatchYours => 'A SUA';

  @override
  String get colorMatchCheck => 'VERIFICAR';

  @override
  String get colorMatchResult => 'RESULTADO';

  @override
  String colorMatchAccuracy(String accuracy) {
    return 'Sua precisão: $accuracy%';
  }

  @override
  String get corsiBlocksTitle => 'BLOCOS DE CORSI';

  @override
  String get corsiBlocksSubtitle =>
      'Observe os blocos acenderem e toque neles na mesma ordem.';

  @override
  String get corsiBlocksWinTitle => 'MESTRE ESPACIAL!';

  @override
  String get corsiBlocksLoseTitle => 'PERDIDO NO ESPAÇO';

  @override
  String corsiBlocksMessage(int score, int span) {
    return 'Você lembrou $score sequências! Sua amplitude de memória espacial atingiu $span.';
  }

  @override
  String get corsiBlocksWatch => 'OBSERVE O PADRÃO';

  @override
  String get corsiBlocksRepeat => 'REPITA O PADRÃO';

  @override
  String get corsiBlocksExcellent => 'EXCELENTE!';

  @override
  String get corsiBlocksSpan => 'AMPLITUDE';

  @override
  String get crownTitle => 'COROA';

  @override
  String get crownSubtitle =>
      'Coloque uma coroa em cada linha, coluna e região de cor. Coroas não podem ser adjacentes, nem mesmo na diagonal.';

  @override
  String get crownCrowned => 'COROADO!';

  @override
  String get crownSuccess =>
      'Todas as coroas foram colocadas com sucesso com lógica perfeita.';

  @override
  String get cryptogramTitle => 'CRIPTOGRAMA';

  @override
  String get cryptogramSubtitle =>
      'Atribua letras para decodificar a mensagem secreta! Cada letra codificada representa uma letra real.';

  @override
  String get cryptogramBroken => 'CÓDIGO QUEBRADO!';

  @override
  String get cryptogramEncrypted => 'CRIPTOGRAFADO';

  @override
  String get cryptogramSuccess => 'Você decodificou a mensagem perfeitamente.';

  @override
  String get cryptogramTryAgain =>
      'Tente novamente para quebrar a criptografia.';

  @override
  String get digitSpanReverseTitle => 'Memória Inversa';

  @override
  String get digitSpanReverseSubtitleMemorize => 'Memorize os dígitos';

  @override
  String get digitSpanReverseSubtitleEnter =>
      'Insira os dígitos na ordem INVERSA';

  @override
  String get digitSpanReverseWinTitle => 'NÍVEL CONCLUÍDO!';

  @override
  String get digitSpanReverseWinMessage =>
      'Sua memória de trabalho é impressionante!';

  @override
  String get digitSpanReverseLoseTitle => 'TENTE NOVAMENTE';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return 'A sequência inversa correta era $sequence.';
  }

  @override
  String get dividedAttentionTitle => 'Atenção Dividida';

  @override
  String get dividedAttentionSubtitle =>
      'Toque ESQUERDA para ESTRELA ⭐ | Toque DIREITA para VERMELHO 🔴';

  @override
  String get dividedAttentionGameOverTitle => 'FOCO PERDIDO';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return 'Multitarefa é difícil! Sua pontuação foi $score.';
  }

  @override
  String dividedAttentionScore(int score) {
    return 'PONTOS: $score';
  }

  @override
  String get doubleNBackTitle => 'Double N-Back';

  @override
  String doubleNBackSubtitle(int n) {
    return 'Corresponda os estímulos $n passos atrás';
  }

  @override
  String get doubleNBackGameOverTitle => 'FIM DE JOGO';

  @override
  String doubleNBackGameOverMessage(int score) {
    return 'Você marcou $score pontos no Double N-Back!';
  }

  @override
  String doubleNBackScore(int score) {
    return 'Pontos: $score';
  }

  @override
  String get doubleNBackPositionMatch => 'ALINHAMENTO DE POSIÇÃO';

  @override
  String get doubleNBackLetterMatch => 'ALINHAMENTO DE LETRA';

  @override
  String get faceNameAssociationTitle => 'Rosto-Nome';

  @override
  String get faceNameAssociationSubtitleStudy =>
      'Memorize o nome para cada rosto';

  @override
  String get faceNameAssociationSubtitleTest => 'Quem é este?';

  @override
  String get faceNameAssociationPerfect => 'PERFEITO!';

  @override
  String get faceNameAssociationGameOver => 'FIM DE JOGO';

  @override
  String get faceNameAssociationWinMessage =>
      'Você tem uma ótima memória para rostos e nomes!';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return 'Você acertou $correct de $total.';
  }

  @override
  String get faceNameAssociationStartTest => 'INICIAR TESTE';

  @override
  String get flankerTestWinTitle => 'FOCO LASER!';

  @override
  String get flankerTestLoseTitle => 'DISTRAÍDO';

  @override
  String flankerTestScoreMessage(int score) {
    return 'Você acertou $score corretamente!';
  }

  @override
  String get flankerTestTitle => 'TESTE DE FLANKER';

  @override
  String get flankerTestSubtitle =>
      'Indique a direção da seta central, ignorando as setas laterais.';

  @override
  String get flankerTestLeft => 'ESQUERDA';

  @override
  String get flankerTestRight => 'DIREITA';

  @override
  String get fractionMatchTitle => 'Combinação de Frações';

  @override
  String get fractionMatchSubtitle => 'Combine o visual com sua fração';

  @override
  String get fractionMatchLoseTitle => 'FRAÇÃO INCORRETA';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return 'A resposta correta era $correctAnswer.';
  }

  @override
  String get goNoGoTitle => 'Go / No-Go';

  @override
  String get goNoGoSubtitle => 'Toque para Verde, IGNORE o Vermelho!';

  @override
  String get goNoGoLoseTitle => 'REAÇÃO PARADA';

  @override
  String get goNoGoLoseMessage => 'Seu controle inibitório está sendo testado!';

  @override
  String get goNoGoTapAnywhere => 'TOQUE EM QUALQUER LUGAR PARA CONTINUAR';

  @override
  String get groceryListTitle => 'Lista de Compras';

  @override
  String get groceryListSubtitleMemorize =>
      'Memorize os itens e suas categorias';

  @override
  String get groceryListSubtitleTest => 'A qual categoria este item pertencia?';

  @override
  String get groceryListWinTitle => 'GURU DAS COMPRAS!';

  @override
  String get groceryListLoseTitle => 'ESQUECEU ALGO?';

  @override
  String groceryListScoreMessage(int score) {
    return 'Você marcou $score pontos na Lista de Compras!';
  }

  @override
  String get groceryListReady => 'ESTOU PRONTO';

  @override
  String get groceryListWhereBelong => 'ONDE ISSO PERTENCE?';

  @override
  String get hueSortTitle => 'ORDENAÇÃO DE CORES';

  @override
  String get hueSortSubtitle =>
      'Troque os blocos para criar uma transição suave entre as cores dos cantos. Pontos indicam blocos fixos.';

  @override
  String get hueSortWinTitle => 'GRADIENTE PERFEITO!';

  @override
  String get hueSortWinMessage =>
      'Você ordenou o espectro de cores perfeitamente!';

  @override
  String hueSortWrongTiles(int count) {
    return 'Blocos na posição errada: $count';
  }

  @override
  String get kenkenTitle => 'KenKen';

  @override
  String get kenkenWinTitle => 'GÊNIO!';

  @override
  String get kenkenLoseTitle => 'FIM DE JOGO';

  @override
  String get kenkenWinMessage => 'Você resolveu o puzzle KenKen!';

  @override
  String get kenkenLoseMessage =>
      'Verifique as regras de linha/coluna e das gaiolas.';

  @override
  String kenkenSubtitle(int size) {
    return 'Preencha 1-$size sem repetir nas linhas/colunas';
  }

  @override
  String get letterCancellationTitle => 'Cancelamento de Letras';

  @override
  String get letterCancellationTitleFull => 'Teste de Cancelamento de Letras';

  @override
  String letterCancellationScoreMessage(int score) {
    return 'Você encontrou $score letras!';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return 'Encontre todas as letras \"$target\"';
  }

  @override
  String get letterCancellationFound => 'ENCONTRADO';

  @override
  String get letterCancellationTime => 'TEMPO';

  @override
  String get lightsOutTitle => 'LIGHTS OUT';

  @override
  String get lightsOutSubtitle =>
      'Tocar em um bloco inverte o seu estado e o dos vizinhos. Apague todas as luzes.';

  @override
  String get lightsOutWinTitle => 'PUZZLE RESOLVIDO!';

  @override
  String get lightsOutWinMessage => 'Você apagou todas as luzes com sucesso!';

  @override
  String get symmetryTitle => 'Simetria';

  @override
  String get symmetrySubtitle =>
      'Espelhe o padrão da esquerda na grade vazia da direita.';

  @override
  String get semanticLinkTitle => 'Link Semântico';

  @override
  String get semanticLinkSubtitle => 'Encontre a palavra que conecta as três';

  @override
  String get reflexTapTitle => 'Toque de Reflexo';

  @override
  String get visualStatisticalLearningTitle => 'Aprendizado Visual';

  @override
  String get orbitTapTitle => 'Toque Orbital';

  @override
  String get orbitTapSubtitle =>
      'Toque quando as bolas se alinharem com o portão';

  @override
  String get schulteTableTitle => 'Tabela de Schulte';

  @override
  String get multipleObjectTrackingTitle => 'Rastreador de Objetos';

  @override
  String get multipleObjectTrackingSubtitle =>
      'Observe os objetos destacados. Acompanhe-os enquanto se movem e selecione-os.';

  @override
  String get sdmtTitle => 'Teste SDMT';

  @override
  String get sdmtSubtitle =>
      'Use a chave acima para encontrar o dígito do símbolo mostrado.';

  @override
  String get memoryMatrixTitle => 'Matriz de Memória';

  @override
  String get memoryMatrixSubtitle => 'Memorize o padrão e toque nos blocos.';

  @override
  String get mentalAbacusTitle => 'Ábaco Mental';

  @override
  String get mentalAbacusSubtitle => 'Resolva usando o Soroban';

  @override
  String get spellingSprintTitle => 'Sprint de Ortografia';

  @override
  String get spellingSprintSubtitle =>
      'Corra contra o relógio para soletrar o máximo de palavras que puder.';

  @override
  String get stopSignalTitle => 'Sinal de Pare';

  @override
  String get stopSignalSubtitle =>
      'Toque na direção da seta, mas PARE imediatamente se a seta ficar VERMELHA.';

  @override
  String get staircaseMemoryTitle => 'Memória em Escada';

  @override
  String get vigilanceTaskTitle => 'Tarefa de Vigilância';

  @override
  String get vigilanceTaskSubtitle =>
      'Toque no botão quando o ponteiro pular uma posição';

  @override
  String get logicalSyllogismsTitle => 'Silogismos Lógicos';

  @override
  String get logicalSyllogismsSubtitle => 'A conclusão é logicamente válida?';

  @override
  String get mathPathTitle => 'Caminho Matemático';

  @override
  String get mathPathSubtitle =>
      'Encontre um caminho que some exatamente o valor alvo.';

  @override
  String get sternbergTaskTitle => 'Tarefa de Sternberg';

  @override
  String get sternbergTaskMemorize => 'Memorize as letras';

  @override
  String get sternbergTaskWasLetterSet => 'Esta letra estava no conjunto?';

  @override
  String sternbergTaskScore(int score) {
    return 'Você marcou $score pontos na Tarefa de Sternberg!';
  }

  @override
  String get verbalAnalogiesTitle => 'Mestre de Analogias!';

  @override
  String get verbalAnalogiesSubtitle => 'Complete a relação';

  @override
  String get typingSpeedTitle => 'Velocidade de Digitação';

  @override
  String get typingSpeedSubtitle =>
      'Digite a frase exatamente como mostrado o mais rápido que puder!';

  @override
  String get wordLadderTitle => 'Escada de Palavras';

  @override
  String get wordLadderSubtitle =>
      'Conecte as palavras mudando uma letra por vez.';

  @override
  String get tangleFixTitle => 'Desembaraçado!';

  @override
  String get tangleFixSubtitle =>
      'Desembarace as linhas para que nenhuma se cruze';

  @override
  String get oddRotationTitle => 'Rotação Diferente';

  @override
  String get oddRotationSubtitle =>
      'Um destes está espelhado. Consegue encontrá-lo?';

  @override
  String get towerOfLondonTitle => 'Torre de Londres';

  @override
  String get towerOfLondonSubtitle => 'Combine a configuração alvo';

  @override
  String get symbolicFlankerTitle => 'Flanker Simbólico';

  @override
  String get symbolicFlankerSubtitle => 'Concentre-se no símbolo central';

  @override
  String get stroopTestTitle => 'Teste de Stroop';

  @override
  String get stroopTestSubtitle =>
      'Identifique a cor da tinta da palavra. Ignore o que a palavra diz!';

  @override
  String get wisconsinCardSortingTitle => 'Classificação de Cartas Wisconsin';

  @override
  String get wisconsinCardSortingSubtitle =>
      'COMBINE A CARTA COM UMA DAS QUATRO ACIMA';

  @override
  String get nBackTitle => 'Teste N-Back';

  @override
  String get nBackSubtitle =>
      'Toque em COMBINAR se a letra atual for a mesma de 2 passos atrás.';

  @override
  String get rhythmMasterTitle => 'Mestre do Ritmo';

  @override
  String get rhythmMasterSubtitle => 'Toque em sincronia com o pulso';

  @override
  String get pixelMimicTitle => 'Pixel Mimic';

  @override
  String get targetNumberTitle => 'Alvo 24';

  @override
  String targetNumberSubtitle(int target) {
    return 'Use os 4 números para chegar em $target';
  }

  @override
  String get mirrorTracingTitle => 'Traçado Perfeito!';

  @override
  String get mirrorTracingSubtitle =>
      'Trace a estrela! Os controles estão ESPELHADOS.';

  @override
  String get wordSurgeTitle => 'Word Surge';

  @override
  String get wordSurgeSubtitle => 'Sinônimos e Antônimos';

  @override
  String get perspectiveTakingTitle => 'Tomada de Perspectiva';

  @override
  String get perspectiveTakingTopDownView => 'VISTA SUPERIOR';

  @override
  String get perspectiveTakingChoosePerspective => 'ESCOLHA A PERSPECTIVA';

  @override
  String get perspectiveTakingCongrats =>
      'Você tem um olhar aguçado para relações espaciais.';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return 'Qual vista é a partir do $targetDirName?';
  }

  @override
  String get paperFoldingTitle => 'Dobra de Papel';

  @override
  String get paperFoldingSubtitle => 'Como ficará quando desdobrado?';

  @override
  String get waterSortTitle => 'Ordenação de Água';

  @override
  String get waterSortSubtitle =>
      'Ordene as cores para que cada tubo contenha apenas uma cor.';

  @override
  String get numericalEstimationTitle => 'Estimativa Numérica';

  @override
  String get numericalEstimationSubtitle =>
      'Escolha a resposta mais próxima rapidamente!';

  @override
  String get lockPatternTitle => 'Padrão de Bloqueio';

  @override
  String get lockPatternSubtitle =>
      'Encontre o padrão secreto. Cada tentativa dá feedback sobre posições e pontos.';

  @override
  String get primeHunterTitle => 'Caçador de Primos';

  @override
  String get primeHunterSubtitle =>
      'Deslize para a ESQUERDA para PRIMO | DIREITA para COMPOSTO';

  @override
  String get tracePathTitle => 'Trace Path';

  @override
  String get tracePathSubtitle =>
      'Siga o caminho alvo o mais fielmente possível';

  @override
  String get ruleSwitcherTitle => 'Rule Switcher';

  @override
  String get ruleSwitcherSubtitle => 'Aplique a regra atual';

  @override
  String get choiceReactionTimeTitle => 'Tempo de Reação de Escolha';

  @override
  String get pathRecallTitle => 'Recordação de Caminho';

  @override
  String get switchTaskTitle => 'Troca de Tarefa';

  @override
  String get switchTaskSubtitle =>
      'Preste atenção na regra! Ela mudará entre combinar a forma e combinar a cor.';

  @override
  String get mentalRotationTitle => 'Rotação Mental';

  @override
  String get mentalRotationSubtitle =>
      'Estas formas são iguais, apenas rotacionadas?';

  @override
  String get missingOperatorTitle => 'Mix de Operadores';

  @override
  String get missingOperatorSubtitle =>
      'Preencha as lacunas para completar a equação';

  @override
  String get wordMastermindTitle => 'Palavra Mastermind';

  @override
  String get wordMastermindSubtitle =>
      'Decifre o código de 4 letras! Touros (B) são posições certas, Vacas (C) são posições erradas.';

  @override
  String get simonSequenceTitle => 'Sequência';

  @override
  String get symbolLogicTitle => 'Lógica de Símbolos';

  @override
  String get symbolLogicSubtitle =>
      'Resolva as equações visuais para encontrar o valor de cada símbolo. Qual o resultado?';

  @override
  String get silhouetteMatchTitle => 'Combinação de Silhueta';

  @override
  String get silhouetteMatchSubtitle =>
      'Qual silhueta corresponde a este objeto?';

  @override
  String get operationSpanTitle => 'Operation Span';

  @override
  String get operationSpanMathPhase => 'A equação está correta?';

  @override
  String get operationSpanLetterPhase => 'Lembre-se da letra';

  @override
  String get operationSpanRecallPhase => 'Recorde as letras em ordem';

  @override
  String get operationSpanRoundComplete => 'Rodada Concluída!';

  @override
  String operationSpanScore(int score) {
    return 'Você marcou $score pontos no Operation Span!';
  }

  @override
  String get slidePuzzleTitle => 'Slide Puzzle';

  @override
  String get slidePuzzleNewGame => 'NOVO JOGO';

  @override
  String get slidePuzzleInstructions =>
      'Reorganize os blocos em ordem numérica deslizando-os para o espaço vazio.';

  @override
  String get slidePuzzleTileSlider => 'DESLIZADOR DE BLOCOS';

  @override
  String get slidePuzzleCongrats => 'Você ordenou todos os blocos com sucesso.';

  @override
  String get visualSearchTitle => 'Busca Visual';

  @override
  String get visualSearchSubtitle => 'Encontre o símbolo único na grade';

  @override
  String get trailMakingTitle => 'Trilha Numérica';

  @override
  String get trailMakingSubtitle =>
      'Conecte os números em ordem (1 -> 2 -> 3...) o mais rápido que puder.';

  @override
  String get matrixReasoningTitle => 'Raciocínio de Matriz';

  @override
  String get matrixReasoningSubtitle => 'Complete o padrão na grade 3x3';

  @override
  String get tentsAndTreesTitle => 'Tendas e Árvores';

  @override
  String get tentsAndTreesSubtitle =>
      'Coloque tendas ao lado das árvores. Números indicam quantas tendas há em cada linha/coluna. Tendas não podem se tocar.';

  @override
  String get quickMathTitle => 'Matemática Rápida';

  @override
  String get magicSquaresTitle => 'Quadrado Mágico';

  @override
  String magicSquaresSubtitle(int targetSum) {
    return 'Cada linha, coluna e diagonal deve somar $targetSum';
  }

  @override
  String get objectShuffleTitle => 'Embaralhamento de Objetos';

  @override
  String get pipesTitle => 'Canos';

  @override
  String get pipesSubtitle => 'Conecte os pontos da mesma cor com canos.';

  @override
  String get oddOneOutTitle => 'O Intruso';

  @override
  String get oddOneOutSubtitle => 'Encontre o bloco com uma cor diferente.';

  @override
  String get einsteinRiddleTitle => 'ENIGMA DE EINSTEIN';

  @override
  String get einsteinRiddleSubtitle =>
      'Use as pistas para deduzir os atributos de cada casa.';

  @override
  String get einsteinRiddleHowToPlay =>
      'Cada casa tem atributos únicos (cor, nacionalidade, animal, etc.). Use as pistas para preencher a grade e encontrar a solução.';

  @override
  String get einsteinRiddleColor => 'Cor';

  @override
  String get einsteinRiddleNationality => 'Nacionalidade';

  @override
  String get einsteinRiddleDrink => 'Bebida';

  @override
  String get einsteinRiddlePet => 'Animal de estimação';

  @override
  String get einsteinRiddleSmoke => 'Fumo';

  @override
  String get einsteinRiddleHouse => 'Casa';

  @override
  String get mirrorImageTitle => 'Imagem Espelhada';

  @override
  String get mirrorImageSubtitle => 'Identifique o reflexo correto no espelho.';

  @override
  String get mirrorImageHowToPlay =>
      'Olhe para a forma e escolha o seu reflexo correto no espelho entre as opções fornecidas.';

  @override
  String get mentalMappingTitle => 'Mapeamento Mental';

  @override
  String get mentalMappingSubtitle => 'Siga as direções e encontre o destino.';

  @override
  String get mentalMappingHowToPlay =>
      'Uma sequência de direções será mostrada (Norte, Sul, Leste, Oeste). Siga mentalmente estes passos a partir do centro da grade e selecione o destino final.';

  @override
  String get memoryPalaceTitle => 'Palácio da Memória';

  @override
  String get memoryPalaceSubtitle =>
      'Lembre-se de qual palavra estava em cada local.';

  @override
  String get memoryPalaceHowToPlay =>
      'Um conjunto de palavras aparecerá em diferentes locais de uma grade. Memorize suas posições e coloque-as de volta depois.';

  @override
  String get countingSheepTitle => 'Contando Ovelhas';

  @override
  String get countingSheepSubtitle => 'Quantas ovelhas você viu?';

  @override
  String get countingSheepHowToPlay =>
      'Ovelhas correrão pela tela rapidamente. Conte-as e insira o número total no final.';

  @override
  String get faceTraitAssociationTitle => 'Rosto-Traço';

  @override
  String get faceTraitAssociationSubtitle => 'Memorize os traços de cada rosto';

  @override
  String get faceTraitAssociationHowToPlay =>
      'Serão mostrados rostos com nome, profissão e hobby. Memorize estas associações para recordar depois.';

  @override
  String get mentalCalendarTitle => 'Calendário Mental';

  @override
  String get mentalCalendarSubtitle => 'Calcule o dia da semana';

  @override
  String get mentalCalendarHowToPlay =>
      'Uma data aleatória será exibida. Use o cálculo mental para determinar em qual dia da semana ela cai.';

  @override
  String get vocabularyBuilderTitle => 'Vocabulário';

  @override
  String get vocabularyBuilderSubtitle =>
      'Combine sinônimos e antônimos sob pressão de tempo.';

  @override
  String get vocabularyBuilderHowToPlay =>
      'Uma palavra alvo e uma relação (Sinônimo ou Antônimo) serão mostradas. Escolha a palavra correta rapidamente.';

  @override
  String get correct => 'CORRETO';

  @override
  String get incorrect => 'INCORRETO';

  @override
  String get grammarPoliceTitle => 'Polícia Gramatical';

  @override
  String get grammarPoliceSubtitle =>
      'Identifique se a frase está gramaticalmente correta ou se contém erros.';

  @override
  String get grammarPoliceHowToPlay =>
      'Uma frase aparecerá no centro do ecrã. Decida se está gramaticalmente correta ou se contém um erro. Toque em \'CORRETO\' se estiver tudo bem, ou em \'INCORRETO\' se detetar um erro. Não perca todas as suas vidas!';

  @override
  String get reverseStroopTitle => 'Stroop Reverso';

  @override
  String get reverseStroopSubtitle =>
      'Uma variação do teste de Stroop onde o foco é invertido.';

  @override
  String get reverseStroopHowToPlay =>
      'Preste atenção na instrução! Se disser \'TEXTO\', combine com o significado. Se disser \'COR\', combine com a cor da tinta.';

  @override
  String get game2048Instruction => 'DESLIZE PARA FUNDIR';

  @override
  String get fibonacciMergeTitle => 'Fusão de Fibonacci';

  @override
  String get fibonacciMergeSubtitle =>
      'Mescle números consecutivos de Fibonacci (1, 1, 2, 3, 5, 8, 13...).';

  @override
  String get sequenceSleuthTitle => 'Detetive de Sequência';

  @override
  String get sequenceSleuthSubtitle =>
      'Encontre o número que falta na sequência matemática.';

  @override
  String get divisibilityDashTitle => 'Corrida da Divisibilidade';

  @override
  String get divisibilityDashSubtitle =>
      'Toque em todos os divisores de um único dígito (2-9) para o número dado.';

  @override
  String get percentagePeakTitle => 'Pico de Porcentagem';

  @override
  String get percentagePeakSubtitle =>
      'Resolva cálculos mentais de porcentagem rapidamente.';

  @override
  String get vennNumbersTitle => 'Números de Venn';

  @override
  String get vennNumbersSubtitle =>
      'Categorize os números nas regiões corretas do diagrama de Venn.';

  @override
  String get commonDenominatorTitle => 'Denominador Comum';

  @override
  String get commonDenominatorSubtitle =>
      'Encontre o Máximo Divisor Comum ou o Mínimo Múltiplo Comum.';

  @override
  String get angleFinderTitle => 'Buscador de Ângulos';

  @override
  String get angleFinderSubtitle =>
      'Calcule o ângulo que falta no problema geométrico.';

  @override
  String get sumSnakeTitle => 'Cobra da Soma';

  @override
  String get sumSnakeSubtitle =>
      'Conecte números adjacentes para atingir a soma alvo.';

  @override
  String get baseShiftTitle => 'BLITZ DE MUDANÇA DE BASE';

  @override
  String get baseShiftSubtitle => 'Resolva em decimal';

  @override
  String get baseShiftDescription =>
      'Resolva a equação e digite a resposta em decimal (Base 10).';

  @override
  String get baseShiftEquation => 'EQUAÇÃO';

  @override
  String get baseShiftHint => 'Digite o resultado decimal...';

  @override
  String get baseShiftCorrect => 'Correto!';

  @override
  String get baseShiftIncorrect => 'Incorreto!';

  @override
  String get baseShiftSubmit => 'ENVIAR';

  @override
  String get baseShiftQuickGuide => 'Guia Rápido:';

  @override
  String get baseShiftBinary => 'Binário (bin): Base 2 (0, 1)';

  @override
  String get baseShiftHex => 'Hexadecimal (0x): Base 16 (0-9, A-F)';

  @override
  String get baseShiftDecimal => 'Decimal (dec): Base 10 (0-9)';

  @override
  String get baseShiftWinTitle => 'MAGO DA MATEMÁTICA!';

  @override
  String get baseShiftWinMessage =>
      'Você resolveu corretamente 5 equações de mudança de base!';

  @override
  String get blockCount3DTitle => 'Contagem de Blocos 3D';

  @override
  String get blockCount3DSubtitle =>
      'ARRASTE PARA GIRAR • CONTE OS BLOCOS OCULTOS';

  @override
  String get blockCount3DHowMany => 'QUANTOS BLOCOS?';

  @override
  String get blockCount3DSubmitGuess => 'ENVIAR PALPITE';

  @override
  String get blockCount3DNotQuite =>
      'Quase! Tente girar para contar novamente.';

  @override
  String get blockCount3DExcellent => 'EXCELENTE';

  @override
  String blockCount3DWinMessage(int count) {
    return 'Você identificou corretamente todos os $count blocos!';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '1. Arraste o dedo pela visualização 3D para girar a pilha de blocos.\n\n2. Conte todos os blocos na pilha.\n\n3. Lembre-se: um bloco no ar deve ter blocos de suporte estrutural por baixo (blocos ocultos!).\n\n4. Digite sua resposta no campo de entrada e toque em \"ENVIAR PALPITE\" para verificar.';

  @override
  String get alphabetSudokuTitle => 'SUDOKU DE ALFABETO';

  @override
  String get alphabetSudokuSubtitle =>
      'Preencha a grade para que cada linha, coluna e bloco contenha as letras A-I.';

  @override
  String get alphabetSudokuWinTitle => 'SUDOKU RESOLVIDO!';

  @override
  String get alphabetSudokuWinMessage => 'Brilhante! Você dominou as letras.';

  @override
  String get classicMazeTitle => 'Labirinto Clássico';

  @override
  String get classicMazeSubtitle =>
      'EXPLORE E RESOLVA • UM NOVO LABIRINTO A CADA JOGO';

  @override
  String get classicMazeWinTitle => 'LABIRINTO CONCLUÍDO';

  @override
  String classicMazeWinMessage(int count) {
    return 'Navegação incrível! Você resolveu o labirinto em $count movimentos.';
  }

  @override
  String get classicMazeMoves => 'MOVIMENTOS: ';

  @override
  String get classicMazeHowToPlayDescription =>
      '1. Guie a esfera amarela brilhante (jogador) até o portal verde (saída) no canto inferior direito.\n\n2. Use deslizes em qualquer lugar do labirinto, as setas do teclado físico ou os botões de seta na parte inferior para se mover.\n\n3. O rastro roxo mostra o caminho que você explorou. Volte pelo seu rastro para apagá-lo dinamicamente!\n\n4. Alterne as dificuldades na barra de ação superior para se desafiar com labirintos maiores!';

  @override
  String get conjunctionSearchTitle => 'Busca de Conjunção';

  @override
  String get conjunctionSearchSubtitle =>
      'Foco Atencional e Conjunção de Características';

  @override
  String get conjunctionSearchWinTitle => 'VITÓRIA';

  @override
  String get conjunctionSearchWinMessage =>
      'Você encontrou todos os alvos com foco atencional perfeito!';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      'Uma combinação específica de forma e cor do alvo será mostrada nas instruções. Encontre e toque nela na grade densa o mais rápido possível. Formas distratoras compartilham a mesma cor ou forma, então olhe de perto!';

  @override
  String get conjunctionSearchRound => 'RODADA: ';

  @override
  String get conjunctionSearchScore => 'PONTUAÇÃO: ';

  @override
  String get conjunctionSearchFind => 'ENCONTRE: ';

  @override
  String get shapeCircle => 'CÍRCULO';

  @override
  String get shapeSquare => 'QUADRADO';

  @override
  String get shapeTriangle => 'TRIÂNGULO';

  @override
  String get shapeStar => 'ESTRELA';

  @override
  String get colorRedLabel => 'VERMELHO';

  @override
  String get colorBlueLabel => 'AZUL';

  @override
  String get colorGreenLabel => 'VERDE';

  @override
  String get colorAmberLabel => 'ÂMBAR';

  @override
  String get cubeNetFoldTitle => 'Dobra de Rede de Cubo';

  @override
  String get cubeNetFoldSubtitle =>
      'SELECIONE A OPÇÃO DE CUBO 3D CORRESPONDENTE';

  @override
  String get cubeNetFoldWinTitle => 'CORRETO';

  @override
  String get cubeNetFoldWinMessage =>
      'Você tem uma lógica de dobra espacial 3D perfeita!';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '1. Observe a rede 2D desdobrada no topo.\n\n2. Dobre mentalmente a rede em um cubo 3D.\n\n3. Escolha a opção abaixo que representa uma perspectiva 3D válida desse cubo dobrado.\n\n4. Cuidado: faces opostas na rede não podem ser adjacentes em 3D, e a ordem das faces adjacentes deve coincidir!';

  @override
  String get cubeNetFoldUnfoldedNet => 'REDE 2D DESDOBRADA';

  @override
  String get cubeNetFoldWhichMatches => 'QUAL CUBO CORRESPONDE?';

  @override
  String get cubeNetFoldIncorrect =>
      'Lógica de dobra incorreta! Toque em Reiniciar ou altere sua escolha.';

  @override
  String get cubeNetFoldSubmitChoice => 'ENVIAR ESCOLHA';

  @override
  String get cubeNetFoldFailed => 'FALHOU (TOQUE EM REINICIAR)';

  @override
  String get faceTraitAssociationMemorize => 'MEMORIZE TODAS AS 4 PESSOAS';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return 'PESSOA $current DE $total';
  }

  @override
  String get faceTraitAssociationWhatOccupation => 'QUAL É A PROFISSÃO DELAS?';

  @override
  String get faceTraitAssociationWhatHobby => 'QUAL É O HOBBY DELAS?';

  @override
  String get faceTraitAssociationWinTitle => 'MESTRE DA MEMÓRIA!';

  @override
  String get faceTraitAssociationLoseTitle => 'FIM DE JOGO';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return 'Você acertou $correct de $total.';
  }

  @override
  String get topologyTitle => 'TOPOLOGIA';

  @override
  String get topologySubtitle =>
      'Essas formas são topologicamente equivalentes? (Uma pode ser deformada na outra sem cortar ou colar?)';

  @override
  String get topologyWinTitle => 'GÊNIO DA GEOMETRIA!';

  @override
  String get topologyWinMessage =>
      'Você identificou corretamente 10 pares topológicos!';

  @override
  String get topologyScore => 'PONTUAÇÃO: ';
}
