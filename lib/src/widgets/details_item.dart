import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/question.dart';
import '../widgets/bottom_bar.dart';

/// The QuestionDetailsItem class is used to display the details of a
/// question: the title, the number, the question, and the answer.
class DetailsItem extends StatefulWidget {
  /// The question property is used to create the question.
  final Question question;

  /// The configuration property is used to create the configuration.
  final CatechismConfiguration configuration;

  /// The QuestionDetailsItem constructor is used to create a new instance of
  /// the QuestionDetailsItem class.
  DetailsItem({
    required this.question,
    required this.configuration,
  });

  @override
  State<DetailsItem> createState() => _DetailsItemState();
}

class _DetailsItemState extends State<DetailsItem> {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.configuration.displayQuestionTitleInDetails)
                Text(
                  widget.question.title ?? "",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              if (widget.configuration.displayQuestionTitleInDetails &&
                  widget.question.title != null)
                SizedBox(
                  height: 5.0,
                ),
              Text(
                widget.configuration.displayQuestionTitleShortInDetails &&
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
                offstage: !_isVisible && widget.configuration.allowHideAnswer,
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
                offstage: !widget.configuration.allowHideAnswer,
                child: OutlinedButton(
                  child: Text(_isVisible ? 'Hide Answer' : 'Show Answer'),
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
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        question: widget.question,
        configuration: widget.configuration,
      ),
    );
  }
}
