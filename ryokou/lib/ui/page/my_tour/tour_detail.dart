import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/entity/tour.dart';
import 'package:ryokou/themes/colors_theme.dart';

class TourDetail extends StatefulWidget {
  final Tour tour;
  const TourDetail({super.key, required this.tour});
  @override
  State<TourDetail> createState() => _TourDetailState();
}

class _TourDetailState extends State<TourDetail> {
  @override
  Widget build(BuildContext context) {
    bool isFavourite = DataController().getUser == null
        ? false
        : DataController().getUser!.containsFavoriteTour(widget.tour);
    Tour tour = widget.tour;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(alignment: Alignment.topCenter, children: [
              Image.network(
                'https://i.pinimg.com/564x/c0/84/96/c084965248640ae5fd1eceb00044a0c7.jpg',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_outlined,
                      color: AppColors.borderDeal_Home,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          color: AppColors.borderDeal_Home,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.comment,
                          color: AppColors.borderDeal_Home,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ]),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Column(
                children: [
                  titleTour(isFavourite, tour),
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor,
                        ),
                        height: 26,
                        width: 26,
                        child: const Icon(
                          Icons.business,
                          color: AppColors.borderDeal_Home,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'Sakura Company',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  rateTour(),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  Row rateTour() {
    return const Row(
      children: [
        Text(
          '4.2/5',
          style: TextStyle(
            letterSpacing: 1.2,
            fontSize: 16,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 6),
        Text(
          '( từ 198 đánh giá)',
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Row titleTour(bool isFavourite, Tour tour) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: Text(
            'Ngắm hoa anh đào tại Tokyo',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          onPressed: () {
            if (DataController().getUser != null) {
              setState(() {
                isFavourite = !isFavourite;
              });
              isFavourite
                  ? DataController().getUser!.addFavoriteTour(tour)
                  : DataController().getUser!.removeFavoriteTour(tour);
            }
          },
          icon: Icon(
            isFavourite ? Icons.favorite_rounded : Icons.favorite_outline,
            color: Colors.amber,
            size: 32,
          ),
        )
      ],
    );
  }
}
