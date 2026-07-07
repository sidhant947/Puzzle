// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'เกมปริศนา';

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
  String get victory => 'ชัยชนะ!';

  @override
  String get gameWin => 'ยอดเยี่ยม!';

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
  String get visualStatisticalLearningTitle => 'การเรียนรู้ทางสถิติด้วยภาพ';

  @override
  String get orbitTapTitle => 'แตะวงโคจร';

  @override
  String get orbitTapSubtitle => 'แตะเมื่อลูกบอลตรงกับประตู';

  @override
  String get schulteTableTitle => 'ตารางชูลเต';

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
  String get memoryMatrixTitle => 'เมทริกซ์ความจำ';

  @override
  String get memoryMatrixSubtitle => 'จดจำรูปแบบแล้วแตะช่องเหล่านั้น';

  @override
  String get mentalAbacusTitle => 'ลูกคิดจินตคณิต';

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
  String get verbalAnalogiesTitle => 'การเปรียบเทียบคำพูด';

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
  String get tangleFixTitle => 'แก้ปม';

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
  String get wisconsinCardSortingTitle => 'การคัดแยกการ์ดวิสคอนซิน';

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
  String get mirrorTracingTitle => 'การลากเส้นในกระจก';

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
  String get paperFoldingTitle => 'พับกระดาษ';

  @override
  String get paperFoldingSubtitle => 'เมื่อคลี่ออกมาแล้วจะเป็นอย่างไร?';

  @override
  String get waterSortTitle => 'แยกสีน้ำ';

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
  String get silhouetteMatchTitle => 'จับคู่เงา';

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
  String get shapeRectangle => 'สี่เหลี่ยมผืนผ้า';

  @override
  String get shapeEllipse => 'วงรี';

  @override
  String get shapeTrapezoid => 'สี่เหลี่ยมคางหมู';

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

  @override
  String get semanticDistanceTitle => 'ระยะห่างทางอรรถศาสตร์';

  @override
  String get semanticDistanceSubtitle => 'วัดระยะห่างเชิงแนวคิดระหว่างคำ';

  @override
  String get oxymoronHuntTitle => 'ล่าคำย้อนแย้ง';

  @override
  String get oxymoronHuntSubtitle => 'จับคู่คำที่มีความหมายขัดแย้งกันในตาราง';

  @override
  String get portmanteauSplitTitle => 'แยกคำผสม';

  @override
  String get portmanteauSplitSubtitle => 'ระบุคำต้นฉบับของคำผสม (Portmanteau)';

  @override
  String get chainReactionTitle => 'ปฏิกิริยาลูกโซ่';

  @override
  String get chainReactionSubtitle => 'เชื่อมต่อคำโดยใช้ตัวอักษรที่ซ้อนทับกัน';

  @override
  String get rhymeMasterTitle => 'เจ้าแห่งคำคล้องจอง';

  @override
  String get rhymeMasterSubtitle => 'ระบุคำที่คล้องจองกับคำเป้าหมาย';

  @override
  String get definitionDashTitle => 'วิ่งสู้คำจำกัดความ';

  @override
  String get definitionDashSubtitle => 'จับคู่คำที่ถูกต้องกับคำจำกัดความ';

  @override
  String get syllableStackTitle => 'เรียงซ้อนพยางค์';

  @override
  String get syllableStackSubtitle =>
      'วางพยางค์ซ้อนกันเพื่อให้กลายเป็นคำที่สมบูรณ์';

  @override
  String get sentenceUnscrambleTitle => 'ถอดรหัสประโยค';

  @override
  String get sentenceUnscrambleSubtitle =>
      'เรียงลำดับคำใหม่เพื่อให้เป็นประโยคที่ถูกต้อง';

  @override
  String get grammarSortTitle => 'แยกประเภทไวยากรณ์';

  @override
  String get grammarSortSubtitle => 'จัดหมวดหมู่คำตามส่วนของประโยค';

  @override
  String get vowelReconstructTitle => 'เติมสระ';

  @override
  String get vowelReconstructSubtitle => 'เติมสระที่หายไปในประโยคให้สมบูรณ์';

  @override
  String get consonantReconstructTitle => 'เติมพยัญชนะ';

  @override
  String get consonantReconstructSubtitle =>
      'เติมพยัญชนะที่หายไปในประโยคให้สมบูรณ์';

  @override
  String get homophoneHuntTitle => 'ล่าคำพ้องเสียง';

  @override
  String get silentLetterSearchTitle => 'ค้นหาอักษรไม่ออกเสียง';

  @override
  String get silentLetterSearchSubtitle =>
      'ระบุอักษรที่ไม่ออกเสียงในคำที่กำหนด';

  @override
  String get palindromeBuilderTitle => 'สร้างคำพัลลินโดรม';

  @override
  String get palindromeBuilderSubtitle =>
      'สร้างคำพัลลินโดรมโดยการเพิ่มตัวอักษรให้น้อยที่สุด';

  @override
  String get phoneticGuessTitle => 'ทายคำจากเสียง';

  @override
  String get phoneticGuessSubtitle => 'ระบุคำจากการสะกดตามเสียงอ่าน';

  @override
  String get spoonerismSolverTitle => 'แก้โจทย์คำผวน';

  @override
  String get spoonerismSolverSubtitle => 'ระบุคำผวนที่ถูกต้องสำหรับวลีนั้นๆ';

  @override
  String get etymonOddballTitle => 'คำแปลกแยกทางรากศัพท์';

  @override
  String get etymonOddballSubtitle => 'ค้นหาคำที่ไม่ได้ใช้รากศัพท์เดียวกัน';

  @override
  String get etymologyOriginTitle => 'ต้นกำเนิดนิรุกติศาสตร์';

  @override
  String get etymologyOriginSubtitle => 'ทายภาษาต้นกำเนิดของคำยืม';

  @override
  String get affixFactoryTitle => 'โรงงานส่วนขยายคำ';

  @override
  String get affixFactorySubtitle =>
      'สร้างคำที่ถูกต้องโดยใช้คำอุปสรรคและคำปัจจัย';

  @override
  String get cognateCatchTitle => 'จับผิดคำพ้อง';

  @override
  String get cognateCatchSubtitle =>
      'แยกแยะระหว่างคำที่มีรากศัพท์เดียวกันจริงกับคำที่ดูเหมือนจะใช่แต่ไม่ใช่';

  @override
  String get compoundConnectTitle => 'เชื่อมคำประสม';

  @override
  String get compoundConnectSubtitle =>
      'รวมคำสองคำเข้าด้วยกันเพื่อสร้างคำประสม';

  @override
  String get pangramSprintTitle => 'วิ่งแข่งแพนแกรม';

  @override
  String get pangramSprintSubtitle =>
      'สร้างประโยคโดยใช้ตัวอักษรทุกตัวในพยัญชนะ';

  @override
  String get anagramDefinitionTitle => 'นิยามอนาแกรม';

  @override
  String get anagramDefinitionSubtitle => 'แก้โจทย์อนาแกรมตามคำจำกัดความ';

  @override
  String get letterBridgeTitle => 'สะพานตัวอักษร';

  @override
  String get letterBridgeSubtitle =>
      'ค้นหาตัวอักษรที่หายไปซึ่งเชื่อมคำสองคำเข้าด้วยกัน';

  @override
  String get letterFrequencyScanTitle => 'สแกนความถี่ตัวอักษร';

  @override
  String get letterFrequencyScanSubtitle =>
      'นับจำนวนครั้งที่ตัวอักษรปรากฏในข้อความ';

  @override
  String get oneLetterShiftTitle => 'เปลี่ยนหนึ่งอักษร';

  @override
  String get oneLetterShiftSubtitle =>
      'เปลี่ยนคำหนึ่งให้เป็นอีกคำหนึ่งโดยการเปลี่ยนตัวอักษรเพียงตัวเดียว';

  @override
  String vocabularyBuilderMessage(String arg0) {
    return 'ยอดเยี่ยมมาก! คลังคำศัพท์ของคุณน่าประทับใจมาก คะแนน: $arg0';
  }

  @override
  String get symmetryMessage =>
      'คุณสะท้อนรูปแบบได้อย่างสมบูรณ์แบบด้วยความแม่นยำสูง';

  @override
  String get temporalOrderMessage =>
      'น่าทึ่งมาก! ความจำลำดับเหตุการณ์ของคุณมีความแม่นยำสูง';

  @override
  String get temporalOrderMessage1 => 'ความจำลำดับไม่ถูกต้อง ฝึกฝนบ่อยๆ นะ!';

  @override
  String get wordSearchMessage => 'พบคำศัพท์ทั้งหมดแล้วด้วยการสังเกตที่เฉียบคม';

  @override
  String colorMatchMessage(String arg0) {
    return 'ความแม่นยำของคุณ: $arg0%';
  }

  @override
  String semanticLinkMessage(String arg0) {
    return 'คุณทำได้ $arg0 คะแนน!';
  }

  @override
  String reflexTapMessage(String arg0) {
    return 'คุณแตะเป้าหมายได้ $arg0 ครั้ง!';
  }

  @override
  String get angleFinderMessage => 'สัญชาตญาณทางเรขาคณิตของคุณสมบูรณ์แบบ!';

  @override
  String angleFinderMessage1(String arg0) {
    return 'คำตอบที่ถูกต้องคือ $arg0°';
  }

  @override
  String angleFinderText(String arg0) {
    return '$arg0°';
  }

  @override
  String visualStatisticalLearningMessage(String arg0) {
    return 'คุณทำคะแนนรูปแบบที่ถูกต้องได้ $arg0 รูปแบบ!';
  }

  @override
  String nonogramText(String arg0) {
    return 'ข้อผิดพลาด: $arg0';
  }

  @override
  String mentalCalendarMessage(String arg0) {
    return 'คุณทำถูก $arg0 จาก 10 ข้อ!';
  }

  @override
  String orbitTapMessage(String arg0) {
    return 'คุณแตะสำเร็จ $arg0 ครั้ง!';
  }

  @override
  String schulteTableMessage(String arg0) {
    return 'คุณทำตารางเสร็จในเวลา $arg0\nฝึกฝนต่อไปเพื่อขยายการมองเห็นรอบข้างของคุณ!';
  }

  @override
  String get schulteTableText => 'เริ่มการทดสอบ';

  @override
  String get relationalMemoryMessage =>
      'ความแม่นยำของความจำเชิงสัมพันธ์เชิงพื้นที่ยอดเยี่ยมมาก!';

  @override
  String sudokuText(String arg0) {
    return 'ข้อผิดพลาด: $arg0';
  }

  @override
  String sdmtMessage(String arg0) {
    return 'คุณจับคู่สัญลักษณ์ได้ $arg0 ตัว! การทดสอบนี้วัดความเร็วในการสแกนและการจดจ่อทางสายตาของคุณ';
  }

  @override
  String get futoshikiMessage =>
      'เหลือเชื่อ! คุณแก้โจทย์ตาราง Futoshiki Latin Square ได้สำเร็จ';

  @override
  String letterFrequencyScanMessage(String arg0, String arg1) {
    return 'คุณนับจำนวนการปรากฏของ \"$arg1\" ได้ถูกต้อง $arg0 ครั้ง';
  }

  @override
  String letterFrequencyScanText(String arg0) {
    return 'ไม่ถูกต้อง จำนวนจริงคือ $arg0';
  }

  @override
  String get memoryMatrixMessage =>
      'น่าประทับใจ! ความจำใช้งานของคุณเฉียบคมมาก บรรลุเป้าหมายรายวันแล้ว!';

  @override
  String get memoryMatrixMessage1 =>
      'ตั้งสติแล้วลองอีกครั้งเพื่อเพิ่มคะแนนความจำของคุณ';

  @override
  String get contextCluesMessage =>
      'ยอดเยี่ยม! คลังคำศัพท์และการวิเคราะห์บริบทของคุณอยู่ในระดับสูงสุด';

  @override
  String get contextCluesMessage1 =>
      'เลือกคำผิด! ฝึกการใช้เหตุผลตามบริบทของคำแล้วลองอีกครั้ง';

  @override
  String oneLetterShiftMessage(String arg0, String arg1) {
    return 'คุณเปลี่ยนจาก $arg0 เป็น $arg1 ได้ถูกต้อง';
  }

  @override
  String get mentalAbacusMessage => 'การคิดเลขในใจของคุณอยู่ในระดับสูงสุด';

  @override
  String fractionMatcherMessage(String arg0) {
    return 'คุณทำได้ $arg0 คะแนนจากการจับคู่รูปแบบเศษส่วน!';
  }

  @override
  String get spellingSprintMessage => 'คุณสะกดคำทั้ง 10 คำได้ถูกต้อง!';

  @override
  String spellingSprintMessage1(String arg0) {
    return 'คุณสะกดคำได้ $arg0 คำ';
  }

  @override
  String stopSignalMessage(String arg0) {
    return 'คุณตอบสนองถูกต้อง $arg0 ครั้ง! การทดสอบนี้วัดความสามารถในการยับยั้งการกระทำที่วางแผนไว้';
  }

  @override
  String grammarPoliceMessage(String arg0) {
    return 'จบเกม! คุณรักษาความระเบียบเรียบร้อยในโลกของไวยากรณ์ คะแนน: $arg0';
  }

  @override
  String consonantReconstructMessage(String arg0) {
    return 'คุณสร้างคำใหม่ได้คะแนน $arg0!';
  }

  @override
  String rhymeMasterMessage(String arg0, String arg1) {
    return 'คุณหาคำคล้องจองได้ $arg0 จาก $arg1 คำ!';
  }

  @override
  String vigilanceTaskMessage(String arg0, String arg1, String arg2) {
    return 'สำเร็จ: $arg0, พลาด: $arg1\nแจ้งเตือนผิดพลาด: $arg2';
  }

  @override
  String get silhouetteMatchOrthoMessage =>
      'คุณมีทักษะการจัดตำแหน่งออร์โธกราฟิกที่ไร้ที่ติ!';

  @override
  String get silhouetteMatchOrthoText => 'รับทราบ';

  @override
  String get silhouetteMatchOrthoText1 =>
      'การฉายภาพทัศนียภาพไม่ถูกต้อง! แตะรีเซ็ตเพื่อลองอีกครั้ง';

  @override
  String fibonacciMergeMessage(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String factorFinderMessage(String arg0) {
    return 'คุณได้ $arg0 คะแนนจากการหาตัวประกอบทั้งหมด!';
  }

  @override
  String logicalSyllogismsMessage(String arg0) {
    return 'คุณแก้โจทย์ตรรกบทถูกต้อง $arg0 ข้อ!';
  }

  @override
  String get rotatingMazeMessage => 'คุณผ่านเขาวงกตที่หมุนอยู่ได้สำเร็จ!';

  @override
  String get rotatingMazeText => 'รับทราบ';

  @override
  String get rotatingMazeText1 => '🌀 เขาวงกตหมุน 90°! ตารางขยับแล้ว!';

  @override
  String get mathPathMessage => 'คุณพบเส้นทางที่รวมกันได้เท่ากับเป้าหมายแล้ว!';

  @override
  String get bridgesMessage => 'คุณเชื่อมต่อเกาะทั้งหมดได้สำเร็จ!';

  @override
  String compoundConnectMessage(String arg0, String arg1) {
    return 'คำผสมคือ $arg0$arg1';
  }

  @override
  String get pangramSprintMessage =>
      'คุณสร้างประโยคโดยใช้ตัวอักษรครบทั้ง 26 ตัว';

  @override
  String get mirrorImageMessage => 'คุณระบุภาพสะท้อนได้อย่างสมบูรณ์แบบ';

  @override
  String get mirrorImageText => 'ภาพกระจกเงา';

  @override
  String reverseStroopMessage(String arg0) {
    return 'คุณทำได้ $arg0 คะแนน! อย่าลืมดูคำแนะนำให้ดี';
  }

  @override
  String get verbalAnalogiesMessage =>
      'คุณมีความคิดที่เฉียบแหลมในเรื่องความสัมพันธ์';

  @override
  String corsiBlocksMessage1(String arg0, String arg1) {
    return 'คุณจำลำดับได้ $arg1 ชุด! ระดับความจำเชิงพื้นที่ของคุณถึง $arg0 แล้ว';
  }

  @override
  String wordLadderMessage(String arg0, String arg1, String arg2) {
    return 'คุณเชื่อมต่อ $arg0 กับ $arg1 ได้สำเร็จใน $arg2 ขั้นตอน';
  }

  @override
  String d2AttentionMessage(String arg0) {
    return 'การสแกนแบบเลือกสรรที่น่าทึ่ง! คะแนนสุดท้าย: $arg0';
  }

  @override
  String get d2AttentionText => 'วิธีเล่น';

  @override
  String get d2AttentionText1 => 'เข้าใจแล้ว';

  @override
  String get tangleFixMessage => 'เส้นทั้งหมดชัดเจนและราบรื่นแล้ว';

  @override
  String get distractorMatrixMessage =>
      'เหลือเชื่อ! คุณจำรูปแบบได้แม้จะมีตัวเลขคณิตศาสตร์มาดึงดูดความสนใจ!';

  @override
  String get distractorMatrixMessage1 =>
      'คุณโดนตัวดึงดูดความสนใจหลอกซะแล้ว! ฝึกฝนความจำขณะทำงานของคุณใหม่นะ';

  @override
  String sentenceUnscrambleMessage(String arg0) {
    return 'คุณถอดรหัสประโยคได้คะแนน $arg0!';
  }

  @override
  String get kakuroMessage =>
      'ยอดเยี่ยม! คุณจับคู่ส่วนรวมของตัวเลขทั้งหมดได้อย่างสมบูรณ์แบบ';

  @override
  String symbolicFlankerMessage(String arg0, String arg1) {
    return 'คุณตอบถูก $arg0 จาก $arg1!';
  }

  @override
  String stroopTestMessage(String arg0) {
    return 'คุณตอบถูก $arg0 ข้อ! จดจ่อที่สีของน้ำหมึก ไม่ใช่ตัวหนังสือ';
  }

  @override
  String wisconsinCardSortingMessage(String arg0) {
    return 'คุณแยกประเภทการ์ดได้ถูกต้อง $arg0 ใบ!';
  }

  @override
  String nBackMessage(String arg0) {
    return 'คุณทำ 2-back แมตช์ได้ $arg0 ครั้ง! ความจำขณะทำงานของคุณสำคัญมากสำหรับการทำงานหลายอย่างพร้อมกัน';
  }

  @override
  String rhythmMasterMessage(String arg0, String arg1) {
    return 'คุณทำ Perfect ได้ $arg0 ครั้ง และได้ $arg1 คะแนน!';
  }

  @override
  String groceryListMessage(String arg0, Object score) {
    return 'คุณทำได้ $arg0 คะแนนในรายการซื้อของ!';
  }

  @override
  String get groceryListText => 'ฉัน';

  @override
  String get mirrorTracingMessage =>
      'สมองของคุณปรับจูนการประสานงานใหม่ได้สำเร็จ';

  @override
  String moduloClockMessage(String arg0) {
    return 'ยอดเยี่ยมสำหรับการคำนวณเลขมอดูโลในใจ! คะแนน: $arg0';
  }

  @override
  String moduloClockMessage1(String arg0, String arg1, String arg2) {
    return 'คุณแก้โจทย์นาฬิกามอดูโลได้ $arg0 จาก $arg1 ข้อ คะแนน: $arg2';
  }

  @override
  String get crownMessage => 'วางมงกุฎทั้งหมดได้สำเร็จด้วยตรรกะที่สมบูรณ์แบบ';

  @override
  String dualCodingMessage(String arg0) {
    return 'ประสิทธิภาพการทำงานสองอย่างพร้อมกันที่ยอดเยี่ยม! คะแนนความจำขณะทำงานของคุณ: $arg0';
  }

  @override
  String inequalityDashMessage(String arg0) {
    return 'คุณได้ $arg0 คะแนนจากการจับคู่อสมการ!';
  }

  @override
  String sourceMonitoringMessage(String arg0, String arg1) {
    return 'คุณทำได้ $arg0 จาก $arg1 คะแนน!';
  }

  @override
  String get sourceMonitoringText => 'เริ่มการระลึกความจำ';

  @override
  String get memoryPalaceText => 'คำที่มีอยู่';

  @override
  String target10Message(String arg0) {
    return 'คุณได้ $arg0 คะแนนจากการจับคู่ตัวเลขให้รวมกันได้ 10!';
  }

  @override
  String get paperFoldingMessage => 'คุณมองเห็นรูปแบบในจินตนาการของคุณได้';

  @override
  String topologyText(String arg0, String arg1) {
    return '$arg0$arg1 / 10';
  }

  @override
  String get waterSortMessage => 'คุณแยกสีทั้งหมดได้อย่างสมบูรณ์แบบ!';

  @override
  String anagramDefinitionMessage(String arg0) {
    return 'คำนั้นคือ \"$arg0\" จริงๆ';
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
    return 'คุณประมาณค่าได้ถูกต้อง $arg0 ครั้ง';
  }

  @override
  String grammarSortMessage(String arg0) {
    return 'คุณจัดหมวดหมู่คำศัพท์ได้ถูกต้อง $arg0 คำ!';
  }

  @override
  String vowelReconstructMessage(String arg0) {
    return 'คุณประกอบสระใหม่ได้คะแนน $arg0!';
  }

  @override
  String spatialConflictMessage(String arg0, String arg1) {
    return 'คุณทำคะแนนได้ $arg0 โดยมีข้อผิดพลาด $arg1 ครั้ง!';
  }

  @override
  String get spatialConflictText => 'วิธีเล่น';

  @override
  String get spatialConflictText1 => 'เข้าใจแล้ว';

  @override
  String tracePathMessage(String arg0) {
    return 'ความแม่นยำของคุณคือ $arg0%!';
  }

  @override
  String ruleSwitcherMessage(String arg0, String arg1) {
    return 'คุณตอบถูก $arg0 จาก $arg1!';
  }

  @override
  String collatzMessage(String arg0, String arg1) {
    return 'คุณใช้ $arg0 ขั้นตอน ขั้นต่ำที่เป็นไปได้คือ $arg1';
  }

  @override
  String get collatzText => '/ 2';

  @override
  String get collatzText1 => '+ 1';

  @override
  String get collatzText2 => '3n + 1';

  @override
  String divisibilityDashMessage(String arg0) {
    return 'คุณแก้โจทย์ตัวเลขได้ $arg0 จำนวน!';
  }

  @override
  String switchTaskMessage(String arg0) {
    return 'คุณตอบถูก $arg0 ข้อ! การสลับงานอย่างรวดเร็วคือหัวใจของความยืดหยุ่นทางความคิด';
  }

  @override
  String sequenceSleuthMessage(String arg0) {
    return 'คุณหาคำตอบลำดับตัวเลขได้ $arg0 ชุด!';
  }

  @override
  String changeBlindnessMessage(String arg0) {
    return 'คุณพบการเปลี่ยนแปลง $arg0 จุด!';
  }

  @override
  String mentalRotationMessage(String arg0) {
    return 'คุณหมุนรูปทรงได้ถูกต้อง $arg0 รูป!';
  }

  @override
  String wordMastermindMessage(String arg0) {
    return 'คุณถอดรหัสได้แล้ว!\nคำนั้นคือ: $arg0';
  }

  @override
  String wordMastermindMessage1(String arg0) {
    return 'คำที่ซ่อนอยู่คือ: $arg0';
  }

  @override
  String wordMastermindText(String arg0) {
    return '$arg0';
  }

  @override
  String get simonSequenceMessage => 'คุณจำแผ่นป้ายได้ครบทั้ง 10 แผ่น!';

  @override
  String get simonSequenceMessage1 => 'ลองอีกครั้งเพื่อฝึกฝนลำดับให้แม่นยำ';

  @override
  String oxymoronHuntMessage(String arg0) {
    return 'คุณพบคำที่ขัดแย้งในตัวเอง $arg0 คำ!';
  }

  @override
  String spotlightTrackMessage(String arg0) {
    return 'การติดตามเชิงพื้นที่ที่น่าทึ่ง! คุณทำได้ $arg0 คะแนน';
  }

  @override
  String get spotlightTrackText => 'วิธีเล่น';

  @override
  String get spotlightTrackText1 => 'เข้าใจแล้ว';

  @override
  String get spotlightTrackText2 => 'เริ่มรอบ';

  @override
  String vennNumbersMessage(String arg0) {
    return 'คุณจัดหมวดหมู่ตัวเลขได้ $arg0 จำนวน!';
  }

  @override
  String get vennNumbersText => 'ไม่ใช่ทั้งสองอย่าง';

  @override
  String get vennNumbersText1 => 'ทั้งสองอย่าง';

  @override
  String get silhouetteMatchMessage =>
      'สมองของคุณยอดเยี่ยมในการแปลงภาพ 3 มิติเป็น 2 มิติ';

  @override
  String sumSnakeMessage(String arg0) {
    return 'บรรลุเป้าหมาย $arg0 ด้วยความแม่นยำที่สมบูรณ์แบบ!';
  }

  @override
  String get sumSnakeText => 'ล้างเส้นทาง';

  @override
  String percentagePeakMessage(String arg0) {
    return 'คุณแก้โจทย์ร้อยละได้ $arg0 ข้อ!';
  }

  @override
  String trailMakingMessage(String arg0) {
    return 'คุณลากเส้นได้ $arg0 เส้น! แบบทดสอบนี้วัดความเร็วในการค้นหาด้วยสายตาและความยืดหยุ่นทางความคิดของคุณ';
  }

  @override
  String matrixReasoningMessage(String arg0) {
    return 'คุณทำโจทย์เมทริกซ์เสร็จสมบูรณ์ $arg0 ชุด!';
  }

  @override
  String get tentsAndTreesMessage => 'คุณกางเต็นท์ทั้งหมดได้สำเร็จแล้ว';

  @override
  String klotskiMessage(String arg0) {
    return 'การเลื่อนที่ยอดเยี่ยม! คุณพาบล็อกฮีโร่ออกมาได้ใน $arg0 การเคลื่อนที่';
  }

  @override
  String sumPyramidMessage(String arg0) {
    return 'คุณแก้โจทย์พีระมิดตัวเลขได้ $arg0 พีระมิดสำเร็จ!';
  }

  @override
  String simonCommandMessage(String arg0) {
    return 'การตอบสนองแบบเลือกสรรและสมาธิที่ยอดเยี่ยม! คะแนนรวม: $arg0';
  }

  @override
  String simonCommandMessage1(String arg0, String arg1) {
    return 'คุณทำได้ $arg0 คะแนน แต่ยังไม่ถึง $arg1 คู่ในเวลาที่กำหนด';
  }

  @override
  String syllableStackMessage(String arg0) {
    return 'คุณสะสมคะแนนได้ $arg0!';
  }

  @override
  String get slitherlinkMessage => 'สุดยอด! คุณไขปริศนาห่วงโซ่ได้สำเร็จ';

  @override
  String quickMathMessage(String arg0) {
    return 'คุณแก้โจทย์ได้ $arg0 ข้อ!';
  }

  @override
  String commonDenominatorMessage(String arg0) {
    return 'คุณแก้โจทย์ ห.ร.ม./ค.ร.น. ได้ $arg0 ข้อ!';
  }

  @override
  String chainReactionMessage(String arg0, String arg1) {
    return 'คะแนนสุดท้ายของคุณคือ $arg0 คุณสร้างโซ่คำศัพท์ได้ $arg1 คำ';
  }

  @override
  String chainReactionText(String arg0) {
    return '$arg0';
  }

  @override
  String get associativePairsMessage =>
      'ยอดเยี่ยม! คุณเชื่อมโยงลักษณะทางสายตาได้อย่างไร้ที่ติ';

  @override
  String get associativePairsMessage1 =>
      'การเชื่อมโยงผิดพลาด! ฝึกฝนความจำในการเชื่อมโยงและลองใหม่อีกครั้ง';

  @override
  String portmanteauSplitMessage(String arg0) {
    return 'คุณแยกคำสนธิได้ $arg0 คำ!';
  }

  @override
  String get magicSquaresText => 'ล้าง';

  @override
  String alphabetSudokuText(String arg0) {
    return 'ข้อผิดพลาด: $arg0';
  }

  @override
  String get pipesMessage => 'คุณเชื่อมต่อท่อทั้งหมดและเติมเต็มตารางแล้ว';

  @override
  String get dualMirrorMessage => 'คุณนำทางไอคอนทั้งสองไปยังเป้าหมายได้สำเร็จ!';

  @override
  String binaryCodeMessage(String arg0) {
    return 'การแปลงเลขฐานสิบอย่างรวดเร็วที่น่าทึ่ง! คะแนนสุดท้าย: $arg0';
  }

  @override
  String binaryCodeMessage1(String arg0, String arg1) {
    return 'คุณแปลงเลขฐานสองได้ถูกต้อง $arg0 จำนวน คะแนน: $arg1';
  }

  @override
  String oddOneOutMessage(String arg0) {
    return 'คุณหาจุดที่ต่างกันได้ 50 จุด! คะแนนสุดท้าย: $arg0';
  }

  @override
  String oddOneOutMessage1(String arg0) {
    return 'คะแนนของคุณ: $arg0';
  }

  @override
  String letterBridgeMessage(String arg0) {
    return 'คุณพบตัวอักษรเชื่อมโยงแล้ว: $arg0';
  }

  @override
  String get imReady => 'ฉันพร้อมแล้ว';

  @override
  String get soptTitle => 'การชี้คำสั่งด้วยตนเอง';

  @override
  String get soptSubtitle => 'แตะการ์ดอื่นในแต่ละครั้ง สลับตำแหน่ง!';

  @override
  String get soptWinTitle => 'ลำดับมาสเตอร์!';

  @override
  String soptGameOverMessage(int score) {
    return 'คุณได้ $score คะแนนจากการติดตามไพ่ที่สับสำเร็จ!';
  }

  @override
  String get soptChooseNovel => 'แตะบัตรใหม่';

  @override
  String get soptGreatJob => 'เยี่ยมมาก!';

  @override
  String get soptAlreadyTapped => 'แตะแล้ว!';

  @override
  String get soptGrid => 'กริด';

  @override
  String get contRecogTitle => 'การรับรู้อย่างต่อเนื่อง';

  @override
  String get contRecogSubtitle =>
      'คุณเคยเห็นการ์ดใบนี้มาก่อนในเซสชันนี้หรือไม่';

  @override
  String get contRecogWinTitle => 'อัจฉริยะแห่งการรับรู้!';

  @override
  String contRecogGameOverMessage(int score) {
    return 'คุณได้คะแนน $score การยกย่องที่ถูกต้อง!';
  }

  @override
  String get contRecogCorrect => 'ถูกต้อง!';

  @override
  String get contRecogWrong => 'ผิด!';

  @override
  String get contRecogOldOrNew => 'นี่เก่าหรือใหม่?';

  @override
  String get contRecogNew => 'ใหม่';

  @override
  String get contRecogOld => 'เก่า';

  @override
  String get contRecogSeenPool => 'เห็นสระน้ำ';

  @override
  String get dnmsTitle => 'หน่วยความจำไม่ตรงกัน';

  @override
  String get dnmsSubtitle => 'แตะการ์ดที่ไม่ได้อยู่ในตัวอย่างที่บันทึกไว้';

  @override
  String get dnmsWinTitle => 'ผู้เชี่ยวชาญไม่ตรงกัน!';

  @override
  String dnmsGameOverMessage(int score) {
    return 'คุณได้คะแนน $score คำตอบที่ถูกต้องในความล่าช้าที่ไม่ตรงกัน!';
  }

  @override
  String get dnmsChooseNovel => 'แตะบัตรใหม่';

  @override
  String get dnmsMemorizeSample => 'จำการ์ดใบนี้ไว้';

  @override
  String get dnmsWaitForIt => 'รอก่อน...';

  @override
  String get dnmsExcellent => 'ยอดเยี่ยม!';

  @override
  String get dnmsSampleTapped => 'นั่นคือตัวอย่าง!';

  @override
  String get dnmsCards => 'การ์ด';

  @override
  String get symSpanTitle => 'ช่วงสมมาตร';

  @override
  String get symSpanSubtitle =>
      'จดจำรูปแบบของเซลล์พร้อมระบุความสมมาตรในแนวตั้ง';

  @override
  String get symSpanWinTitle => 'ปรมาจารย์ด้านสมมาตร!';

  @override
  String symSpanGameOverMessage(int score) {
    return 'คุณได้ $score คะแนนจากการจำเค้าโครงและระบุความสมมาตร!';
  }

  @override
  String get symSpanMemorizeRed => 'จดจำตำแหน่งเซลล์เม็ดเลือดแดง';

  @override
  String get symSpanIsSymmetric => 'รูปแบบมีความสมมาตรหรือไม่?';

  @override
  String get symSpanRecallSequence => 'เรียกคืนลำดับตามลำดับที่ถูกต้อง';

  @override
  String get symSpanGreatJob => 'เยี่ยมมาก!';

  @override
  String get symSpanTryAgain => 'ลองอีกครั้ง!';

  @override
  String get symSpanLength => 'ความยาว';

  @override
  String get readingSpanTitle => 'ช่วงการอ่าน';

  @override
  String get readingSpanSubtitle => 'ตรวจสอบประโยคพร้อมทั้งจดจำลำดับตัวอักษร';

  @override
  String get readingSpanWinTitle => 'ผู้เชี่ยวชาญด้านการอ่าน!';

  @override
  String readingSpanGameOverMessage(int score) {
    return 'คุณได้ $score คะแนนในการแข่งขันหน่วยความจำช่วงการอ่าน!';
  }

  @override
  String get readingSpanTrueFalse => 'ข้อความนี้เป็นจริงหรือเท็จ?';

  @override
  String get readingSpanMemorizeLetter => 'จดจำจดหมายฉบับนี้';

  @override
  String get readingSpanRecallLetters => 'จำตัวอักษรตามลำดับ';

  @override
  String get readingSpanGreatJob => 'เยี่ยมมาก!';

  @override
  String get readingSpanTryAgain => 'ลองอีกครั้ง!';

  @override
  String readingSpanYourSequence(String sequence) {
    return 'ลำดับของคุณ: $sequence';
  }

  @override
  String get readingSpanLength => 'ความยาว';

  @override
  String get readingSpanSentence1 => 'พระอาทิตย์ขึ้นทางทิศตะวันออก';

  @override
  String get readingSpanSentence2 => 'น้ำแข็งกำลังร้อนจัด';

  @override
  String get readingSpanSentence3 => 'ปลาสามารถหายใจใต้น้ำได้';

  @override
  String get readingSpanSentence4 => 'สุนัขมีปีกและบินได้';

  @override
  String get readingSpanSentence5 => 'น้ำจะแข็งตัวที่อุณหภูมิ 0 องศาเซลเซียส';

  @override
  String get readingSpanSentence6 => 'แมวเห่าเหมือนสุนัขตัวเล็ก';

  @override
  String get readingSpanSentence7 => 'ต้นไม้มีใบสีเขียวในฤดูร้อน';

  @override
  String get readingSpanSentence8 => 'ฝนตกลงมาจากพื้นดิน';

  @override
  String get readingSpanSentence9 => 'สามเหลี่ยมมีด้านเท่ากันสี่ด้าน';

  @override
  String get readingSpanSentence10 => 'แอปเปิ้ลเป็นผลไม้รสหวานชนิดหนึ่ง';

  @override
  String get readingSpanSentence11 => 'พระจันทร์ทำจากเชดดาร์ชีส';

  @override
  String get readingSpanSentence12 => 'รถยนต์มีล้อให้หมุน';

  @override
  String get readingSpanSentence13 => 'ไฟมันเย็นเยือก';

  @override
  String get readingSpanSentence14 => 'กระดาษทำจากไม้แปรรูป';

  @override
  String get readingSpanSentence15 => 'นกมีขนช่วยให้บินได้';

  @override
  String get readingSpanSentence16 => 'กล้วยเติบโตบนต้นสน';

  @override
  String get readingSpanSentence17 => 'ช้างมีขนาดเล็กกว่ามด';

  @override
  String get readingSpanSentence18 => 'หนังสือมีหน้าข้อความที่พิมพ์';

  @override
  String get countingSpanTitle => 'การนับช่วง';

  @override
  String get countingSpanSubtitle =>
      'นับวงกลมสีน้ำเงินเท่านั้น แล้วจำลำดับการนับได้';

  @override
  String get countingSpanWinTitle => 'นับอัจฉริยะ!';

  @override
  String countingSpanGameOverMessage(int score) {
    return 'คุณได้ $score คะแนนในการท้าทายความจำการนับช่วง!';
  }

  @override
  String get countingSpanCountCircles => 'นับเฉพาะวงกลมสีน้ำเงิน';

  @override
  String get countingSpanRecallCounts => 'เรียกคืนการนับตามลำดับที่ถูกต้อง';

  @override
  String get countingSpanGreatJob => 'เยี่ยมมาก!';

  @override
  String get countingSpanTryAgain => 'ลองอีกครั้ง!';

  @override
  String countingSpanYourSequence(String sequence) {
    return 'ลำดับของคุณ: $sequence';
  }

  @override
  String get countingSpanLength => 'ความยาว';

  @override
  String get objDispTitle => 'การกระจัดของวัตถุ';

  @override
  String get objDispSubtitle =>
      'จดจำเค้าโครง ค้นหาและแตะวัตถุหนึ่งชิ้นที่เลื่อนตำแหน่ง';

  @override
  String get objDispWinTitle => 'อัจฉริยะเชิงพื้นที่!';

  @override
  String objDispGameOverMessage(int score) {
    return 'คุณระบุวัตถุที่ถูกแทนที่ $score ได้อย่างถูกต้อง!';
  }

  @override
  String get objDispMemorizeAll => 'จดจำตำแหน่งทั้งหมด';

  @override
  String get objDispWaitingShift => 'กำลังรอการเปลี่ยนเค้าโครง...';

  @override
  String get objDispTapMoved => 'แตะวัตถุที่เคลื่อนไหว';

  @override
  String get objDispExcellent => 'ยอดเยี่ยม!';

  @override
  String get objDispWrongObject => 'วัตถุผิด!';

  @override
  String get objDispItems => 'รายการ';

  @override
  String get mandalaTitle => 'มันดาลารีคอล';

  @override
  String get mandalaSubtitle => 'จดจำการกำหนดค่าสี เลือกสีและทาสีกระเบื้องใหม่';

  @override
  String get mandalaWinTitle => 'ศิลปินมันดาลา!';

  @override
  String mandalaGameOverMessage(int score) {
    return 'คุณได้ $score คะแนนจากการสร้างเลย์เอาต์เรขาคณิตแบบมีสีขึ้นมาใหม่!';
  }

  @override
  String get mandalaMemorizeColors => 'จดจำสีกระเบื้อง';

  @override
  String get mandalaPaintCells => 'ทาสีเซลล์ให้ตรงกับต้นฉบับ';

  @override
  String get mandalaExcellent => 'ยอดเยี่ยม!';

  @override
  String get mandalaIncorrectMatch => 'จับคู่ไม่ถูกต้อง!';

  @override
  String get mandalaSubmitRepaint => 'ส่งทาสีใหม่';

  @override
  String get mandalaTiles => 'กระเบื้อง';

  @override
  String get runningSpanTitle => 'วิ่งช่วง';

  @override
  String get runningSpanSubtitle =>
      'ดูตัวอักษร. เมื่อหยุด ให้ป้อนตัวอักษร N สุดท้ายตามลำดับ';

  @override
  String get runningSpanWinTitle => 'บัฟเฟอร์มาสเตอร์!';

  @override
  String runningSpanGameOverMessage(int score) {
    return 'คุณได้ $score คะแนนในการรัน Memory Span!';
  }

  @override
  String runningSpanPrepareRecall(int count) {
    return 'เตรียมเรียกคืนตัวอักษร $count ตัวสุดท้าย';
  }

  @override
  String get runningSpanWatchCarefully => 'ระวังให้ดี...';

  @override
  String runningSpanEnterLast(int count) {
    return 'ป้อน $count ตัวอักษรสุดท้าย';
  }

  @override
  String get runningSpanGreatJob => 'เยี่ยมมาก!';

  @override
  String get runningSpanIncorrectBuffer => 'บัฟเฟอร์ไม่ถูกต้อง!';

  @override
  String runningSpanRecallLast(int count) {
    return 'เรียกคืน $count ล่าสุด';
  }

  @override
  String get runningSpanStopsRandomly => 'สตรีมหยุดแบบสุ่ม!';

  @override
  String runningSpanEntered(String sequence) {
    return 'เข้ามา: $sequence';
  }

  @override
  String get runningSpanNItems => 'N-รายการ';

  @override
  String get spatialCabinetTitle => 'ตู้เชิงพื้นที่';

  @override
  String get spatialCabinetSubtitle => 'จดจำว่าลิ้นชักตู้ใดมีวัตถุใด';

  @override
  String get spatialCabinetWinTitle => 'ผู้เชี่ยวชาญคณะรัฐมนตรี!';

  @override
  String spatialCabinetGameOverMessage(int score) {
    return 'คุณได้ $score คะแนนในหน่วยความจำ Spatial Cabinet!';
  }

  @override
  String get spatialCabinetMemorize => 'จดจำตำแหน่งของรายการ';

  @override
  String spatialCabinetWhereIs(String itemName) {
    return '$itemName อยู่ที่ไหน';
  }

  @override
  String get spatialCabinetCorrect => 'ถูกต้อง!';

  @override
  String get spatialCabinetWrongDrawer => 'ลิ้นชักผิด!';

  @override
  String get spatialCabinetItems => 'รายการ';

  @override
  String get cabinetItemKey => 'สำคัญ';

  @override
  String get cabinetItemApple => 'แอปเปิล';

  @override
  String get cabinetItemDiamond => 'เพชร';

  @override
  String get cabinetItemBook => 'หนังสือ';

  @override
  String get cabinetItemUmbrella => 'ร่ม';

  @override
  String get cabinetItemCoffee => 'กาแฟ';

  @override
  String get cabinetItemLock => 'ล็อค';

  @override
  String get cabinetItemPet => 'สัตว์เลี้ยง';

  @override
  String get cabinetItemCar => 'รถ';

  @override
  String get gamesTitleLabel => 'เกม';

  @override
  String get yourFavorites => 'รายการโปรดของคุณ';

  @override
  String get readyForWorkout => 'พร้อมสำหรับการฝึกสมองประจำวันของคุณหรือยัง?';

  @override
  String get greatStartKeepGoing => 'เริ่มต้นได้ดี! ทำต่อไป';

  @override
  String get onFireToday => 'วันนี้คุณเครื่องร้อนมาก!';

  @override
  String get incredibleSolvingToday => 'วันนี้แก้ปัญหาได้ยอดเยี่ยมมาก!';

  @override
  String get newGameLabel => 'ใหม่';

  @override
  String get slitherlinkTitle => 'สลิเธอร์ลิงก์';

  @override
  String get slitherlinkSubtitle => 'ลากเส้นล้อมรอบจุดตามคำใบ้ตัวเลข';

  @override
  String get futoshikiTitle => 'ฟูโตชิกิ';

  @override
  String get futoshikiSubtitle =>
      'เติมตัวเลขในตารางตามคำใบ้เครื่องหมายมากกว่า-น้อยกว่า';

  @override
  String get kakuroTitle => 'คาคุโระ';

  @override
  String get kakuroSubtitle => 'ไขปริศนาอักษรไขว้ด้วยตัวเลขและผลรวม';

  @override
  String get inequalityDashTitle => 'วิ่งแข่งอสมการ';

  @override
  String get inequalityDashSubtitle => 'แก้อสมการภายใต้ความกดดันของเวลา';

  @override
  String get factorFinderTitle => 'ค้นหาตัวประกอบ';

  @override
  String get factorFinderSubtitle => 'หาตัวประกอบทั้งหมดของตัวเลขเป้าหมาย';

  @override
  String get collatzTitle => 'เส้นทางคอลลาตซ์';

  @override
  String get collatzSubtitle => 'เดินทางผ่านลำดับ 3N+1';

  @override
  String get sumPyramidTitle => 'พีระมิดผลรวม';

  @override
  String get sumPyramidSubtitle => 'เติมช่องในพีระมิดด้วยคำใบ้การบวกเลข';

  @override
  String get target10Title => 'เป้าหมาย 10';

  @override
  String get target10Subtitle => 'รวมแผ่นตัวเลขเพื่อให้ได้ผลรวมเท่ากับสิบ';

  @override
  String get fractionMatcherTitle => 'จับคู่เศษส่วน';

  @override
  String get fractionMatcherSubtitle => 'จับคู่เศษส่วนที่มีค่าเท่ากันด้วยสายตา';

  @override
  String get dualCodingTitle => 'การเข้ารหัสคู่';

  @override
  String get dualCodingSubtitle => 'จับคู่ตัวอักษรและสัญลักษณ์ไปพร้อมกัน';

  @override
  String get distractorMatrixTitle => 'เมทริกซ์ตัวลวง';

  @override
  String get distractorMatrixSubtitle => 'ค้นหา รูปทรงเป้าหมายท่ามกลางตัวลวง';

  @override
  String get temporalOrderTitle => 'ลำดับเวลา';

  @override
  String get temporalOrderSubtitle => 'จดจำลำดับเหตุการณ์ตามเวลา';

  @override
  String get associativePairsTitle => 'คู่ความสัมพันธ์';

  @override
  String get associativePairsSubtitle =>
      'จับคู่สัญลักษณ์ที่มีความเกี่ยวข้องกัน';

  @override
  String get blockCount3dTitle => 'นับบล็อก 3 มิติ';

  @override
  String get blockCount3dSubtitle => 'นับจำนวนบล็อกในพื้นที่สามมิติ';

  @override
  String get rotatingMazeTitle => 'เขาวงกตหมุน';

  @override
  String get rotatingMazeSubtitle => 'หมุนเขาวงกตเพื่อนำลูกบอลไปที่ทางออก';

  @override
  String get silhouetteMatchOrthoTitle => 'จับคู่เงา (ออร์โธ)';

  @override
  String get silhouetteMatchOrthoSubtitle =>
      'จับคู่ วัตถุ 3 มิติกับเงาด้านประชิด';

  @override
  String get spatialConflictTitle => 'ความขัดแย้งของมิติ';

  @override
  String get spatialConflictSubtitle =>
      'แก้ไขความไม่สอดคล้องระหว่างข้อความและทิศทาง';

  @override
  String get spotlightTrackTitle => 'ติดตามสปอตไลต์';

  @override
  String get spotlightTrackSubtitle =>
      'ติดตามไอเท็มที่กะพริบในเงาที่กำลังเคลื่อนที่';

  @override
  String get d2AttentionTitle => 'สมาธิ d2';

  @override
  String get d2AttentionSubtitle => 'แตะสัญลักษณ์เป้าหมายตามเกณฑ์ที่เข้มงวด';

  @override
  String get dualMirrorTitle => 'เขาวงกตกระจกคู่';

  @override
  String get dualMirrorSubtitle => 'เดินทางผ่านเขาวงกตสองแห่งพร้อมกัน';

  @override
  String get contextCluesTitle => 'คำใบ้จากบริบท';

  @override
  String get contextCluesSubtitle => 'เดาคำที่ซ่อนอยู่จากคำใบ้รอบข้าง';

  @override
  String get digitSpanReverseSubtitle => 'จดจำตัวเลขแบบย้อนกลับ';

  @override
  String get faceNameAssociationSubtitle => 'จดจำชื่อของใบหน้าต่างๆ ที่ปรากฏ';

  @override
  String get staircaseMemorySubtitle => 'จดจำบล็อกในลำดับขั้นบันได';

  @override
  String get choiceReactionTimeSubtitle => 'แตะปุ่มที่ตรงกับคำใบ้ให้เร็วที่สุด';

  @override
  String get attentionalBlinkSubtitle => 'จับเป้าหมายที่ปรากฏขึ้นอย่างรวดเร็ว';

  @override
  String get visualStatisticalLearningSubtitle =>
      'เรียนรู้รูปแบบรูปทรงตามลำดับเวลาด้วยสายตา';

  @override
  String get sternbergTaskSubtitle =>
      'จำให้ได้ว่าสัญลักษณ์นั้นอยู่ในชุดความจำหรือไม่';

  @override
  String get operationSpanSubtitle => 'แก้โจทย์เลขและจดจำชุดตัวอักษร';

  @override
  String get continuousRecognitionTitle => 'การจดจำต่อเนื่อง';

  @override
  String get continuousRecognitionSubtitle =>
      'ระบุว่าการ์ดที่ปรากฏเป็นของเก่าหรือของใหม่';

  @override
  String get symmetrySpanTitle => 'ช่วงสมมาตร';

  @override
  String get symmetrySpanSubtitle =>
      'จดจำตำแหน่งของช่องท่ามกลางการตัดสินใจเรื่องความสมมาตรแนวตั้ง';

  @override
  String get objectDisplacementTitle => 'การย้ายที่ของวัตถุ';

  @override
  String get objectDisplacementSubtitle =>
      'ศึกษาการวางตำแหน่งและแตะวัตถุเพียงชิ้นเดียวที่เคลื่อนที่';

  @override
  String get mandalaRecallTitle => 'ระลึกภาพมณฑล';

  @override
  String get mandalaRecallSubtitle =>
      'จดจำแผ่นสีและระบายสีมณฑลใหม่ตามแบบจากจานสี';

  @override
  String get runningMemorySpanTitle => 'ช่วงความจำต่อเนื่อง';

  @override
  String get runningMemorySpanSubtitle =>
      'ตรวจสอบตัวอักษรที่ผ่านไปและจดจำไอเท็ม N ลำดับสุดท้าย';

  @override
  String get spatialCabinetMemoryTitle => 'ตู้เก็บของมิติ';

  @override
  String get spatialCabinetMemorySubtitle =>
      'จดจำและหาตำแหน่งของไอเท็มหลังบานตู้';

  @override
  String get pathRecallSubtitle => 'จดจำและทำซ้ำเส้นทางที่เลือก';

  @override
  String get objectShuffleSubtitle => 'ติดตามไอเท็มที่สลับไปมาภายใต้อุ้งมือ';

  @override
  String get groceryListSubtitle => 'จดจำและทำเครื่องหมายรายการของชำ';

  @override
  String get quickMathSubtitle => 'แก้โจทย์คณิตศาสตร์ด้วยความเร็วสูงสุด';

  @override
  String get mathGuessTitle => 'เดาเลขคณิต';

  @override
  String get mathGuessSubtitle => 'เดาตัวเลขที่ซ่อนอยู่ภายใน 15 ครั้ง';

  @override
  String get reflexTapSubtitle => 'แตะสิ่งที่ปรากฏให้เร็วที่สุดเท่าที่จะทำได้';

  @override
  String get pixelMimicSubtitle => 'เลียนแบบรูปแบบดีไซน์บนตารางพิกเซล';

  @override
  String get simonSequenceSubtitle => 'ทำซ้ำลำดับรูปทรงจากความจำ';

  @override
  String get slidePuzzleSubtitle => 'จัดเรียงแผ่นตารางเลื่อนสี่เหลี่ยมใหม่';

  @override
  String get findWordTitle => 'ค้นหาคำ';

  @override
  String get schulteTableSubtitle => 'แตะตัวเลขตั้งแต่หนึ่งถึงยี่สิบห้า';

  @override
  String get simonCommandTitle => 'ไซมอนสั่ง';

  @override
  String get simonCommandSubtitle => 'ปฏิบัติตามคำสั่งเสียงอย่างรวดเร็ว';

  @override
  String get binaryCodeTitle => 'ความเร็วฐานสอง';

  @override
  String get binaryCodeSubtitle => 'แปลรหัสฐานสองเป็นเลขฐานสิบ';

  @override
  String get moduloClockTitle => 'นาฬิกามอดูโล';

  @override
  String get moduloClockSubtitle => 'คำนวณสมการคณิตศาสตร์โดยใช้หน้าปัดนาฬิกา';

  @override
  String get chimpTestTitle => 'แบบทดสอบชิมแปนซี';

  @override
  String get chimpTestSubtitle => 'แตะตัวเลขที่สุ่มขึ้นมาตามลำดับจากน้อยไปมาก';

  @override
  String get relationalMemoryTitle => 'ความจำเชิงสัมพันธ์';

  @override
  String get relationalMemorySubtitle => 'จดจำตำแหน่งที่แน่นอนของไอเท็มในตาราง';

  @override
  String get factBinderTitle => 'เชื่อมโยงข้อเท็จจริง';

  @override
  String get factBinderSubtitle => 'เชื่อมต่อสัญลักษณ์และจดจำข้อความ';

  @override
  String get sourceMonitoringTitle => 'การตรวจสอบที่มา';

  @override
  String get sourceMonitoringSubtitle => 'จดจำบริบท';

  @override
  String get klotskiTitle => 'หลบหนีคลอตสกี้';

  @override
  String get klotskiSubtitle => 'เลื่อนบล็อกเพื่อไปให้ถึงทางออก';

  @override
  String get homophoneHuntSubtitle => 'เลือกคำพ้องเสียงที่สะกดถูกต้อง';

  @override
  String get laserLinkTitle => 'เลเซอร์ลิงก์';

  @override
  String get laserLinkSubtitle =>
      'หมุนกระจกเพื่อสะท้อนเลเซอร์และเพิ่มพลังให้กับเป้าหมายทั้งหมด';

  @override
  String get laserLinkCongrats =>
      'การสะท้อนที่แม่นยำ! คุณจ่ายไฟให้คนทั้งกริดได้สำเร็จ';

  @override
  String get crossSectionSliceTitle => 'แผ่นภาพตัดขวาง';

  @override
  String get crossSectionSliceSubtitle =>
      'ระบุภาพตัดขวาง 2 มิติที่ถูกต้องของวัตถุ 3 มิติจากมุมที่กำหนด';

  @override
  String get crossSectionSliceCongrats =>
      'การสร้างภาพ 3 มิติที่น่าทึ่ง! คุณมองทะลุรูปร่างนั้นได้ทันที';

  @override
  String get shadowPivotTitle => 'จุดหมุนเงา';

  @override
  String get shadowPivotCongrats =>
      'การใช้เหตุผลเชิงพื้นที่แบบไดนามิก! คุณเชี่ยวชาญเรื่องแสงและเงา';

  @override
  String get shadowPivotSubtitle =>
      'ทำนายเงาที่ทอดโดยวัตถุ 3 มิติขณะที่มันหมุนในแกนต่างๆ';

  @override
  String get interlockPuzzleTitle => 'ปริศนาเชื่อมโยง';

  @override
  String get interlockPuzzleSubtitle =>
      'ถอดประกอบหรือประกอบบล็อกที่เชื่อมต่อกันอย่างซับซ้อนตามลำดับที่ถูกต้อง';

  @override
  String get interlockPuzzleCongrats =>
      'การถอดรหัสเชิงตรรกะ! คุณคลี่คลายปริศนาได้อย่างสมบูรณ์แบบ';

  @override
  String get pathIntersectTitle => 'ทางแยกเส้นทาง';

  @override
  String get pathIntersectSubtitle =>
      'นำทางหลายเส้นทางพร้อมกันเพื่อไปยังเป้าหมายของแต่ละเส้นทางโดยไม่ชนกัน';

  @override
  String get pathIntersectCongrats =>
      'การนำทางที่สอดประสานกัน! คุณบรรลุเป้าหมายทั้งหมดอย่างไร้ที่ติ';

  @override
  String get negativeSpaceDetectionTitle => 'พื้นที่ว่างเชิงลบ';

  @override
  String get negativeSpaceDetectionSubtitle =>
      'ระบุรูปร่างที่เกิดจากพื้นที่ว่างระหว่างวัตถุ';

  @override
  String get negativeSpaceDetectionCongrats =>
      'การรับรู้ที่เฉียบคม! คุณเชี่ยวชาญศิลปะแห่งการมองเห็นสิ่งที่ไม่ได้อยู่ตรงนั้น';

  @override
  String get compassMazeTitle => 'เขาวงกตเข็มทิศ';

  @override
  String get compassMazeSubtitle =>
      'นำทางในเขาวงกตที่ทิศทางการเคลื่อนที่เปลี่ยนไปตามการวางแนวของเข็มทิศของคุณ';

  @override
  String get compassMazeCongrats =>
      'การนำทางระดับผู้เชี่ยวชาญ! คุณพบทางออกผ่านทิศทางที่เปลี่ยนแปลงตลอดเวลา';

  @override
  String get complexFoldingNetsTitle => 'ตาข่ายพับ';

  @override
  String get complexFoldingNetsSubtitle =>
      'กำหนดว่ารูปทรง 3 มิติที่ซับซ้อนใดจะเกิดขึ้นจากการพับตาข่าย 2 มิติที่ไม่เป็นมาตรฐาน';

  @override
  String get complexFoldingNetsCongrats =>
      'ตรรกะการพับขั้นสูง! คุณจินตนาการถึงรูปแบบ 3 มิติได้สำเร็จ';

  @override
  String get compassMazeMessage => 'นำทางในเขาวงกตโดยใช้เข็มทิศ';

  @override
  String get negativeSpaceDetectionMessage => 'ระบุวัตถุที่ซ่อนอยู่ในพื้นที่';

  @override
  String get shikakuTitle => 'ชิคาคุ';

  @override
  String get shikakuSubtitle =>
      'แบ่งตารางออกเป็นสี่เหลี่ยมจัตุรัสและสี่เหลี่ยมที่ตรงกับตัวเลข';

  @override
  String get countdownMathTitle => 'คณิตศาสตร์นับถอยหลัง';

  @override
  String get countdownMathSubtitle => 'รวมตัวเลขสุ่มเพื่อคำนวณเป้าหมายสามหลัก';

  @override
  String get narrativeRecallTitle => 'การเรียกคืนเรื่องเล่า';

  @override
  String get narrativeRecallSubtitle =>
      'อ่านเรื่องราวและจดจำรายละเอียดเชิงปริมาณและข้อเท็จจริงที่เฉพาะเจาะจง';

  @override
  String get shellGameTitle => 'เกมเชลล์';

  @override
  String get shellGameSubtitle =>
      'ติดตามลูกบอลที่ซ่อนอยู่ในฐานะสถานที่สลับถ้วยสับ';

  @override
  String get typoglycemiaDecoderTitle => 'ตัวถอดรหัสภาวะน้ำตาลในเลือดต่ำ';

  @override
  String get typoglycemiaDecoderSubtitle =>
      'ถอดรหัสและอ่านประโยคที่สับสนได้อย่างรวดเร็ว';

  @override
  String get shapeShifterTitle => 'ตัวเปลี่ยนรูปร่าง';

  @override
  String get shapeShifterSubtitle => 'แตะการผสมรูปร่างและสีเป้าหมาย';

  @override
  String get gokigenNanameTitle => 'โกกิเก็น นานาเมะ';

  @override
  String get gokigenNanameSubtitle =>
      'วาดเส้นทแยงมุมเพื่อเชื่อมต่อจุดต่างๆ โดยไม่ต้องวนซ้ำ';

  @override
  String get matrixMultiplierTitle => 'ตัวคูณเมทริกซ์';

  @override
  String get matrixMultiplierSubtitle =>
      'เลือกแถวและคอลัมน์ที่จะคูณกับเป้าหมาย';

  @override
  String get wordAssociationRecallTitle => 'สมาคมคำ';

  @override
  String get wordAssociationRecallSubtitle =>
      'เรียกคืนการเชื่อมโยงคำที่จับคู่จากหน่วยความจำ';

  @override
  String get gearRotationTitle => 'การหมุนเกียร์';

  @override
  String get gearRotationSubtitle => 'ทำนายทิศทางการหมุนของเกียร์สุดท้าย';

  @override
  String get wordWheelTitle => 'วงล้อคำ';

  @override
  String get wordWheelSubtitle =>
      'สร้างคำโดยใช้ตัวอักษรบนวงล้อรวมทั้งอักษรตรงกลางด้วย';

  @override
  String get oddEvenFlashTitle => 'แฟลชคี่คู่';

  @override
  String get oddEvenFlashSubtitle =>
      'จับคู่ความเท่าเทียมกันของตัวเลขกับกฎสีอย่างรวดเร็ว';

  @override
  String get norinoriTitle => 'โนริโนริ';

  @override
  String get norinoriSubtitle => 'แรเงาเซลล์ที่เชื่อมต่อกันสองเซลล์ในแต่ละห้อง';

  @override
  String get algebraicBalanceTitle => 'สมดุลพีชคณิต';

  @override
  String get algebraicBalanceSubtitle => 'แก้สมการเพื่อหาผลรวมเป้าหมาย';

  @override
  String get patternSequenceDrawTitle => 'การเรียกคืนรูปแบบ';

  @override
  String get patternSequenceDrawSubtitle =>
      'ทำซ้ำลำดับเส้นทางแบบเคลื่อนไหวบนตาราง';

  @override
  String get tangramTitle => 'ปริศนาแทนแกรม';

  @override
  String get tangramSubtitle => 'จัดเรียงรูปร่างเพื่อเติมเต็มภาพเงาของเป้าหมาย';

  @override
  String get semanticAssociationTitle => 'คำว่าสมาคม';

  @override
  String get semanticAssociationSubtitle => 'ค้นหาคำที่เชื่อมโยงทั้งสามเบาะแส';

  @override
  String get peripheralFocusTitle => 'โฟกัสอุปกรณ์ต่อพ่วง';

  @override
  String get peripheralFocusSubtitle =>
      'ตอบสนองต่อแผงด้านข้างที่กระพริบขณะแก้คณิตศาสตร์';

  @override
  String get masyuTitle => 'มาชูลูป';

  @override
  String get masyuSubtitle => 'วาดวงเดียวที่ตรงกับกฎวงกลม Masyu';

  @override
  String get mathMazeTitle => 'เขาวงกตคณิตศาสตร์';

  @override
  String get mathMazeSubtitle => 'ติดตามเส้นทางที่ประเมินผลรวมเป้าหมาย';

  @override
  String get storyBuilderTitle => 'ตัวสร้างเรื่องราว';

  @override
  String get storyBuilderSubtitle => 'สร้างลำดับเหตุการณ์ของเรื่องขึ้นใหม่';

  @override
  String get mirrorMazeTitle => 'เขาวงกตกระจก';

  @override
  String get mirrorMazeSubtitle =>
      'เปลี่ยนเส้นทางลำแสงเลเซอร์โดยใช้กระจกแนวทแยง';

  @override
  String get wordGridConnectionTitle => 'การเชื่อมต่อคำ';

  @override
  String get wordGridConnectionSubtitle =>
      'จัดกลุ่มคำ 16 คำเป็น 4 หมวดหมู่ กลุ่มละ 4 คำ';

  @override
  String get shapeShifterPeripheralTitle => 'รูปร่างอุปกรณ์ต่อพ่วง';

  @override
  String get shapeShifterPeripheralSubtitle =>
      'ติดตามการเปลี่ยนแปลงรูปร่างส่วนต่อพ่วงในขณะที่จับคู่ค่าส่วนกลาง';

  @override
  String get soundWaveMatchTitle => 'การจับคู่คลื่นเสียง';

  @override
  String get soundWaveMatchSubtitle =>
      'แตะเมื่อความถี่คลื่นภาพสอดคล้องกับการเปลี่ยนแปลงระดับเสียง';

  @override
  String get multiTrackCounterTitle => 'เคาน์เตอร์หลายแทร็ก';

  @override
  String get multiTrackCounterSubtitle =>
      'แตะเมื่อตัวนับเพิ่มขึ้นเป็นตัวคูณเป้าหมาย';

  @override
  String get colorWordMatchUpTitle => 'การจับคู่สี';

  @override
  String get colorWordMatchUpSubtitle =>
      'ตรวจสอบว่าคำที่มีสีสองคำตรงกันตามกฎที่เปลี่ยนแปลงหรือไม่';

  @override
  String get signalAndNoiseTitle => 'สัญญาณและเสียงรบกวน';

  @override
  String get signalAndNoiseSubtitle =>
      'ค้นหาอักขระตัวอักษรและตัวเลขเป้าหมายที่ซ่อนอยู่ในสัญญาณรบกวนคงที่';

  @override
  String get focusTunnelTitle => 'อุโมงค์โฟกัส';

  @override
  String get focusTunnelSubtitle =>
      'ระบุสัญลักษณ์ที่ตรงกันที่ปรากฏบนผนังอุโมงค์ที่กำลังเคลื่อนที่';

  @override
  String get targetPursuerTitle => 'ผู้ตามเป้าหมาย';

  @override
  String get targetPursuerSubtitle =>
      'ติดตามวงกลมหลายวงที่ทับซ้อนกันและเลือกเป้าหมายเดิม';

  @override
  String get gridGazeTitle => 'กริดจ้องมอง';

  @override
  String get gridGazeSubtitle =>
      'ระบุว่าเซลล์กริดใดที่กะพริบโดยมีระยะเวลาต่างกัน';

  @override
  String get doubleTroubleTitle => 'ปัญหาสองเท่า';

  @override
  String get doubleTroubleSubtitle =>
      'เล่นเกมง่ายๆ สองเกมแยกกันพร้อมกันบนหน้าจอแยก';

  @override
  String get syncRhythmTitle => 'ซิงค์จังหวะ';

  @override
  String get syncRhythmSubtitle =>
      'แตะเมื่อการกวาดเครื่องเมตรอนอมแบบภาพตรงกับจังหวะที่ซิงค์กัน';

  @override
  String get ghostTapTitle => 'ผีแตะ';

  @override
  String get ghostTapSubtitle => 'แตะเมื่อชีพจรที่มองไม่เห็นถึงความสูงสูงสุด';

  @override
  String get attentionalRsvpTitle => 'ตอบรับคำเชิญอย่างตั้งใจ';

  @override
  String get attentionalRsvpSubtitle =>
      'ระบุตัวเลขที่ปรากฏในตัวอักษรอนุกรมแบบรวดเร็ว';

  @override
  String get colorMazeNavTitle => 'นำทางเขาวงกตสี';

  @override
  String get colorMazeNavSubtitle =>
      'นำทางแผ่นเขาวงกตที่ตรงกับสีการอนุญาตแบบไดนามิก';

  @override
  String get dynamicSalienceTitle => 'ความโดดเด่นแบบไดนามิก';

  @override
  String get dynamicSalienceSubtitle =>
      'ค้นหารูปร่างที่เคลื่อนไหวด้วยไดนามิกที่แตกต่างกันเล็กน้อย';

  @override
  String get chalkAndTalkTitle => 'ชอล์กและพูดคุย';

  @override
  String get chalkAndTalkSubtitle =>
      'พิมพ์คำที่ได้ยินเป็นเสียงโดยไม่สนใจสิ่งรบกวนการมองเห็น';

  @override
  String get blinkDetectorTitle => 'เครื่องตรวจจับการกะพริบตา';

  @override
  String get blinkDetectorSubtitle =>
      'แตะหน้าตารางที่กะพริบสองครั้งติดต่อกันอย่างรวดเร็ว';

  @override
  String get frequencyTapTitle => 'แตะความถี่';

  @override
  String get frequencyTapSubtitle => 'แตะปุ่มที่ตรงกับความถี่พัลส์แสงเป้าหมาย';

  @override
  String get yajilinTitle => 'ยาจิลินลูป';

  @override
  String get yajilinSubtitle => 'วางเซลล์สีดำและวาดเบาะแสการจับคู่วงเดียว';

  @override
  String get heyawakeTitle => 'เฮย์เวค กริด';

  @override
  String get heyawakeSubtitle => 'ห้องกริดบังแดดโดยไม่มีเซลล์สีดำที่อยู่ติดกัน';

  @override
  String get gokigenVariantTitle => 'รุ่นโกกิเก็น';

  @override
  String get gokigenVariantSubtitle =>
      'วาดเส้นทแยงมุมแบบไม่วนซ้ำตามจำนวนจุดยอด';

  @override
  String get sheepAndWolvesTitle => 'แกะและหมาป่า';

  @override
  String get sheepAndWolvesSubtitle => 'วาดวงแยกแกะจากหมาป่า';

  @override
  String get islandNurikabeTitle => 'เกาะนูริคาเบะ';

  @override
  String get islandNurikabeSubtitle =>
      'สร้างเกาะที่ตรงกับข้อจำกัดด้านขนาดตัวเลข';

  @override
  String get shakashakaTitle => 'Shakashaka Rects';

  @override
  String get shakashakaSubtitle =>
      'วางกระเบื้องสามเหลี่ยมเพื่อสร้างพื้นที่สีขาวเป็นรูปสี่เหลี่ยมผืนผ้า';

  @override
  String get litsTetrisTitle => 'ลิทส์ เทโตรมิโน';

  @override
  String get litsTetrisSubtitle =>
      'วางเทโตรมิโนไว้ในห้องที่ไม่มีสิ่งที่ซ้ำกันติดกัน';

  @override
  String get tapaWallTitle => 'กำแพงทาปา';

  @override
  String get tapaWallSubtitle => 'แรเงาเซลล์เพื่อสร้างลวดลายผนังสีดำต่อเนื่อง';

  @override
  String get triangularBridgesTitle => 'สะพานสามเหลี่ยม';

  @override
  String get triangularBridgesSubtitle =>
      'เชื่อมต่อเกาะต่างๆ ใน 3 ทิศทางที่ตรงตามข้อกำหนด';

  @override
  String get rippleEffectTitle => 'ระลอกคลื่น';

  @override
  String get rippleEffectSubtitle =>
      'กรอกตัวเลขในห้องโดยคำนึงถึงข้อจำกัดของระยะห่าง';

  @override
  String get suguruTectonicTitle => 'ซูกุรุกริด';

  @override
  String get suguruTectonicSubtitle =>
      'เติมบล็อคห้องด้วยตัวเลข 1 ถึง K โดยไม่มีเพื่อนบ้านเท่ากัน';

  @override
  String get tennerGridTitle => 'เทนเนอร์กริด';

  @override
  String get tennerGridSubtitle => 'เติมแถวด้วยผลรวมของคอลัมน์ที่ตรงกัน 0-9';

  @override
  String get kakurasuSumsTitle => 'ผลรวมคาคุระสึ';

  @override
  String get kakurasuSumsSubtitle =>
      'แรเงาเซลล์เพื่อให้ตรงกับผลรวมดัชนีแถว/คอลัมน์แบบถ่วงน้ำหนัก';

  @override
  String get corralLoopTitle => 'คอร์รัลลูป';

  @override
  String get corralLoopSubtitle => 'วาดวงเดียวล้อมรอบตัวเลขที่ตรงกับการมองเห็น';

  @override
  String get stostoneTitle => 'แรงโน้มถ่วงของสโตสโตน';

  @override
  String get stostoneSubtitle =>
      'แรเงาเซลล์ที่เลื่อนลงมาเพื่อเติมแถวด้านล่างให้สมบูรณ์';

  @override
  String get tripletsLogicTitle => 'แฝดสาม ทริโอ';

  @override
  String get tripletsLogicSubtitle =>
      'เติมตารางด้วยรูปร่างสามแบบโดยหลีกเลี่ยงสามแบบติดต่อกัน';

  @override
  String get galaxiesSymTitle => 'สมมาตรของกาแล็กซี';

  @override
  String get galaxiesSymSubtitle =>
      'แบ่งตารางออกเป็นรูปร่างกาแล็กซีที่สมมาตรในการหมุน';

  @override
  String get matrixMultiplierMatchTitle => 'เมทริกซ์แมทเชอร์';

  @override
  String get matrixMultiplierMatchSubtitle =>
      'คูณค่าแถวและคอลัมน์เพื่อให้ตรงกับผลคูณจุดเป้าหมาย';

  @override
  String get primeFactorTreesTitle => 'ต้นไม้ปัจจัยสำคัญ';

  @override
  String get primeFactorTreesSubtitle =>
      'แยกจำนวนประกอบออกเป็นคู่แฟกเตอร์ไพรม์ลีฟ';

  @override
  String get vektorVectorTitle => 'เวกเตอร์';

  @override
  String get vektorVectorSubtitle =>
      'ปรับขนาดเวกเตอร์เพื่อทำให้ผลรวมของพวกมันอยู่บนเป้าหมาย';

  @override
  String get binomialMatchTitle => 'การจับคู่ทวินาม';

  @override
  String get binomialMatchSubtitle =>
      'จับคู่สูตรกำลังสองกับค่าทวินามแบบแยกตัวประกอบ';

  @override
  String get percentageShoppingTitle => 'ช้อปปิ้งเปอร์เซ็นต์';

  @override
  String get percentageShoppingSubtitle =>
      'คำนวณเปอร์เซ็นต์ส่วนลดและยอดรวมในการชำระเงินขั้นสุดท้าย';

  @override
  String get cryptoArithmeticTitle => 'Crypto-เลขคณิต';

  @override
  String get cryptoArithmeticSubtitle =>
      'ถอดรหัสปัญหาคณิตศาสตร์การเข้ารหัสการแทนที่อักขระและหลัก';

  @override
  String get fractionalPizzaTitle => 'พิซซ่าเศษส่วน';

  @override
  String get fractionalPizzaSubtitle =>
      'แบ่งชิ้นพิซซ่าให้ตรงกับเศษส่วนผลรวมเป้าหมาย';

  @override
  String get numberBondsTitle => 'พันธบัตรจำนวน';

  @override
  String get numberBondsSubtitle =>
      'เชื่อมโยงค่าโหนดให้เท่ากับผลรวมการเชื่อมต่อเป้าหมาย';

  @override
  String get gridSumLineTitle => 'เส้นรวมตาราง';

  @override
  String get gridSumLineSubtitle => 'วาดเส้นทางที่มีค่าประเมินตรงกับเป้าหมาย';

  @override
  String get binaryScaleBalanceTitle => 'เครื่องชั่งไบนารี่';

  @override
  String get binaryScaleBalanceSubtitle =>
      'ถ่วงน้ำหนักทศนิยมโดยใช้บล็อกยกกำลังสอง';

  @override
  String get moduloPathTitle => 'เส้นทางโมดูโล่';

  @override
  String get moduloPathSubtitle =>
      'ทราเวิร์สเซลล์กริดที่ตรงกับค่าส่วนที่เหลือแบบโมดูโล';

  @override
  String get digitSwapEqTitle => 'สมการสลับตัวเลข';

  @override
  String get digitSwapEqSubtitle =>
      'สลับเลขหลักเดียวระหว่างสมการเพื่อแก้ไขทั้งสองหลัก';

  @override
  String get areaPerimeterMatchTitle => 'พื้นที่และปริมณฑล';

  @override
  String get areaPerimeterMatchSubtitle =>
      'วาดรูปสี่เหลี่ยมที่ตรงกับพื้นที่เป้าหมายและค่าเส้นรอบวง';

  @override
  String get inequalityBalanceOpsTitle => 'ความสมดุลของความไม่เท่าเทียมกัน';

  @override
  String get inequalityBalanceOpsSubtitle =>
      'วางสัญลักษณ์อสมการระหว่างคำศัพท์ทางคณิตศาสตร์ที่ซับซ้อน';

  @override
  String get graphCoordinatePlotTitle => 'พลอตเตอร์กราฟ';

  @override
  String get graphCoordinatePlotSubtitle =>
      'พิกัดกริดพล็อตที่ตรงกับเส้นโค้งเชิงเส้น/กำลังสอง';

  @override
  String get baseConversionRunTitle => 'การแปลงฐาน';

  @override
  String get baseConversionRunSubtitle =>
      'แปลงค่าระหว่างไบนารี ทศนิยม ฐานสิบหก และฐานแปด';

  @override
  String get unitConverterProTitle => 'ตัวแปลงหน่วย';

  @override
  String get unitConverterProSubtitle =>
      'ตอบการแปลงหน่วยอย่างรวดเร็วภายใต้กำหนดเวลา';

  @override
  String get auditoryNBackTitle => 'การได้ยิน N-Back';

  @override
  String get auditoryNBackSubtitle =>
      'จับคู่ตัวอักษรที่ได้ยิน N ก้าวถอยหลังจากความทรงจำ';

  @override
  String get abstractPatternRecallTitle => 'การแบ่งชั้นรูปแบบ';

  @override
  String get abstractPatternRecallSubtitle =>
      'สร้างรูปทรงหลากสีเป็นชั้นขึ้นมาใหม่จากการศึกษาความจำ';

  @override
  String get roomInspectorTitle => 'สารวัตรห้อง';

  @override
  String get roomInspectorSubtitle =>
      'ระบุการดัดแปลงเฟอร์นิเจอร์ที่ทำในขณะที่หน้าจอว่างเปล่า';

  @override
  String get voiceToFaceMatchTitle => 'การจับคู่เสียงและใบหน้า';

  @override
  String get voiceToFaceMatchSubtitle =>
      'เลือกใบหน้าที่ถูกต้องที่เกี่ยวข้องกับคลิปเสียงพูด';

  @override
  String get spatialGridMemory3DTitle => 'หน่วยความจำเชิงพื้นที่ 3 มิติ';

  @override
  String get spatialGridMemory3DSubtitle =>
      'เรียกคืนบล็อกที่วาววับในโครงสร้างตารางลูกบาศก์ 3 มิติที่หมุนได้';

  @override
  String get sequenceStackTitle => 'ลำดับสแต็ก';

  @override
  String get sequenceStackSubtitle =>
      'สร้างการเพิ่มเติมและการถอดปึกแผ่นตามลำดับ';

  @override
  String get semanticCategoryRecallTitle => 'การเรียกคืนหมวดหมู่';

  @override
  String get semanticCategoryRecallSubtitle =>
      'ระบุคำศึกษาที่ตรงกับเป้าหมายหมวดหมู่ที่ร้องขอ';

  @override
  String get gridDisplacementTitle => 'การกระจัดของกริด';

  @override
  String get gridDisplacementSubtitle =>
      'ระบุไอคอนที่เลื่อนโดยเปรียบเทียบเค้าโครงกับต้นฉบับ';

  @override
  String get soundSequenceMatchTitle => 'การจับคู่ลำดับเสียง';

  @override
  String get soundSequenceMatchSubtitle =>
      'ทำซ้ำลำดับโน้ตที่เล่นบนแป้นพิมพ์เสมือน';

  @override
  String get cardCountingMemoryTitle => 'เคาน์เตอร์บัตร';

  @override
  String get cardCountingMemorySubtitle =>
      'ระบุไพ่ที่แจกไปแล้วในการแจกไพ่อย่างต่อเนื่อง';

  @override
  String get directionsRecallTitle => 'ทิศทางการเรียกคืน';

  @override
  String get directionsRecallSubtitle =>
      'นำทางแผนที่กริดที่ตรงกับทิศทางเส้นทางจากหน่วยความจำ';

  @override
  String get eventTimelineMemoryTitle => 'เส้นเวลาของเหตุการณ์';

  @override
  String get eventTimelineMemorySubtitle =>
      'จัดเรียงการ์ดเหตุการณ์ทางประวัติศาสตร์/ตัวละครตามลำดับเวลา';

  @override
  String get featureMatrixRecallTitle => 'คุณลักษณะเมทริกซ์';

  @override
  String get featureMatrixRecallSubtitle =>
      'ตอบคำถามพร้อมท์เกี่ยวกับแอตทริบิวต์รูปร่าง-สีของเซลล์';

  @override
  String get delayedMatchSampleTitle => 'การแข่งขันล่าช้า';

  @override
  String get delayedMatchSampleSubtitle =>
      'จับคู่สัญลักษณ์เป้าหมายหลังจากแก้ไขสิ่งที่กวนใจทางคณิตศาสตร์';

  @override
  String get symbolDigitAssocTitle => 'รศ.สัญลักษณ์-หลัก';

  @override
  String get symbolDigitAssocSubtitle => 'แก้แผ่นแปลสัญลักษณ์ที่ตรงกับคีย์หลัก';

  @override
  String get dualTaskMemoryTitle => 'หน่วยความจำแบบสองงาน';

  @override
  String get dualTaskMemorySubtitle =>
      'จดจำชุดคำไปพร้อมกับแก้โจทย์เลขคณิตอย่างรวดเร็ว';

  @override
  String get actionSequenceRecallTitle => 'การเรียกคืนการดำเนินการ';

  @override
  String get actionSequenceRecallSubtitle =>
      'ทำซ้ำลำดับภาพเคลื่อนไหวท่าทางตัวละครตามลำดับ';

  @override
  String get tangramPolygonTitle => 'แทนแกรมพอดี';

  @override
  String get tangramPolygonSubtitle =>
      'จัดเรียงรูปร่างหลายเหลี่ยมเพื่อเติมเต็มโครงร่างภาพเงา';

  @override
  String get mazeNav3DTitle => 'การนำทางเขาวงกต 3 มิติ';

  @override
  String get mazeNav3DSubtitle =>
      'นำทางเส้นทางเขาวงกตสามมิติสามมิติจากมุมมองบุคคลที่หนึ่ง';

  @override
  String get isometricProjectionTitle => 'เครื่องฉายภาพสามมิติ';

  @override
  String get isometricProjectionSubtitle =>
      'จับคู่ตัวเลขบล็อก 3 มิติกับมุมมองด้านบน/ด้านหน้าแบบออโธกราฟิก 2 มิติ';

  @override
  String get polyominoPackingTitle => 'การบรรจุโพลีโอมิโน';

  @override
  String get polyominoPackingSubtitle =>
      'บรรจุชิ้นส่วนบล็อกโพลีโอมิโนแบบสุ่มลงในพื้นที่เป้าหมาย';

  @override
  String get spatialGridRotationTitle => 'การหมุนตารางเชิงพื้นที่';

  @override
  String get spatialGridRotationSubtitle =>
      'จับคู่การจัดเรียงบล็อก 3 มิติที่หมุนไปตามพิกัดแกน';

  @override
  String get wireLoopGameTitle => 'ห่วงลวด';

  @override
  String get wireLoopGameSubtitle =>
      'ลากวงแหวนโลหะไปตามร่องลวดโดยไม่ต้องสัมผัสกัน';

  @override
  String get origamiUnfoldTitle => 'Origami แฉ';

  @override
  String get origamiUnfoldSubtitle =>
      'ระบุรูปแบบการเจาะรูหลังจากคลี่แผ่นพับออก';

  @override
  String get ropeTangleSolverTitle => 'เชือกแก้ให้หาย';

  @override
  String get ropeTangleSolverSubtitle =>
      'ลากโหนดเพื่อจัดวางกราฟระนาบโดยมีเส้นกากบาทเป็นศูนย์';

  @override
  String get gridFitTetrisTitle => 'ตัวแก้ไขตารางพอดี';

  @override
  String get gridFitTetrisSubtitle =>
      'จัดเรียงบล็อกที่ผิดปกติแบบคงที่เพื่อให้พอดีกับขอบเขตของคอนเทนเนอร์';

  @override
  String get vectorGridAlignmentTitle => 'การจัดแนวเวกเตอร์';

  @override
  String get vectorGridAlignmentSubtitle =>
      'ปรับขนาดและหมุนรูปร่างเพื่อให้ตรงกับเป้าหมายเทมเพลตเงา';

  @override
  String get blockStackingPhysicsTitle => 'บล็อกซ้อน';

  @override
  String get blockStackingPhysicsSubtitle =>
      'วางแผงบล็อกที่ผิดปกติเพื่อปรับสมดุลน้ำหนักแรงโน้มถ่วง';

  @override
  String get crossSectionMatch3DTitle => 'ภาพตัดขวาง 3 มิติ';

  @override
  String get crossSectionMatch3DSubtitle =>
      'ระบุรูปทรงชิ้น 2 มิติที่ตัดจากรูปร่าง 3 มิติ';

  @override
  String get symmetryPaintTitle => 'สีสมมาตร';

  @override
  String get symmetryPaintSubtitle =>
      'วาดส่วนของภาพสะท้อนในกระจกที่สะท้อนผ่านแกนสมมาตร';

  @override
  String get rollingBlockBloxTitle => 'บล็อกกลิ้ง';

  @override
  String get rollingBlockBloxSubtitle =>
      'ม้วนชิ้นส่วนบล็อกเพื่อลงจอดในแนวตั้งในช่องเป้าหมาย';

  @override
  String get perspectiveShiftViewTitle => 'การเปลี่ยนแปลงมุมมอง';

  @override
  String get perspectiveShiftViewSubtitle =>
      'หมุนกลุ่มบล็อกจนกว่าจะสะกดตัวอักษร/คำ';

  @override
  String get networkFlowSphericalTitle => 'การไหลของเครือข่าย';

  @override
  String get networkFlowSphericalSubtitle =>
      'เชื่อมต่อการไหลของกริดบนพิกัดทรงกระบอกที่ตัด';

  @override
  String get layeredSilhouetteBlendTitle => 'ซิลลูเตผสมผสาน';

  @override
  String get layeredSilhouetteBlendSubtitle =>
      'ซ้อนเลเยอร์สีเพื่อให้เข้ากับรูปร่างโปร่งแสงของเป้าหมาย';

  @override
  String get wordWheelPangramTitle => 'คำว่าแอนนาแกรม';

  @override
  String get wordWheelPangramSubtitle =>
      'สร้างคำที่มีตัวอักษรเป้าหมายตรงกลางจากล้อ';

  @override
  String get letterGridSwapperTitle => 'จดหมายแลกเปลี่ยน';

  @override
  String get letterGridSwapperSubtitle =>
      'สลับไทล์ตัวอักษรที่อยู่ติดกันเพื่อเติมแถวและคำคอลัมน์ให้สมบูรณ์';

  @override
  String get synonymMatchTitle => 'การจับคู่คำพ้อง';

  @override
  String get synonymMatchSubtitle =>
      'จับคู่เป้าหมายคำที่ล้มด้วยคำพ้องหรือคำตรงข้าม';

  @override
  String get vowelDropTitle => 'สระหล่น';

  @override
  String get vowelDropSubtitle => 'วางสระลงในตารางพิกัดเพื่อเติมคำให้สมบูรณ์';

  @override
  String get letterBalanceScaleTitle => 'ระดับความสมดุลของคำ';

  @override
  String get letterBalanceScaleSubtitle => 'สะกดคำที่มีค่าตัวอักษรสมดุลน้ำหนัก';

  @override
  String get wordChainShiritoriTitle => 'ห่วงโซ่คำ';

  @override
  String get wordChainShiritoriSubtitle =>
      'เชื่อมโยงคำวนซ้ำเริ่มต้นด้วยผลลัพธ์ตัวอักษรก่อนหน้า';

  @override
  String get affixBuilderTitle => 'ตัวสร้างส่วนต่อท้าย';

  @override
  String get affixBuilderSubtitle =>
      'รวมคำนำหน้า/คำต่อท้ายเพื่อสร้างคำศัพท์เป้าหมาย';

  @override
  String get decipherCrypticCluesTitle => 'ถอดรหัสลับ';

  @override
  String get decipherCrypticCluesSubtitle =>
      'แก้ปริศนาการเล่นคำศัพท์และถอดรหัสปริศนาการสะกดคำ';

  @override
  String get boggleWordSearchTitle => 'สับสนการเชื่อมต่อ';

  @override
  String get boggleWordSearchSubtitle =>
      'ติดตามเส้นทางที่เชื่อมต่อที่อยู่ติดกันเพื่อค้นหาคำที่ซ่อนอยู่';

  @override
  String get idiomUnscrambleTitle => 'สำนวนถอดรหัส';

  @override
  String get idiomUnscrambleSubtitle =>
      'จัดเรียงอาร์เรย์คำที่มีสัญญาณรบกวนเพื่อให้ตรงกับความหมายของสำนวน';

  @override
  String get letterPyramidsTitle => 'ปิรามิดจดหมาย';

  @override
  String get letterPyramidsSubtitle =>
      'สร้างอาคารคำโดยเพิ่มตัวอักษรแอนนาแกรมเดี่ยวต่อชั้น';

  @override
  String get soundAlikeHomophonesTitle => 'การจับคู่คำพ้องเสียง';

  @override
  String get soundAlikeHomophonesSubtitle =>
      'ระบุการสะกดคำพ้องเสียงที่ถูกต้องสำหรับประโยค';

  @override
  String get wordGridSudokuTitle => 'คำว่าซูโดกุ';

  @override
  String get wordGridSudokuSubtitle => 'เรียงตัวอักษรในแถวกริดเพื่อสร้างคำ';

  @override
  String get portmanteauFactoryTitle => 'โรงงานปอร์ตมันโต';

  @override
  String get portmanteauFactorySubtitle =>
      'ผสานองค์ประกอบความหมายเพื่อสร้างคำประสม';

  @override
  String get codedCrosswordsCodeTitle => 'โค้ดเวิร์ด ครอสเวิร์ด';

  @override
  String get codedCrosswordsCodeSubtitle =>
      'แก้ปริศนาอักษรไขว้ตารางที่ตรงกับรหัสตัวเลขต่อตัวอักษร';

  @override
  String get wordSnakeTrailTitle => 'คำว่างู';

  @override
  String get wordSnakeTrailSubtitle =>
      'ติดตามตัวอักษรเหมือนงูสะกดคำเฉพาะเรื่อง';

  @override
  String get typingRhythmSpeedTitle => 'การพิมพ์โฟลว์';

  @override
  String get typingRhythmSpeedSubtitle =>
      'พิมพ์คำศัพท์ที่ตรงกับจังหวะจังหวะเครื่องเมตรอนอม';

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
