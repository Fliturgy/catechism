import 'package:catechism/src/models/tab.dart';
import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/question.dart';
import '../widgets/image_tab.dart';
import '../widgets/question_tab.dart';
import '../widgets/scripture_tab.dart';

/// The QuestionDetailsItem class is used to display the details of a
/// question: the title, the number, the question, and the answer.
class QuestionDetailsItem extends StatelessWidget {
  /// The question property is used to create the question.
  final Question question;

  /// The configuration property is used to create the configuration.
  final CatechismConfiguration configuration;

  /// The selectedTab property is used to create the selected tab.
  final CatechismTabData selectedTab;

  /// The QuestionDetailsItem constructor is used to create a new instance of
  /// the QuestionDetailsItem class.
  QuestionDetailsItem({
    required this.question,
    required this.configuration,
    required this.selectedTab,
  });

  /// The buildTabContent method is used to build the content of the tab
  /// based on the selected tab.
  Widget buildTabContent(context) {
    switch (selectedTab.type) {
      case CatechismTabType.image:
        return ImageTab(question);
      case CatechismTabType.question:
        return QuestionTab(
          question,
          configuration: configuration,
        );
      case CatechismTabType.scripture:
        return ScriptureTab(
          question,
          configuration: configuration,
        );
      default:
        return Container();
    }
  }

  /// The build method is used to build the widget.
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 35.0,
        ),
        child: buildTabContent(context),
      ),
    );
  }
}
