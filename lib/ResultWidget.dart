import 'package:flutter/material.dart';
import 'package:myapp/Answer.dart';
import 'package:myapp/AnswerData.dart';
import 'package:myapp/Attempt.dart';
import 'package:myapp/CalculateSocre.dart';
import 'package:myapp/Question.dart';
import 'package:myapp/QuestionListWidget.dart';
import 'package:myapp/Result.dart';
import 'package:myapp/SelectedAnswer.dart';
import 'package:myapp/SelectedAnswerDetailWidget.dart';

class ResultWidget extends StatelessWidget {
  Attempt attempt;

  ResultWidget(this.attempt) {
    attempt.result = CalculateScoreService()
        .calculateScore(attempt.selectedAnswers, attempt.questions);
  }

  @override
  Widget build(BuildContext context) {
    print("Đang build");

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(child: Text("Kết quả bài thi")),
            ElevatedButton(
                onPressed: () => retakeExam(context, attempt.examId),
                child: Text("Làm lại"))
          ],
        ),
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Text(
                "Điểm : ${attempt.result.score}",
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(width: 10),
              Icon(Icons.timer, color: Colors.purple),
              Text('1:28:12')
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Đúng : ${attempt.result.correctNumbers}",
                style: TextStyle(color: Colors.green),
              ),
              Text(
                "Chưa trả lời : ${attempt.result.unanswerNumbes}",
                style: TextStyle(color: Colors.orange),
              ),
              Text(
                "Sai : ${attempt.result.incorrectNumbers}",
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: Text(
            "Chạm vào câu bất kỳ để xem chi tiết",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: GridView.count(
            crossAxisCount: 4,
            children: this.attempt.selectedAnswers.asMap().entries.map((entry) {
              int index = entry.key;
              SelectedAnswer ans = entry.value;
              return Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: (ans.isCorrect) ? Colors.blue : Colors.red,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => answerDetail(
                            context, attempt.questions[index], ans),
                      ),
                    );
                  },
                  child: Text(
                    "Câu ${index + 1}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }).toList(),
          ),
        )
      ]),
    );
  }

  Widget answerDetail(
      BuildContext context, Question question, SelectedAnswer ans) {
    Answer? answer = AnswerData().getAnswerByQuestionId(question.questionId);
    return SelectedAnswerDetailWidget(ans, question, answer!);
  }

  void retakeExam(BuildContext context, String examId) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionListWidget(examId)),
    );
  }
}
