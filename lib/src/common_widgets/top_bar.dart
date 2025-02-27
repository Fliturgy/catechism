import 'package:catechism/src/features/configuration/domain/title_data.dart';
import 'package:flutter/material.dart';

/// The CatechismAppBar class is used to create a catechism app bar,
/// containing the title of the catechism app as well as either the back
/// button or the menu button depending on the context.
class TopBar extends StatelessWidget implements PreferredSizeWidget {
  /// The title property is used to create the titles for the app bar.
  final TitleData title;

  /// The hasBackButton property is used to determine whether or not the app
  /// bar has a back button.
  final bool hasBackButton;

  /// The hasCloseButton property is used to determine whether or not the app
  /// bar has a close button.
  final bool hasCloseButton;

  /// The preferredSize property is used to create the preferred size for the
  /// app bar.
  @override
  final Size preferredSize;

  /// The CatechismAppBar constructor is used to create a new instance of the
  /// CatechismAppBar class.
  TopBar(
    this.title, {
    super.key,
    this.hasBackButton = false,
    this.hasCloseButton = false,
  })  : preferredSize = Size.fromHeight(title.height);

  /// The build method is used to create the widget.
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: hasBackButton || !hasCloseButton,
      leading: hasBackButton
          ? BackButton(
              color: Theme.of(context).primaryColor,
            )
          : null,
      elevation: 0,
      iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      toolbarHeight: title.height,
      actions: [
        hasCloseButton
            ? CloseButton(
                color: Theme.of(context).primaryColor,
              )
            : SizedBox(width: 50.0),
      ],
      titleSpacing: 50.0,
      title: DefaultTextStyle(
        child: title.title,
        style: Theme.of(context).textTheme.titleLarge!,
      ),
    );
  }
}
