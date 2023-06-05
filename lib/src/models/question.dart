import 'package:flutter/material.dart';

class Question with ChangeNotifier {
  /// The Question class contains all of the information about a single
  /// catechism question.
  final int id;
  final String title;
  final String question;
  final String answer;
  final List<String> references;
  final String? image;

  Question({
    required this.id,
    required this.title,
    required this.question,
    required this.answer,
    this.references = const [],
    this.image,
  });
}
