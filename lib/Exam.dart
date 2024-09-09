import 'package:myapp/Subject.dart';

class Exam {
  late String examId;
  late String name;
  late int duration;
  late String provider;
  late Subject subject;

  Exam(this.examId, this.name, this.provider, this.subject) {
    if (subject == Subject.MATH) {
      duration = 90 * 60;
    } else if (subject == Subject.PHYSICS) {
      duration = 50 * 60;
    } else if (subject == Subject.CHEMISTRY) {
      duration = 50 * 60;
    }
  }
}
