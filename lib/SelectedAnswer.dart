class SelectedAnswer {
  String examId;
  String questionId;
  String selectedAnswer;
  bool isCorrect;

  SelectedAnswer(
      {required this.examId,
      required this.questionId,
      required this.selectedAnswer,
      required this.isCorrect});

  bool isCorrectAnswer(String correctAnswer) {
    isCorrect = selectedAnswer == correctAnswer;
    return isCorrect;
  }
}
