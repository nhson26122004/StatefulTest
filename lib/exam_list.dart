import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_item.dart';

class ExamList extends StatelessWidget {
  final List<Exam> examList;
  const ExamList({super.key, required this.examList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 5),
                itemCount: examList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ExamItem(
                      exam: examList[index],
                      withHeartIcon: true,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
