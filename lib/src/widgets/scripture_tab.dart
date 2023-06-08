import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/question.dart';

class ScriptureTab extends StatelessWidget {
  /// The ScriptureTab class is used to display the scripture references for a
  /// catechism question.

  /// The question property is used to create the question.
  final Question question;

  /// The configuration property is used to create the configuration.
  final CatechismConfiguration configuration;

  /// The ScriptureTab constructor is used to create a new instance of the
  /// ScriptureTab class.
  ScriptureTab(
    this.question, {
    required this.configuration,
  });

  @override
  Widget build(BuildContext context) {
    /// The build method is used to build the widget.
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
