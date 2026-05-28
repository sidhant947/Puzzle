import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'target_number_engine.dart';

part 'target_number_provider.g.dart';

class TargetNumberState {
  final List<int> numbers;
  final List<bool> usedIndexes;
  final int target;
  final String currentExpression;
  final List<String> history;
  final double? currentResult;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  TargetNumberState({
    required this.numbers,
    required this.usedIndexes,
    required this.target,
    this.currentExpression = '',
    this.history = const [],
    this.currentResult,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  TargetNumberState copyWith({
    List<int>? numbers,
    List<bool>? usedIndexes,
    int? target,
    String? currentExpression,
    List<String>? history,
    double? currentResult,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return TargetNumberState(
      numbers: numbers ?? this.numbers,
      usedIndexes: usedIndexes ?? this.usedIndexes,
      target: target ?? this.target,
      currentExpression: currentExpression ?? this.currentExpression,
      history: history ?? this.history,
      currentResult: currentResult ?? this.currentResult,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class TargetNumberNotifier extends _$TargetNumberNotifier {
  final _engine = TargetNumberEngine();

  @override
  TargetNumberState build() {
    return TargetNumberState(
      numbers: [],
      usedIndexes: [],
      target: 24,
      isLoading: true,
    );
  }

  void initGame() {
    final puzzle = _engine.generatePuzzle();
    state = TargetNumberState(
      numbers: puzzle['numbers'],
      usedIndexes: List.filled(puzzle['numbers'].length, false),
      target: puzzle['target'],
      isLoading: false,
    );
  }

  void onNumberPressed(int index) {
    if (state.isGameOver || state.usedIndexes[index]) return;
    
    // Can only press number if expression is empty or ends with an operator or opening bracket
    if (state.currentExpression.isNotEmpty) {
      final lastChar = state.currentExpression[state.currentExpression.length - 1];
      if (!_isOperator(lastChar) && lastChar != '(') {
        return;
      }
    }

    final newUsed = List<bool>.from(state.usedIndexes);
    newUsed[index] = true;

    final val = state.numbers[index].toString();
    final newExpr = state.currentExpression + val;
    
    state = state.copyWith(
      currentExpression: newExpr,
      usedIndexes: newUsed,
      history: [...state.history, 'num:$index'],
    );

    _evaluate();
  }

  void onOperatorPressed(String op) {
    if (state.isGameOver) return;
    
    // Can only press operator if expression ends with a number or closing bracket
    if (state.currentExpression.isEmpty) return;
    final lastChar = state.currentExpression[state.currentExpression.length - 1];
    if (_isOperator(lastChar) || lastChar == '(') return;

    state = state.copyWith(
      currentExpression: state.currentExpression + op,
      history: [...state.history, 'op:$op'],
    );
    _evaluate();
  }

  void onBracketPressed(String bracket) {
    if (state.isGameOver) return;
    
    final expr = state.currentExpression;
    if (bracket == '(') {
      if (expr.isNotEmpty && !_isOperator(expr[expr.length - 1]) && expr[expr.length - 1] != '(') return;
    } else {
      if (expr.isEmpty || (_isOperator(expr[expr.length - 1]) || expr[expr.length - 1] == '(')) return;
      // Check for matching opening bracket
      int openCount = 0;
      int closeCount = 0;
      for (int i = 0; i < expr.length; i++) {
        if (expr[i] == '(') openCount++;
        if (expr[i] == ')') closeCount++;
      }
      if (closeCount >= openCount) return;
    }

    state = state.copyWith(
      currentExpression: state.currentExpression + bracket,
      history: [...state.history, 'bracket:$bracket'],
    );
    _evaluate();
  }

  void onUndo() {
    if (state.isGameOver || state.history.isEmpty) return;
    
    final lastAction = state.history.last;
    final newHistory = state.history.sublist(0, state.history.length - 1);
    
    String newExpr = state.currentExpression;
    List<bool> newUsed = List<bool>.from(state.usedIndexes);

    if (lastAction.startsWith('num:')) {
      int index = int.parse(lastAction.split(':')[1]);
      newUsed[index] = false;
      newExpr = newExpr.substring(0, newExpr.length - state.numbers[index].toString().length);
    } else if (lastAction.startsWith('op:')) {
      newExpr = newExpr.substring(0, newExpr.length - 1);
    } else if (lastAction.startsWith('bracket:')) {
      newExpr = newExpr.substring(0, newExpr.length - 1);
    }

    state = state.copyWith(
      currentExpression: newExpr,
      usedIndexes: newUsed,
      history: newHistory,
    );
    _evaluate();
  }

  void onClear() {
    if (state.isGameOver) return;
    state = state.copyWith(
      currentExpression: '',
      usedIndexes: List.filled(state.numbers.length, false),
      history: [],
      currentResult: null,
    );
  }

  bool _isOperator(String char) => ['+', '-', '*', '/'].contains(char);

  void _evaluate() {
    if (state.currentExpression.isEmpty) {
      state = state.copyWith(currentResult: null);
      return;
    }

    // Basic evaluation logic
    // For a smoother UX, we can use a library or a simple shunting-yard + evaluator.
    // Since we don't have math_expressions package, let's implement a simple one or 
    // restrict input to a sequence that's easy to evaluate.
    
    // Actually, let's just use a simple recursive descent parser for basic math.
    try {
      final result = _Parser(state.currentExpression).parse();
      state = state.copyWith(currentResult: result);
      
      final allUsed = state.usedIndexes.every((used) => used);
      final isCorrect = (result - state.target).abs() < 1e-6;

      // Check for victory: all numbers used AND result == target
      if (allUsed && isCorrect) {
        state = state.copyWith(isGameOver: true, isGameWon: true);
      } else if (allUsed && !isCorrect) {
        // Optional: Trigger a vibration or state update for 'wrong full expression'
      }
    } catch (_) {
      state = state.copyWith(currentResult: null);
    }
  }
}

class _Parser {
  final String input;
  int pos = 0;

  _Parser(this.input);

  double parse() {
    double result = _expression();
    if (pos < input.length) throw Exception('Unexpected character');
    return result;
  }

  double _expression() {
    double result = _term();
    while (pos < input.length) {
      if (input[pos] == '+') {
        pos++;
        result += _term();
      } else if (input[pos] == '-') {
        pos++;
        result -= _term();
      } else {
        break;
      }
    }
    return result;
  }

  double _term() {
    double result = _factor();
    while (pos < input.length) {
      if (input[pos] == '*') {
        pos++;
        result *= _factor();
      } else if (input[pos] == '/') {
        pos++;
        result /= _factor();
      } else {
        break;
      }
    }
    return result;
  }

  double _factor() {
    if (pos >= input.length) throw Exception('Unexpected end of input');
    if (input[pos] == '(') {
      pos++;
      double result = _expression();
      if (pos >= input.length || input[pos] != ')') throw Exception('Expected )');
      pos++;
      return result;
    } else {
      String numStr = '';
      while (pos < input.length && (input[pos].contains(RegExp(r'[0-9]')) || input[pos] == '.')) {
        numStr += input[pos];
        pos++;
      }
      if (numStr.isEmpty) throw Exception('Expected number');
      return double.parse(numStr);
    }
  }
}
