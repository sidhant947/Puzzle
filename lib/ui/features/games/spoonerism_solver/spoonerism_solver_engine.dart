import 'dart:math';

class SpoonerismSolverEngine {
  final List<SpoonerismTask> _tasks = [
    SpoonerismTask(spoonerism: 'TEASE MY CHEERS', original: 'TAME MY CHEESES', options: ['TAME MY CHEESES', 'RAISE MY BEERS', 'TASTE MY DEARS']),
    SpoonerismTask(spoonerism: 'A BLUSHING CROW', original: 'A CRUSHING BLOW', options: ['A CRUSHING BLOW', 'A RUSHING COW', 'A BRUSHING SHOW']),
    SpoonerismTask(spoonerism: 'FIGHTING A LIAR', original: 'LIGHTING A FIRE', options: ['LIGHTING A FIRE', 'BITING A PEAR', 'SIGHTING A BEAR']),
    SpoonerismTask(spoonerism: 'YOU HISSED MY MYSTERY LECTURE', original: 'YOU MISSED MY HISTORY LECTURE', options: ['YOU MISSED MY HISTORY LECTURE', 'YOU KISSED MY SISTER LECTURE', 'YOU LISTED MY VICTORY LECTURE']),
    SpoonerismTask(spoonerism: 'RUNNY BABBIT', original: 'BUNNY RABBIT', options: ['BUNNY RABBIT', 'FUNNY HABIT', 'SUNNY DAYBIT']),
    SpoonerismTask(spoonerism: 'JELLY BEANS', original: 'BELLY JEANS', options: ['BELLY JEANS', 'JELLY BEANS', 'KELLY TEANS']), // Wait, JELLY BEANS is normal. Spoonerism: BELLY JEANS -> JELLY BEANS
    SpoonerismTask(spoonerism: 'BELLY JEANS', original: 'JELLY BEANS', options: ['JELLY BEANS', 'KELLY TEANS', 'SHELLY DEANS']),
    SpoonerismTask(spoonerism: 'WAVE THE SAILS', original: 'SAVE THE WHALES', options: ['SAVE THE WHALES', 'PAVE THE TRAILS', 'GAVE THE SALES']),
    SpoonerismTask(spoonerism: 'CHIPPING THE FLANNEL', original: 'FLIPPING THE CHANNEL', options: ['FLIPPING THE CHANNEL', 'SHIPPING THE PANEL', 'CLIPPING THE MANNEL']),
    SpoonerismTask(spoonerism: 'KNOWING LEAN', original: 'LEAVING NOW', options: ['LEAVING NOW', 'GROWING BEAN', 'SHOWING MEAN']), // This one is a bit loose
    SpoonerismTask(spoonerism: 'SOUP OF THE DAY', original: 'DOUP OF THE SAY', options: ['DOUP OF THE SAY', 'DAY OF THE SOUP', 'SAY OF THE DOUP']), // Normal: DAY OF THE SOUP -> SAY OF THE DOUP? No.
  ];

  SpoonerismTask getRandomTask() {
    return _tasks[Random().nextInt(_tasks.length)];
  }

  bool checkAnswer(String selected, String correct) {
    return selected == correct;
  }
}

class SpoonerismTask {
  final String spoonerism;
  final String original;
  final List<String> options;

  SpoonerismTask({required this.spoonerism, required this.original, required this.options});
}
