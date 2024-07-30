import 'package:catechism/src/features/configuration/data/configuration_provider.dart';
import 'package:catechism/src/features/questions/domain/question.dart';
import 'package:catechism/src/common_widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The QuestionDetailsItem class is used to display the details of a
/// question: the title, the number, the question, and the answer.
class QuestionDetails extends StatefulWidget {
  /// The question property is used to create the question.
  final Question question;

  /// The QuestionDetailsItem constructor is used to create a new instance of
  /// the QuestionDetailsItem class.
  QuestionDetails({
    required this.question,
  });

  @override
  State<QuestionDetails> createState() => _QuestionDetailsState();
}

class _QuestionDetailsState extends State<QuestionDetails> {
  bool _isVisible = false;

  /// The build method is used to build the widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 35.0,
          ),
          child: Consumer(
            builder: (context, ref, child) {
              final configuration = ref.watch(configurationProvider!);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (configuration.displayQuestionTitleInDetails)
                    Text(
                      widget.question.title ?? "",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  if (configuration.displayQuestionTitleInDetails &&
                      widget.question.title != null)
                    SizedBox(
                      height: 5.0,
                    ),
                  Text(
                    configuration.displayQuestionTitleShortInDetails &&
                            widget.question.titleShort != null &&
                            widget.question.titleShort != ""
                        ? '${widget.question.titleShort} ${widget.question.question}'
                        : widget.question.question,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Divider(
                    thickness: 2.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Offstage(
                    offstage: !_isVisible && configuration.allowHideAnswer,
                    child: Text(
                      widget.question.answer,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Offstage(
                    offstage: !configuration.allowHideAnswer,
                    child: OutlinedButton(
                      child: Text(_isVisible
                          ? AppLocalizations.of(context)!.hideAnswer
                          : AppLocalizations.of(context)!.showAnswer),
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        question: widget.question,
      ),
    );
  }
}
