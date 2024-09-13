import 'package:flutter/material.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/entity/tour.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/item/itemTag.dart';
import 'package:ryokou/ui/item/itemTour.dart';
import 'package:ryokou/ui/page/home/enumTag/ISugget.dart';

class SuggetSection extends StatefulWidget {
  final String title;
  final List<ISugget> lsDivide;
  final List<Tour> lsDataTour;
  const SuggetSection({
    super.key,
    required this.title,
    required this.lsDivide,
    required this.lsDataTour,
  });

  @override
  State<SuggetSection> createState() => _SuggetSectionState();
}

class _SuggetSectionState extends State<SuggetSection> {
  int indexDivided = 0;
  void _changeTag(ISugget suggetSelected) {
    setState(() {
      indexDivided = widget.lsDivide.indexOf(suggetSelected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            widget.title,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 37,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              widget.lsDivide.length,
              (index) {
                return ItemTag(
                  titleTag: widget.lsDivide[index],
                  isSelected: indexDivided == index,
                  changedTag: _changeTag,
                );
              },
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              widget.lsDataTour.length,
              (index) {
                return ItemTour(tour: DataController().tour);
              },
            ),
          ),
        ),
      ],
    );
  }
}
