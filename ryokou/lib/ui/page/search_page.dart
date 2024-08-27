import 'package:flutter/material.dart';
import 'package:ryokou/themes/colors_theme.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
      preferredSize: const Size.fromHeight(100.0), // Tăng chiều cao AppBar
      child: AppBar(
        elevation: 1,
        surfaceTintColor: ColorsTheme.primaryColor,
        centerTitle: true,
        backgroundColor: ColorsTheme.primaryColor,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: 50, // Chiều cao của TextField
            child: Center(
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
