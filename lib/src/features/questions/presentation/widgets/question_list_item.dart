import 'package:catechism/src/features/configuration/data/configuration_provider.dart';
import 'package:catechism/src/features/questions/domain/question.dart';
import 'package:catechism/src/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// The QuestionListItem class is used to create a single list item for a
/// given question for the catechism list screen.
class QuestionListItem extends ConsumerWidget {
  /// The question property is used to create the question for the list item.
  final Question question;

  /// The QuestionListItem constructor is used to create a new instance of the
  /// QuestionListItem class.
  QuestionListItem(
    this.question,
  );

  /// The build method is used to create the widget.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configuration = ref.watch(configurationProvider!);

    return ListTile(
      leading: configuration.displayQuestionTitleShortInList
          ? Container(
              width: 40,
              child: Text(
                question.titleShort ?? "",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: configuration.questionShortTitleListAlignment,
              ),
            )
          : null,
      title: Text(
        question.question,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: configuration.displayQuestionDetailsAsSeparatePage
          ? null
          : Text(
              question.answer,
              style: Theme.of(context).textTheme.bodySmall,
            ),
      onTap: configuration.displayQuestionDetailsAsSeparatePage
          ? () => context.goNamed(
                AppRoute.details.name,
                pathParameters: {
                  'questionId': question.id.toString(),
                },
              )
          : null,
    );
  }
}
