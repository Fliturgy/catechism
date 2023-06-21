import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/info_screen_data.dart';
import '../screens/info_screen.dart';

/// The CatechismDrawer class is used to create a catechism drawer, which
/// contains any optional additional information screens (e.g. about, help).
class CatechismDrawer extends StatelessWidget {
  /// The titles property is used to create the list of titles.
  final List<String> titles;

  /// The configuration property is used to create the configuration.
  final CatechismConfiguration configuration;

  /// The infoScreens property is used to create the info screens for the
  /// drawer.
  final List<InfoScreenData> infoScreens;

  /// The CatechismDrawer constructor is used to create a new instance of the
  /// CatechismDrawer class.
  CatechismDrawer({
    required this.titles,
    required this.configuration,
    required this.infoScreens,
  });

  /// The build method is used to create the widget.
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(height: 50),
          ...infoScreens.map((InfoScreenData infoScreenData) {
            return ListTile(
              leading: infoScreenData.icon != null
                  ? Icon(
                      infoScreenData.icon,
                      size: 22,
                    )
                  : null,
              title: Text(
                infoScreenData.title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => InfoScreen(
                      titles: titles,
                      configuration: configuration,
                      infoScreenData: infoScreenData,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
