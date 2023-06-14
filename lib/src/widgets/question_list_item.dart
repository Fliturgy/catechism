import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/question.dart';
import '../screens/catechism_details_screen.dart';

/// The QuestionListItem class is used to create a single list item for a
/// given question for the catechism list screen.
class QuestionListItem extends StatelessWidget {
  /// The question property is used to create the question for the list item.
  final Question question;

  /// The configuration property is used to create the configuration for the
  /// list item.
  final CatechismConfiguration configuration;

  /// The QuestionListItem constructor is used to create a new instance of the
  /// QuestionListItem class.
  QuestionListItem(
    this.question, {
    required this.configuration,
  });

  /// The build method is used to create the widget.
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: configuration.displayQuestionTitleShortInList
          ? Text(
              question.titleShort ?? "",
              style: Theme.of(context).textTheme.headlineSmall,
            )
          : null,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              question.question,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          CatechismDetailsScreen.routeName,
          arguments: question.id,
        );
      },
    );
  }
}
