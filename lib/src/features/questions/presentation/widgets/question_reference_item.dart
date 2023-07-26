import 'package:catechism/src/features/questions/domain/question_reference.dart';
import 'package:flutter/material.dart';

class QuestionReferenceItem extends StatelessWidget {
  final QuestionReference reference;

  const QuestionReferenceItem({
    required this.reference,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          reference.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(
          height: 5.0,
        ),
        Divider(
          thickness: 2.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          reference.content.join('\n'),
          softWrap: true,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: 50.0,
        ),
      ],
    );
  }
}
