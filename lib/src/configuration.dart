import 'package:flutter/material.dart';
import 'package:catechism/src/models/tab.dart';

class CatechismConfiguration {
  /// The CatechismConfiguration class is used to configure the catechism app,
  /// enabling or disabling certain features.
  final bool displayQuestionNumberInDetails;
  final bool displayQuestionTitleInDetails;

  final List<CatechismTabData> tabs;
  final CatechismTabType defaultTabType;
  final bool showTabBar;

  CatechismConfiguration({
    required this.displayQuestionNumberInDetails,
    required this.displayQuestionTitleInDetails,
    this.tabs = const [
      CatechismTabData(
        type: CatechismTabType.question,
        label: 'Question',
        icon: Icons.question_answer_outlined,
      ),
    ],
    this.defaultTabType = CatechismTabType.question,
    this.showTabBar = false,
  });
}
