import 'package:catechism/src/features/custom_pages/domain/custom_page_data.dart';

class LocalizedCustomPages {
  final Map<String, List<CustomPageData>> localizedCustomPages;
  final List<CustomPageData> defaultCustomPages;

  LocalizedCustomPages({
    required this.localizedCustomPages,
    required this.defaultCustomPages,
  });

  List<CustomPageData> getCustomPages(String locale) {
    return localizedCustomPages[locale] ?? defaultCustomPages;
  }

  List<CustomPageData> getAllCustomPages() {
    return localizedCustomPages.values.expand((element) => element).toList();
  }
}
