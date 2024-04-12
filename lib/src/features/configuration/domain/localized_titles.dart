class LocalizedTitles {
  final Map<String, List<String>> localizedTitles;
  final List<String> defaultTitles;

  LocalizedTitles({
    required this.localizedTitles,
    required this.defaultTitles,
  });

  List<String> getTitles(String languageCode) {
    return localizedTitles[languageCode] ?? defaultTitles;
  }
}
