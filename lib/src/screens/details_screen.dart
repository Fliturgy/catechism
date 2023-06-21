import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../configuration.dart';
import '../models/questions.dart';
import '../widgets/details_item.dart';
import '../widgets/top_bar.dart';

/// The CatechismDetailsScreen class is used to create a screen that displays
/// a QuestionDetailsItem for a given question as well as the catechism
/// app bar.
class DetailsScreen extends StatelessWidget {
  /// The routeName property is used to create the route name for the
  /// CatechismDetailsScreen class.
  static const routeName = '/catechism-details';

  /// The titles property is used to create the list of titles for the
  /// CatechismDetailsScreen class.
  final List<String> titles;

  /// The configuration property is used to create the configuration for the
  /// CatechismDetailsScreen class.
  final CatechismConfiguration configuration;

  /// The CatechismDetailsScreen constructor is used to create a catechism
  /// details screen.
  DetailsScreen({
    required this.titles,
    required this.configuration,
  });

  /// The build method is used to build the widget tree for the
  /// CatechismDetailsScreen class.
  @override
  Widget build(BuildContext context) {
    final questions = Provider.of<Questions>(context).questions;
    final questionId = ModalRoute.of(context)?.settings.arguments as int;

    final PageController controller = PageController(
      initialPage: questionId - 1,
    );

    return Scaffold(
      appBar: TopBar(
        titles,
        hasBackButton: true,
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: questions
            .map((e) => DetailsItem(
                  question: e,
                  configuration: configuration,
                ))
            .toList(),
      ),
    );
  }
}
