import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  final String note;

  const NoteItem({
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          note,
          softWrap: true,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: 50.0,
        ),
      ],
    );
  }
}
