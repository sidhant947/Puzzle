// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Puzzle Hub';

  @override
  String get home => 'Trang chủ';

  @override
  String get settings => 'Cài đặt';

  @override
  String get playAgain => 'Chơi lại';

  @override
  String get playNext => 'Chơi tiếp';

  @override
  String get seeCompleted => 'Xem lại';

  @override
  String get finish => 'Kết thúc';

  @override
  String get congrats => 'Chúc mừng';

  @override
  String get perfectGradient => 'Chuyển màu hoàn hảo!';

  @override
  String get wellDone => 'Làm tốt lắm';

  @override
  String get timeUp => 'Hết giờ!';

  @override
  String get completed => 'Hoàn thành!';

  @override
  String get score => 'Điểm số';

  @override
  String get timeLeft => 'Thời gian';

  @override
  String get trials => 'Thử thách';

  @override
  String get numberRule => 'Quy tắc số';

  @override
  String get colorRule => 'Quy tắc màu';

  @override
  String get valid => 'Hợp lệ';

  @override
  String get invalid => 'Không hợp lệ';

  @override
  String get even => 'Chẵn';

  @override
  String get odd => 'Lẻ';

  @override
  String get red => 'Đỏ';

  @override
  String get green => 'Xanh lá';

  @override
  String get blue => 'Xanh dương';

  @override
  String get yes => 'Có';

  @override
  String get no => 'Không';

  @override
  String get trueLabel => 'Đúng';

  @override
  String get falseLabel => 'Sai';

  @override
  String get clear => 'Xóa';

  @override
  String get north => 'Bắc';

  @override
  String get south => 'Nam';

  @override
  String get east => 'Đông';

  @override
  String get west => 'Tây';

  @override
  String get target => 'Mục tiêu';

  @override
  String get moves => 'Lượt đi';

  @override
  String get trialMode => 'Chế độ thử thách';

  @override
  String get trialModeDescription =>
      'Giải 20 câu để kết thúc thay vì hẹn giờ 60 giây';

  @override
  String get appearance => 'Giao diện';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get gameplay => 'Cách chơi';

  @override
  String get supportUs => 'Hỗ trợ chúng tôi';

  @override
  String get systemLegal => 'Hệ thống & Pháp lý';

  @override
  String get games => 'Trò chơi';

  @override
  String get solvedToday => 'Đã giải hôm nay';

  @override
  String get searchGames => 'Tìm kiếm trò chơi...';

  @override
  String get readyToStart => 'SẴN SÀNG BẮT ĐẦU LUYỆN NÃO CHƯA?';

  @override
  String get greatStart => 'KHỞI ĐẦU TUYỆT VỜI! HÃY GIỮ VỮNG PHONG ĐỘ.';

  @override
  String get onFire => 'TUYỆT VỜI! NÃO BỘ CỦA BẠN ĐANG RẤT PHẤN KHÍCH.';

  @override
  String get incredible => 'KHÔNG THỂ TIN ĐƯỢC! BẠN LÀ BẬC THẦY CÂU ĐỐ.';

  @override
  String get noGamesMatch => 'KHÔNG CÓ TRÒ CHƠI NÀO KHỚP VỚI TÌM KIẾM';

  @override
  String get categoryAll => 'TẤT CẢ';

  @override
  String get categoryAttention => 'SỰ TẬP TRUNG';

  @override
  String get categoryLogic => 'LOGIC';

  @override
  String get categoryMath => 'TOÁN HỌC';

  @override
  String get categoryWord => 'TỪ VỰNG';

  @override
  String get categoryMemory => 'GHI NHỚ';

  @override
  String get categorySpatial => 'KHÔNG GIAN';

  @override
  String get themeLight => 'SÁNG';

  @override
  String get themeDark => 'TỐI';

  @override
  String get themeSystem => 'HỆ THỐNG';

  @override
  String get starOnGithub => 'Tặng sao trên GitHub';

  @override
  String get sponsorOnGithub => 'Tài trợ trên GitHub';

  @override
  String get privacyPolicy => 'Chính sách bảo mật';

  @override
  String get termsOfService => 'Điều khoản dịch vụ';

  @override
  String get licenses => 'Giấy phép';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return 'Bạn có $maxTries lượt để tìm từ có $wordLength chữ cái đang ẩn giấu.';
  }

  @override
  String wordFoundMessage(String word) {
    return 'Đã tìm thấy từ: $word';
  }

  @override
  String gameOverMessage(String word) {
    return 'Từ đó là: $word';
  }

  @override
  String get gameOver => 'Trò chơi kết thúc';

  @override
  String get crosswordTitle => 'Ô chữ';

  @override
  String get crosswordSubtitle =>
      'Hoàn thành lưới với các từ chính xác dựa trên gợi ý.';

  @override
  String get wordSearchTitle => 'Tìm từ';

  @override
  String get radicalRootsTitle => 'Căn thức';

  @override
  String get radicalRootsSubtitle =>
      'Tìm căn bậc hai hoặc căn bậc ba của số đã cho. Làm tròn đến số nguyên gần nhất nếu cần.';

  @override
  String get radicalRootsGoalReached => 'Đã đạt mục tiêu!';

  @override
  String get radicalRootsTimeUp => 'Hết giờ!';

  @override
  String radicalRootsScoreMessage(int score) {
    return 'Bạn đã tính đúng $score căn thức!';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return 'Hãy tiếp tục luyện tập! Bạn đã tính được $score căn thức.';
  }

  @override
  String get radicalRootsStart => 'Bắt đầu tính';

  @override
  String get radicalRootsDescription =>
      'Bạn có 60 giây để giải càng nhiều càng tốt.';

  @override
  String get radicalRootsBest => 'Kỷ lục';

  @override
  String get radicalRootsSeconds => '60 GIÂY';

  @override
  String get romanArithmeticTitle => 'Số La Mã';

  @override
  String get romanArithmeticSubtitle =>
      'Giải các phép tính cộng trừ bằng số La Mã.';

  @override
  String get romanArithmeticGoalReached => 'Cấp độ Centurion!';

  @override
  String get romanArithmeticTimeUp => 'Hết giờ!';

  @override
  String romanArithmeticScoreMessage(int score) {
    return 'Bạn đã giải được $score bài toán La Mã!';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return 'Veni, Vidi, Vici! Bạn đã giải được $score bài toán.';
  }

  @override
  String get romanArithmeticStart => 'Bắt đầu hành trình';

  @override
  String get romanArithmeticDescription =>
      'Chuyển đổi và giải toán. Bạn có 60 giây.';

  @override
  String get romanArithmeticBest => 'Kỷ lục';

  @override
  String get romanArithmeticSeconds => '60 GIÂY';

  @override
  String get wordSearchSubtitle =>
      'Tìm tất cả các từ ẩn trong lưới. Kéo để chọn.';

  @override
  String get missingVowelsTitle => 'Nguyên âm còn thiếu';

  @override
  String get missingVowelsSubtitle => 'Xác định từ khi các nguyên âm bị ẩn đi.';

  @override
  String get missingVowelsWin => 'Đã khôi phục nguyên âm!';

  @override
  String get missingVowelsHowToPlay =>
      'Một từ được hiển thị với các nguyên âm (A, E, I, O, U) bị ẩn. Hãy đoán từ đầy đủ!';

  @override
  String get wordScrambleTitle => 'Sắp xếp từ';

  @override
  String get wordScrambleSubtitle =>
      'Nhấn vào các chữ cái để sắp xếp lại thành từ đúng!';

  @override
  String get wordScrambleWin => 'Đã giải mã từ!';

  @override
  String get sudokuTitle => 'Sudoku';

  @override
  String get sudokuSubtitle =>
      'Hoàn thành lưới sao cho mỗi hàng, cột và ô 3x3 đều chứa các chữ số từ 1 đến 9.';

  @override
  String get minesweeperTitle => 'Dò mìn';

  @override
  String get minesweeperSubtitle =>
      'Xác định tất cả các quả mìn mà không làm chúng nổ.';

  @override
  String get minesweeperWin => 'Chiến thắng!';

  @override
  String get minesweeperMines => 'MÌN';

  @override
  String get minesweeperStatus => 'TRẠNG THÁI';

  @override
  String get minesweeperWon => 'THẮNG';

  @override
  String get minesweeperBoom => 'BÙM';

  @override
  String get minesweeperPlaying => 'ĐANG CHƠI';

  @override
  String get minesweeperReveal => 'MỞ Ô';

  @override
  String get minesweeperFlag => 'CẮM CỜ';

  @override
  String get game2048Title => '2048';

  @override
  String get game2048Subtitle =>
      'Vuốt theo bất kỳ hướng nào để gộp các ô và đạt đến ô 2048!';

  @override
  String get nonogramTitle => 'Nonogram';

  @override
  String get nonogramSubtitle =>
      'Khám phá hình ảnh ẩn giấu bằng các gợi ý logic.';

  @override
  String get nonogramWin => 'Đã hiện hình ảnh!';

  @override
  String get magnetsTitle => 'NAM CHÂM';

  @override
  String get magnetsSubtitle => 'Đặt nam châm vào lưới dựa trên số lượng cực.';

  @override
  String get magnetsHowToPlay =>
      'Đổ đầy các hộp chứa kích thước bằng quân domino bằng các nam châm \'+\' và \'-\' hoặc để trống. Các gợi ý ở hàng và cột xác định tổng số mỗi cực trong dòng đó. Các cực giống nhau không được nằm cạnh nhau theo chiều dọc hoặc ngang.';

  @override
  String get magnetsWinTitle => 'CÂN BẰNG PHÂN CỰC!';

  @override
  String get magnetsWinMessage =>
      'Tất cả các nam châm đã được sắp xếp hoàn hảo!';

  @override
  String get lighthousesTitle => 'NGỌN HẢI ĐĂNG';

  @override
  String get lighthousesSubtitle =>
      'Đặt tàu dựa trên các gợi ý từ ngọn hải đăng.';

  @override
  String get lighthousesHowToPlay =>
      'Đặt các con tàu 1x1 vào lưới. Ngọn hải đăng cho biết tổng số tàu có thể nhìn thấy theo chiều ngang và chiều dọc. Các tàu không được chạm vào ngọn hải đăng hoặc chạm vào nhau, kể cả theo đường chéo.';

  @override
  String get lighthousesWinTitle => 'BIỂN AN TOÀN!';

  @override
  String get lighthousesWinMessage =>
      'Tất cả các ngọn hải đăng đang dẫn đường cho các con tàu một cách hoàn hảo!';

  @override
  String get dominosaTitle => 'DOMINOSA';

  @override
  String get dominosaSubtitle => 'Tìm tất cả các quân domino ẩn trong lưới.';

  @override
  String get dominosaHowToPlay =>
      'Sắp xếp một bộ domino hoàn chỉnh trên một lưới các con số sao cho mỗi cặp số liền kề được bao phủ bởi đúng một quân domino. Mỗi cặp số chỉ tồn tại một lần trong bộ.';

  @override
  String get dominosaWinTitle => 'BẬC THẦY DOMINO!';

  @override
  String get dominosaWinMessage =>
      'Mọi quân domino đã được tìm thấy và đặt đúng chỗ!';

  @override
  String get skyscrapersTitle => 'NHÀ CHỌC TRỜI';

  @override
  String get skyscrapersSubtitle => 'Điền vào lưới độ cao của các tòa nhà.';

  @override
  String get skyscrapersHowToPlay =>
      'Điền vào lưới các độ cao (1-N) sao cho mỗi hàng và cột chứa mỗi độ cao đúng một lần. Các gợi ý ở các cạnh cho biết có bao nhiêu tòa nhà có thể nhìn thấy từ hướng đó, với các tòa nhà cao hơn sẽ che khuất các tòa nhà thấp hơn.';

  @override
  String get skyscrapersWinTitle => 'ĐƯỜNG CHÂN TRỜI ĐƯỢC KHÔI PHỤC!';

  @override
  String get skyscrapersWinMessage =>
      'Tất cả các tòa nhà đều được đặt ở vị trí hoàn hảo!';

  @override
  String get nurikabeTitle => 'NURIKABE';

  @override
  String get nurikabeSubtitle =>
      'Tạo thành một vùng biển kết nối và các hòn đảo tách biệt.';

  @override
  String get nurikabeHowToPlay =>
      'Tô bóng các ô để tạo thành một \'biển\' kết nối duy nhất (không có khối 2x2). Các ô không được tô bóng tạo thành các \'đảo\', mỗi đảo chứa đúng một con số biểu thị tổng diện tích của nó.';

  @override
  String get nurikabeWinTitle => 'BIỂN ĐANG CHẢY!';

  @override
  String get nurikabeWinMessage =>
      'Các hòn đảo đã được tách biệt, biển đã được kết nối!';

  @override
  String get fillominoTitle => 'FILLOMINO';

  @override
  String get fillominoSubtitle =>
      'Chia lưới thành các khối polyomino có kích thước quy định.';

  @override
  String get fillominoHowToPlay =>
      'Chia lưới thành các khối polyomino sao cho mỗi khối polyomino kích thước N chứa số N trong tất cả các ô của nó. Các khối polyomino có cùng kích thước không được nằm cạnh nhau theo chiều dọc hoặc ngang.';

  @override
  String get fillominoWinTitle => 'LƯỚI ĐÃ ĐƯỢC CHIA!';

  @override
  String get fillominoWinMessage => 'Được lấp đầy hoàn hảo bằng logic!';

  @override
  String get hitoriTitle => 'HITORI';

  @override
  String get hitoriSubtitle =>
      'Tô bóng các số trùng lặp trong mỗi hàng và cột.';

  @override
  String get hitoriHowToPlay =>
      'Tô bóng các ô sao cho không có con số nào xuất hiện quá một lần trong bất kỳ hàng hoặc cột nào. Các ô được tô bóng không được nằm cạnh nhau (theo chiều dọc hoặc ngang) và tất cả các ô không được tô bóng phải tạo thành một nhóm kết nối duy nhất.';

  @override
  String get hitoriWinTitle => 'BẬC THẦY HITORI!';

  @override
  String get hitoriWinMessage =>
      'Bạn đã giải quyết thành công tất cả các số trùng lặp!';

  @override
  String get pathFinderTitle => 'Tìm đường';

  @override
  String get pathFinderSubtitle => 'Tìm đường ẩn từ S đến E.';

  @override
  String get pathFinderWin => 'Đã tìm thấy đường!';

  @override
  String get howToPlay => 'Cách chơi';

  @override
  String get gotIt => 'Đã hiểu';

  @override
  String get akariTitle => 'Akari';

  @override
  String get akariSubtitle => 'Thắp sáng tất cả các ô trắng';

  @override
  String get akariHowToPlay =>
      'Đặt bóng đèn vào các ô trắng để thắp sáng toàn bộ lưới. Bóng đèn thắp sáng hàng và cột của chúng cho đến khi chạm tường. Hai bóng đèn không được chiếu sáng lẫn nhau. Các bức tường có số cho biết chính xác có bao nhiêu bóng đèn phải được đặt ở các ô liền kề (trên, dưới, trái, phải).';

  @override
  String get akariWinTitle => 'ĐÃ THẮP SÁNG!';

  @override
  String get akariWinMessage => 'Mọi thứ đã được thắp sáng hoàn hảo.';

  @override
  String get arithmeticChainTitle => 'Tính nhẩm chuỗi';

  @override
  String get arithmeticChainSubtitle => 'Tính tổng cộng dồn trong đầu';

  @override
  String get arithmeticChainWinTitle => 'LÊN CẤP!';

  @override
  String get arithmeticChainWinMessage =>
      'Khả năng tính nhẩm của bạn thật sắc bén!';

  @override
  String get arithmeticChainLoseTitle => 'THỬ LẠI';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return 'Đáp án đúng là $answer.';
  }

  @override
  String get arithmeticChainStart => 'BẮT ĐẦU';

  @override
  String get arithmeticChainNext => 'TIẾP THEO';

  @override
  String get attentionalBlinkTitle => 'Chớp mắt chú ý';

  @override
  String get attentionalBlinkSubtitleWatch => 'QUAN SÁT CÁC CON SỐ';

  @override
  String get attentionalBlinkSubtitleInput => 'NHẬP HAI CON SỐ BẠN ĐÃ THẤY';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return 'Bạn đã ghi được $score mục tiêu!';
  }

  @override
  String get balanceScaleTitle => 'CÂN THĂNG BẰNG';

  @override
  String get balanceScaleSubtitle =>
      'Suy luận trọng lượng của vật cuối cùng dựa trên các bàn cân.';

  @override
  String get balanceScaleWinTitle => 'THĂNG BẰNG!';

  @override
  String get balanceScaleWinMessage => 'Bạn đã suy luận đúng trọng lượng!';

  @override
  String get balanceScaleLoseTitle => 'MẤT THĂNG BẰNG';

  @override
  String get balanceScaleLoseMessage =>
      'Hãy thử lại để tìm sự cân bằng chính xác.';

  @override
  String get balanceScaleBack => 'QUAY LẠI';

  @override
  String get balanceScaleSubmit => 'XÁC NHẬN';

  @override
  String get binaryPuzzleTitle => 'CÂU ĐỐ NHỊ PHÂN';

  @override
  String get binaryPuzzleSubtitle =>
      'Điền 0 và 1. Tối đa hai chữ số giống nhau đứng cạnh nhau. Số lượng 0 và 1 bằng nhau trong mỗi hàng và cột.';

  @override
  String get binaryPuzzleWinTitle => 'LÀM TỐT LẮM';

  @override
  String get binaryPuzzleWinMessage =>
      'Bạn đã giải câu đố nhị phân với logic hoàn hảo!';

  @override
  String get blockEscapeTitle => 'KHỐI THOÁT HIỂM';

  @override
  String get blockEscapeSubtitle =>
      'Trượt các khối để dọn đường cho khối chính đi đến lối thoát.';

  @override
  String get blockEscapeWinTitle => 'THOÁT HIỂM!';

  @override
  String get blockEscapeWinMessage =>
      'Bạn đã dọn đường thành công cho khối chính!';

  @override
  String get boxCompletionTitle => 'Hoàn thành hộp';

  @override
  String get boxCompletionSubtitle =>
      'Hình lập phương nào có thể được tạo thành?';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return 'Bạn đã trả lời đúng $score trên tổng số $totalTrials câu!';
  }

  @override
  String get boxCompletionOptions => 'LỰA CHỌN';

  @override
  String get bridgesTitle => 'CÂY CẦU';

  @override
  String get bridgesSubtitle =>
      'Nối các hòn đảo bằng những cây cầu. Mỗi hòn đảo cần một số lượng cầu nhất định. Các cây cầu không được chồng chéo lên nhau.';

  @override
  String get bridgesWinTitle => 'ĐÃ KẾT NỐI!';

  @override
  String get bridgesWinMessage =>
      'Bạn đã kết nối thành công tất cả các hòn đảo!';

  @override
  String get calculationSprintTitle => 'TÍNH TOÁN NHANH';

  @override
  String get calculationSprintSubtitle =>
      'Giải càng nhiều phép tính càng tốt trong 60 giây.';

  @override
  String get calculationSprintGoalReached => 'ĐÃ ĐẠT MỤC TIÊU!';

  @override
  String get calculationSprintTimeUp => 'HẾT GIỜ';

  @override
  String calculationSprintScoreMessage(int score) {
    return 'Tốc độ tính toán tuyệt vời! Bạn ghi được $score điểm.';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return 'Bạn ghi được $score điểm. Hãy cố gắng vượt qua kỷ lục của mình!';
  }

  @override
  String get calculationSprintBest => 'KỶ LỤC';

  @override
  String get calculationSprintSeconds => '60 GIÂY';

  @override
  String get calculationSprintDescription =>
      'Giải các phép tính nhanh chóng.\nĐáp án sai sẽ bị trừ 3 giây!';

  @override
  String get calculationSprintStart => 'BẮT ĐẦU CHẠY ĐUA';

  @override
  String get categoryFluencyTitle => 'Sự nhạy bén từ vựng';

  @override
  String get categoryFluencySubtitle => 'Nhập các mục thuộc về danh mục';

  @override
  String get categoryFluencyExpert => 'CHUYÊN GIA NGÔN NGỮ!';

  @override
  String get categoryFluencyTimeUp => 'HẾT GIỜ!';

  @override
  String get categoryFluencyWinMessage => 'Bạn có vốn từ vựng thật phong phú!';

  @override
  String categoryFluencyFoundMessage(int count) {
    return 'Bạn đã tìm được $count từ.';
  }

  @override
  String get categoryFluencyCategoryLabel => 'Danh mục:';

  @override
  String get categoryFluencyEnterItem => 'Nhập một mục...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target từ';
  }

  @override
  String get changeBlindnessTitle => 'Mù thay đổi';

  @override
  String get changeBlindnessSubtitle => 'TÌM KIẾM CHI TIẾT THAY ĐỔI';

  @override
  String changeBlindnessScore(int score) {
    return 'ĐIỂM: $score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return 'Bạn đã tìm thấy $score sự thay đổi!';
  }

  @override
  String get choiceRtTitle => 'Thời gian phản ứng';

  @override
  String get choiceRtSubtitle =>
      'Nhấn vào ô vuông đang hoạt động nhanh nhất có thể';

  @override
  String choiceRtAvgMessage(String avg) {
    return 'Thời gian phản ứng trung bình của bạn: ${avg}ms';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return 'Thời gian còn lại: ${time}s';
  }

  @override
  String choiceRtTaps(int count) {
    return 'Số lần nhấn: $count';
  }

  @override
  String get colorFloodTitle => 'Tràn màu';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return 'Lượt đi: $moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => 'TRÀN MÀU THÀNH CÔNG!';

  @override
  String get colorFloodDryLand => 'VÙNG ĐẤT KHÔ CẰN...';

  @override
  String get colorFloodWinMessage => 'Bạn đã phủ kín lưới bằng màu sắc!';

  @override
  String get colorFloodLoseMessage => 'Bạn đã hết lượt đi. Hãy thử lại!';

  @override
  String get colorMatchTitle => 'PHỐI MÀU';

  @override
  String get colorMatchSubtitle =>
      'Điều chỉnh các thanh trượt để khớp với màu mục tiêu nhất có thể.';

  @override
  String get colorMatchTarget => 'MỤC TIÊU';

  @override
  String get colorMatchYours => 'CỦA BẠN';

  @override
  String get colorMatchCheck => 'KIỂM TRA ĐỘ KHỚP';

  @override
  String get colorMatchResult => 'KẾT QUẢ';

  @override
  String colorMatchAccuracy(String accuracy) {
    return 'Độ chính xác của bạn: $accuracy%';
  }

  @override
  String get corsiBlocksTitle => 'KHỐI CORSI';

  @override
  String get corsiBlocksSubtitle =>
      'Quan sát các khối phát sáng và nhấn vào chúng theo đúng thứ tự.';

  @override
  String get corsiBlocksWinTitle => 'BẬC THẦY KHÔNG GIAN!';

  @override
  String get corsiBlocksLoseTitle => 'LẠC TRONG KHÔNG GIAN';

  @override
  String corsiBlocksMessage(int score, int span) {
    return 'Bạn đã nhớ được $score chuỗi! Khả năng ghi nhớ không gian của bạn đạt mức $span.';
  }

  @override
  String get corsiBlocksWatch => 'QUAN SÁT MẪU';

  @override
  String get corsiBlocksRepeat => 'LẶP LẠI MẪU';

  @override
  String get corsiBlocksExcellent => 'TUYỆT VỜI!';

  @override
  String get corsiBlocksSpan => 'MỨC ĐỘ';

  @override
  String get crownTitle => 'VƯƠNG MIỆN';

  @override
  String get crownSubtitle =>
      'Đặt một vương miện vào mỗi hàng, cột và vùng màu. Các vương miện không được nằm cạnh nhau, kể cả theo đường chéo.';

  @override
  String get crownCrowned => 'ĐÃ ĐẶT VƯƠNG MIỆN!';

  @override
  String get crownSuccess =>
      'Tất cả vương miện đã được đặt thành công với logic hoàn hảo.';

  @override
  String get cryptogramTitle => 'MẬT MÃ';

  @override
  String get cryptogramSubtitle =>
      'Gán các chữ cái để giải mã thông điệp bí mật! Mỗi chữ cái được mã hóa đại diện cho một chữ cái thực.';

  @override
  String get cryptogramBroken => 'ĐÃ PHÁ MẬT MÃ!';

  @override
  String get cryptogramEncrypted => 'ĐÃ MÃ HÓA';

  @override
  String get cryptogramSuccess =>
      'Bạn đã giải mã thông điệp một cách hoàn hảo.';

  @override
  String get cryptogramTryAgain => 'Hãy thử lại để phá mã.';

  @override
  String get digitSpanReverseTitle => 'Chuỗi số ngược';

  @override
  String get digitSpanReverseSubtitleMemorize => 'Ghi nhớ các chữ số';

  @override
  String get digitSpanReverseSubtitleEnter =>
      'Nhập các chữ số theo thứ tự NGƯỢC LẠI';

  @override
  String get digitSpanReverseWinTitle => 'LÊN CẤP!';

  @override
  String get digitSpanReverseWinMessage =>
      'Trí nhớ ngắn hạn của bạn thật ấn tượng!';

  @override
  String get digitSpanReverseLoseTitle => 'THỬ LẠI';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return 'Chuỗi ngược chính xác là $sequence.';
  }

  @override
  String get dividedAttentionTitle => 'Sự tập trung phân tán';

  @override
  String get dividedAttentionSubtitle =>
      'Nhấn TRÁI cho SAO ⭐ | Nhấn PHẢI cho ĐỎ 🔴';

  @override
  String get dividedAttentionGameOverTitle => 'MẤT TẬP TRUNG';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return 'Làm nhiều việc cùng lúc thật khó! Điểm của bạn là $score.';
  }

  @override
  String dividedAttentionScore(int score) {
    return 'ĐIỂM: $score';
  }

  @override
  String get doubleNBackTitle => 'Double N-Back';

  @override
  String doubleNBackSubtitle(int n) {
    return 'Khớp các kích thích từ $n bước trước';
  }

  @override
  String get doubleNBackGameOverTitle => 'TRÒ CHƠI KẾT THÚC';

  @override
  String doubleNBackGameOverMessage(int score) {
    return 'Bạn đã ghi được $score điểm trong Double N-Back!';
  }

  @override
  String doubleNBackScore(int score) {
    return 'Điểm: $score';
  }

  @override
  String get doubleNBackPositionMatch => 'KHỚP VỊ TRÍ';

  @override
  String get doubleNBackLetterMatch => 'KHỚP CHỮ CÁI';

  @override
  String get faceNameAssociationTitle => 'Nhớ mặt và tên';

  @override
  String get faceNameAssociationSubtitleStudy =>
      'Ghi nhớ tên cho từng khuôn mặt';

  @override
  String get faceNameAssociationSubtitleTest => 'Đây là ai?';

  @override
  String get faceNameAssociationPerfect => 'HOÀN HẢO!';

  @override
  String get faceNameAssociationGameOver => 'TRÒ CHƠI KẾT THÚC';

  @override
  String get faceNameAssociationWinMessage =>
      'Bạn có trí nhớ tuyệt vời về khuôn mặt và tên gọi!';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return 'Bạn đã trả lời đúng $correct trên tổng số $total câu.';
  }

  @override
  String get faceNameAssociationStartTest => 'BẮT ĐẦU KIỂM TRA';

  @override
  String get flankerTestWinTitle => 'TẬP TRUNG CAO ĐỘ!';

  @override
  String get flankerTestLoseTitle => 'BỊ XAO NHÃNG';

  @override
  String flankerTestScoreMessage(int score) {
    return 'Bạn đã trả lời đúng $score câu!';
  }

  @override
  String get flankerTestTitle => 'BÀI KIỂM TRA FLANKER';

  @override
  String get flankerTestSubtitle =>
      'Chỉ ra hướng của mũi tên trung tâm, bỏ qua các mũi tên hai bên.';

  @override
  String get flankerTestLeft => 'TRÁI';

  @override
  String get flankerTestRight => 'PHẢI';

  @override
  String get fractionMatchTitle => 'Khớp phân số';

  @override
  String get fractionMatchSubtitle => 'Khớp hình ảnh với phân số tương ứng';

  @override
  String get fractionMatchLoseTitle => 'PHÂN SỐ KHÔNG KHỚP';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return 'Đáp án đúng là $correctAnswer.';
  }

  @override
  String get goNoGoTitle => 'Go / No-Go';

  @override
  String get goNoGoSubtitle => 'Nhấn khi hiện màu Xanh, BỎ QUA màu Đỏ!';

  @override
  String get goNoGoLoseTitle => 'PHẢN ỨNG ĐÃ DỪNG';

  @override
  String get goNoGoLoseMessage =>
      'Khả năng kiểm soát ức chế của bạn đang được thử thách!';

  @override
  String get goNoGoTapAnywhere => 'NHẤN VÀO BẤT CỨ ĐÂU ĐỂ BẮT ĐẦU';

  @override
  String get groceryListTitle => 'Danh sách mua sắm';

  @override
  String get groceryListSubtitleMemorize =>
      'Ghi nhớ các mục và danh mục của chúng';

  @override
  String get groceryListSubtitleTest => 'Mục này thuộc về danh mục nào?';

  @override
  String get groceryListWinTitle => 'BẬC THẦY MUA SẮM!';

  @override
  String get groceryListLoseTitle => 'QUÊN GÌ ĐÓ SAO?';

  @override
  String groceryListScoreMessage(int score) {
    return 'Bạn đã ghi được $score điểm trong Danh sách mua sắm!';
  }

  @override
  String get groceryListReady => 'TÔI ĐÃ SẴN SÀNG';

  @override
  String get groceryListWhereBelong => 'MỤC NÀY THUỘC VỀ ĐÂU?';

  @override
  String get hueSortTitle => 'SẮP XẾP TÔNG MÀU';

  @override
  String get hueSortSubtitle =>
      'Hoán đổi các ô để tạo ra sự chuyển màu mượt mà giữa các màu ở góc. Các chấm biểu thị các ô cố định.';

  @override
  String get hueSortWinTitle => 'CHUYỂN MÀU HOÀN HẢO!';

  @override
  String get hueSortWinMessage =>
      'Bạn đã sắp xếp quang phổ màu một cách hoàn hảo!';

  @override
  String hueSortWrongTiles(int count) {
    return 'Số ô sai vị trí: $count';
  }

  @override
  String get kenkenTitle => 'KenKen';

  @override
  String get kenkenWinTitle => 'THIÊN TÀI!';

  @override
  String get kenkenLoseTitle => 'TRÒ CHƠI KẾT THÚC';

  @override
  String get kenkenWinMessage => 'Bạn đã giải được câu đố KenKen!';

  @override
  String get kenkenLoseMessage => 'Hãy kiểm tra quy tắc hàng/cột và lồng.';

  @override
  String kenkenSubtitle(int size) {
    return 'Điền từ 1-$size mà không lặp lại trong hàng/cột';
  }

  @override
  String get letterCancellationTitle => 'Hủy chữ cái';

  @override
  String get letterCancellationTitleFull => 'Bài kiểm tra Hủy chữ cái';

  @override
  String letterCancellationScoreMessage(int score) {
    return 'Bạn đã tìm thấy $score chữ cái!';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return 'Tìm tất cả các chữ cái \"$target\"';
  }

  @override
  String get letterCancellationFound => 'ĐÃ TÌM THẤY';

  @override
  String get letterCancellationTime => 'THỜI GIAN';

  @override
  String get lightsOutTitle => 'TẮT ĐÈN';

  @override
  String get lightsOutSubtitle =>
      'Nhấn vào một ô sẽ đảo ngược trạng thái của nó và các ô lân cận. Tắt tất cả đèn để giải câu đố.';

  @override
  String get lightsOutWinTitle => 'CÂU ĐỐ ĐÃ ĐƯỢC GIẢI!';

  @override
  String get lightsOutWinMessage => 'Bạn đã tắt tất cả đèn thành công!';

  @override
  String get symmetryTitle => 'Đối xứng';

  @override
  String get symmetrySubtitle =>
      'Phản chiếu mẫu bên trái sang lưới trống bên phải.';

  @override
  String get semanticLinkTitle => 'Liên kết ngữ nghĩa';

  @override
  String get semanticLinkSubtitle => 'Tìm từ kết nối cả ba từ đã cho';

  @override
  String get reflexTapTitle => 'Nhấn phản xạ';

  @override
  String get visualStatisticalLearningTitle => 'Trò chơi kết thúc';

  @override
  String get orbitTapTitle => 'Nhấn theo quỹ đạo';

  @override
  String get orbitTapSubtitle => 'Nhấn khi các quả bóng thẳng hàng với cổng';

  @override
  String get schulteTableTitle => 'Tập trung tuyệt vời!';

  @override
  String get multipleObjectTrackingTitle => 'Theo dõi đối tượng';

  @override
  String get multipleObjectTrackingSubtitle =>
      'Quan sát các đối tượng được làm nổi bật. Theo dõi chúng khi chúng di chuyển, sau đó chọn chúng.';

  @override
  String get sdmtTitle => 'Bài kiểm tra SDMT';

  @override
  String get sdmtSubtitle =>
      'Sử dụng bảng mã ở trên để tìm chữ số cho ký hiệu được hiển thị.';

  @override
  String get memoryMatrixTitle => 'Đã đạt mục tiêu!';

  @override
  String get memoryMatrixSubtitle => 'Ghi nhớ mẫu và nhấn vào các ô.';

  @override
  String get mentalAbacusTitle => 'Bậc thầy bàn tính!';

  @override
  String get mentalAbacusSubtitle => 'Giải toán bằng bàn tính Soroban';

  @override
  String get spellingSprintTitle => 'Chạy đua chính tả';

  @override
  String get spellingSprintSubtitle =>
      'Chạy đua với thời gian để đánh vần càng nhiều từ càng tốt.';

  @override
  String get stopSignalTitle => 'Tín hiệu dừng';

  @override
  String get stopSignalSubtitle =>
      'Nhấn theo hướng mũi tên, nhưng DỪNG LẠI ngay lập tức nếu mũi tên chuyển sang màu ĐỎ.';

  @override
  String get staircaseMemoryTitle => 'Trí nhớ bậc thang';

  @override
  String get vigilanceTaskTitle => 'Nhiệm vụ cảnh giác';

  @override
  String get vigilanceTaskSubtitle =>
      'Nhấn nút khi kim đồng hồ nhảy qua một vị trí';

  @override
  String get logicalSyllogismsTitle => 'Tam đoạn luận logic';

  @override
  String get logicalSyllogismsSubtitle =>
      'Kết luận có hợp lệ về mặt logic không?';

  @override
  String get mathPathTitle => 'Đường dẫn toán học';

  @override
  String get mathPathSubtitle =>
      'Tìm một con đường có tổng các số đúng bằng mục tiêu.';

  @override
  String get sternbergTaskTitle => 'Nhiệm vụ Sternberg';

  @override
  String get sternbergTaskMemorize => 'Ghi nhớ các chữ cái';

  @override
  String get sternbergTaskWasLetterSet =>
      'Chữ cái này có trong bộ vừa rồi không?';

  @override
  String sternbergTaskScore(int score) {
    return 'Bạn đã ghi được $score điểm trong Nhiệm vụ Sternberg!';
  }

  @override
  String get verbalAnalogiesTitle => 'Bậc thầy ẩn dụ!';

  @override
  String get verbalAnalogiesSubtitle => 'Hoàn thành mối quan hệ';

  @override
  String get typingSpeedTitle => 'Tốc độ đánh máy';

  @override
  String get typingSpeedSubtitle =>
      'Gõ cụm từ chính xác như hiển thị nhanh nhất có thể!';

  @override
  String get wordLadderTitle => 'Thang từ vựng';

  @override
  String get wordLadderSubtitle =>
      'Kết nối các từ bằng cách thay đổi từng chữ cái một.';

  @override
  String get tangleFixTitle => 'Đã gỡ rối!';

  @override
  String get tangleFixSubtitle =>
      'Gỡ rối các đường thẳng sao cho không có đường nào giao nhau';

  @override
  String get oddRotationTitle => 'Xoay hình khác biệt';

  @override
  String get oddRotationSubtitle =>
      'Một trong những hình này bị phản chiếu. Bạn có tìm thấy nó không?';

  @override
  String get towerOfLondonTitle => 'Tháp London';

  @override
  String get towerOfLondonSubtitle => 'Khớp với cấu hình mục tiêu';

  @override
  String get symbolicFlankerTitle => 'Flanker ký hiệu';

  @override
  String get symbolicFlankerSubtitle => 'Tập trung vào ký hiệu trung tâm';

  @override
  String get stroopTestTitle => 'Bài kiểm tra Stroop';

  @override
  String get stroopTestSubtitle =>
      'Xác định màu mực của từ được hiển thị. Bỏ qua ý nghĩa của từ đó!';

  @override
  String get wisconsinCardSortingTitle => 'Trò chơi kết thúc';

  @override
  String get wisconsinCardSortingSubtitle =>
      'KHỚP THẺ VỚI MỘT TRONG BỐN THẺ Ở TRÊN';

  @override
  String get nBackTitle => 'Bài kiểm tra N-Back';

  @override
  String get nBackSubtitle =>
      'Nhấn KHỚP nếu chữ cái hiện tại khớp với chữ cái đã hiển thị 2 bước trước.';

  @override
  String get rhythmMasterTitle => 'Bậc thầy nhịp điệu';

  @override
  String get rhythmMasterSubtitle => 'Nhấn đồng bộ với nhịp xung';

  @override
  String get pixelMimicTitle => 'Bắt chước điểm ảnh';

  @override
  String get targetNumberTitle => 'Mục tiêu 24';

  @override
  String targetNumberSubtitle(int target) {
    return 'Sử dụng cả 4 số để đạt được kết quả $target';
  }

  @override
  String get mirrorTracingTitle => 'Vẽ ngược hoàn hảo!';

  @override
  String get mirrorTracingSubtitle =>
      'Vẽ theo hình ngôi sao! Các điều khiển bị PHẢN CHIẾU.';

  @override
  String get wordSurgeTitle => 'Từ vựng bùng nổ';

  @override
  String get wordSurgeSubtitle => 'Từ đồng nghĩa & Từ trái nghĩa';

  @override
  String get perspectiveTakingTitle => 'Thay đổi góc nhìn';

  @override
  String get perspectiveTakingTopDownView => 'NHÌN TỪ TRÊN XUỐNG';

  @override
  String get perspectiveTakingChoosePerspective => 'CHỌN GÓC NHÌN';

  @override
  String get perspectiveTakingCongrats =>
      'Bạn có cái nhìn sắc bén về các mối quan hệ không gian.';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return 'Góc nhìn nào là từ hướng $targetDirName?';
  }

  @override
  String get paperFoldingTitle => 'Gấp giấy hoàn hảo!';

  @override
  String get paperFoldingSubtitle => 'Nó sẽ trông như thế nào khi mở ra?';

  @override
  String get waterSortTitle => 'Làm tốt lắm!';

  @override
  String get waterSortSubtitle =>
      'Sắp xếp màu sắc sao cho mỗi ống chỉ chứa một màu duy nhất.';

  @override
  String get numericalEstimationTitle => 'Ước lượng con số';

  @override
  String get numericalEstimationSubtitle =>
      'Chọn câu trả lời gần đúng nhất thật nhanh!';

  @override
  String get lockPatternTitle => 'Mẫu khóa';

  @override
  String get lockPatternSubtitle =>
      'Tìm mẫu hình bí mật. Mỗi lần đoán sẽ nhận được phản hồi về vị trí và các chấm.';

  @override
  String get primeHunterTitle => 'Săn số nguyên tố';

  @override
  String get primeHunterSubtitle =>
      'Vuốt TRÁI cho SỐ NGUYÊN TỐ | Vuốt PHẢI cho HỢP SỐ';

  @override
  String get tracePathTitle => 'Vẽ theo đường dẫn';

  @override
  String get tracePathSubtitle =>
      'Vẽ theo đường dẫn mục tiêu chính xác nhất có thể';

  @override
  String get ruleSwitcherTitle => 'Chuyển đổi quy tắc';

  @override
  String get ruleSwitcherSubtitle => 'Áp dụng quy tắc hiện tại';

  @override
  String get choiceReactionTimeTitle => 'Thời gian phản ứng lựa chọn';

  @override
  String get pathRecallTitle => 'Nhớ lại đường đi';

  @override
  String get switchTaskTitle => 'Chuyển đổi nhiệm vụ';

  @override
  String get switchTaskSubtitle =>
      'Chú ý quy tắc! Nó sẽ chuyển đổi giữa việc khớp hình dạng và khớp màu sắc.';

  @override
  String get mentalRotationTitle => 'Xoay vật thể trong tâm trí';

  @override
  String get mentalRotationSubtitle =>
      'Những hình này có giống nhau không, chỉ là bị xoay đi?';

  @override
  String get missingOperatorTitle => 'Toán tử hỗn hợp';

  @override
  String get missingOperatorSubtitle =>
      'Điền vào chỗ trống để hoàn thành phép tính';

  @override
  String get wordMastermindTitle => 'Bậc thầy từ ngữ';

  @override
  String get wordMastermindSubtitle =>
      'Giải mã mã gồm 4 chữ cái! Bulls (B) là đúng vị trí, Cows (C) là sai vị trí.';

  @override
  String get simonSequenceTitle => 'Chuỗi Simon';

  @override
  String get symbolLogicTitle => 'Logic ký hiệu';

  @override
  String get symbolLogicSubtitle =>
      'Giải các phép tính hình ảnh để tìm giá trị của mỗi ký hiệu. Kết quả của phép tính cuối cùng là gì?';

  @override
  String get silhouetteMatchTitle => 'Đã khớp!';

  @override
  String get silhouetteMatchSubtitle => 'Hình bóng nào khớp với đối tượng này?';

  @override
  String get operationSpanTitle => 'Phạm vi hoạt động';

  @override
  String get operationSpanMathPhase => 'Phép tính có đúng không?';

  @override
  String get operationSpanLetterPhase => 'Ghi nhớ chữ cái';

  @override
  String get operationSpanRecallPhase => 'Nhớ lại các chữ cái theo thứ tự';

  @override
  String get operationSpanRoundComplete => 'Hoàn thành vòng chơi!';

  @override
  String operationSpanScore(int score) {
    return 'Bạn đã ghi được $score điểm trong Phạm vi hoạt động!';
  }

  @override
  String get slidePuzzleTitle => 'Trò chơi trượt ô';

  @override
  String get slidePuzzleNewGame => 'TRÒ CHƠI MỚI';

  @override
  String get slidePuzzleInstructions =>
      'Sắp xếp các ô theo thứ tự số bằng cách trượt chúng vào ô trống.';

  @override
  String get slidePuzzleTileSlider => 'TRƯỢT Ô';

  @override
  String get slidePuzzleCongrats => 'Bạn đã sắp xếp thành công tất cả các ô.';

  @override
  String get visualSearchTitle => 'Tìm kiếm hình ảnh';

  @override
  String get visualSearchSubtitle => 'Tìm ký hiệu duy nhất trong lưới';

  @override
  String get trailMakingTitle => 'Nối điểm';

  @override
  String get trailMakingSubtitle =>
      'Nối các con số theo thứ tự (1 -> 2 -> 3...) nhanh nhất có thể.';

  @override
  String get matrixReasoningTitle => 'Suy luận ma trận';

  @override
  String get matrixReasoningSubtitle => 'Hoàn thành mẫu trong lưới 3x3';

  @override
  String get tentsAndTreesTitle => 'Lều & Cây';

  @override
  String get tentsAndTreesSubtitle =>
      'Đặt lều cạnh cây. Các con số cho biết có bao nhiêu lều trong mỗi hàng/cột. Các lều không được chạm vào nhau.';

  @override
  String get quickMathTitle => 'Toán nhanh';

  @override
  String get magicSquaresTitle => 'Ô vuông ma thuật';

  @override
  String magicSquaresSubtitle(int targetSum) {
    return 'Mỗi hàng, cột và đường chéo phải có tổng bằng $targetSum';
  }

  @override
  String get objectShuffleTitle => 'Xáo trộn đối tượng';

  @override
  String get pipesTitle => 'Đường ống';

  @override
  String get pipesSubtitle => 'Nối các điểm cùng màu bằng đường ống.';

  @override
  String get oddOneOutTitle => 'Tìm điểm khác biệt';

  @override
  String get oddOneOutSubtitle => 'Tìm ô có màu sắc khác biệt.';

  @override
  String get einsteinRiddleTitle => 'CÂU ĐỐ EINSTEIN';

  @override
  String get einsteinRiddleSubtitle =>
      'Sử dụng các gợi ý để suy luận thuộc tính của từng ngôi nhà.';

  @override
  String get einsteinRiddleHowToPlay =>
      'Mỗi ngôi nhà có các thuộc tính duy nhất (màu sắc, quốc tịch, thú cưng, v.v.). Sử dụng các gợi ý được cung cấp để điền vào lưới và tìm ra lời giải đầy đủ.';

  @override
  String get einsteinRiddleColor => 'Màu sắc';

  @override
  String get einsteinRiddleNationality => 'Quốc tịch';

  @override
  String get einsteinRiddleDrink => 'Đồ uống';

  @override
  String get einsteinRiddlePet => 'Thú cưng';

  @override
  String get einsteinRiddleSmoke => 'Thuốc lá';

  @override
  String get einsteinRiddleHouse => 'Ngôi nhà';

  @override
  String get mirrorImageTitle => 'Hình ảnh qua gương';

  @override
  String get mirrorImageSubtitle =>
      'Xác định hình ảnh phản chiếu chính xác qua gương.';

  @override
  String get mirrorImageHowToPlay =>
      'Nhìn vào hình dạng và chọn hình ảnh phản chiếu qua gương chính xác của nó từ các lựa chọn được cung cấp.';

  @override
  String get mentalMappingTitle => 'Bản đồ trong tâm trí';

  @override
  String get mentalMappingSubtitle => 'Làm theo hướng dẫn và tìm điểm đến.';

  @override
  String get mentalMappingHowToPlay =>
      'Bạn sẽ được hiển thị một chuỗi các hướng (Bắc, Nam, Đông, Tây). Hãy làm theo các bước này trong đầu bắt đầu từ tâm của lưới và chọn điểm đến cuối cùng.';

  @override
  String get memoryPalaceTitle => 'Cung điện ký ức';

  @override
  String get memoryPalaceSubtitle => 'Ghi nhớ từ nào ở vị trí nào.';

  @override
  String get memoryPalaceHowToPlay =>
      'Một tập hợp các từ sẽ xuất hiện ở các vị trí khác nhau trên lưới. Hãy ghi nhớ vị trí của chúng. Sau đó, bạn sẽ được yêu cầu đặt các từ trở lại vị trí ban đầu của chúng.';

  @override
  String get countingSheepTitle => 'Đếm cừu';

  @override
  String get countingSheepSubtitle => 'Bạn đã thấy bao nhiêu con cừu?';

  @override
  String get countingSheepHowToPlay =>
      'Cừu sẽ chạy qua màn hình nhanh chóng. Hãy đếm chúng khi chúng đi qua và nhập tổng số vào cuối trò chơi.';

  @override
  String get faceTraitAssociationTitle => 'Nhớ mặt và đặc điểm';

  @override
  String get faceTraitAssociationSubtitle =>
      'Ghi nhớ các đặc điểm cho từng khuôn mặt';

  @override
  String get faceTraitAssociationHowToPlay =>
      'Bạn sẽ được xem một vài khuôn mặt, mỗi khuôn mặt đi kèm với tên, nghề nghiệp và sở thích. Hãy ghi nhớ những mối liên hệ này. Sau đó, bạn sẽ được yêu cầu nhớ lại các đặc điểm cụ thể cho từng khuôn mặt.';

  @override
  String get mentalCalendarTitle => 'Lịch trong tâm trí';

  @override
  String get mentalCalendarSubtitle => 'Tính toán thứ trong tuần';

  @override
  String get mentalCalendarHowToPlay =>
      'Một ngày ngẫu nhiên sẽ được hiển thị. Sử dụng tính toán trong đầu (hoặc thuật toán Doomsday) để xác định xem ngày đó rơi vào thứ mấy trong tuần.';

  @override
  String get vocabularyBuilderTitle => 'Xây dựng vốn từ';

  @override
  String get vocabularyBuilderSubtitle =>
      'Khớp các từ đồng nghĩa và trái nghĩa dưới áp lực thời gian.';

  @override
  String get vocabularyBuilderHowToPlay =>
      'Bạn sẽ được xem một từ mục tiêu và một mối quan hệ (Đồng nghĩa hoặc Trái nghĩa). Chọn từ chính xác từ các lựa chọn phù hợp với mối quan hệ đó. Hãy nhanh tay, thời gian đang trôi đi!';

  @override
  String get correct => 'ĐÚNG';

  @override
  String get incorrect => 'SAI';

  @override
  String get grammarPoliceTitle => 'Cảnh sát ngữ pháp';

  @override
  String get grammarPoliceSubtitle =>
      'Xác định xem câu đó có đúng ngữ pháp hay có lỗi hay không.';

  @override
  String get grammarPoliceHowToPlay =>
      'Một câu sẽ xuất hiện ở giữa màn hình. Hãy quyết định xem nó có đúng ngữ pháp hay có lỗi hay không. Nhấn \'ĐÚNG\' nếu nó ổn hoặc \'SAI\' nếu bạn phát hiện ra lỗi. Đừng để mất hết mạng sống!';

  @override
  String get reverseStroopTitle => 'Stroop ngược';

  @override
  String get reverseStroopSubtitle =>
      'Một biến thể của bài kiểm tra Stroop nơi sự tập trung được chuyển đổi.';

  @override
  String get reverseStroopHowToPlay =>
      'Hãy chú ý đến hướng dẫn! Nếu nó ghi \'CHỮ\', hãy khớp với ý nghĩa của từ. Nếu nó ghi \'MÀU\', hãy khớp với màu mực. Các quy tắc sẽ thay đổi thường xuyên để kiểm tra sự tập trung của bạn.';

  @override
  String get game2048Instruction => 'VUỐT THEO BẤT KỲ HƯỚNG NÀO ĐỂ GỘP';

  @override
  String get fibonacciMergeTitle => 'Gộp Fibonacci';

  @override
  String get fibonacciMergeSubtitle =>
      'Gộp các số Fibonacci liên tiếp (1, 1, 2, 3, 5, 8, 13...).';

  @override
  String get sequenceSleuthTitle => 'Thám tử chuỗi số';

  @override
  String get sequenceSleuthSubtitle =>
      'Tìm số còn thiếu trong chuỗi quy luật toán học.';

  @override
  String get divisibilityDashTitle => 'Chạy đua chia hết';

  @override
  String get divisibilityDashSubtitle =>
      'Nhấn vào tất cả các ước số có một chữ số (2-9) cho số đã cho.';

  @override
  String get percentagePeakTitle => 'Đỉnh cao phần trăm';

  @override
  String get percentagePeakSubtitle =>
      'Giải các phép tính phần trăm trong đầu nhanh chóng.';

  @override
  String get vennNumbersTitle => 'Số trong biểu đồ Venn';

  @override
  String get vennNumbersSubtitle =>
      'Phân loại các số vào các vùng biểu đồ Venn chính xác.';

  @override
  String get commonDenominatorTitle => 'Mẫu số chung';

  @override
  String get commonDenominatorSubtitle =>
      'Tìm Ước chung lớn nhất hoặc Bội chung nhỏ nhất.';

  @override
  String get angleFinderTitle => 'Tìm góc';

  @override
  String get angleFinderSubtitle =>
      'Tính toán góc còn thiếu trong bài toán hình học.';

  @override
  String get sumSnakeTitle => 'Rắn tính tổng';

  @override
  String get sumSnakeSubtitle =>
      'Kết nối các số liền kề để đạt được tổng mục tiêu.';

  @override
  String get baseShiftTitle => 'CHUYỂN ĐỔI CƠ SỐ';

  @override
  String get baseShiftSubtitle => 'Giải toán theo hệ thập phân';

  @override
  String get baseShiftDescription =>
      'Giải phép tính và nhập đáp án theo hệ thập phân (Cơ số 10).';

  @override
  String get baseShiftEquation => 'PHÉP TÍNH';

  @override
  String get baseShiftHint => 'Nhập kết quả thập phân...';

  @override
  String get baseShiftCorrect => 'Chính xác!';

  @override
  String get baseShiftIncorrect => 'Chưa chính xác!';

  @override
  String get baseShiftSubmit => 'XÁC NHẬN';

  @override
  String get baseShiftQuickGuide => 'Hướng dẫn nhanh:';

  @override
  String get baseShiftBinary => 'Nhị phân (bin): Cơ số 2 (0, 1)';

  @override
  String get baseShiftHex => 'Thập lục phân (0x): Cơ số 16 (0-9, A-F)';

  @override
  String get baseShiftDecimal => 'Thập phân (dec): Cơ số 10 (0-9)';

  @override
  String get baseShiftWinTitle => 'PHÙ THỦY TOÁN HỌC!';

  @override
  String get baseShiftWinMessage =>
      'Bạn đã giải đúng 5 phép tính chuyển đổi cơ số!';

  @override
  String get blockCount3DTitle => 'Đếm khối 3D';

  @override
  String get blockCount3DSubtitle => 'KÉO ĐỂ XOAY • ĐẾM CÁC KHỐI BỊ ẨN';

  @override
  String get blockCount3DHowMany => 'CÓ BAO NHIÊU KHỐI?';

  @override
  String get blockCount3DSubmitGuess => 'GỬI KẾT QUẢ';

  @override
  String get blockCount3DNotQuite =>
      'Chưa đúng lắm! Hãy thử xoay để đếm lại xem.';

  @override
  String get blockCount3DExcellent => 'TUYỆT VỜI';

  @override
  String blockCount3DWinMessage(int count) {
    return 'Bạn đã xác định đúng tất cả $count khối!';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '1. Kéo ngón tay của bạn qua khung nhìn 3D để xoay chồng khối.\n\n2. Đếm tất cả các khối trong chồng.\n\n3. Lưu ý: một khối ở trên cao phải có các khối đỡ bên dưới (các khối bị ẩn!).\n\n4. Nhập câu trả lời của bạn vào ô trống và nhấn \"GỬI KẾT QUẢ\" để kiểm tra.';

  @override
  String get alphabetSudokuTitle => 'SUDOKU CHỮ CÁI';

  @override
  String get alphabetSudokuSubtitle =>
      'Điền vào lưới sao cho mỗi hàng, cột và ô đều chứa các chữ cái từ A đến I.';

  @override
  String get alphabetSudokuWinTitle => 'ĐÃ GIẢI XONG SUDOKU!';

  @override
  String get alphabetSudokuWinMessage =>
      'Tuyệt vời! Bạn đã thành thạo các chữ cái.';

  @override
  String get classicMazeTitle => 'Mê cung cổ điển';

  @override
  String get classicMazeSubtitle => 'KHÁM PHÁ & GIẢI MÃ • MÊ CUNG MỚI MỖI VÁN';

  @override
  String get classicMazeWinTitle => 'ĐÃ VƯỢT MÊ CUNG';

  @override
  String classicMazeWinMessage(int count) {
    return 'Khả năng điều hướng đáng kinh ngạc! Bạn đã giải mê cung trong $count lượt đi.';
  }

  @override
  String get classicMazeMoves => 'LƯỢT ĐI: ';

  @override
  String get classicMazeHowToPlayDescription =>
      '1. Dẫn đường cho viên bi vàng phát sáng (người chơi) đến cổng xanh (lối thoát) ở phía dưới bên phải.\n\n2. Vuốt bất cứ đâu trên mê cung, sử dụng các phím mũi tên trên bàn phím vật lý hoặc các nút trên bảng điều khiển để di chuyển.\n\n3. Đường mòn màu tím hiển thị con đường bạn đã khám phá. Quay lại đường mòn để xóa nó đi!\n\n4. Thay đổi độ khó từ thanh tác vụ phía trên để thử thách bản thân với những mê cung lớn hơn!';

  @override
  String get conjunctionSearchTitle => 'Tìm kiếm kết hợp';

  @override
  String get conjunctionSearchSubtitle =>
      'Sự tập trung chú ý & Kết hợp đặc điểm';

  @override
  String get conjunctionSearchWinTitle => 'CHIẾN THẮNG';

  @override
  String get conjunctionSearchWinMessage =>
      'Bạn đã tìm thấy tất cả các mục tiêu với sự tập trung chú ý hoàn hảo!';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      'Một hình dạng và màu sắc mục tiêu cụ thể sẽ được hiển thị trong hướng dẫn. Hãy tìm và nhấn vào nó trong lưới dày đặc nhanh nhất có thể. Các hình dạng gây nhiễu sẽ có cùng màu hoặc cùng hình dạng, vì vậy hãy quan sát thật kỹ!';

  @override
  String get conjunctionSearchRound => 'VÒNG: ';

  @override
  String get conjunctionSearchScore => 'ĐIỂM: ';

  @override
  String get conjunctionSearchFind => 'TÌM: ';

  @override
  String get shapeCircle => 'HÌNH TRÒN';

  @override
  String get shapeSquare => 'HÌNH VUÔNG';

  @override
  String get shapeTriangle => 'HÌNH TAM GIÁC';

  @override
  String get shapeStar => 'HÌNH NGÔI SAO';

  @override
  String get colorRedLabel => 'ĐỎ';

  @override
  String get colorBlueLabel => 'XANH DƯƠNG';

  @override
  String get colorGreenLabel => 'XANH LÁ';

  @override
  String get colorAmberLabel => 'HỔ PHÁCH';

  @override
  String get cubeNetFoldTitle => 'Gấp khối lập phương';

  @override
  String get cubeNetFoldSubtitle => 'CHỌN KHỐI LẬP PHƯƠNG 3D TƯƠNG ỨNG';

  @override
  String get cubeNetFoldWinTitle => 'CHÍNH XÁC';

  @override
  String get cubeNetFoldWinMessage =>
      'Bạn có logic gấp hình không gian 3D hoàn hảo!';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '1. Nhìn vào hình khai triển 2D ở trên.\n\n2. Tưởng tượng gấp hình khai triển đó thành một khối lập phương 3D.\n\n3. Chọn phương án bên dưới thể hiện góc nhìn 3D hợp lệ của khối lập phương đó.\n\n4. Hãy cẩn thận: các mặt đối diện trong hình khai triển không thể nằm cạnh nhau trong không gian 3D, và thứ tự các mặt liền kề phải khớp nhau!';

  @override
  String get cubeNetFoldUnfoldedNet => 'HÌNH KHAI TRIỂN 2D';

  @override
  String get cubeNetFoldWhichMatches => 'KHỐI LẬP PHƯƠNG NÀO KHỚP?';

  @override
  String get cubeNetFoldIncorrect =>
      'Logic gấp hình chưa đúng! Nhấn Đặt lại hoặc thay đổi lựa chọn của bạn.';

  @override
  String get cubeNetFoldSubmitChoice => 'GỬI LỰA CHỌN';

  @override
  String get cubeNetFoldFailed => 'THẤT BẠI (NHẤN ĐẶT LẠI)';

  @override
  String get faceTraitAssociationMemorize => 'GHI NHỚ TẤT CẢ 4 NGƯỜI';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return 'NGƯỜI THỨ $current TRÊN $total';
  }

  @override
  String get faceTraitAssociationWhatOccupation => 'NGHỀ NGHIỆP CỦA HỌ LÀ GÌ?';

  @override
  String get faceTraitAssociationWhatHobby => 'SỞ THÍCH CỦA HỌ LÀ GÌ?';

  @override
  String get faceTraitAssociationWinTitle => 'BẬC THẦY TRÍ NHỚ!';

  @override
  String get faceTraitAssociationLoseTitle => 'TRÒ CHƠI KẾT THÚC';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return 'Bạn đã trả lời đúng $correct trên tổng số $total câu.';
  }

  @override
  String get topologyTitle => 'TÔ PÔ HỌC';

  @override
  String get topologySubtitle =>
      'Các hình này có tương đương về mặt tô pô không? (Có thể biến đổi hình này thành hình kia mà không cần cắt hay dán không?)';

  @override
  String get topologyWinTitle => 'THIÊN TÀI HÌNH HỌC!';

  @override
  String get topologyWinMessage => 'Bạn đã xác định đúng 10 cặp tô pô!';

  @override
  String get topologyScore => 'ĐIỂM: ';
}
