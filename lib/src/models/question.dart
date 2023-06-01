import 'package:flutter/material.dart';

class Question with ChangeNotifier {
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
