import 'package:catechism/src/features/questions/data/question_provider.dart';
import 'package:catechism/src/features/questions/presentation/widgets/question_note_item.dart';
import 'package:catechism/src/common_widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The NotesScreen class is used to display the notes for a question.
class QuestionNotesScreen extends StatelessWidget {
  /// The question property is used to create the question.
  final int questionId;

  /// The NotesScreen constructor is used to create a new instance of the
  /// NotesScreen class.
  QuestionNotesScreen(this.questionId);

  /// Display the notes for the question.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        [],
        hasBackButton: false,
        hasCloseButton: true,
      ),
      body: Consumer(builder: (context, ref, child) {
        final questions = ref.watch(questionProvider!);
        final question = questions[questionId - 1];

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 35.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  question.notes.map((e) => QuestionNoteItem(note: e)).toList(),
            ),
          ),
        );
      }),
    );
  }
}