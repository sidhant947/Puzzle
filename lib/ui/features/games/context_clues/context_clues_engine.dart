class ClueQuestion {
  final String sentence;
  final String clue;
  final String correctWord;
  final List<String> options;

  const ClueQuestion({
    required this.sentence,
    required this.clue,
    required this.correctWord,
    required this.options,
  });
}

class ContextCluesEngine {
  final Map<int, List<ClueQuestion>> _questionsPool = {
    1: [
      const ClueQuestion(
        sentence: "The soup was too ___ to eat right away, so we let it cool down.",
        clue: "High in temperature.",
        correctWord: "hot",
        options: ["hot", "cold", "spicy", "sweet"],
      ),
      const ClueQuestion(
        sentence: "He was so ___ that he fell asleep during the movie.",
        clue: "Needing rest or sleep.",
        correctWord: "tired",
        options: ["tired", "awake", "happy", "angry"],
      ),
      const ClueQuestion(
        sentence: "The kitten was so ___ that it could fit inside a teacup.",
        clue: "Very small.",
        correctWord: "tiny",
        options: ["tiny", "huge", "fluffy", "loud"],
      ),
    ],
    2: [
      const ClueQuestion(
        sentence: "The scientist made a ___ discovery that changed the field forever.",
        clue: "Extremely important or significant.",
        correctWord: "breakthrough",
        options: ["breakthrough", "trivial", "mistake", "delay"],
      ),
      const ClueQuestion(
        sentence: "She was very ___ about sharing her personal details with strangers.",
        clue: "Careful to avoid danger or risks.",
        correctWord: "cautious",
        options: ["cautious", "reckless", "eager", "friendly"],
      ),
      const ClueQuestion(
        sentence: "The ancient ruins were incredibly ___, showing years of decay.",
        clue: "Extremely old.",
        correctWord: "ancient",
        options: ["ancient", "modern", "clean", "sturdy"],
      ),
    ],
    3: [
      const ClueQuestion(
        sentence: "His ___ attention to detail made him an excellent watchmaker.",
        clue: "Showing great attention to detail; precise.",
        correctWord: "meticulous",
        options: ["meticulous", "careless", "hasty", "ordinary"],
      ),
      const ClueQuestion(
        sentence: "The beautiful sunset was ___, lasting only a few fleeting minutes.",
        clue: "Lasting for a very short time; transient.",
        correctWord: "ephemeral",
        options: ["ephemeral", "permanent", "eternal", "tedious"],
      ),
      const ClueQuestion(
        sentence: "She tried to ___ the tense situation with a lighthearted joke.",
        clue: "Make less intense, severe, or hostile.",
        correctWord: "defuse",
        options: ["defuse", "ignite", "ignore", "complicate"],
      ),
    ],
    4: [
      const ClueQuestion(
        sentence: "The instructions were so ___ that everyone interpreted them differently.",
        clue: "Open to more than one interpretation; unclear.",
        correctWord: "ambiguous",
        options: ["ambiguous", "precise", "lengthy", "simple"],
      ),
      const ClueQuestion(
        sentence: "Since they already had three backups, the fourth one was deemed ___.",
        clue: "Not or no longer needed or useful; superfluous.",
        correctWord: "redundant",
        options: ["redundant", "essential", "deficient", "unique"],
      ),
      const ClueQuestion(
        sentence: "The speaker's voice was extremely ___ and put the audience to sleep.",
        clue: "Dull, tedious, and repetitious; lacking variety.",
        correctWord: "monotonous",
        options: ["monotonous", "vibrant", "loud", "clear"],
      ),
    ],
    5: [
      const ClueQuestion(
        sentence: "Smartphones have become ___, found in almost every corner of the globe.",
        clue: "Present, appearing, or found everywhere.",
        correctWord: "ubiquitous",
        options: ["ubiquitous", "scarce", "obsolete", "localized"],
      ),
      const ClueQuestion(
        sentence: "A harsh ___ of drilling, hammering, and shouting filled the site.",
        clue: "A harsh, discordant mixture of sounds.",
        correctWord: "cacophony",
        options: ["cacophony", "symphony", "harmony", "silence"],
      ),
      const ClueQuestion(
        sentence: "She was ___ by the complex puzzle, unable to find a logical solution.",
        clue: "Completely baffled or perplexed.",
        correctWord: "bewildered",
        options: ["bewildered", "enlightened", "composed", "unimpressed"],
      ),
    ],
  };

  List<ClueQuestion> generateQuestionsForLevel(int level) {
    // If level exceeds 5, cap it at 5
    final levelKey = level > 5 ? 5 : level;
    final questions = _questionsPool[levelKey] ?? [];
    // Return a copy of the questions with their options shuffled
    return questions.map((q) {
      return ClueQuestion(
        sentence: q.sentence,
        clue: q.clue,
        correctWord: q.correctWord,
        options: List<String>.from(q.options)..shuffle(),
      );
    }).toList();
  }

  bool validateAnswer(ClueQuestion question, String answer) {
    return question.correctWord.toLowerCase() == answer.toLowerCase();
  }
}
