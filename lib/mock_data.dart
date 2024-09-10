import '../models/exam.dart';
import '../models/document.dart';
import 'dart:io';

// final List<Exam> exam_mock_data =


final List<Exam> exams = [
  Exam(
      title: 'Đề thi thử Trung học phổ thông quốc gia 2023-2024 môn Toán',
      id: 1,
      questionCount: 50,
      time: 90,
      point: 0),
  Exam(
      title: 'Đề thi thử Trung học phổ thông quốc gia 2022-2023 môn Toán',
      id: 2,
      questionCount: 50,
      time: 90,
      point: 0),
  Exam(
      title: 'Đề thi thử Trung học phổ thông quốc gia 2022-2023 môn Toán',
      id: 3,
      questionCount: 50,
      time: 90,
      point: 10),
  Exam(
      title: 'Đề thi thử Trung học phổ thông quốc gia 2022-2023 môn Toán',
      id: 4,
      questionCount: 50,
      time: 90,
      point: 0),
  Exam(
      id: 5,
      title: "Đề thi trung học phổ thông quốc gia 2023-2024 môn Toán",
      time: 90,
      questionCount: 50, point: 10),
  Exam(
      id: 6,
      title: "Đề thi trung học phổ thông quốc gia 2022-2023 môn Toán",
      time: 90,
      questionCount: 50, point: 8)
];

final List<Document> documents = [
  Document(
      id: 1,
      title:
          "Chinh phục câu hỏi lý thuyết và kỹ thuật giải nhanh hiện đại môn Vật Lý",
      author: "Chu Văn Biên",
      pages: 633),
  Document(
      id: 2,
      title: "Đề cương ôn tập HK2 Vật lý 12",
      author: "Sưu tầm ",
      pages: 40),
  Document(
      id: 3,
      title: "Phương pháp giải nahnh Vật lý 12",
      author: "Lê Tiến Hà",
      pages: 99)
];
