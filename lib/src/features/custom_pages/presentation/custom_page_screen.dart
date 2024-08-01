import 'package:catechism/src/common_widgets/top_bar.dart';
import 'package:catechism/src/features/configuration/data/language_provider.dart';
import 'package:catechism/src/features/configuration/data/titles_provider.dart';
import 'package:catechism/src/features/custom_pages/domain/custom_page_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The CustomPageScreen class is used to create a screen that displays an
/// optional additional information screen (e.g. about, help) as well as the
/// catechism app bar.
class CustomPageScreen extends ConsumerWidget {
  /// The CustomPageScreenData property is used to create the info screen data
  /// for the CustomPageScreen class.
  final CustomPageData customPageData;

  /// The CustomPageScreen constructor is used to create a new instance of the
  /// CustomPageScreen class.
  CustomPageScreen({
    required this.customPageData,
  });

  /// The build method is used to create the widget.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageCode = ref.watch(languageProvider);
    final titles = ref.watch(titlesProvider!);
    final localeTitles = titles.getTitles(languageCode);

    return Scaffold(
      appBar: TopBar(
        localeTitles,
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
                customPageData.title,
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
                customPageData.content.join("\n\n"),
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
