import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/info_screen_data.dart';
import '../widgets/app_bar.dart';

class InfoScreen extends StatelessWidget {
  final List<String> titles;
  final CatechismConfiguration configuration;
  final InfoScreenData infoScreenData;

  InfoScreen({
    required this.titles,
    required this.configuration,
    required this.infoScreenData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CatechismAppBar(
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
                style: Theme.of(context).textTheme.headlineMedium,
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
