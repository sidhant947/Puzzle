// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Trò chơi giải đố';

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
  String get victory => 'Chiến thắng!';

  @override
  String get gameWin => 'LÀM TỐT LẮM!';

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
  String get visualStatisticalLearningTitle => 'Học thống kê trực quan';

  @override
  String get orbitTapTitle => 'Nhấn theo quỹ đạo';

  @override
  String get orbitTapSubtitle => 'Nhấn khi các quả bóng thẳng hàng với cổng';

  @override
  String get schulteTableTitle => 'Bảng Schulte';

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
  String get memoryMatrixTitle => 'Ma trận trí nhớ';

  @override
  String get memoryMatrixSubtitle => 'Ghi nhớ mẫu và nhấn vào các ô.';

  @override
  String get mentalAbacusTitle => 'Bàn tính nhẩm';

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
  String get verbalAnalogiesTitle => 'Ẩn dụ ngôn từ';

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
  String get tangleFixTitle => 'Gỡ rối dây';

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
  String get wisconsinCardSortingTitle => 'Phân loại thẻ Wisconsin';

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
  String get mirrorTracingTitle => 'Vẽ ngược qua gương';

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
  String get paperFoldingTitle => 'Gấp giấy';

  @override
  String get paperFoldingSubtitle => 'Nó sẽ trông như thế nào khi mở ra?';

  @override
  String get waterSortTitle => 'Rót nước đúng ống';

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
  String get silhouetteMatchTitle => 'Ghép bóng hình';

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
  String get shapeRectangle => 'HÌNH CHỮ NHẬT';

  @override
  String get shapeEllipse => 'HÌNH ELIP';

  @override
  String get shapeTrapezoid => 'HÌNH THANG';

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

  @override
  String get semanticDistanceTitle => 'Khoảng cách Ngữ nghĩa';

  @override
  String get semanticDistanceSubtitle =>
      'Đo lường khoảng cách khái niệm giữa các từ';

  @override
  String get oxymoronHuntTitle => 'Săn tìm Nghịch hợp';

  @override
  String get oxymoronHuntSubtitle => 'Ghép các cặp từ mâu thuẫn trong lưới';

  @override
  String get portmanteauSplitTitle => 'Phân tách Từ ghép lai';

  @override
  String get portmanteauSplitSubtitle =>
      'Xác định các từ gốc của một từ ghép lai';

  @override
  String get chainReactionTitle => 'Phản ứng Chuỗi';

  @override
  String get chainReactionSubtitle => 'Kết nối các từ bằng các chữ cái lặp lại';

  @override
  String get rhymeMasterTitle => 'Bậc thầy Gieo vần';

  @override
  String get rhymeMasterSubtitle => 'Xác định các từ vần với từ mục tiêu';

  @override
  String get definitionDashTitle => 'Chạy đua Định nghĩa';

  @override
  String get definitionDashSubtitle => 'Nối từ đúng với định nghĩa của nó';

  @override
  String get syllableStackTitle => 'Xếp chồng Âm tiết';

  @override
  String get syllableStackSubtitle =>
      'Xếp các âm tiết để tạo thành từ hoàn chỉnh';

  @override
  String get sentenceUnscrambleTitle => 'Sắp xếp Câu';

  @override
  String get sentenceUnscrambleSubtitle =>
      'Sắp xếp lại các từ để tạo thành một câu có nghĩa';

  @override
  String get grammarSortTitle => 'Phân loại Ngữ pháp';

  @override
  String get grammarSortSubtitle => 'Phân loại từ theo từ loại';

  @override
  String get vowelReconstructTitle => 'Khôi phục Nguyên âm';

  @override
  String get vowelReconstructSubtitle => 'Điền các nguyên âm còn thiếu vào câu';

  @override
  String get consonantReconstructTitle => 'Khôi phục Phụ âm';

  @override
  String get consonantReconstructSubtitle =>
      'Điền các phụ âm còn thiếu vào câu';

  @override
  String get homophoneHuntTitle => 'Săn tìm Từ đồng âm';

  @override
  String get silentLetterSearchTitle => 'Tìm chữ cái câm';

  @override
  String get silentLetterSearchSubtitle =>
      'Xác định các chữ cái không phát âm trong từ';

  @override
  String get palindromeBuilderTitle => 'Tạo từ Đối xứng';

  @override
  String get palindromeBuilderSubtitle =>
      'Tạo một từ đối xứng bằng cách thêm ít chữ cái nhất';

  @override
  String get phoneticGuessTitle => 'Đoán theo Phiên âm';

  @override
  String get phoneticGuessSubtitle =>
      'Xác định từ dựa trên cách phiên âm của nó';

  @override
  String get spoonerismSolverTitle => 'Giải mã Nói lái';

  @override
  String get spoonerismSolverSubtitle =>
      'Xác định cách nói lái đúng cho cụm từ';

  @override
  String get etymonOddballTitle => 'Tìm gốc từ khác biệt';

  @override
  String get etymonOddballSubtitle =>
      'Tìm từ không có chung gốc từ với các từ còn lại';

  @override
  String get etymologyOriginTitle => 'Nguồn gốc Từ nguyên';

  @override
  String get etymologyOriginSubtitle => 'Đoán ngôn ngữ gốc của từ mượn';

  @override
  String get affixFactoryTitle => 'Xưởng Phụ tố';

  @override
  String get affixFactorySubtitle =>
      'Tạo các từ có nghĩa bằng tiền tố và hậu tố';

  @override
  String get cognateCatchTitle => 'Tìm Từ đồng gốc';

  @override
  String get cognateCatchSubtitle =>
      'Phân biệt giữa từ đồng gốc thật và từ giả đồng gốc';

  @override
  String get compoundConnectTitle => 'Kết nối Từ ghép';

  @override
  String get compoundConnectSubtitle =>
      'Kết hợp hai từ để tạo thành một từ ghép';

  @override
  String get pangramSprintTitle => 'Chạy đua Pangram';

  @override
  String get pangramSprintSubtitle =>
      'Xây dựng một câu sử dụng mọi chữ cái trong bảng chữ cái';

  @override
  String get anagramDefinitionTitle => 'Định nghĩa Từ đảo chữ';

  @override
  String get anagramDefinitionSubtitle =>
      'Giải từ đảo chữ dựa trên định nghĩa của nó';

  @override
  String get letterBridgeTitle => 'Cầu nối Chữ cái';

  @override
  String get letterBridgeSubtitle => 'Tìm chữ cái còn thiếu để nối hai từ';

  @override
  String get letterFrequencyScanTitle => 'Quét tần suất Chữ cái';

  @override
  String get letterFrequencyScanSubtitle =>
      'Đếm số lần một chữ cái xuất hiện trong văn bản';

  @override
  String get oneLetterShiftTitle => 'Dịch chuyển một chữ cái';

  @override
  String get oneLetterShiftSubtitle =>
      'Biến đổi một từ thành từ khác bằng cách thay đổi một chữ cái';

  @override
  String vocabularyBuilderMessage(String arg0) {
    return 'Làm tốt lắm! Vốn từ vựng của bạn rất ấn tượng. Điểm: $arg0';
  }

  @override
  String get symmetryMessage =>
      'Bạn đã đối xứng hóa mẫu hình một cách hoàn hảo với độ chính xác tuyệt đối.';

  @override
  String get temporalOrderMessage =>
      'Đáng kinh ngạc! Trí nhớ trình tự thời gian của bạn rất chuẩn xác.';

  @override
  String get temporalOrderMessage1 =>
      'Trí nhớ trình tự không chính xác. Có công mài sắt có ngày nên kim!';

  @override
  String get wordSearchMessage =>
      'Đã tìm thấy tất cả các từ với khả năng quan sát tinh tường.';

  @override
  String colorMatchMessage(String arg0) {
    return 'Độ chính xác của bạn: $arg0%';
  }

  @override
  String semanticLinkMessage(String arg0) {
    return 'Bạn đã ghi được $arg0 điểm!';
  }

  @override
  String reflexTapMessage(String arg0) {
    return 'Bạn đã chạm vào $arg0 mục tiêu!';
  }

  @override
  String get angleFinderMessage => 'Trực giác hình học của bạn thật hoàn hảo!';

  @override
  String angleFinderMessage1(String arg0) {
    return 'Câu trả lời đúng là $arg0°';
  }

  @override
  String angleFinderText(String arg0) {
    return '$arg0°';
  }

  @override
  String visualStatisticalLearningMessage(String arg0) {
    return 'Bạn đã ghi được $arg0 mẫu hình đúng!';
  }

  @override
  String nonogramText(String arg0) {
    return 'Lỗi: $arg0';
  }

  @override
  String mentalCalendarMessage(String arg0) {
    return 'Bạn đã làm đúng $arg0 trên 10!';
  }

  @override
  String orbitTapMessage(String arg0) {
    return 'Bạn đã chạm thành công $arg0 lần!';
  }

  @override
  String schulteTableMessage(String arg0) {
    return 'Bạn đã hoàn thành bảng trong $arg0.\nHãy tiếp tục luyện tập để mở rộng tầm nhìn ngoại vi!';
  }

  @override
  String get schulteTableText => 'BẮT ĐẦU KIỂM TRA';

  @override
  String get relationalMemoryMessage =>
      'Độ chính xác trí nhớ quan hệ không gian thật tuyệt vời!';

  @override
  String sudokuText(String arg0) {
    return 'Lỗi: $arg0';
  }

  @override
  String sdmtMessage(String arg0) {
    return 'Bạn đã khớp được $arg0 biểu tượng! Bài kiểm tra này đo tốc độ quét và sự chú ý thị giác của bạn.';
  }

  @override
  String get futoshikiMessage =>
      'Đáng kinh ngạc! Bạn đã giải được ô số Futoshiki.';

  @override
  String letterFrequencyScanMessage(String arg0, String arg1) {
    return 'Bạn đã đếm đúng $arg0 lần xuất hiện của \"$arg1\".';
  }

  @override
  String letterFrequencyScanText(String arg0) {
    return 'Không chính xác. Số lượng là $arg0.';
  }

  @override
  String get memoryMatrixMessage =>
      'Ấn tượng! Trí nhớ ngắn hạn của bạn rất nhạy bén. Mục tiêu hàng ngày đã hoàn thành!';

  @override
  String get memoryMatrixMessage1 =>
      'Hãy tập trung và thử lại để cải thiện điểm trí nhớ của bạn.';

  @override
  String get contextCluesMessage =>
      'Xuất sắc! Vốn từ vựng và khả năng phân tích ngữ cảnh của bạn thật tuyệt vời.';

  @override
  String get contextCluesMessage1 =>
      'Đã chọn sai từ! Hãy rèn luyện tư duy ngữ cảnh ngôn ngữ và thử lại.';

  @override
  String oneLetterShiftMessage(String arg0, String arg1) {
    return 'Bạn đã chuyển đổi chính xác $arg0 thành $arg1.';
  }

  @override
  String get mentalAbacusMessage =>
      'Khả năng tính nhẩm của bạn thuộc hàng đẳng cấp.';

  @override
  String fractionMatcherMessage(String arg0) {
    return 'Bạn đã ghi được $arg0 điểm khi ghép các biểu thức!';
  }

  @override
  String get spellingSprintMessage => 'Bạn đã đánh vần đúng cả 10 từ!';

  @override
  String spellingSprintMessage1(String arg0) {
    return 'Bạn đã đánh vần được $arg0 từ.';
  }

  @override
  String stopSignalMessage(String arg0) {
    return 'Bạn đã đạt được $arg0 phản hồi chính xác! Bài kiểm tra này đo khả năng kiềm chế một hành động đã dự định.';
  }

  @override
  String grammarPoliceMessage(String arg0) {
    return 'Trò chơi kết thúc! Bạn đã duy trì trật tự trong thế giới ngữ pháp. Điểm: $arg0';
  }

  @override
  String consonantReconstructMessage(String arg0) {
    return 'Bạn đã khôi phục thành công với số điểm $arg0!';
  }

  @override
  String rhymeMasterMessage(String arg0, String arg1) {
    return 'Bạn đã tìm được $arg0 trên $arg1 vần!';
  }

  @override
  String vigilanceTaskMessage(String arg0, String arg1, String arg2) {
    return 'Số lần trúng: $arg0, Số lần bỏ lỡ: $arg1\nBáo động giả: $arg2';
  }

  @override
  String get silhouetteMatchOrthoMessage =>
      'Bạn có kỹ năng căn chỉnh chính hình hoàn hảo!';

  @override
  String get silhouetteMatchOrthoText => 'ĐÃ HIỂU';

  @override
  String get silhouetteMatchOrthoText1 =>
      'Phép chiếu phối cảnh không chính xác! Chạm vào Đặt lại để thử lại.';

  @override
  String fibonacciMergeMessage(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String factorFinderMessage(String arg0) {
    return 'Bạn đã ghi được $arg0 điểm bằng cách tìm tất cả các ước số!';
  }

  @override
  String logicalSyllogismsMessage(String arg0) {
    return 'Bạn đã giải đúng $arg0 tam đoạn luận!';
  }

  @override
  String get rotatingMazeMessage =>
      'Bạn đã vượt qua mê cung xoay động thành công!';

  @override
  String get rotatingMazeText => 'ĐÃ HIỂU';

  @override
  String get rotatingMazeText1 => '🌀 Mê cung đã xoay 90°! Lưới đã thay đổi!';

  @override
  String get mathPathMessage =>
      'You found the path that adds up to the target!';

  @override
  String get bridgesMessage => 'You successfully connected all the islands!';

  @override
  String compoundConnectMessage(String arg0, String arg1) {
    return 'The compound word is $arg0$arg1.';
  }

  @override
  String get pangramSprintMessage =>
      'You built a sentence using all 26 letters.';

  @override
  String get mirrorImageMessage => 'You perfectly identified the reflection.';

  @override
  String get mirrorImageText => 'MIRROR IMAGE';

  @override
  String reverseStroopMessage(String arg0) {
    return 'You scored $arg0 points! Keep your eye on the instructions.';
  }

  @override
  String get verbalAnalogiesMessage =>
      'You have a sharp mind for relationships.';

  @override
  String corsiBlocksMessage1(String arg0, String arg1) {
    return 'You recalled $arg1 sequences! Your spatial memory span reached $arg0.';
  }

  @override
  String wordLadderMessage(String arg0, String arg1, String arg2) {
    return 'You successfully connected $arg0 to $arg1 in $arg2 steps.';
  }

  @override
  String d2AttentionMessage(String arg0) {
    return 'Incredible selective scanning! Final score: $arg0.';
  }

  @override
  String get d2AttentionText => 'HOW TO PLAY';

  @override
  String get d2AttentionText1 => 'GOT IT';

  @override
  String get tangleFixMessage => 'All lines are clear and smooth.';

  @override
  String get distractorMatrixMessage =>
      'Incredible! You recalled patterns despite cognitive math distractors!';

  @override
  String get distractorMatrixMessage1 =>
      'The distractors got you! Retrain your working memory.';

  @override
  String sentenceUnscrambleMessage(String arg0) {
    return 'You unscrambled a score of $arg0!';
  }

  @override
  String get kakuroMessage =>
      'Incredible! You matched all sum segments perfectly.';

  @override
  String symbolicFlankerMessage(String arg0, String arg1) {
    return 'You got $arg0 correct out of $arg1!';
  }

  @override
  String stroopTestMessage(String arg0) {
    return 'You scored $arg0 correctly! Focus on the color of the ink, not the word.';
  }

  @override
  String wisconsinCardSortingMessage(String arg0) {
    return 'You correctly sorted $arg0 cards!';
  }

  @override
  String nBackMessage(String arg0) {
    return 'You achieved $arg0 2-back matches! Your working memory is vital for multitasking.';
  }

  @override
  String rhythmMasterMessage(String arg0, String arg1) {
    return 'You got $arg0 perfect hits and $arg1 points!';
  }

  @override
  String groceryListMessage(String arg0, Object score) {
    return 'You scored $arg0 points in Grocery List!';
  }

  @override
  String get groceryListText => 'I\\';

  @override
  String get mirrorTracingMessage =>
      'Your brain successfully rewired its coordination.';

  @override
  String moduloClockMessage(String arg0) {
    return 'Excellent modular mental math coordination! Score: $arg0';
  }

  @override
  String moduloClockMessage1(String arg0, String arg1, String arg2) {
    return 'You managed $arg0 of $arg1 modular clock solutions. Score: $arg2';
  }

  @override
  String get crownMessage =>
      'All crowns placed successfully with perfect logic.';

  @override
  String dualCodingMessage(String arg0) {
    return 'Fantastic dual-task performance! Your working memory score: $arg0';
  }

  @override
  String inequalityDashMessage(String arg0) {
    return 'You scored $arg0 points matching inequalities!';
  }

  @override
  String sourceMonitoringMessage(String arg0, String arg1) {
    return 'You scored $arg0 out of $arg1!';
  }

  @override
  String get sourceMonitoringText => 'START RECALL';

  @override
  String get memoryPalaceText => 'AVAILABLE WORDS';

  @override
  String target10Message(String arg0) {
    return 'You scored $arg0 points matching numbers to 10!';
  }

  @override
  String get paperFoldingMessage => 'You can see the patterns in your mind.';

  @override
  String topologyText(String arg0, String arg1) {
    return '$arg0$arg1 / 10';
  }

  @override
  String get waterSortMessage => 'You sorted all the colors perfectly!';

  @override
  String anagramDefinitionMessage(String arg0) {
    return 'The word was indeed \"$arg0\".';
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
    return 'You made $arg0 correct estimations.';
  }

  @override
  String grammarSortMessage(String arg0) {
    return 'You sorted $arg0 words correctly!';
  }

  @override
  String vowelReconstructMessage(String arg0) {
    return 'You reconstructed a score of $arg0!';
  }

  @override
  String spatialConflictMessage(String arg0, String arg1) {
    return 'You achieved a score of $arg0 with $arg1 errors!';
  }

  @override
  String get spatialConflictText => 'HOW TO PLAY';

  @override
  String get spatialConflictText1 => 'GOT IT';

  @override
  String tracePathMessage(String arg0) {
    return 'Your accuracy was $arg0%!';
  }

  @override
  String ruleSwitcherMessage(String arg0, String arg1) {
    return 'You scored $arg0 correct out of $arg1!';
  }

  @override
  String collatzMessage(String arg0, String arg1) {
    return 'You took $arg0 steps. Min possible was $arg1.';
  }

  @override
  String get collatzText => '/ 2';

  @override
  String get collatzText1 => '+ 1';

  @override
  String get collatzText2 => '3n + 1';

  @override
  String divisibilityDashMessage(String arg0) {
    return 'You solved $arg0 numbers!';
  }

  @override
  String switchTaskMessage(String arg0) {
    return 'You scored $arg0 correctly! Fast switching is key to mental flexibility.';
  }

  @override
  String sequenceSleuthMessage(String arg0) {
    return 'You solved $arg0 sequences!';
  }

  @override
  String changeBlindnessMessage(String arg0) {
    return 'You found $arg0 changes!';
  }

  @override
  String mentalRotationMessage(String arg0) {
    return 'You rotated $arg0 shapes correctly!';
  }

  @override
  String wordMastermindMessage(String arg0) {
    return 'You mastered the code!\nThe word was: $arg0';
  }

  @override
  String wordMastermindMessage1(String arg0) {
    return 'The hidden word was: $arg0';
  }

  @override
  String wordMastermindText(String arg0) {
    return '$arg0';
  }

  @override
  String get simonSequenceMessage => 'You memorized all 10 tiles!';

  @override
  String get simonSequenceMessage1 => 'Try again to master the sequence.';

  @override
  String oxymoronHuntMessage(String arg0) {
    return 'You found $arg0 oxymorons!';
  }

  @override
  String spotlightTrackMessage(String arg0) {
    return 'Incredible spatial tracking! You scored $arg0 points.';
  }

  @override
  String get spotlightTrackText => 'HOW TO PLAY';

  @override
  String get spotlightTrackText1 => 'GOT IT';

  @override
  String get spotlightTrackText2 => 'START ROUND';

  @override
  String vennNumbersMessage(String arg0) {
    return 'You categorized $arg0 numbers!';
  }

  @override
  String get vennNumbersText => 'NEITHER';

  @override
  String get vennNumbersText1 => 'BOTH';

  @override
  String get silhouetteMatchMessage =>
      'Your brain is excellent at 3D to 2D translation.';

  @override
  String sumSnakeMessage(String arg0) {
    return 'Target $arg0 reached with perfect precision!';
  }

  @override
  String get sumSnakeText => 'CLEAR PATH';

  @override
  String percentagePeakMessage(String arg0) {
    return 'You solved $arg0 percentage problems!';
  }

  @override
  String trailMakingMessage(String arg0) {
    return 'You completed $arg0 trails! This test measures your visual search speed and mental flexibility.';
  }

  @override
  String matrixReasoningMessage(String arg0) {
    return 'You completed $arg0 matrices correctly!';
  }

  @override
  String get tentsAndTreesMessage =>
      'You have successfully placed all the tents.';

  @override
  String klotskiMessage(String arg0) {
    return 'Sensational sliding! You freed the Hero block in $arg0 moves.';
  }

  @override
  String sumPyramidMessage(String arg0) {
    return 'You solved $arg0 sum pyramids successfully!';
  }

  @override
  String simonCommandMessage(String arg0) {
    return 'Excellent selective response and focus! Total Score: $arg0';
  }

  @override
  String simonCommandMessage1(String arg0, String arg1) {
    return 'You scored $arg0 but did not reach $arg1 matches in time.';
  }

  @override
  String syllableStackMessage(String arg0) {
    return 'You stacked up a score of $arg0!';
  }

  @override
  String get slitherlinkMessage =>
      'Awesome! You successfully completed the loop puzzle.';

  @override
  String quickMathMessage(String arg0) {
    return 'You solved $arg0 problems!';
  }

  @override
  String commonDenominatorMessage(String arg0) {
    return 'You solved $arg0 GCD/LCM problems!';
  }

  @override
  String chainReactionMessage(String arg0, String arg1) {
    return 'Your final score is $arg0. You built a chain of $arg1 words.';
  }

  @override
  String chainReactionText(String arg0) {
    return '$arg0';
  }

  @override
  String get associativePairsMessage =>
      'Brilliant! You associated visual traits flawlessly.';

  @override
  String get associativePairsMessage1 =>
      'Wrong association! Sharpen your link memory and try again.';

  @override
  String portmanteauSplitMessage(String arg0) {
    return 'You split $arg0 portmanteaus!';
  }

  @override
  String get magicSquaresText => 'CLEAR';

  @override
  String alphabetSudokuText(String arg0) {
    return 'Error: $arg0';
  }

  @override
  String get pipesMessage => 'You connected all the pipes and filled the grid.';

  @override
  String get dualMirrorMessage => 'You navigated both icons to their targets!';

  @override
  String binaryCodeMessage(String arg0) {
    return 'Sensational rapid decimal translation! Final Score: $arg0';
  }

  @override
  String binaryCodeMessage1(String arg0, String arg1) {
    return 'You correctly converted $arg0 binary numbers. Score: $arg1';
  }

  @override
  String oddOneOutMessage(String arg0) {
    return 'You found 50 odd ones! Final score: $arg0';
  }

  @override
  String oddOneOutMessage1(String arg0) {
    return 'Your score: $arg0';
  }

  @override
  String letterBridgeMessage(String arg0) {
    return 'You found the bridge letter: $arg0';
  }

  @override
  String get imReady => 'TÔI ĐÃ SẴN SÀNG';

  @override
  String get soptTitle => 'Tự trỏ chỉ';

  @override
  String get soptSubtitle =>
      'Nhấn vào một thẻ khác nhau mỗi lần. Các vị trí xáo trộn!';

  @override
  String get soptWinTitle => 'Trình tự chủ nhân!';

  @override
  String soptGameOverMessage(int score) {
    return 'Bạn đã ghi được $score điểm bằng cách theo dõi thành công các lá bài được xáo trộn!';
  }

  @override
  String get soptChooseNovel => 'Nhấn vào một thẻ mới';

  @override
  String get soptGreatJob => 'Làm tốt lắm!';

  @override
  String get soptAlreadyTapped => 'Đã khai thác rồi!';

  @override
  String get soptGrid => 'Lưới';

  @override
  String get contRecogTitle => 'Nhận dạng liên tục';

  @override
  String get contRecogSubtitle =>
      'Bạn đã nhìn thấy thẻ này trước đây trong phiên này chưa?';

  @override
  String get contRecogWinTitle => 'Công nhận thiên tài!';

  @override
  String contRecogGameOverMessage(int score) {
    return 'Bạn đã ghi được $score công nhận chính xác!';
  }

  @override
  String get contRecogCorrect => 'Chính xác!';

  @override
  String get contRecogWrong => 'Sai!';

  @override
  String get contRecogOldOrNew => 'Cái này cũ hay mới?';

  @override
  String get contRecogNew => 'Mới';

  @override
  String get contRecogOld => 'Cũ';

  @override
  String get contRecogSeenPool => 'Nhìn thấy hồ bơi';

  @override
  String get dnmsTitle => 'Bộ nhớ không khớp';

  @override
  String get dnmsSubtitle => 'Nhấn vào thẻ không có trong mẫu đã ghi nhớ.';

  @override
  String get dnmsWinTitle => 'Chuyên gia không phù hợp!';

  @override
  String dnmsGameOverMessage(int score) {
    return 'Bạn đã ghi được $score câu trả lời đúng trong phần Trì hoãn không khớp!';
  }

  @override
  String get dnmsChooseNovel => 'Nhấn vào thẻ mới';

  @override
  String get dnmsMemorizeSample => 'Ghi nhớ thẻ này';

  @override
  String get dnmsWaitForIt => 'Đợi nó...';

  @override
  String get dnmsExcellent => 'Xuất sắc!';

  @override
  String get dnmsSampleTapped => 'Đó là mẫu!';

  @override
  String get dnmsCards => 'Thẻ';

  @override
  String get symSpanTitle => 'Khoảng đối xứng';

  @override
  String get symSpanSubtitle =>
      'Nhớ lại các mẫu tế bào trong khi xác định tính đối xứng dọc.';

  @override
  String get symSpanWinTitle => 'Bậc thầy đối xứng!';

  @override
  String symSpanGameOverMessage(int score) {
    return 'Bạn đã ghi được $score điểm bằng cách nhớ lại bố cục và xác định tính đối xứng!';
  }

  @override
  String get symSpanMemorizeRed => 'Ghi nhớ vị trí tế bào màu đỏ';

  @override
  String get symSpanIsSymmetric => 'Mô hình có đối xứng không?';

  @override
  String get symSpanRecallSequence => 'Nhớ lại trình tự đúng thứ tự';

  @override
  String get symSpanGreatJob => 'Làm tốt lắm!';

  @override
  String get symSpanTryAgain => 'Hãy thử lại!';

  @override
  String get symSpanLength => 'Chiều dài';

  @override
  String get readingSpanTitle => 'Khoảng đọc';

  @override
  String get readingSpanSubtitle =>
      'Xác minh câu trong khi ghi nhớ một chuỗi các chữ cái.';

  @override
  String get readingSpanWinTitle => 'Chuyên gia đọc sách!';

  @override
  String readingSpanGameOverMessage(int score) {
    return 'Bạn đã ghi được $score điểm trong thử thách trí nhớ Reading Span!';
  }

  @override
  String get readingSpanTrueFalse => 'Tuyên bố này đúng hay sai?';

  @override
  String get readingSpanMemorizeLetter => 'Hãy ghi nhớ lá thư này';

  @override
  String get readingSpanRecallLetters => 'Nhớ lại các chữ cái theo thứ tự';

  @override
  String get readingSpanGreatJob => 'Làm tốt lắm!';

  @override
  String get readingSpanTryAgain => 'Hãy thử lại!';

  @override
  String readingSpanYourSequence(String sequence) {
    return 'Trình tự của bạn: $sequence';
  }

  @override
  String get readingSpanLength => 'Chiều dài';

  @override
  String get readingSpanSentence1 => 'Mặt trời mọc ở phía đông.';

  @override
  String get readingSpanSentence2 => 'Nước đá đang sôi sùng sục.';

  @override
  String get readingSpanSentence3 => 'Cá có thể thở dưới nước.';

  @override
  String get readingSpanSentence4 => 'Chó có cánh và có thể bay.';

  @override
  String get readingSpanSentence5 => 'Nước đóng băng ở 0 độ C.';

  @override
  String get readingSpanSentence6 => 'Mèo sủa như chó nhỏ.';

  @override
  String get readingSpanSentence7 => 'Cây có lá xanh vào mùa hè.';

  @override
  String get readingSpanSentence8 => 'Mưa rơi từ mặt đất lên.';

  @override
  String get readingSpanSentence9 => 'Một tam giác có bốn cạnh bằng nhau.';

  @override
  String get readingSpanSentence10 => 'Táo là một loại trái cây ngọt ngào.';

  @override
  String get readingSpanSentence11 => 'Mặt trăng được làm từ phô mai cheddar.';

  @override
  String get readingSpanSentence12 => 'Ô tô có bánh xe để lăn.';

  @override
  String get readingSpanSentence13 => 'Lửa lạnh cóng.';

  @override
  String get readingSpanSentence14 => 'Giấy được làm từ gỗ đã qua chế biến.';

  @override
  String get readingSpanSentence15 => 'Chim có lông để giúp chúng bay.';

  @override
  String get readingSpanSentence16 => 'Chuối mọc trên cây thông.';

  @override
  String get readingSpanSentence17 => 'Con voi nhỏ hơn con kiến.';

  @override
  String get readingSpanSentence18 => 'Sách chứa các trang in văn bản.';

  @override
  String get countingSpanTitle => 'Khoảng đếm';

  @override
  String get countingSpanSubtitle =>
      'Chỉ đếm vòng tròn màu xanh. Sau đó nhớ lại thứ tự đếm.';

  @override
  String get countingSpanWinTitle => 'Đếm thiên tài!';

  @override
  String countingSpanGameOverMessage(int score) {
    return 'Bạn đã ghi được $score điểm trong thử thách trí nhớ Đếm khoảng thời gian!';
  }

  @override
  String get countingSpanCountCircles => 'Chỉ đếm vòng tròn màu xanh';

  @override
  String get countingSpanRecallCounts => 'Nhớ lại số đếm theo đúng thứ tự';

  @override
  String get countingSpanGreatJob => 'Làm tốt lắm!';

  @override
  String get countingSpanTryAgain => 'Hãy thử lại!';

  @override
  String countingSpanYourSequence(String sequence) {
    return 'Trình tự của bạn: $sequence';
  }

  @override
  String get countingSpanLength => 'Chiều dài';

  @override
  String get objDispTitle => 'Độ dịch chuyển của vật thể';

  @override
  String get objDispSubtitle =>
      'Ghi nhớ bố cục. Tìm và chạm vào một đối tượng có thể thay đổi vị trí.';

  @override
  String get objDispWinTitle => 'Thiên tài không gian!';

  @override
  String objDispGameOverMessage(int score) {
    return 'Bạn đã xác định chính xác $score đối tượng bị dịch chuyển!';
  }

  @override
  String get objDispMemorizeAll => 'Ghi nhớ tất cả các vị trí';

  @override
  String get objDispWaitingShift => 'Đang chờ thay đổi bố cục...';

  @override
  String get objDispTapMoved => 'Nhấn vào đối tượng đã di chuyển';

  @override
  String get objDispExcellent => 'Xuất sắc!';

  @override
  String get objDispWrongObject => 'Sai đối tượng!';

  @override
  String get objDispItems => 'Mặt hàng';

  @override
  String get mandalaTitle => 'Thu hồi Mandala';

  @override
  String get mandalaSubtitle =>
      'Ghi nhớ cấu hình màu. Chọn màu sắc và sơn lại gạch.';

  @override
  String get mandalaWinTitle => 'Nghệ sĩ Mandala!';

  @override
  String mandalaGameOverMessage(int score) {
    return 'Bạn đã ghi được $score điểm bằng cách tạo lại các bố cục hình học đầy màu sắc!';
  }

  @override
  String get mandalaMemorizeColors => 'Ghi nhớ màu gạch';

  @override
  String get mandalaPaintCells => 'Sơn các ô để phù hợp với bản gốc';

  @override
  String get mandalaExcellent => 'Xuất sắc!';

  @override
  String get mandalaIncorrectMatch => 'Trận đấu không chính xác!';

  @override
  String get mandalaSubmitRepaint => 'Gửi sơn lại';

  @override
  String get mandalaTiles => 'Gạch lát';

  @override
  String get runningSpanTitle => 'Khoảng chạy';

  @override
  String get runningSpanSubtitle =>
      'Xem các chữ cái. Khi chúng dừng lại, hãy nhập N chữ cái cuối cùng theo thứ tự.';

  @override
  String get runningSpanWinTitle => 'Bậc thầy đệm!';

  @override
  String runningSpanGameOverMessage(int score) {
    return 'Bạn đã ghi được $score điểm trong Chạy bộ nhớ kéo dài!';
  }

  @override
  String runningSpanPrepareRecall(int count) {
    return 'Chuẩn bị nhớ lại $count chữ cái cuối cùng';
  }

  @override
  String get runningSpanWatchCarefully => 'Hãy để ý cẩn thận...';

  @override
  String runningSpanEnterLast(int count) {
    return 'Nhập $count chữ cái cuối cùng';
  }

  @override
  String get runningSpanGreatJob => 'Làm tốt lắm!';

  @override
  String get runningSpanIncorrectBuffer => 'Bộ đệm không chính xác!';

  @override
  String runningSpanRecallLast(int count) {
    return 'Nhớ lại $count lần cuối';
  }

  @override
  String get runningSpanStopsRandomly => 'Luồng dừng ngẫu nhiên!';

  @override
  String runningSpanEntered(String sequence) {
    return 'Đã nhập: $sequence';
  }

  @override
  String get runningSpanNItems => 'Vật phẩm N';

  @override
  String get spatialCabinetTitle => 'Tủ không gian';

  @override
  String get spatialCabinetSubtitle => 'Ghi nhớ ngăn tủ nào chứa đồ vật nào.';

  @override
  String get spatialCabinetWinTitle => 'Chuyên gia nội các!';

  @override
  String spatialCabinetGameOverMessage(int score) {
    return 'Bạn đã ghi được $score điểm trong Bộ nhớ tủ không gian!';
  }

  @override
  String get spatialCabinetMemorize => 'Ghi nhớ vị trí vật phẩm';

  @override
  String spatialCabinetWhereIs(String itemName) {
    return '$itemName ở đâu?';
  }

  @override
  String get spatialCabinetCorrect => 'Chính xác!';

  @override
  String get spatialCabinetWrongDrawer => 'Ngăn kéo sai!';

  @override
  String get spatialCabinetItems => 'Mặt hàng';

  @override
  String get cabinetItemKey => 'Chìa khóa';

  @override
  String get cabinetItemApple => 'Quả táo';

  @override
  String get cabinetItemDiamond => 'Kim cương';

  @override
  String get cabinetItemBook => 'Sách';

  @override
  String get cabinetItemUmbrella => 'Chiếc ô';

  @override
  String get cabinetItemCoffee => 'Cà phê';

  @override
  String get cabinetItemLock => 'Khóa';

  @override
  String get cabinetItemPet => 'Thú cưng';

  @override
  String get cabinetItemCar => 'Xe hơi';

  @override
  String get gamesTitleLabel => 'TRÒ CHƠI';

  @override
  String get yourFavorites => 'YÊU THÍCH CỦA BẠN';

  @override
  String get readyForWorkout => 'SẴN SÀNG CHO BÀI TẬP HÀNG NGÀY CỦA BẠN?';

  @override
  String get greatStartKeepGoing => 'KHỞI ĐẦU TUYỆT VỜI! HÃY TIẾP TỤC.';

  @override
  String get onFireToday => 'HÔM NAY BẠN ĐANG RẤT SUNG SỨC!';

  @override
  String get incredibleSolvingToday => 'GIẢI QUYẾT ĐÁNG KINH NGẠC HÔM NAY!';

  @override
  String get newGameLabel => 'MỚI';

  @override
  String get slitherlinkTitle => 'Slitherlink';

  @override
  String get slitherlinkSubtitle => 'VÂY QUANH LƯỚI PIN BẰNG CÁC GỢI Ý SỐ.';

  @override
  String get futoshikiTitle => 'Futoshiki';

  @override
  String get futoshikiSubtitle => 'ĐIỀN VÀO LƯỚI BẰNG CÁC GỢI Ý LỚN HƠN.';

  @override
  String get kakuroTitle => 'Kakuro';

  @override
  String get kakuroSubtitle => 'GIẢI CÁC Ô CHỮ VỚI CÁC CON SỐ VÀ TỔNG.';

  @override
  String get inequalityDashTitle => 'Đua Bất Đẳng Thức';

  @override
  String get inequalityDashSubtitle =>
      'GIẢI CÁC BẤT ĐẲNG THỨC DƯỚI ÁP LỰC THỜI GIAN.';

  @override
  String get factorFinderTitle => 'Tìm Ước Số';

  @override
  String get factorFinderSubtitle =>
      'XÁC ĐỊNH TẤT CẢ CÁC ƯỚC SỐ CỦA CÁC SỐ MỤC TIÊU.';

  @override
  String get collatzTitle => 'Đường dẫn Collatz';

  @override
  String get collatzSubtitle => 'ĐIỀU HƯỚNG DÃY SỐ 3N+1.';

  @override
  String get sumPyramidTitle => 'Kim Tự Tháp Tổng';

  @override
  String get sumPyramidSubtitle =>
      'ĐIỀN VÀO CÁC Ô KIM TỰ THÁP VỚI CÁC GỢI Ý TOÁN HỌC VỀ TỔNG.';

  @override
  String get target10Title => 'Mục Tiêu 10';

  @override
  String get target10Subtitle => 'KẾT HỢP CÁC Ô SỐ ĐỂ CÓ ĐƯỢC MƯỜI TỔNG.';

  @override
  String get fractionMatcherTitle => 'Ghép Phân Số';

  @override
  String get fractionMatcherSubtitle =>
      'GHÉP CÁC PHÂN SỐ TƯƠNG ĐƯƠNG BẰNG TRỰC QUAN.';

  @override
  String get dualCodingTitle => 'Mã Hóa Kép';

  @override
  String get dualCodingSubtitle => 'GHÉP CÁC CHỮ CÁI VÀ BIỂU TƯỢNG ĐỒNG THỜI.';

  @override
  String get distractorMatrixTitle => 'Ma Trận Gây Nhiễu';

  @override
  String get distractorMatrixSubtitle =>
      'TÌM CÁC HÌNH DẠNG MỤC TIÊU GIỮA CÁC YẾU TỐ GÂY NHIỄU.';

  @override
  String get temporalOrderTitle => 'Thứ Tự Thời Gian';

  @override
  String get temporalOrderSubtitle => 'NHỚ LẠI TRÌNH TỰ THỜI GIAN.';

  @override
  String get associativePairsTitle => 'Cặp Liên Kết';

  @override
  String get associativePairsSubtitle =>
      'GHÉP ĐÔI VÀ KHỚP CÁC BIỂU TƯỢNG TƯƠNG ỨNG.';

  @override
  String get blockCount3dTitle => 'Đếm Khối 3D';

  @override
  String get blockCount3dSubtitle => 'ĐẾM CÁC KHỐI TRONG KHÔNG GIAN BA CHIỀU.';

  @override
  String get rotatingMazeTitle => 'Mê Cung Xoay';

  @override
  String get rotatingMazeSubtitle => 'XOAY MÊ CUNG ĐỂ DẪN BÓNG ĐẾN LỐI THOÁT.';

  @override
  String get silhouetteMatchOrthoTitle => 'Khớp Hình Chiếu (Ortho)';

  @override
  String get silhouetteMatchOrthoSubtitle =>
      'KHỚP CÁC ĐỐI TƯỢNG 3D VỚI CÁC BÓNG CHIẾU THẲNG GÓC.';

  @override
  String get spatialConflictTitle => 'Xung Đột Không Gian';

  @override
  String get spatialConflictSubtitle =>
      'GIẢI QUYẾT SỰ KHÁC BIỆT GIỮA VĂN BẢN VÀ HƯỚNG.';

  @override
  String get spotlightTrackTitle => 'Theo Dấu Đèn Chiếu';

  @override
  String get spotlightTrackSubtitle =>
      'THEO DÕI CÁC MỤC NHẤP NHÁY TRONG CÁC BÓNG DI CHUYỂN.';

  @override
  String get d2AttentionTitle => 'Chú Ý d2';

  @override
  String get d2AttentionSubtitle =>
      'CHẠM VÀO CÁC BIỂU TƯỢNG MỤC TIÊU VỚI CÁC TIÊU CHÍ NGHIÊM NGẶT.';

  @override
  String get dualMirrorTitle => 'Điều Hướng Gương Kép';

  @override
  String get dualMirrorSubtitle => 'ĐIỀU HƯỚNG HAI MÊ CUNG CÙNG MỘT LÚC.';

  @override
  String get contextCluesTitle => 'Gợi Ý Ngữ Cảnh';

  @override
  String get contextCluesSubtitle => 'SUY LUẬN TỪ ẨN TỪ CÁC GỢI Ý NGỮ CẢNH.';

  @override
  String get digitSpanReverseSubtitle =>
      'NHỚ LẠI CÁC CHỮ SỐ THEO THỨ TỰ NGƯỢC LẠI.';

  @override
  String get faceNameAssociationSubtitle =>
      'NHỚ LẠI TÊN CHO CÁC KHUÔN MẶT ĐA DẠNG ĐƯỢC TRÌNH BÀY.';

  @override
  String get staircaseMemorySubtitle =>
      'GHI NHỚ CÁC KHỐI THEO TRÌNH TỰ TỪNG BƯỚC.';

  @override
  String get choiceReactionTimeSubtitle =>
      'CHẠM NHANH VÀO CÁC NÚT CỤ THỂ KHỚP VỚI CÁC GỢI Ý.';

  @override
  String get attentionalBlinkSubtitle =>
      'PHÁT HIỆN CÁC MỤC TIÊU NHANH NHẤP NHÁY TRONG DÒNG CHẢY.';

  @override
  String get visualStatisticalLearningSubtitle =>
      'HỌC CÁC MẪU HÌNH DẠNG THỜI GIAN BẰNG TRỰC QUAN.';

  @override
  String get sternbergTaskSubtitle =>
      'NHỚ LẠI XEM BIỂU TƯỢNG CÓ TRONG BỘ NHỚ HAY KHÔNG.';

  @override
  String get operationSpanSubtitle => 'GIẢI TOÁN VÀ NHỚ LẠI CÁC CHUỖI CHỮ CÁI.';

  @override
  String get continuousRecognitionTitle => 'Nhận Biết Liên Tục';

  @override
  String get continuousRecognitionSubtitle =>
      'XÁC ĐỊNH XEM THẺ ĐƯỢC TRÌNH BÀY LÀ CŨ HAY MỚI.';

  @override
  String get symmetrySpanTitle => 'Khoảng Đối Xứng';

  @override
  String get symmetrySpanSubtitle =>
      'NHỚ LẠI TỌA ĐỘ Ô GIỮA CÁC QUYẾT ĐỊNH ĐỐI XỨNG DỌC.';

  @override
  String get objectDisplacementTitle => 'Sự Dịch Chuyển Vật Thể';

  @override
  String get objectDisplacementSubtitle =>
      'NGHIÊN CỨU CÁC VỊ TRÍ VÀ CHẠM VÀO VẬT THỂ DUY NHẤT ĐÃ DI CHUYỂN.';

  @override
  String get mandalaRecallTitle => 'Nhớ Lại Mandala';

  @override
  String get mandalaRecallSubtitle =>
      'GHI NHỚ CÁC Ô MÀU VÀ VẼ LẠI MANDALA TỪ BẢNG MÀU.';

  @override
  String get runningMemorySpanTitle => 'Khoảng Nhớ Chạy';

  @override
  String get runningMemorySpanSubtitle =>
      'THEO DÕI CÁC CHỮ CÁI ĐANG CHẠY VÀ NHỚ LẠI N MỤC CUỐI CÙNG.';

  @override
  String get spatialCabinetMemoryTitle => 'Tủ Không Gian';

  @override
  String get spatialCabinetMemorySubtitle =>
      'GHI NHỚ VÀ XÁC ĐỊNH VỊ TRÍ CÁC MỤC SAU CỬA TỦ.';

  @override
  String get pathRecallSubtitle => 'GHI NHỚ VÀ LẶP LẠI CÁC LỰA CHỌN ĐƯỜNG DẪN.';

  @override
  String get objectShuffleSubtitle =>
      'THEO DÕI CÁC MỤC ĐÃ ĐƯỢC TRÁO ĐỔI DƯỚI CÁC CHIẾC CỐC SÂU.';

  @override
  String get groceryListSubtitle =>
      'GHI NHỚ VÀ ĐÁNH DẤU CÁC MỤC TRÊN DANH SÁCH.';

  @override
  String get quickMathSubtitle => 'GIẢI CÁC CÂU HỎI SỐ HỌC VỚI TỐC ĐỘ TỐI ĐA.';

  @override
  String get mathGuessTitle => 'Đoán Toán Học';

  @override
  String get mathGuessSubtitle => 'ĐOÁN SỐ ẨN TRONG VÒNG 15 LẦN THỬ.';

  @override
  String get reflexTapSubtitle => 'CHẠM VÀO CÁC KÍCH THÍCH NHANH NHẤT CÓ THỂ.';

  @override
  String get pixelMimicSubtitle =>
      'BẮT CHƯỚC CÁC MẪU THIẾT KẾ TRÊN LƯỚI PIXEL.';

  @override
  String get simonSequenceSubtitle =>
      'LẶP LẠI CÁC TRÌNH TỰ HÌNH DẠNG TỪ BỘ NHỚ.';

  @override
  String get slidePuzzleSubtitle => 'SẮP XẾP LẠI CÁC Ô LƯỚI TRƯỢT HÌNH VUÔNG.';

  @override
  String get findWordTitle => 'Tìm Từ';

  @override
  String get schulteTableSubtitle => 'CHẠM VÀO CÁC SỐ TỪ MỘT ĐẾN HAI MƯƠI LĂM.';

  @override
  String get simonCommandTitle => 'Lệnh Simon';

  @override
  String get simonCommandSubtitle =>
      'THỰC HIỆN CÁC HƯỚNG DẪN BẰNG GIỌNG NÓI NHANH CHÓNG.';

  @override
  String get binaryCodeTitle => 'Tốc Độ Nhị Phân';

  @override
  String get binaryCodeSubtitle => 'DỊCH CÁC MÃ NHỊ PHÂN SANG THẬP PHÂN.';

  @override
  String get moduloClockTitle => 'Đồng Hồ Modulo';

  @override
  String get moduloClockSubtitle =>
      'TÍNH TOÁN CÁC PHƯƠNG TRÌNH TOÁN HỌC BẰNG CÁCH SỬ DỤNG ĐỒNG HỒ.';

  @override
  String get chimpTestTitle => 'Bài Kiểm Tra Tinh Tinh';

  @override
  String get chimpTestSubtitle =>
      'CHẠM VÀO CÁC SỐ NGẪU NHIÊN THEO THỨ TỰ TĂNG DẦN.';

  @override
  String get relationalMemoryTitle => 'Bộ Nhớ Quan Hệ';

  @override
  String get relationalMemorySubtitle =>
      'NHỚ LẠI VỊ TRÍ CHÍNH XÁC CỦA CÁC MỤC TRONG LƯỚI.';

  @override
  String get factBinderTitle => 'Ràng Buộc Sự Thật';

  @override
  String get factBinderSubtitle =>
      'KẾT NỐI CÁC BIỂU TƯỢNG VÀ NHỚ LẠI CÁC TUYÊN BỐ.';

  @override
  String get sourceMonitoringTitle => 'Theo Dõi Nguồn';

  @override
  String get sourceMonitoringSubtitle => 'NHỚ LẠI NGỮ CẢNH.';

  @override
  String get klotskiTitle => 'Thoát Khỏi Klotski';

  @override
  String get klotskiSubtitle => 'TRƯỢT CÁC KHỐI ĐỂ ĐẾN ĐƯỢC LỐI RA.';

  @override
  String get homophoneHuntSubtitle => 'Chọn từ đồng âm có cách viết đúng';

  @override
  String get laserLinkTitle => 'Liên kết Laser';

  @override
  String get laserLinkSubtitle =>
      'Xoay gương để phản xạ tia laser và cung cấp năng lượng cho tất cả các mục tiêu.';

  @override
  String get laserLinkCongrats =>
      'Phản xạ chính xác! Bạn đã cấp nguồn thành công cho toàn bộ lưới.';

  @override
  String get crossSectionSliceTitle => 'Lát cắt ngang';

  @override
  String get crossSectionSliceSubtitle =>
      'Xác định mặt cắt 2D chính xác của một đối tượng 3D từ một góc cụ thể.';

  @override
  String get crossSectionSliceCongrats =>
      'Hình dung 3D đáng kinh ngạc! Bạn đã nhìn thấu suốt hình dạng đó.';

  @override
  String get shadowPivotTitle => 'Trục bóng';

  @override
  String get shadowPivotCongrats =>
      'Lập luận không gian năng động! Bạn đã làm chủ ánh sáng và bóng tối.';

  @override
  String get shadowPivotSubtitle =>
      'Dự đoán bóng của một đối tượng 3D khi nó quay trên các trục khác nhau.';

  @override
  String get interlockPuzzleTitle => 'Câu đố lồng nhau';

  @override
  String get interlockPuzzleSubtitle =>
      'Tháo rời hoặc lắp ráp các khối lồng vào nhau phức tạp theo trình tự chính xác.';

  @override
  String get interlockPuzzleCongrats =>
      'Giải mã logic! Bạn đã tháo gỡ câu đố một cách hoàn hảo.';

  @override
  String get pathIntersectTitle => 'Giao lộ đường dẫn';

  @override
  String get pathIntersectSubtitle =>
      'Điều hướng nhiều con đường cùng lúc để đạt được các mục tiêu tương ứng mà không bị va chạm.';

  @override
  String get pathIntersectCongrats =>
      'Điều hướng đồng bộ! Bạn đã đạt được tất cả các mục tiêu một cách hoàn hảo.';

  @override
  String get negativeSpaceDetectionTitle => 'Không gian âm';

  @override
  String get negativeSpaceDetectionSubtitle =>
      'Xác định hình dạng được tạo bởi không gian trống giữa các vật thể.';

  @override
  String get negativeSpaceDetectionCongrats =>
      'Nhận thức sắc bén! Bạn đã thành thạo nghệ thuật nhìn thấy những gì không có ở đó.';

  @override
  String get compassMazeTitle => 'Mê cung La bàn';

  @override
  String get compassMazeSubtitle =>
      'Điều hướng một mê cung nơi các hướng di chuyển thay đổi dựa trên hướng la bàn của bạn.';

  @override
  String get compassMazeCongrats =>
      'Điều hướng điêu luyện! Bạn đã tìm thấy lối thoát qua các hướng thay đổi liên tục.';

  @override
  String get complexFoldingNetsTitle => 'Lưới gấp';

  @override
  String get complexFoldingNetsSubtitle =>
      'Xác định hình dạng 3D phức tạp nào sẽ được tạo thành bằng cách gấp một lưới 2D không chuẩn.';

  @override
  String get complexFoldingNetsCongrats =>
      'Logic gấp nâng cao! Bạn đã hình dung thành công hình dạng 3D.';

  @override
  String get compassMazeMessage => 'Điều hướng mê cung bằng la bàn.';

  @override
  String get negativeSpaceDetectionMessage =>
      'Xác định vật thể ẩn trong không gian.';

  @override
  String get shikakuTitle => 'Shikaku';

  @override
  String get shikakuSubtitle =>
      'DIVIDE THE GRID INTO SQUARES AND RECTANGLES MATCHING THE NUMBERS.';

  @override
  String get countdownMathTitle => 'Countdown Math';

  @override
  String get countdownMathSubtitle =>
      'COMBINE RANDOM NUMBERS TO CALCULATE THE THREE-DIGIT TARGET.';

  @override
  String get narrativeRecallTitle => 'Narrative Recall';

  @override
  String get narrativeRecallSubtitle =>
      'READ A STORY AND RECALL SPECIFIC QUANTITATIVE AND FACTUAL DETAILS.';

  @override
  String get shellGameTitle => 'Shell Game';

  @override
  String get shellGameSubtitle =>
      'TRACK A HIDDEN BALL AS THE SHUFFLING CUPS SWAP PLACES.';

  @override
  String get typoglycemiaDecoderTitle => 'Typoglycemia Decoder';

  @override
  String get typoglycemiaDecoderSubtitle =>
      'UNSCRAMBLE AND READ JUMBLED SENTENCES SPEEDILY.';

  @override
  String get shapeShifterTitle => 'Shape Shifter';

  @override
  String get shapeShifterSubtitle => 'Tap the target shape-color combination.';

  @override
  String get gokigenNanameTitle => 'Gokigen Naname';

  @override
  String get gokigenNanameSubtitle =>
      'Draw diagonals to connect points without loops.';

  @override
  String get matrixMultiplierTitle => 'Matrix Multiplier';

  @override
  String get matrixMultiplierSubtitle =>
      'Select a row and column to multiply to the target.';

  @override
  String get wordAssociationRecallTitle => 'Word Association';

  @override
  String get wordAssociationRecallSubtitle =>
      'Recall paired word associations from memory.';

  @override
  String get gearRotationTitle => 'Gear Rotation';

  @override
  String get gearRotationSubtitle =>
      'Predict the rotation direction of the last gear.';

  @override
  String get wordWheelTitle => 'Word Wheel';

  @override
  String get wordWheelSubtitle =>
      'Make words using letters on the wheel, including the center letter.';

  @override
  String get oddEvenFlashTitle => 'Odd-Even Flash';

  @override
  String get oddEvenFlashSubtitle =>
      'Quickly match the number parity with the color rule.';

  @override
  String get norinoriTitle => 'Norinori';

  @override
  String get norinoriSubtitle =>
      'Shade exactly two connected cells in each room.';

  @override
  String get algebraicBalanceTitle => 'Algebraic Balance';

  @override
  String get algebraicBalanceSubtitle =>
      'Solve the equations to find the target sum.';

  @override
  String get patternSequenceDrawTitle => 'Pattern Recall';

  @override
  String get patternSequenceDrawSubtitle =>
      'Repeat the animated path sequence on the grid.';

  @override
  String get tangramTitle => 'Tangram Puzzle';

  @override
  String get tangramSubtitle =>
      'Arrange the shapes to fill the target silhouette.';

  @override
  String get semanticAssociationTitle => 'Association Word';

  @override
  String get semanticAssociationSubtitle =>
      'Find the word connecting all three clues.';

  @override
  String get peripheralFocusTitle => 'Peripheral Focus';

  @override
  String get peripheralFocusSubtitle =>
      'React to flashing side panels while solving math.';

  @override
  String get masyuTitle => 'Masyu Loop';

  @override
  String get masyuSubtitle => 'Draw a single loop matching Masyu circle rules.';

  @override
  String get mathMazeTitle => 'Math Maze';

  @override
  String get mathMazeSubtitle =>
      'Trace a path that evaluates to the target total.';

  @override
  String get storyBuilderTitle => 'Story Builder';

  @override
  String get storyBuilderSubtitle =>
      'Reconstruct the chronological sequence of the story.';

  @override
  String get mirrorMazeTitle => 'Mirror Maze';

  @override
  String get mirrorMazeSubtitle =>
      'Redirect a laser beam using diagonal mirrors.';

  @override
  String get wordGridConnectionTitle => 'Word Connections';

  @override
  String get wordGridConnectionSubtitle =>
      'Group 16 words into four categories of four.';

  @override
  String get shapeShifterPeripheralTitle => 'Peripheral Shapes';

  @override
  String get shapeShifterPeripheralSubtitle =>
      'Track peripheral shape changes while matching central values.';

  @override
  String get soundWaveMatchTitle => 'Sound Wave Match';

  @override
  String get soundWaveMatchSubtitle =>
      'Tap when the visual wave frequency aligns with pitch changes.';

  @override
  String get multiTrackCounterTitle => 'Multi-Track Counter';

  @override
  String get multiTrackCounterSubtitle =>
      'Tap when any counter increments to a target multiplier.';

  @override
  String get colorWordMatchUpTitle => 'Color Match-Up';

  @override
  String get colorWordMatchUpSubtitle =>
      'Determine if two colored words match based on changing rules.';

  @override
  String get signalAndNoiseTitle => 'Signal & Noise';

  @override
  String get signalAndNoiseSubtitle =>
      'Locate target alphanumeric characters hidden in static noise.';

  @override
  String get focusTunnelTitle => 'Focus Tunnel';

  @override
  String get focusTunnelSubtitle =>
      'Identify matching symbols appearing on moving tunnel walls.';

  @override
  String get targetPursuerTitle => 'Target Pursuer';

  @override
  String get targetPursuerSubtitle =>
      'Track multiple overlapping circles and select the original target.';

  @override
  String get gridGazeTitle => 'Grid Gaze';

  @override
  String get gridGazeSubtitle =>
      'Identify which grid cell flashed with a different duration.';

  @override
  String get doubleTroubleTitle => 'Double Trouble';

  @override
  String get doubleTroubleSubtitle =>
      'Play two separate simple games simultaneously on split-screen.';

  @override
  String get syncRhythmTitle => 'Sync Rhythm';

  @override
  String get syncRhythmSubtitle =>
      'Tap when visual metronome sweep matches syncopated beat.';

  @override
  String get ghostTapTitle => 'Ghost Tap';

  @override
  String get ghostTapSubtitle =>
      'Tap when the invisible pulse reaches its maximum height.';

  @override
  String get attentionalRsvpTitle => 'Attentional RSVP';

  @override
  String get attentionalRsvpSubtitle =>
      'Identify digits appearing in rapid serial letter flash.';

  @override
  String get colorMazeNavTitle => 'Color Maze Nav';

  @override
  String get colorMazeNavSubtitle =>
      'Navigate maze tiles matching dynamic permission colors.';

  @override
  String get dynamicSalienceTitle => 'Dynamic Salience';

  @override
  String get dynamicSalienceSubtitle =>
      'Find the shape moving with slightly different dynamics.';

  @override
  String get chalkAndTalkTitle => 'Chalk & Talk';

  @override
  String get chalkAndTalkSubtitle =>
      'Type words heard in audio while ignoring visual distractors.';

  @override
  String get blinkDetectorTitle => 'Blink Detector';

  @override
  String get blinkDetectorSubtitle =>
      'Tap the grid face that blinks twice in rapid succession.';

  @override
  String get frequencyTapTitle => 'Frequency Tap';

  @override
  String get frequencyTapSubtitle =>
      'Tap the button matching the target light pulse frequency.';

  @override
  String get yajilinTitle => 'Yajilin Loop';

  @override
  String get yajilinSubtitle =>
      'Place black cells and draw a single loop matching clues.';

  @override
  String get heyawakeTitle => 'Heyawake Grid';

  @override
  String get heyawakeSubtitle =>
      'Shade grid rooms without adjacent black cells.';

  @override
  String get gokigenVariantTitle => 'Gokigen Variant';

  @override
  String get gokigenVariantSubtitle =>
      'Draw loop-free diagonals meeting vertex counts.';

  @override
  String get sheepAndWolvesTitle => 'Sheep & Wolves';

  @override
  String get sheepAndWolvesSubtitle =>
      'Draw a loop separating sheep from wolves.';

  @override
  String get islandNurikabeTitle => 'Island Nurikabe';

  @override
  String get islandNurikabeSubtitle =>
      'Form islands matching numerical size constraints.';

  @override
  String get shakashakaTitle => 'Shakashaka Rects';

  @override
  String get shakashakaSubtitle =>
      'Place triangular tiles to form rectangular white areas.';

  @override
  String get litsTetrisTitle => 'LITS Tetromino';

  @override
  String get litsTetrisSubtitle =>
      'Place tetrominoes in rooms with no adjacent duplicates.';

  @override
  String get tapaWallTitle => 'Tapa Wall';

  @override
  String get tapaWallSubtitle =>
      'Shade cells to form a continuous black wall pattern.';

  @override
  String get triangularBridgesTitle => 'Triangular Bridges';

  @override
  String get triangularBridgesSubtitle =>
      'Connect islands in 3 directions meeting requirements.';

  @override
  String get rippleEffectTitle => 'Ripple Effect';

  @override
  String get rippleEffectSubtitle =>
      'Fill numbers in rooms respecting spacing distance constraints.';

  @override
  String get suguruTectonicTitle => 'Suguru Grid';

  @override
  String get suguruTectonicSubtitle =>
      'Fill room blocks with numbers 1 to K with no neighbors equal.';

  @override
  String get tennerGridTitle => 'Tenner Grid';

  @override
  String get tennerGridSubtitle =>
      'Fill rows with digits 0-9 matching column totals.';

  @override
  String get kakurasuSumsTitle => 'Kakurasu Sums';

  @override
  String get kakurasuSumsSubtitle =>
      'Shade cells to meet weighted row/col index sums.';

  @override
  String get corralLoopTitle => 'Corral Loop';

  @override
  String get corralLoopSubtitle =>
      'Draw a single loop enclosing numbers matching visibility.';

  @override
  String get stostoneTitle => 'Stostone Gravity';

  @override
  String get stostoneSubtitle =>
      'Shade cells that drop down to fill bottom rows perfectly.';

  @override
  String get tripletsLogicTitle => 'Triplets Trio';

  @override
  String get tripletsLogicSubtitle =>
      'Fill grid with three shapes avoiding three-in-a-row.';

  @override
  String get galaxiesSymTitle => 'Galaxies Symmetry';

  @override
  String get galaxiesSymSubtitle =>
      'Divide grid into rotationally symmetric galaxy shapes.';

  @override
  String get matrixMultiplierMatchTitle => 'Matrix Matcher';

  @override
  String get matrixMultiplierMatchSubtitle =>
      'Multiply row and column values to match target dot product.';

  @override
  String get primeFactorTreesTitle => 'Prime Factor Trees';

  @override
  String get primeFactorTreesSubtitle =>
      'Decompose composite numbers into prime leaf factor pairs.';

  @override
  String get vektorVectorTitle => 'Vector Vector';

  @override
  String get vektorVectorSubtitle =>
      'Scale vectors to make their sum land on the target.';

  @override
  String get binomialMatchTitle => 'Binomial Match';

  @override
  String get binomialMatchSubtitle =>
      'Match quadratic formulas with factored binomial values.';

  @override
  String get percentageShoppingTitle => 'Percentage Shopping';

  @override
  String get percentageShoppingSubtitle =>
      'Calculate discount percentages and final checkout totals.';

  @override
  String get cryptoArithmeticTitle => 'Crypto-Arithmetic';

  @override
  String get cryptoArithmeticSubtitle =>
      'Crack character-digit substitution cipher math problems.';

  @override
  String get fractionalPizzaTitle => 'Fractional Pizza';

  @override
  String get fractionalPizzaSubtitle =>
      'Partition pizza slices to match target sum fractions.';

  @override
  String get numberBondsTitle => 'Number Bonds';

  @override
  String get numberBondsSubtitle =>
      'Link node values to equal a target connection sum.';

  @override
  String get gridSumLineTitle => 'Grid Sum Line';

  @override
  String get gridSumLineSubtitle =>
      'Draw a path whose values evaluate exactly to the target.';

  @override
  String get binaryScaleBalanceTitle => 'Binary Scale Balance';

  @override
  String get binaryScaleBalanceSubtitle =>
      'Balance decimal weight using power-of-two blocks.';

  @override
  String get moduloPathTitle => 'Modulo Path';

  @override
  String get moduloPathSubtitle =>
      'Traverse grid cells matching modulo remainder values.';

  @override
  String get digitSwapEqTitle => 'Digit Swap Equations';

  @override
  String get digitSwapEqSubtitle =>
      'Swap single digits between equations to correct both.';

  @override
  String get areaPerimeterMatchTitle => 'Area & Perimeter';

  @override
  String get areaPerimeterMatchSubtitle =>
      'Draw rectangles matching target area and perimeter values.';

  @override
  String get inequalityBalanceOpsTitle => 'Inequality Balance';

  @override
  String get inequalityBalanceOpsSubtitle =>
      'Place inequality symbols between complex math terms.';

  @override
  String get graphCoordinatePlotTitle => 'Graph Plotter';

  @override
  String get graphCoordinatePlotSubtitle =>
      'Plot grid coordinates matching linear/quadratic curves.';

  @override
  String get baseConversionRunTitle => 'Base Conversion';

  @override
  String get baseConversionRunSubtitle =>
      'Convert values between binary, decimal, hex, and octal.';

  @override
  String get unitConverterProTitle => 'Unit Converter';

  @override
  String get unitConverterProSubtitle =>
      'Answer quick unit conversions under time limits.';

  @override
  String get auditoryNBackTitle => 'Auditory N-Back';

  @override
  String get auditoryNBackSubtitle =>
      'Match spoken letters heard N steps back from memory.';

  @override
  String get abstractPatternRecallTitle => 'Pattern Layering';

  @override
  String get abstractPatternRecallSubtitle =>
      'Reconstruct layered colorful shapes from memory study.';

  @override
  String get roomInspectorTitle => 'Room Inspector';

  @override
  String get roomInspectorSubtitle =>
      'Identify furniture modifications made while screen was blank.';

  @override
  String get voiceToFaceMatchTitle => 'Voice-Face Match';

  @override
  String get voiceToFaceMatchSubtitle =>
      'Select correct face associated with spoken audio voice clip.';

  @override
  String get spatialGridMemory3DTitle => '3D Spatial Memory';

  @override
  String get spatialGridMemory3DSubtitle =>
      'Recall flashed blocks in a rotated 3D cube grid structure.';

  @override
  String get sequenceStackTitle => 'Sequence Stack';

  @override
  String get sequenceStackSubtitle =>
      'Reconstruct plate stack additions and removals in order.';

  @override
  String get semanticCategoryRecallTitle => 'Category Recall';

  @override
  String get semanticCategoryRecallSubtitle =>
      'Identify study words matching requested category targets.';

  @override
  String get gridDisplacementTitle => 'Grid Displacement';

  @override
  String get gridDisplacementSubtitle =>
      'Identify shifted icons comparing layout to original.';

  @override
  String get soundSequenceMatchTitle => 'Sound Sequence Match';

  @override
  String get soundSequenceMatchSubtitle =>
      'Repeat note sequences played on a virtual keyboard.';

  @override
  String get cardCountingMemoryTitle => 'Card Counter';

  @override
  String get cardCountingMemorySubtitle =>
      'Identify cards already dealt in continuous card deal runs.';

  @override
  String get directionsRecallTitle => 'Directions Recall';

  @override
  String get directionsRecallSubtitle =>
      'Navigate grid maps matching path directions from memory.';

  @override
  String get eventTimelineMemoryTitle => 'Event Timeline';

  @override
  String get eventTimelineMemorySubtitle =>
      'Arrange historical/fictional event cards chronologically.';

  @override
  String get featureMatrixRecallTitle => 'Feature Matrix';

  @override
  String get featureMatrixRecallSubtitle =>
      'Answer query prompts about cell shape-color attributes.';

  @override
  String get delayedMatchSampleTitle => 'Delayed Match';

  @override
  String get delayedMatchSampleSubtitle =>
      'Match target symbol after solving math distractors.';

  @override
  String get symbolDigitAssocTitle => 'Symbol-Digit Assoc';

  @override
  String get symbolDigitAssocSubtitle =>
      'Solve symbol translation sheets matching digit keys.';

  @override
  String get dualTaskMemoryTitle => 'Dual-Task Memory';

  @override
  String get dualTaskMemorySubtitle =>
      'Memorize word sets while resolving quick arithmetic tasks.';

  @override
  String get actionSequenceRecallTitle => 'Action Recall';

  @override
  String get actionSequenceRecallSubtitle =>
      'Repeat character gesture animation sequences in order.';

  @override
  String get tangramPolygonTitle => 'Tangram Fit';

  @override
  String get tangramPolygonSubtitle =>
      'Arrange polygon shapes to fill silhouette outlines.';

  @override
  String get mazeNav3DTitle => '3D Maze Nav';

  @override
  String get mazeNav3DSubtitle =>
      'Navigate 3D isometric maze routes from first-person view.';

  @override
  String get isometricProjectionTitle => 'Isometric Projector';

  @override
  String get isometricProjectionSubtitle =>
      'Match 3D block figures to orthographic 2D top/front views.';

  @override
  String get polyominoPackingTitle => 'Polyomino Packing';

  @override
  String get polyominoPackingSubtitle =>
      'Pack random polyomino block pieces into target areas.';

  @override
  String get spatialGridRotationTitle => 'Spatial Grid Rotation';

  @override
  String get spatialGridRotationSubtitle =>
      'Match 3D block arrangements rotated along axis coordinates.';

  @override
  String get wireLoopGameTitle => 'Wire Loop';

  @override
  String get wireLoopGameSubtitle =>
      'Drag metal rings along wire splines without contact.';

  @override
  String get origamiUnfoldTitle => 'Origami Unfold';

  @override
  String get origamiUnfoldSubtitle =>
      'Identify hole punch patterns after unfolding folded sheets.';

  @override
  String get ropeTangleSolverTitle => 'Rope Untangler';

  @override
  String get ropeTangleSolverSubtitle =>
      'Drag nodes to layout planar graphs with zero line crosses.';

  @override
  String get gridFitTetrisTitle => 'Grid Fit Solver';

  @override
  String get gridFitTetrisSubtitle =>
      'Arrange static irregular blocks to fit container bounds.';

  @override
  String get vectorGridAlignmentTitle => 'Vector Alignment';

  @override
  String get vectorGridAlignmentSubtitle =>
      'Scale and rotate shapes to match shadow template targets.';

  @override
  String get blockStackingPhysicsTitle => 'Block Stacking';

  @override
  String get blockStackingPhysicsSubtitle =>
      'Stack irregular block panels balancing gravity weight.';

  @override
  String get crossSectionMatch3DTitle => '3D Cross Section';

  @override
  String get crossSectionMatch3DSubtitle =>
      'Identify 2D slice geometries cut from 3D shapes.';

  @override
  String get symmetryPaintTitle => 'Symmetry Paint';

  @override
  String get symmetryPaintSubtitle =>
      'Draw mirror image segments reflecting across symmetry axes.';

  @override
  String get rollingBlockBloxTitle => 'Rolling Block';

  @override
  String get rollingBlockBloxSubtitle =>
      'Roll block pieces to land vertically in target slots.';

  @override
  String get perspectiveShiftViewTitle => 'Perspective Shift';

  @override
  String get perspectiveShiftViewSubtitle =>
      'Rotate block clusters until they spell letters/words.';

  @override
  String get networkFlowSphericalTitle => 'Network Flow';

  @override
  String get networkFlowSphericalSubtitle =>
      'Connect grid flows on wrapping cylindrical coordinates.';

  @override
  String get layeredSilhouetteBlendTitle => 'Silhouette Blend';

  @override
  String get layeredSilhouetteBlendSubtitle =>
      'Stack colored layers to match target translucent shapes.';

  @override
  String get wordWheelPangramTitle => 'Word Anagrams';

  @override
  String get wordWheelPangramSubtitle =>
      'Construct words containing central target letters from wheels.';

  @override
  String get letterGridSwapperTitle => 'Letter Swapper';

  @override
  String get letterGridSwapperSubtitle =>
      'Swap adjacent letter tiles to complete row and col words.';

  @override
  String get synonymMatchTitle => 'Synonym Match';

  @override
  String get synonymMatchSubtitle =>
      'Match falling word targets with synonyms or antonyms.';

  @override
  String get vowelDropTitle => 'Vowel Drop';

  @override
  String get vowelDropSubtitle =>
      'Drop vowels into coordinate grids completing words.';

  @override
  String get letterBalanceScaleTitle => 'Word Balance Scale';

  @override
  String get letterBalanceScaleSubtitle =>
      'Spell words whose letter values balance weights.';

  @override
  String get wordChainShiritoriTitle => 'Word Chain';

  @override
  String get wordChainShiritoriSubtitle =>
      'Link word loops starting with preceding letter outputs.';

  @override
  String get affixBuilderTitle => 'Affix Builder';

  @override
  String get affixBuilderSubtitle =>
      'Combine prefixes/suffixes to construct target vocabularies.';

  @override
  String get decipherCrypticCluesTitle => 'Cryptic Decipher';

  @override
  String get decipherCrypticCluesSubtitle =>
      'Solve word-play puzzles and decrypt spelling riddles.';

  @override
  String get boggleWordSearchTitle => 'Boggle Connect';

  @override
  String get boggleWordSearchSubtitle =>
      'Trace adjacent connected paths to find hidden words.';

  @override
  String get idiomUnscrambleTitle => 'Idiom Unscramble';

  @override
  String get idiomUnscrambleSubtitle =>
      'Arrange scrambled word arrays to match idiom meanings.';

  @override
  String get letterPyramidsTitle => 'Letter Pyramids';

  @override
  String get letterPyramidsSubtitle =>
      'Build word towers adding single anagram letters per tier.';

  @override
  String get soundAlikeHomophonesTitle => 'Homophone Matches';

  @override
  String get soundAlikeHomophonesSubtitle =>
      'Identify correct homophone spellings for sentences.';

  @override
  String get wordGridSudokuTitle => 'Word Sudoku';

  @override
  String get wordGridSudokuSubtitle =>
      'Tesselate letters in grid rows forming words.';

  @override
  String get portmanteauFactoryTitle => 'Portmanteau Factory';

  @override
  String get portmanteauFactorySubtitle =>
      'Merge semantic components creating compound words.';

  @override
  String get codedCrosswordsCodeTitle => 'Codewords Crossword';

  @override
  String get codedCrosswordsCodeSubtitle =>
      'Solve grid crosswords matching number-to-letter codes.';

  @override
  String get wordSnakeTrailTitle => 'Word Snake';

  @override
  String get wordSnakeTrailSubtitle =>
      'Trace snake-like letter trails spelling thematic words.';

  @override
  String get typingRhythmSpeedTitle => 'Typing Flow';

  @override
  String get typingRhythmSpeedSubtitle =>
      'Type vocabularies matching metronome rhythm beats.';

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
