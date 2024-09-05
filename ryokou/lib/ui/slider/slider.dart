import 'package:flutter/material.dart';
import 'package:ryokou/themes/colors_theme.dart';

class SliderBar extends StatefulWidget {
  SliderBar({super.key, required this.numSlider});
  int numSlider;

  @override
  State<SliderBar> createState() => _SliderBarState();
}

class _SliderBarState extends State<SliderBar> {
  int _curPage = 0;

  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.75);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              _curPage = value;
            });
          },
          itemCount: widget.numSlider,
          itemBuilder: (context, index) {
            return Transform.scale(
              scaleY: _curPage == index ? 1.0 : 0.85,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text('Slider $index'),
                ),
              ),
            );
          },
        ));
  }
}
