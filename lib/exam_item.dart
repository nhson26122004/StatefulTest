import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../models/shared_prefs.dart';

class ExamItem extends StatefulWidget {
  final Exam exam;
  final bool withHeartIcon;

  const ExamItem({
    super.key,
    required this.exam,
    required this.withHeartIcon,
  });

  @override
  State<ExamItem> createState() => ExamItemState();
}

class ExamItemState extends State<ExamItem> {
  bool isFavorite = false;
  @override
  void initState() {
    super.initState();
    String? idsString = SharedPrefs.getString('intList');
    if (idsString != null) {
      List<int> idsInt = idsString.split(',').map((e) => int.parse(e)).toList();
      if (idsInt.contains(widget.exam.id)) {
        setState(() {
          isFavorite = true;
        });
      }
    }
  }

  toogleFavorite() async {
    String? idsString = SharedPrefs.getString('intList');
    List<int> idsInt = idsString != null
        ? idsString.split(',').map((e) => int.parse(e)).toList()
        : [];
    if (isFavorite) {
      idsInt.remove(widget.exam.id);
      setState(() {
        isFavorite = false;
      });
    } else {
      idsInt.add(widget.exam.id);
      setState(() {
        isFavorite = true;
      });
    }
    await SharedPrefs.saveString(widget.exam.title, idsInt.join(','));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.exam.title),
        Row(
          children: [
            const Icon(Icons.access_time, size: 16),
            const SizedBox(width: 4),
            Text('${widget.exam.time} phút'),
            const SizedBox(width: 10),
            const Icon(Icons.question_answer, size: 16),
            const SizedBox(width: 4),
            Text('${widget.exam.questionCount} câu'),
            const SizedBox(width: 10),
            const Icon(Icons.star, size: 16),
            const SizedBox(width: 4),
            Text('${widget.exam.point} điểm'),
            const SizedBox(width: 10),
            widget.withHeartIcon
                ? GestureDetector(
                    onTap: toogleFavorite,
                    child: Icon(
                      Icons.favorite,
                      size: 16,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                  )
                : const SizedBox(width: 10)
          ],
        )
      ],
    );
  }
}
