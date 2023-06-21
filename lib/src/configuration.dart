import 'package:flutter/material.dart';

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

  /// The displayQuestionReferences property is used to determine whether the
  /// question references are displayed in the details page. This defaults to
  /// true.
  final bool displayQuestionReferences;

  /// The questionReferencesIcon property is used to determine the icon used to
  /// display the question references in the details page. This defaults to the
  /// menu_book_outlined icon.
  final IconData questionReferencesIcon;

  /// The allowHideAnswer property is used to determine whether the user can
  /// hide the answer in the details page. This defaults to true.
  final bool allowHideAnswer;

  /// The CatechismConfiguration constructor is used to create a new instance of
  /// the CatechismConfiguration class.
  CatechismConfiguration({
    this.displayQuestionTitleShortInDetails = true,
    this.displayQuestionTitleInDetails = true,
    this.displayQuestionTitleShortInList = true,
    this.displayQuestionDetailsAsSeparatePage = true,
    this.displayQuestionReferences = true,
    this.allowHideAnswer = true,
    this.questionReferencesIcon = Icons.menu_book_outlined,
  });
}
