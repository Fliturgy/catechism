import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/question.dart';
import '../screens/catechism_details_screen.dart';

class QuestionListItem extends StatelessWidget {
  /// The QuestionListItem class is used to create a single list item for a
  /// given question for the catechism list screen.
  final Question question;
  final CatechismConfiguration configuration;

  QuestionListItem(
    this.question, {
    required this.configuration,
  });

  @override
  Widget build(BuildContext context) {
    /// The build method is used to create the widget.
    return ListTile(
      // leading: Text(
      //   question.id.toString(),
      //   style: Theme.of(context).textTheme.headline5,
      // ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${question.id.toString()}. ',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
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
