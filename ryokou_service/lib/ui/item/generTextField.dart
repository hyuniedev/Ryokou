import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Thêm thư viện intl
import 'package:ryokou_service/themes/colors_theme.dart'; // Giữ nguyên nếu bạn đã định nghĩa AppColor

class GenerTextField extends StatelessWidget {
  final TextEditingController tec;
  final TextInputType keyboardType;
  final Function(String)? onChanged;

  const GenerTextField({
    super.key,
    required this.tec,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: TextField(
          controller: tec,
          keyboardType: keyboardType,
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
            contentPadding: EdgeInsets.only(bottom: 2),
            isDense: true,
          ),
          style: const TextStyle(fontSize: 16, color: Colors.black),
          onChanged: (value) {
            String formattedValue = _formatNumber(value);
            tec.value = tec.value.copyWith(
              text: formattedValue,
              selection: TextSelection.collapsed(offset: formattedValue.length),
            );
            if (onChanged != null) {
              onChanged!(formattedValue);
            }
          },
        ),
      ),
    );
  }

  String _formatNumber(String value) {
    if (value.isEmpty) {
      return '';
    }

    value = value.replaceAll('.', '');

    final formatter = NumberFormat('#,###', 'en');
    try {
      final number = int.parse(value);
      return formatter.format(number).replaceAll(',', '.');
    } catch (e) {
      return value;
    }
  }
}
