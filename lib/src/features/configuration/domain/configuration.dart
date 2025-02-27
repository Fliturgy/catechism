import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  final Widget questionReferencesIcon;

  /// The displayQuestionNotes property is used to determine whether the
  /// question notes are displayed in the details page. This defaults to true.
  final bool displayQuestionNotes;

  /// The questionNotesIcon property is used to determine the icon used to
  /// display the question notes in the details page. This defaults to the
  /// notes_outlined icon.
  final Widget questionNotesIcon;

  /// The displayQuestionPrayer property is used to determine whether the
  /// question prayer is displayed in the details page. This defaults to true.
  final bool displayQuestionPrayer;

  /// The questionPrayerIcon property is used to determine the icon used to
  /// display the question prayer in the details page. This defaults to the
  /// hands_praying icon.
  final Widget questionPrayerIcon;

  /// The allowHideAnswer property is used to determine whether the user can
  /// hide the answer in the details page. This defaults to true.
  final bool allowHideAnswer;

  /// The questionShortTitleListAlignment property is used to determine the
  /// alignment of the question short title in the list page. This defaults to
  /// TextAlign.center.
  final TextAlign questionShortTitleListAlignment;

  /// The settingsIcon property is used to determine the icon used to display
  /// the settings page in the drawer. This defaults to the settings icon.
  final Widget? settingsIcon;

  /// The showSettings property is used to determine whether the settings page
  /// is displayed in the drawer. This defaults to true.
  final bool showSettings;

  /// The showSettingsLanguageSelector property is used to determine whether
  /// the language selector is displayed in the settings page. This defaults to
  /// true.
  final bool showSettingsLanguageSelector;

  /// The defaultAppTitle property is used to determine the default title of
  /// the app.
  final String defaultAppTitle;

  /// The CatechismConfiguration constructor is used to create a new instance of
  /// the CatechismConfiguration class.
  CatechismConfiguration({
    this.displayQuestionTitleShortInDetails = true,
    this.displayQuestionTitleInDetails = true,
    this.displayQuestionTitleShortInList = true,
    this.displayQuestionDetailsAsSeparatePage = true,
    this.displayQuestionReferences = true,
    questionReferencesIcon,
    this.displayQuestionNotes = true,
    questionNotesIcon,
    this.displayQuestionPrayer = true,
    questionPrayerIcon,
    this.allowHideAnswer = true,
    this.questionShortTitleListAlignment = TextAlign.center,
    this.settingsIcon,
    this.showSettings = true,
    this.showSettingsLanguageSelector = true,
    required this.defaultAppTitle,
  })  : questionReferencesIcon =
            questionReferencesIcon ?? Icon(Icons.menu_book_outlined),
        questionNotesIcon =
            questionNotesIcon ?? Icon(Icons.question_answer_outlined),
        questionPrayerIcon =
            questionPrayerIcon ?? FaIcon(FontAwesomeIcons.handsPraying);
}
