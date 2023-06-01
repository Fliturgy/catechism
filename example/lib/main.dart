import 'package:catechism/catechism.dart';
import 'package:flutter/material.dart';

final List<Question> questions = [
  Question(
    id: 1,
    title: '',
    question: 'What is this?',
    answer: 'This is an example of a catechism app.',
  ),
];

final ThemeData themeData = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

final configuration = CatechismConfiguration(
  displayQuestionNumberInDetails: false,
  displayQuestionTitleInDetails: true,
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
