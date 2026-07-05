import 'dart:math';

class PalindromeBuilderEngine {
  final List<PalindromeTask> _tasks = [
    PalindromeTask(incomplete: 'RACEC__', solution: 'AR', display: 'RACEC..'),
    PalindromeTask(incomplete: 'MAD__', solution: 'AM', display: 'MAD..'),
    PalindromeTask(incomplete: 'LEV__', solution: 'EL', display: 'LEV..'),
    PalindromeTask(incomplete: 'REVI__R', solution: 'VE', display: 'REVI..R'), // REVIVER
    PalindromeTask(incomplete: 'ROT__', solution: 'OR', display: 'ROT..'),
    PalindromeTask(incomplete: 'KA__K', solution: 'YA', display: 'KA..K'),
    PalindromeTask(incomplete: 'DE__D', solution: 'IE', display: 'DE..D'),
    PalindromeTask(incomplete: 'RE__R', solution: 'FE', display: 'RE..R'),
    PalindromeTask(incomplete: 'CI__C', balance: 'VI', solution: 'VI', display: 'CI..C'), // CIVIC
    PalindromeTask(incomplete: 'RA__R', solution: 'DA', display: 'RA..R'), // RADAR
    PalindromeTask(incomplete: 'NO__N', solution: 'O', display: 'NO.N'), // NOON
    PalindromeTask(incomplete: 'TEN__', solution: 'ET', display: 'TEN..'), // TENET
    PalindromeTask(incomplete: 'SOL__', solution: 'OS', display: 'SOL..'), // SOLOS
  ];

  PalindromeTask getRandomTask() {
    return _tasks[Random().nextInt(_tasks.length)];
  }

  bool checkSolution(String guess, String solution) {
    return guess.trim().toUpperCase() == solution.toUpperCase();
  }
}

class PalindromeTask {
  final String incomplete;
  final String solution;
  final String display;
  final String? balance;

  PalindromeTask({
    required this.incomplete,
    required this.solution,
    required this.display,
    this.balance,
  });
}
