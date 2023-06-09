import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/info_screen_data.dart';
import '../widgets/top_bar.dart';

/// The InfoScreen class is used to create a screen that displays an optional
/// additional information screen (e.g. about, help) as well as the catechism
/// app bar.
class InfoScreen extends StatelessWidget {
  /// The titles property is used to create the titles for the app bar.
  final List<String> titles;

  /// The configuration property is used to create the configuration for the
  /// InfoScreen class.
  final CatechismConfiguration configuration;

  /// The infoScreenData property is used to create the info screen data for the
  /// InfoScreen class.
  final InfoScreenData infoScreenData;

  /// The InfoScreen constructor is used to create a new instance of the
  /// InfoScreen class.
  InfoScreen({
    required this.titles,
    required this.configuration,
    required this.infoScreenData,
  });

  /// The build method is used to create the widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        titles,
        hasBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 35.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                infoScreenData.title,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(
                height: 10.0,
              ),
              Divider(
                thickness: 2.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                infoScreenData.content.join("\n\n"),
                softWrap: true,
                // textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
