import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/question.dart';

class QuestionTab extends StatelessWidget {
  /// The QuestionTab class is used to display the question and answer of a
  /// catechism question.

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

  @override
  Widget build(BuildContext context) {
    /// The build method is used to build the widget.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (configuration.displayQuestionTitleInDetails && question.title != "")
          Text(
            question.title,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        if (configuration.displayQuestionTitleInDetails && question.title != "")
          SizedBox(
            height: 5.0,
          ),
        Text(
          configuration.displayQuestionNumberInDetails
              ? '${question.id}. ${question.question}'
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
          // textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
