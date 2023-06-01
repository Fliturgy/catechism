import 'package:flutter/material.dart';

class InfoScreenData {
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
