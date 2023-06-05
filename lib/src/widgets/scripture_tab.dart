import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/question.dart';

class ScriptureTab extends StatelessWidget {
  /// The ScriptureTab class is used to display the scripture references for a
  /// catechism question.
  final Question question;
  final CatechismConfiguration configuration;

  ScriptureTab(
    this.question, {
    required this.configuration,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.references.join("\n\n"),
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
