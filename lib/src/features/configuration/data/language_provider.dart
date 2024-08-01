import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_io/io.dart';

final languageProvider =
    NotifierProvider<LanguageCode, String>(LanguageCode.new);

class LanguageCode extends Notifier<String> {
  @override
  String build() {
    return Platform.localeName.split('_')[0].split('-')[0];
  }

  void setLanguageCode(String languageCode) {
    state = languageCode;
  }
}
