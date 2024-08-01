import 'package:catechism/src/features/configuration/data/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The CatechismAppBar class is used to create a catechism app bar,
/// containing the title of the catechism app as well as either the back
/// button or the menu button depending on the context.
class TopBar extends ConsumerWidget implements PreferredSizeWidget {
  /// The titles property is used to create the titles for the app bar.
  final List<String> titles;

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
    this.titles, {
    super.key,
    this.hasBackButton = false,
    this.hasCloseButton = false,
  }) : preferredSize = Size.fromHeight(
            (titles.isNotEmpty ? titles.length : 1) * 60.0 + 20.0);

  /// The build method is used to create the widget.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      toolbarHeight: (titles.isNotEmpty ? titles.length : 1) * 60.0 + 20.0,
      actions: [
        hasCloseButton
            ? CloseButton(
                color: Theme.of(context).primaryColor,
              )
            : SizedBox(
                width: 50.0,
                child: const Center(
                  child: DropdownMenuExample(),
                ),
              ),
      ],
      titleSpacing: 50.0,
      title: titles.isNotEmpty
          ? Column(
              children: titles.map((String title) {
              return FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              );
            }).toList())
          : null,
    );
  }
}

class DropdownMenuExample extends ConsumerStatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  ConsumerState<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends ConsumerState<DropdownMenuExample> {
  String dropdownValue = AppLocalizations.supportedLocales.first.languageCode;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: ref.watch(languageProvider),
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          ref.read(languageProvider.notifier).setLanguageCode(value);
        });
      },
      dropdownMenuEntries: AppLocalizations.supportedLocales
          .map<DropdownMenuEntry<String>>((locale) {
        return DropdownMenuEntry<String>(
            value: locale.languageCode, label: locale.languageCode);
      }).toList(),
    );
  }
}
