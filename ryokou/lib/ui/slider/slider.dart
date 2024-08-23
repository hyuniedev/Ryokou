import 'package:flutter/material.dart';

class SliderBar extends StatefulWidget {
  final int numSlider;
  const SliderBar({super.key, required this.numSlider});
  @override
  State<StatefulWidget> createState() => _Slider();
}

class _Slider extends State<SliderBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PageView(
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
