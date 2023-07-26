import 'package:flutter/material.dart';

class QuestionPrayerItem extends StatelessWidget {
  final String paragraph;

  const QuestionPrayerItem({
    required this.paragraph,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          paragraph,
          softWrap: true,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
