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
      "kangaroo", "panda", "giraffe", "zebra", "hippo", "rhino", "wolf", "fox", "seal", "otter",
      "chimpanzee", "gorilla", "orangutan", "baboon", "lemur", "sloth", "armadillo", "anteater", 
      "platypus", "echidna", "koala", "wombat", "wallaby", "tasmanian devil", "meerkat", "mongoose", 
      "hyena", "cheetah", "leopard", "jaguar", "cougar", "lynx", "bobcat", "badger", "wolverine", 
      "skunk", "raccoon", "weasel", "ferret", "mink", "sable", "ermine", "walrus", "sea lion", 
      "manatee", "dugong", "blue whale", "humpback whale", "orca", "narwhal", "beluga", "sperm whale", 
      "porpoise", "squirrel", "chipmunk", "beaver", "capybara", "porcupine", "gopher", "hamster", 
      "guinea pig", "gerbil", "mole", "shrew", "hedgehog", "bison", "buffalo", "antelope", "gazelle", 
      "impala", "wildebeest", "elk", "moose", "caribou", "reindeer", "camel", "llama", "alpaca", 
      "vicuna", "guanaco", "donkey", "mule", "tapir", "rhinoceros", "hippopotamus", "boar", "peccary"
    }),
    Category(name: "Fruits", items: {
      "apple", "banana", "orange", "strawberry", "strawberries", "grape", "grapes", "mango", "pineapple", "watermelon", "kiwi", "pear",
      "peach", "plum", "cherry", "cherries", "blueberry", "blueberries", "raspberry", "raspberries", "blackberry", "blackberries", 
      "apricot", "pomegranate", "lemon", "lime", "coconut", "avocado", "papaya", "fig", "date", "melon", "guava", "lychee", 
      "passionfruit", "dragonfruit", "nectarine", "tangerine", "clementine", "grapefruit", "cantaloupe", "honeydew", "starfruit", 
      "jackfruit", "persimmon", "cranberry", "cranberries", "kumquat", "pomelo", "tamarind", "durian", "plantain", "tomato",
      "boysenberry", "elderberry", "gooseberry", "mulberry", "rowanberry", "salmonberry", "thimbleberry", "wineberry",
      "muskmelon", "persian melon", "santa claus melon", "winter melon", "calamansi", "citron", "kaffir lime", "key lime", 
      "mandarine", "meyer lemon", "rangpur", "satsuma", "ugli fruit", "acerola", "breadfruit", "carambola", "cherimoya", 
      "custard apple", "feijoa", "jujube", "longan", "loquat", "mangosteen", "pawpaw", "prickly pear", "rambutan", "sapodilla", 
      "soursop", "sugar apple", "tamarillo", "ugni"
    }),
    Category(name: "Countries in Europe", items: {
      "france", "germany", "italy", "spain", "united kingdom", "uk", "greece", "portugal", "netherlands", "belgium",
      "switzerland", "austria", "sweden", "norway", "denmark", "finland", "poland", "ireland", "iceland", "czech republic",
      "hungary", "romania", "bulgaria", "croatia", "serbia", "slovakia", "slovenia", "estonia", "latvia", "lithuania",
      "albania", "andorra", "armenia", "azerbaijan", "belarus", "bosnia and herzegovina", "cyprus", "georgia", "kazakhstan", 
      "kosovo", "liechtenstein", "luxembourg", "malta", "moldova", "monaco", "montenegro", "north macedonia", "russia", 
      "san marino", "turkey", "ukraine", "vatican city"
    }),
    Category(name: "Colors", items: {
      "red", "blue", "green", "yellow", "orange", "purple", "pink", "brown", "black", "white",
      "gray", "grey", "silver", "gold", "violet", "indigo", "cyan", "magenta", "maroon", "navy",
      "teal", "turquoise", "beige", "ivory", "khaki", "lavender", "olive", "peach", "salmon", "tan",
      "amber", "amethyst", "apricot", "aqua", "aquamarine", "azure", "baby blue", "bisque", "blanched almond", 
      "blue violet", "bronze", "burly wood", "cadet blue", "chartreuse", "chocolate", "coral", "cornflower blue", 
      "cornsilk", "crimson", "dark blue", "dark cyan", "dark goldenrod", "dark gray", "dark green", "dark grey", 
      "dark khaki", "dark magenta", "dark olive green", "dark orange", "dark orchid", "dark red", "dark salmon", 
      "dark sea green", "dark slate blue", "dark slate gray", "dark slate grey", "dark turquoise", "dark violet", 
      "deep pink", "deep sky blue", "dim gray", "dim grey", "dodger blue", "firebrick", "floral white", "forest green", 
      "fuchsia", "gainsboro", "ghost white", "goldenrod", "green yellow", "hot pink", "indian red", "lawn green", 
      "lemon chiffon", "light blue", "light coral", "light cyan", "light goldenrod yellow", "light gray", "light green", 
      "light grey", "light pink", "light salmon", "light sea green", "light sky blue", "light slate gray", 
      "light slate grey", "light steel blue", "light yellow", "lime green", "linen", "medium aquamarine", 
      "medium blue", "medium orchid", "medium purple", "medium sea green", "medium slate blue", "medium spring green", 
      "medium turquoise", "medium violet red", "midnight blue", "mint cream", "misty rose", "moccasin", "navajo white", 
      "old lace", "olive drab", "orange red", "orchid", "pale goldenrod", "pale green", "pale turquoise", 
      "pale violet red", "papaya whip", "peach puff", "peru", "plum", "powder blue", "rebeccapurple", "rosy brown", 
      "royal blue", "saddle brown", "sandy brown", "sea green", "seashell", "sienna", "sky blue", "slate blue", 
      "slate gray", "slate grey", "snow", "spring green", "steel blue", "thistle", "tomato", "wheat", "white smoke", 
      "yellow green"
    }),
    Category(name: "Musical Instruments", items: {
      "piano", "guitar", "violin", "drums", "flute", "trumpet", "saxophone", "cello", "harp", "clarinet",
      "oboe", "trombone", "tuba", "banjo", "mandolin", "ukulele", "accordion", "harmonica", "xylophone", "keyboard",
      "bass", "recorder", "viola", "double bass", "lute", "sitar", "bagpipes", "triangle", "tambourine", "cymbals",
      "organ", "synthesizer", "electric guitar", "bass guitar", "acoustic guitar", "koto", "shamisen", "guzheng", 
      "pipa", "sarod", "oud", "balalaika", "bouzouki", "mandola", "mandocello", "theorbo", "chitarrone", "harpsichord", 
      "clavichord", "spinet", "celesta", "glockenspiel", "marimba", "vibraphone", "tubular bells", "timpani", 
      "snare drum", "bass drum", "tom-tom", "bongos", "congas", "djembe", "tabla", "cajon", "maracas", "castanets", 
      "wood block", "cowbell", "gong", "piccolo", "alto flute", "bass flute", "cor anglais", "bass clarinet", 
      "bassoon", "contrabassoon", "soprano saxophone", "alto saxophone", "tenor saxophone", "baritone saxophone", 
      "cornet", "flugelhorn", "euphonium", "sousaphone", "tin whistle", "ocarina", "pan pipes", "didgeridoo", "theremin"
    }),
  ];

  Category getRandomCategory() {
    return _categories[_random.nextInt(_categories.length)];
  }

  bool isValidItem(String item, Category category) {
    return category.items.contains(item.toLowerCase().trim());
  }
}
