import 'package:catechism/src/features/questions/domain/question_reference.dart';
import 'package:flutter/material.dart';

/// The Question class contains all of the information about a single
/// catechism question.
class Question with ChangeNotifier {
  /// The id property is used to create the id for the question.
  final int id;

  /// The title property is used to create the details page title for the
  /// question. This is an optional property.
  final Widget? title;

  /// The titleShort property is used to create the list page title for the
  /// question and is optionally used on the details page. This is an optional
  /// property.
  final Widget? titleShort;

  /// The question property is used to create the question.
  final Widget question;

  /// The answer property is used to create the answer for the question.
  final Widget answer;

  /// The references property is used to create the references for the question.
  /// This is an optional property.
  final List<QuestionReference> references;

  /// The notes property is used to create the notes for the question. This is
  /// an optional property.
  final Widget? notes;

  /// The prayer property is used to create the prayer for the question. This is
  /// an optional property.
  final Widget? prayer;

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
    this.notes,
    this.prayer,
    this.image,
  });
}
