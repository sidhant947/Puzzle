// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Jogos de Puzzle';

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
  String get victory => 'Vitória!';

  @override
  String get gameWin => 'BEM FEITO!';

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
  String get verbalAnalogiesTitle => 'Analogias verbais';

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
  String get tangleFixTitle => 'Desembaraçar';

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
  String get mirrorTracingTitle => 'Traçado no espelho';

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
  String get shapeRectangle => 'RETÂNGULO';

  @override
  String get shapeEllipse => 'ELIPSE';

  @override
  String get shapeTrapezoid => 'TRAPÉZIO';

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

  @override
  String get semanticDistanceTitle => 'Distância Semântica';

  @override
  String get semanticDistanceSubtitle =>
      'Meça a distância conceitual entre as palavras';

  @override
  String get oxymoronHuntTitle => 'Caça ao Oxímoro';

  @override
  String get oxymoronHuntSubtitle =>
      'Emparelhe palavras contraditórias na grade';

  @override
  String get portmanteauSplitTitle => 'Divisão de Portmanteau';

  @override
  String get portmanteauSplitSubtitle =>
      'Identifique as palavras de origem de um portmanteau';

  @override
  String get chainReactionTitle => 'Reação em Cadeia';

  @override
  String get chainReactionSubtitle =>
      'Conecte palavras usando letras sobrepostas';

  @override
  String get rhymeMasterTitle => 'Mestre da Rima';

  @override
  String get rhymeMasterSubtitle => 'Identifique palavras que rimam com o alvo';

  @override
  String get definitionDashTitle => 'Corrida da Definição';

  @override
  String get definitionDashSubtitle =>
      'Combine a palavra correta com sua definição';

  @override
  String get syllableStackTitle => 'Pilha de Sílabas';

  @override
  String get syllableStackSubtitle =>
      'Empilhe sílabas para formar palavras completas';

  @override
  String get sentenceUnscrambleTitle => 'Desembaralhar Frase';

  @override
  String get sentenceUnscrambleSubtitle =>
      'Reordene as palavras para formar uma frase válida';

  @override
  String get grammarSortTitle => 'Classificação Gramatical';

  @override
  String get grammarSortSubtitle =>
      'Categorize as palavras por sua classe gramatical';

  @override
  String get vowelReconstructTitle => 'Reconstrução de Vogais';

  @override
  String get vowelReconstructSubtitle =>
      'Preencha as vogais que faltam na frase';

  @override
  String get consonantReconstructTitle => 'Reconstrução de Consoantes';

  @override
  String get consonantReconstructSubtitle =>
      'Preencha as consoantes que faltam na frase';

  @override
  String get homophoneHuntTitle => 'Caça ao Homófono';

  @override
  String get silentLetterSearchTitle => 'Busca de Letras Mudas';

  @override
  String get silentLetterSearchSubtitle =>
      'Identifique as letras mudas nas palavras dadas';

  @override
  String get palindromeBuilderTitle => 'Construtor de Palíndromos';

  @override
  String get palindromeBuilderSubtitle =>
      'Crie um palíndromo adicionando o mínimo de letras';

  @override
  String get phoneticGuessTitle => 'Adivinhação Fonética';

  @override
  String get phoneticGuessSubtitle =>
      'Identifique a palavra a partir de sua grafia fonética';

  @override
  String get spoonerismSolverTitle => 'Solucionador de Spoonerism';

  @override
  String get spoonerismSolverSubtitle =>
      'Identifique o spoonerism correto para a frase';

  @override
  String get etymonOddballTitle => 'Etimologia Intrusiva';

  @override
  String get etymonOddballSubtitle =>
      'Encontre a palavra que não compartilha da mesma raiz';

  @override
  String get etymologyOriginTitle => 'Origem Etimológica';

  @override
  String get etymologyOriginSubtitle =>
      'Adivinhe o idioma de origem da palavra emprestada';

  @override
  String get affixFactoryTitle => 'Fábrica de Afixos';

  @override
  String get affixFactorySubtitle =>
      'Crie palavras válidas usando prefixos e sufixos';

  @override
  String get cognateCatchTitle => 'Captura de Cognatos';

  @override
  String get cognateCatchSubtitle =>
      'Distinga entre cognatos verdadeiros e falsos amigos';

  @override
  String get compoundConnectTitle => 'Conexão Composta';

  @override
  String get compoundConnectSubtitle =>
      'Combine duas palavras para formar uma palavra composta';

  @override
  String get pangramSprintTitle => 'Sprint de Pangrama';

  @override
  String get pangramSprintSubtitle =>
      'Construa uma frase usando todas as letras do alfabeto';

  @override
  String get anagramDefinitionTitle => 'Definição de Anagrama';

  @override
  String get anagramDefinitionSubtitle =>
      'Resolva o anagrama com base em sua definição';

  @override
  String get letterBridgeTitle => 'Ponte de Letras';

  @override
  String get letterBridgeSubtitle =>
      'Encontre a letra que falta para unir duas palavras';

  @override
  String get letterFrequencyScanTitle => 'Varredura de Frequência de Letras';

  @override
  String get letterFrequencyScanSubtitle =>
      'Conte quantas vezes uma letra aparece no texto';

  @override
  String get oneLetterShiftTitle => 'Troca de uma Letra';

  @override
  String get oneLetterShiftSubtitle =>
      'Transforme uma palavra em outra mudando apenas uma letra';

  @override
  String vocabularyBuilderMessage(String arg0) {
    return 'Ótimo trabalho! Seu vocabulário é impressionante. Pontuação: $arg0';
  }

  @override
  String get symmetryMessage =>
      'Você espelhou o padrão perfeitamente com precisão cirúrgica.';

  @override
  String get temporalOrderMessage =>
      'Incrível! Sua memória de sequência temporal é de alta fidelidade.';

  @override
  String get temporalOrderMessage1 =>
      'Memória de sequência incorreta. A prática leva à perfeição!';

  @override
  String get wordSearchMessage =>
      'Todas as palavras encontradas com sucesso com observação aguçada.';

  @override
  String colorMatchMessage(String arg0) {
    return 'Sua precisão: $arg0%';
  }

  @override
  String semanticLinkMessage(String arg0) {
    return 'Você marcou $arg0 pontos!';
  }

  @override
  String reflexTapMessage(String arg0) {
    return 'Você tocou em $arg0 alvos!';
  }

  @override
  String get angleFinderMessage => 'Sua intuição geométrica é perfeita!';

  @override
  String angleFinderMessage1(String arg0) {
    return 'A resposta correta era $arg0°';
  }

  @override
  String angleFinderText(String arg0) {
    return '$arg0°';
  }

  @override
  String visualStatisticalLearningMessage(String arg0) {
    return 'Você acertou $arg0 padrões!';
  }

  @override
  String nonogramText(String arg0) {
    return 'Erro: $arg0';
  }

  @override
  String mentalCalendarMessage(String arg0) {
    return 'Você acertou $arg0 de 10!';
  }

  @override
  String orbitTapMessage(String arg0) {
    return 'Você tocou com sucesso $arg0 vezes!';
  }

  @override
  String schulteTableMessage(String arg0) {
    return 'Você completou a tabela em $arg0. Continue praticando para expandir sua visão periférica!';
  }

  @override
  String get schulteTableText => 'INICIAR TESTE';

  @override
  String get relationalMemoryMessage =>
      'Fabulosa precisão de memória relacional espacial!';

  @override
  String sudokuText(String arg0) {
    return 'Erro: $arg0';
  }

  @override
  String sdmtMessage(String arg0) {
    return 'Você combinou $arg0 símbolos! Este teste mede sua velocidade de varredura e atenção visual.';
  }

  @override
  String get futoshikiMessage =>
      'Incrível! Você resolveu o Quadrado Latino Futoshiki.';

  @override
  String letterFrequencyScanMessage(String arg0, String arg1) {
    return 'Você contou corretamente $arg0 ocorrências de \"$arg1\".';
  }

  @override
  String letterFrequencyScanText(String arg0) {
    return 'Incorreto. A contagem foi $arg0.';
  }

  @override
  String get memoryMatrixMessage =>
      'Impressionante! Sua memória de trabalho está afiada. Objetivo diário concluído!';

  @override
  String get memoryMatrixMessage1 =>
      'Concentre-se e tente novamente para melhorar sua pontuação de memória.';

  @override
  String get contextCluesMessage =>
      'Excepcional! Seu vocabulário e análise contextual são de primeira classe.';

  @override
  String get contextCluesMessage1 =>
      'Palavra errada selecionada! Treine seu raciocínio contextual verbal e tente novamente.';

  @override
  String oneLetterShiftMessage(String arg0, String arg1) {
    return 'Você mudou corretamente $arg0 para $arg1.';
  }

  @override
  String get mentalAbacusMessage => 'Sua aritmética mental é de alto nível.';

  @override
  String fractionMatcherMessage(String arg0) {
    return 'Você marcou $arg0 pontos combinando representações!';
  }

  @override
  String get spellingSprintMessage =>
      'Você soletrou todas as 10 palavras corretamente!';

  @override
  String spellingSprintMessage1(String arg0) {
    return 'Você soletrou $arg0 palavras.';
  }

  @override
  String stopSignalMessage(String arg0) {
    return 'Você obteve $arg0 respostas corretas! Este teste mede sua capacidade de inibir uma ação planejada.';
  }

  @override
  String grammarPoliceMessage(String arg0) {
    return 'Fim de Jogo! Você manteve a ordem no mundo da gramática. Pontuação: $arg0';
  }

  @override
  String consonantReconstructMessage(String arg0) {
    return 'Você reconstruiu uma pontuação de $arg0!';
  }

  @override
  String rhymeMasterMessage(String arg0, String arg1) {
    return 'Você encontrou $arg0 de $arg1 rimas!';
  }

  @override
  String vigilanceTaskMessage(String arg0, String arg1, String arg2) {
    return 'Acertos: $arg0, Falhas: $arg1\nAlarmes Falsos: $arg2';
  }

  @override
  String get silhouetteMatchOrthoMessage =>
      'Você tem habilidades de alinhamento ortográfico impecáveis!';

  @override
  String get silhouetteMatchOrthoText => 'ENTENDI';

  @override
  String get silhouetteMatchOrthoText1 =>
      'Projeção de perspectiva incorreta! Toque em Reiniciar para tentar novamente.';

  @override
  String fibonacciMergeMessage(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String factorFinderMessage(String arg0) {
    return 'Você marcou $arg0 pontos encontrando todos os fatores!';
  }

  @override
  String logicalSyllogismsMessage(String arg0) {
    return 'Você resolveu $arg0 silogismos corretamente!';
  }

  @override
  String get rotatingMazeMessage =>
      'Você navegou com sucesso pelo labirinto cinético rotativo!';

  @override
  String get rotatingMazeText => 'ENTENDI';

  @override
  String get rotatingMazeText1 => '🌀 Labirinto girou 90°! Grade deslocada!';

  @override
  String get mathPathMessage => 'Você encontrou o caminho que soma o alvo!';

  @override
  String get bridgesMessage => 'Você conectou todas as ilhas com sucesso!';

  @override
  String compoundConnectMessage(String arg0, String arg1) {
    return 'A palavra composta é $arg0$arg1.';
  }

  @override
  String get pangramSprintMessage =>
      'Você construiu uma frase usando todas as 26 letras.';

  @override
  String get mirrorImageMessage => 'Você identificou perfeitamente o reflexo.';

  @override
  String get mirrorImageText => 'IMAGEM ESPELHADA';

  @override
  String reverseStroopMessage(String arg0) {
    return 'Você marcou $arg0 pontos! Fique atento às instruções.';
  }

  @override
  String get verbalAnalogiesMessage =>
      'Você tem uma mente afiada para relacionamentos.';

  @override
  String corsiBlocksMessage1(String arg0, String arg1) {
    return 'Você lembrou $arg1 sequências! Sua amplitude de memória espacial atingiu $arg0.';
  }

  @override
  String wordLadderMessage(String arg0, String arg1, String arg2) {
    return 'Você conectou com sucesso $arg0 a $arg1 em $arg2 passos.';
  }

  @override
  String d2AttentionMessage(String arg0) {
    return 'Varredura seletiva incrível! Pontuação final: $arg0.';
  }

  @override
  String get d2AttentionText => 'COMO JOGAR';

  @override
  String get d2AttentionText1 => 'ENTENDI';

  @override
  String get tangleFixMessage => 'Todas as linhas estão limpas e suaves.';

  @override
  String get distractorMatrixMessage =>
      'Incrível! Você lembrou dos padrões apesar dos distratores matemáticos cognitivos!';

  @override
  String get distractorMatrixMessage1 =>
      'Os distratores pegaram você! Treine novamente sua memória de trabalho.';

  @override
  String sentenceUnscrambleMessage(String arg0) {
    return 'Você desembaralhou uma pontuação de $arg0!';
  }

  @override
  String get kakuroMessage =>
      'Incrível! Você combinou todos os segmentos de soma perfeitamente.';

  @override
  String symbolicFlankerMessage(String arg0, String arg1) {
    return 'Você acertou $arg0 de $arg1!';
  }

  @override
  String stroopTestMessage(String arg0) {
    return 'Você acertou $arg0 corretamente! Concentre-se na cor da tinta, não na palavra.';
  }

  @override
  String wisconsinCardSortingMessage(String arg0) {
    return 'Você classificou corretamente $arg0 cartas!';
  }

  @override
  String nBackMessage(String arg0) {
    return 'Você conseguiu $arg0 combinações 2-back! Sua memória de trabalho é vital para multitarefa.';
  }

  @override
  String rhythmMasterMessage(String arg0, String arg1) {
    return 'Você conseguiu $arg0 acertos perfeitos e $arg1 pontos!';
  }

  @override
  String groceryListMessage(String arg0, Object score) {
    return 'Você marcou $arg0 pontos na Lista de Compras!';
  }

  @override
  String get groceryListText => 'ESTOU';

  @override
  String get mirrorTracingMessage =>
      'Seu cérebro reprogramou com sucesso sua coordenação.';

  @override
  String moduloClockMessage(String arg0) {
    return 'Excelente coordenação matemática mental modular! Pontuação: $arg0';
  }

  @override
  String moduloClockMessage1(String arg0, String arg1, String arg2) {
    return 'Você conseguiu $arg0 de $arg1 soluções de relógio modular. Pontuação: $arg2';
  }

  @override
  String get crownMessage =>
      'Todas as coroas colocadas com sucesso com lógica perfeita.';

  @override
  String dualCodingMessage(String arg0) {
    return 'Fantástico desempenho de tarefa dupla! Sua pontuação de memória de trabalho: $arg0';
  }

  @override
  String inequalityDashMessage(String arg0) {
    return 'Você marcou $arg0 pontos combinando desigualdades!';
  }

  @override
  String sourceMonitoringMessage(String arg0, String arg1) {
    return 'Você marcou $arg0 de $arg1!';
  }

  @override
  String get sourceMonitoringText => 'INICIAR RECORDAÇÃO';

  @override
  String get memoryPalaceText => 'PALAVRAS DISPONÍVEIS';

  @override
  String target10Message(String arg0) {
    return 'Você marcou $arg0 pontos combinando números até 10!';
  }

  @override
  String get paperFoldingMessage =>
      'Você consegue ver os padrões em sua mente.';

  @override
  String topologyText(String arg0, String arg1) {
    return '$arg0$arg1 / 10';
  }

  @override
  String get waterSortMessage => 'Você ordenou todas as cores perfeitamente!';

  @override
  String anagramDefinitionMessage(String arg0) {
    return 'A palavra era de fato \"$arg0\".';
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
    return 'Você fez $arg0 estimativas corretas.';
  }

  @override
  String grammarSortMessage(String arg0) {
    return 'Você classificou $arg0 palavras corretamente!';
  }

  @override
  String vowelReconstructMessage(String arg0) {
    return 'Você reconstruiu uma pontuação de $arg0!';
  }

  @override
  String spatialConflictMessage(String arg0, String arg1) {
    return 'Você alcançou uma pontuação de $arg0 com $arg1 erros!';
  }

  @override
  String get spatialConflictText => 'COMO JOGAR';

  @override
  String get spatialConflictText1 => 'ENTENDI';

  @override
  String tracePathMessage(String arg0) {
    return 'Sua precisão foi de $arg0%!';
  }

  @override
  String ruleSwitcherMessage(String arg0, String arg1) {
    return 'Você acertou $arg0 de $arg1!';
  }

  @override
  String collatzMessage(String arg0, String arg1) {
    return 'Você deu $arg0 passos. O mínimo possível era $arg1.';
  }

  @override
  String get collatzText => '/ 2';

  @override
  String get collatzText1 => '+ 1';

  @override
  String get collatzText2 => '3n + 1';

  @override
  String divisibilityDashMessage(String arg0) {
    return 'Você resolveu $arg0 números!';
  }

  @override
  String switchTaskMessage(String arg0) {
    return 'Você acertou $arg0 corretamente! A troca rápida é a chave para a flexibilidade mental.';
  }

  @override
  String sequenceSleuthMessage(String arg0) {
    return 'Você resolveu $arg0 sequências!';
  }

  @override
  String changeBlindnessMessage(String arg0) {
    return 'Você encontrou $arg0 mudanças!';
  }

  @override
  String mentalRotationMessage(String arg0) {
    return 'Você rotacionou $arg0 formas corretamente!';
  }

  @override
  String wordMastermindMessage(String arg0) {
    return 'Você dominou o código!\nA palavra era: $arg0';
  }

  @override
  String wordMastermindMessage1(String arg0) {
    return 'A palavra oculta era: $arg0';
  }

  @override
  String wordMastermindText(String arg0) {
    return '$arg0';
  }

  @override
  String get simonSequenceMessage => 'Você memorizou todas as 10 peças!';

  @override
  String get simonSequenceMessage1 =>
      'Tente novamente para dominar a sequência.';

  @override
  String oxymoronHuntMessage(String arg0) {
    return 'Você encontrou $arg0 oxímoros!';
  }

  @override
  String spotlightTrackMessage(String arg0) {
    return 'Rastreamento espacial incrível! Você marcou $arg0 pontos.';
  }

  @override
  String get spotlightTrackText => 'COMO JOGAR';

  @override
  String get spotlightTrackText1 => 'ENTENDI';

  @override
  String get spotlightTrackText2 => 'INICIAR RODADA';

  @override
  String vennNumbersMessage(String arg0) {
    return 'Você categorizou $arg0 números!';
  }

  @override
  String get vennNumbersText => 'NENHUM';

  @override
  String get vennNumbersText1 => 'AMBOS';

  @override
  String get silhouetteMatchMessage =>
      'Seu cérebro é excelente na tradução de 3D para 2D.';

  @override
  String sumSnakeMessage(String arg0) {
    return 'Alvo $arg0 atingido com precisão perfeita!';
  }

  @override
  String get sumSnakeText => 'LIMPAR CAMINHO';

  @override
  String percentagePeakMessage(String arg0) {
    return 'Você resolveu $arg0 problemas de porcentagem!';
  }

  @override
  String trailMakingMessage(String arg0) {
    return 'Você completou $arg0 trilhas! Este teste mede sua velocidade de busca visual e flexibilidade mental.';
  }

  @override
  String matrixReasoningMessage(String arg0) {
    return 'Você completou $arg0 matrizes corretamente!';
  }

  @override
  String get tentsAndTreesMessage =>
      'Você colocou todas as tendas com sucesso.';

  @override
  String klotskiMessage(String arg0) {
    return 'Deslizamento sensacional! Você libertou o bloco Herói em $arg0 movimentos.';
  }

  @override
  String sumPyramidMessage(String arg0) {
    return 'Você resolveu $arg0 pirâmides de soma com sucesso!';
  }

  @override
  String simonCommandMessage(String arg0) {
    return 'Excelente resposta seletiva e foco! Pontuação Total: $arg0';
  }

  @override
  String simonCommandMessage1(String arg0, String arg1) {
    return 'Você marcou $arg0 mas não atingiu $arg1 combinações a tempo.';
  }

  @override
  String syllableStackMessage(String arg0) {
    return 'Você empilhou uma pontuação de $arg0!';
  }

  @override
  String get slitherlinkMessage =>
      'Incrível! Você completou com sucesso o puzzle de loop.';

  @override
  String quickMathMessage(String arg0) {
    return 'Você resolveu $arg0 problemas!';
  }

  @override
  String commonDenominatorMessage(String arg0) {
    return 'Você resolveu $arg0 problemas de MDC/MMC!';
  }

  @override
  String chainReactionMessage(String arg0, String arg1) {
    return 'Sua pontuação final é $arg0. Você construiu uma corrente de $arg1 palavras.';
  }

  @override
  String chainReactionText(String arg0) {
    return '$arg0';
  }

  @override
  String get associativePairsMessage =>
      'Brilhante! Você associou traços visuais sem falhas.';

  @override
  String get associativePairsMessage1 =>
      'Associação errada! Afie sua memória de ligação e tente novamente.';

  @override
  String portmanteauSplitMessage(String arg0) {
    return 'Você dividiu $arg0 portmanteaus!';
  }

  @override
  String get magicSquaresText => 'LIMPAR';

  @override
  String alphabetSudokuText(String arg0) {
    return 'Erro: $arg0';
  }

  @override
  String get pipesMessage =>
      'Você conectou todos os canos e preencheu a grade.';

  @override
  String get dualMirrorMessage =>
      'Você navegou ambos os ícones para seus alvos!';

  @override
  String binaryCodeMessage(String arg0) {
    return 'Tradução decimal rápida sensacional! Pontuação Final: $arg0';
  }

  @override
  String binaryCodeMessage1(String arg0, String arg1) {
    return 'Você converteu corretamente $arg0 números binários. Pontuação: $arg1';
  }

  @override
  String oddOneOutMessage(String arg0) {
    return 'Você encontrou 50 intrusos! Pontuação final: $arg0';
  }

  @override
  String oddOneOutMessage1(String arg0) {
    return 'Sua pontuação: $arg0';
  }

  @override
  String letterBridgeMessage(String arg0) {
    return 'Você encontrou a letra ponte: $arg0';
  }

  @override
  String get imReady => 'ESTOU PRONTO';

  @override
  String get soptTitle => 'Apontamento auto-ordenado';

  @override
  String get soptSubtitle =>
      'Toque em um cartão diferente a cada vez. As posições se embaralham!';

  @override
  String get soptWinTitle => 'Mestre da sequência!';

  @override
  String soptGameOverMessage(int score) {
    return 'Você marcou $score pontos ao rastrear cartas embaralhadas com sucesso!';
  }

  @override
  String get soptChooseNovel => 'Toque em um novo cartão';

  @override
  String get soptGreatJob => 'Ótimo trabalho!';

  @override
  String get soptAlreadyTapped => 'Já tocado!';

  @override
  String get soptGrid => 'Grade';

  @override
  String get contRecogTitle => 'Reconhecimento Contínuo';

  @override
  String get contRecogSubtitle => 'Você já viu este cartão antes nesta sessão?';

  @override
  String get contRecogWinTitle => 'Gênio do reconhecimento!';

  @override
  String contRecogGameOverMessage(int score) {
    return 'Você obteve $score reconhecimentos corretos!';
  }

  @override
  String get contRecogCorrect => 'Correto!';

  @override
  String get contRecogWrong => 'Errado!';

  @override
  String get contRecogOldOrNew => 'Isso é antigo ou novo?';

  @override
  String get contRecogNew => 'Novo';

  @override
  String get contRecogOld => 'Velho';

  @override
  String get contRecogSeenPool => 'Piscina vista';

  @override
  String get dnmsTitle => 'Memória não correspondente';

  @override
  String get dnmsSubtitle =>
      'Toque no cartão que não estava na amostra memorizada.';

  @override
  String get dnmsWinTitle => 'Especialista não correspondente!';

  @override
  String dnmsGameOverMessage(int score) {
    return 'Você marcou $score respostas corretas em Não Correspondência Atrasada!';
  }

  @override
  String get dnmsChooseNovel => 'Toque no novo cartão';

  @override
  String get dnmsMemorizeSample => 'Memorize este cartão';

  @override
  String get dnmsWaitForIt => 'Espere por isso...';

  @override
  String get dnmsExcellent => 'Excelente!';

  @override
  String get dnmsSampleTapped => 'Essa foi a amostra!';

  @override
  String get dnmsCards => 'Cartões';

  @override
  String get symSpanTitle => 'Extensão de Simetria';

  @override
  String get symSpanSubtitle =>
      'Lembre-se dos padrões celulares enquanto identifica a simetria vertical.';

  @override
  String get symSpanWinTitle => 'Mestre da simetria!';

  @override
  String symSpanGameOverMessage(int score) {
    return 'Você marcou $score pontos ao relembrar layouts e identificar simetria!';
  }

  @override
  String get symSpanMemorizeRed =>
      'Memorize a localização dos glóbulos vermelhos';

  @override
  String get symSpanIsSymmetric => 'O padrão é simétrico?';

  @override
  String get symSpanRecallSequence => 'Recuperar sequência na ordem correta';

  @override
  String get symSpanGreatJob => 'Ótimo trabalho!';

  @override
  String get symSpanTryAgain => 'Tente novamente!';

  @override
  String get symSpanLength => 'Comprimento';

  @override
  String get readingSpanTitle => 'Período de leitura';

  @override
  String get readingSpanSubtitle =>
      'Verifique as frases enquanto lembra uma sequência de letras.';

  @override
  String get readingSpanWinTitle => 'Especialista em leitura!';

  @override
  String readingSpanGameOverMessage(int score) {
    return 'Você marcou $score pontos no desafio de memória Reading Span!';
  }

  @override
  String get readingSpanTrueFalse => 'Esta afirmação é verdadeira ou falsa?';

  @override
  String get readingSpanMemorizeLetter => 'Memorize esta carta';

  @override
  String get readingSpanRecallLetters => 'Lembre-se de letras em sequência';

  @override
  String get readingSpanGreatJob => 'Ótimo trabalho!';

  @override
  String get readingSpanTryAgain => 'Tente novamente!';

  @override
  String readingSpanYourSequence(String sequence) {
    return 'Sua sequência: $sequence';
  }

  @override
  String get readingSpanLength => 'Comprimento';

  @override
  String get readingSpanSentence1 => 'O sol nasce no leste.';

  @override
  String get readingSpanSentence2 => 'O gelo está fervendo.';

  @override
  String get readingSpanSentence3 => 'Os peixes podem respirar debaixo d’água.';

  @override
  String get readingSpanSentence4 => 'Os cães têm asas e podem voar.';

  @override
  String get readingSpanSentence5 => 'A água congela a 0 graus Celsius.';

  @override
  String get readingSpanSentence6 => 'Os gatos latem como cães pequenos.';

  @override
  String get readingSpanSentence7 => 'As árvores têm folhas verdes no verão.';

  @override
  String get readingSpanSentence8 => 'A chuva cai do chão para cima.';

  @override
  String get readingSpanSentence9 => 'Um triângulo tem quatro lados iguais.';

  @override
  String get readingSpanSentence10 => 'As maçãs são um tipo de fruta doce.';

  @override
  String get readingSpanSentence11 => 'A lua é feita de queijo cheddar.';

  @override
  String get readingSpanSentence12 => 'Os automóveis têm rodas para rolar.';

  @override
  String get readingSpanSentence13 => 'O fogo está congelando.';

  @override
  String get readingSpanSentence14 => 'O papel é feito de madeira processada.';

  @override
  String get readingSpanSentence15 =>
      'Os pássaros têm penas que os ajudam a voar.';

  @override
  String get readingSpanSentence16 => 'As bananas crescem em pinheiros.';

  @override
  String get readingSpanSentence17 => 'Um elefante é menor que uma formiga.';

  @override
  String get readingSpanSentence18 =>
      'Os livros contêm páginas impressas de texto.';

  @override
  String get countingSpanTitle => 'Período de contagem';

  @override
  String get countingSpanSubtitle =>
      'Conte apenas os círculos azuis. Em seguida, lembre-se da sequência de contagens.';

  @override
  String get countingSpanWinTitle => 'Contando Gênio!';

  @override
  String countingSpanGameOverMessage(int score) {
    return 'Você marcou $score pontos no desafio de memória Counting Span!';
  }

  @override
  String get countingSpanCountCircles => 'Conte apenas círculos azuis';

  @override
  String get countingSpanRecallCounts => 'Contagens de recall na ordem correta';

  @override
  String get countingSpanGreatJob => 'Ótimo trabalho!';

  @override
  String get countingSpanTryAgain => 'Tente novamente!';

  @override
  String countingSpanYourSequence(String sequence) {
    return 'Sua sequência: $sequence';
  }

  @override
  String get countingSpanLength => 'Comprimento';

  @override
  String get objDispTitle => 'Deslocamento de Objeto';

  @override
  String get objDispSubtitle =>
      'Memorize o layout. Encontre e toque no objeto que muda de posição.';

  @override
  String get objDispWinTitle => 'Gênio Espacial!';

  @override
  String objDispGameOverMessage(int score) {
    return 'Você identificou corretamente $score objetos deslocados!';
  }

  @override
  String get objDispMemorizeAll => 'Memorize todos os posicionamentos';

  @override
  String get objDispWaitingShift => 'Aguardando mudança de layout...';

  @override
  String get objDispTapMoved => 'Toque no objeto que se moveu';

  @override
  String get objDispExcellent => 'Excelente!';

  @override
  String get objDispWrongObject => 'Objeto errado!';

  @override
  String get objDispItems => 'Unid';

  @override
  String get mandalaTitle => 'Lembrança da Mandala';

  @override
  String get mandalaSubtitle =>
      'Memorize a configuração de cores. Escolha cores e repinte os azulejos.';

  @override
  String get mandalaWinTitle => 'Artista Mandala!';

  @override
  String mandalaGameOverMessage(int score) {
    return 'Você marcou $score pontos recriando layouts geométricos coloridos!';
  }

  @override
  String get mandalaMemorizeColors => 'Memorize as cores dos ladrilhos';

  @override
  String get mandalaPaintCells =>
      'Pinte as células para combinar com o original';

  @override
  String get mandalaExcellent => 'Excelente!';

  @override
  String get mandalaIncorrectMatch => 'Correspondência incorreta!';

  @override
  String get mandalaSubmitRepaint => 'Enviar repintura';

  @override
  String get mandalaTiles => 'Azulejos';

  @override
  String get runningSpanTitle => 'Período de execução';

  @override
  String get runningSpanSubtitle =>
      'Observe as letras. Quando eles pararem, insira as últimas N letras em ordem.';

  @override
  String get runningSpanWinTitle => 'Mestre do Buffer!';

  @override
  String runningSpanGameOverMessage(int score) {
    return 'Você marcou $score pontos em Running Memory Span!';
  }

  @override
  String runningSpanPrepareRecall(int count) {
    return 'Prepare-se para lembrar as últimas $count letras';
  }

  @override
  String get runningSpanWatchCarefully => 'Observe com atenção...';

  @override
  String runningSpanEnterLast(int count) {
    return 'Insira as últimas $count letras';
  }

  @override
  String get runningSpanGreatJob => 'Ótimo trabalho!';

  @override
  String get runningSpanIncorrectBuffer => 'Buffer incorreto!';

  @override
  String runningSpanRecallLast(int count) {
    return 'Recuperar o último $count';
  }

  @override
  String get runningSpanStopsRandomly => 'O fluxo para aleatoriamente!';

  @override
  String runningSpanEntered(String sequence) {
    return 'Inserido: __SEQUÊNCIA__';
  }

  @override
  String get runningSpanNItems => 'N-itens';

  @override
  String get spatialCabinetTitle => 'Armários Espaciais';

  @override
  String get spatialCabinetSubtitle =>
      'Memorize qual gaveta do armário contém qual objeto.';

  @override
  String get spatialCabinetWinTitle => 'Especialista em gabinete!';

  @override
  String spatialCabinetGameOverMessage(int score) {
    return 'Você marcou $score pontos em Memória de Gabinete Espacial!';
  }

  @override
  String get spatialCabinetMemorize => 'Memorize a localização dos itens';

  @override
  String spatialCabinetWhereIs(String itemName) {
    return 'Onde está o $itemName ?';
  }

  @override
  String get spatialCabinetCorrect => 'Correto!';

  @override
  String get spatialCabinetWrongDrawer => 'Gaveta errada!';

  @override
  String get spatialCabinetItems => 'Unid';

  @override
  String get cabinetItemKey => 'Chave';

  @override
  String get cabinetItemApple => 'Maçã';

  @override
  String get cabinetItemDiamond => 'Diamante';

  @override
  String get cabinetItemBook => 'Livro';

  @override
  String get cabinetItemUmbrella => 'Guarda-chuva';

  @override
  String get cabinetItemCoffee => 'Café';

  @override
  String get cabinetItemLock => 'Trancar';

  @override
  String get cabinetItemPet => 'Bicho de estimação';

  @override
  String get cabinetItemCar => 'Carro';

  @override
  String get gamesTitleLabel => 'JOGOS';

  @override
  String get yourFavorites => 'OS SEUS FAVORITOS';

  @override
  String get readyForWorkout => 'PRONTO PARA O SEU TREINO DIÁRIO?';

  @override
  String get greatStartKeepGoing => 'BOM COMEÇO! CONTINUE ASSIM.';

  @override
  String get onFireToday => 'VOCÊ ESTÁ EM FORMA HOJE!';

  @override
  String get incredibleSolvingToday => 'RESOLUÇÕES INCRÍVEIS HOJE!';

  @override
  String get newGameLabel => 'NOVO';

  @override
  String get slitherlinkTitle => 'Slitherlink';

  @override
  String get slitherlinkSubtitle =>
      'CIRCUNDE A GRADE DE PINOS USANDO PISTAS NUMÉRICAS.';

  @override
  String get futoshikiTitle => 'Futoshiki';

  @override
  String get futoshikiSubtitle => 'PREENCHA AS GRADES COM PISTAS DE MAIOR QUE.';

  @override
  String get kakuroTitle => 'Kakuro';

  @override
  String get kakuroSubtitle => 'RESOLVA PALAVRAS CRUZADAS COM NÚMEROS E SOMAS.';

  @override
  String get inequalityDashTitle => 'Corrida de Desigualdades';

  @override
  String get inequalityDashSubtitle =>
      'RESOLVA DESIGUALDADES SOB PRESSÃO DE TEMPO.';

  @override
  String get factorFinderTitle => 'Localizador de Fatores';

  @override
  String get factorFinderSubtitle =>
      'IDENTIFIQUE TODOS OS FATORES DOS NÚMEROS ALVO.';

  @override
  String get collatzTitle => 'Caminho de Collatz';

  @override
  String get collatzSubtitle => 'NAVEGUE NA SEQUÊNCIA 3N+1.';

  @override
  String get sumPyramidTitle => 'Pirâmide de Somas';

  @override
  String get sumPyramidSubtitle =>
      'PREENCHA AS CÉLULAS DA PIRÂMIDE COM PISTAS MATEMÁTICAS DE SOMA.';

  @override
  String get target10Title => 'Alvo 10';

  @override
  String get target10Subtitle =>
      'COMBINE PEÇAS DE NÚMEROS PARA OBTER DEZ SOMAS.';

  @override
  String get fractionMatcherTitle => 'Correspondência de Frações';

  @override
  String get fractionMatcherSubtitle =>
      'CORRESPONDA FRAÇÕES EQUIVALENTES VISUALMENTE.';

  @override
  String get dualCodingTitle => 'Codificação Dupla';

  @override
  String get dualCodingSubtitle =>
      'CORRESPONDA LETRAS E SÍMBOLOS SIMULTANEAMENTE.';

  @override
  String get distractorMatrixTitle => 'Matriz de Distratores';

  @override
  String get distractorMatrixSubtitle =>
      'ENCONTRE FORMAS ALVO ENTRE DISTRATORES.';

  @override
  String get temporalOrderTitle => 'Ordem Temporal';

  @override
  String get temporalOrderSubtitle => 'RECORDE A SEQUÊNCIA CRONOLÓGICA.';

  @override
  String get associativePairsTitle => 'Pares Associativos';

  @override
  String get associativePairsSubtitle =>
      'EMPARELHE E CORRESPONDA OS SÍMBOLOS CORRESPONDENTES.';

  @override
  String get blockCount3dTitle => 'Contagem de Blocos 3D';

  @override
  String get blockCount3dSubtitle => 'CONTE BLOCOS NO ESPAÇO TRIDIMENSIONAL.';

  @override
  String get rotatingMazeTitle => 'Labirinto Giratório';

  @override
  String get rotatingMazeSubtitle =>
      'GIRE LABIRINTOS PARA GUIAR AS BOLAS ATÉ A SAÍDA.';

  @override
  String get silhouetteMatchOrthoTitle => 'Correspondência de Silhueta (Orto)';

  @override
  String get silhouetteMatchOrthoSubtitle =>
      'CORRESPONDA OBJETOS 3D COM SOMBRAS ORTOGONAIS.';

  @override
  String get spatialConflictTitle => 'Conflito Espacial';

  @override
  String get spatialConflictSubtitle =>
      'RESOLVA DISCREPÂNCIAS ENTRE TEXTO E DIREÇÃO.';

  @override
  String get spotlightTrackTitle => 'Trilha de Destaque';

  @override
  String get spotlightTrackSubtitle =>
      'RASTREIE ITENS PISCANTES EM SOMBRAS EM MOVIMENTO.';

  @override
  String get d2AttentionTitle => 'Atenção d2';

  @override
  String get d2AttentionSubtitle =>
      'TOQUE NOS SÍMBOLOS ALVO COM CRITÉRIOS RIGOROSOS.';

  @override
  String get dualMirrorTitle => 'Navegação de Espelho Duplo';

  @override
  String get dualMirrorSubtitle => 'NAVEGUE EM DOIS LABIRINTOS AO MESMO TEMPO.';

  @override
  String get contextCluesTitle => 'Pistas de Contexto';

  @override
  String get contextCluesSubtitle =>
      'INFERIR PALAVRAS OCULTAS A PARTIR DE DICAS DE CONTEXTO.';

  @override
  String get digitSpanReverseSubtitle =>
      'RECORDE OS DÍGITOS NUMÉRICOS EM ORDEM INVERSA.';

  @override
  String get faceNameAssociationSubtitle =>
      'RECORDE OS NOMES PARA DIVERSAS FACES APRESENTADAS.';

  @override
  String get staircaseMemorySubtitle =>
      'MEMORIZE BLOCOS EM SEQUÊNCIA ESCALONADA.';

  @override
  String get choiceReactionTimeSubtitle =>
      'TOQUE RAPIDAMENTE NOS BOTÕES ESPECÍFICOS QUE CORRESPONDEM ÀS PISTAS.';

  @override
  String get attentionalBlinkSubtitle =>
      'IDENTIFIQUE ALVOS RÁPIDOS PISCANDO EM FLUXOS.';

  @override
  String get visualStatisticalLearningSubtitle =>
      'APRENDA PADRÕES DE FORMAS TEMPORAIS VISUALMENTE.';

  @override
  String get sternbergTaskSubtitle =>
      'RECORDE SE O SÍMBOLO ESTAVA NO CONJUNTO DE MEMÓRIA.';

  @override
  String get operationSpanSubtitle =>
      'RESOLVA MATEMÁTICA E RECORDE SEQUÊNCIAS DE ALFABETO.';

  @override
  String get continuousRecognitionTitle => 'Reconhecimento Contínuo';

  @override
  String get continuousRecognitionSubtitle =>
      'IDENTIFIQUE SE O CARTÃO APRESENTADO É ANTIGO OU NOVO.';

  @override
  String get symmetrySpanTitle => 'Extensão de Simetria';

  @override
  String get symmetrySpanSubtitle =>
      'RECORDE AS COORDENADAS DAS CÉLULAS ENTRE DECISÕES DE SIMETRIA VERTICAL.';

  @override
  String get objectDisplacementTitle => 'Deslocamento de Objeto';

  @override
  String get objectDisplacementSubtitle =>
      'ESTUDE OS POSICIONAMENTOS E TOQUE NO ÚNICO OBJETO QUE SE MOVEU.';

  @override
  String get mandalaRecallTitle => 'Recordação de Mandala';

  @override
  String get mandalaRecallSubtitle =>
      'MEMORIZE PEÇAS DE CORES E REPINTA MANDALAS DA PALETA.';

  @override
  String get runningMemorySpanTitle => 'Extensão de Memória Corrente';

  @override
  String get runningMemorySpanSubtitle =>
      'MONITORE AS LETRAS CORRENTES E RECORDE OS ÚLTIMOS N ITENS.';

  @override
  String get spatialCabinetMemoryTitle => 'Armários Espaciais';

  @override
  String get spatialCabinetMemorySubtitle =>
      'MEMORIZE E LOCALIZE ITENS ATRÁS DAS PORTAS DOS ARMÁRIOS.';

  @override
  String get pathRecallSubtitle => 'MEMORIZE E REPITA AS SELEÇÕES DE CAMINHO.';

  @override
  String get objectShuffleSubtitle =>
      'RASTREIE ITENS EMBARALHADOS SOB COPOS FUNDOS.';

  @override
  String get groceryListSubtitle => 'MEMORIZE E MARQUE OS ITENS NA LISTA.';

  @override
  String get quickMathSubtitle =>
      'RESOLVA QUESTÕES DE ARITMÉTICA NA VELOCIDADE MÁXIMA.';

  @override
  String get mathGuessTitle => 'Adivinhação Matemática';

  @override
  String get mathGuessSubtitle => 'ADIVINHE O NÚMERO OCULTO EM 15 CHANCES.';

  @override
  String get reflexTapSubtitle => 'TOQUE NOS ESTÍMULOS O MAIS RÁPIDO POSSÍVEL.';

  @override
  String get pixelMimicSubtitle =>
      'IMITE PADRÕES DE DESIGN EM GRADES DE PIXELS.';

  @override
  String get simonSequenceSubtitle => 'REPITA SEQUÊNCIAS DE FORMAS DA MEMÓRIA.';

  @override
  String get slidePuzzleSubtitle =>
      'REARRANJE AS PEÇAS DA GRADE DESLIZANTE QUADRADA.';

  @override
  String get findWordTitle => 'Encontrar Palavra';

  @override
  String get schulteTableSubtitle => 'TOQUE NOS NÚMEROS DE UM A VINTE E CINCO.';

  @override
  String get simonCommandTitle => 'Comando de Simon';

  @override
  String get simonCommandSubtitle => 'EXECUTE INSTRUÇÕES DE VOZ RAPIDAMENTE.';

  @override
  String get binaryCodeTitle => 'Velocidade Binária';

  @override
  String get binaryCodeSubtitle => 'TRADUZA CÓDIGOS BINÁRIOS EM DECIMAL.';

  @override
  String get moduloClockTitle => 'Relógio Módulo';

  @override
  String get moduloClockSubtitle =>
      'CALCULE EQUAÇÕES MATEMÁTICAS USANDO RELÓGIOS.';

  @override
  String get chimpTestTitle => 'Teste do Chimpanzé';

  @override
  String get chimpTestSubtitle =>
      'TOQUE EM NÚMEROS ALEATÓRIOS EM ORDEM CRESCENTE.';

  @override
  String get relationalMemoryTitle => 'Memória Relacional';

  @override
  String get relationalMemorySubtitle =>
      'RECORDE AS POSIÇÕES EXATAS DOS ITENS NA GRADE.';

  @override
  String get factBinderTitle => 'Fichário de Fatos';

  @override
  String get factBinderSubtitle => 'CONECTE SÍMBOLOS E RECORDE AFIRMAÇÕES.';

  @override
  String get sourceMonitoringTitle => 'Monitoramento de Fonte';

  @override
  String get sourceMonitoringSubtitle => 'LEMBRE-SE DO CONTEXTO.';

  @override
  String get klotskiTitle => 'Fuga de Klotski';

  @override
  String get klotskiSubtitle => 'DESLIZE OS BLOCOS PARA ALCANÇAR AS SAÍDAS.';

  @override
  String get homophoneHuntSubtitle => 'Escolha o homófono grafado corretamente';

  @override
  String get laserLinkTitle => 'Ligação Laser';

  @override
  String get laserLinkSubtitle =>
      'Roda os espelhos para refletir lasers e alimentar todos os alvos.';

  @override
  String get laserLinkCongrats =>
      'Reflexão de precision! Alimentaste com sucesso toda a rede.';

  @override
  String get crossSectionSliceTitle => 'Corte Transversal';

  @override
  String get crossSectionSliceSubtitle =>
      'Identifica a secção transversal 2D correta de um objeto 3D a partir de um ângulo específico.';

  @override
  String get crossSectionSliceCongrats =>
      'Incrível visualização 3D! Viste através dessa forma.';

  @override
  String get shadowPivotTitle => 'Pivô de Sombra';

  @override
  String get shadowPivotCongrats =>
      'Raciocínio espacial dinâmico! Dominaste a luz e a sombra.';

  @override
  String get shadowPivotSubtitle =>
      'Preveja a sombra projetada por um objeto 3D enquanto ele gira em diferentes eixos.';

  @override
  String get interlockPuzzleTitle => 'Puzzle de Entrelaçamento';

  @override
  String get interlockPuzzleSubtitle =>
      'Desmonta ou monta blocos entrelaçados complexos na sequência correta.';

  @override
  String get interlockPuzzleCongrats =>
      'Desconstrução lógica! Desvendaste o puzzle perfeitamente.';

  @override
  String get pathIntersectTitle => 'Interseção de Caminhos';

  @override
  String get pathIntersectSubtitle =>
      'Navega por vários caminhos simultaneamente para alcançar os respetivos alvos sem colisão.';

  @override
  String get pathIntersectCongrats =>
      'Navegação sincronizada! Alcançaste todos os alvos sem falhas.';

  @override
  String get negativeSpaceDetectionTitle => 'Espaço Negativo';

  @override
  String get negativeSpaceDetectionSubtitle =>
      'Identifica a forma formada pelo espaço vazio entre os objetos.';

  @override
  String get negativeSpaceDetectionCongrats =>
      'Perceção aguçada! Dominaste a arte de ver o que não está lá.';

  @override
  String get compassMazeTitle => 'Labirinto de Bússola';

  @override
  String get compassMazeSubtitle =>
      'Navega num labirinto onde as direções de movimento chamam-se com base na orientação da tua bússola.';

  @override
  String get compassMazeCongrats =>
      'Navegação especializada! Encontraste a saída através das direções mutáveis.';

  @override
  String get complexFoldingNetsTitle => 'Redes de Dobragem';

  @override
  String get complexFoldingNetsSubtitle =>
      'Determina qual forma 3D complexa será formada ao dobrar uma rede 2D não padrão.';

  @override
  String get complexFoldingNetsCongrats =>
      'Lógica de dobragem avançada! Visualizaste com sucesso a forma 3D.';

  @override
  String get compassMazeMessage => 'Navega no labirinto usando a bússola.';

  @override
  String get negativeSpaceDetectionMessage =>
      'Identifica o objeto oculto no espaço.';
}
