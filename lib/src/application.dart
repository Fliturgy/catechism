import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './configuration.dart';
import './models/info_screen_data.dart';
import './models/question.dart';
import './models/questions.dart';
import './screens/catechism_details_screen.dart';
import './screens/catechism_list_screen.dart';
import './screens/info_screen.dart';

class CatechismApp extends StatelessWidget {
  /// The CatechismApp class is used to create a catechism app.

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

  @override
  Widget build(BuildContext context) {
    /// The build method is used to create the widget.
    Map<String, WidgetBuilder> routes = {
      CatechismListScreen.routeName: (context) => CatechismListScreen(
            titles: titles,
            configuration: configuration,
            infoScreens: infoScreens,
          ),
      CatechismDetailsScreen.routeName: (context) => CatechismDetailsScreen(
            titles: titles,
            configuration: configuration,
          )
    };

    for (var infoScreen in infoScreens) {
      routes[infoScreen.routeName] = (BuildContext context) => InfoScreen(
          titles: titles,
          configuration: configuration,
          infoScreenData: infoScreen);
    }

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
