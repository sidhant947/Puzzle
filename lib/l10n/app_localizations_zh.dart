// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '益智游戏';

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
  String get victory => '胜利！';

  @override
  String get gameWin => '做得好！';

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
  String get radicalRootsSubtitle => '求给定数字的的平方根 or 立方根。如果需要，请四舍五入到最接近的整数。';

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
  String get verbalAnalogiesTitle => '言语类比';

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
  String get tangleFixTitle => '纠缠解开';

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
  String get shapeRectangle => '矩形';

  @override
  String get shapeEllipse => '椭圆形';

  @override
  String get shapeTrapezoid => '梯形';

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

  @override
  String get semanticDistanceTitle => '语义距离';

  @override
  String get semanticDistanceSubtitle => '衡量单词之间的概念距离';

  @override
  String get oxymoronHuntTitle => '矛盾修辞狩猎';

  @override
  String get oxymoronHuntSubtitle => '配对网格中矛盾的词语';

  @override
  String get portmanteauSplitTitle => '混成词拆分';

  @override
  String get portmanteauSplitSubtitle => '识别混成词的来源词';

  @override
  String get chainReactionTitle => '链式反应';

  @override
  String get chainReactionSubtitle => '使用重叠字母连接单词';

  @override
  String get rhymeMasterTitle => '押韵大师';

  @override
  String get rhymeMasterSubtitle => '识别与目标单词押韵的词语';

  @override
  String get definitionDashTitle => '定义冲刺';

  @override
  String get definitionDashSubtitle => '将正确的单词与其定义匹配';

  @override
  String get syllableStackTitle => '音节堆叠';

  @override
  String get syllableStackSubtitle => '堆叠音节以形成完整的单词';

  @override
  String get sentenceUnscrambleTitle => '句子重组';

  @override
  String get sentenceUnscrambleSubtitle => '重新排序单词以形成有效的句子';

  @override
  String get grammarSortTitle => '语法分类';

  @override
  String get grammarSortSubtitle => '按词性对单词进行分类';

  @override
  String get vowelReconstructTitle => '元音重构';

  @override
  String get vowelReconstructSubtitle => '填补句子中缺失的元音';

  @override
  String get consonantReconstructTitle => '辅音重构';

  @override
  String get consonantReconstructSubtitle => '填补句子中缺失的辅音';

  @override
  String get homophoneHuntTitle => '同音词狩猎';

  @override
  String get silentLetterSearchTitle => '静音字母搜索';

  @override
  String get silentLetterSearchSubtitle => '识别给定单词中的静音字母';

  @override
  String get palindromeBuilderTitle => '回文构建器';

  @override
  String get palindromeBuilderSubtitle => '通过添加最少的字母创建回文';

  @override
  String get phoneticGuessTitle => '语音猜词';

  @override
  String get phoneticGuessSubtitle => '根据音标识别单词';

  @override
  String get spoonerismSolverTitle => '首音互换解决者';

  @override
  String get spoonerismSolverSubtitle => '识别短语的正确首音互换';

  @override
  String get etymonOddballTitle => '词源异类';

  @override
  String get etymonOddballSubtitle => '找出不具有相同词根的单词';

  @override
  String get etymologyOriginTitle => '词源起源';

  @override
  String get etymologyOriginSubtitle => '猜测外来语的起源语言';

  @override
  String get affixFactoryTitle => '词缀工厂';

  @override
  String get affixFactorySubtitle => '使用前缀和后缀创建有效的单词';

  @override
  String get cognateCatchTitle => '同源词捕捉';

  @override
  String get cognateCatchSubtitle => '区分真同源词和伪友';

  @override
  String get compoundConnectTitle => '复合词连接';

  @override
  String get compoundConnectSubtitle => '合并两个单词以形成复合词';

  @override
  String get pangramSprintTitle => '全字母句冲刺';

  @override
  String get pangramSprintSubtitle => '使用字母表的每个字母构建句子';

  @override
  String get anagramDefinitionTitle => '变体字定义';

  @override
  String get anagramDefinitionSubtitle => '根据其定义解决变体字';

  @override
  String get letterBridgeTitle => '字母桥';

  @override
  String get letterBridgeSubtitle => '寻找连接两个单词的缺失字母';

  @override
  String get letterFrequencyScanTitle => '字母频率扫描';

  @override
  String get letterFrequencyScanSubtitle => '计算字母在文本中出现的次数';

  @override
  String get oneLetterShiftTitle => '单字母偏移';

  @override
  String get oneLetterShiftSubtitle => '通过改变一个字母将一个单词转换为另一个单词';

  @override
  String vocabularyBuilderMessage(String arg0) {
    return '做得好！你的词汇量令人印象深刻。分数：$arg0';
  }

  @override
  String get symmetryMessage => '你以手术般的精度完美地镜像了图案。';

  @override
  String get temporalOrderMessage => '不可思议！你的时间序列记忆非常精准。';

  @override
  String get temporalOrderMessage1 => '序列记忆不正确。熟能生巧！';

  @override
  String get wordSearchMessage => '凭借敏锐的观察力成功找到了所有单词。';

  @override
  String colorMatchMessage(String arg0) {
    return '你的准确度：$arg0%';
  }

  @override
  String semanticLinkMessage(String arg0) {
    return '你得到了 $arg0 分！';
  }

  @override
  String reflexTapMessage(String arg0) {
    return '你点击了 $arg0 个目标！';
  }

  @override
  String get angleFinderMessage => '你的几何直觉很完美！';

  @override
  String angleFinderMessage1(String arg0) {
    return '正确答案是 $arg0°';
  }

  @override
  String angleFinderText(String arg0) {
    return '$arg0°';
  }

  @override
  String visualStatisticalLearningMessage(String arg0) {
    return '你得分了 $arg0 个正确模式！';
  }

  @override
  String nonogramText(String arg0) {
    return '错误：$arg0';
  }

  @override
  String mentalCalendarMessage(String arg0) {
    return '你在 10 个中答对了 $arg0 个！';
  }

  @override
  String orbitTapMessage(String arg0) {
    return '你成功点击了 $arg0 次！';
  }

  @override
  String schulteTableMessage(String arg0) {
    return '你完成了表格，用时 $arg0。\n继续练习以扩大你的外围视野！';
  }

  @override
  String get schulteTableText => '开始测试';

  @override
  String get relationalMemoryMessage => '出色的空间关系记忆准确度！';

  @override
  String sudokuText(String arg0) {
    return '错误：$arg0';
  }

  @override
  String sdmtMessage(String arg0) {
    return '你匹配了 $arg0 个符号！此测试衡量你的扫描速度和视觉注意力。';
  }

  @override
  String get futoshikiMessage => '不可思议！你解决了 Futoshiki 拉丁方块。';

  @override
  String letterFrequencyScanMessage(String arg0, String arg1) {
    return '你正确计算了 \"$arg1\" 出现了 $arg0 次。';
  }

  @override
  String letterFrequencyScanText(String arg0) {
    return '不正确。计数是 $arg0。';
  }

  @override
  String get memoryMatrixMessage => '令人印象深刻！你的工作记忆非常敏锐。每日目标已完成！';

  @override
  String get memoryMatrixMessage1 => '集中注意力并再次尝试以提高你的记忆分数。';

  @override
  String get contextCluesMessage => '非凡！你的词汇量和上下文分析都是顶尖的。';

  @override
  String get contextCluesMessage1 => '选错词了！训练你的言语语境推理并再试一次。';

  @override
  String oneLetterShiftMessage(String arg0, String arg1) {
    return '你正确地将 $arg0 偏移到了 $arg1。';
  }

  @override
  String get mentalAbacusMessage => '你的心算是最高水平的。';

  @override
  String fractionMatcherMessage(String arg0) {
    return '你匹配表示得到了 $arg0 分！';
  }

  @override
  String get spellingSprintMessage => '你正确拼写了所有 10 个单词！';

  @override
  String spellingSprintMessage1(String arg0) {
    return '你拼写了 $arg0 个单词。';
  }

  @override
  String stopSignalMessage(String arg0) {
    return '你获得了 $arg0 个正确响应！此测试衡量你抑制计划动作的能力。';
  }

  @override
  String grammarPoliceMessage(String arg0) {
    return '游戏结束！你在语法世界中维护了秩序。分数：$arg0';
  }

  @override
  String consonantReconstructMessage(String arg0) {
    return '你重构了一个分数 $arg0！';
  }

  @override
  String rhymeMasterMessage(String arg0, String arg1) {
    return '你在 $arg1 个中找到了 $arg0 个押韵！';
  }

  @override
  String vigilanceTaskMessage(String arg0, String arg1, String arg2) {
    return '命中：$arg0，漏掉：$arg1\n误报：$arg2';
  }

  @override
  String get silhouetteMatchOrthoMessage => '你拥有完美的正交对齐技能！';

  @override
  String get silhouetteMatchOrthoText => '明白了';

  @override
  String get silhouetteMatchOrthoText1 => '透视投影不正确！点击重置重试。';

  @override
  String fibonacciMergeMessage(String arg0, String arg1) {
    return '$arg0：$arg1';
  }

  @override
  String factorFinderMessage(String arg0) {
    return '你通过找到所有因数得到了 $arg0 分！';
  }

  @override
  String logicalSyllogismsMessage(String arg0) {
    return '你正确解决了 $arg0 个三段论！';
  }

  @override
  String get rotatingMazeMessage => '你成功通过了动态旋转迷宫！';

  @override
  String get rotatingMazeText => '明白了';

  @override
  String get rotatingMazeText1 => '🌀 迷宫旋转 90°！网格偏移！';

  @override
  String get mathPathMessage => '你找到了相加等于目标的路径！';

  @override
  String get bridgesMessage => '你成功连接了所有岛屿！';

  @override
  String compoundConnectMessage(String arg0, String arg1) {
    return '复合词是 $arg0$arg1。';
  }

  @override
  String get pangramSprintMessage => '你使用所有 26 个字母构建了一个句子。';

  @override
  String get mirrorImageMessage => '你完美地识别了反射。';

  @override
  String get mirrorImageText => '镜像';

  @override
  String reverseStroopMessage(String arg0) {
    return '你得到了 $arg0 分！请密切注意指示。';
  }

  @override
  String get verbalAnalogiesMessage => '你对关系的理解非常敏锐。';

  @override
  String corsiBlocksMessage1(String arg0, String arg1) {
    return '你记住了 $arg1 个序列！你的空间记忆跨度达到了 $arg0。';
  }

  @override
  String wordLadderMessage(String arg0, String arg1, String arg2) {
    return '你成功地在 $arg2 步内将 $arg0 连接到了 $arg1。';
  }

  @override
  String d2AttentionMessage(String arg0) {
    return '令人难以置信的选择性扫描！最终分数：$arg0。';
  }

  @override
  String get d2AttentionText => '玩法介绍';

  @override
  String get d2AttentionText1 => '明白了';

  @override
  String get tangleFixMessage => '所有线条都清晰流畅。';

  @override
  String get distractorMatrixMessage => '不可思议！尽管有数学干扰，你还是记住了模式！';

  @override
  String get distractorMatrixMessage1 => '干扰物影响了你！重新训练你的工作记忆。';

  @override
  String sentenceUnscrambleMessage(String arg0) {
    return '你重构了一个分数 $arg0！';
  }

  @override
  String get kakuroMessage => '不可思议！你完美匹配了所有总和段。';

  @override
  String symbolicFlankerMessage(String arg0, String arg1) {
    return '你在 $arg1 个中答对了 $arg0 个！';
  }

  @override
  String stroopTestMessage(String arg0) {
    return '你得分了 $arg0 个正确！关注墨水的颜色，而不是单词。';
  }

  @override
  String wisconsinCardSortingMessage(String arg0) {
    return '你正确分类了 $arg0 张卡片！';
  }

  @override
  String nBackMessage(String arg0) {
    return '你实现了 $arg0 次 2-back 匹配！你的工作记忆对多任务处理至关重要。';
  }

  @override
  String rhythmMasterMessage(String arg0, String arg1) {
    return '你获得了 $arg0 次完美命中和 $arg1 分！';
  }

  @override
  String groceryListMessage(String arg0, Object score) {
    return '你在购物清单中得到了 $arg0 分！';
  }

  @override
  String get groceryListText => '我准备好了';

  @override
  String get mirrorTracingMessage => '你的大脑成功地重新连线了其协调能力。';

  @override
  String moduloClockMessage(String arg0) {
    return '出色的模心算协调！分数：$arg0';
  }

  @override
  String moduloClockMessage1(String arg0, String arg1, String arg2) {
    return '你完成了 $arg1 个模时钟解决方案中的 $arg0 个。分数：$arg2';
  }

  @override
  String get crownMessage => '所有皇冠放置成功，逻辑完美。';

  @override
  String dualCodingMessage(String arg0) {
    return '出色的双重任务表现！你的工作记忆分数：$arg0';
  }

  @override
  String inequalityDashMessage(String arg0) {
    return '你匹配不等式得到了 $arg0 分！';
  }

  @override
  String sourceMonitoringMessage(String arg0, String arg1) {
    return '你在 $arg1 个中答对了 $arg0 个！';
  }

  @override
  String get sourceMonitoringText => '开始回忆';

  @override
  String get memoryPalaceText => '可用单词';

  @override
  String target10Message(String arg0) {
    return '你将数字匹配为 10 得到了 $arg0 分！';
  }

  @override
  String get paperFoldingMessage => '你能在脑海中看到模式。';

  @override
  String topologyText(String arg0, String arg1) {
    return '$arg0$arg1 / 10';
  }

  @override
  String get waterSortMessage => '你完美地分类了所有颜色！';

  @override
  String anagramDefinitionMessage(String arg0) {
    return '这个词确实是 \"$arg0\"。';
  }

  @override
  String game2048Message(String arg0, String arg1, String arg2) {
    return '$arg0：$arg1\n$arg2';
  }

  @override
  String game2048Message1(String arg0, String arg1) {
    return '$arg0：$arg1';
  }

  @override
  String numericalEstimationMessage(String arg0) {
    return '你做了 $arg0 次正确的估计。';
  }

  @override
  String grammarSortMessage(String arg0) {
    return '你正确分类了 $arg0 个单词！';
  }

  @override
  String vowelReconstructMessage(String arg0) {
    return '你重构了一个分数 $arg0！';
  }

  @override
  String spatialConflictMessage(String arg0, String arg1) {
    return '你获得了 $arg0 的分数，共有 $arg1 个错误！';
  }

  @override
  String get spatialConflictText => '玩法介绍';

  @override
  String get spatialConflictText1 => '明白了';

  @override
  String tracePathMessage(String arg0) {
    return '你的准确度是 $arg0%！';
  }

  @override
  String ruleSwitcherMessage(String arg0, String arg1) {
    return '你在 $arg1 个中答对了 $arg0 个！';
  }

  @override
  String collatzMessage(String arg0, String arg1) {
    return '你走了 $arg0 步。最小可能步数是 $arg1。';
  }

  @override
  String get collatzText => '/ 2';

  @override
  String get collatzText1 => '+ 1';

  @override
  String get collatzText2 => '3n + 1';

  @override
  String divisibilityDashMessage(String arg0) {
    return '你解决了 $arg0 个数字！';
  }

  @override
  String switchTaskMessage(String arg0) {
    return '你得分了 $arg0 个正确！快速切换是心理灵活性的关键。';
  }

  @override
  String sequenceSleuthMessage(String arg0) {
    return '你解决了 $arg0 个序列！';
  }

  @override
  String changeBlindnessMessage(String arg0) {
    return '你找到了 $arg0 处变化！';
  }

  @override
  String mentalRotationMessage(String arg0) {
    return '你正确旋转了 $arg0 个形状！';
  }

  @override
  String wordMastermindMessage(String arg0) {
    return '你掌握了代码！\n单词是：$arg0';
  }

  @override
  String wordMastermindMessage1(String arg0) {
    return '隐藏的单词是：$arg0';
  }

  @override
  String wordMastermindText(String arg0) {
    return '$arg0';
  }

  @override
  String get simonSequenceMessage => '你记住了所有 10 个方块！';

  @override
  String get simonSequenceMessage1 => '再试一次以掌握序列。';

  @override
  String oxymoronHuntMessage(String arg0) {
    return '你找到了 $arg0 个矛盾修辞！';
  }

  @override
  String spotlightTrackMessage(String arg0) {
    return '难以置信的空间追踪！你得到了 $arg0 分。';
  }

  @override
  String get spotlightTrackText => '玩法介绍';

  @override
  String get spotlightTrackText1 => '明白了';

  @override
  String get spotlightTrackText2 => '开始回合';

  @override
  String vennNumbersMessage(String arg0) {
    return '你分类了 $arg0 个数字！';
  }

  @override
  String get vennNumbersText => '均不属于';

  @override
  String get vennNumbersText1 => '两者都是';

  @override
  String get silhouetteMatchMessage => '你的大脑在 3D 到 2D 转换方面非常出色。';

  @override
  String sumSnakeMessage(String arg0) {
    return '以完美的精度达到了目标 $arg0！';
  }

  @override
  String get sumSnakeText => '清除路径';

  @override
  String percentagePeakMessage(String arg0) {
    return '你解决了 $arg0 个百分比问题！';
  }

  @override
  String trailMakingMessage(String arg0) {
    return '你完成了 $arg0 条路径！此测试衡量你的视觉搜索速度和心理灵活性。';
  }

  @override
  String matrixReasoningMessage(String arg0) {
    return '你正确完成了 $arg0 个矩阵！';
  }

  @override
  String get tentsAndTreesMessage => '你已成功放置了所有帐篷。';

  @override
  String klotskiMessage(String arg0) {
    return '精彩的滑动！你在 $arg0 步内释放了英雄方块。';
  }

  @override
  String sumPyramidMessage(String arg0) {
    return '你成功解决了 $arg0 个求和金字塔！';
  }

  @override
  String simonCommandMessage(String arg0) {
    return '出色的选择性反应和集中力！总分：$arg0';
  }

  @override
  String simonCommandMessage1(String arg0, String arg1) {
    return '你得分了 $arg0 但未能在规定时间内达到 $arg1 次匹配。';
  }

  @override
  String syllableStackMessage(String arg0) {
    return '你堆叠得到了 $arg0 分！';
  }

  @override
  String get slitherlinkMessage => '太棒了！你成功完成了循环谜题。';

  @override
  String quickMathMessage(String arg0) {
    return '你解决了 $arg0 个问题！';
  }

  @override
  String commonDenominatorMessage(String arg0) {
    return '你解决了 $arg0 个 GCD/LCM 问题！';
  }

  @override
  String chainReactionMessage(String arg0, String arg1) {
    return '你的最终得分是 $arg0。你建立了一个包含 $arg1 个单词的链。';
  }

  @override
  String chainReactionText(String arg0) {
    return '$arg0';
  }

  @override
  String get associativePairsMessage => '出色！你完美地关联了视觉特征。';

  @override
  String get associativePairsMessage1 => '关联错误！磨练你的链接记忆并再试一次。';

  @override
  String portmanteauSplitMessage(String arg0) {
    return '你拆分了 $arg0 个混成词！';
  }

  @override
  String get magicSquaresText => '清除';

  @override
  String alphabetSudokuText(String arg0) {
    return '错误：$arg0';
  }

  @override
  String get pipesMessage => '你连接了所有管道并填满了网格。';

  @override
  String get dualMirrorMessage => '你成功引导两个图标到达了目标！';

  @override
  String binaryCodeMessage(String arg0) {
    return '精彩的快速十进制翻译！最终分数：$arg0';
  }

  @override
  String binaryCodeMessage1(String arg0, String arg1) {
    return '你正确转换了 $arg0 个二进制数。分数：$arg1';
  }

  @override
  String oddOneOutMessage(String arg0) {
    return '你找到了 50 个不同项！最终分数：$arg0';
  }

  @override
  String oddOneOutMessage1(String arg0) {
    return '你的分数：$arg0';
  }

  @override
  String letterBridgeMessage(String arg0) {
    return '你找到了桥接字母：$arg0';
  }

  @override
  String get imReady => '我准备好了';

  @override
  String get soptTitle => '自订指向';

  @override
  String get soptSubtitle => '每次点击不同的卡。位置洗牌！';

  @override
  String get soptWinTitle => '序列大师！';

  @override
  String soptGameOverMessage(int score) {
    return '通过成功追踪洗牌，您获得了 $score 分！';
  }

  @override
  String get soptChooseNovel => '点按一张新卡';

  @override
  String get soptGreatJob => '干得好！';

  @override
  String get soptAlreadyTapped => '已经点击了！';

  @override
  String get soptGrid => '网格';

  @override
  String get contRecogTitle => '持续识别';

  @override
  String get contRecogSubtitle => '您之前在本次会议中见过这张卡片吗？';

  @override
  String get contRecogWinTitle => '公认的天才！';

  @override
  String contRecogGameOverMessage(int score) {
    return '您获得了 $score 正确认可！';
  }

  @override
  String get contRecogCorrect => '正确的！';

  @override
  String get contRecogWrong => '错误的！';

  @override
  String get contRecogOldOrNew => '这是旧的还是新的？';

  @override
  String get contRecogNew => '新的';

  @override
  String get contRecogOld => '老的';

  @override
  String get contRecogSeenPool => '所见泳池';

  @override
  String get dnmsTitle => '内存不匹配';

  @override
  String get dnmsSubtitle => '点击不在记忆样本中的卡片。';

  @override
  String get dnmsWinTitle => '不匹配的专家！';

  @override
  String dnmsGameOverMessage(int score) {
    return '您在延迟不匹配中获得了 $score 正确答案！';
  }

  @override
  String get dnmsChooseNovel => '点击新卡';

  @override
  String get dnmsMemorizeSample => '记住这张卡';

  @override
  String get dnmsWaitForIt => '等等吧...';

  @override
  String get dnmsExcellent => '出色的！';

  @override
  String get dnmsSampleTapped => '这就是样本！';

  @override
  String get dnmsCards => '牌';

  @override
  String get symSpanTitle => '对称跨度';

  @override
  String get symSpanSubtitle => '回忆细胞模式，同时识别垂直对称性。';

  @override
  String get symSpanWinTitle => '对称大师！';

  @override
  String symSpanGameOverMessage(int score) {
    return '通过回忆布局和识别对称性，您获得了 $score 分！';
  }

  @override
  String get symSpanMemorizeRed => '记住红细胞位置';

  @override
  String get symSpanIsSymmetric => '图案是否对称？';

  @override
  String get symSpanRecallSequence => '按正确顺序回忆序列';

  @override
  String get symSpanGreatJob => '干得好！';

  @override
  String get symSpanTryAgain => '再试一次！';

  @override
  String get symSpanLength => '长度';

  @override
  String get readingSpanTitle => '阅读广度';

  @override
  String get readingSpanSubtitle => '在记住字母序列的同时验证句子。';

  @override
  String get readingSpanWinTitle => '阅读专家！';

  @override
  String readingSpanGameOverMessage(int score) {
    return '您在阅读广度记忆挑战中获得了 $score 分！';
  }

  @override
  String get readingSpanTrueFalse => '这个说法是真是假？';

  @override
  String get readingSpanMemorizeLetter => '记住这封信';

  @override
  String get readingSpanRecallLetters => '按顺序回忆字母';

  @override
  String get readingSpanGreatJob => '干得好！';

  @override
  String get readingSpanTryAgain => '再试一次！';

  @override
  String readingSpanYourSequence(String sequence) {
    return '您的序列： $sequence';
  }

  @override
  String get readingSpanLength => '长度';

  @override
  String get readingSpanSentence1 => '太阳从东方升起。';

  @override
  String get readingSpanSentence2 => '冰正在沸腾。';

  @override
  String get readingSpanSentence3 => '鱼可以在水下呼吸。';

  @override
  String get readingSpanSentence4 => '狗有翅膀，可以飞。';

  @override
  String get readingSpanSentence5 => '水在 0 摄氏度时结冰。';

  @override
  String get readingSpanSentence6 => '猫像小狗一样吠叫。';

  @override
  String get readingSpanSentence7 => '夏天树有绿叶。';

  @override
  String get readingSpanSentence8 => '雨从地面向上落下。';

  @override
  String get readingSpanSentence9 => '三角形有四个相等的边。';

  @override
  String get readingSpanSentence10 => '苹果是一种甜水果。';

  @override
  String get readingSpanSentence11 => '月亮是用切达干酪制成的。';

  @override
  String get readingSpanSentence12 => '汽车有轮子可以滚动。';

  @override
  String get readingSpanSentence13 => '火是冰冷的。';

  @override
  String get readingSpanSentence14 => '纸是由经过加工的木材制成的。';

  @override
  String get readingSpanSentence15 => '鸟类有羽毛来帮助它们飞翔。';

  @override
  String get readingSpanSentence16 => '香蕉长在松树上。';

  @override
  String get readingSpanSentence17 => '大象比蚂蚁小。';

  @override
  String get readingSpanSentence18 => '书籍包含印刷的文本页。';

  @override
  String get countingSpanTitle => '计数跨度';

  @override
  String get countingSpanSubtitle => '仅计算蓝色圆圈。然后回忆计数的顺序。';

  @override
  String get countingSpanWinTitle => '算天才！';

  @override
  String countingSpanGameOverMessage(int score) {
    return '您在计算跨度记忆挑战中获得了 $score 分！';
  }

  @override
  String get countingSpanCountCircles => '仅计算蓝色圆圈';

  @override
  String get countingSpanRecallCounts => '按正确顺序回忆计数';

  @override
  String get countingSpanGreatJob => '干得好！';

  @override
  String get countingSpanTryAgain => '再试一次！';

  @override
  String countingSpanYourSequence(String sequence) {
    return '您的序列： $sequence';
  }

  @override
  String get countingSpanLength => '长度';

  @override
  String get objDispTitle => '物体位移';

  @override
  String get objDispSubtitle => '记住布局。找到并点击移动位置的一个对象。';

  @override
  String get objDispWinTitle => '空间天才！';

  @override
  String objDispGameOverMessage(int score) {
    return '您正确识别了 $score 位移物体！';
  }

  @override
  String get objDispMemorizeAll => '记住所有位置';

  @override
  String get objDispWaitingShift => '等待布局转换...';

  @override
  String get objDispTapMoved => '点击移动的物体';

  @override
  String get objDispExcellent => '出色的！';

  @override
  String get objDispWrongObject => '对象错误！';

  @override
  String get objDispItems => '项目';

  @override
  String get mandalaTitle => '曼陀罗回忆';

  @override
  String get mandalaSubtitle => '记住颜色配置。选择颜色并重新粉刷瓷砖。';

  @override
  String get mandalaWinTitle => '曼陀罗艺术家！';

  @override
  String mandalaGameOverMessage(int score) {
    return '通过重新创建彩色几何布局，您获得了 $score 分！';
  }

  @override
  String get mandalaMemorizeColors => '记住瓷砖颜色';

  @override
  String get mandalaPaintCells => '绘制单元格以匹配原始单元格';

  @override
  String get mandalaExcellent => '出色的！';

  @override
  String get mandalaIncorrectMatch => '匹配错误！';

  @override
  String get mandalaSubmitRepaint => '提交重绘';

  @override
  String get mandalaTiles => '瓷砖';

  @override
  String get runningSpanTitle => '运行跨度';

  @override
  String get runningSpanSubtitle => '注意字母。当他们停止时，按顺序输入最后 N 个字母。';

  @override
  String get runningSpanWinTitle => '缓冲大师！';

  @override
  String runningSpanGameOverMessage(int score) {
    return '您在跑步记忆广度中获得了 $score 分！';
  }

  @override
  String runningSpanPrepareRecall(int count) {
    return '准备回忆最后 $count 个字母';
  }

  @override
  String get runningSpanWatchCarefully => '仔细观察...';

  @override
  String runningSpanEnterLast(int count) {
    return '输入最后 $count 个字母';
  }

  @override
  String get runningSpanGreatJob => '干得好！';

  @override
  String get runningSpanIncorrectBuffer => '缓冲区不正确！';

  @override
  String runningSpanRecallLast(int count) {
    return '回想最后 $count 个';
  }

  @override
  String get runningSpanStopsRandomly => '流随机停止！';

  @override
  String runningSpanEntered(String sequence) {
    return '输入： $sequence';
  }

  @override
  String get runningSpanNItems => 'N 项';

  @override
  String get spatialCabinetTitle => '空间柜';

  @override
  String get spatialCabinetSubtitle => '记住哪个柜子抽屉里有哪个物品。';

  @override
  String get spatialCabinetWinTitle => '橱柜专家！';

  @override
  String spatialCabinetGameOverMessage(int score) {
    return '您在空间柜记忆中获得了 $score 分！';
  }

  @override
  String get spatialCabinetMemorize => '记住物品位置';

  @override
  String spatialCabinetWhereIs(String itemName) {
    return '$itemName 在哪里？';
  }

  @override
  String get spatialCabinetCorrect => '正确的！';

  @override
  String get spatialCabinetWrongDrawer => '抽屉放错了！';

  @override
  String get spatialCabinetItems => '项目';

  @override
  String get cabinetItemKey => '钥匙';

  @override
  String get cabinetItemApple => '苹果';

  @override
  String get cabinetItemDiamond => '钻石';

  @override
  String get cabinetItemBook => '书';

  @override
  String get cabinetItemUmbrella => '伞';

  @override
  String get cabinetItemCoffee => '咖啡';

  @override
  String get cabinetItemLock => '锁';

  @override
  String get cabinetItemPet => '宠物';

  @override
  String get cabinetItemCar => '车';

  @override
  String get gamesTitleLabel => '游戏';

  @override
  String get yourFavorites => '你的最爱';

  @override
  String get readyForWorkout => '准备好进行每日锻炼了吗？';

  @override
  String get greatStartKeepGoing => '良好的开端！继续保持。';

  @override
  String get onFireToday => '你今天状态火热！';

  @override
  String get incredibleSolvingToday => '今天表现惊人！';

  @override
  String get newGameLabel => '新';

  @override
  String get slitherlinkTitle => '数连 (Slitherlink)';

  @override
  String get slitherlinkSubtitle => '使用数字线索连接点网格。';

  @override
  String get futoshikiTitle => '不等式 (Futoshiki)';

  @override
  String get futoshikiSubtitle => '使用大于/小于线索填充网格。';

  @override
  String get kakuroTitle => '数和 (Kakuro)';

  @override
  String get kakuroSubtitle => '使用数字和总和解决交叉谜题。';

  @override
  String get inequalityDashTitle => '不等式冲刺';

  @override
  String get inequalityDashSubtitle => '在时间压力下解决不等式。';

  @override
  String get factorFinderTitle => '因数寻找者';

  @override
  String get factorFinderSubtitle => '识别目标数字的所有因数。';

  @override
  String get collatzTitle => '考拉兹路径';

  @override
  String get collatzSubtitle => '导航 3N+1 序列。';

  @override
  String get sumPyramidTitle => '总和金字塔';

  @override
  String get sumPyramidSubtitle => '使用总和数学线索填充金字塔单元格。';

  @override
  String get target10Title => '目标 10';

  @override
  String get target10Subtitle => '合并数字磁贴以获得十个总和。';

  @override
  String get fractionMatcherTitle => '分数匹配';

  @override
  String get fractionMatcherSubtitle => '视觉上匹配等值分数。';

  @override
  String get dualCodingTitle => '双重编码';

  @override
  String get dualCodingSubtitle => '同时匹配字母和符号。';

  @override
  String get distractorMatrixTitle => '干扰矩阵';

  @override
  String get distractorMatrixSubtitle => '在干扰因素中寻找目标形状。';

  @override
  String get temporalOrderTitle => '时间顺序';

  @override
  String get temporalOrderSubtitle => '回忆时间序列。';

  @override
  String get associativePairsTitle => '联想对';

  @override
  String get associativePairsSubtitle => '配对并匹配相应的符号。';

  @override
  String get blockCount3dTitle => '3D 方块计数';

  @override
  String get blockCount3dSubtitle => '在三维空间中清点方块。';

  @override
  String get rotatingMazeTitle => '旋转迷宫';

  @override
  String get rotatingMazeSubtitle => '旋转迷宫以引导球到达出口。';

  @override
  String get silhouetteMatchOrthoTitle => '剪影匹配（正交）';

  @override
  String get silhouetteMatchOrthoSubtitle => '将 3D 物体与正交阴影匹配。';

  @override
  String get spatialConflictTitle => '空间冲突';

  @override
  String get spatialConflictSubtitle => '解决文本和方向之间的差异。';

  @override
  String get spotlightTrackTitle => '聚光灯追踪';

  @override
  String get spotlightTrackSubtitle => '在移动的阴影中追踪闪烁的项目。';

  @override
  String get d2AttentionTitle => 'd2 注意力';

  @override
  String get d2AttentionSubtitle => '按照严格标准点击目标符号。';

  @override
  String get dualMirrorTitle => '双镜导航';

  @override
  String get dualMirrorSubtitle => '同时导航两个迷宫。';

  @override
  String get contextCluesTitle => '语境线索';

  @override
  String get contextCluesSubtitle => '从语境暗示中推断隐藏的单词。';

  @override
  String get digitSpanReverseSubtitle => '以相反顺序回忆数字位数。';

  @override
  String get faceNameAssociationSubtitle => '回忆所展示的不同脸孔的名字。';

  @override
  String get staircaseMemorySubtitle => '按阶梯顺序记忆方块。';

  @override
  String get choiceReactionTimeSubtitle => '快速点击与线索匹配的特定按钮。';

  @override
  String get attentionalBlinkSubtitle => '捕捉在流中闪烁的快速目标。';

  @override
  String get visualStatisticalLearningSubtitle => '视觉学习时间形状模式。';

  @override
  String get sternbergTaskSubtitle => '回忆符号是否在记忆集中。';

  @override
  String get operationSpanSubtitle => '解决数学题并回忆字母串。';

  @override
  String get continuousRecognitionTitle => '连续识别';

  @override
  String get continuousRecognitionSubtitle => '识别所展示的卡片是旧的还是新的。';

  @override
  String get symmetrySpanTitle => '对称跨度';

  @override
  String get symmetrySpanSubtitle => '在垂直对称决策中回忆单元格坐标。';

  @override
  String get objectDisplacementTitle => '物体位移';

  @override
  String get objectDisplacementSubtitle => '研究摆放位置并点击唯一移动的物体。';

  @override
  String get mandalaRecallTitle => '曼陀罗回忆';

  @override
  String get mandalaRecallSubtitle => '记忆彩色磁贴并从调色板重新绘制曼陀罗。';

  @override
  String get runningMemorySpanTitle => '运行跨度';

  @override
  String get runningMemorySpanSubtitle => '监控运行的字母并回忆最后 N 个项目。';

  @override
  String get spatialCabinetMemoryTitle => '空间柜子';

  @override
  String get spatialCabinetMemorySubtitle => '记忆并定位柜门后的项目。';

  @override
  String get pathRecallSubtitle => '记忆并重复路径选择。';

  @override
  String get objectShuffleSubtitle => '追踪深杯下洗牌的项目。';

  @override
  String get groceryListSubtitle => '记忆并勾选清单上的项目。';

  @override
  String get quickMathSubtitle => '以最高速度解决算术问题。';

  @override
  String get mathGuessTitle => '数学猜猜看';

  @override
  String get mathGuessSubtitle => '在 15 次机会内猜出隐藏的数字。';

  @override
  String get reflexTapSubtitle => '以人类极限速度点击刺激。';

  @override
  String get pixelMimicSubtitle => '在像素网格上模仿设计图案。';

  @override
  String get simonSequenceSubtitle => '从记忆中重复形状序列。';

  @override
  String get slidePuzzleSubtitle => '重新排列正方形滑动网格磁贴。';

  @override
  String get findWordTitle => '找单词';

  @override
  String get schulteTableSubtitle => '按顺序点击数字 1 到 25。';

  @override
  String get simonCommandTitle => '西蒙命令';

  @override
  String get simonCommandSubtitle => '快速执行语音指令。';

  @override
  String get binaryCodeTitle => '二进制速度';

  @override
  String get binaryCodeSubtitle => '将二进制代码转换为十进制。';

  @override
  String get moduloClockTitle => '同余时钟';

  @override
  String get moduloClockSubtitle => '使用时钟计算数学方程式。';

  @override
  String get chimpTestTitle => '黑猩猩测试';

  @override
  String get chimpTestSubtitle => '按升序点击随机数字。';

  @override
  String get relationalMemoryTitle => '关系记忆';

  @override
  String get relationalMemorySubtitle => '回忆准确的网格项目位置。';

  @override
  String get factBinderTitle => '事实活页夹';

  @override
  String get factBinderSubtitle => '连接符号并回忆陈述。';

  @override
  String get sourceMonitoringTitle => '来源监控';

  @override
  String get sourceMonitoringSubtitle => '记住语境。';

  @override
  String get klotskiTitle => '华容道 (Klotski Escape)';

  @override
  String get klotskiSubtitle => '滑动方块以到达出口。';

  @override
  String get homophoneHuntSubtitle => '选择拼写正确的同音词';

  @override
  String get laserLinkTitle => '激光链接';

  @override
  String get laserLinkSubtitle => '旋转镜子以反射激光并激活所有目标。';

  @override
  String get laserLinkCongrats => '精准反射！你已成功为整个网格供电。';

  @override
  String get crossSectionSliceTitle => '横截面切片';

  @override
  String get crossSectionSliceSubtitle => '从特定角度识别 3D 物体正确的 2D 横截面。';

  @override
  String get crossSectionSliceCongrats => '惊人的 3D 空间想象力！你一眼就看穿了那个形状。';

  @override
  String get shadowPivotTitle => '影子旋转';

  @override
  String get shadowPivotCongrats => '动态空间推理！你掌握了光与影的奥秘。';

  @override
  String get shadowPivotSubtitle => '预测 3D 物体在不同轴上旋转时投射的阴影。';

  @override
  String get interlockPuzzleTitle => '互锁挑战';

  @override
  String get interlockPuzzleSubtitle => '按正确的顺序拆卸或组装复杂的互锁块。';

  @override
  String get interlockPuzzleCongrats => '逻辑拆解！你完美地解开了这个谜题。';

  @override
  String get pathIntersectTitle => '路径交汇';

  @override
  String get pathIntersectSubtitle => '同时导航多条路径，以到达各自的目标且不发生碰撞。';

  @override
  String get pathIntersectCongrats => '同步导航！你完美无瑕地到达了所有目标。';

  @override
  String get negativeSpaceDetectionTitle => '负空间';

  @override
  String get negativeSpaceDetectionSubtitle => '识别由物体之间的空白区域形成的形状。';

  @override
  String get negativeSpaceDetectionCongrats => '敏锐的洞察力！你已掌握了观察虚空间的艺术。';

  @override
  String get compassMazeTitle => '指南针迷宫';

  @override
  String get compassMazeSubtitle => '在移动方向随指南针方向变化的迷宫中导航。';

  @override
  String get compassMazeCongrats => '专家级导航！你已在不断变化的方向中找到了出口。';

  @override
  String get complexFoldingNetsTitle => '展开图折叠';

  @override
  String get complexFoldingNetsSubtitle => '确定折叠非标准 2D 展开图后将形成哪种复杂的 3D 形状。';

  @override
  String get complexFoldingNetsCongrats => '高级折叠逻辑！你已成功构思出 3D 形状。';

  @override
  String get compassMazeMessage => '使用指南针在迷宫中导航。';

  @override
  String get negativeSpaceDetectionMessage => '识别空间中隐藏的物体。';

  @override
  String get shikakuTitle => '鹿角';

  @override
  String get shikakuSubtitle => '将网格划分为与数字匹配的正方形和矩形。';

  @override
  String get countdownMathTitle => '倒数数学';

  @override
  String get countdownMathSubtitle => '组合随机数来计算三位数目标。';

  @override
  String get narrativeRecallTitle => '叙事回忆';

  @override
  String get narrativeRecallSubtitle => '阅读一个故事并回忆起具体的定量和事实细节。';

  @override
  String get shellGameTitle => '猜壳游戏';

  @override
  String get shellGameSubtitle => '当洗牌的杯子交换位置时，追踪隐藏的球。';

  @override
  String get typoglycemiaDecoderTitle => '低血糖解码器';

  @override
  String get typoglycemiaDecoderSubtitle => '快速理清并阅读混乱的句子。';

  @override
  String get shapeShifterTitle => '变形者';

  @override
  String get shapeShifterSubtitle => '点击目标形状-颜色组合。';

  @override
  String get gokigenNanameTitle => '五鬼源名';

  @override
  String get gokigenNanameSubtitle => '绘制对角线来连接没有环的点。';

  @override
  String get matrixMultiplierTitle => '矩阵乘法器';

  @override
  String get matrixMultiplierSubtitle => '选择要乘以目标的行和列。';

  @override
  String get wordAssociationRecallTitle => '词联想';

  @override
  String get wordAssociationRecallSubtitle => '从记忆中回忆成对的单词关联。';

  @override
  String get gearRotationTitle => '齿轮旋转';

  @override
  String get gearRotationSubtitle => '预测最后一个齿轮的旋转方向。';

  @override
  String get wordWheelTitle => '字轮';

  @override
  String get wordWheelSubtitle => '使用轮盘上的字母（包括中心字母）组成单词。';

  @override
  String get oddEvenFlashTitle => '奇偶闪光';

  @override
  String get oddEvenFlashSubtitle => '快速将数字奇偶性与颜色规则匹配。';

  @override
  String get norinoriTitle => '纪则';

  @override
  String get norinoriSubtitle => '准确地遮蔽每个房间中两个相连的单元格。';

  @override
  String get algebraicBalanceTitle => '代数平衡';

  @override
  String get algebraicBalanceSubtitle => '求解方程以找到目标总和。';

  @override
  String get patternSequenceDrawTitle => '模式回忆';

  @override
  String get patternSequenceDrawSubtitle => '在网格上重复动画路径序列。';

  @override
  String get tangramTitle => '七巧板拼图';

  @override
  String get tangramSubtitle => '排列形状以填充目标轮廓。';

  @override
  String get semanticAssociationTitle => '联想词';

  @override
  String get semanticAssociationSubtitle => '找到连接所有三个线索的单词。';

  @override
  String get peripheralFocusTitle => '周边焦点';

  @override
  String get peripheralFocusSubtitle => '在解决数学问题时对闪烁的侧面板做出反应。';

  @override
  String get masyuTitle => '马斯尤循环';

  @override
  String get masyuSubtitle => '绘制符合 Masyu 圆规则的单个循环。';

  @override
  String get mathMazeTitle => '数学迷宫';

  @override
  String get mathMazeSubtitle => '跟踪计算结果为目标总数的路径。';

  @override
  String get storyBuilderTitle => '故事生成器';

  @override
  String get storyBuilderSubtitle => '重建故事的时间顺序。';

  @override
  String get mirrorMazeTitle => '镜子迷宫';

  @override
  String get mirrorMazeSubtitle => '使用对角镜重定向激光束。';

  @override
  String get wordGridConnectionTitle => '单词连接';

  @override
  String get wordGridConnectionSubtitle => '将 16 个单词分为四类，每类四类。';

  @override
  String get shapeShifterPeripheralTitle => '周边形状';

  @override
  String get shapeShifterPeripheralSubtitle => '跟踪外围形状变化，同时匹配中心值。';

  @override
  String get soundWaveMatchTitle => '声波匹配';

  @override
  String get soundWaveMatchSubtitle => '当视觉波频率与音高变化一致时点击。';

  @override
  String get multiTrackCounterTitle => '多轨计数器';

  @override
  String get multiTrackCounterSubtitle => '当任何计数器递增到目标乘数时点击。';

  @override
  String get colorWordMatchUpTitle => '颜色搭配';

  @override
  String get colorWordMatchUpSubtitle => '根据变化的规则确定两个彩色单词是否匹配。';

  @override
  String get signalAndNoiseTitle => '信号与噪声';

  @override
  String get signalAndNoiseSubtitle => '定位隐藏在静态噪声中的目标字母数字字符。';

  @override
  String get focusTunnelTitle => '聚焦隧道';

  @override
  String get focusTunnelSubtitle => '识别移动隧道墙上出现的匹配符号。';

  @override
  String get targetPursuerTitle => '目标追击者';

  @override
  String get targetPursuerSubtitle => '跟踪多个重叠的圆圈并选择原始目标。';

  @override
  String get gridGazeTitle => '网格凝视';

  @override
  String get gridGazeSubtitle => '识别哪个网格单元闪烁了不同的持续时间。';

  @override
  String get doubleTroubleTitle => '双重麻烦';

  @override
  String get doubleTroubleSubtitle => '在分屏上同时玩两个单独的简单游戏。';

  @override
  String get syncRhythmTitle => '同步节奏';

  @override
  String get syncRhythmSubtitle => '当视觉节拍器扫描与切分音节拍匹配时点击。';

  @override
  String get ghostTapTitle => '幽灵水龙头';

  @override
  String get ghostTapSubtitle => '当看不见的脉冲达到最大高度时点击。';

  @override
  String get attentionalRsvpTitle => '注意回复';

  @override
  String get attentionalRsvpSubtitle => '识别快速串行字母闪烁中出现的数字。';

  @override
  String get colorMazeNavTitle => '彩色迷宫导航';

  @override
  String get colorMazeNavSubtitle => '导航匹配动态权限颜色的迷宫图块。';

  @override
  String get dynamicSalienceTitle => '动态显着性';

  @override
  String get dynamicSalienceSubtitle => '找出以稍微不同的动力移动的形状。';

  @override
  String get chalkAndTalkTitle => '粉笔与谈话';

  @override
  String get chalkAndTalkSubtitle => '输入在音频中听到的单词，同时忽略视觉干扰。';

  @override
  String get blinkDetectorTitle => '眨眼检测器';

  @override
  String get blinkDetectorSubtitle => '点击快速连续闪烁两次的网格面。';

  @override
  String get frequencyTapTitle => '频率抽头';

  @override
  String get frequencyTapSubtitle => '点击与目标光脉冲频率匹配的按钮。';

  @override
  String get yajilinTitle => '雅吉林环线';

  @override
  String get yajilinSubtitle => '放置黑色单元格并绘制匹配线索的单个循环。';

  @override
  String get heyawakeTitle => '嘿亚醒网格';

  @override
  String get heyawakeSubtitle => '遮蔽没有相邻黑色单元格的网格房间。';

  @override
  String get gokigenVariantTitle => 'Gokigen 变体';

  @override
  String get gokigenVariantSubtitle => '绘制符合顶点数的无环对角线。';

  @override
  String get sheepAndWolvesTitle => '羊与狼';

  @override
  String get sheepAndWolvesSubtitle => '画一个圈将羊和狼分开。';

  @override
  String get islandNurikabeTitle => '岛涂壁';

  @override
  String get islandNurikabeSubtitle => '形成与数值尺寸限制相匹配的岛屿。';

  @override
  String get shakashakaTitle => '沙卡沙卡直肠';

  @override
  String get shakashakaSubtitle => '放置三角形瓷砖以形成矩形白色区域。';

  @override
  String get litsTetrisTitle => '利特四号牌';

  @override
  String get litsTetrisSubtitle => '将四格骨牌放置在没有相邻重复项的房间中。';

  @override
  String get tapaWallTitle => '塔帕墙';

  @override
  String get tapaWallSubtitle => '遮光细胞形成连续的黑色墙壁图案。';

  @override
  String get triangularBridgesTitle => '三角桥';

  @override
  String get triangularBridgesSubtitle => '3个方向连接岛屿满足要求。';

  @override
  String get rippleEffectTitle => '连锁反应';

  @override
  String get rippleEffectSubtitle => '根据间距限制填写房间中的数字。';

  @override
  String get suguruTectonicTitle => '苏古鲁网格';

  @override
  String get suguruTectonicSubtitle => '用数字 1 到 K 填充房间块，没有相同的邻居。';

  @override
  String get tennerGridTitle => '十格网格';

  @override
  String get tennerGridSubtitle => '使用与列总计相匹配的数字 0-9 填充行。';

  @override
  String get kakurasuSumsTitle => '角罗苏姆';

  @override
  String get kakurasuSumsSubtitle => '对单元格进行着色以满足加权行/列索引总和。';

  @override
  String get corralLoopTitle => '畜栏环路';

  @override
  String get corralLoopSubtitle => '绘制一个包含与可见性相匹配的数字的单个循环。';

  @override
  String get stostoneTitle => '斯托斯通引力';

  @override
  String get stostoneSubtitle => '对下拉的单元格进行着色以完美填充底部行。';

  @override
  String get tripletsLogicTitle => '三胞胎三重奏';

  @override
  String get tripletsLogicSubtitle => '用三个形状填充网格，避免三个连续。';

  @override
  String get galaxiesSymTitle => '星系对称性';

  @override
  String get galaxiesSymSubtitle => '将网格划分为旋转对称的星系形状。';

  @override
  String get matrixMultiplierMatchTitle => '矩阵匹配器';

  @override
  String get matrixMultiplierMatchSubtitle => '将行值和列值相乘以匹配目标点积。';

  @override
  String get primeFactorTreesTitle => '素因子树';

  @override
  String get primeFactorTreesSubtitle => '将合数分解为素叶因子对。';

  @override
  String get vektorVectorTitle => '向量向量';

  @override
  String get vektorVectorSubtitle => '缩放向量以使它们的总和落在目标上。';

  @override
  String get binomialMatchTitle => '二项式匹配';

  @override
  String get binomialMatchSubtitle => '将二次公式与因式二项式值相匹配。';

  @override
  String get percentageShoppingTitle => '购物百分比';

  @override
  String get percentageShoppingSubtitle => '计算折扣百分比和最终结帐总额。';

  @override
  String get cryptoArithmeticTitle => '密码算术';

  @override
  String get cryptoArithmeticSubtitle => '破解字符数字替换密码数学问题。';

  @override
  String get fractionalPizzaTitle => '分数披萨';

  @override
  String get fractionalPizzaSubtitle => '对披萨片进行分区以匹配目标总和分数。';

  @override
  String get numberBondsTitle => '债券数量';

  @override
  String get numberBondsSubtitle => '链接节点值等于目标连接总和。';

  @override
  String get gridSumLineTitle => '网格求和线';

  @override
  String get gridSumLineSubtitle => '绘制一条路径，其值精确地等于目标。';

  @override
  String get binaryScaleBalanceTitle => '二进制天平';

  @override
  String get binaryScaleBalanceSubtitle => '使用二次幂块平衡小数重量。';

  @override
  String get moduloPathTitle => '模路径';

  @override
  String get moduloPathSubtitle => '遍历与模余数匹配的网格单元。';

  @override
  String get digitSwapEqTitle => '数字交换方程';

  @override
  String get digitSwapEqSubtitle => '在方程之间交换个位数即可纠正这两个方程。';

  @override
  String get areaPerimeterMatchTitle => '面积和周长';

  @override
  String get areaPerimeterMatchSubtitle => '绘制与目标面积和周长值匹配的矩形。';

  @override
  String get inequalityBalanceOpsTitle => '不平等平衡';

  @override
  String get inequalityBalanceOpsSubtitle => '将不等式符号放在复杂的数学术语之间。';

  @override
  String get graphCoordinatePlotTitle => '绘图仪';

  @override
  String get graphCoordinatePlotSubtitle => '绘制与线性/二次曲线匹配的网格坐标。';

  @override
  String get baseConversionRunTitle => '基本转换';

  @override
  String get baseConversionRunSubtitle => '在二进制、十进制、十六进制和八进制之间转换值。';

  @override
  String get unitConverterProTitle => '单位换算';

  @override
  String get unitConverterProSubtitle => '在时间限制内快速回答单位转换问题。';

  @override
  String get auditoryNBackTitle => '听觉 N-Back';

  @override
  String get auditoryNBackSubtitle => '从记忆中回溯 N 步，匹配听到的口语字母。';

  @override
  String get abstractPatternRecallTitle => '图案分层';

  @override
  String get abstractPatternRecallSubtitle => '从记忆研究中重建分层的彩色形状。';

  @override
  String get roomInspectorTitle => '客房督察';

  @override
  String get roomInspectorSubtitle => '识别屏幕空白时对家具所做的修改。';

  @override
  String get voiceToFaceMatchTitle => '声脸匹配';

  @override
  String get voiceToFaceMatchSubtitle => '选择与口语音频剪辑关联的正确面孔。';

  @override
  String get spatialGridMemory3DTitle => '3D空间记忆';

  @override
  String get spatialGridMemory3DSubtitle => '回想一下旋转 3D 立方体网格结构中闪烁的块。';

  @override
  String get sequenceStackTitle => '序列栈';

  @override
  String get sequenceStackSubtitle => '按顺序重建板堆添加和删除。';

  @override
  String get semanticCategoryRecallTitle => '类别召回';

  @override
  String get semanticCategoryRecallSubtitle => '识别与请求的类别目标匹配的学习单词。';

  @override
  String get gridDisplacementTitle => '网格位移';

  @override
  String get gridDisplacementSubtitle => '将布局与原始布局进行比较，识别移动的图标。';

  @override
  String get soundSequenceMatchTitle => '声音序列匹配';

  @override
  String get soundSequenceMatchSubtitle => '重复在虚拟键盘上演奏的音符序列。';

  @override
  String get cardCountingMemoryTitle => '卡片柜台';

  @override
  String get cardCountingMemorySubtitle => '识别连续发牌运行中已发的牌。';

  @override
  String get directionsRecallTitle => '方向回忆';

  @override
  String get directionsRecallSubtitle => '导航网格地图以匹配内存中的路径方向。';

  @override
  String get eventTimelineMemoryTitle => '事件时间表';

  @override
  String get eventTimelineMemorySubtitle => '按时间顺序排列历史/虚构事件卡。';

  @override
  String get featureMatrixRecallTitle => '特征矩阵';

  @override
  String get featureMatrixRecallSubtitle => '回答有关单元格形状颜色属性的查询提示。';

  @override
  String get delayedMatchSampleTitle => '延迟比赛';

  @override
  String get delayedMatchSampleSubtitle => '解决数学干扰后匹配目标符号。';

  @override
  String get symbolDigitAssocTitle => '符号-数字关联';

  @override
  String get symbolDigitAssocSubtitle => '解决与数字键匹配的符号翻译表。';

  @override
  String get dualTaskMemoryTitle => '双任务内存';

  @override
  String get dualTaskMemorySubtitle => '在解决快速算术任务的同时记住单词集。';

  @override
  String get actionSequenceRecallTitle => '动作回忆';

  @override
  String get actionSequenceRecallSubtitle => '按顺序重复角色手势动画序列。';

  @override
  String get tangramPolygonTitle => '七巧板适合';

  @override
  String get tangramPolygonSubtitle => '排列多边形形状以填充轮廓轮廓。';

  @override
  String get mazeNav3DTitle => '3D迷宫导航';

  @override
  String get mazeNav3DSubtitle => '从第一人称视角浏览 3D 等距迷宫路线。';

  @override
  String get isometricProjectionTitle => '等距投影仪';

  @override
  String get isometricProjectionSubtitle => '将 3D 块图与正交 2D 顶视图/前视图相匹配。';

  @override
  String get polyominoPackingTitle => '多联骨料填料';

  @override
  String get polyominoPackingSubtitle => '将随机多联骨牌块装入目标区域。';

  @override
  String get spatialGridRotationTitle => '空间网格旋转';

  @override
  String get spatialGridRotationSubtitle => '匹配沿轴坐标旋转的 3D 块排列。';

  @override
  String get wireLoopGameTitle => '线环';

  @override
  String get wireLoopGameSubtitle => '沿钢丝花键拖动金属环，无需接触。';

  @override
  String get origamiUnfoldTitle => '折纸展开';

  @override
  String get origamiUnfoldSubtitle => '展开折叠纸张后识别打孔图案。';

  @override
  String get ropeTangleSolverTitle => '解绳器';

  @override
  String get ropeTangleSolverSubtitle => '拖动节点以布局具有零线交叉的平面图。';

  @override
  String get gridFitTetrisTitle => '网格拟合求解器';

  @override
  String get gridFitTetrisSubtitle => '排列静态不规则块以适合容器边界。';

  @override
  String get vectorGridAlignmentTitle => '矢量对齐';

  @override
  String get vectorGridAlignmentSubtitle => '缩放和旋转形状以匹配阴影模板目标。';

  @override
  String get blockStackingPhysicsTitle => '块堆叠';

  @override
  String get blockStackingPhysicsSubtitle => '堆叠不规则块板平衡重力重量。';

  @override
  String get crossSectionMatch3DTitle => '3D 横截面';

  @override
  String get crossSectionMatch3DSubtitle => '识别从 3D 形状切下的 2D 切片几何形状。';

  @override
  String get symmetryPaintTitle => '对称涂料';

  @override
  String get symmetryPaintSubtitle => '绘制跨对称轴反射的镜像片段。';

  @override
  String get rollingBlockBloxTitle => '滚动块';

  @override
  String get rollingBlockBloxSubtitle => '滚动块块以垂直落在目标槽中。';

  @override
  String get perspectiveShiftViewTitle => '视角转变';

  @override
  String get perspectiveShiftViewSubtitle => '旋转块簇直到它们拼写出字母/单词。';

  @override
  String get networkFlowSphericalTitle => '网络流量';

  @override
  String get networkFlowSphericalSubtitle => '在环绕圆柱坐标上连接网格流。';

  @override
  String get layeredSilhouetteBlendTitle => '剪影混合';

  @override
  String get layeredSilhouetteBlendSubtitle => '堆叠彩色图层以匹配目标半透明形状。';

  @override
  String get wordWheelPangramTitle => '字谜';

  @override
  String get wordWheelPangramSubtitle => '从轮子构建包含中心目标字母的单词。';

  @override
  String get letterGridSwapperTitle => '字母交换器';

  @override
  String get letterGridSwapperSubtitle => '交换相邻的字母块以完成行和列单词。';

  @override
  String get synonymMatchTitle => '同义词匹配';

  @override
  String get synonymMatchSubtitle => '将下降的单词目标与同义词或反义词相匹配。';

  @override
  String get vowelDropTitle => '元音下降';

  @override
  String get vowelDropSubtitle => '将元音放入坐标网格中以完成单词。';

  @override
  String get letterBalanceScaleTitle => '单词平衡量表';

  @override
  String get letterBalanceScaleSubtitle => '拼写字母值平衡权重的单词。';

  @override
  String get wordChainShiritoriTitle => '字链';

  @override
  String get wordChainShiritoriSubtitle => '从前面的字母输出开始链接单词循环。';

  @override
  String get affixBuilderTitle => '词缀生成器';

  @override
  String get affixBuilderSubtitle => '组合前缀/后缀来构建目标词汇表。';

  @override
  String get decipherCrypticCluesTitle => '神秘破译';

  @override
  String get decipherCrypticCluesSubtitle => '解决文字游戏谜题并解密拼写谜语。';

  @override
  String get boggleWordSearchTitle => '令人惊叹的连接';

  @override
  String get boggleWordSearchSubtitle => '追踪相邻的连接路径以找到隐藏的单词。';

  @override
  String get idiomUnscrambleTitle => '成语解读';

  @override
  String get idiomUnscrambleSubtitle => '排列乱序的单词数组以匹配成语含义。';

  @override
  String get letterPyramidsTitle => '字母金字塔';

  @override
  String get letterPyramidsSubtitle => '建造单词塔，每层添加单个字谜字母。';

  @override
  String get soundAlikeHomophonesTitle => '同音字匹配';

  @override
  String get soundAlikeHomophonesSubtitle => '识别句子的正确同音拼写。';

  @override
  String get wordGridSudokuTitle => '字数独';

  @override
  String get wordGridSudokuSubtitle => '将字母镶嵌在网格行中形成单词。';

  @override
  String get portmanteauFactoryTitle => '波特曼托工厂';

  @override
  String get portmanteauFactorySubtitle => '合并语义组件创建复合词。';

  @override
  String get codedCrosswordsCodeTitle => '代码字填字游戏';

  @override
  String get codedCrosswordsCodeSubtitle => '解决与数字到字母代码匹配的网格填字游戏。';

  @override
  String get wordSnakeTrailTitle => '字蛇';

  @override
  String get wordSnakeTrailSubtitle => '追踪蛇状字母轨迹，拼写主题词。';

  @override
  String get typingRhythmSpeedTitle => '打字流程';

  @override
  String get typingRhythmSpeedSubtitle => '输入与节拍器节奏相匹配的词汇。';

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
  String get hideGame => 'Hide';

  @override
  String get unhideGame => 'Unhide';

  @override
  String get favoriteGame => 'Favorite';

  @override
  String get unfavoriteGame => 'Unfavorite';

  @override
  String get hiddenGames => 'HIDDEN GAMES';

  @override
  String showHiddenGames(int count) {
    return 'Show Hidden Games ($count)';
  }

  @override
  String get noHiddenGames => 'No hidden games';

  @override
  String get gameHidden => 'Game hidden';

  @override
  String get undo => 'Undo';

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
  String get btnMatchColor => 'MATCH COLOR';

  @override
  String get btnMatchWord => 'MATCH WORD';

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
}
