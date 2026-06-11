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
  String get victory => 'Победа!';

  @override
  String get gameWin => 'ОТЛИЧНО!';

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
  String get shapeRectangle => 'RECTANGLE';

  @override
  String get shapeEllipse => 'ELLIPSE';

  @override
  String get shapeTrapezoid => 'TRAPEZOID';

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

  @override
  String get semanticDistanceTitle => 'Семантическая дистанция';

  @override
  String get semanticDistanceSubtitle =>
      'Измерьте концептуальное расстояние между словами';

  @override
  String get oxymoronHuntTitle => 'Охота за оксюморонами';

  @override
  String get oxymoronHuntSubtitle => 'Найдите пары противоречивых слов в сетке';

  @override
  String get portmanteauSplitTitle => 'Слова-гибриды';

  @override
  String get portmanteauSplitSubtitle =>
      'Определите исходные слова для слова-гибрида';

  @override
  String get chainReactionTitle => 'Цепная реакция';

  @override
  String get chainReactionSubtitle =>
      'Соединяйте слова, используя перекрывающиеся буквы';

  @override
  String get rhymeMasterTitle => 'Мастер рифмы';

  @override
  String get rhymeMasterSubtitle =>
      'Найдите слова, которые рифмуются с заданным';

  @override
  String get definitionDashTitle => 'Спринт определений';

  @override
  String get definitionDashSubtitle =>
      'Подберите правильное слово к его определению';

  @override
  String get syllableStackTitle => 'Башня из слогов';

  @override
  String get syllableStackSubtitle =>
      'Складывайте слоги, чтобы составлять целые слова';

  @override
  String get sentenceUnscrambleTitle => 'Расшифровка предложений';

  @override
  String get sentenceUnscrambleSubtitle =>
      'Расставьте слова по порядку, чтобы получилось предложение';

  @override
  String get grammarSortTitle => 'Сортировка грамматики';

  @override
  String get grammarSortSubtitle => 'Распределите слова по частям речи';

  @override
  String get vowelReconstructTitle => 'Восстановление гласных';

  @override
  String get vowelReconstructSubtitle =>
      'Вставьте пропущенные гласные в предложении';

  @override
  String get consonantReconstructTitle => 'Восстановление согласных';

  @override
  String get consonantReconstructSubtitle =>
      'Вставьте пропущенные согласные в предложении';

  @override
  String get homophoneHuntTitle => 'Охота за омофонами';

  @override
  String get silentLetterSearchTitle => 'Поиск непроизносимых букв';

  @override
  String get silentLetterSearchSubtitle =>
      'Найдите непроизносимые буквы в словах';

  @override
  String get palindromeBuilderTitle => 'Создатель палиндромов';

  @override
  String get palindromeBuilderSubtitle =>
      'Создайте палиндром, добавив минимальное количество букв';

  @override
  String get phoneticGuessTitle => 'Фонетическая угадайка';

  @override
  String get phoneticGuessSubtitle =>
      'Угадайте слово по его фонетической транскрипции';

  @override
  String get spoonerismSolverTitle => 'Решатель спунеризмов';

  @override
  String get spoonerismSolverSubtitle =>
      'Определите правильный спунеризм для фразы';

  @override
  String get etymonOddballTitle => 'Этимологический лишний';

  @override
  String get etymonOddballSubtitle => 'Найдите слово с другим корнем';

  @override
  String get etymologyOriginTitle => 'Происхождение слов';

  @override
  String get etymologyOriginSubtitle =>
      'Угадайте язык происхождения заимствованного слова';

  @override
  String get affixFactoryTitle => 'Фабрика аффиксов';

  @override
  String get affixFactorySubtitle =>
      'Создавайте слова с помощью приставок и суффиксов';

  @override
  String get cognateCatchTitle => 'Ловушка когнатов';

  @override
  String get cognateCatchSubtitle =>
      'Отличите настоящие когнаты от ложных друзей переводчика';

  @override
  String get compoundConnectTitle => 'Соединение сложных слов';

  @override
  String get compoundConnectSubtitle =>
      'Объедините два слова в одно сложное слово';

  @override
  String get pangramSprintTitle => 'Спринт панграмм';

  @override
  String get pangramSprintSubtitle =>
      'Составьте предложение, используя все буквы алфавита';

  @override
  String get anagramDefinitionTitle => 'Анаграмма-определение';

  @override
  String get anagramDefinitionSubtitle =>
      'Решите анаграмму на основе ее определения';

  @override
  String get letterBridgeTitle => 'Буквенный мост';

  @override
  String get letterBridgeSubtitle =>
      'Найдите букву, которая соединяет два слова';

  @override
  String get letterFrequencyScanTitle => 'Сканирование частоты букв';

  @override
  String get letterFrequencyScanSubtitle =>
      'Посчитайте, сколько раз буква встречается в тексте';

  @override
  String get oneLetterShiftTitle => 'Сдвиг на одну букву';

  @override
  String get oneLetterShiftSubtitle =>
      'Превратите одно слово в другое, изменив одну букву';

  @override
  String vocabularyBuilderMessage(String arg0) {
    return 'Отличная работа! Ваш словарный запас впечатляет. Счет: $arg0';
  }

  @override
  String get symmetryMessage =>
      'Вы идеально зеркально отразили узор с хирургической точностью.';

  @override
  String get temporalOrderMessage =>
      'Невероятно! Ваша память на временные последовательности работает безупречно.';

  @override
  String get temporalOrderMessage1 =>
      'Неверная последовательность. Практика ведет к совершенству!';

  @override
  String get wordSearchMessage => 'Все слова найдены благодаря вашей зоркости.';

  @override
  String colorMatchMessage(String arg0) {
    return 'Ваша точность: $arg0%';
  }

  @override
  String semanticLinkMessage(String arg0) {
    return 'Вы набрали $arg0 очков!';
  }

  @override
  String reflexTapMessage(String arg0) {
    return 'Вы нажали на $arg0 целей!';
  }

  @override
  String get angleFinderMessage => 'Ваша геометрическая интуиция безупречна!';

  @override
  String angleFinderMessage1(String arg0) {
    return 'Правильный ответ: $arg0°';
  }

  @override
  String angleFinderText(String arg0) {
    return '$arg0°';
  }

  @override
  String visualStatisticalLearningMessage(String arg0) {
    return 'Вы нашли $arg0 верных паттернов!';
  }

  @override
  String nonogramText(String arg0) {
    return 'Ошибка: $arg0';
  }

  @override
  String mentalCalendarMessage(String arg0) {
    return 'Вы ответили правильно на $arg0 из 10!';
  }

  @override
  String orbitTapMessage(String arg0) {
    return 'Вы успешно нажали $arg0 раз!';
  }

  @override
  String schulteTableMessage(String arg0) {
    return 'Вы заполнили таблицу за $arg0.\\nПродолжайте практиковаться, чтобы расширить периферическое зрение!';
  }

  @override
  String get schulteTableText => 'НАЧАТЬ ТЕСТ';

  @override
  String get relationalMemoryMessage =>
      'Потрясающая точность пространственной реляционной памяти!';

  @override
  String sudokuText(String arg0) {
    return 'Ошибка: $arg0';
  }

  @override
  String sdmtMessage(String arg0) {
    return 'Вы сопоставили $arg0 символов! Этот тест измеряет скорость сканирования и визуальное внимание.';
  }

  @override
  String get futoshikiMessage =>
      'Невероятно! Вы решили латинский квадрат Футошики.';

  @override
  String letterFrequencyScanMessage(String arg0, String arg1) {
    return 'Вы правильно насчитали $arg0 вхождений «$arg1».';
  }

  @override
  String letterFrequencyScanText(String arg0) {
    return 'Неверно. Количество было $arg0.';
  }

  @override
  String get memoryMatrixMessage =>
      'Впечатляюще! Ваша рабочая память очень острая. Дневная цель достигнута!';

  @override
  String get memoryMatrixMessage1 =>
      'Сосредоточьтесь и попробуйте еще раз, чтобы улучшить свой показатель памяти.';

  @override
  String get contextCluesMessage =>
      'Исключительно! Ваш словарный запас и контекстный анализ на высшем уровне.';

  @override
  String get contextCluesMessage1 =>
      'Выбрано неверное слово! Тренируйте вербально-контекстное мышление и попробуйте снова.';

  @override
  String oneLetterShiftMessage(String arg0, String arg1) {
    return 'Вы правильно превратили $arg0 в $arg1.';
  }

  @override
  String get mentalAbacusMessage => 'Ваш ментальный счет на высшем уровне.';

  @override
  String fractionMatcherMessage(String arg0) {
    return 'Вы набрали $arg0 очков, сопоставляя представления!';
  }

  @override
  String get spellingSprintMessage => 'Вы правильно написали все 10 слов!';

  @override
  String spellingSprintMessage1(String arg0) {
    return 'Вы правильно написали $arg0 слов.';
  }

  @override
  String stopSignalMessage(String arg0) {
    return 'Вы дали $arg0 правильных ответов! Этот тест измеряет вашу способность подавлять запланированное действие.';
  }

  @override
  String grammarPoliceMessage(String arg0) {
    return 'Игра окончена! Вы поддерживали порядок в мире грамматики. Счет: $arg0';
  }

  @override
  String consonantReconstructMessage(String arg0) {
    return 'Ваш результат реконструкции: $arg0!';
  }

  @override
  String rhymeMasterMessage(String arg0, String arg1) {
    return 'Вы нашли $arg0 из $arg1 рифм!';
  }

  @override
  String vigilanceTaskMessage(String arg0, String arg1, String arg2) {
    return 'Попадания: $arg0, Промахи: $arg1\\nЛожные срабатывания: $arg2';
  }

  @override
  String get silhouetteMatchOrthoMessage =>
      'У вас безупречные навыки ортогонального выравнивания!';

  @override
  String get silhouetteMatchOrthoText => 'ПОНЯТНО';

  @override
  String get silhouetteMatchOrthoText1 =>
      'Неверная перспективная проекция! Нажмите «Сброс», чтобы попробовать снова.';

  @override
  String fibonacciMergeMessage(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String factorFinderMessage(String arg0) {
    return 'Вы набрали $arg0 очков, найдя все множители!';
  }

  @override
  String logicalSyllogismsMessage(String arg0) {
    return 'Вы правильно решили $arg0 силлогизмов!';
  }

  @override
  String get rotatingMazeMessage =>
      'Вы успешно прошли кинетический вращающийся лабиринт!';

  @override
  String get rotatingMazeText => 'ПОНЯТНО';

  @override
  String get rotatingMazeText1 =>
      '🌀 Лабиринт повернут на 90°! Сетка сместилась!';

  @override
  String get mathPathMessage => 'Вы нашли путь, сумма которого равна цели!';

  @override
  String get bridgesMessage => 'Вы успешно соединили все острова!';

  @override
  String compoundConnectMessage(String arg0, String arg1) {
    return 'Составное слово: $arg0$arg1.';
  }

  @override
  String get pangramSprintMessage =>
      'Вы составили предложение, используя все буквы алфавита.';

  @override
  String get mirrorImageMessage => 'Вы идеально определили отражение.';

  @override
  String get mirrorImageText => 'ЗЕРКАЛЬНОЕ ОТРАЖЕНИЕ';

  @override
  String reverseStroopMessage(String arg0) {
    return 'Вы набрали $arg0 очков! Следите за инструкциями.';
  }

  @override
  String get verbalAnalogiesMessage =>
      'У вас острый ум для поиска взаимосвязей.';

  @override
  String corsiBlocksMessage1(String arg0, String arg1) {
    return 'Вы запомнили $arg1 последовательностей! Объем вашей пространственной памяти достиг $arg0.';
  }

  @override
  String wordLadderMessage(String arg0, String arg1, String arg2) {
    return 'Вы успешно соединили $arg0 и $arg1 за $arg2 шагов.';
  }

  @override
  String d2AttentionMessage(String arg0) {
    return 'Невероятное избирательное сканирование! Итоговый счет: $arg0.';
  }

  @override
  String get d2AttentionText => 'КАК ИГРАТЬ';

  @override
  String get d2AttentionText1 => 'ПОНЯТНО';

  @override
  String get tangleFixMessage => 'Все линии четкие и плавные.';

  @override
  String get distractorMatrixMessage =>
      'Невероятно! Вы вспомнили паттерны, несмотря на когнитивные математические отвлекающие факторы!';

  @override
  String get distractorMatrixMessage1 =>
      'Отвлекающие факторы сбили вас! Тренируйте рабочую память.';

  @override
  String sentenceUnscrambleMessage(String arg0) {
    return 'Вы расшифровали на $arg0 очков!';
  }

  @override
  String get kakuroMessage =>
      'Невероятно! Вы идеально подобрали все сегменты суммы.';

  @override
  String symbolicFlankerMessage(String arg0, String arg1) {
    return 'Вы правильно ответили в $arg0 случаях из $arg1!';
  }

  @override
  String stroopTestMessage(String arg0) {
    return 'Вы набрали $arg0 правильно! Сосредоточьтесь на цвете шрифта, а не на слове.';
  }

  @override
  String wisconsinCardSortingMessage(String arg0) {
    return 'Вы правильно рассортировали $arg0 карт!';
  }

  @override
  String nBackMessage(String arg0) {
    return 'Вы достигли $arg0 совпадений в тесте 2-назад! Рабочая память жизненно важна для многозадачности.';
  }

  @override
  String rhythmMasterMessage(String arg0, String arg1) {
    return 'У вас $arg0 точных попаданий и $arg1 очков!';
  }

  @override
  String groceryListMessage(String arg0, Object score) {
    return 'Вы набрали $arg0 очков в «Списке покупок»!';
  }

  @override
  String get groceryListText => 'Я';

  @override
  String get mirrorTracingMessage => 'Ваш мозг успешно перестроил координацию.';

  @override
  String moduloClockMessage(String arg0) {
    return 'Отличная координация модульной ментальной арифметики! Счет: $arg0';
  }

  @override
  String moduloClockMessage1(String arg0, String arg1, String arg2) {
    return 'Вы нашли $arg0 из $arg1 решений модульных часов. Счет: $arg2';
  }

  @override
  String get crownMessage =>
      'Все короны успешно расставлены с идеальной логикой.';

  @override
  String dualCodingMessage(String arg0) {
    return 'Фантастическое выполнение двойной задачи! Ваш показатель рабочей памяти: $arg0';
  }

  @override
  String inequalityDashMessage(String arg0) {
    return 'Вы набрали $arg0 очков, сопоставляя неравенства!';
  }

  @override
  String sourceMonitoringMessage(String arg0, String arg1) {
    return 'Ваш результат: $arg0 из $arg1!';
  }

  @override
  String get sourceMonitoringText => 'НАЧАТЬ ВСПОМИНАТЬ';

  @override
  String get memoryPalaceText => 'ДОСТУПНЫЕ СЛОВА';

  @override
  String target10Message(String arg0) {
    return 'Вы набрали $arg0 очков, составляя числа до 10!';
  }

  @override
  String get paperFoldingMessage =>
      'Вы видите закономерности в своем воображении.';

  @override
  String topologyText(String arg0, String arg1) {
    return '$arg0$arg1 / 10';
  }

  @override
  String get waterSortMessage => 'Вы идеально рассортировали все цвета!';

  @override
  String anagramDefinitionMessage(String arg0) {
    return 'Это слово действительно было «$arg0».';
  }

  @override
  String game2048Message(String arg0, String arg1, String arg2) {
    return '$arg0: $arg1\\n$arg2';
  }

  @override
  String game2048Message1(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String numericalEstimationMessage(String arg0) {
    return 'Вы сделали $arg0 правильных оценок.';
  }

  @override
  String grammarSortMessage(String arg0) {
    return 'Вы правильно рассортировали $arg0 слов!';
  }

  @override
  String vowelReconstructMessage(String arg0) {
    return 'Вы восстановили на $arg0 очков!';
  }

  @override
  String spatialConflictMessage(String arg0, String arg1) {
    return 'Вы набрали $arg0 очков с $arg1 ошибками!';
  }

  @override
  String get spatialConflictText => 'КАК ИГРАТЬ';

  @override
  String get spatialConflictText1 => 'ПОНЯТНО';

  @override
  String tracePathMessage(String arg0) {
    return 'Ваша точность составила $arg0%!';
  }

  @override
  String ruleSwitcherMessage(String arg0, String arg1) {
    return 'Вы правильно ответили в $arg0 случаях из $arg1!';
  }

  @override
  String collatzMessage(String arg0, String arg1) {
    return 'Вы сделали $arg0 шагов. Минимально возможное — $arg1.';
  }

  @override
  String get collatzText => '/ 2';

  @override
  String get collatzText1 => '+ 1';

  @override
  String get collatzText2 => '3n + 1';

  @override
  String divisibilityDashMessage(String arg0) {
    return 'Вы решили $arg0 чисел!';
  }

  @override
  String switchTaskMessage(String arg0) {
    return 'Вы правильно ответили $arg0 раз! Быстрое переключение — ключ к ментальной гибкости.';
  }

  @override
  String sequenceSleuthMessage(String arg0) {
    return 'Вы решили $arg0 последовательностей!';
  }

  @override
  String changeBlindnessMessage(String arg0) {
    return 'Вы нашли $arg0 изменений!';
  }

  @override
  String mentalRotationMessage(String arg0) {
    return 'Вы правильно повернули $arg0 фигур!';
  }

  @override
  String wordMastermindMessage(String arg0) {
    return 'Вы разгадали код!\\nЗагаданное слово: $arg0';
  }

  @override
  String wordMastermindMessage1(String arg0) {
    return 'Скрытое слово было: $arg0';
  }

  @override
  String wordMastermindText(String arg0) {
    return '$arg0';
  }

  @override
  String get simonSequenceMessage => 'Вы запомнили все 10 плиток!';

  @override
  String get simonSequenceMessage1 =>
      'Попробуйте еще раз, чтобы освоить последовательность.';

  @override
  String oxymoronHuntMessage(String arg0) {
    return 'Вы нашли $arg0 оксюморонов!';
  }

  @override
  String spotlightTrackMessage(String arg0) {
    return 'Невероятное пространственное отслеживание! Вы набрали $arg0 очков.';
  }

  @override
  String get spotlightTrackText => 'КАК ИГРАТЬ';

  @override
  String get spotlightTrackText1 => 'ПОНЯТНО';

  @override
  String get spotlightTrackText2 => 'НАЧАТЬ РАУНД';

  @override
  String vennNumbersMessage(String arg0) {
    return 'Вы распределили по категориям $arg0 чисел!';
  }

  @override
  String get vennNumbersText => 'НИ ТО, НИ ДРУГОЕ';

  @override
  String get vennNumbersText1 => 'ОБА';

  @override
  String get silhouetteMatchMessage =>
      'Ваш мозг отлично справляется с переводом из 3D в 2D.';

  @override
  String sumSnakeMessage(String arg0) {
    return 'Цель $arg0 достигнута с идеальной точностью!';
  }

  @override
  String get sumSnakeText => 'ОЧИСТИТЬ ПУТЬ';

  @override
  String percentagePeakMessage(String arg0) {
    return 'Вы решили $arg0 задач на проценты!';
  }

  @override
  String trailMakingMessage(String arg0) {
    return 'Вы прошли $arg0 маршрутов! Этот тест измеряет скорость визуального поиска и ментальную гибкость.';
  }

  @override
  String matrixReasoningMessage(String arg0) {
    return 'Вы правильно заполнили $arg0 матриц!';
  }

  @override
  String get tentsAndTreesMessage => 'Вы успешно расставили все палатки.';

  @override
  String klotskiMessage(String arg0) {
    return 'Потрясающее скольжение! Вы освободили блок героя за $arg0 ходов.';
  }

  @override
  String sumPyramidMessage(String arg0) {
    return 'Вы успешно решили $arg0 числовых пирамид!';
  }

  @override
  String simonCommandMessage(String arg0) {
    return 'Отличная избирательная реакция и концентрация! Итоговый счет: $arg0';
  }

  @override
  String simonCommandMessage1(String arg0, String arg1) {
    return 'Вы набрали $arg0, но не успели найти $arg1 совпадений вовремя.';
  }

  @override
  String syllableStackMessage(String arg0) {
    return 'Вы набрали $arg0 очков!';
  }

  @override
  String get slitherlinkMessage =>
      'Здорово! Вы успешно завершили головоломку с замкнутой петлей.';

  @override
  String quickMathMessage(String arg0) {
    return 'Вы решили $arg0 задач!';
  }

  @override
  String commonDenominatorMessage(String arg0) {
    return 'Вы решили $arg0 задач на НОД/НОК!';
  }

  @override
  String chainReactionMessage(String arg0, String arg1) {
    return 'Ваш итоговый счет: $arg0. Вы построили цепочку из $arg1 слов.';
  }

  @override
  String chainReactionText(String arg0) {
    return '$arg0';
  }

  @override
  String get associativePairsMessage =>
      'Блестяще! Вы безупречно сопоставили визуальные черты.';

  @override
  String get associativePairsMessage1 =>
      'Неправильное сопоставление! Улучшите ассоциативную память и попробуйте еще раз.';

  @override
  String portmanteauSplitMessage(String arg0) {
    return 'Вы разделили $arg0 слов-портмоне!';
  }

  @override
  String get magicSquaresText => 'ОЧИСТИТЬ';

  @override
  String alphabetSudokuText(String arg0) {
    return 'Ошибка: $arg0';
  }

  @override
  String get pipesMessage => 'Вы соединили все трубы и заполнили сетку.';

  @override
  String get dualMirrorMessage => 'Вы довели обе иконки до своих целей!';

  @override
  String binaryCodeMessage(String arg0) {
    return 'Потрясающий быстрый перевод в десятичную систему! Итоговый счет: $arg0';
  }

  @override
  String binaryCodeMessage1(String arg0, String arg1) {
    return 'Вы правильно перевели $arg0 двоичных чисел. Счет: $arg1';
  }

  @override
  String oddOneOutMessage(String arg0) {
    return 'Вы нашли 50 лишних элементов! Итоговый счет: $arg0';
  }

  @override
  String oddOneOutMessage1(String arg0) {
    return 'Ваш счет: $arg0';
  }

  @override
  String letterBridgeMessage(String arg0) {
    return 'Вы нашли связующую букву: $arg0';
  }

  @override
  String get imReady => 'Я ГОТОВ';

  @override
  String get soptTitle => 'Самостоятельное наведение';

  @override
  String get soptSubtitle =>
      'Каждый раз нажимайте на другую карту. Позиции перетасовываются!';

  @override
  String get soptWinTitle => 'Мастер последовательности!';

  @override
  String soptGameOverMessage(int score) {
    return 'Вы набрали $score очков, успешно отслеживая перетасованные карты!';
  }

  @override
  String get soptChooseNovel => 'Нажмите на новую карту';

  @override
  String get soptGreatJob => 'Отличная работа!';

  @override
  String get soptAlreadyTapped => 'Уже постучал!';

  @override
  String get soptGrid => 'Сетка';

  @override
  String get contRecogTitle => 'Непрерывное признание';

  @override
  String get contRecogSubtitle =>
      'Видели ли вы эту карточку раньше на этом сеансе?';

  @override
  String get contRecogWinTitle => 'Признанный гений!';

  @override
  String contRecogGameOverMessage(int score) {
    return 'Вы набрали $score правильных распознаваний!';
  }

  @override
  String get contRecogCorrect => 'Правильный!';

  @override
  String get contRecogWrong => 'Неправильный!';

  @override
  String get contRecogOldOrNew => 'Это старое или новое?';

  @override
  String get contRecogNew => 'Новый';

  @override
  String get contRecogOld => 'Старый';

  @override
  String get contRecogSeenPool => 'Виден бассейн';

  @override
  String get dnmsTitle => 'Несовпадающая память';

  @override
  String get dnmsSubtitle =>
      'Коснитесь карты, которой не было в запомненном образце.';

  @override
  String get dnmsWinTitle => 'Несоответствующий эксперт!';

  @override
  String dnmsGameOverMessage(int score) {
    return 'Вы набрали $score правильных ответов в разделе «Отложенное несовпадение»!';
  }

  @override
  String get dnmsChooseNovel => 'Нажмите на новую карту';

  @override
  String get dnmsMemorizeSample => 'Запомни эту карту';

  @override
  String get dnmsWaitForIt => 'Подожди...';

  @override
  String get dnmsExcellent => 'Отличный!';

  @override
  String get dnmsSampleTapped => 'Это был образец!';

  @override
  String get dnmsCards => 'Карты';

  @override
  String get symSpanTitle => 'Симметрия';

  @override
  String get symSpanSubtitle =>
      'Вспомните структуру клеток, определяя вертикальную симметрию.';

  @override
  String get symSpanWinTitle => 'Мастер симметрии!';

  @override
  String symSpanGameOverMessage(int score) {
    return 'Вы набрали $score баллов, вспомнив макеты и определив симметрию!';
  }

  @override
  String get symSpanMemorizeRed => 'Запомните расположение эритроцитов';

  @override
  String get symSpanIsSymmetric => 'Симметричен ли узор?';

  @override
  String get symSpanRecallSequence =>
      'Вспомните последовательность действий в правильном порядке.';

  @override
  String get symSpanGreatJob => 'Отличная работа!';

  @override
  String get symSpanTryAgain => 'Попробуйте еще раз!';

  @override
  String get symSpanLength => 'Длина';

  @override
  String get readingSpanTitle => 'Продолжительность чтения';

  @override
  String get readingSpanSubtitle =>
      'Проверьте предложения, запоминая последовательность букв.';

  @override
  String get readingSpanWinTitle => 'Эксперт по чтению!';

  @override
  String readingSpanGameOverMessage(int score) {
    return 'Вы набрали $score очков в испытании на запоминание «Объем чтения»!';
  }

  @override
  String get readingSpanTrueFalse => 'Верно или ложно это утверждение?';

  @override
  String get readingSpanMemorizeLetter => 'Запомни это письмо';

  @override
  String get readingSpanRecallLetters => 'Вспоминайте буквы по порядку.';

  @override
  String get readingSpanGreatJob => 'Отличная работа!';

  @override
  String get readingSpanTryAgain => 'Попробуйте еще раз!';

  @override
  String readingSpanYourSequence(String sequence) {
    return 'Ваша последовательность: $sequence';
  }

  @override
  String get readingSpanLength => 'Длина';

  @override
  String get readingSpanSentence1 => 'Солнце восходит на востоке.';

  @override
  String get readingSpanSentence2 => 'Лед кипит.';

  @override
  String get readingSpanSentence3 => 'Рыбы могут дышать под водой.';

  @override
  String get readingSpanSentence4 => 'У собак есть крылья и они умеют летать.';

  @override
  String get readingSpanSentence5 =>
      'Вода замерзает при температуре 0 градусов Цельсия.';

  @override
  String get readingSpanSentence6 => 'Кошки лают, как маленькие собаки.';

  @override
  String get readingSpanSentence7 => 'Летом деревья имеют зеленые листья.';

  @override
  String get readingSpanSentence8 => 'Дождь падает вверх от земли.';

  @override
  String get readingSpanSentence9 => 'Треугольник имеет четыре равные стороны.';

  @override
  String get readingSpanSentence10 =>
      'Яблоки – это разновидность сладких фруктов.';

  @override
  String get readingSpanSentence11 => 'Луна сделана из сыра чеддер.';

  @override
  String get readingSpanSentence12 =>
      'У автомобилей есть колеса, которые они могут катить.';

  @override
  String get readingSpanSentence13 => 'Огонь очень холодный.';

  @override
  String get readingSpanSentence14 =>
      'Бумага изготавливается из обработанной древесины.';

  @override
  String get readingSpanSentence15 =>
      'У птиц есть перья, которые помогают им летать.';

  @override
  String get readingSpanSentence16 => 'Бананы растут на соснах.';

  @override
  String get readingSpanSentence17 => 'Слон меньше муравья.';

  @override
  String get readingSpanSentence18 =>
      'Книги содержат печатные страницы текста.';

  @override
  String get countingSpanTitle => 'Подсчет интервала';

  @override
  String get countingSpanSubtitle =>
      'Считайте только синие круги. Затем вспомните последовательность отсчетов.';

  @override
  String get countingSpanWinTitle => 'Считаем гения!';

  @override
  String countingSpanGameOverMessage(int score) {
    return 'Вы набрали $score очков в испытании на память «Счетный интервал»!';
  }

  @override
  String get countingSpanCountCircles => 'Считай только синие круги';

  @override
  String get countingSpanRecallCounts =>
      'Напоминание считается в правильном порядке';

  @override
  String get countingSpanGreatJob => 'Отличная работа!';

  @override
  String get countingSpanTryAgain => 'Попробуйте еще раз!';

  @override
  String countingSpanYourSequence(String sequence) {
    return 'Ваша последовательность: $sequence';
  }

  @override
  String get countingSpanLength => 'Длина';

  @override
  String get objDispTitle => 'Смещение объекта';

  @override
  String get objDispSubtitle =>
      'Запомните макет. Найдите и коснитесь одного объекта, который меняет положение.';

  @override
  String get objDispWinTitle => 'Пространственный гений!';

  @override
  String objDispGameOverMessage(int score) {
    return 'Вы правильно определили $score смещенных объектов!';
  }

  @override
  String get objDispMemorizeAll => 'Запомните все места размещения';

  @override
  String get objDispWaitingShift => 'Ждем смены макета...';

  @override
  String get objDispTapMoved => 'Коснитесь объекта, который переместился';

  @override
  String get objDispExcellent => 'Отличный!';

  @override
  String get objDispWrongObject => 'Неправильный объект!';

  @override
  String get objDispItems => 'Предметы';

  @override
  String get mandalaTitle => 'Мандала Напоминание';

  @override
  String get mandalaSubtitle =>
      'Запомните цветовую конфигурацию. Выбирайте цвета и перекрашивайте плитки.';

  @override
  String get mandalaWinTitle => 'Художник мандалы!';

  @override
  String mandalaGameOverMessage(int score) {
    return 'Вы набрали $score баллов, воссоздав цветные геометрические макеты!';
  }

  @override
  String get mandalaMemorizeColors => 'Запомните цвета плитки';

  @override
  String get mandalaPaintCells =>
      'Раскрасьте ячейки в соответствии с оригиналом';

  @override
  String get mandalaExcellent => 'Отличный!';

  @override
  String get mandalaIncorrectMatch => 'Неверное совпадение!';

  @override
  String get mandalaSubmitRepaint => 'Отправить перекраску';

  @override
  String get mandalaTiles => 'Плитка';

  @override
  String get runningSpanTitle => 'Беговой интервал';

  @override
  String get runningSpanSubtitle =>
      'Следите за буквами. Когда они остановятся, введите последние N букв по порядку.';

  @override
  String get runningSpanWinTitle => 'Буферный мастер!';

  @override
  String runningSpanGameOverMessage(int score) {
    return 'Вы набрали $score очков в тесте «Быстрая память»!';
  }

  @override
  String runningSpanPrepareRecall(int count) {
    return 'Приготовьтесь вспомнить последние $count буквы.';
  }

  @override
  String get runningSpanWatchCarefully => 'Смотрите внимательно...';

  @override
  String runningSpanEnterLast(int count) {
    return 'Введите последние $count буквы';
  }

  @override
  String get runningSpanGreatJob => 'Отличная работа!';

  @override
  String get runningSpanIncorrectBuffer => 'Неправильный буфер!';

  @override
  String runningSpanRecallLast(int count) {
    return 'Вспомнить последнее $count';
  }

  @override
  String get runningSpanStopsRandomly =>
      'Поток останавливается случайным образом!';

  @override
  String runningSpanEntered(String sequence) {
    return 'Введено: $sequence';
  }

  @override
  String get runningSpanNItems => 'N-предметов';

  @override
  String get spatialCabinetTitle => 'Пространственные шкафы';

  @override
  String get spatialCabinetSubtitle =>
      'Запомните, в каком ящике шкафа какой предмет находится.';

  @override
  String get spatialCabinetWinTitle => 'Кабинетный эксперт!';

  @override
  String spatialCabinetGameOverMessage(int score) {
    return 'Вы набрали $score очков в пространственной памяти кабинета!';
  }

  @override
  String get spatialCabinetMemorize => 'Запомните расположение предметов';

  @override
  String spatialCabinetWhereIs(String itemName) {
    return 'Где $itemName ?';
  }

  @override
  String get spatialCabinetCorrect => 'Правильный!';

  @override
  String get spatialCabinetWrongDrawer => 'Неправильный ящик!';

  @override
  String get spatialCabinetItems => 'Предметы';

  @override
  String get cabinetItemKey => 'Ключ';

  @override
  String get cabinetItemApple => 'Яблоко';

  @override
  String get cabinetItemDiamond => 'Алмаз';

  @override
  String get cabinetItemBook => 'Книга';

  @override
  String get cabinetItemUmbrella => 'Зонтик';

  @override
  String get cabinetItemCoffee => 'Кофе';

  @override
  String get cabinetItemLock => 'Замок';

  @override
  String get cabinetItemPet => 'Домашний питомец';

  @override
  String get cabinetItemCar => 'Машина';

  @override
  String get gamesTitleLabel => 'ИГРЫ';

  @override
  String get yourFavorites => 'ВАШИ ЛЮБИМЫЕ';

  @override
  String get readyForWorkout => 'ГОТОВЫ К ЕЖЕДНЕВНОЙ ТРЕНИРОВКЕ?';

  @override
  String get greatStartKeepGoing =>
      'ОТЛИЧНОЕ НАЧАЛО! ПРОДОЛЖАЙТЕ В ТОМ ЖЕ ДУХЕ.';

  @override
  String get onFireToday => 'ВЫ СЕГОДНЯ В УДАРЕ!';

  @override
  String get incredibleSolvingToday => 'НЕВЕРОЯТНЫЕ РЕШЕНИЯ СЕГОДНЯ!';

  @override
  String get newGameLabel => 'НОВАЯ';

  @override
  String get slitherlinkTitle => 'Слизерлинк';

  @override
  String get slitherlinkSubtitle =>
      'ОКОЛЬЦУЙТЕ СЕТКУ ИЗ ШТИФТОВ, ИСПОЛЬЗУЯ ЧИСЛОВЫЕ ПОДСКАЗКИ.';

  @override
  String get futoshikiTitle => 'Футошики';

  @override
  String get futoshikiSubtitle =>
      'ЗАПОЛНЯЙТЕ СЕТКИ, ИСПОЛЬЗУЯ ПОДСКАЗКИ \"БОЛЬШЕ ЧЕМ\".';

  @override
  String get kakuroTitle => 'Какуро';

  @override
  String get kakuroSubtitle => 'РЕШАЙТЕ КРОССВОРДЫ С ЧИСЛАМИ И СУММАМИ.';

  @override
  String get inequalityDashTitle => 'Спринт Неравенств';

  @override
  String get inequalityDashSubtitle =>
      'РЕШАЙТЕ НЕРАВЕНСТВА ПОД ДАВЛЕНИЕМ ВРЕМЕНИ.';

  @override
  String get factorFinderTitle => 'Поиск Множителей';

  @override
  String get factorFinderSubtitle => 'ОПРЕДЕЛИТЕ ВСЕ МНОЖИТЕЛИ ЦЕЛЕВЫХ ЧИСЕЛ.';

  @override
  String get collatzTitle => 'Путь Коллатца';

  @override
  String get collatzSubtitle => 'ПЕРЕМЕЩАЙТЕСЬ ПО ПОСЛЕДОВАТЕЛЬНОСТИ 3N+1.';

  @override
  String get sumPyramidTitle => 'Пирамида Сумм';

  @override
  String get sumPyramidSubtitle =>
      'ЗАПОЛНЯЙТЕ ЯЧЕЙКИ ПИРАМИДЫ МАТЕМАТИЧЕСКИМИ ПОДСКАЗКАМИ О СУММАХ.';

  @override
  String get target10Title => 'Цель 10';

  @override
  String get target10Subtitle =>
      'КОМБИНИРУЙТЕ ПЛИТКИ С ЧИСЛАМИ, ЧТОБЫ ПОЛУЧИТЬ ДЕСЯТЬ СУММ. ';

  @override
  String get fractionMatcherTitle => 'Сопоставление Дробей';

  @override
  String get fractionMatcherSubtitle =>
      'СОПОСТАВЛЯЙТЕ ЭКВИВАЛЕНТНЫЕ ДРОБИ ВИЗУАЛЬНО.';

  @override
  String get dualCodingTitle => 'Двойное Кодирование';

  @override
  String get dualCodingSubtitle =>
      'СОПОСТАВЛЯЙТЕ БУКВЫ И СИМВОЛЫ ОДНОВРЕМЕННО.';

  @override
  String get distractorMatrixTitle => 'Матрица Дистракторов';

  @override
  String get distractorMatrixSubtitle =>
      'НАХОДИТЕ ЦЕЛЕВЫЕ ФИГУРЫ СРЕДИ ДИСТРАКТОРОВ.';

  @override
  String get temporalOrderTitle => 'Временной Порядок';

  @override
  String get temporalOrderSubtitle =>
      'ВСПОМНИТЕ ХРОНОЛОГИЧЕСКУЮ ПОСЛЕДОВАТЕЛЬНОСТЬ.';

  @override
  String get associativePairsTitle => 'Ассоциативные Пары';

  @override
  String get associativePairsSubtitle =>
      'СОЕДИНЯЙТЕ И СОПОСТАВЛЯЙТЕ СООТВЕТСТВУЮЩИЕ СИМВОЛЫ.';

  @override
  String get blockCount3dTitle => 'Подсчет Блоков 3D';

  @override
  String get blockCount3dSubtitle =>
      'СЧИТАЙТЕ БЛОКИ В ТРЕХМЕРНОМ ПРОСТРАНСТВЕ.';

  @override
  String get rotatingMazeTitle => 'Вращающийся Лабиринт';

  @override
  String get rotatingMazeSubtitle =>
      'ВРАЩАЙТЕ ЛАБИРИНТЫ, ЧТОБЫ ПРОВЕСТИ ШАРИКИ К ВЫХОДУ.';

  @override
  String get silhouetteMatchOrthoTitle => 'Сопоставление Силуэтов (Орто)';

  @override
  String get silhouetteMatchOrthoSubtitle =>
      'СОПОСТАВЛЯЙТЕ 3D-ОБЪЕКТЫ С ОРТОГОНАЛЬНЫМИ ТЕНЯМИ.';

  @override
  String get spatialConflictTitle => 'Пространственный Конфликт';

  @override
  String get spatialConflictSubtitle =>
      'РЕШАЙТЕ РАСХОЖДЕНИЯ МЕЖДУ ТЕКСТОМ И НАПРАВЛЕНИЕМ.';

  @override
  String get spotlightTrackTitle => 'Слежение Прожектором';

  @override
  String get spotlightTrackSubtitle =>
      'ОТСЛЕЖИВАЙТЕ МИГАЮЩИЕ ПРЕДМЕТЫ В ДВИЖУЩИХСЯ ТЕНЯХ.';

  @override
  String get d2AttentionTitle => 'Внимание d2';

  @override
  String get d2AttentionSubtitle =>
      'НАЖИМАЙТЕ НА ЦЕЛЕВЫЕ СИМВОЛЫ В СООТВЕТСТВИИ СО СТРОГИМИ КРИТЕРИЯМИ.';

  @override
  String get dualMirrorTitle => 'Двойная Зеркальная Навигация';

  @override
  String get dualMirrorSubtitle =>
      'ПЕРЕМЕЩАЙТЕСЬ ПО ДВУМ ЛАБИРИНТАМ ОДНОВРЕМЕННО.';

  @override
  String get contextCluesTitle => 'Контекстные Подсказки';

  @override
  String get contextCluesSubtitle =>
      'УГАДЫВАЙТЕ СКРЫТЫЕ СЛОВА ПО КОНТЕКСТНЫМ ПОДСКАЗКАМ.';

  @override
  String get digitSpanReverseSubtitle =>
      'ВСПОМНИТЕ ЦИФРЫ ЧИСЕЛ В ОБРАТНОМ ПОРЯДКЕ.';

  @override
  String get faceNameAssociationSubtitle =>
      'ВСПОМНИТЕ ИМЕНА ДЛЯ РАЗЛИЧНЫХ ПРЕДСТАВЛЕННЫХ ЛИЦ.';

  @override
  String get staircaseMemorySubtitle =>
      'ЗАПОМИНАЙТЕ БЛОКИ В СТУПЕНЧАТОЙ ПОСЛЕДОВАТЕЛЬНОСТИ.';

  @override
  String get choiceReactionTimeSubtitle =>
      'БЫСТРО НАЖИМАЙТЕ НА ОПРЕДЕЛЕННЫЕ КНОПКИ, СООТВЕТСТВУЮЩИЕ ПОДСКАЗКАМ.';

  @override
  String get attentionalBlinkSubtitle =>
      'УЛАВЛИВАЙТЕ БЫСТРЫЕ ЦЕЛИ, МЕЛЬКАЮЩИЕ В ПОТОКАХ.';

  @override
  String get visualStatisticalLearningSubtitle =>
      'ИЗУЧАЙТЕ ВРЕМЕННЫЕ ПАТТЕРНЫ ФИГУР ВИЗУАЛЬНО.';

  @override
  String get sternbergTaskSubtitle =>
      'ВСПОМНИТЕ, БЫЛ ЛИ СИМВОЛ В НАБОРЕ ПАМЯТИ.';

  @override
  String get operationSpanSubtitle =>
      'РЕШАЙТЕ ЗАДАЧИ И ВСПОМИНАЙТЕ АЛФАВИТНЫЕ СТРОКИ.';

  @override
  String get continuousRecognitionTitle => 'Непрерывное Распознавание';

  @override
  String get continuousRecognitionSubtitle =>
      'ОПРЕДЕЛИТЕ, ЯВЛЯЕТСЯ ЛИ ПРЕДСТАВЛЕННАЯ КАРТОЧКА СТАРОЙ ИЛИ НОВОЙ.';

  @override
  String get symmetrySpanTitle => 'Объем Симметрии';

  @override
  String get symmetrySpanSubtitle =>
      'ВСПОМНИТЕ КООРДИНАТЫ ЯЧЕЕК ПРИ ПРИНЯТИИ РЕШЕНИЙ О ВЕРТИКАЛЬНОЙ СИММЕТРИИ.';

  @override
  String get objectDisplacementTitle => 'Смещение Объекта';

  @override
  String get objectDisplacementSubtitle =>
      'ИЗУЧИТЕ РАСПОЛОЖЕНИЕ И НАЖМИТЕ НА ЕДИНСТВЕННЫЙ ПРЕДМЕТ, КОТОРЫЙ ПЕРЕМЕСТИЛСЯ.';

  @override
  String get mandalaRecallTitle => 'Воспроизведение Мандалы';

  @override
  String get mandalaRecallSubtitle =>
      'ЗАПОМИНАЙТЕ ЦВЕТНЫЕ ПЛИТКИ И ПЕРЕКРАШИВАЙТЕ МАНДАЛЫ С ПАЛИТРЫ.';

  @override
  String get runningMemorySpanTitle => 'Текущий Объем Памяти';

  @override
  String get runningMemorySpanSubtitle =>
      'СЛЕДИТЕ ЗА ТЕКУЩИМИ БУКВАМИ И ВСПОМИНАЙТЕ ПОСЛЕДНИЕ N ЭЛЕМЕНТОВ.';

  @override
  String get spatialCabinetMemoryTitle => 'Пространственные Шкафы';

  @override
  String get spatialCabinetMemorySubtitle =>
      'ЗАПОМИНАЙТЕ И НАХОДИТЕ ПРЕДМЕТЫ ЗА ДВЕРЦАМИ ШКАФОВ.';

  @override
  String get pathRecallSubtitle => 'ЗАПОМИНАЙТЕ И ПОВТОРЯЙТЕ ВЫБОР ПУТИ.';

  @override
  String get objectShuffleSubtitle =>
      'ОТСЛЕЖИВАЙТЕ ПРЕДМЕТЫ, ПЕРЕМЕШАННЫЕ ПОД ГЛУБОКИМИ ЧАШКАМИ.';

  @override
  String get groceryListSubtitle => 'ЗАПОМИНАЙТЕ И ОТМЕЧАЙТЕ ПУНКТЫ В СПИСКЕ.';

  @override
  String get quickMathSubtitle =>
      'РЕШАЙТЕ АРИФМЕТИЧЕСКИЕ ЗАДАЧИ НА МАКСИМАЛЬНОЙ СКОРОСТИ.';

  @override
  String get mathGuessTitle => 'Математическая Угадайка';

  @override
  String get mathGuessSubtitle => 'УГАДАЙТЕ СКРЫТОЕ ЧИСЛО ЗА 15 ПОПЫТОК.';

  @override
  String get reflexTapSubtitle =>
      'НАЖИМАЙТЕ НА СТИМУЛЫ ТАК БЫСТРО, КАК ТОЛЬКО ВОЗМОЖНО.';

  @override
  String get pixelMimicSubtitle =>
      'КОПИРУЙТЕ ДИЗАЙНЕРСКИЕ ПАТТЕРНЫ НА ПИКСЕЛЬНЫХ СЕТКАХ.';

  @override
  String get simonSequenceSubtitle =>
      'ПОВТОРЯЙТЕ ПОСЛЕДОВАТЕЛЬНОСТИ ФИГУР ПО ПАМЯТИ.';

  @override
  String get slidePuzzleSubtitle =>
      'ПЕРЕСТАВЛЯЙТЕ КВАДРАТНЫЕ ПЛИТКИ СКОЛЬЗЯЩЕЙ СЕТКИ.';

  @override
  String get findWordTitle => 'Поиск Слова';

  @override
  String get schulteTableSubtitle =>
      'НАЖИМАЙТЕ НА ЧИСЛА ОТ ОДНОГО ДО ДВАДЦАТИ ПЯТИ.';

  @override
  String get simonCommandTitle => 'Команда Саймона';

  @override
  String get simonCommandSubtitle => 'БЫСТРО ВЫПОЛНЯЙТЕ ГОЛОСОВЫЕ ИНСТРУКЦИИ.';

  @override
  String get binaryCodeTitle => 'Бинарная Скорость';

  @override
  String get binaryCodeSubtitle => 'ПЕРЕВОДИТЕ БИНАРНЫЕ КОДЫ В ДЕСЯТИЧНЫЕ.';

  @override
  String get moduloClockTitle => 'Часы Модуло';

  @override
  String get moduloClockSubtitle =>
      'ВЫЧИСЛЯЙТЕ МАТЕМАТИЧЕСКИЕ УРАВНЕНИЯ, ИСПОЛЬЗУЯ ЧАСЫ.';

  @override
  String get chimpTestTitle => 'Тест Шимпанзе';

  @override
  String get chimpTestSubtitle =>
      'НАЖИМАЙТЕ НА СЛУЧАЙНЫЕ ЧИСЛА В ПОРЯДКЕ ВОЗРАСТАНИЯ.';

  @override
  String get relationalMemoryTitle => 'Реляционная Память';

  @override
  String get relationalMemorySubtitle =>
      'ВСПОМНИТЕ ТОЧНОЕ РАСПОЛОЖЕНИЕ ЭЛЕМЕНТОВ СЕТКИ.';

  @override
  String get factBinderTitle => 'Связыватель Фактов';

  @override
  String get factBinderSubtitle =>
      'СОЕДИНЯЙТЕ СИМВОЛЫ И ВСПОМИНАЙТЕ УТВЕРЖДЕНИЯ.';

  @override
  String get sourceMonitoringTitle => 'Мониторинг Источника';

  @override
  String get sourceMonitoringSubtitle => 'ЗАПОМИНАЙТЕ КОНТЕКСТ.';

  @override
  String get klotskiTitle => 'Побег Клотски';

  @override
  String get klotskiSubtitle =>
      'ПЕРЕДВИГАЙТЕ БЛОКИ, ЧТОБЫ ДОБРАТЬСЯ ДО ВЫХОДОВ.';

  @override
  String get homophoneHuntSubtitle => 'Выберите правильное написание омофона';

  @override
  String get laserLinkTitle => 'Laser Link';

  @override
  String get laserLinkSubtitle =>
      'Rotate mirrors to reflect lasers and power up all the targets.';

  @override
  String get laserLinkCongrats =>
      'Precision reflection! You\'ve successfully powered the entire grid.';

  @override
  String get crossSectionSliceTitle => 'Cross-Section Slice';

  @override
  String get crossSectionSliceSubtitle =>
      'Identify the correct 2D cross-section of a 3D object from a specific angle.';

  @override
  String get crossSectionSliceCongrats =>
      'Incredible 3D visualization! You saw right through that shape.';

  @override
  String get shadowPivotTitle => 'Shadow Pivot';

  @override
  String get shadowPivotCongrats =>
      'Dynamic spatial reasoning! You mastered the light and shadow.';

  @override
  String get shadowPivotSubtitle =>
      'Predict the shadow cast by a 3D object as it rotates on different axes.';

  @override
  String get interlockPuzzleTitle => 'Interlock Puzzle';

  @override
  String get interlockPuzzleSubtitle =>
      'Disassemble or assemble complex interlocking blocks in the correct sequence.';

  @override
  String get interlockPuzzleCongrats =>
      'Logical deconstruction! You\'ve unraveled the puzzle perfectly.';

  @override
  String get pathIntersectTitle => 'Path Intersect';

  @override
  String get pathIntersectSubtitle =>
      'Navigate multiple paths simultaneously to reach their respective targets without collision.';

  @override
  String get pathIntersectCongrats =>
      'Synchronized navigation! You\'ve reached all targets flawlessly.';

  @override
  String get negativeSpaceDetectionTitle => 'Negative Space';

  @override
  String get negativeSpaceDetectionSubtitle =>
      'Identify the shape formed by the empty space between objects.';

  @override
  String get negativeSpaceDetectionCongrats =>
      'Keen perception! You\'ve mastered the art of seeing what\'s not there.';

  @override
  String get compassMazeTitle => 'Compass Maze';

  @override
  String get compassMazeSubtitle =>
      'Navigate a maze where movement directions change based on your compass orientation.';

  @override
  String get compassMazeCongrats =>
      'Expert navigation! You\'ve found the exit through the shifting directions.';

  @override
  String get complexFoldingNetsTitle => 'Folding Nets';

  @override
  String get complexFoldingNetsSubtitle =>
      'Determine which complex 3D shape will be formed by folding a non-standard 2D net.';

  @override
  String get complexFoldingNetsCongrats =>
      'Advanced folding logic! You\'ve successfully visualized the 3D form.';

  @override
  String get compassMazeMessage => 'Navigate the maze using the compass.';

  @override
  String get negativeSpaceDetectionMessage =>
      'Identify the hidden object in the space.';
}
