import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/entity/company.dart';
import 'package:ryokou/entity/rate.dart';
import 'package:ryokou/entity/tour.dart';
import 'package:ryokou/entity/user.dart';
import 'package:ryokou/firebase/data_firebase.dart';
import 'package:ryokou/themes/colors_theme.dart';

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
  String _companyName = '';
  bool moRong = false;
  double _rateStar = 0;
  String _levelRateString = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCompany();
    _beginDate = widget.tour.start;
    _rateStar = widget.tour.getRateStar();
    print('RATE STAR: $_rateStar');
    if (_rateStar == 0) {
      _levelRateString = 'Chưa có đánh giá nào.';
    } else if (_rateStar < 1) {
      _levelRateString = 'Tệ';
    } else if (_rateStar < 2) {
      _levelRateString = 'Xấu';
    } else if (_rateStar < 3) {
      _levelRateString = 'Khá';
    } else if (_rateStar < 4) {
      _levelRateString = 'Tốt';
    } else {
      _levelRateString = 'Tuyệt vời';
    }
  }

  void loadCompany() async {
    Company? com = await DataFirebase().getCompany(widget.tour.company);
    setState(() {
      _companyName = com?.name! ?? 'Ryokou Company';
    });
  }

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
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () {
                  context.pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: AppColors.borderDeal_Home,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                      widget.tour.lsFile[0],
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.25,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/image/appbar_ryokou.png');
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
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
                          RateAndReview(context),
                          const SizedBox(height: 15),
                          const Divider(height: 3, thickness: 3),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Những điều khoản và dịch vụ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '\t\t${widget.tour.kisoku}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Thêm thông tin',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                themThongTin(context, 'Thông tin thêm'),
                                const SizedBox(height: 15),
                                themThongTin(
                                    context, ' Liên hệ nhà cung cấp dịch vụ'),
                                const SizedBox(height: 100),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(10))),
                      child: const Text(
                        'Một chuyến đi thú vị trong tầm tay bạn',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const Divider(
                      height: 2,
                      color: AppColors.primaryColor,
                      thickness: 2,
                    ),
                    Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '899.000đ',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.borderDeal_Home,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                backgroundColor: AppColors.primaryColor,
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Chọn',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
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

  InkWell themThongTin(BuildContext context, String title) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(
              Icons.arrow_right_rounded,
              size: 35,
            )
          ],
        ),
      ),
    );
  }

  SizedBox RateAndReview(BuildContext context) {
    return SizedBox(
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
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    size: 70,
                    color: AppColors.primaryColor,
                  ),
                  Text(
                    widget.tour.getRateStar().toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(width: 6),
              Text(
                _levelRateString,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Column(
            children: widget.tour.lsRate.map((rate) {
              return FutureBuilder<Column>(
                future: itemRate(context, rate), // Gọi hàm bất đồng bộ
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(); // Hiển thị khi đang tải
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return snapshot.data!; // Hiển thị khi có dữ liệu
                  } else {
                    return const Text('No data available');
                  }
                },
              );
            }).toList(),
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
          DataController().getUser == null
              ? Container()
              : Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.account_circle,
                        size: 55,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 20),
                                Row(
                                  children: List.generate(
                                    5,
                                    (index) {
                                      return InkWell(
                                        customBorder: const StarBorder(),
                                        onTap: () {
                                          setState(() {
                                            indexRateTour = index;
                                          });
                                        },
                                        child: Icon(
                                          indexRateTour < index
                                              ? Icons.star_outline_rounded
                                              : Icons.star_rounded,
                                          color: AppColors.primaryColor,
                                          size: 28,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              maxLines: 1,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(fontSize: 21),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.send,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.primaryColor,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.primaryColor,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  Future<Column> itemRate(BuildContext context, Rate rate) async {
    User userRate = await DataFirebase().getUser(rate.user);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 3, thickness: 1),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(
              Icons.account_circle,
              size: 30,
              color: AppColors.primaryColor,
            ),
            const SizedBox(width: 10),
            Text(
              userRate.fullName ?? 'Tên người dùng',
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
            Text(
              '${rate.star}/5',
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 7),
        Text(
          rate.comment,
          style: const TextStyle(
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
                      widget.tour.pointo,
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
                          firstDate: widget.tour.start,
                          lastDate: DateTime(2100),
                          onDateChanged: (value) {
                            setState(() {
                              _beginDate = value;
                              _endDate = _beginDate
                                  .add(Duration(days: widget.tour.durations));
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
    return Row(
      children: [
        Text(
          '$_rateStar/5',
          style: const TextStyle(
            letterSpacing: 1.2,
            fontSize: 16,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          '( từ ${widget.tour.lsRate.length} đánh giá)',
          style: const TextStyle(
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
        Expanded(
          child: Text(
            tour.name,
            style: const TextStyle(
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
        Text(
          _companyName.isNotEmpty ? _companyName : 'Loading...',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  Widget tongQuan() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tổng quan',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.watch_later_outlined,
                color: AppColors.primaryColor,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Thời gian tour',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text('${widget.tour.durations.toString()} ngày'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.tour_outlined,
                color: AppColors.primaryColor,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tập họp tại địa điểm cụ thể',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(widget.tour.gatheringPlace),
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
        Text(
          widget.tour.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            color: AppColors.borderDeal_Home,
          ),
        ),
      ],
    );
  }
}
