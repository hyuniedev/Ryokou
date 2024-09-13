import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/item/itemTour.dart';
import 'package:ryokou/ui/page/home/deal_hot.dart';

class FlashSale extends StatefulWidget {
  const FlashSale({super.key});

  @override
  State<FlashSale> createState() => _FlashSaleState();
}

class _FlashSaleState extends State<FlashSale> {
  late Timer _timer;
  late DateTime _curTime;

  @override
  void initState() {
    super.initState();
    _curTime = DateTime.now();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _curTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime timeEnd = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        _curTime.hour % 2 == 0 ? _curTime.hour + 2 : _curTime.hour + 1,
        00,
        00);
    Duration diffTime = timeEnd.difference(_curTime);
    return Column(
      children: [
        dealHotTime(context,
            _curTime.hour % 2 == 0 ? _curTime.hour : _curTime.hour - 1),
        Row(
          children: [
            boxTime(diffTime.inHours.toString()),
            haiCham(),
            boxTime((diffTime.inMinutes % 60).toString()),
            haiCham(),
            boxTime((diffTime.inSeconds % 60).toString()),
          ],
        ),
        const SizedBox(height: 25),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ItemTour(tour: DataController().tour),
              ItemTour(tour: DataController().tour),
              ItemTour(tour: DataController().tour),
              ItemTour(tour: DataController().tour),
              ItemTour(tour: DataController().tour),
              ItemTour(tour: DataController().tour),
            ],
          ),
        ),
        const SizedBox(height: 15),
        InkWell(
          borderRadius: BorderRadius.circular(70),
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: const BorderRadius.all(Radius.circular(70))),
            child: const Text(
              'Xem thêm',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        )
      ],
    );
  }

  Container boxTime(String time) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: AppColors.fillDeal_Home,
      ),
      child: Center(
          child: Text(
        time.padLeft(2, '0'),
        style: const TextStyle(
          color: Colors.black26,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }

  Widget haiCham() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        ':',
        style: TextStyle(
          color: AppColors.fillDeal_Home,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
