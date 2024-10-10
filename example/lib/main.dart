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
      questions: localizedQuestions,
      titles: localizedTitles,
      themeData: themeData,
      configuration: configuration,
      supportedLocales: locales,
      customPages: localizedCustomPages,
    );
  }
}

final LocalizedTitles localizedTitles = LocalizedTitles(
  localizedTitles: {
    'en': TitleData(
      title: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text('Example Catechism App'),
      ),
      height: 80.0,
    ),
    'es': TitleData(
      title: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text('Ejemplo de aplicación'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text('de catecismo'),
            ),
          ),
        ],
      ),
      height: 140.0,
    ),
  },
  defaultTitle: TitleData(
    title: Text('Example Catechism App'),
    height: 80.0,
  ),
);

final LocalizedQuestions localizedQuestions = LocalizedQuestions(
  localizedQuestions: {
    'en': enQuestions,
    'es': esQuestions,
  },
  defaultQuestions: enQuestions,
);

final List<Question> enQuestions = [
  Question(
    id: 1,
    title: const Text('Question 1'),
    titleShort: const Text('1'),
    question: const Text('What is this?'),
    answer: const Text('This is an example of a catechism app.'),
    references: [
      QuestionReference(
        title: const Text('Source 1'),
        content: const Text('blah blah blah'),
      ),
      QuestionReference(
        title: const Text('Source XYZ'),
        content: Text(
          [
            'yadda',
            'yadda',
            'yadda',
          ].join('\n'),
        ),
      ),
    ],
    image: 'assets/graphics/question-mark.png',
  ),
  Question(
    id: 2,
    title: const Text('Question 2'),
    titleShort: const Text('2'),
    question: const Text('Why a catechism?'),
    answer: const Text('It\'s an effective learning tool.'),
    prayer: Text(
      [
        'Our Father which art in heaven, Hallowed be thy name.',
        'Thy kingdom come.',
        'Thy will be done in earth, as it is in heaven.',
        'Give us this day our daily bread.',
        'And forgive us our debts, as we forgive our debtors.',
        'And lead us not into temptation, but deliver us from evil:',
        'For thine is the kingdom, and the power, and the glory, for ever.',
        'Amen.',
      ].join('\n'),
    ),
  ),
  Question(
    id: 3,
    title: const Text('Question 3'),
    titleShort: const Text('3'),
    question: const Text(
      'What do really long questions look like? Do they wrap properly? Do they align properly?',
    ),
    answer: const Text(
      'Yes, we have tested really long questions (and answers) to make sure that they look good and wrap and align properly.',
    ),
    notes: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('this is a footnote'),
        SizedBox(height: 50.0),
        Text('and now another one'),
        SizedBox(height: 50.0),
      ],
    ),
  ),
];

final List<Question> esQuestions = [
  Question(
    id: 1,
    title: const Text('Pregunta 1'),
    titleShort: const Text('1'),
    question: const Text('¿Qué es esto?'),
    answer: const Text('Este es un ejemplo de una aplicación de catecismo.'),
    references: [
      QuestionReference(
        title: const Text('Fuente 1'),
        content: const Text('blah blah blah'),
      ),
      QuestionReference(
        title: const Text('Fuente 2'),
        content: Text(
          [
            'yadda',
            'yadda',
            'yadda',
          ].join('\n'),
        ),
      ),
    ],
    prayer: Text(
      [
        'Padre nuestro que estás en los cielos, santificado sea tu nombre.',
        'Venga tu reino.',
        'Hágase tu voluntad, como en el cielo, así también en la tierra.',
        'Danos hoy nuestro pan de cada día.',
        'Y perdónanos nuestras deudas, como también nosotros perdonamos a nuestros deudores.',
        'Y no nos metas en tentación, mas líbranos del mal; porque tuyo es el reino, y el poder, y la gloria, por todos los siglos.',
        'Amén.',
      ].join('\n'),
    ),
    notes: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('esta es una nota al pie'),
        SizedBox(height: 50.0),
        Text('y ahora otro'),
        SizedBox(height: 50.0),
      ],
    ),
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
    titleLarge: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
    ),
  ),
);

final configuration = CatechismConfiguration(
  displayQuestionTitleShortInDetails: false,
  displayQuestionPrayer: true,
  displayQuestionNotes: true,
  defaultAppTitle: 'Example Catechism App',
);

final List<Locale> locales = [
  const Locale('en'),
  const Locale('es'),
];

final LocalizedCustomPages localizedCustomPages = LocalizedCustomPages(
  localizedCustomPages: {
    'en': enCustomPages,
    'es': esCustomPages,
  },
  defaultCustomPages: enCustomPages,
);

final List<CustomPageData> enCustomPages = [
  CustomPageData(
    title: const Text('About'),
    content: const Text('This is an example of a catechism app.'),
    routeName: 'about',
  ),
  CustomPageData(
    title: const Text('Privacy Policy'),
    content: const Text('We don\'t collect any data.'),
    routeName: 'privacy',
  ),
];

final List<CustomPageData> esCustomPages = [
  CustomPageData(
    title: const Text('Acerca de esta aplicación'),
    content: const Text('Este es un ejemplo de una aplicación de catecismo.'),
    routeName: 'about-es',
  ),
  CustomPageData(
    title: const Text('Política de privacidad'),
    content: const Text('No recopilamos ningún dato.'),
    routeName: 'privacy-es',
  ),
];
