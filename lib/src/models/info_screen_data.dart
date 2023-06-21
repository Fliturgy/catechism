import 'package:flutter/material.dart';

/// The InfoScreenData class contains all of the information needed to create
/// and optional additional information screen (e.g. about, help).
class InfoScreenData {
  /// The icon property is used to create the icon for the screen.
  final IconData? icon;

  /// The title property is used to create the title for the screen.
  final String title;

  /// The content property is used to create the content for the screen.
  final List<String> content;

  /// The InfoScreenData constructor is used to create a new instance of the
  /// InfoScreenData class.
  InfoScreenData({
    this.icon,
    required this.title,
    required this.content,
  });
}
