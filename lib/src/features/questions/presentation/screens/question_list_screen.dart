import 'package:catechism/src/common_widgets/drawer.dart';
import 'package:catechism/src/common_widgets/top_bar.dart';
import 'package:catechism/src/features/configuration/data/titles_provider.dart';
import 'package:catechism/src/features/questions/data/question_provider.dart';
import 'package:catechism/src/features/questions/presentation/widgets/question_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The CatechismListScreen class is used to create a screen that displays the
/// list of questions as well as the catechism app bar.
class QuestionListScreen extends ConsumerWidget {
  /// The build method is used to create the widget.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titles = ref.watch(titlesProvider!);

    return Scaffold(
      drawer: CatechismDrawer(),
      appBar: TopBar(titles),
      body: Consumer(
        builder: (context, ref, child) {
          final questions = ref.watch(questionProvider!);

          return ListView.separated(
            padding: const EdgeInsets.all(8.0),
            itemCount: questions.length,
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              return QuestionListItem(
                questions[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          );
        },
      ),
    );
  }
}