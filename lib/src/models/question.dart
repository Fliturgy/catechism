import 'package:flutter/material.dart';

import 'question_reference.dart';

/// The Question class contains all of the information about a single
/// catechism question.
class Question with ChangeNotifier {
  /// The id property is used to create the id for the question.
  final int id;

  /// The title property is used to create the details page title for the
  /// question. This is an optional property.
  final String? title;

  /// The titleShort property is used to create the list page title for the
  /// question and is optionally used on the details page. This is an optional
  /// property.
  final String? titleShort;

  /// The question property is used to create the question.
  final String question;

  /// The answer property is used to create the answer for the question.
  final String answer;

  /// The references property is used to create the references for the question.
  /// This is an optional property.
  final List<QuestionReference> references;

  /// The image property is used to create the image for the question. This is
  /// an optional property.
  final String? image;

  /// The Question constructor is used to create a new instance of the
  /// Question class.
  Question({
    required this.id,
    this.title,
    this.titleShort,
    required this.question,
    required this.answer,
    this.references = const [],
    this.image,
  });
}
