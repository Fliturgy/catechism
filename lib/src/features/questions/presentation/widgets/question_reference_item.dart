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
        DefaultTextStyle(
          child: reference.title,
          style: Theme.of(context).textTheme.headlineLarge!,
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
        DefaultTextStyle(
          child: reference.content!,
          softWrap: true,
          style: Theme.of(context).textTheme.bodyLarge!,
        ),
        SizedBox(
          height: 50.0,
        ),
      ],
    );
  }
}
