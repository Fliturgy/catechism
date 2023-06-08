import 'package:flutter/material.dart';

class Question with ChangeNotifier {
  /// The Question class contains all of the information about a single
  /// catechism question.
  final int id;

  /// The title property is used to create the title for the question.
  final String title;

  /// The question property is used to create the question.
  final String question;

  /// The answer property is used to create the answer for the question.
  final String answer;

  /// The references property is used to create the references for the question.
  /// This is an optional property.
  final List<String> references;

  /// The image property is used to create the image for the question.
  /// This is an optional property.
  final String? image;

  /// The Question constructor is used to create a new instance of the
  /// Question class.
  Question({
    required this.id,
    required this.title,
    required this.question,
    required this.answer,
    this.references = const [],
    this.image,
  });
}
