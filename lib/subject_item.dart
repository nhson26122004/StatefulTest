import 'package:flutter/material.dart';
import '../models/subject.dart';
import '../screens/exam_screen.dart';

class SubjectItem extends StatelessWidget {
  final Subject subject;

  const SubjectItem({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ExamScreen.routeName,
            arguments: ExamArgs(subject.id, subject.name));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            subject.iconPath,
            width: 50,
            height: 50,
          ),
          const SizedBox(height: 8),
          Text(
            subject.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
