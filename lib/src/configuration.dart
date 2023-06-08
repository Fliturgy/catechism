import 'package:flutter/material.dart';
import 'package:catechism/src/models/tab.dart';

/// The CatechismConfiguration class is used to configure the catechism app,
/// enabling or disabling certain features.
class CatechismConfiguration {
  /// The displayQuestionNumberInDetails property is used to display the
  /// question number in the details.
  final bool displayQuestionNumberInDetails;

  /// The displayQuestionTitleInDetails property is used to display the
  /// question title in the details.
  final bool displayQuestionTitleInDetails;

  /// The tabs property is used to create the tabs.
  final List<CatechismTabData> tabs;

  /// The defaultTabType property is used to create the default tab type.
  final CatechismTabType defaultTabType;

  /// The showTabBar property is used to show the tab bar.
  final bool showTabBar;

  /// The CatechismConfiguration constructor is used to create a new instance of
  /// the CatechismConfiguration class.
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
