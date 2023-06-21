import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/question.dart';
import '../screens/details_screen.dart';

/// The QuestionListItem class is used to create a single list item for a
/// given question for the catechism list screen.
class ListItem extends StatelessWidget {
  /// The question property is used to create the question for the list item.
  final Question question;

  /// The configuration property is used to create the configuration for the
  /// list item.
  final CatechismConfiguration configuration;

  /// The QuestionListItem constructor is used to create a new instance of the
  /// QuestionListItem class.
  ListItem(
    this.question, {
    required this.configuration,
  });

  /// The build method is used to create the widget.
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: configuration.displayQuestionTitleShortInList
          ? CircleAvatar(
              child: Text(
                question.titleShort ?? "",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              backgroundColor: Theme.of(context).primaryColorLight,
            )
          : null,
      title: Text(
        question.question,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: configuration.displayQuestionDetailsAsSeparatePage
          ? null
          : Text(
              question.answer,
              style: Theme.of(context).textTheme.bodySmall,
            ),
      onTap: configuration.displayQuestionDetailsAsSeparatePage
          ? () {
              Navigator.of(context).pushNamed(
                DetailsScreen.routeName,
                arguments: question.id,
              );
            }
          : null,
    );
  }
}
