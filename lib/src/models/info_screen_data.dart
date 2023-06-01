import 'package:flutter/material.dart';

class InfoScreenData {
  /// The InfoScreenData class contains all of the information needed to create
  /// and optional additional information screen (e.g. about, help).
  final String routeName;
  final IconData? icon;
  final String title;
  final List<String> content;

  InfoScreenData({
    required this.routeName,
    this.icon,
    required this.title,
    required this.content,
  });
}
