import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/entity/tour.dart';
import 'package:ryokou/themes/colors_theme.dart';

class ItemTour extends StatefulWidget {
  final Tour tour;

  const ItemTour({super.key, required this.tour});

  @override
  State<ItemTour> createState() => _ItemTourState();
}

class _ItemTourState extends State<ItemTour> {
  @override
  Widget build(BuildContext context) {
    bool isFavourite = DataController().getUser == null
        ? false
        : DataController().getUser!.containsFavoriteTour(widget.tour);
    return SizedBox(
      height: 255,
      width: 140,
      // padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: () {
          context.push('/tourDetail/${widget.tour.id}');
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.primaryColor, width: 2),
                  ),
                ),
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    SizedBox(
                      height: 115,
                      child: Image.network(
                        widget.tour.lsFile[0],
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/image/appbar_ryokou.png');
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(15))),
                      child: const Text(
                        '20%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor, width: 1),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.tour.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  const Row(
                    children: [
                      Text(
                        '4.2/5',
                        style: TextStyle(
                          letterSpacing: 1.2,
                          fontSize: 13,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        '(198)',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    widget.tour.cost,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '899.000đ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () {
                          if (DataController().getUser != null) {
                            setState(() {
                              isFavourite = !isFavourite;
                            });
                            isFavourite
                                ? DataController()
                                    .getUser!
                                    .addFavoriteTour(widget.tour)
                                : DataController()
                                    .getUser!
                                    .removeFavoriteTour(widget.tour);
                          }
                        },
                        child: Icon(
                          isFavourite
                              ? Icons.favorite_rounded
                              : Icons.favorite_outline,
                          color: Colors.amber,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
