class QuizQuestion {
  QuizQuestion(this.questionText, this.answerText);
  final String questionText;
  final List<String> answerText;

  List<String> get shuffledAnswer {
    var shuffledAnswer = List.of(answerText);
    shuffledAnswer.shuffle();
    return shuffledAnswer;
  }
}
