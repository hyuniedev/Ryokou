import 'package:flutter/material.dart';
import 'package:ryokou_service/themes/colors_theme.dart'; // Giữ nguyên nếu bạn đã định nghĩa AppColor

class GenerTextField extends StatelessWidget {
  const GenerTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode(); // Tạo một FocusNode mới cho mỗi trường

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: TextField(
          focusNode: focusNode,
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
