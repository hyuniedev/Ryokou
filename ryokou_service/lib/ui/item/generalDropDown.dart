import 'package:flutter/material.dart';
import 'package:ryokou_service/themes/colors_theme.dart'; // Giữ nguyên nếu bạn đã định nghĩa AppColor

class GeneralDropdown<T> extends StatefulWidget {
  final List<T> items; // Danh sách item
  final String hintText; // Văn bản nhắc
  final ValueChanged<T?> onChanged; // Callback khi chọn item
  final bool isNeedIcon; // Tùy chọn có cần icon hay không
  final T? value; // Giá trị hiện tại của dropdown

  const GeneralDropdown({
    super.key,
    required this.items,
    required this.hintText,
    required this.onChanged,
    this.isNeedIcon = true, // Đặt giá trị mặc định cho isNeedIcon
    this.value, // Khởi tạo giá trị hiện tại
  });

  @override
  _GeneralDropdownState<T> createState() => _GeneralDropdownState<T>();
}

class _GeneralDropdownState<T> extends State<GeneralDropdown<T>> {
  T? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.value; // Gán giá trị hiện tại vào selectedItem
  }

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
          isExpanded: true, // Để dropdown mở rộng chiều ngang
          isDense: true,
          hint: Text(widget.hintText),
          value: selectedItem,
          items: widget.items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                item.toString(),
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            );
          }).toList(),
          onChanged: (T? newValue) {
            setState(() {
              selectedItem = newValue; 
            });
            widget.onChanged(newValue); 
          },
          underline: const SizedBox(), 
          icon: widget.isNeedIcon
              ? null
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
