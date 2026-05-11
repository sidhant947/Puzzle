import 'dart:math';

class Analogy {
  final String question; // e.g., "Apple : Red :: Banana : ?"
  final String answer;
  final List<String> options;

  Analogy({required this.question, required this.answer, required this.options});
}

class VerbalAnalogiesEngine {
  final Random _random = Random();

  final List<Analogy> _analogies = [
    Analogy(question: "Apple : Red :: Banana : ?", answer: "Yellow", options: ["Yellow", "Purple", "Blue", "Green"]),
    Analogy(question: "Hand : Glove :: Foot : ?", answer: "Sock", options: ["Sock", "Hat", "Shirt", "Belt"]),
    Analogy(question: "Cold : Ice :: Hot : ?", answer: "Steam", options: ["Steam", "Water", "Wind", "Dirt"]),
    Analogy(question: "Bird : Fly :: Fish : ?", answer: "Swim", options: ["Swim", "Run", "Walk", "Jump"]),
    Analogy(question: "Book : Read :: Movie : ?", answer: "Watch", options: ["Watch", "Listen", "Write", "Eat"]),
    Analogy(question: "Bark : Dog :: Meow : ?", answer: "Cat", options: ["Cat", "Cow", "Pig", "Duck"]),
    Analogy(question: "Up : Down :: Left : ?", answer: "Right", options: ["Right", "Top", "Bottom", "Forward"]),
    Analogy(question: "Tree : Leaf :: Flower : ?", answer: "Petal", options: ["Petal", "Root", "Stem", "Seed"]),
    Analogy(question: "Sun : Day :: Moon : ?", answer: "Night", options: ["Night", "Morning", "Afternoon", "Evening"]),
    Analogy(question: "Small : Big :: Short : ?", answer: "Tall", options: ["Tall", "Wide", "Fat", "Heavy"]),
    Analogy(question: "Teacher : School :: Doctor : ?", answer: "Hospital", options: ["Hospital", "Market", "Park", "Library"]),
    Analogy(question: "Bread : Bakery :: Milk : ?", answer: "Dairy", options: ["Dairy", "Butcher", "Florist", "Pharmacy"]),
    Analogy(question: "Fast : Slow :: Hard : ?", answer: "Soft", options: ["Soft", "Loud", "Fast", "Heavy"]),
    Analogy(question: "Fire : Hot :: Snow : ?", answer: "Cold", options: ["Cold", "Dry", "Wet", "Bright"]),
    Analogy(question: "Pen : Write :: Knife : ?", answer: "Cut", options: ["Cut", "Cook", "Eat", "Wash"]),
    Analogy(question: "Triangle : 3 :: Square : ?", answer: "4", options: ["4", "5", "6", "8"]),
    Analogy(question: "Happy : Sad :: Rich : ?", answer: "Poor", options: ["Poor", "Wealthy", "Glad", "Angry"]),
    Analogy(question: "Eye : See :: Ear : ?", answer: "Hear", options: ["Hear", "Smell", "Taste", "Touch"]),
    Analogy(question: "Glove : Hand :: Shoe : ?", answer: "Foot", options: ["Foot", "Leg", "Arm", "Head"]),
    Analogy(question: "Ocean : Water :: Desert : ?", answer: "Sand", options: ["Sand", "Rock", "Grass", "Snow"]),
    Analogy(question: "King : Queen :: Prince : ?", answer: "Princess", options: ["Princess", "Duke", "Knight", "Baron"]),
    Analogy(question: "Car : Road :: Boat : ?", answer: "Water", options: ["Water", "Sky", "Land", "Track"]),
    Analogy(question: "Pilot : Airplane :: Driver : ?", answer: "Car", options: ["Car", "Boat", "Bike", "Train"]),
    Analogy(question: "Kitchen : Cooking :: Bedroom : ?", answer: "Sleeping", options: ["Sleeping", "Working", "Eating", "Bathing"]),
    Analogy(question: "Summer : Hot :: Winter : ?", answer: "Cold", options: ["Cold", "Warm", "Bright", "Long"]),
    Analogy(question: "Hungry : Eat :: Thirsty : ?", answer: "Drink", options: ["Drink", "Sleep", "Run", "Talk"]),
    Analogy(question: "Key : Lock :: Remote : ?", answer: "TV", options: ["TV", "Door", "Window", "Light"]),
    Analogy(question: "Rain : Umbrella :: Sun : ?", answer: "Sunglasses", options: ["Sunglasses", "Coat", "Gloves", "Boots"]),
    Analogy(question: "Bee : Hive :: Ant : ?", answer: "Hill", options: ["Hill", "Nest", "Web", "Cave"]),
    Analogy(question: "Circle : Round :: Square : ?", answer: "Flat", options: ["Flat", "Pointy", "Curved", "Hollow"]),
    Analogy(question: "Lion : Roar :: Snake : ?", answer: "Hiss", options: ["Hiss", "Buzz", "Bark", "Coo"]),
    Analogy(question: "Clock : Time :: Ruler : ?", answer: "Length", options: ["Length", "Weight", "Volume", "Speed"]),
    Analogy(question: "Brother : Sister :: Father : ?", answer: "Mother", options: ["Mother", "Uncle", "Aunt", "Son"]),
    Analogy(question: "Winter : Spring :: Autumn : ?", answer: "Winter", options: ["Winter", "Summer", "Spring", "March"]),
    Analogy(question: "Forest : Trees :: Sky : ?", answer: "Clouds", options: ["Clouds", "Birds", "Stars", "Planes"]),
    Analogy(question: "Painting : Artist :: Music : ?", answer: "Musician", options: ["Musician", "Dancer", "Writer", "Actor"]),
    Analogy(question: "Axe : Wood :: Saw : ?", answer: "Lumber", options: ["Lumber", "Metal", "Plastic", "Stone"]),
    Analogy(question: "Hammer : Nail :: Screwdriver : ?", answer: "Screw", options: ["Screw", "Bolt", "Nut", "Pin"]),
    Analogy(question: "Engine : Car :: Heart : ?", answer: "Body", options: ["Body", "Brain", "Lung", "Limb"]),
    Analogy(question: "Moon : Earth :: Earth : ?", answer: "Sun", options: ["Sun", "Mars", "Jupiter", "Venus"]),
    Analogy(question: "Camera : Photo :: Phone : ?", answer: "Call", options: ["Call", "Text", "Game", "Video"]),
    Analogy(question: "Scale : Weight :: Thermometer : ?", answer: "Temperature", options: ["Temperature", "Pressure", "Humidity", "Speed"]),
    Analogy(question: "Soap : Clean :: Dirt : ?", answer: "Dirty", options: ["Dirty", "Wet", "Dry", "Hard"]),
    Analogy(question: "Wheel : Bike :: Wing : ?", answer: "Bird", options: ["Bird", "Fish", "Snake", "Cat"]),
    Analogy(question: "Cow : Milk :: Hen : ?", answer: "Egg", options: ["Egg", "Meat", "Feather", "Nest"]),
    Analogy(question: "Day : Light :: Night : ?", answer: "Dark", options: ["Dark", "Quiet", "Long", "Cold"]),
    Analogy(question: "North : South :: East : ?", answer: "West", options: ["West", "Up", "Down", "Left"]),
    Analogy(question: "Quiet : Silent :: Loud : ?", answer: "Noisy", options: ["Noisy", "Soft", "Fast", "Big"]),
    Analogy(question: "Sweet : Sugar :: Sour : ?", answer: "Lemon", options: ["Lemon", "Apple", "Banana", "Grape"]),
    Analogy(question: "Tall : Mountain :: Deep : ?", answer: "Ocean", options: ["Ocean", "River", "Lake", "Pond"]),
  ];

  Analogy getRandomAnalogy() {
    final analogy = _analogies[_random.nextInt(_analogies.length)];
    final options = List<String>.from(analogy.options)..shuffle(_random);
    return Analogy(
      question: analogy.question,
      answer: analogy.answer,
      options: options,
    );
  }
}
