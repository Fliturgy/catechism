import 'package:flutter/material.dart';

class CatechismAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// The CatechismAppBar class is used to create a catechism app bar,
  /// containing the title of the catechism app as well as either the back
  /// button or the menu button depending on the context.

  /// The titles property is used to create the titles for the app bar.
  final List<String> titles;

  /// The hasBackButton property is used to create the back button for the app
  /// bar.
  final bool hasBackButton;

  /// The preferredSize property is used to create the preferred size for the
  /// app bar.
  @override
  final Size preferredSize;

  /// The CatechismAppBar constructor is used to create a new instance of the
  /// CatechismAppBar class.
  CatechismAppBar(
    this.titles, {
    Key? key,
    this.hasBackButton = false,
  })  : preferredSize = Size.fromHeight(titles.length * 60.0 + 20.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    /// The build method is used to create the widget.
    return AppBar(
      centerTitle: true,
      leading: hasBackButton
          ? BackButton(
              color: Theme.of(context).primaryColor,
              // onPressed: () {
              //   if (Navigator.of(context).canPop()) {
              //     Navigator.of(context).pop();
              //   } else {
              //     Navigator.of(context)
              //         .pushReplacementNamed(CatechismListScreen.routeName);
              //   }
              // },
            )
          : null,
      elevation: 0,
      iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      toolbarHeight: titles.length * 60.0,
      actions: [
        SizedBox(width: 50.0),
      ],
      titleSpacing: 50.0,
      title: Column(
          children: titles.map((String title) {
        return FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        );
      }).toList()),
    );
  }
}
