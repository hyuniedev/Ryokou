import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ryokou/themes/colors_theme.dart';

class SliderBar extends StatefulWidget {
  final int numSlider;
  const SliderBar({super.key, required this.numSlider});
  @override
  State<StatefulWidget> createState() => _Slider();
}

class _Slider extends State<SliderBar> {
  late PageController _pageController;
  late Timer _timer;
  int _curPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _curPage);
    startTime();
  }

  void startTime() {
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      _curPage++;
      _pageController.animateToPage(
        _curPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 150,
      child: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          _curPage = value;
          _timer.cancel();
          startTime();
        },
        scrollDirection: Axis.horizontal,
        children: List.generate(widget.numSlider, (index) => itemSlider(index)),
      ),
    );
  }
}

Widget itemSlider(int index) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(10))),
    child: Center(child: Text('Slider $index')),
  );
}
