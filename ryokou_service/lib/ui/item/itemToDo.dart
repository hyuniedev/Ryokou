import 'package:flutter/material.dart';
import 'package:ryokou_service/entity/to_do_onDay.dart';
import 'package:ryokou_service/list/listHour.dart';
import 'package:ryokou_service/list/listMinutes.dart';
import 'package:ryokou_service/themes/colors_theme.dart';
import 'package:ryokou_service/ui/item/generTextField.dart';
import 'package:ryokou_service/ui/item/generalDropDown.dart';

class ItemToDo extends StatefulWidget {
   ToDoOnDay toDo;

   ItemToDo({super.key, required this.toDo});

  @override
  _ItemToDoState createState() => _ItemToDoState();
}

class _ItemToDoState extends State<ItemToDo> {
  // Khởi tạo giá trị mặc định cho giờ và phút
  late String selectedHour; // Khai báo biến giờ
  late String selectedMinute; // Khai báo biến phút

  // TextEditingController cho nội dung to-do
  TextEditingController tecTextToDo = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Đặt giá trị mặc định cho selectedHour và selectedMinute
    selectedHour = hours.isNotEmpty ? hours[0] : widget.toDo.hour; // Nếu hours không rỗng
    selectedMinute =
        minutes.isNotEmpty ? minutes[0] : widget.toDo.minute; // Nếu minutes không rỗng
    tecTextToDo.text = widget.toDo.content;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          width: 100,
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: GeneralDropdown<String>(
                  isNeedIcon: false,
                  items: hours,
                  hintText: '',
                  // Gán giá trị mặc định
                  onChanged: (String? newValue) {
                    if (newValue != null && hours.contains(newValue)) {
                      setState(() {
                        selectedHour = newValue; // Cập nhật khi có thay đổi
                        widget.toDo.hour = selectedHour;
                      });
                    }
                  },
                  value: selectedHour, // Gán giá trị hiện tại
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              const Text(
                ':',
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              Expanded(
                child: GeneralDropdown<String>(
                  isNeedIcon: false,
                  items: minutes,
                  hintText: '',
                  // Gán giá trị mặc định
                  onChanged: (String? newValue) {
                    if (newValue != null && minutes.contains(newValue)) {
                      setState(() {
                        selectedMinute = newValue; // Cập nhật khi có thay đổi
                        widget.toDo.minute = selectedMinute;
                      });
                    }
                  },
                  value: selectedMinute, // Gán giá trị hiện tại
                ),
              ),
            ],
          ),
        ),
        GenerTextField(
          tec: tecTextToDo,
          onChanged:(p0) => widget.toDo.content = tecTextToDo.text,
        ),
      ],
    );
  }
}
