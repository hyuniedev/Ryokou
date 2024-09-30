import 'package:flutter/material.dart';
import 'itemDay.dart';

class ParentWidget extends StatelessWidget {
  final int initialCounter;

  const ParentWidget({super.key, required this.initialCounter});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Hiển thị giá trị của initialCounter

        SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Cuộn ngang
          child: Row(
            
            children: [ItemDay(counter: initialCounter)],
          ),
        ),
      ],
    );
  }
}
