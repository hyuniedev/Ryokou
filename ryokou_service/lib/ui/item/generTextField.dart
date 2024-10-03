import 'package:flutter/material.dart';
import 'package:ryokou_service/themes/colors_theme.dart'; // Giữ nguyên nếu bạn đã định nghĩa AppColor

class GenerTextField extends StatelessWidget {
  final TextEditingController tec;
  const GenerTextField({super.key, required this.tec});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: TextField(
          controller: tec,
          maxLines: 1,
          decoration: const InputDecoration(
            border: InputBorder.none,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.primaryColor,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}
