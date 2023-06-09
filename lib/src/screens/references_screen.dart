import 'package:flutter/material.dart';

import '../models/question.dart';
import '../widgets/reference_item.dart';
import '../widgets/top_bar.dart';

/// The ReferencesScreen class is used to display the references for a question.
class ReferencesScreen extends StatelessWidget {
  /// The question property is used to create the question.
  final Question question;

  /// The ReferencesScreen constructor is used to create a new instance of the
  /// ReferencesScreen class.
  ReferencesScreen(this.question);

  /// Display the references for the question.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        [],
        hasBackButton: false,
        hasCloseButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 35.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: question.references
                .map((e) => ReferenceItem(reference: e))
                .toList(),
          ),
        ),
      ),
    );
  }
}
