import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ryokou/controller/IDataRefresh.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/controller/controller_page.dart';
import 'package:ryokou/entity/tour_booked.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/sections/appbar/child_app_bar_main_pages.dart';
import 'package:ryokou/ui/sections/appbar/top_app_bar.dart';
import 'package:ryokou/ui/sections/grid_tour/grid_tour.dart';
import 'package:ryokou/ui/sections/grid_tour/grid_tour_booked.dart';

class MyTourPage extends StatefulWidget implements IDataRefresh {
  MyTourPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyTourPageState();

  @override
  Function? funLoadData;

  @override
  void RefreshPage() {
    if (funLoadData != null) {
      funLoadData!();
    }
  }
}

class _MyTourPageState extends State<MyTourPage> {
  int indexSection = 0;
  void changeSectionExpanded(int newIndex) {
    setState(() {
      indexSection == newIndex ? indexSection = 0 : indexSection = newIndex;
    });
  }

  List<TourBooked> _lsTourBought = [];
  List<TourBooked> _lsTourGone = [];
  TourBooked? _tourGoing;
  void loadDataMyTour() {
    DataController().divisionOfTour();
    setState(() {
      _tourGoing = DataController().tourGoing;
      _lsTourBought = DataController().lsTourBought;
      _lsTourGone = DataController().lsTourGone;
    });
  }

  @override
  void initState() {
    super.initState();
    MyPageController().CurrentPage = widget;
    widget.funLoadData = loadDataMyTour;
    loadDataMyTour();
  }

  @override
  void dispose() {
    MyPageController().CurrentPage = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            getAppBar(context, childAppBarMainPages()),
            DataController().getUser == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/image/bill_cross.png',
                        scale: 0.85,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Đăng nhập hoặc Đăng ký để quản lý đặt chỗ của bạn dễ dàng. Sử dụng tài khoản đã đăng ký của bạn để đăng nhập vào ứng dụng và quản lý tour của bạn.',
                          style: TextStyle(
                              fontSize: 16, color: AppColors.primaryColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      DataController().getUser == null
                          ? Container(
                              color: Colors.transparent,
                              height: 100,
                              padding: const EdgeInsets.symmetric(vertical: 25),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: () {
                                        context.go('/login');
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppColors.primaryColor)),
                                        child: const Center(
                                          child: Text(
                                            'Đăng nhập',
                                            style: TextStyle(
                                                fontSize: 21,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.primaryColor),
                                          ),
                                        ),
                                      )),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    onTap: () {
                                      context.push('/register');
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.primaryColor,
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Đăng ký',
                                          style: TextStyle(
                                              fontSize: 21,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        sectionGroupTour(
                            'Tour đang diễn ra',
                            _tourGoing == null
                                ? []
                                : List.generate(
                                    1,
                                    (index) => _tourGoing!,
                                  ),
                            indexSection == 1, () {
                          changeSectionExpanded(1);
                        }),
                        const SizedBox(height: 15),
                        sectionGroupTour(
                            'Tour đã đặt', _lsTourBought, indexSection == 2,
                            () {
                          changeSectionExpanded(2);
                        }),
                        const SizedBox(height: 15),
                        sectionGroupTour('Tour đã hoàn thành', _lsTourGone,
                            indexSection == 3, () {
                          changeSectionExpanded(3);
                        }),
                        const SizedBox(height: 20),
                        const Divider(height: 3, thickness: 3),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Đề xuất cho bạn',
                              style: TextStyle(
                                fontSize: 24,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            GridTour(tours: DataController().lsTour),
                          ],
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget sectionGroupTour(String title, List<TourBooked> lsTour,
      bool isExpanded, Function()? onTap) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.list_sharp,
                  color: AppColors.primaryColor,
                  size: 31,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  isExpanded ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                  color: AppColors.primaryColor,
                  size: 31,
                ),
              ],
            ),
          ),
        ),
        isExpanded
            ? Container(
                padding: const EdgeInsets.only(top: 10),
                child: GridTourBooked(tours: lsTour),
              )
            : Container()
      ],
    );
  }
}
