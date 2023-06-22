import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/question.dart';
import '../screens/notes_screen.dart';
import '../screens/prayer_screen.dart';
import '../screens/references_screen.dart';

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
          // Commentary
          if (configuration.displayQuestionNotes)
            IconButton(
              onPressed: question.notes.isEmpty
                  ? null
                  : () => Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  NotesScreen(question),
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
              icon: configuration.questionNotesIcon,
            ),
          // Prayer
          if (configuration.displayQuestionPrayer)
            IconButton(
              onPressed: question.prayer.isEmpty
                  ? null
                  : () => Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  PrayerScreen(question),
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
              icon: configuration.questionPrayerIcon,
            ),
          // Scripture References
          if (configuration.displayQuestionReferences)
            IconButton(
              onPressed: question.references.isEmpty
                  ? null
                  : () => Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  ReferencesScreen(question),
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
              icon: configuration.questionReferencesIcon,
            ),
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
