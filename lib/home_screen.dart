import 'package:flutter/material.dart';
import '../widgets/subject_grid.dart';
import '../models/subject.dart';

class HomeScreen extends StatelessWidget {
  final List<Subject> subjects = [
    Subject(name: 'Toán học', iconPath: 'assets/images/calculator.png', id: 1),
    Subject(name: 'Vật lý', iconPath: 'assets/images/physic.png', id: 2),
    Subject(name: 'Hóa học', iconPath: 'assets/images/hoahoc.png', id: 3),
    Subject(name: 'Sinh học', iconPath: 'assets/images/bio.png', id: 4),
    Subject(name: 'Ngữ văn', iconPath: 'assets/images/book.png', id: 5),
    Subject(name: 'TIếng anh ', iconPath: 'assets/images/eng.png', id: 6),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EduX'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SubjectGrid(subjects: subjects),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/chat");
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.chat),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
