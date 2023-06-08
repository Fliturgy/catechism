import 'package:flutter/material.dart';

/// The CatechismTabType enum is used to configure the catechism app's tabs.
enum CatechismTabType {
  /// The question tab type is used to display the question and answer.
  question,

  /// The scripture tab type is used to display the scripture reference and/or
  /// text.
  scripture,

  /// The image tab type is used to display the image.
  image,
}

/// The CatechismTabData class is used to configure the catechism app's tabs.
class CatechismTabData {
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
