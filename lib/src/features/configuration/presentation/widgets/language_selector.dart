import 'package:catechism/src/features/configuration/data/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locale_names/locale_names.dart';

class LanguageSelector extends ConsumerStatefulWidget {
  const LanguageSelector({super.key});

  @override
  ConsumerState<LanguageSelector> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends ConsumerState<LanguageSelector> {
  String dropdownValue = AppLocalizations.supportedLocales.first.languageCode;

  @override
  Widget build(BuildContext context) {
    dropdownValue = ref.watch(languageProvider);

    return DropdownButtonFormField<String>(
      value: dropdownValue,
      hint: Text(AppLocalizations.of(context)!.selectLanguage),
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.selectLanguage,
        border: OutlineInputBorder(),
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
          ref.read(languageProvider.notifier).setLanguageCode(newValue);
        });
      },
      validator: (String? value) {
        if (value == null) {
          return AppLocalizations.of(context)!.selectLanguage;
        }
        return null;
      },
      items: AppLocalizations.supportedLocales
          .map<DropdownMenuItem<String>>((locale) {
        String displayName = locale.displayLanguageIn(locale);

        if (locale.languageCode != dropdownValue) {
          displayName +=
              ' (${locale.displayLanguageIn(Locale.fromSubtags(languageCode: dropdownValue))})';
        }

        return DropdownMenuItem<String>(
          value: locale.languageCode,
          child: Text(displayName),
        );
      }).toList(),
    );
  }
}
