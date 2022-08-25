class Qusetions {
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;

  Qusetions({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
}

class Option {
  final String text;
  final bool isCorrect;

  const Option({
    required this.text,
    required this.isCorrect,
  });
}

final qusestions = [
  Qusetions(
    text:
        'Which of the following is NOT a way in which plant seeds can be spread out?',
    options: [
      const Option(text: 'Stick to animals', isCorrect: false),
      const Option(text: 'Bury under the soil', isCorrect: true),
      const Option(text: ' Fly with the wind', isCorrect: false),
    ],
  ),
  Qusetions(
    text: 'In general, plants could be divided into which two main groups?',
    options: [
      const Option(
          text: 'Flowering plants and non-flowering plants', isCorrect: true),
      const Option(
          text: ' Fruiting plants and non-fruiting plants', isCorrect: false),
      const Option(
          text: 'Deciduous plants and evergreen plants', isCorrect: false),
    ],
  ),
  Qusetions(
    text: ' Why do some plants have sharp thorns or spines?',
    options: [
      const Option(
          text: 'To attract bees and other pollinators', isCorrect: false),
      const Option(
          text: 'To collect more water and sunlight', isCorrect: false),
      const Option(
          text: 'To defence against animals that feed on them',
          isCorrect: true),
    ],
  ),
  Qusetions(
    text: 'What is the name of the male part of a flower?',
    options: [
      const Option(text: 'Carpel', isCorrect: false),
      const Option(text: ' Stamen', isCorrect: true),
      const Option(text: 'Stigma', isCorrect: false),
    ],
  ),
  Qusetions(
    text: 'How do dandelions spread their seeds for reproduction?',
    options: [
      const Option(
          text: ' To let their seeds spread on the water', isCorrect: false),
      const Option(
          text: 'To let their seeds carried by birds or animals',
          isCorrect: false),
      const Option(
          text: ' To let their seeds fly with the wind', isCorrect: true),
    ],
  ),
//   Qusetions(
//     text: ' Which of the following is actually NOT a type of plant?',
//     options: [
//       const Option(text: ' Mushroom', isCorrect: true),
//       const Option(text: 'Moss', isCorrect: false),
//       const Option(text: 'Giant water lily', isCorrect: false),
//     ],
//   ),
//  Qusetions(
//     text: ' Which of the following is actually NOT a type of plant?',
//     options: [
//       const Option(text: ' Mushroom', isCorrect: true),
//       const Option(text: 'Moss', isCorrect: false),
//       const Option(text: 'Giant water lily', isCorrect: false),
//     ],
//   ),
];
