import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/question.dart';
import '../models/tab.dart';

/// The CatechismTabBar class is used to display the tabs at the bottom of the
/// catechism app.
class CatechismTabBar extends StatelessWidget {
  /// The question property is used to create the question.
  final Question question;

  /// The selectTab property is used to create the selectTab method.
  final void Function(int)? selectTab;

  /// The selectedTab property is used to create the selectedTab.
  final CatechismTabData selectedTab;

  /// The configuration property is used to create the configuration.
  final CatechismConfiguration configuration;

  /// The CatechismTabBar constructor is used to create a new instance of the
  /// CatechismTabBar class.
  CatechismTabBar(
    this.question, {
    required this.selectTab,
    required this.selectedTab,
    required this.configuration,
  });

  /// The build method is used to build the widget.
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: selectTab,
      elevation: 0,
      unselectedItemColor: Colors.black38,
      selectedItemColor: Theme.of(context).primaryColor,
      currentIndex: configuration.tabs.indexOf(selectedTab),
      items: configuration.tabs.map((tab) {
        return BottomNavigationBarItem(
          icon: Icon(tab.icon),
          label: tab.label,
        );
      }).toList(),
    );
  }
}
