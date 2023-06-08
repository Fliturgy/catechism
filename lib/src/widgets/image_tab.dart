import 'package:flutter/material.dart';

import '../models/question.dart';

class ImageTab extends StatelessWidget {
  /// The ImageTab class is used to display the image for a catechism question.

  /// The question property is used to create the question.
  final Question question;

  /// The ImageTab constructor is used to create a new instance of the
  /// ImageTab class.
  ImageTab(this.question);

  @override
  Widget build(BuildContext context) {
    /// If the question has an image, display it. Otherwise, return an empty
    /// container.
    return question.image != null
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 45.0,
                  ),
                  child: Image.asset(
                    question.image ?? '',
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}
