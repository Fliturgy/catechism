class CatechismConfiguration {
  /// The CatechismConfiguration class is used to configure the catechism app,
  /// enabling or disabling certain features.
  final bool displayQuestionNumberInDetails;
  final bool displayQuestionTitleInDetails;

  CatechismConfiguration({
    required this.displayQuestionNumberInDetails,
    required this.displayQuestionTitleInDetails,
  });
}
