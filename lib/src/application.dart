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
  final List<Question> questions;
  final List<String> titles;
  final ThemeData themeData;
  final CatechismConfiguration configuration;
  final List<Locale> supportedLocales;
  final List<InfoScreenData> infoScreens;

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
