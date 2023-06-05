import 'package:catechism/src/models/tab.dart';
import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/question.dart';
import '../widgets/image_tab.dart';
import '../widgets/question_tab.dart';
import '../widgets/scripture_tab.dart';

class QuestionDetailsItem extends StatelessWidget {
  /// The QuestionDetailsItem class is used to display the details of a
  /// question: the title, the number, the question, and the answer.
  final Question question;
  final CatechismConfiguration configuration;
  final CatechismTabData selectedTab;

  QuestionDetailsItem({
    required this.question,
    required this.configuration,
    required this.selectedTab,
  });

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
