import 'package:flutter/material.dart';
import 'package:myapp/Attempt.dart';
import 'package:myapp/AttemptData.dart';
import 'package:myapp/Question.dart';
import 'package:myapp/QuestionData.dart';
import 'package:myapp/QuesttionCardWidget.dart';
import 'package:myapp/ResultWidget.dart';
import 'package:myapp/SelectedAnswer.dart';

class QuestionListWidget extends StatefulWidget {
  late String examId;

  QuestionListWidget(this.examId);

// Suggested code may be subject to a license. Learn more: ~LicenseLog:3295237514.
  @override
  State<StatefulWidget> createState() {
    return _QuestionListWidget(examId);
  }
}

class _QuestionListWidget extends State<QuestionListWidget> {
  late List<Question> questions;
  late Map<int, SelectedAnswer> selectedAnswersMap;
  late int indexOfQuestion;
  late Attempt attempt;

  _QuestionListWidget(examId) {
    questions = QuestionData().getQuestionsByExamId(examId);
    selectedAnswersMap = {};
    indexOfQuestion = 0;
    attempt = Attempt(questions, selectedAnswersMap.values.toList(), examId);
  }

  @override
  void initState() {
    questions = QuestionData().getQuestionsByExamId(attempt.examId);
    selectedAnswersMap = {};
    indexOfQuestion = 0;
    super.initState();
  }

  void onSelect(String selecteLabel, Question question) {
    setState(() {
      selectedAnswersMap[indexOfQuestion] = SelectedAnswer(
          questionId: question.questionId,
          selectedAnswer: selecteLabel,
          examId: '',
          isCorrect: false);
      if (question.number < 30 + 1) {
        indexOfQuestion++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (indexOfQuestion == 30) {
      attempt.selectedAnswers = selectedAnswersMap.values.toList();
      AttemptData.getInstance().save(attempt);
    }

    return Scaffold(
      body: SafeArea(
        child: (indexOfQuestion < 30)
            ? QuestionCardWidget(questions[indexOfQuestion], onSelect)
            : ResultWidget(attempt),
      ),
    );
  }
}
