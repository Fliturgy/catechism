import 'package:flutter/material.dart';

enum CatechismTabType {
  question,
  scripture,
  image,
}

class CatechismTabData {
  /// The CatechismTabData class is used to configure the catechism app's tabs.
  final CatechismTabType type;
  final String label;
  final IconData icon;

  const CatechismTabData({
    required this.type,
    required this.label,
    required this.icon,
  });
}
