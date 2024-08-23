import 'package:flutter/material.dart';
import 'package:ryokou/themes/colors_Theme.dart';
import 'package:ryokou/ui/slider/slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        surfaceTintColor: ColorsTheme.primaryColor,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_checkout,
                color: Colors.white,
              ))
        ],
        toolbarHeight: 50,
        backgroundColor: ColorsTheme.primaryColor,
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SliderBar(numSlider: 3)),
    );
  }
}
