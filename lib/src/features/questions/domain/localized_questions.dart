import 'package:catechism/src/features/questions/domain/question.dart';

class LocalizedQuestions {
  final Map<String, List<Question>> localizedQuestions;
  final List<Question> defaultQuestions;

  LocalizedQuestions({
    required this.localizedQuestions,
    required this.defaultQuestions,
  });

  List<Question> getQuestions(String locale) {
    return localizedQuestions[locale] ?? defaultQuestions;
  }
}
