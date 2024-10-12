import 'package:flutter/material.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/item/itemTag.dart';
import 'package:ryokou/ui/item/itemTour.dart';
import 'package:ryokou/ui/page/home/enumTag/ISugget.dart';

class SuggetSection extends StatefulWidget {
  final String title;
  final List<ISugget> lsDivide;
  const SuggetSection({
    super.key,
    required this.title,
    required this.lsDivide,
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
        FutureBuilder(
          future: DataController().getListTour(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: const Center(
                  child: Text(
                    'Has Error on Loading Data, Pls Reload app',
                    style: TextStyle(fontSize: 21),
                  ),
                ),
              );
            } else if (!snapshot.hasData) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: const Center(
                  child: Text(
                    'No Data, Try again!',
                    style: TextStyle(fontSize: 21),
                  ),
                ),
              );
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: DataController()
                      .lsTour
                      .map((item) => Row(
                            children: [
                              item == DataController().lsTour.first
                                  ? Container()
                                  : const SizedBox(width: 20),
                              ItemTour(tour: item)
                            ],
                          ))
                      .toList(),
                ),
              );
            }
          },
        )
      ],
    );
  }
}
