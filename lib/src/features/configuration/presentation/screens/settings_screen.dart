import 'package:catechism/src/common_widgets/top_bar.dart';
import 'package:catechism/src/features/configuration/data/language_provider.dart';
import 'package:catechism/src/features/configuration/data/titles_provider.dart';
import 'package:catechism/src/features/configuration/presentation/widgets/language_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  SettingsScreen();

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
          child: Localizations.override(
            context: context,
            locale: Locale(ref.watch(languageProvider)),
            child: Builder(builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.settings,
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
                  SizedBox(
                    width: 300,
                    child: LanguageSelector(),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
