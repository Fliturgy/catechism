import 'package:flutter/material.dart';

import '../models/question.dart';
import '../widgets/prayer_item.dart';
import '../widgets/top_bar.dart';

/// The PrayerScreen class is used to display the prayer for a question.
class PrayerScreen extends StatelessWidget {
  /// The question property is used to create the question.
  final Question question;

  /// The PrayerScreen constructor is used to create a new instance of the
  /// PrayerScreen class.
  PrayerScreen(this.question);

  /// Display the prayer for the question.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        [],
        hasBackButton: false,
        hasCloseButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 35.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                question.prayer.map((e) => PrayerItem(paragraph: e)).toList(),
          ),
        ),
      ),
    );
  }
}
