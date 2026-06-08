import 'dart:math';

enum PartOfSpeech { noun, verb, adjective }

class GrammarWord {
  final String word;
  final PartOfSpeech type;

  GrammarWord(this.word, this.type);
}

class GrammarSortEngine {
  final Random _random = Random();

  final List<GrammarWord> _words = [
    // Nouns
    GrammarWord('MOUNTAIN', PartOfSpeech.noun),
    GrammarWord('COMPUTER', PartOfSpeech.noun),
    GrammarWord('HOSPITAL', PartOfSpeech.noun),
    GrammarWord('ELEPHANT', PartOfSpeech.noun),
    GrammarWord('LIBRARY', PartOfSpeech.noun),
    GrammarWord('FRIENDSHIP', PartOfSpeech.noun),
    GrammarWord('OCEAN', PartOfSpeech.noun),
    GrammarWord('GALAXY', PartOfSpeech.noun),
    GrammarWord('THOUGHT', PartOfSpeech.noun),
    GrammarWord('PIZZA', PartOfSpeech.noun),
    // Verbs
    GrammarWord('RUN', PartOfSpeech.verb),
    GrammarWord('EXPLORE', PartOfSpeech.verb),
    GrammarWord('CELEBRATE', PartOfSpeech.verb),
    GrammarWord('NAVIGATE', PartOfSpeech.verb),
    GrammarWord('THINK', PartOfSpeech.verb),
    GrammarWord('CREATE', PartOfSpeech.verb),
    GrammarWord('DANCE', PartOfSpeech.verb),
    GrammarWord('STUDY', PartOfSpeech.verb),
    GrammarWord('CHALLENGE', PartOfSpeech.verb),
    GrammarWord('IMAGINE', PartOfSpeech.verb),
    // Adjectives
    GrammarWord('BEAUTIFUL', PartOfSpeech.adjective),
    GrammarWord('BRILLIANT', PartOfSpeech.adjective),
    GrammarWord('ANCIENT', PartOfSpeech.adjective),
    GrammarWord('ENERGETIC', PartOfSpeech.adjective),
    GrammarWord('MYSTERIOUS', PartOfSpeech.adjective),
    GrammarWord('GIGANTIC', PartOfSpeech.adjective),
    GrammarWord('FRAGILE', PartOfSpeech.adjective),
    GrammarWord('SUCCESSFUL', PartOfSpeech.adjective),
    GrammarWord('BRAVE', PartOfSpeech.adjective),
    GrammarWord('DILIGENT', PartOfSpeech.adjective),
  ];

  GrammarWord nextWord() {
    return _words[_random.nextInt(_words.length)];
  }
}
