import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../configuration.dart';
import '../models/questions.dart';
import '../widgets/app_bar.dart';
import '../widgets/question_details_item.dart';

class CatechismDetailsScreen extends StatelessWidget {
  /// The CatechismDetailsScreen class is used to create a screen that displays
  /// a QuestionDetailsItem for a given question as well as the catechism
  /// app bar.
  static const routeName = '/catechism-details';

  final List<String> titles;
  final CatechismConfiguration configuration;

  CatechismDetailsScreen({
    required this.titles,
    required this.configuration,
  });

  @override
  Widget build(BuildContext context) {
    final questions = Provider.of<Questions>(context).questions;
    final questionId = ModalRoute.of(context)?.settings.arguments as int;

    final PageController controller = PageController(
      initialPage: questionId - 1,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CatechismAppBar(
        titles,
        hasBackButton: true,
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: questions
            .map((e) => QuestionDetailsItem(
                  question: e,
                  configuration: configuration,
                ))
            .toList(),
      ),
    );
  }
}
