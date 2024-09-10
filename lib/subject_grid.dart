import 'package:flutter/material.dart';
import '../models/subject.dart';
import './subject_item.dart'; 

class SubjectGrid extends StatelessWidget {
  final List<Subject> subjects;

  const SubjectGrid({super.key, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10, 
        mainAxisSpacing: 10,
      ),
      itemCount: subjects.length, 
      itemBuilder: (context, index) {
        return SubjectItem(subject: subjects[index]); 
      },
    );
  }
}
