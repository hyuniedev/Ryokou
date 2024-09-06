import 'package:flutter/material.dart';
import 'package:ryokou/entity/tour.dart';

class SuggetSection extends StatefulWidget {
  String title;
  List<String> lsDivide;
  List<Tour> lsDataTour;
  SuggetSection({
    super.key,
    required this.title,
    required this.lsDivide,
    required this.lsDataTour,
  });

  @override
  State<SuggetSection> createState() => _SuggetSectionState();
}

class _SuggetSectionState extends State<SuggetSection> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SingleChildScrollView(),
        SingleChildScrollView(),
      ],
    );
  }
}
