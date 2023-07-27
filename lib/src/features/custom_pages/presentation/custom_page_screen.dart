import 'package:catechism/src/common_widgets/top_bar.dart';
import 'package:catechism/src/features/configuration/data/titles_provider.dart';
import 'package:catechism/src/features/custom_pages/domain/custom_page_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The InfoScreen class is used to create a screen that displays an optional
/// additional information screen (e.g. about, help) as well as the catechism
/// app bar.
class CustomPageScreen extends ConsumerWidget {
  /// The infoScreenData property is used to create the info screen data for the
  /// InfoScreen class.
  final CustomPageData infoScreenData;

  /// The InfoScreen constructor is used to create a new instance of the
  /// InfoScreen class.
  CustomPageScreen({
    required this.infoScreenData,
  });

  /// The build method is used to create the widget.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = Localizations.localeOf(context);
    final languageCode = locale.languageCode;
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
