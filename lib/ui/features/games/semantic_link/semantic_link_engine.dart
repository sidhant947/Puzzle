import 'dart:math';

class SemanticLinkEngine {
  final Random _random = Random();

  final List<SemanticLinkPuzzle> _puzzles = [
    // Difficult ones with distractors
    SemanticLinkPuzzle(words: ['Apple', 'Print', 'Board'], answer: 'Finger', options: ['Finger', 'Computer', 'Key', 'Wood']),
    SemanticLinkPuzzle(words: ['Bald', 'Screech', 'Emblem'], answer: 'Eagle', options: ['Eagle', 'Tire', 'Car', 'Bird']),
    SemanticLinkPuzzle(words: ['Blood', 'Music', 'Cheese'], answer: 'Blue', options: ['Blue', 'Wine', 'Swiss', 'Red']),
    SemanticLinkPuzzle(words: ['Board', 'Magic', 'Death'], answer: 'Black', options: ['Black', 'Game', 'Wand', 'Spell']),
    SemanticLinkPuzzle(words: ['Book', 'Dog', 'Fold'], answer: 'Ear', options: ['Ear', 'Page', 'Pet', 'Paper']),
    SemanticLinkPuzzle(words: ['Break', 'Bean', 'Cake'], answer: 'Coffee', options: ['Coffee', 'Fast', 'Bake', 'Snap']),
    SemanticLinkPuzzle(words: ['Broken', 'Clear', 'Eye'], answer: 'Glass', options: ['Glass', 'Vision', 'Tear', 'See']),
    SemanticLinkPuzzle(words: ['Catch', 'Trust', 'Group'], answer: 'Fall', options: ['Fall', 'Fly', 'Hold', 'Team']),
    SemanticLinkPuzzle(words: ['Call', 'Pay', 'Line'], answer: 'Phone', options: ['Phone', 'Card', 'Check', 'Bill']),
    SemanticLinkPuzzle(words: ['Car', 'Swimming', 'Cue'], answer: 'Pool', options: ['Pool', 'Drive', 'Stick', 'Game']),
    SemanticLinkPuzzle(words: ['Child', 'Game', 'Action'], answer: 'Play', options: ['Play', 'Boy', 'Run', 'Time']),
    SemanticLinkPuzzle(words: ['Cold', 'Draft', 'Catch'], answer: 'Wind', options: ['Wind', 'Chill', 'Beer', 'Fish']),
    SemanticLinkPuzzle(words: ['Cottage', 'Swiss', 'Cake'], answer: 'Cheese', options: ['Cheese', 'Chocolate', 'Cabin', 'Sweet']),
    SemanticLinkPuzzle(words: ['Cover', 'Arm', 'Wear'], answer: 'Under', options: ['Under', 'Sleeve', 'Coat', 'Shield']),
    SemanticLinkPuzzle(words: ['Cross', 'Rain', 'Tie'], answer: 'Bow', options: ['Bow', 'Knot', 'Wind', 'Rope']),
    SemanticLinkPuzzle(words: ['Deep', 'Work', 'Space'], answer: 'Network', options: ['Network', 'Hole', 'Sea', 'Time']),
    SemanticLinkPuzzle(words: ['Dew', 'Comb', 'Bee'], answer: 'Honey', options: ['Honey', 'Drop', 'Hair', 'Morning']),
    SemanticLinkPuzzle(words: ['Dream', 'Break', 'Day'], answer: 'Night', options: ['Night', 'Sleep', 'Fast', 'Sun']),
    SemanticLinkPuzzle(words: ['Dust', 'Cereal', 'Fish'], answer: 'Bowl', options: ['Bowl', 'Box', 'Pan', 'Gold']),
    SemanticLinkPuzzle(words: ['Falling', 'Actor', 'Dust'], answer: 'Star', options: ['Star', 'Movie', 'Dirt', 'Stage']),
    SemanticLinkPuzzle(words: ['Food', 'Forward', 'Break'], answer: 'Fast', options: ['Fast', 'Step', 'Meal', 'Stop']),
    SemanticLinkPuzzle(words: ['Force', 'Line', 'Mail'], answer: 'Air', options: ['Air', 'Post', 'Push', 'Train']),
    SemanticLinkPuzzle(words: ['Fountain', 'Baking', 'Pop'], answer: 'Soda', options: ['Soda', 'Water', 'Cake', 'Drink']),
    SemanticLinkPuzzle(words: ['French', 'Shoe', 'Bull'], answer: 'Horn', options: ['Horn', 'Cow', 'Leather', 'Foot']),
    SemanticLinkPuzzle(words: ['Fruit', 'Core', 'Hard'], answer: 'Apple', options: ['Apple', 'Seed', 'Rock', 'Soft']),
    SemanticLinkPuzzle(words: ['Game', 'Action', 'Role'], answer: 'Play', options: ['Play', 'Board', 'Model', 'Part']),
    SemanticLinkPuzzle(words: ['Heart', 'Potato', 'Fried'], answer: 'Sweet', options: ['Sweet', 'Beat', 'Chip', 'Hot']),
    SemanticLinkPuzzle(words: ['High', 'District', 'House'], answer: 'School', options: ['School', 'Court', 'Home', 'Building']),
    SemanticLinkPuzzle(words: ['Hold', 'Print', 'Cat'], answer: 'Paw', options: ['Paw', 'Hand', 'Paper', 'Dog']),
    SemanticLinkPuzzle(words: ['Hole', 'Joint', 'Stub'], answer: 'Pin', options: ['Pin', 'Knee', 'Cigar', 'Dig']),
    SemanticLinkPuzzle(words: ['House', 'Village', 'Golf'], answer: 'Green', options: ['Green', 'Town', 'Club', 'White']),
    SemanticLinkPuzzle(words: ['Jump', 'Kill', 'Joy'], answer: 'Over', options: ['Over', 'High', 'Dead', 'Happy']),
    SemanticLinkPuzzle(words: ['Key', 'Board', 'Walk'], answer: 'Side', options: ['Side', 'Lock', 'Wood', 'Path']),
    SemanticLinkPuzzle(words: ['Length', 'Power', 'Strong'], answer: 'Arm', options: ['Arm', 'Measure', 'Force', 'Leg']),
    SemanticLinkPuzzle(words: ['Light', 'Birthday', 'Stick'], answer: 'Candle', options: ['Candle', 'Cake', 'Wood', 'Glow']),
    SemanticLinkPuzzle(words: ['Light', 'Village', 'Golf'], answer: 'Green', options: ['Green', 'Lamp', 'Town', 'Club']),
    SemanticLinkPuzzle(words: ['Loser', 'Throat', 'Spot'], answer: 'Sore', options: ['Sore', 'Win', 'Neck', 'Red']),
    SemanticLinkPuzzle(words: ['Main', 'Sweeper', 'Light'], answer: 'Street', options: ['Street', 'Road', 'Clean', 'Dark']),
    SemanticLinkPuzzle(words: ['Match', 'Wrist', 'Stop'], answer: 'Watch', options: ['Watch', 'Fire', 'Time', 'Hand']),
    SemanticLinkPuzzle(words: ['Measure', 'Desk', 'Scotch'], answer: 'Tape', options: ['Tape', 'Rule', 'Drink', 'Wood']),
    SemanticLinkPuzzle(words: ['Mouse', 'Bear', 'Sand'], answer: 'Trap', options: ['Trap', 'Cat', 'Animal', 'Beach']),
    SemanticLinkPuzzle(words: ['Night', 'Wrist', 'Stop'], answer: 'Watch', options: ['Watch', 'Dark', 'Time', 'Band']),
    SemanticLinkPuzzle(words: ['Note', 'Chain', 'Master'], answer: 'Key', options: ['Key', 'Book', 'Link', 'Lord']),
    SemanticLinkPuzzle(words: ['Nuclear', 'Feud', 'Pigs'], answer: 'Family', options: ['Family', 'Bomb', 'Fight', 'Farm']),
    SemanticLinkPuzzle(words: ['Office', 'Mail', 'Ticket'], answer: 'Box', options: ['Box', 'Post', 'Work', 'Paper']),
    SemanticLinkPuzzle(words: ['Painting', 'Bowl', 'Nail'], answer: 'Finger', options: ['Finger', 'Art', 'Soup', 'Hammer']),
    SemanticLinkPuzzle(words: ['Paper', 'Fear', 'Shoe'], answer: 'Stage', options: ['Stage', 'Page', 'Scare', 'Lace']),
    SemanticLinkPuzzle(words: ['Piece', 'Mind', 'Dating'], answer: 'Game', options: ['Game', 'Puzzle', 'Brain', 'Love']),
    SemanticLinkPuzzle(words: ['Piece', 'Mind', 'Set'], answer: 'Master', options: ['Master', 'Brain', 'Block', 'Piece']),
    SemanticLinkPuzzle(words: ['Pin', 'Dance', 'Block'], answer: 'Square', options: ['Square', 'Needle', 'Party', 'Circle']),
    SemanticLinkPuzzle(words: ['Pitch', 'Throw', 'Tent'], answer: 'Camp', options: ['Camp', 'Ball', 'Catch', 'Fire']),
    SemanticLinkPuzzle(words: ['Player', 'Tennis', 'Web'], answer: 'Net', options: ['Net', 'Game', 'Racket', 'Spider']),
    SemanticLinkPuzzle(words: ['Political', 'Surprise', 'Birthday'], answer: 'Party', options: ['Party', 'Vote', 'Cake', 'Gift']),
    SemanticLinkPuzzle(words: ['Print', 'Berry', 'Bird'], answer: 'Blue', options: ['Blue', 'Press', 'Red', 'Fly']),
    SemanticLinkPuzzle(words: ['River', 'Money', 'Blood'], answer: 'Bank', options: ['Bank', 'Water', 'Cash', 'Red']),
    SemanticLinkPuzzle(words: ['Rock', 'Times', 'Steel'], answer: 'Hard', options: ['Hard', 'Stone', 'Clock', 'Metal']),
    SemanticLinkPuzzle(words: ['Room', 'Blood', 'Salt'], answer: 'Bath', options: ['Bath', 'Space', 'Red', 'Pepper']),
    SemanticLinkPuzzle(words: ['Round', 'Drive', 'Way'], answer: 'One', options: ['One', 'Circle', 'Car', 'Path']),
    SemanticLinkPuzzle(words: ['Safety', 'Table', 'Net'], answer: 'Tennis', options: ['Tennis', 'Pin', 'Chair', 'Safe']),
    SemanticLinkPuzzle(words: ['Sand', 'Running', 'Hand'], answer: 'Time', options: ['Time', 'Beach', 'Fast', 'Foot']),
    SemanticLinkPuzzle(words: ['School', 'Lounge', 'Catcher'], answer: 'Dog', options: ['Dog', 'Teacher', 'Chair', 'Ball']),
    SemanticLinkPuzzle(words: ['Sea', 'Home', 'Stomach'], answer: 'Sick', options: ['Sick', 'Water', 'House', 'Acid']),
    SemanticLinkPuzzle(words: ['Shadow', 'Chart', 'Drop'], answer: 'Eye', options: ['Eye', 'Dark', 'Graph', 'Fall']),
    SemanticLinkPuzzle(words: ['Shoe', 'Flies', 'Watch'], answer: 'Time', options: ['Time', 'Foot', 'Bug', 'See']),
    SemanticLinkPuzzle(words: ['Shoot', 'String', 'Hair'], answer: 'Bow', options: ['Bow', 'Gun', 'Tie', 'Head']),
    SemanticLinkPuzzle(words: ['Solid', 'Bear', 'Rose'], answer: 'Gold', options: ['Gold', 'Rock', 'Animal', 'Red']),
    SemanticLinkPuzzle(words: ['Space', 'Walk', 'Money'], answer: 'Moon', options: ['Moon', 'Star', 'Run', 'Bank']),
    SemanticLinkPuzzle(words: ['Spoon', 'Cloth', 'Card'], answer: 'Table', options: ['Table', 'Fork', 'Fabric', 'Game']),
    SemanticLinkPuzzle(words: ['Square', 'Card', 'Table'], answer: 'Deal', options: ['Deal', 'Shape', 'Play', 'Chair']),
    SemanticLinkPuzzle(words: ['Stone', 'Keep', 'Milestone'], answer: 'Step', options: ['Step', 'Rock', 'Hold', 'Walk']),
    SemanticLinkPuzzle(words: ['Stop', 'Sign', 'Apple'], answer: 'Red', options: ['Red', 'Go', 'Fruit', 'Green']),
    SemanticLinkPuzzle(words: ['Sun', 'Bulb', 'Heavy'], answer: 'Light', options: ['Light', 'Star', 'Lamp', 'Weight']),
    SemanticLinkPuzzle(words: ['Swiss', 'Cottage', 'Cake'], answer: 'Cheese', options: ['Cheese', 'Alps', 'House', 'Bake']),
    SemanticLinkPuzzle(words: ['Tail', 'Water', 'Fall'], answer: 'Gate', options: ['Gate', 'Dog', 'River', 'Drop']),
    SemanticLinkPuzzle(words: ['Talk', 'Sand', 'Walk'], answer: 'Small', options: ['Small', 'Speak', 'Beach', 'Run']),
    SemanticLinkPuzzle(words: ['Toll', 'Bell', 'Line'], answer: 'Phone', options: ['Phone', 'Pay', 'Ring', 'Wait']),
    SemanticLinkPuzzle(words: ['Tree', 'Car', 'Elephant'], answer: 'Trunk', options: ['Trunk', 'Leaf', 'Drive', 'Animal']),
    SemanticLinkPuzzle(words: ['Water', 'Mine', 'Shaker'], answer: 'Salt', options: ['Salt', 'Drink', 'Gold', 'Move']),
    SemanticLinkPuzzle(words: ['Way', 'Board', 'Sleep'], answer: 'Walk', options: ['Walk', 'Path', 'Wood', 'Bed']),
    SemanticLinkPuzzle(words: ['White', 'Watch', 'Weight'], answer: 'Paper', options: ['Paper', 'Color', 'Time', 'Scale']),
    SemanticLinkPuzzle(words: ['Window', 'Bite', 'Monkey'], answer: 'Spider', options: ['Spider', 'Glass', 'Teeth', 'Ape']),
    SemanticLinkPuzzle(words: ['Word', 'House', 'Plant'], answer: 'Power', options: ['Power', 'Book', 'Home', 'Green']),
    SemanticLinkPuzzle(words: ['Work', 'Hot', 'Iron'], answer: 'Press', options: ['Press', 'Job', 'Cold', 'Metal']),
    SemanticLinkPuzzle(words: ['Worm', 'Shelf', 'End'], answer: 'Book', options: ['Book', 'Bug', 'Wood', 'Stop']),
  ];

  SemanticLinkEngine() {
    _puzzles.shuffle(_random);
  }

  SemanticLinkPuzzle generatePuzzle() {
    final puzzle = _puzzles[_random.nextInt(_puzzles.length)];
    
    // We already have 4 options defined for every puzzle in this setup
    // But we need to shuffle them each time
    final options = List<String>.from(puzzle.options);
    options.shuffle(_random);
    
    return SemanticLinkPuzzle(
      words: puzzle.words,
      answer: puzzle.answer,
      options: options,
    );
  }
}

class SemanticLinkPuzzle {
  final List<String> words;
  final String answer;
  final List<String> options;

  SemanticLinkPuzzle({
    required this.words,
    required this.answer,
    required this.options,
  });
}

