import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ryokou/entity/tour.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/item/generalDropDown.dart';
import 'package:ryokou/ui/page/home/enumTag/e_province.dart';
import 'package:ryokou/ui/sections/appbar/top_app_bar.dart';
import 'package:ryokou/ui/sections/grid_tour/grid_tour.dart';

class ResultSearch extends StatefulWidget {
  ResultSearch({super.key, required this.lsTour});
  List<Tour> lsTour;
  @override
  State<StatefulWidget> createState() => _ResultSearchState();
}

class _ResultSearchState extends State<ResultSearch> {
  final TextEditingController _tecSearch = TextEditingController();
  final FocusNode _focusNodeSearch = FocusNode();

  String? curProvince;
  RangeValues curRangeValue = const RangeValues(0, 10000000);
  final int step = 100000;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: getAppBar(
          context,
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: 50.0,
              child: TextField(
                focusNode: _focusNodeSearch,
                controller: _tecSearch,
                style: const TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.none,
                ),
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm...',
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  filterTour(),
                  GridTour(tours: widget.lsTour),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column filterTour() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'LỌC THEO',
          style: TextStyle(
              fontSize: 24,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        GeneralDropdown(
            items: EProvince.values.map((pro) => pro.text).toList(),
            hintText: 'Tỉnh/thành phố',
            onChanged: (String? value) {
              setState(() {
                curProvince = value;
              });
            }),
        const SizedBox(height: 10),
        const Text(
          'Giá:',
          style: TextStyle(
              fontSize: 20,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 7),
        RangeSlider(
          values: curRangeValue,
          min: 0,
          max: 10000000,
          divisions: 1000000,
          onChanged: (RangeValues values) {
            setState(() {
              curRangeValue = RangeValues(
                  ((values.start / step).round()) *
                      step.toDouble().clamp(0, 10000000),
                  ((values.end / step).round()) *
                      step.toDouble().clamp(0, 10000000));
            });
          },
          labels: RangeLabels(
              convertCost(curRangeValue.start.toStringAsFixed(0)),
              convertCost(curRangeValue.end.toStringAsFixed(0))),
        ),
        const SizedBox(height: 7),
        Text('Từ: ${convertCost(curRangeValue.start.toInt().toString())}VNĐ',
            style: const TextStyle(
                fontSize: 14,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Text('Đến: ${convertCost(curRangeValue.end.toInt().toString())}VNĐ',
            style: const TextStyle(
                fontSize: 14,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Xác nhận',
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold),
              )),
        ),
      ],
    );
  }

  String convertCost(String s) {
    try {
      int value = int.parse(s);

      final formatter = NumberFormat('#,###', 'en_US');

      return formatter.format(value).replaceAll(',', '.');
    } catch (e) {
      return 'Invalid input';
    }
  }
}
