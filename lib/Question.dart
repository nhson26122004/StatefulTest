import 'package:myapp/Choice.dart';

class Question {
  String examId;
  String questionId;
  String content;
  late List<Choice> choices;
  int number;

  Question(
      {required this.examId,
      required this.questionId,
      required this.content,
      required List<String> choiceContent,
      required this.number}) {
    if (choiceContent.length > 4) {
      throw Exception("Too many choices");
    }
    choices = choiceContent
        .asMap()
        .entries
        .map((entry) => Choice(
            label: String.fromCharCode(65 + entry.key),
            choiceContent: entry.value))
        .toList();
  }
}
