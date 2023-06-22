import 'package:flutter/material.dart';

import '../models/question.dart';
import '../widgets/note_item.dart';
import '../widgets/top_bar.dart';

/// The NotesScreen class is used to display the notes for a question.
class NotesScreen extends StatelessWidget {
  /// The question property is used to create the question.
  final Question question;

  /// The NotesScreen constructor is used to create a new instance of the
  /// NotesScreen class.
  NotesScreen(this.question);

  /// Display the notes for the question.
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
            children: question.notes.map((e) => NoteItem(note: e)).toList(),
          ),
        ),
      ),
    );
  }
}
