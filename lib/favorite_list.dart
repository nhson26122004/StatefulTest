import '../widgets/exam_item.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/exam.dart';
import '../constants/mock_data.dart';
import '../models/shared_prefs.dart';

class FavoriteList extends StatelessWidget {
  final String examTitle;

  const FavoriteList({super.key, required this.examTitle});

  @override
  Widget build(BuildContext context) {
    List<int> favoriteIds = SharedPrefs.getString(examTitle) == null
        ? []
        : SharedPrefs.getString(examTitle)!
            .split(',')
            .map((e) => int.parse(e))
            .toList();

    List<Exam> favoriteExams =
        exams.where((e) => favoriteIds.contains(e.id)).toList();

    return ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: ExamItem(
              exam: favoriteExams[index],
              withHeartIcon: false,
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 5),
        itemCount: favoriteExams.length);
  }
}
