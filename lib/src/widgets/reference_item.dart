import 'package:flutter/material.dart';

import '../models/question_reference.dart';

class ReferenceItem extends StatelessWidget {
  final QuestionReference reference;

  const ReferenceItem({
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
