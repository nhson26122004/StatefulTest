import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myapp/Attempt.dart';
import 'package:myapp/AttemptData.dart';
import 'package:myapp/Question.dart';
import 'package:myapp/QuestionData.dart';
import 'package:myapp/QuesttionCardWidget.dart';
import 'package:myapp/ResultWidget.dart';
import 'package:myapp/SelectedAnswer.dart';

class QuestionListWidget extends StatefulWidget {
  final String examId;
  final int duration;

  const QuestionListWidget(this.examId, this.duration, {Key? key}) : super(key: key);

  @override
  State<QuestionListWidget> createState() => _QuestionListWidgetState();
}

class _QuestionListWidgetState extends State<QuestionListWidget> {
  late List<Question> questions;// 0-29
  late Map<int, SelectedAnswer> selectedAnswersMap;
  late int indexOfQuestion;
  late Attempt attempt;
  late int remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    questions = QuestionData().getQuestionsByExamId(widget.examId);
    selectedAnswersMap = {};
    indexOfQuestion = 0;
    attempt = Attempt(questions, [], widget.examId);
    remainingSeconds = widget.duration;
    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void onSelect(String selectedLabel, Question question) {
    setState(() {
      selectedAnswersMap[indexOfQuestion] = SelectedAnswer(
        questionId: question.questionId,
        selectedAnswer: selectedLabel,
        examId: widget.examId,
        isCorrect: false,
      );
      if (indexOfQuestion < 30) {
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Câu ${indexOfQuestion + 1}/30',
                  style: TextStyle(color: Colors.orange),
                ),
                Text('${remainingSeconds}s'),
                ElevatedButton(
                  onPressed: () {}, 
                  child: Text("Báo lỗi"),
                ),
              ],
            ),
          ),
          Expanded(
            child: (indexOfQuestion < 30)
                ? QuestionCardWidget(questions[indexOfQuestion], onSelect)
                : ResultWidget(attempt),
          ),
        ],
      ),
    );
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
        } else {
          _timer?.cancel();
          // Có thể thêm logic khi hết giờ ở đây
        }
      });
    });
  }
}