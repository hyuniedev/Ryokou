import 'package:flutter/material.dart';
import 'itemDay.dart';

class ParentWidget extends StatelessWidget {
  final int initialCounter;
  final Function(String) onDaySelected;

  const ParentWidget({
    super.key,
    required this.initialCounter,
    required this.onDaySelected, // Nhận callback từ widget cha
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Hiển thị các ItemDay dựa trên giá trị của initialCounter
        SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Cuộn ngang
          child: Row(
            children: [
              ItemDay(
                counter: initialCounter,
                onDaySelected:
                    onDaySelected, // Truyền callback vào từng ItemDay
              ),
            ],
          ),
        ),
      ],
    );
  }
}
