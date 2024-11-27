import 'package:flutter/material.dart';
import 'package:ryokou/entity/tour.dart';
import 'package:ryokou/ui/item/itemTour.dart';

class GridTour extends StatelessWidget {
  const GridTour({
    super.key,
    required this.tours,
  });

  final List<Tour> tours;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 25,
        crossAxisSpacing: 15,
        mainAxisExtent: 255,
      ),
      itemCount: tours.length,
      itemBuilder: (context, index) => ItemTour(tour: tours[index]),
    );
  }
}
