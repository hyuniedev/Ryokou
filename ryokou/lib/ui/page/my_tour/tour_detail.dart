import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/entity/tour.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/sections/appbar/top_app_bar.dart';

class TourDetail extends StatefulWidget {
  final Tour tour;

  const TourDetail({super.key, required this.tour});

  @override
  State<TourDetail> createState() => _TourDetailState();
}

class _TourDetailState extends State<TourDetail> {
  int indexRateTour = -1;
  DateTime _beginDate = DateTime.now();
  DateTime? _endDate;
  bool moRong = false;
  @override
  Widget build(BuildContext context) {
    bool isFavourite = DataController().getUser == null
        ? false
        : DataController().getUser!.containsFavoriteTour(widget.tour);
    Tour tour = widget.tour;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: topIcon(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                'https://i.pinimg.com/564x/c0/84/96/c084965248640ae5fd1eceb00044a0c7.jpg',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/image/appbar_ryokou.png');
                },
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Column(
                  children: [
                    titleTour(isFavourite, tour),
                    rateTour(),
                    const SizedBox(height: 5),
                    factoryTour(),
                    const SizedBox(height: 20),
                    tongQuan(),
                    const SizedBox(height: 15),
                    const Divider(height: 3, thickness: 3),
                    const SizedBox(height: 15),
                    chooseDay(context),
                    (_beginDate.difference(DateTime.now()) <
                            const Duration(seconds: 10))
                        ? Container()
                        : displayDay_Begin_End(context),
                    const SizedBox(height: 15),
                    showScheduleDetail(context),
                    const SizedBox(height: 20),
                    const Divider(height: 3, thickness: 3),
                    diemNoiBat(context),
                    const SizedBox(height: 15),
                    const Divider(height: 3, thickness: 3),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Rating & review',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 70,
                                    color: AppColors.primaryColor,
                                  ),
                                  Text(
                                    '4.2',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(width: 6),
                              Text(
                                'Tuyệt vời ',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Column(
                            children: [itemRate(context), itemRate(context)],
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                'Xem them',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Icon(
                                Icons.account_circle,
                                size: 35,
                                color: AppColors.primaryColor,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                      border: Border.all(
                                          color: AppColors.primaryColor,
                                          width: 2),
                                    ),
                                    child: Row(
                                      children: List.generate(
                                        5,
                                        (index) {
                                          return IconButton(
                                            onPressed: () {
                                              setState(() {
                                                indexRateTour = index;
                                              });
                                            },
                                            icon: Icon(
                                              index <= indexRateTour
                                                  ? Icons.star_rate
                                                  : Icons.star_rate_outlined,
                                              color: AppColors.primaryColor,
                                              size: 27,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column itemRate(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 3, thickness: 1),
        const SizedBox(height: 10),
        const Row(
          children: [
            Icon(
              Icons.account_circle,
              size: 30,
              color: AppColors.primaryColor,
            ),
            SizedBox(width: 10),
            Text(
              'Ten nguoi dung',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
            const Text(
              '5.0/5',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 7),
        const Text(
          'Tour nhu cut! Lua dao!',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Container diemNoiBat(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Điểm nổi bật',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              AnimatedSize(
                duration: const Duration(milliseconds: 200),
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 20),
                    child: Text(
                      widget.tour.diemNoiBat,
                      maxLines: moRong ? null : 5,
                      style: const TextStyle(fontSize: 16),
                    )),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    moRong = !moRong;
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.grey.withOpacity(0),
                        Colors.grey.withOpacity(0.2),
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        moRong ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                        size: 25,
                        color: AppColors.primaryColor,
                      ),
                      Text(
                        moRong ? 'Thu gọn ' : 'Mở rộng',
                        style: const TextStyle(
                            color: AppColors.primaryColor, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row rowNoiBat(String txt) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 10,
          width: 10,
          margin: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Text(
            txt,
            style: const TextStyle(
              fontSize: 16,
            ),
            maxLines: 100,
          ),
        )
      ],
    );
  }

  SizedBox displayDay_Begin_End(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Ngày bắt đầu:           ${_beginDate.day}/${_beginDate.month}/${_beginDate.year}',
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            'Ngày kết thúc:          ${_endDate!.day}/${_endDate!.month}/${_endDate!.year}',
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Row chooseDay(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Chọn ngày bắt đầu đi',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CalendarDatePicker(
                          initialDate: _beginDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                          onDateChanged: (value) {
                            setState(() {
                              _beginDate = value;
                              _endDate = _beginDate
                                  .add(Duration(days: widget.tour.duration));
                            });
                          },
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              context.pop(context);
                            },
                            style: const ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    AppColors.primaryColor)),
                            child: const Text(
                              'OK',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.fillDeal_Home),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          icon: const Icon(
            Icons.date_range,
            color: AppColors.primaryColor,
            size: 30,
          ),
        ),
      ],
    );
  }

  Row showScheduleDetail(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Lịch trình tour',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.7,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  color: Colors.white,
                  child: const SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: AppColors.primaryColor,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: const Text(
            'Xem lịch trình chi tiết',
            style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: AppColors.borderDeal_Home,
                color: AppColors.borderDeal_Home),
          ),
        ),
      ],
    );
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

  Row factoryTour() {
    return Row(
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
    );
  }

  Widget tongQuan() {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tổng quan',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.watch_later_outlined,
                color: AppColors.primaryColor,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thời gian tour',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text('1 ngày'),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.tour_outlined,
                color: AppColors.primaryColor,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tập họp tại địa điểm cụ thể',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text('Không có dịch vụ đưa đón miễn phí'),
                  Text('Tập họp tại sân bay quốc tế Nội Bài'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget topIcon() {
    return Row(
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
    );
  }
}
