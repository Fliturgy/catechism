import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/question.dart';

class QuestionDetailsItem extends StatelessWidget {
  final Question question;
  final CatechismConfiguration configuration;

  QuestionDetailsItem({
    required this.question,
    required this.configuration,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 35.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (configuration.displayQuestionTitleInDetails &&
                question.title != "")
              Text(
                question.title,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            if (configuration.displayQuestionTitleInDetails &&
                question.title != "")
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
        ),
      ),
    );
  }
}
