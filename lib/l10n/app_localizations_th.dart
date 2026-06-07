// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'Puzzle Hub';

  @override
  String get home => 'หน้าแรก';

  @override
  String get settings => 'การตั้งค่า';

  @override
  String get playAgain => 'เล่นอีกครั้ง';

  @override
  String get playNext => 'เล่นถัดไป';

  @override
  String get seeCompleted => 'รีวิว';

  @override
  String get finish => 'จบ';

  @override
  String get congrats => 'ยินดีด้วย';

  @override
  String get perfectGradient => 'ไล่เฉดสีได้สมบูรณ์แบบ!';

  @override
  String get wellDone => 'ทำได้ดีมาก';

  @override
  String get timeUp => 'หมดเวลา!';

  @override
  String get completed => 'เสร็จสิ้น!';

  @override
  String get score => 'คะแนน';

  @override
  String get timeLeft => 'เวลา';

  @override
  String get trials => 'จำนวนครั้ง';

  @override
  String get numberRule => 'กฎตัวเลข';

  @override
  String get colorRule => 'กฎสี';

  @override
  String get valid => 'ถูกต้อง';

  @override
  String get invalid => 'ไม่ถูกต้อง';

  @override
  String get even => 'คู่';

  @override
  String get odd => 'คี่';

  @override
  String get red => 'สีแดง';

  @override
  String get green => 'สีเขียว';

  @override
  String get blue => 'สีน้ำเงิน';

  @override
  String get yes => 'ใช่';

  @override
  String get no => 'ไม่ใช่';

  @override
  String get trueLabel => 'จริง';

  @override
  String get falseLabel => 'เท็จ';

  @override
  String get clear => 'ล้าง';

  @override
  String get north => 'เหนือ';

  @override
  String get south => 'ใต้';

  @override
  String get east => 'ตะวันออก';

  @override
  String get west => 'ตะวันตก';

  @override
  String get target => 'เป้าหมาย';

  @override
  String get moves => 'การเคลื่อนที่';

  @override
  String get trialMode => 'โหมดทดสอบ';

  @override
  String get trialModeDescription =>
      'แก้ให้ได้ 20 ข้อเพื่อจบแทนการจับเวลา 60 วินาที';

  @override
  String get appearance => 'รูปลักษณ์';

  @override
  String get language => 'ภาษา';

  @override
  String get gameplay => 'เกมเพลย์';

  @override
  String get supportUs => 'สนับสนุนเรา';

  @override
  String get systemLegal => 'ระบบและกฎหมาย';

  @override
  String get games => 'เกม';

  @override
  String get solvedToday => 'แก้ได้วันนี้';

  @override
  String get searchGames => 'ค้นหาเกม...';

  @override
  String get readyToStart => 'พร้อมที่จะเริ่มออกกำลังกายสมองหรือยัง?';

  @override
  String get greatStart => 'เริ่มต้นได้ดี! รักษาจังหวะนี้ไว้';

  @override
  String get onFire => 'สุดยอด! สมองของคุณกำลังสนุกกับสิ่งนี้';

  @override
  String get incredible => 'เหลือเชื่อ! คุณคือปรมาจารย์ปริศนา';

  @override
  String get noGamesMatch => 'ไม่พบเกมที่ตรงกับการค้นหาของคุณ';

  @override
  String get categoryAll => 'ทั้งหมด';

  @override
  String get categoryAttention => 'สมาธิ';

  @override
  String get categoryLogic => 'ตรรกะ';

  @override
  String get categoryMath => 'คณิตศาสตร์';

  @override
  String get categoryWord => 'คำศัพท์';

  @override
  String get categoryMemory => 'ความจำ';

  @override
  String get categorySpatial => 'มิติสัมพันธ์';

  @override
  String get themeLight => 'สว่าง';

  @override
  String get themeDark => 'มืด';

  @override
  String get themeSystem => 'ระบบ';

  @override
  String get starOnGithub => 'ให้ดาวบน GitHub';

  @override
  String get sponsorOnGithub => 'สนับสนุนบน GitHub';

  @override
  String get privacyPolicy => 'นโยบายความเป็นส่วนตัว';

  @override
  String get termsOfService => 'ข้อกำหนดการให้บริการ';

  @override
  String get licenses => 'ใบอนุญาต';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return 'คุณมีโอกาส $maxTries ครั้งในการหาคำศัพท์ $wordLength ตัวอักษรที่ซ่อนอยู่';
  }

  @override
  String wordFoundMessage(String word) {
    return 'พบคำศัพท์แล้ว: $word';
  }

  @override
  String gameOverMessage(String word) {
    return 'คำศัพท์คือ: $word';
  }

  @override
  String get gameOver => 'จบเกม';

  @override
  String get crosswordTitle => 'อักษรไขว้';

  @override
  String get crosswordSubtitle => 'เติมคำในตารางให้ถูกต้องตามคำใบ้ที่ให้ไว้';

  @override
  String get wordSearchTitle => 'ค้นหาคำ';

  @override
  String get radicalRootsTitle => 'รากที่สองและสาม';

  @override
  String get radicalRootsSubtitle =>
      'หาค่ารากที่สองหรือรากที่สามของตัวเลขที่กำหนด ปัดเศษเป็นจำนวนเต็มที่ใกล้ที่สุดหากจำเป็น';

  @override
  String get radicalRootsGoalReached => 'บรรลุเป้าหมาย!';

  @override
  String get radicalRootsTimeUp => 'หมดเวลา!';

  @override
  String radicalRootsScoreMessage(int score) {
    return 'คุณคำนวณรากได้ถูกต้อง $score ข้อ!';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return 'ฝึกฝนต่อไป! คุณคำนวณรากได้ $score ข้อ';
  }

  @override
  String get radicalRootsStart => 'เริ่มคำนวณ';

  @override
  String get radicalRootsDescription =>
      'คุณมีเวลา 60 วินาทีในการแก้ให้ได้มากที่สุด';

  @override
  String get radicalRootsBest => 'ดีที่สุด';

  @override
  String get radicalRootsSeconds => '60 วินาที';

  @override
  String get romanArithmeticTitle => 'คณิตศาสตร์โรมัน';

  @override
  String get romanArithmeticSubtitle => 'แก้โจทย์การบวกและลบโดยใช้ตัวเลขโรมัน';

  @override
  String get romanArithmeticGoalReached => 'ระดับเซ็นจูเรียน!';

  @override
  String get romanArithmeticTimeUp => 'หมดเวลา!';

  @override
  String romanArithmeticScoreMessage(int score) {
    return 'คุณแก้โจทย์โรมันได้ $score ข้อ!';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return 'Veni, Vidi, Vici! คุณแก้โจทย์ได้ $score ข้อ';
  }

  @override
  String get romanArithmeticStart => 'เริ่มภารกิจ';

  @override
  String get romanArithmeticDescription =>
      'แปลงค่าและแก้โจทย์ คุณมีเวลา 60 วินาที';

  @override
  String get romanArithmeticBest => 'ดีที่สุด';

  @override
  String get romanArithmeticSeconds => '60 วินาที';

  @override
  String get wordSearchSubtitle =>
      'หาคำที่ซ่อนอยู่ทั้งหมดในตาราง ลากเพื่อเลือก';

  @override
  String get missingVowelsTitle => 'สระที่หายไป';

  @override
  String get missingVowelsSubtitle => 'ระบุคำศัพท์ที่ซ่อนสระไว้';

  @override
  String get missingVowelsWin => 'กู้คืนสระสำเร็จ!';

  @override
  String get missingVowelsHowToPlay =>
      'คำศัพท์จะแสดงโดยซ่อนสระ (A, E, I, O, U) ไว้ ทายคำศัพท์ที่สมบูรณ์!';

  @override
  String get wordScrambleTitle => 'เรียงอักษร';

  @override
  String get wordScrambleSubtitle =>
      'แตะตัวอักษรเพื่อเรียงคำที่ซ่อนอยู่ให้ถูกต้อง!';

  @override
  String get wordScrambleWin => 'ไขปริศนาคำศัพท์สำเร็จ!';

  @override
  String get sudokuTitle => 'ซูโดกุ';

  @override
  String get sudokuSubtitle =>
      'เติมตัวเลขในตารางเพื่อให้ทุกแถว คอลัมน์ และบล็อก 3x3 มีตัวเลข 1 ถึง 9 ครบถ้วน';

  @override
  String get minesweeperTitle => 'หาระเบิด';

  @override
  String get minesweeperSubtitle =>
      'ระบุตำแหน่งระเบิดทั้งหมดโดยไม่ให้ระเบิดทำงาน';

  @override
  String get minesweeperWin => 'ชัยชนะ!';

  @override
  String get minesweeperMines => 'ระเบิด';

  @override
  String get minesweeperStatus => 'สถานะ';

  @override
  String get minesweeperWon => 'ชนะ';

  @override
  String get minesweeperBoom => 'ตู้ม!';

  @override
  String get minesweeperPlaying => 'กำลังเล่น';

  @override
  String get minesweeperReveal => 'เปิด';

  @override
  String get minesweeperFlag => 'ปักธง';

  @override
  String get game2048Title => '2048';

  @override
  String get game2048Subtitle =>
      'ปัดในทิศทางใดก็ได้เพื่อรวมแผ่นตัวเลขและไปให้ถึง 2048!';

  @override
  String get nonogramTitle => 'โนโนแกรม';

  @override
  String get nonogramSubtitle => 'เปิดเผยภาพที่ซ่อนอยู่โดยใช้คำใบ้ตรรกะ';

  @override
  String get nonogramWin => 'เปิดเผยภาพสำเร็จ!';

  @override
  String get magnetsTitle => 'แม่เหล็ก';

  @override
  String get magnetsSubtitle => 'วางแม่เหล็กในตารางตามจำนวนขั้ว';

  @override
  String get magnetsHowToPlay =>
      'เติมคอนเทนเนอร์ขนาดเท่าโดมิโนด้วยแม่เหล็ก \'+\' และ \'-\' หรือปล่อยว่างไว้ คำใบ้ในแถวและคอลัมน์จะระบุจำนวนรวมของแต่ละขั้วในเส้นนั้น ขั้วที่เหมือนกันไม่สามารถอยู่ติดกันในแนวตั้งหรือแนวนอนได้';

  @override
  String get magnetsWinTitle => 'ปรับสมดุลขั้วแม่เหล็กแล้ว!';

  @override
  String get magnetsWinMessage => 'แม่เหล็กทั้งหมดถูกจัดเรียงอย่างสมบูรณ์แบบ!';

  @override
  String get lighthousesTitle => 'ประภาคาร';

  @override
  String get lighthousesSubtitle => 'วางเรือตามคำใบ้ของประภาคาร';

  @override
  String get lighthousesHowToPlay =>
      'วางเรือขนาด 1x1 ในตาราง ประภาคารจะระบุจำนวนรวมของเรือที่มองเห็นได้ในแนวตั้งและแนวนอน เรือไม่สามารถสัมผัสประภาคารหรือสัมผัสกันเองได้ แม้แต่ในแนวทแยง';

  @override
  String get lighthousesWinTitle => 'ท้องทะเลปลอดภัย!';

  @override
  String get lighthousesWinMessage =>
      'ประภาคารทั้งหมดกำลังนำทางเรืออย่างสมบูรณ์แบบ!';

  @override
  String get dominosaTitle => 'โดมิโนซา';

  @override
  String get dominosaSubtitle => 'หาโดมิโนที่ซ่อนอยู่ทั้งหมดในตาราง';

  @override
  String get dominosaHowToPlay =>
      'จัดเรียงชุดโดมิโนที่สมบูรณ์บนตารางตัวเลข โดยที่ตัวเลขคู่ที่อยู่ติดกันแต่ละคู่จะถูกครอบคลุมด้วยโดมิโนเพียงหนึ่งตัวเท่านั้น ตัวเลขแต่ละคู่จะมีเพียงครั้งเดียวในชุด';

  @override
  String get dominosaWinTitle => 'ปรมาจารย์โดมิโน!';

  @override
  String get dominosaWinMessage => 'พบและวางโดมิโนทุกตัวแล้ว!';

  @override
  String get skyscrapersTitle => 'ตึกระฟ้า';

  @override
  String get skyscrapersSubtitle => 'เติมความสูงของตึกลงในตาราง';

  @override
  String get skyscrapersHowToPlay =>
      'เติมความสูง (1-N) ลงในตาราง โดยที่แต่ละแถวและคอลัมน์จะต้องมีความสูงแต่ละค่าเพียงครั้งเดียวเท่านั้น คำใบ้ที่ขอบจะระบุจำนวนตึกที่มองเห็นได้จากทิศทางนั้น โดยตึกที่สูงกว่าจะบังตึกที่เตี้ยกว่า';

  @override
  String get skyscrapersWinTitle => 'เส้นขอบฟ้าถูกฟื้นฟู!';

  @override
  String get skyscrapersWinMessage => 'อาคารทั้งหมดถูกจัดวางอย่างสมบูรณ์แบบ!';

  @override
  String get nurikabeTitle => 'นูริคาเบะ';

  @override
  String get nurikabeSubtitle => 'สร้างทะเลที่เชื่อมต่อกันและแยกเกาะออกจากกัน';

  @override
  String get nurikabeHowToPlay =>
      'ระบายสีเซลล์เพื่อสร้าง \'ทะเล\' ที่เชื่อมต่อกันเพียงหนึ่งเดียว (ห้ามมีบล็อกขนาด 2x2) เซลล์ที่ไม่ได้ระบายสีจะกลายเป็น \'เกาะ\' ซึ่งแต่ละเกาะจะมีตัวเลขเพียงหนึ่งตัวที่แสดงถึงพื้นที่ทั้งหมดของเกาะนั้น';

  @override
  String get nurikabeWinTitle => 'ทะเลไหลลื่น!';

  @override
  String get nurikabeWinMessage => 'เกาะถูกแยกออก ทะเลเชื่อมต่อกันแล้ว!';

  @override
  String get fillominoTitle => 'ฟิลโลมิโน';

  @override
  String get fillominoSubtitle => 'แบ่งตารางออกเป็นโพลีโอมิโนตามขนาดที่กำหนด';

  @override
  String get fillominoHowToPlay =>
      'แบ่งตารางออกเป็นโพลีโอมิโน โดยที่โพลีโอมิโนขนาด Nแต่ละอันจะต้องมีตัวเลข N ในเซลล์ทั้งหมด โพลีโอมิโนที่มีขนาดเท่ากันไม่สามารถอยู่ติดกันในแนวตั้งหรือแนวนอนได้';

  @override
  String get fillominoWinTitle => 'แบ่งตารางแล้ว!';

  @override
  String get fillominoWinMessage => 'ปูด้วยตรรกะอย่างสมบูรณ์แบบ!';

  @override
  String get hitoriTitle => 'ฮิโตริ';

  @override
  String get hitoriSubtitle => 'ระบายสีตัวเลขที่ซ้ำกันในแต่ละแถวและคอลัมน์';

  @override
  String get hitoriHowToPlay =>
      'ระบายสีเซลล์เพื่อไม่ให้มีตัวเลขใดปรากฏมากกว่าหนึ่งครั้งในแถวหรือคอลัมน์ใดๆ เซลล์ที่ระบายสีไม่สามารถอยู่ติดกันได้ (ในแนวตั้งหรือแนวนอน) และเซลล์ที่ไม่ได้ระบายสีทั้งหมดจะต้องรวมกันเป็นกลุ่มเดียวที่เชื่อมต่อกัน';

  @override
  String get hitoriWinTitle => 'ปรมาจารย์ฮิโตริ!';

  @override
  String get hitoriWinMessage => 'คุณแก้ไขตัวเลขที่ซ้ำกันทั้งหมดได้สำเร็จ!';

  @override
  String get pathFinderTitle => 'หาเส้นทาง';

  @override
  String get pathFinderSubtitle => 'หาเส้นทางที่ซ่อนอยู่จาก S ไป E';

  @override
  String get pathFinderWin => 'เชี่ยวชาญเส้นทาง!';

  @override
  String get howToPlay => 'วิธีเล่น';

  @override
  String get gotIt => 'เข้าใจแล้ว';

  @override
  String get akariTitle => 'อาคาริ';

  @override
  String get akariSubtitle => 'ส่องสว่างช่องสีขาวทั้งหมด';

  @override
  String get akariHowToPlay =>
      'วางหลอดไฟในช่องสีขาวเพื่อส่องสว่างทั้งตาราง หลอดไฟจะส่องสว่างทั้งแถวและคอลัมน์จนกว่าจะชนกำแพง หลอดไฟสองดวงไม่สามารถส่องถึงกันได้ กำแพงที่มีตัวเลขจะบอกว่าต้องวางหลอดไฟในช่องที่ติดกัน (บน ล่าง ซ้าย ขวา) กี่ดวง';

  @override
  String get akariWinTitle => 'ไฟสว่างแล้ว!';

  @override
  String get akariWinMessage => 'ทุกอย่างสว่างไสวอย่างสมบูรณ์แบบ';

  @override
  String get arithmeticChainTitle => 'คำนวณต่อเนื่อง';

  @override
  String get arithmeticChainSubtitle => 'คำนวณผลรวมสะสมในใจ';

  @override
  String get arithmeticChainWinTitle => 'เลเวลอัป!';

  @override
  String get arithmeticChainWinMessage => 'การคำนวณในใจของคุณเฉียบคมมาก!';

  @override
  String get arithmeticChainLoseTitle => 'ลองอีกครั้ง';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return 'คำตอบที่ถูกต้องคือ $answer';
  }

  @override
  String get arithmeticChainStart => 'เริ่ม';

  @override
  String get arithmeticChainNext => 'ถัดไป';

  @override
  String get attentionalBlinkTitle => 'สมาธิฉับพลัน';

  @override
  String get attentionalBlinkSubtitleWatch => 'มองหาตัวเลข';

  @override
  String get attentionalBlinkSubtitleInput => 'ใส่ตัวเลขสองตัวที่คุณเห็น';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return 'คุณทำคะแนนเป้าหมายได้ $score แต้ม!';
  }

  @override
  String get balanceScaleTitle => 'ตาชั่งสมดุล';

  @override
  String get balanceScaleSubtitle => 'สรุปน้ำหนักของชิ้นสุดท้ายตามตาชั่ง';

  @override
  String get balanceScaleWinTitle => 'สมดุล!';

  @override
  String get balanceScaleWinMessage => 'คุณสรุปน้ำหนักได้ถูกต้อง!';

  @override
  String get balanceScaleLoseTitle => 'ไม่สมดุล';

  @override
  String get balanceScaleLoseMessage => 'ลองอีกครั้งเพื่อหาสมดุลที่ถูกต้อง';

  @override
  String get balanceScaleBack => 'กลับ';

  @override
  String get balanceScaleSubmit => 'ส่ง';

  @override
  String get binaryPuzzleTitle => 'ปริศนาไบนารี';

  @override
  String get binaryPuzzleSubtitle =>
      'เติมด้วย 0 และ 1 ห้ามมีตัวเลขเดียวกันติดกันเกินสองตัว แต่ละแถวและคอลัมน์ต้องมีจำนวน 0 และ 1 เท่ากัน';

  @override
  String get binaryPuzzleWinTitle => 'ทำได้ดีมาก';

  @override
  String get binaryPuzzleWinMessage =>
      'คุณแก้ปริศนาไบนารีด้วยตรรกะที่สมบูรณ์แบบ!';

  @override
  String get blockEscapeTitle => 'บล็อกหนี';

  @override
  String get blockEscapeSubtitle =>
      'เลื่อนบล็อกเพื่อเปิดเส้นทางให้บล็อกหลักไปถึงทางออก';

  @override
  String get blockEscapeWinTitle => 'หนีพ้น!';

  @override
  String get blockEscapeWinMessage => 'คุณเปิดเส้นทางให้บล็อกหลักสำเร็จแล้ว!';

  @override
  String get boxCompletionTitle => 'ประกอบกล่อง';

  @override
  String get boxCompletionSubtitle => 'ลูกบาศก์ใดที่สามารถประกอบได้?';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return 'คุณตอบถูก $score จาก $totalTrials ข้อ!';
  }

  @override
  String get boxCompletionOptions => 'ตัวเลือก';

  @override
  String get bridgesTitle => 'สะพาน';

  @override
  String get bridgesSubtitle =>
      'เชื่อมต่อเกาะด้วยสะพาน แต่ละเกาะต้องการจำนวนสะพานที่เจาะจง สะพานห้ามตัดกัน';

  @override
  String get bridgesWinTitle => 'เชื่อมต่อสำเร็จ!';

  @override
  String get bridgesWinMessage => 'คุณเชื่อมต่อเกาะทั้งหมดสำเร็จแล้ว!';

  @override
  String get calculationSprintTitle => 'แข่งคำนวณ';

  @override
  String get calculationSprintSubtitle => 'แก้สมการให้ได้มากที่สุดใน 60 วินาที';

  @override
  String get calculationSprintGoalReached => 'บรรลุเป้าหมาย!';

  @override
  String get calculationSprintTimeUp => 'หมดเวลา';

  @override
  String calculationSprintScoreMessage(int score) {
    return 'ความเร็วในการคำนวณยอดเยี่ยมมาก! คุณได้ $score คะแนน';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return 'คุณได้ $score คะแนน ลองทำลายสถิติเดิมดู!';
  }

  @override
  String get calculationSprintBest => 'ดีที่สุด';

  @override
  String get calculationSprintSeconds => '60 วินาที';

  @override
  String get calculationSprintDescription =>
      'แก้สมการอย่างรวดเร็ว\nคำตอบผิดจะหักเวลา 3 วินาที!';

  @override
  String get calculationSprintStart => 'เริ่มแข่ง';

  @override
  String get categoryFluencyTitle => 'ความคล่องแคล่วทางหมวดหมู่';

  @override
  String get categoryFluencySubtitle => 'ระบุคำที่อยู่ในหมวดหมู่';

  @override
  String get categoryFluencyExpert => 'ผู้เชี่ยวชาญภาษา!';

  @override
  String get categoryFluencyTimeUp => 'หมดเวลา!';

  @override
  String get categoryFluencyWinMessage => 'คุณมีคลังคำศัพท์ที่กว้างขวางมาก!';

  @override
  String categoryFluencyFoundMessage(int count) {
    return 'คุณพบคำศัพท์ $count คำ';
  }

  @override
  String get categoryFluencyCategoryLabel => 'หมวดหมู่:';

  @override
  String get categoryFluencyEnterItem => 'ระบุสิ่งของ...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target คำ';
  }

  @override
  String get changeBlindnessTitle => 'การตาบอดต่อการเปลี่ยนแปลง';

  @override
  String get changeBlindnessSubtitle => 'จับผิดภาพที่เปลี่ยนไป';

  @override
  String changeBlindnessScore(int score) {
    return 'คะแนน: $score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return 'คุณพบจุดเปลี่ยน $score จุด!';
  }

  @override
  String get choiceRtTitle => 'เวลาตอบสนองเชิงเลือก';

  @override
  String get choiceRtSubtitle => 'แตะช่องที่ใช้งานให้เร็วที่สุดเท่าที่จะทำได้';

  @override
  String choiceRtAvgMessage(String avg) {
    return 'เวลาตอบสนองเฉลี่ยของคุณ: ${avg}ms';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return 'เวลาที่เหลือ: ${time}s';
  }

  @override
  String choiceRtTaps(int count) {
    return 'การแตะ: $count';
  }

  @override
  String get colorFloodTitle => 'สีท่วม';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return 'จำนวนครั้ง: $moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => 'สีท่วมสำเร็จ!';

  @override
  String get colorFloodDryLand => 'แผ่นดินแห้งผาก...';

  @override
  String get colorFloodWinMessage => 'คุณเติมสีจนเต็มตารางแล้ว!';

  @override
  String get colorFloodLoseMessage => 'คุณใช้จำนวนครั้งหมดแล้ว ลองใหม่นะ!';

  @override
  String get colorMatchTitle => 'จับคู่สี';

  @override
  String get colorMatchSubtitle =>
      'ปรับแถบเลื่อนเพื่อให้ตรงกับสีเป้าหมายให้มากที่สุด';

  @override
  String get colorMatchTarget => 'เป้าหมาย';

  @override
  String get colorMatchYours => 'ของคุณ';

  @override
  String get colorMatchCheck => 'ตรวจสอบความใกล้เคียง';

  @override
  String get colorMatchResult => 'ผลลัพธ์';

  @override
  String colorMatchAccuracy(String accuracy) {
    return 'ความแม่นยำของคุณ: $accuracy%';
  }

  @override
  String get corsiBlocksTitle => 'บล็อกคอร์ซี่';

  @override
  String get corsiBlocksSubtitle => 'ดูบล็อกที่สว่างขึ้นแล้วแตะตามลำดับเดิม';

  @override
  String get corsiBlocksWinTitle => 'ปรมาจารย์ด้านมิติสัมพันธ์!';

  @override
  String get corsiBlocksLoseTitle => 'หลงทางในอวกาศ';

  @override
  String corsiBlocksMessage(int score, int span) {
    return 'คุณจำลำดับได้ $score ชุด! ระดับความจำด้านมิติสัมพันธ์ของคุณถึง $span';
  }

  @override
  String get corsiBlocksWatch => 'จดจำรูปแบบ';

  @override
  String get corsiBlocksRepeat => 'ทำตามรูปแบบ';

  @override
  String get corsiBlocksExcellent => 'ยอดเยี่ยม!';

  @override
  String get corsiBlocksSpan => 'ระดับความกว้าง';

  @override
  String get crownTitle => 'มงกุฎ';

  @override
  String get crownSubtitle =>
      'วางมงกุฎหนึ่งอันในแต่ละแถว คอลัมน์ และภูมิภาคสี มงกุฎห้ามวางติดกัน แม้แต่แนวทแยง';

  @override
  String get crownCrowned => 'วางมงกุฎแล้ว!';

  @override
  String get crownSuccess => 'วางมงกุฎทั้งหมดสำเร็จด้วยตรรกะที่สมบูรณ์แบบ';

  @override
  String get cryptogramTitle => 'รหัสลับ';

  @override
  String get cryptogramSubtitle =>
      'กำหนดตัวอักษรเพื่อถอดรหัสข้อความลับ! ตัวอักษรที่เข้ารหัสแต่ละตัวแทนตัวอักษรจริงหนึ่งตัว';

  @override
  String get cryptogramBroken => 'ถอดรหัสสำเร็จ!';

  @override
  String get cryptogramEncrypted => 'รหัสลับ';

  @override
  String get cryptogramSuccess => 'คุณถอดรหัสข้อความได้อย่างสมบูรณ์แบบ';

  @override
  String get cryptogramTryAgain => 'ลองใหม่เพื่อทำลายการเข้ารหัส';

  @override
  String get digitSpanReverseTitle => 'ความจำเลขถอยหลัง';

  @override
  String get digitSpanReverseSubtitleMemorize => 'จดจำตัวเลข';

  @override
  String get digitSpanReverseSubtitleEnter => 'ใส่ตัวเลขตามลำดับย้อนกลับ';

  @override
  String get digitSpanReverseWinTitle => 'เลเวลอัป!';

  @override
  String get digitSpanReverseWinMessage =>
      'ความจำระยะสั้นของคุณน่าประทับใจมาก!';

  @override
  String get digitSpanReverseLoseTitle => 'ลองอีกครั้ง';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return 'ลำดับย้อนกลับที่ถูกต้องคือ $sequence';
  }

  @override
  String get dividedAttentionTitle => 'การแบ่งสมาธิ';

  @override
  String get dividedAttentionSubtitle =>
      'แตะซ้ายเพื่อ ดาว ⭐ | แตะขวาเพื่อ แดง 🔴';

  @override
  String get dividedAttentionGameOverTitle => 'เสียสมาธิ';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return 'การทำหลายอย่างพร้อมกันมันยากนะ! คะแนนของคุณคือ $score';
  }

  @override
  String dividedAttentionScore(int score) {
    return 'คะแนน: $score';
  }

  @override
  String get doubleNBackTitle => 'Double N-Back';

  @override
  String doubleNBackSubtitle(int n) {
    return 'จับคู่สิ่งเร้าถอยหลังไป $n ขั้น';
  }

  @override
  String get doubleNBackGameOverTitle => 'จบเกม';

  @override
  String doubleNBackGameOverMessage(int score) {
    return 'คุณได้ $score คะแนนใน Double N-Back!';
  }

  @override
  String doubleNBackScore(int score) {
    return 'คะแนน: $score';
  }

  @override
  String get doubleNBackPositionMatch => 'ตำแหน่งตรงกัน';

  @override
  String get doubleNBackLetterMatch => 'ตัวอักษรตรงกัน';

  @override
  String get faceNameAssociationTitle => 'ชื่อและใบหน้า';

  @override
  String get faceNameAssociationSubtitleStudy => 'จดจำชื่อของแต่ละใบหน้า';

  @override
  String get faceNameAssociationSubtitleTest => 'คนนี้คือใคร?';

  @override
  String get faceNameAssociationPerfect => 'สมบูรณ์แบบ!';

  @override
  String get faceNameAssociationGameOver => 'จบเกม';

  @override
  String get faceNameAssociationWinMessage =>
      'คุณมีความจำด้านใบหน้าและชื่อที่ยอดเยี่ยมมาก!';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return 'คุณทำถูก $correct จากทั้งหมด $total ข้อ';
  }

  @override
  String get faceNameAssociationStartTest => 'เริ่มแบบทดสอบ';

  @override
  String get flankerTestWinTitle => 'สมาธิเฉียบคม!';

  @override
  String get flankerTestLoseTitle => 'วอกแวก';

  @override
  String flankerTestScoreMessage(int score) {
    return 'คุณทำได้ถูกต้อง $score ข้อ!';
  }

  @override
  String get flankerTestTitle => 'การทดสอบแฟรงเกอร์';

  @override
  String get flankerTestSubtitle =>
      'ระบุทิศทางของลูกศรตรงกลาง โดยไม่ต้องสนใจลูกศรด้านข้าง';

  @override
  String get flankerTestLeft => 'ซ้าย';

  @override
  String get flankerTestRight => 'ขวา';

  @override
  String get fractionMatchTitle => 'จับคู่เศษส่วน';

  @override
  String get fractionMatchSubtitle => 'จับคู่รูปภาพกับเศษส่วนให้ถูกต้อง';

  @override
  String get fractionMatchLoseTitle => 'เศษส่วนไม่ตรงกัน';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return 'คำตอบที่ถูกต้องคือ $correctAnswer';
  }

  @override
  String get goNoGoTitle => 'ไป / ไม่ไป';

  @override
  String get goNoGoSubtitle => 'แตะเมื่อเป็นสีเขียว ข้ามเมื่อเป็นสีแดง!';

  @override
  String get goNoGoLoseTitle => 'การตอบสนองหยุดชะงัก';

  @override
  String get goNoGoLoseMessage =>
      'การควบคุมการยับยั้งชั่งใจของคุณกำลังถูกทดสอบ!';

  @override
  String get goNoGoTapAnywhere => 'แตะตรงไหนก็ได้เพื่อไปต่อ';

  @override
  String get groceryListTitle => 'รายการซื้อของ';

  @override
  String get groceryListSubtitleMemorize => 'จดจำรายการและหมวดหมู่ของมัน';

  @override
  String get groceryListSubtitleTest => 'รายการนี้อยู่ในหมวดหมู่ใด?';

  @override
  String get groceryListWinTitle => 'กูรูด้านการช้อป!';

  @override
  String get groceryListLoseTitle => 'ลืมอะไรไปหรือเปล่า?';

  @override
  String groceryListScoreMessage(int score) {
    return 'คุณได้ $score คะแนนในรายการซื้อของ!';
  }

  @override
  String get groceryListReady => 'ฉันพร้อมแล้ว';

  @override
  String get groceryListWhereBelong => 'สิ่งนี้ควรอยู่ที่ไหน?';

  @override
  String get hueSortTitle => 'เรียงเฉดสี';

  @override
  String get hueSortSubtitle =>
      'สลับแผ่นสีเพื่อให้เกิดการไล่เฉดสีที่ราบรื่นระหว่างมุม จุดแสดงถึงแผ่นที่ถูกล็อกไว้';

  @override
  String get hueSortWinTitle => 'ไล่เฉดสีได้สมบูรณ์แบบ!';

  @override
  String get hueSortWinMessage => 'คุณจัดเรียงสเปกตรัมสีได้สมบูรณ์แบบ!';

  @override
  String hueSortWrongTiles(int count) {
    return 'แผ่นสีที่อยู่ในตำแหน่งผิด: $count';
  }

  @override
  String get kenkenTitle => 'เคนเคน';

  @override
  String get kenkenWinTitle => 'อัจฉริยะ!';

  @override
  String get kenkenLoseTitle => 'จบเกม';

  @override
  String get kenkenWinMessage => 'คุณแก้ปริศนาเคนเคนสำเร็จ!';

  @override
  String get kenkenLoseMessage => 'ตรวจสอบแถว คอลัมน์ และกฎในกรง';

  @override
  String kenkenSubtitle(int size) {
    return 'เติมตัวเลข 1-$size โดยไม่ซ้ำในแถว/คอลัมน์';
  }

  @override
  String get letterCancellationTitle => 'ยกเลิกตัวอักษร';

  @override
  String get letterCancellationTitleFull => 'การยกเลิกตัวอักษร';

  @override
  String letterCancellationScoreMessage(int score) {
    return 'คุณพบตัวอักษร $score ตัว!';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return 'ค้นหาตัวอักษร \"$target\" ทั้งหมด';
  }

  @override
  String get letterCancellationFound => 'พบแล้ว';

  @override
  String get letterCancellationTime => 'เวลา';

  @override
  String get lightsOutTitle => 'ปิดไฟ';

  @override
  String get lightsOutSubtitle =>
      'การแตะที่แผ่นจะสลับสถานะของตัวมันเองและแผ่นที่อยู่ติดกัน ปิดไฟทั้งหมดเพื่อแก้ปริศนา';

  @override
  String get lightsOutWinTitle => 'แก้ปริศนาสำเร็จ!';

  @override
  String get lightsOutWinMessage => 'คุณปิดไฟทั้งหมดสำเร็จแล้ว!';

  @override
  String get symmetryTitle => 'สมมาตร';

  @override
  String get symmetrySubtitle => 'สะท้อนรูปแบบจากด้านซ้ายลงในตารางว่างด้านขวา';

  @override
  String get semanticLinkTitle => 'ความหมายเชื่อมโยง';

  @override
  String get semanticLinkSubtitle =>
      'หาคำศัพท์ที่เชื่อมโยงทั้งสามคำเข้าด้วยกัน';

  @override
  String get reflexTapTitle => 'แตะตอบสนอง';

  @override
  String get visualStatisticalLearningTitle => 'จบเกม';

  @override
  String get orbitTapTitle => 'แตะวงโคจร';

  @override
  String get orbitTapSubtitle => 'แตะเมื่อลูกบอลตรงกับประตู';

  @override
  String get schulteTableTitle => 'มีสมาธิดีเยี่ยม!';

  @override
  String get multipleObjectTrackingTitle => 'ติดตามวัตถุ';

  @override
  String get multipleObjectTrackingSubtitle =>
      'ดูวัตถุที่ไฮไลต์ ติดตามวัตถุขณะเคลื่อนที่ แล้วเลือกวัตถุเหล่านั้น';

  @override
  String get sdmtTitle => 'Sdmt Test';

  @override
  String get sdmtSubtitle => 'ใช้รหัสข้างบนเพื่อหาตัวเลขสำหรับสัญลักษณ์ที่แสดง';

  @override
  String get memoryMatrixTitle => 'บรรลุเป้าหมาย!';

  @override
  String get memoryMatrixSubtitle => 'จดจำรูปแบบแล้วแตะช่องเหล่านั้น';

  @override
  String get mentalAbacusTitle => 'ปรมาจารย์ลูกคิด!';

  @override
  String get mentalAbacusSubtitle => 'แก้โจทย์โดยใช้ลูกคิดญี่ปุ่น (Soroban)';

  @override
  String get spellingSprintTitle => 'แข่งสะกดคำ';

  @override
  String get spellingSprintSubtitle => 'แข่งกับเวลาเพื่อสะกดคำให้ได้มากที่สุด';

  @override
  String get stopSignalTitle => 'สัญญาณหยุด';

  @override
  String get stopSignalSubtitle =>
      'แตะตามทิศทางลูกศร แต่ต้องหยุดทันทีถ้าลูกศรกลายเป็นสีแดง';

  @override
  String get staircaseMemoryTitle => 'ความจำขั้นบันได';

  @override
  String get vigilanceTaskTitle => 'ภารกิจเฝ้าระวัง';

  @override
  String get vigilanceTaskSubtitle => 'แตะปุ่มเมื่อเข็มข้ามตำแหน่งไป';

  @override
  String get logicalSyllogismsTitle => 'ตรรกบท';

  @override
  String get logicalSyllogismsSubtitle =>
      'ข้อสรุปนั้นสมเหตุสมผลตามตรรกะหรือไม่?';

  @override
  String get mathPathTitle => 'เส้นทางคณิต';

  @override
  String get mathPathSubtitle => 'หาเส้นทางที่มีผลรวมเท่ากับเป้าหมายพอดี';

  @override
  String get sternbergTaskTitle => 'แบบทดสอบสเติร์นเบิร์ก';

  @override
  String get sternbergTaskMemorize => 'จดจำตัวอักษร';

  @override
  String get sternbergTaskWasLetterSet =>
      'ตัวอักษรนี้อยู่ในชุดก่อนหน้าหรือไม่?';

  @override
  String sternbergTaskScore(int score) {
    return 'คุณได้ $score คะแนนในแบบทดสอบสเติร์นเบิร์ก!';
  }

  @override
  String get verbalAnalogiesTitle => 'ปรมาจารย์การเปรียบเทียบ!';

  @override
  String get verbalAnalogiesSubtitle => 'เติมความสัมพันธ์ให้สมบูรณ์';

  @override
  String get typingSpeedTitle => 'ความเร็วในการพิมพ์';

  @override
  String get typingSpeedSubtitle => 'พิมพ์วลีตามที่แสดงให้เร็วและแม่นยำที่สุด!';

  @override
  String get wordLadderTitle => 'บันไดคำศัพท์';

  @override
  String get wordLadderSubtitle =>
      'เชื่อมต่อคำศัพท์โดยการเปลี่ยนตัวอักษรทีละตัว';

  @override
  String get tangleFixTitle => 'แก้ปม!';

  @override
  String get tangleFixSubtitle => 'แก้เส้นไม่ให้พันกันและห้ามให้เส้นตัดกัน';

  @override
  String get oddRotationTitle => 'หมุนที่แตกต่าง';

  @override
  String get oddRotationSubtitle => 'หนึ่งในภาพนี้ถูกสะท้อนกลับ คุณหาเจอไหม?';

  @override
  String get towerOfLondonTitle => 'หอคอยลอนดอน';

  @override
  String get towerOfLondonSubtitle => 'จัดเรียงให้ตรงกับเป้าหมาย';

  @override
  String get symbolicFlankerTitle => 'สัญลักษณ์แฟรงเกอร์';

  @override
  String get symbolicFlankerSubtitle => 'เพ่งความสนใจไปที่สัญลักษณ์ตรงกลาง';

  @override
  String get stroopTestTitle => 'การทดสอบสตรูป';

  @override
  String get stroopTestSubtitle =>
      'ระบุสีหมึกของคำที่แสดง อย่าสนใจความหมายของคำ!';

  @override
  String get wisconsinCardSortingTitle => 'จบเกม';

  @override
  String get wisconsinCardSortingSubtitle => 'จับคู่การ์ดกับหนึ่งในสี่ใบด้านบน';

  @override
  String get nBackTitle => 'N-Back Test';

  @override
  String get nBackSubtitle =>
      'แตะตรงกันถ้าตัวอักษรปัจจุบันตรงกับตัวที่แสดงเมื่อ 2 ขั้นตอนก่อนหน้า';

  @override
  String get rhythmMasterTitle => 'จังหวะมาสเตอร์';

  @override
  String get rhythmMasterSubtitle => 'แตะให้ตรงกับจังหวะ';

  @override
  String get pixelMimicTitle => 'เลียนแบบพิกเซล';

  @override
  String get targetNumberTitle => 'เป้าหมาย 24';

  @override
  String targetNumberSubtitle(int target) {
    return 'ใช้ตัวเลขทั้ง 4 ตัวเพื่อให้ได้ผลลัพธ์เป็น $target';
  }

  @override
  String get mirrorTracingTitle => 'ลากเส้นในกระจก!';

  @override
  String get mirrorTracingSubtitle =>
      'ลากเส้นตามรูปดาว! การควบคุมจะถูกสะท้อนแบบกระจกเงา';

  @override
  String get wordSurgeTitle => 'คำศัพท์ถาโถม';

  @override
  String get wordSurgeSubtitle => 'คำเหมือนและคำตรงข้าม';

  @override
  String get perspectiveTakingTitle => 'การมองภาพ';

  @override
  String get perspectiveTakingTopDownView => 'ภาพมุมสูง';

  @override
  String get perspectiveTakingChoosePerspective => 'เลือกมุมมอง';

  @override
  String get perspectiveTakingCongrats =>
      'คุณมีสายตาที่เฉียบคมสำหรับความสัมพันธ์เชิงพื้นที่';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return 'มุมมองไหนมาจากทิศ $targetDirName?';
  }

  @override
  String get paperFoldingTitle => 'คลี่กระดาษ!';

  @override
  String get paperFoldingSubtitle => 'เมื่อคลี่ออกมาแล้วจะเป็นอย่างไร?';

  @override
  String get waterSortTitle => 'ทำได้ดีมาก!';

  @override
  String get waterSortSubtitle => 'แยกสีเพื่อให้แต่ละหลอดมีเพียงสีเดียว';

  @override
  String get numericalEstimationTitle => 'การประมาณค่า';

  @override
  String get numericalEstimationSubtitle =>
      'เลือกคำตอบที่ใกล้เคียงที่สุดให้เร็วที่สุด!';

  @override
  String get lockPatternTitle => 'รูปแบบการล็อก';

  @override
  String get lockPatternSubtitle =>
      'หารูปแบบลับ ทุกครั้งที่ทายจะมีผลตอบกลับเรื่องตำแหน่งและจุด';

  @override
  String get primeHunterTitle => 'นักล่าเลขฐาน';

  @override
  String get primeHunterSubtitle =>
      'ปัดซ้ายสำหรับจำนวนเฉพาะ | ปัดขวาสำหรับจำนวนประกอบ';

  @override
  String get tracePathTitle => 'ลากเส้นตามทาง';

  @override
  String get tracePathSubtitle => 'เดินตามเส้นทางเป้าหมายให้แม่นยำที่สุด';

  @override
  String get ruleSwitcherTitle => 'สลับกฎ';

  @override
  String get ruleSwitcherSubtitle => 'ใช้กฎปัจจุบัน';

  @override
  String get choiceReactionTimeTitle => 'เวลาตอบสนองเชิงเลือก';

  @override
  String get pathRecallTitle => 'จำเส้นทาง';

  @override
  String get switchTaskTitle => 'สลับภารกิจ';

  @override
  String get switchTaskSubtitle =>
      'สนใจกฎที่แสดงให้ดี! กฎจะสลับไปมาระหว่างการจับคู่รูปร่างและการจับคู่สี';

  @override
  String get mentalRotationTitle => 'การหมุนในใจ';

  @override
  String get mentalRotationSubtitle =>
      'รูปร่างเหล่านี้เหมือนกันหรือไม่ แค่ถูกหมุนไป?';

  @override
  String get missingOperatorTitle => 'ผสมเครื่องหมาย';

  @override
  String get missingOperatorSubtitle =>
      'เติมเครื่องหมายลงในช่องว่างเพื่อให้สมการสมบูรณ์';

  @override
  String get wordMastermindTitle => 'มาสเตอร์มายด์คำศัพท์';

  @override
  String get wordMastermindSubtitle =>
      'ถอดรหัส 4 ตัวอักษร! Bulls (B) คือตำแหน่งที่ถูกต้อง Cows (C) คือตำแหน่งที่ผิด';

  @override
  String get simonSequenceTitle => 'ลำดับไซมอน';

  @override
  String get symbolLogicTitle => 'ตรรกะสัญลักษณ์';

  @override
  String get symbolLogicSubtitle =>
      'แก้สมการภาพเพื่อหาค่าของแต่ละสัญลักษณ์ ผลลัพธ์ของสมการสุดท้ายคืออะไร?';

  @override
  String get silhouetteMatchTitle => 'ตรงกัน!';

  @override
  String get silhouetteMatchSubtitle => 'เงาไหนตรงกับวัตถุนี้?';

  @override
  String get operationSpanTitle => 'ความจำช่วงการทำงาน';

  @override
  String get operationSpanMathPhase => 'สมการถูกต้องหรือไม่?';

  @override
  String get operationSpanLetterPhase => 'จดจำตัวอักษร';

  @override
  String get operationSpanRecallPhase => 'ระลึกตัวอักษรตามลำดับ';

  @override
  String get operationSpanRoundComplete => 'จบรอบ!';

  @override
  String operationSpanScore(int score) {
    return 'คุณได้ $score คะแนนในความจำช่วงการทำงาน!';
  }

  @override
  String get slidePuzzleTitle => 'เกมเลื่อนภาพ';

  @override
  String get slidePuzzleNewGame => 'เริ่มเกมใหม่';

  @override
  String get slidePuzzleInstructions =>
      'จัดเรียงแผ่นตัวเลขตามลำดับโดยเลื่อนเข้าไปในที่ว่าง';

  @override
  String get slidePuzzleTileSlider => 'ตัวเลื่อนแผ่นสี';

  @override
  String get slidePuzzleCongrats => 'คุณจัดเรียงแผ่นตัวเลขทั้งหมดสำเร็จแล้ว';

  @override
  String get visualSearchTitle => 'การค้นหาทางสายตา';

  @override
  String get visualSearchSubtitle => 'หาสัญลักษณ์ที่แตกต่างในตาราง';

  @override
  String get trailMakingTitle => 'เชื่อมจุด';

  @override
  String get trailMakingSubtitle =>
      'เชื่อมต่อตัวเลขตามลำดับ (1 -> 2 -> 3...) ให้เร็วที่สุดเท่าที่จะทำได้';

  @override
  String get matrixReasoningTitle => 'การใช้เหตุผลแบบเมทริกซ์';

  @override
  String get matrixReasoningSubtitle => 'เติมรูปแบบที่หายไปในตาราง 3x3';

  @override
  String get tentsAndTreesTitle => 'เต็นท์และต้นไม้';

  @override
  String get tentsAndTreesSubtitle =>
      'วางเต็นท์ข้างต้นไม้ ตัวเลขจะบอกว่ามีเต็นท์ในแต่ละแถว/คอลัมน์กี่อัน เต็นท์ห้ามวางติดกัน';

  @override
  String get quickMathTitle => 'คิดเลขเร็ว';

  @override
  String get magicSquaresTitle => 'จัตุรัสกล';

  @override
  String magicSquaresSubtitle(int targetSum) {
    return 'ทุกแถว คอลัมน์ และแนวทแยงต้องมีผลรวมเท่ากับ $targetSum';
  }

  @override
  String get objectShuffleTitle => 'สลับวัตถุ';

  @override
  String get pipesTitle => 'ท่อประปา';

  @override
  String get pipesSubtitle => 'เชื่อมต่อจุดสีที่ตรงกันด้วยท่อ';

  @override
  String get oddOneOutTitle => 'สิ่งที่ไม่เข้าพวก';

  @override
  String get oddOneOutSubtitle => 'หาแผ่นที่มีสีแตกต่างจากพวก';

  @override
  String get einsteinRiddleTitle => 'ปริศนาไอน์สไตน์';

  @override
  String get einsteinRiddleSubtitle =>
      'ใช้คำใบ้เพื่อสรุปคุณลักษณะของบ้านแต่ละหลัง';

  @override
  String get einsteinRiddleHowToPlay =>
      'บ้านแต่ละหลังมีคุณลักษณะเฉพาะตัว (สี สัญชาติ สัตว์เลี้ยง ฯลฯ) ใช้คำใบ้ที่ให้มาเพื่อเติมในตารางและหาคำตอบที่สมบูรณ์';

  @override
  String get einsteinRiddleColor => 'สี';

  @override
  String get einsteinRiddleNationality => 'สัญชาติ';

  @override
  String get einsteinRiddleDrink => 'เครื่องดื่ม';

  @override
  String get einsteinRiddlePet => 'สัตว์เลี้ยง';

  @override
  String get einsteinRiddleSmoke => 'บุหรี่';

  @override
  String get einsteinRiddleHouse => 'บ้าน';

  @override
  String get mirrorImageTitle => 'ภาพในกระจก';

  @override
  String get mirrorImageSubtitle => 'ระบุภาพสะท้อนในกระจกที่ถูกต้อง';

  @override
  String get mirrorImageHowToPlay =>
      'ดูรูปร่างแล้วเลือกภาพสะท้อนในกระจกที่ถูกต้องจากตัวเลือกที่ให้ไว้';

  @override
  String get mentalMappingTitle => 'แผนที่ในใจ';

  @override
  String get mentalMappingSubtitle => 'ทำตามทิศทางและหาจุดหมายปลายทาง';

  @override
  String get mentalMappingHowToPlay =>
      'คุณจะเห็นลำดับทิศทาง (เหนือ ใต้ ตะวันออก ตะวันตก) ให้ทำตามขั้นตอนเหล่านี้ในใจโดยเริ่มจากจุดศูนย์กลางของตารางและเลือกจุดหมายสุดท้าย';

  @override
  String get memoryPalaceTitle => 'วังแห่งความจำ';

  @override
  String get memoryPalaceSubtitle => 'จำให้ได้ว่าคำไหนอยู่ที่ตำแหน่งไหน';

  @override
  String get memoryPalaceHowToPlay =>
      'ชุดคำศัพท์จะปรากฏในตำแหน่งต่างๆ บนตาราง จดจำตำแหน่งเหล่านั้น จากนั้นคุณจะถูกขอให้วางคำศัพท์กลับไปที่ตำแหน่งเดิม';

  @override
  String get countingSheepTitle => 'นับแกะ';

  @override
  String get countingSheepSubtitle => 'คุณเห็นแกะกี่ตัว?';

  @override
  String get countingSheepHowToPlay =>
      'แกะจะวิ่งผ่านหน้าจอไปอย่างรวดเร็ว นับจำนวนแกะขณะที่มันวิ่งผ่านและใส่จำนวนทั้งหมดเมื่อจบเกม';

  @override
  String get faceTraitAssociationTitle => 'ใบหน้าและลักษณะ';

  @override
  String get faceTraitAssociationSubtitle => 'จดจำลักษณะของแต่ละใบหน้า';

  @override
  String get faceTraitAssociationHowToPlay =>
      'คุณจะเห็นใบหน้าหลายใบหน้า แต่ละคนมีชื่อ อาชีพ และงานอดิเรก จดจำความเชื่อมโยงเหล่านี้ ต่อมาคุณจะถูกถามถึงลักษณะเฉพาะของแต่ละใบหน้า';

  @override
  String get mentalCalendarTitle => 'ปฏิทินในใจ';

  @override
  String get mentalCalendarSubtitle => 'คำนวณวันในสัปดาห์';

  @override
  String get mentalCalendarHowToPlay =>
      'วันที่สุ่มจะถูกแสดงขึ้น ใช้การคำนวณในใจ (หรืออัลกอริทึม Doomsday) เพื่อระบุว่าวันนั้นตรงกับวันไหนในสัปดาห์';

  @override
  String get vocabularyBuilderTitle => 'คลังคำศัพท์';

  @override
  String get vocabularyBuilderSubtitle =>
      'จับคู่คำเหมือนและคำตรงข้ามภายใต้ความกดดันของเวลา';

  @override
  String get vocabularyBuilderHowToPlay =>
      'คุณจะเห็นคำศัพท์เป้าหมายและความสัมพันธ์ (คำเหมือนหรือคำตรงข้าม) เลือกคำที่ถูกต้องจากตัวเลือกที่ตรงกับความสัมพันธ์นั้น ต้องเร็วหน่อยนะ เวลาเดินอยู่!';

  @override
  String get correct => 'ถูกต้อง';

  @override
  String get incorrect => 'ไม่ถูกต้อง';

  @override
  String get grammarPoliceTitle => 'ตำรวจไวยากรณ์';

  @override
  String get grammarPoliceSubtitle =>
      'ระบุว่าประโยคนั้นถูกต้องตามหลักไวยากรณ์หรือมีข้อผิดพลาด';

  @override
  String get grammarPoliceHowToPlay =>
      'ประโยคจะปรากฏขึ้นตรงกลางหน้าจอ ตัดสินใจว่าถูกต้องตามหลักไวยากรณ์หรือมีข้อผิดพลาด แตะ \'ถูกต้อง\' หากไม่มีปัญหา หรือ \'ไม่ถูกต้อง\' หากคุณพบข้อผิดพลาด อย่าเสียชีวิตทั้งหมดของคุณ!';

  @override
  String get reverseStroopTitle => 'สตรูปย้อนกลับ';

  @override
  String get reverseStroopSubtitle => 'การทดสอบสตรูปในรูปแบบที่เปลี่ยนจุดสนใจ';

  @override
  String get reverseStroopHowToPlay =>
      'สนใจคำสั่งให้ดี! ถ้าบอกว่า \'ข้อความ\' ให้ตอบตามความหมายของคำ ถ้าบอกว่า \'สี\' ให้ตอบตามสีของหมึก กฎจะเปลี่ยนบ่อยเพื่อทดสอบสมาธิของคุณ';

  @override
  String get game2048Instruction => 'ปัดในทิศทางใดก็ได้เพื่อรวม';

  @override
  String get fibonacciMergeTitle => 'รวมฟีโบนัชชี';

  @override
  String get fibonacciMergeSubtitle =>
      'รวมเลขฟีโบนัชชีที่เรียงต่อกัน (1, 1, 2, 3, 5, 8, 13...)';

  @override
  String get sequenceSleuthTitle => 'นักสืบลำดับ';

  @override
  String get sequenceSleuthSubtitle => 'หาตัวเลขที่หายไปในลำดับทางคณิตศาสตร์';

  @override
  String get divisibilityDashTitle => 'แข่งการหาร';

  @override
  String get divisibilityDashSubtitle =>
      'แตะตัวหารเลขหลักเดียว (2-9) ทั้งหมดของตัวเลขที่กำหนด';

  @override
  String get percentagePeakTitle => 'ยอดเขาเปอร์เซ็นต์';

  @override
  String get percentagePeakSubtitle =>
      'แก้โจทย์การคำนวณเปอร์เซ็นต์ในใจอย่างรวดเร็ว';

  @override
  String get vennNumbersTitle => 'เลขเวนนม์';

  @override
  String get vennNumbersSubtitle =>
      'จัดหมวดหมู่ตัวเลขลงในพื้นที่แผนภาพเวนน์ที่ถูกต้อง';

  @override
  String get commonDenominatorTitle => 'ตัวหารร่วม';

  @override
  String get commonDenominatorSubtitle => 'หา ห.ร.ม. หรือ ค.ร.น.';

  @override
  String get angleFinderTitle => 'หามุม';

  @override
  String get angleFinderSubtitle => 'คำนวณมุมที่หายไปในโจทย์เรขาคณิต';

  @override
  String get sumSnakeTitle => 'งูรวมเลข';

  @override
  String get sumSnakeSubtitle =>
      'เชื่อมต่อตัวเลขที่อยู่ติดกันเพื่อให้ได้ผลรวมตามเป้าหมาย';

  @override
  String get baseShiftTitle => 'ฐานเปลี่ยนเลข';

  @override
  String get baseShiftSubtitle => 'แก้โจทย์เป็นเลขฐานสิบ';

  @override
  String get baseShiftDescription =>
      'แก้สมการแล้วพิมพ์คำตอบเป็นเลขฐานสิบ (Base 10)';

  @override
  String get baseShiftEquation => 'สมการ';

  @override
  String get baseShiftHint => 'ใส่ผลลัพธ์เลขฐานสิบ...';

  @override
  String get baseShiftCorrect => 'ถูกต้อง!';

  @override
  String get baseShiftIncorrect => 'ไม่ถูกต้อง!';

  @override
  String get baseShiftSubmit => 'ส่งคำตอบ';

  @override
  String get baseShiftQuickGuide => 'คำแนะนำสั้นๆ:';

  @override
  String get baseShiftBinary => 'ฐานสอง (bin): (0, 1)';

  @override
  String get baseShiftHex => 'ฐานสิบหก (0x): (0-9, A-F)';

  @override
  String get baseShiftDecimal => 'ฐานสิบ (dec): (0-9)';

  @override
  String get baseShiftWinTitle => 'พ่อมดคณิตศาสตร์!';

  @override
  String get baseShiftWinMessage => 'คุณแก้สมการเลขฐานได้ถูกต้อง 5 ข้อ!';

  @override
  String get blockCount3DTitle => 'นับบล็อก 3 มิติ';

  @override
  String get blockCount3DSubtitle => 'ลากเพื่อหมุน • นับบล็อกที่ซ่อนอยู่';

  @override
  String get blockCount3DHowMany => 'มีบล็อกกี่อัน?';

  @override
  String get blockCount3DSubmitGuess => 'ส่งคำตอบ';

  @override
  String get blockCount3DNotQuite => 'ยังไม่ถูก! ลองหมุนเพื่อนับใหม่อีกครั้งนะ';

  @override
  String get blockCount3DExcellent => 'ยอดเยี่ยม';

  @override
  String blockCount3DWinMessage(int count) {
    return 'คุณระบุจำนวนบล็อกทั้ง $count อันได้ถูกต้อง!';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '1. ลากนิ้วบนหน้าจอ 3 มิติเพื่อหมุนกองบล็อก\n\n2. นับบล็อกทั้งหมดในกอง\n\n3. จำไว้ว่า: บล็อกที่ลอยอยู่ในอากาศต้องมีบล็อกรองรับอยู่ข้างล่าง (บล็อกที่ซ่อนอยู่!)\n\n4. พิมพ์คำตอบในช่องใส่ข้อมูลแล้วแตะ \"ส่งคำตอบ\" เพื่อตรวจสอบ';

  @override
  String get alphabetSudokuTitle => 'ซูโดกุตัวอักษร';

  @override
  String get alphabetSudokuSubtitle =>
      'เติมตัวอักษร A-I ลงในตารางโดยไม่ซ้ำในแถว คอลัมน์ และบล็อก';

  @override
  String get alphabetSudokuWinTitle => 'แก้ซูโดกุสำเร็จ!';

  @override
  String get alphabetSudokuWinMessage =>
      'ยอดเยี่ยม! คุณเชี่ยวชาญการใช้ตัวอักษรแล้ว';

  @override
  String get classicMazeTitle => 'เขาวงกตคลาสสิก';

  @override
  String get classicMazeSubtitle => 'สำรวจและหาทางออก • เขาวงกตใหม่ทุกเกม';

  @override
  String get classicMazeWinTitle => 'ผ่านเขาวงกต!';

  @override
  String classicMazeWinMessage(int count) {
    return 'นำทางได้ยอดเยี่ยมมาก! คุณผ่านเขาวงกตได้ใน $count ครั้ง';
  }

  @override
  String get classicMazeMoves => 'จำนวนครั้ง: ';

  @override
  String get classicMazeHowToPlayDescription =>
      '1. นำทางลูกหินสีเหลือง (ผู้เล่น) ไปยังพอร์ทัลสีเขียว (ทางออก) ที่มุมขวาล่าง\n\n2. ปัดหน้าจอ ใช้ปุ่มลูกศรบนคีย์บอร์ด หรือปุ่มลูกศรด้านล่างเพื่อเคลื่อนที่\n\n3. เส้นสีม่วงแสดงเส้นทางที่คุณเคยผ่าน คุณสามารถเดินย้อนกลับเพื่อลบเส้นทางได้!\n\n4. เปลี่ยนระดับความยากจากแถบด้านบนเพื่อท้าทายตัวเองด้วยเขาวงกตที่ใหญ่ขึ้น!';

  @override
  String get conjunctionSearchTitle => 'การค้นหาแบบเชื่อมโยง';

  @override
  String get conjunctionSearchSubtitle =>
      'การเพ่งความสนใจและการเชื่อมโยงคุณลักษณะ';

  @override
  String get conjunctionSearchWinTitle => 'ชัยชนะ';

  @override
  String get conjunctionSearchWinMessage =>
      'คุณหาเป้าหมายทั้งหมดเจอด้วยสมาธิที่ยอดเยี่ยม!';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      'รูปร่างและสีเป้าหมายจะแสดงในคำสั่ง ค้นหาและแตะมันในตารางที่มีวัตถุจำนวนมากให้เร็วที่สุด รูปร่างหลอกจะมีสีหรือรูปร่างที่เหมือนกัน ดังนั้นควรดูให้ดี!';

  @override
  String get conjunctionSearchRound => 'รอบที่: ';

  @override
  String get conjunctionSearchScore => 'คะแนน: ';

  @override
  String get conjunctionSearchFind => 'หาภาพ: ';

  @override
  String get shapeCircle => 'วงกลม';

  @override
  String get shapeSquare => 'สี่เหลี่ยม';

  @override
  String get shapeTriangle => 'สามเหลี่ยม';

  @override
  String get shapeStar => 'ดาว';

  @override
  String get colorRedLabel => 'สีแดง';

  @override
  String get colorBlueLabel => 'สีน้ำเงิน';

  @override
  String get colorGreenLabel => 'สีเขียว';

  @override
  String get colorAmberLabel => 'สีอำพัน';

  @override
  String get cubeNetFoldTitle => 'พับกล่อง';

  @override
  String get cubeNetFoldSubtitle => 'เลือกภาพลูกบาศก์ 3 มิติที่ตรงกัน';

  @override
  String get cubeNetFoldWinTitle => 'ถูกต้อง';

  @override
  String get cubeNetFoldWinMessage =>
      'คุณมีตรรกะการพับภาพ 3 มิติที่สมบูรณ์แบบ!';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '1. ดูภาพคลี่ 2 มิติด้านบน\n\n2. จินตนาการการพับภาพคลี่นั้นให้เป็นลูกบาศก์ 3 มิติ\n\n3. เลือกตัวเลือกด้านล่างที่แสดงมุมมอง 3 มิติที่ถูกต้องของลูกบาศก์นั้น\n\n4. ระวัง: หน้าที่อยู่ตรงข้ามกันในภาพคลี่จะไม่สามารถอยู่ติดกันได้ในแบบ 3 มิติ!';

  @override
  String get cubeNetFoldUnfoldedNet => 'ภาพคลี่ 2 มิติ';

  @override
  String get cubeNetFoldWhichMatches => 'ลูกบาศก์อันไหนที่ตรงกัน?';

  @override
  String get cubeNetFoldIncorrect =>
      'ตรรกะการพับไม่ถูกต้อง! แตะรีเซ็ตหรือเปลี่ยนตัวเลือกของคุณ';

  @override
  String get cubeNetFoldSubmitChoice => 'ส่งคำตอบ';

  @override
  String get cubeNetFoldFailed => 'พลาดแล้ว (แตะรีเซ็ต)';

  @override
  String get faceTraitAssociationMemorize => 'จดจำทั้ง 4 คนนี้';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return 'คนที่ $current จาก $total';
  }

  @override
  String get faceTraitAssociationWhatOccupation => 'พวกเขาทำอาชีพอะไร?';

  @override
  String get faceTraitAssociationWhatHobby => 'งานอดิเรกของพวกเขาคืออะไร?';

  @override
  String get faceTraitAssociationWinTitle => 'ปรมาจารย์ความจำ!';

  @override
  String get faceTraitAssociationLoseTitle => 'จบเกม';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return 'คุณทำถูก $correct จากทั้งหมด $total ข้อ';
  }

  @override
  String get topologyTitle => 'ทอพอโลยี';

  @override
  String get topologySubtitle =>
      'รูปร่างเหล่านี้เหมือนกันทางทอพอโลยีหรือไม่? (สามารถเปลี่ยนรูปหนึ่งเป็นอีกรูปหนึ่งได้โดยไม่ตัดหรือดึง?)';

  @override
  String get topologyWinTitle => 'อัจฉริยะเรขาคณิต!';

  @override
  String get topologyWinMessage => 'คุณระบุคู่ทอพอโลยีได้ถูกต้อง 10 คู่!';

  @override
  String get topologyScore => 'คะแนน: ';
}
