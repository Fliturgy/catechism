import 'package:catechism/src/common_widgets/top_bar.dart';
import 'package:catechism/src/features/configuration/data/language_provider.dart';
import 'package:catechism/src/features/questions/data/question_provider.dart';
import 'package:catechism/src/features/questions/presentation/widgets/question_prayer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The PrayerScreen class is used to display the prayer for a question.
class QuestionPrayerScreen extends StatelessWidget {
  /// The question property is used to create the question.
  final int questionId;

  /// The PrayerScreen constructor is used to create a new instance of the
  /// PrayerScreen class.
  QuestionPrayerScreen(this.questionId);

  /// Display the prayer for the question.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        [],
        hasBackButton: false,
        hasCloseButton: true,
      ),
      body: Consumer(builder: (context, ref, child) {
        final languageCode = ref.watch(languageProvider);
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
              children: question.prayer
                  .map((e) => QuestionPrayerItem(paragraph: e))
                  .toList(),
            ),
          ),
        );
      }),
    );
  }
}
