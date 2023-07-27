import 'package:catechism/src/common_widgets/top_bar.dart';
import 'package:catechism/src/features/questions/data/question_provider.dart';
import 'package:catechism/src/features/questions/presentation/widgets/question_reference_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The ReferencesScreen class is used to display the references for a question.
class QuestionReferencesScreen extends StatelessWidget {
  /// The question property is used to create the question.
  final int questionId;

  /// The ReferencesScreen constructor is used to create a new instance of the
  /// ReferencesScreen class.
  QuestionReferencesScreen(this.questionId);

  /// Display the references for the question.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        [],
        hasBackButton: false,
        hasCloseButton: true,
      ),
      body: Consumer(builder: (context, ref, child) {
        final locale = Localizations.localeOf(context);
        final languageCode = locale.languageCode;
        final questions = ref.watch(questionProvider!);
        final localeQuestions = questions.getQuestions(languageCode);
        final question = localeQuestions[questionId - 1];

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 35.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: question.references
                  .map((e) => QuestionReferenceItem(reference: e))
                  .toList(),
            ),
          ),
        );
      }),
    );
  }
}
