import 'package:flutter/material.dart';

class SliderBar extends StatefulWidget {
  final int numSlider;
  SliderBar({required this.numSlider});
  @override
  State<StatefulWidget> createState() => _Slider();
}

class _Slider extends State<SliderBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(widget.numSlider,
            (index) => ItemSlider(index, MediaQuery.of(context).size.width)),
      ),
    );
  }
}

Widget ItemSlider(int index, double width) {
  return Container(
    width: width / 2,
    margin: EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(color: Colors.amber),
    child: Text('Slider $index'),
  );
}
