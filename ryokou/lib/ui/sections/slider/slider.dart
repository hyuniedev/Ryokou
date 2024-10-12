import 'package:flutter/material.dart';

class SliderBar extends StatefulWidget {
  const SliderBar({super.key});

  @override
  State<SliderBar> createState() => _SliderBarState();
}

class _SliderBarState extends State<SliderBar> {
  int _curPage = 0;
  late PageController _pageController;

  final List<String> imagePaths = [
    'assets/image/slide1.png',
    'assets/image/slide2.png',
    'assets/image/slide3.png',
    'assets/image/slide4.png',
    'assets/image/slide5.png',
    'assets/image/slide6.png',
  ];

  @override
  void initState() {
    super.initState();
    _curPage = imagePaths.length ~/ 2;
    _pageController = PageController(
      initialPage: _curPage,
      viewportFraction: 0.8,
    );
  }

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
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Transform.scale(
            scaleY: _curPage == index ? 1.0 : 0.85,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
