import 'dart:math';

class Category {
  final String name;
  final Set<String> items;

  Category({required this.name, required this.items});
}

class CategoryFluencyEngine {
  final Random _random = Random();

  final List<Category> _categories = [
    Category(name: "Mammals", items: {
      "dog", "cat", "elephant", "lion", "tiger", "bear", "whale", "dolphin", "human", "monkey",
      "horse", "cow", "pig", "sheep", "goat", "deer", "rabbit", "mouse", "rat", "bat",
      "kangaroo", "panda", "giraffe", "zebra", "hippo", "rhino", "wolf", "fox", "seal", "otter"
    }),
    Category(name: "Fruits", items: {
      "apple", "banana", "orange", "strawberry", "grape", "mango", "pineapple", "watermelon", "kiwi", "pear",
      "peach", "plum", "cherry", "blueberry", "raspberry", "blackberry", "apricot", "pomegranate", "lemon", "lime",
      "coconut", "avocado", "papaya", "fig", "date", "melon", "guava", "lychee", "passionfruit", "dragonfruit"
    }),
    Category(name: "Countries in Europe", items: {
      "france", "germany", "italy", "spain", "united kingdom", "uk", "greece", "portugal", "netherlands", "belgium",
      "switzerland", "austria", "sweden", "norway", "denmark", "finland", "poland", "ireland", "iceland", "czech republic",
      "hungary", "romania", "bulgaria", "croatia", "serbia", "slovakia", "slovenia", "estonia", "latvia", "lithuania"
    }),
    Category(name: "Colors", items: {
      "red", "blue", "green", "yellow", "orange", "purple", "pink", "brown", "black", "white",
      "gray", "grey", "silver", "gold", "violet", "indigo", "cyan", "magenta", "maroon", "navy",
      "teal", "turquoise", "beige", "ivory", "khaki", "lavender", "olive", "peach", "salmon", "tan"
    }),
    Category(name: "Musical Instruments", items: {
      "piano", "guitar", "violin", "drums", "flute", "trumpet", "saxophone", "cello", "harp", "clarinet",
      "oboe", "trombone", "tuba", "banjo", "mandolin", "ukulele", "accordion", "harmonica", "xylophone", "keyboard",
      "bass", "recorder", "viola", "double bass", "lute", "sitar", "bagpipes", "triangle", "tambourine", "cymbals"
    }),
  ];

  Category getRandomCategory() {
    return _categories[_random.nextInt(_categories.length)];
  }

  bool isValidItem(String item, Category category) {
    return category.items.contains(item.toLowerCase().trim());
  }
}
