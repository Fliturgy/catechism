import 'package:catechism/src/features/configuration/data/configuration_provider.dart';
import 'package:catechism/src/features/configuration/data/titles_provider.dart';
import 'package:catechism/src/features/configuration/domain/configuration.dart';
import 'package:catechism/src/features/configuration/domain/localized_titles.dart';
import 'package:catechism/src/features/custom_pages/data/custom_page_provider.dart';
import 'package:catechism/src/features/custom_pages/domain/localized_custom_pages.dart';
import 'package:catechism/src/features/questions/data/question_provider.dart';
import 'package:catechism/src/features/questions/domain/localized_questions.dart';
import 'package:catechism/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The CatechismApp class is used to create a catechism app.
class CatechismApp extends StatelessWidget {
  /// The questions property is used to create the list of questions.
  final LocalizedQuestions questions;

  /// The titles property is used to create the list of titles.
  final LocalizedTitles titles;

  /// The themeData property is used to create the theme data.
  final ThemeData themeData;

  /// The configuration property is used to create the configuration.
  final CatechismConfiguration configuration;

  /// The supportedLocales property is used to create the list of supported
  /// locales.
  final List<Locale> supportedLocales;

  /// The customPages property is used to create the list of info screens.
  final LocalizedCustomPages customPages;

  /// The CatechismApp constructor is used to create a catechism app.
  CatechismApp({
    required this.questions,
    required this.titles,
    required this.themeData,
    required this.configuration,
    required this.supportedLocales,
    required this.customPages,
  }) {
    questionProvider = Provider<LocalizedQuestions>((ref) => questions);
    titlesProvider = Provider<LocalizedTitles>((ref) => titles);
    configurationProvider =
        Provider<CatechismConfiguration>((ref) => configuration);
    customPageProvider = Provider<LocalizedCustomPages>((ref) => customPages);
  }

  /// The build method is used to create the widget.
  @override
  Widget build(BuildContext context) {
    final goRouter = CatechismRouter(customPages: customPages).getRouter();

    return MaterialApp.router(
      title: titles.defaultTitles.join(" "),
      theme: themeData,
      supportedLocales: supportedLocales,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
