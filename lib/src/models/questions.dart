import 'package:flutter/material.dart';

import './question.dart';

class Questions with ChangeNotifier {
  List<Question> _questions;

  Questions(this._questions);

  List<Question> get questions {
    return [..._questions];
  }
}
