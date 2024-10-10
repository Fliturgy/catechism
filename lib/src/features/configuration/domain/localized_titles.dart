import 'package:catechism/src/features/configuration/domain/title_data.dart';

class LocalizedTitles {
  final Map<String, TitleData> localizedTitles;
  final TitleData defaultTitle;

  LocalizedTitles({
    required this.localizedTitles,
    required this.defaultTitle,
  });

  TitleData getTitle(String languageCode) {
    return localizedTitles[languageCode] ?? defaultTitle;
  }
}
