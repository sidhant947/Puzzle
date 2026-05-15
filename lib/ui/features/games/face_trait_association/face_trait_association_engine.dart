import 'dart:math';

class FaceTrait {
  final String name;
  final String occupation;
  final String hobby;
  final String imageUrl;

  FaceTrait({
    required this.name,
    required this.occupation,
    required this.hobby,
    required this.imageUrl,
  });
}

class FaceTraitAssociationEngine {
  final Random _random = Random();

  final List<String> _names = [
    'Alice', 'Bob', 'Charlie', 'Diana', 'Ethan', 'Fiona', 'George', 'Hannah',
    'Ivan', 'Julia', 'Kevin', 'Laura', 'Michael', 'Nina', 'Oscar', 'Paula'
  ];

  final List<String> _occupations = [
    'Baker', 'Doctor', 'Engineer', 'Artist', 'Teacher', 'Farmer', 'Pilot', 'Chef',
    'Lawyer', 'Nurse', 'Writer', 'Musician', 'Coach', 'Scientist', 'Architect', 'Dentist'
  ];

  final List<String> _hobbies = [
    'Golf', 'Painting', 'Cooking', 'Reading', 'Hiking', 'Swimming', 'Chess', 'Dancing',
    'Gardening', 'Cycling', 'Photography', 'Yoga', 'Running', 'Skiing', 'Fishing', 'Tennis'
  ];

  // We'll use icons instead of actual images for simplicity, or just avatars.
  final List<String> _faceIcons = [
    '👤', '👥', '🧑', '👧', '👦', '👩', '👨', '👵', '👴', '👱', '👲', '👳', '👮', '👷', '💂', '🕵'
  ];

  List<FaceTrait> generateTrials() {
    const int count = 4;

    final shuffledNames = List<String>.from(_names)..shuffle(_random);
    final shuffledOccupations = List<String>.from(_occupations)..shuffle(_random);
    final shuffledHobbies = List<String>.from(_hobbies)..shuffle(_random);
    final shuffledIcons = List<String>.from(_faceIcons)..shuffle(_random);

    return List.generate(count, (i) {
      return FaceTrait(
        name: shuffledNames[i],
        occupation: shuffledOccupations[i],
        hobby: shuffledHobbies[i],
        imageUrl: shuffledIcons[i],
      );
    });
  }
}
