import 'package:flutter/material.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/sections/appbar/top_app_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _tecSearch = TextEditingController();
  final FocusNode _focusNodeSearch = FocusNode();
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
                  hintText: 'Search...',
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
            height: 300,
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
              ],
            ),
          ),
        ),
      ),
    );
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
