import 'package:flutter/material.dart';
import '../layouts/exam_list.dart';
import '../layouts/favorite_list.dart';
import '../layouts/document_list.dart';
import '../constants/mock_data.dart';

class ExamArgs {
  final int id;
  final String name;

  ExamArgs(this.id, this.name);
}

class ExamScreen extends StatelessWidget {
  static const routeName = "/exam";
  final ExamArgs examArgs;

  const ExamScreen({super.key, required this.examArgs});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text(examArgs.name),
              bottom: const TabBar(tabs: [
                Tab(
                  text: "Đề thi",
                ),
                Tab(
                  text: "Yêu thích",
                ),
                Tab(text: "Tài liệu")
              ]),
            ),
            body: TabBarView(children: [
              ExamList(examList: exams),
              const FavoriteList(examTitle: 'Toán'),
              const DocumentScreen(),
            ])));
  }
}
