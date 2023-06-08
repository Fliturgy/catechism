import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../configuration.dart';
import '../models/info_screen_data.dart';
import '../models/questions.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';
import '../widgets/question_list_item.dart';

class CatechismListScreen extends StatelessWidget {
  /// The CatechismListScreen class is used to create a screen that displays
  /// the list of questions as well as the catechism app bar.

  /// The routeName property is used to create the route name for the
  /// CatechismListScreen class.
  static const routeName = '/';

  /// The titles property is used to create the list of titles for the
  /// CatechismListScreen class.
  final List<String> titles;

  /// The configuration property is used to create the configuration for the
  /// CatechismListScreen class.
  final CatechismConfiguration configuration;

  /// The infoScreens property is used to create the list of info screens for
  /// the CatechismListScreen class.
  final List<InfoScreenData> infoScreens;

  /// The CatechismListScreen constructor is used to create a catechism list
  /// screen.
  CatechismListScreen({
    required this.titles,
    required this.configuration,
    required this.infoScreens,
  });

  @override
  Widget build(BuildContext context) {
    /// The build method is used to create the widget.
    final questions = Provider.of<Questions>(context).questions;

    return Scaffold(
      drawer: CatechismDrawer(
        infoScreens: infoScreens,
      ),
      appBar: CatechismAppBar(titles),
      body: ListView.separated(
        padding: const EdgeInsets.all(8.0),
        itemCount: questions.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return QuestionListItem(
            questions[index],
            configuration: configuration,
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
