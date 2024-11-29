import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ryokou/entity/tour.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/item/generalDropDown.dart';
import 'package:ryokou/ui/page/home/enumTag/e_province.dart';
import 'package:ryokou/ui/sections/grid_tour/grid_tour.dart';

class ResultSearch extends StatefulWidget {
  ResultSearch({super.key, required this.lsTour, required this.textSearch});
  List<Tour> lsTour;
  String textSearch;
  @override
  State<StatefulWidget> createState() => _ResultSearchState();
}

class _ResultSearchState extends State<ResultSearch> {
  String curProvince = '';
  RangeValues curRangeValue = const RangeValues(0, 20000000);
  final int step = 100000;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    context.pop();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_outlined,
                    color: AppColors.borderDeal_Home,
                    size: 20,
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
                    Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GridTour(tours: widget.lsTour)),
                    const SizedBox(height: 15),
                  ],
                ),
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
                curProvince = value!;
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
          max: 20000000,
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
              onPressed: () {
                context.push(
                    '/searchTour/${widget.textSearch}/${curRangeValue.start.toInt().toString()}/${curRangeValue.end.toInt().toString()}/${curProvince.isEmpty ? 'null' : curProvince}');
              },
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
