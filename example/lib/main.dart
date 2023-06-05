import 'package:catechism/catechism.dart';
import 'package:flutter/material.dart';

final List<Question> questions = [
  Question(
    id: 1,
    title: '',
    question: 'What is this?',
    answer: 'This is an example of a catechism app.',
    references: [
      'Source 1',
      'Source XYZ',
    ],
    image: 'assets/graphics/question-mark.png',
  ),
  Question(
    id: 2,
    title: '',
    question: 'Why a catechism?',
    answer: 'It\'s an effective learning tool.',
  ),
];

final ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
  ),
);

final configuration = CatechismConfiguration(
  displayQuestionNumberInDetails: true,
  displayQuestionTitleInDetails: false,
  tabs: const [
    CatechismTabData(
      type: CatechismTabType.question,
      label: 'Question',
      icon: Icons.question_answer_outlined,
    ),
    CatechismTabData(
      type: CatechismTabType.scripture,
      label: 'References',
      icon: Icons.menu_book,
    ),
    CatechismTabData(
      type: CatechismTabType.image,
      label: 'Image',
      icon: Icons.image,
    ),
  ],
  showTabBar: true,
);

final List<Locale> locales = [
  const Locale('en'),
  const Locale('es'),
];

void main() {
  runApp(const ExampleCatechismApp());
}

class ExampleCatechismApp extends StatelessWidget {
  const ExampleCatechismApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CatechismApp(
      questions: questions,
      titles: const ['Example Catechism App'],
      themeData: themeData,
      configuration: configuration,
      supportedLocales: locales,
      infoScreens: const [],
    );
  }
}
