import 'package:myapp/Question.dart';
import 'package:myapp/Result.dart';
import 'package:myapp/SelectedAnswer.dart';

class Attempt {
  late String attemptId;
  late Result result;
  late List<Question> questions;
  late List<SelectedAnswer> selectedAnswers;
  String examId;

  Attempt(this.questions, this.selectedAnswers, this.examId) {
    attemptId = '${examId}_${DateTime.now().toIso8601String()}';
  }
}
