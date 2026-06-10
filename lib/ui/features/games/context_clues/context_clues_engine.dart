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
  final List<ClueQuestion> _questionsPool = [
    // --- Set 1: Basics & Daily Life ---
    const ClueQuestion(sentence: "The soup was too ___ to eat right away.", clue: "High in temperature.", correctWord: "hot", options: ["hot", "cold", "spicy", "sweet"]),
    const ClueQuestion(sentence: "He was so ___ that he fell asleep during the movie.", clue: "Needing rest or sleep.", correctWord: "tired", options: ["tired", "awake", "happy", "angry"]),
    const ClueQuestion(sentence: "The kitten was so ___ that it could fit inside a teacup.", clue: "Very small.", correctWord: "tiny", options: ["tiny", "huge", "fluffy", "loud"]),
    const ClueQuestion(sentence: "The sky turned ___ as the sun began to set.", clue: "A color between yellow and red.", correctWord: "orange", options: ["orange", "blue", "green", "purple"]),
    const ClueQuestion(sentence: "She used a ___ to protect herself from the rain.", clue: "A folding device used as protection against rain.", correctWord: "umbrella", options: ["umbrella", "hat", "coat", "glove"]),
    const ClueQuestion(sentence: "The cake was so ___ that everyone wanted a second piece.", clue: "Pleasant to the taste.", correctWord: "delicious", options: ["delicious", "bitter", "salty", "sour"]),
    const ClueQuestion(sentence: "He had to ___ his shoes before going outside.", clue: "To fasten with a cord or string.", correctWord: "tie", options: ["tie", "wash", "break", "sell"]),
    const ClueQuestion(sentence: "The room was so ___ that I couldn't see anything.", clue: "Lacking light.", correctWord: "dark", options: ["dark", "bright", "large", "noisy"]),
    const ClueQuestion(sentence: "She felt ___ after winning the first place in the race.", clue: "Feeling or showing pleasure or contentment.", correctWord: "happy", options: ["happy", "sad", "scared", "tired"]),
    const ClueQuestion(sentence: "The ocean water felt ___ on a hot summer day.", clue: "Slightly cold; pleasantly low temperature.", correctWord: "cool", options: ["cool", "boiling", "dry", "heavy"]),

    // --- Set 2: Nature & Animals ---
    const ClueQuestion(sentence: "The ___ has a very long neck to reach high leaves.", clue: "A large African mammal with a very long neck.", correctWord: "giraffe", options: ["giraffe", "elephant", "zebra", "hippo"]),
    const ClueQuestion(sentence: "Bees collect ___ from flowers to make honey.", clue: "A sugary fluid secreted by plants.", correctWord: "nectar", options: ["nectar", "water", "dust", "sap"]),
    const ClueQuestion(sentence: "The bear went into a deep ___ during the cold winter.", clue: "A state of inactivity and metabolic depression.", correctWord: "hibernation", options: ["hibernation", "migration", "vacation", "celebration"]),
    const ClueQuestion(sentence: "A ___ can change its skin color to blend in with surroundings.", clue: "A lizard known for its ability to change color.", correctWord: "chameleon", options: ["chameleon", "snake", "frog", "turtle"]),
    const ClueQuestion(sentence: "The owl is a ___ animal, meaning it is active at night.", clue: "Active or occurring at night.", correctWord: "nocturnal", options: ["nocturnal", "diurnal", "aquatic", "social"]),
    const ClueQuestion(sentence: "The eagle soared ___ above the mountain peaks.", clue: "At a great distance above the ground.", correctWord: "high", options: ["high", "low", "deep", "near"]),
    const ClueQuestion(sentence: "A group of lions is called a ___.", clue: "A group of lions forming a social unit.", correctWord: "pride", options: ["pride", "pack", "herd", "flock"]),
    const ClueQuestion(sentence: "The desert is known for its ___ climate and lack of rain.", clue: "Extremely dry.", correctWord: "arid", options: ["arid", "humid", "frozen", "lush"]),
    const ClueQuestion(sentence: "Dolphins use ___ to communicate and find food.", clue: "The location of objects by reflected sound.", correctWord: "echolocation", options: ["echolocation", "vision", "smell", "touch"]),
    const ClueQuestion(sentence: "The forest was filled with ___ vegetation after the rain.", clue: "Growing luxuriantly.", correctWord: "lush", options: ["lush", "withered", "sparse", "artificial"]),

    // --- Set 3: Intermediate Vocabulary ---
    const ClueQuestion(sentence: "The scientist made a ___ discovery that changed the field.", clue: "Extremely important or significant.", correctWord: "breakthrough", options: ["breakthrough", "trivial", "mistake", "delay"]),
    const ClueQuestion(sentence: "She was very ___ about sharing her details with strangers.", clue: "Careful to avoid danger or risks.", correctWord: "cautious", options: ["cautious", "reckless", "eager", "friendly"]),
    const ClueQuestion(sentence: "The ancient ruins were incredibly ___, showing years of decay.", clue: "Extremely old.", correctWord: "ancient", options: ["ancient", "modern", "clean", "sturdy"]),
    const ClueQuestion(sentence: "His ___ attention to detail made him an excellent watchmaker.", clue: "Showing great attention to detail; precise.", correctWord: "meticulous", options: ["meticulous", "careless", "hasty", "ordinary"]),
    const ClueQuestion(sentence: "The sunset was ___, lasting only a few fleeting minutes.", clue: "Lasting for a very short time; transient.", correctWord: "ephemeral", options: ["ephemeral", "permanent", "eternal", "tedious"]),
    const ClueQuestion(sentence: "She tried to ___ the tense situation with a joke.", clue: "Make less intense, severe, or hostile.", correctWord: "defuse", options: ["defuse", "ignite", "ignore", "complicate"]),
    const ClueQuestion(sentence: "The instructions were so ___ that everyone interpreted them differently.", clue: "Open to more than one interpretation; unclear.", correctWord: "ambiguous", options: ["ambiguous", "precise", "lengthy", "simple"]),
    const ClueQuestion(sentence: "Since they had three backups, the fourth one was deemed ___.", clue: "Not or no longer needed or useful; superfluous.", correctWord: "redundant", options: ["redundant", "essential", "deficient", "unique"]),
    const ClueQuestion(sentence: "The speaker's voice was extremely ___ and put the audience to sleep.", clue: "Dull, tedious, and repetitious; lacking variety.", correctWord: "monotonous", options: ["monotonous", "vibrant", "loud", "clear"]),
    const ClueQuestion(sentence: "Smartphones have become ___, found in almost every corner.", clue: "Present, appearing, or found everywhere.", correctWord: "ubiquitous", options: ["ubiquitous", "scarce", "obsolete", "localized"]),

    // --- Set 4: Academic & Advanced ---
    const ClueQuestion(sentence: "Her argument was so ___ that no one could find a flaw in it.", clue: "Logical, convincing, and clear.", correctWord: "cogent", options: ["cogent", "weak", "confusing", "long"]),
    const ClueQuestion(sentence: "The politician's ___ speech failed to address the real issues.", clue: "Exaggerated or pretentious language.", correctWord: "bombastic", options: ["bombastic", "humble", "brief", "sincere"]),
    const ClueQuestion(sentence: "He was known for his ___ nature, always helping others for free.", clue: "Generous or doing good for others.", correctWord: "benevolent", options: ["benevolent", "greedy", "cruel", "lazy"]),
    const ClueQuestion(sentence: "The virus was so ___ that it spread through the city in days.", clue: "Extremely severe or harmful in its effects.", correctWord: "virulent", options: ["virulent", "harmless", "slow", "weak"]),
    const ClueQuestion(sentence: "She gave a ___ response, hoping to avoid further questions.", clue: "Using few words; brief.", correctWord: "laconic", options: ["laconic", "verbose", "shouting", "angry"]),
    const ClueQuestion(sentence: "The judge was praised for being ___ and fair to both sides.", clue: "Not biased; neutral.", correctWord: "impartial", options: ["impartial", "prejudiced", "strict", "fast"]),
    const ClueQuestion(sentence: "The artist's work was ___, drawing from many different styles.", clue: "Deriving ideas or style from a broad range of sources.", correctWord: "eclectic", options: ["eclectic", "uniform", "boring", "modern"]),
    const ClueQuestion(sentence: "He was an ___ reader, finishing three books every week.", clue: "Having a very eager approach to an activity.", correctWord: "avid", options: ["avid", "reluctant", "slow", "careless"]),
    const ClueQuestion(sentence: "The meeting was ___, as the main speaker was unable to attend.", clue: "Postponed or put off until a later time.", correctWord: "deferred", options: ["deferred", "cancelled", "rushed", "exciting"]),
    const ClueQuestion(sentence: "She had a ___ for languages, learning five of them by age ten.", clue: "A natural skill or talent.", correctWord: "knack", options: ["knack", "hatred", "fear", "struggle"]),

    // --- Set 5: Science & Technology ---
    const ClueQuestion(sentence: "The planet's ___ is composed mostly of nitrogen and oxygen.", clue: "The envelope of gases surrounding a planet.", correctWord: "atmosphere", options: ["atmosphere", "surface", "core", "ocean"]),
    const ClueQuestion(sentence: "Plants use ___ to convert sunlight into chemical energy.", clue: "The process by which plants make food.", correctWord: "photosynthesis", options: ["photosynthesis", "respiration", "digestion", "evaporation"]),
    const ClueQuestion(sentence: "The computer's ___ is responsible for processing data.", clue: "The 'brain' of the computer.", correctWord: "processor", options: ["processor", "monitor", "keyboard", "mouse"]),
    const ClueQuestion(sentence: "The ___ of gravity keeps the planets in orbit.", clue: "The force that attracts objects toward each other.", correctWord: "force", options: ["force", "speed", "light", "heat"]),
    const ClueQuestion(sentence: "A ___ is a tiny organism that can only be seen with a microscope.", clue: "A microscopic living thing.", correctWord: "microbe", options: ["microbe", "insect", "plant", "animal"]),
    const ClueQuestion(sentence: "The experiment required a ___ environment to prevent contamination.", clue: "Free from bacteria or other living microorganisms.", correctWord: "sterile", options: ["sterile", "dirty", "crowded", "outdoor"]),
    const ClueQuestion(sentence: "The chemical reaction was ___, releasing a large amount of heat.", clue: "Releasing heat.", correctWord: "exothermic", options: ["exothermic", "endothermic", "slow", "silent"]),
    const ClueQuestion(sentence: "The material was highly ___, allowing electricity to flow easily.", clue: "Able to conduct electricity or heat.", correctWord: "conductive", options: ["conductive", "insulating", "fragile", "heavy"]),
    const ClueQuestion(sentence: "The space probe was sent to ___ the outer planets.", clue: "To travel through for the purpose of discovery.", correctWord: "explore", options: ["explore", "destroy", "ignore", "build"]),
    const ClueQuestion(sentence: "The data was ___, meaning it was scrambled for security.", clue: "Converted into a code.", correctWord: "encrypted", options: ["encrypted", "deleted", "public", "simple"]),

    // --- Set 6: Emotions & Character ---
    const ClueQuestion(sentence: "She was so ___ that she couldn't stop crying.", clue: "Feeling or showing sorrow.", correctWord: "melancholy", options: ["melancholy", "cheerful", "angry", "bored"]),
    const ClueQuestion(sentence: "He was very ___, always believing the best about people.", clue: "Hopeful and confident about the future.", correctWord: "optimistic", options: ["optimistic", "pessimistic", "cruel", "shy"]),
    const ClueQuestion(sentence: "Her ___ attitude made it difficult for others to work with her.", clue: "Thinking one is better than others; arrogant.", correctWord: "haughty", options: ["haughty", "humble", "kind", "quiet"]),
    const ClueQuestion(sentence: "He felt a sense of ___ after finishing the difficult marathon.", clue: "A feeling of great happiness or triumph.", correctWord: "elation", options: ["elation", "defeat", "fatigue", "hunger"]),
    const ClueQuestion(sentence: "She was ___, often acting without thinking about the consequences.", clue: "Acting or done quickly and without thought.", correctWord: "impulsive", options: ["impulsive", "deliberate", "slow", "cautious"]),
    const ClueQuestion(sentence: "He was very ___, keeping his feelings and thoughts to himself.", clue: "Not revealing one's thoughts or feelings readily.", correctWord: "reserved", options: ["reserved", "talkative", "loud", "rude"]),
    const ClueQuestion(sentence: "The child's ___ curiosity led him to ask many questions.", clue: "Impossible to satisfy.", correctWord: "insatiable", options: ["insatiable", "dull", "limited", "fearful"]),
    const ClueQuestion(sentence: "She felt ___ when she realized she had forgotten her best friend's birthday.", clue: "Feeling or showing regret.", correctWord: "remorseful", options: ["remorseful", "proud", "excited", "calm"]),
    const ClueQuestion(sentence: "He was known for his ___, always telling the truth no matter what.", clue: "The quality of being honest and having strong moral principles.", correctWord: "integrity", options: ["integrity", "deceit", "laziness", "fear"]),
    const ClueQuestion(sentence: "The teacher was very ___, always patient with her students.", clue: "Showing or having great patience.", correctWord: "forbearing", options: ["forbearing", "strict", "angry", "hasty"]),

    // --- Set 7: Literature & Art ---
    const ClueQuestion(sentence: "The novel's ___ was a dark and mysterious castle.", clue: "The place or type of surroundings where an event takes place.", correctWord: "setting", options: ["setting", "character", "plot", "title"]),
    const ClueQuestion(sentence: "The poem was full of ___, comparing the sun to a golden coin.", clue: "A figure of speech in which a word or phrase is applied to an object.", correctWord: "metaphor", options: ["metaphor", "rhyme", "meter", "verb"]),
    const ClueQuestion(sentence: "The artist used ___ colors to create a sense of excitement.", clue: "Bright and striking.", correctWord: "vibrant", options: ["vibrant", "dull", "dark", "faded"]),
    const ClueQuestion(sentence: "The play was a ___, ending with a happy marriage for everyone.", clue: "A movie, play, or broadcast program intended to make an audience laugh.", correctWord: "comedy", options: ["comedy", "tragedy", "mystery", "thriller"]),
    const ClueQuestion(sentence: "The author's ___ was very descriptive and flowery.", clue: "A particular way in which something is done, created, or performed.", correctWord: "style", options: ["style", "ink", "paper", "cover"]),
    const ClueQuestion(sentence: "The statue was made of ___, making it very heavy and durable.", clue: "A yellowish-brown alloy of copper with up to one-third tin.", correctWord: "bronze", options: ["bronze", "wood", "plastic", "paper"]),
    const ClueQuestion(sentence: "The book's ___ kept the readers on the edge of their seats.", clue: "A state or feeling of excited or anxious uncertainty about what may happen.", correctWord: "suspense", options: ["suspense", "boredom", "index", "preface"]),
    const ClueQuestion(sentence: "The painting was an ___, showing shapes and colors instead of real objects.", clue: "Existing in thought or as an idea but not having a physical or concrete existence.", correctWord: "abstract", options: ["abstract", "realistic", "portrait", "landscape"]),
    const ClueQuestion(sentence: "The musician played a beautiful ___ on the piano.", clue: "A sequence of single notes that is musically satisfying.", correctWord: "melody", options: ["melody", "noise", "rhythm", "silence"]),
    const ClueQuestion(sentence: "The story had a deep ___, teaching the importance of kindness.", clue: "A lesson, especially one concerning what is right or prudent.", correctWord: "moral", options: ["moral", "page", "font", "price"]),

    // --- Set 8: Miscellaneous ---
    const ClueQuestion(sentence: "The clock struck ___, signaling the start of the new day.", clue: "Twelve o'clock at night.", correctWord: "midnight", options: ["midnight", "noon", "evening", "morning"]),
    const ClueQuestion(sentence: "He used a ___ to find his way through the thick forest.", clue: "An instrument containing a magnetized pointer.", correctWord: "compass", options: ["compass", "map", "watch", "lamp"]),
    const ClueQuestion(sentence: "The bridge was built to ___ the wide river.", clue: "To extend across.", correctWord: "span", options: ["span", "block", "avoid", "deepen"]),
    const ClueQuestion(sentence: "She wore a ___ of pearls around her neck.", clue: "A string of jewels, beads, or other items.", correctWord: "necklace", options: ["necklace", "bracelet", "ring", "earring"]),
    const ClueQuestion(sentence: "The car's ___ was nearly empty, so they had to stop for fuel.", clue: "A large container or reservoir for liquid or gas.", correctWord: "tank", options: ["tank", "trunk", "seat", "tire"]),
    const ClueQuestion(sentence: "He had a ___ of keys hanging from his belt.", clue: "A number of things, typically of the same kind, growing or fastened together.", correctWord: "bunch", options: ["bunch", "pile", "stack", "set"]),
    const ClueQuestion(sentence: "The wind was so ___ that it blew the hat off his head.", clue: "Having great power, influence, or ability.", correctWord: "strong", options: ["strong", "weak", "gentle", "still"]),
    const ClueQuestion(sentence: "The library is a ___ place where you can study in peace.", clue: "Making little or no noise.", correctWord: "quiet", options: ["quiet", "loud", "crowded", "dirty"]),
    const ClueQuestion(sentence: "She used a ___ to write a letter to her grandmother.", clue: "An instrument for writing or drawing with ink.", correctWord: "pen", options: ["pen", "brush", "knife", "spoon"]),
    const ClueQuestion(sentence: "The mountains were covered in ___ during the winter.", clue: "Atmospheric water vapor frozen into ice crystals.", correctWord: "snow", options: ["snow", "dust", "leaves", "sand"]),

    // --- Set 9: Adjectives ---
    const ClueQuestion(sentence: "The giant was ___, standing over ten feet tall.", clue: "Extremely large.", correctWord: "immense", options: ["immense", "tiny", "average", "thin"]),
    const ClueQuestion(sentence: "The puzzle was so ___ that it took hours to solve.", clue: "Difficult to understand or solve.", correctWord: "complex", options: ["complex", "simple", "short", "easy"]),
    const ClueQuestion(sentence: "The silk fabric felt very ___ against her skin.", clue: "Having an even and regular surface; free from perceptible projections.", correctWord: "smooth", options: ["smooth", "rough", "sharp", "sticky"]),
    const ClueQuestion(sentence: "The knife was extremely ___, easily cutting through the bread.", clue: "Having an edge or point that is able to cut or pierce something.", correctWord: "sharp", options: ["sharp", "dull", "heavy", "long"]),
    const ClueQuestion(sentence: "The room was ___, with plenty of space to move around.", clue: "Having ample space.", correctWord: "spacious", options: ["spacious", "cramped", "dark", "noisy"]),
    const ClueQuestion(sentence: "The sun was so ___ that I had to squint my eyes.", clue: "Giving out or reflecting much light.", correctWord: "bright", options: ["bright", "dim", "cold", "blue"]),
    const ClueQuestion(sentence: "The coffee was very ___, so I added some sugar.", clue: "Having a sharp, pungent taste or smell; not sweet.", correctWord: "bitter", options: ["bitter", "sweet", "salty", "creamy"]),
    const ClueQuestion(sentence: "The old man was ___, always ready to share his stories.", clue: "Having or showing experience, knowledge, and good judgment.", correctWord: "wise", options: ["wise", "foolish", "young", "angry"]),
    const ClueQuestion(sentence: "The athlete was ___, running the race in record time.", clue: "Moving or capable of moving with great speed.", correctWord: "swift", options: ["swift", "slow", "clumsy", "tired"]),
    const ClueQuestion(sentence: "The task was ___, requiring very little effort to complete.", clue: "Achieved without great effort; presenting few difficulties.", correctWord: "easy", options: ["easy", "hard", "boring", "long"]),

    // --- Set 10: Verbs ---
    const ClueQuestion(sentence: "He had to ___ the heavy box across the room.", clue: "To pull along with effort.", correctWord: "drag", options: ["drag", "push", "lift", "drop"]),
    const ClueQuestion(sentence: "She tried to ___ the secret from her little brother.", clue: "To keep from being seen; hide.", correctWord: "conceal", options: ["conceal", "show", "tell", "share"]),
    const ClueQuestion(sentence: "The bird began to ___ a beautiful song in the morning.", clue: "To make musical sounds with the voice.", correctWord: "sing", options: ["sing", "shout", "cry", "dance"]),
    const ClueQuestion(sentence: "They decided to ___ a new house in the suburbs.", clue: "To construct by putting parts or materials together.", correctWord: "build", options: ["build", "destroy", "buy", "sell"]),
    const ClueQuestion(sentence: "He had to ___ the car after the long journey.", clue: "To make clean by rubbing with water.", correctWord: "wash", options: ["wash", "drive", "break", "paint"]),
    const ClueQuestion(sentence: "She used a camera to ___ the beautiful landscape.", clue: "To take a photograph.", correctWord: "capture", options: ["capture", "ignore", "paint", "draw"]),
    const ClueQuestion(sentence: "He wanted to ___ the world and visit many countries.", clue: "To go from one place to another.", correctWord: "travel", options: ["travel", "stay", "work", "sleep"]),
    const ClueQuestion(sentence: "They had to ___ for the bus in the cold rain.", clue: "To stay where one is or delay action until a particular time.", correctWord: "wait", options: ["wait", "run", "jump", "sleep"]),
    const ClueQuestion(sentence: "She began to ___ after hearing the funny joke.", clue: "To make sounds and movements of the face that show amusement.", correctWord: "laugh", options: ["laugh", "cry", "scream", "yawn"]),
    const ClueQuestion(sentence: "He had to ___ the difficult math problem.", clue: "To find an answer to, explanation for, or means of effectively dealing with.", correctWord: "solve", options: ["solve", "create", "ignore", "forget"]),

    // --- Set 11: Food & Drink ---
    const ClueQuestion(sentence: "The bread was fresh and ___, straight from the oven.", clue: "Having a pleasantly crisp outer layer.", correctWord: "crusty", options: ["crusty", "soggy", "old", "burnt"]),
    const ClueQuestion(sentence: "She sipped the ___ tea to warm herself up.", clue: "Having a high temperature.", correctWord: "hot", options: ["hot", "icy", "sweet", "bitter"]),
    const ClueQuestion(sentence: "The lemon was very ___, making his face pucker.", clue: "Having an acid taste like lemon or vinegar.", correctWord: "sour", options: ["sour", "sweet", "salty", "bland"]),
    const ClueQuestion(sentence: "They enjoyed a ___ meal at the Italian restaurant.", clue: "Extremely pleasing to the sense of taste.", correctWord: "savory", options: ["savory", "sweet", "bitter", "sour"]),
    const ClueQuestion(sentence: "The steak was ___, cooked just the way he liked it.", clue: "Easy to cut or chew; not tough.", correctWord: "tender", options: ["tender", "tough", "raw", "burnt"]),
    const ClueQuestion(sentence: "She added a pinch of ___ to the soup to enhance the flavor.", clue: "A white crystalline substance used for seasoning.", correctWord: "salt", options: ["salt", "sugar", "pepper", "water"]),
    const ClueQuestion(sentence: "The fruit was ___, indicating it was ready to be eaten.", clue: "Developed to the point of readiness for harvesting and eating.", correctWord: "ripe", options: ["ripe", "rotten", "green", "hard"]),
    const ClueQuestion(sentence: "He drank a glass of ___ water after the long run.", clue: "Relatively low in temperature.", correctWord: "cold", options: ["cold", "boiling", "salty", "sweet"]),
    const ClueQuestion(sentence: "The chocolate was very ___, with a high cocoa content.", clue: "Having a deep, somewhat bitter taste.", correctWord: "dark", options: ["dark", "white", "sweet", "milky"]),
    const ClueQuestion(sentence: "They shared a ___ of pizza for lunch.", clue: "A thin, broad piece of food cut from a larger portion.", correctWord: "slice", options: ["slice", "loaf", "bowl", "plate"]),

    // --- Set 12: More Advanced Vocabulary ---
    const ClueQuestion(sentence: "The speaker was very ___, captivating the audience with his words.", clue: "Fluent or persuasive in speaking or writing.", correctWord: "eloquent", options: ["eloquent", "silent", "boring", "confused"]),
    const ClueQuestion(sentence: "The evidence was ___, proving his innocence beyond a doubt.", clue: "Not able to be doubted or questioned.", correctWord: "indisputable", options: ["indisputable", "flimsy", "weak", "false"]),
    const ClueQuestion(sentence: "He had an ___ desire to travel to every country in the world.", clue: "Too great to be satisfied or restrained.", correctWord: "insatiable", options: ["insatiable", "mild", "weak", "short"]),
    const ClueQuestion(sentence: "The instructions were ___, leaving no room for error.", clue: "Stated clearly and in detail.", correctWord: "explicit", options: ["explicit", "vague", "hidden", "long"]),
    const ClueQuestion(sentence: "She was known for her ___, always staying calm under pressure.", clue: "Self-possession; calmness.", correctWord: "composure", options: ["composure", "anger", "panic", "fear"]),
    const ClueQuestion(sentence: "The project was ___, requiring months of hard work.", clue: "Requiring great effort; laborious.", correctWord: "arduous", options: ["arduous", "easy", "brief", "fun"]),
    const ClueQuestion(sentence: "His behavior was ___, surprising everyone who knew him.", clue: "Different from what is usual or expected; strange.", correctWord: "peculiar", options: ["peculiar", "normal", "boring", "common"]),
    const ClueQuestion(sentence: "The smell was ___, filling the entire house in seconds.", clue: "Spreading widely throughout an area.", correctWord: "pervasive", options: ["pervasive", "faint", "localized", "pleasant"]),
    const ClueQuestion(sentence: "She gave a ___ smile, trying to hide her true feelings.", clue: "Using very few words.", correctWord: "laconic", options: ["laconic", "wide", "angry", "fake"]),
    const ClueQuestion(sentence: "The results were ___, leading to further investigation.", clue: "Not leading to a firm conclusion or result.", correctWord: "inconclusive", options: ["inconclusive", "final", "clear", "certain"]),

    // --- Set 13: Nature & Science Continued ---
    const ClueQuestion(sentence: "The ___ of the volcano was a terrifying sight.", clue: "An instance of erupting.", correctWord: "eruption", options: ["eruption", "sleep", "birth", "silence"]),
    const ClueQuestion(sentence: "The tides are caused by the ___ pull of the moon.", clue: "The force of gravity.", correctWord: "gravitational", options: ["gravitational", "magnetic", "electric", "solar"]),
    const ClueQuestion(sentence: "The ___ is the largest organ of the human body.", clue: "The thin layer of tissue forming the outer covering.", correctWord: "skin", options: ["skin", "heart", "brain", "liver"]),
    const ClueQuestion(sentence: "A ___ is a large body of ice that moves slowly over land.", clue: "A slowly moving mass or river of ice.", correctWord: "glacier", options: ["glacier", "river", "mountain", "desert"]),
    const ClueQuestion(sentence: "The process of ___ turns water vapor into liquid water.", clue: "The conversion of a vapor or gas to a liquid.", correctWord: "condensation", options: ["condensation", "evaporation", "freezing", "melting"]),
    const ClueQuestion(sentence: "Plants need ___ to grow and produce food.", clue: "Radiant energy emitted by the sun.", correctWord: "sunlight", options: ["sunlight", "shade", "darkness", "wind"]),
    const ClueQuestion(sentence: "The ___ system includes the heart and blood vessels.", clue: "Relating to the circulation of blood.", correctWord: "circulatory", options: ["circulatory", "digestive", "nervous", "respiratory"]),
    const ClueQuestion(sentence: "A ___ is a scientist who studies the earth and its rocks.", clue: "An expert in geology.", correctWord: "geologist", options: ["geologist", "biologist", "chemist", "physicist"]),
    const ClueQuestion(sentence: "The ___ is the center of an atom, containing protons and neutrons.", clue: "The central and most important part.", correctWord: "nucleus", options: ["nucleus", "shell", "orbit", "wave"]),
    const ClueQuestion(sentence: "The ___ of energy cannot be created or destroyed.", clue: "The action of conserving something.", correctWord: "conservation", options: ["conservation", "waste", "loss", "creation"]),

    // --- Set 14: Daily Activities ---
    const ClueQuestion(sentence: "She used a ___ to brush her hair in the morning.", clue: "A device with a handle and wire or plastic bristles.", correctWord: "hairbrush", options: ["hairbrush", "toothbrush", "spoon", "key"]),
    const ClueQuestion(sentence: "He went to the ___ to buy some fresh vegetables.", clue: "A place where people regularly gather for the purchase and sale of food.", correctWord: "market", options: ["market", "library", "park", "gym"]),
    const ClueQuestion(sentence: "They took a ___ to reach the top floor of the building.", clue: "A platform or compartment housed in a shaft for raising and lowering people.", correctWord: "elevator", options: ["elevator", "staircase", "ladder", "window"]),
    const ClueQuestion(sentence: "She used a ___ to keep her clothes clean while cooking.", clue: "A protective garment worn over the front of one's clothes.", correctWord: "apron", options: ["apron", "hat", "glove", "scarf"]),
    const ClueQuestion(sentence: "He checked his ___ to see if it was time for lunch.", clue: "A small timepiece worn on a strap on one's wrist.", correctWord: "watch", options: ["watch", "phone", "clock", "calendar"]),
    const ClueQuestion(sentence: "They decided to ___ in the park on a sunny afternoon.", clue: "To walk for pleasure.", correctWord: "stroll", options: ["stroll", "run", "sleep", "work"]),
    const ClueQuestion(sentence: "She used a ___ to lock the front door.", clue: "A small piece of shaped metal used for operating a lock.", correctWord: "key", options: ["key", "pen", "knife", "fork"]),
    const ClueQuestion(sentence: "He put on his ___ before going out for a run.", clue: "Soft shoes worn for sports or casual activities.", correctWord: "sneakers", options: ["sneakers", "boots", "sandals", "heels"]),
    const ClueQuestion(sentence: "They used a ___ to carry their groceries home.", clue: "A container used for carrying things.", correctWord: "bag", options: ["bag", "box", "plate", "cup"]),
    const ClueQuestion(sentence: "She read a ___ before going to sleep at night.", clue: "A written or printed work consisting of pages glued or sewn together.", correctWord: "book", options: ["book", "movie", "song", "game"]),

    // --- Set 15: Abstract Concepts ---
    const ClueQuestion(sentence: "They fought for their ___ and rights.", clue: "The power or right to act, speak, or think as one wants.", correctWord: "freedom", options: ["freedom", "chains", "walls", "fear"]),
    const ClueQuestion(sentence: "She had great ___ in her ability to succeed.", clue: "The feeling or belief that one can rely on someone or something.", correctWord: "confidence", options: ["confidence", "doubt", "fear", "shame"]),
    const ClueQuestion(sentence: "The ___ of the situation was difficult to grasp.", clue: "The state of being complex or intricate.", correctWord: "complexity", options: ["complexity", "simplicity", "length", "color"]),
    const ClueQuestion(sentence: "He showed great ___ by facing his fears.", clue: "The ability to do something that frightens one.", correctWord: "courage", options: ["courage", "cowardice", "laziness", "anger"]),
    const ClueQuestion(sentence: "The ___ of the two friends was evident to everyone.", clue: "The state of being friends.", correctWord: "friendship", options: ["friendship", "hatred", "rivalry", "silence"]),
    const ClueQuestion(sentence: "She felt a sense of ___ after finishing her work.", clue: "A feeling of being satisfied.", correctWord: "satisfaction", options: ["satisfaction", "guilt", "boredom", "hunger"]),
    const ClueQuestion(sentence: "The ___ of the story was very inspiring.", clue: "The subject of a talk, a piece of writing, a person's thoughts, or an exhibition.", correctWord: "theme", options: ["theme", "font", "ink", "price"]),
    const ClueQuestion(sentence: "He had a lot of ___ for his upcoming trip.", clue: "A feeling of excited anticipation.", correctWord: "enthusiasm", options: ["enthusiasm", "dread", "boredom", "fear"]),
    const ClueQuestion(sentence: "The ___ of the two countries led to a peaceful resolution.", clue: "The process of working together to the same end.", correctWord: "cooperation", options: ["cooperation", "war", "rivalry", "silence"]),
    const ClueQuestion(sentence: "She had a deep ___ for the beauty of nature.", clue: "The recognition and enjoyment of the good qualities of someone or something.", correctWord: "appreciation", options: ["appreciation", "hatred", "fear", "neglect"]),

    // --- Set 16: Technology & Future ---
    const ClueQuestion(sentence: "The ___ is a global network of computers.", clue: "A global computer network providing a variety of information.", correctWord: "internet", options: ["internet", "radio", "television", "book"]),
    const ClueQuestion(sentence: "___ intelligence is being used in many new applications.", clue: "The theory and development of computer systems.", correctWord: "artificial", options: ["artificial", "natural", "human", "slow"]),
    const ClueQuestion(sentence: "The ___ allows us to store large amounts of data.", clue: "Computing services provided over the internet.", correctWord: "cloud", options: ["cloud", "ground", "box", "paper"]),
    const ClueQuestion(sentence: "The new ___ is faster and more efficient than the old one.", clue: "A device or machine, especially a computer.", correctWord: "hardware", options: ["hardware", "software", "paper", "wood"]),
    const ClueQuestion(sentence: "They used a ___ to print their documents.", clue: "A machine for printing text or pictures onto paper.", correctWord: "printer", options: ["printer", "monitor", "mouse", "keyboard"]),
    const ClueQuestion(sentence: "The ___ of the computer is where the operating system is stored.", clue: "A high-capacity self-contained storage device.", correctWord: "hard-drive", options: ["hard-drive", "monitor", "mouse", "keyboard"]),
    const ClueQuestion(sentence: "___ reality is becoming more popular in gaming.", clue: "The computer-generated simulation of a three-dimensional image.", correctWord: "virtual", options: ["virtual", "real", "boring", "flat"]),
    const ClueQuestion(sentence: "The ___ of the robot allowed it to move on its own.", clue: "An automated machine that can execute specific tasks.", correctWord: "robotics", options: ["robotics", "magic", "luck", "wind"]),
    const ClueQuestion(sentence: "The ___ of the data was protected by a password.", clue: "The state of being free from danger or threat.", correctWord: "security", options: ["security", "danger", "freedom", "public"]),
    const ClueQuestion(sentence: "The ___ of the new phone is very clear and sharp.", clue: "A device for displaying words, symbols, or images.", correctWord: "screen", options: ["screen", "button", "battery", "case"]),

    // --- Set 17: More Advanced Adjectives ---
    const ClueQuestion(sentence: "His speech was ___, leaving everyone inspired.", clue: "Profoundly moving or touching.", correctWord: "poignant", options: ["poignant", "boring", "loud", "short"]),
    const ClueQuestion(sentence: "The situation was ___, requiring immediate action.", clue: "Extremely serious or urgent.", correctWord: "dire", options: ["dire", "minor", "fun", "common"]),
    const ClueQuestion(sentence: "She was ___, always looking for the hidden meaning.", clue: "Having or showing deep insight or knowledge.", correctWord: "profound", options: ["profound", "shallow", "stupid", "bored"]),
    const ClueQuestion(sentence: "The room was ___, with no furniture or decorations.", clue: "Lacking in liveliness, charm, or interest.", correctWord: "stark", options: ["stark", "colorful", "crowded", "fancy"]),
    const ClueQuestion(sentence: "His behavior was ___, unpredictable and strange.", clue: "Not even or regular in pattern or movement.", correctWord: "erratic", options: ["erratic", "stable", "boring", "slow"]),
    const ClueQuestion(sentence: "The results were ___, surprising even the researchers.", clue: "Causing a lot of excitement and interest.", correctWord: "sensational", options: ["sensational", "dull", "common", "bad"]),
    const ClueQuestion(sentence: "She was ___, always ready to help anyone in need.", clue: "Showing a selfless concern for the well-being of others.", correctWord: "altruistic", options: ["altruistic", "selfish", "greedy", "lazy"]),
    const ClueQuestion(sentence: "The evidence was ___, proving the case once and for all.", clue: "Ending or resolving a debate or dispute.", correctWord: "conclusive", options: ["conclusive", "weak", "false", "vague"]),
    const ClueQuestion(sentence: "The atmosphere was ___, filled with tension and fear.", clue: "Feeling as though something bad is about to happen.", correctWord: "ominous", options: ["ominous", "cheerful", "calm", "bright"]),
    const ClueQuestion(sentence: "His work was ___, showing great attention to detail.", clue: "Extremely careful and precise.", correctWord: "meticulous", options: ["meticulous", "sloppy", "fast", "easy"]),

    // --- Set 18: Verbs Continued ---
    const ClueQuestion(sentence: "She tried to ___ the tense situation with a joke.", clue: "To make less intense or severe.", correctWord: "mitigate", options: ["mitigate", "worsen", "ignore", "start"]),
    const ClueQuestion(sentence: "He had to ___ his decision after hearing the new evidence.", clue: "To think about again, especially in order to change or modify.", correctWord: "reconsider", options: ["reconsider", "ignore", "forget", "hurry"]),
    const ClueQuestion(sentence: "They decided to ___ the two projects into one.", clue: "To combine or cause to combine into a single entity.", correctWord: "merge", options: ["merge", "split", "delete", "start"]),
    const ClueQuestion(sentence: "She was able to ___ the difficult puzzle in record time.", clue: "To find a solution to or an answer for.", correctWord: "resolve", options: ["resolve", "create", "break", "lose"]),
    const ClueQuestion(sentence: "He had to ___ his feelings to avoid hurting hers.", clue: "To prevent the expression of.", correctWord: "suppress", options: ["suppress", "show", "shout", "share"]),
    const ClueQuestion(sentence: "They were able to ___ the problem and find a solution.", clue: "To recognize or establish as being a particular person or thing.", correctWord: "identify", options: ["identify", "ignore", "forget", "miss"]),
    const ClueQuestion(sentence: "She tried to ___ her friend to join the team.", clue: "To induce to do something through reasoning or argument.", correctWord: "persuade", options: ["persuade", "force", "ignore", "fear"]),
    const ClueQuestion(sentence: "He had to ___ the instructions carefully to avoid making a mistake.", clue: "To act in accordance with a wish or command.", correctWord: "comply", options: ["comply", "ignore", "fight", "run"]),
    const ClueQuestion(sentence: "They were able to ___ the new technology into their business.", clue: "To combine one thing with another so that they become a whole.", correctWord: "integrate", options: ["integrate", "exclude", "break", "fear"]),
    const ClueQuestion(sentence: "She had to ___ her time between work and family.", clue: "To separate into two or more parts.", correctWord: "divide", options: ["divide", "keep", "waste", "save"]),

    // --- Set 19: Nature & Environment ---
    const ClueQuestion(sentence: "The ___ of the forest is essential for the planet.", clue: "The state of being varied.", correctWord: "biodiversity", options: ["biodiversity", "sameness", "silence", "darkness"]),
    const ClueQuestion(sentence: "The ___ of the sun provides energy for all life on earth.", clue: "Relating to the sun.", correctWord: "solar", options: ["solar", "lunar", "wind", "water"]),
    const ClueQuestion(sentence: "We must protect the ___ for future generations.", clue: "The surroundings or conditions in which a person, animal, or plant lives.", correctWord: "environment", options: ["environment", "city", "house", "room"]),
    const ClueQuestion(sentence: "The ___ of the polar ice caps is a serious concern.", clue: "The process of becoming liquid.", correctWord: "melting", options: ["melting", "freezing", "growing", "shining"]),
    const ClueQuestion(sentence: "___ energy sources are better for the environment.", clue: "Capable of being renewed.", correctWord: "renewable", options: ["renewable", "exhaustible", "dirty", "old"]),
    const ClueQuestion(sentence: "The ___ of the soil is important for growing crops.", clue: "The quality of being fertile.", correctWord: "fertility", options: ["fertility", "dryness", "hardness", "salt"]),
    const ClueQuestion(sentence: "The ___ of the ozone layer protects us from UV radiation.", clue: "The action of reducing something.", correctWord: "depletion", options: ["depletion", "growth", "shining", "color"]),
    const ClueQuestion(sentence: "We should ___ our waste to reduce pollution.", clue: "The action of processing used materials.", correctWord: "recycle", options: ["recycle", "waste", "burn", "bury"]),
    const ClueQuestion(sentence: "The ___ of the river was polluted by industrial waste.", clue: "The quality of being clean.", correctWord: "purity", options: ["purity", "dirt", "color", "salt"]),
    const ClueQuestion(sentence: "The ___ of the trees is essential for producing oxygen.", clue: "The process of cutting down trees.", correctWord: "deforestation", options: ["deforestation", "planting", "growing", "shining"]),

    // --- Set 20: Final Challenge ---
    const ClueQuestion(sentence: "The ___ of the two theories led to a new discovery.", clue: "The combination of ideas to form a theory or system.", correctWord: "synthesis", options: ["synthesis", "split", "clash", "silence"]),
    const ClueQuestion(sentence: "His behavior was ___, surprising even his closest friends.", clue: "Difficult to interpret or understand; mysterious.", correctWord: "enigmatic", options: ["enigmatic", "clear", "boring", "common"]),
    const ClueQuestion(sentence: "The evidence was ___, proving the case once and for all.", clue: "Leading to a firm conclusion.", correctWord: "decisive", options: ["decisive", "weak", "false", "vague"]),
    const ClueQuestion(sentence: "She was ___, always looking for the positive side of things.", clue: "Hopeful and confident about the future.", correctWord: "optimistic", options: ["optimistic", "sad", "angry", "bored"]),
    const ClueQuestion(sentence: "The ___ of the meeting was to discuss the new project.", clue: "The reason for which something is done or created.", correctWord: "purpose", options: ["purpose", "font", "ink", "price"]),
    const ClueQuestion(sentence: "He had a ___ for music, playing three instruments.", clue: "A natural skill or talent.", correctWord: "talent", options: ["talent", "fear", "hatred", "struggle"]),
    const ClueQuestion(sentence: "The ___ of the two countries led to a peaceful resolution.", clue: "A state of agreement or typical behavior.", correctWord: "harmony", options: ["harmony", "war", "rivalry", "silence"]),
    const ClueQuestion(sentence: "She had a deep ___ for the beauty of the mountains.", clue: "The recognition and enjoyment of good qualities.", correctWord: "appreciation", options: ["appreciation", "hatred", "fear", "neglect"]),
    const ClueQuestion(sentence: "The ___ of the situation was difficult to grasp.", clue: "The state of being complex.", correctWord: "complexity", options: ["complexity", "simplicity", "length", "color"]),
    const ClueQuestion(sentence: "He showed great ___ by facing his fears and challenges.", clue: "The ability to do something that frightens one.", correctWord: "courage", options: ["courage", "fear", "laziness", "anger"]),
  ];

  List<ClueQuestion> generateQuestionsForLevel(int level) {
    // Return all questions with their options shuffled
    return _questionsPool.map((q) {
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
