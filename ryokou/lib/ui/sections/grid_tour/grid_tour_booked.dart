import 'package:flutter/material.dart';
import 'package:ryokou/entity/tour_booked.dart';
import 'package:ryokou/ui/item/itemTourBooked.dart';

class GridTourBooked extends StatelessWidget {
  const GridTourBooked({
    super.key,
    required this.tours,
  });

  final List<TourBooked> tours;

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
      itemBuilder: (context, index) => ItemTourBooked(tour: tours[index]),
    );
  }
}
