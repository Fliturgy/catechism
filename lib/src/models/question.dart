import 'package:flutter/material.dart';

class Question with ChangeNotifier {
  /// The Question class contains all of the information about a single
  /// catechism question.
  final int id;
  final String title;
  final String question;
  final String answer;

  Question({
    required this.id,
    required this.title,
    required this.question,
    required this.answer,
  });
}
