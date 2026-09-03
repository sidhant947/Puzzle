// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Головоломки';

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
  String get keepScreenAwake => 'Keep Screen Awake';

  @override
  String get keepScreenAwakeDescription =>
      'Prevent screen from turning off during gameplay';

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
  String get orbitTapTapToHit => 'Нажмите, когда шар входит в ворота';

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
  String get shapeRectangle => 'ПРЯМОУГОЛЬНИК';

  @override
  String get shapeEllipse => 'ЭЛЛИПС';

  @override
  String get shapeTrapezoid => 'ТРАПЕЦИЯ';

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
    return 'Вы заполнили таблицу за $arg0.\nПродолжайте практиковаться, чтобы расширить периферическое зрение!';
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
    return 'Попадания: $arg0, Промахи: $arg1\nЛожные срабатывания: $arg2';
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
    return '$arg0: $arg1\n$arg2';
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
    return 'Вы разгадали код!\nЗагаданное слово: $arg0';
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
  String get laserLinkTitle => 'Лазерная связь';

  @override
  String get laserLinkSubtitle =>
      'Вращайте зеркала, чтобы отражать лазеры и запитать все цели.';

  @override
  String get laserLinkCongrats =>
      'Прецизионное отражение! Вы успешно запитали всю сетку.';

  @override
  String get crossSectionSliceTitle => 'Поперечное сечение';

  @override
  String get crossSectionSliceSubtitle =>
      'Выберите правильное 2D-сечение 3D-объекта под определенным углом.';

  @override
  String get crossSectionSliceCongrats =>
      'Невероятная 3D-визуализация! Вы видели эту фигуру насквозь.';

  @override
  String get shadowPivotTitle => 'Поворот тени';

  @override
  String get shadowPivotCongrats =>
      'Динамическое пространственное мышление! Вы покорили свет и тень.';

  @override
  String get shadowPivotSubtitle =>
      'Предскажите тень, отбрасываемую 3D-объектом при его вращении вокруг разных осей.';

  @override
  String get interlockPuzzleTitle => 'Головоломка с зацеплением';

  @override
  String get interlockPuzzleSubtitle =>
      'Разберите или соберите сложные переплетающиеся блоки в правильной последовательности.';

  @override
  String get interlockPuzzleCongrats =>
      'Логическая деконструкция! Вы идеально разгадали головоломку.';

  @override
  String get pathIntersectTitle => 'Пересечение путей';

  @override
  String get pathIntersectSubtitle =>
      'Двигайтесь по нескольким путям одновременно, чтобы достичь соответствующих целей без столкновений.';

  @override
  String get pathIntersectCongrats =>
      'Синхронная навигация! Вы безупречно достигли всех целей.';

  @override
  String get negativeSpaceDetectionTitle => 'Отрицательное пространство';

  @override
  String get negativeSpaceDetectionSubtitle =>
      'Определите форму, образованную пустым пространством между объектами.';

  @override
  String get negativeSpaceDetectionCongrats =>
      'Острое восприятие! Вы овладели искусством видеть то, чего нет.';

  @override
  String get compassMazeTitle => 'Лабиринт с компасом';

  @override
  String get compassMazeSubtitle =>
      'Пройдите лабиринт, в котором направления движения меняются в зависимости от ориентации вашего компаса.';

  @override
  String get compassMazeCongrats =>
      'Экспертная навигация! Вы нашли выход, несмотря на меняющиеся направления.';

  @override
  String get complexFoldingNetsTitle => 'Развертки';

  @override
  String get complexFoldingNetsSubtitle =>
      'Определите, какая сложная 3D-фигура получится при складывании нестандартной 2D-развертки.';

  @override
  String get complexFoldingNetsCongrats =>
      'Продвинутая логика складывания! Вы успешно визуализировали 3D-форму.';

  @override
  String get compassMazeMessage => 'Навигация по лабиринту с помощью компаса.';

  @override
  String get negativeSpaceDetectionMessage =>
      'Найдите скрытый объект в пространстве.';

  @override
  String get shikakuTitle => 'Шикаку';

  @override
  String get shikakuSubtitle =>
      'РАЗДЕЛИТЕ СЕТКУ НА КВАДРАТЫ И ПРЯМОУГОЛЬНИКИ, СООТВЕТСТВУЮЩИЕ ЦИФРАМ.';

  @override
  String get countdownMathTitle => 'Математический обратный отсчет';

  @override
  String get countdownMathSubtitle =>
      'ОБЪЕДИНЯЙТЕ СЛУЧАЙНЫЕ ЦИФРЫ, ЧТОБЫ РАССЧИТАТЬ ТРЕХЗНАЧНУЮ ЦЕЛЬ.';

  @override
  String get narrativeRecallTitle => 'Повествовательное воспоминание';

  @override
  String get narrativeRecallSubtitle =>
      'ПРОЧИТАЙТЕ ИСТОРИЮ И ВСПОМНИТЕ КОНКРЕТНЫЕ КОЛИЧЕСТВЕННЫЕ И ФАКТИЧЕСКИЕ ПОДРОБНОСТИ.';

  @override
  String get shellGameTitle => 'Игра в ракушки';

  @override
  String get shellGameSubtitle =>
      'ОТСЛЕЖИВАЙТЕ СКРЫТЫЙ ШАР, ПОКА ПЕРАСАЮЩИЕ ЧАШКИ МЕНЯЮТСЯ МЕСТАМИ.';

  @override
  String get typoglycemiaDecoderTitle => 'Декодер типогликемии';

  @override
  String get typoglycemiaDecoderSubtitle =>
      'БЫСТРО РАЗБИРАЙТЕ И ПРОЧИТАЙТЕ ПЕРЕМЕШАННЫЕ ПРЕДЛОЖЕНИЯ.';

  @override
  String get shapeShifterTitle => 'Изменитель формы';

  @override
  String get shapeShifterSubtitle =>
      'Коснитесь целевой комбинации формы и цвета.';

  @override
  String get gokigenNanameTitle => 'Гокиген Нанаме';

  @override
  String get gokigenNanameSubtitle =>
      'Проведите диагонали, чтобы соединить точки без петель.';

  @override
  String get matrixMultiplierTitle => 'Матричный множитель';

  @override
  String get matrixMultiplierSubtitle =>
      'Выберите строку и столбец для умножения до целевого значения.';

  @override
  String get wordAssociationRecallTitle => 'Словесная ассоциация';

  @override
  String get wordAssociationRecallSubtitle =>
      'Вспомните по памяти парные словесные ассоциации.';

  @override
  String get gearRotationTitle => 'Вращение шестерни';

  @override
  String get gearRotationSubtitle =>
      'Предскажите направление вращения последней шестерни.';

  @override
  String get wordWheelTitle => 'Слово Колесо';

  @override
  String get wordWheelSubtitle =>
      'Составляйте слова, используя буквы на круге, включая центральную букву.';

  @override
  String get oddEvenFlashTitle => 'Нечетно-четная вспышка';

  @override
  String get oddEvenFlashSubtitle =>
      'Быстро сопоставьте четность чисел с правилом цвета.';

  @override
  String get norinoriTitle => 'Норинори';

  @override
  String get norinoriSubtitle =>
      'Заштрихуйте ровно две соединенные клетки в каждой комнате.';

  @override
  String get algebraicBalanceTitle => 'Алгебраический баланс';

  @override
  String get algebraicBalanceSubtitle =>
      'Решите уравнения, чтобы найти целевую сумму.';

  @override
  String get patternSequenceDrawTitle => 'Вызов шаблонов';

  @override
  String get patternSequenceDrawSubtitle =>
      'Повторите последовательность анимированных путей на сетке.';

  @override
  String get tangramTitle => 'Танграм-головоломка';

  @override
  String get tangramSubtitle =>
      'Расположите фигуры так, чтобы заполнить целевой силуэт.';

  @override
  String get semanticAssociationTitle => 'Слово ассоциации';

  @override
  String get semanticAssociationSubtitle =>
      'Найдите слово, соединяющее все три подсказки.';

  @override
  String get peripheralFocusTitle => 'Периферийный фокус';

  @override
  String get peripheralFocusSubtitle =>
      'Реагируйте на мигающие боковые панели во время решения математических задач.';

  @override
  String get masyuTitle => 'Масю Петля';

  @override
  String get masyuSubtitle =>
      'Нарисуйте одну петлю, соответствующую правилам круга Масью.';

  @override
  String get mathMazeTitle => 'Математический лабиринт';

  @override
  String get mathMazeSubtitle => 'Проследите путь, который дает целевую сумму.';

  @override
  String get storyBuilderTitle => 'Создатель историй';

  @override
  String get storyBuilderSubtitle =>
      'Восстановите хронологическую последовательность рассказа.';

  @override
  String get mirrorMazeTitle => 'Зеркальный лабиринт';

  @override
  String get mirrorMazeSubtitle =>
      'Перенаправьте лазерный луч с помощью диагональных зеркал.';

  @override
  String get wordGridConnectionTitle => 'Словесные связи';

  @override
  String get wordGridConnectionSubtitle =>
      'Сгруппируйте 16 слов в четыре категории по четыре.';

  @override
  String get shapeShifterPeripheralTitle => 'Периферийные формы';

  @override
  String get shapeShifterPeripheralSubtitle =>
      'Отслеживайте изменения периферийной формы, сопоставляя центральные значения.';

  @override
  String get soundWaveMatchTitle => 'Звуковая волна';

  @override
  String get soundWaveMatchSubtitle =>
      'Нажмите, когда частота зрительных волн совпадет с изменением высоты звука.';

  @override
  String get multiTrackCounterTitle => 'Многодорожечный счетчик';

  @override
  String get multiTrackCounterSubtitle =>
      'Нажмите, когда любой счетчик увеличится до целевого множителя.';

  @override
  String get colorWordMatchUpTitle => 'Согласование цветов';

  @override
  String get colorWordMatchUpSubtitle =>
      'Определите, совпадают ли два цветных слова, основываясь на изменяющихся правилах.';

  @override
  String get signalAndNoiseTitle => 'Сигнал и шум';

  @override
  String get signalAndNoiseSubtitle =>
      'Найдите целевые буквенно-цифровые символы, скрытые в статическом шуме.';

  @override
  String get focusTunnelTitle => 'Фокус-туннель';

  @override
  String get focusTunnelSubtitle =>
      'Найдите соответствующие символы на движущихся стенах туннеля.';

  @override
  String get targetPursuerTitle => 'Преследователь цели';

  @override
  String get targetPursuerSubtitle =>
      'Отслеживайте несколько перекрывающихся кругов и выберите исходную цель.';

  @override
  String get gridGazeTitle => 'Сетка взгляда';

  @override
  String get gridGazeSubtitle =>
      'Определите, какая ячейка сетки мигала с разной продолжительностью.';

  @override
  String get doubleTroubleTitle => 'Двойная проблема';

  @override
  String get doubleTroubleSubtitle =>
      'Играйте в две отдельные простые игры одновременно на разделенном экране.';

  @override
  String get syncRhythmTitle => 'Синхронизировать ритм';

  @override
  String get syncRhythmSubtitle =>
      'Нажмите, когда визуальное движение метронома соответствует синкопированному ритму.';

  @override
  String get ghostTapTitle => 'Призрачный кран';

  @override
  String get ghostTapSubtitle =>
      'Нажмите, когда невидимый пульс достигнет максимальной высоты.';

  @override
  String get attentionalRsvpTitle => 'Внимание, ответьте на приглашение';

  @override
  String get attentionalRsvpSubtitle =>
      'Определите цифры, появляющиеся в быстром мигании серийных букв.';

  @override
  String get colorMazeNavTitle => 'Цветной лабиринт Навигация';

  @override
  String get colorMazeNavSubtitle =>
      'Перемещайтесь по плиткам лабиринта, соответствующим цветам динамических разрешений.';

  @override
  String get dynamicSalienceTitle => 'Динамическая значимость';

  @override
  String get dynamicSalienceSubtitle =>
      'Найдите фигуру, движущуюся с несколько иной динамикой.';

  @override
  String get chalkAndTalkTitle => 'Мел и разговор';

  @override
  String get chalkAndTalkSubtitle =>
      'Введите слова, которые слышите в аудио, игнорируя визуальные отвлекающие факторы.';

  @override
  String get blinkDetectorTitle => 'Детектор моргания';

  @override
  String get blinkDetectorSubtitle =>
      'Коснитесь грани сетки, которая быстро мигнет дважды.';

  @override
  String get frequencyTapTitle => 'Отвод частоты';

  @override
  String get frequencyTapSubtitle =>
      'Нажмите кнопку, соответствующую целевой частоте светового импульса.';

  @override
  String get yajilinTitle => 'Yajilin';

  @override
  String get yajilinSubtitle =>
      'Расположите черные клетки и нарисуйте одну петлю, соответствующую подсказкам.';

  @override
  String get heyawakeTitle => 'Heyawake';

  @override
  String get heyawakeSubtitle =>
      'Комнаты с затененной сеткой без соседних черных ячеек.';

  @override
  String get gokigenVariantTitle => 'Вариант Гокигена';

  @override
  String get gokigenVariantSubtitle =>
      'Нарисуйте диагонали без петель, соответствующие количеству вершин.';

  @override
  String get sheepAndWolvesTitle => 'Овцы и волки';

  @override
  String get sheepAndWolvesSubtitle =>
      'Нарисуйте петлю, отделяющую овец от волков.';

  @override
  String get islandNurikabeTitle => 'Остров Нурикабе';

  @override
  String get islandNurikabeSubtitle =>
      'Формируйте острова, соответствующие числовым ограничениям размера.';

  @override
  String get shakashakaTitle => 'Шакашака Ректс';

  @override
  String get shakashakaSubtitle =>
      'Поместите треугольные плитки, чтобы сформировать прямоугольные белые области.';

  @override
  String get litsTetrisTitle => 'ЛИЦ Тетромино';

  @override
  String get litsTetrisSubtitle =>
      'Размещайте тетромино в комнатах, где нет соседних дубликатов.';

  @override
  String get tapaWallTitle => 'Тапа Стена';

  @override
  String get tapaWallSubtitle =>
      'Заштрихуйте ячейки, чтобы сформировать непрерывный узор черной стены.';

  @override
  String get triangularBridgesTitle => 'Треугольные мосты';

  @override
  String get triangularBridgesSubtitle =>
      'Соедините острова в трех направлениях, отвечая требованиям.';

  @override
  String get rippleEffectTitle => 'Волновой эффект';

  @override
  String get rippleEffectSubtitle =>
      'Заполните номера в комнатах, соблюдая ограничения по расстоянию.';

  @override
  String get suguruTectonicTitle => 'Сугуру Грид';

  @override
  String get suguruTectonicSubtitle =>
      'Заполните блоки комнат номерами от 1 до K, чтобы не было равных соседей.';

  @override
  String get tennerGridTitle => 'Теннер Грид';

  @override
  String get tennerGridSubtitle =>
      'Заполните строки цифрами 0–9, соответствующими итоговым значениям столбцов.';

  @override
  String get kakurasuSumsTitle => 'Суммы Какурасу';

  @override
  String get kakurasuSumsSubtitle =>
      'Заштрихуйте ячейки, чтобы они соответствовали взвешенным суммам индексов строк/столбцов.';

  @override
  String get corralLoopTitle => 'Загонная петля';

  @override
  String get corralLoopSubtitle =>
      'Нарисуйте один цикл, включающий числа, соответствующие видимости.';

  @override
  String get stostoneTitle => 'Стостоун Гравитация';

  @override
  String get stostoneSubtitle =>
      'Заштрихуйте ячейки, которые опускаются вниз, чтобы идеально заполнить нижние строки.';

  @override
  String get tripletsLogicTitle => 'Тройняшки трио';

  @override
  String get tripletsLogicSubtitle =>
      'Заполните сетку тремя фигурами, избегая фигур «три в ряд».';

  @override
  String get galaxiesSymTitle => 'Симметрия галактик';

  @override
  String get galaxiesSymSubtitle =>
      'Разделите сетку на вращательно-симметричные формы галактик.';

  @override
  String get matrixMultiplierMatchTitle => 'Сопоставитель матриц';

  @override
  String get matrixMultiplierMatchSubtitle =>
      'Умножьте значения строк и столбцов, чтобы они соответствовали целевому скалярному произведению.';

  @override
  String get primeFactorTreesTitle => 'Деревья простых факторов';

  @override
  String get primeFactorTreesSubtitle =>
      'Разложите составные числа на пары простых листьев.';

  @override
  String get vektorVectorTitle => 'вектор вектор';

  @override
  String get vektorVectorSubtitle =>
      'Масштабируйте векторы, чтобы их сумма попала в цель.';

  @override
  String get binomialMatchTitle => 'Биномиальное совпадение';

  @override
  String get binomialMatchSubtitle =>
      'Сопоставьте квадратичные формулы с факторизованными биномиальными значениями.';

  @override
  String get percentageShoppingTitle => 'Процент покупок';

  @override
  String get percentageShoppingSubtitle =>
      'Рассчитайте процент скидки и окончательную сумму заказа.';

  @override
  String get cryptoArithmeticTitle => 'Крипто-арифметика';

  @override
  String get cryptoArithmeticSubtitle =>
      'Взломать математические задачи шифра замены символов и цифр.';

  @override
  String get fractionalPizzaTitle => 'Дробная пицца';

  @override
  String get fractionalPizzaSubtitle =>
      'Разделите кусочки пиццы так, чтобы они соответствовали целевым долям суммы.';

  @override
  String get numberBondsTitle => 'Числовые облигации';

  @override
  String get numberBondsSubtitle =>
      'Свяжите значения узлов, чтобы они равнялись сумме целевого соединения.';

  @override
  String get gridSumLineTitle => 'Линия суммы сетки';

  @override
  String get gridSumLineSubtitle =>
      'Нарисуйте путь, значения которого точно соответствуют цели.';

  @override
  String get binaryScaleBalanceTitle => 'Баланс двоичной шкалы';

  @override
  String get binaryScaleBalanceSubtitle =>
      'Сбалансируйте десятичный вес, используя блоки степени двойки.';

  @override
  String get moduloPathTitle => 'Путь по модулю';

  @override
  String get moduloPathSubtitle =>
      'Обход ячеек сетки, соответствующих значениям остатка по модулю.';

  @override
  String get digitSwapEqTitle => 'Уравнения замены цифр';

  @override
  String get digitSwapEqSubtitle =>
      'Поменяйте местами отдельные цифры в уравнениях, чтобы исправить оба.';

  @override
  String get areaPerimeterMatchTitle => 'Площадь и периметр';

  @override
  String get areaPerimeterMatchSubtitle =>
      'Нарисуйте прямоугольники, соответствующие значениям целевой площади и периметра.';

  @override
  String get inequalityBalanceOpsTitle => 'Баланс неравенства';

  @override
  String get inequalityBalanceOpsSubtitle =>
      'Поместите символы неравенства между сложными математическими терминами.';

  @override
  String get graphCoordinatePlotTitle => 'Графический плоттер';

  @override
  String get graphCoordinatePlotSubtitle =>
      'Постройте координаты сетки, соответствующие линейным/квадратичным кривым.';

  @override
  String get baseConversionRunTitle => 'Базовая конверсия';

  @override
  String get baseConversionRunSubtitle =>
      'Преобразование значений между двоичными, десятичными, шестнадцатеричными и восьмеричными.';

  @override
  String get unitConverterProTitle => 'Конвертер единиц измерения';

  @override
  String get unitConverterProSubtitle =>
      'Отвечайте на быстрые преобразования единиц измерения в рамках ограничений по времени.';

  @override
  String get auditoryNBackTitle => 'Слуховой N-Back';

  @override
  String get auditoryNBackSubtitle =>
      'Совпадение произнесенных букв, услышанных N, отходит от памяти.';

  @override
  String get abstractPatternRecallTitle => 'Наложение узоров';

  @override
  String get abstractPatternRecallSubtitle =>
      'Реконструируйте многослойные красочные фигуры на основе изучения памяти.';

  @override
  String get roomInspectorTitle => 'Инспектор помещений';

  @override
  String get roomInspectorSubtitle =>
      'Определите модификации мебели, сделанные, когда экран был пуст.';

  @override
  String get voiceToFaceMatchTitle => 'Матч голоса и лица';

  @override
  String get voiceToFaceMatchSubtitle =>
      'Выберите правильное лицо, связанное с голосовым клипом.';

  @override
  String get spatialGridMemory3DTitle => '3D-пространственная память';

  @override
  String get spatialGridMemory3DSubtitle =>
      'Вспомните мигающие блоки во вращающейся сетке трехмерного куба.';

  @override
  String get sequenceStackTitle => 'Стек последовательностей';

  @override
  String get sequenceStackSubtitle =>
      'Реконструируйте добавление и удаление стопки пластин по порядку.';

  @override
  String get semanticCategoryRecallTitle => 'Отзыв категории';

  @override
  String get semanticCategoryRecallSubtitle =>
      'Определите изучаемые слова, соответствующие заданным целям категории.';

  @override
  String get gridDisplacementTitle => 'Смещение сетки';

  @override
  String get gridDisplacementSubtitle =>
      'Определите смещенные значки, сравнивая макет с оригиналом.';

  @override
  String get soundSequenceMatchTitle =>
      'Соответствие звуковой последовательности';

  @override
  String get soundSequenceMatchSubtitle =>
      'Повторяйте последовательности нот, сыгранных на виртуальной клавиатуре.';

  @override
  String get cardCountingMemoryTitle => 'Счетчик карт';

  @override
  String get cardCountingMemorySubtitle =>
      'Определите карты, которые уже раздавались в ходе непрерывных раздач.';

  @override
  String get directionsRecallTitle => 'Напоминание о маршруте';

  @override
  String get directionsRecallSubtitle =>
      'Перемещайтесь по сетке карт, сопоставляя направления пути из памяти.';

  @override
  String get eventTimelineMemoryTitle => 'Хронология событий';

  @override
  String get eventTimelineMemorySubtitle =>
      'Расположите карточки исторических/вымышленных событий в хронологическом порядке.';

  @override
  String get featureMatrixRecallTitle => 'Матрица функций';

  @override
  String get featureMatrixRecallSubtitle =>
      'Ответьте на запросы об атрибутах цвета и формы ячейки.';

  @override
  String get delayedMatchSampleTitle => 'Отложенный матч';

  @override
  String get delayedMatchSampleSubtitle =>
      'Сопоставьте целевой символ после решения математических отвлекающих факторов.';

  @override
  String get symbolDigitAssocTitle => 'Символ-цифра';

  @override
  String get symbolDigitAssocSubtitle =>
      'Решите листы перевода символов, соответствующие цифровым клавишам.';

  @override
  String get dualTaskMemoryTitle => 'Двойная память';

  @override
  String get dualTaskMemorySubtitle =>
      'Запоминайте наборы слов, решая быстрые арифметические задачи.';

  @override
  String get actionSequenceRecallTitle => 'Отзыв действий';

  @override
  String get actionSequenceRecallSubtitle =>
      'Повторите последовательность анимаций жестов персонажей по порядку.';

  @override
  String get tangramPolygonTitle => 'Танграм Фит';

  @override
  String get tangramPolygonSubtitle =>
      'Расположите многоугольники, чтобы заполнить контуры силуэта.';

  @override
  String get mazeNav3DTitle => '3D-навигация по лабиринту';

  @override
  String get mazeNav3DSubtitle =>
      'Перемещайтесь по маршрутам трехмерного изометрического лабиринта от первого лица.';

  @override
  String get isometricProjectionTitle => 'Изометрический проектор';

  @override
  String get isometricProjectionSubtitle =>
      'Сопоставьте 3D-фигуры блоков с ортогональными 2D-видами сверху/спереди.';

  @override
  String get polyominoPackingTitle => 'Полимино Упаковка';

  @override
  String get polyominoPackingSubtitle =>
      'Упакуйте случайные кусочки блоков полимино в целевые области.';

  @override
  String get spatialGridRotationTitle => 'Вращение пространственной сетки';

  @override
  String get spatialGridRotationSubtitle =>
      'Сопоставление 3D-блоков, повернутых по координатам оси.';

  @override
  String get wireLoopGameTitle => 'Проволочная петля';

  @override
  String get wireLoopGameSubtitle =>
      'Перетащите металлические кольца по проволочным шлицам без контакта.';

  @override
  String get origamiUnfoldTitle => 'Оригами Развернуть';

  @override
  String get origamiUnfoldSubtitle =>
      'Определите схемы дырокола после разгибания сложенных листов.';

  @override
  String get ropeTangleSolverTitle => 'Распутыватель веревок';

  @override
  String get ropeTangleSolverSubtitle =>
      'Перетащите узлы, чтобы разметить плоские графики с пересечением нулевых линий.';

  @override
  String get gridFitTetrisTitle => 'Решатель подгонки сетки';

  @override
  String get gridFitTetrisSubtitle =>
      'Располагайте статические блоки неправильной формы так, чтобы они соответствовали границам контейнера.';

  @override
  String get vectorGridAlignmentTitle => 'Векторное выравнивание';

  @override
  String get vectorGridAlignmentSubtitle =>
      'Масштабируйте и вращайте фигуры в соответствии с целями шаблона тени.';

  @override
  String get blockStackingPhysicsTitle => 'Укладка блоков';

  @override
  String get blockStackingPhysicsSubtitle =>
      'Складывайте панели блоков неправильной формы, уравновешивая гравитационный вес.';

  @override
  String get crossSectionMatch3DTitle => '3D-сечение';

  @override
  String get crossSectionMatch3DSubtitle =>
      'Определите геометрию двумерных срезов, вырезанных из трехмерных фигур.';

  @override
  String get symmetryPaintTitle => 'Симметричная краска';

  @override
  String get symmetryPaintSubtitle =>
      'Нарисуйте сегменты зеркального отображения, отражающиеся поперек осей симметрии.';

  @override
  String get rollingBlockBloxTitle => 'Роллинг Блок';

  @override
  String get rollingBlockBloxSubtitle =>
      'Катите кусочки блока так, чтобы они вертикально приземлялись в целевые пазы.';

  @override
  String get perspectiveShiftViewTitle => 'Сдвиг перспективы';

  @override
  String get perspectiveShiftViewSubtitle =>
      'Вращайте кластеры блоков, пока они не начнут писать буквы/слова.';

  @override
  String get networkFlowSphericalTitle => 'Сетевой поток';

  @override
  String get networkFlowSphericalSubtitle =>
      'Соедините потоки сетки при переносе цилиндрических координат.';

  @override
  String get layeredSilhouetteBlendTitle => 'Силуэтная смесь';

  @override
  String get layeredSilhouetteBlendSubtitle =>
      'Сложите цветные слои так, чтобы они соответствовали целевым полупрозрачным формам.';

  @override
  String get wordWheelPangramTitle => 'Словесные анаграммы';

  @override
  String get wordWheelPangramSubtitle =>
      'Составьте слова, содержащие центральные целевые буквы, из колес.';

  @override
  String get letterGridSwapperTitle => 'Переключатель букв';

  @override
  String get letterGridSwapperSubtitle =>
      'Поменяйте местами соседние плитки с буквами, чтобы заполнить слова строки и столбца.';

  @override
  String get synonymMatchTitle => 'Синоним совпадение';

  @override
  String get synonymMatchSubtitle =>
      'Сопоставьте целевые падающие слова с синонимами или антонимами.';

  @override
  String get vowelDropTitle => 'Падение гласных';

  @override
  String get vowelDropSubtitle =>
      'Расставьте гласные в координатных сетках, завершая слова.';

  @override
  String get letterBalanceScaleTitle => 'Шкала баланса слов';

  @override
  String get letterBalanceScaleSubtitle =>
      'Назовите слова, буквы которых обозначают балансировочные гири.';

  @override
  String get wordChainShiritoriTitle => 'Цепочка слов';

  @override
  String get wordChainShiritoriSubtitle =>
      'Свяжите циклы слов, начинающиеся с предыдущих буквенных выходов.';

  @override
  String get affixBuilderTitle => 'Конструктор аффиксов';

  @override
  String get affixBuilderSubtitle =>
      'Комбинируйте префиксы/суффиксы, чтобы создать целевые словари.';

  @override
  String get decipherCrypticCluesTitle => 'Загадочный расшифровщик';

  @override
  String get decipherCrypticCluesSubtitle =>
      'Решайте головоломки с игрой слов и расшифровывайте орфографические загадки.';

  @override
  String get boggleWordSearchTitle => 'Боггл Коннект';

  @override
  String get boggleWordSearchSubtitle =>
      'Прослеживайте соседние соединенные пути, чтобы найти скрытые слова.';

  @override
  String get idiomUnscrambleTitle => 'Идиома Расшифровка';

  @override
  String get idiomUnscrambleSubtitle =>
      'Расположите массивы зашифрованных слов так, чтобы они соответствовали значениям идиом.';

  @override
  String get letterPyramidsTitle => 'Буквенные пирамиды';

  @override
  String get letterPyramidsSubtitle =>
      'Стройте башни из слов, добавляя отдельные буквы-анаграммы на каждый уровень.';

  @override
  String get soundAlikeHomophonesTitle => 'Омофонные совпадения';

  @override
  String get soundAlikeHomophonesSubtitle =>
      'Определите правильное написание омофонов в предложениях.';

  @override
  String get wordGridSudokuTitle => 'Слово судоку';

  @override
  String get wordGridSudokuSubtitle =>
      'Мозаичные буквы в строках сетки образуют слова.';

  @override
  String get portmanteauFactoryTitle => 'Фабрика Портманто';

  @override
  String get portmanteauFactorySubtitle =>
      'Объединяйте смысловые компоненты, образуя сложные слова.';

  @override
  String get codedCrosswordsCodeTitle => 'Кодовые слова Кроссворд';

  @override
  String get codedCrosswordsCodeSubtitle =>
      'Решите кроссворды в сетке, сопоставляя цифровые коды.';

  @override
  String get wordSnakeTrailTitle => 'Слово Змея';

  @override
  String get wordSnakeTrailSubtitle =>
      'Проследите змееподобные следы букв, составляя тематические слова.';

  @override
  String get typingRhythmSpeedTitle => 'Ввод потока';

  @override
  String get typingRhythmSpeedSubtitle =>
      'Введите словари, соответствующие ритму метронома.';

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
  String get hideGame => 'Скрыть';

  @override
  String get unhideGame => 'Показать';

  @override
  String get favoriteGame => 'Избранное';

  @override
  String get unfavoriteGame => 'Удалить из избранного';

  @override
  String get hiddenGames => 'СКРЫТЫЕ ИГРЫ';

  @override
  String showHiddenGames(int count) {
    return 'Показать скрытые игры ($count)';
  }

  @override
  String get noHiddenGames => 'Нет скрытых игр';

  @override
  String get gameHidden => 'Игра скрыта';

  @override
  String get undo => 'Отмена';

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
  String get btnMatchColor => 'СОВПАДЕНИЕ ЦВЕТА';

  @override
  String get btnMatchWord => 'СОВПАДЕНИЕ СЛОВА';

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

  @override
  String get kurodokoTitle => 'Kurodoko';

  @override
  String get kurodokoSubtitle =>
      'Place black cells so numbers see the exact count of white cells.';

  @override
  String get kurodokoWinTitle => 'WHERE IS BLACK SOLVED!';

  @override
  String get kurodokoWinMessage =>
      'You mastered the visibility paths and isolated all black cells!';

  @override
  String get subitizingRushTitle => 'Subitize Rush';

  @override
  String get subitizingRushSubtitle =>
      'Instantly identify the quantity of flashed dots without counting.';

  @override
  String get subitizingRushWinTitle => 'RAPID VISION!';

  @override
  String get subitizingRushWinMessage =>
      'Your instant visual numerosity estimation is outstanding!';

  @override
  String get tapaTitle => 'Tapa';

  @override
  String get tapaSubtitle =>
      'Shade cells to form a continuous wall without 2x2 blocks.';

  @override
  String get tapaWinTitle => 'TAPA WALL COMPLETED!';

  @override
  String get tapaWinMessage =>
      'All numbered cell constraints perfectly satisfied!';

  @override
  String get exponentTowerTitle => 'Exponent Tower';

  @override
  String get exponentTowerSubtitle =>
      'Order dynamic power expressions from smallest to largest.';

  @override
  String get exponentTowerWinTitle => 'TOWER STACKED!';

  @override
  String get exponentTowerWinMessage =>
      'All power magnitudes calculated with perfect precision!';

  @override
  String get posnerSpatialCueingTitle => 'Spatial Cue';

  @override
  String get posnerSpatialCueingSubtitle =>
      'React swiftly to directional target appearances following spatial cues.';

  @override
  String get posnerSpatialCueingWinTitle => 'ALERT VISION!';

  @override
  String get posnerSpatialCueingWinMessage =>
      'Fast visual orienting and stimulus detection recorded!';

  @override
  String get gearTrainDirectionTitle => 'Gear Train';

  @override
  String get gearTrainDirectionSubtitle =>
      'Deduce the rotation direction of the target gear in the mechanical train.';

  @override
  String get gearTrainDirectionWinTitle => 'MECHANISM SOLVED!';

  @override
  String get gearTrainDirectionWinMessage =>
      'Kinematic gear rotational transmissions accurately traced!';

  @override
  String get continuousPairedAssociateTitle => 'Pair Associate';

  @override
  String get continuousPairedAssociateSubtitle =>
      'Memorize symbol pairs and recall the matching partner.';

  @override
  String get continuousPairedAssociateWinTitle => 'PAIRS LINKED!';

  @override
  String get continuousPairedAssociateWinMessage =>
      'Strong associative memory pathways established!';

  @override
  String get heyawakeWinTitle => 'ROOMS BALANCED!';

  @override
  String get heyawakeWinMessage =>
      'All room division rules and white path connections satisfied!';

  @override
  String get setTheoryVennTitle => 'Venn Sets';

  @override
  String get setTheoryVennSubtitle =>
      'Select the corresponding regions of the Venn diagram for the set formula.';

  @override
  String get setTheoryVennWinTitle => 'SET LOGIC MASTER!';

  @override
  String get setTheoryVennWinMessage =>
      'All set operations, unions, and intersections deduced flawlessly!';

  @override
  String get navonHierarchicalTitle => 'Navon Global';

  @override
  String get navonHierarchicalSubtitle =>
      'Identify either the large global letter or small local letters under prompt rules.';

  @override
  String get navonHierarchicalWinTitle => 'FOCUS SHARPENED!';

  @override
  String get navonHierarchicalWinMessage =>
      'Outstanding selective attention and global-local perception!';

  @override
  String get masyuWinTitle => 'MASYU LOOP SOLVED!';

  @override
  String get masyuWinMessage =>
      'All pearl turning and straight passage rules strictly satisfied!';

  @override
  String get primeGapHuntTitle => 'Prime Gap';

  @override
  String get primeGapHuntSubtitle =>
      'Calculate the arithmetic difference between consecutive prime numbers.';

  @override
  String get primeGapHuntWinTitle => 'GAP CALCULATED!';

  @override
  String get primeGapHuntWinMessage =>
      'Mastery of prime distribution and mental subtraction displayed!';

  @override
  String get yajilinWinTitle => 'YAJILIN SOLVED!';

  @override
  String get yajilinWinMessage =>
      'All arrow clue raycasts and orthogonal black cell separations satisfied!';

  @override
  String get algebraicInequalitySolverTitle => 'Inequality';

  @override
  String get algebraicInequalitySolverSubtitle =>
      'Solve linear single-variable algebraic inequalities swiftly.';

  @override
  String get algebraicInequalitySolverWinTitle => 'ALGEBRA EXPERT!';

  @override
  String get algebraicInequalitySolverWinMessage =>
      'Fast inequality reduction and algebraic balance achieved!';

  @override
  String get attentionalBlinkProbeTitle => 'Blink Probe';

  @override
  String get attentionalBlinkProbeSubtitle =>
      'Detect second target stimuli presented rapidly after primary targets.';

  @override
  String get attentionalBlinkProbeWinTitle => 'TEMPORAL FOCUS!';

  @override
  String get attentionalBlinkProbeWinMessage =>
      'Exceptional temporal visual processing across the blink refractory window!';

  @override
  String get modularClockArithmeticTitle => 'Clock Modulo';

  @override
  String get modularClockArithmeticSubtitle =>
      'Calculate cyclical clock time arithmetic under modulo 12 algebra.';

  @override
  String get modularClockArithmeticWinTitle => 'CLOCKWORK PRECISION!';

  @override
  String get modularClockArithmeticWinMessage =>
      'All modular hour shifts calculated with ease!';

  @override
  String get temporalOrderJudgmentTitle => 'Time Order';

  @override
  String get temporalOrderJudgmentSubtitle =>
      'Discriminate which of two millisecond-separated stimulus circles flashed first.';

  @override
  String get temporalOrderJudgmentWinTitle => 'ULTRA-FAST PERCEPTION!';

  @override
  String get temporalOrderJudgmentWinMessage =>
      'High-resolution temporal distinction demonstrated!';

  @override
  String get polyominoTilingTitle => 'Polyomino';

  @override
  String get polyominoTilingSubtitle =>
      'Rotate and assemble tetromino geometric shapes to tile the grid without gaps.';

  @override
  String get polyominoTilingWinTitle => 'GRID TILED!';

  @override
  String get polyominoTilingWinMessage =>
      'Seamless geometric spatial arrangement completed!';

  @override
  String get pythagoreanTripleBuilderTitle => 'Pythagoras';

  @override
  String get pythagoreanTripleBuilderSubtitle =>
      'Find the missing hypotenuse or leg value in integer Pythagorean triangles.';

  @override
  String get pythagoreanTripleBuilderWinTitle => 'GEOMETRY MASTER!';

  @override
  String get pythagoreanTripleBuilderWinMessage =>
      'All right-triangle integer triples rapidly solved!';

  @override
  String get visualSearchConjunctionTitle => 'Conj. Search';

  @override
  String get visualSearchConjunctionSubtitle =>
      'Quickly locate target shapes combining multiple feature dimensions (color and form).';

  @override
  String get visualSearchConjunctionWinTitle => 'CONJUNCTION FOCUS!';

  @override
  String get visualSearchConjunctionWinMessage =>
      'Flawless multi-feature parallel and serial visual search!';

  @override
  String get wireframe3DRotationTitle => 'Wireframe 3D';

  @override
  String get wireframe3DRotationSubtitle =>
      'Identify the correctly rotated 3D geometric wireframe following angular transformation.';

  @override
  String get wireframe3DRotationWinTitle => '3D ROTATION MASTER!';

  @override
  String get wireframe3DRotationWinMessage =>
      'Precise 3D mental rotation and spatial orientation demonstrated!';

  @override
  String get wordPairAssociateMemoryTitle => 'Word Pairs';

  @override
  String get wordPairAssociateMemorySubtitle =>
      'Memorize associated word connections and select the target paired with the cue.';

  @override
  String get wordPairAssociateMemoryWinTitle => 'ASSOCIATION MASTER!';

  @override
  String get wordPairAssociateMemoryWinMessage =>
      'Strong episodic associative memory retention achieved!';

  @override
  String get binaryMatrixRankTitle => 'Matrix Rank';

  @override
  String get binaryMatrixRankSubtitle =>
      'Determine the linear algebraic rank of the 3x3 binary matrix over Galois field GF(2).';

  @override
  String get binaryMatrixRankWinTitle => 'RANK COMPUTED!';

  @override
  String get binaryMatrixRankWinMessage =>
      'Exact linear independence and matrix rank determined!';

  @override
  String get visualCrowdingAcuityTitle => 'Visual Crowd';

  @override
  String get visualCrowdingAcuitySubtitle =>
      'Identify the opening direction of the center Landolt ring amid flanking distractors.';

  @override
  String get visualCrowdingAcuityWinTitle => 'SHARP PERCEPTION!';

  @override
  String get visualCrowdingAcuityWinMessage =>
      'Excellent foveal spatial resolution under visual crowding conditions!';

  @override
  String get probeDigitSpanTitle => 'Digit Probe';

  @override
  String get probeDigitSpanSubtitle =>
      'Observe a fast serial sequence of numbers and recall the item following the probe digit.';

  @override
  String get probeDigitSpanWinTitle => 'SERIAL PROBE MASTER!';

  @override
  String get probeDigitSpanWinMessage =>
      'Flawless short-term serial position memory retrieval!';

  @override
  String get abReversalOddballTitle => 'A-B Reversal';

  @override
  String get abReversalOddballSubtitle =>
      'Respond to target stimuli and dynamically switch response criteria upon rule reversal.';

  @override
  String get abReversalOddballWinTitle => 'FLEXIBILITY MASTER!';

  @override
  String get abReversalOddballWinMessage =>
      'Exceptional cognitive switching and perceptual flexibility demonstrated!';

  @override
  String get conundrumAnagramTitle => 'Conundrum';

  @override
  String get conundrumAnagramSubtitle =>
      'Unscramble all 9 letters to discover the hidden full dictionary word.';

  @override
  String get conundrumAnagramWinTitle => 'CONUNDRUM CRACKED!';

  @override
  String get conundrumAnagramWinMessage =>
      'All 9-letter anagram conundrums successfully unscrambled!';

  @override
  String get vectorDotProductTitle => 'Dot Product';

  @override
  String get vectorDotProductSubtitle =>
      'Calculate the algebraic inner product u • v = (u_x * v_x) + (u_y * v_y).';

  @override
  String get vectorDotProductWinTitle => 'INNER PRODUCT COMPUTED!';

  @override
  String get vectorDotProductWinMessage =>
      'Exact geometric and algebraic vector projections achieved!';

  @override
  String get stroopNumberSizeTitle => 'Size Stroop';

  @override
  String get stroopNumberSizeSubtitle =>
      'Compare either numerical magnitude or physical font size under Stroop interference.';

  @override
  String get stroopNumberSizeWinTitle => 'INHIBITION EXPERT!';

  @override
  String get stroopNumberSizeWinMessage =>
      'Flawless perceptual conflict resolution under size-congruity Stroop!';

  @override
  String get wordLadderStepTitle => 'Word Ladder';

  @override
  String get wordLadderStepSubtitle =>
      'Complete the single-letter transformation sequence between source and destination words.';

  @override
  String get wordLadderStepWinTitle => 'LADDER CLIMBED!';

  @override
  String get wordLadderStepWinMessage =>
      'All single-letter step transformations completed!';

  @override
  String get corsiBackwardSpanTitle => 'Corsi Backward';

  @override
  String get corsiBackwardSpanSubtitle =>
      'Observe a sequential spatial block tapping pattern and reproduce it in exact reverse order.';

  @override
  String get corsiBackwardSpanWinTitle => 'BACKWARD SPAN PRO!';

  @override
  String get corsiBackwardSpanWinMessage =>
      'Exceptional visuospatial working memory manipulation and reverse sequencing!';
}
