import 'package:flutter/material.dart';

import '../models/question.dart';

class ImageTab extends StatelessWidget {
  /// The ImageTab class is used to display the image for a catechism question.
  final Question question;

  ImageTab(this.question);

  @override
  Widget build(BuildContext context) {
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
