import 'package:flutter/material.dart';

/// The TitleData class contains all of the information needed to create a title
class TitleData {
  /// The title property is used to create the title for the screen.
  final Widget title;
  
  /// The height property is used to set the height for the top bar.
  final double height;

  /// The TitleData constructor is used to create a new instance of the
  /// TitleData class.
  TitleData({
    required this.title,
    required this.height,
  });
}