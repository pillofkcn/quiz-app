class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;

  // The first answer is always the correct one.
  final List<String> answers;

  List<String> getShuffledAnswers() {
    // Shuffle a copy so the original order (correct answer first) stays.
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
