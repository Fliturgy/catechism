import 'package:flutter/material.dart';

/// The CustomPageData class contains all of the information needed to create
/// and optional additional information screen (e.g. about, help).
class CustomPageData {
  /// The icon property is used to create the icon for the screen.
  final IconData? icon;

  /// The title property is used to create the title for the screen.
  final Widget title;

  /// The content property is used to create the content for the screen.
  final Widget content;

  /// The routeName property is used to create the route name for the screen.
  final String routeName;

  /// The CustomPageData constructor is used to create a new instance of the
  /// CustomPageData class.
  CustomPageData({
    this.icon,
    required this.title,
    required this.content,
    required this.routeName,
  });
}
