// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Puzzle Hub';

  @override
  String get home => 'Главная';

  @override
  String get settings => 'Настройки';

  @override
  String get playAgain => 'Играть снова';

  @override
  String get playNext => 'Играть дальше';

  @override
  String get seeCompleted => 'Просмотр пазла';

  @override
  String get finish => 'Завершить';

  @override
  String get congrats => 'Поздравляем';

  @override
  String get perfectGradient => 'Идеальный градиент!';

  @override
  String get wellDone => 'Отлично!';

  @override
  String get timeUp => 'Время вышло!';

  @override
  String get completed => 'Завершено!';

  @override
  String get score => 'Счет';

  @override
  String get timeLeft => 'Время';

  @override
  String get trials => 'Попытки';

  @override
  String get numberRule => 'Числовое правило';

  @override
  String get colorRule => 'Цветовое правило';

  @override
  String get valid => 'Верно';

  @override
  String get invalid => 'Неверно';

  @override
  String get even => 'Четное';

  @override
  String get odd => 'Нечетное';

  @override
  String get red => 'Красный';

  @override
  String get green => 'Зеленый';

  @override
  String get blue => 'Синий';

  @override
  String get yes => 'Да';

  @override
  String get no => 'Нет';

  @override
  String get trueLabel => 'Истина';

  @override
  String get falseLabel => 'Ложь';

  @override
  String get clear => 'Очистить';

  @override
  String get north => 'Север';

  @override
  String get south => 'Юг';

  @override
  String get east => 'Восток';

  @override
  String get west => 'Запад';

  @override
  String get target => 'Цель';

  @override
  String get moves => 'Ходы';

  @override
  String get trialMode => 'Режим испытаний';

  @override
  String get trialModeDescription => 'Решите 20 задач вместо таймера на 60 сек';

  @override
  String get appearance => 'Внешний вид';

  @override
  String get language => 'Язык';

  @override
  String get gameplay => 'Геймплей';

  @override
  String get supportUs => 'Поддержать нас';

  @override
  String get systemLegal => 'Система и право';

  @override
  String get games => 'Игры';

  @override
  String get solvedToday => 'Решено сегодня';

  @override
  String get searchGames => 'Поиск игр...';

  @override
  String get readyToStart => 'ГОТОВЫ К ТРЕНИРОВКЕ МОЗГА?';

  @override
  String get greatStart => 'ОТЛИЧНОЕ НАЧАЛО! ТАК ДЕРЖАТЬ.';

  @override
  String get onFire => 'В УДАРЕ! ВАШ МОЗГ В ВОСТОРГЕ.';

  @override
  String get incredible => 'НЕВЕРОЯТНО! ВЫ МАСТЕР ПАЗЛОВ.';

  @override
  String get noGamesMatch => 'ИГРЫ НЕ НАЙДЕНЫ';

  @override
  String get categoryAll => 'ВСЕ';

  @override
  String get categoryAttention => 'ВНИМАНИЕ';

  @override
  String get categoryLogic => 'ЛОГИКА';

  @override
  String get categoryMath => 'МАТЕМАТИКА';

  @override
  String get categoryWord => 'СЛОВА';

  @override
  String get categoryMemory => 'ПАМЯТЬ';

  @override
  String get categorySpatial => 'ПРОСТРАНСТВО';

  @override
  String get themeLight => 'СВЕТЛАЯ';

  @override
  String get themeDark => 'ТЕМНАЯ';

  @override
  String get themeSystem => 'СИСТЕМНАЯ';

  @override
  String get starOnGithub => 'Звезда на GitHub';

  @override
  String get sponsorOnGithub => 'Спонсировать на GitHub';

  @override
  String get privacyPolicy => 'Политика конфиденциальности';

  @override
  String get termsOfService => 'Условия использования';

  @override
  String get licenses => 'Лицензии';

  @override
  String findWordSubtitle(int maxTries, int wordLength) {
    return 'У вас есть $maxTries попыток, чтобы найти слово из $wordLength букв.';
  }

  @override
  String wordFoundMessage(String word) {
    return 'Слово найдено: $word';
  }

  @override
  String gameOverMessage(String word) {
    return 'Загаданное слово: $word';
  }

  @override
  String get gameOver => 'Игра окончена';

  @override
  String get crosswordTitle => 'Кроссворд';

  @override
  String get crosswordSubtitle =>
      'Заполните сетку словами, основываясь на подсказках.';

  @override
  String get wordSearchTitle => 'Поиск слов';

  @override
  String get radicalRootsTitle => 'Радикальные корни';

  @override
  String get radicalRootsSubtitle =>
      'Найдите квадратный или кубический корень из заданного числа. При необходимости округлите до ближайшего целого числа.';

  @override
  String get radicalRootsGoalReached => 'Цель достигнута!';

  @override
  String get radicalRootsTimeUp => 'Время вышло!';

  @override
  String radicalRootsScoreMessage(int score) {
    return 'Вы правильно вычислили $score корней!';
  }

  @override
  String radicalRootsTryAgainMessage(int score) {
    return 'Продолжайте практиковаться! Вы вычислили $score корней.';
  }

  @override
  String get radicalRootsStart => 'Начать вычисления';

  @override
  String get radicalRootsDescription =>
      'У вас есть 60 секунд, чтобы решить как можно больше задач.';

  @override
  String get radicalRootsBest => 'Рекорд';

  @override
  String get radicalRootsSeconds => '60 СЕКУНД';

  @override
  String get romanArithmeticTitle => 'Римская арифметика';

  @override
  String get romanArithmeticSubtitle =>
      'Решайте задачи на сложение и вычитание, используя римские цифры.';

  @override
  String get romanArithmeticGoalReached => 'Уровень Центуриона!';

  @override
  String get romanArithmeticTimeUp => 'Время вышло!';

  @override
  String romanArithmeticScoreMessage(int score) {
    return 'Вы решили $score римских задач!';
  }

  @override
  String romanArithmeticTryAgainMessage(int score) {
    return 'Veni, Vidi, Vici! Вы решили $score задач.';
  }

  @override
  String get romanArithmeticStart => 'Начать квест';

  @override
  String get romanArithmeticDescription =>
      'Конвертируйте и решайте. У вас есть 60 секунд.';

  @override
  String get romanArithmeticBest => 'Рекорд';

  @override
  String get romanArithmeticSeconds => '60 СЕКУНД';

  @override
  String get wordSearchSubtitle =>
      'Найдите все скрытые слова в сетке. Выделяйте их перетаскиванием.';

  @override
  String get missingVowelsTitle => 'Пропущенные гласные';

  @override
  String get missingVowelsSubtitle =>
      'Угадайте слово, в котором скрыты все гласные.';

  @override
  String get missingVowelsWin => 'Гласные восстановлены!';

  @override
  String get missingVowelsHowToPlay =>
      'Слово отображается без гласных (A, E, I, O, U). Угадайте полное слово!';

  @override
  String get wordScrambleTitle => 'Перемешанные буквы';

  @override
  String get wordScrambleSubtitle =>
      'Нажимайте на буквы, чтобы составить слово!';

  @override
  String get wordScrambleWin => 'Слово разгадано!';

  @override
  String get sudokuTitle => 'Судоку';

  @override
  String get sudokuSubtitle =>
      'Заполните сетку так, чтобы в каждой строке, столбце и блоке 3x3 были цифры от 1 до 9.';

  @override
  String get minesweeperTitle => 'Сапер';

  @override
  String get minesweeperSubtitle => 'Найдите все мины, не взорвавшись на них.';

  @override
  String get minesweeperWin => 'Победа!';

  @override
  String get minesweeperMines => 'МИНЫ';

  @override
  String get minesweeperStatus => 'СТАТУС';

  @override
  String get minesweeperWon => 'ПОБЕДА';

  @override
  String get minesweeperBoom => 'БУМ';

  @override
  String get minesweeperPlaying => 'ИГРА';

  @override
  String get minesweeperReveal => 'ОТКРЫТЬ';

  @override
  String get minesweeperFlag => 'ФЛАГ';

  @override
  String get game2048Title => '2048';

  @override
  String get game2048Subtitle =>
      'Сдвигайте плитки, чтобы объединить их и получить 2048!';

  @override
  String get nonogramTitle => 'Нонограмма';

  @override
  String get nonogramSubtitle =>
      'Раскройте скрытое изображение, используя логику.';

  @override
  String get nonogramWin => 'Картинка открыта!';

  @override
  String get magnetsTitle => 'МАГНИТЫ';

  @override
  String get magnetsSubtitle =>
      'Разместите магниты в сетке в соответствии с количеством полюсов.';

  @override
  String get magnetsHowToPlay =>
      'Заполните контейнеры размером с домино магнитами «+» и «-» или оставьте их пустыми. Подсказки в строках и столбцах указывают общее количество каждого полюса в этой линии. Одинаковые полюса не могут быть соседними по горизонтали или вертикали.';

  @override
  String get magnetsWinTitle => 'ПОЛЯРНОСТЬ СБАЛАНСИРОВАНА!';

  @override
  String get magnetsWinMessage => 'Все магниты идеально расположены!';

  @override
  String get lighthousesTitle => 'МАЯКИ';

  @override
  String get lighthousesSubtitle =>
      'Разместите корабли на основе подсказок маяков.';

  @override
  String get lighthousesHowToPlay =>
      'Разместите корабли размером 1x1 в сетке. Маяки показывают общее количество кораблей, видимых по горизонтали и вертикали. Корабли не могут касаться маяков или друг друга, даже по диагонали.';

  @override
  String get lighthousesWinTitle => 'МОРЕ В БЕЗОПАСНОСТИ!';

  @override
  String get lighthousesWinMessage => 'Все маяки идеально направляют корабли!';

  @override
  String get dominosaTitle => 'ДОМИНОЗА';

  @override
  String get dominosaSubtitle => 'Найдите все скрытые костяшки домино в сетке.';

  @override
  String get dominosaHowToPlay =>
      'Расположите полный набор костяшек домино на сетке с числами так, чтобы каждая пара соседних чисел была закрыта ровно одной костяшкой. Каждая пара чисел встречается в наборе только один раз.';

  @override
  String get dominosaWinTitle => 'МАСТЕР ДОМИНО!';

  @override
  String get dominosaWinMessage => 'Все костяшки домино найдены и размещены!';

  @override
  String get skyscrapersTitle => 'НЕБОСКРЕБЫ';

  @override
  String get skyscrapersSubtitle => 'Заполните сетку высотами зданий.';

  @override
  String get skyscrapersHowToPlay =>
      'Заполните сетку высотами (1-N) так, чтобы в каждой строке и каждом столбце каждая высота встречалась ровно один раз. Подсказки по краям показывают, сколько зданий видно с этого направления, при этом более высокие здания закрывают более низкие.';

  @override
  String get skyscrapersWinTitle => 'СКАЙЛАЙН ВОССТАНОВЛЕН!';

  @override
  String get skyscrapersWinMessage => 'Все здания идеально расположены!';

  @override
  String get nurikabeTitle => 'НУРИКАБЕ';

  @override
  String get nurikabeSubtitle =>
      'Сформируйте связанное море и разделите острова.';

  @override
  String get nurikabeHowToPlay =>
      'Закрасьте клетки, чтобы сформировать единое связанное «море» (без блоков 2x2). Незакрашенные клетки образуют «острова», каждый из которых содержит ровно одно число, представляющее его общую площадь.';

  @override
  String get nurikabeWinTitle => 'МОРЕ ТЕЧЕТ!';

  @override
  String get nurikabeWinMessage => 'Острова разделены, море соединено!';

  @override
  String get fillominoTitle => 'ФИЛЛОМИНО';

  @override
  String get fillominoSubtitle =>
      'Разделите сетку на полимино заданных размеров.';

  @override
  String get fillominoHowToPlay =>
      'Разделите сетку на полимино так, чтобы каждое полимино размера N содержало число N во всех своих клетках. Полимино одного размера не могут примыкать друг к другу по горизонтали или вертикали.';

  @override
  String get fillominoWinTitle => 'СЕТКА РАЗДЕЛЕНА!';

  @override
  String get fillominoWinMessage =>
      'Идеально выложено плиткой с помощью логики!';

  @override
  String get hitoriTitle => 'ХИТОРИ';

  @override
  String get hitoriSubtitle =>
      'Закрасьте повторяющиеся числа в каждой строке и столбце.';

  @override
  String get hitoriHowToPlay =>
      'Закрасьте клетки так, чтобы ни одно число не появлялось более одного раза в любой строке или столбце. Закрашенные клетки не могут быть соседними (по горизонтали или вертикали), а все незакрашенные клетки должны образовывать единую связанную группу.';

  @override
  String get hitoriWinTitle => 'МАСТЕР ХИТОРИ!';

  @override
  String get hitoriWinMessage => 'Вы успешно устранили все дубликаты!';

  @override
  String get pathFinderTitle => 'Поиск пути';

  @override
  String get pathFinderSubtitle => 'Найдите скрытый путь от S до E.';

  @override
  String get pathFinderWin => 'Путь найден!';

  @override
  String get howToPlay => 'Как играть';

  @override
  String get gotIt => 'Понятно';

  @override
  String get akariTitle => 'Акари';

  @override
  String get akariSubtitle => 'Осветите все белые ячейки';

  @override
  String get akariHowToPlay =>
      'Размещайте лампочки в белых ячейках, чтобы осветить всю сетку. Лампочки освещают свой ряд и столбец до стены. Лампочки не должны светить друг на друга. Числа на стенах показывают, сколько лампочек должно быть рядом.';

  @override
  String get akariWinTitle => 'ДА БУДЕТ СВЕТ!';

  @override
  String get akariWinMessage => 'Все идеально освещено.';

  @override
  String get arithmeticChainTitle => 'Цепочка вычислений';

  @override
  String get arithmeticChainSubtitle => 'Считайте сумму в уме';

  @override
  String get arithmeticChainWinTitle => 'НОВЫЙ УРОВЕНЬ!';

  @override
  String get arithmeticChainWinMessage => 'Ваш устный счет впечатляет!';

  @override
  String get arithmeticChainLoseTitle => 'ПОПРОБУЙТЕ СНОВА';

  @override
  String arithmeticChainLoseMessage(String answer) {
    return 'Правильный ответ был $answer.';
  }

  @override
  String get arithmeticChainStart => 'СТАРТ';

  @override
  String get arithmeticChainNext => 'ДАЛЕЕ';

  @override
  String get attentionalBlinkTitle => 'Пропуск внимания';

  @override
  String get attentionalBlinkSubtitleWatch => 'СЛЕДИТЕ ЗА ЧИСЛАМИ';

  @override
  String get attentionalBlinkSubtitleInput =>
      'ВВЕДИТЕ ДВА ЧИСЛА, КОТОРЫЕ ВЫ ВИДЕЛИ';

  @override
  String attentionalBlinkScoreMessage(int score) {
    return 'Вы нашли $score целей!';
  }

  @override
  String get balanceScaleTitle => 'ВЕСЫ';

  @override
  String get balanceScaleSubtitle =>
      'Вычислите вес последнего предмета на основе чаш весов.';

  @override
  String get balanceScaleWinTitle => 'РАВНОВЕСИЕ!';

  @override
  String get balanceScaleWinMessage => 'Вы правильно определили вес!';

  @override
  String get balanceScaleLoseTitle => 'ДИСБАЛАНС';

  @override
  String get balanceScaleLoseMessage =>
      'Попробуйте снова найти правильный баланс.';

  @override
  String get balanceScaleBack => 'НАЗАД';

  @override
  String get balanceScaleSubmit => 'ОТПРАВИТЬ';

  @override
  String get binaryPuzzleTitle => 'БИНАРНЫЙ ПАЗЛ';

  @override
  String get binaryPuzzleSubtitle =>
      'Заполните 0 и 1. Не более двух одинаковых цифр подряд. Равное количество 0 и 1 в рядах и столбцах.';

  @override
  String get binaryPuzzleWinTitle => 'ОТЛИЧНО';

  @override
  String get binaryPuzzleWinMessage =>
      'Вы решили бинарный пазл, используя логику!';

  @override
  String get blockEscapeTitle => 'ПОБЕГ БЛОКА';

  @override
  String get blockEscapeSubtitle =>
      'Сдвигайте блоки, чтобы освободить путь главному блоку к выходу.';

  @override
  String get blockEscapeWinTitle => 'СВОБОДА!';

  @override
  String get blockEscapeWinMessage =>
      'Вы успешно расчистили путь для главного блока!';

  @override
  String get boxCompletionTitle => 'Сборка куба';

  @override
  String get boxCompletionSubtitle => 'Какой куб получится из развертки?';

  @override
  String boxCompletionScoreMessage(int score, int totalTrials) {
    return 'Правильно: $score из $totalTrials!';
  }

  @override
  String get boxCompletionOptions => 'ВАРИАНТЫ';

  @override
  String get bridgesTitle => 'МОСТЫ';

  @override
  String get bridgesSubtitle =>
      'Соедините острова мостами. Каждому острову нужно определенное количество мостов. Мосты не могут пересекаться.';

  @override
  String get bridgesWinTitle => 'СОЕДИНЕНО!';

  @override
  String get bridgesWinMessage => 'Вы успешно соединили все острова!';

  @override
  String get calculationSprintTitle => 'МАТЕМАТИЧЕСКИЙ СПРИНТ';

  @override
  String get calculationSprintSubtitle =>
      'Решите как можно больше примеров за 60 секунд.';

  @override
  String get calculationSprintGoalReached => 'ЦЕЛЬ ДОСТИГНУТА!';

  @override
  String get calculationSprintTimeUp => 'ВРЕМЯ ВЫШЛО';

  @override
  String calculationSprintScoreMessage(int score) {
    return 'Отличная скорость! Вы набрали $score очков.';
  }

  @override
  String calculationSprintTryAgainMessage(int score) {
    return 'Вы набрали $score очков. Попробуйте побить свой рекорд!';
  }

  @override
  String get calculationSprintBest => 'РЕКОРД';

  @override
  String get calculationSprintSeconds => '60 СЕКУНД';

  @override
  String get calculationSprintDescription =>
      'Решайте примеры быстро.\nОшибка отнимает 3 секунды!';

  @override
  String get calculationSprintStart => 'НАЧАТЬ СПРИНТ';

  @override
  String get categoryFluencyTitle => 'Беглость категорий';

  @override
  String get categoryFluencySubtitle =>
      'Вводите предметы, относящиеся к категории';

  @override
  String get categoryFluencyExpert => 'ЭКСПЕРТ!';

  @override
  String get categoryFluencyTimeUp => 'ВРЕМЯ ВЫШЛО!';

  @override
  String get categoryFluencyWinMessage => 'У вас богатый словарный запас!';

  @override
  String categoryFluencyFoundMessage(int count) {
    return 'Вы нашли $count слов.';
  }

  @override
  String get categoryFluencyCategoryLabel => 'Категория:';

  @override
  String get categoryFluencyEnterItem => 'Введите предмет...';

  @override
  String categoryFluencyWordCount(int entered, int target) {
    return '$entered / $target слов';
  }

  @override
  String get changeBlindnessTitle => 'Слепота к изменениям';

  @override
  String get changeBlindnessSubtitle => 'НАЙДИТЕ ИЗМЕНЯЮЩИЙСЯ ПРЕДМЕТ';

  @override
  String changeBlindnessScore(int score) {
    return 'СЧЕТ: $score';
  }

  @override
  String changeBlindnessFoundMessage(int score) {
    return 'Вы нашли $score изменений!';
  }

  @override
  String get choiceRtTitle => 'Время реакции';

  @override
  String get choiceRtSubtitle =>
      'Нажимайте на активный квадрат как можно быстрее';

  @override
  String choiceRtAvgMessage(String avg) {
    return 'Среднее время реакции: $avg мс';
  }

  @override
  String choiceRtTimeRemaining(int time) {
    return 'Осталось времени: $time с';
  }

  @override
  String choiceRtTaps(int count) {
    return 'Нажатий: $count';
  }

  @override
  String get colorFloodTitle => 'Цветовой поток';

  @override
  String colorFloodSubtitle(int moves, int maxMoves) {
    return 'Ходы: $moves / $maxMoves';
  }

  @override
  String get colorFloodSuccess => 'УСПЕХ!';

  @override
  String get colorFloodDryLand => 'ПОПРОБУЙТЕ СНОВА...';

  @override
  String get colorFloodWinMessage => 'Вы заполнили всю сетку цветом!';

  @override
  String get colorFloodLoseMessage =>
      'У вас закончились ходы. Попробуйте еще раз!';

  @override
  String get colorMatchTitle => 'ПОДБОР ЦВЕТА';

  @override
  String get colorMatchSubtitle =>
      'Настройте слайдеры так, чтобы максимально точно подобрать целевой цвет.';

  @override
  String get colorMatchTarget => 'ЦЕЛЬ';

  @override
  String get colorMatchYours => 'ВАШ';

  @override
  String get colorMatchCheck => 'ПРОВЕРИТЬ';

  @override
  String get colorMatchResult => 'РЕЗУЛЬТАТ';

  @override
  String colorMatchAccuracy(String accuracy) {
    return 'Точность: $accuracy%';
  }

  @override
  String get corsiBlocksTitle => 'БЛОКИ КОРСИ';

  @override
  String get corsiBlocksSubtitle =>
      'Следите за блоками и нажимайте на них в том же порядке.';

  @override
  String get corsiBlocksWinTitle => 'МАСТЕР ПАМЯТИ!';

  @override
  String get corsiBlocksLoseTitle => 'ОШИБКА';

  @override
  String corsiBlocksMessage(int score, int span) {
    return 'Вы запомнили $score последовательностей! Объем вашей памяти составил $span.';
  }

  @override
  String get corsiBlocksWatch => 'ЗАПОМНИТЕ УЗОР';

  @override
  String get corsiBlocksRepeat => 'ПОВТОРИТЕ УЗОР';

  @override
  String get corsiBlocksExcellent => 'ОТЛИЧНО!';

  @override
  String get corsiBlocksSpan => 'ОБЪЕМ';

  @override
  String get crownTitle => 'КОРОНА';

  @override
  String get crownSubtitle =>
      'Разместите по одной короне в каждой строке, столбце и цветной области. Короны не могут касаться друг друга, даже по диагонали.';

  @override
  String get crownCrowned => 'КОРОНОВАН!';

  @override
  String get crownSuccess => 'Все короны размещены верно.';

  @override
  String get cryptogramTitle => 'КРИПТОГРАММА';

  @override
  String get cryptogramSubtitle =>
      'Разгадайте зашифрованное сообщение! Каждая буква кода соответствует реальной букве.';

  @override
  String get cryptogramBroken => 'КОД ВЗЛОМАН!';

  @override
  String get cryptogramEncrypted => 'ЗАШИФРОВАНО';

  @override
  String get cryptogramSuccess => 'Вы расшифровали сообщение.';

  @override
  String get cryptogramTryAgain => 'Попробуйте снова взломать шифр.';

  @override
  String get digitSpanReverseTitle => 'Обратная память';

  @override
  String get digitSpanReverseSubtitleMemorize => 'Запомните цифры';

  @override
  String get digitSpanReverseSubtitleEnter =>
      'Введите цифры в ОБРАТНОМ порядке';

  @override
  String get digitSpanReverseWinTitle => 'НОВЫЙ УРОВЕНЬ!';

  @override
  String get digitSpanReverseWinMessage => 'Ваша рабочая память впечатляет!';

  @override
  String get digitSpanReverseLoseTitle => 'ПОПРОБУЙТЕ СНОВА';

  @override
  String digitSpanReverseLoseMessage(String sequence) {
    return 'Правильная обратная последовательность была $sequence.';
  }

  @override
  String get dividedAttentionTitle => 'Разделение внимания';

  @override
  String get dividedAttentionSubtitle =>
      'Налево для ЗВЕЗДЫ ⭐ | Направо для КРАСНОГО 🔴';

  @override
  String get dividedAttentionGameOverTitle => 'ФОКУС ПОТЕРЯН';

  @override
  String dividedAttentionGameOverMessage(int score) {
    return 'Многозадачность — это сложно! Ваш счет $score.';
  }

  @override
  String dividedAttentionScore(int score) {
    return 'СЧЕТ: $score';
  }

  @override
  String get doubleNBackTitle => 'Двойной N-назад';

  @override
  String doubleNBackSubtitle(int n) {
    return 'Сопоставьте стимулы на $n шага назад';
  }

  @override
  String get doubleNBackGameOverTitle => 'ИГРА ОКОНЧЕНА';

  @override
  String doubleNBackGameOverMessage(int score) {
    return 'Вы набрали $score очков в Двойном N-назад!';
  }

  @override
  String doubleNBackScore(int score) {
    return 'Счет: $score';
  }

  @override
  String get doubleNBackPositionMatch => 'СОВПАДЕНИЕ ПОЗИЦИИ';

  @override
  String get doubleNBackLetterMatch => 'СОВПАДЕНИЕ БУКВЫ';

  @override
  String get faceNameAssociationTitle => 'Лицо-Имя';

  @override
  String get faceNameAssociationSubtitleStudy =>
      'Запомните имена для каждого лица';

  @override
  String get faceNameAssociationSubtitleTest => 'Кто это?';

  @override
  String get faceNameAssociationPerfect => 'ИДЕАЛЬНО!';

  @override
  String get faceNameAssociationGameOver => 'ИГРА ОКОНЧЕНА';

  @override
  String get faceNameAssociationWinMessage =>
      'У вас отличная память на лица и имена!';

  @override
  String faceNameAssociationLoseMessage(int correct, int total) {
    return 'Правильно $correct из $total.';
  }

  @override
  String get faceNameAssociationStartTest => 'НАЧАТЬ ТЕСТ';

  @override
  String get flankerTestWinTitle => 'ЛАЗЕРНЫЙ ФОКУС!';

  @override
  String get flankerTestLoseTitle => 'ОТВЛЕЧЕН';

  @override
  String flankerTestScoreMessage(int score) {
    return 'Вы правильно ответили $score раз!';
  }

  @override
  String get flankerTestTitle => 'ТЕСТ ФЛАНКЕРА';

  @override
  String get flankerTestSubtitle =>
      'Укажите направление центральной стрелки, игнорируя боковые стрелки.';

  @override
  String get flankerTestLeft => 'ЛЕВО';

  @override
  String get flankerTestRight => 'ПРАВО';

  @override
  String get fractionMatchTitle => 'Дроби';

  @override
  String get fractionMatchSubtitle => 'Сопоставьте картинку с дробью';

  @override
  String get fractionMatchLoseTitle => 'НЕВЕРНО';

  @override
  String fractionMatchLoseMessage(String correctAnswer) {
    return 'Правильный ответ был $correctAnswer.';
  }

  @override
  String get goNoGoTitle => 'Да / Нет';

  @override
  String get goNoGoSubtitle => 'Нажимай на зеленый, ИГНОРИРУЙ красный!';

  @override
  String get goNoGoLoseTitle => 'ОСТАНОВКА';

  @override
  String get goNoGoLoseMessage => 'Ваш самоконтроль подвергается испытанию!';

  @override
  String get goNoGoTapAnywhere => 'НАЖМИТЕ В ЛЮБОМ МЕСТЕ, ЧТОБЫ НАЧАТЬ';

  @override
  String get groceryListTitle => 'Список покупок';

  @override
  String get groceryListSubtitleMemorize => 'Запомните продукты и их категории';

  @override
  String get groceryListSubtitleTest =>
      'К какой категории относился этот продукт?';

  @override
  String get groceryListWinTitle => 'ГУРУ ПОКУПОК!';

  @override
  String get groceryListLoseTitle => 'ЧТО-ТО ЗАБЫЛИ?';

  @override
  String groceryListScoreMessage(int score) {
    return 'Вы набрали $score очков в Списке покупок!';
  }

  @override
  String get groceryListReady => 'Я ГОТОВ';

  @override
  String get groceryListWhereBelong => 'КУДА ЭТО ОТНОСИТСЯ?';

  @override
  String get hueSortTitle => 'ОТТЕНКИ';

  @override
  String get hueSortSubtitle =>
      'Меняйте плитки, чтобы создать плавный переход цветов. Точки обозначают неподвижные плитки.';

  @override
  String get hueSortWinTitle => 'ИДЕАЛЬНЫЙ ГРАДИЕНТ!';

  @override
  String get hueSortWinMessage => 'Вы идеально отсортировали цветовой спектр!';

  @override
  String hueSortWrongTiles(int count) {
    return 'Плитки в неправильном положении: $count';
  }

  @override
  String get kenkenTitle => 'Кен-Кен';

  @override
  String get kenkenWinTitle => 'ГЕНИЙ!';

  @override
  String get kenkenLoseTitle => 'ИГРА ОКОНЧЕНА';

  @override
  String get kenkenWinMessage => 'Вы решили Кен-Кен!';

  @override
  String get kenkenLoseMessage => 'Проверьте правила строк/столбцов и блоков.';

  @override
  String kenkenSubtitle(int size) {
    return 'Заполните 1-$size без повторов в рядах/колонках';
  }

  @override
  String get letterCancellationTitle => 'Вычеркивание букв';

  @override
  String get letterCancellationTitleFull => 'Тест на вычеркивание букв';

  @override
  String letterCancellationScoreMessage(int score) {
    return 'Вы нашли $score букв!';
  }

  @override
  String letterCancellationSubtitle(String target) {
    return 'Найдите все буквы \"$target\"';
  }

  @override
  String get letterCancellationFound => 'НАЙДЕНО';

  @override
  String get letterCancellationTime => 'ВРЕМЯ';

  @override
  String get lightsOutTitle => 'ВЫКЛЮЧИ СВЕТ';

  @override
  String get lightsOutSubtitle =>
      'Нажатие на плитку переключает её и соседей. Выключите весь свет.';

  @override
  String get lightsOutWinTitle => 'РЕШЕНО!';

  @override
  String get lightsOutWinMessage => 'Вы успешно выключили весь свет!';

  @override
  String get symmetryTitle => 'Симметрия';

  @override
  String get symmetrySubtitle =>
      'Зеркально отразите узор слева на правую сетку.';

  @override
  String get semanticLinkTitle => 'Смысловая связь';

  @override
  String get semanticLinkSubtitle => 'Найдите слово, объединяющее все три';

  @override
  String get reflexTapTitle => 'Рефлекс';

  @override
  String get visualStatisticalLearningTitle => 'Визуальное обучение';

  @override
  String get orbitTapTitle => 'Орбита';

  @override
  String get orbitTapSubtitle => 'Нажимайте, когда шары совпадают с воротами';

  @override
  String get schulteTableTitle => 'Таблица Шульте';

  @override
  String get multipleObjectTrackingTitle => 'Слежение за объектами';

  @override
  String get multipleObjectTrackingSubtitle =>
      'Следите за выделенными объектами во время их движения, затем выберите их.';

  @override
  String get sdmtTitle => 'Тест SDMT';

  @override
  String get sdmtSubtitle => 'Используйте ключ, чтобы найти цифру для символа.';

  @override
  String get memoryMatrixTitle => 'Матрица памяти';

  @override
  String get memoryMatrixSubtitle => 'Запомните узор и нажмите на плитки.';

  @override
  String get mentalAbacusTitle => 'Ментальный абак';

  @override
  String get mentalAbacusSubtitle => 'Решите, используя соробан';

  @override
  String get spellingSprintTitle => 'Спринт правописания';

  @override
  String get spellingSprintSubtitle =>
      'Напишите как можно больше слов правильно за время.';

  @override
  String get stopSignalTitle => 'Стоп-сигнал';

  @override
  String get stopSignalSubtitle =>
      'Нажимайте на стрелку, но СТОП, если она станет КРАСНОЙ.';

  @override
  String get staircaseMemoryTitle => 'Лестница памяти';

  @override
  String get vigilanceTaskTitle => 'Бдительность';

  @override
  String get vigilanceTaskSubtitle =>
      'Нажмите кнопку, когда стрелка пропустит позицию';

  @override
  String get logicalSyllogismsTitle => 'Логические силлогизмы';

  @override
  String get logicalSyllogismsSubtitle => 'Является ли вывод логически верным?';

  @override
  String get mathPathTitle => 'Математический путь';

  @override
  String get mathPathSubtitle => 'Найдите путь, сумма которого равна цели.';

  @override
  String get sternbergTaskTitle => 'Тест Стернберга';

  @override
  String get sternbergTaskMemorize => 'Запомните буквы';

  @override
  String get sternbergTaskWasLetterSet => 'Была ли эта буква в списке?';

  @override
  String sternbergTaskScore(int score) {
    return 'Ваш счет: $score';
  }

  @override
  String get verbalAnalogiesTitle => 'Словесные аналогии';

  @override
  String get verbalAnalogiesSubtitle => 'Завершите аналогию';

  @override
  String get typingSpeedTitle => 'Скорость печати';

  @override
  String get typingSpeedSubtitle => 'Напечатайте фразу максимально быстро!';

  @override
  String get wordLadderTitle => 'Словесная лестница';

  @override
  String get wordLadderSubtitle => 'Соедините слова, меняя по одной букве.';

  @override
  String get tangleFixTitle => 'Распутывание';

  @override
  String get tangleFixSubtitle => 'Распутай линии, чтобы они не пересекались';

  @override
  String get oddRotationTitle => 'Странное вращение';

  @override
  String get oddRotationSubtitle => 'Одна из фигур отражена. Найдите её.';

  @override
  String get towerOfLondonTitle => 'Лондонская башня';

  @override
  String get towerOfLondonSubtitle => 'Повторите целевую конфигурацию';

  @override
  String get symbolicFlankerTitle => 'Символьный фланкер';

  @override
  String get symbolicFlankerSubtitle => 'Фокус на центральном символе';

  @override
  String get stroopTestTitle => 'Тест Струпа';

  @override
  String get stroopTestSubtitle =>
      'Назовите цвет шрифта слова. Игнорируйте значение слова!';

  @override
  String get wisconsinCardSortingTitle => 'Тест Висконсина';

  @override
  String get wisconsinCardSortingSubtitle =>
      'СОПОСТАВЬТЕ КАРТУ С ОДНОЙ ИЗ ЧЕТЫРЕХ';

  @override
  String get nBackTitle => 'Тест N-назад';

  @override
  String get nBackSubtitle =>
      'Нажмите СОВПАДЕНИЕ, если буква была 2 шага назад.';

  @override
  String get rhythmMasterTitle => 'Мастер ритма';

  @override
  String get rhythmMasterSubtitle => 'Нажимайте в такт пульсу';

  @override
  String get pixelMimicTitle => 'Пиксельная мимика';

  @override
  String get targetNumberTitle => 'Цель 24';

  @override
  String targetNumberSubtitle(int target) {
    return 'Используйте все 4 числа, чтобы получить $target';
  }

  @override
  String get mirrorTracingTitle => 'Зеркальное рисование';

  @override
  String get mirrorTracingSubtitle => 'Обведите звезду! Управление ЗЕРКАЛЬНОЕ.';

  @override
  String get wordSurgeTitle => 'Всплеск слов';

  @override
  String get wordSurgeSubtitle => 'Синонимы и антонимы';

  @override
  String get perspectiveTakingTitle => 'Смена перспективы';

  @override
  String get perspectiveTakingTopDownView => 'ВИД СВЕРХУ';

  @override
  String get perspectiveTakingChoosePerspective => 'ВЫБЕРИТЕ ПЕРСПЕКТИВУ';

  @override
  String get perspectiveTakingCongrats => 'У вас отличный глазомер.';

  @override
  String perspectiveTakingSubtitle(String targetDirName) {
    return 'Какой вид соответствует направлению $targetDirName?';
  }

  @override
  String get paperFoldingTitle => 'Складывание бумаги';

  @override
  String get paperFoldingSubtitle =>
      'Как это будет выглядеть в развернутом виде?';

  @override
  String get waterSortTitle => 'Сортировка воды';

  @override
  String get waterSortSubtitle => 'Разделите цвета по пробиркам.';

  @override
  String get numericalEstimationTitle => 'Оценка чисел';

  @override
  String get numericalEstimationSubtitle => 'Выбери ближайший ответ быстро!';

  @override
  String get lockPatternTitle => 'Графический ключ';

  @override
  String get lockPatternSubtitle => 'Найдите секретный узор.';

  @override
  String get primeHunterTitle => 'Охотник за простыми числами';

  @override
  String get primeHunterSubtitle => 'Влево — ПРОСТОЕ | Вправо — СОСТАВНОЕ';

  @override
  String get tracePathTitle => 'След пути';

  @override
  String get tracePathSubtitle => 'Следуйте по пути максимально точно';

  @override
  String get ruleSwitcherTitle => 'Переключатель правил';

  @override
  String get ruleSwitcherSubtitle => 'Примените текущее правило';

  @override
  String get choiceReactionTimeTitle => 'Время выбора';

  @override
  String get pathRecallTitle => 'Память пути';

  @override
  String get switchTaskTitle => 'Переключение задач';

  @override
  String get switchTaskSubtitle =>
      'Следите за правилом! Оно меняется между формой и цветом.';

  @override
  String get mentalRotationTitle => 'Вращение в уме';

  @override
  String get mentalRotationSubtitle =>
      'Эти фигуры одинаковые, просто повернуты?';

  @override
  String get missingOperatorTitle => 'Пропущенный оператор';

  @override
  String get missingOperatorSubtitle => 'Заполните пропуски в уравнении';

  @override
  String get wordMastermindTitle => 'Словесный мастер';

  @override
  String get wordMastermindSubtitle => 'Разгадайте код из 4 букв!';

  @override
  String get simonSequenceTitle => 'Последовательность Саймона';

  @override
  String get symbolLogicTitle => 'Логика символов';

  @override
  String get symbolLogicSubtitle => 'Решите уравнения с символами.';

  @override
  String get silhouetteMatchTitle => 'Силуэт';

  @override
  String get silhouetteMatchSubtitle => 'Какой силуэт подходит объекту?';

  @override
  String get operationSpanTitle => 'Операционная память';

  @override
  String get operationSpanMathPhase => 'Верно ли уравнение?';

  @override
  String get operationSpanLetterPhase => 'Запомните букву';

  @override
  String get operationSpanRecallPhase => 'Вспомните буквы по порядку';

  @override
  String get operationSpanRoundComplete => 'Раунд завершен!';

  @override
  String operationSpanScore(int score) {
    return 'Ваш счет: $score';
  }

  @override
  String get slidePuzzleTitle => 'Пятнашки';

  @override
  String get slidePuzzleNewGame => 'НОВАЯ ИГРА';

  @override
  String get slidePuzzleInstructions => 'Упорядочите плитки, сдвигая их.';

  @override
  String get slidePuzzleTileSlider => 'ПЯТНАШКИ';

  @override
  String get slidePuzzleCongrats => 'Вы успешно собрали пазл.';

  @override
  String get visualSearchTitle => 'Визуальный поиск';

  @override
  String get visualSearchSubtitle => 'Найдите уникальный символ в сетке';

  @override
  String get trailMakingTitle => 'Соединение точек';

  @override
  String get trailMakingSubtitle =>
      'Соедините числа по порядку (1 -> 2 -> 3...).';

  @override
  String get matrixReasoningTitle => 'Матричное мышление';

  @override
  String get matrixReasoningSubtitle => 'Дополните узор в сетке 3x3';

  @override
  String get tentsAndTreesTitle => 'Палатки и деревья';

  @override
  String get tentsAndTreesSubtitle => 'Ставьте палатки рядом с деревьями.';

  @override
  String get quickMathTitle => 'Быстрая математика';

  @override
  String get magicSquaresTitle => 'Магический квадрат';

  @override
  String magicSquaresSubtitle(int targetSum) {
    return 'Сумма в рядах, столбцах и диагоналях должна быть $targetSum';
  }

  @override
  String get objectShuffleTitle => 'Перемешивание объектов';

  @override
  String get pipesTitle => 'Трубы';

  @override
  String get pipesSubtitle => 'Соедините точки одного цвета трубами.';

  @override
  String get oddOneOutTitle => 'Лишний элемент';

  @override
  String get oddOneOutSubtitle => 'Найдите плитку другого цвета.';

  @override
  String get einsteinRiddleTitle => 'ЗАГАДКА ЭЙНШТЕЙНА';

  @override
  String get einsteinRiddleSubtitle =>
      'Используйте подсказки, чтобы узнать атрибуты домов.';

  @override
  String get einsteinRiddleHowToPlay =>
      'У каждого дома свои атрибуты (цвет, жилец и т.д.). Разгадайте их все.';

  @override
  String get einsteinRiddleColor => 'Цвет';

  @override
  String get einsteinRiddleNationality => 'Национальность';

  @override
  String get einsteinRiddleDrink => 'Напиток';

  @override
  String get einsteinRiddlePet => 'Питомец';

  @override
  String get einsteinRiddleSmoke => 'Сигареты';

  @override
  String get einsteinRiddleHouse => 'Дом';

  @override
  String get mirrorImageTitle => 'Зеркало';

  @override
  String get mirrorImageSubtitle => 'Найдите правильное отражение.';

  @override
  String get mirrorImageHowToPlay =>
      'Выберите верное зеркальное отражение фигуры.';

  @override
  String get mentalMappingTitle => 'Карта в уме';

  @override
  String get mentalMappingSubtitle => 'Следуйте указаниям и найдите цель.';

  @override
  String get mentalMappingHowToPlay =>
      'Мысленно следуйте по шагам (Север, Юг, Восток, Запад) из центра.';

  @override
  String get memoryPalaceTitle => 'Чертоги памяти';

  @override
  String get memoryPalaceSubtitle => 'Запомните слова и их расположение.';

  @override
  String get memoryPalaceHowToPlay =>
      'Запомните, где были слова, и верните их на место.';

  @override
  String get countingSheepTitle => 'Счет овец';

  @override
  String get countingSheepSubtitle => 'Сколько овец вы увидели?';

  @override
  String get countingSheepHowToPlay =>
      'Считайте пробегающих овец и введите общее число.';

  @override
  String get faceTraitAssociationTitle => 'Лицо-Черта';

  @override
  String get faceTraitAssociationSubtitle => 'Запомните черты для каждого лица';

  @override
  String get faceTraitAssociationHowToPlay =>
      'Запомните имя, работу и хобби людей по лицам.';

  @override
  String get mentalCalendarTitle => 'Календарь в уме';

  @override
  String get mentalCalendarSubtitle => 'Вычислите день недели';

  @override
  String get mentalCalendarHowToPlay =>
      'Угадайте день недели для случайной даты.';

  @override
  String get vocabularyBuilderTitle => 'Словарный запас';

  @override
  String get vocabularyBuilderSubtitle => 'Синонимы и антонимы на время.';

  @override
  String get vocabularyBuilderHowToPlay =>
      'Выбирайте верные слова согласно заданному отношению.';

  @override
  String get correct => 'ВЕРНО';

  @override
  String get incorrect => 'НЕВЕРНО';

  @override
  String get grammarPoliceTitle => 'Грамотей';

  @override
  String get grammarPoliceSubtitle =>
      'Определите, является ли предложение грамматически правильным или содержит ошибки.';

  @override
  String get grammarPoliceHowToPlay =>
      'В центре экрана появится предложение. Решите, является ли оно грамматически правильным или содержит ошибку. Нажмите «ВЕРНО», если все в порядке, или «НЕВЕРНО», если вы заметили ошибку. Не потеряйте все свои жизни!';

  @override
  String get reverseStroopTitle => 'Обратный Струп';

  @override
  String get reverseStroopSubtitle =>
      'Вариант теста Струпа с переключением фокуса.';

  @override
  String get reverseStroopHowToPlay => 'Следите за правилом: ТЕКСТ или ЦВЕТ.';

  @override
  String get game2048Instruction => 'СМАХНИТЕ ДЛЯ СЛИЯНИЯ';

  @override
  String get fibonacciMergeTitle => 'Слияние Фибоначчи';

  @override
  String get fibonacciMergeSubtitle =>
      'Объединяйте последовательные числа Фибоначчи (1, 1, 2, 3, 5, 8, 13...).';

  @override
  String get sequenceSleuthTitle => 'Детектив последовательностей';

  @override
  String get sequenceSleuthSubtitle =>
      'Найдите недостающее число в математической последовательности.';

  @override
  String get divisibilityDashTitle => 'Рывок делимости';

  @override
  String get divisibilityDashSubtitle =>
      'Нажмите все однозначные делители (2-9) для данного числа.';

  @override
  String get percentagePeakTitle => 'Пик процентов';

  @override
  String get percentagePeakSubtitle =>
      'Быстро решайте вычисления процентов в уме.';

  @override
  String get vennNumbersTitle => 'Числа Венна';

  @override
  String get vennNumbersSubtitle =>
      'Распределите числа по правильным областям диаграммы Венна.';

  @override
  String get commonDenominatorTitle => 'Общий знаменатель';

  @override
  String get commonDenominatorSubtitle =>
      'Найдите наибольший общий делитель или наименьшее общее кратное.';

  @override
  String get angleFinderTitle => 'Поиск углов';

  @override
  String get angleFinderSubtitle =>
      'Вычислите недостающий угол в геометрической задаче.';

  @override
  String get sumSnakeTitle => 'Змейка суммы';

  @override
  String get sumSnakeSubtitle =>
      'Соедините соседние числа, чтобы получить целевую сумму.';

  @override
  String get baseShiftTitle => 'Блиц смены систем счисления';

  @override
  String get baseShiftSubtitle => 'Решите в десятичной системе';

  @override
  String get baseShiftDescription =>
      'Решите уравнение и введите ответ в десятичной системе (основание 10).';

  @override
  String get baseShiftEquation => 'УРАВНЕНИЕ';

  @override
  String get baseShiftHint => 'Введите десятичный результат...';

  @override
  String get baseShiftCorrect => 'Верно!';

  @override
  String get baseShiftIncorrect => 'Неверно!';

  @override
  String get baseShiftSubmit => 'ОТПРАВИТЬ';

  @override
  String get baseShiftQuickGuide => 'Краткое руководство:';

  @override
  String get baseShiftBinary => 'Двоичная (bin): Основание 2 (0, 1)';

  @override
  String get baseShiftHex => 'Шестнадцатеричная (0x): Основание 16 (0-9, A-F)';

  @override
  String get baseShiftDecimal => 'Десятичная (dec): Основание 10 (0-9)';

  @override
  String get baseShiftWinTitle => 'МАСТЕР МАТЕМАТИКИ!';

  @override
  String get baseShiftWinMessage =>
      'Вы правильно решили 5 уравнений со сменой систем счисления!';

  @override
  String get blockCount3DTitle => 'Подсчет блоков 3D';

  @override
  String get blockCount3DSubtitle =>
      'ТЯНИТЕ ДЛЯ ВРАЩЕНИЯ • СЧИТАЙТЕ СКРЫТЫЕ БЛОКИ';

  @override
  String get blockCount3DHowMany => 'СКОЛЬКО БЛОКОВ?';

  @override
  String get blockCount3DSubmitGuess => 'ОТПРАВИТЬ ОТВЕТ';

  @override
  String get blockCount3DNotQuite =>
      'Не совсем так! Попробуйте повращать и посчитать снова.';

  @override
  String get blockCount3DExcellent => 'ОТЛИЧНО';

  @override
  String blockCount3DWinMessage(int count) {
    return 'Вы правильно определили все $count блоков!';
  }

  @override
  String get blockCount3DHowToPlayDescription =>
      '1. Проведите пальцем по 3D-области просмотра, чтобы повернуть стопку блоков.\n\n2. Посчитайте все блоки в стопке.\n\n3. Помните: блок в воздухе должен иметь под собой опорные блоки (скрытые блоки!).\n\n4. Введите свой ответ в поле ввода и нажмите \"ОТПРАВИТЬ ОТВЕТ\", чтобы проверить.';

  @override
  String get alphabetSudokuTitle => 'АЛФАВИТНОЕ СУДОКУ';

  @override
  String get alphabetSudokuSubtitle =>
      'Заполните сетку так, чтобы в каждой строке, столбце и блоке были буквы A-I.';

  @override
  String get alphabetSudokuWinTitle => 'СУДОКУ РЕШЕНО!';

  @override
  String get alphabetSudokuWinMessage => 'Блестяще! Вы освоили буквы.';

  @override
  String get classicMazeTitle => 'Классический лабиринт';

  @override
  String get classicMazeSubtitle =>
      'ИССЛЕДУЙТЕ И РЕШАЙТЕ • НОВЫЙ ЛАБИРИНТ В КАЖДОЙ ИГРЕ';

  @override
  String get classicMazeWinTitle => 'ЛАБИРИНТ ПРОЙДЕН';

  @override
  String classicMazeWinMessage(int count) {
    return 'Невероятная навигация! Вы прошли лабиринт за $count ходов.';
  }

  @override
  String get classicMazeMoves => 'ХОДЫ: ';

  @override
  String get classicMazeHowToPlayDescription =>
      '1. Проведите светящийся желтый шарик (игрок) к зеленому порталу (выход) в правом нижнем углу.\n\n2. Используйте свайпы в любом месте лабиринта, клавиши со стрелками на физической клавиатуре или кнопки со стрелками внизу для перемещения.\n\n3. Фиолетовый след показывает пройденный вами путь. Возвращайтесь по своему следу, чтобы динамически стирать его!\n\n4. Переключайте уровень сложности в верхней панели действий, чтобы бросить себе вызов в более крупных лабиринтах!';

  @override
  String get conjunctionSearchTitle => 'Поиск по признакам';

  @override
  String get conjunctionSearchSubtitle =>
      'Концентрация внимания и сочетание признаков';

  @override
  String get conjunctionSearchWinTitle => 'ПОБЕДА';

  @override
  String get conjunctionSearchWinMessage =>
      'Вы нашли все цели с идеальной концентрацией внимания!';

  @override
  String get conjunctionSearchHowToPlayDescription =>
      'В инструкции будет показана определенная комбинация формы и цвета цели. Найдите и нажмите на нее в плотной сетке как можно быстрее. Отвлекающие фигуры имеют либо тот же цвет, либо ту же форму, так что смотрите внимательно!';

  @override
  String get conjunctionSearchRound => 'РАУНД: ';

  @override
  String get conjunctionSearchScore => 'СЧЕТ: ';

  @override
  String get conjunctionSearchFind => 'НАЙТИ: ';

  @override
  String get shapeCircle => 'КРУГ';

  @override
  String get shapeSquare => 'КВАДРАТ';

  @override
  String get shapeTriangle => 'ТРЕУГОЛЬНИК';

  @override
  String get shapeStar => 'ЗВЕЗДА';

  @override
  String get colorRedLabel => 'КРАСНЫЙ';

  @override
  String get colorBlueLabel => 'СИНИЙ';

  @override
  String get colorGreenLabel => 'ЗЕЛЕНЫЙ';

  @override
  String get colorAmberLabel => 'ЯНТАРНЫЙ';

  @override
  String get cubeNetFoldTitle => 'Развертка куба';

  @override
  String get cubeNetFoldSubtitle => 'ВЫБЕРИТЕ СООТВЕТСТВУЮЩИЙ 3D-КУБ';

  @override
  String get cubeNetFoldWinTitle => 'ВЕРНО';

  @override
  String get cubeNetFoldWinMessage => 'У вас идеальная логика 3D-складывания!';

  @override
  String get cubeNetFoldHowToPlayDescription =>
      '1. Посмотрите на развернутую 2D-сетку вверху.\n\n2. Мысленно сложите сетку в 3D-куб.\n\n3. Выберите ниже вариант, который представляет собой правильную 3D-перспективу этого сложенного куба.\n\n4. Будьте осторожны: противоположные грани в развертке не могут быть соседними в 3D, и порядок соседних граней должен совпадать!';

  @override
  String get cubeNetFoldUnfoldedNet => 'РАЗВЕРНУТАЯ 2D-СЕТКА';

  @override
  String get cubeNetFoldWhichMatches => 'КАКОЙ КУБ ПОДХОДИТ?';

  @override
  String get cubeNetFoldIncorrect =>
      'Неверная логика складывания! Нажмите «Сброс» или измените свой выбор.';

  @override
  String get cubeNetFoldSubmitChoice => 'ОТПРАВИТЬ ВЫБОР';

  @override
  String get cubeNetFoldFailed => 'ОШИБКА (НАЖМИТЕ СБРОС)';

  @override
  String get faceTraitAssociationMemorize => 'ЗАПОМНИТЕ ВСЕХ 4 ЧЕЛОВЕК';

  @override
  String faceTraitAssociationPersonOf(int current, int total) {
    return 'ЧЕЛОВЕК $current ИЗ $total';
  }

  @override
  String get faceTraitAssociationWhatOccupation => 'КАКАЯ У НИХ ПРОФЕССИЯ?';

  @override
  String get faceTraitAssociationWhatHobby => 'КАКОЕ У НИХ ХОББИ?';

  @override
  String get faceTraitAssociationWinTitle => 'МАСТЕР ПАМЯТИ!';

  @override
  String get faceTraitAssociationLoseTitle => 'ИГРА ОКОНЧЕНА';

  @override
  String faceTraitAssociationScoreMessage(int correct, int total) {
    return 'Правильно $correct из $total.';
  }

  @override
  String get topologyTitle => 'ТОПОЛОГИЯ';

  @override
  String get topologySubtitle =>
      'Эквивалентны ли эти фигуры топологически? (Можно ли одну деформировать в другую без разрезания или склеивания?)';

  @override
  String get topologyWinTitle => 'ГЕНИЙ ГЕОМЕТРИИ!';

  @override
  String get topologyWinMessage =>
      'Вы правильно определили 10 топологических пар!';

  @override
  String get topologyScore => 'СЧЕТ: ';
}
