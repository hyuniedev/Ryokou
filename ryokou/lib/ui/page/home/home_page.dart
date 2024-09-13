import 'package:flutter/material.dart';
import 'package:ryokou/entity/tour.dart';
import 'package:ryokou/ui/page/home/enumTag/e_month.dart';
import 'package:ryokou/ui/page/home/enumTag/e_province.dart';
import 'package:ryokou/ui/page/home/flash_sale.dart';
import 'package:ryokou/ui/page/home/sugget_section.dart';
import 'package:ryokou/ui/sections/appbar/child_app_bar_main_pages.dart';
import 'package:ryokou/ui/sections/appbar/top_app_bar.dart';
import 'package:ryokou/ui/sections/slider/slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              getAppBar(
                context,
                childAppBarMainPages(),
                isHome: true,
              ),
              SliderBar(numSlider: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const FlashSale(),
                    SuggetSection(
                      lsDataTour: [
                        Tour(
                            titleTour: 'Du lich suoi nuoc nong',
                            descriptionTour: 'descriptionTour',
                            duration: 3,
                            location: 'Nhat Ban'),
                        Tour(
                            titleTour: 'Du lich suoi nuoc nong',
                            descriptionTour: 'descriptionTour',
                            duration: 3,
                            location: 'Nhat Ban'),
                        Tour(
                            titleTour: 'Du lich suoi nuoc nong',
                            descriptionTour: 'descriptionTour',
                            duration: 3,
                            location: 'Nhat Ban')
                      ],
                      lsDivide: const [
                        EMonth.Thang8,
                        EMonth.Thang9,
                        EMonth.Thang10,
                        EMonth.Thang11,
                        EMonth.Thang12,
                      ],
                      title: "Get go!",
                    ),
                    SuggetSection(
                      lsDataTour: [
                        Tour(
                            titleTour: 'Du lich suoi nuoc nong',
                            descriptionTour: 'descriptionTour',
                            duration: 3,
                            location: 'Nhat Ban'),
                        Tour(
                            titleTour: 'Du lich suoi nuoc nong',
                            descriptionTour: 'descriptionTour',
                            duration: 3,
                            location: 'Nhat Ban'),
                        Tour(
                            titleTour: 'Du lich suoi nuoc nong',
                            descriptionTour: 'descriptionTour',
                            duration: 3,
                            location: 'Nhat Ban')
                      ],
                      title: 'Mua le hoi',
                      lsDivide: const [
                        EProvince.Chiba,
                        EProvince.Akita,
                        EProvince.Kanagawa,
                        EProvince.Tokyo,
                        EProvince.Mie,
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
