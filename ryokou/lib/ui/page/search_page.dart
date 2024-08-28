import 'package:flutter/material.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/appbar/top_app_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: 50.0,
            child: TextField(
              style: TextStyle(
                  fontSize: 20,
                  color: ColorsTheme.primaryColor,
                  decoration: TextDecoration.none),
              decoration: InputDecoration(
                hintText: 'Search...',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 30,
                    color: ColorsTheme.primaryColor,
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
    );
  }
}
