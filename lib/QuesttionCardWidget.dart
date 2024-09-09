import 'package:flutter/material.dart';
import 'package:myapp/Exam.dart';
import 'package:myapp/Question.dart';

class QuestionCardWidget extends StatelessWidget {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2632377120.
  Question question;
  Function(String, Question) onSelect;

  QuestionCardWidget(this.question, this.onSelect);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Câu ' + question.number.toString() + '/30',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: Text("01:30:00"),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () => {}, child: Text("Báo lỗi")),
                )
              ],
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Text(
                  question.content,
                )
              ],
            ),
            SizedBox(height: 10),
            Column(
              children: question.choices.map((choice) {
                return Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: ElevatedButton(
                    child: Text(choice.label + " . " + choice.choiceContent),
                    onPressed: () => onSelect(choice.label, question),
                  ),
                );
              }).toList(), // Ensure map result is converted to a List
            )
          ],
        ),
      ),
    );
  }
}
