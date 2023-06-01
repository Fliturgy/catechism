import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../configuration.dart';
import '../models/info_screen_data.dart';
import '../models/questions.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';
import '../widgets/question_list_item.dart';

class CatechismListScreen extends StatelessWidget {
  static const routeName = '/';

  final List<String> titles;
  final CatechismConfiguration configuration;
  final List<InfoScreenData> infoScreens;

  CatechismListScreen({
    required this.titles,
    required this.configuration,
    required this.infoScreens,
  });

  @override
  Widget build(BuildContext context) {
    final questions = Provider.of<Questions>(context).questions;

    return Scaffold(
      backgroundColor: Colors.white,
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
