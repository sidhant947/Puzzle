// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '益智枢纽';

  @override
  String get home => '首页';

  @override
  String get settings => '设置';

  @override
  String get playAgain => '再玩一次';

  @override
  String get playNext => '玩下一个';

  @override
  String get seeCompleted => '查看拼图';

  @override
  String get finish => '完成';

  @override
  String get congrats => '恭喜';

  @override
  String get perfectGradient => '完美的渐变！';

  @override
  String get wellDone => '做得好';

  @override
  String get timeUp => '时间到！';

  @override
  String get completed => '已完成！';

  @override
  String get score => '分数';

  @override
  String get timeLeft => '时间';

  @override
  String get trials => '尝试';

  @override
  String get numberRule => '数字规则';

  @override
  String get colorRule => '颜色规则';

  @override
  String get valid => '有效';

  @override
  String get invalid => '无效';

  @override
  String get even => '偶数';

  @override
  String get odd => '奇数';

  @override
  String get red => '红色';

  @override
  String get green => '绿色';

  @override
  String get blue => '蓝色';

  @override
  String get yes => '是';

  @override
  String get no => '否';

  @override
  String get trueLabel => '真';

  @override
  String get falseLabel => '假';

  @override
  String get clear => '清除';

  @override
  String get north => '北';

  @override
  String get south => '南';

  @override
  String get east => '东';

  @override
  String get west => '西';

  @override
  String get target => '目标';

  @override
  String get moves => '步数';

  @override
  String get trialMode => '挑战模式';

  @override
  String get trialModeDescription => '解决20个即可完成，而不是60秒计时';

  @override
  String get appearance => '外观';

  @override
  String get language => '语言';

  @override
  String get gameplay => '游戏玩法';

  @override
  String get supportUs => '支持我们';

  @override
  String get systemLegal => '系统与法律';

  @override
  String get games => '游戏';

  @override
  String get solvedToday => '今日已解决';

  @override
  String get searchGames => '搜索游戏...';

  @override
  String get readyToStart => '准备好开始大脑锻炼了吗？';

  @override
  String get greatStart => '良好的开端！保持势头。';

  @override
  String get onFire => '表现出色！你的大脑正乐在其中。';

  @override
  String get incredible => '不可思议！你是益智大师。';

  @override
  String get noGamesMatch => '没有匹配搜索的游戏';

  @override
  String get categoryAll => '全部';

  @override
  String get categoryAttention => '注意力';

  @override
  String get categoryLogic => '逻辑';

  @override
  String get categoryMath => '数学';

  @override
  String get categoryWord => '文字';

  @override
  String get categoryMemory => '记忆';

  @override
  String get categorySpatial => '空间';

  @override
  String get themeLight => '浅色';

  @override
  String get themeDark => '深色';

  @override
  String get themeSystem => '系统';

  @override
  String get starOnGithub => '在 GitHub 上标星';

  @override
  String get sponsorOnGithub => '在 GitHub 上赞助';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get termsOfService => '服务条款';

  @override
  String get licenses => '许可证';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return '你有 $maxTries 次机会寻找隐藏的 $wordLength 位单词。';
  }

  @override
  String wordFoundMessage(String word) {
    return '成功找到单词：$word';
  }

  @override
  String gameOverMessage(String word) {
    return '单词是：$word';
  }

  @override
  String get gameOver => '游戏结束';

  @override
  String get crosswordTitle => '纵横字谜';

  @override
  String get crosswordSubtitle => '根据提供的线索，在网格中填入正确的单词。';

  @override
  String get wordSearchTitle => '单词搜索';

  @override
  String get radicalRootsTitle => '开方运算';

  @override
  String get radicalRootsSubtitle => '求给定数字的的平方根或立方根。如果需要，请四舍五入到最接近的整数。';

  @override
  String get radicalRootsGoalReached => '达成目标！';

  @override
  String get radicalRootsTimeUp => '时间到！';

  @override
  String radicalRootsScoreMessage(int score) {
    return '你正确计算了 $score 个方根！';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return '继续练习！你计算了 $score 个方根。';
  }

  @override
  String get radicalRootsStart => '开始计算';

  @override
  String get radicalRootsDescription => '你有 60 秒的时间来解决尽可能多的题目。';

  @override
  String get radicalRootsBest => '最高纪录';

  @override
  String get radicalRootsSeconds => '60 秒';

  @override
  String get romanArithmeticTitle => '罗马算术';

  @override
  String get romanArithmeticSubtitle => '使用罗马数字解决加减法题目。';

  @override
  String get romanArithmeticGoalReached => '百夫长级别！';

  @override
  String get romanArithmeticTimeUp => '时间到！';

  @override
  String romanArithmeticScoreMessage(int score) {
    return '你解决了 $score 道罗马数字题目！';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return '我来，我见，我征服！你解决了 $score 道题目。';
  }

  @override
  String get romanArithmeticStart => '开始任务';

  @override
  String get romanArithmeticDescription => '转换并计算。你有 60 秒时间。';

  @override
  String get romanArithmeticBest => '最高纪录';

  @override
  String get romanArithmeticSeconds => '60 秒';

  @override
  String get wordSearchSubtitle => '找出网格中所有隐藏的单词。拖动以选择。';

  @override
  String get missingVowelsTitle => '缺失的元音';

  @override
  String get missingVowelsSubtitle => '识别元音被隐藏的单词。';

  @override
  String get missingVowelsWin => '元音已恢复！';

  @override
  String get missingVowelsHowToPlay => '显示一个元音（A, E, I, O, U）被隐藏的单词。猜出完整的单词！';

  @override
  String get wordScrambleTitle => '单词拼写';

  @override
  String get wordScrambleSubtitle => '点击字母来拼出隐藏的单词！';

  @override
  String get wordScrambleWin => '单词已解开！';

  @override
  String get sudokuTitle => '数独';

  @override
  String get sudokuSubtitle => '完成网格，使每一行、每一列和每个 3x3 宫格都包含数字 1 到 9。';

  @override
  String get minesweeperTitle => '扫雷';

  @override
  String get minesweeperSubtitle => '找出所有地雷而不触动它们。';

  @override
  String get minesweeperWin => '胜利！';

  @override
  String get minesweeperMines => '地雷';

  @override
  String get minesweeperStatus => '状态';

  @override
  String get minesweeperWon => '获胜';

  @override
  String get minesweeperBoom => '爆炸';

  @override
  String get minesweeperPlaying => '游戏中';

  @override
  String get minesweeperReveal => '揭晓';

  @override
  String get minesweeperFlag => '插旗';

  @override
  String get game2048Title => '2048';

  @override
  String get game2048Subtitle => '向任何方向滑动以合并方块并达到 2048 方块！';

  @override
  String get nonogramTitle => '数织';

  @override
  String get nonogramSubtitle => '使用逻辑线索揭示隐藏的图像。';

  @override
  String get nonogramWin => '图像已揭晓！';

  @override
  String get magnetsTitle => '磁铁';

  @override
  String get magnetsSubtitle => '根据磁极计数在网格中放置磁铁。';

  @override
  String get magnetsHowToPlay =>
      '在多米诺骨牌大小的容器中放入“+”和“-”磁铁，或者留空。行和列线索指定了该行中每个磁极的总数。相同的磁极在正交方向上不能相邻。';

  @override
  String get magnetsWinTitle => '极性平衡！';

  @override
  String get magnetsWinMessage => '所有磁铁都已完美排列！';

  @override
  String get lighthousesTitle => '灯塔';

  @override
  String get lighthousesSubtitle => '根据灯塔线索放置船只。';

  @override
  String get lighthousesHowToPlay =>
      '在网格中放置 1x1 的船只。灯塔指示水平和垂直方向上可见的船只总数。船只不能接触灯塔或彼此接触，即使是斜对角也不行。';

  @override
  String get lighthousesWinTitle => '海洋安全！';

  @override
  String get lighthousesWinMessage => '所有灯塔都完美地引导着船只！';

  @override
  String get dominosaTitle => '多米诺';

  @override
  String get dominosaSubtitle => '找出网格中所有隐藏的多米诺骨牌。';

  @override
  String get dominosaHowToPlay =>
      '在数字网格上排列一套完整的多米诺骨牌，使得每一对相邻的数字恰好被一个多米诺骨牌覆盖。每对数字在集合中只出现一次。';

  @override
  String get dominosaWinTitle => '多米诺大师！';

  @override
  String get dominosaWinMessage => '所有的多米诺骨牌都已被找到并放置！';

  @override
  String get skyscrapersTitle => '摩天大楼';

  @override
  String get skyscrapersSubtitle => '在网格中填入建筑物高度。';

  @override
  String get skyscrapersHowToPlay =>
      '在网格中填入高度（1-N），使得每行每列恰好包含每个高度一次。边缘的线索指示从该方向可以看到多少座建筑物，较高的建筑物会遮挡较低的建筑物。';

  @override
  String get skyscrapersWinTitle => '天际线修复！';

  @override
  String get skyscrapersWinMessage => '所有建筑物都已完美定位！';

  @override
  String get nurikabeTitle => '涂壁';

  @override
  String get nurikabeSubtitle => '形成一片相连的海并分隔岛屿。';

  @override
  String get nurikabeHowToPlay =>
      '为单元格涂色以形成一片单一相连的“海”（不能有 2x2 的方块）。未涂色的单元格形成“岛屿”，每个岛屿恰好包含一个代表其总面积的数字。';

  @override
  String get nurikabeWinTitle => '海水流动！';

  @override
  String get nurikabeWinMessage => '岛屿已分隔，海洋已连接！';

  @override
  String get fillominoTitle => '填充多米诺';

  @override
  String get fillominoSubtitle => '将网格划分为指定大小的多义骨牌。';

  @override
  String get fillominoHowToPlay =>
      '将网格划分为多义骨牌，使得每个大小为 N 的多义骨牌在其所有单元格中都包含数字 N。相同大小的多义骨牌在正交方向上不能相邻。';

  @override
  String get fillominoWinTitle => '网格已划分！';

  @override
  String get fillominoWinMessage => '逻辑完美平铺！';

  @override
  String get hitoriTitle => '数连';

  @override
  String get hitoriSubtitle => '为每行每列中的重复数字涂色。';

  @override
  String get hitoriHowToPlay =>
      '为单元格涂色，使得任何行或列中的数字出现次数不超过一次。涂色的单元格不能相邻（正交方向），且所有未涂色的单元格必须形成一个单一的连接组。';

  @override
  String get hitoriWinTitle => '数连大师！';

  @override
  String get hitoriWinMessage => '您已成功解决了所有重复项！';

  @override
  String get pathFinderTitle => '路径寻找';

  @override
  String get pathFinderSubtitle => '找出从 S 到 E 的隐藏路径。';

  @override
  String get pathFinderWin => '路径已掌握！';

  @override
  String get howToPlay => '玩法介绍';

  @override
  String get gotIt => '明白了';

  @override
  String get akariTitle => '数灯';

  @override
  String get akariSubtitle => '照亮所有白色单元格';

  @override
  String get akariHowToPlay =>
      '在白色单元格中放置灯泡以照亮整个网格。灯泡会照亮所在的行和列，直到遇到墙壁。两个灯泡不能互相照射。带数字的墙壁表示相邻单元格（上、下、左、右）中必须放置的灯泡数量。';

  @override
  String get akariWinTitle => '照亮！';

  @override
  String get akariWinMessage => '一切都被完美地照亮了。';

  @override
  String get arithmeticChainTitle => '心算链';

  @override
  String get arithmeticChainSubtitle => '在脑中计算运行总计';

  @override
  String get arithmeticChainWinTitle => '等级提升！';

  @override
  String get arithmeticChainWinMessage => '你的心算非常敏锐！';

  @override
  String get arithmeticChainLoseTitle => '再试一次';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return '正确答案是 $answer。';
  }

  @override
  String get arithmeticChainStart => '开始';

  @override
  String get arithmeticChainNext => '下一个';

  @override
  String get attentionalBlinkTitle => '注意力瞬盲';

  @override
  String get attentionalBlinkSubtitleWatch => '注意观察数字';

  @override
  String get attentionalBlinkSubtitleInput => '输入你看到的两个数字';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return '你得到了 $score 个目标！';
  }

  @override
  String get balanceScaleTitle => '天平秤';

  @override
  String get balanceScaleSubtitle => '根据天平推断最后一个物品的重量。';

  @override
  String get balanceScaleWinTitle => '平衡！';

  @override
  String get balanceScaleWinMessage => '你成功推断出了重量！';

  @override
  String get balanceScaleLoseTitle => '失衡';

  @override
  String get balanceScaleLoseMessage => '再试一次以找到正确的平衡。';

  @override
  String get balanceScaleBack => '返回';

  @override
  String get balanceScaleSubmit => '提交';

  @override
  String get binaryPuzzleTitle => '二进制拼图';

  @override
  String get binaryPuzzleSubtitle => '用 0 和 1 填充。相邻的相同数字最多两个。每行每列 0 和 1 的数量相等。';

  @override
  String get binaryPuzzleWinTitle => '做得好';

  @override
  String get binaryPuzzleWinMessage => '你以完美的逻辑解决了二进制拼图！';

  @override
  String get blockEscapeTitle => '方块逃脱';

  @override
  String get blockEscapeSubtitle => '滑动方块为主要方块清理出到达出口的路径。';

  @override
  String get blockEscapeWinTitle => '逃脱！';

  @override
  String get blockEscapeWinMessage => '你成功为主要方块清理了路径！';

  @override
  String get boxCompletionTitle => '方盒展开';

  @override
  String get boxCompletionSubtitle => '可以折叠成哪个立方体？';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return '你在 $totalTrials 次中答对了 $score 次！';
  }

  @override
  String get boxCompletionOptions => '选项';

  @override
  String get bridgesTitle => '桥';

  @override
  String get bridgesSubtitle => '用桥连接岛屿。每个岛屿需要特定数量的桥。桥不能交叉。';

  @override
  String get bridgesWinTitle => '已连接！';

  @override
  String get bridgesWinMessage => '你成功连接了所有岛屿！';

  @override
  String get calculationSprintTitle => '计算冲刺';

  @override
  String get calculationSprintSubtitle => '在 60 秒内解决尽可能多的等式。';

  @override
  String get calculationSprintGoalReached => '达成目标！';

  @override
  String get calculationSprintTimeUp => '时间到';

  @override
  String calculationSprintScoreMessage(int score) {
    return '出色的计算速度！你得到了 $score 分。';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return '你得到了 $score 分。尝试打破你的最高记录！';
  }

  @override
  String get calculationSprintBest => '最高纪录';

  @override
  String get calculationSprintSeconds => '60 秒';

  @override
  String get calculationSprintDescription => '快速解决等式。\n错误答案会扣除 3 秒！';

  @override
  String get calculationSprintStart => '开始冲刺';

  @override
  String get categoryFluencyTitle => '类别流利度';

  @override
  String get categoryFluencySubtitle => '输入属于该类别的物品';

  @override
  String get categoryFluencyExpert => '流利度专家！';

  @override
  String get categoryFluencyTimeUp => '时间到！';

  @override
  String get categoryFluencyWinMessage => '你的词汇量非常庞大！';

  @override
  String categoryFluencyFoundMessage(int count) {
    return '你找到了 $count 个单词。';
  }

  @override
  String get categoryFluencyCategoryLabel => '类别：';

  @override
  String get categoryFluencyEnterItem => '输入物品...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target 个单词';
  }

  @override
  String get changeBlindnessTitle => '变化视盲';

  @override
  String get changeBlindnessSubtitle => '找出发生变化的物品';

  @override
  String changeBlindnessScore(int score) {
    return '分数：$score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return '你找到了 $score 处变化！';
  }

  @override
  String get choiceRtTitle => '选择反应时';

  @override
  String get choiceRtSubtitle => '尽快点击激活的正方形';

  @override
  String choiceRtAvgMessage(String avg) {
    return '你的平均反应时间：$avg 毫秒';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return '剩余时间：$time 秒';
  }

  @override
  String choiceRtTaps(int count) {
    return '点击次数：$count';
  }

  @override
  String get colorFloodTitle => '色彩洪流';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return '步数：$moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => '洪流成功！';

  @override
  String get colorFloodDryLand => '干涸的土地...';

  @override
  String get colorFloodWinMessage => '你用色彩填满了整个网格！';

  @override
  String get colorFloodLoseMessage => '步数用尽。再试一次！';

  @override
  String get colorMatchTitle => '色彩匹配';

  @override
  String get colorMatchSubtitle => '调整滑块以尽可能接近目标颜色。';

  @override
  String get colorMatchTarget => '目标';

  @override
  String get colorMatchYours => '你的';

  @override
  String get colorMatchCheck => '检查匹配';

  @override
  String get colorMatchResult => '匹配结果';

  @override
  String colorMatchAccuracy(String accuracy) {
    return '你的准确度：$accuracy%';
  }

  @override
  String get corsiBlocksTitle => '柯西块';

  @override
  String get corsiBlocksSubtitle => '观察方块亮起的顺序并按相同顺序点击。';

  @override
  String get corsiBlocksWinTitle => '空间大师！';

  @override
  String get corsiBlocksLoseTitle => '迷失空间';

  @override
  String corsiBlocksMessage(int score, int span) {
    return '你记住了 $score 个序列！你的空间记忆跨度达到了 $span。';
  }

  @override
  String get corsiBlocksWatch => '观察图案';

  @override
  String get corsiBlocksRepeat => '重复图案';

  @override
  String get corsiBlocksExcellent => '优秀！';

  @override
  String get corsiBlocksSpan => '跨度';

  @override
  String get crownTitle => '皇冠';

  @override
  String get crownSubtitle => '在每一行、每一列和每个颜色区域放置一个皇冠。皇冠不能相邻，即使是斜对角也不行。';

  @override
  String get crownCrowned => '登基！';

  @override
  String get crownSuccess => '凭借完美的逻辑成功放置了所有皇冠。';

  @override
  String get cryptogramTitle => '密码简讯';

  @override
  String get cryptogramSubtitle => '分配字母来解码秘密信息！每个加密字母代表一个真实的字母。';

  @override
  String get cryptogramBroken => '密码已破解！';

  @override
  String get cryptogramEncrypted => '已加密';

  @override
  String get cryptogramSuccess => '你完美地解码了信息。';

  @override
  String get cryptogramTryAgain => '再试一次以破解加密。';

  @override
  String get digitSpanReverseTitle => '逆序跨度';

  @override
  String get digitSpanReverseSubtitleMemorize => '记住数字';

  @override
  String get digitSpanReverseSubtitleEnter => '按逆序输入数字';

  @override
  String get digitSpanReverseWinTitle => '等级提升！';

  @override
  String get digitSpanReverseWinMessage => '你的工作记忆令人印象深刻！';

  @override
  String get digitSpanReverseLoseTitle => '再试一次';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return '正确的逆序序列是 $sequence。';
  }

  @override
  String get dividedAttentionTitle => '分散注意力';

  @override
  String get dividedAttentionSubtitle => '左边点击星星 ⭐ | 右边点击红色 🔴';

  @override
  String get dividedAttentionGameOverTitle => '注意力中断';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return '多任务处理很难！你的分数是 $score。';
  }

  @override
  String dividedAttentionScore(int score) {
    return '分数：$score';
  }

  @override
  String get doubleNBackTitle => '双向 N-Back';

  @override
  String doubleNBackSubtitle(int n) {
    return '匹配 $n 步前的刺激';
  }

  @override
  String get doubleNBackGameOverTitle => '游戏结束';

  @override
  String doubleNBackGameOverMessage(int score) {
    return '你在双向 N-Back 中得到了 $score 分！';
  }

  @override
  String doubleNBackScore(int score) {
    return '分数：$score';
  }

  @override
  String get doubleNBackPositionMatch => '位置匹配';

  @override
  String get doubleNBackLetterMatch => '字母匹配';

  @override
  String get faceNameAssociationTitle => '人脸-名字关联';

  @override
  String get faceNameAssociationSubtitleStudy => '记住每张脸的名字';

  @override
  String get faceNameAssociationSubtitleTest => '这是谁？';

  @override
  String get faceNameAssociationPerfect => '完美！';

  @override
  String get faceNameAssociationGameOver => '游戏结束';

  @override
  String get faceNameAssociationWinMessage => '你对人脸和名字有很好的记忆力！';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return '你在 $total 次中答对了 $correct 次。';
  }

  @override
  String get faceNameAssociationStartTest => '开始测试';

  @override
  String get flankerTestWinTitle => '激光对焦！';

  @override
  String get flankerTestLoseTitle => '分心了';

  @override
  String flankerTestScoreMessage(int score) {
    return '你答对了 $score 次！';
  }

  @override
  String get flankerTestTitle => '侧翼测试';

  @override
  String get flankerTestSubtitle => '指示中间箭头的方向，忽略两侧的箭头。';

  @override
  String get flankerTestLeft => '左';

  @override
  String get flankerTestRight => '右';

  @override
  String get fractionMatchTitle => '分数匹配';

  @override
  String get fractionMatchSubtitle => '将视觉图形与其分数匹配';

  @override
  String get fractionMatchLoseTitle => '分数不匹配';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return '正确答案是 $correctAnswer。';
  }

  @override
  String get goNoGoTitle => '反应抑制';

  @override
  String get goNoGoSubtitle => '看到绿色点击，忽略红色！';

  @override
  String get goNoGoLoseTitle => '反应停止';

  @override
  String get goNoGoLoseMessage => '你的抑制控制能力正在接受测试！';

  @override
  String get goNoGoTapAnywhere => '点击任意处开始';

  @override
  String get groceryListTitle => '购物清单';

  @override
  String get groceryListSubtitleMemorize => '记住物品及其类别';

  @override
  String get groceryListSubtitleTest => '这个物品属于哪个类别？';

  @override
  String get groceryListWinTitle => '购物达人！';

  @override
  String get groceryListLoseTitle => '忘了什么吗？';

  @override
  String groceryListScoreMessage(int score) {
    return '你在购物清单中得到了 $score 分！';
  }

  @override
  String get groceryListReady => '我准备好了';

  @override
  String get groceryListWhereBelong => '这个属于哪里？';

  @override
  String get hueSortTitle => '色相排序';

  @override
  String get hueSortSubtitle => '交换方块以在角落颜色之间创建平滑过渡。点表示固定的方块。';

  @override
  String get hueSortWinTitle => '完美的渐变！';

  @override
  String get hueSortWinMessage => '你完美地排序了色谱！';

  @override
  String hueSortWrongTiles(int count) {
    return '位置错误的方块：$count';
  }

  @override
  String get kenkenTitle => '贤贤';

  @override
  String get kenkenWinTitle => '天才！';

  @override
  String get kenkenLoseTitle => '游戏结束';

  @override
  String get kenkenWinMessage => '你解决了贤贤拼图！';

  @override
  String get kenkenLoseMessage => '检查行/列和方框规则。';

  @override
  String kenkenSubtitle(int size) {
    return '在行/列中填入 1-$size 且不重复';
  }

  @override
  String get letterCancellationTitle => '字母划消';

  @override
  String get letterCancellationTitleFull => '字母划消测试';

  @override
  String letterCancellationScoreMessage(int score) {
    return '你找到了 $score 个字母！';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return '找出所有“$target”字母';
  }

  @override
  String get letterCancellationFound => '已找到';

  @override
  String get letterCancellationTime => '时间';

  @override
  String get lightsOutTitle => '灭灯游戏';

  @override
  String get lightsOutSubtitle => '点击一个方块会切换它及其相邻方块的状态。关掉所有的灯即可解决。';

  @override
  String get lightsOutWinTitle => '拼图已解决！';

  @override
  String get lightsOutWinMessage => '你成功关掉了所有的灯！';

  @override
  String get symmetryTitle => '对称性';

  @override
  String get symmetrySubtitle => '将左侧的图案镜像到右侧的空网格中。';

  @override
  String get semanticLinkTitle => '语义关联';

  @override
  String get semanticLinkSubtitle => '找出连接这三个词的单词';

  @override
  String get reflexTapTitle => '反应点击';

  @override
  String get visualStatisticalLearningTitle => '视觉统计学习';

  @override
  String get orbitTapTitle => '轨道点击';

  @override
  String get orbitTapSubtitle => '当球与门对齐时点击';

  @override
  String get schulteTableTitle => '舒尔特表';

  @override
  String get multipleObjectTrackingTitle => '多目标追踪';

  @override
  String get multipleObjectTrackingSubtitle => '观察突出显示的物体。在它们移动时追踪它们，然后选择它们。';

  @override
  String get sdmtTitle => 'SDMT 测试';

  @override
  String get sdmtSubtitle => '使用上面的键找出所示符号对应的数字。';

  @override
  String get memoryMatrixTitle => '记忆矩阵';

  @override
  String get memoryMatrixSubtitle => '记住图案并点击方块。';

  @override
  String get mentalAbacusTitle => '珠算心算';

  @override
  String get mentalAbacusSubtitle => '使用算盘解决';

  @override
  String get spellingSprintTitle => '拼写冲刺';

  @override
  String get spellingSprintSubtitle => '与时间赛跑，尽可能多地拼写单词。';

  @override
  String get stopSignalTitle => '停止信号';

  @override
  String get stopSignalSubtitle => '点击箭头方向，但如果箭头变红，请立即停止。';

  @override
  String get staircaseMemoryTitle => '阶梯记忆';

  @override
  String get vigilanceTaskTitle => '警觉任务';

  @override
  String get vigilanceTaskSubtitle => '当指针跳过位置时点击按钮';

  @override
  String get logicalSyllogismsTitle => '逻辑三段论';

  @override
  String get logicalSyllogismsSubtitle => '结论在逻辑上有效吗？';

  @override
  String get mathPathTitle => '数学路径';

  @override
  String get mathPathSubtitle => '找到一条总和正好等于目标数值的路径。';

  @override
  String get sternbergTaskTitle => '斯特恩伯格任务';

  @override
  String get sternbergTaskMemorize => '记住字母';

  @override
  String get sternbergTaskWasLetterSet => '这个字母在集合中吗？';

  @override
  String sternbergTaskScore(int score) {
    return '你在斯特恩伯格任务中得到了 $score 分！';
  }

  @override
  String get verbalAnalogiesTitle => '类比大师！';

  @override
  String get verbalAnalogiesSubtitle => '完成关系';

  @override
  String get typingSpeedTitle => '打字速度';

  @override
  String get typingSpeedSubtitle => '尽快准确地打出所示的短语！';

  @override
  String get wordLadderTitle => '单词阶梯';

  @override
  String get wordLadderSubtitle => '通过一次改变一个字母来连接单词。';

  @override
  String get tangleFixTitle => '解开乱麻！';

  @override
  String get tangleFixSubtitle => '整理线条，使其互不交叉';

  @override
  String get oddRotationTitle => '异常旋转';

  @override
  String get oddRotationSubtitle => '其中一个是镜像的。你能找到它吗？';

  @override
  String get towerOfLondonTitle => '伦敦塔';

  @override
  String get towerOfLondonSubtitle => '匹配目标配置';

  @override
  String get symbolicFlankerTitle => '符号侧翼';

  @override
  String get symbolicFlankerSubtitle => '关注中间符号';

  @override
  String get stroopTestTitle => '斯特鲁普测试';

  @override
  String get stroopTestSubtitle => '识别所示单词的墨水颜色。忽略单词本身的含义！';

  @override
  String get wisconsinCardSortingTitle => '威斯康星卡片分类';

  @override
  String get wisconsinCardSortingSubtitle => '将卡片与上面四个中的一个匹配';

  @override
  String get nBackTitle => 'N-Back 测试';

  @override
  String get nBackSubtitle => '如果当前字母与 2 步前显示的字母相同，请点击匹配。';

  @override
  String get rhythmMasterTitle => '节奏大师';

  @override
  String get rhythmMasterSubtitle => '与脉冲同步点击';

  @override
  String get pixelMimicTitle => '像素模仿';

  @override
  String get targetNumberTitle => '目标 24';

  @override
  String targetNumberSubtitle(int target) {
    return '使用所有 4 个数字来达到 $target';
  }

  @override
  String get mirrorTracingTitle => '镜像描绘';

  @override
  String get mirrorTracingSubtitle => '描绘星星！控制是镜像的。';

  @override
  String get wordSurgeTitle => '词汇激增';

  @override
  String get wordSurgeSubtitle => '同义词与反义词';

  @override
  String get perspectiveTakingTitle => '观点采择';

  @override
  String get perspectiveTakingTopDownView => '俯视图';

  @override
  String get perspectiveTakingChoosePerspective => '选择视角';

  @override
  String get perspectiveTakingCongrats => '你对空间关系有敏锐的洞察力。';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return '哪个视图是从 $targetDirName 看过去的？';
  }

  @override
  String get paperFoldingTitle => '纸张折叠';

  @override
  String get paperFoldingSubtitle => '展开后会是什么样子？';

  @override
  String get waterSortTitle => '倒水排序';

  @override
  String get waterSortSubtitle => '排序颜色，使每个管子只包含一种颜色。';

  @override
  String get numericalEstimationTitle => '数值估计';

  @override
  String get numericalEstimationSubtitle => '快速选择最接近的答案！';

  @override
  String get lockPatternTitle => '图案解锁';

  @override
  String get lockPatternSubtitle => '找出秘密图案。每次尝试都会提供关于位置和点的反馈。';

  @override
  String get primeHunterTitle => '质数猎人';

  @override
  String get primeHunterSubtitle => '向左滑动表示质数 | 向右滑动表示合数';

  @override
  String get tracePathTitle => '路径追踪';

  @override
  String get tracePathSubtitle => '尽可能紧密地遵循目标路径';

  @override
  String get ruleSwitcherTitle => '规则切换';

  @override
  String get ruleSwitcherSubtitle => '应用当前规则';

  @override
  String get choiceReactionTimeTitle => '选择反应时';

  @override
  String get pathRecallTitle => '路径回忆';

  @override
  String get switchTaskTitle => '任务切换';

  @override
  String get switchTaskSubtitle => '注意规则！它会在匹配形状和匹配颜色之间切换。';

  @override
  String get mentalRotationTitle => '心理旋转';

  @override
  String get mentalRotationSubtitle => '这些形状是否相同，只是旋转了？';

  @override
  String get missingOperatorTitle => '运算符混合';

  @override
  String get missingOperatorSubtitle => '填补空白以完成等式';

  @override
  String get wordMastermindTitle => '单词大师';

  @override
  String get wordMastermindSubtitle =>
      '破解 4 位代码！Bulls (B) 位置完全正确，Cows (C) 位置错误。';

  @override
  String get simonSequenceTitle => '西蒙序列';

  @override
  String get symbolLogicTitle => '符号逻辑';

  @override
  String get symbolLogicSubtitle => '解决视觉等式以找出每个符号的值。最后一个等式的结果是什么？';

  @override
  String get silhouetteMatchTitle => '轮廓匹配';

  @override
  String get silhouetteMatchSubtitle => '哪个轮廓与这个物体匹配？';

  @override
  String get operationSpanTitle => '运算跨度';

  @override
  String get operationSpanMathPhase => '等式正确吗？';

  @override
  String get operationSpanLetterPhase => '记住字母';

  @override
  String get operationSpanRecallPhase => '按顺序回忆字母';

  @override
  String get operationSpanRoundComplete => '回合完成！';

  @override
  String operationSpanScore(int score) {
    return '你在运算跨度中得到了 $score 分！';
  }

  @override
  String get slidePuzzleTitle => '数字华容道';

  @override
  String get slidePuzzleNewGame => '新游戏';

  @override
  String get slidePuzzleInstructions => '通过将方块滑动到空位，将方块按数字顺序排列。';

  @override
  String get slidePuzzleTileSlider => '方块滑动';

  @override
  String get slidePuzzleCongrats => '你成功排列了所有方块。';

  @override
  String get visualSearchTitle => '视觉搜索';

  @override
  String get visualSearchSubtitle => '找出网格中唯一的符号';

  @override
  String get trailMakingTitle => '连线测试';

  @override
  String get trailMakingSubtitle => '尽快按顺序（1 -> 2 -> 3...）连接数字。';

  @override
  String get matrixReasoningTitle => '矩阵推理';

  @override
  String get matrixReasoningSubtitle => '完成 3x3 网格中的图案';

  @override
  String get tentsAndTreesTitle => '帐篷与树';

  @override
  String get tentsAndTreesSubtitle => '在树旁边放置帐篷。数字表示每行/列中有多少个帐篷。帐篷不能互相接触。';

  @override
  String get quickMathTitle => '快速数学';

  @override
  String get magicSquaresTitle => '幻方';

  @override
  String magicSquaresSubtitle(int targetSum) {
    return '每一行、每一列和对角线的总和必须等于 $targetSum';
  }

  @override
  String get objectShuffleTitle => '物体随机移动';

  @override
  String get pipesTitle => '管道';

  @override
  String get pipesSubtitle => '用管道连接相同颜色的圆点。';

  @override
  String get oddOneOutTitle => '找不同';

  @override
  String get oddOneOutSubtitle => '找出颜色不同的方块。';

  @override
  String get einsteinRiddleTitle => '爱因斯坦谜题';

  @override
  String get einsteinRiddleSubtitle => '使用线索推断每间房子的属性。';

  @override
  String get einsteinRiddleHowToPlay =>
      '每间房子都有独特的属性（颜色、国籍、宠物等）。使用提供的线索填满网格并找到完整的解决方案。';

  @override
  String get einsteinRiddleColor => '颜色';

  @override
  String get einsteinRiddleNationality => '国籍';

  @override
  String get einsteinRiddleDrink => '饮料';

  @override
  String get einsteinRiddlePet => '宠物';

  @override
  String get einsteinRiddleSmoke => '香烟';

  @override
  String get einsteinRiddleHouse => '房子';

  @override
  String get mirrorImageTitle => '镜像';

  @override
  String get mirrorImageSubtitle => '识别正确的镜像反射。';

  @override
  String get mirrorImageHowToPlay => '观察图形并在提供的选项中选择其正确的镜像反射。';

  @override
  String get mentalMappingTitle => '心理地图';

  @override
  String get mentalMappingSubtitle => '遵循指示并找到目的地。';

  @override
  String get mentalMappingHowToPlay =>
      '你将看到一系列方向（北、南、东、西）。从网格中心开始在脑中遵循这些步骤，并选择最终目的地。';

  @override
  String get memoryPalaceTitle => '记忆宫殿';

  @override
  String get memoryPalaceSubtitle => '记住哪个单词在哪个位置。';

  @override
  String get memoryPalaceHowToPlay =>
      '一组单词将出现在网格的不同位置。记住它们的位置。然后，你将被要求将单词放回其原始位置。';

  @override
  String get countingSheepTitle => '数羊';

  @override
  String get countingSheepSubtitle => '你看到了多少只羊？';

  @override
  String get countingSheepHowToPlay => '羊会快速跑过屏幕。在它们经过时数数，并在最后输入总数。';

  @override
  String get faceTraitAssociationTitle => '人脸-特征关联';

  @override
  String get faceTraitAssociationSubtitle => '记住每张脸的特征';

  @override
  String get faceTraitAssociationHowToPlay =>
      '你将看到几张脸，每张脸都有名字、职业和爱好。记住这些关联。稍后，你将被要求回忆每张脸的具体特征。';

  @override
  String get mentalCalendarTitle => '心理日历';

  @override
  String get mentalCalendarSubtitle => '计算星期几';

  @override
  String get mentalCalendarHowToPlay => '显示一个随机日期。使用心算（或末日算法）来确定它是星期几。';

  @override
  String get vocabularyBuilderTitle => '词汇构建器';

  @override
  String get vocabularyBuilderSubtitle => '在时间压力下匹配同义词和反义词。';

  @override
  String get vocabularyBuilderHowToPlay =>
      '你将看到一个目标词和一个关系（同义词或反义词）。从选项中选择与该关系匹配的正确单词。动作要快，时间在流逝！';

  @override
  String get correct => '正确';

  @override
  String get incorrect => '错误';

  @override
  String get grammarPoliceTitle => '语法警察';

  @override
  String get grammarPoliceSubtitle => '识别句子语法是否正确或包含错误。';

  @override
  String get grammarPoliceHowToPlay =>
      '屏幕中央会出现一个句子。判断其语法是否正确或包含错误。如果没问题，点击“正确”；如果发现错误，点击“错误”。不要失去所有的生命！';

  @override
  String get reverseStroopTitle => '逆向斯特鲁普';

  @override
  String get reverseStroopSubtitle => '斯特鲁普测试的一个变体，重点发生了切换。';

  @override
  String get reverseStroopHowToPlay =>
      '注意指示！如果显示“文字”，请匹配单词的含义。如果显示“颜色”，请匹配墨水颜色。规则会经常切换以测试你的注意力。';

  @override
  String get game2048Instruction => '向任何方向滑动以合并';

  @override
  String get fibonacciMergeTitle => '斐波那契合并';

  @override
  String get fibonacciMergeSubtitle => '合并连续的斐波那契数 (1, 1, 2, 3, 5, 8, 13...)。';

  @override
  String get sequenceSleuthTitle => '序列侦探';

  @override
  String get sequenceSleuthSubtitle => '找出数学序列中缺失的数字。';

  @override
  String get divisibilityDashTitle => '整除冲刺';

  @override
  String get divisibilityDashSubtitle => '点击给定数字的所有个位数因数 (2-9)。';

  @override
  String get percentagePeakTitle => '百分比巅峰';

  @override
  String get percentagePeakSubtitle => '快速解决心理百分比计算。';

  @override
  String get vennNumbersTitle => '韦恩图数字';

  @override
  String get vennNumbersSubtitle => '将数字归类到正确的韦恩图区域。';

  @override
  String get commonDenominatorTitle => '公分母';

  @override
  String get commonDenominatorSubtitle => '求最大公约数或最小公倍数。';

  @override
  String get angleFinderTitle => '角度搜索';

  @override
  String get angleFinderSubtitle => '计算几何题目中缺失的角度。';

  @override
  String get sumSnakeTitle => '求和蛇';

  @override
  String get sumSnakeSubtitle => '连接相邻数字以达到目标和。';

  @override
  String get baseShiftTitle => '进制转换挑战';

  @override
  String get baseShiftSubtitle => '以十进制求解';

  @override
  String get baseShiftDescription => '解方程并以十进制（基数 10）输入答案。';

  @override
  String get baseShiftEquation => '方程式';

  @override
  String get baseShiftHint => '输入十进制结果...';

  @override
  String get baseShiftCorrect => '正确！';

  @override
  String get baseShiftIncorrect => '不正确！';

  @override
  String get baseShiftSubmit => '提交';

  @override
  String get baseShiftQuickGuide => '快速指南：';

  @override
  String get baseShiftBinary => '二进制 (bin): 基数 2 (0, 1)';

  @override
  String get baseShiftHex => '十六进制 (0x): 基数 16 (0-9, A-F)';

  @override
  String get baseShiftDecimal => '十进制 (dec): 基数 10 (0-9)';

  @override
  String get baseShiftWinTitle => '数学奇才！';

  @override
  String get baseShiftWinMessage => '你正确解决了 5 道进制转换方程！';

  @override
  String get blockCount3DTitle => '3D 数方块';

  @override
  String get blockCount3DSubtitle => '拖动旋转 • 数出隐藏的方块';

  @override
  String get blockCount3DHowMany => '有多少个方块？';

  @override
  String get blockCount3DSubmitGuess => '提交答案';

  @override
  String get blockCount3DNotQuite => '不完全正确！尝试旋转并重新数数。';

  @override
  String get blockCount3DExcellent => '出色';

  @override
  String blockCount3DWinMessage(int count) {
    return '你正确识别了所有 $count 个方块！';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '1. 在 3D 视图中拖动手指以旋转方块堆叠。\n\n2. 数出堆叠中的所有方块。\n\n3. 请记住：悬空的方块下方必须有支撑方块（隐藏方块！）。\n\n4. 在输入框中输入你的答案，然后点击“提交答案”进行检查。';

  @override
  String get alphabetSudokuTitle => '字母数独';

  @override
  String get alphabetSudokuSubtitle => '填充网格，使每一行、每一列和每个宫格都包含字母 A-I。';

  @override
  String get alphabetSudokuWinTitle => '数独已解决！';

  @override
  String get alphabetSudokuWinMessage => '太棒了！你掌握了字母规律。';

  @override
  String get classicMazeTitle => '经典迷宫';

  @override
  String get classicMazeSubtitle => '探索并解决 • 每局都是新迷宫';

  @override
  String get classicMazeWinTitle => '迷宫已扫清';

  @override
  String classicMazeWinMessage(int count) {
    return '不可思议的导航！你用了 $count 步解决了迷宫。';
  }

  @override
  String get classicMazeMoves => '步数：';

  @override
  String get classicMazeHowToPlayDescription =>
      '1. 引导发光的黄色大理石（玩家）到达右下角的绿色门户（出口）。\n\n2. 在迷宫任意位置滑动、使用物理键盘方向键或底部的方向盘按钮来移动。\n\n3. 紫色痕迹显示了你已经探索过的路径。返回你的痕迹可以动态擦除它！\n\n4. 在顶部操作栏切换难度，挑战更大的迷宫！';

  @override
  String get conjunctionSearchTitle => '合取搜索';

  @override
  String get conjunctionSearchSubtitle => '注意力集中与特征合取';

  @override
  String get conjunctionSearchWinTitle => '胜利';

  @override
  String get conjunctionSearchWinMessage => '你以完美的注意力找到了所有目标！';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      '说明中将显示特定的目标形状和颜色组合。在密集的网格中尽快找到并点击它。干扰形状具有相同的颜色或形状，请仔细观察！';

  @override
  String get conjunctionSearchRound => '轮次：';

  @override
  String get conjunctionSearchScore => '分数：';

  @override
  String get conjunctionSearchFind => '寻找：';

  @override
  String get shapeCircle => '圆形';

  @override
  String get shapeSquare => '正方形';

  @override
  String get shapeTriangle => '三角形';

  @override
  String get shapeStar => '星星';

  @override
  String get colorRedLabel => '红色';

  @override
  String get colorBlueLabel => '蓝色';

  @override
  String get colorGreenLabel => '绿色';

  @override
  String get colorAmberLabel => '琥珀色';

  @override
  String get cubeNetFoldTitle => '立方体折叠';

  @override
  String get cubeNetFoldSubtitle => '选择匹配的 3D 立方体选项';

  @override
  String get cubeNetFoldWinTitle => '正确';

  @override
  String get cubeNetFoldWinMessage => '你拥有完美的 3D 空间折叠逻辑！';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '1. 查看顶部的展开 2D 平面图。\n\n2. 在脑海中将平面图折叠成 3D 立方体。\n\n3. 在下方选择代表该折叠立方体有效 3D 视角的选项。\n\n4. 注意：平面图中的相对面在 3D 中不能相邻，且相邻面的顺序必须匹配！';

  @override
  String get cubeNetFoldUnfoldedNet => '展开 2D 平面图';

  @override
  String get cubeNetFoldWhichMatches => '哪个立方体匹配？';

  @override
  String get cubeNetFoldIncorrect => '折叠逻辑错误！点击重置或更改选择。';

  @override
  String get cubeNetFoldSubmitChoice => '提交选择';

  @override
  String get cubeNetFoldFailed => '失败（点击重置）';

  @override
  String get faceTraitAssociationMemorize => '记住这 4 个人';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return '第 $current 人（共 $total 人）';
  }

  @override
  String get faceTraitAssociationWhatOccupation => '他们的职业是什么？';

  @override
  String get faceTraitAssociationWhatHobby => '他们的爱好是什么？';

  @override
  String get faceTraitAssociationWinTitle => '记忆大师！';

  @override
  String get faceTraitAssociationLoseTitle => '游戏结束';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return '你在 $total 次中答对了 $correct 次。';
  }

  @override
  String get topologyTitle => '拓扑学';

  @override
  String get topologySubtitle => '这些形状在拓扑上等效吗？（其中一个能否在不切割或粘贴的情况下变形为另一个？）';

  @override
  String get topologyWinTitle => '几何天才！';

  @override
  String get topologyWinMessage => '你正确识别了 10 对拓扑对！';

  @override
  String get topologyScore => '分数：';
}
