import 'package:flutter/material.dart';

enum CatechismTabType {
  /// The CatechismTabType enum is used to configure the catechism app's tabs.
  question,
  scripture,
  image,
}

class CatechismTabData {
  /// The CatechismTabData class is used to configure the catechism app's tabs.

  /// The type property is used to create the type of the tab.
  final CatechismTabType type;

  /// The label property is used to create the label for the tab.
  final String label;

  /// The icon property is used to create the icon for the tab.
  final IconData icon;

  /// The CatechismTabData constructor is used to create a new instance of the
  /// CatechismTabData class.
  const CatechismTabData({
    required this.type,
    required this.label,
    required this.icon,
  });
}
