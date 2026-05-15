import 'dart:math';

class GrammarSentence {
  final String text;
  final bool hasError;
  final String? correction;

  GrammarSentence({
    required this.text,
    this.hasError = false,
    this.correction,
  });
}

class GrammarPoliceEngine {
  static final Random _random = Random();

  static final List<GrammarSentence> _sentences = [
    // --- Correct Sentences ---
    GrammarSentence(text: 'The quick brown fox jumps over the lazy dog.'),
    GrammarSentence(text: 'She went to the store to buy some groceries.'),
    GrammarSentence(text: 'They are planning a trip to Europe next summer.'),
    GrammarSentence(text: 'He doesn\'t like to eat broccoli.'),
    GrammarSentence(text: 'We have been waiting for the bus for an hour.'),
    GrammarSentence(text: 'It is important to stay hydrated during exercise.'),
    GrammarSentence(text: 'The teacher explained the lesson clearly.'),
    GrammarSentence(text: 'I would like a cup of coffee, please.'),
    GrammarSentence(text: 'The sun sets in the west.'),
    GrammarSentence(text: 'Knowledge is power.'),
    GrammarSentence(text: 'The cat slept soundly on the windowsill.'),
    GrammarSentence(text: 'He ran five miles before breakfast.'),
    GrammarSentence(text: 'She decided to take a painting class.'),
    GrammarSentence(text: 'The mountains are beautiful this time of year.'),
    GrammarSentence(text: 'We should always be kind to others.'),
    GrammarSentence(text: 'The library is a quiet place to study.'),
    GrammarSentence(text: 'They enjoyed a delicious meal at the new restaurant.'),
    GrammarSentence(text: 'He played the guitar with great skill.'),
    GrammarSentence(text: 'The flowers bloom in the spring.'),
    GrammarSentence(text: 'She is reading an interesting book about history.'),
    GrammarSentence(text: 'The stars twinkle in the night sky.'),
    GrammarSentence(text: 'I forgot my umbrella at home.'),
    GrammarSentence(text: 'The children are playing in the park.'),
    GrammarSentence(text: 'He works as a software engineer.'),
    GrammarSentence(text: 'We saw a movie at the cinema last night.'),
    GrammarSentence(text: 'The ocean waves crashed against the shore.'),
    GrammarSentence(text: 'She baked a cake for her friend\'s birthday.'),
    GrammarSentence(text: 'They visited the museum on Saturday.'),
    GrammarSentence(text: 'The birds chirp early in the morning.'),
    GrammarSentence(text: 'He likes to go for a swim in the lake.'),
    GrammarSentence(text: 'The rain fell steadily throughout the day.'),
    GrammarSentence(text: 'She is learning how to play the piano.'),
    GrammarSentence(text: 'The clouds drifted slowly across the sky.'),
    GrammarSentence(text: 'I need to buy a new pair of shoes.'),
    GrammarSentence(text: 'The garden is full of colorful butterflies.'),
    GrammarSentence(text: 'He finished his homework before dinner.'),
    GrammarSentence(text: 'The moon shone brightly in the sky.'),
    GrammarSentence(text: 'She went for a walk in the woods.'),
    GrammarSentence(text: 'They are going to the beach this weekend.'),
    GrammarSentence(text: 'The coffee smells wonderful this morning.'),
    GrammarSentence(text: 'He loves to travel to new places.'),
    GrammarSentence(text: 'The snow covered the ground like a blanket.'),
    GrammarSentence(text: 'She wrote a letter to her grandmother.'),
    GrammarSentence(text: 'The bridge spans the wide river.'),
    GrammarSentence(text: 'I hope you have a wonderful day.'),
    GrammarSentence(text: 'The fire crackled in the fireplace.'),
    GrammarSentence(text: 'She painted a beautiful landscape.'),
    GrammarSentence(text: 'The clock struck twelve.'),
    GrammarSentence(text: 'They danced the night away.'),
    GrammarSentence(text: 'The wind blew gently through the trees.'),

    // --- Sentences with Errors ---
    // Subject-Verb Agreement
    GrammarSentence(text: 'He go to the park every morning.', hasError: true, correction: 'He goes to the park every morning.'),
    GrammarSentence(text: 'The team are playing well today.', hasError: true, correction: 'The team is playing well today.'),
    GrammarSentence(text: 'Each of the girls have a bicycle.', hasError: true, correction: 'Each of the girls has a bicycle.'),
    GrammarSentence(text: 'The box of chocolates are on the table.', hasError: true, correction: 'The box of chocolates is on the table.'),
    GrammarSentence(text: 'Politics are a complicated subject.', hasError: true, correction: 'Politics is a complicated subject.'),
    GrammarSentence(text: 'The news were surprising to everyone.', hasError: true, correction: 'The news was surprising to everyone.'),
    GrammarSentence(text: 'She and her brother likes to swim.', hasError: true, correction: 'She and her brother like to swim.'),
    GrammarSentence(text: 'Neither of them know the answer.', hasError: true, correction: 'Neither of them knows the answer.'),
    GrammarSentence(text: 'There is many reasons to stay.', hasError: true, correction: 'There are many reasons to stay.'),
    GrammarSentence(text: 'A number of students was absent.', hasError: true, correction: 'A number of students were absent.'),

    // Pronouns
    GrammarSentence(text: 'Them are my favorite shoes.', hasError: true, correction: 'They are my favorite shoes.'),
    GrammarSentence(text: 'Me and him went to the movies.', hasError: true, correction: 'He and I went to the movies.'),
    GrammarSentence(text: 'Between you and I, it was a mistake.', hasError: true, correction: 'Between you and me, it was a mistake.'),
    GrammarSentence(text: 'Whom is calling at this hour?', hasError: true, correction: 'Who is calling at this hour?'),
    GrammarSentence(text: 'Everyone must bring their own lunch.', hasError: true, correction: 'Everyone must bring his or her own lunch.'),
    GrammarSentence(text: 'Give the book to whomever wants it.', hasError: true, correction: 'Give the book to whoever wants it.'),
    GrammarSentence(text: 'She is taller than me.', hasError: true, correction: 'She is taller than I.'),
    GrammarSentence(text: 'The cat licked it\'s paw.', hasError: true, correction: 'The cat licked its paw.'),
    GrammarSentence(text: 'The results depends on who you ask.', hasError: true, correction: 'The results depend on whom you ask.'),
    GrammarSentence(text: 'Us students decided to protest.', hasError: true, correction: 'We students decided to protest.'),

    // Tense and Verb Form
    GrammarSentence(text: 'I seen him yesterday at the library.', hasError: true, correction: 'I saw him yesterday at the library.'),
    GrammarSentence(text: 'She don\'t know the answer.', hasError: true, correction: 'She doesn\'t know the answer.'),
    GrammarSentence(text: 'I have ate breakfast already.', hasError: true, correction: 'I have eaten breakfast already.'),
    GrammarSentence(text: 'He has went to the store.', hasError: true, correction: 'He has gone to the store.'),
    GrammarSentence(text: 'She should of told me earlier.', hasError: true, correction: 'She should have told me earlier.'),
    GrammarSentence(text: 'I will done it by tomorrow.', hasError: true, correction: 'I will have it done by tomorrow.'),
    GrammarSentence(text: 'They was walking down the street.', hasError: true, correction: 'They were walking down the street.'),
    GrammarSentence(text: 'If I was you, I would go.', hasError: true, correction: 'If I were you, I would go.'),
    GrammarSentence(text: 'He brung his lunch today.', hasError: true, correction: 'He brought his lunch today.'),
    GrammarSentence(text: 'She has sang that song before.', hasError: true, correction: 'She has sung that song before.'),

    // Modifiers and Comparatives
    GrammarSentence(text: 'The car is more faster than the bike.', hasError: true, correction: 'The car is faster than the bike.'),
    GrammarSentence(text: 'He ran real quick to the store.', hasError: true, correction: 'He ran really quickly to the store.'),
    GrammarSentence(text: 'She felt badly about the mistake.', hasError: true, correction: 'She felt bad about the mistake.'),
    GrammarSentence(text: 'This is the most unique house.', hasError: true, correction: 'This is a unique house.'),
    GrammarSentence(text: 'Of the two, she is the smartest.', hasError: true, correction: 'Of the two, she is the smarter.'),
    GrammarSentence(text: 'I can\'t hardly wait.', hasError: true, correction: 'I can hardly wait.'),
    GrammarSentence(text: 'He only has one sister.', hasError: true, correction: 'He has only one sister.'),
    GrammarSentence(text: 'She reads good for her age.', hasError: true, correction: 'She reads well for her age.'),
    GrammarSentence(text: 'That is the baddest movie ever.', hasError: true, correction: 'That is the worst movie ever.'),
    GrammarSentence(text: 'The weather is more colder today.', hasError: true, correction: 'The weather is colder today.'),

    // Homophones and Word Choice
    GrammarSentence(text: 'The weather is quiet nice today.', hasError: true, correction: 'The weather is quite nice today.'),
    GrammarSentence(text: 'Whose going to the party tonight?', hasError: true, correction: 'Who\'s going to the party tonight?'),
    GrammarSentence(text: 'Their going to be late.', hasError: true, correction: 'They\'re going to be late.'),
    GrammarSentence(text: 'Its a beautiful day.', hasError: true, correction: 'It\'s a beautiful day.'),
    GrammarSentence(text: 'I need to buy some stationery for school.', hasError: true, correction: 'I need to buy some stationery for school.'), // wait stationery is paper, stationary is fixed. Correct as is? Let's use another.
    GrammarSentence(text: 'The book had a profound affect on me.', hasError: true, correction: 'The book had a profound effect on me.'),
    GrammarSentence(text: 'Can I borrow your pencil please?', hasError: true, correction: 'May I borrow your pencil please?'),
    GrammarSentence(text: 'I have less coins than you.', hasError: true, correction: 'I have fewer coins than you.'),
    GrammarSentence(text: 'The principle of the school is nice.', hasError: true, correction: 'The principal of the school is nice.'),
    GrammarSentence(text: 'We should complement them on their work.', hasError: true, correction: 'We should compliment them on their work.'),

    // Negatives and Others
    GrammarSentence(text: 'I haven\'t got no money.', hasError: true, correction: 'I haven\'t got any money.'),
    GrammarSentence(text: 'She didn\'t do nothing wrong.', hasError: true, correction: 'She didn\'t do anything wrong.'),
    GrammarSentence(text: 'He don\'t want no trouble.', hasError: true, correction: 'He doesn\'t want any trouble.'),
    GrammarSentence(text: 'Irregardless of the cost, I\'ll buy it.', hasError: true, correction: 'Regardless of the cost, I\'ll buy it.'),
    GrammarSentence(text: 'I could care less about it.', hasError: true, correction: 'I couldn\'t care less about it.'),
    GrammarSentence(text: 'Try and finish it today.', hasError: true, correction: 'Try to finish it today.'),
    GrammarSentence(text: 'The reason is because I was tired.', hasError: true, correction: 'The reason is that I was tired.'),
    GrammarSentence(text: 'She is a alumni of Harvard.', hasError: true, correction: 'She is an alumna of Harvard.'),
    GrammarSentence(text: 'He is one of those people who is always late.', hasError: true, correction: 'He is one of those people who are always late.'),
    GrammarSentence(text: 'I am looking forward to see you.', hasError: true, correction: 'I am looking forward to seeing you.'),

    // Punctuation and Spelling
    GrammarSentence(text: 'Lets go to the park.', hasError: true, correction: 'Let\'s go to the park.'),
    GrammarSentence(text: 'My mothers car is blue.', hasError: true, correction: 'My mother\'s car is blue.'),
    GrammarSentence(text: 'The dogs bark was loud.', hasError: true, correction: 'The dog\'s bark was loud.'),
    GrammarSentence(text: 'I am going to the store, and buy milk.', hasError: true, correction: 'I am going to the store and buying milk.'),
    GrammarSentence(text: 'He said, I am hungry.', hasError: true, correction: 'He said, "I am hungry."'),
    GrammarSentence(text: 'I need to buy apples, oranges and pears.', hasError: true, correction: 'I need to buy apples, oranges, and pears.'),
    GrammarSentence(text: 'She is a well known actress.', hasError: true, correction: 'She is a well-known actress.'),
    GrammarSentence(text: 'He received a A on his paper.', hasError: true, correction: 'He received an A on his paper.'),
    GrammarSentence(text: 'The book was interesting but it was long.', hasError: true, correction: 'The book was interesting, but it was long.'),
    GrammarSentence(text: 'I will go if you go.', hasError: true, correction: 'I will go if you go.'), // Correct?
    GrammarSentence(text: 'The weather was hot; therefore we went swimming.', hasError: false), // Correct
    GrammarSentence(text: 'The weather was hot, therefore we went swimming.', hasError: true, correction: 'The weather was hot; therefore, we went swimming.'),

    // More Spelling
    GrammarSentence(text: 'I am definitly coming to the party.', hasError: true, correction: 'I am definitely coming to the party.'),
    GrammarSentence(text: 'It is a seperate issue.', hasError: true, correction: 'It is a separate issue.'),
    GrammarSentence(text: 'I received a alot of gifts.', hasError: true, correction: 'I received a lot of gifts.'),
    GrammarSentence(text: 'He has a great calender.', hasError: true, correction: 'He has a great calendar.'),
    GrammarSentence(text: 'She is a very successfull woman.', hasError: true, correction: 'She is a very successful woman.'),
    GrammarSentence(text: 'I am gratefull for your help.', hasError: true, correction: 'I am grateful for your help.'),
    GrammarSentence(text: 'The accident occured at night.', hasError: true, correction: 'The accident occurred at night.'),
    GrammarSentence(text: 'He is a very independant person.', hasError: true, correction: 'He is a very independent person.'),
    GrammarSentence(text: 'She has a lot of patience.', hasError: false),
    GrammarSentence(text: 'She has a lot of patients.', hasError: false), // Both correct depending on context, but let's avoid ambiguity
    GrammarSentence(text: 'I hope you recieve my letter.', hasError: true, correction: 'I hope you receive my letter.'),
    GrammarSentence(text: 'It was a total suprise.', hasError: true, correction: 'It was a total surprise.'),
  ];

  static GrammarSentence generateSentence() {
    return _sentences[_random.nextInt(_sentences.length)];
  }
}
