import 'package:flutter/material.dart';
import 'package:catechism/src/models/tab.dart';

/// The CatechismConfiguration class is used to configure the catechism app,
/// enabling or disabling certain features.
class CatechismConfiguration {
  /// The displayQuestionTitleShortInDetails property is used to determine
  /// whether the question short title is displayed in the details page. This
  /// defaults to true.
  final bool displayQuestionTitleShortInDetails;

  /// The displayQuestionTitleInDetails property is used to determine whether
  /// the question title is displayed in the details page. This defaults to
  /// true.
  final bool displayQuestionTitleInDetails;

  /// The displayQuestionTitleShortInList property is used to determine whether
  /// the question short title is displayed in the list page. This defaults to
  /// true.
  final bool displayQuestionTitleShortInList;

  /// The displayQuestionDetailsInList property is used to determine whether
  /// the question details are displayed in a separate details page or in the
  /// list page. This defaults to true.
  final bool displayQuestionDetailsAsSeparatePage;

  /// The tabs property is used to create the tabs.
  final List<CatechismTabData> tabs;

  /// The defaultTabType property is used to create the default tab type.
  final CatechismTabType defaultTabType;

  /// The showTabBar property is used to show the tab bar.
  final bool showTabBar;

  /// The CatechismConfiguration constructor is used to create a new instance of
  /// the CatechismConfiguration class.
  CatechismConfiguration({
    this.displayQuestionTitleShortInDetails = true,
    this.displayQuestionTitleInDetails = true,
    this.displayQuestionTitleShortInList = true,
    this.displayQuestionDetailsAsSeparatePage = true,
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
