import 'package:flutter/material.dart';
import 'package:myapp/Answer.dart';
import 'package:myapp/Question.dart';
import 'package:myapp/SelectedAnswer.dart';

class SelectedAnswerDetailWidget extends StatelessWidget {
  final SelectedAnswer selectedAnswer;
  final Question question;
  final Answer answer;

  SelectedAnswerDetailWidget(this.selectedAnswer, this.question, this.answer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(child: Text("Quay lại")),
            Icon(Icons.favorite, color: Colors.grey),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(question.content),
            ),
            ...question.choices.map((choice) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      width: 30, 
                      height: 30, 
                      decoration: BoxDecoration(
                        color: (choice.label == selectedAnswer.selectedAnswer) ? Colors.blue : Colors.white,
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          choice.label, 
                          style: TextStyle(
                            color: (choice.label == selectedAnswer.selectedAnswer) ? Colors.white : Colors.blue
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(choice.choiceContent),
                    ),
                  ],
                ),
              );
            }).toList(),
          SizedBox(height: 10,),
          Text(answer.answerDetail)
          ],
        ),
      ),
    );
  }
}