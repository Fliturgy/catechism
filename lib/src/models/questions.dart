import 'package:flutter/material.dart';

import './question.dart';

class Questions with ChangeNotifier {
  /// The Questions class contains all of the catechism questions.

  /// The questions property is used to create the list of questions.
  final List<Question> _questions;

  /// The Questions constructor is used to create a new instance of the
  /// Questions class.
  Questions(this._questions);

  /// The get questions method is used to return the list of questions.
  List<Question> get questions {
    return [..._questions];
  }
}
