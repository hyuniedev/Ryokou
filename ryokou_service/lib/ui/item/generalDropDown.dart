import 'package:flutter/material.dart';
import 'package:ryokou_service/themes/colors_theme.dart'; // Giữ nguyên nếu bạn đã định nghĩa AppColor

class GeneralDropdown<T> extends StatefulWidget {
  final List<T> items; // Thêm tham số để nhận danh sách bất kỳ từ bên ngoài
  final String hintText;
  final ValueChanged<T?> onChanged;

  const GeneralDropdown({
    super.key,
    required this.items,
    required this.hintText,
    required this.onChanged,
  });

  @override
  _GeneralDropdownState<T> createState() => _GeneralDropdownState<T>();
}

class _GeneralDropdownState<T> extends State<GeneralDropdown<T>> {
  T? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
      constraints: const BoxConstraints(
        maxHeight: 70, // Đặt chiều cao tối thiểu cho Container
      ),
      child: InputDecorator(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: AppColor.primaryColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 3),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        ),
        child: DropdownButton<T>(
          borderRadius: BorderRadius.circular(10),
          value: selectedItem,
          isExpanded: true, // Để dropdown mở rộng chiều ngang
          isDense: true,
          hint: Text(widget.hintText), // Văn bản nhắc khi không có gì được chọn
          items: widget.items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                item.toString(), // Chuyển item thành chuỗi để hiển thị
                style: const TextStyle(
                  fontSize: 14, // Kích thước văn bản
                ),
              ),
            );
          }).toList(),
          onChanged: (T? newValue) {
            setState(() {
              selectedItem = newValue;
            });
            widget.onChanged(newValue); // Gọi lại hàm onChanged
          },
          underline: const SizedBox(), // Bỏ đường gạch dưới mặc định
        ),
      ),
    );
  }
}
