import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/entity/tour_booked.dart';
import 'package:ryokou/themes/colors_theme.dart';

class ItemTourBooked extends StatefulWidget {
  final TourBooked tour;

  const ItemTourBooked({super.key, required this.tour});

  @override
  State<ItemTourBooked> createState() => _ItemTourBookedState();
}

class _ItemTourBookedState extends State<ItemTourBooked> {
  bool isFavourite = false;

  @override
  void initState() {
    super.initState();
    isFavourite = DataController().getUser == null
        ? false
        : DataController().getUser!.containsFavoriteTour(widget.tour);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 255,
      width: 150,
      // padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: () {
          // context.push('/tourDetail/${widget.tour.id}');
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
                      child: Text(
                        '${widget.tour.sale}%',
                        style: const TextStyle(
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
                  const SizedBox(height: 2),
                  Text(
                      'Ngày đi: ${DateFormat('dd/MM/yyyy').format(widget.tour.start)}'),
                  Text('Số vé: ${widget.tour.numPerson} vé'),
                  const SizedBox(height: 2),
                  Text(
                    '${widget.tour.getPriceTour(soLuong: widget.tour.numPerson)}đ',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
