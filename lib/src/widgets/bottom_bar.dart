import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/question.dart';
import '../screens/scripture_screen.dart';

/// The CatechismTabBar class is used to display the tabs at the bottom of the
/// catechism app.
class BottomBar extends StatelessWidget {
  /// The question property is used to create the question.
  final Question question;

  /// The configuration property is used to create the configuration.
  final CatechismConfiguration configuration;

  /// The CatechismTabBar constructor is used to create a new instance of the
  /// CatechismTabBar class.
  BottomBar({
    required this.question,
    required this.configuration,
  });

  /// The build method is used to build the widget.
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // TODO: Commentary
          // IconButton(
          //   onPressed: () => {},
          //   icon: Icon(Icons.question_answer_outlined),
          // ),
          // TODO: Prayer
          // IconButton(
          //   onPressed: () => {},
          //   icon: Icon(Icons.self_improvement_outlined),
          // ),
          // Scripture References
          configuration.displayQuestionReferences &&
                  question.references.isNotEmpty
              ? IconButton(
                  onPressed: () => Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          ScriptureScreen(question),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              _transitionBuilder(
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ),
                    ),
                  ),
                  icon: Icon(configuration.questionReferencesIcon),
                )
              : SizedBox(
                  width: 1,
                ),
          // TODO: Play Audio/Video
          // IconButton(
          //   onPressed: () => {},
          //   icon: Icon(Icons.play_arrow_outlined),
          // ),
        ],
      ),
    );
  }
}

SlideTransition _transitionBuilder(
    context, animation, secondaryAnimation, child) {
  const begin = Offset(0.0, 1.0);
  const end = Offset.zero;
  const curve = Curves.ease;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  return SlideTransition(
    position: animation.drive(tween),
    child: child,
  );
}
