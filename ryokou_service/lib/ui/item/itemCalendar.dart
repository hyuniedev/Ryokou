import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ryokou_service/themes/colors_theme.dart';

class ItemCalendar extends StatefulWidget {
  DateTime dateTime;
  ItemCalendar({super.key,required this.dateTime});

  @override
  State<ItemCalendar> createState() => _ItemCalendarState();
}

class _ItemCalendarState extends State<ItemCalendar> {
  DateTime beginDate = DateTime.now();
  DateTime dateText = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateText);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Text(
            formattedDate,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CalendarDatePicker(
                          initialDate: beginDate, // Giá trị ngày ban đầu
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                          onDateChanged: (value) {
                            setState(() {
                              beginDate = value; // Cập nhật ngày bắt đầu
                              dateText = beginDate; // Cập nhật ngày hiển thị
                              widget.dateTime = beginDate;
                            });
                          },
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              context.pop(); // Đóng BottomSheet
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                  AppColor.primaryColor),
                            ),
                            child: const Text(
                              'OK',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.thirdColor),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          icon: const Icon(
            Icons.date_range,
            color: AppColor.primaryColor,
            size: 30,
          ),
        ),
      ],
    );
  }
}
