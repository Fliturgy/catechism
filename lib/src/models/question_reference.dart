/// Question reference model
class QuestionReference {
  /// The title property is used to create the title for the reference.
  final String title;

  /// The content property is used to create the content for the reference.
  final List<String> content;

  /// The QuestionReference constructor is used to create a new instance of the
  /// QuestionReference class.
  QuestionReference({
    required this.title,
    this.content = const [],
  });
}
