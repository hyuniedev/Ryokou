import 'package:flutter/material.dart';
import 'package:ryokou_service/list/listBool.dart';
import 'package:ryokou_service/list/listDay.dart';
import 'package:ryokou_service/list/listProvince.dart';
import 'package:ryokou_service/themes/colors_theme.dart';
import 'package:ryokou_service/ui/item/countQuantity.dart';
import 'package:ryokou_service/ui/item/generalContainer.dart';
import 'package:ryokou_service/ui/item/generalDropDown.dart';
import 'package:ryokou_service/ui/item/itemDay.dart';
import 'package:ryokou_service/ui/item/parentWidget.dart';
import 'package:ryokou_service/ui/sections/appBar/top_app_bar.dart';

class NewTour extends StatefulWidget {
  const NewTour({super.key});

  @override
  State<NewTour> createState() => _NewTourState();
}

class _NewTourState extends State<NewTour> {
  TextStyle generalStyle = const TextStyle(
    color: AppColor.primaryColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  TextStyle general = const TextStyle(
    color: AppColor.secondColor,
    fontSize: 16,
  );

  int _newCounter = 1; // Biến để theo dõi số lượng thay đổi

  // Hàm callback khi số lượng thay đổi
  void _onCounterChanged(int newCounter) {
    setState(() {
      _newCounter = newCounter; // Cập nhật số lượng vào biến
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
            scrollDirection: Axis.vertical, // Cho phép cuộn dọc toàn màn hình
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
                              GenerTextField(),
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
                                  onCounterChanged:
                                      _onCounterChanged, // Truyền callback để nhận số lượng
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
                              GenerTextField(),
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
                              GenerTextField(),
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
                          Expanded(
                            // Đảm bảo cuộn dọc ngoài cùng hoạt động đúng
                            child: ParentWidget(
                              initialCounter:
                                  _newCounter, // Đưa giá trị vào ParentWidget
                            ),
                          ),
                        ],
                      ),
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

  // Hàm tạo TextField
  Expanded GenerTextField() {
    final FocusNode focusNode =
        FocusNode(); // Tạo một FocusNode mới cho mỗi trường

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
