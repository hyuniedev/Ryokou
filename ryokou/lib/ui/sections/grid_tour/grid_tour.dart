import 'package:flutter/material.dart';
import 'package:ryokou/entity/tour.dart';
import 'package:ryokou/ui/item/itemTour.dart';

class GridTour extends StatefulWidget {
  const GridTour({
    super.key,
    required this.tours,
  });

  final List<Tour> tours;

  @override
  State<GridTour> createState() => _GridTourState();
}

class _GridTourState extends State<GridTour> {
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
      itemCount: widget.tours.length,
      itemBuilder: (context, index) => ItemTour(
          key: ValueKey(widget.tours[index].id), tour: widget.tours[index]),
    );
  }
}
