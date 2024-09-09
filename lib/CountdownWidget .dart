import 'dart:async';
import 'package:flutter/material.dart';

class CountdownWidget extends StatefulWidget {
  final int seconds; // Thời gian đếm ngược ban đầu tính bằng giây

  CountdownWidget({required this.seconds});

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  late int remainingSeconds; // Thời gian còn lại
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.seconds;

    // Bắt đầu đếm ngược khi widget được khởi tạo
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--; // Giảm thời gian còn lại mỗi giây
        } else {
          _timer?.cancel(); // Dừng countdown khi hết giờ
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Dừng Timer khi widget bị hủy
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Thời gian còn lại: $remainingSeconds giây',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          if (remainingSeconds == 0)
            Text(
              'Hết giờ!',
              style: TextStyle(fontSize: 24, color: Colors.red),
            ),
        ],
      ),
    );
  }
}
