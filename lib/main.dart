import 'package:flutter/material.dart';
import 'package:myapp/ChatWidget.dart';
import 'package:myapp/CountdownWidget%20.dart';
import 'package:myapp/Exam.dart';
import 'package:myapp/QuestionListWidget.dart';
import 'package:myapp/Subject.dart';

void main() {
  runApp(MaterialApp(
    // home: QuestionListWidget('SGDVDT-HD-Toan-20/12', 90*60),
    home: Scaffold(
      body: ChatWidget(),
    ),
  ));
}
