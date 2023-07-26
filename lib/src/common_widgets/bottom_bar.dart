import 'package:catechism/src/features/configuration/data/configuration_provider.dart';
import 'package:catechism/src/features/questions/domain/question.dart';
import 'package:catechism/src/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// The CatechismTabBar class is used to display the tabs at the bottom of the
/// catechism app.
class BottomBar extends ConsumerWidget {
  /// The question property is used to create the question.
  final Question question;

  /// The CatechismTabBar constructor is used to create a new instance of the
  /// CatechismTabBar class.
  BottomBar({
    required this.question,
  });

  /// The build method is used to build the widget.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configuration = ref.watch(configurationProvider!);

    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Commentary
          if (configuration.displayQuestionNotes)
            IconButton(
              onPressed: question.notes.isEmpty
                  ? null
                  : () => context.goNamed(
                        AppRoute.notes.name,
                        pathParameters: {
                          'questionId': question.id.toString(),
                        },
                      ),
              icon: configuration.questionNotesIcon,
            ),
          // Prayer
          if (configuration.displayQuestionPrayer)
            IconButton(
              onPressed: question.prayer.isEmpty
                  ? null
                  : () => context.goNamed(
                        AppRoute.prayer.name,
                        pathParameters: {
                          'questionId': question.id.toString(),
                        },
                      ),
              icon: configuration.questionPrayerIcon,
            ),
          // Scripture References
          if (configuration.displayQuestionReferences)
            IconButton(
              onPressed: question.references.isEmpty
                  ? null
                  : () => context.goNamed(
                        AppRoute.references.name,
                        pathParameters: {
                          'questionId': question.id.toString(),
                        },
                      ),
              icon: configuration.questionReferencesIcon,
            ),
        ],
      ),
    );
  }
}
