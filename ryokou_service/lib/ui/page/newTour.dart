import 'package:flutter/material.dart';
import 'package:ryokou_service/entity/schedule.dart';
import 'package:ryokou_service/entity/to_do_onDay.dart';
import 'package:ryokou_service/entity/tour.dart';
import 'package:ryokou_service/enum/eDay.dart';
import 'package:ryokou_service/list/listBool.dart';
import 'package:ryokou_service/list/listDay.dart';
import 'package:ryokou_service/list/listProvince.dart';
import 'package:ryokou_service/themes/colors_theme.dart';
import 'package:ryokou_service/ui/item/countQuantity.dart';
import 'package:ryokou_service/ui/item/generTextField.dart';
import 'package:ryokou_service/ui/item/generalContainer.dart';
import 'package:ryokou_service/ui/item/generalDropDown.dart';
import 'package:ryokou_service/ui/item/itemTag.dart';
import 'package:ryokou_service/ui/item/itemToDo.dart';
import 'package:ryokou_service/ui/sections/appBar/top_app_bar.dart';

class NewTour extends StatefulWidget {
  final Tour tour;

  const NewTour({super.key, required this.tour});

  @override
  State<NewTour> createState() => _NewTourState();
}

class _NewTourState extends State<NewTour> {
  late Tour _curTour;
  late Schedule selectedSchedule;
  TextStyle generalStyle = const TextStyle(
    color: AppColor.primaryColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  TextStyle general = const TextStyle(
    color: AppColor.secondColor,
    fontSize: 16,
  );

  int _newCounter = 1;
  int _selectedDayIndex = 0;

  @override
  void initState() {
    super.initState();
    _curTour = widget.tour;
    _curTour.addSchedule(Schedule(day: Eday.values[0].toString(), todo: []));
    selectedSchedule = _curTour.schedule[0];
  }

  // Hàm callback khi số lượng thay đổi
  void _onCounterChanged(int newCounter) {
    setState(() {
      if (newCounter > _newCounter) {
        for (int i = _newCounter; i < newCounter; i++) {
          _curTour
              .addSchedule(Schedule(day: Eday.values[i].toString(), todo: []));
        }
      } else if (newCounter < _newCounter) {
        for (int i = newCounter; i < _newCounter; i++) {
          _curTour.removeSchedule(
              Schedule(day: Eday.values[i].toString(), todo: []));
        }
      }
      _newCounter = newCounter;

      if (_selectedDayIndex >= newCounter) {
        _selectedDayIndex = newCounter - 1;
      }
    });
  }

  void _changedTag(int index) {
    setState(() {
      _selectedDayIndex = index;
      selectedSchedule = _curTour.schedule[_selectedDayIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus(); // Đóng bàn phím khi ấn ra ngoài
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                getAppBar(
                  context,
                  Container(),
                  height: 50,
                  haveLeading: true,
                  isGener: false,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GeneralContainer(
                        isList: false,
                        child: Column(
                          children: [
                            GenerRow(
                              TitleText('Tên Tour'),
                              const GenerTextField(),
                            ),
                            const SizedBox(height: 16),
                            GenerRow(
                              TitleText('Tỉnh/thành phố'),
                              Expanded(
                                child: GeneralDropdown<String>(
                                  items: provinces,
                                  hintText: 'Chọn tỉnh/TP',
                                  onChanged: (String? newValue) {
                                    print('Selected: $newValue');
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            GenerRow(
                              TitleText('Thời lượng tour(ngày)'),
                              Expanded(
                                child: CountQuantity(
                                  onCounterChanged: _onCounterChanged,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            GenerRow(
                              TitleText('Ngày bắt đầu'),
                              Container(),
                            ),
                            const SizedBox(height: 16),
                            GenerRow(
                              TitleText('Thời lượng duy trì'),
                              Expanded(
                                child: GeneralDropdown<String>(
                                  items: days,
                                  hintText: 'Chọn thời lượng',
                                  onChanged: (String? newValue) {
                                    print('Selected: $newValue');
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            GenerRow(
                              TitleText('Giá'),
                              const GenerTextField(),
                              container: Container(
                                child: const Text(
                                  'vnd',
                                  style: TextStyle(
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            GenerRow(
                              TitleText('Địa điểm tập họp'),
                              const GenerTextField(),
                            ),
                            const SizedBox(height: 16),
                            GenerRow(
                              TitleText('Dịch vụ đưa đón miễn phí'),
                              Expanded(
                                child: GeneralDropdown<String>(
                                  items: YesNo,
                                  hintText: 'Không',
                                  onChanged: (String? newValue) {
                                    print('Selected: $newValue');
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleText('Lịch trình'),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: List.generate(_newCounter, (index) {
                              return ItemTag(
                                titleTag: Eday.values[index],
                                isSelected: _selectedDayIndex == index,
                                changedTag: (value) => _changedTag(index),
                              );
                            }),
                          ),
                          GeneralContainer(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 300,
                                  child: ListView.builder(
                                    itemCount: selectedSchedule.todo.length,
                                    itemBuilder: (context, index) {
                                      ToDoOnDay todo =
                                          selectedSchedule.todo[index];
                                      return ItemToDo(toDo: todo);
                                    },
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Spacer(),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          selectedSchedule.todo.add(ToDoOnDay(
                                            date: DateTime.now(),
                                            content: 'New Task',
                                          ));
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColor.primaryColor,
                                        shape: const CircleBorder(),
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: const Text(
                                        '+',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Hàm tạo GenerRow
  Row GenerRow(Widget text, Widget field, {Widget? container}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        text,
        const SizedBox(width: 16),
        field,
        if (container != null) container,
      ],
    );
  }

  // Hàm tạo TitleText
  Row TitleText(String text) {
    return Row(
      children: [
        Text(
          text,
          style: generalStyle,
        ),
        Text(
          '*',
          style: general,
        ),
      ],
    );
  }
}
