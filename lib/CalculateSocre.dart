import 'package:myapp/Answer.dart';
import 'package:myapp/AnswerData.dart';
import 'package:myapp/Question.dart';
import 'package:myapp/Result.dart';
import 'package:myapp/SelectedAnswer.dart';

class CalculateScoreService {
  Result calculateScore(
      List<SelectedAnswer> selectedAnswers, List<Question> questions) {
    AnswerData answerData = AnswerData();

    List<Answer> answers = questions
        .map(
            (question) => answerData.getAnswerByQuestionId(question.questionId))
        .whereType<Answer>() // Lọc bỏ các giá trị null
        .toList();

    return _calculateScore(selectedAnswers, answers);
  }

  Result _calculateScore(
      List<SelectedAnswer> selectedAnswers, List<Answer> answers) {
    Map<String, String> correctAnswerMap = {};

    answers.forEach((answer) {
      correctAnswerMap[answer.questionId] = answer.correctAnswer;
    });

    int correctNumbers = 0;
    int unanswerNumbes = 0;
    int incorrectNumbers = 0;
    selectedAnswers.forEach((selectedAnswer) {
      String? correctAnswer = correctAnswerMap[selectedAnswer.questionId];
      if (correctAnswer != null &&
        selectedAnswer.isCorrectAnswer(correctAnswer)) {
        correctNumbers++;
      } else if (selectedAnswer.selectedAnswer == '') {
        unanswerNumbes++;
      } else {
        incorrectNumbers++;
      }
    });

    return Result(correctNumbers.toString() + "/30", correctNumbers,
        incorrectNumbers, unanswerNumbes);
  }
}
