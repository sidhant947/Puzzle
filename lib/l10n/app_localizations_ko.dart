// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '퍼즐 허브';

  @override
  String get home => '홈';

  @override
  String get settings => '설정';

  @override
  String get playAgain => '다시 플레이';

  @override
  String get playNext => '다음 놀이';

  @override
  String get seeCompleted => '퍼즐 검토';

  @override
  String get finish => '종료';

  @override
  String get congrats => '축하합니다';

  @override
  String get perfectGradient => '완벽한 그라데이션!';

  @override
  String get wellDone => '잘했습니다';

  @override
  String get timeUp => '시간 종료!';

  @override
  String get completed => '완료!';

  @override
  String get score => '점수';

  @override
  String get timeLeft => '시간';

  @override
  String get trials => '시도';

  @override
  String get numberRule => '숫자 규칙';

  @override
  String get colorRule => '색상 규칙';

  @override
  String get valid => '유효';

  @override
  String get invalid => '유효하지 않음';

  @override
  String get even => '짝수';

  @override
  String get odd => '홀수';

  @override
  String get red => '빨강';

  @override
  String get green => '초록';

  @override
  String get blue => '파랑';

  @override
  String get yes => '예';

  @override
  String get no => '아니요';

  @override
  String get trueLabel => '참';

  @override
  String get falseLabel => '거짓';

  @override
  String get clear => '지우기';

  @override
  String get north => '북';

  @override
  String get south => '남';

  @override
  String get east => '동';

  @override
  String get west => '서';

  @override
  String get target => '목표';

  @override
  String get moves => '이동';

  @override
  String get trialMode => '시도 모드';

  @override
  String get trialModeDescription => '60초 타이머 대신 20개 해결 시 종료';

  @override
  String get appearance => '외형';

  @override
  String get language => '언어';

  @override
  String get gameplay => '게임플레이';

  @override
  String get supportUs => '후원하기';

  @override
  String get systemLegal => '시스템 및 법적 정보';

  @override
  String get games => '게임';

  @override
  String get solvedToday => '오늘 해결함';

  @override
  String get searchGames => '게임 검색...';

  @override
  String get readyToStart => '두뇌 운동을 시작할 준비가 되셨나요?';

  @override
  String get greatStart => '좋은 시작입니다! 이 기세를 이어가세요.';

  @override
  String get onFire => '대단해요! 두뇌가 활성화되고 있습니다.';

  @override
  String get incredible => '믿기지 않네요! 당신은 퍼즐 마스터입니다.';

  @override
  String get noGamesMatch => '검색 결과와 일치하는 게임이 없습니다';

  @override
  String get categoryAll => '전체';

  @override
  String get categoryAttention => '주의력';

  @override
  String get categoryLogic => '논리';

  @override
  String get categoryMath => '수학';

  @override
  String get categoryWord => '언어';

  @override
  String get categoryMemory => '기억력';

  @override
  String get categorySpatial => '공간지각';

  @override
  String get themeLight => '라이트';

  @override
  String get themeDark => '다크';

  @override
  String get themeSystem => '시스템';

  @override
  String get starOnGithub => 'GitHub에서 별 주기';

  @override
  String get sponsorOnGithub => 'GitHub에서 후원하기';

  @override
  String get privacyPolicy => '개인정보 처리방침';

  @override
  String get termsOfService => '서비스 약관';

  @override
  String get licenses => '라이선스';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return '숨겨진 $wordLength자리 단어를 찾을 기회가 $maxTries번 남았습니다.';
  }

  @override
  String wordFoundMessage(String word) {
    return '단어를 찾았습니다: $word';
  }

  @override
  String gameOverMessage(String word) {
    return '정답은: $word';
  }

  @override
  String get gameOver => '게임 종료';

  @override
  String get crosswordTitle => '크로스워드';

  @override
  String get crosswordSubtitle => '제공된 힌트를 바탕으로 격자를 올바른 단어로 채우세요.';

  @override
  String get wordSearchTitle => '단어 찾기';

  @override
  String get radicalRootsTitle => '근호 계산';

  @override
  String get radicalRootsSubtitle =>
      '주어진 수의 제곱근 또는 세제곱근을 구하세요. 필요한 경우 가장 가까운 정수로 반올림하세요.';

  @override
  String get radicalRootsGoalReached => '목표 달성!';

  @override
  String get radicalRootsTimeUp => '시간 종료!';

  @override
  String radicalRootsScoreMessage(int score) {
    return '$score개의 근호를 정확히 계산했습니다!';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return '계속 연습하세요! $score개의 근호를 계산했습니다.';
  }

  @override
  String get radicalRootsStart => '계산 시작';

  @override
  String get radicalRootsDescription => '60초 동안 가능한 한 많이 푸세요.';

  @override
  String get radicalRootsBest => '최고 기록';

  @override
  String get radicalRootsSeconds => '60초';

  @override
  String get romanArithmeticTitle => '로마 숫자 산술';

  @override
  String get romanArithmeticSubtitle => '로마 숫자를 사용하여 덧셈과 뺄셈 문제를 푸세요.';

  @override
  String get romanArithmeticGoalReached => '백인대장 레벨!';

  @override
  String get romanArithmeticTimeUp => '시간 종료!';

  @override
  String romanArithmeticScoreMessage(int score) {
    return '$score개의 로마 숫자 문제를 풀었습니다!';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return '왔노라, 보았노라, 이겼노라! $score문제를 풀었습니다.';
  }

  @override
  String get romanArithmeticStart => '퀘스트 시작';

  @override
  String get romanArithmeticDescription => '변환하고 푸세요. 제한 시간은 60초입니다.';

  @override
  String get romanArithmeticBest => '최고 기록';

  @override
  String get romanArithmeticSeconds => '60초';

  @override
  String get wordSearchSubtitle => '격자에서 숨겨진 단어를 모두 찾으세요. 드래그하여 선택합니다.';

  @override
  String get missingVowelsTitle => '모음 찾기';

  @override
  String get missingVowelsSubtitle => '모음이 숨겨진 단어를 식별하세요.';

  @override
  String get missingVowelsWin => '모음 복구 완료!';

  @override
  String get missingVowelsHowToPlay =>
      '모음(A, E, I, O, U)이 숨겨진 단어가 표시됩니다. 전체 단어를 맞혀보세요!';

  @override
  String get wordScrambleTitle => '단어 재배열';

  @override
  String get wordScrambleSubtitle => '글자를 탭하여 숨겨진 단어를 완성하세요!';

  @override
  String get wordScrambleWin => '단어 완성!';

  @override
  String get sudokuTitle => '스도쿠';

  @override
  String get sudokuSubtitle => '모든 행, 열, 3x3 박스에 1부터 9까지의 숫자가 하나씩 들어가도록 채우세요.';

  @override
  String get minesweeperTitle => '지뢰찾기';

  @override
  String get minesweeperSubtitle => '지뢰를 밟지 않고 모든 지뢰를 찾아내세요.';

  @override
  String get minesweeperWin => '승리!';

  @override
  String get minesweeperMines => '지뢰';

  @override
  String get minesweeperStatus => '상태';

  @override
  String get minesweeperWon => '승리함';

  @override
  String get minesweeperBoom => '폭발';

  @override
  String get minesweeperPlaying => '플레이 중';

  @override
  String get minesweeperReveal => '공개';

  @override
  String get minesweeperFlag => '깃발';

  @override
  String get game2048Title => '2048';

  @override
  String get game2048Subtitle => '아무 방향으로나 밀어서 타일을 합치고 2048 타일에 도달하세요!';

  @override
  String get nonogramTitle => '노노그램';

  @override
  String get nonogramSubtitle => '논리 힌트를 사용하여 숨겨진 이미지를 찾아내세요.';

  @override
  String get nonogramWin => '이미지 완성!';

  @override
  String get magnetsTitle => '마그넷';

  @override
  String get magnetsSubtitle => '극 수에 따라 그리드에 자석을 배치하세요.';

  @override
  String get magnetsHowToPlay =>
      '도미노 크기의 용기에 \'+\' 및 \'-\' 자석을 채우거나 비워 둡니다. 행과 열의 힌트는 해당 라인의 각 극의 총 수를 지정합니다. 동일한 극은 직교하여 인접할 수 없습니다.';

  @override
  String get magnetsWinTitle => '극성 균형!';

  @override
  String get magnetsWinMessage => '모든 자석이 완벽하게 배치되었습니다!';

  @override
  String get lighthousesTitle => '등대';

  @override
  String get lighthousesSubtitle => '등대 힌트에 따라 배를 배치하세요.';

  @override
  String get lighthousesHowToPlay =>
      '그리드에 1x1 배를 배치하세요. 등대는 가로 및 세로로 보이는 배의 총 수를 나타냅니다. 배는 등대나 서로에게 대각선으로도 닿을 수 없습니다.';

  @override
  String get lighthousesWinTitle => '바다 안전!';

  @override
  String get lighthousesWinMessage => '모든 등대가 배를 완벽하게 안내하고 있습니다!';

  @override
  String get dominosaTitle => '도미노사';

  @override
  String get dominosaSubtitle => '그리드에 숨겨진 모든 도미노를 찾으세요.';

  @override
  String get dominosaHowToPlay =>
      '인접한 모든 숫자 쌍이 정확히 하나의 도미노로 덮이도록 숫자 그리드에 전체 도미노 세트를 배치하세요. 각 숫자 쌍은 세트에 단 한 번만 존재합니다.';

  @override
  String get dominosaWinTitle => '도미노 마스터!';

  @override
  String get dominosaWinMessage => '모든 도미노를 찾아 배치했습니다!';

  @override
  String get skyscrapersTitle => '스카이스크래퍼';

  @override
  String get skyscrapersSubtitle => '그리드를 건물 높이로 채우세요.';

  @override
  String get skyscrapersHowToPlay =>
      '각 행과 열에 각 높이가 정확히 한 번씩 포함되도록 그리드를 높이(1-N)로 채우세요. 가장자리의 힌트는 해당 방향에서 보이는 건물의 수를 나타내며, 높은 건물이 낮은 건물을 가립니다.';

  @override
  String get skyscrapersWinTitle => '스카이라인 복구!';

  @override
  String get skyscrapersWinMessage => '모든 건물이 완벽하게 배치되었습니다!';

  @override
  String get nurikabeTitle => '누리카베';

  @override
  String get nurikabeSubtitle => '연결된 바다와 분리된 섬을 만드세요.';

  @override
  String get nurikabeHowToPlay =>
      '셀을 칠하여 하나의 연결된 \'바다\'를 만듭니다(2x2 블록 금지). 칠하지 않은 셀은 \'섬\'을 형성하며, 각 섬에는 총 면적을 나타내는 숫자가 정확히 하나 포함됩니다.';

  @override
  String get nurikabeWinTitle => '바다가 흐른다!';

  @override
  String get nurikabeWinMessage => '섬이 분리되고 바다가 연결되었습니다!';

  @override
  String get fillominoTitle => '필로미노';

  @override
  String get fillominoSubtitle => '그리드를 지정된 크기의 폴리오미노로 나눕니다.';

  @override
  String get fillominoHowToPlay =>
      '그리드를 폴리오미노로 나누어 크기 N의 각 폴리오미노가 모든 셀에 숫자 N을 포함하도록 합니다. 같은 크기의 폴리오미노는 직교하여 인접할 수 없습니다.';

  @override
  String get fillominoWinTitle => '그리드 분할!';

  @override
  String get fillominoWinMessage => '논리로 완벽하게 타일링되었습니다!';

  @override
  String get hitoriTitle => '히토리';

  @override
  String get hitoriSubtitle => '각 행과 열의 중복 숫자를 칠하세요.';

  @override
  String get hitoriHowToPlay =>
      '어떤 행이나 열에서도 숫자가 두 번 이상 나타나지 않도록 셀을 칠하세요. 칠한 셀은 (직교하여) 인접할 수 없으며, 칠하지 않은 모든 셀은 하나의 연결된 그룹을 형성해야 합니다.';

  @override
  String get hitoriWinTitle => '히토리 마스터!';

  @override
  String get hitoriWinMessage => '모든 중복을 성공적으로 해결했습니다!';

  @override
  String get pathFinderTitle => '경로 찾기';

  @override
  String get pathFinderSubtitle => 'S에서 E까지 숨겨진 경로를 찾으세요.';

  @override
  String get pathFinderWin => '경로 마스터!';

  @override
  String get howToPlay => '게임 방법';

  @override
  String get gotIt => '확인';

  @override
  String get akariTitle => '아카리';

  @override
  String get akariSubtitle => '모든 흰색 칸을 밝히세요';

  @override
  String get akariHowToPlay => '모든 흰색 칸을 밝히세요';

  @override
  String get akariWinTitle => '점등 완료!';

  @override
  String get akariWinMessage => '모든 곳이 완벽하게 밝혀졌습니다.';

  @override
  String get arithmeticChainTitle => '체인 계산';

  @override
  String get arithmeticChainSubtitle => '머릿속으로 누적 합계를 계산하세요';

  @override
  String get arithmeticChainWinTitle => '레벨 업!';

  @override
  String get arithmeticChainWinMessage => '암산 실력이 대단하시네요!';

  @override
  String get arithmeticChainLoseTitle => '다시 시도';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return '정답은 $answer였습니다.';
  }

  @override
  String get arithmeticChainStart => '시작';

  @override
  String get arithmeticChainNext => '다음';

  @override
  String get attentionalBlinkTitle => '주의력 깜빡임';

  @override
  String get attentionalBlinkSubtitleWatch => '숫자를 주의 깊게 보세요';

  @override
  String get attentionalBlinkSubtitleInput => '보았던 두 숫자를 입력하세요';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return '$score개의 목표를 맞혔습니다!';
  }

  @override
  String get balanceScaleTitle => '천칭 저울';

  @override
  String get balanceScaleSubtitle => '저울을 바탕으로 마지막 아이템의 무게를 추론하세요.';

  @override
  String get balanceScaleWinTitle => '균형 달성!';

  @override
  String get balanceScaleWinMessage => '무게를 올바르게 추론했습니다!';

  @override
  String get balanceScaleLoseTitle => '불균형';

  @override
  String get balanceScaleLoseMessage => '올바른 균형을 찾기 위해 다시 시도해보세요.';

  @override
  String get balanceScaleBack => '뒤로';

  @override
  String get balanceScaleSubmit => '제출';

  @override
  String get binaryPuzzleTitle => '이진 퍼즐';

  @override
  String get binaryPuzzleSubtitle =>
      '0과 1로 채우세요. 동일한 숫자가 3개 이상 인접할 수 없습니다. 각 행과 열의 0과 1의 개수는 같아야 합니다.';

  @override
  String get binaryPuzzleWinTitle => '잘했습니다';

  @override
  String get binaryPuzzleWinMessage => '완벽한 논리로 이진 퍼즐을 해결했습니다!';

  @override
  String get blockEscapeTitle => '블록 탈출';

  @override
  String get blockEscapeSubtitle => '블록을 밀어서 주요 블록이 출구로 나갈 수 있도록 길을 만드세요.';

  @override
  String get blockEscapeWinTitle => '탈출!';

  @override
  String get blockEscapeWinMessage => '주요 블록을 위한 길을 성공적으로 만들었습니다!';

  @override
  String get boxCompletionTitle => '상자 완성';

  @override
  String get boxCompletionSubtitle => '어떤 입체도형을 만들 수 있을까요?';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return '$totalTrials번 중 $score번 성공했습니다!';
  }

  @override
  String get boxCompletionOptions => '옵션';

  @override
  String get bridgesTitle => '다리 놓기';

  @override
  String get bridgesSubtitle =>
      '섬들을 다리로 연결하세요. 각 섬은 정해진 수의 다리가 필요합니다. 다리는 서로 교차할 수 없습니다.';

  @override
  String get bridgesWinTitle => '연결 완료!';

  @override
  String get bridgesWinMessage => '모든 섬을 성공적으로 연결했습니다!';

  @override
  String get calculationSprintTitle => '계산 스프린트';

  @override
  String get calculationSprintSubtitle => '60초 동안 최대한 많은 수식을 해결하세요.';

  @override
  String get calculationSprintGoalReached => '목표 달성!';

  @override
  String get calculationSprintTimeUp => '시간 종료';

  @override
  String calculationSprintScoreMessage(int score) {
    return '훌륭한 계산 속도입니다! $score점을 획득했습니다.';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return '$score점을 획득했습니다. 최고 기록에 도전해보세요!';
  }

  @override
  String get calculationSprintBest => '최고 기록';

  @override
  String get calculationSprintSeconds => '60초';

  @override
  String get calculationSprintDescription => '수식을 빠르게 해결하세요.\n오답 시 3초가 차감됩니다!';

  @override
  String get calculationSprintStart => '스프린트 시작';

  @override
  String get categoryFluencyTitle => '카테고리 유창성';

  @override
  String get categoryFluencySubtitle => '카테고리에 속하는 아이템을 입력하세요';

  @override
  String get categoryFluencyExpert => '유창성 전문가!';

  @override
  String get categoryFluencyTimeUp => '시간 종료!';

  @override
  String get categoryFluencyWinMessage => '어휘력이 정말 풍부하시네요!';

  @override
  String categoryFluencyFoundMessage(int count) {
    return '$count개의 단어를 찾았습니다.';
  }

  @override
  String get categoryFluencyCategoryLabel => '카테고리:';

  @override
  String get categoryFluencyEnterItem => '아이템 입력...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target 단어';
  }

  @override
  String get changeBlindnessTitle => '변화맹';

  @override
  String get changeBlindnessSubtitle => '변화하는 아이템을 찾으세요';

  @override
  String changeBlindnessScore(int score) {
    return '점수: $score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return '$score개의 변화를 찾았습니다!';
  }

  @override
  String get choiceRtTitle => '선택 반응 시간';

  @override
  String get choiceRtSubtitle => '활성화된 사각형을 최대한 빨리 탭하세요';

  @override
  String choiceRtAvgMessage(String avg) {
    return '평균 반응 시간: ${avg}ms';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return '남은 시간: $time초';
  }

  @override
  String choiceRtTaps(int count) {
    return '탭 횟수: $count';
  }

  @override
  String get colorFloodTitle => '컬러 플러드';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return '이동: $moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => '플러드 성공!';

  @override
  String get colorFloodDryLand => '시도 실패...';

  @override
  String get colorFloodWinMessage => '격자 전체를 색상으로 가득 채웠습니다!';

  @override
  String get colorFloodLoseMessage => '이동 횟수를 모두 소모했습니다. 다시 시도해보세요!';

  @override
  String get colorMatchTitle => '컬러 매치';

  @override
  String get colorMatchSubtitle => '슬라이더를 조절하여 목표 색상과 최대한 비슷하게 맞추세요.';

  @override
  String get colorMatchTarget => '목표';

  @override
  String get colorMatchYours => '내 색상';

  @override
  String get colorMatchCheck => '확인';

  @override
  String get colorMatchResult => '일치 결과';

  @override
  String colorMatchAccuracy(String accuracy) {
    return '정확도: $accuracy%';
  }

  @override
  String get corsiBlocksTitle => '코시 블록';

  @override
  String get corsiBlocksSubtitle => '블록이 켜지는 순서를 기억하고 똑같이 탭하세요.';

  @override
  String get corsiBlocksWinTitle => '공간지각 마스터!';

  @override
  String get corsiBlocksLoseTitle => '기억 오류';

  @override
  String corsiBlocksMessage(int score, int span) {
    return '$score개의 시퀀스를 맞혔습니다! 공간 기억 폭이 $span에 도달했습니다.';
  }

  @override
  String get corsiBlocksWatch => '패턴을 기억하세요';

  @override
  String get corsiBlocksRepeat => '패턴을 반복하세요';

  @override
  String get corsiBlocksExcellent => '훌륭합니다!';

  @override
  String get corsiBlocksSpan => '범위';

  @override
  String get crownTitle => '크라운';

  @override
  String get crownSubtitle =>
      '각 행, 열, 색상 영역에 왕관을 하나씩 배치하세요. 왕관은 대각선을 포함하여 서로 인접할 수 없습니다.';

  @override
  String get crownCrowned => '성공!';

  @override
  String get crownSuccess => '완벽한 논리로 모든 왕관을 배치했습니다.';

  @override
  String get cryptogramTitle => '크립토그램';

  @override
  String get cryptogramSubtitle =>
      '암호화된 글자를 해독하여 비밀 메시지를 찾으세요! 각 암호 글자는 실제 글자를 나타냅니다.';

  @override
  String get cryptogramBroken => '암호 해독!';

  @override
  String get cryptogramEncrypted => '암호화됨';

  @override
  String get cryptogramSuccess => '메시지를 완벽하게 해독했습니다.';

  @override
  String get cryptogramTryAgain => '다시 시도하여 암호를 풀어보세요.';

  @override
  String get digitSpanReverseTitle => '역순 기억';

  @override
  String get digitSpanReverseSubtitleMemorize => '숫자를 기억하세요';

  @override
  String get digitSpanReverseSubtitleEnter => '숫자를 역순으로 입력하세요';

  @override
  String get digitSpanReverseWinTitle => '레벨 업!';

  @override
  String get digitSpanReverseWinMessage => '작업 기억력이 인상적입니다!';

  @override
  String get digitSpanReverseLoseTitle => '다시 시도';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return '올바른 역순 시퀀스는 $sequence였습니다.';
  }

  @override
  String get dividedAttentionTitle => '분할 주의력';

  @override
  String get dividedAttentionSubtitle => '별 ⭐은 왼쪽 | 빨간색 🔴은 오른쪽 탭';

  @override
  String get dividedAttentionGameOverTitle => '집중력 분산';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return '멀티태스킹은 어렵네요! 점수는 $score점입니다.';
  }

  @override
  String dividedAttentionScore(int score) {
    return '점수: $score';
  }

  @override
  String get doubleNBackTitle => '더블 N-Back';

  @override
  String doubleNBackSubtitle(int n) {
    return '$n단계 전의 자극과 일치하는지 맞히세요';
  }

  @override
  String get doubleNBackGameOverTitle => '게임 종료';

  @override
  String doubleNBackGameOverMessage(int score) {
    return '더블 N-Back에서 $score점을 기록했습니다!';
  }

  @override
  String doubleNBackScore(int score) {
    return '점수: $score';
  }

  @override
  String get doubleNBackPositionMatch => '위치 일치';

  @override
  String get doubleNBackLetterMatch => '글자 일치';

  @override
  String get faceNameAssociationTitle => '얼굴-이름 연상';

  @override
  String get faceNameAssociationSubtitleStudy => '각 얼굴의 이름을 기억하세요';

  @override
  String get faceNameAssociationSubtitleTest => '이분은 누구일까요?';

  @override
  String get faceNameAssociationPerfect => '완벽합니다!';

  @override
  String get faceNameAssociationGameOver => '게임 종료';

  @override
  String get faceNameAssociationWinMessage => '얼굴과 이름을 기억하는 능력이 훌륭하시네요!';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return '$total개 중 $correct개를 맞혔습니다.';
  }

  @override
  String get faceNameAssociationStartTest => '테스트 시작';

  @override
  String get flankerTestWinTitle => '놀라운 집중력!';

  @override
  String get flankerTestLoseTitle => '주의 산만';

  @override
  String flankerTestScoreMessage(int score) {
    return '$score개를 올바르게 맞혔습니다!';
  }

  @override
  String get flankerTestTitle => '플랭커 테스트';

  @override
  String get flankerTestSubtitle => '주변 화살표를 무시하고 중앙 화살표의 방향을 가리키세요.';

  @override
  String get flankerTestLeft => '왼쪽';

  @override
  String get flankerTestRight => '오른쪽';

  @override
  String get fractionMatchTitle => '분수 매치';

  @override
  String get fractionMatchSubtitle => '그림에 알맞은 분수를 찾으세요';

  @override
  String get fractionMatchLoseTitle => '불일치';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return '정답은 $correctAnswer였습니다.';
  }

  @override
  String get goNoGoTitle => 'Go / No-Go';

  @override
  String get goNoGoSubtitle => '초록색은 탭하고, 빨간색은 무시하세요!';

  @override
  String get goNoGoLoseTitle => '반응 실패';

  @override
  String get goNoGoLoseMessage => '억제 조절 능력을 테스트 중입니다!';

  @override
  String get goNoGoTapAnywhere => '시작하려면 아무 곳이나 탭하세요';

  @override
  String get groceryListTitle => '식료품 목록';

  @override
  String get groceryListSubtitleMemorize => '아이템과 카테고리를 기억하세요';

  @override
  String get groceryListSubtitleTest => '이 아이템은 어느 카테고리에 속했나요?';

  @override
  String get groceryListWinTitle => '쇼핑 전문가!';

  @override
  String get groceryListLoseTitle => '잊으신 게 있나요?';

  @override
  String groceryListScoreMessage(int score) {
    return '식료품 목록 게임에서 $score점을 기록했습니다!';
  }

  @override
  String get groceryListReady => '준비되었습니다';

  @override
  String get groceryListWhereBelong => '어디에 속할까요?';

  @override
  String get hueSortTitle => '색상 정렬';

  @override
  String get hueSortSubtitle =>
      '타일을 교체하여 모서리 색상 간의 부드러운 변화를 만드세요. 점이 있는 타일은 고정되어 있습니다.';

  @override
  String get hueSortWinTitle => '완벽한 그라데이션!';

  @override
  String get hueSortWinMessage => '색상 스펙트럼을 완벽하게 정렬했습니다!';

  @override
  String hueSortWrongTiles(int count) {
    return '잘못된 위치의 타일: $count';
  }

  @override
  String get kenkenTitle => '켄켄';

  @override
  String get kenkenWinTitle => '천재!';

  @override
  String get kenkenLoseTitle => '게임 종료';

  @override
  String get kenkenWinMessage => '켄켄 퍼즐을 해결했습니다!';

  @override
  String get kenkenLoseMessage => '행/열 및 케이지 규칙을 확인하세요.';

  @override
  String kenkenSubtitle(int size) {
    return '행/열에 중복 없이 1-$size까지 채우세요';
  }

  @override
  String get letterCancellationTitle => '글자 지우기';

  @override
  String get letterCancellationTitleFull => '글자 지우기 테스트';

  @override
  String letterCancellationScoreMessage(int score) {
    return '$score개의 글자를 찾았습니다!';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return '\"$target\" 글자를 모두 찾으세요';
  }

  @override
  String get letterCancellationFound => '찾음';

  @override
  String get letterCancellationTime => '시간';

  @override
  String get lightsOutTitle => '라이츠 아웃';

  @override
  String get lightsOutSubtitle => '타일을 탭하면 자신과 인접한 타일이 반전됩니다. 모든 불을 꺼서 해결하세요.';

  @override
  String get lightsOutWinTitle => '퍼즐 해결!';

  @override
  String get lightsOutWinMessage => '성공적으로 모든 불을 껐습니다!';

  @override
  String get symmetryTitle => '대칭';

  @override
  String get symmetrySubtitle => '왼쪽의 패턴을 오른쪽 빈 격자에 대칭으로 만드세요.';

  @override
  String get semanticLinkTitle => '의미 연결';

  @override
  String get semanticLinkSubtitle => '세 단어를 모두 연결하는 단어를 찾으세요';

  @override
  String get reflexTapTitle => '반사 탭';

  @override
  String get visualStatisticalLearningTitle => '시각적 학습';

  @override
  String get orbitTapTitle => '오빗 탭';

  @override
  String get orbitTapSubtitle => '공이 게이트에 맞춰질 때 탭하세요';

  @override
  String get schulteTableTitle => '슐테 테이블';

  @override
  String get multipleObjectTrackingTitle => '객체 추적';

  @override
  String get multipleObjectTrackingSubtitle => '강조된 객체를 관찰하고 이동을 추적한 뒤 선택하세요.';

  @override
  String get sdmtTitle => 'SDMT 테스트';

  @override
  String get sdmtSubtitle => '위의 키를 사용하여 기호에 맞는 숫자를 찾으세요.';

  @override
  String get memoryMatrixTitle => '기억 행렬';

  @override
  String get memoryMatrixSubtitle => '패턴을 기억하고 타일을 탭하세요.';

  @override
  String get mentalAbacusTitle => '정신 주판';

  @override
  String get mentalAbacusSubtitle => '주판을 사용하여 계산하세요';

  @override
  String get spellingSprintTitle => '스펠링 스프린트';

  @override
  String get spellingSprintSubtitle => '제한 시간 내에 최대한 많은 단어의 철자를 맞히세요.';

  @override
  String get stopSignalTitle => '정지 신호';

  @override
  String get stopSignalSubtitle => '화살표 방향을 탭하되, 화살표가 빨간색으로 변하면 즉시 멈추세요.';

  @override
  String get staircaseMemoryTitle => '계단 기억';

  @override
  String get vigilanceTaskTitle => '경계 태스크';

  @override
  String get vigilanceTaskSubtitle => '바늘이 한 칸을 건너뛸 때 버튼을 탭하세요';

  @override
  String get logicalSyllogismsTitle => '논리적 삼단논법';

  @override
  String get logicalSyllogismsSubtitle => '결론이 논리적으로 타당합니까?';

  @override
  String get mathPathTitle => '수학 경로';

  @override
  String get mathPathSubtitle => '합계가 목표 수치와 정확히 일치하는 경로를 찾으세요.';

  @override
  String get sternbergTaskTitle => '스턴버그 태스크';

  @override
  String get sternbergTaskMemorize => '글자를 기억하세요';

  @override
  String get sternbergTaskWasLetterSet => '이 글자가 목록에 있었나요?';

  @override
  String sternbergTaskScore(int score) {
    return '스턴버그 태스크에서 $score점을 기록했습니다!';
  }

  @override
  String get verbalAnalogiesTitle => '언어 유추';

  @override
  String get verbalAnalogiesSubtitle => '관계를 완성하세요';

  @override
  String get typingSpeedTitle => '타이핑 속도';

  @override
  String get typingSpeedSubtitle => '문장을 보이는 대로 최대한 빨리 입력하세요!';

  @override
  String get wordLadderTitle => '워드 래더';

  @override
  String get wordLadderSubtitle => '한 번에 한 글자씩 바꿔서 단어들을 연결하세요.';

  @override
  String get tangleFixTitle => '엉킴 풀기';

  @override
  String get tangleFixSubtitle => '선이 겹치지 않도록 정리하세요';

  @override
  String get oddRotationTitle => '이상한 회전';

  @override
  String get oddRotationSubtitle => '하나만 반전되어 있습니다. 찾을 수 있나요?';

  @override
  String get towerOfLondonTitle => '런던 탑';

  @override
  String get towerOfLondonSubtitle => '목표 구성과 일치시키세요';

  @override
  String get symbolicFlankerTitle => '기호 플랭커';

  @override
  String get symbolicFlankerSubtitle => '중앙의 기호에 집중하세요';

  @override
  String get stroopTestTitle => '스트룹 테스트';

  @override
  String get stroopTestSubtitle => '단어의 의미가 아닌, 글자의 색상을 맞히세요!';

  @override
  String get wisconsinCardSortingTitle => '위스콘신 카드 분류';

  @override
  String get wisconsinCardSortingSubtitle => '카드를 위의 네 장 중 하나와 분류 규칙에 맞춰 매치하세요';

  @override
  String get nBackTitle => 'N-Back 테스트';

  @override
  String get nBackSubtitle => '현재 글자가 2단계 전의 글자와 일치하면 \'일치\'를 탭하세요.';

  @override
  String get rhythmMasterTitle => '리듬 마스터';

  @override
  String get rhythmMasterSubtitle => '박자에 맞춰 탭하세요';

  @override
  String get pixelMimicTitle => '픽셀 미믹';

  @override
  String get targetNumberTitle => '목표 숫자 24';

  @override
  String targetNumberSubtitle(int target) {
    return '4개의 숫자를 모두 사용하여 $target를 만드세요';
  }

  @override
  String get mirrorTracingTitle => '거울 따라 그리기';

  @override
  String get mirrorTracingSubtitle => '별을 따라 그리세요! 조작 방향이 반대입니다.';

  @override
  String get wordSurgeTitle => '워드 서지';

  @override
  String get wordSurgeSubtitle => '유의어 및 반의어';

  @override
  String get perspectiveTakingTitle => '관점 수용';

  @override
  String get perspectiveTakingTopDownView => '위에서 본 모습';

  @override
  String get perspectiveTakingChoosePerspective => '관점을 선택하세요';

  @override
  String get perspectiveTakingCongrats => '공간 관계를 파악하는 능력이 뛰어나시네요.';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return '$targetDirName에서 본 모습은 무엇인가요?';
  }

  @override
  String get paperFoldingTitle => '종이 접기';

  @override
  String get paperFoldingSubtitle => '종이를 펼쳤을 때 어떤 모습일까요?';

  @override
  String get waterSortTitle => '워터 소트';

  @override
  String get waterSortSubtitle => '각 튜브에 한 가지 색상만 남도록 색상을 분류하세요.';

  @override
  String get numericalEstimationTitle => '수치 추정';

  @override
  String get numericalEstimationSubtitle => '가장 가까운 정답을 빨리 고르세요!';

  @override
  String get lockPatternTitle => '잠금 패턴';

  @override
  String get lockPatternSubtitle =>
      '비밀 패턴을 찾으세요. 시도할 때마다 위치와 점에 대한 피드백이 제공됩니다.';

  @override
  String get primeHunterTitle => '소수 사냥꾼';

  @override
  String get primeHunterSubtitle => '소수는 왼쪽 | 합성수는 오른쪽으로 미세요';

  @override
  String get tracePathTitle => '경로 추적';

  @override
  String get tracePathSubtitle => '목표 경로를 최대한 정확하게 따라가세요';

  @override
  String get ruleSwitcherTitle => '규칙 전환';

  @override
  String get ruleSwitcherSubtitle => '현재 규칙을 적용하세요';

  @override
  String get choiceReactionTimeTitle => '선택 반응 시간';

  @override
  String get pathRecallTitle => '경로 기억';

  @override
  String get switchTaskTitle => '전환 태스크';

  @override
  String get switchTaskSubtitle => '규칙에 주의하세요! 모양 맞추기와 색상 맞추기 사이에서 전환됩니다.';

  @override
  String get mentalRotationTitle => '정신적 회전';

  @override
  String get mentalRotationSubtitle => '회전된 이 도형들은 같은 도형인가요?';

  @override
  String get missingOperatorTitle => '연산자 찾기';

  @override
  String get missingOperatorSubtitle => '수식을 완성하기 위해 빈칸을 채우세요';

  @override
  String get wordMastermindTitle => '워드 마스터마인드';

  @override
  String get wordMastermindSubtitle =>
      '4글자 코드를 맞히세요! B는 위치와 글자 모두 일치, C는 글자만 일치합니다.';

  @override
  String get simonSequenceTitle => '사이먼 시퀀스';

  @override
  String get symbolLogicTitle => '기호 논리';

  @override
  String get symbolLogicSubtitle =>
      '시각적 방정식을 풀어 각 기호의 값을 찾으세요. 마지막 방정식의 결과는 무엇일까요?';

  @override
  String get silhouetteMatchTitle => '실루엣 매치';

  @override
  String get silhouetteMatchSubtitle => '이 물체와 일치하는 실루엣은 무엇인가요?';

  @override
  String get operationSpanTitle => '작업 범위';

  @override
  String get operationSpanMathPhase => '방정식이 맞습니까?';

  @override
  String get operationSpanLetterPhase => '글자를 기억하세요';

  @override
  String get operationSpanRecallPhase => '기억한 글자들을 순서대로 입력하세요';

  @override
  String get operationSpanRoundComplete => '라운드 종료!';

  @override
  String operationSpanScore(int score) {
    return '작업 범위 게임에서 $score점을 기록했습니다!';
  }

  @override
  String get slidePuzzleTitle => '슬라이드 퍼즐';

  @override
  String get slidePuzzleNewGame => '새 게임';

  @override
  String get slidePuzzleInstructions => '빈 공간으로 타일을 밀어서 숫자를 순서대로 정렬하세요.';

  @override
  String get slidePuzzleTileSlider => '타일 슬라이더';

  @override
  String get slidePuzzleCongrats => '성공적으로 모든 타일을 정렬했습니다.';

  @override
  String get visualSearchTitle => '시각적 검색';

  @override
  String get visualSearchSubtitle => '격자에서 유일한 기호를 찾으세요';

  @override
  String get trailMakingTitle => '길 만들기';

  @override
  String get trailMakingSubtitle => '숫자를 순서대로(1 -> 2 -> 3...) 최대한 빨리 연결하세요.';

  @override
  String get matrixReasoningTitle => '행렬 추론';

  @override
  String get matrixReasoningSubtitle => '3x3 격자의 패턴을 완성하세요';

  @override
  String get tentsAndTreesTitle => '텐트와 나무';

  @override
  String get tentsAndTreesSubtitle =>
      '나무 옆에 텐트를 배치하세요. 숫자는 각 행/열에 필요한 텐트의 수입니다. 텐트는 서로 닿을 수 없습니다.';

  @override
  String get quickMathTitle => '빠른 수학';

  @override
  String get magicSquaresTitle => '마방진';

  @override
  String magicSquaresSubtitle(int targetSum) {
    return '모든 행, 열, 대각선의 합이 $targetSum이 되어야 합니다.';
  }

  @override
  String get objectShuffleTitle => '물체 셔플';

  @override
  String get pipesTitle => '파이프';

  @override
  String get pipesSubtitle => '같은 색상의 점들을 파이프로 연결하세요.';

  @override
  String get oddOneOutTitle => '다른 것 찾기';

  @override
  String get oddOneOutSubtitle => '색상이 다른 타일을 찾으세요.';

  @override
  String get einsteinRiddleTitle => '아인슈타인 수수께끼';

  @override
  String get einsteinRiddleSubtitle => '힌트를 사용하여 각 집의 속성을 추론하세요.';

  @override
  String get einsteinRiddleHowToPlay =>
      '각 집은 고유한 속성(색상, 국적, 애완동물 등)을 가지고 있습니다. 제공된 힌트를 사용해 격자를 채워 전체 해결책을 찾으세요.';

  @override
  String get einsteinRiddleColor => '색상';

  @override
  String get einsteinRiddleNationality => '국적';

  @override
  String get einsteinRiddleDrink => '음료';

  @override
  String get einsteinRiddlePet => '반려동물';

  @override
  String get einsteinRiddleSmoke => '담배';

  @override
  String get einsteinRiddleHouse => '집';

  @override
  String get mirrorImageTitle => '거울 이미지';

  @override
  String get mirrorImageSubtitle => '올바른 거울 반사 이미지를 찾으세요.';

  @override
  String get mirrorImageHowToPlay => '모양을 보고 옵션 중에서 올바른 거울 반사 이미지를 선택하세요.';

  @override
  String get mentalMappingTitle => '정신적 지도';

  @override
  String get mentalMappingSubtitle => '방향을 따라가며 목적지를 찾으세요.';

  @override
  String get mentalMappingHowToPlay =>
      '동서남북 방향 시퀀스가 표시됩니다. 격자 중앙에서 시작해 머릿속으로 경로를 따라간 뒤 최종 목적지를 선택하세요.';

  @override
  String get memoryPalaceTitle => '기억의 궁전';

  @override
  String get memoryPalaceSubtitle => '어떤 단어가 어느 위치에 있었는지 기억하세요.';

  @override
  String get memoryPalaceHowToPlay =>
      '단어들이 격자의 여러 위치에 나타납니다. 위치를 기억한 뒤, 원래 위치에 단어들을 다시 배치하세요.';

  @override
  String get countingSheepTitle => '양 세기';

  @override
  String get countingSheepSubtitle => '양을 몇 마리 보았나요?';

  @override
  String get countingSheepHowToPlay =>
      '양이 화면을 빠르게 가로질러 달려갑니다. 지나가는 양의 수를 세고 마지막에 총합을 입력하세요.';

  @override
  String get faceTraitAssociationTitle => '얼굴-특징 연상';

  @override
  String get faceTraitAssociationSubtitle => '각 얼굴의 특징을 기억하세요';

  @override
  String get faceTraitAssociationHowToPlay =>
      '얼굴들과 함께 이름, 직업, 취미가 표시됩니다. 이 관계를 기억한 뒤, 나중에 각 얼굴의 특정 특징을 맞히세요.';

  @override
  String get mentalCalendarTitle => '정신력 달력';

  @override
  String get mentalCalendarSubtitle => '요일을 계산하세요';

  @override
  String get mentalCalendarHowToPlay =>
      '무작위 날짜가 표시됩니다. 암산(또는 둠스데이 알고리즘)을 사용하여 해당 날짜가 무슨 요일인지 맞히세요.';

  @override
  String get vocabularyBuilderTitle => '어휘력 향상';

  @override
  String get vocabularyBuilderSubtitle => '제한 시간 내에 유의어와 반의어를 맞히세요.';

  @override
  String get vocabularyBuilderHowToPlay =>
      '목표 단어와 관계(유의어 또는 반의어)가 주어집니다. 옵션 중에서 관계에 맞는 단어를 고르세요. 시간이 촉박하니 서두르세요!';

  @override
  String get correct => '정답';

  @override
  String get incorrect => '오답';

  @override
  String get grammarPoliceTitle => '문법 경찰';

  @override
  String get grammarPoliceSubtitle => '문장이 문법적으로 올바른지 또는 오류가 포함되어 있는지 확인하세요.';

  @override
  String get grammarPoliceHowToPlay =>
      '화면 중앙에 문장이 나타납니다. 문법적으로 올바른지 또는 오류가 있는지 결정하세요. 괜찮으면 \'정답\'을, 실수를 발견하면 \'오답\'을 누르세요. 모든 생명을 잃지 마세요!';

  @override
  String get reverseStroopTitle => '역 스트룹';

  @override
  String get reverseStroopSubtitle => '집중 대상이 바뀌는 스트룹 테스트의 변형입니다.';

  @override
  String get reverseStroopHowToPlay =>
      '지침에 주의하세요! \'텍스트\'라고 나오면 단어의 의미를, \'색상\'이라고 나오면 글자의 색상을 맞히세요. 집중력을 테스트하기 위해 규칙이 자주 바뀝니다.';

  @override
  String get game2048Instruction => '아무 방향으로나 밀어서 합치세요';

  @override
  String get fibonacciMergeTitle => '피보나치 머지';

  @override
  String get fibonacciMergeSubtitle =>
      '연속된 피보나치 수(1, 1, 2, 3, 5, 8, 13...)를 합치세요.';

  @override
  String get sequenceSleuthTitle => '수열 탐정';

  @override
  String get sequenceSleuthSubtitle => '수학적 수열에서 빠진 숫자를 찾으세요.';

  @override
  String get divisibilityDashTitle => '배수 대시';

  @override
  String get divisibilityDashSubtitle => '주어진 숫자의 한 자리 약수(2-9)를 모두 탭하세요.';

  @override
  String get percentagePeakTitle => '퍼센트 피크';

  @override
  String get percentagePeakSubtitle => '암산으로 퍼센트 계산을 빠르게 해결하세요.';

  @override
  String get vennNumbersTitle => '벤 다이어그램 숫자';

  @override
  String get vennNumbersSubtitle => '숫자를 벤 다이어그램의 올바른 영역으로 분류하세요.';

  @override
  String get commonDenominatorTitle => '공통 분모';

  @override
  String get commonDenominatorSubtitle => '최대공약수나 최소공배수를 찾으세요.';

  @override
  String get angleFinderTitle => '각도 찾기';

  @override
  String get angleFinderSubtitle => '기하학 문제에서 빠진 각도를 계산하세요.';

  @override
  String get sumSnakeTitle => '합계 스네이크';

  @override
  String get sumSnakeSubtitle => '인접한 숫자를 연결하여 목표 합계에 도달하세요.';

  @override
  String get baseShiftTitle => '진법 변환 블리츠';

  @override
  String get baseShiftSubtitle => '10진수로 해결';

  @override
  String get baseShiftDescription => '수식을 풀고 답을 10진수(Base 10)로 입력하세요.';

  @override
  String get baseShiftEquation => '수식';

  @override
  String get baseShiftHint => '10진수 결과 입력...';

  @override
  String get baseShiftCorrect => '정답입니다!';

  @override
  String get baseShiftIncorrect => '틀렸습니다!';

  @override
  String get baseShiftSubmit => '제출';

  @override
  String get baseShiftQuickGuide => '빠른 가이드:';

  @override
  String get baseShiftBinary => '2진수 (bin): 2진법 (0, 1)';

  @override
  String get baseShiftHex => '16진수 (0x): 16진법 (0-9, A-F)';

  @override
  String get baseShiftDecimal => '10진수 (dec): 10진법 (0-9)';

  @override
  String get baseShiftWinTitle => '수학 마법사!';

  @override
  String get baseShiftWinMessage => '5개의 진법 변환 수식을 모두 맞혔습니다!';

  @override
  String get blockCount3DTitle => '3D 블록 세기';

  @override
  String get blockCount3DSubtitle => '드래그하여 회전 • 숨겨진 블록 세기';

  @override
  String get blockCount3DHowMany => '블록이 몇 개인가요?';

  @override
  String get blockCount3DSubmitGuess => '답안 제출';

  @override
  String get blockCount3DNotQuite => '아쉬워요! 회전시켜서 다시 세어보세요.';

  @override
  String get blockCount3DExcellent => '훌륭합니다';

  @override
  String blockCount3DWinMessage(int count) {
    return '$count개의 블록을 모두 정확히 찾았습니다!';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '1. 3D 뷰포트를 손가락으로 드래그하여 블록 스택을 회전시킵니다.\n\n2. 스택에 있는 모든 블록의 개수를 셉니다.\n\n3. 기억하세요: 공중에 떠 있는 블록은 아래에 구조적 지지 블록이 있어야 합니다 (숨겨진 블록!).\n\n4. 입력 필드에 정답을 입력하고 \"답안 제출\"을 눌러 확인하세요.';

  @override
  String get alphabetSudokuTitle => '알파벳 스도쿠';

  @override
  String get alphabetSudokuSubtitle => '모든 행, 열, 박스에 A-I 글자가 들어가도록 격자를 채우세요.';

  @override
  String get alphabetSudokuWinTitle => '스도쿠 해결!';

  @override
  String get alphabetSudokuWinMessage => '멋져요! 알파벳을 완벽히 마스터했습니다.';

  @override
  String get classicMazeTitle => '클래식 미로';

  @override
  String get classicMazeSubtitle => '탐험하고 해결하기 • 매번 새로운 미로';

  @override
  String get classicMazeWinTitle => '미로 탈출';

  @override
  String classicMazeWinMessage(int count) {
    return '놀라운 길 찾기 능력이네요! $count번의 이동으로 미로를 풀었습니다.';
  }

  @override
  String get classicMazeMoves => '이동 횟수: ';

  @override
  String get classicMazeHowToPlayDescription =>
      '1. 빛나는 노란 구슬(플레이어)을 오른쪽 하단의 초록색 포털(출구)로 인도하세요.\n\n2. 미로 위를 스와이프하거나, 키보드 화살표 키, 또는 하단의 화살표 버튼을 사용하여 이동합니다.\n\n3. 보라색 흔적은 탐험한 경로를 보여줍니다. 왔던 길을 되돌아가면 흔적이 지워집니다!\n\n4. 상단 바에서 난이도를 조절하여 더 큰 미로에 도전해 보세요!';

  @override
  String get conjunctionSearchTitle => '결합 탐색';

  @override
  String get conjunctionSearchSubtitle => '주의 집중 및 특징 결합';

  @override
  String get conjunctionSearchWinTitle => '승리';

  @override
  String get conjunctionSearchWinMessage => '완벽한 집중력으로 모든 목표를 찾았습니다!';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      '지시사항에 특정 모양과 색상 조합이 표시됩니다. 밀집된 격자에서 최대한 빨리 찾아 탭하세요. 방해물 모양은 색상이나 모양 중 하나를 공유하므로 자세히 살펴보세요!';

  @override
  String get conjunctionSearchRound => '라운드: ';

  @override
  String get conjunctionSearchScore => '점수: ';

  @override
  String get conjunctionSearchFind => '찾을 대상: ';

  @override
  String get shapeCircle => '원';

  @override
  String get shapeSquare => '사각형';

  @override
  String get shapeTriangle => '삼각형';

  @override
  String get shapeStar => '별';

  @override
  String get colorRedLabel => '빨강';

  @override
  String get colorBlueLabel => '파랑';

  @override
  String get colorGreenLabel => '초록';

  @override
  String get colorAmberLabel => '황색';

  @override
  String get cubeNetFoldTitle => '입체도형 전개도';

  @override
  String get cubeNetFoldSubtitle => '일치하는 3D 정육면체 선택';

  @override
  String get cubeNetFoldWinTitle => '정답';

  @override
  String get cubeNetFoldWinMessage => '완벽한 3D 공간 전개 논리를 가지고 계시네요!';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '1. 상단의 펼쳐진 2D 전개도를 보세요.\n\n2. 머릿속으로 전개도를 접어 3D 정육면체를 만듭니다.\n\n3. 아래 옵션 중에서 해당 정육면체의 올바른 3D 관점을 선택하세요.\n\n4. 주의: 전개도에서 마주 보는 면은 3D에서 인접할 수 없으며, 인접한 면들의 순서가 일치해야 합니다!';

  @override
  String get cubeNetFoldUnfoldedNet => '펼쳐진 2D 전개도';

  @override
  String get cubeNetFoldWhichMatches => '어떤 정육면체가 일치하나요?';

  @override
  String get cubeNetFoldIncorrect => '잘못된 전개 논리입니다! 다시 시도하거나 선택을 변경하세요.';

  @override
  String get cubeNetFoldSubmitChoice => '선택 제출';

  @override
  String get cubeNetFoldFailed => '실패 (다시 시도 탭)';

  @override
  String get faceTraitAssociationMemorize => '4명 모두 기억하기';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return '인물 $current / 전체 $total';
  }

  @override
  String get faceTraitAssociationWhatOccupation => '이분들의 직업은 무엇인가요?';

  @override
  String get faceTraitAssociationWhatHobby => '이분들의 취미는 무엇인가요?';

  @override
  String get faceTraitAssociationWinTitle => '기억력 마스터!';

  @override
  String get faceTraitAssociationLoseTitle => '게임 종료';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return '$total개 중 $correct개를 맞혔습니다.';
  }

  @override
  String get topologyTitle => '위상수학';

  @override
  String get topologySubtitle =>
      '이 모양들은 위상적으로 동일합니까? (자르거나 붙이지 않고 하나를 다른 하나로 변형할 수 있습니까?)';

  @override
  String get topologyWinTitle => '기하학 천재!';

  @override
  String get topologyWinMessage => '10개의 위상학적 쌍을 정확히 찾았습니다!';

  @override
  String get topologyScore => '점수: ';
}
