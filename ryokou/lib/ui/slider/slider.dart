import 'dart:async';

import 'package:flutter/material.dart';

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
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_curPage < widget.numSlider - 1) {
        _curPage++;
      } else {
        _curPage = 0;
      }
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
    return SizedBox(
      height: 150,
      child: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          _curPage = value;
        },
        scrollDirection: Axis.horizontal,
        children: List.generate(widget.numSlider,
            (index) => ItemSlider(index, MediaQuery.of(context).size.width)),
      ),
    );
  }
}

Widget ItemSlider(int index, double width) {
  return Container(
    width: width - 40,
    margin: const EdgeInsets.symmetric(horizontal: 20),
    decoration: const BoxDecoration(color: Colors.amber),
    child: Text('Slider $index'),
  );
}
