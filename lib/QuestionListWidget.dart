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
  late List<Question> questions;
  late Map<int, SelectedAnswer> selectedAnswersMap;
  late int currentQuestionIndex;
  late Attempt attempt;
  late int remainingSeconds;
  Timer? _timer;
  bool isExamCompleted = false;

  @override
  void initState() {
    super.initState();
    questions = QuestionData().getQuestionsByExamId(widget.examId);
    selectedAnswersMap = {};
    currentQuestionIndex = 0;
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
      selectedAnswersMap[currentQuestionIndex] = SelectedAnswer(
        questionId: question.questionId,
        selectedAnswer: selectedLabel,
        examId: widget.examId,
        isCorrect: false,
      );
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        isExamCompleted = true;
      }
    });
  }

  void submitExam() {
    attempt.selectedAnswers = selectedAnswersMap.values.toList();
    AttemptData.getInstance().save(attempt);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultWidget(attempt),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Câu ${currentQuestionIndex + 1}/${questions.length}',
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
            child: QuestionCardWidget(questions[currentQuestionIndex], onSelect),
          ),
          SizedBox(height: 10),
          if (isExamCompleted)
            ElevatedButton(
              onPressed: submitExam,
              child: Text('Nộp bài'),
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
          submitExam(); // Tự động nộp bài khi hết giờ
        }
      });
    });
  }
}