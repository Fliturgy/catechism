import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/question.dart';

/// The QuestionTab class is used to display the question and answer of a
/// catechism question.
class QuestionTab extends StatelessWidget {
  /// The question property is used to create the question.
  final Question question;

  /// The configuration property is used to create the configuration.
  final CatechismConfiguration configuration;

  /// The QuestionTab constructor is used to create a new instance of the
  /// QuestionTab class.
  QuestionTab(
    this.question, {
    required this.configuration,
  });

  /// The build method is used to build the widget.
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (configuration.displayQuestionTitleInDetails)
          Text(
            question.title ?? "",
            style: Theme.of(context).textTheme.displaySmall,
          ),
        if (configuration.displayQuestionTitleInDetails &&
            question.title != null)
          SizedBox(
            height: 5.0,
          ),
        Text(
          configuration.displayQuestionTitleShortInDetails &&
                  question.titleShort != null &&
                  question.titleShort != ""
              ? '${question.titleShort} ${question.question}'
              : question.question,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          height: 10.0,
        ),
        Divider(
          thickness: 2.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          question.answer,
          softWrap: true,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
