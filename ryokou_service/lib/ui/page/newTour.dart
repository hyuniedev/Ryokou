import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ryokou_service/entity/schedule.dart';
import 'package:ryokou_service/entity/to_do_onDay.dart';
import 'package:ryokou_service/entity/tour.dart';
import 'package:ryokou_service/enum/eDay.dart';
import 'package:ryokou_service/list/listBool.dart';
import 'package:ryokou_service/list/listDay.dart';
import 'package:ryokou_service/list/listProvince.dart';
import 'package:ryokou_service/list/listSale.dart';
import 'package:ryokou_service/themes/colors_theme.dart';
import 'package:ryokou_service/ui/item/countQuantity.dart';
import 'package:ryokou_service/ui/item/generTextField.dart';
import 'package:ryokou_service/ui/item/generalContainer.dart';
import 'package:ryokou_service/ui/item/generalDropDown.dart';
import 'package:ryokou_service/ui/item/itemCalendar.dart';
import 'package:ryokou_service/ui/item/itemField.dart';
import 'package:ryokou_service/ui/item/itemTag.dart';
import 'package:ryokou_service/ui/item/itemToDo.dart';
import 'package:ryokou_service/ui/item/uploadImage.dart';
import 'package:ryokou_service/ui/sections/appBar/top_app_bar.dart';

import 'package:go_router/go_router.dart';

class NewTour extends StatefulWidget {
  const NewTour({super.key});

  @override
  State<NewTour> createState() => _NewTourState();
}

class _NewTourState extends State<NewTour> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Tour _curTour = Tour.empty();
  late Schedule selectedSchedule;
  DateTime selectedDayBegin = DateTime.now();
  List<File> lsFile = [];
  String? selectedCity;
  String? selectedMaintain;
  bool? selectedService = false;
  TextEditingController tecName = TextEditingController();
  TextEditingController tecgatheringPlace = TextEditingController();
  TextEditingController tecCost = TextEditingController();
  TextEditingController tecPointo = TextEditingController();
  TextEditingController tecKisoku = TextEditingController();
  TextStyle generalStyle = const TextStyle(
    color: AppColor.primaryColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  TextStyle general = const TextStyle(
    color: AppColor.secondColor,
    fontSize: 16,
  );
  int _sale = 0;
  int _newCounter = 1;
  int _selectedDayIndex = 0;

  @override
  void initState() {
    super.initState();
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
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GeneralContainer(
                          isList: false,
                          child: Column(
                            children: [
                              GenerRow(
                                TitleText('Tên Tour'),
                                GenerTextField(
                                  tec: tecName,
                                ),
                              ),
                              const SizedBox(height: 16),
                              GenerRow(
                                TitleText('Tỉnh/thành phố'),
                                Expanded(
                                  child: GeneralDropdown<String>(
                                    items: provinces,
                                    hintText: 'Chọn tỉnh/TP',
                                    onChanged: (String? newValue) {
                                      selectedCity = newValue;
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
                                Container(
                                  child: ItemCalendar(
                                    dateTime: selectedDayBegin,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              GenerRow(
                                TitleText('Thời lượng duy trì'),
                                Expanded(
                                  child: GeneralDropdown<String>(
                                    items: days,
                                    hintText: 'Chọn thời lượng',
                                    onChanged: (String? newValue) {
                                      selectedMaintain = newValue;
                                      print('Selected: $newValue');
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              GenerRow(
                                TitleText('Giá'),
                                GenerTextField(
                                  tec: tecCost,
                                  keyboardType: TextInputType.number,
                                ),
                                container: Container(
                                  child: const Text(
                                    'VND',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              GenerRow(
                                TitleText('Sale'),
                                Container(
                                  width: 130,
                                  child: GeneralDropdown<int>(
                                    items: lsSale,
                                    hintText: 'Chọn % sale',
                                    onChanged: (int? newValue) {
                                      _sale = newValue!;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              GenerRow(
                                TitleText('Địa điểm tập họp'),
                                GenerTextField(
                                  tec: tecgatheringPlace,
                                ),
                              ),
                              const SizedBox(height: 16),
                              GenerRow(
                                TitleText('Dịch vụ đưa đón miễn phí'),
                                Expanded(
                                  child: GeneralDropdown<String>(
                                    items: YesNo,
                                    hintText: 'Không',
                                    onChanged: (String? newValue) {
                                      selectedService = (newValue==YesNo[0])?true:false;
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(_newCounter, (index) {
                                  return ItemTag(
                                    titleTag: Eday.values[index],
                                    isSelected: _selectedDayIndex == index,
                                    changedTag: (value) => _changedTag(index),
                                  );
                                }),
                              ),
                            ),
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  width: MediaQuery.of(context).size.width,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: AppColor.primaryColor, width: 2),
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      children: List.generate(
                                        selectedSchedule.todo.length,
                                        (index) {
                                          ToDoOnDay toDo =
                                              selectedSchedule.todo[index];
                                          return ItemToDo(toDo: toDo);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 20, right: 20),
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedSchedule.addToDo(ToDoOnDay(
                                          hour: '00',
                                          minute: '00',
                                          content: 'New task'));
                                      });
                                    },
                                    backgroundColor: AppColor.primaryColor,
                                    child: Icon(
                                      Icons.add,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    shape: CircleBorder(),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleText('Điểm nổi bật'),
                            ItemField(
                                title: '', isGener: false, tec: tecPointo),
                            const SizedBox(
                              height: 16,
                            ),
                            TitleText('Điều khoản và dịch vụ của tour'),
                            ItemField(
                                title: '', isGener: false, tec: tecKisoku),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleText('Hình ảnh Tour'),
                            const SizedBox(
                              height: 20,
                            ),
                            UploadImage(
                              lsImage: lsFile,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.secondColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                shadowColor:
                                    const Color.fromARGB(255, 179, 158, 131),
                                elevation: 5,
                              ),
                              onPressed: () async{
                                _curTour.name = tecName.text;
                                print("Name: ${_curTour.name}");

                                _curTour.city = selectedCity!;
                                print("City: ${_curTour.city}");

                                _curTour.maintainTime = int.parse(
                                    selectedMaintain!.substring(0, 2));
                                print(
                                    "Maintain Time: ${_curTour.maintainTime}");

                                _curTour.durations = _newCounter;
                                print("Durations: $_newCounter");

                                _curTour.start = selectedDayBegin;
                                print("Start Day: $selectedDayBegin");

                                _curTour.cost = tecCost.text;
                                print("Cost: ${_curTour.cost}");

                                _curTour.sale = _sale;
                                print("Sale: $_sale");

                                _curTour.gatheringPlace =
                                    tecgatheringPlace.text;
                                print(
                                    "Gathering Place: ${_curTour.gatheringPlace}");

                                _curTour.freeService = selectedService!;
                                print("Free Service: ${_curTour.freeService}");

                                _curTour.pointo = tecPointo.text;
                                print("Pointo: ${_curTour.pointo}");

                                _curTour.kisoku = tecKisoku.text;
                                print("Kisoku: ${_curTour.kisoku}");

                                _curTour.lsFile = lsFile;
                                print('Size list File: ${_curTour.lsFile.length}');

                                await _firestore.collection('tours').add(await _curTour.toJson());
                                context.go('/listTour');
                              },
                              child: const Text(
                                'Xác nhận',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                        )
                      ],
                    ),
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
