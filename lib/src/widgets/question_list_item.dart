import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/question.dart';
import '../screens/catechism_details_screen.dart';

class QuestionListItem extends StatelessWidget {
  final Question question;
  final CatechismConfiguration configuration;

  QuestionListItem(
    this.question, {
    required this.configuration,
  });

  @override
  Widget build(BuildContext context) {
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
