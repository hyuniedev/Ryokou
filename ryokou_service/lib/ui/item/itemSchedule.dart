import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ryokou_service/list/listHour.dart';
import 'package:ryokou_service/list/listMinutes.dart';
import 'package:ryokou_service/themes/colors_theme.dart';
import 'package:ryokou_service/ui/item/generTextField.dart';
import 'package:ryokou_service/ui/item/generalDropDown.dart';

class ItemSchedule extends StatefulWidget {
  const ItemSchedule({super.key, required this.generalStyle});

  final TextStyle generalStyle;

  @override
  _ItemScheduleState createState() => _ItemScheduleState();
}

class _ItemScheduleState extends State<ItemSchedule> {
  List<SheduleDetails> scheduleList = [];

  @override
  void initState() {
    super.initState();
    // Khởi tạo với một SheduleDetails ban đầu
    scheduleList.add(SheduleDetails(generalStyle: widget.generalStyle));
  }

  void _addSchedule() {
    setState(() {
      scheduleList.add(SheduleDetails(generalStyle: widget.generalStyle));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  // Hiển thị danh sách các SheduleDetails
                  ...scheduleList.map((schedule) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: schedule,
                      )),
                  const SizedBox(
                      height: 100), // Khoảng trống để không bị che bởi button
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 16.0, // Đặt button ở phía dưới cách một khoảng
          right: 16.0, // Đặt button ở phía phải cách một khoảng
          child: SizedBox(
            width: 46,
            height: 46,
            child: ElevatedButton(
              onPressed: _addSchedule, // Gọi hàm _addSchedule khi ấn button
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                shape: const CircleBorder(),
                padding: EdgeInsets.zero,
              ),
              child: const Text(
                '+',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32, // Giảm kích thước chữ cho phù hợp
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SheduleDetails extends StatelessWidget {
  const SheduleDetails({
    super.key,
    required this.generalStyle,
  });

  final TextStyle generalStyle;

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
                  onChanged: (String? newValue) {
                    print('Selected: $newValue');
                  },
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                ':',
                style: generalStyle,
              ),
              Expanded(
                child: GeneralDropdown(
                  isNeedIcon: false,
                  items: minutes,
                  hintText: '',
                  onChanged: (String? newValue) {
                    print('Selected: $newValue');
                  },
                ),
              ),
            ],
          ),
        ),
        const Expanded(child: GenerTextField())
      ],
    );
  }
}
