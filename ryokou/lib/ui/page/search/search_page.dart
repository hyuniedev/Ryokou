import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/item/generalDropDown.dart';
import 'package:ryokou/ui/page/home/enumTag/e_province.dart';
import 'package:ryokou/ui/sections/appbar/top_app_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _tecSearch = TextEditingController();
  final FocusNode _focusNodeSearch = FocusNode();

  String curProvince = '';
  RangeValues curRangeValue = const RangeValues(0, 20000000);
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
                    onPressed: () {
                      context.push(
                          '/searchTour/${_tecSearch.text.isEmpty ? 'null' : _tecSearch.text}/${curRangeValue.start.toInt().toString()}/${curRangeValue.end.toInt().toString()}/${curProvince.isEmpty ? 'null' : curProvince}');
                    },
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    boxSuggest(context, 'Địa điểm hot'),
                    boxSuggest(context, 'Được đánh giá cao'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    boxSuggest(context, 'Mới nhất của tháng'),
                    boxSuggest(context, 'Tour ưu đãi sâu'),
                  ],
                ),
                filterTour(),
              ],
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
                    '/searchTour/${_tecSearch.text.isEmpty ? 'null' : _tecSearch.text}/${curRangeValue.start.toInt().toString()}/${curRangeValue.end.toInt().toString()}/${curProvince.isEmpty ? 'null' : curProvince}');
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

  Widget boxSuggest(BuildContext context, String text) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width / 2.3,
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryColor,
              width: 1.5,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
