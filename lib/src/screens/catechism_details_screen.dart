import 'package:catechism/src/models/tab.dart';
import 'package:catechism/src/widgets/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../configuration.dart';
import '../models/questions.dart';
import '../widgets/app_bar.dart';
import '../widgets/question_details_item.dart';

/// The CatechismDetailsScreen class is used to create a screen that displays
/// a QuestionDetailsItem for a given question as well as the catechism
/// app bar.
class CatechismDetailsScreen extends StatefulWidget {
  /// The routeName property is used to create the route name for the
  /// CatechismDetailsScreen class.
  static const routeName = '/catechism-details';

  /// The titles property is used to create the list of titles for the
  /// CatechismDetailsScreen class.
  final List<String> titles;

  /// The configuration property is used to create the configuration for the
  /// CatechismDetailsScreen class.
  final CatechismConfiguration configuration;

  /// The CatechismDetailsScreen constructor is used to create a catechism
  /// details screen.
  CatechismDetailsScreen({
    required this.titles,
    required this.configuration,
  });

  /// The createState method is used to create the state for the
  /// CatechismDetailsScreen class.
  @override
  State<CatechismDetailsScreen> createState() => _CatechismDetailsScreenState();
}

/// The _CatechismDetailsScreenState class is used to create the state for the
/// CatechismDetailsScreen class.
class _CatechismDetailsScreenState extends State<CatechismDetailsScreen> {
  late CatechismTabData _selectedTab;

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.configuration.tabs.firstWhere(
        (element) => element.type == widget.configuration.defaultTabType);
  }

  void _selectTab(int index) {
    setState(() {
      _selectedTab = widget.configuration.tabs[index];
    });
  }

  /// The build method is used to build the widget tree for the
  /// CatechismDetailsScreen class.
  @override
  Widget build(BuildContext context) {
    final questions = Provider.of<Questions>(context).questions;
    final questionId = ModalRoute.of(context)?.settings.arguments as int;

    final PageController controller = PageController(
      initialPage: questionId - 1,
    );

    return Scaffold(
      appBar: CatechismAppBar(
        widget.titles,
        hasBackButton: true,
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: questions
            .map((e) => QuestionDetailsItem(
                  question: e,
                  configuration: widget.configuration,
                  selectedTab: _selectedTab,
                ))
            .toList(),
      ),
      bottomNavigationBar: widget.configuration.showTabBar &&
              widget.configuration.tabs.length > 1
          ? CatechismTabBar(
              questions[questionId - 1],
              selectTab: _selectTab,
              selectedTab: _selectedTab,
              configuration: widget.configuration,
            )
          : null,
    );
  }
}
