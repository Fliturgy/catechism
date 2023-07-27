import 'package:catechism/src/features/custom_pages/data/custom_page_provider.dart';
import 'package:catechism/src/features/custom_pages/domain/custom_page_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// The CatechismDrawer class is used to create a catechism drawer, which
/// contains any optional additional information screens (e.g. about, help).
class CatechismDrawer extends ConsumerWidget {
  /// The build method is used to create the widget.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = Localizations.localeOf(context);
    final languageCode = locale.languageCode;
    final customPages = ref.watch(customPageProvider!);
    final localeCustomPages = customPages.getCustomPages(languageCode);

    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(height: 50),
          ...localeCustomPages.map((CustomPageData customPage) {
            return ListTile(
              leading: customPage.icon != null
                  ? Icon(
                      customPage.icon,
                      size: 22,
                    )
                  : null,
              title: Text(
                customPage.title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () {
                Scaffold.of(context).openEndDrawer();
                context.goNamed(customPage.routeName);
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
