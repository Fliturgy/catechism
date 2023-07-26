import 'package:catechism/src/features/configuration/data/titles_provider.dart';
import 'package:catechism/src/features/questions/data/question_provider.dart';
import 'package:catechism/src/features/questions/presentation/widgets/question_details.dart';
import 'package:catechism/src/common_widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The CatechismDetailsScreen class is used to create a screen that displays
/// a QuestionDetailsItem for a given question as well as the catechism
/// app bar.
class QuestionDetailsScreen extends ConsumerWidget {
  /// The questionId property is used to create the question id for the
  final int questionId;

  /// The CatechismDetailsScreen constructor is used to create a catechism
  /// details screen.
  QuestionDetailsScreen({
    required this.questionId,
  });

  /// The build method is used to build the widget tree for the
  /// CatechismDetailsScreen class.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController controller = PageController(
      initialPage: questionId - 1,
    );
    final titles = ref.watch(titlesProvider!);

    return Scaffold(
      appBar: TopBar(
        titles,
        hasBackButton: true,
      ),
      body: Consumer(builder: (context, ref, _) {
        final questions = ref.watch(questionProvider!);
        return PageView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          children: questions
              .map((e) => QuestionDetails(
                    question: e,
                  ))
              .toList(),
        );
      }),
    );
  }
}
