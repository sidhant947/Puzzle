// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'パズルハブ';

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
  String get verbalAnalogiesTitle => '類推マスター！';

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
      '指示に注意してください！「文字」と表示されたら単语の意味を一致させます。「色」と表示されたらインクの色を一致させます。集中力を試すため、ルールは頻繁に切り替わります。';

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
  String get topologyTitle => 'トポロジー';

  @override
  String get topologySubtitle =>
      'これらの図形はトポロジー的に同等ですか？（切ったり貼ったりせずに、一方を変形させて他方にできますか？）';

  @override
  String get topologyWinTitle => '幾何学の天才！';

  @override
  String get topologyWinMessage => '10個のトポロジー的なペアを正しく特定しました！';

  @override
  String get topologyScore => 'スコア： ';
}
