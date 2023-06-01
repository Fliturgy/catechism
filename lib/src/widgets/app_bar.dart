import 'package:flutter/material.dart';

class CatechismAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> titles;
  final bool hasBackButton;

  @override
  final Size preferredSize;

  CatechismAppBar(
    this.titles, {
    Key? key,
    this.hasBackButton = false,
  })  : preferredSize = Size.fromHeight(titles.length * 60.0 + 20.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: Colors.white,
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
