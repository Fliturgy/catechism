import 'package:catechism/catechism.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(const ProviderScope(child: ExampleCatechismApp()));
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
      customPages: customPages,
    );
  }
}

final List<Question> questions = [
  Question(
    id: 1,
    title: 'Question 1',
    titleShort: '1',
    question: 'What is this?',
    answer: 'This is an example of a catechism app.',
    references: [
      QuestionReference(
        title: 'Source 1',
        content: ['blah blah blah'],
      ),
      QuestionReference(
        title: 'Source XYZ',
        content: [
          'yadda',
          'yadda',
          'yadda',
        ],
      ),
    ],
    image: 'assets/graphics/question-mark.png',
  ),
  Question(
    id: 2,
    title: 'Question 2',
    titleShort: '2',
    question: 'Why a catechism?',
    answer: 'It\'s an effective learning tool.',
    prayer: [
      'Our Father which art in heaven, Hallowed be thy name.',
      'Thy kingdom come.',
      'Thy will be done in earth, as it is in heaven.',
      'Give us this day our daily bread.',
      'And forgive us our debts, as we forgive our debtors.',
      'And lead us not into temptation, but deliver us from evil:',
      'For thine is the kingdom, and the power, and the glory, for ever.',
      'Amen.',
    ],
  ),
  Question(
    id: 3,
    title: 'Question 3',
    titleShort: '3',
    question:
        'What do really long questions look like? Do they wrap properly? Do they align properly?',
    answer:
        'Yes, we have tested really long questions (and answers) to make sure that they look good and wrap and align properly.',
    notes: [
      'this is a footnote',
      'and now another one',
    ],
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
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
      fontSize: 16.0,
    ),
    headlineMedium: TextStyle(
      fontSize: 20.0,
    ),
    displaySmall: TextStyle(
      fontSize: 16.0,
    ),
    bodyLarge: TextStyle(
      fontSize: 18.0,
    ),
    headlineLarge: TextStyle(
      fontSize: 24.0,
    ),
  ),
);

final configuration = CatechismConfiguration(
  displayQuestionTitleShortInDetails: false,
  displayQuestionPrayer: true,
  displayQuestionNotes: true,
);

final List<Locale> locales = [
  const Locale('en'),
  const Locale('es'),
];

final List<CustomPageData> customPages = [
  CustomPageData(
    title: 'About',
    content: ['This is an example of a catechism app.'],
    routeName: 'about',
  ),
  CustomPageData(
    title: 'Privacy Policy',
    content: ['We don\'t collect any data.'],
    routeName: 'privacy',
  ),
];
