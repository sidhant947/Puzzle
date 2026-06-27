// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'パズルゲーム';

  @override
  String get home => 'ホーム';

  @override
  String get settings => '設定';

  @override
  String get playAgain => 'もう一度プレイ';

  @override
  String get playNext => '次を再生';

  @override
  String get seeCompleted => 'パズルを確認';

  @override
  String get finish => '終了';

  @override
  String get congrats => 'おめでとう';

  @override
  String get perfectGradient => '完璧なグラデーション！';

  @override
  String get wellDone => 'よくできました';

  @override
  String get timeUp => 'タイムアップ！';

  @override
  String get victory => '勝利！';

  @override
  String get gameWin => 'よくできました！';

  @override
  String get completed => '完了！';

  @override
  String get score => 'スコア';

  @override
  String get timeLeft => '残り時間';

  @override
  String get trials => '試行';

  @override
  String get numberRule => '数字ルール';

  @override
  String get colorRule => '色ルール';

  @override
  String get valid => '有効';

  @override
  String get invalid => '無効';

  @override
  String get even => '偶数';

  @override
  String get odd => '奇数';

  @override
  String get red => '赤';

  @override
  String get green => '緑';

  @override
  String get blue => '青';

  @override
  String get yes => 'はい';

  @override
  String get no => 'いいえ';

  @override
  String get trueLabel => '真';

  @override
  String get falseLabel => '偽';

  @override
  String get clear => 'クリア';

  @override
  String get north => '北';

  @override
  String get south => '南';

  @override
  String get east => '東';

  @override
  String get west => '西';

  @override
  String get target => 'ターゲット';

  @override
  String get moves => '手数';

  @override
  String get trialMode => '試行モード';

  @override
  String get trialModeDescription => '60秒タイマーの代わりに20個解いて終了';

  @override
  String get appearance => '外観';

  @override
  String get language => '言語';

  @override
  String get gameplay => 'ゲームプレイ';

  @override
  String get supportUs => '応援する';

  @override
  String get systemLegal => 'システムと法律';

  @override
  String get games => 'ゲーム';

  @override
  String get solvedToday => '今日解いた数';

  @override
  String get searchGames => 'ゲームを検索...';

  @override
  String get readyToStart => '脳トレを始める準備はいいですか？';

  @override
  String get greatStart => '素晴らしいスタート！その調子です。';

  @override
  String get onFire => '絶好調！脳が活性化しています。';

  @override
  String get incredible => '信じられない！あなたはパズルマスターです。';

  @override
  String get noGamesMatch => '検索に一致するゲームはありません';

  @override
  String get categoryAll => 'すべて';

  @override
  String get categoryAttention => '注意力';

  @override
  String get categoryLogic => '論理';

  @override
  String get categoryMath => '数学';

  @override
  String get categoryWord => '言葉';

  @override
  String get categoryMemory => '記憶';

  @override
  String get categorySpatial => '空間';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeDark => 'ダーク';

  @override
  String get themeSystem => 'システム';

  @override
  String get starOnGithub => 'GitHubでスターを付ける';

  @override
  String get sponsorOnGithub => 'GitHubでスポンサーになる';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get termsOfService => '利用規約';

  @override
  String get licenses => 'ライセンス';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return '$wordLength文字の隠された単語を見つけるまで、あと$maxTries回試行できます。';
  }

  @override
  String wordFoundMessage(String word) {
    return '単語が見つかりました：$word';
  }

  @override
  String gameOverMessage(String word) {
    return '正解は：$word';
  }

  @override
  String get gameOver => 'ゲームオーバー';

  @override
  String get crosswordTitle => 'クロスワード';

  @override
  String get crosswordSubtitle => 'ヒントを頼りに、グリッドを正しい単語で埋めましょう。';

  @override
  String get wordSearchTitle => '単語探し';

  @override
  String get radicalRootsTitle => 'ルート計算';

  @override
  String get radicalRootsSubtitle =>
      '指定された数字の平方根または立方根を見つけてください。必要に応じて、最も近い整数に四捨五入してください。';

  @override
  String get radicalRootsGoalReached => 'ゴール達成！';

  @override
  String get radicalRootsTimeUp => 'タイムアップ！';

  @override
  String radicalRootsScoreMessage(int score) {
    return '$score個のルートを正しく計算しました！';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return '練習を続けましょう！$score個のルートを計算しました。';
  }

  @override
  String get radicalRootsStart => '計算開始';

  @override
  String get radicalRootsDescription => '60秒以内にできるだけ多く解いてください。';

  @override
  String get radicalRootsBest => 'ベスト';

  @override
  String get radicalRootsSeconds => '60秒';

  @override
  String get romanArithmeticTitle => 'ローマ数字計算';

  @override
  String get romanArithmeticSubtitle => 'ローマ数字を使って足し算と引き算を解いてください。';

  @override
  String get romanArithmeticGoalReached => '百人隊長レベル！';

  @override
  String get romanArithmeticTimeUp => 'タイムアップ！';

  @override
  String romanArithmeticScoreMessage(int score) {
    return 'ローマ数字の問題を$score問解きました！';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return '来た、見た、勝った！$score問解きました。';
  }

  @override
  String get romanArithmeticStart => 'クエスト開始';

  @override
  String get romanArithmeticDescription => '変換して解いてください。制限時間は60秒です。';

  @override
  String get romanArithmeticBest => 'ベスト';

  @override
  String get romanArithmeticSeconds => '60秒';

  @override
  String get wordSearchSubtitle => 'グリッド内の隠された単語をすべて見つけます。ドラッグして選択してください。';

  @override
  String get missingVowelsTitle => '消えた母音';

  @override
  String get missingVowelsSubtitle => '母音が隠された単語を特定します。';

  @override
  String get missingVowelsWin => '母音が復活しました！';

  @override
  String get missingVowelsHowToPlay =>
      '母音（A, E, I, O, U）が隠された単語が表示されます。元の単語を当ててください！';

  @override
  String get wordScrambleTitle => 'ワードスクランブル';

  @override
  String get wordScrambleSubtitle => '文字をタップして単語を並べ替えましょう！';

  @override
  String get wordScrambleWin => '単語が解けました！';

  @override
  String get sudokuTitle => '数独';

  @override
  String get sudokuSubtitle => 'すべての行、列、3x3のブロックに1から9の数字がすべて入るようにグリッドを完成させます。';

  @override
  String get minesweeperTitle => 'マインスイーパー';

  @override
  String get minesweeperSubtitle => '地雷を爆発させずにすべて特定します。';

  @override
  String get minesweeperWin => '勝利！';

  @override
  String get minesweeperMines => '地雷';

  @override
  String get minesweeperStatus => 'ステータス';

  @override
  String get minesweeperWon => '勝利';

  @override
  String get minesweeperBoom => '爆発';

  @override
  String get minesweeperPlaying => 'プレイ中';

  @override
  String get minesweeperReveal => 'オープン';

  @override
  String get minesweeperFlag => 'フラグ';

  @override
  String get game2048Title => '2048';

  @override
  String get game2048Subtitle => '任意の方向にスワイプしてタイルを合体させ、2048タイルを目指しましょう！';

  @override
  String get nonogramTitle => 'ノノグラム';

  @override
  String get nonogramSubtitle => '論理的なヒントを使って隠された画像を表示させます。';

  @override
  String get nonogramWin => '画像が表示されました！';

  @override
  String get magnetsTitle => 'マグネット';

  @override
  String get magnetsSubtitle => '磁極数に基づいてグリッドにマグネットを配置します。';

  @override
  String get magnetsHowToPlay =>
      'ドミノサイズの容器に「+」と「-」のマグネットを入れるか、空のままにします。行と列のヒントは、そのライン内の各磁極の総数を指定します。同じ磁極は直交して隣接させることはできません。';

  @override
  String get magnetsWinTitle => '極性のバランス！';

  @override
  String get magnetsWinMessage => 'すべてのマグネットが完璧に配置されました！';

  @override
  String get lighthousesTitle => '灯台';

  @override
  String get lighthousesSubtitle => '灯台のヒントに基づいて船を配置します。';

  @override
  String get lighthousesHowToPlay =>
      'グリッドに1x1の船を配置します。灯台は、水平および垂直に見える船の総数を示します。船は灯台や他の船に（斜めであっても）接触させることはできません。';

  @override
  String get lighthousesWinTitle => '海の安全！';

  @override
  String get lighthousesWinMessage => 'すべての灯台が船を完璧に誘導しています！';

  @override
  String get dominosaTitle => 'ドミノサ';

  @override
  String get dominosaSubtitle => 'グリッドに隠されたすべてのドミノを見つけます。';

  @override
  String get dominosaHowToPlay =>
      '数字のグリッド上にドミノの完全なセットを配置し、隣接する数字のすべてのペアがちょうど1つのドミノで覆われるようにします。各数字のペアはセットに1回だけ存在します。';

  @override
  String get dominosaWinTitle => 'ドミノマスター！';

  @override
  String get dominosaWinMessage => 'すべてのドミノが見つかり、配置されました！';

  @override
  String get skyscrapersTitle => 'ビルディング';

  @override
  String get skyscrapersSubtitle => 'グリッドを建物の高さで埋めます。';

  @override
  String get skyscrapersHowToPlay =>
      '各行と列に各高さがちょうど1回ずつ含まれるように、グリッドを高さ（1-N）で埋めます。端のヒントは、その方向から見える建物の数を示し、高い建物は低い建物を遮ります。';

  @override
  String get skyscrapersWinTitle => 'スカイライン復元！';

  @override
  String get skyscrapersWinMessage => 'すべての建物が完璧に配置されました！';

  @override
  String get nurikabeTitle => 'ぬりかべ';

  @override
  String get nurikabeSubtitle => 'つながった海と離れた島を作ります。';

  @override
  String get nurikabeHowToPlay =>
      'セルを塗りつぶして、1つのつながった「海」を作ります（2x2のブロックは不可）。塗りつぶされていないセルは「島」を形成し、各島にはその総面積を表す数字がちょうど1つ含まれます。';

  @override
  String get nurikabeWinTitle => '海の流れ！';

  @override
  String get nurikabeWinMessage => '島が分離され、海がつながりました！';

  @override
  String get fillominoTitle => 'フィルオミノ';

  @override
  String get fillominoSubtitle => 'グリッドを指定されたサイズのポリオミノに分割します。';

  @override
  String get fillominoHowToPlay =>
      'グリッドをポリオミノに分割し、サイズNの各ポリオミノのすべてのセルに数字Nが含まれるようにします。同じサイズのポリオミノは直交して隣接させることはできません。';

  @override
  String get fillominoWinTitle => 'グリッド分割！';

  @override
  String get fillominoWinMessage => 'ロジックで完璧にタイル状に並べられました！';

  @override
  String get hitoriTitle => 'ひとりにしてくれ';

  @override
  String get hitoriSubtitle => '各行と列の重複する数字を塗りつぶします。';

  @override
  String get hitoriHowToPlay =>
      'どの行や列にも同じ数字が2回以上現れないようにセルを塗りつぶします。塗りつぶされたセルは（直交して）隣接できず、塗りつぶされていないすべてのセルは1つのつながったグループを形成する必要があります。';

  @override
  String get hitoriWinTitle => 'ひとりにしてくれマスター！';

  @override
  String get hitoriWinMessage => 'すべてを正常に解決しました！';

  @override
  String get pathFinderTitle => 'パスファインダー';

  @override
  String get pathFinderSubtitle => 'SからEまでの隠された道を見つけます。';

  @override
  String get pathFinderWin => 'パスをマスターしました！';

  @override
  String get howToPlay => '遊び方';

  @override
  String get gotIt => '了解';

  @override
  String get akariTitle => 'アカリ';

  @override
  String get akariSubtitle => 'すべての白いセルを照らします';

  @override
  String get akariHowToPlay =>
      '白いセルに電球を置いて、グリッド全体を照らします。電球は壁に当たるまで、その行と列を照らします。電球同士が照らし合うことはできません。数字の書かれた壁は、隣接するセル（上下左右）に置く必要がある電球の数を表しています。';

  @override
  String get akariWinTitle => '点灯！';

  @override
  String get akariWinMessage => 'すべてが完璧に照らされました。';

  @override
  String get arithmeticChainTitle => '計算チェーン';

  @override
  String get arithmeticChainSubtitle => '暗算で合計を計算します';

  @override
  String get arithmeticChainWinTitle => 'レベルアップ！';

  @override
  String get arithmeticChainWinMessage => 'あなたの暗算能力は鋭いです！';

  @override
  String get arithmeticChainLoseTitle => 'もう一度';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return '正解は $answer でした。';
  }

  @override
  String get arithmeticChainStart => 'スタート';

  @override
  String get arithmeticChainNext => '次へ';

  @override
  String get attentionalBlinkTitle => '注意のまばたき';

  @override
  String get attentionalBlinkSubtitleWatch => '数字に注目してください';

  @override
  String get attentionalBlinkSubtitleInput => '見えた2つの数字を入力してください';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return '$score個のターゲットをスコアしました！';
  }

  @override
  String get balanceScaleTitle => '天秤ばかり';

  @override
  String get balanceScaleSubtitle => '天秤を頼りに最後のアイテムの重さを推測します。';

  @override
  String get balanceScaleWinTitle => '均衡！';

  @override
  String get balanceScaleWinMessage => '重さを正しく推測できました！';

  @override
  String get balanceScaleLoseTitle => '不均衡';

  @override
  String get balanceScaleLoseMessage => '正しいバランスを見つけるためにもう一度挑戦してください。';

  @override
  String get balanceScaleBack => '戻る';

  @override
  String get balanceScaleSubmit => '送信';

  @override
  String get binaryPuzzleTitle => 'バイナリパズル';

  @override
  String get binaryPuzzleSubtitle =>
      '0と1で埋めます。同じ数字が隣り合うのは最大2つまでです。各行と列に0と1が同じ数だけ入ります。';

  @override
  String get binaryPuzzleWinTitle => 'よくできました';

  @override
  String get binaryPuzzleWinMessage => '完璧な論理でバイナリパズルを解きました！';

  @override
  String get blockEscapeTitle => 'ブロックエスケープ';

  @override
  String get blockEscapeSubtitle => 'ブロックをスライドさせて、メインブロックが出口にたどり着けるように道を空けます。';

  @override
  String get blockEscapeWinTitle => '脱出！';

  @override
  String get blockEscapeWinMessage => 'メインブロックの道を空けることに成功しました！';

  @override
  String get boxCompletionTitle => '立方体展開図';

  @override
  String get boxCompletionSubtitle => 'どの立方体が形成されますか？';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return '$totalTrials回中$score回正解しました！';
  }

  @override
  String get boxCompletionOptions => 'オプション';

  @override
  String get bridgesTitle => '橋';

  @override
  String get bridgesSubtitle => '島を橋でつなぎます。各島には特定の数の橋が必要です。橋は交差できません。';

  @override
  String get bridgesWinTitle => '接続完了！';

  @override
  String get bridgesWinMessage => 'すべての島をつなぐことに成功しました！';

  @override
  String get calculationSprintTitle => '計算スプリント';

  @override
  String get calculationSprintSubtitle => '60秒以内にできるだけ多くの式を解きます。';

  @override
  String get calculationSprintGoalReached => '目標達成！';

  @override
  String get calculationSprintTimeUp => 'タイムアップ';

  @override
  String calculationSprintScoreMessage(int score) {
    return '素晴らしい計算速度です！$scoreポイント獲得しました。';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return '$scoreポイントでした。自己ベスト更新を目指しましょう！';
  }

  @override
  String get calculationSprintBest => 'ベスト';

  @override
  String get calculationSprintSeconds => '60秒';

  @override
  String get calculationSprintDescription => '式を素早く解いてください。\n間違えると3秒減点されます！';

  @override
  String get calculationSprintStart => 'スプリント開始';

  @override
  String get categoryFluencyTitle => 'カテゴリ流暢性';

  @override
  String get categoryFluencySubtitle => 'カテゴリに属するアイテムを入力してください';

  @override
  String get categoryFluencyExpert => '流暢性エキスパート！';

  @override
  String get categoryFluencyTimeUp => 'タイムアップ！';

  @override
  String get categoryFluencyWinMessage => '豊富な語彙力をお持ちですね！';

  @override
  String categoryFluencyFoundMessage(int count) {
    return '$count個の単語を見つけました。';
  }

  @override
  String get categoryFluencyCategoryLabel => 'カテゴリ：';

  @override
  String get categoryFluencyEnterItem => 'アイテムを入力...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target 単語';
  }

  @override
  String get changeBlindnessTitle => '変化の見落とし';

  @override
  String get changeBlindnessSubtitle => '変化している箇所を見つけてください';

  @override
  String changeBlindnessScore(int score) {
    return 'スコア: $score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return '$score箇所の変化を見つけました！';
  }

  @override
  String get choiceRtTitle => '選択反応時間';

  @override
  String get choiceRtSubtitle => 'アクティブな四角をできるだけ早くタップしてください';

  @override
  String choiceRtAvgMessage(String avg) {
    return '平均反応時間: ${avg}ms';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return '残り時間: $time秒';
  }

  @override
  String choiceRtTaps(int count) {
    return 'タップ数: $count';
  }

  @override
  String get colorFloodTitle => 'カラーフラッド';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return '手数: $moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => 'フラッド成功！';

  @override
  String get colorFloodDryLand => '失敗...';

  @override
  String get colorFloodWinMessage => 'グリッド全体を色で埋め尽くしました！';

  @override
  String get colorFloodLoseMessage => '手数がなくなりました。もう一度挑戦してください！';

  @override
  String get colorMatchTitle => 'カラーマッチ';

  @override
  String get colorMatchSubtitle => 'スライダーを調整して、ターゲットの色にできるだけ近づけます。';

  @override
  String get colorMatchTarget => 'ターゲット';

  @override
  String get colorMatchYours => 'あなたの色';

  @override
  String get colorMatchCheck => 'チェック';

  @override
  String get colorMatchResult => '結果';

  @override
  String colorMatchAccuracy(String accuracy) {
    return '精度: $accuracy%';
  }

  @override
  String get corsiBlocksTitle => 'コルシブロック';

  @override
  String get corsiBlocksSubtitle => 'ブロックが光る順番を覚え、同じ順番でタップしてください。';

  @override
  String get corsiBlocksWinTitle => '空間マスター！';

  @override
  String get corsiBlocksLoseTitle => 'スペースロスト';

  @override
  String corsiBlocksMessage(int score, int span) {
    return '$score個のシーケンスを覚えました！空間記憶スパンは$spanに達しました。';
  }

  @override
  String get corsiBlocksWatch => 'パターンを覚える';

  @override
  String get corsiBlocksRepeat => 'パターンを繰り返す';

  @override
  String get corsiBlocksExcellent => '素晴らしい！';

  @override
  String get corsiBlocksSpan => 'スパン';

  @override
  String get crownTitle => 'クラウン';

  @override
  String get crownSubtitle =>
      '各行、列、色の領域にクラウンを1つずつ配置します。クラウンは縦横斜めに隣接させることはできません。';

  @override
  String get crownCrowned => '完了！';

  @override
  String get crownSuccess => '完璧な論理ですべてのクラウンを配置しました。';

  @override
  String get cryptogramTitle => 'クリプトグラム';

  @override
  String get cryptogramSubtitle =>
      '文字を割り当てて秘密のメッセージを解読しましょう！各暗号化された文字は実際の文字を表しています。';

  @override
  String get cryptogramBroken => '解読成功！';

  @override
  String get cryptogramEncrypted => '暗号化済み';

  @override
  String get cryptogramSuccess => 'メッセージを完璧に解読しました。';

  @override
  String get cryptogramTryAgain => 'もう一度解読に挑戦してください。';

  @override
  String get digitSpanReverseTitle => '逆唱スパン';

  @override
  String get digitSpanReverseSubtitleMemorize => '数字を覚える';

  @override
  String get digitSpanReverseSubtitleEnter => '数字を逆の順番で入力してください';

  @override
  String get digitSpanReverseWinTitle => 'レベルアップ！';

  @override
  String get digitSpanReverseWinMessage => '素晴らしいワーキングメモリです！';

  @override
  String get digitSpanReverseLoseTitle => 'もう一度';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return '正しい逆順は $sequence でした。';
  }

  @override
  String get dividedAttentionTitle => '分割注意';

  @override
  String get dividedAttentionSubtitle => '星 ⭐ は左をタップ | 赤 🔴 は右をタップ';

  @override
  String get dividedAttentionGameOverTitle => '集中力切れ';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return 'マルチタスクは難しいですね！スコアは$scoreでした。';
  }

  @override
  String dividedAttentionScore(int score) {
    return 'スコア: $score';
  }

  @override
  String get doubleNBackTitle => '二重 N-Back';

  @override
  String doubleNBackSubtitle(int n) {
    return '$nステップ前の刺激と一致させます';
  }

  @override
  String get doubleNBackGameOverTitle => 'ゲームオーバー';

  @override
  String doubleNBackGameOverMessage(int score) {
    return '二重 N-Back で$scoreポイント獲得しました！';
  }

  @override
  String doubleNBackScore(int score) {
    return 'スコア: $score';
  }

  @override
  String get doubleNBackPositionMatch => '位置一致';

  @override
  String get doubleNBackLetterMatch => '文字一致';

  @override
  String get faceNameAssociationTitle => '顔と名前の関連付け';

  @override
  String get faceNameAssociationSubtitleStudy => '各顔の名前を覚えます';

  @override
  String get faceNameAssociationSubtitleTest => 'この人は誰？';

  @override
  String get faceNameAssociationPerfect => 'パーフェクト！';

  @override
  String get faceNameAssociationGameOver => 'ゲームオーバー';

  @override
  String get faceNameAssociationWinMessage => '顔と名前を覚える素晴らしい記憶力です！';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return '$total問中$correct問正解しました。';
  }

  @override
  String get faceNameAssociationStartTest => 'テスト開始';

  @override
  String get flankerTestWinTitle => 'レーザーフォーカス！';

  @override
  String get flankerTestLoseTitle => '注意散漫';

  @override
  String flankerTestScoreMessage(int score) {
    return '$score問正解しました！';
  }

  @override
  String get flankerTestTitle => 'フランカーテスト';

  @override
  String get flankerTestSubtitle => '両端の矢印は無視して、中央の矢印の方向を指してください。';

  @override
  String get flankerTestLeft => '左';

  @override
  String get flankerTestRight => '右';

  @override
  String get fractionMatchTitle => '分数マッチ';

  @override
  String get fractionMatchSubtitle => '図形に対応する分数を選んでください';

  @override
  String get fractionMatchLoseTitle => '不一致';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return '正解は $correctAnswer でした。';
  }

  @override
  String get goNoGoTitle => 'ゴー/ノーゴー';

  @override
  String get goNoGoSubtitle => '緑ならタップ、赤なら無視！';

  @override
  String get goNoGoLoseTitle => '反応停止';

  @override
  String get goNoGoLoseMessage => '抑制制御能力が試されています！';

  @override
  String get goNoGoTapAnywhere => 'どこでもタップしてスタート';

  @override
  String get groceryListTitle => '買い物リスト';

  @override
  String get groceryListSubtitleMemorize => 'アイテムとカテゴリを覚えます';

  @override
  String get groceryListSubtitleTest => 'このアイテムはどのカテゴリでしたか？';

  @override
  String get groceryListWinTitle => '買い物名人！';

  @override
  String get groceryListLoseTitle => '忘れ物ですか？';

  @override
  String groceryListScoreMessage(int score) {
    return '買い物リストで$scoreポイント獲得しました！';
  }

  @override
  String get groceryListReady => '準備完了';

  @override
  String get groceryListWhereBelong => 'これはどこに属しますか？';

  @override
  String get hueSortTitle => '色相ソート';

  @override
  String get hueSortSubtitle => 'タイルを入れ替えて、角の色を滑らかをつなげます。ドットは固定タイルです。';

  @override
  String get hueSortWinTitle => '完璧なグラデーション！';

  @override
  String get hueSortWinMessage => 'カラースペクトルを完璧に並べ替えました！';

  @override
  String hueSortWrongTiles(int count) {
    return '間違った位置にあるタイル: $count';
  }

  @override
  String get kenkenTitle => '賢賢';

  @override
  String get kenkenWinTitle => '天才！';

  @override
  String get kenkenLoseTitle => 'ゲームオーバー';

  @override
  String get kenkenWinMessage => '賢賢パズルを解きました！';

  @override
  String get kenkenLoseMessage => '行・列とケージのルールを確認してください。';

  @override
  String kenkenSubtitle(int size) {
    return '行・列で重複しないように1-$sizeを埋めます';
  }

  @override
  String get letterCancellationTitle => '文字抹消';

  @override
  String get letterCancellationTitleFull => '文字抹消テスト';

  @override
  String letterCancellationScoreMessage(int score) {
    return '$score個の文字を見つけました！';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return '「$target」の文字をすべて見つけてください';
  }

  @override
  String get letterCancellationFound => '発見';

  @override
  String get letterCancellationTime => '時間';

  @override
  String get lightsOutTitle => 'ライツアウト';

  @override
  String get lightsOutSubtitle =>
      'タイルをタップすると、そのタイルと隣接するタイルが反転します。すべてのライトを消せばクリアです。';

  @override
  String get lightsOutWinTitle => 'パズルクリア！';

  @override
  String get lightsOutWinMessage => 'すべてのライトを消すことに成功しました！';

  @override
  String get symmetryTitle => '対称性';

  @override
  String get symmetrySubtitle => '左側のパターンを右側の空のグリッドに鏡合わせに再現してください。';

  @override
  String get semanticLinkTitle => 'セマンティックリンク';

  @override
  String get semanticLinkSubtitle => '3つの言葉すべてに関連する単語を見つけてください';

  @override
  String get reflexTapTitle => 'リフレックスタップ';

  @override
  String get visualStatisticalLearningTitle => '視覚的統計学習';

  @override
  String get orbitTapTitle => 'オービットタップ';

  @override
  String get orbitTapSubtitle => 'ボールがゲートに重なったときにタップ';

  @override
  String get schulteTableTitle => 'シュルテ表';

  @override
  String get multipleObjectTrackingTitle => '物体追跡';

  @override
  String get multipleObjectTrackingSubtitle =>
      'ハイライトされた物体を注目してください。動き回るそれらを追跡し、最後に選択してください。';

  @override
  String get sdmtTitle => 'SDMTテスト';

  @override
  String get sdmtSubtitle => '上の対応表を使って、表示された記号に対応する数字を見つけてください。';

  @override
  String get memoryMatrixTitle => 'メモリーマトリックス';

  @override
  String get memoryMatrixSubtitle => 'パターンを覚えてタイルをタップしてください。';

  @override
  String get mentalAbacusTitle => '珠算';

  @override
  String get mentalAbacusSubtitle => 'そろばんを使って解いてください';

  @override
  String get spellingSprintTitle => 'スペリングスプリント';

  @override
  String get spellingSprintSubtitle => '時間内にできるだけ多くの単語を綴ってください。';

  @override
  String get stopSignalTitle => 'ストップシグナル';

  @override
  String get stopSignalSubtitle => '矢印の方向をタップしますが、矢印が赤くなったらすぐに止めてください。';

  @override
  String get staircaseMemoryTitle => '階段記憶';

  @override
  String get vigilanceTaskTitle => '覚醒維持タスク';

  @override
  String get vigilanceTaskSubtitle => '針が位置をスキップしたときにボタンをタップしてください';

  @override
  String get logicalSyllogismsTitle => '論理三段論法';

  @override
  String get logicalSyllogismsSubtitle => '結論は論理的に有効ですか？';

  @override
  String get mathPathTitle => 'マスパス';

  @override
  String get mathPathSubtitle => '合計がターゲットの数字と一致する道を見つけてください。';

  @override
  String get sternbergTaskTitle => 'スターンバーグタスク';

  @override
  String get sternbergTaskMemorize => '文字を覚える';

  @override
  String get sternbergTaskWasLetterSet => 'この文字はセットに含まれていましたか？';

  @override
  String sternbergTaskScore(int score) {
    return 'スターンバーグタスクで$scoreポイント獲得しました！';
  }

  @override
  String get verbalAnalogiesTitle => '言語類推';

  @override
  String get verbalAnalogiesSubtitle => '関係性を完成させてください';

  @override
  String get typingSpeedTitle => 'タイピング速度';

  @override
  String get typingSpeedSubtitle => '表示されたフレーズをできるだけ早く正確に入力してください！';

  @override
  String get wordLadderTitle => 'ワードラダー';

  @override
  String get wordLadderSubtitle => '文字を1つずつ変えて単語をつなげてください。';

  @override
  String get tangleFixTitle => 'タングルフィックス';

  @override
  String get tangleFixSubtitle => '線が交差しないように整理してください';

  @override
  String get oddRotationTitle => '異常回転';

  @override
  String get oddRotationSubtitle => '1つだけ鏡合わせのものがあります。見つけられますか？';

  @override
  String get towerOfLondonTitle => 'ロンドンの塔';

  @override
  String get towerOfLondonSubtitle => 'ターゲットの構成と一致させてください';

  @override
  String get symbolicFlankerTitle => '記号フランカー';

  @override
  String get symbolicFlankerSubtitle => '中央の記号に集中してください';

  @override
  String get stroopTestTitle => 'ストループテスト';

  @override
  String get stroopTestSubtitle => '表示された単語の「文字の色」を答えてください。単語の意味は無視してください！';

  @override
  String get wisconsinCardSortingTitle => 'ウィスコンシンカード分類';

  @override
  String get wisconsinCardSortingSubtitle => 'カードを上の4つのいずれかと一致させてください';

  @override
  String get nBackTitle => 'N-Backテスト';

  @override
  String get nBackSubtitle => '現在の文字が2つ前の文字と同じなら「一致」をタップしてください。';

  @override
  String get rhythmMasterTitle => 'リズムマスター';

  @override
  String get rhythmMasterSubtitle => 'パルスに合わせてタップしてください';

  @override
  String get pixelMimicTitle => 'ピクセルミミック';

  @override
  String get targetNumberTitle => 'ターゲット24';

  @override
  String targetNumberSubtitle(int target) {
    return '4つの数字すべてを使って$targetにしてください';
  }

  @override
  String get mirrorTracingTitle => 'ミラートレーシング';

  @override
  String get mirrorTracingSubtitle => '星をなぞってください！操作は反転しています。';

  @override
  String get wordSurgeTitle => 'ワードサージ';

  @override
  String get wordSurgeSubtitle => '類義語と対義語';

  @override
  String get perspectiveTakingTitle => '視点取得';

  @override
  String get perspectiveTakingTopDownView => '上からの視点';

  @override
  String get perspectiveTakingChoosePerspective => '視点を選択';

  @override
  String get perspectiveTakingCongrats => '空間的な関係を把握する鋭い目をお持ちですね。';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return '$targetDirNameからの視界はどれですか？';
  }

  @override
  String get paperFoldingTitle => 'ペーパーフォールディング';

  @override
  String get paperFoldingSubtitle => '広げたとき、どのような形になりますか？';

  @override
  String get waterSortTitle => 'ウォーターソート';

  @override
  String get waterSortSubtitle => '各チューブに1色だけ入るように色を仕分けてください。';

  @override
  String get numericalEstimationTitle => '数値推定';

  @override
  String get numericalEstimationSubtitle => '最も近い答えを素早く選んでください！';

  @override
  String get lockPatternTitle => 'ロックパターン';

  @override
  String get lockPatternSubtitle =>
      '秘密のパターンを見つけてください。推測するたびに位置とドットに関するヒントが表示されます。';

  @override
  String get primeHunterTitle => '素数ハンター';

  @override
  String get primeHunterSubtitle => '素数なら左にスワイプ | 合成数なら右にスワイプ';

  @override
  String get tracePathTitle => 'トレースパス';

  @override
  String get tracePathSubtitle => 'ターゲットの道をできるだけ正確になぞってください';

  @override
  String get ruleSwitcherTitle => 'ルールスイッチャー';

  @override
  String get ruleSwitcherSubtitle => '現在のルールを適用してください';

  @override
  String get choiceReactionTimeTitle => '選択反応時間';

  @override
  String get pathRecallTitle => 'パスリコール';

  @override
  String get switchTaskTitle => 'スイッチタスク';

  @override
  String get switchTaskSubtitle => 'ルールに注意してください！形を合わせるか、色を合わせるかが切り替わります。';

  @override
  String get mentalRotationTitle => '心的回転';

  @override
  String get mentalRotationSubtitle => 'これらの図形は回転させただけで同じものですか？';

  @override
  String get missingOperatorTitle => '演算子ミックス';

  @override
  String get missingOperatorSubtitle => '空欄を埋めて式を完成させてください';

  @override
  String get wordMastermindTitle => 'ワードマスターマインド';

  @override
  String get wordMastermindSubtitle =>
      '4文字のコードを解読してください！Bは位置も文字も正解、Cは文字は合っていますが位置が違います。';

  @override
  String get simonSequenceTitle => 'サイモンシーケンス';

  @override
  String get symbolLogicTitle => '記号ロジック';

  @override
  String get symbolLogicSubtitle => '図形の式を解いて、各記号の値を求めてください。最後の式の答えは何ですか？';

  @override
  String get silhouetteMatchTitle => 'シルエットマッチ';

  @override
  String get silhouetteMatchSubtitle => 'このオブジェクトに一致するシルエットはどれですか？';

  @override
  String get operationSpanTitle => 'オペレーションスパン';

  @override
  String get operationSpanMathPhase => '式は正しいですか？';

  @override
  String get operationSpanLetterPhase => '文字を覚える';

  @override
  String get operationSpanRecallPhase => '順番通りに文字を思い出してください';

  @override
  String get operationSpanRoundComplete => 'ラウンド終了！';

  @override
  String operationSpanScore(int score) {
    return 'オペレーションスパンで$scoreポイント獲得しました！';
  }

  @override
  String get slidePuzzleTitle => 'スライドパズル';

  @override
  String get slidePuzzleNewGame => 'ニューゲーム';

  @override
  String get slidePuzzleInstructions => 'タイルを空いたスペースにスライドさせて、数字順に並べ替えてください。';

  @override
  String get slidePuzzleTileSlider => 'タイルスライダー';

  @override
  String get slidePuzzleCongrats => 'すべてのタイルを正しく並べ替えました。';

  @override
  String get visualSearchTitle => 'ビジュアルサーチ';

  @override
  String get visualSearchSubtitle => 'グリッドの中から1つだけ違う記号を見つけてください';

  @override
  String get trailMakingTitle => 'トレイルメイキング';

  @override
  String get trailMakingSubtitle => '数字を順番に（1 -> 2 -> 3...）できるだけ早くつなげてください。';

  @override
  String get matrixReasoningTitle => '行列推理';

  @override
  String get matrixReasoningSubtitle => '3x3グリッドのパターンを完成させてください';

  @override
  String get tentsAndTreesTitle => 'テントと木';

  @override
  String get tentsAndTreesSubtitle =>
      '木の隣にテントを配置します。数字は各行・列にあるテントの数を表しています。テント同士が隣り合うことはできません。';

  @override
  String get quickMathTitle => 'クイックマス';

  @override
  String get magicSquaresTitle => '魔法陣';

  @override
  String magicSquaresSubtitle(int targetSum) {
    return 'すべての行、列、対角線の合計が$targetSumになるようにしてください';
  }

  @override
  String get objectShuffleTitle => 'オブジェクトシャッフル';

  @override
  String get pipesTitle => 'パイプ';

  @override
  String get pipesSubtitle => '同じ色のドットをパイプでつなぎます。';

  @override
  String get oddOneOutTitle => '仲間外れ探し';

  @override
  String get oddOneOutSubtitle => '色の違うタイルを見つけてください。';

  @override
  String get einsteinRiddleTitle => 'アインシュタインの謎解き';

  @override
  String get einsteinRiddleSubtitle => 'ヒントを頼りに各家の属性を推論してください。';

  @override
  String get einsteinRiddleHowToPlay =>
      '各家には固有の属性（色、国籍、ペットなど）があります。ヒントを使ってグリッドを埋め、完全な正解を導き出してください。';

  @override
  String get einsteinRiddleColor => '色';

  @override
  String get einsteinRiddleNationality => '国籍';

  @override
  String get einsteinRiddleDrink => '飲み物';

  @override
  String get einsteinRiddlePet => 'ペット';

  @override
  String get einsteinRiddleSmoke => 'タバコ';

  @override
  String get einsteinRiddleHouse => '家';

  @override
  String get mirrorImageTitle => '鏡像';

  @override
  String get mirrorImageSubtitle => '正しい鏡像を特定してください。';

  @override
  String get mirrorImageHowToPlay => '図形を見て、選択肢の中から正しい鏡像を選んでください。';

  @override
  String get mentalMappingTitle => 'メンタルマッピング';

  @override
  String get mentalMappingSubtitle => '指示に従って目的地を見つけてください。';

  @override
  String get mentalMappingHowToPlay =>
      '方向（北、南、東、西）のシーケンスが表示されます。グリッドの中央から頭の中でこれらに従い、最終的な目的地を選択してください。';

  @override
  String get memoryPalaceTitle => '記憶の宮殿';

  @override
  String get memoryPalaceSubtitle => 'どの単語がどの場所にあったか覚えてください。';

  @override
  String get memoryPalaceHowToPlay =>
      'グリッド上の異なる場所に単語が表示されます。その位置を覚えてください。その後、単語を元の場所に戻すように求められます。';

  @override
  String get countingSheepTitle => '羊数え';

  @override
  String get countingSheepSubtitle => '羊は何匹いましたか？';

  @override
  String get countingSheepHowToPlay =>
      '羊が画面を素早く駆け抜けます。通り過ぎる羊を数え、最後に合計を入力してください。';

  @override
  String get faceTraitAssociationTitle => '顔と特徴';

  @override
  String get faceTraitAssociationSubtitle => '各顔の特徴を覚えます';

  @override
  String get faceTraitAssociationHowToPlay =>
      '数人の顔が表示され、それぞれに名前、職業、趣味が設定されています。これらを覚えてください。後で、各顔の特定の特徴を思い出すように求められます。';

  @override
  String get mentalCalendarTitle => 'メンタルカレンダー';

  @override
  String get mentalCalendarSubtitle => '曜日を計算します';

  @override
  String get mentalCalendarHowToPlay =>
      'ランダムな日付が表示されます。暗算（またはドゥームズデー・アルゴリズム）を使用して、その日が何曜日かを特定してください。';

  @override
  String get vocabularyBuilderTitle => '語彙ビルダー';

  @override
  String get vocabularyBuilderSubtitle => '制限時間内に類義語や対義語を一致させます。';

  @override
  String get vocabularyBuilderHowToPlay =>
      'ターゲットの単語と関係性（類義語または対義語）が表示されます。選択肢の中からその関係に一致する正しい単語を選んでください。急いでください、時間は刻々と過ぎています！';

  @override
  String get correct => '正解';

  @override
  String get incorrect => '不正解';

  @override
  String get grammarPoliceTitle => 'グラマーポリス';

  @override
  String get grammarPoliceSubtitle => '文章が文法的に正しいか、誤りがあるかを確認します。';

  @override
  String get grammarPoliceHowToPlay =>
      '画面の中央に文章が表示されます。それが文法的に正しいか、誤りがあるかを判断してください。問題なければ「正解」を、間違いを見つけたら「不正解」をタップしてください。すべてのライフを失わないように！';

  @override
  String get reverseStroopTitle => '逆ストループ';

  @override
  String get reverseStroopSubtitle => '焦点が切り替わるストループテストのバリエーションです。';

  @override
  String get reverseStroopHowToPlay =>
      '指示に注意してください！「文字」と表示されたら単語の意味を一致させます。「色」と表示されたらインクの色を一致させます。集中力を試すため、ルールは頻繁に切り替わります。';

  @override
  String get game2048Instruction => '任意の方向にスワイプして合体';

  @override
  String get fibonacciMergeTitle => 'フィボナッチ・マージ';

  @override
  String get fibonacciMergeSubtitle =>
      '連続するフィボナッチ数（1, 1, 2, 3, 5, 8, 13...）を合体させます。';

  @override
  String get sequenceSleuthTitle => '数列の探偵';

  @override
  String get sequenceSleuthSubtitle => '数学的な数列の中の欠けている数字を見つけてください。';

  @override
  String get divisibilityDashTitle => '割り算ダッシュ';

  @override
  String get divisibilityDashSubtitle => '表示された数字の1桁の約数（2-9）をすべてタップしてください。';

  @override
  String get percentagePeakTitle => 'パーセンテージ・ピーク';

  @override
  String get percentagePeakSubtitle => '暗算でパーセント計算を素早く解いてください。';

  @override
  String get vennNumbersTitle => 'ベン図の数字';

  @override
  String get vennNumbersSubtitle => '数字をベン図の正しい領域に分類してください。';

  @override
  String get commonDenominatorTitle => '共通分母';

  @override
  String get commonDenominatorSubtitle => '最大公約数または最小公倍数を見つけてください。';

  @override
  String get angleFinderTitle => '角度ハンター';

  @override
  String get angleFinderSubtitle => '幾何学問題の欠けている角度を計算してください。';

  @override
  String get sumSnakeTitle => '合計スネーク';

  @override
  String get sumSnakeSubtitle => '隣接する数字をつなげて、ターゲットの合計値に到達させてください。';

  @override
  String get baseShiftTitle => 'ベースシフト・ブリッツ';

  @override
  String get baseShiftSubtitle => '10進数で解く';

  @override
  String get baseShiftDescription => '式を解き、答えを10進数（Base 10）で入力してください。';

  @override
  String get baseShiftEquation => '式';

  @override
  String get baseShiftHint => '10進数の結果を入力...';

  @override
  String get baseShiftCorrect => '正解！';

  @override
  String get baseShiftIncorrect => '不正解！';

  @override
  String get baseShiftSubmit => '送信';

  @override
  String get baseShiftQuickGuide => 'クイックガイド：';

  @override
  String get baseShiftBinary => '2進数 (bin): 基数 2 (0, 1)';

  @override
  String get baseShiftHex => '16進数 (0x): 基数 16 (0-9, A-F)';

  @override
  String get baseShiftDecimal => '10進数 (dec): 基数 10 (0-9)';

  @override
  String get baseShiftWinTitle => '数学の魔術師！';

  @override
  String get baseShiftWinMessage => '5つのベースシフト問題を正解しました！';

  @override
  String get blockCount3DTitle => '3Dブロック・カウント';

  @override
  String get blockCount3DSubtitle => 'ドラッグして回転 • 隠れたブロックを数える';

  @override
  String get blockCount3DHowMany => 'ブロックはいくつ？';

  @override
  String get blockCount3DSubmitGuess => '回答を送信';

  @override
  String get blockCount3DNotQuite => '惜しい！回転させて、もう一度数えてみましょう。';

  @override
  String get blockCount3DExcellent => '素晴らしい！';

  @override
  String blockCount3DWinMessage(int count) {
    return '$count個のブロックをすべて正しく特定しました！';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '1. 3Dビューポート上で指をドラッグして、ブロックの山を回転させます。\n\n2. 山の中にあるすべてのブロックを数えます。\n\n3. 覚えておいてください：空中に浮いているブロックの下には、必ず支えとなるブロックがあります（隠れたブロック！）。\n\n4. 入力欄に答えを入力し、「回答を送信」をタップして確認してください。';

  @override
  String get alphabetSudokuTitle => 'アルファベット数独';

  @override
  String get alphabetSudokuSubtitle => 'すべての行、列、ブロックにA-Iの文字が入るようにグリッドを埋めます。';

  @override
  String get alphabetSudokuWinTitle => '数独クリア！';

  @override
  String get alphabetSudokuWinMessage => 'お見事！アルファベットをマスターしました。';

  @override
  String get classicMazeTitle => 'クラシック迷路';

  @override
  String get classicMazeSubtitle => '探索して解決 • 毎回新しい迷路';

  @override
  String get classicMazeWinTitle => '迷路クリア';

  @override
  String classicMazeWinMessage(int count) {
    return '信じられないナビゲーションです！$count手で迷路を解きました。';
  }

  @override
  String get classicMazeMoves => '手数： ';

  @override
  String get classicMazeHowToPlayDescription =>
      '1. 光る黄色い玉（プレイヤー）を右下の緑のポータル（出口）まで導いてください。\n\n2. 迷路のどこかをスワイプするか、キーボードの矢印キー、または下のボタンで移動します。\n\n3. 紫色の跡は探索した道を示します。戻ると跡が消えます！\n\n4. 上のアクションバーで難易度を切り替えて、より大きな迷路に挑戦しましょう。';

  @override
  String get conjunctionSearchTitle => '結合探索';

  @override
  String get conjunctionSearchSubtitle => '注意力の集中と特徴の結合';

  @override
  String get conjunctionSearchWinTitle => '勝利';

  @override
  String get conjunctionSearchWinMessage => '完璧な注意力ですべてのターゲットを見つけました！';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      '指示に特定の図形と色の組み合わせが表示されます。密集したグリッドの中からできるだけ早くそれを見つけてタップしてください。おとり図形は色か形のどちらかが共通しているので、よく見てください！';

  @override
  String get conjunctionSearchRound => 'ラウンド： ';

  @override
  String get conjunctionSearchScore => 'スコア： ';

  @override
  String get conjunctionSearchFind => '探すもの： ';

  @override
  String get shapeCircle => '円';

  @override
  String get shapeSquare => '正方形';

  @override
  String get shapeTriangle => '三角形';

  @override
  String get shapeStar => '星';

  @override
  String get shapeRectangle => '長方形';

  @override
  String get shapeEllipse => '楕円';

  @override
  String get shapeTrapezoid => '台形';

  @override
  String get colorRedLabel => '赤';

  @override
  String get colorBlueLabel => '青';

  @override
  String get colorGreenLabel => '緑';

  @override
  String get colorAmberLabel => 'アンバー';

  @override
  String get cubeNetFoldTitle => '立方体展開図折り';

  @override
  String get cubeNetFoldSubtitle => '一致する3D立方体を選択';

  @override
  String get cubeNetFoldWinTitle => '正解';

  @override
  String get cubeNetFoldWinMessage => '完璧な3D空間折り畳み論理をお持ちですね！';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '1. 上の開いた2D展開図を見てください。\n\n2. 頭の中で展開図を折り畳んで3Dの立方体を作ります。\n\n3. 下の選択肢から、その折り畳まれた立方体の正しい3Dパースペクティブを選んでください。\n\n4. 注意：展開図で向かい合っている面は3Dでは隣り合わせにならず、隣接する面の順序も一致する必要があります！';

  @override
  String get cubeNetFoldUnfoldedNet => '2D展開図';

  @override
  String get cubeNetFoldWhichMatches => '一致する立方体は？';

  @override
  String get cubeNetFoldIncorrect => '折り畳み論理が間違っています！リセットするか選択し直してください。';

  @override
  String get cubeNetFoldSubmitChoice => '選択を送信';

  @override
  String get cubeNetFoldFailed => '失敗（リセットをタップ）';

  @override
  String get faceTraitAssociationMemorize => '4人全員を覚える';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return '$current人目 / 全$total人';
  }

  @override
  String get faceTraitAssociationWhatOccupation => '彼らの職業は何ですか？';

  @override
  String get faceTraitAssociationWhatHobby => '彼らの趣味は何ですか？';

  @override
  String get faceTraitAssociationWinTitle => '記憶マスター！';

  @override
  String get faceTraitAssociationLoseTitle => 'ゲームオーバー';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return '$total問中$correct問正解しました。';
  }

  @override
  String get topologyTitle => 'TOPOLOGY';

  @override
  String get topologySubtitle =>
      'これらの図形はトポロジー的に同等ですか？（切ったり貼ったりせずに、一方を変形させて他方にできますか？）';

  @override
  String get topologyWinTitle => 'GEOMETRY GENIUS!';

  @override
  String get topologyWinMessage => '10個のトポロジー的なペアを正しく特定しました！';

  @override
  String get topologyScore => 'SCORE: ';

  @override
  String get semanticDistanceTitle => '意味的距離';

  @override
  String get semanticDistanceSubtitle => '単語間の概念的な距離を測定します';

  @override
  String get oxymoronHuntTitle => '矛盾語探し';

  @override
  String get oxymoronHuntSubtitle => 'グリッド内の矛盾する単語をペアにします';

  @override
  String get portmanteauSplitTitle => 'かばん語分解';

  @override
  String get portmanteauSplitSubtitle => 'かばん語の元になった単語を特定します';

  @override
  String get chainReactionTitle => '連鎖反応';

  @override
  String get chainReactionSubtitle => '重なり合う文字を使って単語をつなげます';

  @override
  String get rhymeMasterTitle => '韻踏みマスター';

  @override
  String get rhymeMasterSubtitle => 'ターゲットと韻を踏む単語を特定します';

  @override
  String get definitionDashTitle => '定義ダッシュ';

  @override
  String get definitionDashSubtitle => '正しい単語をその定義と一致させます';

  @override
  String get syllableStackTitle => '音節スタック';

  @override
  String get syllableStackSubtitle => '音節を積み重ねて完全な単語を作ります';

  @override
  String get sentenceUnscrambleTitle => '文章並べ替え';

  @override
  String get sentenceUnscrambleSubtitle => '単語を並べ替えて正しい文章を作ります';

  @override
  String get grammarSortTitle => '文法ソート';

  @override
  String get grammarSortSubtitle => '単語を品詞ごとに分類します';

  @override
  String get vowelReconstructTitle => '母音再構成';

  @override
  String get vowelReconstructSubtitle => '文章の中の欠けている母音を埋めます';

  @override
  String get consonantReconstructTitle => '子音再構成';

  @override
  String get consonantReconstructSubtitle => '文章の中の欠けている子音を埋めます';

  @override
  String get homophoneHuntTitle => '同音異義語探し';

  @override
  String get silentLetterSearchTitle => '黙字検索';

  @override
  String get silentLetterSearchSubtitle => '与えられた単語の中の読まない文字を特定します';

  @override
  String get palindromeBuilderTitle => '回文ビルダー';

  @override
  String get palindromeBuilderSubtitle => '最小限の文字を追加して回文を作ります';

  @override
  String get phoneticGuessTitle => '発音推測';

  @override
  String get phoneticGuessSubtitle => '発音記号から単語を特定します';

  @override
  String get spoonerismSolverTitle => '頭音交換ソルバー';

  @override
  String get spoonerismSolverSubtitle => 'フレーズに対する正しい頭音交換を特定します';

  @override
  String get etymonOddballTitle => '語源の仲間外れ';

  @override
  String get etymonOddballSubtitle => '同じ語源を持たない単語を見つけます';

  @override
  String get etymologyOriginTitle => '語源の起源';

  @override
  String get etymologyOriginSubtitle => '借用語の起源言語を推測します';

  @override
  String get affixFactoryTitle => '接辞工場';

  @override
  String get affixFactorySubtitle => '接頭辞と接尾辞を使って有効な単語を作ります';

  @override
  String get cognateCatchTitle => '同源語キャッチ';

  @override
  String get cognateCatchSubtitle => '真の同源語と「空似言葉」を区別します';

  @override
  String get compoundConnectTitle => '複合語コネクト';

  @override
  String get compoundConnectSubtitle => '2つの単語を組み合わせて複合語を作ります';

  @override
  String get pangramSprintTitle => 'パングラムスプリント';

  @override
  String get pangramSprintSubtitle => 'アルファベットのすべての文字を使って文章を作ります';

  @override
  String get anagramDefinitionTitle => 'アナグラム定義';

  @override
  String get anagramDefinitionSubtitle => '定義に基づいてアナグラムを解きます';

  @override
  String get letterBridgeTitle => '文字の橋';

  @override
  String get letterBridgeSubtitle => '2つの単語をつなぐ欠けている文字を見つけます';

  @override
  String get letterFrequencyScanTitle => '文字頻度スキャン';

  @override
  String get letterFrequencyScanSubtitle => 'テキスト内に特定の文字が何回現れるか数えます';

  @override
  String get oneLetterShiftTitle => '一文字シフト';

  @override
  String get oneLetterShiftSubtitle => '一文字変えて別の単語に変換します';

  @override
  String vocabularyBuilderMessage(String arg0) {
    return 'よくできました！素晴らしい語彙力です。スコア：$arg0';
  }

  @override
  String get symmetryMessage => '手術のような精密さでパターンを完璧に再現しました。';

  @override
  String get temporalOrderMessage => '信じられない！あなたの時間的シーケンス記憶は非常に高精度です。';

  @override
  String get temporalOrderMessage1 => 'シーケンス記憶が正しくありません。練習あるのみです！';

  @override
  String get wordSearchMessage => '鋭い観察力ですべての単語が見つかりました。';

  @override
  String colorMatchMessage(String arg0) {
    return '精度：$arg0%';
  }

  @override
  String semanticLinkMessage(String arg0) {
    return '$arg0ポイント獲得しました！';
  }

  @override
  String reflexTapMessage(String arg0) {
    return '$arg0個のターゲットをタップしました！';
  }

  @override
  String get angleFinderMessage => 'あなたの幾何学的な直感は完璧です！';

  @override
  String angleFinderMessage1(String arg0) {
    return '正解は $arg0° でした';
  }

  @override
  String angleFinderText(String arg0) {
    return '$arg0°';
  }

  @override
  String visualStatisticalLearningMessage(String arg0) {
    return '$arg0個のパターンを正解しました！';
  }

  @override
  String nonogramText(String arg0) {
    return 'エラー：$arg0';
  }

  @override
  String mentalCalendarMessage(String arg0) {
    return '10問中 $arg0 問正解しました！';
  }

  @override
  String orbitTapMessage(String arg0) {
    return '$arg0 回のタップに成功しました！';
  }

  @override
  String schulteTableMessage(String arg0) {
    return 'テーブルを $arg0 で完成させました。\n周辺視野を広げるために練習を続けましょう！';
  }

  @override
  String get schulteTableText => 'テスト開始';

  @override
  String get relationalMemoryMessage => '素晴らしい空間関係記憶の精度です！';

  @override
  String sudokuText(String arg0) {
    return 'エラー：$arg0';
  }

  @override
  String sdmtMessage(String arg0) {
    return '$arg0 個の記号を一致させました！このテストはスキャンスピードと視覚的注意力を測定します。';
  }

  @override
  String get futoshikiMessage => '信じられない！フトシキのラテン方格を解きました。';

  @override
  String letterFrequencyScanMessage(String arg0, String arg1) {
    return '「$arg1」が $arg0 回現れるのを正しく数えました。';
  }

  @override
  String letterFrequencyScanText(String arg0) {
    return '不正解です。正解は $arg0 回でした。';
  }

  @override
  String get memoryMatrixMessage => '素晴らしい！ワーキングメモリが鋭いです。今日の目標達成！';

  @override
  String get memoryMatrixMessage1 => '集中してもう一度挑戦し、メモリスコアを向上させましょう。';

  @override
  String get contextCluesMessage => '並外れています！語彙力と文脈分析力が最高レベルです。';

  @override
  String get contextCluesMessage1 => '間違った単語を選択しました！言語的な文脈推論を鍛えて、もう一度挑戦しましょう。';

  @override
  String oneLetterShiftMessage(String arg0, String arg1) {
    return '正しく $arg0 を $arg1 にシフトしました。';
  }

  @override
  String get mentalAbacusMessage => 'あなたの暗算はトップクラスです。';

  @override
  String fractionMatcherMessage(String arg0) {
    return '表現の一致で $arg0 ポイント獲得しました！';
  }

  @override
  String get spellingSprintMessage => '10単語すべて正しく綴りました！';

  @override
  String spellingSprintMessage1(String arg0) {
    return '$arg0 単語正しく綴りました。';
  }

  @override
  String stopSignalMessage(String arg0) {
    return '$arg0 回の正しい反応を達成しました！このテストは、計画された行動を抑制する能力を測定します。';
  }

  @override
  String grammarPoliceMessage(String arg0) {
    return 'ゲームオーバー！文法の世界の秩序を守りました。スコア：$arg0';
  }

  @override
  String consonantReconstructMessage(String arg0) {
    return '$arg0 ポイントで再構成しました！';
  }

  @override
  String rhymeMasterMessage(String arg0, String arg1) {
    return '$arg1 個中 $arg0 個の韻を見つけました！';
  }

  @override
  String vigilanceTaskMessage(String arg0, String arg1, String arg2) {
    return 'ヒット：$arg0、ミス：$arg1\n誤警報：$arg2';
  }

  @override
  String get silhouetteMatchOrthoMessage => '完璧な正投影アライメントスキルをお持ちですね！';

  @override
  String get silhouetteMatchOrthoText => '了解';

  @override
  String get silhouetteMatchOrthoText1 => '透視投影が正しくありません！リセットして再試行してください。';

  @override
  String fibonacciMergeMessage(String arg0, String arg1) {
    return '$arg0：$arg1';
  }

  @override
  String factorFinderMessage(String arg0) {
    return 'すべての因数を見つけて $arg0 ポイント獲得しました！';
  }

  @override
  String logicalSyllogismsMessage(String arg0) {
    return '$arg0 個の三段論法を正しく解きました！';
  }

  @override
  String get rotatingMazeMessage => '回転迷路のナビゲートに成功しました！';

  @override
  String get rotatingMazeText => '了解';

  @override
  String get rotatingMazeText1 => '🌀 迷路が90°回転しました！グリッドがシフトしました！';

  @override
  String get mathPathMessage => 'ターゲットの合計になる道を見つけました！';

  @override
  String get bridgesMessage => 'すべての島をつなぐことに成功しました！';

  @override
  String compoundConnectMessage(String arg0, String arg1) {
    return '複合語は $arg0$arg1 です。';
  }

  @override
  String get pangramSprintMessage => '26文字すべてを使って文章を作りました。';

  @override
  String get mirrorImageMessage => '鏡像を完璧に特定しました。';

  @override
  String get mirrorImageText => '鏡像';

  @override
  String reverseStroopMessage(String arg0) {
    return '$arg0 ポイント獲得しました！指示をよく見てください。';
  }

  @override
  String get verbalAnalogiesMessage => '関係性に対する鋭い洞察力をお持ちですね。';

  @override
  String corsiBlocksMessage1(String arg0, String arg1) {
    return '$arg1 個のシーケンスを覚えました！空間記憶スパンは $arg0 に達しました。';
  }

  @override
  String wordLadderMessage(String arg0, String arg1, String arg2) {
    return '$arg0 から $arg1 まで $arg2 ステップで接続しました。';
  }

  @override
  String d2AttentionMessage(String arg0) {
    return '素晴らしい選択的スキャンです！最終スコア：$arg0。';
  }

  @override
  String get d2AttentionText => '遊び方';

  @override
  String get d2AttentionText1 => '了解';

  @override
  String get tangleFixMessage => 'すべての線が整理されました。';

  @override
  String get distractorMatrixMessage => '素晴らしい！数学の妨害にもかかわらずパターンを思い出しました！';

  @override
  String get distractorMatrixMessage1 => '妨害に負けてしまいました！ワーキングメモリを鍛え直しましょう。';

  @override
  String sentenceUnscrambleMessage(String arg0) {
    return '$arg0 ポイントで並べ替えました！';
  }

  @override
  String get kakuroMessage => '素晴らしい！すべての合計セグメントを完璧に一致させました。';

  @override
  String symbolicFlankerMessage(String arg0, String arg1) {
    return '$arg1 問中 $arg0 問正解しました！';
  }

  @override
  String stroopTestMessage(String arg0) {
    return '$arg0 問正解しました！単語ではなく、文字の色に集中しましょう。';
  }

  @override
  String wisconsinCardSortingMessage(String arg0) {
    return '$arg0 枚のカードを正しく分類しました！';
  }

  @override
  String nBackMessage(String arg0) {
    return '$arg0 回の 2-back 一致を達成しました！ワーキングメモリはマルチタスクに不可欠です。';
  }

  @override
  String rhythmMasterMessage(String arg0, String arg1) {
    return '$arg0 回の完璧なヒットで $arg1 ポイント獲得しました！';
  }

  @override
  String groceryListMessage(String arg0, Object score) {
    return '買い物リストで $arg0 ポイント獲得しました！';
  }

  @override
  String get groceryListText => '準備完了';

  @override
  String get mirrorTracingMessage => '脳が正常に協調性を再構築しました。';

  @override
  String moduloClockMessage(String arg0) {
    return '素晴らしいモジュロ暗算能力です！スコア：$arg0';
  }

  @override
  String moduloClockMessage1(String arg0, String arg1, String arg2) {
    return '$arg1 問中 $arg0 問のモジュロ時計を解きました。スコア：$arg2';
  }

  @override
  String get crownMessage => '完璧な論理ですべてのクラウンを配置しました。';

  @override
  String dualCodingMessage(String arg0) {
    return '素晴らしいデュアルタスクパフォーマンスです！ワーキングメモリスコア：$arg0';
  }

  @override
  String inequalityDashMessage(String arg0) {
    return '不等式の一致で $arg0 ポイント獲得しました！';
  }

  @override
  String sourceMonitoringMessage(String arg0, String arg1) {
    return '$arg1 問中 $arg0 問正解しました！';
  }

  @override
  String get sourceMonitoringText => '想起開始';

  @override
  String get memoryPalaceText => '使用可能な単語';

  @override
  String target10Message(String arg0) {
    return '10にする数字の一致で $arg0 ポイント獲得しました！';
  }

  @override
  String get paperFoldingMessage => '頭の中でパターンが見えていますね。';

  @override
  String topologyText(String arg0, String arg1) {
    return '$arg0$arg1 / 10';
  }

  @override
  String get waterSortMessage => 'すべての色を完璧に仕分けました！';

  @override
  String anagramDefinitionMessage(String arg0) {
    return '正解は確かに「$arg0」でした。';
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
    return '$arg0 回の正しい推定を行いました。';
  }

  @override
  String grammarSortMessage(String arg0) {
    return '$arg0 個の単語を正しく分類しました！';
  }

  @override
  String vowelReconstructMessage(String arg0) {
    return '$arg0 ポイントで再構成しました！';
  }

  @override
  String spatialConflictMessage(String arg0, String arg1) {
    return '$arg0 ポイント獲得（エラー $arg1 回）！';
  }

  @override
  String get spatialConflictText => '遊び方';

  @override
  String get spatialConflictText1 => '了解';

  @override
  String tracePathMessage(String arg0) {
    return '精度は $arg0% でした！';
  }

  @override
  String ruleSwitcherMessage(String arg0, String arg1) {
    return '$arg1 問中 $arg0 問正解しました！';
  }

  @override
  String collatzMessage(String arg0, String arg1) {
    return '$arg0 ステップかかりました。最小可能ステップ数は $arg1 でした。';
  }

  @override
  String get collatzText => '/ 2';

  @override
  String get collatzText1 => '+ 1';

  @override
  String get collatzText2 => '3n + 1';

  @override
  String divisibilityDashMessage(String arg0) {
    return '$arg0 個の数字を解きました！';
  }

  @override
  String switchTaskMessage(String arg0) {
    return '$arg0 問正解しました！迅速な切り替えが柔軟性の鍵です。';
  }

  @override
  String sequenceSleuthMessage(String arg0) {
    return '$arg0 個の数列を解きました！';
  }

  @override
  String changeBlindnessMessage(String arg0) {
    return '$arg0 箇所の変化を見つけました！';
  }

  @override
  String mentalRotationMessage(String arg0) {
    return '$arg0 個の図形を正しく回転させました！';
  }

  @override
  String wordMastermindMessage(String arg0) {
    return 'コードをマスターしました！\n単語は「$arg0」でした。';
  }

  @override
  String wordMastermindMessage1(String arg0) {
    return '隠された単語は「$arg0」でした。';
  }

  @override
  String wordMastermindText(String arg0) {
    return '$arg0';
  }

  @override
  String get simonSequenceMessage => '10枚すべてのタイルを覚えました！';

  @override
  String get simonSequenceMessage1 => 'シーケンスをマスターするためにもう一度挑戦しましょう。';

  @override
  String oxymoronHuntMessage(String arg0) {
    return '$arg0 個の矛盾語を見つけました！';
  }

  @override
  String spotlightTrackMessage(String arg0) {
    return '素晴らしい空間追跡です！ $arg0 ポイント獲得しました。';
  }

  @override
  String get spotlightTrackText => '遊び方';

  @override
  String get spotlightTrackText1 => '了解';

  @override
  String get spotlightTrackText2 => 'ラウンド開始';

  @override
  String vennNumbersMessage(String arg0) {
    return '$arg0 個の数字を分類しました！';
  }

  @override
  String get vennNumbersText => 'どちらでもない';

  @override
  String get vennNumbersText1 => '両方';

  @override
  String get silhouetteMatchMessage => '3Dから2Dへの変換能力に優れていますね。';

  @override
  String sumSnakeMessage(String arg0) {
    return '完璧な精度でターゲット $arg0 に到達しました！';
  }

  @override
  String get sumSnakeText => 'パスをクリア';

  @override
  String percentagePeakMessage(String arg0) {
    return '$arg0 個のパーセント問題を解きました！';
  }

  @override
  String trailMakingMessage(String arg0) {
    return '$arg0 個のトレイルを完了しました！このテストは視覚的な検索速度と精神的な柔軟性を測定します。';
  }

  @override
  String matrixReasoningMessage(String arg0) {
    return '$arg0 個の行列を正しく完成させました！';
  }

  @override
  String get tentsAndTreesMessage => 'すべてのテントを正しく配置しました。';

  @override
  String klotskiMessage(String arg0) {
    return '素晴らしいスライディング！ $arg0 手でヒーローブロックを解放しました。';
  }

  @override
  String sumPyramidMessage(String arg0) {
    return '$arg0 個の合計ピラミッドを正解しました！';
  }

  @override
  String simonCommandMessage(String arg0) {
    return '素晴らしい選択的反応と集中力です！合計スコア：$arg0';
  }

  @override
  String simonCommandMessage1(String arg0, String arg1) {
    return 'スコアは $arg0 でしたが、時間内に $arg1 回の一致に達しませんでした。';
  }

  @override
  String syllableStackMessage(String arg0) {
    return '$arg0 ポイント獲得しました！';
  }

  @override
  String get slitherlinkMessage => 'お見事！ループパズルを完成させました。';

  @override
  String quickMathMessage(String arg0) {
    return '$arg0 問解きました！';
  }

  @override
  String commonDenominatorMessage(String arg0) {
    return '$arg0 問のGCD/LCM問題を解きました！';
  }

  @override
  String chainReactionMessage(String arg0, String arg1) {
    return '最終スコアは $arg0 です。 $arg1 単語の連鎖を作りました。';
  }

  @override
  String chainReactionText(String arg0) {
    return '$arg0';
  }

  @override
  String get associativePairsMessage => 'お見事！視覚的特徴を完璧に関連付けました。';

  @override
  String get associativePairsMessage1 => '関連付けが間違っています！リンク記憶を鍛えて、もう一度挑戦しましょう。';

  @override
  String portmanteauSplitMessage(String arg0) {
    return '$arg0 個のかばん語を分解しました！';
  }

  @override
  String get magicSquaresText => 'クリア';

  @override
  String alphabetSudokuText(String arg0) {
    return 'エラー：$arg0';
  }

  @override
  String get pipesMessage => 'すべてのパイプをつなぎ、グリッドを埋めました。';

  @override
  String get dualMirrorMessage => '両方のアイコンをターゲットに導きました！';

  @override
  String binaryCodeMessage(String arg0) {
    return '素晴らしい迅速な10進数変換です！最終スコア：$arg0';
  }

  @override
  String binaryCodeMessage1(String arg0, String arg1) {
    return '$arg0 個の2進数を正しく変換しました。スコア：$arg1';
  }

  @override
  String oddOneOutMessage(String arg0) {
    return '50個の仲間外れを見つけました！最終スコア：$arg0';
  }

  @override
  String oddOneOutMessage1(String arg0) {
    return 'スコア：$arg0';
  }

  @override
  String letterBridgeMessage(String arg0) {
    return 'ブリッジ文字を見つけました：$arg0';
  }

  @override
  String get imReady => '準備完了';

  @override
  String get soptTitle => '自己順序指差し';

  @override
  String get soptSubtitle => '毎回異なるカードをタップします。ポジションがシャッフルされる！';

  @override
  String get soptWinTitle => 'シーケンスマスター！';

  @override
  String soptGameOverMessage(int score) {
    return 'シャッフルされたカードを追跡することに成功して、 $score ポイントを獲得しました!';
  }

  @override
  String get soptChooseNovel => '新しいカードをタップします';

  @override
  String get soptGreatJob => '素晴らしい仕事だ！';

  @override
  String get soptAlreadyTapped => 'すでにタップされています！';

  @override
  String get soptGrid => 'グリッド';

  @override
  String get contRecogTitle => '継続的な認識';

  @override
  String get contRecogSubtitle => 'このセッションでこのカードを見たことがありますか?';

  @override
  String get contRecogWinTitle => '認識の天才！';

  @override
  String contRecogGameOverMessage(int score) {
    return 'あなたは $score の正しい認識を獲得しました!';
  }

  @override
  String get contRecogCorrect => '正しい！';

  @override
  String get contRecogWrong => '間違っている！';

  @override
  String get contRecogOldOrNew => 'これは古いですか、それとも新しいですか?';

  @override
  String get contRecogNew => '新しい';

  @override
  String get contRecogOld => '古い';

  @override
  String get contRecogSeenPool => '見たプール';

  @override
  String get dnmsTitle => '不一致のメモリ';

  @override
  String get dnmsSubtitle => '記憶したサンプルに含まれていないカードをタップします。';

  @override
  String get dnmsWinTitle => '不一致の専門家!';

  @override
  String dnmsGameOverMessage(int score) {
    return '遅延非マッチングで $score 個の正解を獲得しました。';
  }

  @override
  String get dnmsChooseNovel => '新しいカードをタップします';

  @override
  String get dnmsMemorizeSample => 'このカードを暗記してください';

  @override
  String get dnmsWaitForIt => '待ってください...';

  @override
  String get dnmsExcellent => '素晴らしい！';

  @override
  String get dnmsSampleTapped => 'それがサンプルでした！';

  @override
  String get dnmsCards => 'カード';

  @override
  String get symSpanTitle => '対称スパン';

  @override
  String get symSpanSubtitle => '垂直方向の対称性を識別しながら、細胞のパターンを思い出します。';

  @override
  String get symSpanWinTitle => 'シンメトリーマスター！';

  @override
  String symSpanGameOverMessage(int score) {
    return 'レイアウトを思い出し、対称性を特定することで、 $score ポイントを獲得しました。';
  }

  @override
  String get symSpanMemorizeRed => '赤血球の位置を記憶する';

  @override
  String get symSpanIsSymmetric => '模様は左右対称ですか？';

  @override
  String get symSpanRecallSequence => 'シーケンスを正しい順序で呼び出します';

  @override
  String get symSpanGreatJob => '素晴らしい仕事だ！';

  @override
  String get symSpanTryAgain => 'もう一度やり直してください！';

  @override
  String get symSpanLength => '長さ';

  @override
  String get readingSpanTitle => '読み取りスパン';

  @override
  String get readingSpanSubtitle => '一連の文字を思い出しながら文章を確認します。';

  @override
  String get readingSpanWinTitle => '読書の達人！';

  @override
  String readingSpanGameOverMessage(int score) {
    return 'Reading Span の記憶力チャレンジで $score ポイントを獲得しました!';
  }

  @override
  String get readingSpanTrueFalse => 'この発言は本当ですか、それとも嘘ですか?';

  @override
  String get readingSpanMemorizeLetter => 'この手紙を覚えておいてください';

  @override
  String get readingSpanRecallLetters => '文字を順番に思い出す';

  @override
  String get readingSpanGreatJob => '素晴らしい仕事だ！';

  @override
  String get readingSpanTryAgain => 'もう一度やり直してください！';

  @override
  String readingSpanYourSequence(String sequence) {
    return 'あなたのシーケンス: $sequence';
  }

  @override
  String get readingSpanLength => '長さ';

  @override
  String get readingSpanSentence1 => '太陽は東から昇ります。';

  @override
  String get readingSpanSentence2 => '氷が沸騰して熱くなっています。';

  @override
  String get readingSpanSentence3 => '魚は水中でも呼吸ができます。';

  @override
  String get readingSpanSentence4 => '犬には翼があり空を飛ぶことができます。';

  @override
  String get readingSpanSentence5 => '水は摂氏0度で凍ります。';

  @override
  String get readingSpanSentence6 => '猫は小型犬のように吠えます。';

  @override
  String get readingSpanSentence7 => '夏には木々が緑の葉を茂らせます。';

  @override
  String get readingSpanSentence8 => '雨は地面から上に降り注ぎます。';

  @override
  String get readingSpanSentence9 => '三角形には 4 つの等しい辺があります。';

  @override
  String get readingSpanSentence10 => 'リンゴは甘い果物の一種です。';

  @override
  String get readingSpanSentence11 => '月はチェダーチーズでできています。';

  @override
  String get readingSpanSentence12 => '自動車には転がるための車輪があります。';

  @override
  String get readingSpanSentence13 => '火は凍てつくほど冷たい。';

  @override
  String get readingSpanSentence14 => '紙は木材を加工して作られます。';

  @override
  String get readingSpanSentence15 => '鳥には飛ぶために羽があります。';

  @override
  String get readingSpanSentence16 => 'バナナは松の木に生えています。';

  @override
  String get readingSpanSentence17 => 'ゾウはアリよりも小さいです。';

  @override
  String get readingSpanSentence18 => '本には印刷されたテキストのページが含まれています。';

  @override
  String get countingSpanTitle => 'カウンティングスパン';

  @override
  String get countingSpanSubtitle => '青い丸だけを数えます。次に、一連のカウントを思い出してください。';

  @override
  String get countingSpanWinTitle => 'カウンティングの天才!';

  @override
  String countingSpanGameOverMessage(int score) {
    return 'カウンティング スパン メモリ チャレンジで $score ポイントを獲得しました!';
  }

  @override
  String get countingSpanCountCircles => '青い丸だけを数える';

  @override
  String get countingSpanRecallCounts => '正しい順序でカウントを呼び出す';

  @override
  String get countingSpanGreatJob => '素晴らしい仕事だ！';

  @override
  String get countingSpanTryAgain => 'もう一度やり直してください！';

  @override
  String countingSpanYourSequence(String sequence) {
    return 'あなたのシーケンス: $sequence';
  }

  @override
  String get countingSpanLength => '長さ';

  @override
  String get objDispTitle => 'オブジェクトの変位';

  @override
  String get objDispSubtitle => 'レイアウトを覚える。位置を移動する 1 つのオブジェクトを見つけてタップします。';

  @override
  String get objDispWinTitle => '空間の天才！';

  @override
  String objDispGameOverMessage(int score) {
    return '$score 個の移動オブジェクトを正しく特定しました。';
  }

  @override
  String get objDispMemorizeAll => 'すべての配置を記憶する';

  @override
  String get objDispWaitingShift => 'レイアウト変更を待っています...';

  @override
  String get objDispTapMoved => '動いたオブジェクトをタップ';

  @override
  String get objDispExcellent => '素晴らしい！';

  @override
  String get objDispWrongObject => 'オブジェクトが間違っています!';

  @override
  String get objDispItems => 'アイテム';

  @override
  String get mandalaTitle => 'マンダラリコール';

  @override
  String get mandalaSubtitle => 'カラー構成を記憶します。色を選択してタイルを再ペイントします。';

  @override
  String get mandalaWinTitle => 'マンダラアーティスト！';

  @override
  String mandalaGameOverMessage(int score) {
    return '色付きの幾何学的なレイアウトを再作成して、 $score ポイントを獲得しました。';
  }

  @override
  String get mandalaMemorizeColors => 'タイルの色を記憶する';

  @override
  String get mandalaPaintCells => 'オリジナルに合わせてセルをペイントする';

  @override
  String get mandalaExcellent => '素晴らしい！';

  @override
  String get mandalaIncorrectMatch => '間違った一致です!';

  @override
  String get mandalaSubmitRepaint => 'リペイントを送信する';

  @override
  String get mandalaTiles => 'タイル';

  @override
  String get runningSpanTitle => 'ランニングスパン';

  @override
  String get runningSpanSubtitle => '手紙に注目してください。停止したら、最後の N 文字を順番に入力します。';

  @override
  String get runningSpanWinTitle => 'バッファーマスター！';

  @override
  String runningSpanGameOverMessage(int score) {
    return 'ランニング メモリ スパンで $score ポイントを獲得しました!';
  }

  @override
  String runningSpanPrepareRecall(int count) {
    return '最後の $count 文字を思い出す準備をしてください';
  }

  @override
  String get runningSpanWatchCarefully => '注意深く見てください...';

  @override
  String runningSpanEnterLast(int count) {
    return '最後の $count 文字を入力してください';
  }

  @override
  String get runningSpanGreatJob => '素晴らしい仕事だ！';

  @override
  String get runningSpanIncorrectBuffer => 'バッファが間違っています!';

  @override
  String runningSpanRecallLast(int count) {
    return '最後の $count を思い出してください';
  }

  @override
  String get runningSpanStopsRandomly => 'ストリームがランダムに停止します。';

  @override
  String runningSpanEntered(String sequence) {
    return '入力: $sequence';
  }

  @override
  String get runningSpanNItems => 'N アイテム';

  @override
  String get spatialCabinetTitle => '空間キャビネット';

  @override
  String get spatialCabinetSubtitle => 'どのキャビネットの引き出しにどのオブジェクトが入っているかを記憶します。';

  @override
  String get spatialCabinetWinTitle => '内閣の専門家！';

  @override
  String spatialCabinetGameOverMessage(int score) {
    return 'Spatial Cabinet Memory で $score ポイントを獲得しました!';
  }

  @override
  String get spatialCabinetMemorize => 'アイテムの場所を記憶する';

  @override
  String spatialCabinetWhereIs(String itemName) {
    return '$itemName はどこですか?';
  }

  @override
  String get spatialCabinetCorrect => '正しい！';

  @override
  String get spatialCabinetWrongDrawer => '引き出しが間違っています!';

  @override
  String get spatialCabinetItems => 'アイテム';

  @override
  String get cabinetItemKey => '鍵';

  @override
  String get cabinetItemApple => 'りんご';

  @override
  String get cabinetItemDiamond => 'ダイヤモンド';

  @override
  String get cabinetItemBook => '本';

  @override
  String get cabinetItemUmbrella => '傘';

  @override
  String get cabinetItemCoffee => 'コーヒー';

  @override
  String get cabinetItemLock => 'ロック';

  @override
  String get cabinetItemPet => 'ペット';

  @override
  String get cabinetItemCar => '車';

  @override
  String get gamesTitleLabel => 'ゲーム';

  @override
  String get yourFavorites => 'お気に入り';

  @override
  String get readyForWorkout => '毎日の脳トレの準備はいいですか？';

  @override
  String get greatStartKeepGoing => '素晴らしいスタートです！その調子で続けましょう。';

  @override
  String get onFireToday => '今日は絶好調ですね！';

  @override
  String get incredibleSolvingToday => '今日は驚異的な解答数です！';

  @override
  String get newGameLabel => '新規';

  @override
  String get slitherlinkTitle => 'スリザーリンク';

  @override
  String get slitherlinkSubtitle => '数字のヒントを使ってピンのグリッドをループで囲みます。';

  @override
  String get futoshikiTitle => '不等式パズル';

  @override
  String get futoshikiSubtitle => '不等号のヒントに従ってグリッドを埋めます。';

  @override
  String get kakuroTitle => 'カックロ';

  @override
  String get kakuroSubtitle => '数字と合計を使ってクロスワードを解きます。';

  @override
  String get inequalityDashTitle => '不等式ダッシュ';

  @override
  String get inequalityDashSubtitle => '時間制限内に不等式を解きます。';

  @override
  String get factorFinderTitle => '因数探し';

  @override
  String get factorFinderSubtitle => 'ターゲット数字のすべての因数を特定します。';

  @override
  String get collatzTitle => 'コラッツの道';

  @override
  String get collatzSubtitle => '3N+1の数列を進みます。';

  @override
  String get sumPyramidTitle => '合計ピラミッド';

  @override
  String get sumPyramidSubtitle => '合計値のヒントを使ってピラミッドのセルを埋めます。';

  @override
  String get target10Title => 'ターゲット10';

  @override
  String get target10Subtitle => '数字タイルを組み合わせて合計10を作ります。';

  @override
  String get fractionMatcherTitle => '分数マッチング';

  @override
  String get fractionMatcherSubtitle => '視覚的に等しい分数を一致させます。';

  @override
  String get dualCodingTitle => 'デュアルコーディング';

  @override
  String get dualCodingSubtitle => '文字と記号を同時に一致させます。';

  @override
  String get distractorMatrixTitle => '妨害要素マトリックス';

  @override
  String get distractorMatrixSubtitle => '妨害要素の中からターゲットの形を見つけます。';

  @override
  String get temporalOrderTitle => '時系列順';

  @override
  String get temporalOrderSubtitle => '時系列の順序を思い出します。';

  @override
  String get associativePairsTitle => '連想ペア';

  @override
  String get associativePairsSubtitle => '対応する記号をペアにして一致させます。';

  @override
  String get blockCount3dTitle => '3Dブロック計算';

  @override
  String get blockCount3dSubtitle => '3次元空間内のブロックを数えます。';

  @override
  String get rotatingMazeTitle => '回転迷路';

  @override
  String get rotatingMazeSubtitle => '迷路を回転させてボールを出口に導きます。';

  @override
  String get silhouetteMatchOrthoTitle => 'シルエットマッチ（正投影）';

  @override
  String get silhouetteMatchOrthoSubtitle => '3Dオブジェクトと正投影の影を一致させます。';

  @override
  String get spatialConflictTitle => '空間的葛藤';

  @override
  String get spatialConflictSubtitle => '文字と方向の不一致を解決します。';

  @override
  String get spotlightTrackTitle => 'スポットライト追跡';

  @override
  String get spotlightTrackSubtitle => '動く影の中で点滅するアイテムを追跡します。';

  @override
  String get d2AttentionTitle => 'd2注意テスト';

  @override
  String get d2AttentionSubtitle => '厳格な基準に従ってターゲット記号をタップします。';

  @override
  String get dualMirrorTitle => 'デュアルミラー・ナビゲーション';

  @override
  String get dualMirrorSubtitle => '2つの迷路を同時に進みます。';

  @override
  String get contextCluesTitle => '文脈ヒント';

  @override
  String get contextCluesSubtitle => '文脈のヒントから隠された単語を推測します。';

  @override
  String get digitSpanReverseSubtitle => '数字を逆順に思い出します。';

  @override
  String get faceNameAssociationSubtitle => '提示された様々な顔の名前を思い出します。';

  @override
  String get staircaseMemorySubtitle => '階段状の順序でブロックを記憶します。';

  @override
  String get choiceReactionTimeSubtitle => 'ヒントに一致する特定のボタンを素早くタップします。';

  @override
  String get attentionalBlinkSubtitle => 'ストリーム内で素早く点滅するターゲットを捉えます。';

  @override
  String get visualStatisticalLearningSubtitle => '時系列の図形パターンを視覚的に学習します。';

  @override
  String get sternbergTaskSubtitle => '記号が記憶セットの中にあったか思い出します。';

  @override
  String get operationSpanSubtitle => '計算を解きながらアルファベットの文字列を思い出します。';

  @override
  String get continuousRecognitionTitle => '連続認識';

  @override
  String get continuousRecognitionSubtitle => '提示されたカードが以前のものか新しいものか識別します。';

  @override
  String get symmetrySpanTitle => '対称性スパン';

  @override
  String get symmetrySpanSubtitle => '垂直対称の判定を行いながらセルの座標を思い出します。';

  @override
  String get objectDisplacementTitle => '物体移動';

  @override
  String get objectDisplacementSubtitle => '配置を学習し、移動した1つの物体をタップします。';

  @override
  String get mandalaRecallTitle => 'マンダラ想起';

  @override
  String get mandalaRecallSubtitle => '色のタイルの配置を記憶し、パレットからマンダラを塗り直します。';

  @override
  String get runningMemorySpanTitle => 'ランニングスパン';

  @override
  String get runningMemorySpanSubtitle => '流れる文字を監視し、最後のN個のアイテムを思い出します。';

  @override
  String get spatialCabinetMemoryTitle => '空間キャビネット';

  @override
  String get spatialCabinetMemorySubtitle => 'キャビネットの扉の裏にあるアイテムを記憶し、場所を特定します。';

  @override
  String get pathRecallSubtitle => '経路の選択を記憶し、繰り返します。';

  @override
  String get objectShuffleSubtitle => '深いカップの下でシャッフルされるアイテムを追跡します。';

  @override
  String get groceryListSubtitle => 'リストにあるアイテムを記憶し、チェックを入れます。';

  @override
  String get quickMathSubtitle => '計算問題を最高速度で解きます。';

  @override
  String get mathGuessTitle => '数字当て';

  @override
  String get mathGuessSubtitle => '15回以内に隠された数字を当てます。';

  @override
  String get reflexTapSubtitle => '刺激を人間ができる限り素早くタップします。';

  @override
  String get pixelMimicSubtitle => 'ピクセルグリッド上のデザインパターンを模倣します。';

  @override
  String get simonSequenceSubtitle => '記憶から図形の順序を繰り返します。';

  @override
  String get slidePuzzleSubtitle => '正方形のスライディンググリッドタイルを並べ替えます。';

  @override
  String get findWordTitle => '単語探し';

  @override
  String get schulteTableSubtitle => '1から25までの数字をタップします。';

  @override
  String get simonCommandTitle => 'サイモンコマンド';

  @override
  String get simonCommandSubtitle => '音声の指示に従って素早く動作します。';

  @override
  String get binaryCodeTitle => 'バイナリスピード';

  @override
  String get binaryCodeSubtitle => 'バイナリコードを10進数に変換します。';

  @override
  String get moduloClockTitle => '剰余時計';

  @override
  String get moduloClockSubtitle => '時計を使って数学の方程式を計算します。';

  @override
  String get chimpTestTitle => 'チンパンジーテスト';

  @override
  String get chimpTestSubtitle => 'ランダムな数字を昇順にタップします。';

  @override
  String get relationalMemoryTitle => '関係記憶';

  @override
  String get relationalMemorySubtitle => 'グリッドアイテムの正確な位置を思い出します。';

  @override
  String get factBinderTitle => 'ファクトバインダー';

  @override
  String get factBinderSubtitle => '記号を結びつけ、発言内容を思い出します。';

  @override
  String get sourceMonitoringTitle => 'ソースモニタリング';

  @override
  String get sourceMonitoringSubtitle => '文脈を思い出します。';

  @override
  String get klotskiTitle => '箱入り娘（クロツキ）';

  @override
  String get klotskiSubtitle => 'ブロックをスライドさせて出口に到達させます。';

  @override
  String get homophoneHuntSubtitle => '正しく綴られた同音異義語を選択します';

  @override
  String get laserLinkTitle => 'レーザーリンク';

  @override
  String get laserLinkSubtitle => '鏡を回転させてレーザーを反射させ、すべてのターゲットをパワーアップさせます。';

  @override
  String get laserLinkCongrats => '精密な反射！グリッド全体に電力を供給することに成功しました。';

  @override
  String get crossSectionSliceTitle => '断面スライス';

  @override
  String get crossSectionSliceSubtitle => '特定の角度から見た3Dオブジェクトの正しい2D断面を特定します。';

  @override
  String get crossSectionSliceCongrats => '驚異的な3D視覚化！形状の内部を完全に見抜きました。';

  @override
  String get shadowPivotTitle => 'シャドウピボット';

  @override
  String get shadowPivotCongrats => 'ダイナミックな空間認識！光と影をマスターしました。';

  @override
  String get shadowPivotSubtitle => '3Dオブジェクトが異なる軸で回転したときに投影される影を予測します。';

  @override
  String get interlockPuzzleTitle => '連動パズル';

  @override
  String get interlockPuzzleSubtitle => '複雑に連動するブロックを正しい順序で分解または組み立てます。';

  @override
  String get interlockPuzzleCongrats => '論理的な解体！パズルを完璧に解き明かしました。';

  @override
  String get pathIntersectTitle => 'パス交差';

  @override
  String get pathIntersectSubtitle => '複数の経路を同時に進み、衝突することなくそれぞれのターゲットに到達します。';

  @override
  String get pathIntersectCongrats => '同期されたナビゲーション！すべてのターゲットに完璧に到達しました。';

  @override
  String get negativeSpaceDetectionTitle => 'ネガティブスペース';

  @override
  String get negativeSpaceDetectionSubtitle => 'オブジェクト間の空白によって形成される形状を特定します。';

  @override
  String get negativeSpaceDetectionCongrats => '鋭い洞察力！そこにないものを見る技術を習得しましたね。';

  @override
  String get compassMazeTitle => 'コンパス迷路';

  @override
  String get compassMazeSubtitle => 'コンパスの向きに基づいて移動方向が変わる迷路を進みます。';

  @override
  String get compassMazeCongrats => 'エキスパートなナビゲーション！変化する方向の中、出口を見つけ出しました。';

  @override
  String get complexFoldingNetsTitle => '展開図';

  @override
  String get complexFoldingNetsSubtitle =>
      '非標準的な2D展開図を折り畳んだときに形成される複雑な3D形状を特定します。';

  @override
  String get complexFoldingNetsCongrats => '高度な折り畳みロジック！3D形状を正確に視覚化できました。';

  @override
  String get compassMazeMessage => 'コンパスを使って迷路を進んでください。';

  @override
  String get negativeSpaceDetectionMessage => '空間に隠されたオブジェクトを特定してください。';

  @override
  String get shikakuTitle => 'シカク';

  @override
  String get shikakuSubtitle => 'グリッドを数字に合わせて正方形と長方形に分割します。';

  @override
  String get countdownMathTitle => 'カウントダウン計算';

  @override
  String get countdownMathSubtitle => '乱数を組み合わせて 3 桁のターゲットを計算します。';

  @override
  String get narrativeRecallTitle => '物語の想起';

  @override
  String get narrativeRecallSubtitle => 'ストーリーを読んで、具体的な量的かつ事実の詳細を思い出してください。';

  @override
  String get shellGameTitle => 'シェルゲーム';

  @override
  String get shellGameSubtitle => 'シャッフル カップの位置を入れ替えながら、隠しボールを追跡します。';

  @override
  String get typoglycemiaDecoderTitle => '低血糖デコーダー';

  @override
  String get typoglycemiaDecoderSubtitle => '乱雑な文章を解読してスピーディーに読みましょう。';

  @override
  String get shapeShifterTitle => 'シェイプシフター';

  @override
  String get shapeShifterSubtitle => '目的の形状と色の組み合わせをタップします。';

  @override
  String get gokigenNanameTitle => 'ゴキゲン菜々芽';

  @override
  String get gokigenNanameSubtitle => '対角線を引いてループを作らずに点を接続します。';

  @override
  String get matrixMultiplierTitle => 'マトリックス乗算器';

  @override
  String get matrixMultiplierSubtitle => 'ターゲットに乗算する行と列を選択します。';

  @override
  String get wordAssociationRecallTitle => '単語の関連付け';

  @override
  String get wordAssociationRecallSubtitle => 'ペアになった単語の関連付けを記憶から呼び出します。';

  @override
  String get gearRotationTitle => '歯車の回転';

  @override
  String get gearRotationSubtitle => '最後の歯車の回転方向を予測します。';

  @override
  String get wordWheelTitle => 'ワードホイール';

  @override
  String get wordWheelSubtitle => '中央の文字を含むホイール上の文字を使用して単語を作成します。';

  @override
  String get oddEvenFlashTitle => '奇数偶数フラッシュ';

  @override
  String get oddEvenFlashSubtitle => '数値のパリティを色のルールとすばやく照合します。';

  @override
  String get norinoriTitle => 'ノリノリ';

  @override
  String get norinoriSubtitle => '各部屋の 2 つの接続されたセルを正確に遮光します。';

  @override
  String get algebraicBalanceTitle => '代数的バランス';

  @override
  String get algebraicBalanceSubtitle => '方程式を解いて目標の合計を求めます。';

  @override
  String get patternSequenceDrawTitle => 'パターンリコール';

  @override
  String get patternSequenceDrawSubtitle => 'アニメーション化されたパス シーケンスをグリッド上で繰り返します。';

  @override
  String get tangramTitle => 'タングラムパズル';

  @override
  String get tangramSubtitle => 'ターゲットのシルエットを満たすようにシェイプを配置します。';

  @override
  String get semanticAssociationTitle => '連想語';

  @override
  String get semanticAssociationSubtitle => '3 つの手がかりをすべて結び付ける単語を見つけてください。';

  @override
  String get peripheralFocusTitle => '周辺フォーカス';

  @override
  String get peripheralFocusSubtitle => '数学を解いているときにサイドパネルの点滅に反応します。';

  @override
  String get masyuTitle => '摩周ループ';

  @override
  String get masyuSubtitle => 'マシューサークルのルールに合わせて1つのループを描きます。';

  @override
  String get mathMazeTitle => '数学迷路';

  @override
  String get mathMazeSubtitle => '目標合計を評価するパスをトレースします。';

  @override
  String get storyBuilderTitle => 'ストーリービルダー';

  @override
  String get storyBuilderSubtitle => '物語の時系列を再構成します。';

  @override
  String get mirrorMazeTitle => 'ミラーメイズ';

  @override
  String get mirrorMazeSubtitle => '対角ミラーを使用してレーザー ビームの方向を変更します。';

  @override
  String get wordGridConnectionTitle => '単語のつながり';

  @override
  String get wordGridConnectionSubtitle => '16 個の単語を 4 つずつ 4 つのカテゴリにグループ化します。';

  @override
  String get shapeShifterPeripheralTitle => '外周形状';

  @override
  String get shapeShifterPeripheralSubtitle => '中心値を一致させながら、周辺形状の変化を追跡します。';

  @override
  String get soundWaveMatchTitle => 'サウンドウェーブマッチ';

  @override
  String get soundWaveMatchSubtitle => '視覚波の周波数がピッチの変化と一致したらタップします。';

  @override
  String get multiTrackCounterTitle => 'マルチトラックカウンター';

  @override
  String get multiTrackCounterSubtitle => 'いずれかのカウンターが目標乗数まで増加したときにタップします。';

  @override
  String get colorWordMatchUpTitle => 'カラーマッチアップ';

  @override
  String get colorWordMatchUpSubtitle => '変更ルールに基づいて、2 つの色の単語が一致するかどうかを判断します。';

  @override
  String get signalAndNoiseTitle => 'シグナル＆ノイズ';

  @override
  String get signalAndNoiseSubtitle => '静的ノイズに隠れた目的の英数字を見つけます。';

  @override
  String get focusTunnelTitle => 'フォーカストンネル';

  @override
  String get focusTunnelSubtitle => '移動するトンネルの壁に表示される一致するシンボルを特定します。';

  @override
  String get targetPursuerTitle => 'ターゲット追跡者';

  @override
  String get targetPursuerSubtitle => '重なっている複数の円を追跡し、元のターゲットを選択します。';

  @override
  String get gridGazeTitle => 'グリッドゲイズ';

  @override
  String get gridGazeSubtitle => 'どのグリッド セルが異なる期間で点滅したかを特定します。';

  @override
  String get doubleTroubleTitle => 'ダブルトラブル';

  @override
  String get doubleTroubleSubtitle => '分割画面で 2 つの別々のシンプルなゲームを同時にプレイします。';

  @override
  String get syncRhythmTitle => 'シンクロリズム';

  @override
  String get syncRhythmSubtitle =>
      '視覚的なメトロノームのスイープがシンコペーションされたビートと一致するときにタップします。';

  @override
  String get ghostTapTitle => 'ゴーストタップ';

  @override
  String get ghostTapSubtitle => '目に見えないパルスが最大高さに達したらタップします。';

  @override
  String get attentionalRsvpTitle => '注意して出欠を表明';

  @override
  String get attentionalRsvpSubtitle => '高速シリアル レター フラッシュに表示される数字を識別します。';

  @override
  String get colorMazeNavTitle => 'カラー迷路ナビ';

  @override
  String get colorMazeNavSubtitle => '動的許可色に一致する迷路タイルを移動します。';

  @override
  String get dynamicSalienceTitle => 'ダイナミックな顕著性';

  @override
  String get dynamicSalienceSubtitle => 'わずかに異なるダイナミクスで動く形状を見つけてください。';

  @override
  String get chalkAndTalkTitle => 'チョーク＆トーク';

  @override
  String get chalkAndTalkSubtitle => '気を散らす視覚的な要因を無視して、音声で聞こえる単語を入力します。';

  @override
  String get blinkDetectorTitle => 'まばたき検出器';

  @override
  String get blinkDetectorSubtitle => '2回続けて点滅するグリッド面をタップします。';

  @override
  String get frequencyTapTitle => '周波数タップ';

  @override
  String get frequencyTapSubtitle => '目的の光パルス周波数に一致するボタンをタップします。';

  @override
  String get yajilinTitle => 'ヤジリン・ループ';

  @override
  String get yajilinSubtitle => '黒いセルを配置し、手がかりに一致する単一のループを描きます。';

  @override
  String get heyawakeTitle => 'へやわけグリッド';

  @override
  String get heyawakeSubtitle => '隣接する黒いセルのないシェードグリッドルーム。';

  @override
  String get gokigenVariantTitle => 'ゴキゲンの異形';

  @override
  String get gokigenVariantSubtitle => '頂点数を満たすループのない対角線を描画します。';

  @override
  String get sheepAndWolvesTitle => '羊とオオカミ';

  @override
  String get sheepAndWolvesSubtitle => '羊とオオカミを分ける輪を描きます。';

  @override
  String get islandNurikabeTitle => 'ぬりかべ島';

  @override
  String get islandNurikabeSubtitle => 'サイズの数値制約に一致するアイランドを形成します。';

  @override
  String get shakashakaTitle => 'シャカシャカ レクト';

  @override
  String get shakashakaSubtitle => '三角形のタイルを配置して長方形の白い領域を形成します。';

  @override
  String get litsTetrisTitle => 'LITS テトロミノ';

  @override
  String get litsTetrisSubtitle => '隣接する複製がない部屋にテトロミノを配置します。';

  @override
  String get tapaWallTitle => 'タパウォール';

  @override
  String get tapaWallSubtitle => 'セルをシェーディングして、連続した黒い壁のパターンを形成します。';

  @override
  String get triangularBridgesTitle => '三角橋';

  @override
  String get triangularBridgesSubtitle => '要件を満たす3方向に島を接続します。';

  @override
  String get rippleEffectTitle => '波及効果';

  @override
  String get rippleEffectSubtitle => '間隔距離の制約を考慮して部屋に番号を入力します。';

  @override
  String get suguruTectonicTitle => 'すぐるグリッド';

  @override
  String get suguruTectonicSubtitle => '隣り合う部屋のブロックに 1 から K までの数字を入力します。';

  @override
  String get tennerGridTitle => 'テナーグリッド';

  @override
  String get tennerGridSubtitle => '列の合計に一致する 0 ～ 9 の数字を行に入力します。';

  @override
  String get kakurasuSumsTitle => 'カクラス・サムズ';

  @override
  String get kakurasuSumsSubtitle => '重み付けされた行/列インデックスの合計を満たすようにセルをシェーディングします。';

  @override
  String get corralLoopTitle => 'コラル・ループ';

  @override
  String get corralLoopSubtitle => '可視性と一致する数字を囲む単一のループを描画します。';

  @override
  String get stostoneTitle => 'ストストーングラビティ';

  @override
  String get stostoneSubtitle => '下の行を完全に埋めるためにドロップダウンするセルをシェーディングします。';

  @override
  String get tripletsLogicTitle => '三つ子トリオ';

  @override
  String get tripletsLogicSubtitle => '3 つ連続しないように 3 つの図形でグリッドを塗りつぶします。';

  @override
  String get galaxiesSymTitle => '銀河の対称性';

  @override
  String get galaxiesSymSubtitle => 'グリッドを回転対称の銀河の形状に分割します。';

  @override
  String get matrixMultiplierMatchTitle => 'マトリックスマッチャー';

  @override
  String get matrixMultiplierMatchSubtitle => '行と列の値を乗算してターゲットのドット積に一致させます。';

  @override
  String get primeFactorTreesTitle => '素因数ツリー';

  @override
  String get primeFactorTreesSubtitle => '合成数を素数リーフ因子ペアに分解します。';

  @override
  String get vektorVectorTitle => 'ベクトル';

  @override
  String get vektorVectorSubtitle => 'ベクトルをスケールして、その合計がターゲットに到達するようにします。';

  @override
  String get binomialMatchTitle => '二項一致';

  @override
  String get binomialMatchSubtitle => '二次公式を因数分解された二項値と照合します。';

  @override
  String get percentageShoppingTitle => 'パーセンテージショッピング';

  @override
  String get percentageShoppingSubtitle => '割引率と最終チェックアウトの合計を計算します。';

  @override
  String get cryptoArithmeticTitle => '暗号演算';

  @override
  String get cryptoArithmeticSubtitle => '文字と数字の置換暗号の数学の問題を解読します。';

  @override
  String get fractionalPizzaTitle => 'フラクショナルピザ';

  @override
  String get fractionalPizzaSubtitle => '目標合計の割合に一致するようにピザのスライスを分割します。';

  @override
  String get numberBondsTitle => '番号結合';

  @override
  String get numberBondsSubtitle => 'リンク ノードの値がターゲット接続の合計と等しくなるようにします。';

  @override
  String get gridSumLineTitle => 'グリッド合計ライン';

  @override
  String get gridSumLineSubtitle => '値がターゲットに対して正確に評価されるパスを描画します。';

  @override
  String get binaryScaleBalanceTitle => 'バイナリスケールバランス';

  @override
  String get binaryScaleBalanceSubtitle => '2 の累乗ブロックを使用して 10 進重みのバランスをとります。';

  @override
  String get moduloPathTitle => 'モジュロパス';

  @override
  String get moduloPathSubtitle => 'モジュロ剰余値に一致するグリッド セルを走査します。';

  @override
  String get digitSwapEqTitle => '桁交換方程式';

  @override
  String get digitSwapEqSubtitle => '式の間で 1 桁を入れ替えて、両方を修正します。';

  @override
  String get areaPerimeterMatchTitle => '面積と周囲';

  @override
  String get areaPerimeterMatchSubtitle => 'ターゲット領域と周囲の値に一致する長方形を描画します。';

  @override
  String get inequalityBalanceOpsTitle => '不平等の均衡';

  @override
  String get inequalityBalanceOpsSubtitle => '複雑な数学用語の間に不等号を配置します。';

  @override
  String get graphCoordinatePlotTitle => 'グラフプロッタ';

  @override
  String get graphCoordinatePlotSubtitle => '線形/二次曲線に一致するグリッド座標をプロットします。';

  @override
  String get baseConversionRunTitle => '塩基変換';

  @override
  String get baseConversionRunSubtitle =>
      '値を 2 進数、10 進数、16 進数、および 8 進数の間で変換します。';

  @override
  String get unitConverterProTitle => '単位換算器';

  @override
  String get unitConverterProSubtitle => '制限時間内で簡単に単位変換に答えてください。';

  @override
  String get auditoryNBackTitle => '聴覚Nバック';

  @override
  String get auditoryNBackSubtitle => '記憶から N ステップ遡って聞いた音声文字を照合します。';

  @override
  String get abstractPatternRecallTitle => 'パターンの重ね合わせ';

  @override
  String get abstractPatternRecallSubtitle => '記憶研究から層状のカラフルな形状を再構築します。';

  @override
  String get roomInspectorTitle => 'ルームインスペクター';

  @override
  String get roomInspectorSubtitle => '画面が空白のときに行われた家具の変更を特定します。';

  @override
  String get voiceToFaceMatchTitle => '声と顔の一致';

  @override
  String get voiceToFaceMatchSubtitle => '音声音声クリップに関連付けられた正しい顔を選択します。';

  @override
  String get spatialGridMemory3DTitle => '3D空間記憶';

  @override
  String get spatialGridMemory3DSubtitle =>
      '回転した 3D 立方体グリッド構造のフラッシュされたブロックを呼び出します。';

  @override
  String get sequenceStackTitle => 'シーケンススタック';

  @override
  String get sequenceStackSubtitle => 'プレート スタックの追加と削除を順番に再構築します。';

  @override
  String get semanticCategoryRecallTitle => 'カテゴリリコール';

  @override
  String get semanticCategoryRecallSubtitle =>
      '要求されたカテゴリのターゲットに一致する学習単語を特定します。';

  @override
  String get gridDisplacementTitle => 'グリッドの変位';

  @override
  String get gridDisplacementSubtitle => 'レイアウトを元のレイアウトと比較して、ずれたアイコンを特定します。';

  @override
  String get soundSequenceMatchTitle => 'サウンドシーケンスの一致';

  @override
  String get soundSequenceMatchSubtitle => '仮想キーボードで演奏されるノートシーケンスを繰り返します。';

  @override
  String get cardCountingMemoryTitle => 'カードカウンター';

  @override
  String get cardCountingMemorySubtitle => '継続的なカード配りの実行ですでに配られたカードを特定します。';

  @override
  String get directionsRecallTitle => '指示の呼び出し';

  @override
  String get directionsRecallSubtitle => 'メモリからパスの方向に一致するグリッド マップをナビゲートします。';

  @override
  String get eventTimelineMemoryTitle => 'イベントのタイムライン';

  @override
  String get eventTimelineMemorySubtitle => '歴史的/架空のイベントカードを時系列に並べます。';

  @override
  String get featureMatrixRecallTitle => '機能マトリックス';

  @override
  String get featureMatrixRecallSubtitle => 'セルの形状と色の属性に関するクエリ プロンプトに答えます。';

  @override
  String get delayedMatchSampleTitle => '遅延マッチ';

  @override
  String get delayedMatchSampleSubtitle =>
      '数学の気を散らすものを解決した後、ターゲットのシンボルを一致させます。';

  @override
  String get symbolDigitAssocTitle => '記号と数字の関連付け';

  @override
  String get symbolDigitAssocSubtitle => '数字キーに一致する記号変換シートを解決します。';

  @override
  String get dualTaskMemoryTitle => 'デュアルタスクメモリ';

  @override
  String get dualTaskMemorySubtitle => '簡単な算術タスクを解決しながら単語セットを暗記します。';

  @override
  String get actionSequenceRecallTitle => 'アクションリコール';

  @override
  String get actionSequenceRecallSubtitle =>
      'キャラクター ジェスチャ アニメーション シーケンスを順番に繰り返します。';

  @override
  String get tangramPolygonTitle => 'タングラムフィット';

  @override
  String get tangramPolygonSubtitle => 'ポリゴン形状を配置してシルエットの輪郭を塗りつぶします。';

  @override
  String get mazeNav3DTitle => '3D迷路ナビ';

  @override
  String get mazeNav3DSubtitle => '一人称視点から 3D アイソメ迷路ルートをナビゲートします。';

  @override
  String get isometricProjectionTitle => 'アイソメトリックプロジェクター';

  @override
  String get isometricProjectionSubtitle => '3D ブロック図を正投影の 2D 上面/正面図に一致させます。';

  @override
  String get polyominoPackingTitle => 'ポリオミノパッキン';

  @override
  String get polyominoPackingSubtitle => 'ランダムなポリオミノ ブロック片をターゲット領域に詰め込みます。';

  @override
  String get spatialGridRotationTitle => '空間グリッドの回転';

  @override
  String get spatialGridRotationSubtitle => '軸座標に沿って回転された 3D ブロック配置を一致させます。';

  @override
  String get wireLoopGameTitle => 'ワイヤーループ';

  @override
  String get wireLoopGameSubtitle => '非接触で金属リングをワイヤー スプラインに沿ってドラッグします。';

  @override
  String get origamiUnfoldTitle => '折り紙を広げる';

  @override
  String get origamiUnfoldSubtitle => '折り畳んだシートを広げた後、パンチ穴のパターンを確認します。';

  @override
  String get ropeTangleSolverTitle => 'ロープアンタングラー';

  @override
  String get ropeTangleSolverSubtitle => 'ノードをドラッグして、交差線がゼロの平面グラフをレイアウトします。';

  @override
  String get gridFitTetrisTitle => 'グリッドフィットソルバー';

  @override
  String get gridFitTetrisSubtitle => '静的で不規則なブロックをコンテナの境界に合わせて配置します。';

  @override
  String get vectorGridAlignmentTitle => 'ベクトルの整列';

  @override
  String get vectorGridAlignmentSubtitle =>
      'シャドウ テンプレートのターゲットに合わせてシェイプを拡大縮小および回転します。';

  @override
  String get blockStackingPhysicsTitle => 'ブロックスタッキング';

  @override
  String get blockStackingPhysicsSubtitle => '不規則なブロックパネルを重力のバランスで積み重ねます。';

  @override
  String get crossSectionMatch3DTitle => '3D断面図';

  @override
  String get crossSectionMatch3DSubtitle =>
      '3D 形状から切り取られた 2D スライス ジオメトリを識別します。';

  @override
  String get symmetryPaintTitle => 'シンメトリーペイント';

  @override
  String get symmetryPaintSubtitle => '対称軸を横切って反射する鏡像セグメントを描画します。';

  @override
  String get rollingBlockBloxTitle => 'ローリングブロック';

  @override
  String get rollingBlockBloxSubtitle => 'ブロックのピースを転がしてターゲットのスロットに垂直に着地させます。';

  @override
  String get perspectiveShiftViewTitle => '視点の変更';

  @override
  String get perspectiveShiftViewSubtitle => '文字/単語が綴られるまでブロック クラスターを回転させます。';

  @override
  String get networkFlowSphericalTitle => 'ネットワークフロー';

  @override
  String get networkFlowSphericalSubtitle => 'ラッピング円筒座標上でグリッド フローを接続します。';

  @override
  String get layeredSilhouetteBlendTitle => 'シルエットブレンド';

  @override
  String get layeredSilhouetteBlendSubtitle =>
      'ターゲットの半透明の形状に合わせて色付きのレイヤーを重ねます。';

  @override
  String get wordWheelPangramTitle => '単語のアナグラム';

  @override
  String get wordWheelPangramSubtitle => 'ホイールから中央のターゲット文字を含む単語を作成します。';

  @override
  String get letterGridSwapperTitle => 'レタースワッパー';

  @override
  String get letterGridSwapperSubtitle => '隣接する文字タイルを交換して、行と列の単語を完成させます。';

  @override
  String get synonymMatchTitle => '同義語の一致';

  @override
  String get synonymMatchSubtitle => '該当する単語ターゲットを同義語または反意語と照合します。';

  @override
  String get vowelDropTitle => '母音のドロップ';

  @override
  String get vowelDropSubtitle => '母音を座標グリッドにドロップして単語を完成させます。';

  @override
  String get letterBalanceScaleTitle => 'ワードバランススケール';

  @override
  String get letterBalanceScaleSubtitle => '文字の値が重みのバランスをとる単語を綴ります。';

  @override
  String get wordChainShiritoriTitle => '単語連鎖';

  @override
  String get wordChainShiritoriSubtitle => '前の文字出力から始まる単語ループをリンクします。';

  @override
  String get affixBuilderTitle => 'アフィックスビルダー';

  @override
  String get affixBuilderSubtitle => '接頭辞/接尾辞を組み合わせてターゲット語彙を構築します。';

  @override
  String get decipherCrypticCluesTitle => '暗号解読者';

  @override
  String get decipherCrypticCluesSubtitle => '言葉遊びパズルを解き、スペルの謎を解読してください。';

  @override
  String get boggleWordSearchTitle => 'ボグルコネクト';

  @override
  String get boggleWordSearchSubtitle => '隣接する接続されたパスをたどって、隠された単語を見つけます。';

  @override
  String get idiomUnscrambleTitle => 'イディオムアンスクランブル';

  @override
  String get idiomUnscrambleSubtitle => 'スクランブルされた単語配列をイディオムの意味と一致するように配置します。';

  @override
  String get letterPyramidsTitle => '文字のピラミッド';

  @override
  String get letterPyramidsSubtitle => '層ごとに 1 つのアナグラム文字を追加してワードタワーを構築します。';

  @override
  String get soundAlikeHomophonesTitle => '同音異義語の一致';

  @override
  String get soundAlikeHomophonesSubtitle => '文の正しい同音異義語のスペルを特定します。';

  @override
  String get wordGridSudokuTitle => '単語数独';

  @override
  String get wordGridSudokuSubtitle => 'グリッド行に文字をテッセレーションして単語を形成します。';

  @override
  String get portmanteauFactoryTitle => 'かばん工場';

  @override
  String get portmanteauFactorySubtitle => '意味コンポーネントを結合して複合語を作成します。';

  @override
  String get codedCrosswordsCodeTitle => 'コードワードクロスワード';

  @override
  String get codedCrosswordsCodeSubtitle => '数字と文字のコードを一致させるグリッド クロスワードを解きます。';

  @override
  String get wordSnakeTrailTitle => 'ワードスネーク';

  @override
  String get wordSnakeTrailSubtitle => '主題の単語を綴った蛇のような文字跡をたどります。';

  @override
  String get typingRhythmSpeedTitle => '入力の流れ';

  @override
  String get typingRhythmSpeedSubtitle => 'メトロノームのリズムビートに合わせて語彙を入力します。';

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
