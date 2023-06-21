import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './configuration.dart';
import './models/info_screen_data.dart';
import './models/question.dart';
import './models/questions.dart';
import 'screens/details_screen.dart';
import 'screens/list_screen.dart';

/// The CatechismApp class is used to create a catechism app.
class CatechismApp extends StatelessWidget {
  /// The questions property is used to create the list of questions.
  final List<Question> questions;

  /// The titles property is used to create the list of titles.
  final List<String> titles;

  /// The themeData property is used to create the theme data.
  final ThemeData themeData;

  /// The configuration property is used to create the configuration.
  final CatechismConfiguration configuration;

  /// The supportedLocales property is used to create the list of supported
  /// locales.
  final List<Locale> supportedLocales;

  /// The infoScreens property is used to create the list of info screens.
  final List<InfoScreenData> infoScreens;

  /// The CatechismApp constructor is used to create a catechism app.
  CatechismApp({
    required this.questions,
    required this.titles,
    required this.themeData,
    required this.configuration,
    required this.supportedLocales,
    required this.infoScreens,
  });

  /// The build method is used to create the widget.
  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> routes = {
      ListScreen.routeName: (context) => ListScreen(
            titles: titles,
            configuration: configuration,
            infoScreens: infoScreens,
          ),
      DetailsScreen.routeName: (context) => DetailsScreen(
            titles: titles,
            configuration: configuration,
          )
    };

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Questions(questions),
        ),
      ],
      child: MaterialApp(
        title: titles.join(" "),
        theme: themeData,
        supportedLocales: supportedLocales,
        routes: routes,
      ),
    );
  }
}
