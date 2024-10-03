import 'package:flutter/material.dart';
import 'package:ryokou_service/entity/to_do_onDay.dart';
import 'package:ryokou_service/list/listHour.dart';
import 'package:ryokou_service/list/listMinutes.dart';
import 'package:ryokou_service/themes/colors_theme.dart';
import 'package:ryokou_service/ui/item/generTextField.dart';
import 'package:ryokou_service/ui/item/generalDropDown.dart';

class ItemToDo extends StatelessWidget {
  final ToDoOnDay toDo;
  const ItemToDo({super.key, required this.toDo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100,
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: GeneralDropdown(
                  isNeedIcon: false,
                  items: hours,
                  hintText: '',
                  onChanged: (String? newValue) {},
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
                child: GeneralDropdown(
                  isNeedIcon: false,
                  items: minutes,
                  hintText: '',
                  onChanged: (String? newValue) {},
                ),
              ),
            ],
          ),
        ),
        const GenerTextField()
      ],
    );
  }
}
