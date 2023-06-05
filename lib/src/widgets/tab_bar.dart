import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/question.dart';
import '../models/tab.dart';

class CatechismTabBar extends StatelessWidget {
  /// The CatechismTabBar class is used to display the tabs at the bottom of the
  /// catechism app.
  final Question question;
  final void Function(int)? selectTab;
  final CatechismTabData selectedTab;
  final CatechismConfiguration configuration;

  CatechismTabBar(
    this.question, {
    required this.selectTab,
    required this.selectedTab,
    required this.configuration,
  });

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
